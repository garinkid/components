#!/bin/bash

OUT_DIR=/home/alex/.ros/edufill_object_detection_out

COLOR='yellow'
test $# -ge 1 && COLOR=$1
case "$COLOR" in
    red) ;;
    green) ;;
    blue) ;;
    yellow) ;;
    cyan) ;;
    magenta) ;;
    *)
        echo "USAGE: $0 <color>"
        exit 1
esac



#echo "Clear out first? "
#read antw
#test "$antw" == "Y" -a "$antw" == "y" && rm $OUT_DIR/*
rm $OUT_DIR/*
rosservice call /edufill_objdetector/detect_cubes "color: '$COLOR'
min_size: 10
max_size: 300"
conts_file=$(ls -rt $OUT_DIR | grep resu| tail -n1)
test ! -z "$conts_file" && kolourpaint $OUT_DIR/$conts_file
#echo -n "result> "
#read result
#echo result: $result
