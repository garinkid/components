/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_common/edufill_srvs/srv/ReadOdom.srv */
#ifndef EDUFILL_SRVS_SERVICE_READODOM_H
#define EDUFILL_SRVS_SERVICE_READODOM_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"

#include "ros/service_traits.h"



#include "nav_msgs/Odometry.h"

namespace edufill_srvs
{
template <class ContainerAllocator>
struct ReadOdomRequest_ {
  typedef ReadOdomRequest_<ContainerAllocator> Type;

  ReadOdomRequest_()
  {
  }

  ReadOdomRequest_(const ContainerAllocator& _alloc)
  {
  }


  typedef boost::shared_ptr< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct ReadOdomRequest
typedef  ::edufill_srvs::ReadOdomRequest_<std::allocator<void> > ReadOdomRequest;

typedef boost::shared_ptr< ::edufill_srvs::ReadOdomRequest> ReadOdomRequestPtr;
typedef boost::shared_ptr< ::edufill_srvs::ReadOdomRequest const> ReadOdomRequestConstPtr;


template <class ContainerAllocator>
struct ReadOdomResponse_ {
  typedef ReadOdomResponse_<ContainerAllocator> Type;

  ReadOdomResponse_()
  : odom_data()
  {
  }

  ReadOdomResponse_(const ContainerAllocator& _alloc)
  : odom_data(_alloc)
  {
  }

  typedef  ::nav_msgs::Odometry_<ContainerAllocator>  _odom_data_type;
   ::nav_msgs::Odometry_<ContainerAllocator>  odom_data;


  typedef boost::shared_ptr< ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::ReadOdomResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct ReadOdomResponse
typedef  ::edufill_srvs::ReadOdomResponse_<std::allocator<void> > ReadOdomResponse;

typedef boost::shared_ptr< ::edufill_srvs::ReadOdomResponse> ReadOdomResponsePtr;
typedef boost::shared_ptr< ::edufill_srvs::ReadOdomResponse const> ReadOdomResponseConstPtr;

struct ReadOdom
{

typedef ReadOdomRequest Request;
typedef ReadOdomResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct ReadOdom
} // namespace edufill_srvs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const  ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadOdomRequest";
  }

  static const char* value(const  ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
";
  }

  static const char* value(const  ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadOdomResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "71a343bbd4c382fbda6afdcf1976f7b2";
  }

  static const char* value(const  ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x71a343bbd4c382fbULL;
  static const uint64_t static_value2 = 0xda6afdcf1976f7b2ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadOdomResponse";
  }

  static const char* value(const  ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "nav_msgs/Odometry odom_data\n\
\n\
\n\
================================================================================\n\
MSG: nav_msgs/Odometry\n\
# This represents an estimate of a position and velocity in free space.  \n\
# The pose in this message should be specified in the coordinate frame given by header.frame_id.\n\
# The twist in this message should be specified in the coordinate frame given by the child_frame_id\n\
Header header\n\
string child_frame_id\n\
geometry_msgs/PoseWithCovariance pose\n\
geometry_msgs/TwistWithCovariance twist\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.secs: seconds (stamp_secs) since epoch\n\
# * stamp.nsecs: nanoseconds since stamp_secs\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: geometry_msgs/PoseWithCovariance\n\
# This represents a pose in free space with uncertainty.\n\
\n\
Pose pose\n\
\n\
# Row-major representation of the 6x6 covariance matrix\n\
# The orientation parameters use a fixed-axis representation.\n\
# In order, the parameters are:\n\
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n\
float64[36] covariance\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of postion and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
\n\
================================================================================\n\
MSG: geometry_msgs/TwistWithCovariance\n\
# This expresses velocity in free space with uncertianty.\n\
\n\
Twist twist\n\
\n\
# Row-major representation of the 6x6 covariance matrix\n\
# The orientation parameters use a fixed-axis representation.\n\
# In order, the parameters are:\n\
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n\
float64[36] covariance\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Twist\n\
# This expresses velocity in free space broken into it's linear and angular parts. \n\
Vector3  linear\n\
Vector3  angular\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const  ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::ReadOdomRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct ReadOdomRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::ReadOdomResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.odom_data);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct ReadOdomResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<edufill_srvs::ReadOdom> {
  static const char* value() 
  {
    return "71a343bbd4c382fbda6afdcf1976f7b2";
  }

  static const char* value(const edufill_srvs::ReadOdom&) { return value(); } 
};

template<>
struct DataType<edufill_srvs::ReadOdom> {
  static const char* value() 
  {
    return "edufill_srvs/ReadOdom";
  }

  static const char* value(const edufill_srvs::ReadOdom&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::ReadOdomRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "71a343bbd4c382fbda6afdcf1976f7b2";
  }

  static const char* value(const edufill_srvs::ReadOdomRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::ReadOdomRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadOdom";
  }

  static const char* value(const edufill_srvs::ReadOdomRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::ReadOdomResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "71a343bbd4c382fbda6afdcf1976f7b2";
  }

  static const char* value(const edufill_srvs::ReadOdomResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::ReadOdomResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadOdom";
  }

  static const char* value(const edufill_srvs::ReadOdomResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // EDUFILL_SRVS_SERVICE_READODOM_H
