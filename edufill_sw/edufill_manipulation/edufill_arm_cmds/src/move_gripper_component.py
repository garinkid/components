#! /usr/bin/python

import rospy 
import roslib
roslib.load_manifest('edufill_arm_cmds')
from brics_actuator.msg import JointPositions, JointValue, Poison

#Open or close the gripper
def move(command):
    if isinstance(command,str):
        if command == "OPEN":
	    gripper_value = 0.0115  
	elif command == "CLOSE":
	    gripper_value = 0
        else:
            return 'wrong_command'
    else:
        # range : 0 - 0.0115 metres  
        gripper_value = command

    pub = rospy.Publisher("/arm_1/gripper_controller/position_command", JointPositions)

    rospy.sleep(0.5)

    try:
        jp = JointPositions()
	jv1 = JointValue()
	jv1.joint_uri = "gripper_finger_joint_l"
	jv1.value = gripper_value
	jv1.unit = "m"
	jv2 = JointValue()
	jv2.joint_uri = "gripper_finger_joint_r"
 	jv2.value = gripper_value
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
    move(0.0075)
    


