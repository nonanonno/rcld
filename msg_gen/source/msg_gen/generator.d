module msg_gen.generator;

import std.path;
import std.file;
import std.array;
import std.algorithm;

import msg_gen.renderer;
import msg_gen.templates;
import msg_gen.solver;
import rosidl_parser;

void generateDUBPackage(in Manifest manifest, string outDir)
{
    const packageName = manifest.packageName;

    generateIdls!"msg"(packageName, manifest.messages, manifest.messageFiles, outDir);
    generateIdls!"srv"(packageName, manifest.services, manifest.serviceFiles, outDir);
    generateIdls!"action"(packageName, manifest.actions, manifest.actionFiles, outDir);

    if (manifest.messages.length > 0 || manifest.services.length > 0 || manifest.actions.length > 0)
    {
        foreach (key; manifestsTemplates.keys)
        {
            forceWrite(
                buildPath(outDir, renderPath(packageName, "_", manifestsPaths[key])),
                renderManifest(manifest, key),
            );
        }
    }
}

unittest
{
    import test_helper.utils;
    import test_helper.ament : amentPrefixPath;
    import std;

    auto manifests = findROSIDLPackages(amentPrefixPath);

    assert(manifests.length == 1);
    auto manifest = manifests[0];

    const tempDir = makeUniqTemp;

    scope (exit)
    {
        assert(exists(tempDir));
        rmdirRecurse(tempDir);
    }

    generateDUBPackage(manifest, tempDir);
}

void forceWrite(string output, string text)
{
    mkdirRecurse(output.dirName);

    write(output, text);
}

void generateIdls(string ifType, T)(string packageName, const T[] idls, const string[] deps, string outDir)
{
    if (!idls)
    {
        return;
    }
    foreach (key; sourcesTepmlates.keys)
    {

        const target = buildPath(outDir, renderPath(packageName, ifType, sourcesPaths[key]));
        bool doGenerate = !exists(target);
        foreach (dep; deps)
        {
            if (doGenerate)
            {
                break;
            }
            doGenerate = timeLastModified(dep) > timeLastModified(target);
        }
        if (doGenerate)
        {
            forceWrite(target, renderSources(packageName, ifType, idls, key));
        }

    }
}
