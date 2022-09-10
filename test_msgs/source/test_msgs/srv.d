module test_msgs.srv;

import std.string;
import std.utf;
import rcl;
import test_msgs.c.srv;
import test_msgs.msg;


struct Arrays
{
    alias Request = Arrays_Request;
    alias Response = Arrays_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__test_msgs__srv__Arrays();
    }
}

struct BasicTypes
{
    alias Request = BasicTypes_Request;
    alias Response = BasicTypes_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__test_msgs__srv__BasicTypes();
    }
}

struct Empty
{
    alias Request = Empty_Request;
    alias Response = Empty_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__test_msgs__srv__Empty();
    }
}


struct Arrays_Request
{
    bool[3] bool_values;
    ubyte[3] byte_values;
    ubyte[3] char_values;
    float[3] float32_values;
    double[3] float64_values;
    byte[3] int8_values;
    ubyte[3] uint8_values;
    short[3] int16_values;
    ushort[3] uint16_values;
    int[3] int32_values;
    uint[3] uint32_values;
    long[3] int64_values;
    ulong[3] uint64_values;
    string[3] string_values;
    test_msgs.msg.BasicTypes[3] basic_types_values;
    test_msgs.msg.Constants[3] constants_values;
    test_msgs.msg.Defaults[3] defaults_values;
    bool[3] bool_values_default = [false, true, false];
    ubyte[3] byte_values_default = [0, 1, 255];
    ubyte[3] char_values_default = [0, 1, 127];
    float[3] float32_values_default = [1.125, 0.0, -1.125];
    double[3] float64_values_default = [3.1415, 0.0, -3.1415];
    byte[3] int8_values_default = [0, 127, -128];
    ubyte[3] uint8_values_default = [0, 1, 255];
    short[3] int16_values_default = [0, 32767, -32768];
    ushort[3] uint16_values_default = [0, 1, 65535];
    int[3] int32_values_default = [0, 2147483647, -2147483648];
    uint[3] uint32_values_default = [0, 1, 4294967295];
    long[3] int64_values_default = [0, 9223372036854775807, -9223372036854775808];
    ulong[3] uint64_values_default = [0, 1, 18446744073709551615];
    string[3] string_values_default = ["", "max value", "min value"];


