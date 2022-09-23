module action_msgs.srv.humble;
version (humble)
{

    import std.string;
    import std.utf;
    import rcl;
    import action_msgs.msg;

    struct CancelGoal
    {
        alias Request = CancelGoal_Request;
        alias Response = CancelGoal_Response;

        static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_service_type_support_handle__action_msgs__srv__CancelGoal();
        }
    }

    struct CancelGoal_Request
    {
        action_msgs.msg.GoalInfo goal_info;

        alias CType = action_msgs__srv__CancelGoal_Request;
        alias CArrayType = action_msgs__srv__CancelGoal_Request__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__action_msgs__srv__CancelGoal_Request();
        }

        static CType* createC() @nogc nothrow
        {
            return action_msgs__srv__CancelGoal_Request__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            action_msgs__srv__CancelGoal_Request__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return action_msgs__srv__CancelGoal_Request__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            action_msgs__srv__CancelGoal_Request__Sequence__destroy(array);
            array = null;
        }

        static void convert(in CancelGoal_Request src, ref CancelGoal_Request.CType dst)
        {
            action_msgs.msg.GoalInfo.convert(src.goal_info, dst.goal_info);
        }

        static void convert(in CancelGoal_Request.CType src, ref CancelGoal_Request dst)
        {
            action_msgs.msg.GoalInfo.convert(src.goal_info, dst.goal_info);
        }
    }

    struct CancelGoal_Response
    {
        byte return_code;
        action_msgs.msg.GoalInfo[] goals_canceling;

        enum byte ERROR_NONE = 0;
        enum byte ERROR_REJECTED = 1;
        enum byte ERROR_UNKNOWN_GOAL_ID = 2;
        enum byte ERROR_GOAL_TERMINATED = 3;

        alias CType = action_msgs__srv__CancelGoal_Response;
        alias CArrayType = action_msgs__srv__CancelGoal_Response__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__action_msgs__srv__CancelGoal_Response();
        }

        static CType* createC() @nogc nothrow
        {
            return action_msgs__srv__CancelGoal_Response__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            action_msgs__srv__CancelGoal_Response__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return action_msgs__srv__CancelGoal_Response__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            action_msgs__srv__CancelGoal_Response__Sequence__destroy(array);
            array = null;
        }

        static void convert(in CancelGoal_Response src, ref CancelGoal_Response.CType dst)
        {
            dst.return_code = src.return_code;
            action_msgs__msg__GoalInfo__Sequence__init(&dst.goals_canceling,
                    src.goals_canceling.length);
            foreach (i; 0U .. src.goals_canceling.length)
            {
                action_msgs.msg.GoalInfo.convert(src.goals_canceling[i],
                        dst.goals_canceling.data[i]);
            }
        }

        static void convert(in CancelGoal_Response.CType src, ref CancelGoal_Response dst)
        {
            dst.return_code = src.return_code;
            dst.goals_canceling.length = src.goals_canceling.size;
            foreach (i; 0U .. dst.goals_canceling.length)
            {
                action_msgs.msg.GoalInfo.convert(src.goals_canceling.data[i],
                        dst.goals_canceling[i]);
            }
        }
    }

}
