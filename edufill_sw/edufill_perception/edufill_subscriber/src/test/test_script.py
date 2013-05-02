#!/usr/bin/python
import roslib
roslib.load_manifest('edufill_subscriber')
import rospy
import geometry_msgs
import std_srvs.srv
import tf
import edufill_srvs.srv
        
# main
def main():
    rospy.init_node('test')

    ### tf listener
    tf_listener = tf.TransformListener()

    ##sss.move("arm", "initposition")
    ##sss.move("arm", "pregrasp_front_init")
    
    # BASE PLACEMENT   
    test_srv = rospy.ServiceProxy('/read_arm_joint_position', edufill_srvs.srv.ReadJointPositions) 
    print "wait for service: read_arm_joint_position"   
    rospy.wait_for_service('read_arm_joint_position', 30)
    # call base placement service
    response = test_srv()
    print "value", response

if __name__ == '__main__':
    main()
