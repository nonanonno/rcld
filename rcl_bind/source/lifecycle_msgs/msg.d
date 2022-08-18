module lifecycle_msgs.msg;

import std.string;
import std.utf;
import rcl;

struct TransitionDescription
{
    lifecycle_msgs.msg.Transition transition;
    lifecycle_msgs.msg.State start_state;
    lifecycle_msgs.msg.State goal_state;

    alias CType = lifecycle_msgs__msg__TransitionDescription;
    alias CArrayType = lifecycle_msgs__msg__TransitionDescription__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__msg__TransitionDescription();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__msg__TransitionDescription__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__msg__TransitionDescription__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__msg__TransitionDescription__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__msg__TransitionDescription__Sequence__destroy(array);
        array = null;
    }

    static void convert(in TransitionDescription src, ref TransitionDescription.CType dst)
    {
        lifecycle_msgs.msg.Transition.convert(src.transition, dst.transition);
        lifecycle_msgs.msg.State.convert(src.start_state, dst.start_state);
        lifecycle_msgs.msg.State.convert(src.goal_state, dst.goal_state);
    }

    static void convert(in TransitionDescription.CType src, ref TransitionDescription dst)
    {
        lifecycle_msgs.msg.Transition.convert(src.transition, dst.transition);
        lifecycle_msgs.msg.State.convert(src.start_state, dst.start_state);
        lifecycle_msgs.msg.State.convert(src.goal_state, dst.goal_state);
    }
}

struct TransitionEvent
{
    ulong timestamp;
    lifecycle_msgs.msg.Transition transition;
    lifecycle_msgs.msg.State start_state;
    lifecycle_msgs.msg.State goal_state;

    alias CType = lifecycle_msgs__msg__TransitionEvent;
    alias CArrayType = lifecycle_msgs__msg__TransitionEvent__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__msg__TransitionEvent();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__msg__TransitionEvent__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__msg__TransitionEvent__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__msg__TransitionEvent__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__msg__TransitionEvent__Sequence__destroy(array);
        array = null;
    }

    static void convert(in TransitionEvent src, ref TransitionEvent.CType dst)
    {
        dst.timestamp = src.timestamp;
        lifecycle_msgs.msg.Transition.convert(src.transition, dst.transition);
        lifecycle_msgs.msg.State.convert(src.start_state, dst.start_state);
        lifecycle_msgs.msg.State.convert(src.goal_state, dst.goal_state);
    }

    static void convert(in TransitionEvent.CType src, ref TransitionEvent dst)
    {
        dst.timestamp = src.timestamp;
        lifecycle_msgs.msg.Transition.convert(src.transition, dst.transition);
        lifecycle_msgs.msg.State.convert(src.start_state, dst.start_state);
        lifecycle_msgs.msg.State.convert(src.goal_state, dst.goal_state);
    }
}

struct Transition
{
    ubyte id;
    string label;

    alias CType = lifecycle_msgs__msg__Transition;
    alias CArrayType = lifecycle_msgs__msg__Transition__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__msg__Transition();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__msg__Transition__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__msg__Transition__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__msg__Transition__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__msg__Transition__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Transition src, ref Transition.CType dst)
    {
        dst.id = src.id;
        rosidl_runtime_c__String__assign(&dst.label, toStringz(src.label));
    }

    static void convert(in Transition.CType src, ref Transition dst)
    {
        dst.id = src.id;
        dst.label = fromStringz(src.label.data).dup();
    }
}

struct State
{
    ubyte id;
    string label;

    alias CType = lifecycle_msgs__msg__State;
    alias CArrayType = lifecycle_msgs__msg__State__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__msg__State();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__msg__State__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__msg__State__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__msg__State__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__msg__State__Sequence__destroy(array);
        array = null;
    }

    static void convert(in State src, ref State.CType dst)
    {
        dst.id = src.id;
        rosidl_runtime_c__String__assign(&dst.label, toStringz(src.label));
    }

    static void convert(in State.CType src, ref State dst)
    {
        dst.id = src.id;
        dst.label = fromStringz(src.label.data).dup();
    }
}
