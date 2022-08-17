module test_subscription;

import core.thread;
import std.process;
import std.algorithm;
import std.stdio;
import std.exception;
import std.format;

import test_helper.utils;

import rcld;
import std_msgs.msg;

unittest
{
    auto ns = uniqueString;

    auto context = new Context();
    auto node = new Node("listener", ns, context);
    auto sub = new Subscription!String(node, "chatter");

    bool found = false;
    foreach (_; 0 .. 5)
    {
        Thread.sleep(200.msecs);
        auto ret = executeShell("ros2 topic list");
        assert(ret.status == 0);
        found = ret.output.canFind(ns ~ "/chatter");
        if (found)
        {
            break;
        }
    }
    assert(found);

    assert(spawnShell(format(`ros2 topic pub /%s/chatter std_msgs/msg/String '{data: "hello"}' -1`, ns))
            .wait == 0);

    String msg;
    assert(sub.take(msg));
    assert(msg.data == "hello");

}
