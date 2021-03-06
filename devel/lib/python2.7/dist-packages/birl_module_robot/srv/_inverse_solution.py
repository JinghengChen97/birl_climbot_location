# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from birl_module_robot/inverse_solutionRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class inverse_solutionRequest(genpy.Message):
  _md5sum = "31c5edc55004419b86af606b1c3081a3"
  _type = "birl_module_robot/inverse_solutionRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """
int16 which_robot


bool base


float32[] descartes_pos_commands


float32[] descartes_vel_commands



float32[] current_joint_state

"""
  __slots__ = ['which_robot','base','descartes_pos_commands','descartes_vel_commands','current_joint_state']
  _slot_types = ['int16','bool','float32[]','float32[]','float32[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       which_robot,base,descartes_pos_commands,descartes_vel_commands,current_joint_state

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(inverse_solutionRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.which_robot is None:
        self.which_robot = 0
      if self.base is None:
        self.base = False
      if self.descartes_pos_commands is None:
        self.descartes_pos_commands = []
      if self.descartes_vel_commands is None:
        self.descartes_vel_commands = []
      if self.current_joint_state is None:
        self.current_joint_state = []
    else:
      self.which_robot = 0
      self.base = False
      self.descartes_pos_commands = []
      self.descartes_vel_commands = []
      self.current_joint_state = []

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
      buff.write(_get_struct_hB().pack(_x.which_robot, _x.base))
      length = len(self.descartes_pos_commands)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.descartes_pos_commands))
      length = len(self.descartes_vel_commands)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.descartes_vel_commands))
      length = len(self.current_joint_state)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.current_joint_state))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 3
      (_x.which_robot, _x.base,) = _get_struct_hB().unpack(str[start:end])
      self.base = bool(self.base)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.descartes_pos_commands = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.descartes_vel_commands = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.current_joint_state = s.unpack(str[start:end])
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
      buff.write(_get_struct_hB().pack(_x.which_robot, _x.base))
      length = len(self.descartes_pos_commands)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.descartes_pos_commands.tostring())
      length = len(self.descartes_vel_commands)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.descartes_vel_commands.tostring())
      length = len(self.current_joint_state)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.current_joint_state.tostring())
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
      end = 0
      _x = self
      start = end
      end += 3
      (_x.which_robot, _x.base,) = _get_struct_hB().unpack(str[start:end])
      self.base = bool(self.base)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.descartes_pos_commands = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.descartes_vel_commands = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.current_joint_state = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_hB = None
def _get_struct_hB():
    global _struct_hB
    if _struct_hB is None:
        _struct_hB = struct.Struct("<hB")
    return _struct_hB
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from birl_module_robot/inverse_solutionResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class inverse_solutionResponse(genpy.Message):
  _md5sum = "9f62639cfbedb0e764507d1d70b9c0bf"
  _type = "birl_module_robot/inverse_solutionResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """

float32[] joint_pos_commands



float32[] joint_vel_commands

"""
  __slots__ = ['joint_pos_commands','joint_vel_commands']
  _slot_types = ['float32[]','float32[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       joint_pos_commands,joint_vel_commands

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(inverse_solutionResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.joint_pos_commands is None:
        self.joint_pos_commands = []
      if self.joint_vel_commands is None:
        self.joint_vel_commands = []
    else:
      self.joint_pos_commands = []
      self.joint_vel_commands = []

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
      length = len(self.joint_pos_commands)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.joint_pos_commands))
      length = len(self.joint_vel_commands)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.joint_vel_commands))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.joint_pos_commands = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.joint_vel_commands = s.unpack(str[start:end])
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
      length = len(self.joint_pos_commands)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.joint_pos_commands.tostring())
      length = len(self.joint_vel_commands)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.joint_vel_commands.tostring())
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
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.joint_pos_commands = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.joint_vel_commands = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
class inverse_solution(object):
  _type          = 'birl_module_robot/inverse_solution'
  _md5sum = 'fd70c212af5c1d03d9d1a73214023d9c'
  _request_class  = inverse_solutionRequest
  _response_class = inverse_solutionResponse
