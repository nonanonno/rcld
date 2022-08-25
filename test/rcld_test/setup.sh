#!/bin/bash

cd $(dirname $0)

if [ ! -d .dub/packages/std_msgs ]; then
    dub run --root ../../msg_gen -q -- .dub/packages
fi
