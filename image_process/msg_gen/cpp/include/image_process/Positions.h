/* Auto-generated by genmsg_cpp for file /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/msg/Positions.msg */
#ifndef IMAGE_PROCESS_MESSAGE_POSITIONS_H
#define IMAGE_PROCESS_MESSAGE_POSITIONS_H
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


namespace image_process
{
template <class ContainerAllocator>
struct Positions_ {
  typedef Positions_<ContainerAllocator> Type;

  Positions_()
  : PosX(0)
  , PosY(0)
  , ScreenX(0)
  , ScreenY(0)
  {
  }

  Positions_(const ContainerAllocator& _alloc)
  : PosX(0)
  , PosY(0)
  , ScreenX(0)
  , ScreenY(0)
  {
  }

  typedef int16_t _PosX_type;
  int16_t PosX;

  typedef int16_t _PosY_type;
  int16_t PosY;

  typedef int16_t _ScreenX_type;
  int16_t ScreenX;

  typedef int16_t _ScreenY_type;
  int16_t ScreenY;


  typedef boost::shared_ptr< ::image_process::Positions_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::image_process::Positions_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct Positions
typedef  ::image_process::Positions_<std::allocator<void> > Positions;

typedef boost::shared_ptr< ::image_process::Positions> PositionsPtr;
typedef boost::shared_ptr< ::image_process::Positions const> PositionsConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::image_process::Positions_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::image_process::Positions_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace image_process

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::image_process::Positions_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::image_process::Positions_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::image_process::Positions_<ContainerAllocator> > {
  static const char* value() 
  {
    return "70cb3425bc63edba3285feecb7b2dd58";
  }

  static const char* value(const  ::image_process::Positions_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x70cb3425bc63edbaULL;
  static const uint64_t static_value2 = 0x3285feecb7b2dd58ULL;
};

template<class ContainerAllocator>
struct DataType< ::image_process::Positions_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_process/Positions";
  }

  static const char* value(const  ::image_process::Positions_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::image_process::Positions_<ContainerAllocator> > {
  static const char* value() 
  {
    return "int16 PosX\n\
int16 PosY\n\
int16 ScreenX\n\
int16 ScreenY\n\
\n\
";
  }

  static const char* value(const  ::image_process::Positions_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::image_process::Positions_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::image_process::Positions_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.PosX);
    stream.next(m.PosY);
    stream.next(m.ScreenX);
    stream.next(m.ScreenY);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct Positions_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::image_process::Positions_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::image_process::Positions_<ContainerAllocator> & v) 
  {
    s << indent << "PosX: ";
    Printer<int16_t>::stream(s, indent + "  ", v.PosX);
    s << indent << "PosY: ";
    Printer<int16_t>::stream(s, indent + "  ", v.PosY);
    s << indent << "ScreenX: ";
    Printer<int16_t>::stream(s, indent + "  ", v.ScreenX);
    s << indent << "ScreenY: ";
    Printer<int16_t>::stream(s, indent + "  ", v.ScreenY);
  }
};


} // namespace message_operations
} // namespace ros

#endif // IMAGE_PROCESS_MESSAGE_POSITIONS_H

