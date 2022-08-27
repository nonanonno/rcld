module rcl_interfaces.msg.galactic;

import std.string;
import std.utf;
import rcl;
import builtin_interfaces.msg;

struct ParameterEventDescriptors
{
    rcl_interfaces.msg.ParameterDescriptor[] new_parameters;
    rcl_interfaces.msg.ParameterDescriptor[] changed_parameters;
    rcl_interfaces.msg.ParameterDescriptor[] deleted_parameters;

    alias CType = rcl_interfaces__msg__ParameterEventDescriptors;
    alias CArrayType = rcl_interfaces__msg__ParameterEventDescriptors__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__ParameterEventDescriptors();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterEventDescriptors__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterEventDescriptors__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterEventDescriptors__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterEventDescriptors__Sequence__destroy(array);
        array = null;
    }

    static void convert(in ParameterEventDescriptors src, ref ParameterEventDescriptors.CType dst)
    {
        rcl_interfaces__msg__ParameterDescriptor__Sequence__init(&dst.new_parameters,
                src.new_parameters.length);
        foreach (i; 0U .. src.new_parameters.length)
        {
            rcl_interfaces.msg.ParameterDescriptor.convert(src.new_parameters[i],
                    dst.new_parameters.data[i]);
        }
        rcl_interfaces__msg__ParameterDescriptor__Sequence__init(&dst.changed_parameters,
                src.changed_parameters.length);
        foreach (i; 0U .. src.changed_parameters.length)
        {
            rcl_interfaces.msg.ParameterDescriptor.convert(src.changed_parameters[i],
                    dst.changed_parameters.data[i]);
        }
        rcl_interfaces__msg__ParameterDescriptor__Sequence__init(&dst.deleted_parameters,
                src.deleted_parameters.length);
        foreach (i; 0U .. src.deleted_parameters.length)
        {
            rcl_interfaces.msg.ParameterDescriptor.convert(src.deleted_parameters[i],
                    dst.deleted_parameters.data[i]);
        }
    }

    static void convert(in ParameterEventDescriptors.CType src, ref ParameterEventDescriptors dst)
    {
        dst.new_parameters.length = src.new_parameters.size;
        foreach (i; 0U .. dst.new_parameters.length)
        {
            rcl_interfaces.msg.ParameterDescriptor.convert(src.new_parameters.data[i],
                    dst.new_parameters[i]);
        }
        dst.changed_parameters.length = src.changed_parameters.size;
        foreach (i; 0U .. dst.changed_parameters.length)
        {
            rcl_interfaces.msg.ParameterDescriptor.convert(src.changed_parameters.data[i],
                    dst.changed_parameters[i]);
        }
        dst.deleted_parameters.length = src.deleted_parameters.size;
        foreach (i; 0U .. dst.deleted_parameters.length)
        {
            rcl_interfaces.msg.ParameterDescriptor.convert(src.deleted_parameters.data[i],
                    dst.deleted_parameters[i]);
        }
    }
}

struct FloatingPointRange
{
    double from_value;
    double to_value;
    double step;

    alias CType = rcl_interfaces__msg__FloatingPointRange;
    alias CArrayType = rcl_interfaces__msg__FloatingPointRange__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__FloatingPointRange();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__FloatingPointRange__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__FloatingPointRange__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__FloatingPointRange__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__FloatingPointRange__Sequence__destroy(array);
        array = null;
    }

    static void convert(in FloatingPointRange src, ref FloatingPointRange.CType dst)
    {
        dst.from_value = src.from_value;
        dst.to_value = src.to_value;
        dst.step = src.step;
    }

    static void convert(in FloatingPointRange.CType src, ref FloatingPointRange dst)
    {
        dst.from_value = src.from_value;
        dst.to_value = src.to_value;
        dst.step = src.step;
    }
}

struct ListParametersResult
{
    string[] names;
    string[] prefixes;

    alias CType = rcl_interfaces__msg__ListParametersResult;
    alias CArrayType = rcl_interfaces__msg__ListParametersResult__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__ListParametersResult();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__ListParametersResult__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__ListParametersResult__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__ListParametersResult__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__ListParametersResult__Sequence__destroy(array);
        array = null;
    }

    static void convert(in ListParametersResult src, ref ListParametersResult.CType dst)
    {
        rosidl_runtime_c__String__Sequence__init(&dst.names, src.names.length);
        foreach (i; 0U .. src.names.length)
        {
            rosidl_runtime_c__String__assign(&dst.names.data[i], toStringz(src.names[i]));
        }
        rosidl_runtime_c__String__Sequence__init(&dst.prefixes, src.prefixes.length);
        foreach (i; 0U .. src.prefixes.length)
        {
            rosidl_runtime_c__String__assign(&dst.prefixes.data[i], toStringz(src.prefixes[i]));
        }
    }

    static void convert(in ListParametersResult.CType src, ref ListParametersResult dst)
    {
        dst.names.length = src.names.size;
        foreach (i; 0U .. dst.names.length)
        {
            dst.names[i] = fromStringz(src.names.data[i].data).dup();
        }
        dst.prefixes.length = src.prefixes.size;
        foreach (i; 0U .. dst.prefixes.length)
        {
            dst.prefixes[i] = fromStringz(src.prefixes.data[i].data).dup();
        }
    }
}

