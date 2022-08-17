module rcld.context;

import core.runtime;
import rcl;
import rcld.util;
import rcld.node;

version (unittest) import std.exception;

class InitOptions
{
    alias This = typeof(this);

    this(rcl_allocator_t allocator = rcutils_get_default_allocator())
    {
        _allocator = allocator;
        _options = rcl_get_zero_initialized_init_options();
        safeCall(rcl_init_options_init(&_options, _allocator));
    }

    ~this()
    {
        safeCall(rcl_init_options_fini(&_options));
    }

    /**
     * Set specific ROS_DOMAIN_ID
     */
    This setDomainId(size_t domainId)
    {
        safeCall(rcl_init_options_set_domain_id(&_options, domainId));
        return this;
    }
    /**
     * Use ROS_DOMAIN_ID in environment variables as default
     */
    This useDefaultDomainId()
    {
        size_t domainId = RCL_DEFAULT_DOMAIN_ID;
        safeCall(rcl_get_default_domain_id(&domainId));
        return setDomainId(domainId);
    }

    rcutils_allocator_t* getAllocatorRef()
    {
        return &_allocator;
    }

    rcl_init_options_t* getInitOptionsRef()
    {
        return &_options;
    }

private:
    rcutils_allocator_t _allocator;
    rcl_init_options_t _options;
}

/**
 * ROS2 Context class
 */
class Context
{
    this(in CArgs args = Runtime.cArgs(), InitOptions options = new InitOptions())
    {
        _options = options;
        _context = rcl_context_t();
        safeCall(rcl_init(args.argc, args.argv, _options.getInitOptionsRef(), &_context));
    }

    ~this()
    {
        if (isValid())
        {
            shutdown();
            safeCall(rcl_context_fini(&_context));
        }
    }

    bool isValid() const
    {
        return rcl_context_is_valid(&_context);
    }

    void shutdown()
    {
        foreach (node; _nodes)
        {
            node.terminate();
        }
        safeCall(rcl_shutdown(&_context));
    }

    rcl_context_t* getRclContextRef()
    {
        return &_context;
    }

    size_t getDomainId() const
    {
        size_t domainId;
        safeCall(rcl_context_get_domain_id(constHandle(), &domainId));
        return domainId;
    }

package:
    Node[] _nodes;

private:
    rcl_context_t _context;
    InitOptions _options;

    rcl_context_t* constHandle() const
    {
        return cast(rcl_context_t*)&_context;
    }
}

@("construct")
unittest
{
    assertNotThrown(destroy(new Context()));
    assertNotThrown(destroy(new Context(CArgs(0, null), new InitOptions())));
}

@("default domain_id")
unittest
{
    import dshould;
    import std.process : environment;

    foreach (env, expect; ["": 0, "123": 123])
    {
        environment["ROS_DOMAIN_ID"] = env; // set environment variable
        auto o = new InitOptions().useDefaultDomainId();
        auto c = new Context(CArgs(0, null), o);

        c.getDomainId().should.be(expect);
    }
}

@("set domain_id")
unittest
{
    import dshould;
    import std.process : environment;

    environment["ROS_DOMAIN_ID"] = ""; // force reset
    auto o = new InitOptions().setDomainId(123);
    auto c = new Context(CArgs(0, null), o);

    c.getDomainId().should.be(123);
}

@("shutdown")
unittest
{
    auto c = new Context();
    assertNotThrown(c.shutdown());
    assertNotThrown(destroy(c));
}
