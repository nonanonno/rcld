module rcld.context;

import core.runtime;
import rcl;
import rcld.util;
import rcld.node;
import automem;

version (unittest) import std.exception;

version (foxy)
{
    enum featureDomainId = false;
}
else
{
    enum featureDomainId = true;
}

struct Context
{
    alias This = typeof(this);

    static This create(in CArgs args = Runtime.cArgs())
    {
        auto options = rcl_get_zero_initialized_init_options();
        auto context = rcl_context_t();
        auto clock = rcl_clock_t();
        auto allocator = rcutils_get_default_allocator();
        safeCall(rcl_init_options_init(&options, allocator));
        scope (exit)
            safeCall(rcl_init_options_fini(&options));

        safeCall(rcl_init(args.argc, args.argv, &options, &context));
        safeCall(rcl_clock_init(RCL_STEADY_TIME, &clock, &allocator));

        return This(RC!Impl(context, clock, allocator));
    }

    rcl_context_t* getContextRef()
    {
        return &_ptr._context;
    }

    rcl_clock_t* getClockRef()
    {
        return &_ptr._clock;
    }

    void addNode(Node node)
    {
        _ptr._nodes ~= node;
    }

    private struct Impl
    {
        rcl_context_t _context;
        rcl_clock_t _clock;
        rcutils_allocator_t _allocator;
        Node[] _nodes;

        ~this()
        {
            import std : writeln;

            foreach (node; _nodes)
            {
                node.terminate();
            }
            safeCall(rcl_clock_fini(&_clock));
            safeCall(rcl_shutdown(&_context));
            safeCall(rcl_context_fini(&_context));
        }
    }

    private RC!Impl _ptr;
}

@("construct")
unittest
{
    assertNotThrown(Context.create());
}
