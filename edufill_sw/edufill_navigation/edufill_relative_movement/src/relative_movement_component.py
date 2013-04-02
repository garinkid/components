#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_relative_movement')
import rospy

from geometry_msgs.msg import PoseStamped

def to_goal(goal):
	while not rospy.is_shutdown():
		pose = PoseStamped()
		pose.header.frame_id = "/map"
		pose.header.stamp = rospy.Time.now()
		pose.pose.position.x = goal[0]
		pose.pose.position.y = goal[1]
		pose.pose.position.z = goal[2]    
		pose.pose.orientation.x = goal[3]
		pose.pose.orientation.y = goal[4]
		pose.pose.orientation.z = goal[5]
		pose.pose.orientation.w = goal[6]
		pub= rospy.Publisher("/move_base_simple/goal", PoseStamped)
		pub.publish(pose)

if __name__ == '__main__':
	rospy.init_node('simple_move')
	# while not rospy.is_shutdown():
	to_goal([0.6,0.8,1.3,0.4,1.9,2.7,0.5])	