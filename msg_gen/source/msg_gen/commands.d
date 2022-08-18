module msg_gen.commands;

import std.conv;
import std.path;
import std.stdio;
import std.file;
import std.algorithm;

import argparse;
import rosidl_parser;
import msg_gen.generator;
import msg_gen.templates;
import colored;

@(Command("").Description("Generate ROS2 message packages as DUB."))
struct GenerateMessagePackages
{
    @(PositionalArgument(0).Description("Output directory."))
    string output;

    @(NamedArgument("r", "regenerate")
            .Description("Clean `output` directory first before generating packages"))
    bool regenerate;

    @(NamedArgument("d", "dry-run")
            .Description("Parse ROS2 message packages without generating DUB."))
    bool dry_run;

    @(NamedArgument("p", "packages")
            .Description("Specify package names to be generated."))
    string[] packages;

    int onExecute()
    {
        const manifests = findROSIDLPackagesFromEnvironmentVariable();

        if (dry_run)
        {
            string[][] matrix;
            foreach (m; manifests)
            {
                const packageName = m.packageName;
                const packagePath = buildPath(m.installDirectory, "share", packageName);
                const msgNum = m.messages.length.to!string;
                const srvNum = m.services.length.to!string;
                const actionNum = m.actions.length.to!string;

                if (packages.length > 0 && !packages.canFind(packageName))
                {
                    continue;
                }
                if (ignorePackages.canFind(packageName))
                {
                    continue;
                }

                matrix ~= [
                    "Found", packageName.bold().to!string, "at", packagePath,
                    "with", msgNum,
                    "msgs", srvNum, "srvs", actionNum, "actions",
                ];

            }
            foreach (line; formatMatrix(matrix))
            {
                writeln(line);
            }
        }
        else
        {
            if (regenerate && exists(output))
            {
                rmdirRecurse(output);
            }

            foreach (m; manifests)
            {
                if (packages.length > 0 && !packages.canFind(m.packageName))
                {
                    continue;
                }
                if (ignorePackages.canFind(m.packageName))
                {
                    continue;
                }
                writeln("Generating ", m.packageName);
                generateDUBPackage(m, output);
            }
        }
        return 0;
    }

}

string[] formatMatrix(string[][] matrix)
{
    import std.format;
    import std.array;
    import std.range;
    import std.algorithm;

    if (matrix.length == 0)
    {
        return [];
    }

    auto sizes = new ulong[matrix[0].length];
    foreach (line; matrix)
    {
        foreach (i; 0 .. line.length)
        {
            sizes[i] = max(sizes[i], line[i].length);
        }
    }
    string[] rslt;
    foreach (line; matrix)
    {
        string[] l;
        foreach (i; 0 .. line.length)
        {
            l ~= format!"%*-s"(sizes[i], line[i]);
        }
        rslt ~= l.join(" ");
    }
    return rslt;
}