    alias CType = test_msgs__srv__Arrays_Request;
    alias CArrayType = test_msgs__srv__Arrays_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__Arrays_Request();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__srv__Arrays_Request__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__srv__Arrays_Request__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__srv__Arrays_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__srv__Arrays_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Arrays_Request src, ref Arrays_Request.CType dst)
    {
        foreach(i;0U..src.bool_values.length) { dst.bool_values[i] = src.bool_values[i]; }
        foreach(i;0U..src.byte_values.length) { dst.byte_values[i] = src.byte_values[i]; }
        foreach(i;0U..src.char_values.length) { dst.char_values[i] = src.char_values[i]; }
        foreach(i;0U..src.float32_values.length) { dst.float32_values[i] = src.float32_values[i]; }
        foreach(i;0U..src.float64_values.length) { dst.float64_values[i] = src.float64_values[i]; }
        foreach(i;0U..src.int8_values.length) { dst.int8_values[i] = src.int8_values[i]; }
        foreach(i;0U..src.uint8_values.length) { dst.uint8_values[i] = src.uint8_values[i]; }
        foreach(i;0U..src.int16_values.length) { dst.int16_values[i] = src.int16_values[i]; }
        foreach(i;0U..src.uint16_values.length) { dst.uint16_values[i] = src.uint16_values[i]; }
        foreach(i;0U..src.int32_values.length) { dst.int32_values[i] = src.int32_values[i]; }
        foreach(i;0U..src.uint32_values.length) { dst.uint32_values[i] = src.uint32_values[i]; }
        foreach(i;0U..src.int64_values.length) { dst.int64_values[i] = src.int64_values[i]; }
        foreach(i;0U..src.uint64_values.length) { dst.uint64_values[i] = src.uint64_values[i]; }
        foreach(i;0U..src.string_values.length) { rosidl_runtime_c__String__assign(&dst.string_values[i], toStringz(src.string_values[i])); }
        foreach(i;0U..src.basic_types_values.length) { test_msgs.msg.BasicTypes.convert(src.basic_types_values[i], dst.basic_types_values[i]); }
        foreach(i;0U..src.constants_values.length) { test_msgs.msg.Constants.convert(src.constants_values[i], dst.constants_values[i]); }
        foreach(i;0U..src.defaults_values.length) { test_msgs.msg.Defaults.convert(src.defaults_values[i], dst.defaults_values[i]); }
        foreach(i;0U..src.bool_values_default.length) { dst.bool_values_default[i] = src.bool_values_default[i]; }
        foreach(i;0U..src.byte_values_default.length) { dst.byte_values_default[i] = src.byte_values_default[i]; }
        foreach(i;0U..src.char_values_default.length) { dst.char_values_default[i] = src.char_values_default[i]; }
        foreach(i;0U..src.float32_values_default.length) { dst.float32_values_default[i] = src.float32_values_default[i]; }
        foreach(i;0U..src.float64_values_default.length) { dst.float64_values_default[i] = src.float64_values_default[i]; }
        foreach(i;0U..src.int8_values_default.length) { dst.int8_values_default[i] = src.int8_values_default[i]; }
        foreach(i;0U..src.uint8_values_default.length) { dst.uint8_values_default[i] = src.uint8_values_default[i]; }
        foreach(i;0U..src.int16_values_default.length) { dst.int16_values_default[i] = src.int16_values_default[i]; }
        foreach(i;0U..src.uint16_values_default.length) { dst.uint16_values_default[i] = src.uint16_values_default[i]; }
        foreach(i;0U..src.int32_values_default.length) { dst.int32_values_default[i] = src.int32_values_default[i]; }
        foreach(i;0U..src.uint32_values_default.length) { dst.uint32_values_default[i] = src.uint32_values_default[i]; }
        foreach(i;0U..src.int64_values_default.length) { dst.int64_values_default[i] = src.int64_values_default[i]; }
        foreach(i;0U..src.uint64_values_default.length) { dst.uint64_values_default[i] = src.uint64_values_default[i]; }
        foreach(i;0U..src.string_values_default.length) { rosidl_runtime_c__String__assign(&dst.string_values_default[i], toStringz(src.string_values_default[i])); }
    }

    static void convert(in Arrays_Request.CType src, ref Arrays_Request dst)
    {
        foreach(i;0U..dst.bool_values.length) { dst.bool_values[i] = src.bool_values[i]; }
        foreach(i;0U..dst.byte_values.length) { dst.byte_values[i] = src.byte_values[i]; }
        foreach(i;0U..dst.char_values.length) { dst.char_values[i] = src.char_values[i]; }
        foreach(i;0U..dst.float32_values.length) { dst.float32_values[i] = src.float32_values[i]; }
        foreach(i;0U..dst.float64_values.length) { dst.float64_values[i] = src.float64_values[i]; }
        foreach(i;0U..dst.int8_values.length) { dst.int8_values[i] = src.int8_values[i]; }
        foreach(i;0U..dst.uint8_values.length) { dst.uint8_values[i] = src.uint8_values[i]; }
        foreach(i;0U..dst.int16_values.length) { dst.int16_values[i] = src.int16_values[i]; }
        foreach(i;0U..dst.uint16_values.length) { dst.uint16_values[i] = src.uint16_values[i]; }
        foreach(i;0U..dst.int32_values.length) { dst.int32_values[i] = src.int32_values[i]; }
        foreach(i;0U..dst.uint32_values.length) { dst.uint32_values[i] = src.uint32_values[i]; }
        foreach(i;0U..dst.int64_values.length) { dst.int64_values[i] = src.int64_values[i]; }
        foreach(i;0U..dst.uint64_values.length) { dst.uint64_values[i] = src.uint64_values[i]; }
        foreach(i;0U..dst.string_values.length) { dst.string_values[i] = fromStringz(src.string_values[i].data).dup(); }
        foreach(i;0U..dst.basic_types_values.length) { test_msgs.msg.BasicTypes.convert(src.basic_types_values[i], dst.basic_types_values[i]); }
        foreach(i;0U..dst.constants_values.length) { test_msgs.msg.Constants.convert(src.constants_values[i], dst.constants_values[i]); }
        foreach(i;0U..dst.defaults_values.length) { test_msgs.msg.Defaults.convert(src.defaults_values[i], dst.defaults_values[i]); }
        foreach(i;0U..dst.bool_values_default.length) { dst.bool_values_default[i] = src.bool_values_default[i]; }
        foreach(i;0U..dst.byte_values_default.length) { dst.byte_values_default[i] = src.byte_values_default[i]; }
        foreach(i;0U..dst.char_values_default.length) { dst.char_values_default[i] = src.char_values_default[i]; }
        foreach(i;0U..dst.float32_values_default.length) { dst.float32_values_default[i] = src.float32_values_default[i]; }
        foreach(i;0U..dst.float64_values_default.length) { dst.float64_values_default[i] = src.float64_values_default[i]; }
        foreach(i;0U..dst.int8_values_default.length) { dst.int8_values_default[i] = src.int8_values_default[i]; }
        foreach(i;0U..dst.uint8_values_default.length) { dst.uint8_values_default[i] = src.uint8_values_default[i]; }
        foreach(i;0U..dst.int16_values_default.length) { dst.int16_values_default[i] = src.int16_values_default[i]; }
        foreach(i;0U..dst.uint16_values_default.length) { dst.uint16_values_default[i] = src.uint16_values_default[i]; }
        foreach(i;0U..dst.int32_values_default.length) { dst.int32_values_default[i] = src.int32_values_default[i]; }
        foreach(i;0U..dst.uint32_values_default.length) { dst.uint32_values_default[i] = src.uint32_values_default[i]; }
        foreach(i;0U..dst.int64_values_default.length) { dst.int64_values_default[i] = src.int64_values_default[i]; }
        foreach(i;0U..dst.uint64_values_default.length) { dst.uint64_values_default[i] = src.uint64_values_default[i]; }
        foreach(i;0U..dst.string_values_default.length) { dst.string_values_default[i] = fromStringz(src.string_values_default[i].data).dup(); }
    }
}

