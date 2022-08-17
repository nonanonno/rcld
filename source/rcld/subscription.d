module rcld.subscription;

import std.string;

import rcl;

import rcld.node;
import rcld.util;

interface BaseSubscription
{
    void terminate(Node node);
}

class Subscription(T) : BaseSubscription
{
    this(Node node, in string name)
    {
        _handle = rcl_get_zero_initialized_subscription();
        auto options = rcl_subscription_get_default_options();
        auto typesupport = T.getTypesupport();
        safeCall(rcl_subscription_init(&_handle, &node._handle, typesupport, name.toStringz, &options));
        node._subscriptions ~= this;
    }

    override void terminate(Node node)
    {
        if (isValid())
        {
            safeCall(rcl_subscription_fini(&_handle, &node._handle));
            _handle.impl = null;
        }
    }

    bool take(out T msg)
    {
        auto cMsg = T.createC();
        assert(cMsg);
        scope (exit)
            T.destroyC(cMsg);
        auto messageInfo = rmw_message_info_t();
        messageInfo.from_intra_process = false;
        const ret = rcl_take(&_handle, cast(void*) cMsg, &messageInfo, null);
        if (ret == RCL_RET_OK)
        {
            T.convert(*cMsg, msg);
        }
        return ret == RCL_RET_OK;
    }

    bool isValid() const
    {
        return _handle.impl !is null;
    }

package:
    rcl_subscription_t _handle;
}
