module test_helper;

import std : split, join, environment, format, replace;

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
