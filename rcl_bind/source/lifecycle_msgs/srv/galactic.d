module lifecycle_msgs.srv.galactic;

import std.string;
import std.utf;
import rcl;
import lifecycle_msgs.msg;

struct GetState
{
    alias Request = GetState_Request;
    alias Response = GetState_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__lifecycle_msgs__srv__GetState();
    }
}

struct GetAvailableTransitions
{
    alias Request = GetAvailableTransitions_Request;
    alias Response = GetAvailableTransitions_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__lifecycle_msgs__srv__GetAvailableTransitions();
    }
}

struct GetAvailableStates
{
    alias Request = GetAvailableStates_Request;
    alias Response = GetAvailableStates_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__lifecycle_msgs__srv__GetAvailableStates();
    }
}

struct ChangeState
{
    alias Request = ChangeState_Request;
    alias Response = ChangeState_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__lifecycle_msgs__srv__ChangeState();
    }
}

struct GetState_Request
{
    ubyte structure_needs_at_least_one_member;

    alias CType = lifecycle_msgs__srv__GetState_Request;
    alias CArrayType = lifecycle_msgs__srv__GetState_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__srv__GetState_Request();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__srv__GetState_Request__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__srv__GetState_Request__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__srv__GetState_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__srv__GetState_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in GetState_Request src, ref GetState_Request.CType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }

    static void convert(in GetState_Request.CType src, ref GetState_Request dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }
}

struct GetState_Response
{
    lifecycle_msgs.msg.State current_state;

    alias CType = lifecycle_msgs__srv__GetState_Response;
    alias CArrayType = lifecycle_msgs__srv__GetState_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__srv__GetState_Response();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__srv__GetState_Response__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__srv__GetState_Response__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__srv__GetState_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__srv__GetState_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in GetState_Response src, ref GetState_Response.CType dst)
    {
        lifecycle_msgs.msg.State.convert(src.current_state, dst.current_state);
    }

    static void convert(in GetState_Response.CType src, ref GetState_Response dst)
    {
        lifecycle_msgs.msg.State.convert(src.current_state, dst.current_state);
    }
}

struct GetAvailableTransitions_Request
{
    ubyte structure_needs_at_least_one_member;

    alias CType = lifecycle_msgs__srv__GetAvailableTransitions_Request;
    alias CArrayType = lifecycle_msgs__srv__GetAvailableTransitions_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__srv__GetAvailableTransitions_Request();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__srv__GetAvailableTransitions_Request__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__srv__GetAvailableTransitions_Request__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__srv__GetAvailableTransitions_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__srv__GetAvailableTransitions_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in GetAvailableTransitions_Request src,
            ref GetAvailableTransitions_Request.CType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }

    static void convert(in GetAvailableTransitions_Request.CType src,
            ref GetAvailableTransitions_Request dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }
}

struct GetAvailableTransitions_Response
{
    lifecycle_msgs.msg.TransitionDescription[] available_transitions;

    alias CType = lifecycle_msgs__srv__GetAvailableTransitions_Response;
    alias CArrayType = lifecycle_msgs__srv__GetAvailableTransitions_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__srv__GetAvailableTransitions_Response();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__srv__GetAvailableTransitions_Response__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__srv__GetAvailableTransitions_Response__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__srv__GetAvailableTransitions_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__srv__GetAvailableTransitions_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in GetAvailableTransitions_Response src,
            ref GetAvailableTransitions_Response.CType dst)
    {
        lifecycle_msgs__msg__TransitionDescription__Sequence__init(
                &dst.available_transitions, src.available_transitions.length);
        foreach (i; 0U .. src.available_transitions.length)
        {
            lifecycle_msgs.msg.TransitionDescription.convert(src.available_transitions[i],
                    dst.available_transitions.data[i]);
        }
    }

    static void convert(in GetAvailableTransitions_Response.CType src,
            ref GetAvailableTransitions_Response dst)
    {
        dst.available_transitions.length = src.available_transitions.size;
        foreach (i; 0U .. dst.available_transitions.length)
        {
            lifecycle_msgs.msg.TransitionDescription.convert(src.available_transitions.data[i],
                    dst.available_transitions[i]);
        }
    }
}

