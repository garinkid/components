#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_perception_cmds')
import rospy
import std_srvs.srv
import edufill_srvs.srv
import hbrs_srvs.srv

# Move arm to a cartesian position
def detect_objects():
    '''
    object_finder_srv_start = rospy.ServiceProxy('/edufill_perception/object_segmentation/start',std_srvs.srv.Empty)    
    rospy.wait_for_service('/edufill_perception/object_segmentation/start', 30)

    try: 
        response = object_finder_srv_start()
    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s", object_finder_srv_start, e)  
        return 'srv_call_failed'
    '''
    object_finder_srv = rospy.ServiceProxy('/edufill_perception/object_segmentation/get_segmented_objects',hbrs_srvs.srv.GetObjects)    
    rospy.wait_for_service('/edufill_perception/object_segmentation/get_segmented_objects', 30)

    rospy.sleep(3)

    for i in range(20): 
        print "find object try: ", i
        resp = object_finder_srv()
          
        if (len(resp.objects) <= 0):
            rospy.loginfo('found no objects')
            rospy.sleep(0.1);
        else:    
            rospy.loginfo('found {0} objects'.format(len(resp.objects)))
            break
        
    if (len(resp.objects) <= 0):
        rospy.logerr("no graspable objects found");
        object_list = []            
        return 'failed'   
    else:
        for obj in resp.objects:
            if obj.pose.pose.position.z <=0.5 and obj.pose.pose.position.z >=30:
                continue

            object_list = obj

            return object_list


if __name__ == '__main__':
    rospy.init_node('detect_objects')
    obj_list = detect_objects()
    print obj_list.pose


