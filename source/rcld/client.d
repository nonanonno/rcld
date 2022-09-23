module rcld.client;

import std.string;

import rcl;

import rcld.node;
import rcld.util;

interface BaseClient
{
    void terminate(Node node);
}

class Client(T) : BaseClient
{
    this(Node node, in string name)
    {
        _handle = rcl_get_zero_initialized_client();
        _node = node;
        auto options = rcl_client_get_default_options();
        auto typesupport = T.getTypesupport();
        safeCall(rcl_client_init(&_handle, &node._handle, typesupport, name.toStringz, &options));
        node._clients ~= this;
    }

    override void terminate(Node node)
    {
        if (isValid())
        {
            safeCall(rcl_client_fini(&_handle, &node._handle));
            _handle.impl = null;
        }
    }

    bool isValid() const
    {
        return _handle.impl !is null;
    }

    bool takeResponse(out T.Response response)
    {
        auto cMsg = T.Response.createC();
        rmw_request_id_t requestId;
        assert(cMsg);
        scope (exit)
            T.Response.destroyC(cMsg);
        auto ret = rcl_take_response(&_handle, &requestId, cast(void*) cMsg);
        if (ret == RCL_RET_OK)
        {
            T.Response.convert(*cMsg, response);
        }
        return ret == RCL_RET_OK;
    }

    void sendRequest(in T.Request request)
    {
        auto cMsg = T.Request.createC();
        assert(cMsg);
        scope (exit)
            T.Request.destroyC(cMsg);
        T.Request.convert(request, *cMsg);
        long seq;
        safeCall(rcl_send_request(&_handle, cast(void*) cMsg, &seq));
    }

    bool serviceIsReady() const
    {
        bool isReady = false;
        safeCall(rcl_service_server_is_available(&_node._handle, &_handle, &isReady));
        return isReady;
    }

package:
    rcl_client_t _handle;
    Node _node;
}

@("Check if the service client works")
unittest
{
    import rcld;

    import std.concurrency : spawn;

    import core.thread : Thread, msecs;

    import test_helper.utils;
    import test_msgs.srv : BasicTypes;

    auto ns = uniqueString();

    auto server = spawn((string ns) {
        auto context = Context.create();
        auto node = new Node("server", ns, context);
        auto srv = new Service!BasicTypes(node, "basic_types");

        assert(tryUntilTimeout(() {
                BasicTypes.Request req;
                rmw_request_id_t reqId;
                if (srv.takeRequest(req, reqId))
                {
                    auto res = BasicTypes.Response();
                    res.int32_value = req.int32_value + 1;
                    srv.sendResponse(res, reqId);
                    return true;
                }
                return false;
            }));
    }, ns);

    // client
    auto context = Context.create();
    auto node = new Node("client", ns, context);
    auto cli = new Client!BasicTypes(node, "basic_types");

    assert(tryUntilTimeout(() { return cli.serviceIsReady(); }));

    auto req = BasicTypes.Request();
    req.int32_value = 123;
    cli.sendRequest(req);
    auto res = BasicTypes.Response();
    assert(tryUntilTimeout(() { return cli.takeResponse(res); }));
    assert(res.int32_value == 123 + 1);
}
