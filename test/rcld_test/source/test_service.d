module test_service;

import core.thread;
import std.process;
import std.algorithm;
import std.stdio;
import std.exception;
import std.format;

import test_helper.utils;

import rcld;
import rcl;
import test_msgs.srv : BasicTypes;

@("check if the service created by the server can be found")
unittest
{
    auto ns = uniqueString;

    auto context = new Context();
    auto node = new Node("server", ns, context);
    auto srv = new Service!BasicTypes(node, "basic_types");

    bool found = false;
    foreach (_; 0 .. 5)
    {
        Thread.sleep(200.msecs);
        auto ret = executeShell("ros2 service list");
        assert(ret.status == 0);
        found = ret.output.canFind(ns ~ "/basic_types");
        if (found)
        {
            break;
        }
    }
    assert(found);

    auto proc = spawnShell(format(
            `ros2 service call /%s/basic_types test_msgs/srv/BasicTypes '{int32_value: 123}' > /dev/null`, ns));
    BasicTypes.Request req;
    rmw_request_id_t reqId;
    bool taken = false;
    foreach (_; 0 .. 5)
    {
        Thread.sleep(200.msecs);
        taken = srv.takeRequest(req, reqId);
        if (taken)
        {
            break;
        }
    }
    assert(taken);
    assert(req.int32_value == 123);
    auto res = BasicTypes.Response();
    res.bool_value = true;
    srv.sendResponse(res, reqId);
    assert(proc.wait == 0);
}
