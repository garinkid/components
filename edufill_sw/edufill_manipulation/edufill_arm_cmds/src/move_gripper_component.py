#! /usr/bin/python

import rospy 
import roslib
roslib.load_manifest('edufill_arm_cmds')
from brics_actuator.msg import JointPositions, JointValue, Poison

#open or close the gripper
def to_pose(command):
    if isinstance(command,str):
        if command == "OPEN":
	    gripper_value = 0.0115  
	elif command == "CLOSE":
	    gripper_value = 0
        else:
            return 'wrong_command'
        to_joint_positions([gripper_value,gripper_value])

#control the gripper by gripper positions
def to_joint_positions(gripper_positions):

    left_gripper_val = gripper_positions[0]
    right_gripper_val = gripper_positions[1]
    pub = rospy.Publisher("/arm_1/gripper_controller/position_command", JointPositions)
    rospy.sleep(0.5)
    try:
        jp = JointPositions()
	jv1 = JointValue()
	jv1.joint_uri = "gripper_finger_joint_l"
	jv1.value = left_gripper_val
	jv1.unit = "m"
	jv2 = JointValue()
	jv2.joint_uri = "gripper_finger_joint_r"
 	jv2.value = right_gripper_val
	jv2.unit = "m"
	p = Poison()
 	jp.poisonStamp = p
	jp.positions = [jv1, jv2] #list
	pub.publish(jp)
        rospy.sleep(1.0)
    except Exception, e:
        print e


if __name__ == '__main__':
    # range : 0 - 0.0115 metres  
    rospy.init_node('move_gripper_component')
    to_joint_positions([0.0115,0.0115])
    


