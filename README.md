# rcld
ROS2 client library for Dlang


## For developer

### Developement environment

If you are vscode user, you can easily setup development environment with devcontainer feature. Please open the repository with vscode and reopen in container. The container has ROS2 environment and D compiler.

If you are not vscode user, please use [docker/Dockerfile](./docker/Dockerfile) or manually install packages listed in the Dockerfile.

### How to build and test

```shell
. /opt/ros/${ROS_DISTRO}/setup.bash
dub build
dub test
```

### Update rcl header

If you find something wrong (e.g. rcl C API is changed), the rcl headers in rcl_bind can be updated by the following command.

```shell
bash rcl_bind/generate_rcl/update.sh all
```

This will build docker container for the ROS_DISTRO and run conversion from rcl C header to D header by using [`dpp`](https://code.dlang.org/packages/dpp) inside the container. The argument `all` means operate for the all ROS_DISTROs supported in this package. Of course the ROS_DISTRO can be specified by `bash rcl_bind/generate_rcl/update.sh $ROS_DISTRO`.
