#!/usr/bin/env rdmd

import std.stdio;
import std.file;
import std.path;
import std.process;
import std.format;
import std.algorithm;
import std.exception;
import std.json;
import std.array;

/// ditto
const(string)[] selectIncludes(string rosDistro, string[] includes)
{
    switch (rosDistro)
    {
    case "humble", "rolling":
        return includes.map!(s => "/opt/ros/%s/include/" ~ s).array;
    default:
        return ["/opt/ros/%s/include"];
    }
}

/// ditto
template run()
{
    void run(string file = __FILE__, int line = __LINE__)(string cmd)
    {
        const ret = spawnShell(cmd, environment.toAA()).wait;
        enforce(ret == 0, format!"%s:%d: Returns %d"(file, line, ret));
    }
}

/// ditto
string[] makeHeaders(JSONValue j, string[] left = [])
{
    switch (j.type())
    {
    case JSONType.object:
        return j.object().keys.map!((k) => makeHeaders(j.object()[k], left ~ [k])).array.join;
    case JSONType.array:
        return j.array().map!((v) => makeHeaders(v, left)).array.join;
    case JSONType.string:
        return [(left ~ [j.str()]).join("/")];
    default:
        assert(0);
    }
}

void main(string[] args)
{
    immutable rosDistro = args[1];
    immutable config = args[2];
    immutable tmpl = `
module rcl.%s;

%-(#include <%s>%|
%)
`;

    auto j = parseJSON(readText(config));
    auto includes = j.object().keys;
    auto headers = makeHeaders(j);

    std.file.write("/tmp/package.dpp", format(tmpl, rosDistro, headers));

    "CC=clang dub run -y -q dpp -- --preprocess-only %-(%s %) /tmp/package.dpp".format(
        selectIncludes(rosDistro, includes).map!(inc => "--include-path " ~ format(inc, rosDistro))
    ).run;
    "sed -i -e '/struct _IO_FILE/,/}/d' /tmp/package.d".run;
    "sed -i -e '/module rcl/a import core.stdc.stdio;' /tmp/package.d".run;
    "sed -i -e '/module rcl.%1$s/a version(%1$s) {' /tmp/package.d".format(rosDistro).run;
    "sed -i -e '$ a }' /tmp/package.d".run;
    "CC=clang dub run -y -q dfmt -- -i -c . /tmp/package.d".run;

    "/tmp/package.d".readText.write;
}