struct Arrays_Response
{
    bool[3] bool_values;
    ubyte[3] byte_values;
    ubyte[3] char_values;
    float[3] float32_values;
    double[3] float64_values;
    byte[3] int8_values;
    ubyte[3] uint8_values;
    short[3] int16_values;
    ushort[3] uint16_values;
    int[3] int32_values;
    uint[3] uint32_values;
    long[3] int64_values;
    ulong[3] uint64_values;
    string[3] string_values;
    test_msgs.msg.BasicTypes[3] basic_types_values;
    test_msgs.msg.Constants[3] constants_values;
    test_msgs.msg.Defaults[3] defaults_values;
    bool[3] bool_values_default = [false, true, false];
    ubyte[3] byte_values_default = [0, 1, 255];
    ubyte[3] char_values_default = [0, 1, 127];
    float[3] float32_values_default = [1.125, 0.0, -1.125];
    double[3] float64_values_default = [3.1415, 0.0, -3.1415];
    byte[3] int8_values_default = [0, 127, -128];
    ubyte[3] uint8_values_default = [0, 1, 255];
    short[3] int16_values_default = [0, 32767, -32768];
    ushort[3] uint16_values_default = [0, 1, 65535];
    int[3] int32_values_default = [0, 2147483647, -2147483648];
    uint[3] uint32_values_default = [0, 1, 4294967295];
    long[3] int64_values_default = [0, 9223372036854775807, -9223372036854775808];
    ulong[3] uint64_values_default = [0, 1, 18446744073709551615];
    string[3] string_values_default = ["", "max value", "min value"];


