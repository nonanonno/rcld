module rcld.publisher;

import std.string;

import rcl;

import rcld.node;
import rcld.util;

interface BasePublisher
{
    void terminate(Node node);
}

class Publisher(T) : BasePublisher
{
    this(Node node, in string name)
    {
        _handle = rcl_get_zero_initialized_publisher();
        auto options = rcl_publisher_get_default_options();
        auto typesupport = T.getTypesupport();
        safeCall(rcl_publisher_init(&_handle, &node._handle, typesupport, name.toStringz, &options));
        node._publishers ~= this;
    }

    override void terminate(Node node)
    {
        if (_handle.impl)
        {
            safeCall(rcl_publisher_fini(&_handle, &node._handle));
            // workaround: The function rcl_publisher_fini does not assign null pointer to `impl`.
            _handle.impl = null;
        }
    }

    void publish(in T msg)
    {
        auto cMsg = T.createC();
        assert(cMsg);
        T.convert(msg, *cMsg);
        safeCall(rcl_publish(&_handle, cast(const(void)*) cMsg, null));
        T.destroyC(cMsg);
    }

    size_t getSubscriptionCount() const
    {
        size_t count;
        safeCall(rcl_publisher_get_subscription_count(&_handle, &count));
        return count;
    }

package:
    rcl_publisher_t _handle;
}

@("Check if the topic created by the publisher found")
unittest
{
    import rcld;

    import std.algorithm : canFind;
    import std.exception : assertNotThrown;
    import std.process : executeShell;
    import std.conv;

    import core.thread;

    import test_helper.utils;
    import test_msgs.msg : BasicTypes;

    auto ns = uniqueString();

    auto context = Context.create();
    auto node = new Node("talker", ns, context);
    auto pub = new Publisher!BasicTypes(node, "basic_types");

    assert(tryUntilTimeout(() {
            const ret = executeShell("ros2 topic list");
            assert(ret.status == 0, ret.to!string);
            return ret.output.canFind(ns ~ "/basic_types");
        }));
    assertNotThrown(pub.publish(BasicTypes()));
}
