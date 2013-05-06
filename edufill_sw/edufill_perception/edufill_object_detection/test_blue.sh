#!/bin/bash

rosservice call /edufill_objdetector/detect_cube "color: 'blue'
min_size: 10
max_size: 100"