    alias CType = test_msgs__srv__Arrays_Response;
    alias CArrayType = test_msgs__srv__Arrays_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__Arrays_Response();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__srv__Arrays_Response__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__srv__Arrays_Response__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__srv__Arrays_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__srv__Arrays_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Arrays_Response src, ref Arrays_Response.CType dst)
    {
        foreach(i;0U..src.bool_values.length) { dst.bool_values[i] = src.bool_values[i]; }
        foreach(i;0U..src.byte_values.length) { dst.byte_values[i] = src.byte_values[i]; }
        foreach(i;0U..src.char_values.length) { dst.char_values[i] = src.char_values[i]; }
        foreach(i;0U..src.float32_values.length) { dst.float32_values[i] = src.float32_values[i]; }
        foreach(i;0U..src.float64_values.length) { dst.float64_values[i] = src.float64_values[i]; }
        foreach(i;0U..src.int8_values.length) { dst.int8_values[i] = src.int8_values[i]; }
        foreach(i;0U..src.uint8_values.length) { dst.uint8_values[i] = src.uint8_values[i]; }
        foreach(i;0U..src.int16_values.length) { dst.int16_values[i] = src.int16_values[i]; }
        foreach(i;0U..src.uint16_values.length) { dst.uint16_values[i] = src.uint16_values[i]; }
        foreach(i;0U..src.int32_values.length) { dst.int32_values[i] = src.int32_values[i]; }
        foreach(i;0U..src.uint32_values.length) { dst.uint32_values[i] = src.uint32_values[i]; }
        foreach(i;0U..src.int64_values.length) { dst.int64_values[i] = src.int64_values[i]; }
        foreach(i;0U..src.uint64_values.length) { dst.uint64_values[i] = src.uint64_values[i]; }
        foreach(i;0U..src.string_values.length) { rosidl_runtime_c__String__assign(&dst.string_values[i], toStringz(src.string_values[i])); }
        foreach(i;0U..src.basic_types_values.length) { test_msgs.msg.BasicTypes.convert(src.basic_types_values[i], dst.basic_types_values[i]); }
        foreach(i;0U..src.constants_values.length) { test_msgs.msg.Constants.convert(src.constants_values[i], dst.constants_values[i]); }
        foreach(i;0U..src.defaults_values.length) { test_msgs.msg.Defaults.convert(src.defaults_values[i], dst.defaults_values[i]); }
        foreach(i;0U..src.bool_values_default.length) { dst.bool_values_default[i] = src.bool_values_default[i]; }
        foreach(i;0U..src.byte_values_default.length) { dst.byte_values_default[i] = src.byte_values_default[i]; }
        foreach(i;0U..src.char_values_default.length) { dst.char_values_default[i] = src.char_values_default[i]; }
        foreach(i;0U..src.float32_values_default.length) { dst.float32_values_default[i] = src.float32_values_default[i]; }
        foreach(i;0U..src.float64_values_default.length) { dst.float64_values_default[i] = src.float64_values_default[i]; }
        foreach(i;0U..src.int8_values_default.length) { dst.int8_values_default[i] = src.int8_values_default[i]; }
        foreach(i;0U..src.uint8_values_default.length) { dst.uint8_values_default[i] = src.uint8_values_default[i]; }
        foreach(i;0U..src.int16_values_default.length) { dst.int16_values_default[i] = src.int16_values_default[i]; }
        foreach(i;0U..src.uint16_values_default.length) { dst.uint16_values_default[i] = src.uint16_values_default[i]; }
        foreach(i;0U..src.int32_values_default.length) { dst.int32_values_default[i] = src.int32_values_default[i]; }
        foreach(i;0U..src.uint32_values_default.length) { dst.uint32_values_default[i] = src.uint32_values_default[i]; }
        foreach(i;0U..src.int64_values_default.length) { dst.int64_values_default[i] = src.int64_values_default[i]; }
        foreach(i;0U..src.uint64_values_default.length) { dst.uint64_values_default[i] = src.uint64_values_default[i]; }
        foreach(i;0U..src.string_values_default.length) { rosidl_runtime_c__String__assign(&dst.string_values_default[i], toStringz(src.string_values_default[i])); }
    }

    static void convert(in Arrays_Response.CType src, ref Arrays_Response dst)
    {
        foreach(i;0U..dst.bool_values.length) { dst.bool_values[i] = src.bool_values[i]; }
        foreach(i;0U..dst.byte_values.length) { dst.byte_values[i] = src.byte_values[i]; }
        foreach(i;0U..dst.char_values.length) { dst.char_values[i] = src.char_values[i]; }
        foreach(i;0U..dst.float32_values.length) { dst.float32_values[i] = src.float32_values[i]; }
        foreach(i;0U..dst.float64_values.length) { dst.float64_values[i] = src.float64_values[i]; }
        foreach(i;0U..dst.int8_values.length) { dst.int8_values[i] = src.int8_values[i]; }
        foreach(i;0U..dst.uint8_values.length) { dst.uint8_values[i] = src.uint8_values[i]; }
        foreach(i;0U..dst.int16_values.length) { dst.int16_values[i] = src.int16_values[i]; }
        foreach(i;0U..dst.uint16_values.length) { dst.uint16_values[i] = src.uint16_values[i]; }
        foreach(i;0U..dst.int32_values.length) { dst.int32_values[i] = src.int32_values[i]; }
        foreach(i;0U..dst.uint32_values.length) { dst.uint32_values[i] = src.uint32_values[i]; }
        foreach(i;0U..dst.int64_values.length) { dst.int64_values[i] = src.int64_values[i]; }
        foreach(i;0U..dst.uint64_values.length) { dst.uint64_values[i] = src.uint64_values[i]; }
        foreach(i;0U..dst.string_values.length) { dst.string_values[i] = fromStringz(src.string_values[i].data).dup(); }
        foreach(i;0U..dst.basic_types_values.length) { test_msgs.msg.BasicTypes.convert(src.basic_types_values[i], dst.basic_types_values[i]); }
        foreach(i;0U..dst.constants_values.length) { test_msgs.msg.Constants.convert(src.constants_values[i], dst.constants_values[i]); }
        foreach(i;0U..dst.defaults_values.length) { test_msgs.msg.Defaults.convert(src.defaults_values[i], dst.defaults_values[i]); }
        foreach(i;0U..dst.bool_values_default.length) { dst.bool_values_default[i] = src.bool_values_default[i]; }
        foreach(i;0U..dst.byte_values_default.length) { dst.byte_values_default[i] = src.byte_values_default[i]; }
        foreach(i;0U..dst.char_values_default.length) { dst.char_values_default[i] = src.char_values_default[i]; }
        foreach(i;0U..dst.float32_values_default.length) { dst.float32_values_default[i] = src.float32_values_default[i]; }
        foreach(i;0U..dst.float64_values_default.length) { dst.float64_values_default[i] = src.float64_values_default[i]; }
        foreach(i;0U..dst.int8_values_default.length) { dst.int8_values_default[i] = src.int8_values_default[i]; }
        foreach(i;0U..dst.uint8_values_default.length) { dst.uint8_values_default[i] = src.uint8_values_default[i]; }
        foreach(i;0U..dst.int16_values_default.length) { dst.int16_values_default[i] = src.int16_values_default[i]; }
        foreach(i;0U..dst.uint16_values_default.length) { dst.uint16_values_default[i] = src.uint16_values_default[i]; }
        foreach(i;0U..dst.int32_values_default.length) { dst.int32_values_default[i] = src.int32_values_default[i]; }
        foreach(i;0U..dst.uint32_values_default.length) { dst.uint32_values_default[i] = src.uint32_values_default[i]; }
        foreach(i;0U..dst.int64_values_default.length) { dst.int64_values_default[i] = src.int64_values_default[i]; }
        foreach(i;0U..dst.uint64_values_default.length) { dst.uint64_values_default[i] = src.uint64_values_default[i]; }
        foreach(i;0U..dst.string_values_default.length) { dst.string_values_default[i] = fromStringz(src.string_values_default[i].data).dup(); }
    }
}

