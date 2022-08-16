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

    if (manifest.messages)
    {
        foreach (path; sourcesTepmlates.keys)
        {
            forceWrite(
                buildPath(outDir, renderPath(packageName, "msg", path)),
                renderSources(packageName, "msg", manifest.messages, path)
            );
        }
    }

    if (manifest.services)
    {
        foreach (path; sourcesTepmlates.keys)
        {
            forceWrite(
                buildPath(outDir, renderPath(packageName, "srv", path)),
                renderSources(packageName, "srv", manifest.services, path)
            );
        }
    }

    if (manifest.actions)
    {
        foreach (path; sourcesTepmlates.keys)
        {
            forceWrite(
                buildPath(outDir, renderPath(packageName, "action", path)),
                renderSources(packageName, "action", manifest.actions, path)
            );
        }
    }

    if (manifest.messages.length > 0 || manifest.services.length > 0 || manifest.actions.length > 0)
    {
        foreach (path; manifestsTemplates.keys)
        {
            forceWrite(
                buildPath(outDir, renderPath(packageName, "_", path)),
                renderManifest(manifest, path),
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
