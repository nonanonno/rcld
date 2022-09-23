module msg_gen.renderer;

import std.array;
import std.algorithm;
import std.format;

import rosidl_parser;
import mustache;

import msg_gen.templates;
import msg_gen.solver;

alias Mustache = MustacheEngine!string;

string renderManifest(in Manifest manifest, in string key)
{
    auto context = new Mustache.Context();
    context["package_name"] = manifest.packageName;
    context["license"] = manifest.license;
    context["install_directory"] = manifest.installDirectory;

    auto allIncludes =
        (manifest.messages.map!(m => m.includes)
                .array
                ~ manifest.services.map!(s => s.includes)
                .array
                ~ manifest.actions.map!(a => a.includes).array).join();

    auto uniqIncludes = makeUnuquePackages(allIncludes, [manifest.packageName]);
    foreach (inc; uniqIncludes)
    {
        if (ignorePackages.canFind(inc))
        {
            continue;
        }
        context.addSubContext("dependencies")["name"] = inc;
    }
    return Mustache().renderString(manifestsTemplates[key], context);
}

unittest
{
    import test_helper.ament : amentPrefixPath;

    auto manifests = findROSIDLPackages(amentPrefixPath);

    import std;

    renderManifest(manifests[0], "dub");
}

void addContext(Mustache.Context context, in Message message, const(AbstractType[AbstractType]) typedefMap)
{
    auto messageContext = context.addSubContext("messages");
    auto struct_ = message.structure;

    messageContext["name"] = struct_.namespacedType.name;
    messageContext["c_name"] = struct_.namespacedType.toCTypeName;
    messageContext["c_array_name"] = new UnboundedSequence(struct_.namespacedType).toCTypeName;

    foreach (member; struct_.members)
    {
        string name = member.name;
        if (name == "function")
        {
            name = "function_";
        }
        auto memberContext = messageContext.addSubContext("members");
        auto solvedType = solveType(struct_.namespacedType.namespaces, member.type, typedefMap);
        memberContext["type"] = solvedType.toDTypeName;
        memberContext["c_type"] = solvedType.toCTypeName;
        memberContext["name"] = name;

        if (member.hasAnnotation("default"))
        {

            memberContext.useSection("default?");
            auto annotation = member.getAnnotationValue("default");
            memberContext["value"] = annotation.split("=")[1].solveLiteral;
        }

        memberContext["assign_d_to_c"] = solvedType.createAssignFmtDtoC.format(name, name);
        memberContext["assign_c_to_d"] = solvedType.createAssignFmtCtoD.format(name, name);

    }

    foreach (constant; message.constants)
    {
        auto constantContext = messageContext.addSubContext("constants");
        constantContext["type"] = constant.type.toDTypeName();
        constantContext["name"] = constant.name;
        constantContext["value"] = constant.value.solveLiteral();
    }

}

unittest
{
    import test_helper.test_msgs;

    import std;

    auto basicTypes = parseAsMessage(TestMsgs.Msg.Strings);
    auto context = new Mustache.Context();
    addContext(context, basicTypes.data, basicTypes.typedefMap);

    Mustache().renderString(partsTemplates["d/messages"], context);
}

void addContext(Mustache.Context context, in Service service, const(AbstractType[AbstractType]) typedefMap)
{
    auto serviceContext = context.addSubContext("services");
    serviceContext["name"] = service.type.name;
    serviceContext["c_name"] = service.type.toCTypeName;

    addContext(context, service.request, typedefMap);
    addContext(context, service.response, typedefMap);
}

unittest
{
    import test_helper.test_msgs;

    import std;

    auto srv = parseAsService(TestMsgs.Srv.BasicTypes);
    auto context = new Mustache.Context();
    addContext(context, srv.data, srv.typedefMap);

    Mustache().renderString(partsTemplates["d/messages"], context);
    Mustache().renderString(partsTemplates["d/services"], context);
}

void addContext(Mustache.Context context, in Action action, const(AbstractType[AbstractType]) typedefMap)
{
    auto actionContext = context.addSubContext("actions");
    actionContext["name"] = action.type.name;
    actionContext["c_name"] = action.type.toCTypeName;

    addContext(context, action.goal, typedefMap);
    addContext(context, action.result, typedefMap);
    addContext(context, action.feedback, typedefMap);
    addContext(context, action.sendGoalService, typedefMap);
    addContext(context, action.getResultService, typedefMap);
    addContext(context, action.feedbackMessage, typedefMap);
}

unittest
{
    import test_helper.test_msgs;

    import std;

    auto act = parseAsAction(TestMsgs.Action.Fibonacci);
    auto context = new Mustache.Context();
    addContext(context, act.data, act.typedefMap);

    Mustache().renderString(partsTemplates["d/messages"], context);
    Mustache().renderString(partsTemplates["d/services"], context);
    Mustache().renderString(partsTemplates["d/actions"], context);
}

