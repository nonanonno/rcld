module test_msgs.msg;

import std.string;
import std.utf;
import rcl;
import test_msgs.c.msg;



struct Arrays
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
    int alignment_check;


    alias CType = test_msgs__msg__Arrays;
    alias CArrayType = test_msgs__msg__Arrays__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Arrays();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__Arrays__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__Arrays__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__Arrays__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__Arrays__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Arrays src, ref Arrays.CType dst)
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
        dst.alignment_check = src.alignment_check;
    }

    static void convert(in Arrays.CType src, ref Arrays dst)
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
        dst.alignment_check = src.alignment_check;
    }
}

struct BasicTypes
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


    alias CType = test_msgs__msg__BasicTypes;
    alias CArrayType = test_msgs__msg__BasicTypes__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__BasicTypes();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__BasicTypes__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__BasicTypes__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__BasicTypes__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__BasicTypes__Sequence__destroy(array);
        array = null;
    }

    static void convert(in BasicTypes src, ref BasicTypes.CType dst)
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
    }

    static void convert(in BasicTypes.CType src, ref BasicTypes dst)
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
    }
}

struct BoundedSequences
{
    bool[] bool_values;
    ubyte[] byte_values;
    ubyte[] char_values;
    float[] float32_values;
    double[] float64_values;
    byte[] int8_values;
    ubyte[] uint8_values;
    short[] int16_values;
    ushort[] uint16_values;
    int[] int32_values;
    uint[] uint32_values;
    long[] int64_values;
    ulong[] uint64_values;
    string[] string_values;
    test_msgs.msg.BasicTypes[] basic_types_values;
    test_msgs.msg.Constants[] constants_values;
    test_msgs.msg.Defaults[] defaults_values;
    bool[] bool_values_default = [false, true, false];
    ubyte[] byte_values_default = [0, 1, 255];
    ubyte[] char_values_default = [0, 1, 127];
    float[] float32_values_default = [1.125, 0.0, -1.125];
    double[] float64_values_default = [3.1415, 0.0, -3.1415];
    byte[] int8_values_default = [0, 127, -128];
    ubyte[] uint8_values_default = [0, 1, 255];
    short[] int16_values_default = [0, 32767, -32768];
    ushort[] uint16_values_default = [0, 1, 65535];
    int[] int32_values_default = [0, 2147483647, -2147483648];
    uint[] uint32_values_default = [0, 1, 4294967295];
    long[] int64_values_default = [0, 9223372036854775807, -9223372036854775808];
    ulong[] uint64_values_default = [0, 1, 18446744073709551615];
    string[] string_values_default = ["", "max value", "min value"];
    int alignment_check;