struct BasicTypes_Request
{
    bool bool_value;
    ubyte byte_value;
    ubyte char_value;
    float float32_value;
    double float64_value;
    byte int8_value;
    ubyte uint8_value;
    short int16_value;
    ushort uint16_value;
    int int32_value;
    uint uint32_value;
    long int64_value;
    ulong uint64_value;
    string string_value;


    alias CType = test_msgs__srv__BasicTypes_Request;
    alias CArrayType = test_msgs__srv__BasicTypes_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__BasicTypes_Request();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__srv__BasicTypes_Request__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__srv__BasicTypes_Request__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__srv__BasicTypes_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__srv__BasicTypes_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in BasicTypes_Request src, ref BasicTypes_Request.CType dst)
    {
        dst.bool_value = src.bool_value;
        dst.byte_value = src.byte_value;
        dst.char_value = src.char_value;
        dst.float32_value = src.float32_value;
        dst.float64_value = src.float64_value;
        dst.int8_value = src.int8_value;
        dst.uint8_value = src.uint8_value;
        dst.int16_value = src.int16_value;
        dst.uint16_value = src.uint16_value;
        dst.int32_value = src.int32_value;
        dst.uint32_value = src.uint32_value;
        dst.int64_value = src.int64_value;
        dst.uint64_value = src.uint64_value;
        rosidl_runtime_c__String__assign(&dst.string_value, toStringz(src.string_value));
    }

    static void convert(in BasicTypes_Request.CType src, ref BasicTypes_Request dst)
    {
        dst.bool_value = src.bool_value;
        dst.byte_value = src.byte_value;
        dst.char_value = src.char_value;
        dst.float32_value = src.float32_value;
        dst.float64_value = src.float64_value;
        dst.int8_value = src.int8_value;
        dst.uint8_value = src.uint8_value;
        dst.int16_value = src.int16_value;
        dst.uint16_value = src.uint16_value;
        dst.int32_value = src.int32_value;
        dst.uint32_value = src.uint32_value;
        dst.int64_value = src.int64_value;
        dst.uint64_value = src.uint64_value;
        dst.string_value = fromStringz(src.string_value.data).dup();
    }
}

