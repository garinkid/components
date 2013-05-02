/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/edufill_public/components/edufill_sw/edufill_common/edufill_srvs/srv/ReturnBool.srv */
#ifndef EDUFILL_SRVS_SERVICE_RETURNBOOL_H
#define EDUFILL_SRVS_SERVICE_RETURNBOOL_H
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
struct ReturnBoolRequest_ {
  typedef ReturnBoolRequest_<ContainerAllocator> Type;

  ReturnBoolRequest_()
  {
  }

  ReturnBoolRequest_(const ContainerAllocator& _alloc)
  {
  }


  typedef boost::shared_ptr< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct ReturnBoolRequest
typedef  ::edufill_srvs::ReturnBoolRequest_<std::allocator<void> > ReturnBoolRequest;

typedef boost::shared_ptr< ::edufill_srvs::ReturnBoolRequest> ReturnBoolRequestPtr;
typedef boost::shared_ptr< ::edufill_srvs::ReturnBoolRequest const> ReturnBoolRequestConstPtr;


template <class ContainerAllocator>
struct ReturnBoolResponse_ {
  typedef ReturnBoolResponse_<ContainerAllocator> Type;

  ReturnBoolResponse_()
  : value(false)
  {
  }

  ReturnBoolResponse_(const ContainerAllocator& _alloc)
  : value(false)
  {
  }

  typedef uint8_t _value_type;
  uint8_t value;


  typedef boost::shared_ptr< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct ReturnBoolResponse
typedef  ::edufill_srvs::ReturnBoolResponse_<std::allocator<void> > ReturnBoolResponse;

typedef boost::shared_ptr< ::edufill_srvs::ReturnBoolResponse> ReturnBoolResponsePtr;
typedef boost::shared_ptr< ::edufill_srvs::ReturnBoolResponse const> ReturnBoolResponseConstPtr;

struct ReturnBool
{

typedef ReturnBoolRequest Request;
typedef ReturnBoolResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct ReturnBool
} // namespace edufill_srvs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const  ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReturnBoolRequest";
  }

  static const char* value(const  ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
";
  }

  static const char* value(const  ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "e431d687bf4b2c65fbd94b12ae0cb5d9";
  }

  static const char* value(const  ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xe431d687bf4b2c65ULL;
  static const uint64_t static_value2 = 0xfbd94b12ae0cb5d9ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReturnBoolResponse";
  }

  static const char* value(const  ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "bool value\n\
\n\
\n\
\n\
";
  }

  static const char* value(const  ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::ReturnBoolRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct ReturnBoolRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::ReturnBoolResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.value);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct ReturnBoolResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<edufill_srvs::ReturnBool> {
  static const char* value() 
  {
    return "e431d687bf4b2c65fbd94b12ae0cb5d9";
  }

  static const char* value(const edufill_srvs::ReturnBool&) { return value(); } 
};

template<>
struct DataType<edufill_srvs::ReturnBool> {
  static const char* value() 
  {
    return "edufill_srvs/ReturnBool";
  }

  static const char* value(const edufill_srvs::ReturnBool&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::ReturnBoolRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "e431d687bf4b2c65fbd94b12ae0cb5d9";
  }

  static const char* value(const edufill_srvs::ReturnBoolRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::ReturnBoolRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReturnBool";
  }

  static const char* value(const edufill_srvs::ReturnBoolRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::ReturnBoolResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "e431d687bf4b2c65fbd94b12ae0cb5d9";
  }

  static const char* value(const edufill_srvs::ReturnBoolResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::ReturnBoolResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/ReturnBool";
  }

  static const char* value(const edufill_srvs::ReturnBoolResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // EDUFILL_SRVS_SERVICE_RETURNBOOL_H

