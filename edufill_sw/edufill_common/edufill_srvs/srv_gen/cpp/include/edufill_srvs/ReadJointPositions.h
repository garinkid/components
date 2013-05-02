/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_common/edufill_srvs/srv/ReadJointPositions.srv */
#ifndef EDUFILL_SRVS_SERVICE_READJOINTPOSITIONS_H
#define EDUFILL_SRVS_SERVICE_READJOINTPOSITIONS_H
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




namespace edufill_srvs
{
template <class ContainerAllocator>
struct ReadJointPositionsRequest_ {
  typedef ReadJointPositionsRequest_<ContainerAllocator> Type;

  ReadJointPositionsRequest_()
  {
  }

  ReadJointPositionsRequest_(const ContainerAllocator& _alloc)
  {
  }


  typedef boost::shared_ptr< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct ReadJointPositionsRequest
typedef  ::edufill_srvs::ReadJointPositionsRequest_<std::allocator<void> > ReadJointPositionsRequest;

typedef boost::shared_ptr< ::edufill_srvs::ReadJointPositionsRequest> ReadJointPositionsRequestPtr;
typedef boost::shared_ptr< ::edufill_srvs::ReadJointPositionsRequest const> ReadJointPositionsRequestConstPtr;


template <class ContainerAllocator>
struct ReadJointPositionsResponse_ {
  typedef ReadJointPositionsResponse_<ContainerAllocator> Type;

  ReadJointPositionsResponse_()
  : joint_positions()
  {
  }

  ReadJointPositionsResponse_(const ContainerAllocator& _alloc)
  : joint_positions(_alloc)
  {
  }

  typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _joint_positions_type;
  std::vector<double, typename ContainerAllocator::template rebind<double>::other >  joint_positions;


  typedef boost::shared_ptr< ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct ReadJointPositionsResponse
typedef  ::edufill_srvs::ReadJointPositionsResponse_<std::allocator<void> > ReadJointPositionsResponse;

typedef boost::shared_ptr< ::edufill_srvs::ReadJointPositionsResponse> ReadJointPositionsResponsePtr;
typedef boost::shared_ptr< ::edufill_srvs::ReadJointPositionsResponse const> ReadJointPositionsResponseConstPtr;

struct ReadJointPositions
{

typedef ReadJointPositionsRequest Request;
typedef ReadJointPositionsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct ReadJointPositions
} // namespace edufill_srvs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const  ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadJointPositionsRequest";
  }

  static const char* value(const  ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
";
  }

  static const char* value(const  ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "a286ff40b196573b9ebf3999a2f8d438";
  }

  static const char* value(const  ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xa286ff40b196573bULL;
  static const uint64_t static_value2 = 0x9ebf3999a2f8d438ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadJointPositionsResponse";
  }

  static const char* value(const  ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "float64[] joint_positions\n\
\n\
\n\
";
  }

  static const char* value(const  ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct ReadJointPositionsRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.joint_positions);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct ReadJointPositionsResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<edufill_srvs::ReadJointPositions> {
  static const char* value() 
  {
    return "a286ff40b196573b9ebf3999a2f8d438";
  }

  static const char* value(const edufill_srvs::ReadJointPositions&) { return value(); } 
};

template<>
struct DataType<edufill_srvs::ReadJointPositions> {
  static const char* value() 
  {
    return "edufill_srvs/ReadJointPositions";
  }

  static const char* value(const edufill_srvs::ReadJointPositions&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "a286ff40b196573b9ebf3999a2f8d438";
  }

  static const char* value(const edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadJointPositions";
  }

  static const char* value(const edufill_srvs::ReadJointPositionsRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "a286ff40b196573b9ebf3999a2f8d438";
  }

  static const char* value(const edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReadJointPositions";
  }

  static const char* value(const edufill_srvs::ReadJointPositionsResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // EDUFILL_SRVS_SERVICE_READJOINTPOSITIONS_H
