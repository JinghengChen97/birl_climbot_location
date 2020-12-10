// Auto-generated. Do not edit!

// (in-package birl_module_robot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class inverse_solutionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.which_robot = null;
      this.base = null;
      this.descartes_pos_commands = null;
      this.descartes_vel_commands = null;
      this.current_joint_state = null;
    }
    else {
      if (initObj.hasOwnProperty('which_robot')) {
        this.which_robot = initObj.which_robot
      }
      else {
        this.which_robot = 0;
      }
      if (initObj.hasOwnProperty('base')) {
        this.base = initObj.base
      }
      else {
        this.base = false;
      }
      if (initObj.hasOwnProperty('descartes_pos_commands')) {
        this.descartes_pos_commands = initObj.descartes_pos_commands
      }
      else {
        this.descartes_pos_commands = [];
      }
      if (initObj.hasOwnProperty('descartes_vel_commands')) {
        this.descartes_vel_commands = initObj.descartes_vel_commands
      }
      else {
        this.descartes_vel_commands = [];
      }
      if (initObj.hasOwnProperty('current_joint_state')) {
        this.current_joint_state = initObj.current_joint_state
      }
      else {
        this.current_joint_state = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type inverse_solutionRequest
    // Serialize message field [which_robot]
    bufferOffset = _serializer.int16(obj.which_robot, buffer, bufferOffset);
    // Serialize message field [base]
    bufferOffset = _serializer.bool(obj.base, buffer, bufferOffset);
    // Serialize message field [descartes_pos_commands]
    bufferOffset = _arraySerializer.float32(obj.descartes_pos_commands, buffer, bufferOffset, null);
    // Serialize message field [descartes_vel_commands]
    bufferOffset = _arraySerializer.float32(obj.descartes_vel_commands, buffer, bufferOffset, null);
    // Serialize message field [current_joint_state]
    bufferOffset = _arraySerializer.float32(obj.current_joint_state, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type inverse_solutionRequest
    let len;
    let data = new inverse_solutionRequest(null);
    // Deserialize message field [which_robot]
    data.which_robot = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [base]
    data.base = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [descartes_pos_commands]
    data.descartes_pos_commands = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [descartes_vel_commands]
    data.descartes_vel_commands = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [current_joint_state]
    data.current_joint_state = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.descartes_pos_commands.length;
    length += 4 * object.descartes_vel_commands.length;
    length += 4 * object.current_joint_state.length;
    return length + 15;
  }

  static datatype() {
    // Returns string type for a service object
    return 'birl_module_robot/inverse_solutionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '31c5edc55004419b86af606b1c3081a3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    int16 which_robot
    
    
    bool base
    
    
    float32[] descartes_pos_commands
    
    
    float32[] descartes_vel_commands
    
    
    
    float32[] current_joint_state
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new inverse_solutionRequest(null);
    if (msg.which_robot !== undefined) {
      resolved.which_robot = msg.which_robot;
    }
    else {
      resolved.which_robot = 0
    }

    if (msg.base !== undefined) {
      resolved.base = msg.base;
    }
    else {
      resolved.base = false
    }

    if (msg.descartes_pos_commands !== undefined) {
      resolved.descartes_pos_commands = msg.descartes_pos_commands;
    }
    else {
      resolved.descartes_pos_commands = []
    }

    if (msg.descartes_vel_commands !== undefined) {
      resolved.descartes_vel_commands = msg.descartes_vel_commands;
    }
    else {
      resolved.descartes_vel_commands = []
    }

    if (msg.current_joint_state !== undefined) {
      resolved.current_joint_state = msg.current_joint_state;
    }
    else {
      resolved.current_joint_state = []
    }

    return resolved;
    }
};

class inverse_solutionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_pos_commands = null;
      this.joint_vel_commands = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_pos_commands')) {
        this.joint_pos_commands = initObj.joint_pos_commands
      }
      else {
        this.joint_pos_commands = [];
      }
      if (initObj.hasOwnProperty('joint_vel_commands')) {
        this.joint_vel_commands = initObj.joint_vel_commands
      }
      else {
        this.joint_vel_commands = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type inverse_solutionResponse
    // Serialize message field [joint_pos_commands]
    bufferOffset = _arraySerializer.float32(obj.joint_pos_commands, buffer, bufferOffset, null);
    // Serialize message field [joint_vel_commands]
    bufferOffset = _arraySerializer.float32(obj.joint_vel_commands, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type inverse_solutionResponse
    let len;
    let data = new inverse_solutionResponse(null);
    // Deserialize message field [joint_pos_commands]
    data.joint_pos_commands = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [joint_vel_commands]
    data.joint_vel_commands = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.joint_pos_commands.length;
    length += 4 * object.joint_vel_commands.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'birl_module_robot/inverse_solutionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9f62639cfbedb0e764507d1d70b9c0bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    float32[] joint_pos_commands
    
    
    
    float32[] joint_vel_commands
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new inverse_solutionResponse(null);
    if (msg.joint_pos_commands !== undefined) {
      resolved.joint_pos_commands = msg.joint_pos_commands;
    }
    else {
      resolved.joint_pos_commands = []
    }

    if (msg.joint_vel_commands !== undefined) {
      resolved.joint_vel_commands = msg.joint_vel_commands;
    }
    else {
      resolved.joint_vel_commands = []
    }

    return resolved;
    }
};

module.exports = {
  Request: inverse_solutionRequest,
  Response: inverse_solutionResponse,
  md5sum() { return 'fd70c212af5c1d03d9d1a73214023d9c'; },
  datatype() { return 'birl_module_robot/inverse_solution'; }
};