    alias CType = test_msgs__msg__BoundedSequences;
    alias CArrayType = test_msgs__msg__BoundedSequences__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__BoundedSequences();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__BoundedSequences__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__BoundedSequences__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__BoundedSequences__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__BoundedSequences__Sequence__destroy(array);
        array = null;
    }

    static void convert(in BoundedSequences src, ref BoundedSequences.CType dst)
    {
        rosidl_runtime_c__bool__Sequence__init(&dst.bool_values, src.bool_values.length); foreach(i;0U..src.bool_values.length) { dst.bool_values.data[i] = src.bool_values[i]; }
        rosidl_runtime_c__octet__Sequence__init(&dst.byte_values, src.byte_values.length); foreach(i;0U..src.byte_values.length) { dst.byte_values.data[i] = src.byte_values[i]; }
        rosidl_runtime_c__uint8__Sequence__init(&dst.char_values, src.char_values.length); foreach(i;0U..src.char_values.length) { dst.char_values.data[i] = src.char_values[i]; }
        rosidl_runtime_c__float__Sequence__init(&dst.float32_values, src.float32_values.length); foreach(i;0U..src.float32_values.length) { dst.float32_values.data[i] = src.float32_values[i]; }
        rosidl_runtime_c__double__Sequence__init(&dst.float64_values, src.float64_values.length); foreach(i;0U..src.float64_values.length) { dst.float64_values.data[i] = src.float64_values[i]; }
        rosidl_runtime_c__int8__Sequence__init(&dst.int8_values, src.int8_values.length); foreach(i;0U..src.int8_values.length) { dst.int8_values.data[i] = src.int8_values[i]; }
        rosidl_runtime_c__uint8__Sequence__init(&dst.uint8_values, src.uint8_values.length); foreach(i;0U..src.uint8_values.length) { dst.uint8_values.data[i] = src.uint8_values[i]; }
        rosidl_runtime_c__int16__Sequence__init(&dst.int16_values, src.int16_values.length); foreach(i;0U..src.int16_values.length) { dst.int16_values.data[i] = src.int16_values[i]; }
        rosidl_runtime_c__uint16__Sequence__init(&dst.uint16_values, src.uint16_values.length); foreach(i;0U..src.uint16_values.length) { dst.uint16_values.data[i] = src.uint16_values[i]; }
        rosidl_runtime_c__int32__Sequence__init(&dst.int32_values, src.int32_values.length); foreach(i;0U..src.int32_values.length) { dst.int32_values.data[i] = src.int32_values[i]; }
        rosidl_runtime_c__uint32__Sequence__init(&dst.uint32_values, src.uint32_values.length); foreach(i;0U..src.uint32_values.length) { dst.uint32_values.data[i] = src.uint32_values[i]; }
        rosidl_runtime_c__int64__Sequence__init(&dst.int64_values, src.int64_values.length); foreach(i;0U..src.int64_values.length) { dst.int64_values.data[i] = src.int64_values[i]; }
        rosidl_runtime_c__uint64__Sequence__init(&dst.uint64_values, src.uint64_values.length); foreach(i;0U..src.uint64_values.length) { dst.uint64_values.data[i] = src.uint64_values[i]; }
        rosidl_runtime_c__String__Sequence__init(&dst.string_values, src.string_values.length); foreach(i;0U..src.string_values.length) { rosidl_runtime_c__String__assign(&dst.string_values.data[i], toStringz(src.string_values[i])); }
        test_msgs__msg__BasicTypes__Sequence__init(&dst.basic_types_values, src.basic_types_values.length); foreach(i;0U..src.basic_types_values.length) { test_msgs.msg.BasicTypes.convert(src.basic_types_values[i], dst.basic_types_values.data[i]); }
        test_msgs__msg__Constants__Sequence__init(&dst.constants_values, src.constants_values.length); foreach(i;0U..src.constants_values.length) { test_msgs.msg.Constants.convert(src.constants_values[i], dst.constants_values.data[i]); }
        test_msgs__msg__Defaults__Sequence__init(&dst.defaults_values, src.defaults_values.length); foreach(i;0U..src.defaults_values.length) { test_msgs.msg.Defaults.convert(src.defaults_values[i], dst.defaults_values.data[i]); }
        rosidl_runtime_c__bool__Sequence__init(&dst.bool_values_default, src.bool_values_default.length); foreach(i;0U..src.bool_values_default.length) { dst.bool_values_default.data[i] = src.bool_values_default[i]; }
        rosidl_runtime_c__octet__Sequence__init(&dst.byte_values_default, src.byte_values_default.length); foreach(i;0U..src.byte_values_default.length) { dst.byte_values_default.data[i] = src.byte_values_default[i]; }
        rosidl_runtime_c__uint8__Sequence__init(&dst.char_values_default, src.char_values_default.length); foreach(i;0U..src.char_values_default.length) { dst.char_values_default.data[i] = src.char_values_default[i]; }
        rosidl_runtime_c__float__Sequence__init(&dst.float32_values_default, src.float32_values_default.length); foreach(i;0U..src.float32_values_default.length) { dst.float32_values_default.data[i] = src.float32_values_default[i]; }
        rosidl_runtime_c__double__Sequence__init(&dst.float64_values_default, src.float64_values_default.length); foreach(i;0U..src.float64_values_default.length) { dst.float64_values_default.data[i] = src.float64_values_default[i]; }
        rosidl_runtime_c__int8__Sequence__init(&dst.int8_values_default, src.int8_values_default.length); foreach(i;0U..src.int8_values_default.length) { dst.int8_values_default.data[i] = src.int8_values_default[i]; }
        rosidl_runtime_c__uint8__Sequence__init(&dst.uint8_values_default, src.uint8_values_default.length); foreach(i;0U..src.uint8_values_default.length) { dst.uint8_values_default.data[i] = src.uint8_values_default[i]; }
        rosidl_runtime_c__int16__Sequence__init(&dst.int16_values_default, src.int16_values_default.length); foreach(i;0U..src.int16_values_default.length) { dst.int16_values_default.data[i] = src.int16_values_default[i]; }
        rosidl_runtime_c__uint16__Sequence__init(&dst.uint16_values_default, src.uint16_values_default.length); foreach(i;0U..src.uint16_values_default.length) { dst.uint16_values_default.data[i] = src.uint16_values_default[i]; }
        rosidl_runtime_c__int32__Sequence__init(&dst.int32_values_default, src.int32_values_default.length); foreach(i;0U..src.int32_values_default.length) { dst.int32_values_default.data[i] = src.int32_values_default[i]; }
        rosidl_runtime_c__uint32__Sequence__init(&dst.uint32_values_default, src.uint32_values_default.length); foreach(i;0U..src.uint32_values_default.length) { dst.uint32_values_default.data[i] = src.uint32_values_default[i]; }
        rosidl_runtime_c__int64__Sequence__init(&dst.int64_values_default, src.int64_values_default.length); foreach(i;0U..src.int64_values_default.length) { dst.int64_values_default.data[i] = src.int64_values_default[i]; }
        rosidl_runtime_c__uint64__Sequence__init(&dst.uint64_values_default, src.uint64_values_default.length); foreach(i;0U..src.uint64_values_default.length) { dst.uint64_values_default.data[i] = src.uint64_values_default[i]; }
        rosidl_runtime_c__String__Sequence__init(&dst.string_values_default, src.string_values_default.length); foreach(i;0U..src.string_values_default.length) { rosidl_runtime_c__String__assign(&dst.string_values_default.data[i], toStringz(src.string_values_default[i])); }
        dst.alignment_check = src.alignment_check;
    }

    static void convert(in BoundedSequences.CType src, ref BoundedSequences dst)
    {
        dst.bool_values.length = src.bool_values.size; foreach(i;0U..dst.bool_values.length) { dst.bool_values[i] = src.bool_values.data[i]; }
        dst.byte_values.length = src.byte_values.size; foreach(i;0U..dst.byte_values.length) { dst.byte_values[i] = src.byte_values.data[i]; }
        dst.char_values.length = src.char_values.size; foreach(i;0U..dst.char_values.length) { dst.char_values[i] = src.char_values.data[i]; }
        dst.float32_values.length = src.float32_values.size; foreach(i;0U..dst.float32_values.length) { dst.float32_values[i] = src.float32_values.data[i]; }
        dst.float64_values.length = src.float64_values.size; foreach(i;0U..dst.float64_values.length) { dst.float64_values[i] = src.float64_values.data[i]; }
        dst.int8_values.length = src.int8_values.size; foreach(i;0U..dst.int8_values.length) { dst.int8_values[i] = src.int8_values.data[i]; }
        dst.uint8_values.length = src.uint8_values.size; foreach(i;0U..dst.uint8_values.length) { dst.uint8_values[i] = src.uint8_values.data[i]; }
        dst.int16_values.length = src.int16_values.size; foreach(i;0U..dst.int16_values.length) { dst.int16_values[i] = src.int16_values.data[i]; }
        dst.uint16_values.length = src.uint16_values.size; foreach(i;0U..dst.uint16_values.length) { dst.uint16_values[i] = src.uint16_values.data[i]; }
        dst.int32_values.length = src.int32_values.size; foreach(i;0U..dst.int32_values.length) { dst.int32_values[i] = src.int32_values.data[i]; }
        dst.uint32_values.length = src.uint32_values.size; foreach(i;0U..dst.uint32_values.length) { dst.uint32_values[i] = src.uint32_values.data[i]; }
        dst.int64_values.length = src.int64_values.size; foreach(i;0U..dst.int64_values.length) { dst.int64_values[i] = src.int64_values.data[i]; }
        dst.uint64_values.length = src.uint64_values.size; foreach(i;0U..dst.uint64_values.length) { dst.uint64_values[i] = src.uint64_values.data[i]; }
        dst.string_values.length = src.string_values.size; foreach(i;0U..dst.string_values.length) { dst.string_values[i] = fromStringz(src.string_values.data[i].data).dup(); }
        dst.basic_types_values.length = src.basic_types_values.size; foreach(i;0U..dst.basic_types_values.length) { test_msgs.msg.BasicTypes.convert(src.basic_types_values.data[i], dst.basic_types_values[i]); }
        dst.constants_values.length = src.constants_values.size; foreach(i;0U..dst.constants_values.length) { test_msgs.msg.Constants.convert(src.constants_values.data[i], dst.constants_values[i]); }
        dst.defaults_values.length = src.defaults_values.size; foreach(i;0U..dst.defaults_values.length) { test_msgs.msg.Defaults.convert(src.defaults_values.data[i], dst.defaults_values[i]); }
        dst.bool_values_default.length = src.bool_values_default.size; foreach(i;0U..dst.bool_values_default.length) { dst.bool_values_default[i] = src.bool_values_default.data[i]; }
        dst.byte_values_default.length = src.byte_values_default.size; foreach(i;0U..dst.byte_values_default.length) { dst.byte_values_default[i] = src.byte_values_default.data[i]; }
        dst.char_values_default.length = src.char_values_default.size; foreach(i;0U..dst.char_values_default.length) { dst.char_values_default[i] = src.char_values_default.data[i]; }
        dst.float32_values_default.length = src.float32_values_default.size; foreach(i;0U..dst.float32_values_default.length) { dst.float32_values_default[i] = src.float32_values_default.data[i]; }
        dst.float64_values_default.length = src.float64_values_default.size; foreach(i;0U..dst.float64_values_default.length) { dst.float64_values_default[i] = src.float64_values_default.data[i]; }
        dst.int8_values_default.length = src.int8_values_default.size; foreach(i;0U..dst.int8_values_default.length) { dst.int8_values_default[i] = src.int8_values_default.data[i]; }
        dst.uint8_values_default.length = src.uint8_values_default.size; foreach(i;0U..dst.uint8_values_default.length) { dst.uint8_values_default[i] = src.uint8_values_default.data[i]; }
        dst.int16_values_default.length = src.int16_values_default.size; foreach(i;0U..dst.int16_values_default.length) { dst.int16_values_default[i] = src.int16_values_default.data[i]; }
        dst.uint16_values_default.length = src.uint16_values_default.size; foreach(i;0U..dst.uint16_values_default.length) { dst.uint16_values_default[i] = src.uint16_values_default.data[i]; }
        dst.int32_values_default.length = src.int32_values_default.size; foreach(i;0U..dst.int32_values_default.length) { dst.int32_values_default[i] = src.int32_values_default.data[i]; }
        dst.uint32_values_default.length = src.uint32_values_default.size; foreach(i;0U..dst.uint32_values_default.length) { dst.uint32_values_default[i] = src.uint32_values_default.data[i]; }
        dst.int64_values_default.length = src.int64_values_default.size; foreach(i;0U..dst.int64_values_default.length) { dst.int64_values_default[i] = src.int64_values_default.data[i]; }
        dst.uint64_values_default.length = src.uint64_values_default.size; foreach(i;0U..dst.uint64_values_default.length) { dst.uint64_values_default[i] = src.uint64_values_default.data[i]; }
        dst.string_values_default.length = src.string_values_default.size; foreach(i;0U..dst.string_values_default.length) { dst.string_values_default[i] = fromStringz(src.string_values_default.data[i].data).dup(); }
        dst.alignment_check = src.alignment_check;
    }
}

