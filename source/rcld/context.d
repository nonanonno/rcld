module rcld.context;

import core.runtime;
import rcl;
import rcld.util;
import rcld.node;

version (unittest) import std.exception;

version (foxy)
{
    enum featureDomainId = false;
}
else
{
    enum featureDomainId = true;
}

class InitOptions
{
    alias This = typeof(this);

    this(rcl_allocator_t allocator = rcutils_get_default_allocator())
    {
        _allocator = allocator;
        _options = rcl_get_zero_initialized_init_options();
        safeCall(rcl_init_options_init(&_options, _allocator));
        safeCall(rcl_clock_init(RCL_STEADY_TIME, &_clock, &_allocator));
    }

    ~this()
    {
        safeCall(rcl_clock_fini(&_clock));
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

    rcl_clock_t* getClockRef()
    {
        return &_clock;
    }

private:
    rcutils_allocator_t _allocator;
    rcl_init_options_t _options;
    rcl_clock_t _clock;
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
        version (foxy)
        {
            return rcl_context_is_valid(constHandle());
        }
        else
        {
            return rcl_context_is_valid(&_context);

        }
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

    static if (featureDomainId)
    {
        size_t getDomainId() const
        {
            size_t domainId;
            safeCall(rcl_context_get_domain_id(constHandle(), &domainId));
            return domainId;
        }
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

static if (featureDomainId)
{
    @("set domain_id")
    unittest
    {
        import dshould;
        import std.process : environment;

        auto o = new InitOptions().setDomainId(123);
        auto c = new Context(CArgs(0, null), o);

        static if (featureDomainId)
        {
            c.getDomainId().should.be(123);
        }
    }
}

@("shutdown")
unittest
{
    auto c = new Context();
    assertNotThrown(c.shutdown());
    assertNotThrown(destroy(c));
}
