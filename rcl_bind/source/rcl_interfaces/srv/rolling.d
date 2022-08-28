module rcl_interfaces.srv.rolling;
version (rolling)
{

    import std.string;
    import std.utf;
    import rcl;
    import rcl_interfaces.msg;

    struct GetParameters
    {
        alias Request = GetParameters_Request;
        alias Response = GetParameters_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__rcl_interfaces__srv__GetParameters();
        }
    }

    struct SetParametersAtomically
    {
        alias Request = SetParametersAtomically_Request;
        alias Response = SetParametersAtomically_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__rcl_interfaces__srv__SetParametersAtomically();
        }
    }

    struct ListParameters
    {
        alias Request = ListParameters_Request;
        alias Response = ListParameters_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__rcl_interfaces__srv__ListParameters();
        }
    }

    struct SetParameters
    {
        alias Request = SetParameters_Request;
        alias Response = SetParameters_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__rcl_interfaces__srv__SetParameters();
        }
    }

    struct DescribeParameters
    {
        alias Request = DescribeParameters_Request;
        alias Response = DescribeParameters_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__rcl_interfaces__srv__DescribeParameters();
        }
    }

    struct GetParameterTypes
    {
        alias Request = GetParameterTypes_Request;
        alias Response = GetParameterTypes_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__rcl_interfaces__srv__GetParameterTypes();
        }
    }

    struct GetParameters_Request
    {
        string[] names;

        alias CType = rcl_interfaces__srv__GetParameters_Request;
        alias CArrayType = rcl_interfaces__srv__GetParameters_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__GetParameters_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__GetParameters_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__GetParameters_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__GetParameters_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__GetParameters_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in GetParameters_Request src, ref GetParameters_Request.CType dst)
        {
            rosidl_runtime_c__String__Sequence__init(&dst.names, src.names.length);
            foreach (i; 0U .. src.names.length)
            {
                rosidl_runtime_c__String__assign(&dst.names.data[i], toStringz(src.names[i]));
            }
        }

        static void convert(in GetParameters_Request.CType src, ref GetParameters_Request dst)
        {
            dst.names.length = src.names.size;
            foreach (i; 0U .. dst.names.length)
            {
                dst.names[i] = fromStringz(src.names.data[i].data).dup();
            }
        }
    }

    struct GetParameters_Response
    {
        rcl_interfaces.msg.ParameterValue[] values;

        alias CType = rcl_interfaces__srv__GetParameters_Response;
        alias CArrayType = rcl_interfaces__srv__GetParameters_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__GetParameters_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__GetParameters_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__GetParameters_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__GetParameters_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__GetParameters_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in GetParameters_Response src, ref GetParameters_Response.CType dst)
        {
            rcl_interfaces__msg__ParameterValue__Sequence__init(&dst.values, src.values.length);
            foreach (i; 0U .. src.values.length)
            {
                rcl_interfaces.msg.ParameterValue.convert(src.values[i], dst.values.data[i]);
            }
        }

        static void convert(in GetParameters_Response.CType src, ref GetParameters_Response dst)
        {
            dst.values.length = src.values.size;
            foreach (i; 0U .. dst.values.length)
            {
                rcl_interfaces.msg.ParameterValue.convert(src.values.data[i], dst.values[i]);
            }
        }
    }

    struct SetParametersAtomically_Request
    {
        rcl_interfaces.msg.Parameter[] parameters;

        alias CType = rcl_interfaces__srv__SetParametersAtomically_Request;
        alias CArrayType = rcl_interfaces__srv__SetParametersAtomically_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__SetParametersAtomically_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__SetParametersAtomically_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__SetParametersAtomically_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__SetParametersAtomically_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__SetParametersAtomically_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in SetParametersAtomically_Request src,
                ref SetParametersAtomically_Request.CType dst)
        {
            rcl_interfaces__msg__Parameter__Sequence__init(&dst.parameters, src.parameters.length);
            foreach (i; 0U .. src.parameters.length)
            {
                rcl_interfaces.msg.Parameter.convert(src.parameters[i], dst.parameters.data[i]);
            }
        }

        static void convert(in SetParametersAtomically_Request.CType src,
                ref SetParametersAtomically_Request dst)
        {
            dst.parameters.length = src.parameters.size;
            foreach (i; 0U .. dst.parameters.length)
            {
                rcl_interfaces.msg.Parameter.convert(src.parameters.data[i], dst.parameters[i]);
            }
        }
    }

    struct SetParametersAtomically_Response
    {
        rcl_interfaces.msg.SetParametersResult result;

        alias CType = rcl_interfaces__srv__SetParametersAtomically_Response;
        alias CArrayType = rcl_interfaces__srv__SetParametersAtomically_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__SetParametersAtomically_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__SetParametersAtomically_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__SetParametersAtomically_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__SetParametersAtomically_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__SetParametersAtomically_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in SetParametersAtomically_Response src,
                ref SetParametersAtomically_Response.CType dst)
        {
            rcl_interfaces.msg.SetParametersResult.convert(src.result, dst.result);
        }

        static void convert(in SetParametersAtomically_Response.CType src,
                ref SetParametersAtomically_Response dst)
        {
            rcl_interfaces.msg.SetParametersResult.convert(src.result, dst.result);
        }
    }

    struct ListParameters_Request
    {
        string[] prefixes;
        ulong depth;

        alias CType = rcl_interfaces__srv__ListParameters_Request;
        alias CArrayType = rcl_interfaces__srv__ListParameters_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__ListParameters_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__ListParameters_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__ListParameters_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__ListParameters_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__ListParameters_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in ListParameters_Request src, ref ListParameters_Request.CType dst)
        {
            rosidl_runtime_c__String__Sequence__init(&dst.prefixes, src.prefixes.length);
            foreach (i; 0U .. src.prefixes.length)
            {
                rosidl_runtime_c__String__assign(&dst.prefixes.data[i], toStringz(src.prefixes[i]));
            }
            dst.depth = src.depth;
        }

        static void convert(in ListParameters_Request.CType src, ref ListParameters_Request dst)
        {
            dst.prefixes.length = src.prefixes.size;
            foreach (i; 0U .. dst.prefixes.length)
            {
                dst.prefixes[i] = fromStringz(src.prefixes.data[i].data).dup();
            }
            dst.depth = src.depth;
        }
    }

    struct ListParameters_Response
    {
        rcl_interfaces.msg.ListParametersResult result;

        alias CType = rcl_interfaces__srv__ListParameters_Response;
        alias CArrayType = rcl_interfaces__srv__ListParameters_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__ListParameters_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__ListParameters_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__ListParameters_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__ListParameters_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__ListParameters_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in ListParameters_Response src, ref ListParameters_Response.CType dst)
        {
            rcl_interfaces.msg.ListParametersResult.convert(src.result, dst.result);
        }

        static void convert(in ListParameters_Response.CType src, ref ListParameters_Response dst)
        {
            rcl_interfaces.msg.ListParametersResult.convert(src.result, dst.result);
        }
    }

    struct SetParameters_Request
    {
        rcl_interfaces.msg.Parameter[] parameters;

        alias CType = rcl_interfaces__srv__SetParameters_Request;
        alias CArrayType = rcl_interfaces__srv__SetParameters_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__SetParameters_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__SetParameters_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__SetParameters_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__SetParameters_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__SetParameters_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in SetParameters_Request src, ref SetParameters_Request.CType dst)
        {
            rcl_interfaces__msg__Parameter__Sequence__init(&dst.parameters, src.parameters.length);
            foreach (i; 0U .. src.parameters.length)
            {
                rcl_interfaces.msg.Parameter.convert(src.parameters[i], dst.parameters.data[i]);
            }
        }

        static void convert(in SetParameters_Request.CType src, ref SetParameters_Request dst)
        {
            dst.parameters.length = src.parameters.size;
            foreach (i; 0U .. dst.parameters.length)
            {
                rcl_interfaces.msg.Parameter.convert(src.parameters.data[i], dst.parameters[i]);
            }
        }
    }

    struct SetParameters_Response
    {
        rcl_interfaces.msg.SetParametersResult[] results;

        alias CType = rcl_interfaces__srv__SetParameters_Response;
        alias CArrayType = rcl_interfaces__srv__SetParameters_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__SetParameters_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__SetParameters_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__SetParameters_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__SetParameters_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__SetParameters_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in SetParameters_Response src, ref SetParameters_Response.CType dst)
        {
            rcl_interfaces__msg__SetParametersResult__Sequence__init(&dst.results,
                    src.results.length);
            foreach (i; 0U .. src.results.length)
            {
                rcl_interfaces.msg.SetParametersResult.convert(src.results[i], dst.results.data[i]);
            }
        }

        static void convert(in SetParameters_Response.CType src, ref SetParameters_Response dst)
        {
            dst.results.length = src.results.size;
            foreach (i; 0U .. dst.results.length)
            {
                rcl_interfaces.msg.SetParametersResult.convert(src.results.data[i], dst.results[i]);
            }
        }
    }

    struct DescribeParameters_Request
    {
        string[] names;

        alias CType = rcl_interfaces__srv__DescribeParameters_Request;
        alias CArrayType = rcl_interfaces__srv__DescribeParameters_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__DescribeParameters_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__DescribeParameters_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__DescribeParameters_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__DescribeParameters_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__DescribeParameters_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in DescribeParameters_Request src,
                ref DescribeParameters_Request.CType dst)
        {
            rosidl_runtime_c__String__Sequence__init(&dst.names, src.names.length);
            foreach (i; 0U .. src.names.length)
            {
                rosidl_runtime_c__String__assign(&dst.names.data[i], toStringz(src.names[i]));
            }
        }

        static void convert(in DescribeParameters_Request.CType src,
                ref DescribeParameters_Request dst)
        {
            dst.names.length = src.names.size;
            foreach (i; 0U .. dst.names.length)
            {
                dst.names[i] = fromStringz(src.names.data[i].data).dup();
            }
        }
    }

    struct DescribeParameters_Response
    {
        rcl_interfaces.msg.ParameterDescriptor[] descriptors;

        alias CType = rcl_interfaces__srv__DescribeParameters_Response;
        alias CArrayType = rcl_interfaces__srv__DescribeParameters_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__DescribeParameters_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__DescribeParameters_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__DescribeParameters_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__DescribeParameters_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__DescribeParameters_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in DescribeParameters_Response src,
                ref DescribeParameters_Response.CType dst)
        {
            rcl_interfaces__msg__ParameterDescriptor__Sequence__init(&dst.descriptors,
                    src.descriptors.length);
            foreach (i; 0U .. src.descriptors.length)
            {
                rcl_interfaces.msg.ParameterDescriptor.convert(src.descriptors[i],
                        dst.descriptors.data[i]);
            }
        }

        static void convert(in DescribeParameters_Response.CType src,
                ref DescribeParameters_Response dst)
        {
            dst.descriptors.length = src.descriptors.size;
            foreach (i; 0U .. dst.descriptors.length)
            {
                rcl_interfaces.msg.ParameterDescriptor.convert(src.descriptors.data[i],
                        dst.descriptors[i]);
            }
        }
    }

    struct GetParameterTypes_Request
    {
        string[] names;

        alias CType = rcl_interfaces__srv__GetParameterTypes_Request;
        alias CArrayType = rcl_interfaces__srv__GetParameterTypes_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__GetParameterTypes_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__GetParameterTypes_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__GetParameterTypes_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__GetParameterTypes_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__GetParameterTypes_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in GetParameterTypes_Request src, ref GetParameterTypes_Request
                .CType dst)
        {
            rosidl_runtime_c__String__Sequence__init(&dst.names, src.names.length);
            foreach (i; 0U .. src.names.length)
            {
                rosidl_runtime_c__String__assign(&dst.names.data[i], toStringz(src.names[i]));
            }
        }

        static void convert(in GetParameterTypes_Request.CType src, ref GetParameterTypes_Request dst)
        {
            dst.names.length = src.names.size;
            foreach (i; 0U .. dst.names.length)
            {
                dst.names[i] = fromStringz(src.names.data[i].data).dup();
            }
        }
    }

    struct GetParameterTypes_Response
    {
        ubyte[] types;

        alias CType = rcl_interfaces__srv__GetParameterTypes_Response;
        alias CArrayType = rcl_interfaces__srv__GetParameterTypes_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__srv__GetParameterTypes_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return rcl_interfaces__srv__GetParameterTypes_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            rcl_interfaces__srv__GetParameterTypes_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return rcl_interfaces__srv__GetParameterTypes_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            rcl_interfaces__srv__GetParameterTypes_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in GetParameterTypes_Response src,
                ref GetParameterTypes_Response.CType dst)
        {
            rosidl_runtime_c__uint8__Sequence__init(&dst.types, src.types.length);
            foreach (i; 0U .. src.types.length)
            {
                dst.types.data[i] = src.types[i];
            }
        }

        static void convert(in GetParameterTypes_Response.CType src,
                ref GetParameterTypes_Response dst)
        {
            dst.types.length = src.types.size;
            foreach (i; 0U .. dst.types.length)
            {
                dst.types[i] = src.types.data[i];
            }
        }
    }

}
