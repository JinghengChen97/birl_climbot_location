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

class positive_solutionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.which_robot = null;
      this.base = null;
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
      if (initObj.hasOwnProperty('current_joint_state')) {
        this.current_joint_state = initObj.current_joint_state
      }
      else {
        this.current_joint_state = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type positive_solutionRequest
    // Serialize message field [which_robot]
    bufferOffset = _serializer.int16(obj.which_robot, buffer, bufferOffset);
    // Serialize message field [base]
    bufferOffset = _serializer.bool(obj.base, buffer, bufferOffset);
    // Serialize message field [current_joint_state]
    bufferOffset = _arraySerializer.float32(obj.current_joint_state, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type positive_solutionRequest
    let len;
    let data = new positive_solutionRequest(null);
    // Deserialize message field [which_robot]
    data.which_robot = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [base]
    data.base = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [current_joint_state]
    data.current_joint_state = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.current_joint_state.length;
    return length + 7;
  }

  static datatype() {
    // Returns string type for a service object
    return 'birl_module_robot/positive_solutionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ceff49dac1ed202ff2e7a6a83cff0b57';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    int16 which_robot
    
    
    bool base
    
    
    
    float32[] current_joint_state
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new positive_solutionRequest(null);
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

    if (msg.current_joint_state !== undefined) {
      resolved.current_joint_state = msg.current_joint_state;
    }
    else {
      resolved.current_joint_state = []
    }

    return resolved;
    }
};

class positive_solutionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.descartes_pos_state = null;
    }
    else {
      if (initObj.hasOwnProperty('descartes_pos_state')) {
        this.descartes_pos_state = initObj.descartes_pos_state
      }
      else {
        this.descartes_pos_state = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type positive_solutionResponse
    // Serialize message field [descartes_pos_state]
    bufferOffset = _arraySerializer.float32(obj.descartes_pos_state, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type positive_solutionResponse
    let len;
    let data = new positive_solutionResponse(null);
    // Deserialize message field [descartes_pos_state]
    data.descartes_pos_state = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.descartes_pos_state.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'birl_module_robot/positive_solutionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fe80e8e458ade4cd50cd39e028eb1dc7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float32[] descartes_pos_state
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new positive_solutionResponse(null);
    if (msg.descartes_pos_state !== undefined) {
      resolved.descartes_pos_state = msg.descartes_pos_state;
    }
    else {
      resolved.descartes_pos_state = []
    }

    return resolved;
    }
};

module.exports = {
  Request: positive_solutionRequest,
  Response: positive_solutionResponse,
  md5sum() { return 'c5997f26c5a0a6d545568596a384fa2e'; },
  datatype() { return 'birl_module_robot/positive_solution'; }
};
