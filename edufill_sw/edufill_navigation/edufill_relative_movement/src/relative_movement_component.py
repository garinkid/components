#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_relative_movement')
import rospy

from geometry_msgs.msg import Pose2D
#from yb_simple_move.srv import MoveToRelativePos
# from yb_simple_move.srv import MoveToRelativePos  
# import yb_simple_move.srv
import edufill_srvs.srv

def to_goal(goal):
	pose = Pose2D()
	pose.x = goal[0]
	pose.y = goal[1]
	pose.theta = goal[2]
	rospy.wait_for_service('/move_to_relative_pos')
	try:
		relative_motion= rospy.ServiceProxy('/move_to_relative_pos', edufill_srvs.srv.MoveToRelativePos)
		resp = relative_motion(pose)
		return resp.result
	except rospy.ServiceException, e:
		print "Service call failed: %s"%e



if __name__ == '__main__':
	rospy.init_node('simple_move')
	# while not rospy.is_shutdown():
	to_goal([0.6,0.8,0.4])	