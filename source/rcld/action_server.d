module rcld.action_server;

import std.string;

import rcl;

import rcld.context;
import rcld.node;
import rcld.util;

interface BaseActionServer
{
    void terminate(Node node);
}

class ActionServer(T) : BaseActionServer
{
    this(Node node, in string name, Context context)
    {
        _handle = rcl_action_get_zero_initialized_server();
        auto options = rcl_action_server_get_default_options();
        auto typesupport = T.getTypesupport();
        safeCall(rcl_action_server_init(
                &_handle,
                &node._handle,
                context.getClockRef(),
                typesupport,
                name.toStringz,
                &options));
        node._action_servers ~= this;
    }

    override void terminate(Node node)
    {
        if (isValid())
        {
            safeCall(rcl_action_server_fini(&_handle, &node._handle));
            _handle.impl = null;
        }
    }

    bool isValid() const @nogc @safe
    {
        return _handle.impl !is null;
    }

    bool takeGoalRequest(out T.SendGoal.Request request, out rmw_request_id_t requestId)
    {
        auto cMsg = T.SendGoal.Request.createC();
        assert(cMsg);
        scope (exit)
            T.SendGoal.Request.destroyC(cMsg);
        auto ret = rcl_action_take_goal_request(&_handle, &requestId, cast(void*) cMsg);
        if (ret == RCL_RET_OK)
        {
            T.SendGoal.Request.convert(*cMsg, request);
        }
        return ret == RCL_RET_OK;
    }

    void sendGoalResponse(in T.SendGoal.Response response, ref rmw_request_id_t requestId)
    {
        auto cMsg = T.SendGoal.Response.createC();
        assert(cMsg);
        scope (exit)
            T.SendGoal.Response.destroyC(cMsg);
        T.SendGoal.Response.convert(response, *cMsg);
        safeCall(rcl_action_send_goal_response(&_handle, &requestId, cast(void*) cMsg));
    }

    void publishFeedback(in T.FeedbackMessage feedback)
    {
        auto cMsg = T.FeedbackMessage.createC();
        assert(cMsg);
        scope (exit)
            T.FeedbackMessage.destroyC(cMsg);
        T.FeedbackMessage.convert(feedback, *cMsg);
        safeCall(rcl_action_publish_feedback(&_handle, cast(void*) cMsg));
    }

    bool takeResultRequest(out T.GetResult.Request request, out rmw_request_id_t requestId)
    {
        auto cMsg = T.GetResult.Request.createC();
        assert(cMsg);
        scope (exit)
            T.GetResult.Request.destroyC(cMsg);
        auto ret = rcl_action_take_result_request(&_handle, &requestId, cast(void*) cMsg);
        if (ret == RCL_RET_OK)
        {
            T.GetResult.Request.convert(*cMsg, request);
        }
        return ret == RCL_RET_OK;
    }

    void sendResultResponse(in T.GetResult.Response response, ref rmw_request_id_t requestId)
    {
        auto cMsg = T.GetResult.Response.createC();
        assert(cMsg);
        scope (exit)
            T.GetResult.Response.destroyC(cMsg);
        T.GetResult.Response.convert(response, *cMsg);
        safeCall(rcl_action_send_result_response(&_handle, &requestId, cast(void*) cMsg));
    }

package:
    rcl_action_server_t _handle;
}

@("Check if the action server is available")
unittest
{
    import rcld;

    import std.algorithm : canFind;
    import std.exception : assertNotThrown;
    import std.process : executeShell, spawnShell, wait;

    import core.thread : Thread, msecs;

    import test_helper.utils;
    import test_msgs.action : Fibonacci;

    auto ns = uniqueString();

    auto context = new Context();
    auto node = new Node("action_server", ns, context);
    auto action = new ActionServer!Fibonacci(node, "fibonacci", context);

    int fibonacci(int v1, int v2)
    {
        return v1 + v2;
    }

    assert(tryUntilTimeout(() {
            const ret = executeShell("ros2 action list");
            assert(ret.status == 0);
            return ret.output.canFind(ns ~ "/fibonacci");
        }));

    auto ros2ActionCall = spawnShell(format(
            `ros2 action send_goal -f /%s/fibonacci test_msgs/action/Fibonacci '{order: 10}' > /dev/null`, ns
    ));

    auto sendGoalRequest = Fibonacci.SendGoal.Request();
    {
        rmw_request_id_t requestId;
        assert(tryUntilTimeout(() {
                return action.takeGoalRequest(sendGoalRequest, requestId);
            }));
        action.sendGoalResponse(Fibonacci.SendGoal.Response(true), requestId);
    }
    const order = sendGoalRequest.goal.order;
    const goal_id = sendGoalRequest.goal_id;

    assert(order == 10);
    int[] fibo = [1, 1];
    while (fibo.length < order)
    {
        fibo ~= fibonacci(fibo[$ - 2], fibo[$ - 1]);
        auto feedback = Fibonacci.FeedbackMessage(goal_id, Fibonacci.Feedback(fibo));
        action.publishFeedback(feedback);
    }

    auto getResultRequest = Fibonacci.GetResult.Request();
    {
        rmw_request_id_t requestId;
        assert(tryUntilTimeout(() {
                return action.takeResultRequest(getResultRequest, requestId);
            }));
        auto response = Fibonacci.GetResult.Response(4, Fibonacci.Result(fibo));
        action.sendResultResponse(response, requestId);
    }

    assert(wait(ros2ActionCall) == 0);
}
