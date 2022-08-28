#!/bin/bash

set -e
cd $(dirname $0)

DELETE_ITEMS=(
    .devcontainer
    .git
    .gitignore
    .vscode
    dist_test
    docker
)

DEFAULT_ROS_DISTROS=(
    foxy
    galactic
    humble
    rolling
)

DEFAULT_D_COMPILERS=(
    dmd
    ldc
)

function finally() {
    # Delete temporary resources even if the process is interrupted.
    # `temp_dir` and `container_id` is set in function `run`.
    if [ -n "${temp_dir}" ]; then
        rm -rf ${temp_dir}
    fi
    if [ -n "${container_id}" ]; then
        docker stop ${container_id}
    fi
}
trap finally EXIT

function run() {
    # Build and test runner.
    local ros_distro=${1}
    local dc=${2}

    echo Executing ${ros_distro} ${dc} ...

    temp_dir=$(mktemp -d)
    cp -r ../ ${temp_dir}
    pushd ${temp_dir}
        task clean
        rm -rf ${delete_items[@]}
    popd

    tag=rcld_builder:${ros_distro}-${dc}

    docker build ../docker --build-arg ROS_DISTRO=${ros_distro} --build-arg DC=${dc} -t ${tag}

    container_id=$(docker run -dt --rm ${tag})
    docker cp ${temp_dir} ${container_id}:/rcld
    docker exec -it -w /rcld ${container_id} bash -c -l -i '. /opt/ros/$ROS_DISTRO/setup.sh && task build:all test:all'
    docker stop ${container_id}
    unset container_id

    rm -rf ${temp_dir}
    unset temp_dir
}

function usage() {
    cat << EOS
Usage: $0 [-r ROS_DISTRO] [-d D_COMPILER]

Run testing with specific ROS distribution and D compiler.
If nothing is specified, the test will be executed with the combination of the
following ROS distribution and D compiler.

 * ROS_DISTRO: ${DEFAULT_ROS_DISTROS[@]}
 * D_COMPILER: ${DEFAULT_D_COMPILERS[@]}

Optional arguments:
    -d  D Compiler.
    -r  ROS2 distribution.
    -h  Show this help message and exit.
EOS
    exit 0
}

# ---- main ----
args=$(getopt r:d:h $*) || exit 1
set -- $args

for opt in "$@"; do
    case $opt in
        -r) ros_distro=$2; shift 2 ;;
        -d) dc=$2; shift 2 ;;
        -h) usage ;;
        --) shift; break ;;
    esac
done

ros_targets=${ros_distro:-${DEFAULT_ROS_DISTROS[@]}}
dc_targets=${dc:-${DEFAULT_D_COMPILERS}}

for ros_target in ${ros_targets[@]}; do
    for dc_target in ${dc_targets[@]}; do
        run ${ros_target} ${dc_target}
    done
done
