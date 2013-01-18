#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
#import move_base_relative
from extract_planes import extract_planes_cmd

if __name__=="__main__":
    rospy.init_node('extract_planes')
    result = extract_planes_cmd()
    print result



