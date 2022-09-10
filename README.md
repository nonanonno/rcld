# rcld
ROS2 client library for Dlang

## Sub packages

- [rcl_bind](rcl_bind) : D binding of RCL, RMW, graph and basic interfaces. And also has D wrapper of basic interfaces.
- [msg_gen](msg_gen) : ROS2 message generation tool for Dlang.
- [rosidl_parser](rosidl_parser) : A library to parse rosidl (used by msg_gen).
- [test_helper](test_helper) : A helper package for testing. Including IDL file.

### rcl_bind

`rcl_bind` has two features. One is a binding of RCL and RWM C API. And another is wrappers of basic interfaces. This is because some of core feature of ROS2 client library requires basic interfaces such as `builtin_interfaces` and `unique_identifier_msgs` (both are for Action). And to implement convenience features such as rosgraph, I decided to include all of [rcl_interfaces](https://github.com/ros2/rcl_interfaces) and [unique_identifier_msgs](https://github.com/ros2/unique_identifier_msgs) by default. These msgs are ignored in `msg_gen`.

### msg_gen

`msg_gen` is a tool to generate ROS2 message packages for Dlang. `msg_gen` creates 1. DuB packages for ROS2 message, 2. D binding of C message struct (rosidl_typesupport_c), 3. D struct for the C message struct. Type `dub run rcld:msg_gen -- --help` for more information.

### rosidl_parser

A ROSIDL parser library used by msg_gen internally. But can be potentially used to generate messages for other language.

### test_helper

`test_helper` has the following modules.

- `utils` : Utility
- `test_msgs` : Holds test_msgs' IDL as text, provides ground truth of the messages. The messages are comes from [here](https://github.com/ros2/test_interface_files)
- `domain_coordinator` : To serve separated ROS_DOMAIN_ID for testing.

## For developer

### Development environment

**For vscode user**

User devcontainer to setup development environment.

**For non vscode user**

[Dockerfile](./docker/Dockerfile) can be used. If you want to setup on your own host, the following packages are required.

- [ROS2](https://docs.ros.org/en/rolling/index.html)
- [D Compiler](https://dlang.org/)
- [Task](https://taskfile.dev/) (for convenience)

### How to build and test

```shell
. /opt/ros/${ROS_DISTRO}/setup.sh

# build
task build:all

# test
task test:all

# clean generated files
task clean
```

### Misc

**Update rcl_bind**

When something wrong are found (e.g. rcl C API changed, new distribution is release, etc.), `rcl_bind` package needs to be updated. To update it, command the follows.

```shell
# update D binding for RCL, RMW, basic interfaces C API.
bash rcl_bind/generate_rcl/update.sh <ros_distro>
# Create D wrapper message packages.
bash rcl_bind/generate_common_msgs/generate_common_msgs -r <ros_distro>
```

This process requires Docker.
