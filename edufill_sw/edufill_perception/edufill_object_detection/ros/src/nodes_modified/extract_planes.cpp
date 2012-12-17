#include "ros/ros.h"
#include "edufill_srvs/ExtractPlanes.h"
#include "object_candidate_extraction.h"

bool extract_planes(edufill_srvs::ExtractPlanes::Request  &req,
         edufill_srvs::ExtractPlanes::Response &res)
{

    //get input point cloud and prepare them
    sensor_msgs::PointCloud2::ConstPtr const_input_cloud;
	sensor_msgs::PointCloud2 input_cloud;
	pcl::PointCloud<pcl::PointXYZRGB> point_cloud;
	do
	{
		const_input_cloud = ros::topic::waitForMessage<sensor_msgs::PointCloud2>("/camera/rgb/points", _nh, ros::Duration(5));
		std::cout << "1" << std::endl;
		input_cloud = *const_input_cloud;

	}while(!PreparePointCloud(input_cloud, point_cloud));

    //Prepare for plane segmentation
    pcl::PointCloud<pcl::PointXYZRGBNormal> planar_point_cloud;
	std::vector<structPlanarSurface> hierarchyPlanes
   	pcl::PointCloud<pcl::PointXYZRGBNormal> total_point_cloud,point_cloud_normal;

   _surfaces_points_pub = pn.advertise<sensor_msgs::PointCloud2>("segmented_surfaces_points", 1);
    ROS_INFO("Publishing on 'segmented_surfaces_points' topic");

    horizontalSurfaceExtractor = CPlaneExtraction();

    std::vector<structPlanarSurface> &hierarchyPlanes;

    hierarchyPlanes = horizontalSurfaceExtractor.extractMultiplePlanes(
	    		point_cloud_normal, planar_point_cloud, clusteredPlanes, 2)

    hbrs_msgs::Plane[]  plane_list;

    res.Plane_list = plane_list;
  
      PublishPointClouds(clustered_planes, _surfaces_points_pub);  

     // ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
     // ROS_INFO("sending back response: [%ld]", (long int)res.sum);
      return true;
}

bool PreparePointCloud(sensor_msgs::PointCloud2 &input, pcl::PointCloud<pcl::PointXYZRGB> &output)
{
	if ((input.width <= 0) || (input.height <= 0) || (input.data.empty())) {
		ROS_INFO_ONCE("[%s] pointCloud Msg empty", _node_name.c_str());
		return false;
	}


	sensor_msgs::PointCloud2 point_cloud_transformed;

	std::string from_frame = input.header.frame_id;
	std::string to_frame = "/base_link";
	if (!_tool_box.transformPointCloud(_tf_listener, from_frame, to_frame, input, point_cloud_transformed)) {
		 ROS_INFO_ONCE("[%s] pointCloud tf transform...failed", _node_name.c_str());
		 return false;
	}
	pcl::fromROSMsg(point_cloud_transformed, output);

	output = _tool_box.filterDistance(output, _dist_min_x, _dist_max_x, "x");
	output = _tool_box.filterDistance(output, _dist_min_y, _dist_max_y, "y");
	output = _tool_box.filterDistance(output, _dist_min_z, _dist_max_z, "z");

	_tool_box.subsampling(output, this->_downsampling_distance);

	if (output.points.empty()) {
		ROS_INFO_ONCE("[%s] point cloud empty after filtering", _node_name.c_str());
		return false;
	}

	return true;
}

    ros::NodeHandle _nh;
    ros::Publisher _objects_points_pub;
    ros::Publisher _surfaces_points_pub;
    ros::Publisher _objects_pub;
    ros::Subscriber _cluster_sub;
    ros::ServiceServer _get_segmented_objects_srv;
    CObjectCandidateExtraction *_object_candidate_extractor;
    CToolBoxROS _tool_box;
    tf::TransformListener _tf_listener;
    std::string _node_name;
    std::string _camera_frame;
    double _downsampling_distance;

    RoiExtraction *_roi_extractor;
    sensor_msgs::CvBridge _bridge;
    hbrs_srvs::GetObjects::Response _last_segmented_objects;

    bool _extract_obj_in_rgb_img;
    double _dist_min_x;
    double _dist_max_x;
    double _dist_min_y;
    double _dist_max_y;
    double _dist_min_z;
    double _dist_max_z;

int main(int argc, char **argv)
{


    ros::init(argc, argv, "extract_planes");
    ros::NodeHandle n;
    ros::ServiceServer service = n.advertiseService("extract_planes", extract_planes);
    ROS_INFO("");
    ros::spin();
    return 0;
}