struct Empty
{
    ubyte structure_needs_at_least_one_member;


    alias CType = test_msgs__msg__Empty;
    alias CArrayType = test_msgs__msg__Empty__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Empty();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__Empty__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__Empty__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__Empty__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__Empty__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Empty src, ref Empty.CType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }

    static void convert(in Empty.CType src, ref Empty dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }
}

struct WStrings
{
    wstring wstring_value;
    wstring wstring_value_default1 = "Hello world!";
    wstring wstring_value_default2 = "Hellö wörld!";
    wstring wstring_value_default3 = "ハローワールド";
    wstring[3] array_of_wstrings;
    wstring[] bounded_sequence_of_wstrings;
    wstring[] unbounded_sequence_of_wstrings;


    alias CType = test_msgs__msg__WStrings;
    alias CArrayType = test_msgs__msg__WStrings__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__WStrings();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__WStrings__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__WStrings__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__WStrings__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__WStrings__Sequence__destroy(array);
        array = null;
    }

    static void convert(in WStrings src, ref WStrings.CType dst)
    {
        rosidl_runtime_c__U16String__assign(&dst.wstring_value, cast(const(ushort*))toUTF16z(src.wstring_value));
        rosidl_runtime_c__U16String__assign(&dst.wstring_value_default1, cast(const(ushort*))toUTF16z(src.wstring_value_default1));
        rosidl_runtime_c__U16String__assign(&dst.wstring_value_default2, cast(const(ushort*))toUTF16z(src.wstring_value_default2));
        rosidl_runtime_c__U16String__assign(&dst.wstring_value_default3, cast(const(ushort*))toUTF16z(src.wstring_value_default3));
        foreach(i;0U..src.array_of_wstrings.length) { rosidl_runtime_c__U16String__assign(&dst.array_of_wstrings[i], cast(const(ushort*))toUTF16z(src.array_of_wstrings[i])); }
        rosidl_runtime_c__U16String__Sequence__init(&dst.bounded_sequence_of_wstrings, src.bounded_sequence_of_wstrings.length); foreach(i;0U..src.bounded_sequence_of_wstrings.length) { rosidl_runtime_c__U16String__assign(&dst.bounded_sequence_of_wstrings.data[i], cast(const(ushort*))toUTF16z(src.bounded_sequence_of_wstrings[i])); }
        rosidl_runtime_c__U16String__Sequence__init(&dst.unbounded_sequence_of_wstrings, src.unbounded_sequence_of_wstrings.length); foreach(i;0U..src.unbounded_sequence_of_wstrings.length) { rosidl_runtime_c__U16String__assign(&dst.unbounded_sequence_of_wstrings.data[i], cast(const(ushort*))toUTF16z(src.unbounded_sequence_of_wstrings[i])); }
    }

    static void convert(in WStrings.CType src, ref WStrings dst)
    {
        dst.wstring_value = fromStringz(cast(const(wchar*))src.wstring_value.data).dup();
        dst.wstring_value_default1 = fromStringz(cast(const(wchar*))src.wstring_value_default1.data).dup();
        dst.wstring_value_default2 = fromStringz(cast(const(wchar*))src.wstring_value_default2.data).dup();
        dst.wstring_value_default3 = fromStringz(cast(const(wchar*))src.wstring_value_default3.data).dup();
        foreach(i;0U..dst.array_of_wstrings.length) { dst.array_of_wstrings[i] = fromStringz(cast(const(wchar*))src.array_of_wstrings[i].data).dup(); }
        dst.bounded_sequence_of_wstrings.length = src.bounded_sequence_of_wstrings.size; foreach(i;0U..dst.bounded_sequence_of_wstrings.length) { dst.bounded_sequence_of_wstrings[i] = fromStringz(cast(const(wchar*))src.bounded_sequence_of_wstrings.data[i].data).dup(); }
        dst.unbounded_sequence_of_wstrings.length = src.unbounded_sequence_of_wstrings.size; foreach(i;0U..dst.unbounded_sequence_of_wstrings.length) { dst.unbounded_sequence_of_wstrings[i] = fromStringz(cast(const(wchar*))src.unbounded_sequence_of_wstrings.data[i].data).dup(); }
    }
}

