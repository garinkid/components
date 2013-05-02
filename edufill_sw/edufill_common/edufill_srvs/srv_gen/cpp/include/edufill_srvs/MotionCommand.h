/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_common/edufill_srvs/srv/MotionCommand.srv */
#ifndef EDUFILL_SRVS_SERVICE_MOTIONCOMMAND_H
#define EDUFILL_SRVS_SERVICE_MOTIONCOMMAND_H
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
struct MotionCommandRequest_ {
  typedef MotionCommandRequest_<ContainerAllocator> Type;

  MotionCommandRequest_()
  : command()
  {
  }

  MotionCommandRequest_(const ContainerAllocator& _alloc)
  : command(_alloc)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _command_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  command;


  typedef boost::shared_ptr< ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::MotionCommandRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct MotionCommandRequest
typedef  ::edufill_srvs::MotionCommandRequest_<std::allocator<void> > MotionCommandRequest;

typedef boost::shared_ptr< ::edufill_srvs::MotionCommandRequest> MotionCommandRequestPtr;
typedef boost::shared_ptr< ::edufill_srvs::MotionCommandRequest const> MotionCommandRequestConstPtr;


template <class ContainerAllocator>
struct MotionCommandResponse_ {
  typedef MotionCommandResponse_<ContainerAllocator> Type;

  MotionCommandResponse_()
  {
  }

  MotionCommandResponse_(const ContainerAllocator& _alloc)
  {
  }


  typedef boost::shared_ptr< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct MotionCommandResponse
typedef  ::edufill_srvs::MotionCommandResponse_<std::allocator<void> > MotionCommandResponse;

typedef boost::shared_ptr< ::edufill_srvs::MotionCommandResponse> MotionCommandResponsePtr;
typedef boost::shared_ptr< ::edufill_srvs::MotionCommandResponse const> MotionCommandResponseConstPtr;

struct MotionCommand
{

typedef MotionCommandRequest Request;
typedef MotionCommandResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct MotionCommand
} // namespace edufill_srvs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::MotionCommandRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "cba5e21e920a3a2b7b375cb65b64cdea";
  }

  static const char* value(const  ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xcba5e21e920a3a2bULL;
  static const uint64_t static_value2 = 0x7b375cb65b64cdeaULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/MotionCommandRequest";
  }

  static const char* value(const  ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "string command\n\
\n\
";
  }

  static const char* value(const  ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const  ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/MotionCommandResponse";
  }

  static const char* value(const  ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
\n\
\n\
";
  }

  static const char* value(const  ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::MotionCommandRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.command);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct MotionCommandRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_srvs::MotionCommandResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct MotionCommandResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<edufill_srvs::MotionCommand> {
  static const char* value() 
  {
    return "cba5e21e920a3a2b7b375cb65b64cdea";
  }

  static const char* value(const edufill_srvs::MotionCommand&) { return value(); } 
};

template<>
struct DataType<edufill_srvs::MotionCommand> {
  static const char* value() 
  {
    return "edufill_srvs/MotionCommand";
  }

  static const char* value(const edufill_srvs::MotionCommand&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::MotionCommandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "cba5e21e920a3a2b7b375cb65b64cdea";
  }

  static const char* value(const edufill_srvs::MotionCommandRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::MotionCommandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/MotionCommand";
  }

  static const char* value(const edufill_srvs::MotionCommandRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<edufill_srvs::MotionCommandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "cba5e21e920a3a2b7b375cb65b64cdea";
  }

  static const char* value(const edufill_srvs::MotionCommandResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<edufill_srvs::MotionCommandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_srvs/MotionCommand";
  }

  static const char* value(const edufill_srvs::MotionCommandResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // EDUFILL_SRVS_SERVICE_MOTIONCOMMAND_H
