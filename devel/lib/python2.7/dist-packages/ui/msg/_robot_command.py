# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ui/robot_command.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class robot_command(genpy.Message):
  _md5sum = "fc01d01e3e5b26ff37d3ece2d39ae6d6"
  _type = "ui/robot_command"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# 时间戳
Header timeHeader
# 关节位置命令 I1 T2 T3 T4 I5
float32[] CommandPosData
# 关节速度命令
float32[] CommandVelData

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
"""
  __slots__ = ['timeHeader','CommandPosData','CommandVelData']
  _slot_types = ['std_msgs/Header','float32[]','float32[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       timeHeader,CommandPosData,CommandVelData

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(robot_command, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.timeHeader is None:
        self.timeHeader = std_msgs.msg.Header()
      if self.CommandPosData is None:
        self.CommandPosData = []
      if self.CommandVelData is None:
        self.CommandVelData = []
    else:
      self.timeHeader = std_msgs.msg.Header()
      self.CommandPosData = []
      self.CommandVelData = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.timeHeader.seq, _x.timeHeader.stamp.secs, _x.timeHeader.stamp.nsecs))
      _x = self.timeHeader.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.CommandPosData)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.CommandPosData))
      length = len(self.CommandVelData)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.CommandVelData))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.timeHeader is None:
        self.timeHeader = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.timeHeader.seq, _x.timeHeader.stamp.secs, _x.timeHeader.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.timeHeader.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.timeHeader.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.CommandPosData = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.CommandVelData = s.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.timeHeader.seq, _x.timeHeader.stamp.secs, _x.timeHeader.stamp.nsecs))
      _x = self.timeHeader.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.CommandPosData)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.CommandPosData.tostring())
      length = len(self.CommandVelData)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.CommandVelData.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.timeHeader is None:
        self.timeHeader = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.timeHeader.seq, _x.timeHeader.stamp.secs, _x.timeHeader.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.timeHeader.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.timeHeader.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.CommandPosData = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.CommandVelData = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