struct MultiNested
{
    test_msgs.msg.Arrays[3] array_of_arrays;
    test_msgs.msg.BoundedSequences[3] array_of_bounded_sequences;
    test_msgs.msg.UnboundedSequences[3] array_of_unbounded_sequences;
    test_msgs.msg.Arrays[] bounded_sequence_of_arrays;
    test_msgs.msg.BoundedSequences[] bounded_sequence_of_bounded_sequences;
    test_msgs.msg.UnboundedSequences[] bounded_sequence_of_unbounded_sequences;
    test_msgs.msg.Arrays[] unbounded_sequence_of_arrays;
    test_msgs.msg.BoundedSequences[] unbounded_sequence_of_bounded_sequences;
    test_msgs.msg.UnboundedSequences[] unbounded_sequence_of_unbounded_sequences;


    alias CType = test_msgs__msg__MultiNested;
    alias CArrayType = test_msgs__msg__MultiNested__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__MultiNested();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__MultiNested__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__MultiNested__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__MultiNested__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__MultiNested__Sequence__destroy(array);
        array = null;
    }

    static void convert(in MultiNested src, ref MultiNested.CType dst)
    {
        foreach(i;0U..src.array_of_arrays.length) { test_msgs.msg.Arrays.convert(src.array_of_arrays[i], dst.array_of_arrays[i]); }
        foreach(i;0U..src.array_of_bounded_sequences.length) { test_msgs.msg.BoundedSequences.convert(src.array_of_bounded_sequences[i], dst.array_of_bounded_sequences[i]); }
        foreach(i;0U..src.array_of_unbounded_sequences.length) { test_msgs.msg.UnboundedSequences.convert(src.array_of_unbounded_sequences[i], dst.array_of_unbounded_sequences[i]); }
        test_msgs__msg__Arrays__Sequence__init(&dst.bounded_sequence_of_arrays, src.bounded_sequence_of_arrays.length); foreach(i;0U..src.bounded_sequence_of_arrays.length) { test_msgs.msg.Arrays.convert(src.bounded_sequence_of_arrays[i], dst.bounded_sequence_of_arrays.data[i]); }
        test_msgs__msg__BoundedSequences__Sequence__init(&dst.bounded_sequence_of_bounded_sequences, src.bounded_sequence_of_bounded_sequences.length); foreach(i;0U..src.bounded_sequence_of_bounded_sequences.length) { test_msgs.msg.BoundedSequences.convert(src.bounded_sequence_of_bounded_sequences[i], dst.bounded_sequence_of_bounded_sequences.data[i]); }
        test_msgs__msg__UnboundedSequences__Sequence__init(&dst.bounded_sequence_of_unbounded_sequences, src.bounded_sequence_of_unbounded_sequences.length); foreach(i;0U..src.bounded_sequence_of_unbounded_sequences.length) { test_msgs.msg.UnboundedSequences.convert(src.bounded_sequence_of_unbounded_sequences[i], dst.bounded_sequence_of_unbounded_sequences.data[i]); }
        test_msgs__msg__Arrays__Sequence__init(&dst.unbounded_sequence_of_arrays, src.unbounded_sequence_of_arrays.length); foreach(i;0U..src.unbounded_sequence_of_arrays.length) { test_msgs.msg.Arrays.convert(src.unbounded_sequence_of_arrays[i], dst.unbounded_sequence_of_arrays.data[i]); }
        test_msgs__msg__BoundedSequences__Sequence__init(&dst.unbounded_sequence_of_bounded_sequences, src.unbounded_sequence_of_bounded_sequences.length); foreach(i;0U..src.unbounded_sequence_of_bounded_sequences.length) { test_msgs.msg.BoundedSequences.convert(src.unbounded_sequence_of_bounded_sequences[i], dst.unbounded_sequence_of_bounded_sequences.data[i]); }
        test_msgs__msg__UnboundedSequences__Sequence__init(&dst.unbounded_sequence_of_unbounded_sequences, src.unbounded_sequence_of_unbounded_sequences.length); foreach(i;0U..src.unbounded_sequence_of_unbounded_sequences.length) { test_msgs.msg.UnboundedSequences.convert(src.unbounded_sequence_of_unbounded_sequences[i], dst.unbounded_sequence_of_unbounded_sequences.data[i]); }
    }

    static void convert(in MultiNested.CType src, ref MultiNested dst)
    {
        foreach(i;0U..dst.array_of_arrays.length) { test_msgs.msg.Arrays.convert(src.array_of_arrays[i], dst.array_of_arrays[i]); }
        foreach(i;0U..dst.array_of_bounded_sequences.length) { test_msgs.msg.BoundedSequences.convert(src.array_of_bounded_sequences[i], dst.array_of_bounded_sequences[i]); }
        foreach(i;0U..dst.array_of_unbounded_sequences.length) { test_msgs.msg.UnboundedSequences.convert(src.array_of_unbounded_sequences[i], dst.array_of_unbounded_sequences[i]); }
        dst.bounded_sequence_of_arrays.length = src.bounded_sequence_of_arrays.size; foreach(i;0U..dst.bounded_sequence_of_arrays.length) { test_msgs.msg.Arrays.convert(src.bounded_sequence_of_arrays.data[i], dst.bounded_sequence_of_arrays[i]); }
        dst.bounded_sequence_of_bounded_sequences.length = src.bounded_sequence_of_bounded_sequences.size; foreach(i;0U..dst.bounded_sequence_of_bounded_sequences.length) { test_msgs.msg.BoundedSequences.convert(src.bounded_sequence_of_bounded_sequences.data[i], dst.bounded_sequence_of_bounded_sequences[i]); }
        dst.bounded_sequence_of_unbounded_sequences.length = src.bounded_sequence_of_unbounded_sequences.size; foreach(i;0U..dst.bounded_sequence_of_unbounded_sequences.length) { test_msgs.msg.UnboundedSequences.convert(src.bounded_sequence_of_unbounded_sequences.data[i], dst.bounded_sequence_of_unbounded_sequences[i]); }
        dst.unbounded_sequence_of_arrays.length = src.unbounded_sequence_of_arrays.size; foreach(i;0U..dst.unbounded_sequence_of_arrays.length) { test_msgs.msg.Arrays.convert(src.unbounded_sequence_of_arrays.data[i], dst.unbounded_sequence_of_arrays[i]); }
        dst.unbounded_sequence_of_bounded_sequences.length = src.unbounded_sequence_of_bounded_sequences.size; foreach(i;0U..dst.unbounded_sequence_of_bounded_sequences.length) { test_msgs.msg.BoundedSequences.convert(src.unbounded_sequence_of_bounded_sequences.data[i], dst.unbounded_sequence_of_bounded_sequences[i]); }
        dst.unbounded_sequence_of_unbounded_sequences.length = src.unbounded_sequence_of_unbounded_sequences.size; foreach(i;0U..dst.unbounded_sequence_of_unbounded_sequences.length) { test_msgs.msg.UnboundedSequences.convert(src.unbounded_sequence_of_unbounded_sequences.data[i], dst.unbounded_sequence_of_unbounded_sequences[i]); }
    }
}

