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

class robot_feedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timeHeader = null;
      this.feedbackPosData = null;
      this.feedbackVelData = null;
      this.feedbackCurrData = null;
      this.isGrasping = null;
    }
    else {
      if (initObj.hasOwnProperty('timeHeader')) {
        this.timeHeader = initObj.timeHeader
      }
      else {
        this.timeHeader = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('feedbackPosData')) {
        this.feedbackPosData = initObj.feedbackPosData
      }
      else {
        this.feedbackPosData = [];
      }
      if (initObj.hasOwnProperty('feedbackVelData')) {
        this.feedbackVelData = initObj.feedbackVelData
      }
      else {
        this.feedbackVelData = [];
      }
      if (initObj.hasOwnProperty('feedbackCurrData')) {
        this.feedbackCurrData = initObj.feedbackCurrData
      }
      else {
        this.feedbackCurrData = [];
      }
      if (initObj.hasOwnProperty('isGrasping')) {
        this.isGrasping = initObj.isGrasping
      }
      else {
        this.isGrasping = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_feedback
    // Serialize message field [timeHeader]
    bufferOffset = std_msgs.msg.Header.serialize(obj.timeHeader, buffer, bufferOffset);
    // Serialize message field [feedbackPosData]
    bufferOffset = _arraySerializer.float32(obj.feedbackPosData, buffer, bufferOffset, null);
    // Serialize message field [feedbackVelData]
    bufferOffset = _arraySerializer.float32(obj.feedbackVelData, buffer, bufferOffset, null);
    // Serialize message field [feedbackCurrData]
    bufferOffset = _arraySerializer.float32(obj.feedbackCurrData, buffer, bufferOffset, null);
    // Serialize message field [isGrasping]
    bufferOffset = _arraySerializer.bool(obj.isGrasping, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_feedback
    let len;
    let data = new robot_feedback(null);
    // Deserialize message field [timeHeader]
    data.timeHeader = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [feedbackPosData]
    data.feedbackPosData = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [feedbackVelData]
    data.feedbackVelData = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [feedbackCurrData]
    data.feedbackCurrData = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [isGrasping]
    data.isGrasping = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.timeHeader);
    length += 4 * object.feedbackPosData.length;
    length += 4 * object.feedbackVelData.length;
    length += 4 * object.feedbackCurrData.length;
    length += object.isGrasping.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ui/robot_feedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cbe9d95f303b479c3949a62170244b88';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 时间戳
    Header timeHeader
    # 反馈关节位置数据 I1 T2 T3 T4 I5
    float32[] feedbackPosData
    # 反馈关节速度数据
    float32[] feedbackVelData
    # 反馈关节电流数据
    float32[] feedbackCurrData
    # 双爪抓夹情况(true:处于抓紧状态；false:处于松开状态),顺序：G0、G6
    bool[] isGrasping
    
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
    const resolved = new robot_feedback(null);
    if (msg.timeHeader !== undefined) {
      resolved.timeHeader = std_msgs.msg.Header.Resolve(msg.timeHeader)
    }
    else {
      resolved.timeHeader = new std_msgs.msg.Header()
    }

    if (msg.feedbackPosData !== undefined) {
      resolved.feedbackPosData = msg.feedbackPosData;
    }
    else {
      resolved.feedbackPosData = []
    }

    if (msg.feedbackVelData !== undefined) {
      resolved.feedbackVelData = msg.feedbackVelData;
    }
    else {
      resolved.feedbackVelData = []
    }

    if (msg.feedbackCurrData !== undefined) {
      resolved.feedbackCurrData = msg.feedbackCurrData;
    }
    else {
      resolved.feedbackCurrData = []
    }

    if (msg.isGrasping !== undefined) {
      resolved.isGrasping = msg.isGrasping;
    }
    else {
      resolved.isGrasping = []
    }

    return resolved;
    }
};

module.exports = robot_feedback;
