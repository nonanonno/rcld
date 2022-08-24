module rosgraph_msgs.msg;

import std.string;
import std.utf;
import rcl;

import builtin_interfaces.msg;

struct Clock
{
    builtin_interfaces.msg.Time clock;

    alias CType = rosgraph_msgs__msg__Clock;
    alias CArrayType = rosgraph_msgs__msg__Clock__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__rosgraph_msgs__msg__Clock();
    }

    static CType* createC() @nogc nothrow
    {
        return rosgraph_msgs__msg__Clock__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        rosgraph_msgs__msg__Clock__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return rosgraph_msgs__msg__Clock__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        rosgraph_msgs__msg__Clock__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Clock src, ref Clock.CType dst)
    {
        builtin_interfaces.msg.Time.convert(src.clock, dst.clock);
    }

    static void convert(in Clock.CType src, ref Clock dst)
    {
        builtin_interfaces.msg.Time.convert(src.clock, dst.clock);
    }
}
