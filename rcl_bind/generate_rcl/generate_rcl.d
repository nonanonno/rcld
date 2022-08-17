#!/usr/bin/env rdmd

import std.stdio;
import std.file;
import std.path;
import std.process;
import std.format;
import std.algorithm;
import std.exception;

/// ditto
const(string)[] selectIncludes(string rosDistro)
{
    return [
        "humble": [
            "/opt/ros/%s/include/rcl",
            "/opt/ros/%s/include/rcl_yaml_param_parser",
            "/opt/ros/%s/include/rcutils",
            "/opt/ros/%s/include/rosidl_runtime_c",
            "/opt/ros/%s/include/rosidl_typesupport_interface",
            "/opt/ros/%s/include/rmw",
        ],
        "rolling": [
            "/opt/ros/%s/include/rcl",
            "/opt/ros/%s/include/rcl_yaml_param_parser",
            "/opt/ros/%s/include/rcutils",
            "/opt/ros/%s/include/rosidl_runtime_c",
            "/opt/ros/%s/include/rosidl_typesupport_interface",
            "/opt/ros/%s/include/rmw",
        ],
    ].get(rosDistro, ["/opt/ros/%s/include"]);
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

void main(string[] args)
{
    immutable tmpl = `
module rcl.%s;

#include <rcl/rcl.h>
#include <rcl/graph.h>
#include <rosidl_runtime_c/action_type_support_struct.h>
#include <rosidl_runtime_c/message_type_support_struct.h>
#include <rosidl_runtime_c/primitives_sequence.h>
#include <rosidl_runtime_c/service_type_support_struct.h>
#include <rosidl_runtime_c/string_functions.h>
#include <rosidl_runtime_c/u16string_functions.h>
#include <rosidl_runtime_c/visibility_control.h>
#include <rosidl_runtime_c/message_initialization.h>
#include <rosidl_runtime_c/primitives_sequence_functions.h>
#include <rosidl_runtime_c/sequence_bound.h>
#include <rosidl_runtime_c/string_bound.h>
#include <rosidl_runtime_c/string.h>
#include <rosidl_runtime_c/u16string.h>
`;

    immutable rosDistro = args[1];

    std.file.write("/tmp/package.dpp", format!tmpl(rosDistro));

    "CC=clang dub run -y -q dpp -- --preprocess-only %-(%s %) /tmp/package.dpp".format(
        selectIncludes(rosDistro).map!(inc => "--include-path " ~ format(inc, rosDistro))
    ).run;
    "sed -i -e '/struct _IO_FILE/,/}/d' /tmp/package.d".run;
    "sed -i -e '/module rcl/a import core.stdc.stdio;' /tmp/package.d".run;
    "sed -i -e '/module rcl.%1$s/a version(%1$s) {' /tmp/package.d".format(rosDistro).run;
    "sed -i -e '$ a }' /tmp/package.d".run;
    "CC=clang dub run -y -q dfmt -- -i -c . /tmp/package.d".run;

    "/tmp/package.d".readText.write;
}
