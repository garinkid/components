#!/usr/bin/env python

import rospy
import brics_actuator.msg
from brics_actuator.msg import JointPositions, JointValue, Poison

#move arm to a joint position
def move(joint_angle_1, joint_angle_2, joint_angle_3, joint_angle_4, joint_angle_5):
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



