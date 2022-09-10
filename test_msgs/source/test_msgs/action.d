module test_msgs.action;

import std.string;
import std.utf;
import rcl;
import test_msgs.c.action;
import builtin_interfaces.msg;
import unique_identifier_msgs.msg;

struct Fibonacci
{
    alias Goal = Fibonacci_Goal;
    alias Result = Fibonacci_Result;
    alias Feedback = Fibonacci_Feedback;
    alias SendGoal = Fibonacci_SendGoal;
    alias GetResult = Fibonacci_GetResult;
    alias FeedbackMessage = Fibonacci_FeedbackMessage;

    static const(rosidl_action_type_support_t) * getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_action_type_support_handle__test_msgs__action__Fibonacci();
    }
}


struct Fibonacci_SendGoal
{
    alias Request = Fibonacci_SendGoal_Request;
    alias Response = Fibonacci_SendGoal_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__test_msgs__action__Fibonacci_SendGoal();
    }
}

struct Fibonacci_GetResult
{
    alias Request = Fibonacci_GetResult_Request;
    alias Response = Fibonacci_GetResult_Response;

    static const(rosidl_service_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_service_type_support_handle__test_msgs__action__Fibonacci_GetResult();
    }
}


struct Fibonacci_Goal
{
    int order;


    alias CType = test_msgs__action__Fibonacci_Goal;
    alias CArrayType = test_msgs__action__Fibonacci_Goal__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__action__Fibonacci_Goal();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__action__Fibonacci_Goal__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__action__Fibonacci_Goal__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__action__Fibonacci_Goal__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__action__Fibonacci_Goal__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Fibonacci_Goal src, ref Fibonacci_Goal.CType dst)
    {
        dst.order = src.order;
    }

    static void convert(in Fibonacci_Goal.CType src, ref Fibonacci_Goal dst)
    {
        dst.order = src.order;
    }
}

struct Fibonacci_Result
{
    int[] sequence;


    alias CType = test_msgs__action__Fibonacci_Result;
    alias CArrayType = test_msgs__action__Fibonacci_Result__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__action__Fibonacci_Result();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__action__Fibonacci_Result__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__action__Fibonacci_Result__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__action__Fibonacci_Result__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__action__Fibonacci_Result__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Fibonacci_Result src, ref Fibonacci_Result.CType dst)
    {
        rosidl_runtime_c__int32__Sequence__init(&dst.sequence, src.sequence.length); foreach(i;0U..src.sequence.length) { dst.sequence.data[i] = src.sequence[i]; }
    }

    static void convert(in Fibonacci_Result.CType src, ref Fibonacci_Result dst)
    {
        dst.sequence.length = src.sequence.size; foreach(i;0U..dst.sequence.length) { dst.sequence[i] = src.sequence.data[i]; }
    }
}

struct Fibonacci_Feedback
{
    int[] sequence;


    alias CType = test_msgs__action__Fibonacci_Feedback;
    alias CArrayType = test_msgs__action__Fibonacci_Feedback__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__action__Fibonacci_Feedback();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__action__Fibonacci_Feedback__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__action__Fibonacci_Feedback__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__action__Fibonacci_Feedback__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__action__Fibonacci_Feedback__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Fibonacci_Feedback src, ref Fibonacci_Feedback.CType dst)
    {
        rosidl_runtime_c__int32__Sequence__init(&dst.sequence, src.sequence.length); foreach(i;0U..src.sequence.length) { dst.sequence.data[i] = src.sequence[i]; }
    }

    static void convert(in Fibonacci_Feedback.CType src, ref Fibonacci_Feedback dst)
    {
        dst.sequence.length = src.sequence.size; foreach(i;0U..dst.sequence.length) { dst.sequence[i] = src.sequence.data[i]; }
    }
}

struct Fibonacci_SendGoal_Request
{
    unique_identifier_msgs.msg.UUID goal_id;
    test_msgs.action.Fibonacci_Goal goal;


    alias CType = test_msgs__action__Fibonacci_SendGoal_Request;
    alias CArrayType = test_msgs__action__Fibonacci_SendGoal_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__action__Fibonacci_SendGoal_Request();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__action__Fibonacci_SendGoal_Request__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__action__Fibonacci_SendGoal_Request__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__action__Fibonacci_SendGoal_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__action__Fibonacci_SendGoal_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Fibonacci_SendGoal_Request src, ref Fibonacci_SendGoal_Request.CType dst)
    {
        unique_identifier_msgs.msg.UUID.convert(src.goal_id, dst.goal_id);
        test_msgs.action.Fibonacci_Goal.convert(src.goal, dst.goal);
    }

    static void convert(in Fibonacci_SendGoal_Request.CType src, ref Fibonacci_SendGoal_Request dst)
    {
        unique_identifier_msgs.msg.UUID.convert(src.goal_id, dst.goal_id);
        test_msgs.action.Fibonacci_Goal.convert(src.goal, dst.goal);
    }
}