string renderSources(T)(string packageName, string ifType, const(IdlFile!T[]) idls, in string key)
{
    auto context = new Mustache.Context();

    context["package_name"] = packageName;
    context["if_type"] = ifType;
    auto allIncludes = idls.map!(m => m.includes).join();

    foreach (include; makeUniqueModules(allIncludes, [packageName ~ "." ~ ifType]))
    {
        auto dependContext = context.addSubContext("dependencies");
        auto tmp = include.split(".");
        assert(tmp.length == 2);
        dependContext["package_name"] = tmp[0];
        dependContext["if_type"] = tmp[1];
        if (!ignorePackages.canFind(tmp[0]))
        {
            auto cDependContext = context.addSubContext("c_dependencies");
            cDependContext["package_name"] = tmp[0];
            cDependContext["if_type"] = tmp[1];
        }
    }

    foreach (idl; idls)
    {
        addContext(context, idl.data, idl.typedefMap);
    }

    context["c_structs"] = Mustache().renderString(partsTemplates["c/structs"], context);
    context["c_functions"] = Mustache().renderString(partsTemplates["c/functions"], context);
    context["c_typesupports"] = Mustache().renderString(partsTemplates["c/typesupports"], context);
    context["d_actions"] = Mustache().renderString(partsTemplates["d/actions"], context);
    context["d_messages"] = Mustache().renderString(partsTemplates["d/messages"], context);
    context["d_services"] = Mustache().renderString(partsTemplates["d/services"], context);

    return Mustache().renderString(sourcesTepmlates[key], context);
}

@("render messages for C")
unittest
{
    import test_helper.test_msgs;

    import std;

    auto messages = [
        parseAsMessage(TestMsgs.Msg.Arrays),
        parseAsMessage(TestMsgs.Msg.BasicTypes),
        parseAsMessage(TestMsgs.Msg.BoundedSequences),
        parseAsMessage(TestMsgs.Msg.Constants),
        parseAsMessage(TestMsgs.Msg.Defaults),
        parseAsMessage(TestMsgs.Msg.Empty),
        parseAsMessage(TestMsgs.Msg.MultiNested),
        parseAsMessage(TestMsgs.Msg.Nested),
        parseAsMessage(TestMsgs.Msg.Strings),
        parseAsMessage(TestMsgs.Msg.WStrings),
    ];

    renderSources(TestMsgs.name, "msg", messages, "c");
}

@("render messages for D")
unittest
{
    import test_helper.test_msgs;

    import std;

    auto messages = [
        parseAsMessage(TestMsgs.Msg.Arrays),
        parseAsMessage(TestMsgs.Msg.BasicTypes),
        parseAsMessage(TestMsgs.Msg.BoundedSequences),
        parseAsMessage(TestMsgs.Msg.Constants),
        parseAsMessage(TestMsgs.Msg.Defaults),
        parseAsMessage(TestMsgs.Msg.Empty),
        parseAsMessage(TestMsgs.Msg.MultiNested),
        parseAsMessage(TestMsgs.Msg.Nested),
        parseAsMessage(TestMsgs.Msg.Strings),
        parseAsMessage(TestMsgs.Msg.WStrings),
    ];

    renderSources(TestMsgs.name, "msg", messages, "d");
}

@("render services for C")
unittest
{
    import test_helper.test_msgs;

    import std;

    auto services = [
        parseAsService(TestMsgs.Srv.Arrays),
        parseAsService(TestMsgs.Srv.BasicTypes),
        parseAsService(TestMsgs.Srv.Empty),
    ];

    renderSources(TestMsgs.name, "srv", services, "c");
}

@("render services for D")
unittest
{
    import test_helper.test_msgs;

    import std;

    auto services = [
        parseAsService(TestMsgs.Srv.Arrays),
        parseAsService(TestMsgs.Srv.BasicTypes),
        parseAsService(TestMsgs.Srv.Empty),
    ];

    renderSources(TestMsgs.name, "srv", services, "d");
}

@("render actions for C")
unittest
{
    import test_helper.test_msgs;

    import std;

    auto services = [
        parseAsAction(TestMsgs.Action.Fibonacci),
    ];

    renderSources(TestMsgs.name, "action", services, "c");
}

@("render actions for D")
unittest
{
    import test_helper.test_msgs;

    import std;

    auto services = [
        parseAsAction(TestMsgs.Action.Fibonacci),
    ];

    renderSources(TestMsgs.name, "action", services, "d");
}

string renderPath(string packageName, string ifType, string path)
{
    auto context = new Mustache.Context();
    context["package_name"] = packageName;
    context["if_type"] = ifType;
    return Mustache().renderString(path, context);
}
