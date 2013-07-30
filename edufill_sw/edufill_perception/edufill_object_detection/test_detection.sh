#!/bin/bash

DETECT_CMD=/home/alex/EduFill/components/edufill_sw/edufill_perception/edufill_perception_cmds/src/detect_objects.py

while [ 1 ]; do
    echo -n "color [r, g, b, c, m, y]> "
    read color
    test "$color" == "r" && color="red"
    test "$color" == "g" && color="green"
    test "$color" == "b" && color="blue"
    test "$color" == "c" && color="cyan"
    test "$color" == "m" && color="magenta"
    test "$color" == "y" && color="yellow"

    ans=$($DETECT_CMD $color|tail -n1)
    last=$(ls -1rt ~/.ros/edufill_object_detection_out/conts*|tail -n1)
    eog $last
done