struct Fibonacci_SendGoal_Response
{
    bool accepted;
    builtin_interfaces.msg.Time stamp;


    alias CType = test_msgs__action__Fibonacci_SendGoal_Response;
    alias CArrayType = test_msgs__action__Fibonacci_SendGoal_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__action__Fibonacci_SendGoal_Response();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__action__Fibonacci_SendGoal_Response__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__action__Fibonacci_SendGoal_Response__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__action__Fibonacci_SendGoal_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__action__Fibonacci_SendGoal_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Fibonacci_SendGoal_Response src, ref Fibonacci_SendGoal_Response.CType dst)
    {
        dst.accepted = src.accepted;
        builtin_interfaces.msg.Time.convert(src.stamp, dst.stamp);
    }

    static void convert(in Fibonacci_SendGoal_Response.CType src, ref Fibonacci_SendGoal_Response dst)
    {
        dst.accepted = src.accepted;
        builtin_interfaces.msg.Time.convert(src.stamp, dst.stamp);
    }
}

struct Fibonacci_GetResult_Request
{
    unique_identifier_msgs.msg.UUID goal_id;


    alias CType = test_msgs__action__Fibonacci_GetResult_Request;
    alias CArrayType = test_msgs__action__Fibonacci_GetResult_Request__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__action__Fibonacci_GetResult_Request();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__action__Fibonacci_GetResult_Request__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__action__Fibonacci_GetResult_Request__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__action__Fibonacci_GetResult_Request__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__action__Fibonacci_GetResult_Request__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Fibonacci_GetResult_Request src, ref Fibonacci_GetResult_Request.CType dst)
    {
        unique_identifier_msgs.msg.UUID.convert(src.goal_id, dst.goal_id);
    }

    static void convert(in Fibonacci_GetResult_Request.CType src, ref Fibonacci_GetResult_Request dst)
    {
        unique_identifier_msgs.msg.UUID.convert(src.goal_id, dst.goal_id);
    }
}

struct Fibonacci_GetResult_Response
{
    byte status;
    test_msgs.action.Fibonacci_Result result;


    alias CType = test_msgs__action__Fibonacci_GetResult_Response;
    alias CArrayType = test_msgs__action__Fibonacci_GetResult_Response__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__action__Fibonacci_GetResult_Response();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__action__Fibonacci_GetResult_Response__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__action__Fibonacci_GetResult_Response__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__action__Fibonacci_GetResult_Response__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__action__Fibonacci_GetResult_Response__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Fibonacci_GetResult_Response src, ref Fibonacci_GetResult_Response.CType dst)
    {
        dst.status = src.status;
        test_msgs.action.Fibonacci_Result.convert(src.result, dst.result);
    }

    static void convert(in Fibonacci_GetResult_Response.CType src, ref Fibonacci_GetResult_Response dst)
    {
        dst.status = src.status;
        test_msgs.action.Fibonacci_Result.convert(src.result, dst.result);
    }
}

struct Fibonacci_FeedbackMessage
{
    unique_identifier_msgs.msg.UUID goal_id;
    test_msgs.action.Fibonacci_Feedback feedback;


    alias CType = test_msgs__action__Fibonacci_FeedbackMessage;
    alias CArrayType = test_msgs__action__Fibonacci_FeedbackMessage__Sequence;

    static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
    {
        return rosidl_typesupport_c__get_message_type_support_handle__test_msgs__action__Fibonacci_FeedbackMessage();
    }

    static CType * createC() @nogc nothrow
    {
        return test_msgs__action__Fibonacci_FeedbackMessage__create();
    }

    static void destroyC(ref CType * msg) @nogc nothrow
    {
        test_msgs__action__Fibonacci_FeedbackMessage__destroy(msg);
        msg = null;
    }

    static CArrayType * createC(size_t size) @nogc nothrow
    {
        return test_msgs__action__Fibonacci_FeedbackMessage__Sequence__create(size);
    }

    static void destroyC(ref CArrayType * array) @nogc nothrow
    {
        test_msgs__action__Fibonacci_FeedbackMessage__Sequence__destroy(array);
        array = null;
    }

    static void convert(in Fibonacci_FeedbackMessage src, ref Fibonacci_FeedbackMessage.CType dst)
    {
        unique_identifier_msgs.msg.UUID.convert(src.goal_id, dst.goal_id);
        test_msgs.action.Fibonacci_Feedback.convert(src.feedback, dst.feedback);
    }

    static void convert(in Fibonacci_FeedbackMessage.CType src, ref Fibonacci_FeedbackMessage dst)
    {
        unique_identifier_msgs.msg.UUID.convert(src.goal_id, dst.goal_id);
        test_msgs.action.Fibonacci_Feedback.convert(src.feedback, dst.feedback);
    }
}


