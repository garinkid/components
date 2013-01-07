#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_perception_cmds')
import rospy
import std_srvs.srv
import edufill_srvs.srv
import hbrs_srvs.srv

# Move arm to a cartesian position
def extract_planes_cmd():
    plane_extractor_srv = rospy.ServiceProxy('/extract_planes',edufill_srvs.srv.ExtractPlanes)    
    rospy.wait_for_service('/extract_planes', 30)

    rospy.sleep(3)

    for i in range(20): 
        print "find object try: ", i
        resp = plane_extractor_srv()
          
        if (len(resp.planarpolygons) <= 0):
            rospy.loginfo('found no planes')
            rospy.sleep(0.1);
        else:    
            rospy.loginfo('found {0} planes'.format(len(resp.planarpolygons)))
            break
        
    if (len(resp.planarpolygons) <= 0):
        rospy.logerr("no planes found");
        plane_list = []            
        return 'failed'   
    else:
        plane_list = obj

    return plane_list


if __name__ == '__main__':
    rospy.init_node('extract_planes_service')
    plane_list = extract_planes_cmd()
    print plane_list


