module action_msgs.msg.rolling;
version (rolling)
{

    import std.string;
    import std.utf;
    import rcl;
    import builtin_interfaces.msg;
    import unique_identifier_msgs.msg;

    struct GoalStatus
    {
        action_msgs.msg.GoalInfo goal_info;
        byte status;

        alias CType = action_msgs__msg__GoalStatus;
        alias CArrayType = action_msgs__msg__GoalStatus__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__action_msgs__msg__GoalStatus();
        }

        static CType* createC() @nogc nothrow
        {
            return action_msgs__msg__GoalStatus__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            action_msgs__msg__GoalStatus__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return action_msgs__msg__GoalStatus__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            action_msgs__msg__GoalStatus__Sequence__destroy(array);
            array = null;
        }

        static void convert(in GoalStatus src, ref GoalStatus.CType dst)
        {
            action_msgs.msg.GoalInfo.convert(src.goal_info, dst.goal_info);
            dst.status = src.status;
        }

        static void convert(in GoalStatus.CType src, ref GoalStatus dst)
        {
            action_msgs.msg.GoalInfo.convert(src.goal_info, dst.goal_info);
            dst.status = src.status;
        }
    }

    struct GoalStatusArray
    {
        action_msgs.msg.GoalStatus[] status_list;

        alias CType = action_msgs__msg__GoalStatusArray;
        alias CArrayType = action_msgs__msg__GoalStatusArray__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__action_msgs__msg__GoalStatusArray();
        }

        static CType* createC() @nogc nothrow
        {
            return action_msgs__msg__GoalStatusArray__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            action_msgs__msg__GoalStatusArray__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return action_msgs__msg__GoalStatusArray__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            action_msgs__msg__GoalStatusArray__Sequence__destroy(array);
            array = null;
        }

        static void convert(in GoalStatusArray src, ref GoalStatusArray.CType dst)
        {
            action_msgs__msg__GoalStatus__Sequence__init(&dst.status_list, src.status_list.length);
            foreach (i; 0U .. src.status_list.length)
            {
                action_msgs.msg.GoalStatus.convert(src.status_list[i], dst.status_list.data[i]);
            }
        }

        static void convert(in GoalStatusArray.CType src, ref GoalStatusArray dst)
        {
            dst.status_list.length = src.status_list.size;
            foreach (i; 0U .. dst.status_list.length)
            {
                action_msgs.msg.GoalStatus.convert(src.status_list.data[i], dst.status_list[i]);
            }
        }
    }

    struct GoalInfo
    {
        unique_identifier_msgs.msg.UUID goal_id;
        builtin_interfaces.msg.Time stamp;

        alias CType = action_msgs__msg__GoalInfo;
        alias CArrayType = action_msgs__msg__GoalInfo__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__action_msgs__msg__GoalInfo();
        }

        static CType* createC() @nogc nothrow
        {
            return action_msgs__msg__GoalInfo__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            action_msgs__msg__GoalInfo__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return action_msgs__msg__GoalInfo__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            action_msgs__msg__GoalInfo__Sequence__destroy(array);
            array = null;
        }

        static void convert(in GoalInfo src, ref GoalInfo.CType dst)
        {
            unique_identifier_msgs.msg.UUID.convert(src.goal_id, dst.goal_id);
            builtin_interfaces.msg.Time.convert(src.stamp, dst.stamp);
        }

        static void convert(in GoalInfo.CType src, ref GoalInfo dst)
        {
            unique_identifier_msgs.msg.UUID.convert(src.goal_id, dst.goal_id);
            builtin_interfaces.msg.Time.convert(src.stamp, dst.stamp);
        }
    }

}
