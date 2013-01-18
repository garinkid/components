#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
#import move_base_relative
from move_base_command import move_base_command

if __name__=="__main__":
    rospy.init_node('move_base_command')
    goal_behaviour = "forward"
    result = move_base_command(goal_behaviour)
    goal_behaviour = "left"
    result = move_base_command(goal_behaviour)
    print result



