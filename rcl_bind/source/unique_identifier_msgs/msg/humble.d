module unique_identifier_msgs.msg.humble;
version (humble)
{

    import std.string;
    import std.utf;
    import rcl;

    struct UUID
    {
        ubyte[16] uuid;

        alias CType = unique_identifier_msgs__msg__UUID;
        alias CArrayType = unique_identifier_msgs__msg__UUID__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__unique_identifier_msgs__msg__UUID();
        }

        static CType* createC() @nogc nothrow
        {
            return unique_identifier_msgs__msg__UUID__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            unique_identifier_msgs__msg__UUID__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return unique_identifier_msgs__msg__UUID__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            unique_identifier_msgs__msg__UUID__Sequence__destroy(array);
            array = null;
        }

        static void convert(in UUID src, ref UUID.CType dst)
        {
            foreach (i; 0U .. src.uuid.length)
            {
                dst.uuid[i] = src.uuid[i];
            }
        }

        static void convert(in UUID.CType src, ref UUID dst)
        {
            foreach (i; 0U .. dst.uuid.length)
            {
                dst.uuid[i] = src.uuid[i];
            }
        }
    }

}
