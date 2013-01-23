#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
#import move_base_relative
import move_base_component

if __name__=="__main__":
    rospy.init_node('move_base_command')
    # "forward","backward","right","left","rotate_anticlockwise","rotate_clockwise"
    motion_direction = "forward"
    # duration in seconds
    duration = 10
    result = move_base_component.command(motion_direction,duration)
    print result



