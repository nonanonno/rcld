module composition_interfaces.srv.humble;
version (humble)
{

    import std.string;
    import std.utf;
    import rcl;
    import rcl_interfaces.msg;

    struct UnloadNode
    {
        alias Request = UnloadNode_Request;
        alias Response = UnloadNode_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__composition_interfaces__srv__UnloadNode();
        }
    }

    struct LoadNode
    {
        alias Request = LoadNode_Request;
        alias Response = LoadNode_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__composition_interfaces__srv__LoadNode();
        }
    }

    struct ListNodes
    {
        alias Request = ListNodes_Request;
        alias Response = ListNodes_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__composition_interfaces__srv__ListNodes();
        }
    }

    struct UnloadNode_Request
    {
        ulong unique_id;

        alias CType = composition_interfaces__srv__UnloadNode_Request;
        alias CArrayType = composition_interfaces__srv__UnloadNode_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__composition_interfaces__srv__UnloadNode_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return composition_interfaces__srv__UnloadNode_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            composition_interfaces__srv__UnloadNode_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return composition_interfaces__srv__UnloadNode_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            composition_interfaces__srv__UnloadNode_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in UnloadNode_Request src, ref UnloadNode_Request.CType dst)
        {
            dst.unique_id = src.unique_id;
        }

        static void convert(in UnloadNode_Request.CType src, ref UnloadNode_Request dst)
        {
            dst.unique_id = src.unique_id;
        }
    }

    struct UnloadNode_Response
    {
        bool success;
        string error_message;

        alias CType = composition_interfaces__srv__UnloadNode_Response;
        alias CArrayType = composition_interfaces__srv__UnloadNode_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__composition_interfaces__srv__UnloadNode_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return composition_interfaces__srv__UnloadNode_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            composition_interfaces__srv__UnloadNode_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return composition_interfaces__srv__UnloadNode_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            composition_interfaces__srv__UnloadNode_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in UnloadNode_Response src, ref UnloadNode_Response.CType dst)
        {
            dst.success = src.success;
            rosidl_runtime_c__String__assign(&dst.error_message, toStringz(src.error_message));
        }

        static void convert(in UnloadNode_Response.CType src, ref UnloadNode_Response dst)
        {
            dst.success = src.success;
            dst.error_message = fromStringz(src.error_message.data).dup();
        }
    }

    struct LoadNode_Request
    {
        string package_name;
        string plugin_name;
        string node_name;
        string node_namespace;
        ubyte log_level;
        string[] remap_rules;
        rcl_interfaces.msg.Parameter[] parameters;
        rcl_interfaces.msg.Parameter[] extra_arguments;

        alias CType = composition_interfaces__srv__LoadNode_Request;
        alias CArrayType = composition_interfaces__srv__LoadNode_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__composition_interfaces__srv__LoadNode_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return composition_interfaces__srv__LoadNode_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            composition_interfaces__srv__LoadNode_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return composition_interfaces__srv__LoadNode_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            composition_interfaces__srv__LoadNode_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in LoadNode_Request src, ref LoadNode_Request.CType dst)
        {
            rosidl_runtime_c__String__assign(&dst.package_name, toStringz(src.package_name));
            rosidl_runtime_c__String__assign(&dst.plugin_name, toStringz(src.plugin_name));
            rosidl_runtime_c__String__assign(&dst.node_name, toStringz(src.node_name));
            rosidl_runtime_c__String__assign(&dst.node_namespace, toStringz(src.node_namespace));
            dst.log_level = src.log_level;
            rosidl_runtime_c__String__Sequence__init(&dst.remap_rules, src.remap_rules.length);
            foreach (i; 0U .. src.remap_rules.length)
            {
                rosidl_runtime_c__String__assign(&dst.remap_rules.data[i],
                        toStringz(src.remap_rules[i]));
            }
            rcl_interfaces__msg__Parameter__Sequence__init(&dst.parameters, src.parameters.length);
            foreach (i; 0U .. src.parameters.length)
            {
                rcl_interfaces.msg.Parameter.convert(src.parameters[i], dst.parameters.data[i]);
            }
            rcl_interfaces__msg__Parameter__Sequence__init(&dst.extra_arguments,
                    src.extra_arguments.length);
            foreach (i; 0U .. src.extra_arguments.length)
            {
                rcl_interfaces.msg.Parameter.convert(src.extra_arguments[i],
                        dst.extra_arguments.data[i]);
            }
        }

        static void convert(in LoadNode_Request.CType src, ref LoadNode_Request dst)
        {
            dst.package_name = fromStringz(src.package_name.data).dup();
            dst.plugin_name = fromStringz(src.plugin_name.data).dup();
            dst.node_name = fromStringz(src.node_name.data).dup();
            dst.node_namespace = fromStringz(src.node_namespace.data).dup();
            dst.log_level = src.log_level;
            dst.remap_rules.length = src.remap_rules.size;
            foreach (i; 0U .. dst.remap_rules.length)
            {
                dst.remap_rules[i] = fromStringz(src.remap_rules.data[i].data).dup();
            }
            dst.parameters.length = src.parameters.size;
            foreach (i; 0U .. dst.parameters.length)
            {
                rcl_interfaces.msg.Parameter.convert(src.parameters.data[i], dst.parameters[i]);
            }
            dst.extra_arguments.length = src.extra_arguments.size;
            foreach (i; 0U .. dst.extra_arguments.length)
            {
                rcl_interfaces.msg.Parameter.convert(src.extra_arguments.data[i],
                        dst.extra_arguments[i]);
            }
        }
    }

    struct LoadNode_Response
    {
        bool success;
        string error_message;
        string full_node_name;
        ulong unique_id;

        alias CType = composition_interfaces__srv__LoadNode_Response;
        alias CArrayType = composition_interfaces__srv__LoadNode_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__composition_interfaces__srv__LoadNode_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return composition_interfaces__srv__LoadNode_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            composition_interfaces__srv__LoadNode_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return composition_interfaces__srv__LoadNode_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            composition_interfaces__srv__LoadNode_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in LoadNode_Response src, ref LoadNode_Response.CType dst)
        {
            dst.success = src.success;
            rosidl_runtime_c__String__assign(&dst.error_message, toStringz(src.error_message));
            rosidl_runtime_c__String__assign(&dst.full_node_name, toStringz(src.full_node_name));
            dst.unique_id = src.unique_id;
        }

        static void convert(in LoadNode_Response.CType src, ref LoadNode_Response dst)
        {
            dst.success = src.success;
            dst.error_message = fromStringz(src.error_message.data).dup();
            dst.full_node_name = fromStringz(src.full_node_name.data).dup();
            dst.unique_id = src.unique_id;
        }
    }

    struct ListNodes_Request
    {
        ubyte structure_needs_at_least_one_member;

        alias CType = composition_interfaces__srv__ListNodes_Request;
        alias CArrayType = composition_interfaces__srv__ListNodes_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__composition_interfaces__srv__ListNodes_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return composition_interfaces__srv__ListNodes_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            composition_interfaces__srv__ListNodes_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return composition_interfaces__srv__ListNodes_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            composition_interfaces__srv__ListNodes_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in ListNodes_Request src, ref ListNodes_Request.CType dst)
        {
            dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
        }

        static void convert(in ListNodes_Request.CType src, ref ListNodes_Request dst)
        {
            dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
        }
    }

    struct ListNodes_Response
    {
        string[] full_node_names;
        ulong[] unique_ids;

        alias CType = composition_interfaces__srv__ListNodes_Response;
        alias CArrayType = composition_interfaces__srv__ListNodes_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__composition_interfaces__srv__ListNodes_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return composition_interfaces__srv__ListNodes_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            composition_interfaces__srv__ListNodes_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return composition_interfaces__srv__ListNodes_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            composition_interfaces__srv__ListNodes_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in ListNodes_Response src, ref ListNodes_Response.CType dst)
        {
            rosidl_runtime_c__String__Sequence__init(&dst.full_node_names,
                    src.full_node_names.length);
            foreach (i; 0U .. src.full_node_names.length)
            {
                rosidl_runtime_c__String__assign(&dst.full_node_names.data[i],
                        toStringz(src.full_node_names[i]));
            }
            rosidl_runtime_c__uint64__Sequence__init(&dst.unique_ids, src.unique_ids.length);
            foreach (i; 0U .. src.unique_ids.length)
            {
                dst.unique_ids.data[i] = src.unique_ids[i];
            }
        }

        static void convert(in ListNodes_Response.CType src, ref ListNodes_Response dst)
        {
            dst.full_node_names.length = src.full_node_names.size;
            foreach (i; 0U .. dst.full_node_names.length)
            {
                dst.full_node_names[i] = fromStringz(src.full_node_names.data[i].data).dup();
            }
            dst.unique_ids.length = src.unique_ids.size;
            foreach (i; 0U .. dst.unique_ids.length)
            {
                dst.unique_ids[i] = src.unique_ids.data[i];
            }
        }
    }

}
