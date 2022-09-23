module rcld.action_client;

import std.string;

import rcl;

import rcld.node;
import rcld.util;

interface BaseActionClient
{
    void terminate(Node node);
}

class ActionClient(T) : BaseActionClient
{
    this(Node node, in string name)
    {
        _handle = rcl_action_get_zero_initialized_client();
        auto options = rcl_action_client_get_default_options();
        auto typesupport = T.getTypesupport();
        safeCall(rcl_action_client_init(
                &_handle,
                &node._handle,
                typesupport,
                name.toStringz(),
                &options));
        node._action_clients ~= this;
        _node = node;
    }

    override void terminate(Node node)
    {
        if (isValid())
        {
            safeCall(rcl_action_client_fini(&_handle, &node._handle));
            _handle.impl = null;
        }
    }

    bool isValid() const @nogc @safe
    {
        return _handle.impl !is null;
    }

    void sendGoalRequest(in T.SendGoal.Request request)
    {
        auto cMsg = T.SendGoal.Request.createC();
        assert(cMsg);
        scope (exit)
            T.SendGoal.Request.destroyC(cMsg);
        T.SendGoal.Request.convert(request, *cMsg);
        long seq;
        safeCall(rcl_action_send_goal_request(&_handle, cast(void*) cMsg, &seq));
    }

    bool takeGoalResponse(out T.SendGoal.Response response, out rmw_request_id_t requestId)
    {
        auto cMsg = T.SendGoal.Response.createC();
        assert(cMsg);
        scope (exit)
            T.SendGoal.Response.destroyC(cMsg);
        auto ret = rcl_action_take_goal_response(&_handle, &requestId, cast(void*) cMsg);
        if (ret == RCL_RET_OK)
        {
            T.SendGoal.Response.convert(*cMsg, response);
        }
        return ret == RCL_RET_OK;
    }

    bool takeFeedback(out T.FeedbackMessage feedback)
    {
        alias M = T.FeedbackMessage;
        auto cMsg = M.createC();
        assert(cMsg);
        scope (exit)
            M.destroyC(cMsg);
        auto ret = rcl_action_take_feedback(&_handle, cast(void*) cMsg);
        if (ret == RCL_RET_OK)
        {
            M.convert(*cMsg, feedback);
        }
        return ret == RCL_RET_OK;
    }

    void sendResultRequest(in T.GetResult.Request request)
    {
        alias M = T.GetResult.Request;
        auto cMsg = M.createC();
        assert(cMsg);
        scope (exit)
            M.destroyC(cMsg);
        M.convert(request, *cMsg);
        long seq;
        safeCall(rcl_action_send_result_request(&_handle, cast(void*) cMsg, &seq));
    }

    bool takeResultResponse(out T.GetResult.Response response, out rmw_request_id_t requestId)
    {
        alias M = T.GetResult.Response;
        auto cMsg = M.createC();
        assert(cMsg);
        scope (exit)
            M.destroyC(cMsg);
        auto ret = rcl_action_take_result_response(&_handle, &requestId, cast(void*) cMsg);
        if (ret == RCL_RET_OK)
        {
            M.convert(*cMsg, response);
        }
        return ret == RCL_RET_OK;
    }

    bool serverIsReady() const
    {
        bool isReady = false;
        safeCall(rcl_action_server_is_available(&_node._handle, &_handle, &isReady));
        return isReady;
    }

    package rcl_action_client_t _handle;
    package Node _node;
}

