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
import std_srvs.srv : SetBool;

@("check if the service created by the server can be found")
unittest
{
    auto ns = uniqueString;

    auto context = new Context();
    auto node = new Node("server", ns, context);
    auto srv = new Service!SetBool(node, "set_bool");

    bool found = false;
    foreach (_; 0 .. 5)
    {
        Thread.sleep(200.msecs);
        auto ret = executeShell("ros2 service list");
        assert(ret.status == 0);
        found = ret.output.canFind(ns ~ "/set_bool");
        if (found)
        {
            break;
        }
    }
    assert(found);

    auto proc = spawnShell(format(
            `ros2 service call /%s/set_bool std_srvs/srv/SetBool '{data: True}'`, ns));
    SetBool.Request req;
    rmw_request_id_t reqId;
    bool taken = false;
    foreach (_; 0 .. 5)
    {
        Thread.sleep(200.msecs);
        taken = srv.take(req, reqId);
        if (taken)
        {
            break;
        }
    }
    assert(taken);
    assert(req.data);
    auto res = SetBool.Response(true, "response");
    srv.sendResponse(res, reqId);
    assert(proc.wait == 0);
}
