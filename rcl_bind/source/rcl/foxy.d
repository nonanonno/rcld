/* Copyright (C) 1991-2020 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.  */

/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */

/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses Unicode 10.0.0.  Version 10.0 of the Unicode Standard is
   synchronized with ISO/IEC 10646:2017, fifth edition, plus
   the following additions from Amendment 1 to the fifth edition:
   - 56 emoji characters
   - 285 hentaigana
   - 3 additional Zanabazar Square characters */

module rcl.foxy;
version (foxy)
{
    import core.stdc.stdio;

    import core.stdc.config;
    import core.stdc.stdarg : va_list;
    static import core.simd;
    static import std.conv;

    struct Int128
    {
        long lower;
        long upper;
    }

    struct UInt128
    {
        ulong lower;
        ulong upper;
    }

    struct __locale_data
    {
        int dummy;
    } // FIXME

    alias _Bool = bool;
    struct dpp
    {
        static struct Opaque(int N)
        {
            void[N] bytes;
        }
        // Replacement for the gcc/clang intrinsic
        static bool isEmpty(T)()
        {
            return T.tupleof.length == 0;
        }

        static struct Move(T)
        {
            T* ptr;
        }
        // dmd bug causes a crash if T is passed by value.
        // Works fine with ldc.
        static auto move(T)(ref T value)
        {
            return Move!T(&value);
        }

        mixin template EnumD(string name, T, string prefix) if (is(T == enum))
        {
            private static string _memberMixinStr(string member)
            {
                import std.conv : text;
                import std.array : replace;

                return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
            }

            private static string _enumMixinStr()
            {
                import std.array : join;

                string[] ret;
                ret ~= "enum " ~ name ~ "{";
                static foreach (member; __traits(allMembers, T))
                {
                    ret ~= _memberMixinStr(member);
                }
                ret ~= "}";
                return ret.join("\n");
            }

            mixin(_enumMixinStr());
        }
    }

    extern (C)
    {

        alias wchar_t = int;

        alias size_t = c_ulong;

        alias ptrdiff_t = c_long;

        struct max_align_t
        {

            long __clang_max_align_nonce1;

            real __clang_max_align_nonce2;
        }

        alias fsfilcnt_t = c_ulong;

        alias fsblkcnt_t = c_ulong;

        alias blkcnt_t = c_long;

        alias blksize_t = c_long;

        alias register_t = c_long;

        alias u_int64_t = c_ulong;

        alias u_int32_t = uint;

        alias u_int16_t = ushort;

        alias u_int8_t = ubyte;

        alias key_t = int;

        alias caddr_t = char*;

        alias daddr_t = int;

        alias id_t = uint;

        alias pid_t = int;

        alias uid_t = uint;

        alias nlink_t = c_ulong;

        alias mode_t = uint;

        alias gid_t = uint;

        alias dev_t = c_ulong;

        alias ino_t = c_ulong;

        alias loff_t = c_long;

        alias fsid_t = __fsid_t;

        alias u_quad_t = c_ulong;

        alias quad_t = c_long;

        alias u_long = c_ulong;

        alias u_int = uint;

        alias u_short = ushort;

        alias u_char = ubyte;

        int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;

        int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;

        alias fd_mask = c_long;

        struct fd_set
        {

            c_long[16] __fds_bits;
        }

        alias __fd_mask = c_long;

        alias suseconds_t = c_long;

        enum _Anonymous_0
        {

            P_ALL = 0,

            P_PID = 1,

            P_PGID = 2,
        }

        enum P_ALL = _Anonymous_0.P_ALL;
        enum P_PID = _Anonymous_0.P_PID;
        enum P_PGID = _Anonymous_0.P_PGID;

        alias idtype_t = _Anonymous_0;

        static c_ulong __uint64_identity(c_ulong) @nogc nothrow;

        static uint __uint32_identity(uint) @nogc nothrow;

        static ushort __uint16_identity(ushort) @nogc nothrow;

        alias timer_t = void*;

        alias time_t = c_long;

        struct timeval
        {

            c_long tv_sec;

            c_long tv_usec;
        }

        struct timespec
        {

            c_long tv_sec;

            c_long tv_nsec;
        }

        alias _IO_lock_t = void;
        struct _IO_wide_data;
        struct _IO_codecvt;
        struct _IO_marker;

        alias sigset_t = __sigset_t;

        alias locale_t = __locale_struct*;

        alias clockid_t = int;

        alias clock_t = c_long;

        struct __sigset_t
        {

            c_ulong[16] __val;
        }

        struct __mbstate_t
        {

            int __count;

            static union _Anonymous_1
            {

                uint __wch;

                char[4] __wchb;
            }

            _Anonymous_1 __value;
        }

        alias __locale_t = __locale_struct*;

        struct __locale_struct
        {

            __locale_data*[13] __locales;

            const(ushort)* __ctype_b;

            const(int)* __ctype_tolower;

            const(int)* __ctype_toupper;

            const(char)*[13] __names;
        }

        struct _G_fpos_t
        {

            c_long __pos;

            __mbstate_t __state;
        }

        alias __fpos_t = _G_fpos_t;

        struct _G_fpos64_t
        {

            c_long __pos;

            __mbstate_t __state;
        }

        alias __fpos64_t = _G_fpos64_t;

        alias __FILE = _IO_FILE;

        alias FILE = _IO_FILE;

        alias __sig_atomic_t = int;

        alias __socklen_t = uint;

        alias __intptr_t = c_long;

        alias __caddr_t = char*;

        alias __loff_t = c_long;

        alias __syscall_ulong_t = c_ulong;

        alias __syscall_slong_t = c_long;

        alias __ssize_t = c_long;

        alias __fsword_t = c_long;

        alias __fsfilcnt64_t = c_ulong;

        alias __fsfilcnt_t = c_ulong;

        alias rcl_allocator_t = rcutils_allocator_t;

        alias __fsblkcnt64_t = c_ulong;
        struct rcl_arguments_impl_t;
        /// Hold output of parsing command line arguments.
        struct rcl_arguments_t
        {
            /// Private implementation pointer.
            rcl_arguments_impl_t* impl;
        }

        alias __fsblkcnt_t = c_ulong;

        alias __blkcnt64_t = c_long;

        alias __blkcnt_t = c_long;

        alias __blksize_t = c_long;

        alias __timer_t = void*;
        /// Return a rcl_arguments_t struct with members initialized to `NULL`.
        rcl_arguments_t rcl_get_zero_initialized_arguments() @nogc nothrow;
        /// Parse command line arguments into a structure usable by code.
        /**
 * \sa rcl_get_zero_initialized_arguments()
 *
 * ROS arguments are expected to be scoped by a leading `--ros-args` flag and a trailing double
 * dash token `--` which may be elided if no non-ROS arguments follow after the last `--ros-args`.
 *
 * Remap rule parsing is supported via `-r/--remap` flags e.g. `--remap from:=to` or `-r from:=to`.
 * Successfully parsed remap rules are stored in the order they were given in `argv`.
 * If given arguments `{"__ns:=/foo", "__ns:=/bar"}` then the namespace used by nodes in this
 * process will be `/foo` and not `/bar`.
 *
 * \sa rcl_remap_topic_name()
 * \sa rcl_remap_service_name()
 * \sa rcl_remap_node_name()
 * \sa rcl_remap_node_namespace()
 *
 * Parameter override rule parsing is supported via `-p/--param` flags e.g. `--param name:=value`
 * or `-p name:=value`.
 *
 * The default log level will be parsed as `--log-level level`, where `level` is a name
 * representing one of the log levels in the `RCUTILS_LOG_SEVERITY` enum, e.g. `info`, `debug`,
 * `warn`, not case sensitive.
 * If multiple of these rules are found, the last one parsed will be used.
 *
 * If an argument does not appear to be a valid ROS argument e.g. a `-r/--remap` flag followed by
 * anything but a valid remap rule, parsing will fail immediately.
 *
 * If an argument does not appear to be a known ROS argument, then it is skipped and left unparsed.
 *
 * \sa rcl_arguments_get_count_unparsed_ros()
 * \sa rcl_arguments_get_unparsed_ros()
 *
 * All arguments found outside a `--ros-args ... --` scope are skipped and left unparsed.
 *
 * \sa rcl_arguments_get_count_unparsed()
 * \sa rcl_arguments_get_unparsed()
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] argc The number of arguments in argv.
 * \param[in] argv The values of the arguments.
 * \param[in] allocator A valid allocator.
 * \param[out] args_output A structure that will contain the result of parsing.
 *   Must be zero initialized before use.
 * \return `RCL_RET_OK` if the arguments were parsed successfully, or
 * \return `RCL_RET_INVALID_ROS_ARGS` if an invalid ROS argument is found, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_parse_arguments(int, const(const(char)*)*,
                rcutils_allocator_t, rcl_arguments_t*) @nogc nothrow;
        /// Return the number of arguments that were not ROS specific arguments.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] args An arguments structure that has been parsed.
 * \return number of unparsed arguments, or
 * \return -1 if args is `NULL` or zero initialized.
 */
        int rcl_arguments_get_count_unparsed(const(rcl_arguments_t)*) @nogc nothrow;
        /// Return a list of indices to non ROS specific arguments.
        /**
 * Non ROS specific arguments may have been provided i.e. arguments outside a '--ros-args' scope.
 * This function populates an array of indices to these arguments in the original argv array.
 * Since the first argument is always assumed to be a process name, the list will always contain
 * the index 0.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] args An arguments structure that has been parsed.
 * \param[in] allocator A valid allocator.
 * \param[out] output_unparsed_indices An allocated array of indices into the original argv array.
 *   This array must be deallocated by the caller using the given allocator.
 *   If there are no unparsed args then the output will be set to NULL.
 * \return `RCL_RET_OK` if everything goes correctly, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_arguments_get_unparsed(const(rcl_arguments_t)*, rcutils_allocator_t, int**) @nogc nothrow;
        /// Return the number of ROS specific arguments that were not successfully parsed.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] args An arguments structure that has been parsed.
 * \return number of unparsed ROS specific arguments, or
 * \return -1 if args is `NULL` or zero initialized.
 */
        int rcl_arguments_get_count_unparsed_ros(const(rcl_arguments_t)*) @nogc nothrow;
        /// Return a list of indices to unknown ROS specific arguments that were left unparsed.
        /**
 * Some ROS specific arguments may not have been recognized, or were not intended to be
 * parsed by rcl.
 * This function populates an array of indices to these arguments in the original argv array.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] args An arguments structure that has been parsed.
 * \param[in] allocator A valid allocator.
 * \param[out] output_unparsed_ros_indices An allocated array of indices into the original argv array.
 *   This array must be deallocated by the caller using the given allocator.
 *   If there are no unparsed ROS specific arguments then the output will be set to NULL.
 * \return `RCL_RET_OK` if everything goes correctly, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_arguments_get_unparsed_ros(const(rcl_arguments_t)*, rcutils_allocator_t, int**) @nogc nothrow;
        /// Return the number of parameter yaml files given in the arguments.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] args An arguments structure that has been parsed.
 * \return number of yaml files, or
 * \return -1 if args is `NULL` or zero initialized.
 */
        int rcl_arguments_get_param_files_count(const(rcl_arguments_t)*) @nogc nothrow;
        /// Return a list of yaml parameter file paths specified on the command line.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] arguments An arguments structure that has been parsed.
 * \param[in] allocator A valid allocator.
 * \param[out] parameter_files An allocated array of paramter file names.
 *   This array must be deallocated by the caller using the given allocator.
 *   The output is NULL if there were no paramter files.
 * \return `RCL_RET_OK` if everything goes correctly, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_arguments_get_param_files(const(rcl_arguments_t)*, rcutils_allocator_t, char***) @nogc nothrow;
        /// Return all parameter overrides parsed from the command line.
        /**
 * Parameter overrides are parsed directly from command line arguments and
 * parameter files provided in the command line.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] arguments An arguments structure that has been parsed.
 * \param[out] parameter_overrides Parameter overrides as parsed from command line arguments.
 *   This structure must be finalized by the caller.
 *   The output is NULL if no parameter overrides were parsed.
 * \return `RCL_RET_OK` if everything goes correctly, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_arguments_get_param_overrides(const(rcl_arguments_t)*, rcl_params_s**) @nogc nothrow;
        /// Return a list of arguments with ROS-specific arguments removed.
        /**
 * Some arguments may not have been intended as ROS arguments.
 * This function populates an array of the aruments in a new argv array.
 * Since the first argument is always assumed to be a process name, the list
 * will always contain the first value from the argument vector.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] argv The argument vector
 * \param[in] args An arguments structure that has been parsed.
 * \param[in] allocator A valid allocator.
 * \param[out] nonros_argc The count of arguments that aren't ROS-specific
 * \param[out] nonros_argv An allocated array of arguments that aren't ROS-specific
 *   This array must be deallocated by the caller using the given allocator.
 *   If there are no non-ROS args, then the output will be set to NULL.
 * \return `RCL_RET_OK` if everything goes correctly, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_remove_ros_arguments(const(const(char)*)*,
                const(rcl_arguments_t)*, rcutils_allocator_t, int*, const(char)***) @nogc nothrow;
        /// Copy one arguments structure into another.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] args The structure to be copied.
 *  Its allocator is used to copy memory into the new structure.
 * \param[out] args_out A zero-initialized arguments structure to be copied into.
 * \return `RCL_RET_OK` if the structure was copied successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_arguments_copy(const(rcl_arguments_t)*, rcl_arguments_t*) @nogc nothrow;
        /// Reclaim resources held inside rcl_arguments_t structure.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] args The structure to be deallocated.
 * \return `RCL_RET_OK` if the memory was successfully freed, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_arguments_fini(rcl_arguments_t*) @nogc nothrow;

        alias __clockid_t = int;
        struct rcl_client_impl_t;
        /// Structure which encapsulates a ROS Client.
        struct rcl_client_t
        {
            /// Pointer to the client implementation
            rcl_client_impl_t* impl;
        }
        /// Options available for a rcl_client_t.
        struct rcl_client_options_t
        {
            /// Middleware quality of service settings for the client.
            rmw_qos_profile_t qos;
            /// Custom allocator for the client, used for incidental allocations.
            /** For default behavior (malloc/free), use: rcl_get_default_allocator() */
            rcutils_allocator_t allocator;
        }
        /// Return a rcl_client_t struct with members set to `NULL`.
        /**
 * Should be called to get a null rcl_client_t before passing to
 * rcl_client_init().
 */
        rcl_client_t rcl_get_zero_initialized_client() @nogc nothrow;
        /// Initialize a rcl client.
        /**
 * After calling this function on a rcl_client_t, it can be used to send
 * requests of the given type by calling rcl_send_request().
 * If the request is received by a (possibly remote) service and if the service
 * sends a response, the client can access the response through
 * rcl_take_response() once the response is available to the client.
 *
 * The given rcl_node_t must be valid and the resulting rcl_client_t is only
 * valid as long as the given rcl_node_t remains valid.
 *
 * The rosidl_service_type_support_t is obtained on a per `.srv` type basis.
 * When the user defines a ROS service, code is generated which provides the
 * required rosidl_service_type_support_t object.
 * This object can be obtained using a language appropriate mechanism.
 * \todo TODO(wjwwood) write these instructions once and link to it instead
 *
 * For C, a macro can be used (for example `example_interfaces/AddTwoInts`):
 *
 * ```c
 * #include <rosidl_runtime_c/service_type_support_struct.h>
 * #include <example_interfaces/srv/add_two_ints.h>
 *
 * const rosidl_service_type_support_t * ts =
 *   ROSIDL_GET_SRV_TYPE_SUPPORT(example_interfaces, srv, AddTwoInts);
 * ```
 *
 * For C++, a template function is used:
 *
 * ```cpp
 * #include <rosidl_typesupport_cpp/service_type_support.hpp>
 * #include <example_interfaces/srv/add_two_ints.hpp>
 *
 * using rosidl_typesupport_cpp::get_service_type_support_handle;
 * const rosidl_service_type_support_t * ts =
 *   get_service_type_support_handle<example_interfaces::srv::AddTwoInts>();
 * ```
 *
 * The rosidl_service_type_support_t object contains service type specific
 * information used to send or take requests and responses.
 *
 * The topic name must be a c string which follows the topic and service name
 * format rules for unexpanded names, also known as non-fully qualified names:
 *
 * \see rcl_expand_topic_name
 *
 * The options struct allows the user to set the quality of service settings as
 * well as a custom allocator which is used when initializing/finalizing the
 * client to allocate space for incidentals, e.g. the service name string.
 *
 * Expected usage (for C services):
 *
 * ```c
 * #include <rcl/rcl.h>
 * #include <rosidl_runtime_c/service_type_support_struct.h>
 * #include <example_interfaces/srv/add_two_ints.h>
 *
 * rcl_node_t node = rcl_get_zero_initialized_node();
 * rcl_node_options_t node_ops = rcl_node_get_default_options();
 * rcl_ret_t ret = rcl_node_init(&node, "node_name", "/my_namespace", &node_ops);
 * // ... error handling
 * const rosidl_service_type_support_t * ts =
 *   ROSIDL_GET_SRV_TYPE_SUPPORT(example_interfaces, srv, AddTwoInts);
 * rcl_client_t client = rcl_get_zero_initialized_client();
 * rcl_client_options_t client_ops = rcl_client_get_default_options();
 * ret = rcl_client_init(&client, &node, ts, "add_two_ints", &client_ops);
 * // ... error handling, and on shutdown do finalization:
 * ret = rcl_client_fini(&client, &node);
 * // ... error handling for rcl_client_fini()
 * ret = rcl_node_fini(&node);
 * // ... error handling for rcl_node_fini()
 * ```
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] client preallocated rcl_client_t structure
 * \param[in] node valid rcl_node_t
 * \param[in] type_support type support object for the service's type
 * \param[in] service_name the name of the service to request
 * \param[in] options client options, including quality of service settings
 * \return `RCL_RET_OK` if the client was initialized successfully, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_ALREADY_INIT` if the client is already initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory fails, or
 * \return `RCL_RET_SERVICE_NAME_INVALID` if the given service name is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_client_init(rcl_client_t*, const(rcl_node_t)*,
                const(rosidl_service_type_support_t)*, const(char)*,
                const(rcl_client_options_t)*) @nogc nothrow;
        /// Finalize a rcl_client_t.
        /**
 * After calling this function, calls to rcl_send_request() and
 * rcl_take_response() will fail when using this client.
 * However, the given node handle is still valid.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] client handle to the client to be finalized
 * \param[in] node a valid (not finalized) handle to the node used to create the client
 * \return `RCL_RET_OK` if client was finalized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_client_fini(rcl_client_t*, rcl_node_t*) @nogc nothrow;
        /// Return the default client options in a rcl_client_options_t.
        /**
 * The defaults are:
 *
 * - qos = rmw_qos_profile_services_default
 * - allocator = rcl_get_default_allocator()
 */
        rcl_client_options_t rcl_client_get_default_options() @nogc nothrow;
        /// Send a ROS request using a client.
        /**
 * It is the job of the caller to ensure that the type of the `ros_request`
 * parameter and the type associate with the client (via the type support)
 * match.
 * Passing a different type to `send_request` produces undefined behavior and
 * cannot be checked by this function and therefore no deliberate error will
 * occur.
 *
 * rcl_send_request() is an non-blocking call.
 *
 * The ROS request message given by the `ros_request` void pointer is always
 * owned by the calling code, but should remain constant during `send_request`.
 *
 * This function is thread safe so long as access to both the client and the
 * `ros_request` is synchronized.
 * That means that calling rcl_send_request() from multiple threads is allowed,
 * but calling rcl_send_request() at the same time as non-thread safe client
 * functions is not, e.g. calling rcl_send_request() and rcl_client_fini()
 * concurrently is not allowed.
 * Before calling rcl_send_request() the message can change and after calling
 * rcl_send_request() the message can change, but it cannot be changed during
 * the `send_request` call.
 * The same `ros_request`, however, can be passed to multiple calls of
 * rcl_send_request() simultaneously, even if the clients differ.
 * The `ros_request` is unmodified by rcl_send_request().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] for unique pairs of clients and requests, see above for more</i>
 *
 * \param[in] client handle to the client which will make the response
 * \param[in] ros_request type-erased pointer to the ROS request message
 * \param[out] sequence_number the sequence number
 * \return `RCL_RET_OK` if the request was sent successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_CLIENT_INVALID` if the client is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_send_request(const(rcl_client_t)*, const(void)*, c_long*) @nogc nothrow;
        /// Take a ROS response using a client
        /**
 * It is the job of the caller to ensure that the type of the `ros_response`
 * parameter and the type associate with the client (via the type support)
 * match.
 * Passing a different type to take_response produces undefined behavior and
 * cannot be checked by this function and therefore no deliberate error will
 * occur.
 * The request_header is an rmw struct for meta-information about the request
 * sent (e.g. the sequence number).
 * The caller must provide a pointer to an allocated struct.
 * This function will populate the struct's fields.
 * `ros_response` should point to an already allocated ROS response message
 * struct of the correct type, into which the response from the service will be
 * copied.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] only if required when filling the message, avoided for fixed sizes</i>
 *
 * \param[in] client handle to the client which will take the response
 * \param[inout] request_header pointer to the request header
 * \param[inout] ros_response type-erased pointer to the ROS response message
 * \return `RCL_RET_OK` if the response was taken successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_CLIENT_INVALID` if the client is invalid, or
 * \return `RCL_RET_CLIENT_TAKE_FAILED` if take failed but no error occurred
 *         in the middleware, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_take_response_with_info(const(rcl_client_t)*, rmw_service_info_t*, void*) @nogc nothrow;
        /// backwards compatibility function that takes a rmw_request_id_t only
        int rcl_take_response(const(rcl_client_t)*, rmw_request_id_t*, void*) @nogc nothrow;
        /// Get the name of the service that this client will request a response from.
        /**
 * This function returns the client's internal service name string.
 * This function can fail, and therefore return `NULL`, if the:
 *   - client is `NULL`
 *   - client is invalid (never called init, called fini, or invalid node)
 *
 * The returned string is only valid as long as the rcl_client_t is valid.
 * The value of the string may change if the service name changes, and therefore
 * copying the string is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] client pointer to the client
 * \return name string if successful, otherwise `NULL`
 */
        const(char)* rcl_client_get_service_name(const(rcl_client_t)*) @nogc nothrow;
        /// Return the rcl client options.
        /**
 * This function returns the client's internal options struct.
 * This function can fail, and therefore return `NULL`, if the:
 *   - client is `NULL`
 *   - client is invalid (never called init, called fini, or invalid node)
 *
 * The returned struct is only valid as long as the rcl_client_t is valid.
 * The values in the struct may change if the options of the client change,
 * and therefore copying the struct is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] client pointer to the client
 * \return options struct if successful, otherwise `NULL`
 */
        const(rcl_client_options_t)* rcl_client_get_options(const(rcl_client_t)*) @nogc nothrow;
        /// Return the rmw client handle.
        /**
 * The handle returned is a pointer to the internally held rmw handle.
 * This function can fail, and therefore return `NULL`, if the:
 *   - client is `NULL`
 *   - client is invalid (never called init, called fini, or invalid node)
 *
 * The returned handle is made invalid if the client is finalized or if
 * rcl_shutdown() is called.
 * The returned handle is not guaranteed to be valid for the life time of the
 * client as it may be finalized and recreated itself.
 * Therefore it is recommended to get the handle from the client using
 * this function each time it is needed and avoid use of the handle
 * concurrently with functions that might change it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] client pointer to the rcl client
 * \return rmw client handle if successful, otherwise `NULL`
 */
        rmw_client_t* rcl_client_get_rmw_handle(const(rcl_client_t)*) @nogc nothrow;
        /// Check that the client is valid.
        /**
 * The bool returned is `false` if client is invalid.
 * The bool returned is `true` otherwise.
 * In the case where `false` is to be returned, an error message is set.
 * This function cannot fail.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] client pointer to the rcl client
 * \return `true` if `client` is valid, otherwise `false`
 */
        bool rcl_client_is_valid(const(rcl_client_t)*) @nogc nothrow;

        alias rcl_context_instance_id_t = c_ulong;
        struct rcl_context_impl_t;
        /// Encapsulates the non-global state of an init/shutdown cycle.
        /**
 * The context is used in the creation of top level entities like nodes and
 * guard conditions, as well as to shutdown a specific instance of init.
 *
 * Here is a diagram of a typical context's lifecycle:
 *
 * ```
 *    +---------------+
 *    |               |
 * +--> uninitialized +---> rcl_get_zero_initialized_context() +
 * |  |               |                                        |
 * |  +---------------+                                        |
 * |                                                           |
 * |           +-----------------------------------------------+
 * |           |
 * |  +--------v---------+                +-----------------------+
 * |  |                  |                |                       |
 * |  | zero-initialized +-> rcl_init() +-> initialized and valid +-> rcl_shutdown() +
 * |  |                  |                |                       |                  |
 * |  +------------------+                +-----------------------+                  |
 * |                                                                                 |
 * |               +-----------------------------------------------------------------+
 * |               |
 * |  +------------v------------+
 * |  |                         |
 * |  | initialized but invalid +---> finalize all entities, then rcl_context_fini() +
 * |  |                         |                                                    |
 * |  +-------------------------+                                                    |
 * |                                                                                 |
 * +---------------------------------------------------------------------------------+
 * ```
 *
 * A declared but not defined `rcl_context_t` instance is considered to be
 * "uninitialized", and passing an uninitialized context to any functions will
 * result in undefined behavior.
 * Some functions, like `rcl_init()` require the context instance to be
 * zero initialized (all members set to "zero" state) before use.
 *
 * Zero initialization of an `rcl_context_t` should be done with
 * `rcl_get_zero_initialized_context()`, which ensures the context is in a safe
 * state for initialization with `rcl_init()`.
 *
 * Initialization of an `rcl_context_t` should be done with `rcl_init()`, after
 * which the context is considered both initialized and valid.
 * After initialization it can be used in the creation of other entities like
 * nodes and guard conditions.
 *
 * At any time the context can be invalidated by calling `rcl_shutdown()` on
 * the `rcl_context_t`, after which the context is still initialized but now
 * invalid.
 *
 * Invalidation indicates to other entities that the context was shutdown, but
 * is still accessible for use during cleanup of themselves.
 *
 * After being invalidated, and after all of the entities which used it have
 * been finalized, the context should be finalized with `rcl_context_fini()`.
 *
 * Finalizing the context while entities which have copies of it have not yet
 * been finalized is undefined behavior.
 * Therefore, the context's lifetime (between calls to `rcl_init()` and
 * `rcl_context_fini()`) should exceed the lifetime of all entities which use
 * it directly (e.g. nodes and guard conditions) or indirectly (e.g.
 * subscriptions and topics).
 */
        struct rcl_context_t
        {
            /// Global arguments for all nodes which share this context.
            /** Typically generated by the parsing of argc/argv in `rcl_init()`. */
            rcl_arguments_t global_arguments;
            /// Implementation specific pointer.
            rcl_context_impl_t* impl;
            /// Private storage for instance ID atomic.
            /**
   * Accessing the instance id should be done using the function
   * `rcl_context_get_instance_id()` because the instance id's type is an
   * atomic and needs to be accessed properly to ensure safety.
   *
   * The instance id should not be changed manually - doing so is undefined
   * behavior.
   *
   * The instance id cannot be protected within the `impl` pointer's type
   * because it needs to be accessible even when the context is zero
   * initialized and therefore `impl` is `NULL`.
   * Specifically, storing the instance id in the `impl` would introduce a
   * race condition between accessing it and finalizing the context.
   * Additionally, C11 atomics (i.e. "stdatomic.h") cannot be used directly
   * here in the case that this header is included into a C++ program.
   * See this paper for an effort to make this possible in the future:
   *   http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0943r1.html
   */
            ubyte[8] instance_id_storage;
        }
        /// Return a zero initialization context object.
        rcl_context_t rcl_get_zero_initialized_context() @nogc nothrow;
        /// Finalize a context.
        /**
 * The context to be finalized must have been previously initialized with
 * `rcl_init()`, and then later invalidated with `rcl_shutdown()`.
 * A zero-initialized context that has not been initialized can be finalized.
 * If context is `NULL`, then `RCL_RET_INVALID_ARGUMENT` is returned.
 * If context is zero-initialized, then `RCL_RET_OK` is returned.
 * If context is initialized and valid (`rcl_shutdown()` was not called on it),
 * then `RCL_RET_INVALID_ARGUMENT` is returned.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \param[inout] context object to be finalized.
 * \return `RCL_RET_OK` if the shutdown was completed successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occur.
 */
        int rcl_context_fini(rcl_context_t*) @nogc nothrow;
        /// Return the init options used during initialization for this context.
        /**
 * This function can fail and return `NULL` if:
 *   - context is NULL
 *   - context is zero-initialized, e.g. context->impl is `NULL`
 *
 * If context is uninitialized then that is undefined behavior.
 *
 * If `NULL` is returned an error message will have been set.
 *
 * The options are for reference only, and therefore the returned pointer is
 * const.
 * Changing the values in the options is undefined behavior but will likely
 * have no effect.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * \param[in] context object from which the init options should be retrieved
 * \return pointer to the the init options, or
 * \return `NULL` if there was an error
 */
        const(rcl_init_options_t)* rcl_context_get_init_options(rcl_context_t*) @nogc nothrow;
        /// Returns an unsigned integer that is unique to the given context, or `0` if invalid.
        /**
 * The given context must be non-`NULL`, but does not need to be initialized or valid.
 * If context is `NULL`, then `0` will be returned.
 * If context is uninitialized, then it is undefined behavior.
 *
 * The instance ID may be `0` if the context is zero-initialized or if the
 * context has been invalidated by `rcl_shutdown()`.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \param[in] context object from which the instance id should be retrieved
 * \return a unique id specific to this context instance, or
 * \return `0` if invalid, or
 * \return `0` if context is `NULL`
 */
        c_ulong rcl_context_get_instance_id(rcl_context_t*) @nogc nothrow;
        /// Return `true` if the given context is currently valid, otherwise `false`.
        /**
 * If context is `NULL`, then `false` is returned.
 * If context is zero-initialized, then `false` is returned.
 * If context is uninitialized, then it is undefined behavior.
 *
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \param[in] context object which should be checked for validity
 * \return `true` if valid, otherwise `false`
 */
        bool rcl_context_is_valid(rcl_context_t*) @nogc nothrow;
        /// Return pointer to the rmw context if the given context is currently valid, otherwise `NULL`.
        /**
 * If context is `NULL`, then `NULL` is returned.
 * If context is zero-initialized, then `NULL` is returned.
 * If context is uninitialized, then it is undefined behavior.
 *
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \param[in] context object from which the rmw context should be retrieved.
 * \return pointer to rmw context if valid, otherwise `NULL`
 */
        rmw_context_t* rcl_context_get_rmw_context(rcl_context_t*) @nogc nothrow;

        alias __key_t = int;

        extern __gshared const(const(char)*) RCL_DOMAIN_ID_ENV_VAR;
        /// Determine the default domain ID, based on the environment.
        /**
 * \param[out] domain_id Must not be NULL.
 * \returns RCL_RET_INVALID_ARGUMENT if an argument is invalid, or,
 * \returns RCL_RET_ERROR in case of an unexpected error, or,
 * \returns RCL_RET_OK.
 */
        int rcl_get_default_domain_id(c_ulong*) @nogc nothrow;

        alias __daddr_t = int;

        enum rcl_publisher_event_type_t
        {

            RCL_PUBLISHER_OFFERED_DEADLINE_MISSED = 0,

            RCL_PUBLISHER_LIVELINESS_LOST = 1,

            RCL_PUBLISHER_OFFERED_INCOMPATIBLE_QOS = 2,
        }

        enum RCL_PUBLISHER_OFFERED_DEADLINE_MISSED = rcl_publisher_event_type_t
                .RCL_PUBLISHER_OFFERED_DEADLINE_MISSED;
        enum RCL_PUBLISHER_LIVELINESS_LOST = rcl_publisher_event_type_t
                .RCL_PUBLISHER_LIVELINESS_LOST;
        enum RCL_PUBLISHER_OFFERED_INCOMPATIBLE_QOS = rcl_publisher_event_type_t
                .RCL_PUBLISHER_OFFERED_INCOMPATIBLE_QOS;

        enum rcl_subscription_event_type_t
        {

            RCL_SUBSCRIPTION_REQUESTED_DEADLINE_MISSED = 0,

            RCL_SUBSCRIPTION_LIVELINESS_CHANGED = 1,

            RCL_SUBSCRIPTION_REQUESTED_INCOMPATIBLE_QOS = 2,
        }

        enum RCL_SUBSCRIPTION_REQUESTED_DEADLINE_MISSED = rcl_subscription_event_type_t
                .RCL_SUBSCRIPTION_REQUESTED_DEADLINE_MISSED;
        enum RCL_SUBSCRIPTION_LIVELINESS_CHANGED = rcl_subscription_event_type_t
                .RCL_SUBSCRIPTION_LIVELINESS_CHANGED;
        enum RCL_SUBSCRIPTION_REQUESTED_INCOMPATIBLE_QOS = rcl_subscription_event_type_t
                .RCL_SUBSCRIPTION_REQUESTED_INCOMPATIBLE_QOS;
        struct rmw_event_t;
        struct rcl_event_impl_t;
        /// Structure which encapsulates a ROS QoS event handle.
        struct rcl_event_t
        {
            /// Pointer to the event implementation
            rcl_event_impl_t* impl;
        }
        /// Return a rcl_event_t struct with members set to `NULL`.
        /**
 * Should be called to get a null rcl_event_t before passing to
 * rcl_event_init().
 */
        rcl_event_t rcl_get_zero_initialized_event() @nogc nothrow;
        /// Initialize an rcl_event_t with a publisher.
        /**
 * Fill the rcl_event_t with the publisher and desired event_type.
 *
 * \param[in,out] event pointer to fill
 * \param[in] publisher to get events from
 * \param[in] event_type to listen for
 * \return `RCL_RET_OK` if the rcl_event_t is filled, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory fails, or
 * \return `RCL_RET_UNSUPPORTED` if event_type is not supported, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_publisher_event_init(rcl_event_t*, const(rcl_publisher_t)*,
                const(rcl_publisher_event_type_t)) @nogc nothrow;
        /// Initialize an rcl_event_t with a subscription.
        /**
 * Fill the rcl_event_t with the subscription and desired event_type.
 *
 * \param[in,out] event pointer to fill
 * \param[in] subscription to get events from
 * \param[in] event_type to listen for
 * \return `RCL_RET_OK` if the rcl_event_t is filled, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory fails, or
 * \return `RCL_RET_UNSUPPORTED` if event_type is not supported, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_subscription_event_init(rcl_event_t*,
                const(rcl_subscription_t)*, const(rcl_subscription_event_type_t)) @nogc nothrow;
        /**
 * Take an event from the event handle.
 *
 * \param[in] event event object to take from
 * \param[in, out] event_info event info object to write taken data into
 * \return `RCL_RET_OK` if successful, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCL_RET_EVENT_TAKE_FAILED` if the take event failed, or
 * \return `RCL_RET_ERROR` if an unexpected error occurs.
 */
        int rcl_take_event(const(rcl_event_t)*, void*) @nogc nothrow;
        /**
 * Finalize an event.
 *
 * \param[in] event to finalize
 * \return `RCL_RET_OK` if successful, or
 * \return `RCL_RET_EVENT_INVALID` if event is null, or
 * \return `RCL_RET_ERROR` if an unexpected error occurs.
 */
        int rcl_event_fini(rcl_event_t*) @nogc nothrow;
        /// Return the rmw event handle.
        /**
 * The handle returned is a pointer to the internally held rmw handle.
 * This function can fail, and therefore return `NULL`, if the:
 *   - event is `NULL`
 *   - event is invalid (never called init, called fini, or invalid node)
 *
 * The returned handle is made invalid if the event is finalized or if
 * rcl_shutdown() is called.
 * The returned handle is not guaranteed to be valid for the life time of the
 * event as it may be finalized and recreated itself.
 * Therefore it is recommended to get the handle from the event using
 * this function each time it is needed and avoid use of the handle
 * concurrently with functions that might change it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] event pointer to the rcl event
 * \return rmw event handle if successful, otherwise `NULL`
 */
        rmw_event_t* rcl_event_get_rmw_handle(const(rcl_event_t)*) @nogc nothrow;
        struct rcl_guard_condition_impl_t;
        /// Options available for a rcl guard condition.
        struct rcl_guard_condition_options_t
        {
            /// Custom allocator for the guard condition, used for internal allocations.
            rcutils_allocator_t allocator;
        }
        /// Return a rcl_guard_condition_t struct with members set to `NULL`.
        rcl_guard_condition_t rcl_get_zero_initialized_guard_condition() @nogc nothrow;
        /// Initialize a rcl guard_condition.
        /**
 * After calling this function on a rcl_guard_condition_t, it can be passed to
 * rcl_wait() and then concurrently it can be triggered to wake-up rcl_wait().
 *
 * Expected usage:
 *
 * ```c
 * #include <rcl/rcl.h>
 *
 * // ... error handling
 * rcl_guard_condition_t guard_condition = rcl_get_zero_initialized_guard_condition();
 * // ... customize guard condition options
 * rcl_ret_t ret = rcl_guard_condition_init(
 *   &guard_condition, context, rcl_guard_condition_get_default_options());
 * // ... error handling, and on shutdown do deinitialization:
 * ret = rcl_guard_condition_fini(&guard_condition);
 * // ... error handling for rcl_guard_condition_fini()
 * ```
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] guard_condition preallocated guard_condition structure
 * \param[in] context the context instance with which the guard condition
 *   should be associated
 * \param[in] options the guard_condition's options
 * \return `RCL_RET_OK` if guard_condition was initialized successfully, or
 * \return `RCL_RET_ALREADY_INIT` if the guard condition is already initialized, or
 * \return `RCL_RET_NOT_INIT` if the given context is invalid, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_guard_condition_init(rcl_guard_condition_t*, rcl_context_t*,
                const(rcl_guard_condition_options_t)) @nogc nothrow;
        /// Same as rcl_guard_condition_init(), but reusing an existing rmw handle.
        /**
 * In addition to the documentation for rcl_guard_condition_init(), the
 * `rmw_guard_condition` parameter must not be `NULL` and must point to a valid
 * rmw guard condition.
 *
 * Also the life time of the rcl guard condition is tied to the life time of
 * the rmw guard condition.
 * So if the rmw guard condition is destroyed before the rcl guard condition,
 * the rcl guard condition becomes invalid.
 *
 * Similarly if the resulting rcl guard condition is fini'ed before the rmw
 * guard condition, then the rmw guard condition is no longer valid.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] guard_condition preallocated guard_condition structure
 * \param[in] rmw_guard_condition existing rmw guard condition to reuse
 * \param[in] context the context instance with which the rmw guard condition
 *   was initialized with, i.e. the rmw context inside rcl context needs to
 *   match rmw context in rmw guard condition
 * \param[in] options the guard_condition's options
 * \return `RCL_RET_OK` if guard_condition was initialized successfully, or
 * \return `RCL_RET_ALREADY_INIT` if the guard condition is already initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_guard_condition_init_from_rmw(rcl_guard_condition_t*,
                const(rmw_guard_condition_t)*, rcl_context_t*,
                const(rcl_guard_condition_options_t)) @nogc nothrow;
        /// Finalize a rcl_guard_condition_t.
        /**
 * After calling, calls to rcl_trigger_guard_condition() will fail when using
 * this guard condition.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] specifically not thread-safe with rcl_trigger_guard_condition()</i>
 *
 * \param[inout] guard_condition handle to the guard_condition to be finalized
 * \return `RCL_RET_OK` if guard_condition was finalized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_guard_condition_fini(rcl_guard_condition_t*) @nogc nothrow;
        /// Return the default options in a rcl_guard_condition_options_t struct.
        /**
 * The defaults are:
 *
 * - allocator = rcl_get_default_allocator()
 */
        rcl_guard_condition_options_t rcl_guard_condition_get_default_options() @nogc nothrow;
        /// Trigger a rcl guard condition.
        /**
 * This function can fail, and return RCL_RET_INVALID_ARGUMENT, if the:
 *   - guard condition is `NULL`
 *   - guard condition is invalid (never called init or called fini)
 *
 * A guard condition can be triggered from any thread.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] it can be called concurrently with itself, even on the same guard condition</i>
 *
 * \param[in] guard_condition handle to the guard_condition to be triggered
 * \return `RCL_RET_OK` if the guard condition was triggered, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_trigger_guard_condition(rcl_guard_condition_t*) @nogc nothrow;
        /// Return the guard condition options.
        /**
 * Returned is a pointer to the internally held rcl_guard_condition_options_t.
 * This function can fail, and therefore return `NULL`, if the:
 *   - guard_condition is `NULL`
 *   - guard_condition is invalid (never called init, called fini, or invalid node)
 *
 * The returned pointer is made invalid if the guard condition is finalized.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] guard_condition pointer to the rcl guard_condition
 * \return rcl guard condition options if successful, otherwise `NULL`
 */
        const(rcl_guard_condition_options_t)* rcl_guard_condition_get_options(
                const(rcl_guard_condition_t)*) @nogc nothrow;
        /// Return the rmw guard condition handle.
        /**
 * The handle returned is a pointer to the internally held rmw handle.
 * This function can fail, and therefore return `NULL`, if the:
 *   - guard_condition is `NULL`
 *   - guard_condition is invalid (never called init, called fini, or invalid node)
 *
 * The returned handle is made invalid if the guard condition is finalized or
 * if rcl_shutdown() is called.
 * The returned handle is not guaranteed to be valid for the life time of the
 * guard condition as it may be finalized and recreated itself.
 * Therefore it is recommended to get the handle from the guard condition using
 * this function each time it is needed and avoid use of the handle
 * concurrently with functions that might change it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] guard_condition pointer to the rcl guard_condition
 * \return rmw guard condition handle if successful, otherwise `NULL`
 */
        rmw_guard_condition_t* rcl_guard_condition_get_rmw_handle(const(rcl_guard_condition_t)*) @nogc nothrow;
        /// Initialization of rcl.
        /**
 * This function can be run any number of times, so long as the given context
 * has been properly prepared.
 *
 * The given `rcl_context_t` must be zero initialized with the function
 * `rcl_get_zero_initialized_context()` and must not be already initialized
 * by this function.
 * If the context is already initialized this function will fail and return the
 * `RCL_RET_ALREADY_INIT` error code.
 * A context may be initialized again after it has been finalized with the
 * `rcl_shutdown()` function and zero initialized again with
 * `rcl_get_zero_initialized_context()`.
 *
 * The `argc` and `argv` parameters may contain command line arguments for the
 * program.
 * rcl specific arguments will be parsed, but not removed.
 * If `argc` is `0` and `argv` is `NULL` no parameters will be parsed.
 *
 * The `options` argument must be non-`NULL` and must have been initialized
 * with `rcl_init_options_init()`.
 * It is unmodified by this function, and the ownership is not transfered to
 * the context, but instead a copy is made into the context for later reference.
 * Therefore, the given options need to be cleaned up with
 * `rcl_init_options_fini()` after this function returns.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \param[in] argc number of strings in argv
 * \param[in] argv command line arguments; rcl specific arguments are removed
 * \param[in] options options used during initialization
 * \param[out] context resulting context object that represents this init
 * \return `RCL_RET_OK` if initialization is successful, or
 * \return `RCL_RET_ALREADY_INIT` if rcl_init has already been called, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_INVALID_ROS_ARGS` if an invalid ROS argument is found, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_init(int, const(const(char)*)*, const(rcl_init_options_t)*, rcl_context_t*) @nogc nothrow;
        /// Shutdown a given rcl context.
        /**
 * The given context must have been initialized with `rcl_init()`.
 * If not, this function will fail with `RCL_RET_ALREADY_SHUTDOWN`.
 *
 * When this function is called:
 *  - Any rcl objects created using this context are invalidated.
 *  - Functions called on invalid objects may or may not fail.
 *  - Calls to `rcl_context_is_initialized()` will return `false`.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \param[inout] context object to shutdown
 * \return `RCL_RET_OK` if the shutdown was completed successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ALREADY_SHUTDOWN` if the context is not currently valid, or
 * \return `RCL_RET_ERROR` if an unspecified error occur.
 */
        int rcl_shutdown(rcl_context_t*) @nogc nothrow;

        alias __suseconds_t = c_long;
        struct rcl_init_options_impl_t;
        /// Encapsulation of init options and implementation defined init options.
        struct rcl_init_options_t
        {
            /// Implementation specific pointer.
            rcl_init_options_impl_t* impl;
        }
        /// Return a zero initialized rcl_init_options_t struct.
        rcl_init_options_t rcl_get_zero_initialized_init_options() @nogc nothrow;
        /// Initialize given init_options with the default values and implementation specific values.
        /**
 * The given allocator is used, if required, during setup of the init options,
 * but is also used during initialization.
 *
 * In either case the given allocator is stored in the returned init options.
 *
 * The `impl` pointer should not be changed manually.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * \param[inout] init_options object to be setup
 * \param[in] allocator to be used during setup and during initialization
 * \return `RCL_RET_OK` if setup is successful, or
 * \return `RCL_RET_ALREADY_INIT` if init_options has already be initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_init_options_init(rcl_init_options_t*, rcutils_allocator_t) @nogc nothrow;
        /// Copy the given source init_options to the destination init_options.
        /**
 * The allocator from the source is used for any allocations and stored in the
 * destination.
 *
 * The destination should either be zero initialized with
 * `rcl_get_zero_initialized_init_options()` or should have had
 * `rcl_init_options_fini()` called on it.
 * Giving an already initialized init options for the destination will result
 * in a failure with return code `RCL_RET_ALREADY_INIT`.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * \param[in] src rcl_init_options_t object to be copied from
 * \param[out] dst rcl_init_options_t object to be copied into
 * \return `RCL_RET_OK` if the copy is successful, or
 * \return `RCL_RET_ALREADY_INIT` if the dst has already be initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_init_options_copy(const(rcl_init_options_t)*, rcl_init_options_t*) @nogc nothrow;
        /// Finalize the given init_options.
        /**
 * The given init_options must be non-`NULL` and valid, i.e. had
 * `rcl_init_options_init()` called on it but not this function yet.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * \param[inout] init_options object to be setup
 * \return `RCL_RET_OK` if setup is successful, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_init_options_fini(rcl_init_options_t*) @nogc nothrow;
        /// Return the domain_id stored in the init options.
        /**
 * Get the domain id from the specified rcl_init_options_t object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] init_options object from which the domain id should be retrieved.
 * \param[out] domain_id domain id to be set in init_options object.
 * \return `RCL_RET_OK` if successful, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid.
 */
        int rcl_init_options_get_domain_id(rcl_init_options_t*, c_ulong*) @nogc nothrow;
        /// Set a domain id in the init options provided.
        /**
 * Store the domain id in the specified init_options object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] init_options objects in which to set the specified domain id.
 * \param[in] domain_id domain id to be set in init_options object.
 * \return `RCL_RET_OK` if successful, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid.
 */
        int rcl_init_options_set_domain_id(rcl_init_options_t*, c_ulong) @nogc nothrow;
        /// Return the rmw init options which are stored internally.
        /**
 * This function can fail and return `NULL` if:
 *   - init_options is NULL
 *   - init_options is invalid, e.g. init_options->impl is NULL
 *
 * If NULL is returned an error message will have been set.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * \param[in] init_options object from which the rmw init options should be retrieved
 * \return pointer to the the rcl init options, or
 * \return `NULL` if there was an error
 */
        rmw_init_options_t* rcl_init_options_get_rmw_init_options(rcl_init_options_t*) @nogc nothrow;
        /// Return the allocator stored in the init_options.
        /**
 * This function can fail and return `NULL` if:
 *   - init_options is NULL
 *   - init_options is invalid, e.g. init_options->impl is NULL
 *
 * If NULL is returned an error message will have been set.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] init_options object from which the allocator should be retrieved
 * \return pointer to the rcl allocator, or
 * \return `NULL` if there was an error
 */
        const(rcutils_allocator_t)* rcl_init_options_get_allocator(const(rcl_init_options_t)*) @nogc nothrow;

        alias __useconds_t = uint;
        /// Handle for a rcl guard condition.
        struct rcl_guard_condition_t
        {
            /// Context associated with this guard condition.
            rcl_context_t* context;
            /// Pointer to the guard condition implementation
            rcl_guard_condition_impl_t* impl;
        }

        struct rcl_node_impl_t;
        /// Structure which encapsulates a ROS Node.
        struct rcl_node_t
        {
            /// Context associated with this node.
            rcl_context_t* context;
            /// Private implementation pointer.
            rcl_node_impl_t* impl;
        }
        /// Return a rcl_node_t struct with members initialized to `NULL`.
        rcl_node_t rcl_get_zero_initialized_node() @nogc nothrow;
        /// Initialize a ROS node.
        /**
 * Calling this on a rcl_node_t makes it a valid node handle until rcl_shutdown
 * is called or until rcl_node_fini is called on it.
 *
 * After calling, the ROS node object can be used to create other middleware
 * primitives like publishers, services, parameters, etc.
 *
 * The name of the node must not be NULL and adhere to naming restrictions,
 * see the rmw_validate_node_name() function for rules.
 *
 * \todo TODO(wjwwood): node name uniqueness is no yet enforced
 *
 * The name of the node cannot coincide with another node of the same name.
 * If a node of the same name is already in the domain, it will be shutdown.
 *
 * The namespace of the node should not be NULL and should also pass the
 * rmw_validate_namespace() function's rules.
 *
 * Additionally this function allows namespaces which lack a leading forward
 * slash.
 * Because there is no notion of a relative namespace, there is no difference
 * between a namespace which lacks a forward and the same namespace with a
 * leasing forward slash.
 * Therefore, a namespace like ``"foo/bar"`` is automatically changed to
 * ``"/foo/bar"`` by this function.
 * Similarly, the namespace ``""`` will implicitly become ``"/"`` which is a
 * valid namespace.
 *
 * \todo TODO(wjwwood):
 *   Parameter infrastructure is currently initialized in the language specific
 *   client library, e.g. rclcpp for C++, but will be initialized here in the
 *   future. When that happens there will be an option to avoid parameter
 *   infrastructure with an option in the rcl_node_options_t struct.
 *
 * A node contains infrastructure for ROS parameters, which include advertising
 * publishers and service servers.
 * This function will create those external parameter interfaces even if
 * parameters are not used later.
 *
 * The rcl_node_t given must be allocated and zero initialized.
 * Passing an rcl_node_t which has already had this function called on it, more
 * recently than rcl_node_fini, will fail.
 * An allocated rcl_node_t with uninitialized memory is undefined behavior.
 *
 * Expected usage:
 *
 * ```c
 * rcl_context_t context = rcl_get_zero_initialized_context();
 * // ... initialize the context with rcl_init()
 * rcl_node_t node = rcl_get_zero_initialized_node();
 * rcl_node_options_t node_ops = rcl_node_get_default_options();
 * // ... node options customization
 * rcl_ret_t ret = rcl_node_init(&node, "node_name", "/node_ns", &context, &node_ops);
 * // ... error handling and then use the node, but eventually deinitialize it:
 * ret = rcl_node_fini(&node);
 * // ... error handling for rcl_node_fini()
 * ```
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \pre the node handle must be allocated, zero initialized, and invalid
 * \pre the context handle must be allocated, initialized, and valid
 * \post the node handle is valid and can be used in other `rcl_*` functions
 *
 * \param[inout] node a preallocated rcl_node_t
 * \param[in] name the name of the node, must be a valid c-string
 * \param[in] namespace_ the namespace of the node, must be a valid c-string
 * \param[in] context the context instance with which the node should be
 *   associated
 * \param[in] options the node options.
 *   The options are deep copied into the node.
 *   The caller is always responsible for freeing memory used options they
 *   pass in.
 * \return `RCL_RET_OK` if the node was initialized successfully, or
 * \return `RCL_RET_ALREADY_INIT` if the node has already be initialized, or
 * \return `RCL_RET_NOT_INIT` if the given context is invalid, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_NODE_INVALID_NAME` if the name is invalid, or
 * \return `RCL_RET_NODE_INVALID_NAMESPACE` if the namespace_ is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_node_init(rcl_node_t*, const(char)*, const(char)*,
                rcl_context_t*, const(rcl_node_options_t)*) @nogc nothrow;
        /// Finalize a rcl_node_t.
        /**
 * Destroys any automatically created infrastructure and deallocates memory.
 * After calling, the rcl_node_t can be safely deallocated.
 *
 * All middleware primitives created by the user, e.g. publishers, services, etc,
 * which were created from this node must be finalized using their respective
 * `rcl_*_fini()` functions before this is called.
 * \sa rcl_publisher_fini()
 * \sa rcl_subscription_fini()
 * \sa rcl_client_fini()
 * \sa rcl_service_fini()
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \param[in] node rcl_node_t to be finalized
 * \return `RCL_RET_OK` if node was finalized successfully, or
 * \return `RCL_RET_NODE_INVALID` if the node pointer is null, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_node_fini(rcl_node_t*) @nogc nothrow;
        /// Return `true` if the node is valid, else `false`.
        /**
 * Also return `false` if the node pointer is `NULL` or the allocator is invalid.
 *
 * A node is invalid if:
 *   - the implementation is `NULL` (rcl_node_init not called or failed)
 *   - rcl_shutdown has been called since the node has been initialized
 *   - the node has been finalized with rcl_node_fini
 *
 * There is a possible validity race condition.
 *
 * Consider:
 *
 * ```c
 * assert(rcl_node_is_valid(node));  // <-- thread 1
 * rcl_shutdown();                   // <-- thread 2
 * // use node as if valid           // <-- thread 1
 * ```
 *
 * In the third line the node is now invalid, even though on the previous line
 * of thread 1 it was checked to be valid.
 * This is why this function is considered not thread-safe.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * \param[in] node rcl_node_t to be validated
 * \return `true` if the node and allocator are valid, otherwise `false`.
 */
        bool rcl_node_is_valid(const(rcl_node_t)*) @nogc nothrow;
        /// Return true if node is valid, except for the context being valid.
        /**
 * This is used in clean up functions that need to access the node, but do not
 * need use any functions with the context.
 *
 * It is identical to rcl_node_is_valid except it ignores the state of the
 * context associated with the node.
 * \sa rcl_node_is_valid()
 */
        bool rcl_node_is_valid_except_context(const(rcl_node_t)*) @nogc nothrow;
        /// Return the name of the node.
        /**
 * This function returns the node's internal name string.
 * This function can fail, and therefore return `NULL`, if:
 *   - node is `NULL`
 *   - node has not been initialized (the implementation is invalid)
 *
 * The returned string is only valid as long as the given rcl_node_t is valid.
 * The value of the string may change if the value in the rcl_node_t changes,
 * and therefore copying the string is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node pointer to the node
 * \return name string if successful, otherwise `NULL`
 */
        const(char)* rcl_node_get_name(const(rcl_node_t)*) @nogc nothrow;
        /// Return the namespace of the node.
        /**
 * This function returns the node's internal namespace string.
 * This function can fail, and therefore return `NULL`, if:
 *   - node is `NULL`
 *   - node has not been initialized (the implementation is invalid)
 *
 * The returned string is only valid as long as the given rcl_node_t is valid.
 * The value of the string may change if the value in the rcl_node_t changes,
 * and therefore copying the string is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node pointer to the node
 * \return name string if successful, otherwise `NULL`
 */
        const(char)* rcl_node_get_namespace(const(rcl_node_t)*) @nogc nothrow;
        /// Return the fully qualified name of the node.
        /**
 * This function returns the node's internal namespace and name combined string.
 * This function can fail, and therefore return `NULL`, if:
 *   - node is `NULL`
 *   - node has not been initialized (the implementation is invalid)
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node pointer to the node
 * \return fully qualified name string if successful, otherwise `NULL`
 */
        const(char)* rcl_node_get_fully_qualified_name(const(rcl_node_t)*) @nogc nothrow;
        /// Return the rcl node options.
        /**
 * This function returns the node's internal options struct.
 * This function can fail, and therefore return `NULL`, if:
 *   - node is `NULL`
 *   - node has not been initialized (the implementation is invalid)
 *
 * The returned struct is only valid as long as the given rcl_node_t is valid.
 * The values in the struct may change if the options of the rcl_node_t changes,
 * and therefore copying the struct is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node pointer to the node
 * \return options struct if successful, otherwise `NULL`
 */
        const(rcl_node_options_t)* rcl_node_get_options(const(rcl_node_t)*) @nogc nothrow;
        /// Return the ROS domain ID that the node is using.
        /**
 * This function returns the ROS domain ID that the node is in.
 *
 * This function should be used to determine what `domain_id` was used rather
 * than checking the domain_id field in the node options, because if
 * `RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID` is used when creating the node then
 * it is not changed after creation, but this function will return the actual
 * `domain_id` used.
 *
 * The `domain_id` field must point to an allocated `size_t` object to which
 * the ROS domain ID will be written.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node the handle to the node being queried
 * \param[out] domain_id storage for the domain id
 * \return `RCL_RET_OK` if node the domain ID was retrieved successfully, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_node_get_domain_id(const(rcl_node_t)*, c_ulong*) @nogc nothrow;
        /// Return the rmw node handle.
        /**
 * The handle returned is a pointer to the internally held rmw handle.
 * This function can fail, and therefore return `NULL`, if:
 *   - node is `NULL`
 *   - node has not been initialized (the implementation is invalid)
 *
 * The returned handle is made invalid if the node is finalized or if
 * rcl_shutdown() is called.
 * The returned handle is not guaranteed to be valid for the life time of the
 * node as it may be finalized and recreated itself.
 * Therefore it is recommended to get the handle from the node using
 * this function each time it is needed and avoid use of the handle
 * concurrently with functions that might change it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node pointer to the rcl node
 * \return rmw node handle if successful, otherwise `NULL`
 */
        rmw_node_t* rcl_node_get_rmw_handle(const(rcl_node_t)*) @nogc nothrow;
        /// Return the associated rcl instance id.
        /**
 * This id is stored when rcl_node_init is called and can be compared with the
 * value returned by rcl_get_instance_id() to check if this node was created in
 * the current rcl context (since the latest call to rcl_init().
 *
 * This function can fail, and therefore return `0`, if:
 *   - node is `NULL`
 *   - node has not been initialized (the implementation is invalid)
 *
 * This function will succeed even if rcl_shutdown() has been called
 * since the node was created.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node pointer to the rcl node
 * \return rcl instance id captured during node init or `0` on error
 */
        c_ulong rcl_node_get_rcl_instance_id(const(rcl_node_t)*) @nogc nothrow;
        /// Return a guard condition which is triggered when the ROS graph changes.
        /**
 * The handle returned is a pointer to an internally held rcl guard condition.
 * This function can fail, and therefore return `NULL`, if:
 *   - node is `NULL`
 *   - node is invalid
 *
 * The returned handle is made invalid if the node is finialized or if
 * rcl_shutdown() is called.
 *
 * The guard condition will be triggered anytime a change to the ROS graph occurs.
 * A ROS graph change includes things like (but not limited to) a new publisher
 * advertises, a new subscription is created, a new service becomes available,
 * a subscription is canceled, etc.
 *
 * \todo TODO(wjwwood): link to exhaustive list of graph events
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node pointer to the rcl node
 * \return rcl guard condition handle if successful, otherwise `NULL`
 */
        const(rcl_guard_condition_t)* rcl_node_get_graph_guard_condition(const(rcl_node_t)*) @nogc nothrow;
        /// Return the logger name of the node.
        /**
 * This function returns the node's internal logger name string.
 * This function can fail, and therefore return `NULL`, if:
 *   - node is `NULL`
 *   - node has not been initialized (the implementation is invalid)
 *
 * The returned string is only valid as long as the given rcl_node_t is valid.
 * The value of the string may change if the value in the rcl_node_t changes,
 * and therefore copying the string is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] node pointer to the node
 * \return logger_name string if successful, otherwise `NULL`
 */
        const(char)* rcl_node_get_logger_name(const(rcl_node_t)*) @nogc nothrow;
        /// Structure which encapsulates the options for creating a rcl_node_t.
        struct rcl_node_options_t
        {
            /// If set, then this value overrides the ROS_DOMAIN_ID environment variable.
            /**
   * It defaults to RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID, which will cause the
   * node to use the ROS domain ID set in the ROS_DOMAIN_ID environment
   * variable, or on some systems 0 if the environment variable is not set.
   *
   * \todo TODO(wjwwood):
   *   Should we put a limit on the ROS_DOMAIN_ID value, that way we can have
   *   a safe value for the default RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID?
   *   (currently max size_t)
   */
            c_ulong domain_id;
            /// Custom allocator used for internal allocations.
            rcutils_allocator_t allocator;
            /// If false then only use arguments in this struct, otherwise use global arguments also.
            bool use_global_arguments;
            /// Command line arguments that apply only to this node.
            rcl_arguments_t arguments;
            /// Flag to enable rosout for this node
            bool enable_rosout;
        }
        /// Return the default node options in a rcl_node_options_t.
        /**
 * The default values are:
 *
 * - domain_id = RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID
 * - allocator = rcl_get_default_allocator()
 * - use_global_arguments = true
 * - enable_rosout = true
 * - arguments = rcl_get_zero_initialized_arguments()
 */
        rcl_node_options_t rcl_node_get_default_options() @nogc nothrow;
        /// Copy one options structure into another.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] options The structure to be copied.
 *   Its allocator is used to copy memory into the new structure.
 * \param[out] options_out An options structure containing default values.
 * \return `RCL_RET_OK` if the structure was copied successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_node_options_copy(const(rcl_node_options_t)*, rcl_node_options_t*) @nogc nothrow;
        /// Finalize the given node_options.
        /**
 * The given node_options must be non-`NULL` and valid, i.e. had
 * `rcl_node_get_default_options()` called on it but not this function yet.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * \param[inout] options object to be finalized
 * \return `RCL_RET_OK` if setup is successful, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_node_options_fini(rcl_node_options_t*) @nogc nothrow;

        alias __time_t = c_long;
        struct rcl_publisher_impl_t;
        /// Structure which encapsulates a ROS Publisher.
        struct rcl_publisher_t
        {
            /// Pointer to the publisher implementation
            rcl_publisher_impl_t* impl;
        }
        /// Options available for a rcl publisher.
        struct rcl_publisher_options_t
        {
            /// Middleware quality of service settings for the publisher.
            rmw_qos_profile_t qos;
            /// Custom allocator for the publisher, used for incidental allocations.
            /** For default behavior (malloc/free), use: rcl_get_default_allocator() */
            rcutils_allocator_t allocator;
            /// rmw specific publisher options, e.g. the rmw implementation specific payload.
            rmw_publisher_options_t rmw_publisher_options;
        }
        /// Return a rcl_publisher_t struct with members set to `NULL`.
        /**
 * Should be called to get a null rcl_publisher_t before passing to
 * rcl_publisher_init().
 */
        rcl_publisher_t rcl_get_zero_initialized_publisher() @nogc nothrow;
        /// Initialize a rcl publisher.
        /**
 * After calling this function on a rcl_publisher_t, it can be used to publish
 * messages of the given type to the given topic using rcl_publish().
 *
 * The given rcl_node_t must be valid and the resulting rcl_publisher_t is only
 * valid as long as the given rcl_node_t remains valid.
 *
 * The rosidl_message_type_support_t is obtained on a per .msg type basis.
 * When the user defines a ROS message, code is generated which provides the
 * required rosidl_message_type_support_t object.
 * This object can be obtained using a language appropriate mechanism.
 * \todo TODO(wjwwood) write these instructions once and link to it instead
 *
 * For C, a macro can be used (for example `std_msgs/String`):
 *
 * ```c
 * #include <rosidl_runtime_c/message_type_support_struct.h>
 * #include <std_msgs/msg/string.h>
 * const rosidl_message_type_support_t * string_ts =
 *   ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String);
 * ```
 *
 * For C++, a template function is used:
 *
 * ```cpp
 * #include <rosidl_typesupport_cpp/message_type_support.hpp>
 * #include <std_msgs/msg/string.hpp>
 * const rosidl_message_type_support_t * string_ts =
 *   rosidl_typesupport_cpp::get_message_type_support_handle<std_msgs::msg::String>();
 * ```
 *
 * The rosidl_message_type_support_t object contains message type specific
 * information used to publish messages.
 *
 * The topic name must be a c string which follows the topic and service name
 * format rules for unexpanded names, also known as non-fully qualified names:
 *
 * \see rcl_expand_topic_name
 *
 * The options struct allows the user to set the quality of service settings as
 * well as a custom allocator which is used when initializing/finalizing the
 * publisher to allocate space for incidentals, e.g. the topic name string.
 *
 * Expected usage (for C messages):
 *
 * ```c
 * #include <rcl/rcl.h>
 * #include <rosidl_runtime_c/message_type_support_struct.h>
 * #include <std_msgs/msg/string.h>
 *
 * rcl_node_t node = rcl_get_zero_initialized_node();
 * rcl_node_options_t node_ops = rcl_node_get_default_options();
 * rcl_ret_t ret = rcl_node_init(&node, "node_name", "/my_namespace", &node_ops);
 * // ... error handling
 * const rosidl_message_type_support_t * ts = ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String);
 * rcl_publisher_t publisher = rcl_get_zero_initialized_publisher();
 * rcl_publisher_options_t publisher_ops = rcl_publisher_get_default_options();
 * ret = rcl_publisher_init(&publisher, &node, ts, "chatter", &publisher_ops);
 * // ... error handling, and on shutdown do finalization:
 * ret = rcl_publisher_fini(&publisher, &node);
 * // ... error handling for rcl_publisher_fini()
 * ret = rcl_node_fini(&node);
 * // ... error handling for rcl_deinitialize_node()
 * ```
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] publisher preallocated publisher structure
 * \param[in] node valid rcl node handle
 * \param[in] type_support type support object for the topic's type
 * \param[in] topic_name the name of the topic to publish on
 * \param[in] options publisher options, including quality of service settings
 * \return `RCL_RET_OK` if the publisher was initialized successfully, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_ALREADY_INIT` if the publisher is already initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory fails, or
 * \return `RCL_RET_TOPIC_NAME_INVALID` if the given topic name is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_publisher_init(rcl_publisher_t*, const(rcl_node_t)*,
                const(rosidl_message_type_support_t)*, const(char)*,
                const(rcl_publisher_options_t)*) @nogc nothrow;
        /// Finalize a rcl_publisher_t.
        /**
 * After calling, the node will no longer be advertising that it is publishing
 * on this topic (assuming this is the only publisher on this topic).
 *
 * After calling, calls to rcl_publish will fail when using this publisher.
 * However, the given node handle is still valid.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] publisher handle to the publisher to be finalized
 * \param[in] node a valid (not finalized) handle to the node used to create the publisher
 * \return `RCL_RET_OK` if publisher was finalized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_PUBLISHER_INVALID` if the publisher is invalid, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_publisher_fini(rcl_publisher_t*, rcl_node_t*) @nogc nothrow;
        /// Return the default publisher options in a rcl_publisher_options_t.
        /**
 * The defaults are:
 *
 * - qos = rmw_qos_profile_default
 * - allocator = rcl_get_default_allocator()
 * - rmw_publisher_options = rmw_get_default_publisher_options()
 */
        rcl_publisher_options_t rcl_publisher_get_default_options() @nogc nothrow;
        /// Borrow a loaned message.
        /**
 * The memory allocated for the ros message belongs to the middleware and must not be deallocated
 * other than by a call to \sa rcl_return_loaned_message_from_publisher.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No [0]
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * [0] the underlying middleware might allocate new memory or returns an existing chunk form a pool.
 * The function in rcl however does not allocate any additional memory.
 *
 * \param[in] publisher Publisher to which the allocated message is associated.
 * \param[in] type_support Typesupport to which the internal ros message is allocated.
 * \param[out] ros_message The pointer to be filled to a valid ros message by the middleware.
 * \return `RCL_RET_OK` if the ros message was correctly initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if an argument other than the ros message is null, or
 * \return `RCL_RET_BAD_ALLOC` if the ros message could not be correctly created, or
 * \return `RCL_RET_UNIMPLEMENTED` if the middleware does not support that feature, or
 * \return `RCL_RET_ERROR` if an unexpected error occured.
 */
        int rcl_borrow_loaned_message(const(rcl_publisher_t)*,
                const(rosidl_message_type_support_t)*, void**) @nogc nothrow;
        /// Return a loaned message previously borrowed from a publisher.
        /**
 * The ownership of the passed in ros message will be transferred back to the middleware.
 * The middleware might deallocate and destroy the message so that the pointer is no longer
 * guaranteed to be valid after that call.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher Publisher to which the loaned message is associated.
 * \param[in] loaned_message Loaned message to be deallocated and destroyed.
 * \return `RCL_RET_OK` if successful, or
 * \return `RCL_RET_INVALID_ARGUMENT` if an argument is null, or
 * \return `RCL_RET_UNIMPLEMENTED` if the middleware does not support that feature, or
 * \return `RCL_RET_PUBLISHER_INVALID` if the publisher is invalid, or
 * \return `RCL_RET_ERROR` if an unexpected error occurs and no message can be initialized.
 */
        int rcl_return_loaned_message_from_publisher(const(rcl_publisher_t)*, void*) @nogc nothrow;
        /// Publish a ROS message on a topic using a publisher.
        /**
 * It is the job of the caller to ensure that the type of the ros_message
 * parameter and the type associate with the publisher (via the type support)
 * match.
 * Passing a different type to publish produces undefined behavior and cannot
 * be checked by this function and therefore no deliberate error will occur.
 *
 * \todo TODO(wjwwood):
 *   The blocking behavior of publish is a still a point of dispute.
 *   This section should be updated once the behavior is clearly defined.
 *   See: https://github.com/ros2/ros2/issues/255
 *
 * Calling rcl_publish() is a potentially blocking call.
 * When called rcl_publish() will immediately do any publishing related work,
 * including, but not limited to, converting the message into a different type,
 * serializing the message, collecting publish statistics, etc.
 * The last thing it will do is call the underlying middleware's publish
 * function which may or may not block based on the quality of service settings
 * given via the publisher options in rcl_publisher_init().
 * For example, if the reliability is set to reliable, then a publish may block
 * until space in the publish queue is available, but if the reliability is set
 * to best effort then it should not block.
 *
 * The ROS message given by the `ros_message` void pointer is always owned by
 * the calling code, but should remain constant during publish.
 *
 * This function is thread safe so long as access to both the publisher and the
 * `ros_message` is synchronized.
 * That means that calling rcl_publish() from multiple threads is allowed, but
 * calling rcl_publish() at the same time as non-thread safe publisher
 * functions is not, e.g. calling rcl_publish() and rcl_publisher_fini()
 * concurrently is not allowed.
 * Before calling rcl_publish() the message can change and after calling
 * rcl_publish() the message can change, but it cannot be changed during the
 * publish call.
 * The same `ros_message`, however, can be passed to multiple calls of
 * rcl_publish() simultaneously, even if the publishers differ.
 * The `ros_message` is unmodified by rcl_publish().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] for unique pairs of publishers and messages, see above for more</i>
 *
 * \param[in] publisher handle to the publisher which will do the publishing
 * \param[in] ros_message type-erased pointer to the ROS message
 * \param[in] allocation structure pointer, used for memory preallocation (may be NULL)
 * \return `RCL_RET_OK` if the message was published successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_PUBLISHER_INVALID` if the publisher is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_publish(const(rcl_publisher_t)*, const(void)*, rmw_publisher_allocation_t*) @nogc nothrow;
        /// Publish a serialized message on a topic using a publisher.
        /**
 * It is the job of the caller to ensure that the type of the serialized message
 * parameter and the type associate with the publisher (via the type support)
 * match.
 * Even though this call to publish takes an already serialized serialized message,
 * the publisher has to register its type as a ROS known message type.
 * Passing a serialized message from a different type leads to undefined behavior on the subscriber side.
 * The publish call might be able to send any abitrary serialized message, it is however
 * not garantueed that the subscriber side successfully deserializes this byte stream.
 *
 * Apart from this, the `publish_serialized` function has the same behavior as `rcl_publish`
 * expect that no serialization step is done.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] for unique pairs of publishers and messages, see above for more</i>
 *
 * \param[in] publisher handle to the publisher which will do the publishing
 * \param[in] serialized_message  pointer to the already serialized message in raw form
 * \param[in] allocation structure pointer, used for memory preallocation (may be NULL)
 * \return `RCL_RET_OK` if the message was published successfully, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_PUBLISHER_INVALID` if the publisher is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_publish_serialized_message(const(rcl_publisher_t)*,
                const(rcutils_uint8_array_t)*, rmw_publisher_allocation_t*) @nogc nothrow;
        /// Publish a loaned message on a topic using a publisher.
        /**
 * A previously borrowed loaned message can be sent via this call to `rcl_publish_loaned_message`.
 * By calling this function, the ownership of the loaned message is getting transferred back
 * to the middleware.
 * The pointer to the `ros_message` is not guaranteed to be valid after as the middleware
 * migth deallocate the memory for this message internally.
 * It is thus recommended to call this function only in combination with
 * \sa `rcl_borrow_loaned_message`.
 *
 * Apart from this, the `publish_loaned_message` function has the same behavior as `rcl_publish`
 * except that no serialization step is done.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No [0]
 * Thread-Safe        | Yes [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[0] the middleware might deallocate the loaned message.
 * The RCL function however does not allocate any memory.</i>
 * <i>[1] for unique pairs of publishers and messages, see above for more</i>
 *
 * \param[in] publisher handle to the publisher which will do the publishing
 * \param[in] ros_message  pointer to the previously borrow loaned message
 * \param[in] allocation structure pointer, used for memory preallocation (may be NULL)
 * \return `RCL_RET_OK` if the message was published successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_PUBLISHER_INVALID` if the publisher is invalid, or
 * \return `RCL_RET_UNIMPLEMENTED` if the middleware does not support that feature, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_publish_loaned_message(const(rcl_publisher_t)*, void*,
                rmw_publisher_allocation_t*) @nogc nothrow;
        /// Manually assert that this Publisher is alive (for RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC)
        /**
 * If the rmw Liveliness policy is set to RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC, the creator of
 * this publisher may manually call `assert_liveliness` at some point in time to signal to the rest
 * of the system that this Node is still alive.
 * This function must be called at least as often as the qos_profile's liveliness_lease_duration
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher handle to the publisher that needs liveliness to be asserted
 * \return `RCL_RET_OK` if the liveliness assertion was completed successfully, or
 * \return `RCL_RET_PUBLISHER_INVALID` if the publisher is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_publisher_assert_liveliness(const(rcl_publisher_t)*) @nogc nothrow;
        /// Get the topic name for the publisher.
        /**
 * This function returns the publisher's internal topic name string.
 * This function can fail, and therefore return `NULL`, if the:
 *   - publisher is `NULL`
 *   - publisher is invalid (never called init, called fini, or invalid node)
 *
 * The returned string is only valid as long as the rcl_publisher_t is valid.
 * The value of the string may change if the topic name changes, and therefore
 * copying the string is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher pointer to the publisher
 * \return name string if successful, otherwise `NULL`
 */
        const(char)* rcl_publisher_get_topic_name(const(rcl_publisher_t)*) @nogc nothrow;
        /// Return the rcl publisher options.
        /**
 * This function returns the publisher's internal options struct.
 * This function can fail, and therefore return `NULL`, if the:
 *   - publisher is `NULL`
 *   - publisher is invalid (never called init, called fini, or invalid node)
 *
 * The returned struct is only valid as long as the rcl_publisher_t is valid.
 * The values in the struct may change if the options of the publisher change,
 * and therefore copying the struct is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher pointer to the publisher
 * \return options struct if successful, otherwise `NULL`
 */
        const(rcl_publisher_options_t)* rcl_publisher_get_options(const(rcl_publisher_t)*) @nogc nothrow;
        /// Return the rmw publisher handle.
        /**
 * The handle returned is a pointer to the internally held rmw handle.
 * This function can fail, and therefore return `NULL`, if the:
 *   - publisher is `NULL`
 *   - publisher is invalid (never called init, called fini, or invalid node)
 *
 * The returned handle is made invalid if the publisher is finalized or if
 * rcl_shutdown() is called.
 * The returned handle is not guaranteed to be valid for the life time of the
 * publisher as it may be finalized and recreated itself.
 * Therefore it is recommended to get the handle from the publisher using
 * this function each time it is needed and avoid use of the handle
 * concurrently with functions that might change it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher pointer to the rcl publisher
 * \return rmw publisher handle if successful, otherwise `NULL`
 */
        rmw_publisher_t* rcl_publisher_get_rmw_handle(const(rcl_publisher_t)*) @nogc nothrow;
        /// Return the context associated with this publisher.
        /**
 * This function can fail, and therefore return `NULL`, if the:
 *   - publisher is `NULL`
 *   - publisher is invalid (never called init, called fini, etc.)
 *
 * The returned context is made invalid if the publisher is finalized or if
 * rcl_shutdown() is called.
 * Therefore it is recommended to get the handle from the publisher using
 * this function each time it is needed and avoid use of the handle
 * concurrently with functions that might change it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher pointer to the rcl publisher
 * \return context if successful, otherwise `NULL`
 */
        rcl_context_t* rcl_publisher_get_context(const(rcl_publisher_t)*) @nogc nothrow;
        /// Return true if the publisher is valid, otherwise false.
        /**
 * The bool returned is `false` if `publisher` is invalid.
 * The bool returned is `true` otherwise.
 * In the case where `false` is to be returned, an error message is set.
 * This function cannot fail.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher pointer to the rcl publisher
 * \return `true` if `publisher` is valid, otherwise `false`
 */
        bool rcl_publisher_is_valid(const(rcl_publisher_t)*) @nogc nothrow;
        /// Return true if the publisher is valid except the context, otherwise false.
        /**
 * This is used in clean up functions that need to access the publisher, but do
 * not need use any functions with the context.
 *
 * It is identical to rcl_publisher_is_valid except it ignores the state of the
 * context associated with the publisher.
 * \sa rcl_publisher_is_valid()
 */
        bool rcl_publisher_is_valid_except_context(const(rcl_publisher_t)*) @nogc nothrow;
        /// Get the number of subscriptions matched to a publisher.
        /**
 * Used to get the internal count of subscriptions matched to a publisher.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] only if the underlying rmw doesn't make use of this feature </i>
 *
 * \param[in] publisher pointer to the rcl publisher
 * \param[out] subscription_count number of matched subscriptions
 * \return `RCL_RET_OK` if the count was retrieved, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_PUBLISHER_INVALID` if the publisher is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_publisher_get_subscription_count(const(rcl_publisher_t)*, c_ulong*) @nogc nothrow;
        /// Get the actual qos settings of the publisher.
        /**
 * Used to get the actual qos settings of the publisher.
 * The actual configuration applied when using RMW_*_SYSTEM_DEFAULT
 * can only be resolved after the creation of the publisher, and it
 * depends on the underlying rmw implementation.
 * If the underlying setting in use can't be represented in ROS terms,
 * it will be set to RMW_*_UNKNOWN.
 * The returned struct is only valid as long as the rcl_publisher_t is valid.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher pointer to the rcl publisher
 * \return qos struct if successful, otherwise `NULL`
 */
        const(rmw_qos_profile_t)* rcl_publisher_get_actual_qos(const(rcl_publisher_t)*) @nogc nothrow;
        /// Check if publisher instance can loan messages.
        /**
 * Depending on the middleware and the message type, this will return true if the middleware
 * can allocate a ROS message instance.
 */
        bool rcl_publisher_can_loan_messages(const(rcl_publisher_t)*) @nogc nothrow;
        struct rcl_service_impl_t;
        /// Structure which encapsulates a ROS Service.
        struct rcl_service_t
        {
            /// Pointer to the service implementation
            rcl_service_impl_t* impl;
        }
        /// Options available for a rcl service.
        struct rcl_service_options_t
        {
            /// Middleware quality of service settings for the service.
            rmw_qos_profile_t qos;
            /// Custom allocator for the service, used for incidental allocations.
            /** For default behavior (malloc/free), see: rcl_get_default_allocator() */
            rcutils_allocator_t allocator;
        }
        /// Return a rcl_service_t struct with members set to `NULL`.
        /**
 * Should be called to get a null rcl_service_t before passing to
 * rcl_service_init().
 */
        rcl_service_t rcl_get_zero_initialized_service() @nogc nothrow;
        /// Initialize a rcl service.
        /**
 * After calling this function on a rcl_service_t, it can be used to take
 * requests of the given type to the given topic using rcl_take_request().
 * It can also send a response to a request using rcl_send_response().
 *
 * The given rcl_node_t must be valid and the resulting rcl_service_t is
 * only valid as long as the given rcl_node_t remains valid.
 *
 * The rosidl_service_type_support_t is obtained on a per .srv type basis.
 * When the user defines a ROS service, code is generated which provides the
 * required rosidl_service_type_support_t object.
 * This object can be obtained using a language appropriate mechanism.
 * \todo TODO(wjwwood) write these instructions once and link to it instead
 *
 * For C, a macro can be used (for example `example_interfaces/AddTwoInts`):
 *
 * ```c
 * #include <rosidl_runtime_c/service_type_support_struct.h>
 * #include <example_interfaces/srv/add_two_ints.h>
 * const rosidl_service_type_support_t * ts =
 *   ROSIDL_GET_SRV_TYPE_SUPPORT(example_interfaces, srv, AddTwoInts);
 * ```
 *
 * For C++, a template function is used:
 *
 * ```cpp
 * #include <rosidl_runtime_cpp/service_type_support.hpp>
 * #include <example_interfaces/srv/add_two_ints.h>
 * using rosidl_typesupport_cpp::get_service_type_support_handle;
 * const rosidl_service_type_support_t * ts =
 *   get_service_type_support_handle<example_interfaces::srv::AddTwoInts>();
 * ```
 *
 * The rosidl_service_type_support_t object contains service type specific
 * information used to send or take requests and responses.
 *
 * The topic name must be a c string which follows the topic and service name
 * format rules for unexpanded names, also known as non-fully qualified names:
 *
 * \see rcl_expand_topic_name
 *
 * The options struct allows the user to set the quality of service settings as
 * well as a custom allocator which is used when initializing/finalizing the
 * client to allocate space for incidentals, e.g. the service name string.
 *
 * Expected usage (for C services):
 *
 * ```c
 * #include <rcl/rcl.h>
 * #include <rosidl_runtime_c/service_type_support_struct.h>
 * #include <example_interfaces/srv/add_two_ints.h>
 *
 * rcl_node_t node = rcl_get_zero_initialized_node();
 * rcl_node_options_t node_ops = rcl_node_get_default_options();
 * rcl_ret_t ret = rcl_node_init(&node, "node_name", "/my_namespace", &node_ops);
 * // ... error handling
 * const rosidl_service_type_support_t * ts =
 *   ROSIDL_GET_SRV_TYPE_SUPPORT(example_interfaces, srv, AddTwoInts);
 * rcl_service_t service = rcl_get_zero_initialized_service();
 * rcl_service_options_t service_ops = rcl_service_get_default_options();
 * ret = rcl_service_init(&service, &node, ts, "add_two_ints", &service_ops);
 * // ... error handling, and on shutdown do finalization:
 * ret = rcl_service_fini(&service, &node);
 * // ... error handling for rcl_service_fini()
 * ret = rcl_node_fini(&node);
 * // ... error handling for rcl_node_fini()
 * ```
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[out] service preallocated service structure
 * \param[in] node valid rcl node handle
 * \param[in] type_support type support object for the service's type
 * \param[in] service_name the name of the service
 * \param[in] options service options, including quality of service settings
 * \return `RCL_RET_OK` if service was initialized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ALREADY_INIT` if the service is already initialized, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_SERVICE_NAME_INVALID` if the given service name is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_service_init(rcl_service_t*, const(rcl_node_t)*,
                const(rosidl_service_type_support_t)*, const(char)*,
                const(rcl_service_options_t)*) @nogc nothrow;
        /// Finalize a rcl_service_t.
        /**
 * After calling, the node will no longer listen for requests for this service.
 * (assuming this is the only service of this type in this node).
 *
 * After calling, calls to rcl_wait(), rcl_take_request(), and
 * rcl_send_response() will fail when using this service.
 * Additionally rcl_wait() will be interrupted if currently blocking.
 * However, the given node handle is still valid.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] service handle to the service to be deinitialized
 * \param[in] node a valid (not finalized) handle to the node used to create the service
 * \return `RCL_RET_OK` if service was deinitialized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SERVICE_INVALID` if the service is invalid, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_service_fini(rcl_service_t*, rcl_node_t*) @nogc nothrow;
        /// Return the default service options in a rcl_service_options_t.
        /**
 * The defaults are:
 *
 * - qos = rmw_qos_profile_services_default
 * - allocator = rcl_get_default_allocator()
 */
        rcl_service_options_t rcl_service_get_default_options() @nogc nothrow;
        /// Take a pending ROS request using a rcl service.
        /**
 * It is the job of the caller to ensure that the type of the ros_request
 * argument and the type associate with the service, via the type
 * support, match.
 * Passing a different type to rcl_take produces undefined behavior and cannot
 * be checked by this function and therefore no deliberate error will occur.
 *
 * TODO(jacquelinekay) blocking of take?
 * TODO(jacquelinekay) pre-, during-, and post-conditions for message ownership?
 * TODO(jacquelinekay) is rcl_take_request thread-safe?
 * TODO(jacquelinekay) Should there be an rcl_request_id_t?
 *
 * The ros_request pointer should point to an already allocated ROS request message
 * struct of the correct type, into which the taken ROS request will be copied
 * if one is available.
 * If taken is false after calling, then the ROS request will be unmodified.
 *
 * If allocation is required when taking the request, e.g. if space needs to
 * be allocated for a dynamically sized array in the target message, then the
 * allocator given in the service options is used.
 *
 * request_header is a pointer to pre-allocated a rmw struct containing
 * meta-information about the request (e.g. the sequence number).
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] only if required when filling the request, avoided for fixed sizes</i>
 *
 * \param[in] service the handle to the service from which to take
 * \param[inout] request_header ptr to the struct holding metadata about the request
 * \param[inout] ros_request type-erased ptr to an allocated ROS request message
 * \return `RCL_RET_OK` if the request was taken, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SERVICE_INVALID` if the service is invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_SERVICE_TAKE_FAILED` if take failed but no error occurred
 *         in the middleware, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_take_request_with_info(const(rcl_service_t)*, rmw_service_info_t*, void*) @nogc nothrow;
        /// backwards compatibility version that takes a request_id only
        int rcl_take_request(const(rcl_service_t)*, rmw_request_id_t*, void*) @nogc nothrow;
        /// Send a ROS response to a client using a service.
        /**
 * It is the job of the caller to ensure that the type of the `ros_response`
 * parameter and the type associate with the service (via the type support)
 * match.
 * Passing a different type to send_response produces undefined behavior and
 * cannot be checked by this function and therefore no deliberate error will
 * occur.
 *
 * send_response() is an non-blocking call.
 *
 * The ROS response message given by the `ros_response` void pointer is always
 * owned by the calling code, but should remain constant during
 * rcl_send_response().
 *
 * This function is thread safe so long as access to both the service and the
 * `ros_response` is synchronized.
 * That means that calling rcl_send_response() from multiple threads is
 * allowed, but calling rcl_send_response() at the same time as non-thread safe
 * service functions is not, e.g. calling rcl_send_response() and
 * rcl_service_fini() concurrently is not allowed.
 * Before calling rcl_send_response() the message can change and after calling
 * rcl_send_response() the message can change, but it cannot be changed during
 * the rcl_send_response() call.
 * The same `ros_response`, however, can be passed to multiple calls of
 * rcl_send_response() simultaneously, even if the services differ.
 * The `ros_response` is unmodified by rcl_send_response().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] for unique pairs of services and responses, see above for more</i>
 *
 * \param[in] service handle to the service which will make the response
 * \param[inout] response_header ptr to the struct holding metadata about the request ID
 * \param[in] ros_response type-erased pointer to the ROS response message
 * \return `RCL_RET_OK` if the response was sent successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SERVICE_INVALID` if the service is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_send_response(const(rcl_service_t)*, rmw_request_id_t*, void*) @nogc nothrow;
        /// Get the topic name for the service.
        /**
 * This function returns the service's internal topic name string.
 * This function can fail, and therefore return `NULL`, if the:
 *   - service is `NULL`
 *   - service is invalid (never called init, called fini, or invalid)
 *
 * The returned string is only valid as long as the service is valid.
 * The value of the string may change if the topic name changes, and therefore
 * copying the string is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] service the pointer to the service
 * \return name string if successful, otherwise `NULL`
 */
        const(char)* rcl_service_get_service_name(const(rcl_service_t)*) @nogc nothrow;
        /// Return the rcl service options.
        /**
 * This function returns the service's internal options struct.
 * This function can fail, and therefore return `NULL`, if the:
 *   - service is `NULL`
 *   - service is invalid (never called init, called fini, or invalid)
 *
 * The returned struct is only valid as long as the service is valid.
 * The values in the struct may change if the service's options change,
 * and therefore copying the struct is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] service pointer to the service
 * \return options struct if successful, otherwise `NULL`
 */
        const(rcl_service_options_t)* rcl_service_get_options(const(rcl_service_t)*) @nogc nothrow;
        /// Return the rmw service handle.
        /**
 * The handle returned is a pointer to the internally held rmw handle.
 * This function can fail, and therefore return `NULL`, if the:
 *   - service is `NULL`
 *   - service is invalid (never called init, called fini, or invalid)
 *
 * The returned handle is made invalid if the service is finalized or if
 * rcl_shutdown() is called.
 * The returned handle is not guaranteed to be valid for the life time of the
 * service as it may be finalized and recreated itself.
 * Therefore it is recommended to get the handle from the service using
 * this function each time it is needed and avoid use of the handle
 * concurrently with functions that might change it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] service pointer to the rcl service
 * \return rmw service handle if successful, otherwise `NULL`
 */
        rmw_service_t* rcl_service_get_rmw_handle(const(rcl_service_t)*) @nogc nothrow;
        /// Check that the service is valid.
        /**
 * The bool returned is `false` if `service` is invalid.
 * The bool returned is `true` otherwise.
 * In the case where `false` is to be returned, an error message is set.
 * This function cannot fail.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] service pointer to the rcl service
 * \return `true` if `service` is valid, otherwise `false`
 */
        bool rcl_service_is_valid(const(rcl_service_t)*) @nogc nothrow;

        alias __id_t = uint;
        struct rcl_subscription_impl_t;
        /// Structure which encapsulates a ROS Subscription.
        struct rcl_subscription_t
        {
            /// Pointer to the subscription implementation
            rcl_subscription_impl_t* impl;
        }
        /// Options available for a rcl subscription.
        struct rcl_subscription_options_t
        {
            /// Middleware quality of service settings for the subscription.
            rmw_qos_profile_t qos;
            /// Custom allocator for the subscription, used for incidental allocations.
            /** For default behavior (malloc/free), see: rcl_get_default_allocator() */
            rcutils_allocator_t allocator;
            /// rmw specific subscription options, e.g. the rmw implementation specific payload.
            rmw_subscription_options_t rmw_subscription_options;
        }
        /// Return a rcl_subscription_t struct with members set to `NULL`.
        /**
 * Should be called to get a null rcl_subscription_t before passing to
 * rcl_subscription_init().
 */
        rcl_subscription_t rcl_get_zero_initialized_subscription() @nogc nothrow;
        /// Initialize a ROS subscription.
        /**
 * After calling this function on a rcl_subscription_t, it can be used to take
 * messages of the given type to the given topic using rcl_take().
 *
 * The given rcl_node_t must be valid and the resulting rcl_subscription_t is
 * only valid as long as the given rcl_node_t remains valid.
 *
 * The rosidl_message_type_support_t is obtained on a per .msg type basis.
 * When the user defines a ROS message, code is generated which provides the
 * required rosidl_message_type_support_t object.
 * This object can be obtained using a language appropriate mechanism.
 * \todo TODO(wjwwood) write these instructions once and link to it instead
 * For C a macro can be used (for example `std_msgs/String`):
 *
 * ```c
 * #include <rosidl_runtime_c/message_type_support_struct.h>
 * #include <std_msgs/msg/string.h>
 * const rosidl_message_type_support_t * string_ts =
 *   ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String);
 * ```
 *
 * For C++ a template function is used:
 *
 * ```cpp
 * #include <rosidl_runtime_cpp/message_type_support.hpp>
 * #include <std_msgs/msgs/string.hpp>
 * using rosidl_typesupport_cpp::get_message_type_support_handle;
 * const rosidl_message_type_support_t * string_ts =
 *   get_message_type_support_handle<std_msgs::msg::String>();
 * ```
 *
 * The rosidl_message_type_support_t object contains message type specific
 * information used to publish messages.
 *
 * The topic name must be a c string which follows the topic and service name
 * format rules for unexpanded names, also known as non-fully qualified names:
 *
 * \see rcl_expand_topic_name
 *
 * The options struct allows the user to set the quality of service settings as
 * well as a custom allocator which is used when (de)initializing the
 * subscription to allocate space for incidental things, e.g. the topic
 * name string.
 *
 * Expected usage (for C messages):
 *
 * ```c
 * #include <rcl/rcl.h>
 * #include <rosidl_runtime_c/message_type_support_struct.h>
 * #include <std_msgs/msg/string.h>
 *
 * rcl_node_t node = rcl_get_zero_initialized_node();
 * rcl_node_options_t node_ops = rcl_node_get_default_options();
 * rcl_ret_t ret = rcl_node_init(&node, "node_name", "/my_namespace", &node_ops);
 * // ... error handling
 * const rosidl_message_type_support_t * ts =
 *   ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String);
 * rcl_subscription_t subscription = rcl_get_zero_initialized_subscription();
 * rcl_subscription_options_t subscription_ops = rcl_subscription_get_default_options();
 * ret = rcl_subscription_init(&subscription, &node, ts, "chatter", &subscription_ops);
 * // ... error handling, and when finished deinitialization
 * ret = rcl_subscription_fini(&subscription, &node);
 * // ... error handling for rcl_subscription_fini()
 * ret = rcl_node_fini(&node);
 * // ... error handling for rcl_node_fini()
 * ```
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[out] subscription preallocated subscription structure
 * \param[in] node valid rcl node handle
 * \param[in] type_support type support object for the topic's type
 * \param[in] topic_name the name of the topic
 * \param[in] options subscription options, including quality of service settings
 * \return `RCL_RET_OK` if subscription was initialized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ALREADY_INIT` if the subcription is already initialized, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_TOPIC_NAME_INVALID` if the given topic name is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_subscription_init(rcl_subscription_t*, const(rcl_node_t)*,
                const(rosidl_message_type_support_t)*, const(char)*,
                const(rcl_subscription_options_t)*) @nogc nothrow;
        /// Finalize a rcl_subscription_t.
        /**
 * After calling, the node will no longer be subscribed on this topic
 * (assuming this is the only subscription on this topic in this node).
 *
 * After calling, calls to rcl_wait and rcl_take will fail when using this
 * subscription.
 * Additioanlly rcl_wait will be interrupted if currently blocking.
 * However, the given node handle is still valid.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] subscription handle to the subscription to be deinitialized
 * \param[in] node a valid (not finalized) handle to the node used to create the subscription
 * \return `RCL_RET_OK` if subscription was deinitialized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SUBSCRIPTION_INVALID` if the subscription is invalid, or
 * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_subscription_fini(rcl_subscription_t*, rcl_node_t*) @nogc nothrow;
        /// Return the default subscription options in a rcl_subscription_options_t.
        /**
 * The defaults are:
 *
 * - qos = rmw_qos_profile_default
 * - allocator = rcl_get_default_allocator()
 * - rmw_subscription_options = rmw_get_default_subscription_options();
 */
        rcl_subscription_options_t rcl_subscription_get_default_options() @nogc nothrow;
        /// Take a ROS message from a topic using a rcl subscription.
        /**
 * It is the job of the caller to ensure that the type of the ros_message
 * argument and the type associated with the subscription, via the type
 * support, match.
 * Passing a different type to rcl_take produces undefined behavior and cannot
 * be checked by this function and therefore no deliberate error will occur.
 *
 * TODO(wjwwood) blocking of take?
 * TODO(wjwwood) pre-, during-, and post-conditions for message ownership?
 * TODO(wjwwood) is rcl_take thread-safe?
 * TODO(wjwwood) Should there be an rcl_message_info_t?
 *
 * The ros_message pointer should point to an already allocated ROS message
 * struct of the correct type, into which the taken ROS message will be copied
 * if one is available.
 * If taken is false after calling, then the ROS message will be unmodified.
 *
 * The taken boolean may be false even if a wait set reports that the
 * subscription was ready to be taken from in some cases, e.g. when the
 * state of the subscription changes it may cause the wait set to wake up
 * but subsequent takes to fail to take anything.
 *
 * If allocation is required when taking the message, e.g. if space needs to
 * be allocated for a dynamically sized array in the target message, then the
 * allocator given in the subscription options is used.
 *
 * The rmw_message_info struct contains meta information about this particular
 * message instance, like what the GUID of the publisher which published it
 * originally or whether or not the message received from within the same
 * process.
 * The message_info argument should be an already allocated rmw_message_info_t
 * structure.
 * Passing `NULL` for message_info will result in the argument being ignored.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] only if required when filling the message, avoided for fixed sizes</i>
 *
 * \param[in] subscription the handle to the subscription from which to take
 * \param[inout] ros_message type-erased ptr to a allocated ROS message
 * \param[out] message_info rmw struct which contains meta-data for the message
 * \param[in] allocation structure pointer used for memory preallocation (may be NULL)
 * \return `RCL_RET_OK` if the message was taken, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SUBSCRIPTION_INVALID` if the subscription is invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_SUBSCRIPTION_TAKE_FAILED` if take failed but no error
 *         occurred in the middleware, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_take(const(rcl_subscription_t)*, void*, rmw_message_info_t*,
                rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take a sequence of messages from a topic using a rcl subscription.
        /**
 * In contrast to `rcl_take`, this function can take multiple messages at
 * the same time.
 * It is the job of the caller to ensure that the type of the message_sequence
 * argument and the type associated with the subscription, via the type
 * support, match.
 *
 * The message_sequence pointer should point to an already allocated sequence
 * of ROS messages of the correct type, into which the taken ROS messages will
 * be copied if messages are available.
 * The message_sequence `size` member will be set to the number of messages
 * correctly taken.
 *
 * The rmw_message_info_sequence struct contains meta information about the
 * corresponding message instance index.
 * The message_info_sequence argument should be an already allocated
 * rmw_message_info_sequence_t structure.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] only if storage in the serialized_message is insufficient</i>
 *
 * \param[in] subscription the handle to the subscription from which to take.
 * \param[in] count number of messages to attempt to take.
 * \param[inout] message_sequence pointer to a (pre-allocated) message sequence.
 * \param[inout] message_info_sequence pointer to a (pre-allocated) message info sequence.
 * \param[in] allocation structure pointer used for memory preallocation (may be NULL)
 * \return `RCL_RET_OK` if one or more messages was taken, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SUBSCRIPTION_INVALID` if the subscription is invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_SUBSCRIPTION_TAKE_FAILED` if take failed but no error
 *         occurred in the middleware, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_take_sequence(const(rcl_subscription_t)*, c_ulong, rmw_message_sequence_t*,
                rmw_message_info_sequence_t*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take a serialized raw message from a topic using a rcl subscription.
        /**
 * In contrast to `rcl_take`, this function stores the taken message in
 * its raw binary representation.
 * It is the job of the caller to ensure that the type associate with the subscription
 * matches, and can optionally be deserialized into its ROS message via, the correct
 * type support.
 * If the `serialized_message` parameter contains enough preallocated memory, the incoming
 * message can be taken without any additional memory allocation.
 * If not, the function will dynamically allocate enough memory for the message.
 * Passing a different type to rcl_take produces undefined behavior and cannot
 * be checked by this function and therefore no deliberate error will occur.
 *
 * Apart from the differences above, this function behaves like `rcl_take`.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] only if storage in the serialized_message is insufficient</i>
 *
 * \param[in] subscription the handle to the subscription from which to take
 * \param[inout] serialized_message pointer to a (pre-allocated) serialized message.
 * \param[out] message_info rmw struct which contains meta-data for the message
 * \param[in] allocation structure pointer used for memory preallocation (may be NULL)
 * \return `RCL_RET_OK` if the message was published, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SUBSCRIPTION_INVALID` if the subscription is invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_SUBSCRIPTION_TAKE_FAILED` if take failed but no error
 *         occurred in the middleware, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_take_serialized_message(const(rcl_subscription_t)*,
                rcutils_uint8_array_t*, rmw_message_info_t*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take a loaned message from a topic using a rcl subscription.
        /**
 * Depending on the middleware, incoming messages can be loaned to the user's callback
 * without further copying.
 * The implicit contract here is that the middleware owns the memory allocated for this message.
 * The user must not destroy the message, but rather has to return it with a call to
 * \sa rcl_return_loaned_message to the middleware.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] subscription the handle to the subscription from which to take
 * \param[inout] loaned_message a pointer to the loaned messages.
 * \param[out] message_info rmw struct which contains meta-data for the message.
 * \param[in] allocation structure pointer used for memory preallocation (may be NULL)
 * \return `RCL_RET_OK` if the loaned message sequence was taken, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SUBSCRIPTION_INVALID` if the subscription is invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_SUBSCRIPTION_TAKE_FAILED` if take failed but no error
 *         occurred in the middleware, or
 * \return `RCL_RET_UNIMPLEMENTED` if the middleware does not support that feature, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_take_loaned_message(const(rcl_subscription_t)*, void**,
                rmw_message_info_t*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Return a loaned message from a topic using a rcl subscription.
        /**
 * If a loaned message was previously obtained from the middleware with a call to
 * \sa rcl_take_loaned_message, this message has to be returned to indicate to the middleware
 * that the user no longer needs that memory.
 * The user must not delete the message.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] subscription the handle to the subscription from which to take
 * \param[in] loaned_message a pointer to the loaned messages.
 * \return `RCL_RET_OK` if the message was published, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SUBSCRIPTION_INVALID` if the subscription is invalid, or
 * \return `RCL_RET_UNIMPLEMENTED` if the middleware does not support that feature, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_return_loaned_message_from_subscription(const(rcl_subscription_t)*, void*) @nogc nothrow;
        /// Get the topic name for the subscription.
        /**
 * This function returns the subscription's internal topic name string.
 * This function can fail, and therefore return `NULL`, if the:
 *   - subscription is `NULL`
 *   - subscription is invalid (never called init, called fini, or invalid)
 *
 * The returned string is only valid as long as the subscription is valid.
 * The value of the string may change if the topic name changes, and therefore
 * copying the string is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] subscription the pointer to the subscription
 * \return name string if successful, otherwise `NULL`
 */
        const(char)* rcl_subscription_get_topic_name(const(rcl_subscription_t)*) @nogc nothrow;
        /// Return the rcl subscription options.
        /**
 * This function returns the subscription's internal options struct.
 * This function can fail, and therefore return `NULL`, if the:
 *   - subscription is `NULL`
 *   - subscription is invalid (never called init, called fini, or invalid)
 *
 * The returned struct is only valid as long as the subscription is valid.
 * The values in the struct may change if the subscription's options change,
 * and therefore copying the struct is recommended if this is a concern.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] subscription pointer to the subscription
 * \return options struct if successful, otherwise `NULL`
 */
        const(rcl_subscription_options_t)* rcl_subscription_get_options(const(rcl_subscription_t)*) @nogc nothrow;
        /// Return the rmw subscription handle.
        /**
 * The handle returned is a pointer to the internally held rmw handle.
 * This function can fail, and therefore return `NULL`, if the:
 *   - subscription is `NULL`
 *   - subscription is invalid (never called init, called fini, or invalid)
 *
 * The returned handle is made invalid if the subscription is finalized or if
 * rcl_shutdown() is called.
 * The returned handle is not guaranteed to be valid for the life time of the
 * subscription as it may be finalized and recreated itself.
 * Therefore it is recommended to get the handle from the subscription using
 * this function each time it is needed and avoid use of the handle
 * concurrently with functions that might change it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] subscription pointer to the rcl subscription
 * \return rmw subscription handle if successful, otherwise `NULL`
 */
        rmw_subscription_t* rcl_subscription_get_rmw_handle(const(rcl_subscription_t)*) @nogc nothrow;
        /// Check that the subscription is valid.
        /**
 * The bool returned is `false` if `subscription` is invalid.
 * The bool returned is `true` otherwise.
 * In the case where `false` is to be returned, an error message is set.
 * This function cannot fail.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] subscription pointer to the rcl subscription
 * \return `true` if `subscription` is valid, otherwise `false`
 */
        bool rcl_subscription_is_valid(const(rcl_subscription_t)*) @nogc nothrow;
        /// Get the number of publishers matched to a subscription.
        /**
 * Used to get the internal count of publishers matched to a subscription.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] only if the underlying rmw doesn't make use of this feature </i>
 *
 * \param[in] subscription pointer to the rcl subscription
 * \param[out] publisher_count number of matched publishers
 * \return `RCL_RET_OK` if the count was retrieved, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_SUBSCRIPTION_INVALID` if the subscription is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_subscription_get_publisher_count(const(rcl_subscription_t)*, c_ulong*) @nogc nothrow;
        /// Get the actual qos settings of the subscription.
        /**
 * Used to get the actual qos settings of the subscription.
 * The actual configuration applied when using RMW_*_SYSTEM_DEFAULT
 * can only be resolved after the creation of the subscription, and it
 * depends on the underlying rmw implementation.
 * If the underlying setting in use can't be represented in ROS terms,
 * it will be set to RMW_*_UNKNOWN.
 * The returned struct is only valid as long as the rcl_subscription_t is valid.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] subscription pointer to the rcl subscription
 * \return qos struct if successful, otherwise `NULL`
 */
        const(rmw_qos_profile_t)* rcl_subscription_get_actual_qos(const(rcl_subscription_t)*) @nogc nothrow;
        /// Check if subscription instance can loan messages.
        /**
 * Depending on the middleware and the message type, this will return true if the middleware
 * can allocate a ROS message instance.
 */
        bool rcl_subscription_can_loan_messages(const(rcl_subscription_t)*) @nogc nothrow;

        alias __rlim64_t = c_ulong;

        alias __rlim_t = c_ulong;
        /// A single point in time, measured in nanoseconds since the Unix epoch.
        alias rcl_time_point_value_t = c_long;
        /// A duration of time, measured in nanoseconds.
        alias rcl_duration_value_t = c_long;
        /// Time source type, used to indicate the source of a time measurement.
        /**
 * RCL_ROS_TIME will report the latest value reported by a ROS time source, or
 * if a ROS time source is not active it reports the same as RCL_SYSTEM_TIME.
 * For more information about ROS time sources, refer to the design document:
 * http://design.ros2.org/articles/clock_and_time.html
 *
 * RCL_SYSTEM_TIME reports the same value as the system clock.
 *
 * RCL_STEADY_TIME reports a value from a monotonically increasing clock.
 */
        enum rcl_clock_type_t
        {

            RCL_CLOCK_UNINITIALIZED = 0,

            RCL_ROS_TIME = 1,

            RCL_SYSTEM_TIME = 2,

            RCL_STEADY_TIME = 3,
        }

        enum RCL_CLOCK_UNINITIALIZED = rcl_clock_type_t.RCL_CLOCK_UNINITIALIZED;
        enum RCL_ROS_TIME = rcl_clock_type_t.RCL_ROS_TIME;
        enum RCL_SYSTEM_TIME = rcl_clock_type_t.RCL_SYSTEM_TIME;
        enum RCL_STEADY_TIME = rcl_clock_type_t.RCL_STEADY_TIME;
        /// A duration of time, measured in nanoseconds and its source.
        struct rcl_duration_t
        {
            /// Duration in nanoseconds and its source.
            c_long nanoseconds;
        }
        /// Enumeration to describe the type of time jump.
        enum rcl_clock_change_t
        {
            /// The source before and after the jump is ROS_TIME.
            RCL_ROS_TIME_NO_CHANGE = 1,
            /// The source switched to ROS_TIME from SYSTEM_TIME.
            RCL_ROS_TIME_ACTIVATED = 2,
            /// The source switched to SYSTEM_TIME from ROS_TIME.
            RCL_ROS_TIME_DEACTIVATED = 3,
            /// The source before and after the jump is SYSTEM_TIME.
            RCL_SYSTEM_TIME_NO_CHANGE = 4,
        }

        enum RCL_ROS_TIME_NO_CHANGE = rcl_clock_change_t.RCL_ROS_TIME_NO_CHANGE;
        enum RCL_ROS_TIME_ACTIVATED = rcl_clock_change_t.RCL_ROS_TIME_ACTIVATED;
        enum RCL_ROS_TIME_DEACTIVATED = rcl_clock_change_t.RCL_ROS_TIME_DEACTIVATED;
        enum RCL_SYSTEM_TIME_NO_CHANGE = rcl_clock_change_t.RCL_SYSTEM_TIME_NO_CHANGE;
        /// Struct to describe a jump in time.
        struct rcl_time_jump_t
        {
            /// Indicate whether or not the source of time changed.
            rcl_clock_change_t clock_change;
            /// The new time minus the last time before the jump.
            rcl_duration_t delta;
        }

        alias rcl_jump_callback_t = void function(const(rcl_time_jump_t)*, bool, void*);
        /// Describe the prerequisites for calling a time jump callback.
        struct rcl_jump_threshold_t
        {
            /// True to call callback when the clock type changes.
            bool on_clock_change;
            /// A positive duration indicating the minimum jump forwards to be considered exceeded, or zero
            /// to disable.
            rcl_duration_t min_forward;
            /// A negative duration indicating the minimum jump backwards to be considered exceeded, or zero
            /// to disable.
            rcl_duration_t min_backward;
        }
        /// Struct to describe an added callback.
        struct rcl_jump_callback_info_t
        {
            /// Callback to fucntion.
            void function(const(rcl_time_jump_t)*, bool, void*) callback;
            /// Threshold to decide when to call the callback.
            rcl_jump_threshold_t threshold;
            /// Pointer passed to the callback.
            void* user_data;
        }
        /// Encapsulation of a time source.
        struct rcl_clock_t
        {
            /// Clock type
            rcl_clock_type_t type;
            /// An array of added jump callbacks.
            rcl_jump_callback_info_t* jump_callbacks;
            /// Number of callbacks in jump_callbacks.
            c_ulong num_jump_callbacks;
            /// Pointer to get_now function
            int function(void*, c_long*) get_now;
            /// Clock storage
            void* data;
            /// Custom allocator used for internal allocations.
            rcutils_allocator_t allocator;
        }
        /// A single point in time, measured in nanoseconds, the reference point is based on the source.
        struct rcl_time_point_t
        {
            /// Nanoseconds of the point in time
            c_long nanoseconds;
            /// Clock type of the point in time
            rcl_clock_type_t clock_type;
        }
        /// Check if the clock has valid values.
        /**
 * This function returns true if the time source appears to be valid.
 * It will check that the type is not uninitialized, and that pointers
 * are not invalid.
 * Note that if data is uninitialized it may give a false positive.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] clock the handle to the clock which is being queried
 * \return true if the source is believed to be valid, otherwise return false.
 */
        bool rcl_clock_valid(rcl_clock_t*) @nogc nothrow;
        /// Initialize a clock based on the passed type.
        /**
 * This will allocate all necessary internal structures, and initialize variables.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes [1]
 * Thread-Safe        | No [2]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] If `clock_type` is `RCL_ROS_TIME`</i>
 * <i>[2] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object.</i>
 *
 * \param[in] clock_type the type identifying the time source to provide
 * \param[in] clock the handle to the clock which is being initialized
 * \param[in] allocator The allocator to use for allocations
 * \return `RCL_RET_OK` if the time source was successfully initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_clock_init(rcl_clock_type_t, rcl_clock_t*, rcutils_allocator_t*) @nogc nothrow;
        /// Finalize a clock.
        /**
 * This will deallocate all necessary internal structures, and clean up any variables.
 * It can be combined with any of the init functions.
 *
 * Passing a clock with type RCL_CLOCK_UNINITIALIZED will result in
 * RCL_RET_INVALID_ARGUMENT being returned.
 *
 * This function is not thread-safe with any other function operating on the same
 * clock object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object associated with the
 *        `clock` object.</i>
 *
 * \param[in] clock the handle to the clock which is being finalized
 * \return `RCL_RET_OK` if the time source was successfully finalized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_clock_fini(rcl_clock_t*) @nogc nothrow;
        /// Initialize a clock as a RCL_ROS_TIME time source.
        /**
 * This will allocate all necessary internal structures, and initialize variables.
 * It is specifically setting up a RCL_ROS_TIME time source.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[2] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object.</i>
 *
 * \param[in] clock the handle to the clock which is being initialized
 * \param[in] allocator The allocator to use for allocations
 * \return `RCL_RET_OK` if the time source was successfully initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_ros_clock_init(rcl_clock_t*, rcutils_allocator_t*) @nogc nothrow;
        /// Finalize a clock as a `RCL_ROS_TIME` time source.
        /**
 * This will deallocate all necessary internal structures, and clean up any variables.
 * It is specifically setting up a `RCL_ROS_TIME` time source. It is expected
 * to be paired with the init fuction.
 *
 * This function is not thread-safe with any other function operating on the same
 * clock object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object associated with the
 *        `clock` object.</i>
 *
 * \param[in] clock the handle to the clock which is being initialized
 * \return `RCL_RET_OK` if the time source was successfully finalized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_ros_clock_fini(rcl_clock_t*) @nogc nothrow;
        /// Initialize a clock as a `RCL_STEADY_TIME` time source.
        /**
 * This will allocate all necessary internal structures, and initialize variables.
 * It is specifically setting up a `RCL_STEADY_TIME` time source.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object.</i>
 *
 * \param[in] clock the handle to the clock which is being initialized
 * \param[in] allocator The allocator to use for allocations
 * \return `RCL_RET_OK` if the time source was successfully initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_steady_clock_init(rcl_clock_t*, rcutils_allocator_t*) @nogc nothrow;
        /// Finalize a clock as a `RCL_STEADY_TIME` time source.
        /**
 * Finalize the clock as a `RCL_STEADY_TIME` time source.
 *
 * This will deallocate all necessary internal structures, and clean up any variables.
 * It is specifically setting up a steady time source. It is expected to be
 * paired with the init fuction.
 *
 * This function is not thread-safe with any other function operating on the same
 * clock object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object associated with the
 *        `clock` object.</i>
 *
 * \param[in] clock the handle to the clock which is being initialized
 * \return `RCL_RET_OK` if the time source was successfully finalized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_steady_clock_fini(rcl_clock_t*) @nogc nothrow;
        /// Initialize a clock as a `RCL_SYSTEM_TIME` time source.
        /**
 * Initialize the clock as a `RCL_SYSTEM_TIME` time source.
 *
 * This will allocate all necessary internal structures, and initialize variables.
 * It is specifically setting up a system time source.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object associated with the
 *        `clock` object.</i>
 *
 * \param[in] clock the handle to the clock which is being initialized
 * \param[in] allocator The allocator to use for allocations
 * \return `RCL_RET_OK` if the time source was successfully initialized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_system_clock_init(rcl_clock_t*, rcutils_allocator_t*) @nogc nothrow;
        /// Finalize a clock as a `RCL_SYSTEM_TIME` time source.
        /**
 * Finalize the clock as a `RCL_SYSTEM_TIME` time source.
 *
 * This will deallocate all necessary internal structures, and clean up any variables.
 * It is specifically setting up a system time source. It is expected to be paired with
 * the init fuction.
 *
 * This function is not thread-safe with any function operating on the same clock object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object associated with the
 *        `clock` object.</i>
 *
 * \param[in] clock the handle to the clock which is being initialized.
 * \return `RCL_RET_OK` if the time source was successfully finalized, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_system_clock_fini(rcl_clock_t*) @nogc nothrow;
        /// Compute the difference between two time points
        /**
 * This function takes two time points and computes the duration between them.
 * The two time points must be using the same time abstraction, and the
 * resultant duration will also be of the same abstraction.
 *
 * The value will be computed as duration = finish - start. If start is after
 * finish the duration will be negative.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] start The time point for the start of the duration.
 * \param[in] finish The time point for the end of the duration.
 * \param[out] delta The duration between the start and finish.
 * \return `RCL_RET_OK` if the difference was computed successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_difference_times(rcl_time_point_t*, rcl_time_point_t*, rcl_duration_t*) @nogc nothrow;
        /// Fill the time point value with the current value of the associated clock.
        /**
 * This function will populate the data of the time_point_value object with the
 * current value from it's associated time abstraction.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes [1]
 * Lock-Free          | Yes
 *
 * <i>[1] If `clock` is of `RCL_ROS_TIME` type.</i>
 *
 * \param[in] clock The time source from which to set the value.
 * \param[out] time_point_value The time_point value to populate.
 * \return `RCL_RET_OK` if the last call time was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_clock_get_now(rcl_clock_t*, c_long*) @nogc nothrow;
        /// Enable the ROS time abstraction override.
        /**
 * This method will enable the ROS time abstraction override values,
 * such that the time source will report the set value instead of falling
 * back to system time.
 *
 * This function is not thread-safe with `rcl_clock_add_jump_callback`,
 * nor `rcl_clock_remove_jump_callback` functions when used on the same
 * clock object.
 *
 * <hr>
 * Attribute          | Adherence [1]
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [2]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Only applies to the function itself, as jump callbacks may not abide to it.</i>
 * <i>[2] Function is reentrant, but concurrent calls on the same `clock` object are not safe.</i>
 *
 * \param[in] clock The clock to enable.
 * \return `RCL_RET_OK` if the time source was enabled successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_enable_ros_time_override(rcl_clock_t*) @nogc nothrow;
        /// Disable the ROS time abstraction override.
        /**
 * This method will disable the `RCL_ROS_TIME` time abstraction override values,
 * such that the time source will report the system time even if a custom
 * value has been set.
 *
 * This function is not thread-safe with `rcl_clock_add_jump_callback`,
 * nor `rcl_clock_remove_jump_callback` functions when used on the same
 * clock object.
 *
 * <hr>
 * Attribute          | Adherence [1]
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [2]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Only applies to the function itself, as jump callbacks may not abide to it.</i>
 * <i>[2] Function is reentrant, but concurrent calls on the same `clock` object are not safe.</i>
 *
 * \param[in] clock The clock to disable.
 * \return `RCL_RET_OK` if the time source was disabled successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_disable_ros_time_override(rcl_clock_t*) @nogc nothrow;
        /// Check if the `RCL_ROS_TIME` time source has the override enabled.
        /**
 * This will populate the is_enabled object to indicate if the
 * time overide is enabled. If it is enabled, the set value will be returned.
 * Otherwise this time source will return the equivalent to system time abstraction.
 *
 * This function is not thread-safe with `rcl_enable_ros_time_override` nor
 * `rcl_disable_ros_time_override` functions when used on the same clock object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.</i>
 *
 * \param[in] clock The clock to query.
 * \param[out] is_enabled Whether the override is enabled..
 * \return `RCL_RET_OK` if the time source was queried successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_is_enabled_ros_time_override(rcl_clock_t*, bool*) @nogc nothrow;
        /// Set the current time for this `RCL_ROS_TIME` time source.
        /**
 * This function will update the internal storage for the `RCL_ROS_TIME`
 * time source.
 * If queried and override enabled the time source will return this value,
 * otherwise it will return the system time.
 *
 * This function is not thread-safe with `rcl_clock_add_jump_callback`,
 * nor `rcl_clock_remove_jump_callback` functions when used on the same
 * clock object.
 *
 * <hr>
 * Attribute          | Adherence [1]
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No [2]
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * <i>[1] Only applies to the function itself, as jump callbacks may not abide to it.</i>
 * <i>[2] Function is reentrant, but concurrent calls on the same `clock` object are not safe.</i>
 *
 * \param[in] clock The clock to update.
 * \param[in] time_value The new current time.
 * \return `RCL_RET_OK` if the time source was set successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_set_ros_time_override(rcl_clock_t*, c_long) @nogc nothrow;
        /// Add a callback to be called when a time jump exceeds a threshold.
        /**
 * The callback is called twice when the threshold is exceeded: once before the clock is
 * updated, and once after.
 * The user_data pointer is passed to the callback as the last argument.
 * A callback and user_data pair must be unique among the callbacks added to a clock.
 *
 * This function is not thread-safe with `rcl_clock_remove_jump_callback`,
 * `rcl_enable_ros_time_override`, `rcl_disable_ros_time_override` nor
 * `rcl_set_ros_time_override` functions when used on the same clock object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object associated with the
 *        `clock` object.</i>
 *
 * \param[in] clock A clock to add a jump callback to.
 * \param[in] threshold Criteria indicating when to call the callback.
 * \param[in] callback A callback to call.
 * \param[in] user_data A pointer to be passed to the callback.
 * \return `RCL_RET_OK` if the callback was added successfully, or
 * \return `RCL_RET_BAD_ALLOC` if a memory allocation failed, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occurs.
 */
        int rcl_clock_add_jump_callback(rcl_clock_t*, rcl_jump_threshold_t,
                void function(const(rcl_time_jump_t)*, bool, void*), void*) @nogc nothrow;
        /// Remove a previously added time jump callback.
        /**
 * This function is not thread-safe with `rcl_clock_add_jump_callback`
 * `rcl_enable_ros_time_override`, `rcl_disable_ros_time_override` nor
 * `rcl_set_ros_time_override` functions when used on the same clock object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No [1]
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * <i>[1] Function is reentrant, but concurrent calls on the same `clock` object are not safe.
 *        Thread-safety is also affected by that of the `allocator` object associated with the
 *        `clock` object.</i>
 *
 * \param[in] clock The clock to remove a jump callback from.
 * \param[in] callback The callback to call.
 * \param[in] user_data A pointer to be passed to the callback.
 * \return `RCL_RET_OK` if the callback was added successfully, or
 * \return `RCL_RET_BAD_ALLOC` if a memory allocation failed, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` the callback was not found or an unspecified error occurs.
 */
        int rcl_clock_remove_jump_callback(rcl_clock_t*,
                void function(const(rcl_time_jump_t)*, bool, void*), void*) @nogc nothrow;
        struct rcl_timer_impl_t;
        /// Structure which encapsulates a ROS Timer.
        struct rcl_timer_t
        {
            /// Private implementation pointer.
            rcl_timer_impl_t* impl;
        }

        alias rcl_timer_callback_t = void function(rcl_timer_t*, c_long);
        /// Return a zero initialized timer.
        rcl_timer_t rcl_get_zero_initialized_timer() @nogc nothrow;
        /// Initialize a timer.
        /**
 * A timer consists of a clock, a callback function and a period.
 * A timer can be added to a wait set and waited on, such that the wait set
 * will wake up when a timer is ready to be executed.
 *
 * A timer simply holds state and does not automatically call callbacks.
 * It does not create any threads, register interrupts, or consume signals.
 * For blocking behavior it can be used in conjunction with a wait set and
 * rcl_wait().
 * When rcl_timer_is_ready() returns true, the timer must still be called
 * explicitly using rcl_timer_call().
 *
 * The timer handle must be a pointer to an allocated and zero initialized
 * rcl_timer_t struct.
 * Calling this function on an already initialized timer will fail.
 * Calling this function on a timer struct which has been allocated but not
 * zero initialized is undefined behavior.
 *
 * The clock handle must be a pointer to an initialized rcl_clock_t struct.
 * The life time of the clock must exceed the life time of the timer.
 *
 * The period is a non-negative duration (rather an absolute time in the
 * future).
 * If the period is `0` then it will always be ready.
 *
 * The callback is an optional argument.
 * Valid inputs are either a pointer to the function callback, or `NULL` to
 * indicate that no callback will be stored in rcl.
 * If the callback is `NULL`, the caller client library is responsible for
 * firing the timer callback.
 * Else, it must be a function which returns void and takes two arguments,
 * the first being a pointer to the associated timer, and the second a int64_t
 * which is the time since the previous call, or since the timer was created
 * if it is the first call to the callback.
 *
 * Expected usage:
 *
 * ```c
 * #include <rcl/rcl.h>
 *
 * void my_timer_callback(rcl_timer_t * timer, int64_t last_call_time)
 * {
 *   // Do timer work...
 *   // Optionally reconfigure, cancel, or reset the timer...
 * }
 *
 * rcl_context_t * context;  // initialized previously by rcl_init()...
 * rcl_clock_t clock;
 * rcl_allocator_t allocator = rcl_get_default_allocator();
 * rcl_ret_t ret = rcl_clock_init(RCL_STEADY_TIME, &clock, &allocator);
 * // ... error handling
 *
 * rcl_timer_t timer = rcl_get_zero_initialized_timer();
 * ret = rcl_timer_init(
 *   &timer, &clock, context, RCL_MS_TO_NS(100), my_timer_callback, allocator);
 * // ... error handling, use the timer with a wait set, or poll it manually, then cleanup
 * ret = rcl_timer_fini(&timer);
 * // ... error handling
 * ```
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1][2][3]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uintptr_t`</i>
 *
 * <i>[2] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * <i>[3] if `atomic_is_lock_free()` returns true for `atomic_bool`</i>
 *
 * \param[inout] timer the timer handle to be initialized
 * \param[in] clock the clock providing the current time
 * \param[in] context the context that this timer is to be associated with
 * \param[in] period the duration between calls to the callback in nanoseconds
 * \param[in] callback the user defined function to be called every period
 * \param[in] allocator the allocator to use for allocations
 * \return `RCL_RET_OK` if the timer was initialized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ALREADY_INIT` if the timer was already initialized, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_init(rcl_timer_t*, rcl_clock_t*, rcl_context_t*, c_long,
                const(void function(rcl_timer_t*, c_long)), rcutils_allocator_t) @nogc nothrow;
        /// Finalize a timer.
        /**
 * This function will deallocate any memory and make the timer invalid.
 *
 * A timer that is already invalid (zero initialized) or `NULL` will not fail.
 *
 * This function is not thread-safe with any rcl_timer_* functions used on the
 * same timer object.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1][2][3]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uintptr_t`</i>
 *
 * <i>[2] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * <i>[3] if `atomic_is_lock_free()` returns true for `atomic_bool`</i>
 *
 * \param[inout] timer the handle to the timer to be finalized.
 * \return `RCL_RET_OK` if the timer was finalized successfully, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_fini(rcl_timer_t*) @nogc nothrow;
        /// Call the timer's callback and set the last call time.
        /**
 * This function will call the callback and change the last call time even if
 * the timer's period has not yet elapsed.
 * It is up to the calling code to make sure the period has elapsed by first
 * calling rcl_timer_is_ready().
 * If the callback pointer is `NULL` (either set in init or exchanged after
 * initialized), no callback is fired.
 * However, this function should still be called by the client library to
 * update the state of the timer.
 * The order of operations in this command are as follows:
 *
 *  - Ensure the timer has not been canceled.
 *  - Get the current time into a temporary rcl_steady_time_point_t.
 *  - Exchange the current time with the last call time of the timer.
 *  - Call the callback, passing this timer and the time since the last call.
 *  - Return after the callback has completed.
 *
 * During the callback the timer can be canceled or have its period and/or
 * callback modified.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes [1]
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [2]
 * <i>[1] user callback might not be thread-safe</i>
 *
 * <i>[2] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[inout] timer the handle to the timer to call
 * \return `RCL_RET_OK` if the timer was called successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_TIMER_INVALID` if the timer is invalid, or
 * \return `RCL_RET_TIMER_CANCELED` if the timer has been canceled, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_call(rcl_timer_t*) @nogc nothrow;
        /// Retrieve the clock of the timer.
        /**
 * This function retrieves the clock pointer and copies it into the given variable.
 *
 * The clock argument must be a pointer to an already allocated rcl_clock_t *.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] timer the handle to the timer which is being queried
 * \param[out] clock the rcl_clock_t * in which the clock is stored
 * \return `RCL_RET_OK` if the period was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_TIMER_INVALID` if the timer is invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_clock(rcl_timer_t*, rcl_clock_t**) @nogc nothrow;
        /// Calculates whether or not the timer should be called.
        /**
 * The result is true if the time until next call is less than, or equal to, 0
 * and the timer has not been canceled.
 * Otherwise the result is false, indicating the timer should not be called.
 *
 * The is_ready argument must point to an allocated bool object, as the result
 * is copied into it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[in] timer the handle to the timer which is being checked
 * \param[out] is_ready the bool used to store the result of the calculation
 * \return `RCL_RET_OK` if the last call time was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_TIMER_INVALID` if the timer is invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_is_ready(const(rcl_timer_t)*, bool*) @nogc nothrow;
        /// Calculate and retrieve the time until the next call in nanoseconds.
        /**
 * This function calculates the time until the next call by adding the timer's
 * period to the last call time and subtracting that sum from the current time.
 * The calculated time until the next call can be positive, indicating that it
 * is not ready to be called as the period has not elapsed since the last call.
 * The calculated time until the next call can also be 0 or negative,
 * indicating that the period has elapsed since the last call and the timer
 * should be called.
 * A negative value indicates the timer call is overdue by that amount.
 *
 * The `time_until_next_call` argument must point to an allocated int64_t, as
 * the time until is copied into that instance.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[in] timer the handle to the timer that is being queried
 * \param[out] time_until_next_call the output variable for the result
 * \return `RCL_RET_OK` if the timer until next call was successfully calculated, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_TIMER_INVALID` if the timer is invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_get_time_until_next_call(const(rcl_timer_t)*, c_long*) @nogc nothrow;
        /// Retrieve the time since the previous call to rcl_timer_call() occurred.
        /**
 * This function calculates the time since the last call and copies it into
 * the given int64_t variable.
 *
 * Calling this function within a callback will not return the time since the
 * previous call but instead the time since the current callback was called.
 *
 * The time_since_last_call argument must be a pointer to an already allocated
 * int64_t.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[in] timer the handle to the timer which is being queried
 * \param[out] time_since_last_call the struct in which the time is stored
 * \return `RCL_RET_OK` if the last call time was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_TIMER_INVALID` if the timer is invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_get_time_since_last_call(const(rcl_timer_t)*, c_long*) @nogc nothrow;
        /// Retrieve the period of the timer.
        /**
 * This function retrieves the period and copies it into the given variable.
 *
 * The period argument must be a pointer to an already allocated int64_t.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[in] timer the handle to the timer which is being queried
 * \param[out] period the int64_t in which the period is stored
 * \return `RCL_RET_OK` if the period was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_get_period(const(rcl_timer_t)*, c_long*) @nogc nothrow;
        /// Exchange the period of the timer and return the previous period.
        /**
 * This function exchanges the period in the timer and copies the old one into
 * the given variable.
 *
 * Exchanging (changing) the period will not affect already waiting wait sets.
 *
 * The old_period argument must be a pointer to an already allocated int64_t.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[in] timer the handle to the timer which is being modified
 * \param[out] new_period the int64_t to exchange into the timer
 * \param[out] old_period the int64_t in which the previous period is stored
 * \return `RCL_RET_OK` if the period was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_exchange_period(const(rcl_timer_t)*, c_long, c_long*) @nogc nothrow;
        /// Return the current timer callback.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - timer is `NULL`
 *   - timer has not been initialized (the implementation is invalid)
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[in] timer handle to the timer from the callback should be returned
 * \return function pointer to the callback, or `NULL` if an error occurred
 */
        void function(rcl_timer_t*, c_long) rcl_timer_get_callback(const(rcl_timer_t)*) @nogc nothrow;
        /// Exchange the current timer callback and return the current callback.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - timer is `NULL`
 *   - timer has not been initialized (the implementation is invalid)
 *
 * This function can set callback to `NULL`, in which case the callback is
 * ignored when rcl_timer_call is called.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[inout] timer handle to the timer from the callback should be exchanged
 * \param[in] new_callback the callback to be exchanged into the timer
 * \return function pointer to the old callback, or `NULL` if an error occurred
 */
        void function(rcl_timer_t*, c_long) rcl_timer_exchange_callback(rcl_timer_t*,
                const(void function(rcl_timer_t*, c_long))) @nogc nothrow;
        /// Cancel a timer.
        /**
 * When a timer is canceled, rcl_timer_is_ready() will return false for that
 * timer, and rcl_timer_call() will fail with RCL_RET_TIMER_CANCELED.
 *
 * A canceled timer can be reset with rcl_timer_reset(), and then used again.
 * Calling this function on an already canceled timer will succeed.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[inout] timer the timer to be canceled
 * \return `RCL_RET_OK` if the last call time was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_TIMER_INVALID` if the timer is invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_cancel(rcl_timer_t*) @nogc nothrow;
        /// Retrieve the canceled state of a timer.
        /**
 * If the timer is canceled true will be stored in the is_canceled argument.
 * Otherwise false will be stored in the is_canceled argument.
 *
 * The is_canceled argument must point to an allocated bool, as the result is
 * copied into this variable.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_bool`</i>
 *
 * \param[in] timer the timer to be queried
 * \param[out] is_canceled storage for the is canceled bool
 * \return `RCL_RET_OK` if the last call time was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_is_canceled(const(rcl_timer_t)*, bool*) @nogc nothrow;
        /// Reset a timer.
        /**
 * This function can be called on a timer, canceled or not.
 * For all timers it will reset the last call time to now.
 * For canceled timers it will additionally make the timer not canceled.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_int_least64_t`</i>
 *
 * \param[inout] timer the timer to be reset
 * \return `RCL_RET_OK` if the last call time was retrieved successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_TIMER_INVALID` if the timer is invalid, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_timer_reset(rcl_timer_t*) @nogc nothrow;
        /// Return the allocator for the timer.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - timer is `NULL`
 *   - timer has not been initialized (the implementation is invalid)
 *
 * The returned pointer is only valid as long as the timer object is valid.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] timer handle to the timer object
 * \return pointer to the allocator, or `NULL` if an error occurred
 */
        const(rcutils_allocator_t)* rcl_timer_get_allocator(const(rcl_timer_t)*) @nogc nothrow;
        /// Retrieve a guard condition used by the timer to wake the waitset when using ROSTime.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] timer the timer to be queried
 * \return `NULL` if the timer is invalid or does not have a guard condition, or
 * \return a guard condition pointer.
 */
        rcl_guard_condition_t* rcl_timer_get_guard_condition(const(rcl_timer_t)*) @nogc nothrow;

        alias __clock_t = c_long;

        alias rcl_ret_t = int;

        struct __fsid_t
        {

            int[2] __val;
        }

        alias __pid_t = int;

        alias __off64_t = c_long;

        alias __off_t = c_long;

        alias __nlink_t = c_ulong;

        alias __mode_t = uint;

        alias __ino64_t = c_ulong;

        alias __ino_t = c_ulong;

        alias __gid_t = uint;

        alias __uid_t = uint;

        alias __dev_t = c_ulong;
        /// typedef for rmw_serialized_message_t;
        alias rcl_serialized_message_t = rcutils_uint8_array_t;

        alias __uintmax_t = c_ulong;

        alias __intmax_t = c_long;

        alias __u_quad_t = c_ulong;

        alias __quad_t = c_long;
        struct rcl_wait_set_impl_t;
        /// Container for subscription's, guard condition's, etc to be waited on.
        struct rcl_wait_set_t
        {
            /// Storage for subscription pointers.
            const(rcl_subscription_t)** subscriptions;
            /// Number of subscriptions
            c_ulong size_of_subscriptions;
            /// Storage for guard condition pointers.
            const(rcl_guard_condition_t)** guard_conditions;
            /// Number of guard_conditions
            c_ulong size_of_guard_conditions;
            /// Storage for timer pointers.
            const(rcl_timer_t)** timers;
            /// Number of timers
            c_ulong size_of_timers;
            /// Storage for client pointers.
            const(rcl_client_t)** clients;
            /// Number of clients
            c_ulong size_of_clients;
            /// Storage for service pointers.
            const(rcl_service_t)** services;
            /// Number of services
            c_ulong size_of_services;
            /// Storage for event pointers.
            const(rcl_event_t)** events;
            /// Number of events
            c_ulong size_of_events;
            /// Implementation specific storage.
            rcl_wait_set_impl_t* impl;
        }
        /// Return a rcl_wait_set_t struct with members set to `NULL`.
        rcl_wait_set_t rcl_get_zero_initialized_wait_set() @nogc nothrow;
        /// Initialize a rcl wait set with space for items to be waited on.
        /**
 * This function allocates space for the subscriptions and other wait-able
 * entities that can be stored in the wait set.
 * It also sets the allocator to the given allocator and initializes the pruned
 * member to be false.
 *
 * The wait_set struct should be allocated and initialized to `NULL`.
 * If the wait_set is allocated but the memory is uninitialized the behavior is
 * undefined.
 * Calling this function on a wait set that has already been initialized will
 * result in an error.
 * A wait set can be reinitialized if rcl_wait_set_fini() was called on it.
 *
 * To use the default allocator use rcl_get_default_allocator().
 *
 * Expected usage:
 *
 * ```c
 * #include <rcl/wait.h>
 *
 * rcl_wait_set_t wait_set = rcl_get_zero_initialized_wait_set();
 * rcl_ret_t ret =
 *   rcl_wait_set_init(&wait_set, 42, 42, 42, 42, 42, &context, rcl_get_default_allocator());
 * // ... error handling, then use it, then call the matching fini:
 * ret = rcl_wait_set_fini(&wait_set);
 * // ... error handling
 * ```
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] wait_set the wait set struct to be initialized
 * \param[in] number_of_subscriptions non-zero size of the subscriptions set
 * \param[in] number_of_guard_conditions non-zero size of the guard conditions set
 * \param[in] number_of_timers non-zero size of the timers set
 * \param[in] number_of_clients non-zero size of the clients set
 * \param[in] number_of_services non-zero size of the services set
 * \param[in] number_of_events non-zero size of the events set
 * \param[in] context the context that the wait set should be associated with
 * \param[in] allocator the allocator to use when allocating space in the sets
 * \return `RCL_RET_OK` if the wait set is initialized successfully, or
 * \return `RCL_RET_ALREADY_INIT` if the wait set is not zero initialized, or
 * \return `RCL_RET_NOT_INIT` if the given context is invalid, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_WAIT_SET_INVALID` if the wait set is not destroyed properly, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_wait_set_init(rcl_wait_set_t*, c_ulong, c_ulong, c_ulong,
                c_ulong, c_ulong, c_ulong, rcl_context_t*, rcutils_allocator_t) @nogc nothrow;
        /// Finalize a rcl wait set.
        /**
 * Deallocates any memory in the wait set that was allocated in
 * rcl_wait_set_init() using the allocator given in the initialization.
 *
 * Calling this function on a zero initialized wait set will do nothing and
 * return RCL_RET_OK.
 * Calling this function on uninitialized memory results in undefined behavior.
 * After calling this function the wait set will once again be zero initialized
 * and so calling this function or rcl_wait_set_init() immediately after will
 * succeed.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] wait_set the wait set struct to be finalized.
 * \return `RCL_RET_OK` if the finalization was successful, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_WAIT_SET_INVALID` if the wait set is not destroyed properly, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_wait_set_fini(rcl_wait_set_t*) @nogc nothrow;
        /// Retrieve the wait set's allocator.
        /**
 * The allocator must be an allocated rcl_allocator_t struct, as the result is
 * copied into this variable.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] wait_set the handle to the wait set
 * \param[out] allocator the rcl_allocator_t struct to which the result is copied
 * \return `RCL_RET_OK` if the allocator was successfully retrieved, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_WAIT_SET_INVALID` if the wait set is invalid, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_wait_set_get_allocator(const(rcl_wait_set_t)*, rcutils_allocator_t*) @nogc nothrow;
        /// Store a pointer to the given subscription in the next empty spot in the set.
        /**
 * This function does not guarantee that the subscription is not already in the
 * wait set.
 *
 * Also add the rmw representation to the underlying rmw array and increment
 * the rmw array count.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] wait_set struct in which the subscription is to be stored
 * \param[in] subscription the subscription to be added to the wait set
 * \param[out] index the index of the added subscription in the storage container.
 *   This parameter is optional and can be set to `NULL` to be ignored.
 * \return `RCL_RET_OK` if added successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_WAIT_SET_INVALID` if the wait set is zero initialized, or
 * \return `RCL_RET_WAIT_SET_FULL` if the subscription set is full, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_wait_set_add_subscription(rcl_wait_set_t*, const(rcl_subscription_t)*, c_ulong*) @nogc nothrow;
        /// Remove (sets to `NULL`) all entities in the wait set.
        /**
 * This function should be used after passing using rcl_wait, but before
 * adding new entities to the set.
 * Sets all of the entries in the underlying rmw array to `NULL`, and sets the
 * count in the rmw array to `0`.
 *
 * Calling this on an uninitialized (zero initialized) wait set will fail.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] wait_set struct to have its entities cleared
 * \return `RCL_RET_OK` if cleared successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_WAIT_SET_INVALID` if the wait set is zero initialized, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_wait_set_clear(rcl_wait_set_t*) @nogc nothrow;
        /// Reallocate space for entities in the wait set.
        /**
 * This function will deallocate and reallocate the memory for all entity sets.
 *
 * A size of 0 will just deallocate the memory and assign `NULL` to the array.
 *
 * Allocation and deallocation is done with the allocator given during the
 * wait set's initialization.
 *
 * After calling this function all values in the set will be set to `NULL`,
 * effectively the same as calling rcl_wait_set_clear().
 * Similarly, the underlying rmw representation is reallocated and reset:
 * all entries are set to `NULL` and the count is set to zero.
 *
 * If the requested size matches the current size, no allocation will be done.
 *
 * This can be called on an uninitialized (zero initialized) wait set.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] wait_set struct to be resized
 * \param[in] subscriptions_size a size for the new subscriptions set
 * \param[in] guard_conditions_size a size for the new guard conditions set
 * \param[in] timers_size a size for the new timers set
 * \param[in] clients_size a size for the new clients set
 * \param[in] services_size a size for the new services set
 * \param[in] events_size a size for the new events set
 * \return `RCL_RET_OK` if resized successfully, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RCL_RET_ERROR` if an unspecified error occurs.
 */
        int rcl_wait_set_resize(rcl_wait_set_t*, c_ulong, c_ulong, c_ulong,
                c_ulong, c_ulong, c_ulong) @nogc nothrow;
        /// Store a pointer to the guard condition in the next empty spot in the set.
        /**
 * This function behaves exactly the same as for subscriptions.
 * \see rcl_wait_set_add_subscription
 */
        int rcl_wait_set_add_guard_condition(rcl_wait_set_t*,
                const(rcl_guard_condition_t)*, c_ulong*) @nogc nothrow;
        /// Store a pointer to the timer in the next empty spot in the set.
        /**
 * This function behaves exactly the same as for subscriptions.
 * \see rcl_wait_set_add_subscription
 */
        int rcl_wait_set_add_timer(rcl_wait_set_t*, const(rcl_timer_t)*, c_ulong*) @nogc nothrow;
        /// Store a pointer to the client in the next empty spot in the set.
        /**
 * This function behaves exactly the same as for subscriptions.
 * \see rcl_wait_set_add_subscription
 */
        int rcl_wait_set_add_client(rcl_wait_set_t*, const(rcl_client_t)*, c_ulong*) @nogc nothrow;
        /// Store a pointer to the service in the next empty spot in the set.
        /**
 * This function behaves exactly the same as for subscriptions.
 * \see rcl_wait_set_add_subscription
 */
        int rcl_wait_set_add_service(rcl_wait_set_t*, const(rcl_service_t)*, c_ulong*) @nogc nothrow;
        /// Store a pointer to the event in the next empty spot in the set.
        /**
 * This function behaves exactly the same as for subscriptions.
 * \see rcl_wait_set_add_subscription
 */
        int rcl_wait_set_add_event(rcl_wait_set_t*, const(rcl_event_t)*, c_ulong*) @nogc nothrow;
        /// Block until the wait set is ready or until the timeout has been exceeded.
        /**
 * This function will collect the items in the rcl_wait_set_t and pass them
 * to the underlying rmw_wait function.
 *
 * The items in the wait set will be either left untouched or set to `NULL` after
 * this function returns.
 * Items that are not `NULL` are ready, where ready means different things based
 * on the type of the item.
 * For subscriptions this means there may be messages that can be taken, or
 * perhaps that the state of the subscriptions has changed, in which case
 * rcl_take may succeed but return with taken == false.
 * For guard conditions this means the guard condition was triggered.
 *
 * Expected usage:
 *
 * ```c
 * #include <rcl/rcl.h>
 *
 * // rcl_init() called successfully before here...
 * rcl_node_t node;  // initialize this, see rcl_node_init()
 * rcl_subscription_t sub1;  // initialize this, see rcl_subscription_init()
 * rcl_subscription_t sub2;  // initialize this, see rcl_subscription_init()
 * rcl_guard_condition_t gc1;  // initialize this, see rcl_guard_condition_init()
 * rcl_wait_set_t wait_set = rcl_get_zero_initialized_wait_set();
 * rcl_ret_t ret = rcl_wait_set_init(&wait_set, 2, 1, 0, 0, 0, rcl_get_default_allocator());
 * // ... error handling
 * do {
 *   ret = rcl_wait_set_clear(&wait_set);
 *   // ... error handling
 *   ret = rcl_wait_set_add_subscription(&wait_set, &sub1);
 *   // ... error handling
 *   ret = rcl_wait_set_add_subscription(&wait_set, &sub2);
 *   // ... error handling
 *   ret = rcl_wait_set_add_guard_condition(&wait_set, &gc1);
 *   // ... error handling
 *   ret = rcl_wait(&wait_set, RCL_MS_TO_NS(1000));  // 1000ms == 1s, passed as ns
 *   if (ret == RCL_RET_TIMEOUT) {
 *     continue;
 *   }
 *   for (int i = 0; i < wait_set.size_of_subscriptions; ++i) {
 *     if (wait_set.subscriptions[i]) {
 *       // The subscription is ready...
 *     }
 *   }
 *   for (int i = 0; i < wait_set.size_of_guard_conditions; ++i) {
 *     if (wait_set.guard_conditions[i]) {
 *       // The subscription is ready...
 *     }
 *   }
 * } while(check_some_condition());
 * // ... fini node, and subscriptions and guard conditions...
 * ret = rcl_wait_set_fini(&wait_set);
 * // ... error handling
 * ```
 *
 * The wait set struct must be allocated, initialized, and should have been
 * cleared and then filled with items, e.g. subscriptions and guard conditions.
 * Passing a wait set with no wait-able items in it will fail.
 * `NULL` items in the sets are ignored, e.g. it is valid to have as input:
 *  - `subscriptions[0]` = valid pointer
 *  - `subscriptions[1]` = `NULL`
 *  - `subscriptions[2]` = valid pointer
 *  - `size_of_subscriptions` = 3
 * Passing an uninitialized (zero initialized) wait set struct will fail.
 * Passing a wait set struct with uninitialized memory is undefined behavior.
 *
 * The unit of timeout is nanoseconds.
 * If the timeout is negative then this function will block indefinitely until
 * something in the wait set is valid or it is interrupted.
 * If the timeout is 0 then this function will be non-blocking; checking what's
 * ready now, but not waiting if nothing is ready yet.
 * If the timeout is greater than 0 then this function will return after
 * that period of time has elapsed or the wait set becomes ready, which ever
 * comes first.
 * Passing a timeout struct with uninitialized memory is undefined behavior.
 *
 * This function is thread-safe for unique wait sets with unique contents.
 * This function cannot operate on the same wait set in multiple threads, and
 * the wait sets may not share content.
 * For example, calling rcl_wait() in two threads on two different wait sets
 * that both contain a single, shared guard condition is undefined behavior.
 *
 * \param[inout] wait_set the set of things to be waited on and to be pruned if not ready
 * \param[in] timeout the duration to wait for the wait set to be ready, in nanoseconds
 * \return `RCL_RET_OK` something in the wait set became ready, or
 * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCL_RET_WAIT_SET_INVALID` if the wait set is zero initialized, or
 * \return `RCL_RET_WAIT_SET_EMPTY` if the wait set contains no items, or
 * \return `RCL_RET_TIMEOUT` if the timeout expired before something was ready, or
 * \return `RCL_RET_ERROR` an unspecified error occur.
 */
        int rcl_wait(rcl_wait_set_t*, c_long) @nogc nothrow;
        /// Return `true` if the wait set is valid, else `false`.
        /**
 * A wait set is invalid if:
 *   - the implementation is `NULL` (rcl_wait_set_init not called or failed)
 *   - the wait set has been finalized with rcl_wait_set_fini
 *
 * Also return `false` if the wait set pointer is `NULL`.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] wait_set the rcl_wait_set_t to be validated
 * \return `true` if the wait_set is valid, otherwise `false`.
 */
        bool rcl_wait_set_is_valid(const(rcl_wait_set_t)*) @nogc nothrow;
        /// Array of bool values
        alias rcl_bool_array_t = rcl_bool_array_s;
        /// Array of bool values
        struct rcl_bool_array_s
        {
            /// Array with bool values
            bool* values;
            /// Number of values in the array
            c_ulong size;
        }
        /// Array of int64_t values
        alias rcl_int64_array_t = rcl_int64_array_s;
        /// Array of int64_t values
        struct rcl_int64_array_s
        {
            /// Array with int64 values
            c_long* values;
            /// Number of values in the array
            c_ulong size;
        }
        /// Array of double values
        alias rcl_double_array_t = rcl_double_array_s;
        /// Array of double values
        struct rcl_double_array_s
        {
            /// Array with double values
            double* values;
            /// Number of values in the array
            c_ulong size;
        }
        /// Array of byte values
        alias rcl_byte_array_t = rcl_byte_array_s;
        /// Array of byte values
        struct rcl_byte_array_s
        {
            /// Array with uint8_t values
            ubyte* values;
            /// Number of values in the array
            c_ulong size;
        }
        /// variant_t stores the value of a parameter
        alias rcl_variant_t = rcl_variant_s;
        /// variant_t stores the value of a parameter
        struct rcl_variant_s
        {
            ///< If bool, gets stored here
            bool* bool_value;
            ///< If integer, gets stored here
            c_long* integer_value;
            ///< If double, gets stored here
            double* double_value;
            ///< If string, gets stored here
            char* string_value;
            ///< If array of bytes
            rcl_byte_array_s* byte_array_value;
            ///< If array of bool's
            rcl_bool_array_s* bool_array_value;
            ///< If array of integers
            rcl_int64_array_s* integer_array_value;
            ///< If array of doubles
            rcl_double_array_s* double_array_value;
            ///< If array of strings
            rcutils_string_array_t* string_array_value;
        }
        /// node_params_t stores all the parameters(key:value) of a single node
        alias rcl_node_params_t = rcl_node_params_s;
        /// node_params_t stores all the parameters(key:value) of a single node
        struct rcl_node_params_s
        {
            ///< Array of parameter names (keys)
            char** parameter_names;
            ///< Array of coressponding parameter values
            rcl_variant_s* parameter_values;
            ///< Number of parameters in the node
            c_ulong num_params;
        }
        /// stores all the parameters of all nodes of a process
        alias rcl_params_t = rcl_params_s;
        /// stores all the parameters of all nodes of a process
        struct rcl_params_s
        {
            ///< List of names of the node
            char** node_names;
            ///<  Array of parameters
            rcl_node_params_s* params;
            ///< Number of nodes
            c_ulong num_nodes;
            ///< Allocator used
            rcutils_allocator_t allocator;
        }

        alias __uint_least64_t = c_ulong;
        /// Encapsulation of an allocator.
        /**
 * The default allocator uses malloc(), free(), calloc(), and realloc().
 * It can be obtained using rcutils_get_default_allocator().
 *
 * The allocator should be trivially copyable.
 * Meaning that the struct should continue to work after being assignment
 * copied into a new struct.
 * Specifically the object pointed to by the state pointer should remain valid
 * until all uses of the allocator have been made.
 * Particular care should be taken when giving an allocator to functions like
 * rcutils_*_init() where it is stored within another object and used later.
 * Developers should note that, while the fields of a const-qualified allocator
 * struct cannot be modified, the state of the allocator can be modified.
 */
        struct rcutils_allocator_t
        {
            /// Allocate memory, given a size and the `state` pointer.
            /** An error should be indicated by returning `NULL`. */
            void* function(c_ulong, void*) allocate;
            /// Deallocate previously allocated memory, mimicking free().
            /** Also takes the `state` pointer. */
            void function(void*, void*) deallocate;
            /// Reallocate if possible, otherwise it deallocates and allocates.
            /**
   * Also takes the `state` pointer.
   *
   * If unsupported then do deallocate and then allocate.
   * This should behave as realloc() does, as opposed to posix's
   * [reallocf](https://linux.die.net/man/3/reallocf), i.e. the memory given
   * by pointer will not be free'd automatically if realloc() fails.
   * For reallocf-like behavior use rcutils_reallocf().
   * This function must be able to take an input pointer of `NULL` and succeed.
   */
            void* function(void*, c_ulong, void*) reallocate;
            /// Allocate memory with all elements set to zero, given a number of elements and their size.
            /** An error should be indicated by returning `NULL`. */
            void* function(c_ulong, c_ulong, void*) zero_allocate;
            /// Implementation defined state storage.
            /**
   * This is passed as the final parameter to other allocator functions.
   * Note that the contents of the state can be modified even in const-qualified
   * allocator objects.
   */
            void* state;
        }
        /// Return a zero initialized allocator.
        /**
 * Note that this is an invalid allocator and should only be used as a placeholder.
 */
        rcutils_allocator_t rcutils_get_zero_initialized_allocator() @nogc nothrow;
        /// Return a properly initialized rcutils_allocator_t with default values.
        /**
 * This defaults to:
 *
 * - allocate = wraps malloc()
 * - deallocate = wraps free()
 * - reallocate = wraps realloc()
 * - zero_allocate = wraps calloc()
 * - state = `NULL`
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 */
        rcutils_allocator_t rcutils_get_default_allocator() @nogc nothrow;
        /// Return true if the given allocator has non-null function pointers.
        /**
 * Will also return false if the allocator pointer is null.
 *
 * \param[in] allocator to be checked by the function
 */
        bool rcutils_allocator_is_valid(const(rcutils_allocator_t)*) @nogc nothrow;

        alias __int_least64_t = c_long;

        alias __uint_least32_t = uint;
        /// Emulate the behavior of [reallocf](https://linux.die.net/man/3/reallocf).
        /**
 * This function will return `NULL` if the allocator is `NULL` or has `NULL` for
 * function pointer fields.
 * \param[inout] pointer to the memory which will be reallocated
 * \param[in] size in bytes
 * \param[in] allocator to be used to allocate and deallocate memory
 */
        void* rcutils_reallocf(void*, c_ulong, rcutils_allocator_t*) @nogc nothrow;

        alias __int_least32_t = int;

        alias __uint_least16_t = ushort;

        alias __int_least16_t = short;

        alias __uint_least8_t = ubyte;

        alias __int_least8_t = byte;

        alias __uint64_t = c_ulong;

        alias __int64_t = c_long;
        /// Struct wrapping a fixed-size c string used for returning the formatted error string.
        struct rcutils_error_string_t
        {

            char[1024] str;
        }
        /// Struct which encapsulates the error state set by RCUTILS_SET_ERROR_MSG().
        struct rcutils_error_state_t
        {
            /// User message storage, limited to RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH characters.
            char[768] message;
            /// File name, limited to what's left from RCUTILS_ERROR_STATE_MAX_SIZE characters
            /// after subtracting storage for others.
            char[229] file;
            /// Line number of error.
            c_ulong line_number;
        }
        /// Forces initialization of thread-local storage if called in a newly created thread.
        /**
 * If this function is not called beforehand, then the first time the error
 * state is set or the first time the error message is retrieved, the default
 * allocator will be used to allocate thread-local storage.
 *
 * This function may or may not allocate memory.
 * The system's thread-local storage implementation may need to allocate
 * memory, since it usually has no way of knowing how much storage is needed
 * without knowing how many threads will be created.
 * Most implementations (e.g. C11, C++11, and pthread) do not have ways to
 * specify how this memory is allocated, but if the implementation allows, the
 * given allocator to this function will be used, but is otherwise unused.
 * This only occurs when creating and destroying threads, which can be avoided
 * in the "steady" state by reusing pools of threads.
 *
 * It is worth considering that repeated thread creation and destruction will
 * result in repeated memory allocations and could result in memory
 * fragmentation.
 * This is typically avoided anyways by using pools of threads.
 *
 * In case an error is indicated by the return code, no error message will have
 * been set.
 *
 * If called more than once in a thread, or after implicitly initialized by
 * setting the error state, it will still return `RCUTILS_RET_OK`, even
 * if the given allocator is invalid.
 * Essentially this function does nothing if thread-local storage has already
 * been called.
 * If already initialized, the given allocator is ignored, even if it does not
 * match the allocator used originally to initialize the thread-local storage.
 *
 * \param[in] allocator to be used to allocate and deallocate memory
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if the allocator is invalid, or
 * \return `RCUTILS_RET_BAD_ALLOC` if allocating memory fails, or
 * \return `RCUTILS_RET_ERROR` if an unspecified error occurs.
 */
        int rcutils_initialize_error_handling_thread_local_storage(rcutils_allocator_t) @nogc nothrow;
        /// Set the error message, as well as the file and line on which it occurred.
        /**
 * This is not meant to be used directly, but instead via the
 * RCUTILS_SET_ERROR_MSG(msg) macro.
 *
 * The error_msg parameter is copied into the internal error storage and must
 * be null terminated.
 * The file parameter is copied into the internal error storage and must
 * be null terminated.
 *
 * \param[in] error_string The error message to set.
 * \param[in] file The path to the file in which the error occurred.
 * \param[in] line_number The line number on which the error occurred.
 */
        void rcutils_set_error_state(const(char)*, const(char)*, c_ulong) @nogc nothrow;

        alias __uint32_t = uint;

        alias __int32_t = int;

        alias __uint16_t = ushort;

        alias __int16_t = short;

        alias __uint8_t = ubyte;
        /// Return `true` if the error is set, otherwise `false`.
        bool rcutils_error_is_set() @nogc nothrow;
        /// Return an rcutils_error_state_t which was set with rcutils_set_error_state().
        /**
 * The returned pointer will be NULL if no error has been set in this thread.
 *
 * The returned pointer is valid until RCUTILS_SET_ERROR_MSG, rcutils_set_error_state,
 * or rcutils_reset_error are called in the same thread.
 *
 * \return A pointer to the current error state struct.
 */
        const(rcutils_error_state_t)* rcutils_get_error_state() @nogc nothrow;
        /// Return the error message followed by `, at <file>:<line>` if set, else "error not set".
        /**
 * This function is "safe" because it returns a copy of the current error
 * string or one containing the string "error not set" if no error was set.
 * This ensures that the copy is owned by the calling thread and is therefore
 * never invalidated by other error handling calls, and that the C string
 * inside is always valid and null terminated.
 *
 * \return The current error string, with file and line number, or "error not set" if not set.
 */
        rcutils_error_string_t rcutils_get_error_string() @nogc nothrow;
        /// Reset the error state by clearing any previously set error state.
        void rcutils_reset_error() @nogc nothrow;

        alias __int8_t = byte;

        alias __u_long = c_ulong;

        alias __u_int = uint;

        alias __u_short = ushort;
        /// The flag if the logging system has been initialized.
        extern __gshared bool g_rcutils_logging_initialized;
        /// Initialize the logging system using the specified allocator.
        /**
 * Initialize the logging system only if it was not in an initialized state.
 *
 * If an invalid allocator is passed, the initialization will fail.
 * Otherwise, this function will still set the internal state to initialized
 * even if an error occurs, to avoid repeated failing initialization attempts
 * since this function is called automatically from logging macros.
 * To re-attempt initialization, call rcutils_logging_shutdown() before
 * re-calling this function.
 *
 * If multiple errors occur, the error code of the last error will be returned.
 *
 * The `RCUTILS_CONSOLE_OUTPUT_FORMAT` environment variable can be used to set
 * the output format of messages logged to the console.
 * Available tokens are:
 *   - `file_name`, the full file name of the caller including the path
 *   - `function_name`, the function name of the caller
 *   - `line_number`, the line number of the caller
 *   - `message`, the message string after it has been formatted
 *   - `name`, the full logger name
 *   - `severity`, the name of the severity level, e.g. `INFO`
 *   - `time`, the timestamp of log message in floating point seconds
 *   - `time_as_nanoseconds`, the timestamp of log message in integer nanoseconds
 *
 * The `RCUTILS_COLORIZED_OUTPUT` environment variable allows configuring if colours
 * are used or not. Available values are:
 *  - `1`: Force using colours.
 *  - `0`: Don't use colours.
 * If it is unset, colours are used depending if the target stream is a terminal or not.
 * See `isatty` documentation.
 *
 * The format string can use these tokens by referencing them in curly brackets,
 * e.g. `"[{severity}] [{name}]: {message} ({function_name}() at {file_name}:{line_number})"`.
 * Any number of tokens can be used.
 * The limit of the format string is 2048 characters.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] allocator rcutils_allocator_t to be used.
 * \return `RCUTILS_RET_OK` if successful.
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if the allocator is invalid, in which
 *   case initialization will fail.
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if an error occurs reading the output
 *   format from the `RCUTILS_CONSOLE_OUTPUT_FORMAT` environment variable, in
 *   which case the default format will be used.
 * \return `RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID` if the internal logger
 *   severity level map cannot be initialized, in which case logger severity
 *   levels will not be configurable.
 */
        int rcutils_logging_initialize_with_allocator(rcutils_allocator_t) @nogc nothrow;
        /// Initialize the logging system.
        /**
 * Call rcutils_logging_initialize_with_allocator() using the default allocator.
 * This function is called automatically when using the logging macros.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \return `RCUTILS_RET_OK` if successful.
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if an error occurs reading the output
 *   format from the `RCUTILS_CONSOLE_OUTPUT_FORMAT` environment variable, in
 *   which case the default format will be used.
 * \return `RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID` if the internal logger
 *   severity level map cannot be initialized, in which case logger levels
 *   will not be configurable.
 */
        int rcutils_logging_initialize() @nogc nothrow;
        /// Shutdown the logging system.
        /**
 * Free the resources allocated for the logging system.
 * This puts the system into a state equivalent to being uninitialized.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \return `RCUTILS_RET_OK` if successful.
 * \return `RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID` if the internal logger
 *   severity level map cannot be finalized.
 */
        int rcutils_logging_shutdown() @nogc nothrow;
        /// The structure identifying the caller location in the source code.
        struct rcutils_log_location_t
        {
            /// The name of the function containing the log call.
            const(char)* function_name;
            /// The name of the source file containing the log call.
            const(char)* file_name;
            /// The line number containing the log call.
            c_ulong line_number;
        }
        /// The severity levels of log messages / loggers.
        enum RCUTILS_LOG_SEVERITY
        {
            ///< The unset log level
            RCUTILS_LOG_SEVERITY_UNSET = 0,
            ///< The debug log level
            RCUTILS_LOG_SEVERITY_DEBUG = 10,
            ///< The info log level
            RCUTILS_LOG_SEVERITY_INFO = 20,
            ///< The warn log level
            RCUTILS_LOG_SEVERITY_WARN = 30,
            ///< The error log level
            RCUTILS_LOG_SEVERITY_ERROR = 40,
            ///< The fatal log level
            RCUTILS_LOG_SEVERITY_FATAL = 50,
        }

        enum RCUTILS_LOG_SEVERITY_UNSET = RCUTILS_LOG_SEVERITY.RCUTILS_LOG_SEVERITY_UNSET;
        enum RCUTILS_LOG_SEVERITY_DEBUG = RCUTILS_LOG_SEVERITY.RCUTILS_LOG_SEVERITY_DEBUG;
        enum RCUTILS_LOG_SEVERITY_INFO = RCUTILS_LOG_SEVERITY.RCUTILS_LOG_SEVERITY_INFO;
        enum RCUTILS_LOG_SEVERITY_WARN = RCUTILS_LOG_SEVERITY.RCUTILS_LOG_SEVERITY_WARN;
        enum RCUTILS_LOG_SEVERITY_ERROR = RCUTILS_LOG_SEVERITY.RCUTILS_LOG_SEVERITY_ERROR;
        enum RCUTILS_LOG_SEVERITY_FATAL = RCUTILS_LOG_SEVERITY.RCUTILS_LOG_SEVERITY_FATAL;
        /// The names of severity levels.
        extern __gshared const(const(char)*)[51] g_rcutils_log_severity_names;
        /// Get a severity value from its string representation (e.g. DEBUG).
        /**
 * String representation must match one of the values in
 * `g_rcutils_log_severity_names`, but is not case-sensitive.
 * Examples: UNSET, DEBUG, INFO, WARN, Error, fatal.
 *
 * \param[in] severity_string String representation of the severity, must be a
 *   null terminated c string
 * \param[in] allocator rcutils_allocator_t to be used
 * \param[in,out] severity The severity level as a represented by the
 *   `RCUTILS_LOG_SEVERITY` enum
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` on invalid arguments, or
 * \return `RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID` if unable to match
 *   string, or
 * \return `RCUTILS_RET_ERROR` if an unspecified error occured
 */
        int rcutils_logging_severity_level_from_string(const(char)*, rcutils_allocator_t, int*) @nogc nothrow;
        alias rcutils_logging_output_handler_t = void function(const(rcutils_log_location_t)*,
                int, const(char)*, c_long, const(char)*, va_list**);
        /// The function pointer of the current output handler.
        extern __gshared void function(const(rcutils_log_location_t)*, int,
                const(char)*, c_long, const(char)*, va_list**) g_rcutils_logging_output_handler;
        /// Get the current output handler.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, provided logging system is already initialized
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \return The function pointer of the current output handler.
 */
        void function(const(rcutils_log_location_t)*, int, const(char)*,
                c_long, const(char)*, va_list**) rcutils_logging_get_output_handler() @nogc nothrow;
        /// Set the current output handler.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, provided logging system is already initialized
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] function The function pointer of the output handler to be used.
 */
        void rcutils_logging_set_output_handler(void function(const(rcutils_log_location_t)*,
                int, const(char)*, c_long, const(char)*, va_list**)) @nogc nothrow;
        /// Formats a log message according to RCUTILS_CONSOLE_OUTPUT_FORMAT
        /**
 * A formatter that is meant to be used by an output handler to format a log message to the match
 * the format specified in RCUTILS_CONSOLE_OUTPUT_FORMAT by performing token replacement.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \return `RCUTILS_RET_OK` if successful.
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation error occured
 * \param[in] location The location information about where the log came from
 * \param[in] severity The severity of the log message expressed as an integer
 * \param[in] name The name of the logger that this message came from
 * \param[in] timestamp The time at which the log message was generated
 * \param[in] msg The message being logged
 * \param[out] logging_output An output buffer for the formatted message
 */
        int rcutils_logging_format_message(const(rcutils_log_location_t)*,
                int, const(char)*, c_long, const(char)*, rcutils_char_array_t*) @nogc nothrow;
        /// The default severity level for loggers.
        /**
 * This level is used for (1) nameless log calls and (2) named log
 * calls where the effective level of the logger name is unspecified.
 *
 * \see rcutils_logging_get_logger_effective_level()
 */
        extern __gshared int g_rcutils_logging_default_logger_level;
        /// Get the default level for loggers.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, provided logging system is already initialized
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \return The level.
 */
        int rcutils_logging_get_default_logger_level() @nogc nothrow;
        /// Set the default severity level for loggers.
        /**
 * If the severity level requested is `RCUTILS_LOG_SEVERITY_UNSET`, the default
 * value for the default logger (`RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL`)
 * will be restored instead.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, provided logging system is already initialized
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] level The level to be used.
 */
        void rcutils_logging_set_default_logger_level(int) @nogc nothrow;
        /// Get the severity level for a logger.
        /**
 * This considers the severity level of the specifed logger only.
 * To get the effective level of a logger given the severity level of its
 * ancestors, see rcutils_logging_get_logger_effective_level().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, provided logging system is already initialized
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] name The name of the logger, must be null terminated c string
 * \return The level of the logger if it has been set, or
 * \return `RCUTILS_LOG_SEVERITY_UNSET` if unset, or
 * \return `g_rcutils_logging_default_logger_level` for an empty name, or
 * \return -1 on invalid arguments, or
 * \return -1 if an error occurred
 */
        int rcutils_logging_get_logger_level(const(char)*) @nogc nothrow;
        /// Get the level for a logger and its name length.
        /**
 * Identical to rcutils_logging_get_logger_level() but without
 * relying on the logger name to be a null terminated c string.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, provided logging system is already initialized
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] name The name of the logger
 * \param[in] name_length Logger name length
 * \return The level of the logger if it has been set, or
 * \return `RCUTILS_LOG_SEVERITY_UNSET` if unset, or
 * \return `g_rcutils_logging_default_logger_level` for `name_length` of `0`, or
 * \return -1 on invalid arguments, or
 * \return -1 if an error occurred
 */
        int rcutils_logging_get_logger_leveln(const(char)*, c_ulong) @nogc nothrow;
        /// Set the severity level for a logger.
        /**
 * If an empty string is specified as the name, the
 * `g_rcutils_logging_default_logger_level` will be set.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] name The name of the logger, must be null terminated c string.
 * \param[in] level The level to be used.
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` on invalid arguments, or
 * \return `RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID` if severity map invalid, or
 * \return `RCUTILS_RET_ERROR` if an unspecified error occured
 */
        int rcutils_logging_set_logger_level(const(char)*, int) @nogc nothrow;
        /// Determine if a logger is enabled for a severity level.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, provided logging system is already initialized
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] name The name of the logger, must be null terminated c string or NULL.
 * \param[in] severity The severity level.
 *
 * \return true if the logger is enabled for the level; false otherwise.
 */
        bool rcutils_logging_logger_is_enabled_for(const(char)*, int) @nogc nothrow;
        /// Determine the effective level for a logger.
        /**
 * The effective level is determined as the severity level of
 * the logger if it is set, otherwise it is the first specified severity
 * level of the logger's ancestors, starting with its closest ancestor.
 * The ancestor hierarchy is signified by logger names being separated by dots:
 * a logger named `x` is an ancestor of `x.y`, and both `x` and `x.y` are
 * ancestors of `x.y.z`, etc.
 * If the level has not been set for the logger nor any of its
 * ancestors, the default level is used.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, provided logging system is already initialized
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] name The name of the logger, must be null terminated c string.
 *
 * \return The level, or
 * \return -1 on invalid arguments, or
 * \return -1 if an error occurred.
 */
        int rcutils_logging_get_logger_effective_level(const(char)*) @nogc nothrow;
        /// Log a message.
        /**
 * The attributes of this function are also being influenced by the currently
 * set output handler.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No, for formatted outputs <= 1023 characters
 *                    | Yes, for formatted outputs >= 1024 characters
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] location The pointer to the location struct or NULL
 * \param[in] severity The severity level
 * \param[in] name The name of the logger, must be null terminated c string or NULL
 * \param[in] format The format string
 * \param[in] ... The variable arguments
 */
        void rcutils_log(const(rcutils_log_location_t)*, int, const(char)*, const(char)*, ...) @nogc nothrow;
        /// The default output handler outputs log messages to the standard streams.
        /**
 * The messages with a severity level `DEBUG` and `INFO` are written to `stdout`.
 * The messages with a severity level `WARN`, `ERROR`, and `FATAL` are written
 * to `stderr`.
 * The console output format of the logged message can be configured through
 * the `RCUTILS_CONSOLE_OUTPUT_FORMAT` environment variable: see
 * rcutils_logging_initialize_with_allocator() for details.
 * For configuring if using colours or not, `RCUTILS_COLORIZED_OUTPUT` can be used:
 * see rcutils_logging_initialize_with_allocator() for details.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes, if the underlying *printf functions are
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] location The pointer to the location struct or NULL
 * \param[in] severity The severity level
 * \param[in] name The name of the logger, must be null terminated c string
 * \param[in] timestamp The timestamp for when the log message was made
 * \param[in] format The format string
 * \param[in] args The `va_list` used by the logger
 */
        void rcutils_logging_console_output_handler(const(rcutils_log_location_t)*,
                int, const(char)*, c_long, const(char)*, va_list**) @nogc nothrow;

        alias __u_char = ubyte;

        struct __pthread_cond_s
        {

            static union _Anonymous_2
            {

                ulong __wseq;

                static struct _Anonymous_3
                {

                    uint __low;

                    uint __high;
                }

                _Anonymous_3 __wseq32;
            }

            _Anonymous_2 _anonymous_4;
            ref auto __wseq() @property @nogc pure nothrow
            {
                return _anonymous_4.__wseq;
            }

            void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow
            {
                _anonymous_4.__wseq = val;
            }

            ref auto __wseq32() @property @nogc pure nothrow
            {
                return _anonymous_4.__wseq32;
            }

            void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow
            {
                _anonymous_4.__wseq32 = val;
            }

            static union _Anonymous_5
            {

                ulong __g1_start;

                static struct _Anonymous_6
                {

                    uint __low;

                    uint __high;
                }

                _Anonymous_6 __g1_start32;
            }

            _Anonymous_5 _anonymous_7;
            ref auto __g1_start() @property @nogc pure nothrow
            {
                return _anonymous_7.__g1_start;
            }

            void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow
            {
                _anonymous_7.__g1_start = val;
            }

            ref auto __g1_start32() @property @nogc pure nothrow
            {
                return _anonymous_7.__g1_start32;
            }

            void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow
            {
                _anonymous_7.__g1_start32 = val;
            }

            uint[2] __g_refs;

            uint[2] __g_size;

            uint __g1_orig_size;

            uint __wrefs;

            uint[2] __g_signals;
        }

        struct __pthread_internal_slist
        {

            __pthread_internal_slist* __next;
        }

        alias __pthread_slist_t = __pthread_internal_slist;

        struct __pthread_internal_list
        {

            __pthread_internal_list* __prev;

            __pthread_internal_list* __next;
        }

        alias __pthread_list_t = __pthread_internal_list;

        extern __gshared const(const(char)*)[0] sys_errlist;
        /// Interface to qsort with rcutils-style argument validation.
        /**
 * This function changes the order of the elements in the array so that they
 * are in ascending order according to the given comparison function.
 *
 * This function is thread-safe.
 *
 * \param[inout] ptr object whose elements should be sorted.
 * \param[in] count number of elements present in the object.
 * \param[in] size size of each element, in bytes.
 * \param[in] comp function used to compare two elements.
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs.
 */
        int rcutils_qsort(void*, c_ulong, c_ulong, int function(const(void)*, const(void)*)) @nogc nothrow;

        extern __gshared int sys_nerr;
        /// Format a string.
        /**
 * This function just wraps snprintf() as defined in C11 in a portable way.
 *
 * On Windows this defaults to the _TRUNCATE behavior of _snprintf_s(), but
 * only returns -1 if errno is not 0.
 * Unlike _snprintf_s() which returns -1 when truncation occurs, this function
 * behaves like snprintf() (http://en.cppreference.com/w/cpp/io/c/fprintf):
 *
 * > Number of characters written if successful or negative value if an error
 * > occurred.
 * > If the resulting string gets truncated due to buf_size limit, function
 * > returns the total number of characters (not including the terminating
 * > null-byte) which would have been written, if the limit was not imposed.
 *
 * If `NULL` and `0` are given for buffer and buffer_size respectively, the
 * size of the string that would be generated is returned.
 * Either snprintf() or _vscprintf() is used to calculate this value.
 *
 * \see snprintf()
 * \see _snprintf_s()
 * \returns the number of bytes that would have been written given enough space,
 *   or a negative number if there is an error, but unlike _snprintf_s(),
 *   -1 is not returned if there is truncation.
 */
        int rcutils_snprintf(char*, c_ulong, const(char)*, ...) @nogc nothrow;
        /// Format a string with va_list for arguments, see rcutils_snprintf().
        int rcutils_vsnprintf(char*, c_ulong, const(char)*, va_list*) @nogc nothrow;

        bool rcutils_fault_injection_is_test_complete() @nogc nothrow;
        /**
 * \brief Atomically set the fault injection counter.
 *
 * This is typically not the preferred method of interacting directly with the fault injection
 * logic, instead use `RCUTILS_FAULT_INJECTION_TEST` instead.
 *
 * This function may also be used for pausing code inside of a `RCUTILS_FAULT_INJECTION_TEST` with
 * something like the following:
 *
 * RCUTILS_FAULT_INJECTION_TEST({
 *     ...  // code to run with fault injection
 *     int64_t count = rcutils_fault_injection_get_count();
 *     rcutils_fault_injection_set_count(RCUTILS_FAULT_INJECTION_NEVER_FAIL);
 *     ...  // code to run without fault injection
 *     rcutils_fault_injection_set_count(count);
 *     ...  // code to run with fault injection
 * });
 *
 * \param count The count to set the fault injection counter to. If count is negative, then fault
 * injection errors will be disabled. The counter is globally initialized to
 * RCUTILS_FAULT_INJECTION_NEVER_FAIL.
 */
        void rcutils_fault_injection_set_count(c_long) @nogc nothrow;
        /**
 * \brief Atomically get the fault injection counter value
 *
 * This function is typically not used directly but instead indirectly inside an
 * `RCUTILS_FAULT_INJECTION_TEST`
 */
        c_long rcutils_fault_injection_get_count() @nogc nothrow;
        /**
 * \brief Implementation of fault injection decrementer
 *
 * This is included inside of macros, so it needs to be exported as a public function, but it
 * should not be used directly.
 */
        c_long _rcutils_fault_injection_maybe_fail() @nogc nothrow;

        struct __pthread_rwlock_arch_t
        {

            uint __readers;

            uint __writers;

            uint __wrphase_futex;

            uint __writers_futex;

            uint __pad3;

            uint __pad4;

            int __cur_writer;

            int __shared;

            byte __rwelision;

            ubyte[7] __pad1;

            c_ulong __pad2;

            uint __flags;
        }

        struct __pthread_mutex_s
        {

            int __lock;

            uint __count;

            int __owner;

            uint __nusers;

            int __kind;

            short __spins;

            short __elision;

            __pthread_internal_list __list;
        }

        alias uint64_t = ulong;

        alias uint32_t = uint;
        /// A single point in time, measured in nanoseconds since the Unix epoch.
        alias rcutils_time_point_value_t = c_long;
        /// A duration of time, measured in nanoseconds.
        alias rcutils_duration_value_t = c_long;
        /**
 * This function returns the time from a system clock.
 * The closest equivalent would be to std::chrono::system_clock::now();
 *
 * The resolution (e.g. nanoseconds vs microseconds) is not guaranteed.
 *
 * The now argument must point to an allocated rcutils_time_point_value_t object,
 * as the result is copied into this variable.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[out] now a datafield in which the current time is stored
 * \return `RCUTILS_RET_OK` if the current time was successfully obtained, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCUTILS_RET_ERROR` if an unspecified error occur.
 */
        int rcutils_system_time_now(c_long*) @nogc nothrow;
        /// Retrieve the current time as a rcutils_time_point_value_t object.
        /**
 * This function returns the time from a monotonically increasing clock.
 * The closest equivalent would be to std::chrono::steady_clock::now();
 *
 * The resolution (e.g. nanoseconds vs microseconds) is not guaranteed.
 *
 * The now argument must point to an allocated rcutils_time_point_value_t object,
 * as the result is copied into this variable.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[out] now a struct in which the current time is stored
 * \return `RCUTILS_RET_OK` if the current time was successfully obtained, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCUTILS_RET_ERROR` if an unspecified error occur.
 */
        int rcutils_steady_time_now(c_long*) @nogc nothrow;
        /// Return a time point as nanoseconds in a string.
        /**
 * The number is always fixed width, with left padding zeros up to the maximum
 * number of digits the time point can represent.
 * Right now that is 19 digits (so 19 characters) for a signed 64-bit integer.
 * Negative values will have a leading `-`, so they will be one character
 * longer than the positive values.
 *
 * The recommended minimum size of the input string is 32 characters, but
 * 21 (` ` or `-` for sign, 19 digits, null terminator) should be sufficiently
 * large for both positive and negative values.
 * If the given string is not large enough, the result will be truncated.
 * If you need a string with variable width, using `snprintf()` directly is
 * recommended.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No [1]
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] if `snprintf()` does not allocate additional memory internally</i>
 *
 * \param[in] time_point the time to be made into a string
 * \param[out] str the output string in which it is stored
 * \param[in] str_size the size of the output string
 * \return `RCUTILS_RET_OK` if successful (even if truncated), or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCUTILS_RET_ERROR` if an unspecified error occur.
 */
        int rcutils_time_point_value_as_nanoseconds_string(const(c_long)*, char*, c_ulong) @nogc nothrow;
        /// Return a time point as floating point seconds in a string.
        /**
 * The number is always fixed width, with left padding zeros up to the maximum
 * number of digits for the mantissa that the time point can represent and a
 * characteristic (fractional-part) with a fixed width of 9 digits.
 * Right now that means the mantissa is always 10 digits to add up to 19 total
 * for the signed 64-bit time point type.
 * Negative values will have a leading `-`, so they will be one character
 * longer then positive values.
 *
 * The recommended minimum size of the input string is 32 characters, but
 * 22 (` ` or `-` for sign, 19 digits, decimal point, null terminator) should
 * be sufficient for now.
 * If the given string is not large enough, the result will be truncated.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No [1]
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 * <i>[1] if `snprintf()` does not allocate additional memory internally</i>
 *
 * \param[in] time_point the time to be made into a string
 * \param[out] str the output string in which it is stored
 * \param[in] str_size the size of the output string
 * \return `RCUTILS_RET_OK` if successful (even if truncated), or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RCUTILS_RET_ERROR` if an unspecified error occur.
 */
        int rcutils_time_point_value_as_seconds_string(const(c_long)*, char*, c_ulong) @nogc nothrow;

        alias uint16_t = ushort;

        alias uint8_t = ubyte;
        struct rcutils_array_list_impl_t;

        struct rcutils_array_list_t
        {

            rcutils_array_list_impl_t* impl;
        }
        /// Return an empty array_list struct.
        /**
 * This function returns an empty and zero initialized array_list struct.
 * Calling rcutils_array_list_fini() on any non-initialized instance leads
 * to undefined behavior.
 * Every instance of array_list_t has to either be zero_initialized with this
 * function or manually allocated.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * Example:
 *
 * ```c
 * rcutils_array_list_t foo;
 * rcutils_array_list_fini(&foo); // undefined behavior!
 *
 * rcutils_array_list_t bar = rcutils_get_zero_initialized_array_list();
 * rcutils_array_list_fini(&bar); // ok
 * ```
 */
        rcutils_array_list_t rcutils_get_zero_initialized_array_list() @nogc nothrow;
        /// Initialize an array list with a given initial capacity.
        /**
 * This function will initialize a given, zero initialized, array_list to
 * a given size.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * Example:
 *
 * ```c
 * rcutils_allocator_t allocator = rcutils_get_default_allocator();
 * rcutils_array_list_t array_list = rcutils_get_zero_initialized_array_list();
 * rcutils_ret_t ret = rcutils_array_list_init(&array_list, 2, sizeof(int), &allocator);
 * if (ret != RCUTILS_RET_OK) {
 *   // ... error handling
 * }
 * int data = 42;
 * int out_data = 0;
 * ret = rcutils_array_list_add(&array_list, &data);
 * data++;
 * ret = rcutils_array_list_get(&array_list, 0, &out_data);
 * assert(42 == out_data);
 * ret = rcutils_array_list_fini(&array_list);
 * ```
 *
 * \param[inout] array_list object to be initialized
 * \param[in] initial_capacity the initial capacity to allocate in the list
 * \param[in] data_size the size (in bytes) of the data object being stored in the list
 * \param[in] allocator to be used to allocate and deallocate memory
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_array_list_init(rcutils_array_list_t*, c_ulong, c_ulong,
                const(rcutils_allocator_t)*) @nogc nothrow;
        /// Finalize an array list, reclaiming all resources.
        /**
 * This function reclaims any memory owned by the array list.
 *
 * The allocator used to initialize the array list is used to deallocate each
 * entry in the list and the list itself.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] array_list object to be finalized
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_array_list_fini(rcutils_array_list_t*) @nogc nothrow;
        /// Adds an entry to the list
        /**
 * This function adds the provided data to the end of the list. A shallow copy of
 * the provided data is made to store in the list instead of just storing
 * the pointer to the provided data.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] array_list to add the data to
 * \param[in] data a pointer to the data to add to the list
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_array_list_add(rcutils_array_list_t*, const(void)*) @nogc nothrow;
        /// Sets an entry in the list to the provided data
        /**
 * This function sets the provided data at the specified index in the list.
 * A shallow copy of the provided data is made to store in the list instead
 * of just storing the pointer to the provided data.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] array_list to add the data to
 * \param[in] index the position in the list to set the data
 * \param[in] data a pointer to the data that will be set in the list
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if index out of bounds, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_array_list_set(rcutils_array_list_t*, c_ulong, const(void)*) @nogc nothrow;
        /// Removes an entry in the list at the provided index
        /**
 * This function removes data from the list at the specified index. The capacity
 * of the list will never decrease when entries are removed.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] array_list to add the data to
 * \param[in] index the index of the item to remove from the list
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if index out of bounds, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_array_list_remove(rcutils_array_list_t*, c_ulong) @nogc nothrow;
        /// Retrieves an entry in the list at the provided index
        /**
 * This function retrieves a copy of the data stored in the list at the provided index.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 *
 * \param[in] array_list to add the data to
 * \param[in] index the index at which to get the data
 * \param[out] data a copy of the data stored in the list
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_array_list_get(const(rcutils_array_list_t)*, c_ulong, void*) @nogc nothrow;
        /// Retrieves the size of the provided array_list
        /**
 * This function retrieves the number of items in the provided array list
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 *
 * \param[in] array_list list to get the size of
 * \param[out] size The number of items currently stored in the list
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_array_list_get_size(const(rcutils_array_list_t)*, c_ulong*) @nogc nothrow;

        alias int64_t = c_long;

        struct rcutils_char_array_t
        {

            char* buffer;
            /**
   * if this is true, we may safely free/realloc the buffer as needed;
   * otherwise we will leave the buffer alone and alloc new memory if
   * more space is needed
   */
            bool owns_buffer;

            c_ulong buffer_length;

            c_ulong buffer_capacity;

            rcutils_allocator_t allocator;
        }
        /// Return a zero initialized char array struct.
        /**
 * \return rcutils_char_array_t a zero initialized char array struct
 */
        rcutils_char_array_t rcutils_get_zero_initialized_char_array() @nogc nothrow;
        /// Initialize a zero initialized char array struct.
        /**
 * This function may leak if the char array struct is already
 * pre-initialized.
 * If the capacity is set to 0, no memory is allocated and the internal buffer
 * is still NULL.
 *
 * \param[in] char_array a pointer to the to be initialized char array struct
 * \param[in] buffer_capacity the size of the memory to allocate for the byte stream
 * \param[in] allocator the allocator to use for the memory allocation
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENTS` if any arguments are invalid, or
 * \return 'RCUTILS_RET_BAD_ALLOC` if no memory could be allocated correctly
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_init(rcutils_char_array_t*, c_ulong, const(rcutils_allocator_t)*) @nogc nothrow;
        /// Finalize a char array struct.
        /**
 * Cleans up and deallocates any resources owned by rcutils_char_array_t.
 * The array passed to this function needs to have been initialized by
 * rcutils_char_array_init().
 * If .owns_buffer is false, this function has no effect because that
 * implies that the char_array does not own the internal buffer.
 * Passing an uninitialized instance to this function leads to undefined
 * behavior.
 *
 * \param[in] char_array pointer to the rcutils_char_array_t to be cleaned up
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENTS` if the char_array argument is invalid
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_fini(rcutils_char_array_t*) @nogc nothrow;
        /// Resize the internal buffer of the char array.
        /**
 * The internal buffer of the char array can be resized dynamically if needed.
 * If the new size is smaller than the current capacity, then the memory is
 * truncated.
 * Be aware, that this will deallocate the memory and therefore invalidates any
 * pointers to this storage.
 * If the new size is larger, new memory is getting allocated and the existing
 * content is copied over.
 * Note that if the array doesn't own the current buffer the function just
 * allocates a new block of memory and copies the contents of the old buffer
 * instead of resizing the existing buffer.
 *
 * \param[in] char_array pointer to the instance of rcutils_char_array_t which is being resized
 * \param[in] new_size the new size of the internal buffer
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if new_size is set to zero
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_resize(rcutils_char_array_t*, c_ulong) @nogc nothrow;
        /// Expand the internal buffer of the char array.
        /**
 * This function is equivalent to `rcutils_char_array_resize` except that it resizes
 * the internal buffer only when it is not big enough.
 * If the buffer is already big enough for `new_size`, it returns `RCUTILS_RET_OK` without
 * doing anything.
 *
 * \param[inout] char_array pointer to the instance of rcutils_char_array_t which is being resized
 * \param[in] new_size the new size of the internal buffer
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_expand_as_needed(rcutils_char_array_t*, c_ulong) @nogc nothrow;
        /// Produce output according to format and args.
        /**
 * This function is equivalent to `vsprintf(char_array->buffer, format, args)`
 * except that the buffer grows as needed so a user doesn't have to deal with
 * memory management.
 * The `va_list args` will be cloned before being used, so a user can safely
 * use it again after calling this function.
 *
 * \param[inout] char_array pointer to the instance of rcutils_char_array_t which is being
 * written to
 * \param[in] format the format string used by the underlying `vsnprintf`
 * \param[in] args the `va_list` used by the underlying `vsnprintf`
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_vsprintf(rcutils_char_array_t*, const(char)*, va_list*) @nogc nothrow;
        /// Append a string (or part of it) to the string in buffer.
        /**
 * This function treats the internal buffer as a string and appends the src string to it.
 * If src is longer than n, n bytes will be used and an extra null byte will be appended.
 * It is virtually equivalent to `strncat(char_array->buffer, src, n)` except that the buffer
 * grows as needed so a user doesn't have to deal with memory management.
 *
 * \param[inout] char_array pointer to the instance of rcutils_char_array_t which is being appended to
 * \param[in] src the string to be appended to the end of the string in buffer
 * \param[in] n it uses at most n bytes from the src string
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_strncat(rcutils_char_array_t*, const(char)*, c_ulong) @nogc nothrow;
        /// Append a string to the string in buffer.
        /**
 * This function treats the internal buffer as a string and appends the src string to it.
 * It is virtually equivalent to `strcat(char_array->buffer, src)` except that the buffer
 * grows as needed. That is to say, a user can safely use it without doing calculation or
 * checks on the sizes of the src and buffer.
 *
 * \param[inout] char_array pointer to the instance of rcutils_char_array_t which is being
 * appended to
 * \param[in] src the string to be appended to the end of the string in buffer
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_strcat(rcutils_char_array_t*, const(char)*) @nogc nothrow;
        /// Copy memory to buffer.
        /**
 * This function is equivalent to `memcpy(char_array->buffer, src, n)` except that the buffer
 * grows as needed so a user doesn't have to worry about overflow.
 *
 * \param[inout] char_array pointer to the instance of rcutils_char_array_t which is being resized
 * \param[in] src the memory to be copied from
 * \param[in] n a total of n bytes will be copied
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_memcpy(rcutils_char_array_t*, const(char)*, c_ulong) @nogc nothrow;
        /// Copy a string to buffer.
        /**
 * This function is equivalent to `strcpy(char_array->buffer, src)` except that the buffer
 * grows as needed so that `src` will fit without overflow.
 *
 * \param[inout] char_array pointer to the instance of rcutils_char_array_t which is being
 * copied to
 * \param[in] src the string to be copied from
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_char_array_strcpy(rcutils_char_array_t*, const(char)*) @nogc nothrow;

        alias int32_t = int;
        struct rcutils_hash_map_impl_t;

        struct rcutils_hash_map_t
        {

            rcutils_hash_map_impl_t* impl;
        }

        alias rcutils_hash_map_key_hasher_t = c_ulong function(const(void)*);
        alias rcutils_hash_map_key_cmp_t = int function(const(void)*, const(void)*);

        alias int16_t = short;
        /// A hashing function for a null terminated c string.
        /**
 * A hashing function for a null terminated c string.
 * Should be used when your key is just a pointer to a c-string
 */
        c_ulong rcutils_hash_map_string_hash_func(const(void)*) @nogc nothrow;
        /// A comparison function for a null terminated c string.
        /**
 * A comparison function for a null terminated c string.
 * Should be used when your key is just a pointer to a c-string
 */
        int rcutils_hash_map_string_cmp_func(const(void)*, const(void)*) @nogc nothrow;

        rcutils_hash_map_t rcutils_get_zero_initialized_hash_map() @nogc nothrow;
        /// Initialize a rcutils_hash_map_t, allocating space for given capacity.
        /**
 * This function initializes the rcutils_hash_map_t with a given initial
 * capacity for entries.
 * Note this does not allocate space for keys or values in the hash_map, just the
 * arrays of pointers to the keys and values.
 * rcutils_hash_map_set() should still be used when assigning values.
 *
 * The hash_map argument should point to allocated memory and should have
 * been zero initialized with rcutils_get_zero_initialized_hash_map().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * Example:
 * ```c
 * rcutils_hash_map_t hash_map = rcutils_get_zero_initialized_hash_map();
 * rcutils_ret_t ret =
 *   rcutils_hash_map_init(&hash_map, 10, rcutils_get_default_allocator());
 * if (ret != RCUTILS_RET_OK) {
 *   // ... do error handling
 * }
 * // ... use the hash_map and when done:
 * ret = rcutils_hash_map_fini(&hash_map);
 * if (ret != RCUTILS_RET_OK) {
 *   // ... do error handling
 * }
 * ```
 *
 * \param[inout] hash_map rcutils_hash_map_t to be initialized
 * \param[in] initial_capacity the amount of initial capacity for the hash_map
 * \param[in] key_size the size (in bytes) of the key used to index the data
 * \param[in] data_size the size (in bytes) of the data being stored
 * \param[in] key_hashing_func a function that returns a hashed value for a key
 * \param[in] key_cmp_func a function used to compare keys
 * \param[in] allocator the allocator to use through out the lifetime of the hash_map
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_STRING_MAP_ALREADY_INIT` if already initialized, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_hash_map_init(rcutils_hash_map_t*, c_ulong, c_ulong, c_ulong,
                c_ulong function(const(void)*), int function(const(void)*,
                    const(void)*), const(rcutils_allocator_t)*) @nogc nothrow;
        /// Finalize the previously initialized hash_map struct.
        /**
 * This function will free any resources which were created when initializing
 * or when calling rcutils_hash_map_set().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] hash_map rcutils_hash_map_t to be finalized
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_hash_map_fini(rcutils_hash_map_t*) @nogc nothrow;
        /// Get the current capacity of the hash_map.
        /**
 * This function will return the internal capacity of the hash_map, which is the
 * number of buckets the hash_map uses to sort the keys.
 * The capacity does not indicate how many key value pairs are stored in the
 * hash_map, the rcutils_hash_map_get_size() function can provide that, nor the
 * maximum number that can be stored without increasing the capacity.
 * The capacity can be set initially with rcutils_hash_map_init().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] hash_map rcutils_hash_map_t to be queried
 * \param[out] capacity capacity of the hash_map
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_NOT_INITIALIZED` if the hash_map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_hash_map_get_capacity(const(rcutils_hash_map_t)*, c_ulong*) @nogc nothrow;
        /// Get the current size of the hash_map.
        /**
 * This function will return the internal size of the hash_map, which is the
 * current number of key value pairs in the hash_map.
 * The size is changed when calling rcutils_hash_map_set() or rcutils_hash_map_unset().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] hash_map rcutils_hash_map_t to be queried
 * \param[out] size size of the hash_map
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_NOT_INITIALIZED` if the hash_map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_hash_map_get_size(const(rcutils_hash_map_t)*, c_ulong*) @nogc nothrow;
        /// Set a key value pair in the hash_map, increasing capacity if necessary.
        /**
 * If the key already exists in the map then the value is updated to the new value
 * provided. If it does not already exist then a new entry is added for the new key
 * and value. The capacity will be increased if needed.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] hash_map rcutils_hash_map_t to be updated
 * \param[in] key hash_map key
 * \param[in] value value for given hash_map key
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_NOT_INITIALIZED` if the hash_map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_hash_map_set(rcutils_hash_map_t*, const(void)*, const(void)*) @nogc nothrow;
        /// Unset a key value pair in the hash_map.
        /**
 * Unsets the key value pair in the hash_map and frees any internal resources allocated
 * for the entry. This function will never decrease the capacity when removing keys.
 * If the given key is not found, RCUTILS_RET_STRING_KEY_NOT_FOUND is returned.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[inout] hash_map rcutils_hash_map_t to be updated
 * \param[in] key hash_map key, must be null terminated c string
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_NOT_INITIALIZED` if the hash_map is invalid, or
 * \return `RCUTILS_RET_STRING_KEY_NOT_FOUND` if the key is not found in the map, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_hash_map_unset(rcutils_hash_map_t*, const(void)*) @nogc nothrow;
        /// Get whether or not a key exists.
        /**
 * Returns true if the provided key exists in the hash_map or false if it does not or
 * if the hash_map or key are invalid.
 * In all cases no error message is set.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] hash_map rcutils_hash_map_t to be searched
 * \param[in] key hash_map key, must be null terminated c string
 * \return `true` if key is in the hash_map, or
 * \return `false` if key is not in the hash_map, or
 * \return `false` for invalid arguments, or
 * \return `false` if the hash_map is invalid
 */
        bool rcutils_hash_map_key_exists(const(rcutils_hash_map_t)*, const(void)*) @nogc nothrow;
        /// Get value given a key.
        /**
 * This function can be used to retrieve a shallow copy of the stored data. The data
 * pointer must point to a section of memory large enough to copy the full size of
 * the data being stored, which is specified when the hash_map in initialized.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] hash_map rcutils_hash_map_t to be searched
 * \param[in] key hash_map key to look up the data for
 * \param[out] data A copy of the data stored in the map
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_NOT_INITIALIZED` if the hash_map is invalid, or
 * \return `RCUTILS_RET_NOT_FOUND` if the key doesn't exist in the map, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_hash_map_get(const(rcutils_hash_map_t)*, const(void)*, void*) @nogc nothrow;
        /// Get the next key in the hash_map, unless NULL is given, then get the first key.
        /**
 * This function allows you to iteratively get each key/value pair in the hash_map.
 *
 * If NULL is given for the previous_key, then the first key in the hash_map is returned.
 * If that returned key is given as the previous_key for the next call to this function,
 * then the next key in the hash_map is returned.
 * If there are no more keys in the hash_map or if the given key is not in the hash_map,
 * an error will be returned.
 *
 * The order of the keys in the hash_map is arbitrary and if the hash_map is modified
 * between calls to this function the behavior is undefined.
 * If the hash_map is modified then iteration should begin again by passing NULL to
 * get the first key again.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * Example:
 * ```c
 * printf("entries in the hash_map:\n");
 * int key = 0, data = 0;
 * rcutils_ret_t status = rcutils_hash_map_get_next_key(&hash_map, NULL, &key, &data);
 * while (RCUTILS_RET_OK == status) {
 *   printf("%i: %i\n", key, data);
 *   status = rcutils_hash_map_get_next_key(&hash_map, &key, &key, &data);
 * }
 * ```
 *
 * \param[in] hash_map rcutils_hash_map_t to be queried
 * \param[in] previous_key NULL to get the first key or the previous key to get the next for
 * \param[out] key A copy of the next key in the sequence
 * \param[out] data A copy of the next data in the sequence
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_NOT_INITIALIZED` if the hash_map is invalid, or
 * \return `RCUTILS_RET_NOT_FOUND` if the previous_key doesn't exist in the map, or
 * \return `RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES` if there is no more data beyound the previous_key, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_hash_map_get_next_key_and_data(const(rcutils_hash_map_t)*,
                const(void)*, void*, void*) @nogc nothrow;

        alias int8_t = byte;

        alias rcutils_ret_t = int;

        union pthread_barrierattr_t
        {

            char[4] __size;

            int __align;
        }

        union pthread_barrier_t
        {

            char[32] __size;

            c_long __align;
        }

        alias pthread_spinlock_t = int;

        struct rcutils_string_array_t
        {

            c_ulong size;

            char** data;

            rcutils_allocator_t allocator;
        }
        /// Return an empty string array struct.
        /**
 * This function returns an empty and zero initialized string array struct.
 * Calling rcutils_string_array_fini() on any non-initialized instance leads
 * to undefined behavior.
 * Every instance of string_array_t has to either be zero_initialized with this
 * function or manually allocated.
 *
 * Example:
 *
 * ```c
 * rcutils_string_array_t foo;
 * rcutils_string_array_fini(&foo); // undefined behavior!
 *
 * rcutils_string_array_t bar = rcutils_get_zero_initialized_string_array();
 * rcutils_string_array_fini(&bar); // ok
 * ```
 */
        rcutils_string_array_t rcutils_get_zero_initialized_string_array() @nogc nothrow;
        /// Initialize a string array with a given size.
        /**
 * This function will initialize a given, zero initialized, string array to
 * a given size.
 *
 * Note that putting a string into the array gives owenship to the array.
 *
 * Example:
 *
 * ```c
 * rcutils_allocator_t allocator = rcutils_get_default_allocator();
 * rcutils_string_array_t string_array = rcutils_get_zero_initialized_string_array();
 * rcutils_ret_t ret = rcutils_string_array_init(&string_array, 2, &allocator);
 * if (ret != RCUTILS_RET_OK) {
 *   // ... error handling
 * }
 * string_array.data[0] = rcutils_strdup("Hello", &allocator);
 * string_array.data[1] = rcutils_strdup("World", &allocator);
 * ret = rcutils_string_array_fini(&string_array);
 *
 * \param[inout] string_array object to be initialized
 * \param[in] size the size the array should be
 * \param[in] allocator to be used to allocate and deallocate memory
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 * ```
 */
        int rcutils_string_array_init(rcutils_string_array_t*, c_ulong,
                const(rcutils_allocator_t)*) @nogc nothrow;
        /// Finalize a string array, reclaiming all resources.
        /**
 * This function reclaims any memory owned by the string array, including the
 * strings it references.
 *
 * The allocator used to initialize the string array is used to deallocate each
 * string in the array and the array of strings itself.
 *
 * \param[inout] string_array object to be finalized
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_array_fini(rcutils_string_array_t*) @nogc nothrow;
        /// Compare two string arrays.
        /**
 * The two string arrays are compared according to lexicographical order.
 *
 * \param[in] lhs The first string array.
 * \param[in] rhs The second string array.
 * \param[out] res Negative value if `lhs` appears before `rhs` in lexicographical order.
 *   Zero if `lhs` and `rhs` are equal.
 *   Positive value if `lhs` appears after `rhs in lexographical order.
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if any argument is `NULL`, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if `lhs->data` or `rhs->data` is `NULL`, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs.
 */
        int rcutils_string_array_cmp(const(rcutils_string_array_t)*,
                const(rcutils_string_array_t)*, int*) @nogc nothrow;
        /// Resize a string array, reclaiming removed resources.
        /**
 * This function changes the size of an existing string array.
 * If the new size is larger, new entries are added to the end of the array and
 * are zero- initialized.
 * If the new size is smaller, entries are removed from the end of the array
 * and their resources reclaimed.
 *
 * \par Note:
 * Resizing to 0 is not a substitute for calling ::rcutils_string_array_fini.
 *
 * \par Note:
 * If this function fails, \p string_array remains unchanged and should still
 * be reclaimed with ::rcutils_string_array_fini.
 *
 * \param[inout] string_array object to be resized.
 * \param[in] new_size the size the array should be changed to.
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs.
 */
        int rcutils_string_array_resize(rcutils_string_array_t*, c_ulong) @nogc nothrow;
        /// Lexicographic comparer for pointers to string pointers.
        /**
 * This functions compares pointers to string pointers lexicographically
 * ascending.
 *
 * \param[in] lhs pointer to the first string pointer.
 * \param[in] rhs pointer to the second string pointer.
 * \return <0 if lhs is lexicographically lower, or
 * \return 0 if the strings are the same, or
 * \return >0 if lhs is lexicographically higher.
 */
        int rcutils_string_array_sort_compare(const(void)*, const(void)*) @nogc nothrow;
        /// Sort a string array according to lexicographical order.
        /**
 * This function changes the order of the entries in a string array so that
 * they are in lexicographically ascending order.
 * Empty entries are placed at the end of the array.
 *
 * \param[inout] string_array object whose elements should be sorted.
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs.
 */
        int rcutils_string_array_sort(rcutils_string_array_t*) @nogc nothrow;
        struct rcutils_string_map_impl_t;

        struct rcutils_string_map_t
        {

            rcutils_string_map_impl_t* impl;
        }

        rcutils_string_map_t rcutils_get_zero_initialized_string_map() @nogc nothrow;
        /// Initialize a rcutils_string_map_t, allocating space for given capacity.
        /**
 * This function initializes the rcutils_string_map_t with a given initial
 * capacity for entries.
 * Note this does not allocate space for keys or values in the map, just the
 * arrays of pointers to the keys and values.
 * rcutils_string_map_set() should still be used when assigning values.
 *
 * The string_map argument should point to allocated memory and should have
 * been zero initialized with rcutils_get_zero_initialized_string_map().
 * For example:
 *
 * ```c
 * rcutils_string_map_t string_map = rcutils_get_zero_initialized_string_map();
 * rcutils_ret_t ret =
 *   rcutils_string_map_init(&string_map, 10, rcutils_get_default_allocator());
 * if (ret != RCUTILS_RET_OK) {
 *   // ... do error handling
 * }
 * // ... use the string map and when done:
 * ret = rcutils_string_map_fini(&string_map);
 * if (ret != RCUTILS_RET_OK) {
 *   // ... do error handling
 * }
 * ```
 *
 * \param[inout] string_map rcutils_string_map_t to be initialized
 * \param[in] initial_capacity the amount of initial capacity for the string map
 * \param[in] allocator the allocator to use through out the lifetime of the map
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_STRING_MAP_ALREADY_INIT` if already initialized, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_init(rcutils_string_map_t*, c_ulong, rcutils_allocator_t) @nogc nothrow;
        /// Finalize the previously initialized string map struct.
        /**
 * This function will free any resources which were created when initializing
 * or when calling rcutils_string_map_set().
 *
 * \param[inout] string_map rcutils_string_map_t to be finalized
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_fini(rcutils_string_map_t*) @nogc nothrow;
        /// Get the current capacity of the string map.
        /**
 * This function will return the internal capacity of the map, which is the
 * maximum number of key value pairs the map could hold.
 * The capacity can be set initially with rcutils_string_map_init() or
 * with rcutils_string_map_reserve().
 * The capacity does not indicate how many key value paris are stored in the
 * map, the rcutils_string_map_get_size() function can provide that.
 *
 * \param[in] string_map rcutils_string_map_t to be queried
 * \param[out] capacity capacity of the string map
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_STRING_MAP_INVALID` if the string map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_get_capacity(const(rcutils_string_map_t)*, c_ulong*) @nogc nothrow;
        /// Get the current size of the string map.
        /**
 * This function will return the internal size of the map, which is the
 * current number of key value pairs in the map.
 * The size is changed when calling rcutils_string_map_set_no_resize(),
 * rcutils_string_map_set(), or rcutils_string_map_unset().
 *
 * \param[in] string_map rcutils_string_map_t to be queried
 * \param[out] size size of the string map
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_STRING_MAP_INVALID` if the string map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_get_size(const(rcutils_string_map_t)*, c_ulong*) @nogc nothrow;
        /// Reserve a given amount of capacity in the map.
        /**
 * Increases the capacity of the map to at least the given size.
 *
 * If the current capacity is less than requested capacity then the capacity
 * is increased using the allocator given during initialization of the map in
 * rcutils_string_map_init().
 * If the requested capacity is less than the current capacity, the capacity
 * may be reduced, but no existing key value pairs will be truncated to do so.
 * In effect, the capacity will be shrunk to fit the number of items in map or
 * the requested capacity, which ever is larger.
 *
 * If recovering all resources is desired first call rcutils_string_map_clear()
 * and then this function with a capacity of 0.
 *
 * \param[inout] string_map rcutils_string_map_t to have space reserved in
 * \param[in] capacity requested size to reserve in the map
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_STRING_MAP_INVALID` if the string map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_reserve(rcutils_string_map_t*, c_ulong) @nogc nothrow;
        /// Remove all key value pairs from the map.
        /**
 * This function will remove all key value pairs from the map, and it will
 * reclaim all resources allocated as a result of setting key value pairs.
 * rcutils_string_map_fini() should still be called after this.
 *
 * \param[inout] string_map rcutils_string_map_t to be cleared
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_STRING_MAP_INVALID` if the string map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_clear(rcutils_string_map_t*) @nogc nothrow;
        /// Set a key value pair in the map, increasing capacity if necessary.
        /**
 * The capacity will be increased if needed using rcutils_string_map_reserve().
 * Otherwise it is the same as rcutils_string_map_set_no_resize().
 *
 * \see rcutils_string_map_set_no_resize()
 *
 * \param[inout] string_map rcutils_string_map_t to be updated
 * \param[in] key map key, must be null terminated c string
 * \param[in] value value for given map key, must be null terminated c string
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_STRING_MAP_INVALID` if the string map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_set(rcutils_string_map_t*, const(char)*, const(char)*) @nogc nothrow;
        /// Set a key value pair in the map but only if the map has enough capacity.
        /**
 * If the map already contains the given key, the existing value will be
 * replaced with the given value.
 * If the map does not contain the given key, and the map has additional
 * unused capacity, then it will store the given key and value in the map.
 * If there is no unused capacity in the map, then RCUTILS_RET_NOT_ENOUGH_SPACE
 * is returned.
 *
 * The given key and value c strings are copied into the map, and so storage is
 * allocated for them in the map when this function is called if necessary.
 * The storage allocated for this purpose is reclaimed either when
 * rcutils_string_map_fini() is called on this map or when using this function
 * or rcutils_string_map_unset().
 *
 * Any allocation that occurs in this functions uses the allocator of the map,
 * which is given when the map is initialized in rcutils_string_map_init().
 *
 * \param[inout] string_map rcutils_string_map_t to be updated
 * \param[in] key map key, must be null terminated c string
 * \param[in] value value for given map key, must be null terminated c string
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_STRING_MAP_INVALID` if the string map is invalid, or
 * \return `RCUTILS_RET_NOT_ENOUGH_SPACE` if map is full, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_set_no_resize(rcutils_string_map_t*, const(char)*, const(char)*) @nogc nothrow;
        /// Unset a key value pair in the map.
        /**
 * The key needs to be a null terminated c string.
 * If the given key is not found, RCUTILS_RET_STRING_KEY_NOT_FOUND is returned.
 *
 * \param[inout] string_map rcutils_string_map_t to be updated
 * \param[in] key map key, must be null terminated c string
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_STRING_MAP_INVALID` if the string map is invalid, or
 * \return `RCUTILS_RET_STRING_KEY_NOT_FOUND` if key not found, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_unset(rcutils_string_map_t*, const(char)*) @nogc nothrow;
        /// Get whether or not a key exists.
        /**
 * The key needs to be a null terminated c string.
 *
 * This function can fail and return false if the key is not found,
 * or the string_map is NULL or invalid, or if the key is NULL.
 * In all cases no error message is set.
 *
 * \param[in] string_map rcutils_string_map_t to be searched
 * \param[in] key map key, must be null terminated c string
 * \return `true` if key is in the map, or
 * \return `false` if key is not in the map, or
 * \return `false` for invalid arguments, or
 * \return `false` if the string map is invalid
 */
        bool rcutils_string_map_key_exists(const(rcutils_string_map_t)*, const(char)*) @nogc nothrow;
        /// Get whether or not a key of known length exists.
        /**
 * Identical to rcutils_string_map_key_exists() but without relying on key to be
 * a null terminated c string.
 *
 * \param[in] string_map rcutils_string_map_t to be searched
 * \param[in] key map key
 * \param[in] key_length map key length
 * \return `true` if key is in the map, or
 * \return `false` if key is not in the map, or
 * \return `false` for invalid arguments, or
 * \return `false` if the string map is invalid
 */
        bool rcutils_string_map_key_existsn(const(rcutils_string_map_t)*, const(char)*, c_ulong) @nogc nothrow;
        /// Get value given a key.
        /**
 * The key needs to be a null terminated c string.
 *
 * This function can fail, and therefore return NULL, if the key is not found,
 * or the string_map is NULL or invalid, or if the key is NULL.
 * In all cases no error message is set.
 *
 * The returned value string is still owned by the map, and it should not be
 * modified or free'd.
 * This also means that the value pointer becomes invalid if either
 * rcutils_string_map_clear() or rcutils_string_map_fini() are called or if
 * the key value pair is updated or removed with one of rcutils_string_map_set()
 * or rcutils_string_map_set_no_resize() or rcutils_string_map_unset().
 *
 * \param[in] string_map rcutils_string_map_t to be searched
 * \param[in] key map key, must be null terminated c string
 * \return value for the given key if successful, or
 * \return `NULL` for invalid arguments, or
 * \return `NULL` if the string map is invalid, or
 * \return `NULL` if key not found, or
 * \return `NULL` if an unknown error occurs
 */
        const(char)* rcutils_string_map_get(const(rcutils_string_map_t)*, const(char)*) @nogc nothrow;
        /// Get value given a key and key length.
        /**
 * Identical to rcutils_string_map_get() but without relying on key to be a
 * null terminated c string.
 *
 * \param[in] string_map rcutils_string_map_t to be searched
 * \param[in] key map key
 * \param[in] key_length map key length
 * \return value for the given key if successful, or
 * \return `NULL` for invalid arguments, or
 * \return `NULL` if the string map is invalid, or
 * \return `NULL` if key not found, or
 * \return `NULL` if an unknown error occurs
 */
        const(char)* rcutils_string_map_getn(const(rcutils_string_map_t)*, const(char)*, c_ulong) @nogc nothrow;
        /// Get the next key in the map, unless NULL is given, then get the first key.
        /**
 * This function allows you iteratively get each key in the map.
 *
 * If NULL is given for the key, then the first key in the map is returned.
 * If that returned key if given to the this function, then the next key in the
 * map is returned.
 * If there are no more keys in the map or if the given key is not in the map,
 * NULL is returned.
 *
 * The order of the keys in the map is arbitrary and if the map is modified
 * between calls to this function the behavior is undefined.
 * If the map is modifeid then iteration should begin again by passing NULL to
 * get the first key again.
 *
 * This function operates based on the address of the pointer, you cannot pass
 * a copy of a key to get the next key.
 *
 * Example:
 *
 * ```c
 * printf("keys in the map:\n");
 * const char * current_key = rcutils_string_map_get_next_key(&map, NULL);
 * while (current_key) {
 *   printf("  - %s\n", current_key);
 *   current_key = rcutils_string_map_get_next_key(&map, current_key);
 * }
 * ```
 *
 * NULL can also be returned if NULL is given for the string_map or if the
 * string_map is invalid.
 *
 * \param[in] string_map rcutils_string_map_t to be queried
 * \param[in] key NULL to get the first key or the previous key to get the next
 * \return value for the given key if successful, or
 * \return `NULL` for invalid arguments, or
 * \return `NULL` if the string map is invalid, or
 * \return `NULL` if key not found, or
 * \return `NULL` if there are no more keys in the map, or
 * \return `NULL` if an unknown error occurs
 */
        const(char)* rcutils_string_map_get_next_key(const(rcutils_string_map_t)*, const(char)*) @nogc nothrow;
        /// Copy all the key value pairs from one map into another, overwritting and resizing if needed.
        /**
 * If the destination string map does not have enough storage, then it is will
 * be resized.
 * If a key value pair exists in the destination map, its value will be
 * replaced with the source map's value.
 *
 * It is possible for only some of the values to be copied if an error happens
 * during the copying process, e.g. if memory allocation fails.
 *
 * \param[in] src_string_map rcutils_string_map_t to be copied from
 * \param[inout] dst_string_map rcutils_string_map_t to be copied to
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RCUTILS_RET_STRING_MAP_INVALID` if the string map is invalid, or
 * \return `RCUTILS_RET_ERROR` if an unknown error occurs
 */
        int rcutils_string_map_copy(const(rcutils_string_map_t)*, rcutils_string_map_t*) @nogc nothrow;

        union pthread_rwlockattr_t
        {

            char[8] __size;

            c_long __align;
        }

        struct rcutils_uint8_array_t
        {

            ubyte* buffer;

            c_ulong buffer_length;

            c_ulong buffer_capacity;

            rcutils_allocator_t allocator;
        }
        /// Return a zero initialized uint8 array struct.
        /**
 * \return rcutils_uint8_array_t a zero initialized uint8 array struct
 */
        rcutils_uint8_array_t rcutils_get_zero_initialized_uint8_array() @nogc nothrow;
        /// Initialize a zero initialized uint8 array struct.
        /**
 * This function may leak if the uint8 array struct is already initialized.
 * If the capacity is set to 0, no memory is allocated and the internal buffer
 * is still NULL.
 *
 * \param[inout] uint8_array a pointer to the to be initialized uint8 array struct
 * \param[in] buffer_capacity the size of the memory to allocate for the byte stream
 * \param[in] allocator the allocator to use for the memory allocation
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENTS` if any arguments are invalid, or
 * \return 'RCUTILS_RET_BAD_ALLOC` if no memory could be allocated correctly
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_uint8_array_init(rcutils_uint8_array_t*, c_ulong,
                const(rcutils_allocator_t)*) @nogc nothrow;
        /// Finalize a uint8 array struct.
        /**
 * Cleans up and deallocates any resources used in a rcutils_uint8_array_t.
 * The array passed to this function needs to have been initialized by
 * rcutils_uint8_array_init().
 * Passing an uninitialized instance to this function leads to undefined
 * behavior.
 *
 * \param[in] uint8_array pointer to the rcutils_uint8_array_t to be cleaned up
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENTS` if the uint8_array argument is invalid
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_uint8_array_fini(rcutils_uint8_array_t*) @nogc nothrow;
        /// Resize the internal buffer of the uint8 array.
        /**
 * The internal buffer of the uint8 array can be resized dynamically if needed.
 * If the new size is smaller than the current capacity, then the memory is
 * truncated.
 * Be aware, that this might deallocate the memory and therefore invalidates any
 * pointers to this storage.
 *
 * \param[inout] uint8_array pointer to the instance of rcutils_uint8_array_t which is
 * being resized
 * \param[in] new_size the new size of the internal buffer
 * \return `RCUTILS_RET_OK` if successful, or
 * \return `RCUTILS_RET_INVALID_ARGUMENT` if new_size is set to zero
 * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RCUTILS_RET_ERROR` if an unexpected error occurs
 */
        int rcutils_uint8_array_resize(rcutils_uint8_array_t*, c_ulong) @nogc nothrow;

        union pthread_rwlock_t
        {

            __pthread_rwlock_arch_t __data;

            char[56] __size;

            c_long __align;
        }

        union pthread_cond_t
        {

            __pthread_cond_s __data;

            char[48] __size;

            long __align;
        }

        union pthread_mutex_t
        {

            __pthread_mutex_s __data;

            char[40] __size;

            c_long __align;
        }

        struct rmw_context_impl_t;
        /// Initialization context structure which is used to store init specific information.
        struct rmw_context_t
        {
            /// Locally (process local) unique ID that represents this init/shutdown cycle.
            c_ulong instance_id;
            /// Implementation identifier, used to ensure two different implementations are not being mixed.
            const(char)* implementation_identifier;
            /// Options used to initialize the context.
            rmw_init_options_t options;
            /// Implementation defined context information.
            /** May be NULL if there is no implementation defined context information. */
            rmw_context_impl_t* impl;
        }
        /// Return a zero initialized context structure.
        rmw_context_t rmw_get_zero_initialized_context() @nogc nothrow;
        /// Initialize the middleware with the given options, and yielding an context.
        /**
 * Context is filled with middleware specific data upon success of this function.
 * The context is used when initializing some entities like nodes and
 * guard conditions, and is also required to properly call `rmw_shutdown()`.
 *
 * \pre The given options must have been initialized
 *   i.e. `rmw_init_options_init()` called on it and
 *   an enclave set.
 * \pre The given context must be zero initialized.
 *
 * \post If initialization fails, context will remain zero initialized.
 *
 * \remarks If options are zero-initialized, then `RMW_RET_INVALID_ARGUMENT` is returned.
 *   If options are initialized but no enclave is provided, then `RMW_RET_INVALID_ARGUMENT`
 *   is returned.
 *   If context has been already initialized (`rmw_init()` was called on it), then
 *   `RMW_RET_INVALID_ARGUMENT` is returned.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * This should be defined by the rmw implementation.
 *
 * \param[in] options initialization options to be used during initialization
 * \param[out] context resulting context struct
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the implementation
 *   identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_init(const(rmw_init_options_t)*, rmw_context_t*) @nogc nothrow;
        /// Shutdown the middleware for a given context.
        /**
 * \pre The given context must be a valid context which has been initialized with `rmw_init()`.
 *
 * \remarks If context is zero initialized, then `RMW_RET_INVALID_ARGUMENT` is returned.
 *   If context has been already invalidated (`rmw_shutdown()` was called on it), then
 *   this function is a no-op and `RMW_RET_OK` is returned.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * This should be defined by the rmw implementation.
 *
 * \param[in] context resulting context struct
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if any argument are invalid, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the implementation
 *   identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_shutdown(rmw_context_t*) @nogc nothrow;
        /// Finalize a context.
        /**
 * This function will return early if a logical error, such as `RMW_RET_INVALID_ARGUMENT`
 * or `RMW_RET_INCORRECT_RMW_IMPLEMENTATION`, ensues, leaving the given context unchanged.
 * Otherwise, it will proceed despite errors, freeing as much resources as it can and zero
 * initializing the given context.
 *
 * \pre The context to be finalized must have been previously initialized with
 *   `rmw_init()`, and then later invalidated with `rmw_shutdown()`.
 *
 * \remarks If context is zero initialized, then `RMW_RET_INVALID_ARGUMENT` is returned.
 *   If context is initialized and valid (`rmw_shutdown()` was not called on it), then
 *   `RMW_RET_INVALID_ARGUMENT` is returned.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes [1]
 * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
 *
 * This should be defined by the rmw implementation.
 *
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the implementation
 *   identifier does not match, or
 * \return `RMW_RET_ERROR` if an unspecified error occur.
 */
        int rmw_context_fini(rmw_context_t*) @nogc nothrow;
        struct rmw_init_options_impl_t;
        /// Options structure used during rmw_init().
        struct rmw_init_options_t
        {
            /// Locally (process local) unique ID that represents this init/shutdown cycle.
            /**
   * This should be set by the caller of `rmw_init()` to a number that is
   * unique within this process.
   * It is designed to be used with `rcl_init()` and `rcl_get_instance_id()`.
   */
            c_ulong instance_id;
            /// Implementation identifier, used to ensure two different implementations are not being mixed.
            const(char)* implementation_identifier;
            /// ROS domain id
            c_ulong domain_id;
            /// Security options
            rmw_security_options_t security_options;
            /// Enable localhost only
            rmw_localhost_only_t localhost_only;
            /// Enclave, name used to find security artifacts in a sros2 keystore.
            char* enclave;
            /// Allocator used during internal allocation of init options, if needed.
            rcutils_allocator_t allocator;
            /// Implementation defined init options.
            /** May be NULL if there are no implementation defined options. */
            rmw_init_options_impl_t* impl;
        }
        /// Return a zero initialized init options structure.
        rmw_init_options_t rmw_get_zero_initialized_init_options() @nogc nothrow;
        /// Initialize given init options with the default values and implementation specific values.
        /**
 * The given allocator is used, if required, during setup of the init options,
 * but is also used during initialization.
 *
 * In either case the given allocator is stored in the returned init options.
 *
 * The `impl` pointer should not be changed manually.
 *
 * \pre The given init options must be zero initialized.
 *
 * \post If initialization fails, init options will remain zero initialized.
 *
 * \remark Giving an already initialized init options will result
 *   in a failure with return code `RMW_RET_INVALID_ARGUMENT`.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * This should be defined by the rmw implementation.
 *
 * \param[inout] init_options object to be setup
 * \param[in] allocator to be used during setup and during initialization
 * \return `RMW_RET_OK` if setup is successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RMW_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_init_options_init(rmw_init_options_t*, rcutils_allocator_t) @nogc nothrow;
        /// Copy the given source init options to the destination init options.
        /**
 * The allocator from the source is used for any allocations and stored in the
 * destination.
 *
 * \pre The source init options must have been initialized
 *   i.e. had `rmw_init_options_init()` called on.
 * \pre The destination init options must be zero initialized.
 *
 * \post If copy fails, destination init options will remain zero initialized.
 *
 * \remark Giving an zero initialized init options as a source will result
 *   in a failure with return code `RMW_RET_INVALID_ARGUMENT`.
 * \remark Giving an already initialized init options for the destination will result
 *   in a failure with return code `RMW_RET_INVALID_ARGUMENT`.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * This should be defined by the rmw implementation.
 *
 * \param[in] src rcl_init_options_t object to be copied from
 * \param[out] dst rcl_init_options_t object to be copied into
 * \return `RMW_RET_OK` if the copy is successful, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the implementation
 *   identifier for src does not match the implementation of this function, or
 * \return `RMW_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RMW_RET_BAD_ALLOC` if allocating memory failed, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_init_options_copy(const(rmw_init_options_t)*, rmw_init_options_t*) @nogc nothrow;
        /// Finalize the given init options.
        /**
 * This function will return early if a logical error, such as `RMW_RET_INVALID_ARGUMENT`
 * or `RMW_RET_INCORRECT_RMW_IMPLEMENTATION`, ensues, leaving the given init options
 * unchanged.
 * Otherwise, it will proceed despite errors, freeing as much resources as it can and zero
 * initializing the given init options.
 *
 * \pre The given init options must have been initialized
 *   i.e. had `rmw_init_options_init()` called on.
 *
 * \remarks If init options are zero initialized,
 *   then `RMW_RET_INVALID_ARGUMENT` is returned.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Yes
 * Lock-Free          | Yes
 *
 * This should be defined by the rmw implementation.
 *
 * \param[inout] init_options object to finalized
 * \return `RMW_RET_OK` if finalization is successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if any arguments are invalid, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the implementation
 *   identifier does not match the implementation of this function, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_init_options_fini(rmw_init_options_t*) @nogc nothrow;
        /// Used to specify if the context can only communicate through localhost.
        enum rmw_localhost_only_t
        {
            /// Uses ROS_LOCALHOST_ONLY environment variable.
            RMW_LOCALHOST_ONLY_DEFAULT = 0,
            /// Forces using only localhost.
            RMW_LOCALHOST_ONLY_ENABLED = 1,
            /// Forces disabling localhost only.
            RMW_LOCALHOST_ONLY_DISABLED = 2,
        }

        enum RMW_LOCALHOST_ONLY_DEFAULT = rmw_localhost_only_t.RMW_LOCALHOST_ONLY_DEFAULT;
        enum RMW_LOCALHOST_ONLY_ENABLED = rmw_localhost_only_t.RMW_LOCALHOST_ONLY_ENABLED;
        enum RMW_LOCALHOST_ONLY_DISABLED = rmw_localhost_only_t.RMW_LOCALHOST_ONLY_DISABLED;

        union pthread_attr_t
        {

            char[56] __size;

            c_long __align;
        }

        alias pthread_once_t = int;

        alias pthread_key_t = uint;
        /// Structure to hold a sequence of ROS messages.
        struct rmw_message_sequence_t
        {
            /// Array of pointers to ROS messages.
            void** data;
            /// The number of valid entries in `data`.
            c_ulong size;
            /// The total allocated capacity of the data array.
            c_ulong capacity;
            /// The allocator used to allocate the data array.
            rcutils_allocator_t* allocator;
        }
        /// Structure to hold a sequence of message infos.
        struct rmw_message_info_sequence_t
        {
            /// Array of message info.
            rmw_message_info_t* data;
            /// The number of valid entries in data.
            c_ulong size;
            /// The total allocated capacity of the data array.
            c_ulong capacity;
            /// The allocator used to allocate the data array.
            rcutils_allocator_t* allocator;
        }
        /// Return an rmw_message_sequence_t struct with members initialized to `NULL`
        rmw_message_sequence_t rmw_get_zero_initialized_message_sequence() @nogc nothrow;
        /// Initialize an rmw_message_sequence_t object.
        /**
 * \param[inout] sequence sequence object to be initialized.
 * \param[in] size capacity of the sequence to be allocated.
 * \param[in] allocator the allcator used to allocate memory.
 */
        int rmw_message_sequence_init(rmw_message_sequence_t*, c_ulong, rcutils_allocator_t*) @nogc nothrow;
        /// Finalize an rmw_message_sequence_t object.
        /**
 * The rmw_message_sequence_t struct has members which require memory to be allocated to them
 * before setting values.
 * This function reclaims any allocated resources within the object and zeroes out all other
 * members.
 *
 * Note: This will not call `fini` or deallocate the underlying message structures.
 *
 * \param[inout] sequence sequence object to be finalized.
 */
        int rmw_message_sequence_fini(rmw_message_sequence_t*) @nogc nothrow;
        /// Return an rmw_message_info_sequence_t struct with members initialized to `NULL`
        rmw_message_info_sequence_t rmw_get_zero_initialized_message_info_sequence() @nogc nothrow;
        /// Initialize an rmw_message_info_sequence_t object.
        /**
 * \param[inout] sequence sequence object to be initialized.
 * \param[in] size capacity of the sequence to be allocated.
 * \param[in] allocator the allcator used to allocate memory.
 */
        int rmw_message_info_sequence_init(rmw_message_info_sequence_t*,
                c_ulong, rcutils_allocator_t*) @nogc nothrow;
        /// Finalize an rmw_message_sequence_t object.
        /**
 * The rmw_message_sequence_t struct has members which require memory to be allocated to them
 * before setting values.
 * This function reclaims any allocated resources within the object and zeroes out all other
 * members.
 *
 * \param[inout] sequence sequence object to be finalized.
 */
        int rmw_message_info_sequence_fini(rmw_message_info_sequence_t*) @nogc nothrow;

        extern __gshared const(rmw_qos_profile_t) rmw_qos_profile_sensor_data;

        extern __gshared const(rmw_qos_profile_t) rmw_qos_profile_parameters;

        extern __gshared const(rmw_qos_profile_t) rmw_qos_profile_default;

        extern __gshared const(rmw_qos_profile_t) rmw_qos_profile_services_default;

        extern __gshared const(rmw_qos_profile_t) rmw_qos_profile_parameter_events;

        extern __gshared const(rmw_qos_profile_t) rmw_qos_profile_system_default;

        extern __gshared const(rmw_qos_profile_t) rmw_qos_profile_unknown;
        /// Return code for rmw functions
        alias rmw_ret_t = int;

        union pthread_condattr_t
        {

            char[4] __size;

            int __align;
        }

        union pthread_mutexattr_t
        {

            char[4] __size;

            int __align;
        }

        alias pthread_t = c_ulong;
        /// Get the name of the rmw implementation being used
        /**
 * \return Name of rmw implementation
 */
        const(char)* rmw_get_implementation_identifier() @nogc nothrow;
        /// Get the unique serialization format for this middleware.
        /**
 * Return the format in which binary data is serialized.
 * One middleware can only have one encoding.
 * In contrast to the implementation identifier, the serialization format can be equal between
 * multiple RMW implementations.
 * This means, that the same binary messages can be deserialized by RMW implementations with the
 * same format.
 * \sa rmw_serialize
 * \sa rmw_deserialize
 * \return serialization format
 */
        const(char)* rmw_get_serialization_format() @nogc nothrow;
        /// Create a node and return a handle to that node.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - name is not a valid non-null node name
 *   - namespace_ is not a valid non-null namespace
 *   - context is not valid i.e. it is zero-initialized, or
 *     its implementation identifier does not match that of
 *     this API implementation, or has been invalidated by
 *     `rmw_shutdown()`
 *   - memory allocation fails during node creation
 *   - an unspecified error occurs
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No [1]
 * Lock-Free          | No [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * This should be defined by the rmw implementation.
 *
 * \param[in] context init context that this node should be associated with
 * \param[in] name the node name
 * \param[in] namespace_ the node namespace
 * \return rmw node handle, or `NULL` if there was an error
 */
        rmw_node_t* rmw_create_node(rmw_context_t*, const(char)*, const(char)*, c_ulong, bool) @nogc nothrow;
        /// Finalize a given node handle, reclaim the resources, and deallocate the node handle.
        /**
 * This function will return early if a logical error, such as `RMW_RET_INVALID_ARGUMENT`
 * or `RMW_RET_INCORRECT_RMW_IMPLEMENTATION`, ensues, leaving the given node handle unchanged.
 * Otherwise, it will proceed despite errors, freeing as many resources as it can, including
 * the node handle. Usage of a deallocated node handle is undefined behavior.
 *
 * \pre All publishers, subscribers, services, and clients created from this node must
 *   have been destroyed prior to this call. Some rmw implementations may verify this,
 *   returning `RMW_RET_ERROR` and setting a human readable error message if any entity
 *   created from this node has not yet been destroyed. However, this is not guaranteed
 *   and so callers should ensure that this is the case before calling this function.
 *
 * \param[in] node the node handle to be destroyed
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if node is invalid, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the implementation
 *   identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_destroy_node(rmw_node_t*) @nogc nothrow;

        int rmw_node_assert_liveliness(const(rmw_node_t)*) @nogc nothrow;
        /// Return a guard condition which is triggered when the ROS graph changes.
        /**
 * The guard condition will be triggered anytime a change to the ROS graph occurs.
 * A ROS graph change occurs whenever:
 * - A node joins or leaves the ROS graph.
 *   This change will be reflected in rmw_get_node_names() and
 *   rmw_get_node_names_with_enclaves() outcome.
 * - A topic subscription joins or leaves the ROS graph.
 *   This change will be reflected in rmw_get_topic_names_and_types(),
 *   rmw_get_subscriber_names_and_types_by_node(), and
 *   rmw_get_subscriptions_info_by_topic() outcome.
 * - A topic publisher joins or leaves the ROS graph.
 *   This change will be reflected in rmw_get_topic_names_and_types(),
 *   rmw_get_publisher_names_and_types_by_node(), and
 *   rmw_get_publishers_info_by_topic() outcome.
 * - A topic subscription matches a topic publisher with compatible QoS policies.
 *   This change will be reflected in rmw_subscription_count_matched_publishers() outcome.
 * - A topic publisher matches a topic subscription with compatible QoS policies.
 *   This change will be reflected in rmw_publisher_count_matched_subscriptions() outcome.
 * - A service server joins or leaves the ROS graph.
 *   This change will be reflected in rmw_get_service_names_and_types() and
 *   rmw_get_service_names_and_types_by_node() outcome.
 * - A service client joins or leaves the ROS graph.
 *   This change will be reflected in rmw_get_service_names_and_types() and
 *   rmw_get_client_names_and_types_by_node() outcome.
 * - A service client matches a service server with compatible QoS policies.
 *   This change will be reflected in rmw_service_server_is_available() outcome.
 *
 * \note The state of the ROS graph, and any changes that may take place,
 *   are reported as seen by the associated `node`.
 *
 * The guard condition is owned and internally held by the `node`.
 * It will be invalidated if `node` is finalized using rmw_destroy_node().
 * It is undefined behavior to use an invalidated guard condition.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \pre Given `node` must be a valid node handle, as returned by rmw_create_node().
 *
 * \param[in] node Node to retrieve the guard condition from.
 * \return Guard condition if successful, or `NULL` if
 *   `node` is `NULL`, or an unspecified error occurs.
 */
        const(rmw_guard_condition_t)* rmw_node_get_graph_guard_condition(const(rmw_node_t)*) @nogc nothrow;
        /// Initialize a publisher allocation to be used with later publications.
        /**
 * This creates an allocation object that can be used in conjunction with
 * the rmw_publish method to perform more carefully control memory allocations.
 *
 * This will allow the middleware to preallocate the correct amount of memory
 * for a given message type and message bounds.
 * As allocation is performed in this method, it will not be necessary to allocate
 * in the `rmw_publish` method.
 *
 * \param[in] type_support Type support of the message to be preallocated.
 * \param[in] message_bounds Bounds structure of the message to be preallocated.
 * \param[out] allocation Allocation structure to be passed to `rmw_publish`.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_UNSUPPORTED` if it's unimplemented
 * \return `RMW_RET_INVALID_ARGUMENT` if an argument is null, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_init_publisher_allocation(const(rosidl_message_type_support_t)*,
                const(rosidl_runtime_c__Sequence__bound)*, rmw_publisher_allocation_t*) @nogc nothrow;
        /// Destroy a publisher allocation object.
        /**
 * This deallocates any memory allocated by `rmw_init_publisher_allocation`.
 *
 * \param[in] allocation Allocation object to be destroyed.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_UNSUPPORTED` if it's unimplemented
 * \return `RMW_RET_INVALID_ARGUMENT` if argument is null, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_fini_publisher_allocation(rmw_publisher_allocation_t*) @nogc nothrow;
        /// Return a rmw_publisher_options_t initialized with default values.
        rmw_publisher_options_t rmw_get_default_publisher_options() @nogc nothrow;
        /// Create a publisher and return a handle to that publisher.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - node is not a valid non-null handle for this rmw implementation,
 *     as returned by `rmw_create_node()`
 *   - type_support is a not valid non-null message type support, as returned by
 *     `ROSIDL_GET_MSG_TYPE_SUPPORT()`
 *   - topic_name is not a valid non-null topic name, according to
 *     `rmw_validate_full_topic_name()`
 *   - qos_profile is not a fully specified non-null profile i.e. no UNKNOWN policies
 *   - publisher_options is not a valid non-null option set, as returned by
 *     `rmw_get_default_publisher_options()`
 *   - memory allocation fails during publisher creation
 *   - an unspecified error occurs
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] node Handle to node with which to register this publisher
 * \param[in] type_support Type support for the messages to be published
 * \param[in] topic_name Name of the topic to publish to, often a fully qualified
 *   topic name unless `qos_profile` is configured to avoid ROS namespace conventions
 *   i.e. to create a native topic publisher
 * \param[in] qos_profile QoS policies for this publisher
 * \param[in] publisher_options Options to configure this publisher
 * \return rmw publisher handle, or `NULL` if there was an error
 */
        rmw_publisher_t* rmw_create_publisher(const(rmw_node_t)*, const(rosidl_message_type_support_t)*,
                const(char)*, const(rmw_qos_profile_t)*, const(rmw_publisher_options_t)*) @nogc nothrow;
        /// Finalize a given publisher handle, reclaim the resources, and deallocate the publisher handle.
        /**
 * This function will return early if a logical error, such as `RMW_RET_INVALID_ARGUMENT`
 * or `RMW_RET_INCORRECT_RMW_IMPLEMENTATION`, ensues, leaving the given publisher handle unchanged.
 * Otherwise, it will proceed despite errors, freeing as many resources as it can, including
 * the publisher handle. Usage of a deallocated publisher handle is undefined behavior.
 *
 * \pre Given node must be the one the publisher was registered with.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] node Handle to node with which the given publisher is registered
 * \param[in] publisher Handle to publisher to be finalized
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if node or publisher is `NULL`, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if node or publisher
 *   implementation identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_destroy_publisher(rmw_node_t*, rmw_publisher_t*) @nogc nothrow;
        /// Borrow a loaned ROS message.
        /**
 * This ROS message is owned by the middleware, that will keep it alive (i.e. in valid
 * memory space) until the caller publishes it using rmw_publish_loaned_message() or
 * returns it using rmw_return_loaned_message_from_publisher().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To borrow a ROS message is a synchronous operation.
 *   It is also non-blocking, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on borrow or not.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when using ROS message loaning support.
 *
 * \par Thread-safety
 *   Publishers are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is safe to borrow ROS messages from the same publisher concurrently.
 *
 * \pre Given `publisher` must be a valid publisher, as returned by rmw_create_publisher().
 * \pre Given `type_support` must be a valid `rosidl` message type support, matching the
 *   one registered with the `publisher` on creation.
 *
 * \param[in] publisher Publisher to which the loaned ROS message will be associated.
 * \param[in] type_support Message type support of the loaned ROS message.
 * \param[out] ros_message Pointer to type erased ROS message loaned by the middleware.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `publisher` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `type_support` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_message` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `*ros_message` is not NULL (to prevent leaks), or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if `publisher` implementation identifier
 *   does not match this implementation, or
 * \return `RMW_RET_UNSUPPORTED` if the implementation does not support ROS message loaning, or
 * \return `RMW_RET_ERROR` if an unexpected error occured.
 */
        int rmw_borrow_loaned_message(const(rmw_publisher_t)*,
                const(rosidl_message_type_support_t)*, void**) @nogc nothrow;
        /// Return a loaned message previously borrowed from a publisher.
        /**
 * Tells the middleware that a borrowed ROS message is no longer needed by the caller.
 * Ownership of the ROS message is given back to the middleware.
 * If this function fails early due to a logical error, such as an invalid argument,
 * the loaned ROS message will be left unchanged.
 * Otherwise, ownership of the ROS message will be given back to the middleware.
 * It is up to the middleware what will be made of the returned ROS message.
 * It is undefined behavior to use a loaned ROS message after returning it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To return a ROS message is a synchronous operation.
 *   It is also non-blocking, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Thread-safety
 *   Publishers are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is safe to return borrowed ROS messages to the same publisher concurrently.
 *   However, since ownership of the loaned ROS message is given back to the middleware and
 *   this transfer is not synchronized, it is not safe to return the same loaned ROS message
 *   concurrently.
 *
 * \pre Given `publisher` must be a valid publisher, as returned by rmw_create_publisher().
 * \pre Given `loaned_message` must have been previously borrowed from the same publisher
 *   using rmw_borrow_loaned_message().
 *
 * \param[in] publisher Publisher to which the loaned ROS message is associated.
 * \param[in] loaned_message Type erased loaned ROS message to be returned.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `publisher` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `loaned_message` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if `publisher` implementation identifier
 *   does not match this implementation, or
 * \return `RMW_RET_UNSUPPORTED` if the implementation does not support ROS message loaning, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs and no message can be initialized.
 */
        int rmw_return_loaned_message_from_publisher(const(rmw_publisher_t)*, void*) @nogc nothrow;
        /// Publish a ROS message.
        /**
 * Send a ROS message to all subscriptions with matching QoS policies using the given publisher.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   It is implementation defined whether to publish a ROS message is a
 *   synchronous or asynchronous, blocking or non-blocking operation.
 *   However, asynchronous implementations are not allowed to access the
 *   given ROS message after this function returns.
 *   Check the implementation documentation to learn about publish behavior.
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on publish or not.
 *   For instance, implementations that serialize ROS messages to send it over the
 *   wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *   A publisher allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when publishing ROS messages with and without publisher allocations.
 *
 * \par Thread-safety
 *   Publishers are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is safe to publish using the same publisher concurrently.
 *   However, when publishing regular ROS messages:
 *   - Access to the ROS message is read-only but it is not synchronized.
 *     Concurrent `ros_message` reads are safe, but concurrent reads and writes are not.
 *   - Access to the publisher allocation is not synchronized, unless specifically stated
 *     otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while rmw_publish() uses it.
 *     Check the implementation documentation to learn about publisher allocations' thread-safety.
 *
 * \pre Given `publisher` must be a valid publisher, as returned by rmw_create_publisher().
 * \pre Given `ros_message` must be a valid message, whose type matches the message type
 *   support the `publisher` was registered with on creation.
 * \pre If not NULL, given `allocation` must be a valid publisher allocation, initialized
 *   with rmw_publisher_allocation_init() with a message type support that matches the
 *   one registered with `publisher` on creation.
 *
 * \param[in] publisher Publisher to be used to send message.
 * \param[in] ros_message Type erased ROS message to be sent.
 * \param[in] allocation Pre-allocated memory to be used. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `publisher` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_message` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if `publisher` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_publish(const(rmw_publisher_t)*, const(void)*, rmw_publisher_allocation_t*) @nogc nothrow;
        /// Publish a loaned ROS message.
        /**
 * Send a previously borrowed ROS message to all subscriptions with matching QoS policies
 * using the given publisher, then return ROS message ownership to the middleware.
 *
 * If this function fails early due to a logical error, such as an invalid argument,
 * the loaned ROS message will be left unchanged.
 * Otherwise, ownership of the ROS message will be given back to the middleware.
 * It is up to the middleware what will be made of the returned ROS message.
 * It is undefined behavior to use a loaned ROS message after publishing it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check the implementation documentation.</i>
 *
 * \par Runtime behavior
 *   It is implementation defined whether to publish a loaned ROS message is a
 *   synchronous or asynchronous, blocking or non-blocking operation.
 *   Check the implementation documentation to learn about publish behavior.
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on publish or not.
 *   For instance, implementations that serialize ROS messages to send it over the
 *   wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *   A publisher allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when publishing loaned ROS messages with and without publisher allocations.
 *
 * \par Thread-safety
 *   Publishers are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is safe to publish using the same publisher concurrently.
 *   However, when publishing loaned ROS messages:
 *   - Ownership of the loaned ROS message is given back to the middleware.
 *     This transfer is not synchronized, and thus it is not safe to publish the
 *     same loaned ROS message concurrently.
 *   - Access to the publisher allocation is not synchronized, unless specifically stated
 *     otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while rmw_publish() uses it.
 *     Check the implementation documentation to learn about publisher allocations' thread-safety.
 *
 * \pre Given `publisher` must be a valid publisher, as returned by rmw_create_publisher().
 * \pre Given `ros_message` must be a valid message, borrowed from the same publisher using
 *   rmw_borrow_loaned_message().
 * \pre If not NULL, given `allocation` must be a valid publisher allocation, initialized
 *   with rmw_publisher_allocation_init() with a message type support that matches the
 *   one registered with `publisher` on creation.
 *
 * \param[in] publisher Publisher to be used to send message.
 * \param[in] ros_message Loaned type erased ROS message to be sent.
 * \param[in] allocation Pre-allocated memory to be used. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `publisher` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_message` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if `publisher` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_UNSUPPORTED` if the implementation does not support ROS message loaning, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_publish_loaned_message(const(rmw_publisher_t)*, void*,
                rmw_publisher_allocation_t*) @nogc nothrow;
        /// Retrieve the number of matched subscriptions to a publisher.
        /**
 * Query the underlying middleware to determine how many subscriptions are
 * matched to a given publisher.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] publisher the publisher object to inspect
 * \param[out] subscription_count the number of subscriptions matched
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if either argument is null, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if publisher
 *   implementation identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_publisher_count_matched_subscriptions(const(rmw_publisher_t)*, c_ulong*) @nogc nothrow;
        /// Retrieve the actual qos settings of the publisher.
        /**
 * Query the underlying middleware to determine the qos settings
 * of the publisher.
 * The actual configuration applied when using RMW_*_SYSTEM_DEFAULT
 * can only be resolved after the creation of the publisher, and it
 * depends on the underlying rmw implementation.
 * If the underlying setting in use can't be represented in ROS terms,
 * it will be set to RMW_*_UNKNOWN.
 *
 * \note The value of avoid_ros_namespace_conventions field is not resolved
 *   with this function. The rcl function `rcl_publisher_get_actual_qos()`
 *   resolves it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] publisher the publisher object to inspect
 * \param[out] qos the actual qos settings
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if either argument is null, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if publisher
 *   implementation identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_publisher_get_actual_qos(const(rmw_publisher_t)*, rmw_qos_profile_t*) @nogc nothrow;
        /// Publish a ROS message as a byte stream.
        /**
 * Send a ROS message serialized as a byte stream to all subscriptions with
 * matching QoS policies using the given publisher.
 * A ROS message can be serialized manually using rmw_serialize().
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check the implementation documentation.</i>
 *
 * \par Runtime behavior
 *   It is implementation defined whether to publish a loaned ROS message is a
 *   synchronous or asynchronous, blocking or non-blocking operation.
 *   However, asynchronous implementations are not allowed to access the
 *   given byte stream after this function returns.
 *   Check the implementation documentation to learn about publish behavior.
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on publish or not.
 *   Even if a publisher allocation is provided, an implementation may ignore it.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when publishing serialized messages with and without publisher allocations.
 *
 * \par Thread-safety
 *   Publishers are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is safe to publish using the same publisher concurrently.
 *   However, when publishing serialized ROS messages:
 *   - Access to the byte stream is read-only but it is not synchronized.
 *     Concurrent `serialized_message` reads are safe, but concurrent reads and writes are not.
 *   - Access to the publisher allocation is not synchronized, unless specifically stated
 *     otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while rmw_publish() uses it.
 *     Check the implementation documentation to learn about publisher allocations' thread-safety.
 *
 * \pre Given `publisher` must be a valid publisher, as returned by rmw_create_publisher().
 * \pre Given `serialized_message` must be a valid serialized message, initialized by
 *   rmw_serialized_message_init() and containing the serialization of a ROS message whose
 *   type matches the message type support the `publisher` was registered with on creation.
 * \pre If not NULL, given `allocation` must be a valid publisher allocation, initialized
 *   with rmw_publisher_allocation_init() with a message type support that matches the
 *   one registered with `publisher` on creation.
 *
 * \param[in] publisher Publisher to be used to send message.
 * \param[in] ros_message Serialized ROS message to be sent.
 * \param[in] allocation Pre-allocated memory to be used. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `publisher` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `serialized_message` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if `publisher` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_publish_serialized_message(const(rmw_publisher_t)*,
                const(rcutils_uint8_array_t)*, rmw_publisher_allocation_t*) @nogc nothrow;
        /// Compute the size of a serialized message.
        /**
 * Given a message definition and bounds, compute the serialized size.
 *
 * \param[in] type_support The type support of the message to compute.
 * \param[in] bounds Artifical bounds to use on unbounded fields.
 * \param[out] size The computed size of the serialized message.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if either argument is null, or
 * \return `RMW_RET_UNSUPPORTED` if it's unimplemented, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_get_serialized_message_size(const(rosidl_message_type_support_t)*,
                const(rosidl_runtime_c__Sequence__bound)*, c_ulong*) @nogc nothrow;
        /// Manually assert that this Publisher is alive (for RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC)
        /**
 * If the rmw Liveliness policy is set to RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC, the creator of
 * this publisher may manually call `assert_liveliness` at some point in time to signal to the rest
 * of the system that this Node is still alive.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | No
 * Lock-Free          | Yes
 *
 * \param[in] publisher handle to the publisher that needs liveliness to be asserted
 * \return `RMW_RET_OK` if the liveliness assertion was completed successfully, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs, or
 * \return `RMW_RET_UNSUPPORTED` if the rmw implementation does not support asserting liveliness.
 */
        int rmw_publisher_assert_liveliness(const(rmw_publisher_t)*) @nogc nothrow;
        /// Serialize a ROS message into a rmw_serialized_message_t.
        /**
 * The ROS message is serialized into a byte stream contained within the
 * rmw_serialized_message_t structure.
 * The serialization format depends on the underlying implementation.
 *
 * \pre Given ROS message must be a valid non-null instance, initialized
 *   by the caller and matching the provided typesupport.
 * \pre Given typesupport must be a valid non-null instance, as provided
 *   by `rosidl` APIs.
 * \pre Given serialized message must be a valid non-null instance, initialized
 *   by the caller.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [2]
 * Lock-Free          | Maybe [2]
 * <i>[1] if the given serialized message does not have enough capacity to hold
 *        the ROS message serialization</i>
 * <i>[2] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] ros_message the typed ROS message
 * \param[in] type_support the typesupport for the ROS message
 * \param[out] serialized_message the destination for the serialize ROS message
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_serialize(const(void)*,
                const(rosidl_message_type_support_t)*, rcutils_uint8_array_t*) @nogc nothrow;
        /// Deserialize a ROS message.
        /**
 * The given rmw_serialized_message_t's internal byte stream buffer is deserialized
 * into the given ROS message.
 * The serialization format expected in the rmw_serialized_message_t depends on the
 * underlying implementation.
 *
 * \pre Given serialized message must be a valid non-null instance, such
 *   as that returned by `rmw_serialize()`, matching provided typesupport
 *   and ROS message.
 * \pre Given typesupport must be a valid non-null instance, as provided
 *   by `rosidl` APIs.
 * \pre Given ROS message must be a valid non-null instance, initialized
 *   by the caller.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [2]
 * Lock-Free          | Maybe [2]
 * <i>[1] if the given ROS message contains unbounded fields</i>
 * <i>[2] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] serialized_message the serialized message holding the byte stream
 * \param[in] type_support the typesupport for the typed ros message
 * \param[out] ros_message destination for the deserialized ROS message
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation failed, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_deserialize(const(rcutils_uint8_array_t)*,
                const(rosidl_message_type_support_t)*, void*) @nogc nothrow;
        /// Initialize a subscription allocation to be used with later `take`s.
        /**
 * This creates an allocation object that can be used in conjunction with
 * the rmw_take method to perform more carefully control memory allocations.
 *
 * This will allow the middleware to preallocate the correct amount of memory
 * for a given message type and message bounds.
 * As allocation is performed in this method, it will not be necessary to allocate
 * in the `rmw_take` method.
 *
 * \param[in] type_support Type support of the message to be preallocated.
 * \param[in] message_bounds Bounds structure of the message to be preallocated.
 * \param[out] allocation Allocation structure to be passed to `rmw_take`.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_UNSUPPORTED` if it's unimplemented
 * \return `RMW_RET_INVALID_ARGUMENT` if an argument is null, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_init_subscription_allocation(const(rosidl_message_type_support_t)*,
                const(rosidl_runtime_c__Sequence__bound)*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Destroy a publisher allocation object.
        /**
 * This deallocates memory allocated by `rmw_init_subscription_allocation`.
 *
 * \param[in] allocation Allocation object to be destroyed.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_UNSUPPORTED` if it's unimplemented
 * \return `RMW_RET_INVALID_ARGUMENT` if argument is null, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_fini_subscription_allocation(rmw_subscription_allocation_t*) @nogc nothrow;
        /// Create a subscription and return a handle to that subscription.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - node is not a valid non-null handle for this rmw implementation,
 *     as returned by `rmw_create_node()`
 *   - type_support is a not valid non-null message type support, as returned by
 *     `ROSIDL_GET_MSG_TYPE_SUPPORT()`
 *   - topic_name is not a valid non-null topic name, according to
 *     `rmw_validate_full_topic_name()` if ROS namespace conventions apply
 *   - qos_profile is not a fully specified non-null profile i.e. no UNKNOWN policies
 *   - subscription_options is not a valid non-null option set, such as the one
 *     returned by `rmw_get_default_subscription_options()`
 *   - memory allocation fails during subscription creation
 *   - an unspecified error occurs
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] node Handle to node with which to register this subscription
 * \param[in] type_support Type support for the messages to be subscribed to
 * \param[in] topic_name Name of the topic to subscribe to, often a fully qualified
 *   topic name unless `qos_profile` is configured to avoid ROS namespace conventions
 *   i.e. to create a native topic subscription
 * \param[in] qos_profile QoS policies for this subscription
 * \param[in] subscription_options Options for configuring this subscription
 * \return rmw subscription handle, or `NULL` if there was an error
 */
        rmw_subscription_t* rmw_create_subscription(const(rmw_node_t)*, const(rosidl_message_type_support_t)*,
                const(char)*, const(rmw_qos_profile_t)*, const(rmw_subscription_options_t)*) @nogc nothrow;
        /// Finalize a given subscription handle, reclaim the resources, and deallocate the subscription
        /// handle.
        /**
 * This function will return early if a logical error, namely `RMW_RET_INVALID_ARGUMENT`
 * or `RMW_RET_INCORRECT_RMW_IMPLEMENTATION`, ensues, leaving the given subscription handle
 * unchanged.
 * Otherwise, it will proceed despite errors, freeing as many resources as it can, including
 * the subscription handle, and return `RMW_RET_ERROR`. Usage of a deallocated subscription
 * handle is undefined behavior.
 *
 * \pre Given node must be the one the subscription was registered with.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] node Handle to node with which the given subscription is registered
 * \param[in] subscription Handle to subscription to be finalized
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if node or subscription is `NULL`, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if node or subscription
 *   implementation identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_destroy_subscription(rmw_node_t*, rmw_subscription_t*) @nogc nothrow;
        /// Retrieve the number of matched publishers to a subscription.
        /**
 * Query the underlying middleware to determine how many publishers are
 * matched to a given subscription.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] subscription the subscription object to inspect
 * \param[out] publisher_count the number of publishers matched
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if either argument is null, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if subscription
 *   implementation identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_subscription_count_matched_publishers(const(rmw_subscription_t)*, c_ulong*) @nogc nothrow;
        /// Retrieve the actual qos settings of the subscription.
        /**
 * Query the underlying middleware to determine the qos settings
 * of the subscription.
 * The actual configuration applied when using RMW_*_SYSTEM_DEFAULT
 * can only be resolved after the creation of the subscription, and it
 * depends on the underlying rmw implementation.
 * If the underlying setting in use can't be represented in ROS terms,
 * it will be set to RMW_*_UNKNOWN.
 *
 * \note The value of avoid_ros_namespace_conventions field is not resolved
 *   with this function. The rcl function `rcl_subscription_get_actual_qos()`
 *   resolves it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \param[in] subscription the subscription object to inspect
 * \param[out] qos the actual qos settings
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if either argument is null, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if subscription
 *   implementation identifier does not match, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_subscription_get_actual_qos(const(rmw_subscription_t)*, rmw_qos_profile_t*) @nogc nothrow;
        /// Take an incoming ROS message.
        /**
 * Take a ROS message already received by the given subscription, removing it from internal queues.
 * This function will succeed even if no ROS message was received, but `taken` will be false.
 *
 * \remarks The same ROS message cannot be taken twice.
 *   Callers do not have to deal with duplicates.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To take a ROS message is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS messages to arrive,
 *   but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations that deserialize ROS messages received over
 *   the wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *   A subscription allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when taking ROS messages with and without subscription allocations.
 *
 * \par Thread-safety
 *   Subscriptions are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take from the same subscription concurrently.
 *   However, when taking regular ROS messages:
 *   - Access to the given ROS message is not synchronized.
 *     It is not safe to read or write `ros_message` while rmw_take() uses it.
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` while rmw_take() uses it.
 *   - Access to the given subscription allocation is not synchronized,
 *     unless specifically stated otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while rmw_take() uses it.
 *     Check the implementation documentation to learn about subscription allocations'
 *     thread-safety.
 *
 * \pre Given `subscription` must be a valid subscription, as returned
 *   by rmw_create_subscription().
 * \pre Given `ros_message` must be a valid message, whose type matches the message type support
 *   registered with the `subscription` on creation.
 * \pre If not NULL, given `allocation` must be a valid subscription allocation initialized
 *   with rmw_subscription_allocation_init() with a message type support that matches the
 *   one registered with the `subscription` on creation.
 * \post Given `ros_message` will remain a valid message.
 *   It will be left unchanged if this function fails early due to a logical error, such as an
 *   invalid argument, or in an unknown yet valid state if it fails due to a runtime error.
 *   It will also be left unchanged if this function succeeds but `taken` is false.
 *
 * \param[in] subscription Subscription to take message from.
 * \param[out] ros_message Type erased ROS message to write to.
 * \param[out] taken Boolean flag indicating if a ROS message was taken or not.
 * \param[in] allocation Pre-allocated memory to be used. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `subscription` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_message` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `subscription`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take(const(rmw_subscription_t)*, void*, bool*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take an incoming ROS message with its metadata.
        /**
 * Same as rmw_take(), except it also takes ROS message metadata.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To take a ROS message with its metadata is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS messages to arrive,
 *   but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations that deserialize ROS messages received over
 *   the wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *   A subscription allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when taking ROS messages with and without subscription allocations.
 *
 * \par Thread-safety
 *   Subscriptions are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take from the same subscription concurrently.
 *   However, when taking regular ROS messages with metadata:
 *   - Access to the given ROS message is not synchronized.
 *     It is not safe to read or write `ros_message` while rmw_take_with_info() uses it.
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` while rmw_take_with_info() uses it.
 *   - Access to the given ROS message metadata is not synchronized.
 *     It is not safe to read or write `message_info` while rmw_take_with_info() uses it.
 *   - Access to the given subscription allocation is not synchronized,
 *     unless specifically stated otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while rmw_take_with_info()
 *     uses it.
 *     Check the implementation documentation to learn about subscription allocations'
 *     thread-safety.
 *
 * \pre Given `subscription` must be a valid subscription, as returned
 *   by rmw_create_subscription().
 * \pre Given `ros_message` must be a valid message, whose type matches
 *   the message type support registered with the `subscription` on creation.
 * \pre If not NULL, given `allocation` must be a valid subscription allocation
 *   initialized with rmw_subscription_allocation_init() with a message type support
 *   that matches the one registered with the `subscription` on creation.
 * \post Given `ros_message` will remain a valid message, and
 *   `message_info`, valid message metadata.
 *   Both will be left unchanged if this function fails early due to a logical error, such as
 *   an invalid argument, or in an unknown yet valid state if it fails due to a runtime error.
 *   Both will also be left unchanged if this function succeeds but `taken` is false.
 *
 * \param[in] subscription Subscription to take ROS message from.
 * \param[out] ros_message Type erased ROS message to write to.
 * \param[out] taken Boolean flag indicating if a ROS message was taken or not.
 * \param[out] message_info Taken ROS message metadata.
 * \param[in] allocation Pre-allocated memory to be used. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `subscription` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_message` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `message_info` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `subscription`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take_with_info(const(rmw_subscription_t)*, void*, bool*,
                rmw_message_info_t*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take multiple incoming ROS messages with their metadata.
        /**
 * Take a sequence of consecutive ROS messages already received by the given
 * subscription, removing them from internal queues.
 * While `count` ROS messages may be requested, fewer messages may have been
 * received by the subscription.
 * This function will only take what has been already received, and it will
 * succeed even if fewer (or zero) messages were received.
 * In this case, only currently available messages will be returned.
 * The `taken` flag indicates the number of ROS messages actually taken.
 *
 * \remarks Once taken, ROS messages in the sequence cannot be taken again.
 *   Callers do not have to deal with duplicates.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To take a sequence of ROS messages is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS messages to arrive,
 *   but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations that deserialize ROS messages received over
 *   the wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *   A subscription allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when taking ROS messages with and without subscription allocations.
 *
 * \par Thread-safety
 *   Subscriptions are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take from the same subscription concurrently.
 *   Moreover, the sequence of ROS messages taken is guaranteed to be consecutive and to
 *   preserve the order in the subscription queues, despite any concurrent takes.
 *   However, when taking a sequence of ROS messages with metadata:
 *   - Access to the given ROS message sequence is not synchronized.
 *     It is not safe to read or write `message_sequence` while rmw_take_sequence() uses it.
 *   - Access to the given ROS message metadata sequence is not synchronized.
 *     It is not safe to read or write `message_info_sequence` while rmw_take_sequence() uses it.
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` while rmw_take_sequence() uses it.
 *   - Access to the given subscription allocation is not synchronized,
 *     unless specifically stated otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while rmw_take_sequence()
 *     uses it.
 *     Check the implementation documentation to learn about subscription allocations'
 *     thread-safety.
 *
 * \pre Given `subscription` must be a valid subscription, as returned
 *   by rmw_create_subscription().
 * \pre Given `message_sequence` must be a valid message sequence, initialized
 *   by rmw_message_sequence_init() and populated with ROS messages whose
 *   type matches the message type support registered with the `subscription`
 *   on creation.
 * \pre Given `message_info_sequence` must be a valid message metadata sequence,
 *   initialized by rmw_message_info_sequence_init().
 * \pre If not NULL, given `allocation` must be a valid subscription allocation initialized
 *   with rmw_subscription_allocation_init() with a message type support that matches the
 *   one registered with `subscription` on creation.
 * \post Given `message_sequence` will remain a valid message sequence, and
 *   `message_info_sequence`, a valid message metadata sequence.
 *   Both will be left unchanged if this function fails early due to a logical error, such as
 *   an invalid argument, or in an unknown yet valid state if it fails due to a runtime error.
 *   Both will also be left unchanged if this function succeeds but `taken` is false.
 *
 * \param[in] subscription Subscription to take ROS message from.
 * \param[in] count Number of messages to attempt to take.
 * \param[out] message_sequence Sequence of type erase ROS messages to write to.
 *   Message sequence capacity has to be enough to hold all requested messages
 *   i.e. capacity has to be equal or greater than `count`.
 *   It does not have to match that of `message_info_sequence`.
 * \param[out] message_info_sequence Sequence of additional message metadata.
 *   Message info sequence capacity has to be enough to hold all requested messages
 *   metadata i.e. capacity has to be equal or greater than `count`.
 *   It does not have to match that of `message_sequence`.
 * \param[out] taken Number of messages actually taken from subscription.
 * \param[in] allocation Pre-allocated memory to use. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `subscription` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `message_sequence` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `message_info_sequence` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `count` is 0, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `message_sequence` capacity is less than `count`, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `message_info_sequence` capacity is less than `count`, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `subscription` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take_sequence(const(rmw_subscription_t)*, c_ulong, rmw_message_sequence_t*,
                rmw_message_info_sequence_t*, c_ulong*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take an incoming ROS message as a byte stream.
        /**
 * Take a ROS message already received by the given subscription, removing it from internal queues.
 * This function will succeed even if no ROS message was received, but `taken` will be false.
 * Unlike rmw_take(), the ROS message is taken in its serialized form, as a byte stream.
 * If needed, this byte stream can then be deserialized into a ROS message with rmw_deserialize().
 *
 * \remarks The same ROS message, serialized or not, cannot be taken twice.
 *   Callers do not have to deal with duplicates.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To take a ROS message a byte stream is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS messages to arrive,
 *   but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations may have to perform additional memory allocations
 *   when dealing with ROS messages that contain unbounded (dynamically-sized) fields
 *   i.e. these implementations may have to resize the given byte stream.
 *   A subscription allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation guarantees
 *   when taking serialized ROS messages with and without subscription allocations.
 * \par
 *   For ROS messages that only contain bounded (fixed-size) fields, callers can query
 *   their size using rmw_get_serialized_message_size() and resize `serialized_message`
 *   using rmw_serialized_message_resize() accordingly to prevent byte stream resizing
 *   on take.
 *   Nonetheless, byte stream resizing is not guaranteed to be the sole memory operation.
 *
 * \par Thread-safety
 *   Subscriptions are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take from the same subscription concurrently.
 *   However, when taking serialized ROS messages:
 *   - Access to the given byte stream for serialized ROS messages is not synchronized.
 *     It is not safe to read or write `serialized_message` while
 *     rmw_take_serialized_message() uses it.
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` while rmw_take_serialized_message() uses it.
 *   - Access to the given subscription allocation is not synchronized,
 *     unless specifically stated otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while
 *     rmw_take_serialized_message() uses it.
 *     Check the implementation documentation to learn about subscription allocations'
 *     thread-safety.
 *
 * \pre Given `subscription` must be a valid subscription, as returned by
 *   rmw_create_subscription().
 * \pre Given `serialized_message` must be a valid serialized message, initialized by
 *   rmw_serialized_message_init().
 * \pre If not NULL, given `allocation` must be a valid subscription allocation initialized
 *   with rmw_subscription_allocation_init() with a message type support that matches the
 *   one registered with `subscription` on creation.
 * \post Given `serialized_message` will remain a valid serialized message.
 *   It will be left unchanged if this function fails early due to a logical error,
 *   such as an invalid argument, or in an unknown yet valid state if it fails due to a
 *   runtime error.
 *   It will also be left unchanged if this function succeeds but `taken` is false.
 *
 * \param[in] subscription Subscription to take ROS message from.
 * \param[out] serialized_message Byte stream to write to.
 * \param[out] taken Boolean flag indicating if a ROS message was taken or not.
 * \param[in] allocation Pre-allocated memory to use. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `subscription` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `serialized_message` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `subscription` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take_serialized_message(const(rmw_subscription_t)*,
                rcutils_uint8_array_t*, bool*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take an incoming ROS message as a byte stream with its metadata.
        /**
 * Same as rmw_take_serialized_message(), except it also takes ROS message metadata.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To take a ROS message a byte stream with its metadata is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS messages to arrive,
 *   but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations may have to perform additional memory allocations
 *   when dealing with ROS messages that contain unbounded (dynamically-sized) fields
 *   i.e. these implementations may have to resize the given byte stream.
 *   A subscription allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation guarantees
 *   when taking serialized ROS messages with and without subscription allocations.
 * \par
 *   For ROS messages that only contain bounded (fixed-size) fields, callers can query
 *   their size using rmw_get_serialized_message_size() and resize `serialized_message`
 *   using rmw_serialized_message_resize() accordingly to prevent byte stream resizing
 *   on take.
 *   Nonetheless, byte stream resizing is not guaranteed to be the sole memory operation.
 *
 * \par Thread-safety
 *   Subscriptions are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take from the same subscription concurrently.
 *   However, when taking serialized ROS messages with metadata:
 *   - Access to the given byte stream for serialized ROS messages is not synchronized.
 *     It is not safe to read or write `serialized_message` while
 *     rmw_take_serialized_message_with_info() uses it.
 *   - Access to the given ROS message metadata is not synchronized.
 *     It is not safe to read or write `message_info` while
 *     rmw_take_serialized_message_with_info() uses it.
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` while rmw_take_serialized_message_with_info()
 *     uses it.
 *   - Access to the given subscription allocation is not synchronized,
 *     unless specifically stated otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while
 *     rmw_take_serialized_message_with_info() uses it.
 *     Check the implementation documentation to learn about subscription allocations'
 *     thread-safety.
 *
 * \pre Given `serialized_message` must be a valid serialized message, initialized by
 *   rmw_serialized_message_init().
 * \pre If not NULL, given `allocation` must be a valid subscription allocation initialized
 *   with rmw_subscription_allocation_init() with a message type support that matches the
 *   one registered with `subscription` on creation.
 * \post Given `serialized_message` will remain a valid serialized message, and `message_info`,
 *   valid message metadata.
 *   Both will be left unchanged if this function fails early due to a logical error,
 *   such as an invalid argument, or in an unknown yet valid state if it fails due to a
 *   runtime error.
 *   It will also be left unchanged if this function succeeds but `taken` is false.
 *
 * \param[in] subscription Subscription to take ROS message from.
 * \param[out] serialized_message Byte stream to write to.
 * \param[out] taken Boolean flag indicating if a ROS message was taken or not.
 * \param[out] message_info Taken ROS message metadata.
 * \param[in] allocation Pre-allocated memory to use. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `subscription` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `serialized_message` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `message_info` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `subscription` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take_serialized_message_with_info(const(rmw_subscription_t)*,
                rcutils_uint8_array_t*, bool*, rmw_message_info_t*,
                rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take an incoming ROS message, loaned by the middleware.
        /**
 * Take a ROS message already received by the given subscription, removing it from internal queues.
 * This function will succeed even if no ROS message was received, but `taken` will be false.
 * The loaned ROS message is owned by the middleware, which will keep it alive (i.e. in valid
 * memory space) until the caller returns it using rmw_return_loaned_message_from_subscription().
 *
 * \remarks The same ROS message, loaned or not, cannot be taken twice.
 *   Callers do not have to deal with duplicates.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To take a loaned ROS message is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS messages to arrive
 *   nor for internal memory loaning pools, if any, to be replenished, but it is not
 *   guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations that deserialize ROS messages received over
 *   the wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *   A subscription allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when taking loaned ROS messages with and without subscription allocations.
 *
 * \par Thread-safety
 *   Subscriptions are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take from the same subscription concurrently.
 *   However, when taking loaned ROS messages:
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` nor `loaned_message`
 *     while rmw_take_loaned_message() uses them.
 *   - Access to the given subscription allocation is not synchronized,
 *     unless specifically stated otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while
 *     rmw_take_loaned_message() uses it.
 *     Check the implementation documentation to learn about subscription allocations'
 *     thread-safety.
 *
 * \pre Given `subscription` must be a valid subscription, as returned
 *   by rmw_create_subscription().
 * \pre If not NULL, given `allocation` must be a valid subscription allocation initialized
 *   with rmw_subscription_allocation_init() with a message type support that matches the
 *   one registered with `subscription` on creation.
 * \post Given `loaned_message` will remain unchanged, or point to a valid message if
 *   this function was successful and `taken` is true.
 *
 * \param[in] subscription Subscription to take ROS message from.
 * \param[inout] loaned_message Pointer to type erased ROS message taken
 *   and loaned by the middleware.
 * \param[out] taken Boolean flag indicating if a ROS message was taken or not.
 * \param[in] allocation Pre-allocated memory to use. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `subscription` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `loaned_message` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `*loaned_message` is not NULL (to prevent leaks), or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `subscription` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_UNSUPPORTED` if the implementation does not support loaned ROS messages, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take_loaned_message(const(rmw_subscription_t)*, void**,
                bool*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Take a loaned message and with its additional message information.
        /**
 * Same as rmw_take_loaned_message(), except it also takes ROS message metadata.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To take a loaned ROS message with its metadata is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS messages to arrive
 *   nor for internal memory loaning pools, if any, to be replenished, but it is not
 *   guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations that deserialize ROS messages received over
 *   the wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *   A subscription allocation, if provided, may or may not be used.
 *   Check the implementation documentation to learn about memory allocation
 *   guarantees when taking loaned ROS messages with and without subscription allocations.
 *
 * \par Thread-safety
 *   Subscriptions are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take from the same subscription concurrently.
 *   However, when taking loaned ROS messages with metadata:
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` nor `loaned_message`
 *     while rmw_take_loaned_message_with_info() uses them.
 *   - Access to the given ROS message metadata is not synchronized.
 *     It is not safe to read or write `message_info` while
 *     rmw_take_loaned_message_with_info() uses it.
 *   - Access to the given subscription allocation is not synchronized,
 *     unless specifically stated otherwise by the implementation.
 *     Thus, it is generally not safe to read or write `allocation` while
 *     rmw_take_loaned_message_with_info() uses it.
 *     Check the implementation documentation to learn about subscription allocations'
 *     thread-safety.
 *
 * \pre Given `subscription` must be a valid subscription, as returned
 *   by rmw_create_subscription().
 * \pre If not NULL, given `allocation` must be a valid subscription allocation initialized
 *   with rmw_subscription_allocation_init() with a message type support that matches the
 *   one registered with `subscription` on creation.
 * \post Given `loaned_message` will remain unchanged, or point to a valid message if
 *   this function was successful and `taken` is true.
 * \post Given `message_info` will remain valid message metadata.
 *   It will be left unchanged if this function fails early due to a logical error,
 *   such as an invalid argument, or in an unknown yet valid state if it fails due to a
 *   runtime error.
 *   It will also be left unchanged if this function succeeds but `taken` is false.
 *
 * \param[in] subscription Subscription to take ROS message from.
 * \param[inout] loaned_message Pointer to type erased ROS message taken
 *   and loaned by the middleware.
 * \param[out] taken Boolean flag indicating if a ROS message was taken or not.
 * \param[out] message_info Taken ROS message metadata.
 * \param[in] allocation Pre-allocated memory to use. May be NULL.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `subscription` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `loaned_message` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `*loaned_message` is not NULL to prevent leaks, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `message_info` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `subscription` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_UNSUPPORTED` if the implementation does not support loaned ROS messages, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take_loaned_message_with_info(const(rmw_subscription_t)*,
                void**, bool*, rmw_message_info_t*, rmw_subscription_allocation_t*) @nogc nothrow;
        /// Return a loaned ROS message previously taken from a subscription.
        /**
 * Tells the middleware that previously loaned ROS message is no longer needed by the caller.
 * If this function fails early due to a logical error, such as an invalid argument,
 * the loaned ROS message will be left unchanged.
 * Otherwise, ownership of the ROS message will be given back to the middleware.
 * It is up to the middleware what will be made of the returned ROS message.
 * It is undefined behavior to use a loaned ROS message after returning it.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   To return a loaned ROS message is a synchronous operation.
 *   It is also non-blocking, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Thread-safety
 *   Subscriptions are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to return loaned ROS messages to the same subscription concurrently.
 *   However, since ownership of the loaned ROS message is given back to middleware and this
 *   transfer is not synchronized, it is not safe to return the same loaned ROS message
 *   concurrently.
 *
 * \pre Given `subscription` must be a valid subscription, as returned
 *   by rmw_create_subscription().
 * \pre Given `loaned_message` must be a loaned ROS message, previously taken from
 *   `subscription` using rmw_take_loaned_message() or rmw_take_loaned_message_with_info().
 *
 * \param[in] subscription Subscription the ROS message was taken and loaned from.
 * \param[in] loaned_message Loaned type erased ROS message to be returned to the middleware.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `subscription` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `loaned_message` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `subscription` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_UNSUPPORTED` if the implementation does not support loaned ROS messages, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_return_loaned_message_from_subscription(const(rmw_subscription_t)*, void*) @nogc nothrow;
        /// Create a service client that can send requests to and receive replies from a service server.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - `node` is `NULL`, or
 *   - `node` does not belong to this implementation
 *      i.e. it does not have a matching implementation identifier, or
 *   - `type_support` is `NULL`, or
 *   - `service_name` is `NULL`, or
 *   - `service_name` is an empty string, or
 *   - (if ROS namespace conventions apply) `service_name` is invalid by
 *     rmw_validate_full_topic_name() definition, or
 *   - `qos_profile` is `NULL`, or
 *   - `qos_profile` has invalid or unknown policies, or
 *   - memory allocation fails during service client creation, or
 *   - an unspecified error occurs.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \pre Given `node` must be a valid node, as returned by rmw_create_node().
 * \pre Given `type_support` must be a valid `rosidl` service type support, as
 *   returned by ROSIDL_GET_SRV_TYPE_SUPPORT().
 *
 * \param[in] node Node with which to register this service client.
 * \param[in] type_support Type support of the service to be used.
 * \param[in] service_name Name of the service to be used, often a fully qualified
 *   service name unless `qos_profile` is configured to avoid ROS namespace conventions
 *   i.e. to create a native service client.
 * \param[in] qos_profile QoS policies for this service client's connections.
 * \return rmw service client handle, or `NULL` if there was an error.
 */
        rmw_client_t* rmw_create_client(const(rmw_node_t)*,
                const(rosidl_service_type_support_t)*, const(char)*, const(rmw_qos_profile_t)*) @nogc nothrow;
        /// Destroy and unregister a service client from its node.
        /**
 * This function will reclaim all associated resources, including the service client itself.
 * Use of a destroyed service client is undefined behavior.
 * This function will return early if a logical error, such as `RMW_RET_INVALID_ARGUMENT`
 * or `RMW_RET_INCORRECT_RMW_IMPLEMENTATION`, ensues, leaving the given service client unchanged.
 * Otherwise, it will proceed despite errors.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \pre Given `node` must be the one the service client was registered with.
 * \pre Given `client` must be a valid service client, as returned by rmw_create_service().
 *
 * \param[in] node Node with which the given service client is registered.
 * \param[in] client Service client to be destroyed.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node` is `NULL`, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `client` is `NULL`, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `node`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `client`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_destroy_client(rmw_node_t*, rmw_client_t*) @nogc nothrow;
        /// Send a ROS service request.
        /**
 * Send a ROS service request to one or more service servers, with matching QoS policies,
 * using the given client.
 *
 * \note It is implementation defined how many service servers may get, and potentially react to,
 *   the same request, considering there may be more than one server for the same service
 *   in the ROS graph.
 *
 * On success, this function will return a sequence number.
 * It is up to callers to save the returned sequence number to pair the ROS service request
 * just sent with future ROS service responses (taken using rmw_take_response()).
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   It is implementation defined whether sending a ROS service request is a
 *   synchronous or asynchronous, and blocking or non-blocking, operation.
 *   However, asynchronous implementations are not allowed to access the
 *   given ROS service request after this function returns.
 *   Check the implementation documentation to learn about request behavior.
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on send or not.
 *   For instance, implementations that serialize ROS service requests may need to
 *   perform additional memory allocations when dealing with unbounded (dynamically-sized)
 *   fields.
 *
 * \par Thread-safety
 *   Service clients are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to send requests using the same service client concurrently.
 *   However:
 *   - Access to the given ROS service request is read-only but it is not synchronized.
 *     Concurrent `ros_request` reads are safe, but concurrent reads and writes are not.
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `sequence_id` while rmw_send_request() uses it.
 *
 * \pre Given `client` must be a valid client, as returned by rmw_create_client().
 * \pre Given `ros_request` must be a valid service request, whose type matches the
 *   service type support registered with the `client` on creation.
 *
 * \param[in] client Service client to send a request with.
 * \param[in] ros_request ROS service request to be sent.
 * \param[out] sequence_id Sequence number for the `ros_request` just sent
 *   i.e. a unique identification number for it, populated on success.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `client` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_request` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `sequence_id` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `client`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_send_request(const(rmw_client_t)*, const(void)*, c_long*) @nogc nothrow;
        /// Take an incoming ROS service response.
        /**
 * Take a ROS service response already received by the given service server, removing
 * it from internal queues.
 * The response header (i.e. its metadata), containing at least the writer guid and
 * sequence number, is also retrieved.
 * Both writer guid and sequence number allow callers to pair, potentially for each
 * remote service server, a ROS service response with its corresponding ROS service
 * request, previously sent using rmw_send_request().
 *
 * \note It is implementation defined how many responses a given request may get,
 *   considering there may be more than one server for the same service in the ROS graph.
 *
 * This function will succeed even if no ROS service request was received,
 * but `taken` will be false.
 *
 * \remarks The same ROS service response cannot be taken twice.
 *   Callers do not have to deal with duplicates.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   Taking a ROS service response is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS service responses
 *   to arrive, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations that deserialize ROS service responses received over
 *   the wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *
 * \par Thread-safety
 *   Service clients are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take responses from the same service client concurrently.
 *   However:
 *   - Access to the given ROS service response is not synchronized.
 *     It is not safe to read or write `ros_response` while rmw_take_request() uses it.
 *   - Access to the given ROS service response header is not synchronized.
 *     It is not safe to read or write `response_header` while rmw_take_response() uses it.
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` while rmw_take_response() uses it.
 *
 * \pre Given `client` must be a valid client, as returned by rmw_create_client().
 * \pre Given `ros_response` must be a valid service response, whose type matches the
 *   service type support registered with the `client` on creation.
 * \post Given `ros_response` will remain a valid service response.
 *   It will be left unchanged if this function fails early due to a logical error, such as an
 *   invalid argument, or in an unknown yet valid state if it fails due to a runtime error.
 *   It will also be left unchanged if this function succeeds but `taken` is false.
 *
 * \param[in] client Service client to take response from.
 * \param[out] response_header Service response header to write to.
 * \param[out] ros_request Type erased ROS service response to write to.
 * \param[out] taken Boolean flag indicating if a ROS service response was taken or not.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `client` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `response_header` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_response` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `client`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take_response(const(rmw_client_t)*, rmw_service_info_t*, void*, bool*) @nogc nothrow;
        /// Create a service server that can receive requests from and send replies to a service client.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - `node` is `NULL`, or
 *   - `node` does not belong to this implementation
 *     i.e. it does not have a matching implementation identifier, or
 *   - `type_support` is `NULL`, or
 *   - `service_name` is `NULL`, or
 *   - `service_name` is an empty string, or
 *   - (if ROS namespace conventions apply) `service_name` is invalid by
 *     rmw_validate_full_topic_name() definition, or
 *   - `qos_profile` is `NULL`, or
 *   - `qos_profile` has invalid or unknown policies, or
 *   - memory allocation fails during service server creation, or
 *   - an unspecified error occurs
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \pre Given `node` must be a valid node, as returned by rmw_create_node().
 * \pre Given `type_support` must be a valid `rosidl` service type support, as
 *   returned by ROSIDL_GET_SRV_TYPE_SUPPORT().
 *
 * \param[in] node Node with which to register this service server.
 * \param[in] type_support Type support of the service to be served.
 * \param[in] service_name Name of the service to be served, often a fully qualified
 *   service name unless `qos_profile` is configured to avoid ROS namespace conventions
 *   i.e. to create a native service server.
 * \param[in] qos_profile QoS policies for this service server's connections.
 * \return rmw service handle, or `NULL` if there was an error.
 */
        rmw_service_t* rmw_create_service(const(rmw_node_t)*,
                const(rosidl_service_type_support_t)*, const(char)*, const(rmw_qos_profile_t)*) @nogc nothrow;
        /// Destroy and unregister a service server from its node.
        /**
 * This function will reclaim all associated resources, including the service server itself.
 * Use of a destroyed service server is undefined behavior.
 * This function will return early if a logical error, such as `RMW_RET_INVALID_ARGUMENT`
 * or `RMW_RET_INCORRECT_RMW_IMPLEMENTATION`, ensues, leaving the given service server unchanged.
 * Otherwise, it will proceed despite errors.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \pre Given `node` must be the one the service server was registered with.
 * \pre Given `service` must be a valid service server, as returned by rmw_create_service().
 *
 * \param[in] node Node with which the given service server is registered.
 * \param[in] service Service server to be destroyed.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node` is `NULL`, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `service` is `NULL`, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `node`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `service`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_destroy_service(rmw_node_t*, rmw_service_t*) @nogc nothrow;
        /// Take an incoming ROS service request.
        /**
 * Take a ROS service request already received by the given service server, removing
 * it from internal queues.
 * The request header (i.e. its metadata), containing at least the writer guid and
 * sequence number, is also retrieved.
 * Both writer guid and sequence number allow callers to pair, for each remote service
 * client, a ROS service request with its corresponding ROS service response, to be later
 * sent using rmw_send_response().
 *
 * This function will succeed even if no ROS service request was received,
 * but `taken` will be false.
 *
 * \remarks The same ROS service request cannot be taken twice.
 *   Callers do not have to deal with duplicates.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   Taking a ROS service request is a synchronous operation.
 *   It is also non-blocking, to the extent it will not wait for new ROS service requests
 *   to arrive, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on take or not.
 *   For instance, implementations that deserialize ROS service requests received over
 *   the wire may need to perform additional memory allocations when dealing with
 *   unbounded (dynamically-sized) fields.
 *
 * \par Thread-safety
 *   Service servers are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to take requests from the same service server concurrently.
 *   However:
 *   - Access to the given ROS service request is not synchronized.
 *     It is not safe to read or write `ros_request` while rmw_take_request() uses it.
 *   - Access to the given ROS service request header is not synchronized.
 *     It is not safe to read or write `request_header` while rmw_take_request() uses it.
 *   - Access to given primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `taken` while rmw_take_request() uses it.
 *
 * \pre Given `service` must be a valid service, as returned by rmw_create_service().
 * \pre Given `ros_request` must be a valid service request, whose type matches the
 *   service type support registered with the `service` on creation.
 * \post Given `ros_request` will remain a valid service request.
 *   It will be left unchanged if this function fails early due to a logical error, such as an
 *   invalid argument, or in an unknown yet valid state if it fails due to a runtime error.
 *   It will also be left unchanged if this function succeeds but `taken` is false.
 *
 * \param[in] service Service server to take request from.
 * \param[out] request_header Service request header to write to.
 * \param[out] ros_request Type erased ROS service request to write to.
 * \param[out] taken Boolean flag indicating if a ROS service request was taken or not.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `service` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `request_header` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_request` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `taken` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `service`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_take_request(const(rmw_service_t)*, rmw_service_info_t*, void*, bool*) @nogc nothrow;
        /// Send a ROS service response.
        /**
 * Send a ROS service response to the service client, with matching QoS policies,
 * from which the previously taken ROS service request was originally sent.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Runtime behavior
 *   It is implementation defined whether sending a ROS service response is a
 *   synchronous or asynchronous, and blocking or non-blocking, operation.
 *   However, asynchronous implementations are not allowed to access the
 *   given ROS service request after this function returns.
 *   Check the implementation documentation to learn about request behavior.
 *
 * \par Memory allocation
 *   It is implementation defined whether memory will be allocated on send or not.
 *   For instance, implementations that serialize ROS service responses may need to
 *   perform additional memory allocations when dealing with unbounded (dynamically-sized)
 *   fields.
 *
 * \par Thread-safety
 *   Service servers are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to send responses using the same service server concurrently.
 *   However:
 *   - Access to the given ROS service request header is read-only but it is not synchronized.
 *     Concurrent `request_header` reads are safe, but concurrent reads and writes are not.
 *   - Access to the given ROS service response is read-only but it is not synchronized.
 *     Concurrent `ros_request` reads are safe, but concurrent reads and writes are not.
 *
 * \pre Given `service` must be a valid service server, as returned by rmw_create_service().
 * \pre Given `request_header` must be the one previously taken along with the ROS service
 *   request to which we reply.
 * \pre Given `ros_response` must be a valid service response, whose type matches the
 *   service type support registered with the `service` on creation.
 *
 * \param[in] client Service server to send a response with.
 * \param[in] request_header Service response header, same as the one taken
 *   with the corresponding ROS service request.
 * \param[in] ros_response ROS service response to be sent.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `service` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `request_header` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `ros_response` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `service`
 *   implementation identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_send_response(const(rmw_service_t)*, rmw_request_id_t*, void*) @nogc nothrow;
        /// Create a guard condition and return a handle to that guard condition.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - context is `NULL`
 *   - context is invalid
 *   - memory allocation fails during guard condition creation
 *   - an unspecified error occurs
 *
 * The context must be non-null and valid, i.e. it has been initialized
 * by `rmw_init()` and has not been finalized by `rmw_shutdown()`.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | No [1]
 * Lock-Free          | No [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * This should be defined by the rmw implementation.
 *
 * \param[in] context init context that this node should be associated with
 * \return rmw guard condition handle or `NULL` if there was an error
 */
        rmw_guard_condition_t* rmw_create_guard_condition(rmw_context_t*) @nogc nothrow;
        /// Finalize a given guard condition handle, reclaim the resources, and deallocate the handle.
        /**
 * \param[in] guard_condition the guard condition handle to be destroyed
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if guard_condition is null, or
 * \return `RMW_RET_ERROR` if an unexpected error occurs.
 */
        int rmw_destroy_guard_condition(rmw_guard_condition_t*) @nogc nothrow;

        int rmw_trigger_guard_condition(const(rmw_guard_condition_t)*) @nogc nothrow;
        /// Create a wait set to store conditions that the middleware can wait on.
        /**
 * This function can fail, and therefore return `NULL`, if:
 *   - context is `NULL`
 *   - context is zero initialized, as provided by rmw_get_zero_initialized_context()
 *   - context does not belong to this implementation i.e. does not have a matching
 *     implementation identifier
 *   - memory allocation fails during wait set creation
 *   - an unspecified error occurs
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \par Thread-safety
 *   Contexts are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is safe to create multiple wait sets in the same context concurrently.
 *
 * \pre Given `context` must be a valid context, initialized by rmw_init().
 *
 * \param[in] context Context to associate the wait set with.
 * \param[in] max_conditions
 *   The maximum number of conditions that can be attached to, and stored by, the wait set.
 *   Can be set to zero (0) for the wait set to support an unbounded number of conditions.
 * \return An rmw wait set, or `NULL` if an error occurred.
 */
        rmw_wait_set_t* rmw_create_wait_set(rmw_context_t*, c_ulong) @nogc nothrow;
        /// Destroy a wait set.
        /**
 * This function will reclaim all associated resources, including the wait set.
 * Use of a wait set after destruction is undefined behavior.
 * This function will return early if a logical error, such as `RMW_RET_INVALID_ARGUMENT`
 * or `RMW_RET_INCORRECT_RMW_IMPLEMENTATION`, ensues, leaving the given wait set unchanged.
 * Otherwise, it will proceed despite errors.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \pre Given `wait_set` must be a valid wait set, as returned by rmw_create_wait_set().
 *
 * \param[in] wait_set Wait set to be finalized.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `wait_set` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `wait_set` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_destroy_wait_set(rmw_wait_set_t*) @nogc nothrow;
        /// Waits on sets of different entities and returns when one is ready.
        /**
 * This function adds middleware-specific conditions to the wait set and waits
 * until one or more become ready, or until the timeout is reached.
 *
 * \remark Elapsed time is measured against the system clock.
 *   Timeout granularity is thus bound to that of the aforementioned clock and,
 *   depending on the underlying implementation, to that of platform-specific
 *   APIs to sleep and/or wait.
 *
 * \remark
 *   The amount of time this function actually waits may be either above or
 *   below the specified timeout.
 *
 * Arrays contain type-erased, middleware-specific conditions associated with
 * waitable entities, which this function casts and adds to the wait set.
 * `NULL` entries in arrays prior to wait are considered invalid.
 * When the wait is over, entries in each array that correspond to
 * conditions that were \b not triggered are set to `NULL`.
 *
 * \remark Arrays' memory management is external to this function.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Maybe [1]
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] rmw implementation defined, check the implementation documentation</i>
 *
 * \par Thread-safety
 *   To wait is a reentrant procedure, but:
 *   - It is not safe to use the same wait set to wait in two or more threads concurrently.
 *   - It is not safe to wait for the same entity using different wait sets in two or
 *     more threads concurrently.
 *   - Access to the given timeout is read-only but it is not synchronized.
 *     Concurrent `wait_timeout` reads are safe, but concurrent reads and writes are not.
 *
 * \pre Given `wait_set` must be a valid wait set, as returned by rmw_create_wait_set().
 * \pre All given entities must be associated with nodes that, in turn, were registered
 *   with the same context the given `wait_set` was registered with on creation.
 *
 * \param[inout] subscriptions Array of subscriptions to wait on.
 *   Can be `NULL` if there are no subscriptions to wait on.
 * \param[inout] guard_conditions Array of guard conditions to wait on
 *   Can be `NULL` if there are no guard conditions to wait on.
 * \param[inout] services Array of services to wait on.
 *   Can be `NULL` if there are no services to wait on.
 * \param[inout] clients Array of clients to wait on.
 *   Can be `NULL` if there are no clients to wait on.
 * \param[inout] events Array of events to wait on.
 *   Can be `NULL` if there are no events to wait on.
 * \param[in] wait_set Wait set to use for waiting.
 * \param[in] wait_timeout If `NULL`, block indefinitely until an entity becomes ready.
 *   If zero, do not block -- check only for immediately available entities.
 *   Else, this represents the maximum amount of time to wait for an entity to become ready.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_TIMEOUT` if wait timed out, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `wait_set` is `NULL`, or
 * \return `RMW_RET_INVALID_ARGUMENT` if an array entry is `NULL`, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `wait_set` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_wait(rmw_subscriptions_t*, rmw_guard_conditions_t*, rmw_services_t*,
                rmw_clients_t*, rmw_events_t*, rmw_wait_set_t*, const(rmw_time_t)*) @nogc nothrow;
        /// Return the name and namespace of all nodes in the ROS graph.
        /**
 * This function will return an array of node names and an array of node namespaces,
 * as discovered so far by the given node.
 * The two arrays represent name and namespace pairs for each discovered node.
 * Both arrays will be the same length and the same index will refer to the same node.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | No
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] implementation defined, check the implementation documentation</i>
 *
 * \par Runtime behavior
 *   To query the ROS graph is a synchronous operation.
 *   It is also non-blocking, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Thread-safety
 *   Nodes are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is safe to query the ROS graph using the same node concurrently.
 *   However, access to string arrays is not synchronized.
 *   It is not safe to read or write `node_names` nor `node_namespaces`
 *   while rmw_get_node_names() uses them.
 *
 * \pre Given `node` must be a valid node handle, as returned by rmw_create_node().
 * \pre Given `node_names` must be a valid string array, zero-initialized
 *   as returned by rcutils_get_zero_initialized_string_array().
 * \pre Given `node_namespaces` must be a valid string array, zero-initialized
 *   as returned by rcutils_get_zero_initialized_string_array().
 * \post Given `node_names` and `node_namespaces` will remain valid arrays.
 *   These will be left unchanged if this function fails early due to a logical error,
 *   such as an invalid argument, or in an unknown yet valid state if it fails due to
 *   a runtime error.
 *
 * \param[in] node Node to query the ROS graph.
 * \param[out] node_names Array of discovered node names, populated on success.
 *   It is up to the caller to finalize this array later on, using rcutils_string_array_fini().
 * \param[out] node_namespaces Array of discovered node namespaces, populated on success.
 *   It is up to the caller to finalize this array later on, using rcutils_string_array_fini().
 * \return `RMW_RET_OK` if the query was successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node_names` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node_names` is not a zero-initialized array, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node_namespaces` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node_namespaces` is not a zero-initialized array, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `node` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_get_node_names(const(rmw_node_t)*, rcutils_string_array_t*,
                rcutils_string_array_t*) @nogc nothrow;
        /// Return the name, namespae, and enclave name of all nodes in the ROS graph.
        /**
 * This is similar to rmw_get_node_names(), but it also provides enclave names.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | Yes
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] implementation defined, check the implementation documentation</i>
 *
 * \par Runtime behavior
 *   To query the ROS graph is a synchronous operation.
 *   It is also non-blocking, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Thread-safety
 *   Nodes are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is safe to query the ROS graph using the same node concurrently.
 *   However, access to string arrays is not synchronized.
 *   It is not safe to read or write `node_names`, `node_namespaces`, nor `enclaves`
 *   while rmw_get_node_names_with_enclaves() uses them.
 *
 * \pre Given `node` must be a valid node handle, as returned by rmw_create_node().
 * \pre Given `node_names` must be a valid string array, zero-initialized
 *   as returned by rcutils_get_zero_initialized_string_array().
 * \pre Given `node_namespaces` must be a valid string array, zero-initialized
 *   as returned by rcutils_get_zero_initialized_string_array().
 * \pre Given `enclaves` must be a zero-initialized string array,
 *   as returned by rcutils_get_zero_initialized_string_array().
 * \post Given `node_names`, `node_namespaces`, and `enclaves` will remain valid arrays.
 *   These will be left unchanged if this function fails early due to a logical error,
 *   such as an invalid argument, or in an unknown yet valid state if it fails due to
 *   a runtime error.
 *
 * \param[in] node Node to query the ROS graph.
 * \param[out] node_names Array of discovered node names, populated on success.
 *   It is up to the caller to finalize this array later on, using rcutils_string_array_fini().
 * \param[out] node_namespaces Array of discovered node namespaces, populated on success.
 *   It is up to the caller to finalize this array later on, using rcutils_string_array_fini().
 * \param[out] enclaves Array of discovered node enclave names, populated on success.
 *   It is up to the caller to finalize this array later on, using rcutils_string_array_fini().
 * \return `RMW_RET_OK` if the query was successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node_names` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node_names` is not a zero-initialized array, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node_namespaces` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node_namespaces` is not a zero-initialized array, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `enclaves` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `enclaves` is not a zero-initialized array, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `node` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_BAD_ALLOC` if memory allocation fails, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_get_node_names_with_enclaves(const(rmw_node_t)*,
                rcutils_string_array_t*, rcutils_string_array_t*, rcutils_string_array_t*) @nogc nothrow;
        /// Count the number of known publishers matching a topic name.
        /**
 * This function returns the numbers of publishers of a given topic in the ROS graph,
 * as discovered so far by the given node.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] implementation defined, check the implementation documentation</i>
 *
 * \par Runtime behavior
 *   To query the ROS graph is a synchronous operation.
 *   It is also non-blocking, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Thread-safety
 *   Nodes are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is to query the ROS graph using the same node concurrently.
 *   However, access to primitive data-type arguments is not synchronized.
 *   It is not safe to read or write `topic_name` or `count` while rmw_count_publishers()
 *   uses them.
 *
 * \pre Given `node` must be a valid node handle, as returned by rmw_create_node().
 *
 * \param[in] node Handle to node to use to query the ROS graph.
 * \param[in] topic_name Fully qualified ROS topic name.
 * \param[out] count Number of publishers matching the given topic name.
 * \return `RMW_RET_OK` if the query was successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `topic_name` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `topic_name` is not a fully qualified topic name,
 *   by rmw_validate_full_topic_name() definition, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `count` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `node` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_count_publishers(const(rmw_node_t)*, const(char)*, c_ulong*) @nogc nothrow;
        /// Count the number of known subscribers matching a topic name.
        /**
 * This function returns the numbers of subscribers of a given topic in the ROS graph,
 * as discovered so far by the given node.
 *
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 * <i>[1] implementation defined, check the implementation documentation</i>
 *
 * \par Runtime behavior
 *   To query the ROS graph is a synchronous operation.
 *   It is also non-blocking, but it is not guaranteed to be lock-free.
 *   Generally speaking, implementations may synchronize access to internal resources using
 *   locks but are not allowed to wait for events with no guaranteed time bound (barring
 *   the effects of starvation due to OS scheduling).
 *
 * \par Thread-safety
 *   Nodes are thread-safe objects, and so are all operations on them except for finalization.
 *   Therefore, it is to query the ROS graph using the same node concurrently.
 *   However, access to primitive data-type arguments is not synchronized.
 *   It is not safe to read or write `topic_name` or `count` while rmw_count_subscribers()
 *   uses them.
 *
 * \pre Given `node` must be a valid node handle, as returned by rmw_create_node().
 *
 * \param[in] node Handle to node to use to query the ROS graph.
 * \param[in] topic_name Fully qualified ROS topic name.
 * \param[out] count Number of subscribers matching the given topic name.
 * \return `RMW_RET_OK` if the query was successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `node` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `topic_name` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `topic_name` is not a fully qualified topic name,
 *   by rmw_validate_full_topic_name() definition, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `count` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `node` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_count_subscribers(const(rmw_node_t)*, const(char)*, c_ulong*) @nogc nothrow;
        /// Get the unique identifier (gid) of a publisher.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Thread-safety
 *   Publishers are thread-safe objects, and so are all operations on them except for
 *   finalization.
 *   Therefore, it is safe to get the unique identifier from the same publisher concurrently.
 *   However, access to the gid is not synchronized.
 *   It is not safe to read or write `gid` while rmw_get_gid_for_publisher() uses it.
 *
 * \pre Given `publisher` must be a valid subscription, as returned by rmw_create_publisher().
 *
 * \param[in] publisher Publisher to get a gid from.
 * \param[out] gid Publisher's unique identifier, populated on success
 *   but left unchanged on failure.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `publisher` is NULL, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `gid` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `publisher` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_get_gid_for_publisher(const(rmw_publisher_t)*, rmw_gid_t*) @nogc nothrow;
        /// Check if two unique identifiers (gids) are equal.
        /**
 * <hr>
 * Attribute          | Adherence
 * ------------------ | -------------
 * Allocates Memory   | No
 * Thread-Safe        | Yes
 * Uses Atomics       | Maybe [1]
 * Lock-Free          | Maybe [1]
 *
 * <i>[1] implementation defined, check implementation documentation.</i>
 *
 * \par Thread-safety
 *   Unique identifier comparison is a reentrant function, but:
 *   - Access to both gids is read-only but it is not synchronized.
 *     Concurrent `gid1` and `gid2` reads are safe, but concurrent reads and writes are not.
 *   - Access to primitive data-type arguments is not synchronized.
 *     It is not safe to read or write `result` while rmw_compare_gids_equal() uses it.
 *
 * \param[in] gid1 First unique identifier to compare.
 * \param[in] gid2 Second unique identifier to compare.
 * \param[out] bool true if both gids are equal, false otherwise.
 * \return `RMW_RET_OK` if successful, or
 * \return `RMW_RET_INVALID_ARGUMENT` if `gid1` or `gid2` is NULL, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the implementation
 *   identifier of `gid1` or `gid2` does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_compare_gids_equal(const(rmw_gid_t)*, const(rmw_gid_t)*, bool*) @nogc nothrow;
        /// Check if a service server is available for the given service client.
        /**
 * This function will return true for `is_available` if there is a service
 * server available for the given client.
 *
 * The node parameter must not be `NULL`, and must point to a valid node.
 *
 * The client parameter must not be `NULL`, and must point to a valid client.
 *
 * The given client and node must match, i.e. the client must have been created
 * using the given node.
 *
 * The is_available parameter must not be `NULL`, and must point to a bool
 * variable.
 * The result of the check will be stored in the is_available parameter.
 *
 * This function does manipulate heap memory.
 * This function is not thread-safe.
 * This function is lock-free.
 *
 * \param[in] node the handle to the node being used to query the ROS graph
 * \param[in] client the handle to the service client being queried
 * \param[out] is_available
 *   set to true if there is a service server available, else false
 * \return `RMW_RET_OK` if node the check was made successfully, or
 * \return `RMW_RET_INCORRECT_RMW_IMPLEMENTATION` if the `publisher` implementation
 *   identifier does not match this implementation, or
 * \return `RMW_RET_ERROR` if an unspecified error occurs.
 */
        int rmw_service_server_is_available(const(rmw_node_t)*, const(rmw_client_t)*, bool*) @nogc nothrow;
        /// Set the current log severity
        /**
 * \param[in] severity The log severity to set
 * \return RMW_RET_OK if successful, otherwise an appropriate error code
 */
        int rmw_set_log_severity(rmw_log_severity_t) @nogc nothrow;

        enum rmw_security_enforcement_policy_t
        {

            RMW_SECURITY_ENFORCEMENT_PERMISSIVE = 0,

            RMW_SECURITY_ENFORCEMENT_ENFORCE = 1,
        }

        enum RMW_SECURITY_ENFORCEMENT_PERMISSIVE = rmw_security_enforcement_policy_t
                .RMW_SECURITY_ENFORCEMENT_PERMISSIVE;
        enum RMW_SECURITY_ENFORCEMENT_ENFORCE = rmw_security_enforcement_policy_t
                .RMW_SECURITY_ENFORCEMENT_ENFORCE;

        struct rmw_security_options_t
        {

            rmw_security_enforcement_policy_t enforce_security;

            char* security_root_path;
        }
        /// Get zero initialized security options.
        rmw_security_options_t rmw_get_zero_initialized_security_options() @nogc nothrow;
        /// Get default initialized security options.
        rmw_security_options_t rmw_get_default_security_options() @nogc nothrow;
        /// Copy the given security options.
        /**
 * \param[in] src security options to be copied.
 * \param[in] allocator allocator used when copying data to the new security options.
 * \param[out] dst security options to be set.
 * \returns RMW_RET_BAD_ALLOC, or
 * \returns RMW_RET_OK
 */
        int rmw_security_options_copy(const(rmw_security_options_t)*,
                const(rcutils_allocator_t)*, rmw_security_options_t*) @nogc nothrow;
        /// Set the security root path for the given security options.
        /**
 * The provided `security_root_path` will be copied into allocated memory.
 *
 * \param[in] security_root_path path to be set.
 * \param[in] allocator allocator used to allocate the new path.
 * \param[in|out] security_options security options to be set.
 * \returns RMW_RET_BAD_ALLOC, or
 * \returns RMW_RET_OK
 */
        int rmw_security_options_set_root_path(const(char)*,
                const(rcutils_allocator_t)*, rmw_security_options_t*) @nogc nothrow;
        /// Finalize the given security_options.
        /**
 * \param[in] security_options security options to be finalized.
 * \param[in] allocator allocator used to deallocate the root path.
 * \returns RMW_RET_ERROR, or
 * \returns RMW_RET_OK
 */
        int rmw_security_options_fini(rmw_security_options_t*, const(rcutils_allocator_t)*) @nogc nothrow;
        /**
 * \struct rmw_serialized_message_t
 *
 * \brief Serialized message as a string of bytes.
 *
 * It includes (but it is not limited to) the following members:
 *   \i \c buffer the reference to internal storage, as a pointer
 *   \i \c buffer_length the size of stored contents, as an unsigned integer
 *   \i \c buffer_capacity the capacity of internal storage, as an unsigned integer
 */
        alias rmw_serialized_message_t = rcutils_uint8_array_t;
        /// Return a rmw_subscription_options_t initialized with default values.
        rmw_subscription_options_t rmw_get_default_subscription_options() @nogc nothrow;
        /// Structure which encapsulates an rmw node
        struct rmw_node_t
        {
            /// Name of the rmw implementation
            const(char)* implementation_identifier;
            /// Type erased pointer to this node's data
            void* data;
            /// A concise name of this rmw node for identification
            const(char)* name;
            /// The namespace of this rmw node
            const(char)* namespace_;
            /// Context information about node's init specific information
            rmw_context_t* context;
        }
        /// Endpoint enumeration type
        enum rmw_endpoint_type_t
        {
            /// Endpoint type has not yet been set
            RMW_ENDPOINT_INVALID = 0,
            /// Creates and publishes messages to the ROS topic
            RMW_ENDPOINT_PUBLISHER = 1,
            /// Listens for and receives messages from a topic
            RMW_ENDPOINT_SUBSCRIPTION = 2,
        }

        enum RMW_ENDPOINT_INVALID = rmw_endpoint_type_t.RMW_ENDPOINT_INVALID;
        enum RMW_ENDPOINT_PUBLISHER = rmw_endpoint_type_t.RMW_ENDPOINT_PUBLISHER;
        enum RMW_ENDPOINT_SUBSCRIPTION = rmw_endpoint_type_t.RMW_ENDPOINT_SUBSCRIPTION;
        /// Options that can be used to configure the creation of a publisher in rmw.
        struct rmw_publisher_options_t
        {
            /// Used to pass rmw implementation specific resources during publisher creation.
            /**
   * This field is type erased (rather than forward declared) because it will
   * usually be a non-owned reference to an language specific object, e.g.
   * C++ it may be a polymorphic class that only the rmw implementation can use.
   *
   * The resource pointed to here needs to outlive this options structure, and
   * any rmw_publisher objects that are created using it, as they copy this
   * structure and may use this payload throughout their lifetime.
   */
            void* rmw_specific_publisher_payload;
        }
        /// Structure which encapsulates an rmw publisher
        struct rmw_publisher_t
        {
            /// Name of the rmw implementation
            const(char)* implementation_identifier;
            /// Type erased pointer to this publisher's data
            void* data;
            /// The name of the ROS topic this publisher publishes to
            const(char)* topic_name;
            /// Publisher options.
            /**
   * The options structure passed to rmw_create_publisher() should be
   * assigned to this field by the rmw implementation.
   * The fields should not be modified after creation, but
   * the contents of the options structure may or may not be const, i.e.
   * shallow const-ness.
   * This field is not marked const to avoid any const casting during setup.
   */
            rmw_publisher_options_t options;
            /// Indicate whether this publisher supports loaning messages
            bool can_loan_messages;
        }
        /// Options that can be used to configure the creation of a subscription in rmw.
        struct rmw_subscription_options_t
        {
            /// Used to pass rmw implementation specific resources during subscription creation.
            /**
   * All the same details and restrictions of this field in
   * rmw_publisher_options_t apply to this struct as well.
   *
   * \sa rmw_publisher_options_t.rmw_specific_publisher_payload
   */
            void* rmw_specific_subscription_payload;
            /// If true then the middleware should not deliver data from local publishers.
            /**
   * This setting is most often used when data should only be received from
   * remote nodes, especially to avoid "double delivery" when both intra- and
   * inter- process communication is taking place.
   *
   * \TODO(wjwwood): nail this down when participant mapping is sorted out.
   *   See: https://github.com/ros2/design/pull/250
   *
   * The definition of local is somewhat vague at the moment.
   * Right now it means local to the node, and that definition works best, but
   * may become more complicated when/if participants map to a context instead.
   */
            bool ignore_local_publications;
        }

        struct rmw_subscription_t
        {
            /// Name of the rmw implementation
            const(char)* implementation_identifier;
            /// Type erased pointer to this subscription
            void* data;
            /// Name of the ros topic this subscription listens to
            const(char)* topic_name;
            /// Subscription options.
            /**
   * The options structure passed to rmw_create_subscription() should be
   * assigned to this field by the rmw implementation.
   * The fields should not be modified after creation, but
   * the contents of the options structure may or may not be const, i.e.
   * shallow const-ness.
   * This field is not marked const to avoid any const casting during setup.
   */
            rmw_subscription_options_t options;
            /// Indicates whether this subscription can loan messages
            bool can_loan_messages;
        }
        /// A handle to an rmw service
        struct rmw_service_t
        {
            /// The name of the rmw implementation
            const(char)* implementation_identifier;
            /// Type erased pointer to this service
            void* data;
            /// The name of this service as exposed to the ros graph
            const(char)* service_name;
        }
        /// A handle to an rmw service client
        struct rmw_client_t
        {
            /// The name of the rmw implementation
            const(char)* implementation_identifier;
            /// Type erased pointer to this service client
            void* data;
            /// The name of this service as exposed to the ros graph
            const(char)* service_name;
        }
        /// Handle for an rmw guard condition
        struct rmw_guard_condition_t
        {
            /// The name of the rmw implementation
            const(char)* implementation_identifier;
            /// Type erased pointer to this guard condition
            void* data;
            /// rmw context associated with this guard condition
            rmw_context_t* context;
        }
        /// Allocation of memory for an rmw publisher
        struct rmw_publisher_allocation_t
        {
            /// The name of the rmw implementation
            const(char)* implementation_identifier;
            /// Type erased pointer to this allocation
            void* data;
        }
        /// Allocation of memory for an rmw subscription
        struct rmw_subscription_allocation_t
        {
            /// The name of the rmw implementation
            const(char)* implementation_identifier;
            /// Type erased pointer to this allocation
            void* data;
        }
        /// Array of subscriber handles.
        /**
 * An array of void * pointers representing type-erased middleware-specific subscriptions.
 * The number of non-null entries may be smaller than the allocated size of the array.
 * The number of subscriptions represented may be smaller than the allocated size of the array.
 * The creator of this struct is responsible for allocating and deallocating the array.
 */
        struct rmw_subscriptions_t
        {
            /// The number of subscribers represented by the array.
            c_ulong subscriber_count;
            /// Pointer to an array of void * pointers of subscriptions.
            void** subscribers;
        }
        /// Array of service handles.
        /**
 * An array of void * pointers representing type-erased middleware-specific services.
 * The number of non-null entries may be smaller than the allocated size of the array.
 * The number of services represented may be smaller than the allocated size of the array.
 * The creator of this struct is responsible for allocating and deallocating the array.
 */
        struct rmw_services_t
        {
            /// The number of services represented by the array.
            c_ulong service_count;
            /// Pointer to an array of void * pointers of services.
            void** services;
        }
        /// Array of client handles.
        /**
 * An array of void * pointers representing type-erased middleware-specific clients.
 * The number of non-null entries may be smaller than the allocated size of the array.
 * The number of clients represented may be smaller than the allocated size of the array.
 * The creator of this struct is responsible for allocating and deallocating the array.
 */
        struct rmw_clients_t
        {
            /// The number of clients represented by the array.
            c_ulong client_count;
            /// Pointer to an array of void * pointers of clients.
            void** clients;
        }

        struct rmw_events_t
        {
            /// The number of events represented by the array.
            c_ulong event_count;
            /// Pointer to an array of void * pointers of events.
            void** events;
        }
        /// Array of guard condition handles.
        /**
 * An array of void * pointers representing type-erased middleware-specific guard conditions.
 * The number of non-null entries may be smaller than the allocated size of the array.
 * The number of guard conditions represented may be smaller than the allocated size of the array.
 * The creator of this struct is responsible for allocating and deallocating the array.
 */
        struct rmw_guard_conditions_t
        {
            /// The number of guard conditions represented by the array.
            c_ulong guard_condition_count;
            /// Pointer to an array of void * pointers of guard conditions.
            void** guard_conditions;
        }
        /// Container for guard conditions to be waited on
        struct rmw_wait_set_t
        {
            /// The name of the rmw implementation
            const(char)* implementation_identifier;
            /// The guard condition to be waited on
            rmw_guard_conditions_t* guard_conditions;
            /// Type erased pointer to this wait set's data
            void* data;
        }
        /// An rmw service request identifier
        struct rmw_request_id_t
        {
            /// The guid of the writer associated with this request
            byte[16] writer_guid;
            /// Sequence number of this service
            c_long sequence_number;
        }
        /// Struct representing a time point for rmw
        struct rmw_time_t
        {
            /// Seconds since the epoch
            c_ulong sec;
            /// Nanoseconds component of this time point
            c_ulong nsec;
        }

        alias rmw_time_point_value_t = c_long;
        /// Meta-data for a service-related take.
        struct rmw_service_info_t
        {

            c_long source_timestamp;

            c_long received_timestamp;

            rmw_request_id_t request_id;
        }

        enum rmw_qos_reliability_policy_t
        {
            /// Implementation specific default
            RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT = 0,
            /// Guarantee that samples are delivered, may retry multiple times.
            RMW_QOS_POLICY_RELIABILITY_RELIABLE = 1,
            /// Attempt to deliver samples, but some may be lost if the network is not robust
            RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT = 2,
            /// Reliability policy has not yet been set
            RMW_QOS_POLICY_RELIABILITY_UNKNOWN = 3,
        }

        enum RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT = rmw_qos_reliability_policy_t
                .RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT;
        enum RMW_QOS_POLICY_RELIABILITY_RELIABLE = rmw_qos_reliability_policy_t
                .RMW_QOS_POLICY_RELIABILITY_RELIABLE;
        enum RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT = rmw_qos_reliability_policy_t
                .RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT;
        enum RMW_QOS_POLICY_RELIABILITY_UNKNOWN = rmw_qos_reliability_policy_t
                .RMW_QOS_POLICY_RELIABILITY_UNKNOWN;
        /// QoS history enumerations describing how samples endure
        enum rmw_qos_history_policy_t
        {
            /// Implementation default for history policy
            RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT = 0,
            /// Only store up to a maximum number of samples, dropping oldest once max is exceeded
            RMW_QOS_POLICY_HISTORY_KEEP_LAST = 1,
            /// Store all samples, subject to resource limits
            RMW_QOS_POLICY_HISTORY_KEEP_ALL = 2,
            /// History policy has not yet been set
            RMW_QOS_POLICY_HISTORY_UNKNOWN = 3,
        }

        enum RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT = rmw_qos_history_policy_t
                .RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT;
        enum RMW_QOS_POLICY_HISTORY_KEEP_LAST = rmw_qos_history_policy_t
                .RMW_QOS_POLICY_HISTORY_KEEP_LAST;
        enum RMW_QOS_POLICY_HISTORY_KEEP_ALL = rmw_qos_history_policy_t
                .RMW_QOS_POLICY_HISTORY_KEEP_ALL;
        enum RMW_QOS_POLICY_HISTORY_UNKNOWN = rmw_qos_history_policy_t
                .RMW_QOS_POLICY_HISTORY_UNKNOWN;
        /// QoS durability enumerations describing how samples persist
        enum rmw_qos_durability_policy_t
        {
            /// Impplementation specific default
            RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT = 0,
            /// The rmw publisher is responsible for persisting samples for “late-joining” subscribers
            RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL = 1,
            /// Samples are not persistent
            RMW_QOS_POLICY_DURABILITY_VOLATILE = 2,
            /// Durability policy has not yet been set
            RMW_QOS_POLICY_DURABILITY_UNKNOWN = 3,
        }

        enum RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT = rmw_qos_durability_policy_t
                .RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT;
        enum RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL = rmw_qos_durability_policy_t
                .RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL;
        enum RMW_QOS_POLICY_DURABILITY_VOLATILE = rmw_qos_durability_policy_t
                .RMW_QOS_POLICY_DURABILITY_VOLATILE;
        enum RMW_QOS_POLICY_DURABILITY_UNKNOWN = rmw_qos_durability_policy_t
                .RMW_QOS_POLICY_DURABILITY_UNKNOWN;
        /// QoS liveliness enumerations that describe a publisher's reporting policy for its alive status.
        /// For a subscriber, these are its requirements for its topic's publishers.
        enum rmw_qos_liveliness_policy_t
        {
            /// Implementation specific default
            RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT = 0,
            /// The signal that establishes a Topic is alive comes from the ROS rmw layer.
            RMW_QOS_POLICY_LIVELINESS_AUTOMATIC = 1,

            RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE = 2,
            /// The signal that establishes a Topic is alive is at the Topic level. Only publishing a message
            /// on the Topic or an explicit signal from the application to assert liveliness on the Topic
            /// will mark the Topic as being alive.
            RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC = 3,
            /// Liveliness policy has not yet been set
            RMW_QOS_POLICY_LIVELINESS_UNKNOWN = 4,
        }

        enum RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT = rmw_qos_liveliness_policy_t
                .RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT;
        enum RMW_QOS_POLICY_LIVELINESS_AUTOMATIC = rmw_qos_liveliness_policy_t
                .RMW_QOS_POLICY_LIVELINESS_AUTOMATIC;
        enum RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE = rmw_qos_liveliness_policy_t
                .RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE;
        enum RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC = rmw_qos_liveliness_policy_t
                .RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC;
        enum RMW_QOS_POLICY_LIVELINESS_UNKNOWN = rmw_qos_liveliness_policy_t
                .RMW_QOS_POLICY_LIVELINESS_UNKNOWN;
        /// ROS MiddleWare quality of service profile.
        struct rmw_qos_profile_t
        {

            rmw_qos_history_policy_t history;
            /// Size of the message queue.
            c_ulong depth;
            /// Reliabiilty QoS policy setting
            rmw_qos_reliability_policy_t reliability;
            /// Durability QoS policy setting
            rmw_qos_durability_policy_t durability;
            /// The period at which messages are expected to be sent/received
            rmw_time_t deadline;
            /// The age at which messages are considered expired and no longer valid
            rmw_time_t lifespan;
            /// Liveliness QoS policy setting
            rmw_qos_liveliness_policy_t liveliness;
            /// The time within which the RMW node or publisher must show that it is alive
            rmw_time_t liveliness_lease_duration;
            /// If true, any ROS specific namespacing conventions will be circumvented.
            /**
   * In the case of DDS and topics, for example, this means the typical
   * ROS specific prefix of `rt` would not be applied as described here:
   *
   *   http://design.ros2.org/articles/topic_and_service_names.html#ros-specific-namespace-prefix
   *
   * This might be useful when trying to directly connect a native DDS topic
   * with a ROS 2 topic.
   */
            bool avoid_ros_namespace_conventions;
        }
        /// ROS graph ID of the topic
        struct rmw_gid_t
        {
            /// Name of the rmw implementation
            const(char)* implementation_identifier;
            /// Bype data Gid value
            ubyte[24] data;
        }
        /// Information describing an rmw message
        struct rmw_message_info_t
        {

            c_long source_timestamp;

            c_long received_timestamp;

            rmw_gid_t publisher_gid;
            /// Whether this message is from intra_process communication or not
            bool from_intra_process;
        }
        /// Get zero initialized mesage info.
        rmw_message_info_t rmw_get_zero_initialized_message_info() @nogc nothrow;
        /// Default size of the rmw queue when history is set to RMW_QOS_POLICY_HISTORY_KEEP_LAST,
        /// 0 indicates it is currently not set
        enum _Anonymous_8
        {

            RMW_QOS_POLICY_DEPTH_SYSTEM_DEFAULT = 0,
        }

        enum RMW_QOS_POLICY_DEPTH_SYSTEM_DEFAULT = _Anonymous_8.RMW_QOS_POLICY_DEPTH_SYSTEM_DEFAULT;
        /// Type mapping of rcutils log severity types to rmw specific types.
        alias rmw_log_severity_t = _Anonymous_9;
        /// Type mapping of rcutils log severity types to rmw specific types.
        enum _Anonymous_9
        {
            /// Debug log severity, for pedantic messaging
            RMW_LOG_SEVERITY_DEBUG = 10,
            /// Informational log severity, for reporting expected but not overwhelming information
            RMW_LOG_SEVERITY_INFO = 20,
            /// Warning log severity, for reporting recoverable issues
            RMW_LOG_SEVERITY_WARN = 30,
            /// Error log severity, for reporting uncoverable issues
            RMW_LOG_SEVERITY_ERROR = 40,
            /// Fatal log severity, for reporting issue causing imminent shutdown
            RMW_LOG_SEVERITY_FATAL = 50,
        }

        enum RMW_LOG_SEVERITY_DEBUG = _Anonymous_9.RMW_LOG_SEVERITY_DEBUG;
        enum RMW_LOG_SEVERITY_INFO = _Anonymous_9.RMW_LOG_SEVERITY_INFO;
        enum RMW_LOG_SEVERITY_WARN = _Anonymous_9.RMW_LOG_SEVERITY_WARN;
        enum RMW_LOG_SEVERITY_ERROR = _Anonymous_9.RMW_LOG_SEVERITY_ERROR;
        enum RMW_LOG_SEVERITY_FATAL = _Anonymous_9.RMW_LOG_SEVERITY_FATAL;
        /// QoS Liveliness Changed information provided by a subscription.
        struct rmw_liveliness_changed_status_t
        {
            /**
   * The total number of currently active Publishers which publish to the topic associated with
   * the Subscription.
   * This count increases when a newly matched Publisher asserts its liveliness for the first time
   * or when a Publisher previously considered to be not alive reasserts its liveliness.
   * The count decreases when a Publisher considered alive fails to assert its liveliness and
   * becomes not alive, whether because it was deleted normally or for some other reason.
   */
            int alive_count;
            /**
   * The total count of current Publishers which publish to the topic associated with the
   * Subscription that are no longer asserting their liveliness.
   * This count increases when a Publisher considered alive fails to assert its liveliness and
   * becomes not alive for some reason other than the normal deletion of that Publisher.
   * It decreases when a previously not alive Publisher either reasserts its liveliness or is
   * deleted normally.
   */
            int not_alive_count;
            /// The change in the alive_count since the status was last read.
            int alive_count_change;
            /// The change in the not_alive_count since the status was last read.
            int not_alive_count_change;
        }
        /// QoS Requested Deadline Missed information provided by a subscription.
        struct rmw_requested_deadline_missed_status_t
        {
            /**
   * Lifetime cumulative number of missed deadlines detected for any instance read by the
   * subscription.
   * Missed deadlines accumulate; that is, each deadline period the total_count will be incremented
   * by one for each instance for which data was not received.
   */
            int total_count;
            /// The incremental number of deadlines detected since the status was read.
            int total_count_change;
        }
        /// QoS Liveliness Lost information provided by a publisher.
        struct rmw_liveliness_lost_status_t
        {
            /**
   * Lifetime cumulative number of times that a previously-alive Publisher became not alive due to
   * a failure to actively signal its liveliness within its offered liveliness period.
   * This count does not change when an already not alive Publisher simply remains not alive for
   * another liveliness period.
   */
            int total_count;
            /// The change in total_count since the last time the status was last read.
            int total_count_change;
        }
        /// QoS Deadline Missed information provided by a publisher.
        struct rmw_offered_deadline_missed_status_t
        {
            /**
   * Lifetime cumulative number of offered deadline periods elapsed during which a Publisher failed
   * to provide data.
   * Missed deadlines accumulate; that is, each deadline period the total_count will be incremented
   * by one.
   */
            int total_count;
            /// The change in total_count since the last time the status was last read.
            int total_count_change;
        }
        /// Contains rosidl action type support data.
        struct rosidl_action_type_support_t
        {

            const(rosidl_service_type_support_t)* goal_service_type_support;

            const(rosidl_service_type_support_t)* result_service_type_support;

            const(rosidl_service_type_support_t)* cancel_service_type_support;

            const(rosidl_message_type_support_t)* feedback_message_type_support;

            const(rosidl_message_type_support_t)* status_message_type_support;
        }

        enum rosidl_runtime_c__message_initialization
        {

            ROSIDL_RUNTIME_C_MSG_INIT_ALL = 0,

            ROSIDL_RUNTIME_C_MSG_INIT_SKIP = 1,

            ROSIDL_RUNTIME_C_MSG_INIT_ZERO = 2,

            ROSIDL_RUNTIME_C_MSG_INIT_DEFAULTS_ONLY = 3,
        }

        enum ROSIDL_RUNTIME_C_MSG_INIT_ALL = rosidl_runtime_c__message_initialization
                .ROSIDL_RUNTIME_C_MSG_INIT_ALL;
        enum ROSIDL_RUNTIME_C_MSG_INIT_SKIP = rosidl_runtime_c__message_initialization
                .ROSIDL_RUNTIME_C_MSG_INIT_SKIP;
        enum ROSIDL_RUNTIME_C_MSG_INIT_ZERO = rosidl_runtime_c__message_initialization
                .ROSIDL_RUNTIME_C_MSG_INIT_ZERO;
        enum ROSIDL_RUNTIME_C_MSG_INIT_DEFAULTS_ONLY = rosidl_runtime_c__message_initialization
                .ROSIDL_RUNTIME_C_MSG_INIT_DEFAULTS_ONLY;
        /// Contains rosidl message type support data
        struct rosidl_message_type_support_t
        {
            /// String identifier for the type_support.
            const(char)* typesupport_identifier;
            /// Pointer to the message type support library
            const(void)* data;
            /// Pointer to the message type support handler function
            const(rosidl_message_type_support_t)* function(const(rosidl_message_type_support_t)*,
                    const(char)*) func;
        }

        alias rosidl_message_typesupport_handle_function = const(rosidl_message_type_support_t)* function(
                const(rosidl_message_type_support_t)*, const(char)*);
        /// Get the message type support handle specific to this identifier.
        /**
 * The handle's message typesupport identifier function is returned or if the parameters are NULL
 * then an assert will happen.
 *
 * \param handle Handle to message type support
 * \param identifier The typesupport identifier to get the handle function for
 * \return The associated message typesupport handle function.
 */
        const(rosidl_message_type_support_t)* get_message_typesupport_handle(
                const(rosidl_message_type_support_t)*, const(char)*) @nogc nothrow;
        /**
 * If the identifier is the same as this handle's typesupport_identifier the handle is simply
 * returned or if the parameters are NULL then an assert will happen.
 *
 * \param handle Handle to message type support
 * \param identifier The typesupport identifier to get the handle function for
 * \return if the identifier match's the handle's identifier then the handle's function
 *   is returned.
 */
        const(rosidl_message_type_support_t)* get_message_typesupport_handle_function(
                const(rosidl_message_type_support_t)*, const(char)*) @nogc nothrow;

        struct rosidl_runtime_c__float__Sequence
        {

            float* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__double__Sequence
        {

            double* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__long_double__Sequence
        {

            real* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__char__Sequence
        {

            byte* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__wchar__Sequence
        {

            ushort* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__boolean__Sequence
        {

            bool* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__octet__Sequence
        {

            ubyte* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__uint8__Sequence
        {

            ubyte* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__int8__Sequence
        {

            byte* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__uint16__Sequence
        {

            ushort* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__int16__Sequence
        {

            short* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__uint32__Sequence
        {

            uint* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__int32__Sequence
        {

            int* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__uint64__Sequence
        {

            c_ulong* data;

            c_ulong size;

            c_ulong capacity;
        }

        struct rosidl_runtime_c__int64__Sequence
        {

            c_long* data;

            c_ulong size;

            c_ulong capacity;
        }

        alias rosidl_runtime_c__bool__Sequence = rosidl_runtime_c__boolean__Sequence;

        alias rosidl_runtime_c__byte__Sequence = rosidl_runtime_c__octet__Sequence;

        alias rosidl_runtime_c__float32__Sequence = rosidl_runtime_c__float__Sequence;

        alias rosidl_runtime_c__float64__Sequence = rosidl_runtime_c__double__Sequence;

        void rosidl_runtime_c__float__Sequence__fini(rosidl_runtime_c__float__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__float__Sequence__init(rosidl_runtime_c__float__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__double__Sequence__fini(rosidl_runtime_c__double__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__double__Sequence__init(rosidl_runtime_c__double__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__long_double__Sequence__fini(
                rosidl_runtime_c__long_double__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__long_double__Sequence__init(
                rosidl_runtime_c__long_double__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__char__Sequence__fini(rosidl_runtime_c__char__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__char__Sequence__init(rosidl_runtime_c__char__Sequence*, c_ulong) @nogc nothrow;

        bool rosidl_runtime_c__wchar__Sequence__init(rosidl_runtime_c__wchar__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__wchar__Sequence__fini(rosidl_runtime_c__wchar__Sequence*) @nogc nothrow;

        void rosidl_runtime_c__boolean__Sequence__fini(rosidl_runtime_c__boolean__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__boolean__Sequence__init(rosidl_runtime_c__boolean__Sequence*,
                c_ulong) @nogc nothrow;

        void rosidl_runtime_c__octet__Sequence__fini(rosidl_runtime_c__octet__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__octet__Sequence__init(rosidl_runtime_c__octet__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__uint8__Sequence__fini(rosidl_runtime_c__uint8__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__uint8__Sequence__init(rosidl_runtime_c__uint8__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__int8__Sequence__fini(rosidl_runtime_c__int8__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__int8__Sequence__init(rosidl_runtime_c__int8__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__uint16__Sequence__fini(rosidl_runtime_c__uint16__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__uint16__Sequence__init(rosidl_runtime_c__uint16__Sequence*, c_ulong) @nogc nothrow;

        bool rosidl_runtime_c__int16__Sequence__init(rosidl_runtime_c__int16__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__int16__Sequence__fini(rosidl_runtime_c__int16__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__uint32__Sequence__init(rosidl_runtime_c__uint32__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__uint32__Sequence__fini(rosidl_runtime_c__uint32__Sequence*) @nogc nothrow;

        void rosidl_runtime_c__int32__Sequence__fini(rosidl_runtime_c__int32__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__int32__Sequence__init(rosidl_runtime_c__int32__Sequence*, c_ulong) @nogc nothrow;

        bool rosidl_runtime_c__uint64__Sequence__init(rosidl_runtime_c__uint64__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__uint64__Sequence__fini(rosidl_runtime_c__uint64__Sequence*) @nogc nothrow;

        bool rosidl_runtime_c__int64__Sequence__init(rosidl_runtime_c__int64__Sequence*, c_ulong) @nogc nothrow;

        void rosidl_runtime_c__int64__Sequence__fini(rosidl_runtime_c__int64__Sequence*) @nogc nothrow;
        /**
 * \defgroup primitives_sequence_functions__legacy Sequence functions for legacy types for backward compatibility.
 */
        /**@{*/
        /** See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(bool) */
        bool rosidl_runtime_c__bool__Sequence__init(rosidl_runtime_c__boolean__Sequence*, c_ulong) @nogc nothrow;
        /** See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(bool) */
        void rosidl_runtime_c__bool__Sequence__fini(rosidl_runtime_c__boolean__Sequence*) @nogc nothrow;
        /** See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(byte) */
        bool rosidl_runtime_c__byte__Sequence__init(rosidl_runtime_c__octet__Sequence*, c_ulong) @nogc nothrow;
        /** See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(byte) */
        void rosidl_runtime_c__byte__Sequence__fini(rosidl_runtime_c__octet__Sequence*) @nogc nothrow;
        /** See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(float32) */
        bool rosidl_runtime_c__float32__Sequence__init(rosidl_runtime_c__float__Sequence*, c_ulong) @nogc nothrow;
        /** See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(float32) */
        void rosidl_runtime_c__float32__Sequence__fini(rosidl_runtime_c__float__Sequence*) @nogc nothrow;
        /** See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(float64) */
        bool rosidl_runtime_c__float64__Sequence__init(rosidl_runtime_c__double__Sequence*,
                c_ulong) @nogc nothrow;
        /** See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(float64) */
        void rosidl_runtime_c__float64__Sequence__fini(rosidl_runtime_c__double__Sequence*) @nogc nothrow;

        struct rosidl_runtime_c__Sequence__bound
        {
            /// String identifier for the type_support.
            const(char)* typesupport_identifier;
            /// Pointer to type support handle function
            const(void)* data;

            const(rosidl_runtime_c__Sequence__bound)* function(
                    const(rosidl_runtime_c__Sequence__bound)*, const(char)*) func;
        }

        alias rosidl_runtime_c__bound_handle_function = const(rosidl_runtime_c__Sequence__bound)* function(
                const(rosidl_runtime_c__Sequence__bound)*, const(char)*);
        /// Get the message bounds handle specific to this identifier.
        /**
 * The handle's sequence bound is simply returned or if the parameters are NULL then an assert
 * will happen.
 *
 * \param handle Handle to service type support
 * \param identifier The identifier to get the handle for
 * \return The associated sequence bound handle function.
 */
        const(rosidl_runtime_c__Sequence__bound)* get_sequence_bound_handle(
                const(rosidl_runtime_c__Sequence__bound)*, const(char)*) @nogc nothrow;
        /// Get the message bounds handle function specific to this identifier.
        /**
 * If the identifier is the same as this handle function's identifier the handle is simply returned
 * or if the parameters are NULL then an assert will happen.
 *
 * \param handle Handle to service type support
 * \param identifier The identifier to get the handle function for
 * \return if the identifier match's the handle's identifier then the handle's function
 *   is returned.
 */
        const(rosidl_runtime_c__Sequence__bound)* get_sequence_bound_handle_function(
                const(rosidl_runtime_c__Sequence__bound)*, const(char)*) @nogc nothrow;
        /// Contains rosidl service type support data
        struct rosidl_service_type_support_t
        {
            /// String identifier for the type_support.
            const(char)* typesupport_identifier;
            /// Pointer to the service type support library
            const(void)* data;
            /// Pointer to the service type support handler function
            const(rosidl_service_type_support_t)* function(const(rosidl_service_type_support_t)*,
                    const(char)*) func;
        }

        alias rosidl_service_typesupport_handle_function = const(rosidl_service_type_support_t)* function(
                const(rosidl_service_type_support_t)*, const(char)*);
        /// Get the service type support handle specific to this identifier.
        /**
 * The handle's message typesupport identifier function is returned or if the parameters are NULL
 * then an assert will happen.
 *
 * \param handle Handle to service type support
 * \param identifier The typesupport identifier to get the handle function for
 * \return The associated service typesupport handle function.
 */
        const(rosidl_service_type_support_t)* get_service_typesupport_handle(
                const(rosidl_service_type_support_t)*, const(char)*) @nogc nothrow;
        /// Get the service type support handle function specific to this identifier.
        /**
* If the identifier is the same as this handle's typesupport_identifier the handle is simply
* returned or if the parameters are NULL then an assert will happen.
 *
 * \param handle Handle to service type support
 * \param identifier The typesupport identifier to get the handle function for
 * \return if the identifier match's the handle's identifier then the handle's function
 *   is returned.
 */
        const(rosidl_service_type_support_t)* get_service_typesupport_handle_function(
                const(rosidl_service_type_support_t)*, const(char)*) @nogc nothrow;
        /// An array of 8-bit characters terminated by a null byte.
        struct rosidl_runtime_c__String
        {
            /// The pointer to the first character, the sequence ends with a null byte.
            char* data;
            /// The length of the string (excluding the null byte).
            c_ulong size;
            /// The capacity represents the number of allocated bytes (including the null byte).
            c_ulong capacity;
        }

        struct rosidl_runtime_c__String__Sequence
        {

            rosidl_runtime_c__String* data;

            c_ulong size;

            c_ulong capacity;
        }
        /// Upper boundary for #rosidl_runtime_c__String or #rosidl_runtime_c__U16String.
        struct rosidl_runtime_c__String__bound
        {
            /// The number of characters in the string (excluding the null character).
            c_ulong bound;
        }

        alias _Float64x = real;
        /// Initialize a rosidl_runtime_c__String structure.
        bool rosidl_runtime_c__String__init(rosidl_runtime_c__String*) @nogc nothrow;
        /// Deallocate the memory of the rosidl_runtime_c__String structure.
        void rosidl_runtime_c__String__fini(rosidl_runtime_c__String*) @nogc nothrow;
        /// Assign the c string pointer of n characters to the rosidl_runtime_c__String structure.
        bool rosidl_runtime_c__String__assignn(rosidl_runtime_c__String*, const(char)*, c_ulong) @nogc nothrow;
        /// Assign the c string pointer to the rosidl_runtime_c__String structure.
        bool rosidl_runtime_c__String__assign(rosidl_runtime_c__String*, const(char)*) @nogc nothrow;
        /// Initialize a rosidl_runtime_c__String__Sequence__init structure.
        bool rosidl_runtime_c__String__Sequence__init(rosidl_runtime_c__String__Sequence*, c_ulong) @nogc nothrow;
        /// Deallocate the memory of the string sequence structure.
        void rosidl_runtime_c__String__Sequence__fini(rosidl_runtime_c__String__Sequence*) @nogc nothrow;
        /// Create a rosidl_runtime_c__String__Sequence structure with a specific size.
        rosidl_runtime_c__String__Sequence* rosidl_runtime_c__String__Sequence__create(c_ulong) @nogc nothrow;
        /// Destroy a rosidl_runtime_c__String__Sequence structure.
        void rosidl_runtime_c__String__Sequence__destroy(rosidl_runtime_c__String__Sequence*) @nogc nothrow;
        /// An array of 16-bit characters terminated by a null character.
        struct rosidl_runtime_c__U16String
        {
            /// The pointer to the first character, the sequence ends with a null character.
            ushort* data;
            /// The length of the u16string (excluding the null character).
            c_ulong size;
            /// The capacity represents the number of allocated characters (including the null character).
            c_ulong capacity;
        }

        struct rosidl_runtime_c__U16String__Sequence
        {

            rosidl_runtime_c__U16String* data;

            c_ulong size;

            c_ulong capacity;
        }
        /// Initialize a rosidl_runtime_c__U16String structure.
        bool rosidl_runtime_c__U16String__init(rosidl_runtime_c__U16String*) @nogc nothrow;
        /// Deallocate the memory of the rosidl_runtime_c__U16String structure.
        void rosidl_runtime_c__U16String__fini(rosidl_runtime_c__U16String*) @nogc nothrow;
        /// Assign the uint16_t value of n characters to the rosidl_runtime_c__U16String structure.
        bool rosidl_runtime_c__U16String__assignn(rosidl_runtime_c__U16String*,
                const(ushort)*, c_ulong) @nogc nothrow;
        /// Assign the c string pointer value of n characters to the rosidl_runtime_c__U16String structure.
        bool rosidl_runtime_c__U16String__assignn_from_char(rosidl_runtime_c__U16String*,
                const(char)*, c_ulong) @nogc nothrow;
        /// Assign the uint16_t pointer to the rosidl_runtime_c__U16String structure.
        bool rosidl_runtime_c__U16String__assign(rosidl_runtime_c__U16String*, const(ushort)*) @nogc nothrow;
        /// Get the length of the uint16_t pointer.
        c_ulong rosidl_runtime_c__U16String__len(const(ushort)*) @nogc nothrow;
        /// Resize the uint16_t pointer.
        bool rosidl_runtime_c__U16String__resize(rosidl_runtime_c__U16String*, c_ulong) @nogc nothrow;
        /// Initialize a U16 string sequence structure.
        bool rosidl_runtime_c__U16String__Sequence__init(
                rosidl_runtime_c__U16String__Sequence*, c_ulong) @nogc nothrow;
        /// Deallocate the memory of the string sequence structure.
        void rosidl_runtime_c__U16String__Sequence__fini(rosidl_runtime_c__U16String__Sequence*) @nogc nothrow;
        /// Create a U16 string sequence structure with a specific size.
        rosidl_runtime_c__U16String__Sequence* rosidl_runtime_c__U16String__Sequence__create(
                c_ulong) @nogc nothrow;
        /// Destroy a U16 string sequence structure.
        void rosidl_runtime_c__U16String__Sequence__destroy(rosidl_runtime_c__U16String__Sequence*) @nogc nothrow;

        alias _Float32x = double;

        alias _Float64 = double;

        alias _Float32 = float;
        pragma(mangle, "alloca") void* alloca_(c_ulong) @nogc nothrow;

        void __assert_fail(const(char)*, const(char)*, uint, const(char)*) @nogc nothrow;

        void __assert_perror_fail(int, const(char)*, uint, const(char)*) @nogc nothrow;

        void __assert(const(char)*, const(char)*, int) @nogc nothrow;

        static c_ulong __bswap_64(c_ulong) @nogc nothrow;

        static uint __bswap_32(uint) @nogc nothrow;

        static ushort __bswap_16(ushort) @nogc nothrow;

        int strncasecmp_l(const(char)*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;

        int strcasecmp_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;

        int strncasecmp(const(char)*, const(char)*, c_ulong) @nogc nothrow;

        alias int_least8_t = byte;

        alias int_least16_t = short;

        alias int_least32_t = int;

        alias int_least64_t = c_long;

        alias uint_least8_t = ubyte;

        alias uint_least16_t = ushort;

        alias uint_least32_t = uint;

        alias uint_least64_t = c_ulong;

        alias int_fast8_t = byte;

        alias int_fast16_t = c_long;

        alias int_fast32_t = c_long;

        alias int_fast64_t = c_long;

        alias uint_fast8_t = ubyte;

        alias uint_fast16_t = c_ulong;

        alias uint_fast32_t = c_ulong;

        alias uint_fast64_t = c_ulong;

        alias intptr_t = c_long;

        alias uintptr_t = c_ulong;

        alias intmax_t = c_long;

        alias uintmax_t = c_ulong;

        int strcasecmp(const(char)*, const(char)*) @nogc nothrow;

        int ffsll(long) @nogc nothrow;

        int ffsl(c_long) @nogc nothrow;

        int ffs(int) @nogc nothrow;

        char* rindex(const(char)*, int) @nogc nothrow;

        char* index(const(char)*, int) @nogc nothrow;

        void bzero(void*, c_ulong) @nogc nothrow;

        void bcopy(const(void)*, void*, c_ulong) @nogc nothrow;

        int bcmp(const(void)*, const(void)*, c_ulong) @nogc nothrow;

        char* stpncpy(char*, const(char)*, c_ulong) @nogc nothrow;

        char* __stpncpy(char*, const(char)*, c_ulong) @nogc nothrow;

        char* stpcpy(char*, const(char)*) @nogc nothrow;

        char* __stpcpy(char*, const(char)*) @nogc nothrow;

        char* strsignal(int) @nogc nothrow;

        char* strsep(char**, const(char)*) @nogc nothrow;

        void explicit_bzero(void*, c_ulong) @nogc nothrow;

        char* strerror_l(int, __locale_struct*) @nogc nothrow;

        alias off_t = c_long;

        alias ssize_t = c_long;

        int strerror_r(int, char*, c_ulong) @nogc nothrow;

        alias fpos_t = _G_fpos_t;

        char* strerror(int) @nogc nothrow;

        c_ulong strnlen(const(char)*, c_ulong) @nogc nothrow;

        extern __gshared _IO_FILE* stdin;

        extern __gshared _IO_FILE* stdout;

        extern __gshared _IO_FILE* stderr;

        int remove(const(char)*) @nogc nothrow;

        int rename(const(char)*, const(char)*) @nogc nothrow;

        int renameat(int, const(char)*, int, const(char)*) @nogc nothrow;

        _IO_FILE* tmpfile() @nogc nothrow;

        char* tmpnam(char*) @nogc nothrow;

        char* tmpnam_r(char*) @nogc nothrow;

        char* tempnam(const(char)*, const(char)*) @nogc nothrow;

        int fclose(_IO_FILE*) @nogc nothrow;

        int fflush(_IO_FILE*) @nogc nothrow;

        int fflush_unlocked(_IO_FILE*) @nogc nothrow;

        _IO_FILE* fopen(const(char)*, const(char)*) @nogc nothrow;

        _IO_FILE* freopen(const(char)*, const(char)*, _IO_FILE*) @nogc nothrow;

        _IO_FILE* fdopen(int, const(char)*) @nogc nothrow;

        _IO_FILE* fmemopen(void*, c_ulong, const(char)*) @nogc nothrow;

        _IO_FILE* open_memstream(char**, c_ulong*) @nogc nothrow;

        void setbuf(_IO_FILE*, char*) @nogc nothrow;

        int setvbuf(_IO_FILE*, char*, int, c_ulong) @nogc nothrow;

        void setbuffer(_IO_FILE*, char*, c_ulong) @nogc nothrow;

        void setlinebuf(_IO_FILE*) @nogc nothrow;

        int fprintf(_IO_FILE*, const(char)*, ...) @nogc nothrow;

        int printf(const(char)*, ...) @nogc nothrow;

        int sprintf(char*, const(char)*, ...) @nogc nothrow;

        int vfprintf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;

        int vprintf(const(char)*, va_list*) @nogc nothrow;

        int vsprintf(char*, const(char)*, va_list*) @nogc nothrow;

        int snprintf(char*, c_ulong, const(char)*, ...) @nogc nothrow;

        int vsnprintf(char*, c_ulong, const(char)*, va_list*) @nogc nothrow;

        int vdprintf(int, const(char)*, va_list*) @nogc nothrow;

        int dprintf(int, const(char)*, ...) @nogc nothrow;

        int fscanf(_IO_FILE*, const(char)*, ...) @nogc nothrow;

        int scanf(const(char)*, ...) @nogc nothrow;

        int sscanf(const(char)*, const(char)*, ...) @nogc nothrow;

        int vfscanf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;

        int vscanf(const(char)*, va_list*) @nogc nothrow;

        int vsscanf(const(char)*, const(char)*, va_list*) @nogc nothrow;

        int fgetc(_IO_FILE*) @nogc nothrow;

        int getc(_IO_FILE*) @nogc nothrow;

        int getchar() @nogc nothrow;

        int getc_unlocked(_IO_FILE*) @nogc nothrow;

        int getchar_unlocked() @nogc nothrow;

        int fgetc_unlocked(_IO_FILE*) @nogc nothrow;

        int fputc(int, _IO_FILE*) @nogc nothrow;

        int putc(int, _IO_FILE*) @nogc nothrow;

        int putchar(int) @nogc nothrow;

        int fputc_unlocked(int, _IO_FILE*) @nogc nothrow;

        int putc_unlocked(int, _IO_FILE*) @nogc nothrow;

        int putchar_unlocked(int) @nogc nothrow;

        int getw(_IO_FILE*) @nogc nothrow;

        int putw(int, _IO_FILE*) @nogc nothrow;

        char* fgets(char*, int, _IO_FILE*) @nogc nothrow;

        c_long __getdelim(char**, c_ulong*, int, _IO_FILE*) @nogc nothrow;

        c_long getdelim(char**, c_ulong*, int, _IO_FILE*) @nogc nothrow;

        c_long getline(char**, c_ulong*, _IO_FILE*) @nogc nothrow;

        int fputs(const(char)*, _IO_FILE*) @nogc nothrow;

        int puts(const(char)*) @nogc nothrow;

        int ungetc(int, _IO_FILE*) @nogc nothrow;

        c_ulong fread(void*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;

        c_ulong fwrite(const(void)*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;

        c_ulong fread_unlocked(void*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;

        c_ulong fwrite_unlocked(const(void)*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;

        int fseek(_IO_FILE*, c_long, int) @nogc nothrow;

        c_long ftell(_IO_FILE*) @nogc nothrow;

        void rewind(_IO_FILE*) @nogc nothrow;

        int fseeko(_IO_FILE*, c_long, int) @nogc nothrow;

        c_long ftello(_IO_FILE*) @nogc nothrow;

        int fgetpos(_IO_FILE*, _G_fpos_t*) @nogc nothrow;

        int fsetpos(_IO_FILE*, const(_G_fpos_t)*) @nogc nothrow;

        void clearerr(_IO_FILE*) @nogc nothrow;

        int feof(_IO_FILE*) @nogc nothrow;

        int ferror(_IO_FILE*) @nogc nothrow;

        void clearerr_unlocked(_IO_FILE*) @nogc nothrow;

        int feof_unlocked(_IO_FILE*) @nogc nothrow;

        int ferror_unlocked(_IO_FILE*) @nogc nothrow;

        void perror(const(char)*) @nogc nothrow;

        int fileno(_IO_FILE*) @nogc nothrow;

        int fileno_unlocked(_IO_FILE*) @nogc nothrow;

        _IO_FILE* popen(const(char)*, const(char)*) @nogc nothrow;

        int pclose(_IO_FILE*) @nogc nothrow;

        char* ctermid(char*) @nogc nothrow;

        void flockfile(_IO_FILE*) @nogc nothrow;

        int ftrylockfile(_IO_FILE*) @nogc nothrow;

        void funlockfile(_IO_FILE*) @nogc nothrow;

        int __uflow(_IO_FILE*) @nogc nothrow;

        int __overflow(_IO_FILE*, int) @nogc nothrow;

        c_ulong strlen(const(char)*) @nogc nothrow;

        char* strtok_r(char*, const(char)*, char**) @nogc nothrow;

        char* __strtok_r(char*, const(char)*, char**) @nogc nothrow;

        char* strtok(char*, const(char)*) @nogc nothrow;

        struct div_t
        {

            int quot;

            int rem;
        }

        struct ldiv_t
        {

            c_long quot;

            c_long rem;
        }

        struct lldiv_t
        {

            long quot;

            long rem;
        }

        char* strstr(const(char)*, const(char)*) @nogc nothrow;

        c_ulong __ctype_get_mb_cur_max() @nogc nothrow;

        double atof(const(char)*) @nogc nothrow;

        int atoi(const(char)*) @nogc nothrow;

        c_long atol(const(char)*) @nogc nothrow;

        long atoll(const(char)*) @nogc nothrow;

        double strtod(const(char)*, char**) @nogc nothrow;

        float strtof(const(char)*, char**) @nogc nothrow;

        real strtold(const(char)*, char**) @nogc nothrow;

        c_long strtol(const(char)*, char**, int) @nogc nothrow;

        c_ulong strtoul(const(char)*, char**, int) @nogc nothrow;

        long strtoq(const(char)*, char**, int) @nogc nothrow;

        ulong strtouq(const(char)*, char**, int) @nogc nothrow;

        long strtoll(const(char)*, char**, int) @nogc nothrow;

        ulong strtoull(const(char)*, char**, int) @nogc nothrow;

        char* l64a(c_long) @nogc nothrow;

        c_long a64l(const(char)*) @nogc nothrow;

        c_long random() @nogc nothrow;

        void srandom(uint) @nogc nothrow;

        char* initstate(uint, char*, c_ulong) @nogc nothrow;

        char* setstate(char*) @nogc nothrow;

        struct random_data
        {

            int* fptr;

            int* rptr;

            int* state;

            int rand_type;

            int rand_deg;

            int rand_sep;

            int* end_ptr;
        }

        int random_r(random_data*, int*) @nogc nothrow;

        int srandom_r(uint, random_data*) @nogc nothrow;

        int initstate_r(uint, char*, c_ulong, random_data*) @nogc nothrow;

        int setstate_r(char*, random_data*) @nogc nothrow;

        int rand() @nogc nothrow;

        void srand(uint) @nogc nothrow;

        int rand_r(uint*) @nogc nothrow;

        double drand48() @nogc nothrow;

        double erand48(ushort*) @nogc nothrow;

        c_long lrand48() @nogc nothrow;

        c_long nrand48(ushort*) @nogc nothrow;

        c_long mrand48() @nogc nothrow;

        c_long jrand48(ushort*) @nogc nothrow;

        void srand48(c_long) @nogc nothrow;

        ushort* seed48(ushort*) @nogc nothrow;

        void lcong48(ushort*) @nogc nothrow;

        struct drand48_data
        {

            ushort[3] __x;

            ushort[3] __old_x;

            ushort __c;

            ushort __init;

            ulong __a;
        }

        int drand48_r(drand48_data*, double*) @nogc nothrow;

        int erand48_r(ushort*, drand48_data*, double*) @nogc nothrow;

        int lrand48_r(drand48_data*, c_long*) @nogc nothrow;

        int nrand48_r(ushort*, drand48_data*, c_long*) @nogc nothrow;

        int mrand48_r(drand48_data*, c_long*) @nogc nothrow;

        int jrand48_r(ushort*, drand48_data*, c_long*) @nogc nothrow;

        int srand48_r(c_long, drand48_data*) @nogc nothrow;

        int seed48_r(ushort*, drand48_data*) @nogc nothrow;

        int lcong48_r(ushort*, drand48_data*) @nogc nothrow;

        void* malloc(c_ulong) @nogc nothrow;

        void* calloc(c_ulong, c_ulong) @nogc nothrow;

        void* realloc(void*, c_ulong) @nogc nothrow;

        void* reallocarray(void*, c_ulong, c_ulong) @nogc nothrow;

        void free(void*) @nogc nothrow;

        void* valloc(c_ulong) @nogc nothrow;

        int posix_memalign(void**, c_ulong, c_ulong) @nogc nothrow;

        void* aligned_alloc(c_ulong, c_ulong) @nogc nothrow;

        void abort() @nogc nothrow;

        int atexit(void function()) @nogc nothrow;

        int at_quick_exit(void function()) @nogc nothrow;

        int on_exit(void function(int, void*), void*) @nogc nothrow;

        void exit(int) @nogc nothrow;

        void quick_exit(int) @nogc nothrow;

        void _Exit(int) @nogc nothrow;

        char* getenv(const(char)*) @nogc nothrow;

        int putenv(char*) @nogc nothrow;

        int setenv(const(char)*, const(char)*, int) @nogc nothrow;

        int unsetenv(const(char)*) @nogc nothrow;

        int clearenv() @nogc nothrow;

        char* mktemp(char*) @nogc nothrow;

        int mkstemp(char*) @nogc nothrow;

        int mkstemps(char*, int) @nogc nothrow;

        char* mkdtemp(char*) @nogc nothrow;

        int system(const(char)*) @nogc nothrow;

        char* realpath(const(char)*, char*) @nogc nothrow;
        alias __compar_fn_t = int function(const(void)*, const(void)*);

        void* bsearch(const(void)*, const(void)*, c_ulong, c_ulong,
                int function(const(void)*, const(void)*)) @nogc nothrow;

        void qsort(void*, c_ulong, c_ulong, int function(const(void)*, const(void)*)) @nogc nothrow;

        int abs(int) @nogc nothrow;

        c_long labs(c_long) @nogc nothrow;

        long llabs(long) @nogc nothrow;

        div_t div(int, int) @nogc nothrow;

        ldiv_t ldiv(c_long, c_long) @nogc nothrow;

        lldiv_t lldiv(long, long) @nogc nothrow;

        char* ecvt(double, int, int*, int*) @nogc nothrow;

        char* fcvt(double, int, int*, int*) @nogc nothrow;

        char* gcvt(double, int, char*) @nogc nothrow;

        char* qecvt(real, int, int*, int*) @nogc nothrow;

        char* qfcvt(real, int, int*, int*) @nogc nothrow;

        char* qgcvt(real, int, char*) @nogc nothrow;

        int ecvt_r(double, int, int*, int*, char*, c_ulong) @nogc nothrow;

        int fcvt_r(double, int, int*, int*, char*, c_ulong) @nogc nothrow;

        int qecvt_r(real, int, int*, int*, char*, c_ulong) @nogc nothrow;

        int qfcvt_r(real, int, int*, int*, char*, c_ulong) @nogc nothrow;

        int mblen(const(char)*, c_ulong) @nogc nothrow;

        int mbtowc(int*, const(char)*, c_ulong) @nogc nothrow;

        int wctomb(char*, int) @nogc nothrow;

        c_ulong mbstowcs(int*, const(char)*, c_ulong) @nogc nothrow;

        c_ulong wcstombs(char*, const(int)*, c_ulong) @nogc nothrow;

        int rpmatch(const(char)*) @nogc nothrow;

        int getsubopt(char**, char**, char**) @nogc nothrow;

        int getloadavg(double*, int) @nogc nothrow;

        char* strpbrk(const(char)*, const(char)*) @nogc nothrow;

        void* memcpy(void*, const(void)*, c_ulong) @nogc nothrow;

        void* memmove(void*, const(void)*, c_ulong) @nogc nothrow;

        void* memccpy(void*, const(void)*, int, c_ulong) @nogc nothrow;

        void* memset(void*, int, c_ulong) @nogc nothrow;

        int memcmp(const(void)*, const(void)*, c_ulong) @nogc nothrow;

        void* memchr(const(void)*, int, c_ulong) @nogc nothrow;

        char* strcpy(char*, const(char)*) @nogc nothrow;

        char* strncpy(char*, const(char)*, c_ulong) @nogc nothrow;

        char* strcat(char*, const(char)*) @nogc nothrow;

        char* strncat(char*, const(char)*, c_ulong) @nogc nothrow;

        int strcmp(const(char)*, const(char)*) @nogc nothrow;

        int strncmp(const(char)*, const(char)*, c_ulong) @nogc nothrow;

        int strcoll(const(char)*, const(char)*) @nogc nothrow;

        c_ulong strxfrm(char*, const(char)*, c_ulong) @nogc nothrow;

        int strcoll_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;

        c_ulong strxfrm_l(char*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;

        char* strdup(const(char)*) @nogc nothrow;

        char* strndup(const(char)*, c_ulong) @nogc nothrow;

        char* strchr(const(char)*, int) @nogc nothrow;

        char* strrchr(const(char)*, int) @nogc nothrow;

        c_ulong strcspn(const(char)*, const(char)*) @nogc nothrow;

        c_ulong strspn(const(char)*, const(char)*) @nogc nothrow;
        static if (!is(typeof(_STRING_H)))
        {
            private enum enumMixinStr__STRING_H = `enum _STRING_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__STRING_H); })))
            {
                mixin(enumMixinStr__STRING_H);
            }
        }

        static if (!is(typeof(MB_CUR_MAX)))
        {
            private enum enumMixinStr_MB_CUR_MAX = `enum MB_CUR_MAX = ( __ctype_get_mb_cur_max ( ) );`;
            static if (is(typeof({ mixin(enumMixinStr_MB_CUR_MAX); })))
            {
                mixin(enumMixinStr_MB_CUR_MAX);
            }
        }

        static if (!is(typeof(EXIT_SUCCESS)))
        {
            private enum enumMixinStr_EXIT_SUCCESS = `enum EXIT_SUCCESS = 0;`;
            static if (is(typeof({ mixin(enumMixinStr_EXIT_SUCCESS); })))
            {
                mixin(enumMixinStr_EXIT_SUCCESS);
            }
        }

        static if (!is(typeof(EXIT_FAILURE)))
        {
            private enum enumMixinStr_EXIT_FAILURE = `enum EXIT_FAILURE = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_EXIT_FAILURE); })))
            {
                mixin(enumMixinStr_EXIT_FAILURE);
            }
        }

        static if (!is(typeof(RAND_MAX)))
        {
            private enum enumMixinStr_RAND_MAX = `enum RAND_MAX = 2147483647;`;
            static if (is(typeof({ mixin(enumMixinStr_RAND_MAX); })))
            {
                mixin(enumMixinStr_RAND_MAX);
            }
        }

        static if (!is(typeof(__lldiv_t_defined)))
        {
            private enum enumMixinStr___lldiv_t_defined = `enum __lldiv_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___lldiv_t_defined); })))
            {
                mixin(enumMixinStr___lldiv_t_defined);
            }
        }

        static if (!is(typeof(__ldiv_t_defined)))
        {
            private enum enumMixinStr___ldiv_t_defined = `enum __ldiv_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___ldiv_t_defined); })))
            {
                mixin(enumMixinStr___ldiv_t_defined);
            }
        }
        static if (!is(typeof(_STDLIB_H)))
        {
            private enum enumMixinStr__STDLIB_H = `enum _STDLIB_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__STDLIB_H); })))
            {
                mixin(enumMixinStr__STDLIB_H);
            }
        }

        static if (!is(typeof(stderr)))
        {
            private enum enumMixinStr_stderr = `enum stderr = stderr;`;
            static if (is(typeof({ mixin(enumMixinStr_stderr); })))
            {
                mixin(enumMixinStr_stderr);
            }
        }

        static if (!is(typeof(stdout)))
        {
            private enum enumMixinStr_stdout = `enum stdout = stdout;`;
            static if (is(typeof({ mixin(enumMixinStr_stdout); })))
            {
                mixin(enumMixinStr_stdout);
            }
        }

        static if (!is(typeof(stdin)))
        {
            private enum enumMixinStr_stdin = `enum stdin = stdin;`;
            static if (is(typeof({ mixin(enumMixinStr_stdin); })))
            {
                mixin(enumMixinStr_stdin);
            }
        }

        static if (!is(typeof(P_tmpdir)))
        {
            private enum enumMixinStr_P_tmpdir = `enum P_tmpdir = "/tmp";`;
            static if (is(typeof({ mixin(enumMixinStr_P_tmpdir); })))
            {
                mixin(enumMixinStr_P_tmpdir);
            }
        }

        static if (!is(typeof(SEEK_END)))
        {
            private enum enumMixinStr_SEEK_END = `enum SEEK_END = 2;`;
            static if (is(typeof({ mixin(enumMixinStr_SEEK_END); })))
            {
                mixin(enumMixinStr_SEEK_END);
            }
        }

        static if (!is(typeof(SEEK_CUR)))
        {
            private enum enumMixinStr_SEEK_CUR = `enum SEEK_CUR = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_SEEK_CUR); })))
            {
                mixin(enumMixinStr_SEEK_CUR);
            }
        }

        static if (!is(typeof(SEEK_SET)))
        {
            private enum enumMixinStr_SEEK_SET = `enum SEEK_SET = 0;`;
            static if (is(typeof({ mixin(enumMixinStr_SEEK_SET); })))
            {
                mixin(enumMixinStr_SEEK_SET);
            }
        }

        static if (!is(typeof(EOF)))
        {
            private enum enumMixinStr_EOF = `enum EOF = ( - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_EOF); })))
            {
                mixin(enumMixinStr_EOF);
            }
        }

        static if (!is(typeof(BUFSIZ)))
        {
            private enum enumMixinStr_BUFSIZ = `enum BUFSIZ = 8192;`;
            static if (is(typeof({ mixin(enumMixinStr_BUFSIZ); })))
            {
                mixin(enumMixinStr_BUFSIZ);
            }
        }

        static if (!is(typeof(_IONBF)))
        {
            private enum enumMixinStr__IONBF = `enum _IONBF = 2;`;
            static if (is(typeof({ mixin(enumMixinStr__IONBF); })))
            {
                mixin(enumMixinStr__IONBF);
            }
        }

        static if (!is(typeof(_IOLBF)))
        {
            private enum enumMixinStr__IOLBF = `enum _IOLBF = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__IOLBF); })))
            {
                mixin(enumMixinStr__IOLBF);
            }
        }

        static if (!is(typeof(_IOFBF)))
        {
            private enum enumMixinStr__IOFBF = `enum _IOFBF = 0;`;
            static if (is(typeof({ mixin(enumMixinStr__IOFBF); })))
            {
                mixin(enumMixinStr__IOFBF);
            }
        }
        static if (!is(typeof(_STDIO_H)))
        {
            private enum enumMixinStr__STDIO_H = `enum _STDIO_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__STDIO_H); })))
            {
                mixin(enumMixinStr__STDIO_H);
            }
        }
        static if (!is(typeof(WINT_MAX)))
        {
            private enum enumMixinStr_WINT_MAX = `enum WINT_MAX = ( 4294967295u );`;
            static if (is(typeof({ mixin(enumMixinStr_WINT_MAX); })))
            {
                mixin(enumMixinStr_WINT_MAX);
            }
        }

        static if (!is(typeof(WINT_MIN)))
        {
            private enum enumMixinStr_WINT_MIN = `enum WINT_MIN = ( 0u );`;
            static if (is(typeof({ mixin(enumMixinStr_WINT_MIN); })))
            {
                mixin(enumMixinStr_WINT_MIN);
            }
        }

        static if (!is(typeof(WCHAR_MAX)))
        {
            private enum enumMixinStr_WCHAR_MAX = `enum WCHAR_MAX = __WCHAR_MAX;`;
            static if (is(typeof({ mixin(enumMixinStr_WCHAR_MAX); })))
            {
                mixin(enumMixinStr_WCHAR_MAX);
            }
        }

        static if (!is(typeof(WCHAR_MIN)))
        {
            private enum enumMixinStr_WCHAR_MIN = `enum WCHAR_MIN = __WCHAR_MIN;`;
            static if (is(typeof({ mixin(enumMixinStr_WCHAR_MIN); })))
            {
                mixin(enumMixinStr_WCHAR_MIN);
            }
        }

        static if (!is(typeof(SIZE_MAX)))
        {
            private enum enumMixinStr_SIZE_MAX = `enum SIZE_MAX = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_SIZE_MAX); })))
            {
                mixin(enumMixinStr_SIZE_MAX);
            }
        }

        static if (!is(typeof(SIG_ATOMIC_MAX)))
        {
            private enum enumMixinStr_SIG_ATOMIC_MAX = `enum SIG_ATOMIC_MAX = ( 2147483647 );`;
            static if (is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MAX); })))
            {
                mixin(enumMixinStr_SIG_ATOMIC_MAX);
            }
        }

        static if (!is(typeof(SIG_ATOMIC_MIN)))
        {
            private enum enumMixinStr_SIG_ATOMIC_MIN = `enum SIG_ATOMIC_MIN = ( - 2147483647 - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MIN); })))
            {
                mixin(enumMixinStr_SIG_ATOMIC_MIN);
            }
        }

        static if (!is(typeof(PTRDIFF_MAX)))
        {
            private enum enumMixinStr_PTRDIFF_MAX = `enum PTRDIFF_MAX = ( 9223372036854775807L );`;
            static if (is(typeof({ mixin(enumMixinStr_PTRDIFF_MAX); })))
            {
                mixin(enumMixinStr_PTRDIFF_MAX);
            }
        }

        static if (!is(typeof(PTRDIFF_MIN)))
        {
            private enum enumMixinStr_PTRDIFF_MIN = `enum PTRDIFF_MIN = ( - 9223372036854775807L - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_PTRDIFF_MIN); })))
            {
                mixin(enumMixinStr_PTRDIFF_MIN);
            }
        }

        static if (!is(typeof(UINTMAX_MAX)))
        {
            private enum enumMixinStr_UINTMAX_MAX = `enum UINTMAX_MAX = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_UINTMAX_MAX); })))
            {
                mixin(enumMixinStr_UINTMAX_MAX);
            }
        }

        static if (!is(typeof(INTMAX_MAX)))
        {
            private enum enumMixinStr_INTMAX_MAX = `enum INTMAX_MAX = ( 9223372036854775807L );`;
            static if (is(typeof({ mixin(enumMixinStr_INTMAX_MAX); })))
            {
                mixin(enumMixinStr_INTMAX_MAX);
            }
        }

        static if (!is(typeof(INTMAX_MIN)))
        {
            private enum enumMixinStr_INTMAX_MIN = `enum INTMAX_MIN = ( - 9223372036854775807L - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INTMAX_MIN); })))
            {
                mixin(enumMixinStr_INTMAX_MIN);
            }
        }

        static if (!is(typeof(UINTPTR_MAX)))
        {
            private enum enumMixinStr_UINTPTR_MAX = `enum UINTPTR_MAX = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_UINTPTR_MAX); })))
            {
                mixin(enumMixinStr_UINTPTR_MAX);
            }
        }

        static if (!is(typeof(INTPTR_MAX)))
        {
            private enum enumMixinStr_INTPTR_MAX = `enum INTPTR_MAX = ( 9223372036854775807L );`;
            static if (is(typeof({ mixin(enumMixinStr_INTPTR_MAX); })))
            {
                mixin(enumMixinStr_INTPTR_MAX);
            }
        }

        static if (!is(typeof(INTPTR_MIN)))
        {
            private enum enumMixinStr_INTPTR_MIN = `enum INTPTR_MIN = ( - 9223372036854775807L - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INTPTR_MIN); })))
            {
                mixin(enumMixinStr_INTPTR_MIN);
            }
        }

        static if (!is(typeof(_STRINGS_H)))
        {
            private enum enumMixinStr__STRINGS_H = `enum _STRINGS_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__STRINGS_H); })))
            {
                mixin(enumMixinStr__STRINGS_H);
            }
        }

        static if (!is(typeof(UINT_FAST64_MAX)))
        {
            private enum enumMixinStr_UINT_FAST64_MAX = `enum UINT_FAST64_MAX = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT_FAST64_MAX); })))
            {
                mixin(enumMixinStr_UINT_FAST64_MAX);
            }
        }

        static if (!is(typeof(UINT_FAST32_MAX)))
        {
            private enum enumMixinStr_UINT_FAST32_MAX = `enum UINT_FAST32_MAX = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT_FAST32_MAX); })))
            {
                mixin(enumMixinStr_UINT_FAST32_MAX);
            }
        }

        static if (!is(typeof(UINT_FAST16_MAX)))
        {
            private enum enumMixinStr_UINT_FAST16_MAX = `enum UINT_FAST16_MAX = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT_FAST16_MAX); })))
            {
                mixin(enumMixinStr_UINT_FAST16_MAX);
            }
        }

        static if (!is(typeof(UINT_FAST8_MAX)))
        {
            private enum enumMixinStr_UINT_FAST8_MAX = `enum UINT_FAST8_MAX = ( 255 );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT_FAST8_MAX); })))
            {
                mixin(enumMixinStr_UINT_FAST8_MAX);
            }
        }

        static if (!is(typeof(INT_FAST64_MAX)))
        {
            private enum enumMixinStr_INT_FAST64_MAX = `enum INT_FAST64_MAX = ( 9223372036854775807L );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_FAST64_MAX); })))
            {
                mixin(enumMixinStr_INT_FAST64_MAX);
            }
        }

        static if (!is(typeof(INT_FAST32_MAX)))
        {
            private enum enumMixinStr_INT_FAST32_MAX = `enum INT_FAST32_MAX = ( 9223372036854775807L );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_FAST32_MAX); })))
            {
                mixin(enumMixinStr_INT_FAST32_MAX);
            }
        }

        static if (!is(typeof(INT_FAST16_MAX)))
        {
            private enum enumMixinStr_INT_FAST16_MAX = `enum INT_FAST16_MAX = ( 9223372036854775807L );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_FAST16_MAX); })))
            {
                mixin(enumMixinStr_INT_FAST16_MAX);
            }
        }

        static if (!is(typeof(INT_FAST8_MAX)))
        {
            private enum enumMixinStr_INT_FAST8_MAX = `enum INT_FAST8_MAX = ( 127 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_FAST8_MAX); })))
            {
                mixin(enumMixinStr_INT_FAST8_MAX);
            }
        }

        static if (!is(typeof(INT_FAST64_MIN)))
        {
            private enum enumMixinStr_INT_FAST64_MIN = `enum INT_FAST64_MIN = ( - 9223372036854775807L - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_FAST64_MIN); })))
            {
                mixin(enumMixinStr_INT_FAST64_MIN);
            }
        }

        static if (!is(typeof(INT_FAST32_MIN)))
        {
            private enum enumMixinStr_INT_FAST32_MIN = `enum INT_FAST32_MIN = ( - 9223372036854775807L - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_FAST32_MIN); })))
            {
                mixin(enumMixinStr_INT_FAST32_MIN);
            }
        }

        static if (!is(typeof(INT_FAST16_MIN)))
        {
            private enum enumMixinStr_INT_FAST16_MIN = `enum INT_FAST16_MIN = ( - 9223372036854775807L - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_FAST16_MIN); })))
            {
                mixin(enumMixinStr_INT_FAST16_MIN);
            }
        }

        static if (!is(typeof(INT_FAST8_MIN)))
        {
            private enum enumMixinStr_INT_FAST8_MIN = `enum INT_FAST8_MIN = ( - 128 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_FAST8_MIN); })))
            {
                mixin(enumMixinStr_INT_FAST8_MIN);
            }
        }

        static if (!is(typeof(UINT_LEAST64_MAX)))
        {
            private enum enumMixinStr_UINT_LEAST64_MAX = `enum UINT_LEAST64_MAX = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT_LEAST64_MAX); })))
            {
                mixin(enumMixinStr_UINT_LEAST64_MAX);
            }
        }

        static if (!is(typeof(UINT_LEAST32_MAX)))
        {
            private enum enumMixinStr_UINT_LEAST32_MAX = `enum UINT_LEAST32_MAX = ( 4294967295U );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT_LEAST32_MAX); })))
            {
                mixin(enumMixinStr_UINT_LEAST32_MAX);
            }
        }

        static if (!is(typeof(UINT_LEAST16_MAX)))
        {
            private enum enumMixinStr_UINT_LEAST16_MAX = `enum UINT_LEAST16_MAX = ( 65535 );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT_LEAST16_MAX); })))
            {
                mixin(enumMixinStr_UINT_LEAST16_MAX);
            }
        }

        static if (!is(typeof(UINT_LEAST8_MAX)))
        {
            private enum enumMixinStr_UINT_LEAST8_MAX = `enum UINT_LEAST8_MAX = ( 255 );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT_LEAST8_MAX); })))
            {
                mixin(enumMixinStr_UINT_LEAST8_MAX);
            }
        }

        static if (!is(typeof(INT_LEAST64_MAX)))
        {
            private enum enumMixinStr_INT_LEAST64_MAX = `enum INT_LEAST64_MAX = ( 9223372036854775807L );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_LEAST64_MAX); })))
            {
                mixin(enumMixinStr_INT_LEAST64_MAX);
            }
        }

        static if (!is(typeof(INT_LEAST32_MAX)))
        {
            private enum enumMixinStr_INT_LEAST32_MAX = `enum INT_LEAST32_MAX = ( 2147483647 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_LEAST32_MAX); })))
            {
                mixin(enumMixinStr_INT_LEAST32_MAX);
            }
        }

        static if (!is(typeof(INT_LEAST16_MAX)))
        {
            private enum enumMixinStr_INT_LEAST16_MAX = `enum INT_LEAST16_MAX = ( 32767 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_LEAST16_MAX); })))
            {
                mixin(enumMixinStr_INT_LEAST16_MAX);
            }
        }

        static if (!is(typeof(INT_LEAST8_MAX)))
        {
            private enum enumMixinStr_INT_LEAST8_MAX = `enum INT_LEAST8_MAX = ( 127 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_LEAST8_MAX); })))
            {
                mixin(enumMixinStr_INT_LEAST8_MAX);
            }
        }

        static if (!is(typeof(INT_LEAST64_MIN)))
        {
            private enum enumMixinStr_INT_LEAST64_MIN = `enum INT_LEAST64_MIN = ( - 9223372036854775807L - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_LEAST64_MIN); })))
            {
                mixin(enumMixinStr_INT_LEAST64_MIN);
            }
        }

        static if (!is(typeof(INT_LEAST32_MIN)))
        {
            private enum enumMixinStr_INT_LEAST32_MIN = `enum INT_LEAST32_MIN = ( - 2147483647 - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_LEAST32_MIN); })))
            {
                mixin(enumMixinStr_INT_LEAST32_MIN);
            }
        }

        static if (!is(typeof(INT_LEAST16_MIN)))
        {
            private enum enumMixinStr_INT_LEAST16_MIN = `enum INT_LEAST16_MIN = ( - 32767 - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_LEAST16_MIN); })))
            {
                mixin(enumMixinStr_INT_LEAST16_MIN);
            }
        }

        static if (!is(typeof(INT_LEAST8_MIN)))
        {
            private enum enumMixinStr_INT_LEAST8_MIN = `enum INT_LEAST8_MIN = ( - 128 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT_LEAST8_MIN); })))
            {
                mixin(enumMixinStr_INT_LEAST8_MIN);
            }
        }

        static if (!is(typeof(UINT64_MAX)))
        {
            private enum enumMixinStr_UINT64_MAX = `enum UINT64_MAX = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT64_MAX); })))
            {
                mixin(enumMixinStr_UINT64_MAX);
            }
        }

        static if (!is(typeof(UINT32_MAX)))
        {
            private enum enumMixinStr_UINT32_MAX = `enum UINT32_MAX = ( 4294967295U );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT32_MAX); })))
            {
                mixin(enumMixinStr_UINT32_MAX);
            }
        }

        static if (!is(typeof(UINT16_MAX)))
        {
            private enum enumMixinStr_UINT16_MAX = `enum UINT16_MAX = ( 65535 );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT16_MAX); })))
            {
                mixin(enumMixinStr_UINT16_MAX);
            }
        }

        static if (!is(typeof(UINT8_MAX)))
        {
            private enum enumMixinStr_UINT8_MAX = `enum UINT8_MAX = ( 255 );`;
            static if (is(typeof({ mixin(enumMixinStr_UINT8_MAX); })))
            {
                mixin(enumMixinStr_UINT8_MAX);
            }
        }

        static if (!is(typeof(INT64_MAX)))
        {
            private enum enumMixinStr_INT64_MAX = `enum INT64_MAX = ( 9223372036854775807L );`;
            static if (is(typeof({ mixin(enumMixinStr_INT64_MAX); })))
            {
                mixin(enumMixinStr_INT64_MAX);
            }
        }

        static if (!is(typeof(INT32_MAX)))
        {
            private enum enumMixinStr_INT32_MAX = `enum INT32_MAX = ( 2147483647 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT32_MAX); })))
            {
                mixin(enumMixinStr_INT32_MAX);
            }
        }

        static if (!is(typeof(INT16_MAX)))
        {
            private enum enumMixinStr_INT16_MAX = `enum INT16_MAX = ( 32767 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT16_MAX); })))
            {
                mixin(enumMixinStr_INT16_MAX);
            }
        }

        static if (!is(typeof(INT8_MAX)))
        {
            private enum enumMixinStr_INT8_MAX = `enum INT8_MAX = ( 127 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT8_MAX); })))
            {
                mixin(enumMixinStr_INT8_MAX);
            }
        }

        static if (!is(typeof(INT64_MIN)))
        {
            private enum enumMixinStr_INT64_MIN = `enum INT64_MIN = ( - 9223372036854775807L - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT64_MIN); })))
            {
                mixin(enumMixinStr_INT64_MIN);
            }
        }

        static if (!is(typeof(INT32_MIN)))
        {
            private enum enumMixinStr_INT32_MIN = `enum INT32_MIN = ( - 2147483647 - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT32_MIN); })))
            {
                mixin(enumMixinStr_INT32_MIN);
            }
        }

        static if (!is(typeof(INT16_MIN)))
        {
            private enum enumMixinStr_INT16_MIN = `enum INT16_MIN = ( - 32767 - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT16_MIN); })))
            {
                mixin(enumMixinStr_INT16_MIN);
            }
        }

        static if (!is(typeof(INT8_MIN)))
        {
            private enum enumMixinStr_INT8_MIN = `enum INT8_MIN = ( - 128 );`;
            static if (is(typeof({ mixin(enumMixinStr_INT8_MIN); })))
            {
                mixin(enumMixinStr_INT8_MIN);
            }
        }
        static if (!is(typeof(_STDINT_H)))
        {
            private enum enumMixinStr__STDINT_H = `enum _STDINT_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__STDINT_H); })))
            {
                mixin(enumMixinStr__STDINT_H);
            }
        }

        static if (!is(typeof(_STDC_PREDEF_H)))
        {
            private enum enumMixinStr__STDC_PREDEF_H = `enum _STDC_PREDEF_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__STDC_PREDEF_H); })))
            {
                mixin(enumMixinStr__STDC_PREDEF_H);
            }
        }

        static if (!is(typeof(__GLIBC_MINOR__)))
        {
            private enum enumMixinStr___GLIBC_MINOR__ = `enum __GLIBC_MINOR__ = 31;`;
            static if (is(typeof({ mixin(enumMixinStr___GLIBC_MINOR__); })))
            {
                mixin(enumMixinStr___GLIBC_MINOR__);
            }
        }

        static if (!is(typeof(__GLIBC__)))
        {
            private enum enumMixinStr___GLIBC__ = `enum __GLIBC__ = 2;`;
            static if (is(typeof({ mixin(enumMixinStr___GLIBC__); })))
            {
                mixin(enumMixinStr___GLIBC__);
            }
        }

        static if (!is(typeof(__GNU_LIBRARY__)))
        {
            private enum enumMixinStr___GNU_LIBRARY__ = `enum __GNU_LIBRARY__ = 6;`;
            static if (is(typeof({ mixin(enumMixinStr___GNU_LIBRARY__); })))
            {
                mixin(enumMixinStr___GNU_LIBRARY__);
            }
        }

        static if (!is(typeof(__GLIBC_USE_DEPRECATED_SCANF)))
        {
            private enum enumMixinStr___GLIBC_USE_DEPRECATED_SCANF = `enum __GLIBC_USE_DEPRECATED_SCANF = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF);
                    })))
            {
                mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF);
            }
        }

        static if (!is(typeof(__GLIBC_USE_DEPRECATED_GETS)))
        {
            private enum enumMixinStr___GLIBC_USE_DEPRECATED_GETS = `enum __GLIBC_USE_DEPRECATED_GETS = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
                    })))
            {
                mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
            }
        }

        static if (!is(typeof(__USE_FORTIFY_LEVEL)))
        {
            private enum enumMixinStr___USE_FORTIFY_LEVEL = `enum __USE_FORTIFY_LEVEL = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_FORTIFY_LEVEL); })))
            {
                mixin(enumMixinStr___USE_FORTIFY_LEVEL);
            }
        }

        static if (!is(typeof(__USE_ATFILE)))
        {
            private enum enumMixinStr___USE_ATFILE = `enum __USE_ATFILE = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_ATFILE); })))
            {
                mixin(enumMixinStr___USE_ATFILE);
            }
        }

        static if (!is(typeof(__USE_MISC)))
        {
            private enum enumMixinStr___USE_MISC = `enum __USE_MISC = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_MISC); })))
            {
                mixin(enumMixinStr___USE_MISC);
            }
        }

        static if (!is(typeof(_ATFILE_SOURCE)))
        {
            private enum enumMixinStr__ATFILE_SOURCE = `enum _ATFILE_SOURCE = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__ATFILE_SOURCE); })))
            {
                mixin(enumMixinStr__ATFILE_SOURCE);
            }
        }

        static if (!is(typeof(__USE_XOPEN2K8)))
        {
            private enum enumMixinStr___USE_XOPEN2K8 = `enum __USE_XOPEN2K8 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8); })))
            {
                mixin(enumMixinStr___USE_XOPEN2K8);
            }
        }

        static if (!is(typeof(__USE_ISOC99)))
        {
            private enum enumMixinStr___USE_ISOC99 = `enum __USE_ISOC99 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_ISOC99); })))
            {
                mixin(enumMixinStr___USE_ISOC99);
            }
        }

        static if (!is(typeof(__USE_ISOC95)))
        {
            private enum enumMixinStr___USE_ISOC95 = `enum __USE_ISOC95 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_ISOC95); })))
            {
                mixin(enumMixinStr___USE_ISOC95);
            }
        }

        static if (!is(typeof(__USE_XOPEN2K)))
        {
            private enum enumMixinStr___USE_XOPEN2K = `enum __USE_XOPEN2K = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_XOPEN2K); })))
            {
                mixin(enumMixinStr___USE_XOPEN2K);
            }
        }

        static if (!is(typeof(_BITS_BYTESWAP_H)))
        {
            private enum enumMixinStr__BITS_BYTESWAP_H = `enum _BITS_BYTESWAP_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_BYTESWAP_H); })))
            {
                mixin(enumMixinStr__BITS_BYTESWAP_H);
            }
        }

        static if (!is(typeof(__USE_POSIX199506)))
        {
            private enum enumMixinStr___USE_POSIX199506 = `enum __USE_POSIX199506 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_POSIX199506); })))
            {
                mixin(enumMixinStr___USE_POSIX199506);
            }
        }

        static if (!is(typeof(__USE_POSIX199309)))
        {
            private enum enumMixinStr___USE_POSIX199309 = `enum __USE_POSIX199309 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_POSIX199309); })))
            {
                mixin(enumMixinStr___USE_POSIX199309);
            }
        }

        static if (!is(typeof(__USE_POSIX2)))
        {
            private enum enumMixinStr___USE_POSIX2 = `enum __USE_POSIX2 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_POSIX2); })))
            {
                mixin(enumMixinStr___USE_POSIX2);
            }
        }

        static if (!is(typeof(__USE_POSIX)))
        {
            private enum enumMixinStr___USE_POSIX = `enum __USE_POSIX = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_POSIX); })))
            {
                mixin(enumMixinStr___USE_POSIX);
            }
        }

        static if (!is(typeof(_POSIX_C_SOURCE)))
        {
            private enum enumMixinStr__POSIX_C_SOURCE = `enum _POSIX_C_SOURCE = 200809L;`;
            static if (is(typeof({ mixin(enumMixinStr__POSIX_C_SOURCE); })))
            {
                mixin(enumMixinStr__POSIX_C_SOURCE);
            }
        }

        static if (!is(typeof(_POSIX_SOURCE)))
        {
            private enum enumMixinStr__POSIX_SOURCE = `enum _POSIX_SOURCE = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__POSIX_SOURCE); })))
            {
                mixin(enumMixinStr__POSIX_SOURCE);
            }
        }

        static if (!is(typeof(__USE_POSIX_IMPLICITLY)))
        {
            private enum enumMixinStr___USE_POSIX_IMPLICITLY = `enum __USE_POSIX_IMPLICITLY = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_POSIX_IMPLICITLY); })))
            {
                mixin(enumMixinStr___USE_POSIX_IMPLICITLY);
            }
        }

        static if (!is(typeof(__USE_ISOC11)))
        {
            private enum enumMixinStr___USE_ISOC11 = `enum __USE_ISOC11 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___USE_ISOC11); })))
            {
                mixin(enumMixinStr___USE_ISOC11);
            }
        }

        static if (!is(typeof(__GLIBC_USE_ISOC2X)))
        {
            private enum enumMixinStr___GLIBC_USE_ISOC2X = `enum __GLIBC_USE_ISOC2X = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___GLIBC_USE_ISOC2X); })))
            {
                mixin(enumMixinStr___GLIBC_USE_ISOC2X);
            }
        }

        static if (!is(typeof(_BITS_ENDIAN_H)))
        {
            private enum enumMixinStr__BITS_ENDIAN_H = `enum _BITS_ENDIAN_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_ENDIAN_H); })))
            {
                mixin(enumMixinStr__BITS_ENDIAN_H);
            }
        }

        static if (!is(typeof(__LITTLE_ENDIAN)))
        {
            private enum enumMixinStr___LITTLE_ENDIAN = `enum __LITTLE_ENDIAN = 1234;`;
            static if (is(typeof({ mixin(enumMixinStr___LITTLE_ENDIAN); })))
            {
                mixin(enumMixinStr___LITTLE_ENDIAN);
            }
        }

        static if (!is(typeof(__BIG_ENDIAN)))
        {
            private enum enumMixinStr___BIG_ENDIAN = `enum __BIG_ENDIAN = 4321;`;
            static if (is(typeof({ mixin(enumMixinStr___BIG_ENDIAN); })))
            {
                mixin(enumMixinStr___BIG_ENDIAN);
            }
        }

        static if (!is(typeof(__PDP_ENDIAN)))
        {
            private enum enumMixinStr___PDP_ENDIAN = `enum __PDP_ENDIAN = 3412;`;
            static if (is(typeof({ mixin(enumMixinStr___PDP_ENDIAN); })))
            {
                mixin(enumMixinStr___PDP_ENDIAN);
            }
        }

        static if (!is(typeof(_DEFAULT_SOURCE)))
        {
            private enum enumMixinStr__DEFAULT_SOURCE = `enum _DEFAULT_SOURCE = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__DEFAULT_SOURCE); })))
            {
                mixin(enumMixinStr__DEFAULT_SOURCE);
            }
        }

        static if (!is(typeof(__FLOAT_WORD_ORDER)))
        {
            private enum enumMixinStr___FLOAT_WORD_ORDER = `enum __FLOAT_WORD_ORDER = __BYTE_ORDER;`;
            static if (is(typeof({ mixin(enumMixinStr___FLOAT_WORD_ORDER); })))
            {
                mixin(enumMixinStr___FLOAT_WORD_ORDER);
            }
        }
        static if (!is(typeof(_BITS_ENDIANNESS_H)))
        {
            private enum enumMixinStr__BITS_ENDIANNESS_H = `enum _BITS_ENDIANNESS_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_ENDIANNESS_H); })))
            {
                mixin(enumMixinStr__BITS_ENDIANNESS_H);
            }
        }

        static if (!is(typeof(__BYTE_ORDER)))
        {
            private enum enumMixinStr___BYTE_ORDER = `enum __BYTE_ORDER = 1234;`;
            static if (is(typeof({ mixin(enumMixinStr___BYTE_ORDER); })))
            {
                mixin(enumMixinStr___BYTE_ORDER);
            }
        }
        static if (!is(typeof(_FEATURES_H)))
        {
            private enum enumMixinStr__FEATURES_H = `enum _FEATURES_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__FEATURES_H); })))
            {
                mixin(enumMixinStr__FEATURES_H);
            }
        }

        static if (!is(typeof(__HAVE_FLOAT16)))
        {
            private enum enumMixinStr___HAVE_FLOAT16 = `enum __HAVE_FLOAT16 = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_FLOAT16); })))
            {
                mixin(enumMixinStr___HAVE_FLOAT16);
            }
        }

        static if (!is(typeof(__HAVE_FLOAT32)))
        {
            private enum enumMixinStr___HAVE_FLOAT32 = `enum __HAVE_FLOAT32 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_FLOAT32); })))
            {
                mixin(enumMixinStr___HAVE_FLOAT32);
            }
        }

        static if (!is(typeof(__HAVE_FLOAT64)))
        {
            private enum enumMixinStr___HAVE_FLOAT64 = `enum __HAVE_FLOAT64 = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_FLOAT64); })))
            {
                mixin(enumMixinStr___HAVE_FLOAT64);
            }
        }

        static if (!is(typeof(__HAVE_FLOAT32X)))
        {
            private enum enumMixinStr___HAVE_FLOAT32X = `enum __HAVE_FLOAT32X = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_FLOAT32X); })))
            {
                mixin(enumMixinStr___HAVE_FLOAT32X);
            }
        }

        static if (!is(typeof(__HAVE_FLOAT128X)))
        {
            private enum enumMixinStr___HAVE_FLOAT128X = `enum __HAVE_FLOAT128X = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_FLOAT128X); })))
            {
                mixin(enumMixinStr___HAVE_FLOAT128X);
            }
        }

        static if (!is(typeof(__HAVE_DISTINCT_FLOAT16)))
        {
            private enum enumMixinStr___HAVE_DISTINCT_FLOAT16 = `enum __HAVE_DISTINCT_FLOAT16 = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT16); })))
            {
                mixin(enumMixinStr___HAVE_DISTINCT_FLOAT16);
            }
        }

        static if (!is(typeof(__HAVE_DISTINCT_FLOAT32)))
        {
            private enum enumMixinStr___HAVE_DISTINCT_FLOAT32 = `enum __HAVE_DISTINCT_FLOAT32 = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32); })))
            {
                mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32);
            }
        }

        static if (!is(typeof(__HAVE_DISTINCT_FLOAT64)))
        {
            private enum enumMixinStr___HAVE_DISTINCT_FLOAT64 = `enum __HAVE_DISTINCT_FLOAT64 = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64); })))
            {
                mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64);
            }
        }

        static if (!is(typeof(__HAVE_DISTINCT_FLOAT32X)))
        {
            private enum enumMixinStr___HAVE_DISTINCT_FLOAT32X = `enum __HAVE_DISTINCT_FLOAT32X = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32X); })))
            {
                mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32X);
            }
        }

        static if (!is(typeof(__HAVE_DISTINCT_FLOAT64X)))
        {
            private enum enumMixinStr___HAVE_DISTINCT_FLOAT64X = `enum __HAVE_DISTINCT_FLOAT64X = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64X); })))
            {
                mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64X);
            }
        }

        static if (!is(typeof(__HAVE_DISTINCT_FLOAT128X)))
        {
            private enum enumMixinStr___HAVE_DISTINCT_FLOAT128X = `enum __HAVE_DISTINCT_FLOAT128X = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128X);
                    })))
            {
                mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128X);
            }
        }

        static if (!is(typeof(__HAVE_FLOAT128_UNLIKE_LDBL)))
        {
            private enum enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL = `enum __HAVE_FLOAT128_UNLIKE_LDBL = ( __HAVE_DISTINCT_FLOAT128 && 64 != 113 );`;
            static if (is(typeof({
                        mixin(enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL);
                    })))
            {
                mixin(enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL);
            }
        }

        static if (!is(typeof(__HAVE_FLOATN_NOT_TYPEDEF)))
        {
            private enum enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF = `enum __HAVE_FLOATN_NOT_TYPEDEF = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF);
                    })))
            {
                mixin(enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF);
            }
        }
        static if (!is(typeof(BYTE_ORDER)))
        {
            private enum enumMixinStr_BYTE_ORDER = `enum BYTE_ORDER = 1234;`;
            static if (is(typeof({ mixin(enumMixinStr_BYTE_ORDER); })))
            {
                mixin(enumMixinStr_BYTE_ORDER);
            }
        }

        static if (!is(typeof(PDP_ENDIAN)))
        {
            private enum enumMixinStr_PDP_ENDIAN = `enum PDP_ENDIAN = 3412;`;
            static if (is(typeof({ mixin(enumMixinStr_PDP_ENDIAN); })))
            {
                mixin(enumMixinStr_PDP_ENDIAN);
            }
        }

        static if (!is(typeof(BIG_ENDIAN)))
        {
            private enum enumMixinStr_BIG_ENDIAN = `enum BIG_ENDIAN = 4321;`;
            static if (is(typeof({ mixin(enumMixinStr_BIG_ENDIAN); })))
            {
                mixin(enumMixinStr_BIG_ENDIAN);
            }
        }

        static if (!is(typeof(__CFLOAT32)))
        {
            private enum enumMixinStr___CFLOAT32 = `enum __CFLOAT32 = _Complex float;`;
            static if (is(typeof({ mixin(enumMixinStr___CFLOAT32); })))
            {
                mixin(enumMixinStr___CFLOAT32);
            }
        }

        static if (!is(typeof(LITTLE_ENDIAN)))
        {
            private enum enumMixinStr_LITTLE_ENDIAN = `enum LITTLE_ENDIAN = 1234;`;
            static if (is(typeof({ mixin(enumMixinStr_LITTLE_ENDIAN); })))
            {
                mixin(enumMixinStr_LITTLE_ENDIAN);
            }
        }

        static if (!is(typeof(_ENDIAN_H)))
        {
            private enum enumMixinStr__ENDIAN_H = `enum _ENDIAN_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__ENDIAN_H); })))
            {
                mixin(enumMixinStr__ENDIAN_H);
            }
        }

        static if (!is(typeof(__CFLOAT64)))
        {
            private enum enumMixinStr___CFLOAT64 = `enum __CFLOAT64 = _Complex double;`;
            static if (is(typeof({ mixin(enumMixinStr___CFLOAT64); })))
            {
                mixin(enumMixinStr___CFLOAT64);
            }
        }

        static if (!is(typeof(static_assert)))
        {
            private enum enumMixinStr_static_assert = `enum static_assert = _Static_assert;`;
            static if (is(typeof({ mixin(enumMixinStr_static_assert); })))
            {
                mixin(enumMixinStr_static_assert);
            }
        }

        static if (!is(typeof(__ASSERT_FUNCTION)))
        {
            private enum enumMixinStr___ASSERT_FUNCTION = `enum __ASSERT_FUNCTION = __extension__ __PRETTY_FUNCTION__;`;
            static if (is(typeof({ mixin(enumMixinStr___ASSERT_FUNCTION); })))
            {
                mixin(enumMixinStr___ASSERT_FUNCTION);
            }
        }

        static if (!is(typeof(__CFLOAT32X)))
        {
            private enum enumMixinStr___CFLOAT32X = `enum __CFLOAT32X = _Complex double;`;
            static if (is(typeof({ mixin(enumMixinStr___CFLOAT32X); })))
            {
                mixin(enumMixinStr___CFLOAT32X);
            }
        }
        static if (!is(typeof(__ASSERT_VOID_CAST)))
        {
            private enum enumMixinStr___ASSERT_VOID_CAST = `enum __ASSERT_VOID_CAST = cast( void );`;
            static if (is(typeof({ mixin(enumMixinStr___ASSERT_VOID_CAST); })))
            {
                mixin(enumMixinStr___ASSERT_VOID_CAST);
            }
        }

        static if (!is(typeof(__CFLOAT64X)))
        {
            private enum enumMixinStr___CFLOAT64X = `enum __CFLOAT64X = _Complex long double;`;
            static if (is(typeof({ mixin(enumMixinStr___CFLOAT64X); })))
            {
                mixin(enumMixinStr___CFLOAT64X);
            }
        }

        static if (!is(typeof(_ASSERT_H)))
        {
            private enum enumMixinStr__ASSERT_H = `enum _ASSERT_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__ASSERT_H); })))
            {
                mixin(enumMixinStr__ASSERT_H);
            }
        }

        static if (!is(typeof(_ALLOCA_H)))
        {
            private enum enumMixinStr__ALLOCA_H = `enum _ALLOCA_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__ALLOCA_H); })))
            {
                mixin(enumMixinStr__ALLOCA_H);
            }
        }
        static if (!is(typeof(ROSIDL_GENERATOR_C_LOCAL)))
        {
            private enum enumMixinStr_ROSIDL_GENERATOR_C_LOCAL = `enum ROSIDL_GENERATOR_C_LOCAL = __attribute__ ( ( visibility ( "hidden" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_ROSIDL_GENERATOR_C_LOCAL); })))
            {
                mixin(enumMixinStr_ROSIDL_GENERATOR_C_LOCAL);
            }
        }

        static if (!is(typeof(ROSIDL_GENERATOR_C_PUBLIC)))
        {
            private enum enumMixinStr_ROSIDL_GENERATOR_C_PUBLIC = `enum ROSIDL_GENERATOR_C_PUBLIC = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({
                        mixin(enumMixinStr_ROSIDL_GENERATOR_C_PUBLIC);
                    })))
            {
                mixin(enumMixinStr_ROSIDL_GENERATOR_C_PUBLIC);
            }
        }

        static if (!is(typeof(ROSIDL_GENERATOR_C_EXPORT)))
        {
            private enum enumMixinStr_ROSIDL_GENERATOR_C_EXPORT = `enum ROSIDL_GENERATOR_C_EXPORT = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({
                        mixin(enumMixinStr_ROSIDL_GENERATOR_C_EXPORT);
                    })))
            {
                mixin(enumMixinStr_ROSIDL_GENERATOR_C_EXPORT);
            }
        }
        static if (!is(typeof(__HAVE_FLOAT128)))
        {
            private enum enumMixinStr___HAVE_FLOAT128 = `enum __HAVE_FLOAT128 = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_FLOAT128); })))
            {
                mixin(enumMixinStr___HAVE_FLOAT128);
            }
        }

        static if (!is(typeof(__HAVE_DISTINCT_FLOAT128)))
        {
            private enum enumMixinStr___HAVE_DISTINCT_FLOAT128 = `enum __HAVE_DISTINCT_FLOAT128 = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128); })))
            {
                mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128);
            }
        }

        static if (!is(typeof(__HAVE_FLOAT64X)))
        {
            private enum enumMixinStr___HAVE_FLOAT64X = `enum __HAVE_FLOAT64X = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_FLOAT64X); })))
            {
                mixin(enumMixinStr___HAVE_FLOAT64X);
            }
        }

        static if (!is(typeof(__HAVE_FLOAT64X_LONG_DOUBLE)))
        {
            private enum enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE = `enum __HAVE_FLOAT64X_LONG_DOUBLE = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE);
                    })))
            {
                mixin(enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE);
            }
        }
        static if (!is(typeof(RMW_LOCAL)))
        {
            private enum enumMixinStr_RMW_LOCAL = `enum RMW_LOCAL = __attribute__ ( ( visibility ( "hidden" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_LOCAL); })))
            {
                mixin(enumMixinStr_RMW_LOCAL);
            }
        }

        static if (!is(typeof(RMW_PUBLIC)))
        {
            private enum enumMixinStr_RMW_PUBLIC = `enum RMW_PUBLIC = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_PUBLIC); })))
            {
                mixin(enumMixinStr_RMW_PUBLIC);
            }
        }

        static if (!is(typeof(__GLIBC_USE_LIB_EXT2)))
        {
            private enum enumMixinStr___GLIBC_USE_LIB_EXT2 = `enum __GLIBC_USE_LIB_EXT2 = 0;`;
            static if (is(typeof({ mixin(enumMixinStr___GLIBC_USE_LIB_EXT2); })))
            {
                mixin(enumMixinStr___GLIBC_USE_LIB_EXT2);
            }
        }

        static if (!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT)))
        {
            private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT = `enum __GLIBC_USE_IEC_60559_BFP_EXT = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
                    })))
            {
                mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
            }
        }

        static if (!is(typeof(RMW_EXPORT)))
        {
            private enum enumMixinStr_RMW_EXPORT = `enum RMW_EXPORT = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_EXPORT); })))
            {
                mixin(enumMixinStr_RMW_EXPORT);
            }
        }

        static if (!is(typeof(RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT)))
        {
            private enum enumMixinStr_RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT = `enum RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT = { 0 , 0 };`;
            static if (is(typeof({
                        mixin(enumMixinStr_RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT);
                    })))
            {
                mixin(enumMixinStr_RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT);
            }
        }

        static if (!is(typeof(RMW_QOS_LIFESPAN_DEFAULT)))
        {
            private enum enumMixinStr_RMW_QOS_LIFESPAN_DEFAULT = `enum RMW_QOS_LIFESPAN_DEFAULT = { 0 , 0 };`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_QOS_LIFESPAN_DEFAULT); })))
            {
                mixin(enumMixinStr_RMW_QOS_LIFESPAN_DEFAULT);
            }
        }

        static if (!is(typeof(RMW_QOS_DEADLINE_DEFAULT)))
        {
            private enum enumMixinStr_RMW_QOS_DEADLINE_DEFAULT = `enum RMW_QOS_DEADLINE_DEFAULT = { 0 , 0 };`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_QOS_DEADLINE_DEFAULT); })))
            {
                mixin(enumMixinStr_RMW_QOS_DEADLINE_DEFAULT);
            }
        }

        static if (!is(typeof(RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE_DEPRECATED_MSG)))
        {
            private enum enumMixinStr_RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE_DEPRECATED_MSG = `enum RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE_DEPRECATED_MSG = "RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE is deprecated. " "Use RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC if manually asserted liveliness is needed.";`;
            static if (is(typeof({
                        mixin(enumMixinStr_RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE_DEPRECATED_MSG);
                    })))
            {
                mixin(enumMixinStr_RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE_DEPRECATED_MSG);
            }
        }

        static if (!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT_C2X)))
        {
            private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X = `enum __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X);
                    })))
            {
                mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X);
            }
        }

        static if (!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT)))
        {
            private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
                    })))
            {
                mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
            }
        }

        static if (!is(typeof(RMW_GID_STORAGE_SIZE)))
        {
            private enum enumMixinStr_RMW_GID_STORAGE_SIZE = `enum RMW_GID_STORAGE_SIZE = 24u;`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_GID_STORAGE_SIZE); })))
            {
                mixin(enumMixinStr_RMW_GID_STORAGE_SIZE);
            }
        }
        static if (!is(typeof(rmw_get_zero_initialized_serialized_message)))
        {
            private enum enumMixinStr_rmw_get_zero_initialized_serialized_message = `enum rmw_get_zero_initialized_serialized_message = rcutils_get_zero_initialized_uint8_array;`;
            static if (is(typeof({
                        mixin(enumMixinStr_rmw_get_zero_initialized_serialized_message);
                    })))
            {
                mixin(enumMixinStr_rmw_get_zero_initialized_serialized_message);
            }
        }

        static if (!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X)))
        {
            private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X);
                    })))
            {
                mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X);
            }
        }

        static if (!is(typeof(__GLIBC_USE_IEC_60559_TYPES_EXT)))
        {
            private enum enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT = `enum __GLIBC_USE_IEC_60559_TYPES_EXT = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
                    })))
            {
                mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
            }
        }

        static if (!is(typeof(__LONG_DOUBLE_USES_FLOAT128)))
        {
            private enum enumMixinStr___LONG_DOUBLE_USES_FLOAT128 = `enum __LONG_DOUBLE_USES_FLOAT128 = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr___LONG_DOUBLE_USES_FLOAT128);
                    })))
            {
                mixin(enumMixinStr___LONG_DOUBLE_USES_FLOAT128);
            }
        }

        static if (!is(typeof(_BITS_PTHREADTYPES_ARCH_H)))
        {
            private enum enumMixinStr__BITS_PTHREADTYPES_ARCH_H = `enum _BITS_PTHREADTYPES_ARCH_H = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H);
                    })))
            {
                mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H);
            }
        }
        static if (!is(typeof(RMW_RET_NODE_NAME_NON_EXISTENT)))
        {
            private enum enumMixinStr_RMW_RET_NODE_NAME_NON_EXISTENT = `enum RMW_RET_NODE_NAME_NON_EXISTENT = 203;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RMW_RET_NODE_NAME_NON_EXISTENT);
                    })))
            {
                mixin(enumMixinStr_RMW_RET_NODE_NAME_NON_EXISTENT);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_MUTEX_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_MUTEX_T = `enum __SIZEOF_PTHREAD_MUTEX_T = 40;`;
            static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T); })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_ATTR_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_ATTR_T = `enum __SIZEOF_PTHREAD_ATTR_T = 56;`;
            static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T); })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_RWLOCK_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T = `enum __SIZEOF_PTHREAD_RWLOCK_T = 56;`;
            static if (is(typeof({
                        mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T);
                    })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_BARRIER_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_BARRIER_T = `enum __SIZEOF_PTHREAD_BARRIER_T = 32;`;
            static if (is(typeof({
                        mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T);
                    })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_MUTEXATTR_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T = `enum __SIZEOF_PTHREAD_MUTEXATTR_T = 4;`;
            static if (is(typeof({
                        mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T);
                    })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_COND_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_COND_T = `enum __SIZEOF_PTHREAD_COND_T = 48;`;
            static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T); })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_CONDATTR_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T = `enum __SIZEOF_PTHREAD_CONDATTR_T = 4;`;
            static if (is(typeof({
                        mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T);
                    })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_RWLOCKATTR_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T = `enum __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;`;
            static if (is(typeof({
                        mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T);
                    })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T);
            }
        }

        static if (!is(typeof(__SIZEOF_PTHREAD_BARRIERATTR_T)))
        {
            private enum enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T = `enum __SIZEOF_PTHREAD_BARRIERATTR_T = 4;`;
            static if (is(typeof({
                        mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T);
                    })))
            {
                mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T);
            }
        }
        static if (!is(typeof(RMW_RET_INCORRECT_RMW_IMPLEMENTATION)))
        {
            private enum enumMixinStr_RMW_RET_INCORRECT_RMW_IMPLEMENTATION = `enum RMW_RET_INCORRECT_RMW_IMPLEMENTATION = 12;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RMW_RET_INCORRECT_RMW_IMPLEMENTATION);
                    })))
            {
                mixin(enumMixinStr_RMW_RET_INCORRECT_RMW_IMPLEMENTATION);
            }
        }

        static if (!is(typeof(_BITS_PTHREADTYPES_COMMON_H)))
        {
            private enum enumMixinStr__BITS_PTHREADTYPES_COMMON_H = `enum _BITS_PTHREADTYPES_COMMON_H = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H);
                    })))
            {
                mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H);
            }
        }

        static if (!is(typeof(RMW_RET_INVALID_ARGUMENT)))
        {
            private enum enumMixinStr_RMW_RET_INVALID_ARGUMENT = `enum RMW_RET_INVALID_ARGUMENT = 11;`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_RET_INVALID_ARGUMENT); })))
            {
                mixin(enumMixinStr_RMW_RET_INVALID_ARGUMENT);
            }
        }

        static if (!is(typeof(RMW_RET_BAD_ALLOC)))
        {
            private enum enumMixinStr_RMW_RET_BAD_ALLOC = `enum RMW_RET_BAD_ALLOC = 10;`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_RET_BAD_ALLOC); })))
            {
                mixin(enumMixinStr_RMW_RET_BAD_ALLOC);
            }
        }

        static if (!is(typeof(RMW_RET_UNSUPPORTED)))
        {
            private enum enumMixinStr_RMW_RET_UNSUPPORTED = `enum RMW_RET_UNSUPPORTED = 3;`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_RET_UNSUPPORTED); })))
            {
                mixin(enumMixinStr_RMW_RET_UNSUPPORTED);
            }
        }

        static if (!is(typeof(RMW_RET_TIMEOUT)))
        {
            private enum enumMixinStr_RMW_RET_TIMEOUT = `enum RMW_RET_TIMEOUT = 2;`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_RET_TIMEOUT); })))
            {
                mixin(enumMixinStr_RMW_RET_TIMEOUT);
            }
        }

        static if (!is(typeof(RMW_RET_ERROR)))
        {
            private enum enumMixinStr_RMW_RET_ERROR = `enum RMW_RET_ERROR = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_RET_ERROR); })))
            {
                mixin(enumMixinStr_RMW_RET_ERROR);
            }
        }

        static if (!is(typeof(RMW_RET_OK)))
        {
            private enum enumMixinStr_RMW_RET_OK = `enum RMW_RET_OK = 0;`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_RET_OK); })))
            {
                mixin(enumMixinStr_RMW_RET_OK);
            }
        }
        static if (!is(typeof(RMW_WARN_UNUSED)))
        {
            private enum enumMixinStr_RMW_WARN_UNUSED = `enum RMW_WARN_UNUSED = RCUTILS_WARN_UNUSED;`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_WARN_UNUSED); })))
            {
                mixin(enumMixinStr_RMW_WARN_UNUSED);
            }
        }
        static if (!is(typeof(__have_pthread_attr_t)))
        {
            private enum enumMixinStr___have_pthread_attr_t = `enum __have_pthread_attr_t = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___have_pthread_attr_t); })))
            {
                mixin(enumMixinStr___have_pthread_attr_t);
            }
        }

        static if (!is(typeof(RMW_DEFAULT_DOMAIN_ID)))
        {
            private enum enumMixinStr_RMW_DEFAULT_DOMAIN_ID = `enum RMW_DEFAULT_DOMAIN_ID = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_RMW_DEFAULT_DOMAIN_ID); })))
            {
                mixin(enumMixinStr_RMW_DEFAULT_DOMAIN_ID);
            }
        }

        static if (!is(typeof(RCUTILS_LOCAL)))
        {
            private enum enumMixinStr_RCUTILS_LOCAL = `enum RCUTILS_LOCAL = __attribute__ ( ( visibility ( "hidden" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_LOCAL); })))
            {
                mixin(enumMixinStr_RCUTILS_LOCAL);
            }
        }

        static if (!is(typeof(RCUTILS_EXPORT)))
        {
            private enum enumMixinStr_RCUTILS_EXPORT = `enum RCUTILS_EXPORT = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_EXPORT); })))
            {
                mixin(enumMixinStr_RCUTILS_EXPORT);
            }
        }

        static if (!is(typeof(RCUTILS_IMPORT)))
        {
            private enum enumMixinStr_RCUTILS_IMPORT = `enum RCUTILS_IMPORT = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_IMPORT); })))
            {
                mixin(enumMixinStr_RCUTILS_IMPORT);
            }
        }
        static if (!is(typeof(RCUTILS_PUBLIC)))
        {
            private enum enumMixinStr_RCUTILS_PUBLIC = `enum RCUTILS_PUBLIC = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_PUBLIC); })))
            {
                mixin(enumMixinStr_RCUTILS_PUBLIC);
            }
        }
        static if (!is(typeof(RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES)))
        {
            private enum enumMixinStr_RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES = `enum RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES = 50;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES);
            }
        }

        static if (!is(typeof(RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID)))
        {
            private enum enumMixinStr_RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID = `enum RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID = 41;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID);
            }
        }

        static if (!is(typeof(RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID)))
        {
            private enum enumMixinStr_RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID = `enum RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID = 40;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID);
            }
        }

        static if (!is(typeof(RCUTILS_RET_STRING_KEY_NOT_FOUND)))
        {
            private enum enumMixinStr_RCUTILS_RET_STRING_KEY_NOT_FOUND = `enum RCUTILS_RET_STRING_KEY_NOT_FOUND = 32;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_STRING_KEY_NOT_FOUND);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_STRING_KEY_NOT_FOUND);
            }
        }

        static if (!is(typeof(RCUTILS_RET_STRING_MAP_INVALID)))
        {
            private enum enumMixinStr_RCUTILS_RET_STRING_MAP_INVALID = `enum RCUTILS_RET_STRING_MAP_INVALID = 31;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_STRING_MAP_INVALID);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_STRING_MAP_INVALID);
            }
        }

        static if (!is(typeof(RCUTILS_RET_STRING_MAP_ALREADY_INIT)))
        {
            private enum enumMixinStr_RCUTILS_RET_STRING_MAP_ALREADY_INIT = `enum RCUTILS_RET_STRING_MAP_ALREADY_INIT = 30;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_STRING_MAP_ALREADY_INIT);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_STRING_MAP_ALREADY_INIT);
            }
        }

        static if (!is(typeof(RCUTILS_RET_NOT_FOUND)))
        {
            private enum enumMixinStr_RCUTILS_RET_NOT_FOUND = `enum RCUTILS_RET_NOT_FOUND = 14;`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_RET_NOT_FOUND); })))
            {
                mixin(enumMixinStr_RCUTILS_RET_NOT_FOUND);
            }
        }

        static if (!is(typeof(RCUTILS_RET_NOT_INITIALIZED)))
        {
            private enum enumMixinStr_RCUTILS_RET_NOT_INITIALIZED = `enum RCUTILS_RET_NOT_INITIALIZED = 13;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_NOT_INITIALIZED);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_NOT_INITIALIZED);
            }
        }

        static if (!is(typeof(RCUTILS_RET_NOT_ENOUGH_SPACE)))
        {
            private enum enumMixinStr_RCUTILS_RET_NOT_ENOUGH_SPACE = `enum RCUTILS_RET_NOT_ENOUGH_SPACE = 12;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_NOT_ENOUGH_SPACE);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_NOT_ENOUGH_SPACE);
            }
        }

        static if (!is(typeof(RCUTILS_RET_INVALID_ARGUMENT)))
        {
            private enum enumMixinStr_RCUTILS_RET_INVALID_ARGUMENT = `enum RCUTILS_RET_INVALID_ARGUMENT = 11;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_RET_INVALID_ARGUMENT);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_RET_INVALID_ARGUMENT);
            }
        }

        static if (!is(typeof(RCUTILS_RET_BAD_ALLOC)))
        {
            private enum enumMixinStr_RCUTILS_RET_BAD_ALLOC = `enum RCUTILS_RET_BAD_ALLOC = 10;`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_RET_BAD_ALLOC); })))
            {
                mixin(enumMixinStr_RCUTILS_RET_BAD_ALLOC);
            }
        }

        static if (!is(typeof(RCUTILS_RET_ERROR)))
        {
            private enum enumMixinStr_RCUTILS_RET_ERROR = `enum RCUTILS_RET_ERROR = 2;`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_RET_ERROR); })))
            {
                mixin(enumMixinStr_RCUTILS_RET_ERROR);
            }
        }

        static if (!is(typeof(RCUTILS_RET_WARN)))
        {
            private enum enumMixinStr_RCUTILS_RET_WARN = `enum RCUTILS_RET_WARN = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_RET_WARN); })))
            {
                mixin(enumMixinStr_RCUTILS_RET_WARN);
            }
        }

        static if (!is(typeof(__FD_ZERO_STOS)))
        {
            private enum enumMixinStr___FD_ZERO_STOS = `enum __FD_ZERO_STOS = "stosq";`;
            static if (is(typeof({ mixin(enumMixinStr___FD_ZERO_STOS); })))
            {
                mixin(enumMixinStr___FD_ZERO_STOS);
            }
        }
        static if (!is(typeof(_BITS_STDINT_INTN_H)))
        {
            private enum enumMixinStr__BITS_STDINT_INTN_H = `enum _BITS_STDINT_INTN_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_STDINT_INTN_H); })))
            {
                mixin(enumMixinStr__BITS_STDINT_INTN_H);
            }
        }

        static if (!is(typeof(RCUTILS_RET_OK)))
        {
            private enum enumMixinStr_RCUTILS_RET_OK = `enum RCUTILS_RET_OK = 0;`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_RET_OK); })))
            {
                mixin(enumMixinStr_RCUTILS_RET_OK);
            }
        }
        static if (!is(typeof(_BITS_STDINT_UINTN_H)))
        {
            private enum enumMixinStr__BITS_STDINT_UINTN_H = `enum _BITS_STDINT_UINTN_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_STDINT_UINTN_H); })))
            {
                mixin(enumMixinStr__BITS_STDINT_UINTN_H);
            }
        }
        static if (!is(typeof(RCUTILS_STEADY_TIME)))
        {
            private enum enumMixinStr_RCUTILS_STEADY_TIME = `enum RCUTILS_STEADY_TIME = rcutils_steady_time_now;`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_STEADY_TIME); })))
            {
                mixin(enumMixinStr_RCUTILS_STEADY_TIME);
            }
        }

        static if (!is(typeof(_BITS_STDIO_LIM_H)))
        {
            private enum enumMixinStr__BITS_STDIO_LIM_H = `enum _BITS_STDIO_LIM_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_STDIO_LIM_H); })))
            {
                mixin(enumMixinStr__BITS_STDIO_LIM_H);
            }
        }

        static if (!is(typeof(L_tmpnam)))
        {
            private enum enumMixinStr_L_tmpnam = `enum L_tmpnam = 20;`;
            static if (is(typeof({ mixin(enumMixinStr_L_tmpnam); })))
            {
                mixin(enumMixinStr_L_tmpnam);
            }
        }

        static if (!is(typeof(TMP_MAX)))
        {
            private enum enumMixinStr_TMP_MAX = `enum TMP_MAX = 238328;`;
            static if (is(typeof({ mixin(enumMixinStr_TMP_MAX); })))
            {
                mixin(enumMixinStr_TMP_MAX);
            }
        }

        static if (!is(typeof(FILENAME_MAX)))
        {
            private enum enumMixinStr_FILENAME_MAX = `enum FILENAME_MAX = 4096;`;
            static if (is(typeof({ mixin(enumMixinStr_FILENAME_MAX); })))
            {
                mixin(enumMixinStr_FILENAME_MAX);
            }
        }

        static if (!is(typeof(L_ctermid)))
        {
            private enum enumMixinStr_L_ctermid = `enum L_ctermid = 9;`;
            static if (is(typeof({ mixin(enumMixinStr_L_ctermid); })))
            {
                mixin(enumMixinStr_L_ctermid);
            }
        }

        static if (!is(typeof(FOPEN_MAX)))
        {
            private enum enumMixinStr_FOPEN_MAX = `enum FOPEN_MAX = 16;`;
            static if (is(typeof({ mixin(enumMixinStr_FOPEN_MAX); })))
            {
                mixin(enumMixinStr_FOPEN_MAX);
            }
        }

        static if (!is(typeof(_THREAD_MUTEX_INTERNAL_H)))
        {
            private enum enumMixinStr__THREAD_MUTEX_INTERNAL_H = `enum _THREAD_MUTEX_INTERNAL_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__THREAD_MUTEX_INTERNAL_H); })))
            {
                mixin(enumMixinStr__THREAD_MUTEX_INTERNAL_H);
            }
        }
        static if (!is(typeof(__PTHREAD_MUTEX_HAVE_PREV)))
        {
            private enum enumMixinStr___PTHREAD_MUTEX_HAVE_PREV = `enum __PTHREAD_MUTEX_HAVE_PREV = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV);
                    })))
            {
                mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV);
            }
        }
        static if (!is(typeof(__PTHREAD_RWLOCK_ELISION_EXTRA)))
        {
            private enum enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA = `enum __PTHREAD_RWLOCK_ELISION_EXTRA = 0 , { 0 , 0 , 0 , 0 , 0 , 0 , 0 };`;
            static if (is(typeof({
                        mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA);
                    })))
            {
                mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA);
            }
        }

        static if (!is(typeof(RCUTILS_FAULT_INJECTION_FAIL_NOW)))
        {
            private enum enumMixinStr_RCUTILS_FAULT_INJECTION_FAIL_NOW = `enum RCUTILS_FAULT_INJECTION_FAIL_NOW = 0;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_FAULT_INJECTION_FAIL_NOW);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_FAULT_INJECTION_FAIL_NOW);
            }
        }

        static if (!is(typeof(RCUTILS_FAULT_INJECTION_NEVER_FAIL)))
        {
            private enum enumMixinStr_RCUTILS_FAULT_INJECTION_NEVER_FAIL = `enum RCUTILS_FAULT_INJECTION_NEVER_FAIL = - 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_FAULT_INJECTION_NEVER_FAIL);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_FAULT_INJECTION_NEVER_FAIL);
            }
        }
        static if (!is(typeof(_THREAD_SHARED_TYPES_H)))
        {
            private enum enumMixinStr__THREAD_SHARED_TYPES_H = `enum _THREAD_SHARED_TYPES_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__THREAD_SHARED_TYPES_H); })))
            {
                mixin(enumMixinStr__THREAD_SHARED_TYPES_H);
            }
        }
        static if (!is(typeof(RCUTILS_DEPRECATED)))
        {
            private enum enumMixinStr_RCUTILS_DEPRECATED = `enum RCUTILS_DEPRECATED = __attribute__ ( ( deprecated ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_DEPRECATED); })))
            {
                mixin(enumMixinStr_RCUTILS_DEPRECATED);
            }
        }
        static if (!is(typeof(_BITS_TIME64_H)))
        {
            private enum enumMixinStr__BITS_TIME64_H = `enum _BITS_TIME64_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_TIME64_H); })))
            {
                mixin(enumMixinStr__BITS_TIME64_H);
            }
        }

        static if (!is(typeof(__TIME64_T_TYPE)))
        {
            private enum enumMixinStr___TIME64_T_TYPE = `enum __TIME64_T_TYPE = __TIME_T_TYPE;`;
            static if (is(typeof({ mixin(enumMixinStr___TIME64_T_TYPE); })))
            {
                mixin(enumMixinStr___TIME64_T_TYPE);
            }
        }

        static if (!is(typeof(__TIMESIZE)))
        {
            private enum enumMixinStr___TIMESIZE = `enum __TIMESIZE = __WORDSIZE;`;
            static if (is(typeof({ mixin(enumMixinStr___TIMESIZE); })))
            {
                mixin(enumMixinStr___TIMESIZE);
            }
        }

        static if (!is(typeof(_BITS_TYPES_H)))
        {
            private enum enumMixinStr__BITS_TYPES_H = `enum _BITS_TYPES_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_TYPES_H); })))
            {
                mixin(enumMixinStr__BITS_TYPES_H);
            }
        }

        static if (!is(typeof(RCUTILS_THREAD_LOCAL)))
        {
            private enum enumMixinStr_RCUTILS_THREAD_LOCAL = `enum RCUTILS_THREAD_LOCAL = _Thread_local;`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_THREAD_LOCAL); })))
            {
                mixin(enumMixinStr_RCUTILS_THREAD_LOCAL);
            }
        }

        static if (!is(typeof(RCUTILS_WARN_UNUSED)))
        {
            private enum enumMixinStr_RCUTILS_WARN_UNUSED = `enum RCUTILS_WARN_UNUSED = __attribute__ ( ( warn_unused_result ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_WARN_UNUSED); })))
            {
                mixin(enumMixinStr_RCUTILS_WARN_UNUSED);
            }
        }

        static if (!is(typeof(RCUTILS_LOGGING_AUTOINIT)))
        {
            private enum enumMixinStr_RCUTILS_LOGGING_AUTOINIT = `enum RCUTILS_LOGGING_AUTOINIT = if ( __builtin_expect ( ( ! g_rcutils_logging_initialized ) , 0 ) ) { rcutils_ret_t ret = rcutils_logging_initialize ( ) ; if ( ret != 0 ) { RCUTILS_SAFE_FWRITE_TO_STDERR ( "[rcutils|" "/tmp/package.d.tmp" ":" "14027" "] error initializing logging: " ) ; RCUTILS_SAFE_FWRITE_TO_STDERR ( rcutils_get_error_string ( ) . str ) ; RCUTILS_SAFE_FWRITE_TO_STDERR ( "\n" ) ; rcutils_reset_error ( ) ; } };`;
            static if (is(typeof({ mixin(enumMixinStr_RCUTILS_LOGGING_AUTOINIT); })))
            {
                mixin(enumMixinStr_RCUTILS_LOGGING_AUTOINIT);
            }
        }

        static if (!is(typeof(RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL)))
        {
            private enum enumMixinStr_RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL = `enum RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL = RCUTILS_LOG_SEVERITY_INFO;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL);
            }
        }

        static if (!is(typeof(RCUTILS_LOGGING_SEPARATOR_STRING)))
        {
            private enum enumMixinStr_RCUTILS_LOGGING_SEPARATOR_STRING = `enum RCUTILS_LOGGING_SEPARATOR_STRING = ".";`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_LOGGING_SEPARATOR_STRING);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_LOGGING_SEPARATOR_STRING);
            }
        }

        static if (!is(typeof(RCUTILS_LOGGING_SEPARATOR_CHAR)))
        {
            private enum enumMixinStr_RCUTILS_LOGGING_SEPARATOR_CHAR = `enum RCUTILS_LOGGING_SEPARATOR_CHAR = '.';`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_LOGGING_SEPARATOR_CHAR);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_LOGGING_SEPARATOR_CHAR);
            }
        }
        static if (!is(typeof(RCUTILS_ERROR_STATE_FILE_MAX_LENGTH)))
        {
            private enum enumMixinStr_RCUTILS_ERROR_STATE_FILE_MAX_LENGTH = `enum RCUTILS_ERROR_STATE_FILE_MAX_LENGTH = ( RCUTILS_ERROR_MESSAGE_MAX_LENGTH - RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH - RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH - RCUTILS_ERROR_FORMATTING_CHARACTERS - 1 );`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_ERROR_STATE_FILE_MAX_LENGTH);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_ERROR_STATE_FILE_MAX_LENGTH);
            }
        }

        static if (!is(typeof(RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH)))
        {
            private enum enumMixinStr_RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH = `enum RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH = 768;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH);
            }
        }

        static if (!is(typeof(RCUTILS_ERROR_MESSAGE_MAX_LENGTH)))
        {
            private enum enumMixinStr_RCUTILS_ERROR_MESSAGE_MAX_LENGTH = `enum RCUTILS_ERROR_MESSAGE_MAX_LENGTH = 1024;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_ERROR_MESSAGE_MAX_LENGTH);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_ERROR_MESSAGE_MAX_LENGTH);
            }
        }

        static if (!is(typeof(RCUTILS_ERROR_FORMATTING_CHARACTERS)))
        {
            private enum enumMixinStr_RCUTILS_ERROR_FORMATTING_CHARACTERS = `enum RCUTILS_ERROR_FORMATTING_CHARACTERS = 6;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_ERROR_FORMATTING_CHARACTERS);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_ERROR_FORMATTING_CHARACTERS);
            }
        }

        static if (!is(typeof(RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH)))
        {
            private enum enumMixinStr_RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH = `enum RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH = 20;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH);
                    })))
            {
                mixin(enumMixinStr_RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH);
            }
        }
        static if (!is(typeof(RCL_LOCAL)))
        {
            private enum enumMixinStr_RCL_LOCAL = `enum RCL_LOCAL = __attribute__ ( ( visibility ( "hidden" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_LOCAL); })))
            {
                mixin(enumMixinStr_RCL_LOCAL);
            }
        }

        static if (!is(typeof(RCL_PUBLIC)))
        {
            private enum enumMixinStr_RCL_PUBLIC = `enum RCL_PUBLIC = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_PUBLIC); })))
            {
                mixin(enumMixinStr_RCL_PUBLIC);
            }
        }

        static if (!is(typeof(__S16_TYPE)))
        {
            private enum enumMixinStr___S16_TYPE = `enum __S16_TYPE = short int;`;
            static if (is(typeof({ mixin(enumMixinStr___S16_TYPE); })))
            {
                mixin(enumMixinStr___S16_TYPE);
            }
        }

        static if (!is(typeof(__U16_TYPE)))
        {
            private enum enumMixinStr___U16_TYPE = `enum __U16_TYPE = unsigned short int;`;
            static if (is(typeof({ mixin(enumMixinStr___U16_TYPE); })))
            {
                mixin(enumMixinStr___U16_TYPE);
            }
        }

        static if (!is(typeof(__S32_TYPE)))
        {
            private enum enumMixinStr___S32_TYPE = `enum __S32_TYPE = int;`;
            static if (is(typeof({ mixin(enumMixinStr___S32_TYPE); })))
            {
                mixin(enumMixinStr___S32_TYPE);
            }
        }

        static if (!is(typeof(__U32_TYPE)))
        {
            private enum enumMixinStr___U32_TYPE = `enum __U32_TYPE = unsigned int;`;
            static if (is(typeof({ mixin(enumMixinStr___U32_TYPE); })))
            {
                mixin(enumMixinStr___U32_TYPE);
            }
        }

        static if (!is(typeof(__SLONGWORD_TYPE)))
        {
            private enum enumMixinStr___SLONGWORD_TYPE = `enum __SLONGWORD_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___SLONGWORD_TYPE); })))
            {
                mixin(enumMixinStr___SLONGWORD_TYPE);
            }
        }

        static if (!is(typeof(__ULONGWORD_TYPE)))
        {
            private enum enumMixinStr___ULONGWORD_TYPE = `enum __ULONGWORD_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___ULONGWORD_TYPE); })))
            {
                mixin(enumMixinStr___ULONGWORD_TYPE);
            }
        }

        static if (!is(typeof(RCL_EXPORT)))
        {
            private enum enumMixinStr_RCL_EXPORT = `enum RCL_EXPORT = __attribute__ ( ( visibility ( "default" ) ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_EXPORT); })))
            {
                mixin(enumMixinStr_RCL_EXPORT);
            }
        }

        static if (!is(typeof(__SQUAD_TYPE)))
        {
            private enum enumMixinStr___SQUAD_TYPE = `enum __SQUAD_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___SQUAD_TYPE); })))
            {
                mixin(enumMixinStr___SQUAD_TYPE);
            }
        }

        static if (!is(typeof(__UQUAD_TYPE)))
        {
            private enum enumMixinStr___UQUAD_TYPE = `enum __UQUAD_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___UQUAD_TYPE); })))
            {
                mixin(enumMixinStr___UQUAD_TYPE);
            }
        }

        static if (!is(typeof(__SWORD_TYPE)))
        {
            private enum enumMixinStr___SWORD_TYPE = `enum __SWORD_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___SWORD_TYPE); })))
            {
                mixin(enumMixinStr___SWORD_TYPE);
            }
        }

        static if (!is(typeof(__UWORD_TYPE)))
        {
            private enum enumMixinStr___UWORD_TYPE = `enum __UWORD_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___UWORD_TYPE); })))
            {
                mixin(enumMixinStr___UWORD_TYPE);
            }
        }

        static if (!is(typeof(__SLONG32_TYPE)))
        {
            private enum enumMixinStr___SLONG32_TYPE = `enum __SLONG32_TYPE = int;`;
            static if (is(typeof({ mixin(enumMixinStr___SLONG32_TYPE); })))
            {
                mixin(enumMixinStr___SLONG32_TYPE);
            }
        }

        static if (!is(typeof(__ULONG32_TYPE)))
        {
            private enum enumMixinStr___ULONG32_TYPE = `enum __ULONG32_TYPE = unsigned int;`;
            static if (is(typeof({ mixin(enumMixinStr___ULONG32_TYPE); })))
            {
                mixin(enumMixinStr___ULONG32_TYPE);
            }
        }

        static if (!is(typeof(__S64_TYPE)))
        {
            private enum enumMixinStr___S64_TYPE = `enum __S64_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___S64_TYPE); })))
            {
                mixin(enumMixinStr___S64_TYPE);
            }
        }

        static if (!is(typeof(__U64_TYPE)))
        {
            private enum enumMixinStr___U64_TYPE = `enum __U64_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___U64_TYPE); })))
            {
                mixin(enumMixinStr___U64_TYPE);
            }
        }

        static if (!is(typeof(__STD_TYPE)))
        {
            private enum enumMixinStr___STD_TYPE = `enum __STD_TYPE = typedef;`;
            static if (is(typeof({ mixin(enumMixinStr___STD_TYPE); })))
            {
                mixin(enumMixinStr___STD_TYPE);
            }
        }

        static if (!is(typeof(RCL_RET_EVENT_TAKE_FAILED)))
        {
            private enum enumMixinStr_RCL_RET_EVENT_TAKE_FAILED = `enum RCL_RET_EVENT_TAKE_FAILED = 2001;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_EVENT_TAKE_FAILED);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_EVENT_TAKE_FAILED);
            }
        }

        static if (!is(typeof(RCL_RET_EVENT_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_EVENT_INVALID = `enum RCL_RET_EVENT_INVALID = 2000;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_EVENT_INVALID); })))
            {
                mixin(enumMixinStr_RCL_RET_EVENT_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_INVALID_LOG_LEVEL_RULE)))
        {
            private enum enumMixinStr_RCL_RET_INVALID_LOG_LEVEL_RULE = `enum RCL_RET_INVALID_LOG_LEVEL_RULE = 1020;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_INVALID_LOG_LEVEL_RULE);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_INVALID_LOG_LEVEL_RULE);
            }
        }

        static if (!is(typeof(RCL_RET_INVALID_PARAM_RULE)))
        {
            private enum enumMixinStr_RCL_RET_INVALID_PARAM_RULE = `enum RCL_RET_INVALID_PARAM_RULE = 1010;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_INVALID_PARAM_RULE);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_INVALID_PARAM_RULE);
            }
        }

        static if (!is(typeof(RCL_RET_INVALID_ROS_ARGS)))
        {
            private enum enumMixinStr_RCL_RET_INVALID_ROS_ARGS = `enum RCL_RET_INVALID_ROS_ARGS = 1003;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_INVALID_ROS_ARGS); })))
            {
                mixin(enumMixinStr_RCL_RET_INVALID_ROS_ARGS);
            }
        }

        static if (!is(typeof(RCL_RET_WRONG_LEXEME)))
        {
            private enum enumMixinStr_RCL_RET_WRONG_LEXEME = `enum RCL_RET_WRONG_LEXEME = 1002;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_WRONG_LEXEME); })))
            {
                mixin(enumMixinStr_RCL_RET_WRONG_LEXEME);
            }
        }

        static if (!is(typeof(RCL_RET_INVALID_REMAP_RULE)))
        {
            private enum enumMixinStr_RCL_RET_INVALID_REMAP_RULE = `enum RCL_RET_INVALID_REMAP_RULE = 1001;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_INVALID_REMAP_RULE);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_INVALID_REMAP_RULE);
            }
        }

        static if (!is(typeof(RCL_RET_WAIT_SET_FULL)))
        {
            private enum enumMixinStr_RCL_RET_WAIT_SET_FULL = `enum RCL_RET_WAIT_SET_FULL = 902;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_WAIT_SET_FULL); })))
            {
                mixin(enumMixinStr_RCL_RET_WAIT_SET_FULL);
            }
        }

        static if (!is(typeof(RCL_RET_WAIT_SET_EMPTY)))
        {
            private enum enumMixinStr_RCL_RET_WAIT_SET_EMPTY = `enum RCL_RET_WAIT_SET_EMPTY = 901;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_WAIT_SET_EMPTY); })))
            {
                mixin(enumMixinStr_RCL_RET_WAIT_SET_EMPTY);
            }
        }

        static if (!is(typeof(RCL_RET_WAIT_SET_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_WAIT_SET_INVALID = `enum RCL_RET_WAIT_SET_INVALID = 900;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_WAIT_SET_INVALID); })))
            {
                mixin(enumMixinStr_RCL_RET_WAIT_SET_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_TIMER_CANCELED)))
        {
            private enum enumMixinStr_RCL_RET_TIMER_CANCELED = `enum RCL_RET_TIMER_CANCELED = 801;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_TIMER_CANCELED); })))
            {
                mixin(enumMixinStr_RCL_RET_TIMER_CANCELED);
            }
        }

        static if (!is(typeof(RCL_RET_TIMER_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_TIMER_INVALID = `enum RCL_RET_TIMER_INVALID = 800;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_TIMER_INVALID); })))
            {
                mixin(enumMixinStr_RCL_RET_TIMER_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_SERVICE_TAKE_FAILED)))
        {
            private enum enumMixinStr_RCL_RET_SERVICE_TAKE_FAILED = `enum RCL_RET_SERVICE_TAKE_FAILED = 601;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_SERVICE_TAKE_FAILED);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_SERVICE_TAKE_FAILED);
            }
        }

        static if (!is(typeof(RCL_RET_SERVICE_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_SERVICE_INVALID = `enum RCL_RET_SERVICE_INVALID = 600;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_SERVICE_INVALID); })))
            {
                mixin(enumMixinStr_RCL_RET_SERVICE_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_CLIENT_TAKE_FAILED)))
        {
            private enum enumMixinStr_RCL_RET_CLIENT_TAKE_FAILED = `enum RCL_RET_CLIENT_TAKE_FAILED = 501;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_CLIENT_TAKE_FAILED);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_CLIENT_TAKE_FAILED);
            }
        }

        static if (!is(typeof(RCL_RET_CLIENT_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_CLIENT_INVALID = `enum RCL_RET_CLIENT_INVALID = 500;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_CLIENT_INVALID); })))
            {
                mixin(enumMixinStr_RCL_RET_CLIENT_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_SUBSCRIPTION_TAKE_FAILED)))
        {
            private enum enumMixinStr_RCL_RET_SUBSCRIPTION_TAKE_FAILED = `enum RCL_RET_SUBSCRIPTION_TAKE_FAILED = 401;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_SUBSCRIPTION_TAKE_FAILED);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_SUBSCRIPTION_TAKE_FAILED);
            }
        }

        static if (!is(typeof(RCL_RET_SUBSCRIPTION_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_SUBSCRIPTION_INVALID = `enum RCL_RET_SUBSCRIPTION_INVALID = 400;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_SUBSCRIPTION_INVALID);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_SUBSCRIPTION_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_PUBLISHER_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_PUBLISHER_INVALID = `enum RCL_RET_PUBLISHER_INVALID = 300;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_PUBLISHER_INVALID);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_PUBLISHER_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_NODE_NAME_NON_EXISTENT)))
        {
            private enum enumMixinStr_RCL_RET_NODE_NAME_NON_EXISTENT = `enum RCL_RET_NODE_NAME_NON_EXISTENT = 203;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_NODE_NAME_NON_EXISTENT);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_NODE_NAME_NON_EXISTENT);
            }
        }

        static if (!is(typeof(RCL_RET_NODE_INVALID_NAMESPACE)))
        {
            private enum enumMixinStr_RCL_RET_NODE_INVALID_NAMESPACE = `enum RCL_RET_NODE_INVALID_NAMESPACE = 202;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_NODE_INVALID_NAMESPACE);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_NODE_INVALID_NAMESPACE);
            }
        }

        static if (!is(typeof(RCL_RET_NODE_INVALID_NAME)))
        {
            private enum enumMixinStr_RCL_RET_NODE_INVALID_NAME = `enum RCL_RET_NODE_INVALID_NAME = 201;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_NODE_INVALID_NAME);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_NODE_INVALID_NAME);
            }
        }

        static if (!is(typeof(RCL_RET_NODE_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_NODE_INVALID = `enum RCL_RET_NODE_INVALID = 200;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_NODE_INVALID); })))
            {
                mixin(enumMixinStr_RCL_RET_NODE_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_ALREADY_SHUTDOWN)))
        {
            private enum enumMixinStr_RCL_RET_ALREADY_SHUTDOWN = `enum RCL_RET_ALREADY_SHUTDOWN = 106;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_ALREADY_SHUTDOWN); })))
            {
                mixin(enumMixinStr_RCL_RET_ALREADY_SHUTDOWN);
            }
        }

        static if (!is(typeof(RCL_RET_UNKNOWN_SUBSTITUTION)))
        {
            private enum enumMixinStr_RCL_RET_UNKNOWN_SUBSTITUTION = `enum RCL_RET_UNKNOWN_SUBSTITUTION = 105;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_UNKNOWN_SUBSTITUTION);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_UNKNOWN_SUBSTITUTION);
            }
        }

        static if (!is(typeof(RCL_RET_SERVICE_NAME_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_SERVICE_NAME_INVALID = `enum RCL_RET_SERVICE_NAME_INVALID = 104;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_SERVICE_NAME_INVALID);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_SERVICE_NAME_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_TOPIC_NAME_INVALID)))
        {
            private enum enumMixinStr_RCL_RET_TOPIC_NAME_INVALID = `enum RCL_RET_TOPIC_NAME_INVALID = 103;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_TOPIC_NAME_INVALID);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_TOPIC_NAME_INVALID);
            }
        }

        static if (!is(typeof(RCL_RET_MISMATCHED_RMW_ID)))
        {
            private enum enumMixinStr_RCL_RET_MISMATCHED_RMW_ID = `enum RCL_RET_MISMATCHED_RMW_ID = 102;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_RET_MISMATCHED_RMW_ID);
                    })))
            {
                mixin(enumMixinStr_RCL_RET_MISMATCHED_RMW_ID);
            }
        }

        static if (!is(typeof(RCL_RET_NOT_INIT)))
        {
            private enum enumMixinStr_RCL_RET_NOT_INIT = `enum RCL_RET_NOT_INIT = 101;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_NOT_INIT); })))
            {
                mixin(enumMixinStr_RCL_RET_NOT_INIT);
            }
        }

        static if (!is(typeof(RCL_RET_ALREADY_INIT)))
        {
            private enum enumMixinStr_RCL_RET_ALREADY_INIT = `enum RCL_RET_ALREADY_INIT = 100;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_ALREADY_INIT); })))
            {
                mixin(enumMixinStr_RCL_RET_ALREADY_INIT);
            }
        }

        static if (!is(typeof(RCL_RET_UNSUPPORTED)))
        {
            private enum enumMixinStr_RCL_RET_UNSUPPORTED = `enum RCL_RET_UNSUPPORTED = 3;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_UNSUPPORTED); })))
            {
                mixin(enumMixinStr_RCL_RET_UNSUPPORTED);
            }
        }

        static if (!is(typeof(RCL_RET_INVALID_ARGUMENT)))
        {
            private enum enumMixinStr_RCL_RET_INVALID_ARGUMENT = `enum RCL_RET_INVALID_ARGUMENT = 11;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_INVALID_ARGUMENT); })))
            {
                mixin(enumMixinStr_RCL_RET_INVALID_ARGUMENT);
            }
        }

        static if (!is(typeof(RCL_RET_BAD_ALLOC)))
        {
            private enum enumMixinStr_RCL_RET_BAD_ALLOC = `enum RCL_RET_BAD_ALLOC = 10;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_BAD_ALLOC); })))
            {
                mixin(enumMixinStr_RCL_RET_BAD_ALLOC);
            }
        }

        static if (!is(typeof(RCL_RET_TIMEOUT)))
        {
            private enum enumMixinStr_RCL_RET_TIMEOUT = `enum RCL_RET_TIMEOUT = 2;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_TIMEOUT); })))
            {
                mixin(enumMixinStr_RCL_RET_TIMEOUT);
            }
        }

        static if (!is(typeof(RCL_RET_ERROR)))
        {
            private enum enumMixinStr_RCL_RET_ERROR = `enum RCL_RET_ERROR = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_ERROR); })))
            {
                mixin(enumMixinStr_RCL_RET_ERROR);
            }
        }

        static if (!is(typeof(RCL_RET_OK)))
        {
            private enum enumMixinStr_RCL_RET_OK = `enum RCL_RET_OK = 0;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_RET_OK); })))
            {
                mixin(enumMixinStr_RCL_RET_OK);
            }
        }
        static if (!is(typeof(RCL_NS_TO_US)))
        {
            private enum enumMixinStr_RCL_NS_TO_US = `enum RCL_NS_TO_US = RCUTILS_NS_TO_US;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_NS_TO_US); })))
            {
                mixin(enumMixinStr_RCL_NS_TO_US);
            }
        }

        static if (!is(typeof(RCL_NS_TO_MS)))
        {
            private enum enumMixinStr_RCL_NS_TO_MS = `enum RCL_NS_TO_MS = RCUTILS_NS_TO_MS;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_NS_TO_MS); })))
            {
                mixin(enumMixinStr_RCL_NS_TO_MS);
            }
        }

        static if (!is(typeof(RCL_NS_TO_S)))
        {
            private enum enumMixinStr_RCL_NS_TO_S = `enum RCL_NS_TO_S = RCUTILS_NS_TO_S;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_NS_TO_S); })))
            {
                mixin(enumMixinStr_RCL_NS_TO_S);
            }
        }

        static if (!is(typeof(RCL_US_TO_NS)))
        {
            private enum enumMixinStr_RCL_US_TO_NS = `enum RCL_US_TO_NS = RCUTILS_US_TO_NS;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_US_TO_NS); })))
            {
                mixin(enumMixinStr_RCL_US_TO_NS);
            }
        }

        static if (!is(typeof(RCL_MS_TO_NS)))
        {
            private enum enumMixinStr_RCL_MS_TO_NS = `enum RCL_MS_TO_NS = RCUTILS_MS_TO_NS;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_MS_TO_NS); })))
            {
                mixin(enumMixinStr_RCL_MS_TO_NS);
            }
        }

        static if (!is(typeof(RCL_S_TO_NS)))
        {
            private enum enumMixinStr_RCL_S_TO_NS = `enum RCL_S_TO_NS = RCUTILS_S_TO_NS;`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_S_TO_NS); })))
            {
                mixin(enumMixinStr_RCL_S_TO_NS);
            }
        }
        static if (!is(typeof(RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID)))
        {
            private enum enumMixinStr_RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID = `enum RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID = RCL_DEFAULT_DOMAIN_ID;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID);
                    })))
            {
                mixin(enumMixinStr_RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID);
            }
        }
        static if (!is(typeof(RCL_WARN_UNUSED)))
        {
            private enum enumMixinStr_RCL_WARN_UNUSED = `enum RCL_WARN_UNUSED = __attribute__ ( ( warn_unused_result ) );`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_WARN_UNUSED); })))
            {
                mixin(enumMixinStr_RCL_WARN_UNUSED);
            }
        }
        static if (!is(typeof(RCL_DEFAULT_DOMAIN_ID)))
        {
            private enum enumMixinStr_RCL_DEFAULT_DOMAIN_ID = `enum RCL_DEFAULT_DOMAIN_ID = ( 18446744073709551615UL );`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_DEFAULT_DOMAIN_ID); })))
            {
                mixin(enumMixinStr_RCL_DEFAULT_DOMAIN_ID);
            }
        }

        static if (!is(typeof(RCL_CONTEXT_ATOMIC_INSTANCE_ID_STORAGE_SIZE)))
        {
            private enum enumMixinStr_RCL_CONTEXT_ATOMIC_INSTANCE_ID_STORAGE_SIZE = `enum RCL_CONTEXT_ATOMIC_INSTANCE_ID_STORAGE_SIZE = ( uint_least64_t ) .sizeof;`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_CONTEXT_ATOMIC_INSTANCE_ID_STORAGE_SIZE);
                    })))
            {
                mixin(enumMixinStr_RCL_CONTEXT_ATOMIC_INSTANCE_ID_STORAGE_SIZE);
            }
        }
        static if (!is(typeof(RCL_LOG_EXT_LIB_FLAG_SUFFIX)))
        {
            private enum enumMixinStr_RCL_LOG_EXT_LIB_FLAG_SUFFIX = `enum RCL_LOG_EXT_LIB_FLAG_SUFFIX = "external-lib-logs";`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_LOG_EXT_LIB_FLAG_SUFFIX);
                    })))
            {
                mixin(enumMixinStr_RCL_LOG_EXT_LIB_FLAG_SUFFIX);
            }
        }

        static if (!is(typeof(RCL_LOG_ROSOUT_FLAG_SUFFIX)))
        {
            private enum enumMixinStr_RCL_LOG_ROSOUT_FLAG_SUFFIX = `enum RCL_LOG_ROSOUT_FLAG_SUFFIX = "rosout-logs";`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_LOG_ROSOUT_FLAG_SUFFIX);
                    })))
            {
                mixin(enumMixinStr_RCL_LOG_ROSOUT_FLAG_SUFFIX);
            }
        }

        static if (!is(typeof(RCL_LOG_STDOUT_FLAG_SUFFIX)))
        {
            private enum enumMixinStr_RCL_LOG_STDOUT_FLAG_SUFFIX = `enum RCL_LOG_STDOUT_FLAG_SUFFIX = "stdout-logs";`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_LOG_STDOUT_FLAG_SUFFIX);
                    })))
            {
                mixin(enumMixinStr_RCL_LOG_STDOUT_FLAG_SUFFIX);
            }
        }

        static if (!is(typeof(RCL_EXTERNAL_LOG_CONFIG_FLAG)))
        {
            private enum enumMixinStr_RCL_EXTERNAL_LOG_CONFIG_FLAG = `enum RCL_EXTERNAL_LOG_CONFIG_FLAG = "--log-config-file";`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_EXTERNAL_LOG_CONFIG_FLAG);
                    })))
            {
                mixin(enumMixinStr_RCL_EXTERNAL_LOG_CONFIG_FLAG);
            }
        }

        static if (!is(typeof(RCL_LOG_LEVEL_FLAG)))
        {
            private enum enumMixinStr_RCL_LOG_LEVEL_FLAG = `enum RCL_LOG_LEVEL_FLAG = "--log-level";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_LOG_LEVEL_FLAG); })))
            {
                mixin(enumMixinStr_RCL_LOG_LEVEL_FLAG);
            }
        }

        static if (!is(typeof(RCL_SHORT_ENCLAVE_FLAG)))
        {
            private enum enumMixinStr_RCL_SHORT_ENCLAVE_FLAG = `enum RCL_SHORT_ENCLAVE_FLAG = "-e";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_SHORT_ENCLAVE_FLAG); })))
            {
                mixin(enumMixinStr_RCL_SHORT_ENCLAVE_FLAG);
            }
        }

        static if (!is(typeof(RCL_ENCLAVE_FLAG)))
        {
            private enum enumMixinStr_RCL_ENCLAVE_FLAG = `enum RCL_ENCLAVE_FLAG = "--enclave";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_ENCLAVE_FLAG); })))
            {
                mixin(enumMixinStr_RCL_ENCLAVE_FLAG);
            }
        }

        static if (!is(typeof(RCL_SHORT_REMAP_FLAG)))
        {
            private enum enumMixinStr_RCL_SHORT_REMAP_FLAG = `enum RCL_SHORT_REMAP_FLAG = "-r";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_SHORT_REMAP_FLAG); })))
            {
                mixin(enumMixinStr_RCL_SHORT_REMAP_FLAG);
            }
        }

        static if (!is(typeof(RCL_REMAP_FLAG)))
        {
            private enum enumMixinStr_RCL_REMAP_FLAG = `enum RCL_REMAP_FLAG = "--remap";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_REMAP_FLAG); })))
            {
                mixin(enumMixinStr_RCL_REMAP_FLAG);
            }
        }

        static if (!is(typeof(RCL_PARAM_FILE_FLAG)))
        {
            private enum enumMixinStr_RCL_PARAM_FILE_FLAG = `enum RCL_PARAM_FILE_FLAG = "--params-file";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_PARAM_FILE_FLAG); })))
            {
                mixin(enumMixinStr_RCL_PARAM_FILE_FLAG);
            }
        }

        static if (!is(typeof(RCL_SHORT_PARAM_FLAG)))
        {
            private enum enumMixinStr_RCL_SHORT_PARAM_FLAG = `enum RCL_SHORT_PARAM_FLAG = "-p";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_SHORT_PARAM_FLAG); })))
            {
                mixin(enumMixinStr_RCL_SHORT_PARAM_FLAG);
            }
        }

        static if (!is(typeof(RCL_PARAM_FLAG)))
        {
            private enum enumMixinStr_RCL_PARAM_FLAG = `enum RCL_PARAM_FLAG = "--param";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_PARAM_FLAG); })))
            {
                mixin(enumMixinStr_RCL_PARAM_FLAG);
            }
        }

        static if (!is(typeof(RCL_ROS_ARGS_EXPLICIT_END_TOKEN)))
        {
            private enum enumMixinStr_RCL_ROS_ARGS_EXPLICIT_END_TOKEN = `enum RCL_ROS_ARGS_EXPLICIT_END_TOKEN = "--";`;
            static if (is(typeof({
                        mixin(enumMixinStr_RCL_ROS_ARGS_EXPLICIT_END_TOKEN);
                    })))
            {
                mixin(enumMixinStr_RCL_ROS_ARGS_EXPLICIT_END_TOKEN);
            }
        }

        static if (!is(typeof(RCL_ROS_ARGS_FLAG)))
        {
            private enum enumMixinStr_RCL_ROS_ARGS_FLAG = `enum RCL_ROS_ARGS_FLAG = "--ros-args";`;
            static if (is(typeof({ mixin(enumMixinStr_RCL_ROS_ARGS_FLAG); })))
            {
                mixin(enumMixinStr_RCL_ROS_ARGS_FLAG);
            }
        }
        static if (!is(typeof(rcl_reallocf)))
        {
            private enum enumMixinStr_rcl_reallocf = `enum rcl_reallocf = rcutils_reallocf;`;
            static if (is(typeof({ mixin(enumMixinStr_rcl_reallocf); })))
            {
                mixin(enumMixinStr_rcl_reallocf);
            }
        }

        static if (!is(typeof(rcl_get_default_allocator)))
        {
            private enum enumMixinStr_rcl_get_default_allocator = `enum rcl_get_default_allocator = rcutils_get_default_allocator;`;
            static if (is(typeof({
                        mixin(enumMixinStr_rcl_get_default_allocator);
                    })))
            {
                mixin(enumMixinStr_rcl_get_default_allocator);
            }
        }

        static if (!is(typeof(__FILE_defined)))
        {
            private enum enumMixinStr___FILE_defined = `enum __FILE_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___FILE_defined); })))
            {
                mixin(enumMixinStr___FILE_defined);
            }
        }

        static if (!is(typeof(____FILE_defined)))
        {
            private enum enumMixinStr_____FILE_defined = `enum ____FILE_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_____FILE_defined); })))
            {
                mixin(enumMixinStr_____FILE_defined);
            }
        }

        static if (!is(typeof(_____fpos64_t_defined)))
        {
            private enum enumMixinStr______fpos64_t_defined = `enum _____fpos64_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr______fpos64_t_defined); })))
            {
                mixin(enumMixinStr______fpos64_t_defined);
            }
        }

        static if (!is(typeof(_____fpos_t_defined)))
        {
            private enum enumMixinStr______fpos_t_defined = `enum _____fpos_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr______fpos_t_defined); })))
            {
                mixin(enumMixinStr______fpos_t_defined);
            }
        }

        static if (!is(typeof(_BITS_TYPES___LOCALE_T_H)))
        {
            private enum enumMixinStr__BITS_TYPES___LOCALE_T_H = `enum _BITS_TYPES___LOCALE_T_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H); })))
            {
                mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H);
            }
        }

        static if (!is(typeof(____mbstate_t_defined)))
        {
            private enum enumMixinStr_____mbstate_t_defined = `enum ____mbstate_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_____mbstate_t_defined); })))
            {
                mixin(enumMixinStr_____mbstate_t_defined);
            }
        }

        static if (!is(typeof(_SIGSET_NWORDS)))
        {
            private enum enumMixinStr__SIGSET_NWORDS = `enum _SIGSET_NWORDS = ( 1024 / ( 8 * ( unsigned long int ) .sizeof ) );`;
            static if (is(typeof({ mixin(enumMixinStr__SIGSET_NWORDS); })))
            {
                mixin(enumMixinStr__SIGSET_NWORDS);
            }
        }

        static if (!is(typeof(__clock_t_defined)))
        {
            private enum enumMixinStr___clock_t_defined = `enum __clock_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___clock_t_defined); })))
            {
                mixin(enumMixinStr___clock_t_defined);
            }
        }

        static if (!is(typeof(__clockid_t_defined)))
        {
            private enum enumMixinStr___clockid_t_defined = `enum __clockid_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___clockid_t_defined); })))
            {
                mixin(enumMixinStr___clockid_t_defined);
            }
        }

        static if (!is(typeof(_BITS_TYPES_LOCALE_T_H)))
        {
            private enum enumMixinStr__BITS_TYPES_LOCALE_T_H = `enum _BITS_TYPES_LOCALE_T_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H); })))
            {
                mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H);
            }
        }

        static if (!is(typeof(__sigset_t_defined)))
        {
            private enum enumMixinStr___sigset_t_defined = `enum __sigset_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___sigset_t_defined); })))
            {
                mixin(enumMixinStr___sigset_t_defined);
            }
        }

        static if (!is(typeof(__struct_FILE_defined)))
        {
            private enum enumMixinStr___struct_FILE_defined = `enum __struct_FILE_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___struct_FILE_defined); })))
            {
                mixin(enumMixinStr___struct_FILE_defined);
            }
        }
        static if (!is(typeof(_IO_EOF_SEEN)))
        {
            private enum enumMixinStr__IO_EOF_SEEN = `enum _IO_EOF_SEEN = 0x0010;`;
            static if (is(typeof({ mixin(enumMixinStr__IO_EOF_SEEN); })))
            {
                mixin(enumMixinStr__IO_EOF_SEEN);
            }
        }

        static if (!is(typeof(_IO_ERR_SEEN)))
        {
            private enum enumMixinStr__IO_ERR_SEEN = `enum _IO_ERR_SEEN = 0x0020;`;
            static if (is(typeof({ mixin(enumMixinStr__IO_ERR_SEEN); })))
            {
                mixin(enumMixinStr__IO_ERR_SEEN);
            }
        }

        static if (!is(typeof(_IO_USER_LOCK)))
        {
            private enum enumMixinStr__IO_USER_LOCK = `enum _IO_USER_LOCK = 0x8000;`;
            static if (is(typeof({ mixin(enumMixinStr__IO_USER_LOCK); })))
            {
                mixin(enumMixinStr__IO_USER_LOCK);
            }
        }

        static if (!is(typeof(_STRUCT_TIMESPEC)))
        {
            private enum enumMixinStr__STRUCT_TIMESPEC = `enum _STRUCT_TIMESPEC = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__STRUCT_TIMESPEC); })))
            {
                mixin(enumMixinStr__STRUCT_TIMESPEC);
            }
        }

        static if (!is(typeof(__timeval_defined)))
        {
            private enum enumMixinStr___timeval_defined = `enum __timeval_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___timeval_defined); })))
            {
                mixin(enumMixinStr___timeval_defined);
            }
        }

        static if (!is(typeof(__time_t_defined)))
        {
            private enum enumMixinStr___time_t_defined = `enum __time_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___time_t_defined); })))
            {
                mixin(enumMixinStr___time_t_defined);
            }
        }

        static if (!is(typeof(__timer_t_defined)))
        {
            private enum enumMixinStr___timer_t_defined = `enum __timer_t_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___timer_t_defined); })))
            {
                mixin(enumMixinStr___timer_t_defined);
            }
        }

        static if (!is(typeof(_BITS_TYPESIZES_H)))
        {
            private enum enumMixinStr__BITS_TYPESIZES_H = `enum _BITS_TYPESIZES_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_TYPESIZES_H); })))
            {
                mixin(enumMixinStr__BITS_TYPESIZES_H);
            }
        }

        static if (!is(typeof(__SYSCALL_SLONG_TYPE)))
        {
            private enum enumMixinStr___SYSCALL_SLONG_TYPE = `enum __SYSCALL_SLONG_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___SYSCALL_SLONG_TYPE); })))
            {
                mixin(enumMixinStr___SYSCALL_SLONG_TYPE);
            }
        }

        static if (!is(typeof(__SYSCALL_ULONG_TYPE)))
        {
            private enum enumMixinStr___SYSCALL_ULONG_TYPE = `enum __SYSCALL_ULONG_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___SYSCALL_ULONG_TYPE); })))
            {
                mixin(enumMixinStr___SYSCALL_ULONG_TYPE);
            }
        }

        static if (!is(typeof(__DEV_T_TYPE)))
        {
            private enum enumMixinStr___DEV_T_TYPE = `enum __DEV_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___DEV_T_TYPE); })))
            {
                mixin(enumMixinStr___DEV_T_TYPE);
            }
        }

        static if (!is(typeof(__UID_T_TYPE)))
        {
            private enum enumMixinStr___UID_T_TYPE = `enum __UID_T_TYPE = unsigned int;`;
            static if (is(typeof({ mixin(enumMixinStr___UID_T_TYPE); })))
            {
                mixin(enumMixinStr___UID_T_TYPE);
            }
        }

        static if (!is(typeof(__GID_T_TYPE)))
        {
            private enum enumMixinStr___GID_T_TYPE = `enum __GID_T_TYPE = unsigned int;`;
            static if (is(typeof({ mixin(enumMixinStr___GID_T_TYPE); })))
            {
                mixin(enumMixinStr___GID_T_TYPE);
            }
        }

        static if (!is(typeof(__INO_T_TYPE)))
        {
            private enum enumMixinStr___INO_T_TYPE = `enum __INO_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___INO_T_TYPE); })))
            {
                mixin(enumMixinStr___INO_T_TYPE);
            }
        }

        static if (!is(typeof(__INO64_T_TYPE)))
        {
            private enum enumMixinStr___INO64_T_TYPE = `enum __INO64_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___INO64_T_TYPE); })))
            {
                mixin(enumMixinStr___INO64_T_TYPE);
            }
        }

        static if (!is(typeof(__MODE_T_TYPE)))
        {
            private enum enumMixinStr___MODE_T_TYPE = `enum __MODE_T_TYPE = unsigned int;`;
            static if (is(typeof({ mixin(enumMixinStr___MODE_T_TYPE); })))
            {
                mixin(enumMixinStr___MODE_T_TYPE);
            }
        }

        static if (!is(typeof(__NLINK_T_TYPE)))
        {
            private enum enumMixinStr___NLINK_T_TYPE = `enum __NLINK_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___NLINK_T_TYPE); })))
            {
                mixin(enumMixinStr___NLINK_T_TYPE);
            }
        }

        static if (!is(typeof(__FSWORD_T_TYPE)))
        {
            private enum enumMixinStr___FSWORD_T_TYPE = `enum __FSWORD_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___FSWORD_T_TYPE); })))
            {
                mixin(enumMixinStr___FSWORD_T_TYPE);
            }
        }

        static if (!is(typeof(__OFF_T_TYPE)))
        {
            private enum enumMixinStr___OFF_T_TYPE = `enum __OFF_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___OFF_T_TYPE); })))
            {
                mixin(enumMixinStr___OFF_T_TYPE);
            }
        }

        static if (!is(typeof(__OFF64_T_TYPE)))
        {
            private enum enumMixinStr___OFF64_T_TYPE = `enum __OFF64_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___OFF64_T_TYPE); })))
            {
                mixin(enumMixinStr___OFF64_T_TYPE);
            }
        }

        static if (!is(typeof(__PID_T_TYPE)))
        {
            private enum enumMixinStr___PID_T_TYPE = `enum __PID_T_TYPE = int;`;
            static if (is(typeof({ mixin(enumMixinStr___PID_T_TYPE); })))
            {
                mixin(enumMixinStr___PID_T_TYPE);
            }
        }

        static if (!is(typeof(__RLIM_T_TYPE)))
        {
            private enum enumMixinStr___RLIM_T_TYPE = `enum __RLIM_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___RLIM_T_TYPE); })))
            {
                mixin(enumMixinStr___RLIM_T_TYPE);
            }
        }

        static if (!is(typeof(__RLIM64_T_TYPE)))
        {
            private enum enumMixinStr___RLIM64_T_TYPE = `enum __RLIM64_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___RLIM64_T_TYPE); })))
            {
                mixin(enumMixinStr___RLIM64_T_TYPE);
            }
        }

        static if (!is(typeof(__BLKCNT_T_TYPE)))
        {
            private enum enumMixinStr___BLKCNT_T_TYPE = `enum __BLKCNT_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___BLKCNT_T_TYPE); })))
            {
                mixin(enumMixinStr___BLKCNT_T_TYPE);
            }
        }

        static if (!is(typeof(__BLKCNT64_T_TYPE)))
        {
            private enum enumMixinStr___BLKCNT64_T_TYPE = `enum __BLKCNT64_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___BLKCNT64_T_TYPE); })))
            {
                mixin(enumMixinStr___BLKCNT64_T_TYPE);
            }
        }

        static if (!is(typeof(__FSBLKCNT_T_TYPE)))
        {
            private enum enumMixinStr___FSBLKCNT_T_TYPE = `enum __FSBLKCNT_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___FSBLKCNT_T_TYPE); })))
            {
                mixin(enumMixinStr___FSBLKCNT_T_TYPE);
            }
        }

        static if (!is(typeof(__FSBLKCNT64_T_TYPE)))
        {
            private enum enumMixinStr___FSBLKCNT64_T_TYPE = `enum __FSBLKCNT64_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___FSBLKCNT64_T_TYPE); })))
            {
                mixin(enumMixinStr___FSBLKCNT64_T_TYPE);
            }
        }

        static if (!is(typeof(__FSFILCNT_T_TYPE)))
        {
            private enum enumMixinStr___FSFILCNT_T_TYPE = `enum __FSFILCNT_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___FSFILCNT_T_TYPE); })))
            {
                mixin(enumMixinStr___FSFILCNT_T_TYPE);
            }
        }

        static if (!is(typeof(__FSFILCNT64_T_TYPE)))
        {
            private enum enumMixinStr___FSFILCNT64_T_TYPE = `enum __FSFILCNT64_T_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___FSFILCNT64_T_TYPE); })))
            {
                mixin(enumMixinStr___FSFILCNT64_T_TYPE);
            }
        }

        static if (!is(typeof(__ID_T_TYPE)))
        {
            private enum enumMixinStr___ID_T_TYPE = `enum __ID_T_TYPE = unsigned int;`;
            static if (is(typeof({ mixin(enumMixinStr___ID_T_TYPE); })))
            {
                mixin(enumMixinStr___ID_T_TYPE);
            }
        }

        static if (!is(typeof(__CLOCK_T_TYPE)))
        {
            private enum enumMixinStr___CLOCK_T_TYPE = `enum __CLOCK_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___CLOCK_T_TYPE); })))
            {
                mixin(enumMixinStr___CLOCK_T_TYPE);
            }
        }

        static if (!is(typeof(__TIME_T_TYPE)))
        {
            private enum enumMixinStr___TIME_T_TYPE = `enum __TIME_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___TIME_T_TYPE); })))
            {
                mixin(enumMixinStr___TIME_T_TYPE);
            }
        }

        static if (!is(typeof(__USECONDS_T_TYPE)))
        {
            private enum enumMixinStr___USECONDS_T_TYPE = `enum __USECONDS_T_TYPE = unsigned int;`;
            static if (is(typeof({ mixin(enumMixinStr___USECONDS_T_TYPE); })))
            {
                mixin(enumMixinStr___USECONDS_T_TYPE);
            }
        }

        static if (!is(typeof(__SUSECONDS_T_TYPE)))
        {
            private enum enumMixinStr___SUSECONDS_T_TYPE = `enum __SUSECONDS_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___SUSECONDS_T_TYPE); })))
            {
                mixin(enumMixinStr___SUSECONDS_T_TYPE);
            }
        }

        static if (!is(typeof(__DADDR_T_TYPE)))
        {
            private enum enumMixinStr___DADDR_T_TYPE = `enum __DADDR_T_TYPE = int;`;
            static if (is(typeof({ mixin(enumMixinStr___DADDR_T_TYPE); })))
            {
                mixin(enumMixinStr___DADDR_T_TYPE);
            }
        }

        static if (!is(typeof(__KEY_T_TYPE)))
        {
            private enum enumMixinStr___KEY_T_TYPE = `enum __KEY_T_TYPE = int;`;
            static if (is(typeof({ mixin(enumMixinStr___KEY_T_TYPE); })))
            {
                mixin(enumMixinStr___KEY_T_TYPE);
            }
        }

        static if (!is(typeof(__CLOCKID_T_TYPE)))
        {
            private enum enumMixinStr___CLOCKID_T_TYPE = `enum __CLOCKID_T_TYPE = int;`;
            static if (is(typeof({ mixin(enumMixinStr___CLOCKID_T_TYPE); })))
            {
                mixin(enumMixinStr___CLOCKID_T_TYPE);
            }
        }

        static if (!is(typeof(__TIMER_T_TYPE)))
        {
            private enum enumMixinStr___TIMER_T_TYPE = `enum __TIMER_T_TYPE = void *;`;
            static if (is(typeof({ mixin(enumMixinStr___TIMER_T_TYPE); })))
            {
                mixin(enumMixinStr___TIMER_T_TYPE);
            }
        }

        static if (!is(typeof(__BLKSIZE_T_TYPE)))
        {
            private enum enumMixinStr___BLKSIZE_T_TYPE = `enum __BLKSIZE_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___BLKSIZE_T_TYPE); })))
            {
                mixin(enumMixinStr___BLKSIZE_T_TYPE);
            }
        }

        static if (!is(typeof(__FSID_T_TYPE)))
        {
            private enum enumMixinStr___FSID_T_TYPE = `enum __FSID_T_TYPE = { int __val [ 2 ] ; };`;
            static if (is(typeof({ mixin(enumMixinStr___FSID_T_TYPE); })))
            {
                mixin(enumMixinStr___FSID_T_TYPE);
            }
        }

        static if (!is(typeof(__SSIZE_T_TYPE)))
        {
            private enum enumMixinStr___SSIZE_T_TYPE = `enum __SSIZE_T_TYPE = long int;`;
            static if (is(typeof({ mixin(enumMixinStr___SSIZE_T_TYPE); })))
            {
                mixin(enumMixinStr___SSIZE_T_TYPE);
            }
        }

        static if (!is(typeof(__CPU_MASK_TYPE)))
        {
            private enum enumMixinStr___CPU_MASK_TYPE = `enum __CPU_MASK_TYPE = unsigned long int;`;
            static if (is(typeof({ mixin(enumMixinStr___CPU_MASK_TYPE); })))
            {
                mixin(enumMixinStr___CPU_MASK_TYPE);
            }
        }

        static if (!is(typeof(__OFF_T_MATCHES_OFF64_T)))
        {
            private enum enumMixinStr___OFF_T_MATCHES_OFF64_T = `enum __OFF_T_MATCHES_OFF64_T = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T); })))
            {
                mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T);
            }
        }

        static if (!is(typeof(__INO_T_MATCHES_INO64_T)))
        {
            private enum enumMixinStr___INO_T_MATCHES_INO64_T = `enum __INO_T_MATCHES_INO64_T = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___INO_T_MATCHES_INO64_T); })))
            {
                mixin(enumMixinStr___INO_T_MATCHES_INO64_T);
            }
        }

        static if (!is(typeof(__RLIM_T_MATCHES_RLIM64_T)))
        {
            private enum enumMixinStr___RLIM_T_MATCHES_RLIM64_T = `enum __RLIM_T_MATCHES_RLIM64_T = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
                    })))
            {
                mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
            }
        }

        static if (!is(typeof(__STATFS_MATCHES_STATFS64)))
        {
            private enum enumMixinStr___STATFS_MATCHES_STATFS64 = `enum __STATFS_MATCHES_STATFS64 = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr___STATFS_MATCHES_STATFS64);
                    })))
            {
                mixin(enumMixinStr___STATFS_MATCHES_STATFS64);
            }
        }

        static if (!is(typeof(__FD_SETSIZE)))
        {
            private enum enumMixinStr___FD_SETSIZE = `enum __FD_SETSIZE = 1024;`;
            static if (is(typeof({ mixin(enumMixinStr___FD_SETSIZE); })))
            {
                mixin(enumMixinStr___FD_SETSIZE);
            }
        }

        static if (!is(typeof(_BITS_UINTN_IDENTITY_H)))
        {
            private enum enumMixinStr__BITS_UINTN_IDENTITY_H = `enum _BITS_UINTN_IDENTITY_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_UINTN_IDENTITY_H); })))
            {
                mixin(enumMixinStr__BITS_UINTN_IDENTITY_H);
            }
        }

        static if (!is(typeof(WNOHANG)))
        {
            private enum enumMixinStr_WNOHANG = `enum WNOHANG = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_WNOHANG); })))
            {
                mixin(enumMixinStr_WNOHANG);
            }
        }

        static if (!is(typeof(WUNTRACED)))
        {
            private enum enumMixinStr_WUNTRACED = `enum WUNTRACED = 2;`;
            static if (is(typeof({ mixin(enumMixinStr_WUNTRACED); })))
            {
                mixin(enumMixinStr_WUNTRACED);
            }
        }

        static if (!is(typeof(WSTOPPED)))
        {
            private enum enumMixinStr_WSTOPPED = `enum WSTOPPED = 2;`;
            static if (is(typeof({ mixin(enumMixinStr_WSTOPPED); })))
            {
                mixin(enumMixinStr_WSTOPPED);
            }
        }

        static if (!is(typeof(WEXITED)))
        {
            private enum enumMixinStr_WEXITED = `enum WEXITED = 4;`;
            static if (is(typeof({ mixin(enumMixinStr_WEXITED); })))
            {
                mixin(enumMixinStr_WEXITED);
            }
        }

        static if (!is(typeof(WCONTINUED)))
        {
            private enum enumMixinStr_WCONTINUED = `enum WCONTINUED = 8;`;
            static if (is(typeof({ mixin(enumMixinStr_WCONTINUED); })))
            {
                mixin(enumMixinStr_WCONTINUED);
            }
        }

        static if (!is(typeof(WNOWAIT)))
        {
            private enum enumMixinStr_WNOWAIT = `enum WNOWAIT = 0x01000000;`;
            static if (is(typeof({ mixin(enumMixinStr_WNOWAIT); })))
            {
                mixin(enumMixinStr_WNOWAIT);
            }
        }

        static if (!is(typeof(__WNOTHREAD)))
        {
            private enum enumMixinStr___WNOTHREAD = `enum __WNOTHREAD = 0x20000000;`;
            static if (is(typeof({ mixin(enumMixinStr___WNOTHREAD); })))
            {
                mixin(enumMixinStr___WNOTHREAD);
            }
        }

        static if (!is(typeof(__WALL)))
        {
            private enum enumMixinStr___WALL = `enum __WALL = 0x40000000;`;
            static if (is(typeof({ mixin(enumMixinStr___WALL); })))
            {
                mixin(enumMixinStr___WALL);
            }
        }

        static if (!is(typeof(__WCLONE)))
        {
            private enum enumMixinStr___WCLONE = `enum __WCLONE = 0x80000000;`;
            static if (is(typeof({ mixin(enumMixinStr___WCLONE); })))
            {
                mixin(enumMixinStr___WCLONE);
            }
        }

        static if (!is(typeof(__ENUM_IDTYPE_T)))
        {
            private enum enumMixinStr___ENUM_IDTYPE_T = `enum __ENUM_IDTYPE_T = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___ENUM_IDTYPE_T); })))
            {
                mixin(enumMixinStr___ENUM_IDTYPE_T);
            }
        }
        static if (!is(typeof(__W_CONTINUED)))
        {
            private enum enumMixinStr___W_CONTINUED = `enum __W_CONTINUED = 0xffff;`;
            static if (is(typeof({ mixin(enumMixinStr___W_CONTINUED); })))
            {
                mixin(enumMixinStr___W_CONTINUED);
            }
        }

        static if (!is(typeof(__WCOREFLAG)))
        {
            private enum enumMixinStr___WCOREFLAG = `enum __WCOREFLAG = 0x80;`;
            static if (is(typeof({ mixin(enumMixinStr___WCOREFLAG); })))
            {
                mixin(enumMixinStr___WCOREFLAG);
            }
        }

        static if (!is(typeof(_BITS_WCHAR_H)))
        {
            private enum enumMixinStr__BITS_WCHAR_H = `enum _BITS_WCHAR_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__BITS_WCHAR_H); })))
            {
                mixin(enumMixinStr__BITS_WCHAR_H);
            }
        }

        static if (!is(typeof(__WCHAR_MAX)))
        {
            private enum enumMixinStr___WCHAR_MAX = `enum __WCHAR_MAX = 0x7fffffff;`;
            static if (is(typeof({ mixin(enumMixinStr___WCHAR_MAX); })))
            {
                mixin(enumMixinStr___WCHAR_MAX);
            }
        }

        static if (!is(typeof(__WCHAR_MIN)))
        {
            private enum enumMixinStr___WCHAR_MIN = `enum __WCHAR_MIN = ( - 0x7fffffff - 1 );`;
            static if (is(typeof({ mixin(enumMixinStr___WCHAR_MIN); })))
            {
                mixin(enumMixinStr___WCHAR_MIN);
            }
        }

        static if (!is(typeof(__WORDSIZE)))
        {
            private enum enumMixinStr___WORDSIZE = `enum __WORDSIZE = 64;`;
            static if (is(typeof({ mixin(enumMixinStr___WORDSIZE); })))
            {
                mixin(enumMixinStr___WORDSIZE);
            }
        }

        static if (!is(typeof(__WORDSIZE_TIME64_COMPAT32)))
        {
            private enum enumMixinStr___WORDSIZE_TIME64_COMPAT32 = `enum __WORDSIZE_TIME64_COMPAT32 = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
                    })))
            {
                mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
            }
        }

        static if (!is(typeof(__SYSCALL_WORDSIZE)))
        {
            private enum enumMixinStr___SYSCALL_WORDSIZE = `enum __SYSCALL_WORDSIZE = 64;`;
            static if (is(typeof({ mixin(enumMixinStr___SYSCALL_WORDSIZE); })))
            {
                mixin(enumMixinStr___SYSCALL_WORDSIZE);
            }
        }
        static if (!is(typeof(_SYS_CDEFS_H)))
        {
            private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); })))
            {
                mixin(enumMixinStr__SYS_CDEFS_H);
            }
        }
        static if (!is(typeof(__THROW)))
        {
            private enum enumMixinStr___THROW = `enum __THROW = __attribute__ ( ( __nothrow__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___THROW); })))
            {
                mixin(enumMixinStr___THROW);
            }
        }

        static if (!is(typeof(__THROWNL)))
        {
            private enum enumMixinStr___THROWNL = `enum __THROWNL = __attribute__ ( ( __nothrow__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___THROWNL); })))
            {
                mixin(enumMixinStr___THROWNL);
            }
        }
        static if (!is(typeof(__ptr_t)))
        {
            private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
            static if (is(typeof({ mixin(enumMixinStr___ptr_t); })))
            {
                mixin(enumMixinStr___ptr_t);
            }
        }
        static if (!is(typeof(__flexarr)))
        {
            private enum enumMixinStr___flexarr = `enum __flexarr = [ ];`;
            static if (is(typeof({ mixin(enumMixinStr___flexarr); })))
            {
                mixin(enumMixinStr___flexarr);
            }
        }

        static if (!is(typeof(__glibc_c99_flexarr_available)))
        {
            private enum enumMixinStr___glibc_c99_flexarr_available = `enum __glibc_c99_flexarr_available = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr___glibc_c99_flexarr_available);
                    })))
            {
                mixin(enumMixinStr___glibc_c99_flexarr_available);
            }
        }
        static if (!is(typeof(__attribute_malloc__)))
        {
            private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___attribute_malloc__); })))
            {
                mixin(enumMixinStr___attribute_malloc__);
            }
        }

        static if (!is(typeof(__attribute_pure__)))
        {
            private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___attribute_pure__); })))
            {
                mixin(enumMixinStr___attribute_pure__);
            }
        }

        static if (!is(typeof(__attribute_const__)))
        {
            private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___attribute_const__); })))
            {
                mixin(enumMixinStr___attribute_const__);
            }
        }

        static if (!is(typeof(__attribute_used__)))
        {
            private enum enumMixinStr___attribute_used__ = `enum __attribute_used__ = __attribute__ ( ( __used__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___attribute_used__); })))
            {
                mixin(enumMixinStr___attribute_used__);
            }
        }

        static if (!is(typeof(__attribute_noinline__)))
        {
            private enum enumMixinStr___attribute_noinline__ = `enum __attribute_noinline__ = __attribute__ ( ( __noinline__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___attribute_noinline__); })))
            {
                mixin(enumMixinStr___attribute_noinline__);
            }
        }

        static if (!is(typeof(__attribute_deprecated__)))
        {
            private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___attribute_deprecated__); })))
            {
                mixin(enumMixinStr___attribute_deprecated__);
            }
        }
        static if (!is(typeof(__attribute_warn_unused_result__)))
        {
            private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
            static if (is(typeof({
                        mixin(enumMixinStr___attribute_warn_unused_result__);
                    })))
            {
                mixin(enumMixinStr___attribute_warn_unused_result__);
            }
        }

        static if (!is(typeof(__always_inline)))
        {
            private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___always_inline); })))
            {
                mixin(enumMixinStr___always_inline);
            }
        }

        static if (!is(typeof(__extern_inline)))
        {
            private enum enumMixinStr___extern_inline = `enum __extern_inline = extern __inline __attribute__ ( ( __gnu_inline__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___extern_inline); })))
            {
                mixin(enumMixinStr___extern_inline);
            }
        }

        static if (!is(typeof(__extern_always_inline)))
        {
            private enum enumMixinStr___extern_always_inline = `enum __extern_always_inline = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) );`;
            static if (is(typeof({ mixin(enumMixinStr___extern_always_inline); })))
            {
                mixin(enumMixinStr___extern_always_inline);
            }
        }

        static if (!is(typeof(__fortify_function)))
        {
            private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
            static if (is(typeof({ mixin(enumMixinStr___fortify_function); })))
            {
                mixin(enumMixinStr___fortify_function);
            }
        }

        static if (!is(typeof(__restrict_arr)))
        {
            private enum enumMixinStr___restrict_arr = `enum __restrict_arr = __restrict;`;
            static if (is(typeof({ mixin(enumMixinStr___restrict_arr); })))
            {
                mixin(enumMixinStr___restrict_arr);
            }
        }
        static if (!is(typeof(__HAVE_GENERIC_SELECTION)))
        {
            private enum enumMixinStr___HAVE_GENERIC_SELECTION = `enum __HAVE_GENERIC_SELECTION = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___HAVE_GENERIC_SELECTION); })))
            {
                mixin(enumMixinStr___HAVE_GENERIC_SELECTION);
            }
        }

        static if (!is(typeof(_SYS_SELECT_H)))
        {
            private enum enumMixinStr__SYS_SELECT_H = `enum _SYS_SELECT_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__SYS_SELECT_H); })))
            {
                mixin(enumMixinStr__SYS_SELECT_H);
            }
        }

        static if (!is(typeof(__NFDBITS)))
        {
            private enum enumMixinStr___NFDBITS = `enum __NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
            static if (is(typeof({ mixin(enumMixinStr___NFDBITS); })))
            {
                mixin(enumMixinStr___NFDBITS);
            }
        }
        static if (!is(typeof(FD_SETSIZE)))
        {
            private enum enumMixinStr_FD_SETSIZE = `enum FD_SETSIZE = 1024;`;
            static if (is(typeof({ mixin(enumMixinStr_FD_SETSIZE); })))
            {
                mixin(enumMixinStr_FD_SETSIZE);
            }
        }

        static if (!is(typeof(NFDBITS)))
        {
            private enum enumMixinStr_NFDBITS = `enum NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
            static if (is(typeof({ mixin(enumMixinStr_NFDBITS); })))
            {
                mixin(enumMixinStr_NFDBITS);
            }
        }
        static if (!is(typeof(_SYS_TYPES_H)))
        {
            private enum enumMixinStr__SYS_TYPES_H = `enum _SYS_TYPES_H = 1;`;
            static if (is(typeof({ mixin(enumMixinStr__SYS_TYPES_H); })))
            {
                mixin(enumMixinStr__SYS_TYPES_H);
            }
        }
        static if (!is(typeof(__BIT_TYPES_DEFINED__)))
        {
            private enum enumMixinStr___BIT_TYPES_DEFINED__ = `enum __BIT_TYPES_DEFINED__ = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___BIT_TYPES_DEFINED__); })))
            {
                mixin(enumMixinStr___BIT_TYPES_DEFINED__);
            }
        }
        static if (!is(typeof(alignas)))
        {
            private enum enumMixinStr_alignas = `enum alignas = _Alignas;`;
            static if (is(typeof({ mixin(enumMixinStr_alignas); })))
            {
                mixin(enumMixinStr_alignas);
            }
        }

        static if (!is(typeof(alignof)))
        {
            private enum enumMixinStr_alignof = `enum alignof = _Alignof;`;
            static if (is(typeof({ mixin(enumMixinStr_alignof); })))
            {
                mixin(enumMixinStr_alignof);
            }
        }

        static if (!is(typeof(__alignas_is_defined)))
        {
            private enum enumMixinStr___alignas_is_defined = `enum __alignas_is_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___alignas_is_defined); })))
            {
                mixin(enumMixinStr___alignas_is_defined);
            }
        }

        static if (!is(typeof(__alignof_is_defined)))
        {
            private enum enumMixinStr___alignof_is_defined = `enum __alignof_is_defined = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___alignof_is_defined); })))
            {
                mixin(enumMixinStr___alignof_is_defined);
            }
        }
        static if (!is(typeof(__GNUC_VA_LIST)))
        {
            private enum enumMixinStr___GNUC_VA_LIST = `enum __GNUC_VA_LIST = 1;`;
            static if (is(typeof({ mixin(enumMixinStr___GNUC_VA_LIST); })))
            {
                mixin(enumMixinStr___GNUC_VA_LIST);
            }
        }

        static if (!is(typeof(bool_)))
        {
            private enum enumMixinStr_bool_ = `enum bool_ = _Bool;`;
            static if (is(typeof({ mixin(enumMixinStr_bool_); })))
            {
                mixin(enumMixinStr_bool_);
            }
        }

        static if (!is(typeof(true_)))
        {
            private enum enumMixinStr_true_ = `enum true_ = 1;`;
            static if (is(typeof({ mixin(enumMixinStr_true_); })))
            {
                mixin(enumMixinStr_true_);
            }
        }

        static if (!is(typeof(false_)))
        {
            private enum enumMixinStr_false_ = `enum false_ = 0;`;
            static if (is(typeof({ mixin(enumMixinStr_false_); })))
            {
                mixin(enumMixinStr_false_);
            }
        }

        static if (!is(typeof(__bool_true_false_are_defined)))
        {
            private enum enumMixinStr___bool_true_false_are_defined = `enum __bool_true_false_are_defined = 1;`;
            static if (is(typeof({
                        mixin(enumMixinStr___bool_true_false_are_defined);
                    })))
            {
                mixin(enumMixinStr___bool_true_false_are_defined);
            }
        }
        static if (!is(typeof(NULL)))
        {
            private enum enumMixinStr_NULL = `enum NULL = ( cast( void * ) 0 );`;
            static if (is(typeof({ mixin(enumMixinStr_NULL); })))
            {
                mixin(enumMixinStr_NULL);
            }
        }

    }

    struct __va_list_tag;
}
