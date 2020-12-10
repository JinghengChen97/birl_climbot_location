// Auto-generated. Do not edit!

// (in-package uwb_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class UWB {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.coordinates = null;
      this.position = null;
      this.range = null;
      this.ID = null;
      this.solver_error_code = null;
      this.LED_flag = null;
      this.header = null;
    }
    else {
      if (initObj.hasOwnProperty('coordinates')) {
        this.coordinates = initObj.coordinates
      }
      else {
        this.coordinates = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('range')) {
        this.range = initObj.range
      }
      else {
        this.range = 0;
      }
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('solver_error_code')) {
        this.solver_error_code = initObj.solver_error_code
      }
      else {
        this.solver_error_code = 0;
      }
      if (initObj.hasOwnProperty('LED_flag')) {
        this.LED_flag = initObj.LED_flag
      }
      else {
        this.LED_flag = 0;
      }
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UWB
    // Check that the constant length array field [coordinates] has the right length
    if (obj.coordinates.length !== 3) {
      throw new Error('Unable to serialize array field coordinates - length must be 3')
    }
    // Serialize message field [coordinates]
    bufferOffset = _arraySerializer.int32(obj.coordinates, buffer, bufferOffset, 3);
    // Check that the constant length array field [position] has the right length
    if (obj.position.length !== 3) {
      throw new Error('Unable to serialize array field position - length must be 3')
    }
    // Serialize message field [position]
    bufferOffset = _arraySerializer.int32(obj.position, buffer, bufferOffset, 3);
    // Serialize message field [range]
    bufferOffset = _serializer.int32(obj.range, buffer, bufferOffset);
    // Serialize message field [ID]
    bufferOffset = _serializer.int32(obj.ID, buffer, bufferOffset);
    // Serialize message field [solver_error_code]
    bufferOffset = _serializer.int8(obj.solver_error_code, buffer, bufferOffset);
    // Serialize message field [LED_flag]
    bufferOffset = _serializer.int16(obj.LED_flag, buffer, bufferOffset);
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UWB
    let len;
    let data = new UWB(null);
    // Deserialize message field [coordinates]
    data.coordinates = _arrayDeserializer.int32(buffer, bufferOffset, 3)
    // Deserialize message field [position]
    data.position = _arrayDeserializer.int32(buffer, bufferOffset, 3)
    // Deserialize message field [range]
    data.range = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ID]
    data.ID = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [solver_error_code]
    data.solver_error_code = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [LED_flag]
    data.LED_flag = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 35;
  }

  static datatype() {
    // Returns string type for a message object
    return 'uwb_msg/UWB';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fa8236775a30fd2c3a9eb3c944966d32';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[3] coordinates    #coordinates of the anchor
    int32[3] position       #locating result 
    int32 range             #distance between anchor and tag
    int32 ID                #id of the anchor
    int8 solver_error_code  
    int16 LED_flag          #flag for NLOS/LOS
    std_msgs/Header header
    
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
    const resolved = new UWB(null);
    if (msg.coordinates !== undefined) {
      resolved.coordinates = msg.coordinates;
    }
    else {
      resolved.coordinates = new Array(3).fill(0)
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = new Array(3).fill(0)
    }

    if (msg.range !== undefined) {
      resolved.range = msg.range;
    }
    else {
      resolved.range = 0
    }

    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.solver_error_code !== undefined) {
      resolved.solver_error_code = msg.solver_error_code;
    }
    else {
      resolved.solver_error_code = 0
    }

    if (msg.LED_flag !== undefined) {
      resolved.LED_flag = msg.LED_flag;
    }
    else {
      resolved.LED_flag = 0
    }

    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    return resolved;
    }
};

module.exports = UWB;
