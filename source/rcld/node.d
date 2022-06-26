module rcld.node;

import rcl;
import rcld.context;
import std.exception;
import std.string;

class Node
{
    this(in string name, in string namespace, Context context)
    {
        _handle = rcl_get_zero_initialized_node();
        auto options = rcl_node_get_default_options();
        scope (exit)
            rcl_node_options_fini(&options);

        enforce(rcl_node_init(
                &_handle, name.toStringz,
                namespace.toStringz,
                context.getRclContextRef(),
                &options
        ) == RCL_RET_OK);
    }

    ~this()
    {
        if (rcl_node_is_valid(&_handle))
        {
            rcl_node_fini(&_handle);
        }
    }

private:
    rcl_node_t _handle;
}

@("construct")
unittest
{
    import test_helper;

    assertNotThrown(new Node("node", uniqueString(), new Context()));
}
