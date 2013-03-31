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

    test_srv = rospy.ServiceProxy('/set_mapping_action', edufill_srvs.srv.SetMapAction)    
    rospy.wait_for_service('set_mapping_action', 30)
    # call base placement service
    req = edufill_srvs.srv.SetMapActionRequest()
    req.action = 'stop'
    req.file_name = 'null'
    resp = test_srv(reqs)

if __name__ == '__main__':
    main()
