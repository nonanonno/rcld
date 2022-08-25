module test_publisher;

import core.thread;
import std.process;
import std.algorithm;
import std.stdio;
import std.exception;

import test_helper.utils;

import rcld;
import std_msgs.msg;

@("check if the topic created by the publisher found")
unittest
{
    auto ns = uniqueString;

    auto context = new Context();
    auto node = new Node("talker", ns, context);
    auto pub = new Publisher!String(node, "chatter");

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

    assertNotThrown(pub.publish(String("hello")));

}