struct GetAvailableStates_Request
{
    ubyte structure_needs_at_least_one_member;

    alias CType = lifecycle_msgs__srv__GetAvailableStates_Request;
    alias CArrayType = lifecycle_msgs__srv__GetAvailableStates_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__srv__GetAvailableStates_Request();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__srv__GetAvailableStates_Request__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__srv__GetAvailableStates_Request__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__srv__GetAvailableStates_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__srv__GetAvailableStates_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in GetAvailableStates_Request src, ref GetAvailableStates_Request.CType dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }

    static void convert(in GetAvailableStates_Request.CType src, ref GetAvailableStates_Request dst)
    {
        dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
    }
}

struct GetAvailableStates_Response
{
    lifecycle_msgs.msg.State[] available_states;

    alias CType = lifecycle_msgs__srv__GetAvailableStates_Response;
    alias CArrayType = lifecycle_msgs__srv__GetAvailableStates_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__srv__GetAvailableStates_Response();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__srv__GetAvailableStates_Response__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__srv__GetAvailableStates_Response__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__srv__GetAvailableStates_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__srv__GetAvailableStates_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in GetAvailableStates_Response src, ref GetAvailableStates_Response
            .CType dst)
    {
        lifecycle_msgs__msg__State__Sequence__init(&dst.available_states,
                src.available_states.length);
        foreach (i; 0U .. src.available_states.length)
        {
            lifecycle_msgs.msg.State.convert(src.available_states[i], dst.available_states.data[i]);
        }
    }

    static void convert(in GetAvailableStates_Response.CType src, ref GetAvailableStates_Response dst)
    {
        dst.available_states.length = src.available_states.size;
        foreach (i; 0U .. dst.available_states.length)
        {
            lifecycle_msgs.msg.State.convert(src.available_states.data[i], dst.available_states[i]);
        }
    }
}

struct ChangeState_Request
{
    lifecycle_msgs.msg.Transition transition;

    alias CType = lifecycle_msgs__srv__ChangeState_Request;
    alias CArrayType = lifecycle_msgs__srv__ChangeState_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__srv__ChangeState_Request();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__srv__ChangeState_Request__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__srv__ChangeState_Request__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__srv__ChangeState_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__srv__ChangeState_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in ChangeState_Request src, ref ChangeState_Request.CType dst)
    {
        lifecycle_msgs.msg.Transition.convert(src.transition, dst.transition);
    }

    static void convert(in ChangeState_Request.CType src, ref ChangeState_Request dst)
    {
        lifecycle_msgs.msg.Transition.convert(src.transition, dst.transition);
    }
}

struct ChangeState_Response
{
    bool success;

    alias CType = lifecycle_msgs__srv__ChangeState_Response;
    alias CArrayType = lifecycle_msgs__srv__ChangeState_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__lifecycle_msgs__srv__ChangeState_Response();
    }

    static CType* createC() @nogc nothrow
    {
        return lifecycle_msgs__srv__ChangeState_Response__create();
    }

    static void destroyC(ref CType* msg) @nogc nothrow
    {
        lifecycle_msgs__srv__ChangeState_Response__destroy(msg);
        msg = null;
    }

    static CArrayType* createC(size_t size) @nogc nothrow
    {
        return lifecycle_msgs__srv__ChangeState_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType* array) @nogc nothrow
    {
        lifecycle_msgs__srv__ChangeState_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in ChangeState_Response src, ref ChangeState_Response.CType dst)
    {
        dst.success = src.success;
    }

    static void convert(in ChangeState_Response.CType src, ref ChangeState_Response dst)
    {
        dst.success = src.success;
    }
}
