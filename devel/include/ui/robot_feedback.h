// Generated by gencpp from file ui/robot_feedback.msg
// DO NOT EDIT!


#ifndef UI_MESSAGE_ROBOT_FEEDBACK_H
#define UI_MESSAGE_ROBOT_FEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace ui
{
template <class ContainerAllocator>
struct robot_feedback_
{
  typedef robot_feedback_<ContainerAllocator> Type;

  robot_feedback_()
    : timeHeader()
    , feedbackPosData()
    , feedbackVelData()
    , feedbackCurrData()
    , isGrasping()  {
    }
  robot_feedback_(const ContainerAllocator& _alloc)
    : timeHeader(_alloc)
    , feedbackPosData(_alloc)
    , feedbackVelData(_alloc)
    , feedbackCurrData(_alloc)
    , isGrasping(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _timeHeader_type;
  _timeHeader_type timeHeader;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _feedbackPosData_type;
  _feedbackPosData_type feedbackPosData;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _feedbackVelData_type;
  _feedbackVelData_type feedbackVelData;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _feedbackCurrData_type;
  _feedbackCurrData_type feedbackCurrData;

   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _isGrasping_type;
  _isGrasping_type isGrasping;





  typedef boost::shared_ptr< ::ui::robot_feedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ui::robot_feedback_<ContainerAllocator> const> ConstPtr;

}; // struct robot_feedback_

typedef ::ui::robot_feedback_<std::allocator<void> > robot_feedback;

typedef boost::shared_ptr< ::ui::robot_feedback > robot_feedbackPtr;
typedef boost::shared_ptr< ::ui::robot_feedback const> robot_feedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ui::robot_feedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ui::robot_feedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace ui

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'ui': ['/home/ch/code/birl_climbot_location/src/BirlModuleRobot/ui/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::ui::robot_feedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ui::robot_feedback_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ui::robot_feedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ui::robot_feedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ui::robot_feedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ui::robot_feedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ui::robot_feedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cbe9d95f303b479c3949a62170244b88";
  }

  static const char* value(const ::ui::robot_feedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcbe9d95f303b479cULL;
  static const uint64_t static_value2 = 0x3949a62170244b88ULL;
};

template<class ContainerAllocator>
struct DataType< ::ui::robot_feedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ui/robot_feedback";
  }

  static const char* value(const ::ui::robot_feedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ui::robot_feedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# 时间戳\n\
Header timeHeader\n\
# 反馈关节位置数据 I1 T2 T3 T4 I5\n\
float32[] feedbackPosData\n\
# 反馈关节速度数据\n\
float32[] feedbackVelData\n\
# 反馈关节电流数据\n\
float32[] feedbackCurrData\n\
# 双爪抓夹情况(true:处于抓紧状态；false:处于松开状态),顺序：G0、G6\n\
bool[] isGrasping\n\
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
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::ui::robot_feedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ui::robot_feedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.timeHeader);
      stream.next(m.feedbackPosData);
      stream.next(m.feedbackVelData);
      stream.next(m.feedbackCurrData);
      stream.next(m.isGrasping);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct robot_feedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ui::robot_feedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ui::robot_feedback_<ContainerAllocator>& v)
  {
    s << indent << "timeHeader: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.timeHeader);
    s << indent << "feedbackPosData[]" << std::endl;
    for (size_t i = 0; i < v.feedbackPosData.size(); ++i)
    {
      s << indent << "  feedbackPosData[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.feedbackPosData[i]);
    }
    s << indent << "feedbackVelData[]" << std::endl;
    for (size_t i = 0; i < v.feedbackVelData.size(); ++i)
    {
      s << indent << "  feedbackVelData[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.feedbackVelData[i]);
    }
    s << indent << "feedbackCurrData[]" << std::endl;
    for (size_t i = 0; i < v.feedbackCurrData.size(); ++i)
    {
      s << indent << "  feedbackCurrData[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.feedbackCurrData[i]);
    }
    s << indent << "isGrasping[]" << std::endl;
    for (size_t i = 0; i < v.isGrasping.size(); ++i)
    {
      s << indent << "  isGrasping[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.isGrasping[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // UI_MESSAGE_ROBOT_FEEDBACK_H
