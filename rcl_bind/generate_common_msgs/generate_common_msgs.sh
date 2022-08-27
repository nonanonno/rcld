#!/bin/bash

set -e

TARGETS=(
    "action_msgs"
    "builtin_interfaces"
    "composition_interfaces"
    "lifecycle_msgs"
    "rcl_interfaces"
    "rosgraph_msgs"
    "statistics_msgs"
    "unique_identifier_msgs"
)

DEFAULT_OUTPUT=$(realpath $(dirname $0)/../../rcl_bind/source)

function usage() {
    mes=$(cat << EOS
Usage: $0 [-o OUTDIR] -r ROS_DISTRO

Generate ROS2 common interfaces as D module.

Required arguments:
  -r\tROS2 distribution.

Optional arguments:
  -o\tOutput directory (Default: ${DEFAULT_OUTPUT}).
  -h\tShow this help message and exit.
EOS
)
    echo -e "${mes}"
    exit 0
}

function generate() {
    local ros_distro=$1
    local output=$2
    local rcld=$(realpath $(dirname $0)/../../)
    local tmpd=$(mktemp -d)

    dub run -q --root ${rcld} :msg_gen -- ${tmpd} -p ${TARGETS[@]}
    find ${tmpd} -name '*.d' | grep '/c/' | xargs rm -rf
    find ${tmpd} -name '*.d' | xargs -n 1 sed -i -E "1s/\\.(\w+);/.\1.${ros_distro};/g"
    find ${tmpd} -name '*.d' | xargs -n 1 sed -i -e "/.*\.c\..*/d"
    find ${tmpd} -name '*.d' | xargs dub run -y -q dfmt -- -i -c ${rcld}

    for target in ${TARGETS[@]}; do
        for interface_file in $(find ${tmpd}/${target}/source/${target} -name '*.d'); do
            interface=$(basename ${interface_file} | sed 's/.d//g')
            mkdir -p ${output}/${target}/${interface}
            cp ${interface_file} ${output}/${target}/${interface}/${ros_distro}.d
        done
    done

    rm -rf ${tmpd}
}

# ---- main ----
args=$(getopt o:r:h $*) || exit 1
set -- $args

output=${DEFAULT_OUTPUT}

for opt in "$@"; do
    case $opt in
        -o) output=$2; shift 2 ;;
        -r) ros_distro=$2; shift 2 ;;
        -h) usage ;;
        --) shift; break ;;
    esac
done

if [ -z "${ros_distro}" ]; then
    echo "!!! -r ROS_DISTRO is required."
    usage
fi

generate ${ros_distro} ${output}