@("Check if the action client is avaiable")
unittest
{
    import rcld;

    import std.concurrency : spawn;
    import std.uuid : md5UUID;

    import core.thread : Thread, msecs;

    import test_helper.utils;
    import test_msgs.action : Fibonacci;
    import unique_identifier_msgs.msg : UUID;

    import std : writeln;

    auto ns = uniqueString();
    auto server = spawn((string ns) {
        auto context = Context.create();
        auto node = new Node("action_server", ns, context);
        auto actionServer = new ActionServer!Fibonacci(node, "fibonacci", context);

        auto sendGoalRequest = Fibonacci.SendGoal.Request();
        {
            rmw_request_id_t requestId;
            assert(tryUntilTimeout(() {
                    return actionServer.takeGoalRequest(sendGoalRequest, requestId);
                }));
            actionServer.sendGoalResponse(Fibonacci.SendGoal.Response(true), requestId);
        }
        const order = sendGoalRequest.goal.order;
        const goal_id = sendGoalRequest.goal_id;
        assert(order == 10);

        int[] fibo = [1, 1];
        while (fibo.length < order)
        {
            fibo ~= fibo[$ - 2] + fibo[$ - 1];
            auto feedback = Fibonacci.FeedbackMessage(goal_id, Fibonacci.Feedback(fibo));
            actionServer.publishFeedback(feedback);
        }

        auto getResultRequest = Fibonacci.GetResult.Request();
        {
            rmw_request_id_t requestId;
            assert(tryUntilTimeout(() {
                    return actionServer.takeResultRequest(getResultRequest, requestId);
                }));
            auto response = Fibonacci.GetResult.Response(4, Fibonacci.Result(fibo));
            actionServer.sendResultResponse(response, requestId);
        }
    }, ns);

    auto context = Context.create();
    auto node = new Node("action_client", ns, context);
    auto actionClient = new ActionClient!Fibonacci(node, "fibonacci");

    assert(tryUntilTimeout(() { return actionClient.serverIsReady(); }));

    auto uuid = UUID(md5UUID(ns).data);

    actionClient.sendGoalRequest(Fibonacci.SendGoal.Request(
            uuid,
            Fibonacci.Goal(10),
    ));
    auto sendGoalResponse = Fibonacci.SendGoal.Response();
    assert(
        tryUntilTimeout(() {
            rmw_request_id_t requestId;
            return actionClient.takeGoalResponse(sendGoalResponse, requestId);
        }));
    assert(sendGoalResponse.accepted);

    // feedback
    auto feedback = Fibonacci.FeedbackMessage();
    assert(tryUntilTimeout(() { return actionClient.takeFeedback(feedback); }));
    assert(feedback.feedback.sequence == [1, 1, 2]);
    assert(tryUntilTimeout(() { return actionClient.takeFeedback(feedback); }));
    assert(feedback.feedback.sequence == [1, 1, 2, 3]);
    assert(tryUntilTimeout(() { return actionClient.takeFeedback(feedback); }));
    assert(feedback.feedback.sequence == [1, 1, 2, 3, 5]);
    assert(tryUntilTimeout(() { return actionClient.takeFeedback(feedback); }));
    assert(feedback.feedback.sequence == [1, 1, 2, 3, 5, 8]);
    assert(tryUntilTimeout(() { return actionClient.takeFeedback(feedback); }));
    assert(feedback.feedback.sequence == [1, 1, 2, 3, 5, 8, 13]);
    assert(tryUntilTimeout(() { return actionClient.takeFeedback(feedback); }));
    assert(feedback.feedback.sequence == [1, 1, 2, 3, 5, 8, 13, 21]);
    assert(tryUntilTimeout(() { return actionClient.takeFeedback(feedback); }));
    assert(feedback.feedback.sequence == [1, 1, 2, 3, 5, 8, 13, 21, 34]);
    assert(tryUntilTimeout(() { return actionClient.takeFeedback(feedback); }));
    assert(feedback.feedback.sequence == [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]);

    // get result
    actionClient.sendResultRequest(Fibonacci.GetResult.Request(uuid));
    auto getResultResponse = Fibonacci.GetResult.Response();
    assert(tryUntilTimeout(() {
            rmw_request_id_t requestId;
            return actionClient.takeResultResponse(getResultResponse, requestId);
        }));
    assert(getResultResponse.status == 4);
    assert(getResultResponse.result.sequence == [
            1, 1, 2, 3, 5, 8, 13, 21, 34, 55
        ]);
}
