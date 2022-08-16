module msg_gen.commands;

import std.conv;
import std.path;
import std.stdio;
import std.file;

import jcli;
import rosidl_parser;
import msg_gen.generator;
import colored;

@CommandDefault("Generate ROS2 message packages as DUB.")
struct GenerateMessagePackages
{
    @ArgPositional("output", "Output directory.")
    string output = "~/.rcld/messages";

    @ArgNamed("r|regenerate", "Clean `output` directory first before generating packages.")
    Nullable!bool regenerate;

    @ArgNamed("dry_run", "Parse ROS2 message packages without generating DUB.")
    Nullable!bool dry_run;

    int onExecute()
    {
        const manifests = findROSIDLPackagesFromEnvironmentVariable();

        if (dry_run.get(false))
        {
            string[][] matrix;
            foreach (m; manifests)
            {
                const packageName = m.packageName;
                const packagePath = buildPath(m.installDirectory, "share", packageName);
                const msgNum = m.messages.length.to!string;
                const srvNum = m.services.length.to!string;
                const actionNum = m.actions.length.to!string;

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
            if (regenerate.get(false) && exists(output))
            {
                rmdirRecurse(output);
            }

            foreach (m; manifests)
            {
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
