/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_common/edufill_srvs/srv/GetPoseStamped.srv */
#ifndef EDUFILL_SRVS_SERVICE_GETPOSESTAMPED_H
#define EDUFILL_SRVS_SERVICE_GETPOSESTAMPED_H
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

#include "geometry_msgs/PoseStamped.h"


#include "geometry_msgs/PoseStamped.h"

namespace edufill_srvs
{
template <class ContainerAllocator>
struct GetPoseStampedRequest_ {
  typedef GetPoseStampedRequest_<ContainerAllocator> Type;

  GetPoseStampedRequest_()
  : object_pose()
  {
  }

  GetPoseStampedRequest_(const ContainerAllocator& _alloc)
  : object_pose(_alloc)
  {
  }

  typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _object_pose_type;
   ::geometry_msgs::PoseStamped_<ContainerAllocator>  object_pose;


  typedef boost::shared_ptr< ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct GetPoseStampedRequest
typedef  ::edufill_srvs::GetPoseStampedRequest_<std::allocator<void> > GetPoseStampedRequest;

typedef boost::shared_ptr< ::edufill_srvs::GetPoseStampedRequest> GetPoseStampedRequestPtr;
typedef boost::shared_ptr< ::edufill_srvs::GetPoseStampedRequest const> GetPoseStampedRequestConstPtr;


template <class ContainerAllocator>
struct GetPoseStampedResponse_ {
  typedef GetPoseStampedResponse_<ContainerAllocator> Type;

  GetPoseStampedResponse_()
  : base_pose()
  {
  }

  GetPoseStampedResponse_(const ContainerAllocator& _alloc)
  : base_pose(_alloc)
  {
  }

  typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _base_pose_type;
   ::geometry_msgs::PoseStamped_<ContainerAllocator>  base_pose;


  typedef boost::shared_ptr< ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct GetPoseStampedResponse
typedef  ::edufill_srvs::GetPoseStampedResponse_<std::allocator<void> > GetPoseStampedResponse;

typedef boost::shared_ptr< ::edufill_srvs::GetPoseStampedResponse> GetPoseStampedResponsePtr;
typedef boost::shared_ptr< ::edufill_srvs::GetPoseStampedResponse const> GetPoseStampedResponseConstPtr;

struct GetPoseStamped
{

typedef GetPoseStampedRequest Request;
typedef GetPoseStampedResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct GetPoseStamped
} // namespace edufill_srvs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "ce62f562fe862ddbebe5377023767cb7";
  }

  static const char* value(const  ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xce62f562fe862ddbULL;
  static const uint64_t static_value2 = 0xebe5377023767cb7ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/GetPoseStampedRequest";
  }

  static const char* value(const  ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "geometry_msgs/PoseStamped object_pose\n\
\n\
================================================================================\n\
MSG: geometry_msgs/PoseStamped\n\
# A Pose with reference coordinate frame and timestamp\n\
Header header\n\
Pose pose\n\
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
";
  }

  static const char* value(const  ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "735bd3b58bedaeab43b3509fcd91d5f9";
  }

  static const char* value(const  ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x735bd3b58bedaeabULL;
  static const uint64_t static_value2 = 0x43b3509fcd91d5f9ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/GetPoseStampedResponse";
  }

  static const char* value(const  ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "geometry_msgs/PoseStamped base_pose\n\
\n\
\n\
================================================================================\n\
MSG: geometry_msgs/PoseStamped\n\
# A Pose with reference coordinate frame and timestamp\n\
Header header\n\
Pose pose\n\
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
";
  }

  static const char* value(const  ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.object_pose);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct GetPoseStampedRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.base_pose);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct GetPoseStampedResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<edufill_srvs::GetPoseStamped> {
  static const char* value() 
  {
    return "8e651cf3b86cbaea8426e21138585b36";
  }

  static const char* value(const edufill_srvs::GetPoseStamped&) { return value(); } 
};

template<>
struct DataType<edufill_srvs::GetPoseStamped> {
  static const char* value() 
  {
    return "edufill_srvs/GetPoseStamped";
  }

  static const char* value(const edufill_srvs::GetPoseStamped&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "8e651cf3b86cbaea8426e21138585b36";
  }

  static const char* value(const edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/GetPoseStamped";
  }

  static const char* value(const edufill_srvs::GetPoseStampedRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "8e651cf3b86cbaea8426e21138585b36";
  }

  static const char* value(const edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/GetPoseStamped";
  }

  static const char* value(const edufill_srvs::GetPoseStampedResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // EDUFILL_SRVS_SERVICE_GETPOSESTAMPED_H
