module test_helper.utils;

import std : replace, to, join, tempDir, buildPath, text, thisProcessID, split, environment, format;
import core.thread;
import std.datetime.systime;
import std.algorithm : canFind;

template makeUniqTemp(string f = __FILE__, int l = __LINE__)
{
    string makeUniqTemp()
    {
        enum f_text = f.replace("/", ".");

        enum l_text = l.to!string;
        enum base = "deleteme.dmd.unittest";

        return text(buildPath(tempDir(), [base, f_text, l_text].join(".")), ".pid", thisProcessID);
    }
}

template uniqueString()
{
    string uniqueString(string file = __FILE__, int line = __LINE__)(string additional = "")
    {
        return (file.replace("/", ".")
                .split(".")
                ~ format!"l%d"(line)
                ~ environment.get("ROS_DISTRO", "unknown")
                ~ additional).join("_");
    }
}

bool tryUntilTimeout(bool delegate() f, Duration timeout = 5000.msecs, Duration delta = 100.msecs)
{
    const end = Clock.currTime() + timeout;
    while (Clock.currTime() < end)
    {
        if (f())
        {
            return true;
        }
        Thread.sleep(delta);
    }
    return false;
}
