module lifecycle_msgs.msg.foxy;
version (foxy)
{

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

        enum ubyte TRANSITION_CREATE = 0;
        enum ubyte TRANSITION_CONFIGURE = 1;
        enum ubyte TRANSITION_CLEANUP = 2;
        enum ubyte TRANSITION_ACTIVATE = 3;
        enum ubyte TRANSITION_DEACTIVATE = 4;
        enum ubyte TRANSITION_UNCONFIGURED_SHUTDOWN = 5;
        enum ubyte TRANSITION_INACTIVE_SHUTDOWN = 6;
        enum ubyte TRANSITION_ACTIVE_SHUTDOWN = 7;
        enum ubyte TRANSITION_DESTROY = 8;
        enum ubyte TRANSITION_ON_CONFIGURE_SUCCESS = 10;
        enum ubyte TRANSITION_ON_CONFIGURE_FAILURE = 11;
        enum ubyte TRANSITION_ON_CONFIGURE_ERROR = 12;
        enum ubyte TRANSITION_ON_CLEANUP_SUCCESS = 20;
        enum ubyte TRANSITION_ON_CLEANUP_FAILURE = 21;
        enum ubyte TRANSITION_ON_CLEANUP_ERROR = 22;
        enum ubyte TRANSITION_ON_ACTIVATE_SUCCESS = 30;
        enum ubyte TRANSITION_ON_ACTIVATE_FAILURE = 31;
        enum ubyte TRANSITION_ON_ACTIVATE_ERROR = 32;
        enum ubyte TRANSITION_ON_DEACTIVATE_SUCCESS = 40;
        enum ubyte TRANSITION_ON_DEACTIVATE_FAILURE = 41;
        enum ubyte TRANSITION_ON_DEACTIVATE_ERROR = 42;
        enum ubyte TRANSITION_ON_SHUTDOWN_SUCCESS = 50;
        enum ubyte TRANSITION_ON_SHUTDOWN_FAILURE = 51;
        enum ubyte TRANSITION_ON_SHUTDOWN_ERROR = 52;
        enum ubyte TRANSITION_ON_ERROR_SUCCESS = 60;
        enum ubyte TRANSITION_ON_ERROR_FAILURE = 61;
        enum ubyte TRANSITION_ON_ERROR_ERROR = 62;
        enum ubyte TRANSITION_CALLBACK_SUCCESS = 97;
        enum ubyte TRANSITION_CALLBACK_FAILURE = 98;
        enum ubyte TRANSITION_CALLBACK_ERROR = 99;

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

        enum ubyte PRIMARY_STATE_UNKNOWN = 0;
        enum ubyte PRIMARY_STATE_UNCONFIGURED = 1;
        enum ubyte PRIMARY_STATE_INACTIVE = 2;
        enum ubyte PRIMARY_STATE_ACTIVE = 3;
        enum ubyte PRIMARY_STATE_FINALIZED = 4;
        enum ubyte TRANSITION_STATE_CONFIGURING = 10;
        enum ubyte TRANSITION_STATE_CLEANINGUP = 11;
        enum ubyte TRANSITION_STATE_SHUTTINGDOWN = 12;
        enum ubyte TRANSITION_STATE_ACTIVATING = 13;
        enum ubyte TRANSITION_STATE_DEACTIVATING = 14;
        enum ubyte TRANSITION_STATE_ERRORPROCESSING = 15;

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

}
