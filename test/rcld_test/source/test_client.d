module test_client;

import core.thread;
import std.process;
import std.algorithm;
import std.stdio;
import std.exception;
import std.format;
import std.concurrency;
import std.conv;

import test_helper.utils;

import rcld;
import rcl;
import test_msgs.srv : BasicTypes;

unittest
{
    auto ns = uniqueString;

    auto server = spawn((string ns) {
        auto context = new Context();
        auto node = new Node("server", ns, context);
        auto srv = new Service!BasicTypes(node, "basic_types");
        foreach (_; 0 .. 10)
        {
            Thread.sleep(100.msecs);
            BasicTypes.Request req;
            rmw_request_id_t reqId;
            auto ret = srv.takeRequest(req, reqId);
            if (ret)
            {
                auto res = BasicTypes.Response();
                res.int32_value = req.int32_value + 1;
                srv.sendResponse(res, reqId);
                break;
            }
        }
    }, ns);

    // client
    auto context = new Context();
    auto node = new Node("client", ns, context);
    auto cli = new Client!BasicTypes(node, "basic_types");
    foreach (_; 0 .. 10)
    {
        Thread.sleep(100.msecs);
        if (cli.serviceIsReady())
        {
            break;
        }
    }
    auto req = BasicTypes.Request();
    req.int32_value = 123;
    cli.sendRequest(req);
    auto res = BasicTypes.Response();
    bool taken = false;
    foreach (_; 0 .. 10)
    {
        Thread.sleep(100.msecs);
        taken = cli.takeResponse(res);
        if (taken)
        {
            break;
        }
    }
    assert(taken);
    assert(res.int32_value == 123 + 1);
}
