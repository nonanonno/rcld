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

    bool takeRequest(out T.Request request, out rmw_request_id_t requestId)
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

@("Check if the service created by the server can be found")
unittest
{
    import rcld;
    import rcl : rmw_request_id_t;

    import std.algorithm : canFind;
    import std.format : format;
    import std.process : executeShell, spawnShell, wait;

    import core.thread : Thread, msecs;

    import test_helper.utils;
    import test_msgs.srv : BasicTypes;

    auto ns = uniqueString();

    auto context = Context.create();
    auto node = new Node("server", ns, context);
    auto srv = new Service!BasicTypes(node, "basic_types");

    assert(tryUntilTimeout(() {
            const ret = executeShell("ros2 service list");
            return ret.output.canFind(ns ~ "/basic_types");
        }));

    auto ros2ServiceCall = spawnShell(format(
            `ros2 service call /%s/basic_types test_msgs/srv/BasicTypes '{int32_value: 123}' > /dev/null`, ns
    ));
    BasicTypes.Request req;
    rmw_request_id_t reqId;
    assert(tryUntilTimeout(() { return srv.takeRequest(req, reqId); }));

    assert(req.int32_value == 123);
    auto res = BasicTypes.Response();
    res.bool_value = true;
    srv.sendResponse(res, reqId);
    wait(ros2ServiceCall);
}