struct Defaults
{
    bool bool_value = true;
    ubyte byte_value = 50;
    ubyte char_value = 100;
    float float32_value = 1.125;
    double float64_value = 1.125;
    byte int8_value = -50;
    ubyte uint8_value = 200;
    short int16_value = -1000;
    ushort uint16_value = 2000;
    int int32_value = -30000;
    uint uint32_value = 60000;
    long int64_value = -40000000;
    ulong uint64_value = 50000000;


    alias CType = test_msgs__msg__Defaults;
    alias CArrayType = test_msgs__msg__Defaults__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Defaults();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__Defaults__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__Defaults__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__Defaults__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__Defaults__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Defaults src, ref Defaults.CType dst)
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
    }

    static void convert(in Defaults.CType src, ref Defaults dst)
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
    }
}

struct Nested
{
    test_msgs.msg.BasicTypes basic_types_value;


    alias CType = test_msgs__msg__Nested;
    alias CArrayType = test_msgs__msg__Nested__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Nested();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__Nested__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__Nested__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__Nested__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__Nested__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Nested src, ref Nested.CType dst)
    {
        test_msgs.msg.BasicTypes.convert(src.basic_types_value, dst.basic_types_value);
    }

    static void convert(in Nested.CType src, ref Nested dst)
    {
        test_msgs.msg.BasicTypes.convert(src.basic_types_value, dst.basic_types_value);
    }
}

struct Constants
{
    ubyte structure_needs_at_least_one_member;


    alias CType = test_msgs__msg__Constants;
    alias CArrayType = test_msgs__msg__Constants__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Constants();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__Constants__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__Constants__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__Constants__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__Constants__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Constants src, ref Constants.CType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }

    static void convert(in Constants.CType src, ref Constants dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }
}

struct Strings
{
    string string_value;
    string string_value_default1 = "Hello world!";
    string string_value_default2 = "Hello'world!";
    string string_value_default3 = "Hello\"world!";
    string string_value_default4 = "Hello'world!";
    string string_value_default5 = "Hello\"world!";
    string bounded_string_value;
    string bounded_string_value_default1 = "Hello world!";
    string bounded_string_value_default2 = "Hello'world!";
    string bounded_string_value_default3 = "Hello\"world!";
    string bounded_string_value_default4 = "Hello'world!";
    string bounded_string_value_default5 = "Hello\"world!";