struct ParameterValue
{
    ubyte type;
    bool bool_value;
    long integer_value;
    double double_value;
    string string_value;
    byte[] byte_array_value;
    bool[] bool_array_value;
    long[] integer_array_value;
    double[] double_array_value;
    string[] string_array_value;

    alias CType = rcl_interfaces__msg__ParameterValue;
    alias CArrayType = rcl_interfaces__msg__ParameterValue__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__ParameterValue();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterValue__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterValue__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterValue__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterValue__Sequence__destroy(array);
        array = null;
    }

    static void convert(in ParameterValue src, ref ParameterValue.CType dst)
    {
        dst.type = src.type;
        dst.bool_value = src.bool_value;
        dst.integer_value = src.integer_value;
        dst.double_value = src.double_value;
        rosidl_runtime_c__String__assign(&dst.string_value, toStringz(src.string_value));
        rosidl_runtime_c__octet__Sequence__init(&dst.byte_array_value, src.byte_array_value.length);
        foreach (i; 0U .. src.byte_array_value.length)
        {
            dst.byte_array_value.data[i] = src.byte_array_value[i];
        }
        rosidl_runtime_c__bool__Sequence__init(&dst.bool_array_value, src.bool_array_value.length);
        foreach (i; 0U .. src.bool_array_value.length)
        {
            dst.bool_array_value.data[i] = src.bool_array_value[i];
        }
        rosidl_runtime_c__int64__Sequence__init(&dst.integer_array_value,
                src.integer_array_value.length);
        foreach (i; 0U .. src.integer_array_value.length)
        {
            dst.integer_array_value.data[i] = src.integer_array_value[i];
        }
        rosidl_runtime_c__double__Sequence__init(&dst.double_array_value,
                src.double_array_value.length);
        foreach (i; 0U .. src.double_array_value.length)
        {
            dst.double_array_value.data[i] = src.double_array_value[i];
        }
        rosidl_runtime_c__String__Sequence__init(&dst.string_array_value,
                src.string_array_value.length);
        foreach (i; 0U .. src.string_array_value.length)
        {
            rosidl_runtime_c__String__assign(&dst.string_array_value.data[i],
                    toStringz(src.string_array_value[i]));
        }
    }

    static void convert(in ParameterValue.CType src, ref ParameterValue dst)
    {
        dst.type = src.type;
        dst.bool_value = src.bool_value;
        dst.integer_value = src.integer_value;
        dst.double_value = src.double_value;
        dst.string_value = fromStringz(src.string_value.data).dup();
        dst.byte_array_value.length = src.byte_array_value.size;
        foreach (i; 0U .. dst.byte_array_value.length)
        {
            dst.byte_array_value[i] = src.byte_array_value.data[i];
        }
        dst.bool_array_value.length = src.bool_array_value.size;
        foreach (i; 0U .. dst.bool_array_value.length)
        {
            dst.bool_array_value[i] = src.bool_array_value.data[i];
        }
        dst.integer_array_value.length = src.integer_array_value.size;
        foreach (i; 0U .. dst.integer_array_value.length)
        {
            dst.integer_array_value[i] = src.integer_array_value.data[i];
        }
        dst.double_array_value.length = src.double_array_value.size;
        foreach (i; 0U .. dst.double_array_value.length)
        {
            dst.double_array_value[i] = src.double_array_value.data[i];
        }
        dst.string_array_value.length = src.string_array_value.size;
        foreach (i; 0U .. dst.string_array_value.length)
        {
            dst.string_array_value[i] = fromStringz(src.string_array_value.data[i].data).dup();
        }
    }
}

struct Parameter
{
    string name;
    rcl_interfaces.msg.ParameterValue value;

    alias CType = rcl_interfaces__msg__Parameter;
    alias CArrayType = rcl_interfaces__msg__Parameter__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__Parameter();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__Parameter__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__Parameter__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__Parameter__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__Parameter__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Parameter src, ref Parameter.CType dst)
    {
        rosidl_runtime_c__String__assign(&dst.name, toStringz(src.name));
        rcl_interfaces.msg.ParameterValue.convert(src.value, dst.value);
    }

    static void convert(in Parameter.CType src, ref Parameter dst)
    {
        dst.name = fromStringz(src.name.data).dup();
        rcl_interfaces.msg.ParameterValue.convert(src.value, dst.value);
    }
}

