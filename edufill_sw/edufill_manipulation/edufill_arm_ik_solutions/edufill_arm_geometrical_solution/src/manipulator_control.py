#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_arm_geometrical_solution')
import rospy

import edufill_srvs.srv
import rospy

def to_cartesian_pose(goal):

    rospy.wait_for_service('cartesianPose')
    try:
        cartesianPose = rospy.ServiceProxy('cartesianPose', edufill_srvs.srv.CartesianPose)
        cartesianPose(goal)
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e
if __name__ == '__main__':
	rospy.init_node('simple_iks')
	while not rospy.is_shutdown():
		to_cartesian_pose([0.057,0.09,0.535,0,0,0])	