    alias CType = test_msgs__msg__Strings;
    alias CArrayType = test_msgs__msg__Strings__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Strings();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__Strings__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__Strings__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__Strings__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__Strings__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Strings src, ref Strings.CType dst)
    {
        rosidl_runtime_c__String__assign(&dst.string_value, toStringz(src.string_value));
        rosidl_runtime_c__String__assign(&dst.string_value_default1, toStringz(src.string_value_default1));
        rosidl_runtime_c__String__assign(&dst.string_value_default2, toStringz(src.string_value_default2));
        rosidl_runtime_c__String__assign(&dst.string_value_default3, toStringz(src.string_value_default3));
        rosidl_runtime_c__String__assign(&dst.string_value_default4, toStringz(src.string_value_default4));
        rosidl_runtime_c__String__assign(&dst.string_value_default5, toStringz(src.string_value_default5));
        rosidl_runtime_c__String__assign(&dst.bounded_string_value, toStringz(src.bounded_string_value));
        rosidl_runtime_c__String__assign(&dst.bounded_string_value_default1, toStringz(src.bounded_string_value_default1));
        rosidl_runtime_c__String__assign(&dst.bounded_string_value_default2, toStringz(src.bounded_string_value_default2));
        rosidl_runtime_c__String__assign(&dst.bounded_string_value_default3, toStringz(src.bounded_string_value_default3));
        rosidl_runtime_c__String__assign(&dst.bounded_string_value_default4, toStringz(src.bounded_string_value_default4));
        rosidl_runtime_c__String__assign(&dst.bounded_string_value_default5, toStringz(src.bounded_string_value_default5));
    }

    static void convert(in Strings.CType src, ref Strings dst)
    {
        dst.string_value = fromStringz(src.string_value.data).dup();
        dst.string_value_default1 = fromStringz(src.string_value_default1.data).dup();
        dst.string_value_default2 = fromStringz(src.string_value_default2.data).dup();
        dst.string_value_default3 = fromStringz(src.string_value_default3.data).dup();
        dst.string_value_default4 = fromStringz(src.string_value_default4.data).dup();
        dst.string_value_default5 = fromStringz(src.string_value_default5.data).dup();
        dst.bounded_string_value = fromStringz(src.bounded_string_value.data).dup();
        dst.bounded_string_value_default1 = fromStringz(src.bounded_string_value_default1.data).dup();
        dst.bounded_string_value_default2 = fromStringz(src.bounded_string_value_default2.data).dup();
        dst.bounded_string_value_default3 = fromStringz(src.bounded_string_value_default3.data).dup();
        dst.bounded_string_value_default4 = fromStringz(src.bounded_string_value_default4.data).dup();
        dst.bounded_string_value_default5 = fromStringz(src.bounded_string_value_default5.data).dup();
    }
}

struct UnboundedSequences
{
    bool[] bool_values;
    ubyte[] byte_values;
    ubyte[] char_values;
    float[] float32_values;
    double[] float64_values;
    byte[] int8_values;
    ubyte[] uint8_values;
    short[] int16_values;
    ushort[] uint16_values;
    int[] int32_values;
    uint[] uint32_values;
    long[] int64_values;
    ulong[] uint64_values;
    string[] string_values;
    test_msgs.msg.BasicTypes[] basic_types_values;
    test_msgs.msg.Constants[] constants_values;
    test_msgs.msg.Defaults[] defaults_values;
    bool[] bool_values_default = [false, true, false];
    ubyte[] byte_values_default = [0, 1, 255];
    ubyte[] char_values_default = [0, 1, 127];
    float[] float32_values_default = [1.125, 0.0, -1.125];
    double[] float64_values_default = [3.1415, 0.0, -3.1415];
    byte[] int8_values_default = [0, 127, -128];
    ubyte[] uint8_values_default = [0, 1, 255];
    short[] int16_values_default = [0, 32767, -32768];
    ushort[] uint16_values_default = [0, 1, 65535];
    int[] int32_values_default = [0, 2147483647, -2147483648];
    uint[] uint32_values_default = [0, 1, 4294967295];
    long[] int64_values_default = [0, 9223372036854775807, -9223372036854775808];
    ulong[] uint64_values_default = [0, 1, 18446744073709551615];
    string[] string_values_default = ["", "max value", "min value"];
    int alignment_check;


