module rcld.subscription;

import std.string;

import rcl;

import rcld.node;
import rcld.util;

interface BaseSubscription
{
    void terminate(Node node);
}

class Subscription(T) : BaseSubscription
{
    this(Node node, in string name)
    {
        _handle = rcl_get_zero_initialized_subscription();
        auto options = rcl_subscription_get_default_options();
        auto typesupport = T.getTypesupport();
        safeCall(rcl_subscription_init(&_handle, &node._handle, typesupport, name.toStringz, &options));
        node._subscriptions ~= this;
    }

    override void terminate(Node node)
    {
        if (isValid())
        {
            safeCall(rcl_subscription_fini(&_handle, &node._handle));
            _handle.impl = null;
        }
    }

    bool take(out T msg)
    {
        auto cMsg = T.createC();
        assert(cMsg);
        scope (exit)
            T.destroyC(cMsg);
        auto messageInfo = rmw_message_info_t();
        messageInfo.from_intra_process = false;
        const ret = rcl_take(&_handle, cast(void*) cMsg, &messageInfo, null);
        if (ret == RCL_RET_OK)
        {
            T.convert(*cMsg, msg);
        }
        return ret == RCL_RET_OK;
    }

    bool isValid() const
    {
        return _handle.impl !is null;
    }

package:
    rcl_subscription_t _handle;
}

@("Check if the topic created by the subscription can be found")
unittest
{
    import rcld;

    import std.algorithm : canFind;
    import std.format : format;
    import std.process : executeShell, spawnShell, wait, spawnProcess, kill, environment;

    import core.thread;
    import core.sys.posix.signal : SIGINT;

    import test_helper.utils;
    import test_msgs.msg : BasicTypes;

    import std;

    auto ns = uniqueString();

    auto context = Context.create();
    auto node = new Node("listener", ns, context);
    scope (exit)
        node.terminate();
    auto sub = new Subscription!BasicTypes(node, "basic_types");

    assert(tryUntilTimeout(() {
            const ret = executeShell("ros2 topic list");
            assert(ret.status == 0);
            return ret.output.canFind(ns ~ "/basic_types");
        }));

    // ToDo: should use `-1` option.
    // `-1` waits for at least 1 subscriptino found (from galactic)
    auto ros2TopicPub = spawnProcess([
        "ros2",
        "topic",
        "pub",
        format("/%s/basic_types", ns),
        "test_msgs/msg/BasicTypes",
        "{int32_value: 123}",
        "-r",
        "10",
        "-t",
        "50"
    ], stdin, File("/dev/null", "w"));

    BasicTypes msg;

    assert(tryUntilTimeout(() { return sub.take(msg); }));
    assert(msg.int32_value == 123);

    kill(ros2TopicPub, SIGINT);
    wait(ros2TopicPub);
}
