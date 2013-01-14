#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
#import move_base_relative
from move_base_relative import move_base_relative

if __name__=="__main__":
    rospy.init_node('move_base_relative_component')
    x_move = 0.5
    y_move = 0.5
    theta_rotate = -0.5
    goal_behaviour = [x_move,y_move,theta_rotate]
    result = move_base_relative(goal_behaviour)
    print result



