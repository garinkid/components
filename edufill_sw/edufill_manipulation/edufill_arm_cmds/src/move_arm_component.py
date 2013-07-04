#!/usr/bin/env python

import rospy
import math
import os
from geometry_msgs.msg import TwistStamped

import arm_kinematics_geometrical_solution
import arm_kinematics_analytical_solution
import brics_actuator.msg
from brics_actuator.msg import JointVelocities, JointPositions, JointValue, Poison 
from sensor_msgs.msg import JointState
from nxt_msgs.msg import JointCommand

# Move arm to joint positions
def to_joint_positions(joint_angles):
    if (os.environ.get('ROBOT') == 'nxt-arm'):
        to_joint_positions_nxt(joint_angles)
    elif (os.environ.get('ROBOT') == 'youbot-edufill2'):
        to_joint_positions_youbot(joint_angles)

# Move arm to joint positions for youbot
def to_joint_positions_youbot(joint_angles):
    joint_angle_1 = joint_angles[0]
    joint_angle_2 = joint_angles[1]
    joint_angle_3 = joint_angles[2]
    joint_angle_4 = joint_angles[3]
    joint_angle_5 = joint_angles[4]
    pub = rospy.Publisher('arm_1/arm_controller/position_command', JointPositions)
    rospy.sleep(0.5) 
    try:
        jp = JointPositions()
        
        jv1 = JointValue()
        jv1.joint_uri = "arm_joint_1"
        jv1.value = joint_angle_1
        jv1.unit = "rad"
        
        jv2 = JointValue()
        jv2.joint_uri = "arm_joint_2"
        jv2.value = joint_angle_2
        jv2.unit = "rad"

        jv3 = JointValue()
        jv3.joint_uri = "arm_joint_3"
        jv3.value = joint_angle_3
        jv3.unit = "rad"
        
        jv4 = JointValue()
        jv4.joint_uri = "arm_joint_4"
        jv4.value = joint_angle_4
        jv4.unit = "rad"
        
        jv5 = JointValue()
        jv5.joint_uri = "arm_joint_5"
        jv5.value = joint_angle_5
        jv5.unit = "rad"
        
        p = Poison()
        #print p
       
        jp.poisonStamp = p
        
        jp.positions = [jv1, jv2, jv3, jv4, jv5]
        
        pub.publish(jp)

        return 'arm moved successfully'

    except Exception, e:
        print e
        return 'arm move failure'

# Move arm to joint positions for nxt
def to_joint_positions_nxt(joint_angles):
    #homing = [0, 2.0735, -2.65635];
    gear_ratios = [7, 5, 5];
    joint_angle_1 = joint_angles[0]
    joint_angle_2 = joint_angles[1]
    joint_angle_3 = joint_angles[2]
    pub = rospy.Publisher('position_controller', JointState)
    rospy.sleep(0.5) 
    try:
        # Create msg
        jp = JointState()
        # Set message array sizes
        jp.name = [None]*3
        jp.position = [None]*3
        # Fill message
        jp.name[0] = "arm_joint_1" 
        jp.position[0] = (joint_angle_1) * gear_ratios[0]
        jp.name[1] = "arm_joint_2"
        jp.position[1] = (joint_angle_2) * gear_ratios[1]
        jp.name[2] = "arm_joint_3"
        jp.position[2] = (joint_angle_3) * gear_ratios[2]
        r = rospy.Rate(500)
        for c in range(1,5):
            pub.publish(jp)
            r.sleep()
        return 'arm command move issued successfully'
    except Exception, e:
        print e
        return 'arm move failure'

def joint_velocities(joint_velocities):
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

def cartesian_velocities(xyzrpy_vel,reference_frame):
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


# Move arm to a given pose uploaded to rosparam 'arm_pose'
# The poses are define in $(find edufill_default_config)/youbot-edufill1/arm_poses.yaml

def to_pose(pose):
	if type(pose) is not str:
		print 'pose input should be string'
		return
	if not rospy.has_param('/script_server/arm'):
		print 'no arm pose parameter defined'
		return

	pose_list = rospy.get_param('/script_server/arm')

	if pose_list.has_key(pose) and type(pose_list[pose]) is list and len(pose_list[pose]) is 5:
		print 'moving to pose ' + pose 
		joints = pose_list[pose]
		to_joint_positions([joints[0], joints[1], joints[2], joints[3], joints[4]])			
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
    
