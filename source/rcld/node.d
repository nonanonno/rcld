module rcld.node;

import rcl;
import rcld.context;
import std.string;
import rcld.action_server;
import rcld.util;
import rcld.publisher;
import rcld.subscription;
import rcld.service;
import rcld.client;

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
                context.getContextRef(),
                &options
        ));
        context.addNode(this);
    }

    void terminate()
    {
        if (isValid())
        {
            terminateItems(_publishers);
            terminateItems(_subscriptions);
            terminateItems(_services);
            terminateItems(_clients);
            terminateItems(_action_servers);
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
    BaseSubscription[] _subscriptions;
    BaseService[] _services;
    BaseClient[] _clients;
    BaseActionServer[] _action_servers;

private:
    void terminateItems(T)(ref T[] items)
    {
        foreach (i; items)
        {
            i.terminate(this);
        }
        items.length = 0;
    }

}

@("construct")
unittest
{
    import test_helper.utils;

    assertNotThrown(new Node("node", uniqueString(), Context.create()));
}
