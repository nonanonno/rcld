module rcld.util;
import rcl;
import std.format;
import std.string;
import std.stdio;

template safeCall()
{
    int safeCall(string file = __FILE__, int line = __LINE__)(lazy int exp)
    {
        assert(!rcl_error_is_set(), format!"%s:%d %s"(file, line, fromStringz(rcl_get_error_string()
                .str)));
        const ret = exp();
        assert(ret == RCL_RET_OK, format!"%s:%d (%d) %s"(file, line, ret, fromStringz(rcl_get_error_string()
                .str)));
        return ret;
    }
}
