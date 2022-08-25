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
import std_srvs.srv : SetBool;

unittest
{
    auto ns = uniqueString;

    auto server = spawn((string ns) {
        auto context = new Context();
        auto node = new Node("server", ns, context);
        auto srv = new Service!SetBool(node, "set_bool");
        foreach (_; 0 .. 10)
        {
            Thread.sleep(100.msecs);
            SetBool.Request req;
            rmw_request_id_t reqId;
            auto ret = srv.takeRequest(req, reqId);
            if (ret)
            {
                auto res = SetBool.Response(true, "Requested: " ~ req.data.to!string);
                srv.sendResponse(res, reqId);
                break;
            }
        }
    }, ns);

    // client
    auto context = new Context();
    auto node = new Node("client", ns, context);
    auto cli = new Client!SetBool(node, "set_bool");
    foreach (_; 0 .. 10)
    {
        Thread.sleep(100.msecs);
        if (cli.serviceIsReady())
        {
            break;
        }
    }
    auto req = SetBool.Request(true);
    cli.sendRequest(req);
    auto res = SetBool.Response();
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
    assert(res.success);
}
