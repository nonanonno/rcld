#!/bin/bash

cd $(dirname $0)
rcld=$(cd ../../; pwd)

targets=(
    "action_msgs"
    "builtin_interfaces"
    "composition_interfaces"
    "lifecycle_msgs"
    "rcl_interfaces"
    "rosgraph_msgs"
    "statistics_msgs"
    "unique_identifier_msgs"
)

dst=../source
pushd $dst
rm -rf ${targets[@]}
mkdir ${targets[@]}
popd

tmpd=$(mktemp -d)

echo $tmpd
dub run --root ../../ :msg_gen -- $tmpd --dry-run -p ${targets[@]} 
dub run --root ../../ :msg_gen --  $tmpd -p ${targets[@]} 

pushd $dst
find $tmpd -name '*.d' | grep -v '/c/' | awk -F '/source/' '{print $0 " " $2}' | xargs -n 2 cp
find $tmpd -name '*.d' | grep -v '/c/' | awk -F '/source/' '{print $2}' | xargs -n 1 sed -i -e "s/.*\.c\..*$//g"
find $tmpd -name '*.d' | grep -v '/c/' | awk -F '/source/' '{print $2}' | xargs dub run -y -q dfmt -- -i -c $rcld
popd
rm -rf $tmpd