struct SetParametersResult
{
    bool successful;
    string reason;

    alias CType = rcl_interfaces__msg__SetParametersResult;
    alias CArrayType = rcl_interfaces__msg__SetParametersResult__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__SetParametersResult();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__SetParametersResult__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__SetParametersResult__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__SetParametersResult__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__SetParametersResult__Sequence__destroy(array);
        array = null;
    }

    static void convert(in SetParametersResult src, ref SetParametersResult.CType dst)
    {
        dst.successful = src.successful;
        rosidl_runtime_c__String__assign(&dst.reason, toStringz(src.reason));
    }

    static void convert(in SetParametersResult.CType src, ref SetParametersResult dst)
    {
        dst.successful = src.successful;
        dst.reason = fromStringz(src.reason.data).dup();
    }
}

struct ParameterType
{
    ubyte structure_needs_at_least_one_member;

    alias CType = rcl_interfaces__msg__ParameterType;
    alias CArrayType = rcl_interfaces__msg__ParameterType__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__ParameterType();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterType__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterType__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterType__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterType__Sequence__destroy(array);
        array = null;
    }

    static void convert(in ParameterType src, ref ParameterType.CType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }

    static void convert(in ParameterType.CType src, ref ParameterType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }
}

struct ParameterEvent
{
    builtin_interfaces.msg.Time stamp;
    string node;
    rcl_interfaces.msg.Parameter[] new_parameters;
    rcl_interfaces.msg.Parameter[] changed_parameters;
    rcl_interfaces.msg.Parameter[] deleted_parameters;

    alias CType = rcl_interfaces__msg__ParameterEvent;
    alias CArrayType = rcl_interfaces__msg__ParameterEvent__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__ParameterEvent();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterEvent__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterEvent__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterEvent__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterEvent__Sequence__destroy(array);
        array = null;
    }

    static void convert(in ParameterEvent src, ref ParameterEvent.CType dst)
    {
        builtin_interfaces.msg.Time.convert(src.stamp, dst.stamp);
        rosidl_runtime_c__String__assign(&dst.node, toStringz(src.node));
        rcl_interfaces__msg__Parameter__Sequence__init(&dst.new_parameters,
                src.new_parameters.length);
        foreach (i; 0U .. src.new_parameters.length)
        {
            rcl_interfaces.msg.Parameter.convert(src.new_parameters[i], dst.new_parameters.data[i]);
        }
        rcl_interfaces__msg__Parameter__Sequence__init(&dst.changed_parameters,
                src.changed_parameters.length);
        foreach (i; 0U .. src.changed_parameters.length)
        {
            rcl_interfaces.msg.Parameter.convert(src.changed_parameters[i],
                    dst.changed_parameters.data[i]);
        }
        rcl_interfaces__msg__Parameter__Sequence__init(&dst.deleted_parameters,
                src.deleted_parameters.length);
        foreach (i; 0U .. src.deleted_parameters.length)
        {
            rcl_interfaces.msg.Parameter.convert(src.deleted_parameters[i],
                    dst.deleted_parameters.data[i]);
        }
    }

    static void convert(in ParameterEvent.CType src, ref ParameterEvent dst)
    {
        builtin_interfaces.msg.Time.convert(src.stamp, dst.stamp);
        dst.node = fromStringz(src.node.data).dup();
        dst.new_parameters.length = src.new_parameters.size;
        foreach (i; 0U .. dst.new_parameters.length)
        {
            rcl_interfaces.msg.Parameter.convert(src.new_parameters.data[i], dst.new_parameters[i]);
        }
        dst.changed_parameters.length = src.changed_parameters.size;
        foreach (i; 0U .. dst.changed_parameters.length)
        {
            rcl_interfaces.msg.Parameter.convert(src.changed_parameters.data[i],
                    dst.changed_parameters[i]);
        }
        dst.deleted_parameters.length = src.deleted_parameters.size;
        foreach (i; 0U .. dst.deleted_parameters.length)
        {
            rcl_interfaces.msg.Parameter.convert(src.deleted_parameters.data[i],
                    dst.deleted_parameters[i]);
        }
    }
}

struct ParameterDescriptor
{
    string name;
    ubyte type;
    string description;
    string additional_constraints;
    bool read_only = false;
    bool dynamic_typing = false;
    rcl_interfaces.msg.FloatingPointRange[] floating_point_range;
    rcl_interfaces.msg.IntegerRange[] integer_range;

