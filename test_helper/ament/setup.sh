#!/bin/bash

cd $(dirname $0)


if [ -d install ]; then
    echo test_msgs is already installed.
    exit 0
fi

echo Start creating test_msgs

tempd=$(mktemp -d)

set -e

cp src $tempd/src -r

pushd $tempd
git clone -b $ROS_DISTRO https://github.com/ros2/test_interface_files
colcon build
popd

cp $tempd/install ./ -r

rm -rf $tempd


