module rcld.service;

import std.string;

import rcl;

import rcld.node;
import rcld.util;

interface BaseService
{
    void terminate(Node node);
}

class Service(T) : BaseService
{
    this(Node node, in string name)
    {
        _handle = rcl_get_zero_initialized_service();
        auto options = rcl_service_get_default_options();
        auto typesupport = T.getTypesupport();
        safeCall(rcl_service_init(&_handle, &node._handle, typesupport, name.toStringz, &options));
        node._services ~= this;
    }

    override void terminate(Node node)
    {
        if (isValid())
        {
            safeCall(rcl_service_fini(&_handle, &node._handle));
            _handle.impl = null;
        }
    }

    bool isValid() const
    {
        return _handle.impl !is null;
    }

    bool take(out T.Request request, out rmw_request_id_t requestId)
    {
        auto cMsg = T.Request.createC();
        assert(cMsg);
        scope (exit)
            T.Request.destroyC(cMsg);
        auto ret = rcl_take_request(&_handle, &requestId, cast(void*) cMsg);
        if (ret == RCL_RET_OK)
        {
            T.Request.convert(*cMsg, request);
        }
        return ret == RCL_RET_OK;
    }

    void sendResponse(in T.Response response, ref rmw_request_id_t requestId)
    {
        auto cMsg = T.Response.createC();
        assert(cMsg);
        scope (exit)
            T.Response.destroyC(cMsg);
        T.Response.convert(response, *cMsg);
        safeCall(rcl_send_response(&_handle, &requestId, cast(void*) cMsg));
    }

package:
    rcl_service_t _handle;
}