    alias CType = rcl_interfaces__msg__ParameterDescriptor;
    alias CArrayType = rcl_interfaces__msg__ParameterDescriptor__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__ParameterDescriptor();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterDescriptor__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterDescriptor__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__ParameterDescriptor__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__ParameterDescriptor__Sequence__destroy(array);
        array = null;
    }

    static void convert(in ParameterDescriptor src, ref ParameterDescriptor.CType dst)
    {
        rosidl_runtime_c__String__assign(&dst.name, toStringz(src.name));
        dst.type = src.type;
        rosidl_runtime_c__String__assign(&dst.description, toStringz(src.description));
        rosidl_runtime_c__String__assign(&dst.additional_constraints,
                toStringz(src.additional_constraints));
        dst.read_only = src.read_only;
        dst.dynamic_typing = src.dynamic_typing;
        rcl_interfaces__msg__FloatingPointRange__Sequence__init(&dst.floating_point_range,
                src.floating_point_range.length);
        foreach (i; 0U .. src.floating_point_range.length)
        {
            rcl_interfaces.msg.FloatingPointRange.convert(src.floating_point_range[i],
                    dst.floating_point_range.data[i]);
        }
        rcl_interfaces__msg__IntegerRange__Sequence__init(&dst.integer_range,
                src.integer_range.length);
        foreach (i; 0U .. src.integer_range.length)
        {
            rcl_interfaces.msg.IntegerRange.convert(src.integer_range[i],
                    dst.integer_range.data[i]);
        }
    }

    static void convert(in ParameterDescriptor.CType src, ref ParameterDescriptor dst)
    {
        dst.name = fromStringz(src.name.data).dup();
        dst.type = src.type;
        dst.description = fromStringz(src.description.data).dup();
        dst.additional_constraints = fromStringz(src.additional_constraints.data).dup();
        dst.read_only = src.read_only;
        dst.dynamic_typing = src.dynamic_typing;
        dst.floating_point_range.length = src.floating_point_range.size;
        foreach (i; 0U .. dst.floating_point_range.length)
        {
            rcl_interfaces.msg.FloatingPointRange.convert(src.floating_point_range.data[i],
                    dst.floating_point_range[i]);
        }
        dst.integer_range.length = src.integer_range.size;
        foreach (i; 0U .. dst.integer_range.length)
        {
            rcl_interfaces.msg.IntegerRange.convert(src.integer_range.data[i],
                    dst.integer_range[i]);
        }
    }
}

struct IntegerRange
{
    long from_value;
    long to_value;
    ulong step;

    alias CType = rcl_interfaces__msg__IntegerRange;
    alias CArrayType = rcl_interfaces__msg__IntegerRange__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__IntegerRange();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__IntegerRange__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__IntegerRange__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__IntegerRange__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__IntegerRange__Sequence__destroy(array);
        array = null;
    }

    static void convert(in IntegerRange src, ref IntegerRange.CType dst)
    {
        dst.from_value = src.from_value;
        dst.to_value = src.to_value;
        dst.step = src.step;
    }

    static void convert(in IntegerRange.CType src, ref IntegerRange dst)
    {
        dst.from_value = src.from_value;
        dst.to_value = src.to_value;
        dst.step = src.step;
    }
}

struct Log
{
    builtin_interfaces.msg.Time stamp;
    ubyte level;
    string name;
    string msg;
    string file;
    string function_;
    uint line;

    alias CType = rcl_interfaces__msg__Log;
    alias CArrayType = rcl_interfaces__msg__Log__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rcl_interfaces__msg__Log();
    }

    static CType* createC() @nogc nothrow
    {
        return rcl_interfaces__msg__Log__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rcl_interfaces__msg__Log__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rcl_interfaces__msg__Log__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rcl_interfaces__msg__Log__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Log src, ref Log.CType dst)
    {
        builtin_interfaces.msg.Time.convert(src.stamp, dst.stamp);
        dst.level = src.level;
        rosidl_runtime_c__String__assign(&dst.name, toStringz(src.name));
        rosidl_runtime_c__String__assign(&dst.msg, toStringz(src.msg));
        rosidl_runtime_c__String__assign(&dst.file, toStringz(src.file));
        rosidl_runtime_c__String__assign(&dst.function_, toStringz(src.function_));
        dst.line = src.line;
    }

    static void convert(in Log.CType src, ref Log dst)
    {
        builtin_interfaces.msg.Time.convert(src.stamp, dst.stamp);
        dst.level = src.level;
        dst.name = fromStringz(src.name.data).dup();
        dst.msg = fromStringz(src.msg.data).dup();
        dst.file = fromStringz(src.file.data).dup();
        dst.function_ = fromStringz(src.function_.data).dup();
        dst.line = src.line;
    }
}
