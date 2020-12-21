// Generated by gencpp from file timesync/TimesyncDebug.msg
// DO NOT EDIT!


#ifndef TIMESYNC_MESSAGE_TIMESYNCDEBUG_H
#define TIMESYNC_MESSAGE_TIMESYNCDEBUG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace timesync
{
template <class ContainerAllocator>
struct TimesyncDebug_
{
  typedef TimesyncDebug_<ContainerAllocator> Type;

  TimesyncDebug_()
    : seq(0)
    , sensor_time(0.0)
    , ros_time(0.0)
    , corrected_timestamp(0.0)  {
    }
  TimesyncDebug_(const ContainerAllocator& _alloc)
    : seq(0)
    , sensor_time(0.0)
    , ros_time(0.0)
    , corrected_timestamp(0.0)  {
  (void)_alloc;
    }



   typedef uint32_t _seq_type;
  _seq_type seq;

   typedef double _sensor_time_type;
  _sensor_time_type sensor_time;

   typedef double _ros_time_type;
  _ros_time_type ros_time;

   typedef double _corrected_timestamp_type;
  _corrected_timestamp_type corrected_timestamp;





  typedef boost::shared_ptr< ::timesync::TimesyncDebug_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::timesync::TimesyncDebug_<ContainerAllocator> const> ConstPtr;

}; // struct TimesyncDebug_

typedef ::timesync::TimesyncDebug_<std::allocator<void> > TimesyncDebug;

typedef boost::shared_ptr< ::timesync::TimesyncDebug > TimesyncDebugPtr;
typedef boost::shared_ptr< ::timesync::TimesyncDebug const> TimesyncDebugConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::timesync::TimesyncDebug_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::timesync::TimesyncDebug_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace timesync

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'timesync': ['/home/ch/P440/IMU/src/timesync_ros/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::timesync::TimesyncDebug_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::timesync::TimesyncDebug_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::timesync::TimesyncDebug_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::timesync::TimesyncDebug_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::timesync::TimesyncDebug_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::timesync::TimesyncDebug_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::timesync::TimesyncDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1b9fcff64ffd5b3203e0d1026359e2c2";
  }

  static const char* value(const ::timesync::TimesyncDebug_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1b9fcff64ffd5b32ULL;
  static const uint64_t static_value2 = 0x03e0d1026359e2c2ULL;
};

template<class ContainerAllocator>
struct DataType< ::timesync::TimesyncDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "timesync/TimesyncDebug";
  }

  static const char* value(const ::timesync::TimesyncDebug_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::timesync::TimesyncDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint32 seq\n\
float64 sensor_time\n\
float64 ros_time\n\
float64 corrected_timestamp\n\
";
  }

  static const char* value(const ::timesync::TimesyncDebug_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::timesync::TimesyncDebug_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.seq);
      stream.next(m.sensor_time);
      stream.next(m.ros_time);
      stream.next(m.corrected_timestamp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TimesyncDebug_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::timesync::TimesyncDebug_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::timesync::TimesyncDebug_<ContainerAllocator>& v)
  {
    s << indent << "seq: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.seq);
    s << indent << "sensor_time: ";
    Printer<double>::stream(s, indent + "  ", v.sensor_time);
    s << indent << "ros_time: ";
    Printer<double>::stream(s, indent + "  ", v.ros_time);
    s << indent << "corrected_timestamp: ";
    Printer<double>::stream(s, indent + "  ", v.corrected_timestamp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TIMESYNC_MESSAGE_TIMESYNCDEBUG_H