    alias CType = test_msgs__msg__UnboundedSequences;
    alias CArrayType = test_msgs__msg__UnboundedSequences__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__UnboundedSequences();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__msg__UnboundedSequences__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__msg__UnboundedSequences__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__msg__UnboundedSequences__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__msg__UnboundedSequences__Sequence__destroy(array);
        array = null;
    }

    static void convert(in UnboundedSequences src, ref UnboundedSequences.CType dst)
    {
        rosidl_runtime_c__bool__Sequence__init(&dst.bool_values, src.bool_values.length); foreach(i;0U..src.bool_values.length) { dst.bool_values.data[i] = src.bool_values[i]; }
        rosidl_runtime_c__octet__Sequence__init(&dst.byte_values, src.byte_values.length); foreach(i;0U..src.byte_values.length) { dst.byte_values.data[i] = src.byte_values[i]; }
        rosidl_runtime_c__uint8__Sequence__init(&dst.char_values, src.char_values.length); foreach(i;0U..src.char_values.length) { dst.char_values.data[i] = src.char_values[i]; }
        rosidl_runtime_c__float__Sequence__init(&dst.float32_values, src.float32_values.length); foreach(i;0U..src.float32_values.length) { dst.float32_values.data[i] = src.float32_values[i]; }
        rosidl_runtime_c__double__Sequence__init(&dst.float64_values, src.float64_values.length); foreach(i;0U..src.float64_values.length) { dst.float64_values.data[i] = src.float64_values[i]; }
        rosidl_runtime_c__int8__Sequence__init(&dst.int8_values, src.int8_values.length); foreach(i;0U..src.int8_values.length) { dst.int8_values.data[i] = src.int8_values[i]; }
        rosidl_runtime_c__uint8__Sequence__init(&dst.uint8_values, src.uint8_values.length); foreach(i;0U..src.uint8_values.length) { dst.uint8_values.data[i] = src.uint8_values[i]; }
        rosidl_runtime_c__int16__Sequence__init(&dst.int16_values, src.int16_values.length); foreach(i;0U..src.int16_values.length) { dst.int16_values.data[i] = src.int16_values[i]; }
        rosidl_runtime_c__uint16__Sequence__init(&dst.uint16_values, src.uint16_values.length); foreach(i;0U..src.uint16_values.length) { dst.uint16_values.data[i] = src.uint16_values[i]; }
        rosidl_runtime_c__int32__Sequence__init(&dst.int32_values, src.int32_values.length); foreach(i;0U..src.int32_values.length) { dst.int32_values.data[i] = src.int32_values[i]; }
        rosidl_runtime_c__uint32__Sequence__init(&dst.uint32_values, src.uint32_values.length); foreach(i;0U..src.uint32_values.length) { dst.uint32_values.data[i] = src.uint32_values[i]; }
        rosidl_runtime_c__int64__Sequence__init(&dst.int64_values, src.int64_values.length); foreach(i;0U..src.int64_values.length) { dst.int64_values.data[i] = src.int64_values[i]; }
        rosidl_runtime_c__uint64__Sequence__init(&dst.uint64_values, src.uint64_values.length); foreach(i;0U..src.uint64_values.length) { dst.uint64_values.data[i] = src.uint64_values[i]; }
        rosidl_runtime_c__String__Sequence__init(&dst.string_values, src.string_values.length); foreach(i;0U..src.string_values.length) { rosidl_runtime_c__String__assign(&dst.string_values.data[i], toStringz(src.string_values[i])); }
        test_msgs__msg__BasicTypes__Sequence__init(&dst.basic_types_values, src.basic_types_values.length); foreach(i;0U..src.basic_types_values.length) { test_msgs.msg.BasicTypes.convert(src.basic_types_values[i], dst.basic_types_values.data[i]); }
        test_msgs__msg__Constants__Sequence__init(&dst.constants_values, src.constants_values.length); foreach(i;0U..src.constants_values.length) { test_msgs.msg.Constants.convert(src.constants_values[i], dst.constants_values.data[i]); }
        test_msgs__msg__Defaults__Sequence__init(&dst.defaults_values, src.defaults_values.length); foreach(i;0U..src.defaults_values.length) { test_msgs.msg.Defaults.convert(src.defaults_values[i], dst.defaults_values.data[i]); }
        rosidl_runtime_c__bool__Sequence__init(&dst.bool_values_default, src.bool_values_default.length); foreach(i;0U..src.bool_values_default.length) { dst.bool_values_default.data[i] = src.bool_values_default[i]; }
        rosidl_runtime_c__octet__Sequence__init(&dst.byte_values_default, src.byte_values_default.length); foreach(i;0U..src.byte_values_default.length) { dst.byte_values_default.data[i] = src.byte_values_default[i]; }
        rosidl_runtime_c__uint8__Sequence__init(&dst.char_values_default, src.char_values_default.length); foreach(i;0U..src.char_values_default.length) { dst.char_values_default.data[i] = src.char_values_default[i]; }
        rosidl_runtime_c__float__Sequence__init(&dst.float32_values_default, src.float32_values_default.length); foreach(i;0U..src.float32_values_default.length) { dst.float32_values_default.data[i] = src.float32_values_default[i]; }
        rosidl_runtime_c__double__Sequence__init(&dst.float64_values_default, src.float64_values_default.length); foreach(i;0U..src.float64_values_default.length) { dst.float64_values_default.data[i] = src.float64_values_default[i]; }
        rosidl_runtime_c__int8__Sequence__init(&dst.int8_values_default, src.int8_values_default.length); foreach(i;0U..src.int8_values_default.length) { dst.int8_values_default.data[i] = src.int8_values_default[i]; }
        rosidl_runtime_c__uint8__Sequence__init(&dst.uint8_values_default, src.uint8_values_default.length); foreach(i;0U..src.uint8_values_default.length) { dst.uint8_values_default.data[i] = src.uint8_values_default[i]; }
        rosidl_runtime_c__int16__Sequence__init(&dst.int16_values_default, src.int16_values_default.length); foreach(i;0U..src.int16_values_default.length) { dst.int16_values_default.data[i] = src.int16_values_default[i]; }
        rosidl_runtime_c__uint16__Sequence__init(&dst.uint16_values_default, src.uint16_values_default.length); foreach(i;0U..src.uint16_values_default.length) { dst.uint16_values_default.data[i] = src.uint16_values_default[i]; }
        rosidl_runtime_c__int32__Sequence__init(&dst.int32_values_default, src.int32_values_default.length); foreach(i;0U..src.int32_values_default.length) { dst.int32_values_default.data[i] = src.int32_values_default[i]; }
        rosidl_runtime_c__uint32__Sequence__init(&dst.uint32_values_default, src.uint32_values_default.length); foreach(i;0U..src.uint32_values_default.length) { dst.uint32_values_default.data[i] = src.uint32_values_default[i]; }
        rosidl_runtime_c__int64__Sequence__init(&dst.int64_values_default, src.int64_values_default.length); foreach(i;0U..src.int64_values_default.length) { dst.int64_values_default.data[i] = src.int64_values_default[i]; }
        rosidl_runtime_c__uint64__Sequence__init(&dst.uint64_values_default, src.uint64_values_default.length); foreach(i;0U..src.uint64_values_default.length) { dst.uint64_values_default.data[i] = src.uint64_values_default[i]; }
        rosidl_runtime_c__String__Sequence__init(&dst.string_values_default, src.string_values_default.length); foreach(i;0U..src.string_values_default.length) { rosidl_runtime_c__String__assign(&dst.string_values_default.data[i], toStringz(src.string_values_default[i])); }
        dst.alignment_check = src.alignment_check;
    }

    static void convert(in UnboundedSequences.CType src, ref UnboundedSequences dst)
    {
        dst.bool_values.length = src.bool_values.size; foreach(i;0U..dst.bool_values.length) { dst.bool_values[i] = src.bool_values.data[i]; }
        dst.byte_values.length = src.byte_values.size; foreach(i;0U..dst.byte_values.length) { dst.byte_values[i] = src.byte_values.data[i]; }
        dst.char_values.length = src.char_values.size; foreach(i;0U..dst.char_values.length) { dst.char_values[i] = src.char_values.data[i]; }
        dst.float32_values.length = src.float32_values.size; foreach(i;0U..dst.float32_values.length) { dst.float32_values[i] = src.float32_values.data[i]; }
        dst.float64_values.length = src.float64_values.size; foreach(i;0U..dst.float64_values.length) { dst.float64_values[i] = src.float64_values.data[i]; }
        dst.int8_values.length = src.int8_values.size; foreach(i;0U..dst.int8_values.length) { dst.int8_values[i] = src.int8_values.data[i]; }
        dst.uint8_values.length = src.uint8_values.size; foreach(i;0U..dst.uint8_values.length) { dst.uint8_values[i] = src.uint8_values.data[i]; }
        dst.int16_values.length = src.int16_values.size; foreach(i;0U..dst.int16_values.length) { dst.int16_values[i] = src.int16_values.data[i]; }
        dst.uint16_values.length = src.uint16_values.size; foreach(i;0U..dst.uint16_values.length) { dst.uint16_values[i] = src.uint16_values.data[i]; }
        dst.int32_values.length = src.int32_values.size; foreach(i;0U..dst.int32_values.length) { dst.int32_values[i] = src.int32_values.data[i]; }
        dst.uint32_values.length = src.uint32_values.size; foreach(i;0U..dst.uint32_values.length) { dst.uint32_values[i] = src.uint32_values.data[i]; }
        dst.int64_values.length = src.int64_values.size; foreach(i;0U..dst.int64_values.length) { dst.int64_values[i] = src.int64_values.data[i]; }
        dst.uint64_values.length = src.uint64_values.size; foreach(i;0U..dst.uint64_values.length) { dst.uint64_values[i] = src.uint64_values.data[i]; }
        dst.string_values.length = src.string_values.size; foreach(i;0U..dst.string_values.length) { dst.string_values[i] = fromStringz(src.string_values.data[i].data).dup(); }
        dst.basic_types_values.length = src.basic_types_values.size; foreach(i;0U..dst.basic_types_values.length) { test_msgs.msg.BasicTypes.convert(src.basic_types_values.data[i], dst.basic_types_values[i]); }
        dst.constants_values.length = src.constants_values.size; foreach(i;0U..dst.constants_values.length) { test_msgs.msg.Constants.convert(src.constants_values.data[i], dst.constants_values[i]); }
        dst.defaults_values.length = src.defaults_values.size; foreach(i;0U..dst.defaults_values.length) { test_msgs.msg.Defaults.convert(src.defaults_values.data[i], dst.defaults_values[i]); }
        dst.bool_values_default.length = src.bool_values_default.size; foreach(i;0U..dst.bool_values_default.length) { dst.bool_values_default[i] = src.bool_values_default.data[i]; }
        dst.byte_values_default.length = src.byte_values_default.size; foreach(i;0U..dst.byte_values_default.length) { dst.byte_values_default[i] = src.byte_values_default.data[i]; }
        dst.char_values_default.length = src.char_values_default.size; foreach(i;0U..dst.char_values_default.length) { dst.char_values_default[i] = src.char_values_default.data[i]; }
        dst.float32_values_default.length = src.float32_values_default.size; foreach(i;0U..dst.float32_values_default.length) { dst.float32_values_default[i] = src.float32_values_default.data[i]; }
        dst.float64_values_default.length = src.float64_values_default.size; foreach(i;0U..dst.float64_values_default.length) { dst.float64_values_default[i] = src.float64_values_default.data[i]; }
        dst.int8_values_default.length = src.int8_values_default.size; foreach(i;0U..dst.int8_values_default.length) { dst.int8_values_default[i] = src.int8_values_default.data[i]; }
        dst.uint8_values_default.length = src.uint8_values_default.size; foreach(i;0U..dst.uint8_values_default.length) { dst.uint8_values_default[i] = src.uint8_values_default.data[i]; }
        dst.int16_values_default.length = src.int16_values_default.size; foreach(i;0U..dst.int16_values_default.length) { dst.int16_values_default[i] = src.int16_values_default.data[i]; }
        dst.uint16_values_default.length = src.uint16_values_default.size; foreach(i;0U..dst.uint16_values_default.length) { dst.uint16_values_default[i] = src.uint16_values_default.data[i]; }
        dst.int32_values_default.length = src.int32_values_default.size; foreach(i;0U..dst.int32_values_default.length) { dst.int32_values_default[i] = src.int32_values_default.data[i]; }
        dst.uint32_values_default.length = src.uint32_values_default.size; foreach(i;0U..dst.uint32_values_default.length) { dst.uint32_values_default[i] = src.uint32_values_default.data[i]; }
        dst.int64_values_default.length = src.int64_values_default.size; foreach(i;0U..dst.int64_values_default.length) { dst.int64_values_default[i] = src.int64_values_default.data[i]; }
        dst.uint64_values_default.length = src.uint64_values_default.size; foreach(i;0U..dst.uint64_values_default.length) { dst.uint64_values_default[i] = src.uint64_values_default.data[i]; }
        dst.string_values_default.length = src.string_values_default.size; foreach(i;0U..dst.string_values_default.length) { dst.string_values_default[i] = fromStringz(src.string_values_default.data[i].data).dup(); }
        dst.alignment_check = src.alignment_check;
    }
}


