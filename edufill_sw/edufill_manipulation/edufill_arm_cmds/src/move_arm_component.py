#!/usr/bin/env python

import rospy
import math
import os

from geometry_msgs.msg import TwistStamped
from brics_actuator.msg import JointVelocities, JointPositions, JointValue, Poison 
from sensor_msgs.msg import JointState
from nxt_msgs.msg import JointCommand

#from arm_kinematics_analytical_solution import *
#from arm_kinematics_geometrical_solution import *
import arm_kinematics

# Move arm to joint positions
def to_cartesian_pose(xyzrpy,reference_frame,solver):
		#print solver
		ks = arm_kinematics.KinematicsSolver(solver)
		iksolver_state = ks.ik_solution.check_ik_solver_has_solution(xyzrpy,reference_frame)
		if (iksolver_state):
			ik_result = ks.ik_solution.get_ik_solution(xyzrpy,reference_frame)
			status_move = to_joint_positions(ik_result)
			return status_move          
		else:
			return 'no solution found'


def to_joint_positions(joint_angles):
    numberOfJoints = rospy.get_param('number_of_arm_joints')
    print numberOfJoints
    jp = JointState()
    pub = rospy.Publisher('arm_controller_handler/position_command', JointState)
    rospy.sleep(0.5)
    #joint_angles = rospy.get_param('/script_server/arm/initposition')
    try:
        #print jp
        jp.name = ['arm_joint_'+str(i+1) for i in range(numberOfJoints)]
        jp.position = [joint_angles[i] for i in range(numberOfJoints)]
        for c in range(1,5):
            pub.publish(jp)
            rospy.sleep(0.1)
        return 'successfully published to arm_controller_handler/position_command'
    except Exception, e:
        return 'error publishing to arm_controller_handler/position_command'

def joint_velocities(joint_velocities):
		robot = os.getenv('ROBOT')
		if robot == 'youbot-edufill':
				joint_velocity_1 = joint_velocities[0]
				joint_velocity_2 = joint_velocities[1]
				joint_velocity_3 = joint_velocities[2]
				joint_velocity_4 = joint_velocities[3]
				joint_velocity_5 = joint_velocities[4]
				pub = rospy.Publisher('arm_1/arm_controller/velocity_command', JointVelocities)
				rospy.sleep(0.5) 
				try:
						jv = JointVelocities()

						jv1 = JointValue()
						jv1.joint_uri = "arm_joint_1"
						jv1.value = joint_velocity_1
						jv1.unit = "s^-1 rad"

						jv2 = JointValue()
						jv2.joint_uri = "arm_joint_2"
						jv2.value = joint_velocity_2
						jv2.unit = "s^-1 rad"

						jv3 = JointValue()
						jv3.joint_uri = "arm_joint_3"
						jv3.value = joint_velocity_3
						jv3.unit = "s^-1 rad"

						jv4 = JointValue()
						jv4.joint_uri = "arm_joint_4"
						jv4.value = joint_velocity_4
						jv4.unit = "s^-1 rad"

						jv5 = JointValue()
						jv5.joint_uri = "arm_joint_5"
						jv5.value = joint_velocity_5
						jv5.unit = "s^-1 rad"

						p = Poison()
						#print p

						jv.poisonStamp = p

						jv.velocities = [jv1, jv2, jv3, jv4, jv5]

						pub.publish(jv)

						return 'arm moved successfully'

				except Exception, e:
						print e
						return 'arm move failure'
		else:
				return 'arm motion not possible because of unavailable functionality in '+robot

def cartesian_velocities(xyzrpy_vel,reference_frame):
		robot = os.getenv('ROBOT')
		if robot == 'youbot-edufill':
				linx  = xyzrpy_vel[0]
				liny  = xyzrpy_vel[1]
				linz  = xyzrpy_vel[2]
				angx  = xyzrpy_vel[3]
				angy  = xyzrpy_vel[4]
				angz  = xyzrpy_vel[5]
				pub = rospy.Publisher('arm_1/arm_cart_control/cartesian_velocity_command',TwistStamped)
				rospy.sleep(0.5) 
				try:
				    cv = TwistStamped()
				    cv.header.frame_id = reference_frame
				    cv.twist.linear.x = linx
				    cv.twist.linear.y = liny
				    cv.twist.linear.z = linz
				    cv.twist.angular.x = angx
				    cv.twist.angular.y = angy
				    cv.twist.angular.z = angz
				    pub.publish(cv)
				    return 'cartesian velocity command published'
				except Exception, e:
				    print e
				    return 'cartesian velocity command not published'	
		else:
				return 'arm motion not possible because of unavailable functionality in '+robot


# Move arm to a given pose uploaded to rosparam 'arm_pose'
# The poses are define in $(find edufill_default_config)/youbot-edufill1/arm_poses.yaml

def to_pose(pose):
	numberOfJoints = rospy.get_param('number_of_arm_joints')
	if type(pose) is not str:
		print 'pose input should be string'
		return
	if not rospy.has_param('/script_server/arm'):
		print 'no arm pose parameter defined'
		return

	pose_list = rospy.get_param('/script_server/arm')

	if pose_list.has_key(pose) and type(pose_list[pose]) is list and len(pose_list[pose]) is numberOfJoints:
		print 'moving to pose ' + pose 
		joints = pose_list[pose]
		to_joint_positions(joints)			
	else:
		print 'pose ' + pose + ' is not defined'
		return

if __name__ == '__main__':
    rospy.init_node('move_arm_component')
    #to_pose('pregrasp_standing_mex')
    #rospy.sleep(6) 

    # Pointing upwards (internal home position of inverse kinematics)
    x = 0.024 + 0.033
    y = 0
    z = 0.535
    roll = 0 
    pitch = 0
    yaw = 0
    result = to_cartesian_pose([x,y,z,roll,pitch,yaw], "/base_link")
    print result

    time = 5.0
    time_taken = 0
    init_time = rospy.get_rostime().secs 
    while(init_time <= 0):
        init_time = rospy.get_rostime().secs  
    print 'init time recorded is ' + repr(init_time) +' secs'
    #timer = rospy.Timer(rospy.Duration(1), my_callback)
    while(time_taken<time):
        now = rospy.get_rostime().secs 
        time_taken =  now - init_time
        result = cartesian_velocities([0,0.5,0.0,0,0,0],"/base_link")
    result = cartesian_velocities([0,0,0,0,0,0],"/base_link")
    #joint_angles = [2.97198, 2.54153, -2.36521, 3.19699, 3.00695]
    #result = to_joint_positions(joint_angles)
    #result = to_pose('zeroposition')
    print result

    # joint_angles = [2.97198, 2.54153, -2.36521, 3.19699, 3.00695]
    # result = to_joint_positions(joint_angles)
    # result = to_pose('zeroposition')
    result = to_cartesian_pose([0.024, 0.033 + 0.3, 0.115, 0, math.pi / 2.0, math.pi / 2.0])
    print result


    joint_angles = [2.97198, 2.54153, -2.36521, 3.19699, 3.00695]
    result = to_joint_positions(joint_angles)
    