struct BasicTypes_Response
{
    bool bool_value;
    ubyte byte_value;
    ubyte char_value;
    float float32_value;
    double float64_value;
    byte int8_value;
    ubyte uint8_value;
    short int16_value;
    ushort uint16_value;
    int int32_value;
    uint uint32_value;
    long int64_value;
    ulong uint64_value;
    string string_value;


    alias CType = test_msgs__srv__BasicTypes_Response;
    alias CArrayType = test_msgs__srv__BasicTypes_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__BasicTypes_Response();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__srv__BasicTypes_Response__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__srv__BasicTypes_Response__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__srv__BasicTypes_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__srv__BasicTypes_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in BasicTypes_Response src, ref BasicTypes_Response.CType dst)
    {
        dst.bool_value = src.bool_value;
        dst.byte_value = src.byte_value;
        dst.char_value = src.char_value;
        dst.float32_value = src.float32_value;
        dst.float64_value = src.float64_value;
        dst.int8_value = src.int8_value;
        dst.uint8_value = src.uint8_value;
        dst.int16_value = src.int16_value;
        dst.uint16_value = src.uint16_value;
        dst.int32_value = src.int32_value;
        dst.uint32_value = src.uint32_value;
        dst.int64_value = src.int64_value;
        dst.uint64_value = src.uint64_value;
        rosidl_runtime_c__String__assign(&dst.string_value, toStringz(src.string_value));
    }

    static void convert(in BasicTypes_Response.CType src, ref BasicTypes_Response dst)
    {
        dst.bool_value = src.bool_value;
        dst.byte_value = src.byte_value;
        dst.char_value = src.char_value;
        dst.float32_value = src.float32_value;
        dst.float64_value = src.float64_value;
        dst.int8_value = src.int8_value;
        dst.uint8_value = src.uint8_value;
        dst.int16_value = src.int16_value;
        dst.uint16_value = src.uint16_value;
        dst.int32_value = src.int32_value;
        dst.uint32_value = src.uint32_value;
        dst.int64_value = src.int64_value;
        dst.uint64_value = src.uint64_value;
        dst.string_value = fromStringz(src.string_value.data).dup();
    }
}

struct Empty_Request
{
    ubyte structure_needs_at_least_one_member;


    alias CType = test_msgs__srv__Empty_Request;
    alias CArrayType = test_msgs__srv__Empty_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__Empty_Request();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__srv__Empty_Request__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__srv__Empty_Request__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__srv__Empty_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__srv__Empty_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Empty_Request src, ref Empty_Request.CType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }

    static void convert(in Empty_Request.CType src, ref Empty_Request dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }
}

struct Empty_Response
{
    ubyte structure_needs_at_least_one_member;


    alias CType = test_msgs__srv__Empty_Response;
    alias CArrayType = test_msgs__srv__Empty_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__Empty_Response();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__srv__Empty_Response__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__srv__Empty_Response__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__srv__Empty_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__srv__Empty_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Empty_Response src, ref Empty_Response.CType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }

    static void convert(in Empty_Response.CType src, ref Empty_Response dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }
}


