#!/usr/bin/env python

import rospy
import brics_actuator.msg
from brics_actuator.msg import JointPositions, JointValue, Poison

# Move arm to a joint position

# Move arm to a given joint positions
def joint_positions(joint_angle_1, joint_angle_2, joint_angle_3, joint_angle_4, joint_angle_5):
    pub = rospy.Publisher('arm_1/arm_controller/position_command', JointPositions)
    rospy.init_node('move_arm_joint_position_components')
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
        pub.publish(jp)

        
    except Exception, e:
        print e


# Move arm to a given pose uploaded to rosparam 'arm_pose'
# The poses are define in $(find edufill_default_config)/youbot-edufill1/arm_poses.yaml
def pose(pose):
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
		joint_positions(joints[0], joints[1], joints[2], joints[3], joints[4])			
	else:
		print 'pose ' + pose + ' is not defined'
		return


