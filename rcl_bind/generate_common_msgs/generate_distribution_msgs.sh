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
    local ros_distro=${1}
    local dc=ldc
    local tag=rcld_builder:${ros_distro}-${dc}

    temp_dir=$(mktemp -d)
    cp -r ../../ ${temp_dir}
    pushd ${temp_dir}
        task clean
        rm -rf ${delete_items[@]}
    popd

    docker build ../../docker --build-arg ROS_DISTRO=${ros_distro} --build-arg=${dc} -t ${tag}

    container_id=$(docker run -dt --rm ${tag})
    docker cp ${temp_dir} ${container_id}:/rcld
    docker exec -it -w /rcld ${container_id} bash -c -l -i \
        ". /opt/ros/${ROS_DISTRO}/setup.sh && bash rcl_bind/generate_common_msgs/generate_common_msgs.sh -r ${ROS_DISTRO}"
    docker cp ${container_id}:/rcld/rcl_bind/source ../../rcl_bind/
    docker stop ${container_id}
    unset container_id

    rm -rf ${temp_dir}
    unset temp_dir
}

run $1
