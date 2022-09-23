import std;
import msg_gen;
import rosidl_parser;

enum targetPackages = [
        "test_msgs"
    ];

void main(string[] args)
{
    const srcDir = args[1];
    const outDir = args[2];
    const manifests = findROSIDLPackages(srcDir);
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

void make(string ifType, T)(string packageName, const T[] idls, const string[] deps, string outDir)
{
    const targetPaths = [
        "c": buildPath(outDir, packageName, "c", ifType ~ ".d"),
        "d": buildPath(outDir, packageName, ifType ~ ".d"),
    ];
    foreach (key; sourcesTepmlates.keys)
    {
        if (!idls)
        {
            return;
        }
        const target = targetPaths[key];
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
        forceWrite(target, renderSources(packageName, ifType, idls, key));
    }
}
