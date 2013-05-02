/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_common/edufill_srvs/srv/ReadLaserScan.srv */
#ifndef EDUFILL_SRVS_SERVICE_READLASERSCAN_H
#define EDUFILL_SRVS_SERVICE_READLASERSCAN_H
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



#include "sensor_msgs/LaserScan.h"

namespace edufill_srvs
{
template <class ContainerAllocator>
struct ReadLaserScanRequest_ {
  typedef ReadLaserScanRequest_<ContainerAllocator> Type;

  ReadLaserScanRequest_()
  {
  }

  ReadLaserScanRequest_(const ContainerAllocator& _alloc)
  {
  }


  typedef boost::shared_ptr< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct ReadLaserScanRequest
typedef  ::edufill_srvs::ReadLaserScanRequest_<std::allocator<void> > ReadLaserScanRequest;

typedef boost::shared_ptr< ::edufill_srvs::ReadLaserScanRequest> ReadLaserScanRequestPtr;
typedef boost::shared_ptr< ::edufill_srvs::ReadLaserScanRequest const> ReadLaserScanRequestConstPtr;


template <class ContainerAllocator>
struct ReadLaserScanResponse_ {
  typedef ReadLaserScanResponse_<ContainerAllocator> Type;

  ReadLaserScanResponse_()
  : laser_scan_data()
  {
  }

  ReadLaserScanResponse_(const ContainerAllocator& _alloc)
  : laser_scan_data(_alloc)
  {
  }

  typedef  ::sensor_msgs::LaserScan_<ContainerAllocator>  _laser_scan_data_type;
   ::sensor_msgs::LaserScan_<ContainerAllocator>  laser_scan_data;


  typedef boost::shared_ptr< ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct ReadLaserScanResponse
typedef  ::edufill_srvs::ReadLaserScanResponse_<std::allocator<void> > ReadLaserScanResponse;

typedef boost::shared_ptr< ::edufill_srvs::ReadLaserScanResponse> ReadLaserScanResponsePtr;
typedef boost::shared_ptr< ::edufill_srvs::ReadLaserScanResponse const> ReadLaserScanResponseConstPtr;

struct ReadLaserScan
{

typedef ReadLaserScanRequest Request;
typedef ReadLaserScanResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct ReadLaserScan
} // namespace edufill_srvs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const  ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadLaserScanRequest";
  }

  static const char* value(const  ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
";
  }

  static const char* value(const  ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "11de34d8c079caf4e10311308a30ab23";
  }

  static const char* value(const  ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x11de34d8c079caf4ULL;
  static const uint64_t static_value2 = 0xe10311308a30ab23ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadLaserScanResponse";
  }

  static const char* value(const  ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "sensor_msgs/LaserScan laser_scan_data\n\
\n\
\n\
================================================================================\n\
MSG: sensor_msgs/LaserScan\n\
# Single scan from a planar laser range-finder\n\
#\n\
# If you have another ranging device with different behavior (e.g. a sonar\n\
# array), please find or create a different message, since applications\n\
# will make fairly laser-specific assumptions about this data\n\
\n\
Header header            # timestamp in the header is the acquisition time of \n\
                         # the first ray in the scan.\n\
                         #\n\
                         # in frame frame_id, angles are measured around \n\
                         # the positive Z axis (counterclockwise, if Z is up)\n\
                         # with zero angle being forward along the x axis\n\
                         \n\
float32 angle_min        # start angle of the scan [rad]\n\
float32 angle_max        # end angle of the scan [rad]\n\
float32 angle_increment  # angular distance between measurements [rad]\n\
\n\
float32 time_increment   # time between measurements [seconds] - if your scanner\n\
                         # is moving, this will be used in interpolating position\n\
                         # of 3d points\n\
float32 scan_time        # time between scans [seconds]\n\
\n\
float32 range_min        # minimum range value [m]\n\
float32 range_max        # maximum range value [m]\n\
\n\
float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)\n\
float32[] intensities    # intensity data [device-specific units].  If your\n\
                         # device does not provide intensities, please leave\n\
                         # the array empty.\n\
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
";
  }

  static const char* value(const  ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct ReadLaserScanRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.laser_scan_data);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct ReadLaserScanResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<edufill_srvs::ReadLaserScan> {
  static const char* value() 
  {
    return "11de34d8c079caf4e10311308a30ab23";
  }

  static const char* value(const edufill_srvs::ReadLaserScan&) { return value(); } 
};

template<>
struct DataType<edufill_srvs::ReadLaserScan> {
  static const char* value() 
  {
    return "edufill_srvs/ReadLaserScan";
  }

  static const char* value(const edufill_srvs::ReadLaserScan&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "11de34d8c079caf4e10311308a30ab23";
  }

  static const char* value(const edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadLaserScan";
  }

  static const char* value(const edufill_srvs::ReadLaserScanRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "11de34d8c079caf4e10311308a30ab23";
  }

  static const char* value(const edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadLaserScan";
  }

  static const char* value(const edufill_srvs::ReadLaserScanResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // EDUFILL_SRVS_SERVICE_READLASERSCAN_H
