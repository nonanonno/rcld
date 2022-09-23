import std;
import msg_gen;
import rosidl_parser;

enum targetPackages = [
        "action_msgs",
        "builtin_interfaces",
        "composition_interfaces",
        "lifecycle_msgs",
        "rcl_interfaces",
        "rosgraph_msgs",
        "statistics_msgs",
        "unique_identifier_msgs",
    ];

void main(string[] args)
{
    const outDir = args[1];
    const manifests = findROSIDLPackagesFromEnvironmentVariable();
    foreach (m; manifests)
    {
        if (targetPackages.canFind(m.packageName))
        {
            generateModule(m, outDir);
        }
    }
}

void generateModule(in Manifest manifest, string outDir)
{
    const packageName = manifest.packageName;

    make!"msg"(packageName, manifest.messages, manifest.messageFiles, outDir);
    make!"srv"(packageName, manifest.services, manifest.serviceFiles, outDir);
    make!"action"(packageName, manifest.actions, manifest.actionFiles, outDir);
}

string deleteMatched(string text, string pattern)
{
    return replace(text, pattern, "");
}

void make(string ifType, T)(string packageName, const T[] idls, const string[] deps, string outDir)
{
    immutable key = "{{package_name}}/source/{{package_name}}/{{if_type}}.d";

    if (!idls)
    {
        return;
    }
    const target = buildPath(outDir, packageName, ifType ~ ".d");
    bool doGenerate = !exists(target);
    foreach (dep; deps)
    {
        if (doGenerate)
        {
            break;
        }
        doGenerate = timeLastModified(dep) > timeLastModified(target);
    }
    if (!doGenerate)
    {
        return;
    }
    forceWrite(
        target,
        deleteMatched(
            renderSources(packageName, ifType, idls, key),
            format("import %s.c.%s;\n", packageName, ifType)));
}
