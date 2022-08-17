module rcld.node;

import rcl;
import rcld.context;
import std.string;
import rcld.util;
import rcld.publisher;

version (unittest) import std.exception;

class Node
{
    this(in string name, in string namespace, Context context)
    {
        _handle = rcl_get_zero_initialized_node();
        auto options = rcl_node_get_default_options();
        scope (exit)
            rcl_node_options_fini(&options);

        safeCall(rcl_node_init(
                &_handle, name.toStringz,
                namespace.toStringz,
                context.getRclContextRef(),
                &options
        ));
        context._nodes ~= this;
    }

    void terminate()
    {
        if (isValid())
        {
            foreach (pub; _publishers)
            {
                pub.terminate(this);
            }
            _publishers.length = 0;
            safeCall(rcl_node_fini(&_handle));
        }
    }

    ~this()
    {
        terminate();
    }

    bool isValid() const
    {
        return _handle.impl !is null;
    }

package:
    rcl_node_t _handle;
    BasePublisher[] _publishers;
}

@("construct")
unittest
{
    import test_helper;

    assertNotThrown(new Node("node", uniqueString(), new Context()));
}
