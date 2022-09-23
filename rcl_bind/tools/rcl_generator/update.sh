#!/bin/bash

set -e

cd $(dirname $0)

ROS_DISTROS=(
    foxy
    galactic
    humble
    rolling
)

function generate() {
    cp ../../../.editorconfig ./
    local ros_distro=${1}
    echo Executing ${ros_distro} ...
    docker build . -t rcl_builder:${ros_distro} --build-arg ROS_DISTRO=${ros_distro}
    docker run -it --rm rcl_builder:${ros_distro} > ../../source/rcl/${ros_distro}.d
    echo Done ${ros_distro}
}

function usage_exit() {
    local ros_distro
    echo "Usage: $0 target (all|ROS_DISTRO)" 1>&2
    echo
    echo "  Generate rcl header for Dlang with specific ROS2 distribution."
    echo "  The output D header will be placed to '../../source/rcl/<ros_distro>.d'."
    echo "  Supported ROS_DISTROs:" 1>&2
    for ros_distro in ${ROS_DISTROS[@]}; do
        echo "    - " $ros_distro
    done
    exit 1
}

function exists() {
    local ros_distro
    for ros_distro in ${ROS_DISTROS[@]}; do
        if [[ ${ros_distro} = ${1} ]];then
            return 0
        fi
    done
    return 1
}

target=${1}

if [ -z "${target}" ]; then
    usage_exit
fi

if [ "${target}" = "all" ]; then
    for ros_distro in ${ROS_DISTROS[@]}; do
        generate ${ros_distro}
    done
    exit 0
fi

if exists ${target}; then
    generate ${target}
else
    echo ${target} is not found 1>&2
    usage_exit
fi
