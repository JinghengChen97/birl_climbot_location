// Auto-generated. Do not edit!

// (in-package ui.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class robot_command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timeHeader = null;
      this.CommandPosData = null;
      this.CommandVelData = null;
    }
    else {
      if (initObj.hasOwnProperty('timeHeader')) {
        this.timeHeader = initObj.timeHeader
      }
      else {
        this.timeHeader = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('CommandPosData')) {
        this.CommandPosData = initObj.CommandPosData
      }
      else {
        this.CommandPosData = [];
      }
      if (initObj.hasOwnProperty('CommandVelData')) {
        this.CommandVelData = initObj.CommandVelData
      }
      else {
        this.CommandVelData = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_command
    // Serialize message field [timeHeader]
    bufferOffset = std_msgs.msg.Header.serialize(obj.timeHeader, buffer, bufferOffset);
    // Serialize message field [CommandPosData]
    bufferOffset = _arraySerializer.float32(obj.CommandPosData, buffer, bufferOffset, null);
    // Serialize message field [CommandVelData]
    bufferOffset = _arraySerializer.float32(obj.CommandVelData, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_command
    let len;
    let data = new robot_command(null);
    // Deserialize message field [timeHeader]
    data.timeHeader = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [CommandPosData]
    data.CommandPosData = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [CommandVelData]
    data.CommandVelData = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.timeHeader);
    length += 4 * object.CommandPosData.length;
    length += 4 * object.CommandVelData.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ui/robot_command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fc01d01e3e5b26ff37d3ece2d39ae6d6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 时间戳
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_command(null);
    if (msg.timeHeader !== undefined) {
      resolved.timeHeader = std_msgs.msg.Header.Resolve(msg.timeHeader)
    }
    else {
      resolved.timeHeader = new std_msgs.msg.Header()
    }

    if (msg.CommandPosData !== undefined) {
      resolved.CommandPosData = msg.CommandPosData;
    }
    else {
      resolved.CommandPosData = []
    }

    if (msg.CommandVelData !== undefined) {
      resolved.CommandVelData = msg.CommandVelData;
    }
    else {
      resolved.CommandVelData = []
    }

    return resolved;
    }
};

module.exports = robot_command;
