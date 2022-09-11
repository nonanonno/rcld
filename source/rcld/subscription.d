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

@("Check if the topic created by the subscription can be found")
unittest
{
    import rcld;

    import std.algorithm : canFind;
    import std.format : format;
    import std.process : executeShell, spawnShell, wait;

    import core.thread;

    import test_helper.utils;
    import test_msgs.msg : BasicTypes;

    auto ns = uniqueString();

    auto context = new Context();
    auto node = new Node("listener", ns, context);
    auto sub = new Subscription!BasicTypes(node, "basic_types");

    bool found = false;
    foreach (_; 0 .. 10)
    {
        Thread.sleep(100.msecs);
        auto ret = executeShell("ros2 topic list");
        assert(ret.status == 0);
        found = ret.output.canFind(ns ~ "/basic_types");
        if (found)
        {
            break;
        }
    }
    assert(found);
    // ToDo: should use `-1` option.
    // `-1` waits for at least 1 subscriptino found (from galactic)
    auto ros2TopicPub = spawnShell(format(
            `ros2 topic pub /%s/basic_types test_msgs/msg/BasicTypes '{int32_value: 123}' -r 10 -t 10 > /dev/null`, ns
    ));
    bool taken = false;
    BasicTypes msg;
    foreach (_; 0 .. 10)
    {
        Thread.sleep(100.msecs);
        taken = sub.take(msg);
        if (taken)
        {
            break;
        }
    }
    assert(taken);
    assert(msg.int32_value == 123);
    assert(wait(ros2TopicPub) == 0);

}
