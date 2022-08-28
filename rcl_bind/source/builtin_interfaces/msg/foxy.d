module builtin_interfaces.msg.foxy;
version (foxy)
{

    import std.string;
    import std.utf;
    import rcl;

    struct Duration
    {
        int sec;
        uint nanosec;

        alias CType = builtin_interfaces__msg__Duration;
        alias CArrayType = builtin_interfaces__msg__Duration__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__builtin_interfaces__msg__Duration();
        }

        static CType* createC() @nogc nothrow
        {
            return builtin_interfaces__msg__Duration__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            builtin_interfaces__msg__Duration__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return builtin_interfaces__msg__Duration__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            builtin_interfaces__msg__Duration__Sequence__destroy(array);
            array = null;
        }

        static void convert(in Duration src, ref Duration.CType dst)
        {
            dst.sec = src.sec;
            dst.nanosec = src.nanosec;
        }

        static void convert(in Duration.CType src, ref Duration dst)
        {
            dst.sec = src.sec;
            dst.nanosec = src.nanosec;
        }
    }

    struct Time
    {
        int sec;
        uint nanosec;

        alias CType = builtin_interfaces__msg__Time;
        alias CArrayType = builtin_interfaces__msg__Time__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__builtin_interfaces__msg__Time();
        }

        static CType* createC() @nogc nothrow
        {
            return builtin_interfaces__msg__Time__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            builtin_interfaces__msg__Time__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return builtin_interfaces__msg__Time__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            builtin_interfaces__msg__Time__Sequence__destroy(array);
            array = null;
        }

        static void convert(in Time src, ref Time.CType dst)
        {
            dst.sec = src.sec;
            dst.nanosec = src.nanosec;
        }

        static void convert(in Time.CType src, ref Time dst)
        {
            dst.sec = src.sec;
            dst.nanosec = src.nanosec;
        }
    }

}
