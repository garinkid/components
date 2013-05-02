/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/edufill_public/components/edufill_sw/edufill_common/edufill_srvs/srv/SetMapAction.srv */
#ifndef EDUFILL_SRVS_SERVICE_SETMAPACTION_H
#define EDUFILL_SRVS_SERVICE_SETMAPACTION_H
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
struct SetMapActionRequest_ {
  typedef SetMapActionRequest_<ContainerAllocator> Type;

  SetMapActionRequest_()
  : action()
  , file_name()
  {
  }

  SetMapActionRequest_(const ContainerAllocator& _alloc)
  : action(_alloc)
  , file_name(_alloc)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _action_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  action;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _file_name_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  file_name;


  typedef boost::shared_ptr< ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::SetMapActionRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct SetMapActionRequest
typedef  ::edufill_srvs::SetMapActionRequest_<std::allocator<void> > SetMapActionRequest;

typedef boost::shared_ptr< ::edufill_srvs::SetMapActionRequest> SetMapActionRequestPtr;
typedef boost::shared_ptr< ::edufill_srvs::SetMapActionRequest const> SetMapActionRequestConstPtr;


template <class ContainerAllocator>
struct SetMapActionResponse_ {
  typedef SetMapActionResponse_<ContainerAllocator> Type;

  SetMapActionResponse_()
  {
  }

  SetMapActionResponse_(const ContainerAllocator& _alloc)
  {
  }


  typedef boost::shared_ptr< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct SetMapActionResponse
typedef  ::edufill_srvs::SetMapActionResponse_<std::allocator<void> > SetMapActionResponse;

typedef boost::shared_ptr< ::edufill_srvs::SetMapActionResponse> SetMapActionResponsePtr;
typedef boost::shared_ptr< ::edufill_srvs::SetMapActionResponse const> SetMapActionResponseConstPtr;

struct SetMapAction
{

typedef SetMapActionRequest Request;
typedef SetMapActionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct SetMapAction
} // namespace edufill_srvs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::SetMapActionRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "11679062edf334961e00892cd3b0ed06";
  }

  static const char* value(const  ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x11679062edf33496ULL;
  static const uint64_t static_value2 = 0x1e00892cd3b0ed06ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/SetMapActionRequest";
  }

  static const char* value(const  ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "string action\n\
string file_name\n\
\n\
";
  }

  static const char* value(const  ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const  ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/SetMapActionResponse";
  }

  static const char* value(const  ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
\n\
\n\
";
  }

  static const char* value(const  ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::SetMapActionRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.action);
    stream.next(m.file_name);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct SetMapActionRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::SetMapActionResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct SetMapActionResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<edufill_srvs::SetMapAction> {
  static const char* value() 
  {
    return "11679062edf334961e00892cd3b0ed06";
  }

  static const char* value(const edufill_srvs::SetMapAction&) { return value(); } 
};

template<>
struct DataType<edufill_srvs::SetMapAction> {
  static const char* value() 
  {
    return "edufill_srvs/SetMapAction";
  }

  static const char* value(const edufill_srvs::SetMapAction&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::SetMapActionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "11679062edf334961e00892cd3b0ed06";
  }

  static const char* value(const edufill_srvs::SetMapActionRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::SetMapActionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/SetMapAction";
  }

  static const char* value(const edufill_srvs::SetMapActionRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::SetMapActionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "11679062edf334961e00892cd3b0ed06";
  }

  static const char* value(const edufill_srvs::SetMapActionResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::SetMapActionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/SetMapAction";
  }

  static const char* value(const edufill_srvs::SetMapActionResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // EDUFILL_SRVS_SERVICE_SETMAPACTION_H

