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

// https://docs.ros.org/en/rolling/Releases/Release-Humble-Hawksbill.html#ros2-topic-pub-will-wait-for-one-matching-subscription-when-using-times-once-1
version (rolling) enum featureWaitForMatching = true;
version (humble) enum featureWaitForMatching = true;
version (galactic) enum featureWaitForMatching = false;
version (foxy) enum featureWaitForMatching = false;

@("check if the topic created by the subscription can be found")
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

    String msg;
    bool taken = false;
    Pid ros2TopicPub;

    static if (featureWaitForMatching)
    {
        ros2TopicPub = spawnShell(format(
                `ros2 topic pub /%s/chatter std_msgs/msg/String '{data: "hello"}' -1 > /dev/null`, ns));
    }
    else
    {
        ros2TopicPub = spawnShell(format(
                `ros2 topic pub /%s/chatter std_msgs/msg/String '{data: "hello"}' -r 10 -t 10 > /dev/null`, ns));
    }
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
    assert(msg.data == "hello");
    assert(wait(ros2TopicPub) == 0);
}
