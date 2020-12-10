; Auto-generated. Do not edit!


(cl:in-package birl_module_robot-srv)


;//! \htmlinclude inverse_solution-request.msg.html

(cl:defclass <inverse_solution-request> (roslisp-msg-protocol:ros-message)
  ((which_robot
    :reader which_robot
    :initarg :which_robot
    :type cl:fixnum
    :initform 0)
   (base
    :reader base
    :initarg :base
    :type cl:boolean
    :initform cl:nil)
   (descartes_pos_commands
    :reader descartes_pos_commands
    :initarg :descartes_pos_commands
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (descartes_vel_commands
    :reader descartes_vel_commands
    :initarg :descartes_vel_commands
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (current_joint_state
    :reader current_joint_state
    :initarg :current_joint_state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass inverse_solution-request (<inverse_solution-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <inverse_solution-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'inverse_solution-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name birl_module_robot-srv:<inverse_solution-request> is deprecated: use birl_module_robot-srv:inverse_solution-request instead.")))

(cl:ensure-generic-function 'which_robot-val :lambda-list '(m))
(cl:defmethod which_robot-val ((m <inverse_solution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:which_robot-val is deprecated.  Use birl_module_robot-srv:which_robot instead.")
  (which_robot m))

(cl:ensure-generic-function 'base-val :lambda-list '(m))
(cl:defmethod base-val ((m <inverse_solution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:base-val is deprecated.  Use birl_module_robot-srv:base instead.")
  (base m))

(cl:ensure-generic-function 'descartes_pos_commands-val :lambda-list '(m))
(cl:defmethod descartes_pos_commands-val ((m <inverse_solution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:descartes_pos_commands-val is deprecated.  Use birl_module_robot-srv:descartes_pos_commands instead.")
  (descartes_pos_commands m))

(cl:ensure-generic-function 'descartes_vel_commands-val :lambda-list '(m))
(cl:defmethod descartes_vel_commands-val ((m <inverse_solution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:descartes_vel_commands-val is deprecated.  Use birl_module_robot-srv:descartes_vel_commands instead.")
  (descartes_vel_commands m))

(cl:ensure-generic-function 'current_joint_state-val :lambda-list '(m))
(cl:defmethod current_joint_state-val ((m <inverse_solution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:current_joint_state-val is deprecated.  Use birl_module_robot-srv:current_joint_state instead.")
  (current_joint_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <inverse_solution-request>) ostream)
  "Serializes a message object of type '<inverse_solution-request>"
  (cl:let* ((signed (cl:slot-value msg 'which_robot)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'base) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'descartes_pos_commands))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'descartes_pos_commands))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'descartes_vel_commands))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'descartes_vel_commands))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'current_joint_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'current_joint_state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <inverse_solution-request>) istream)
  "Deserializes a message object of type '<inverse_solution-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'which_robot) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'base) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'descartes_pos_commands) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'descartes_pos_commands)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'descartes_vel_commands) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'descartes_vel_commands)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'current_joint_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'current_joint_state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<inverse_solution-request>)))
  "Returns string type for a service object of type '<inverse_solution-request>"
  "birl_module_robot/inverse_solutionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'inverse_solution-request)))
  "Returns string type for a service object of type 'inverse_solution-request"
  "birl_module_robot/inverse_solutionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<inverse_solution-request>)))
  "Returns md5sum for a message object of type '<inverse_solution-request>"
  "fd70c212af5c1d03d9d1a73214023d9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'inverse_solution-request)))
  "Returns md5sum for a message object of type 'inverse_solution-request"
  "fd70c212af5c1d03d9d1a73214023d9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<inverse_solution-request>)))
  "Returns full string definition for message of type '<inverse_solution-request>"
  (cl:format cl:nil "~%int16 which_robot~%~%~%bool base~%~%~%float32[] descartes_pos_commands~%~%~%float32[] descartes_vel_commands~%~%~%~%float32[] current_joint_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'inverse_solution-request)))
  "Returns full string definition for message of type 'inverse_solution-request"
  (cl:format cl:nil "~%int16 which_robot~%~%~%bool base~%~%~%float32[] descartes_pos_commands~%~%~%float32[] descartes_vel_commands~%~%~%~%float32[] current_joint_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <inverse_solution-request>))
  (cl:+ 0
     2
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'descartes_pos_commands) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'descartes_vel_commands) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current_joint_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <inverse_solution-request>))
  "Converts a ROS message object to a list"
  (cl:list 'inverse_solution-request
    (cl:cons ':which_robot (which_robot msg))
    (cl:cons ':base (base msg))
    (cl:cons ':descartes_pos_commands (descartes_pos_commands msg))
    (cl:cons ':descartes_vel_commands (descartes_vel_commands msg))
    (cl:cons ':current_joint_state (current_joint_state msg))
))
;//! \htmlinclude inverse_solution-response.msg.html

(cl:defclass <inverse_solution-response> (roslisp-msg-protocol:ros-message)
  ((joint_pos_commands
    :reader joint_pos_commands
    :initarg :joint_pos_commands
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (joint_vel_commands
    :reader joint_vel_commands
    :initarg :joint_vel_commands
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass inverse_solution-response (<inverse_solution-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <inverse_solution-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'inverse_solution-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name birl_module_robot-srv:<inverse_solution-response> is deprecated: use birl_module_robot-srv:inverse_solution-response instead.")))

(cl:ensure-generic-function 'joint_pos_commands-val :lambda-list '(m))
(cl:defmethod joint_pos_commands-val ((m <inverse_solution-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:joint_pos_commands-val is deprecated.  Use birl_module_robot-srv:joint_pos_commands instead.")
  (joint_pos_commands m))

(cl:ensure-generic-function 'joint_vel_commands-val :lambda-list '(m))
(cl:defmethod joint_vel_commands-val ((m <inverse_solution-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:joint_vel_commands-val is deprecated.  Use birl_module_robot-srv:joint_vel_commands instead.")
  (joint_vel_commands m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <inverse_solution-response>) ostream)
  "Serializes a message object of type '<inverse_solution-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_pos_commands))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'joint_pos_commands))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_vel_commands))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'joint_vel_commands))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <inverse_solution-response>) istream)
  "Deserializes a message object of type '<inverse_solution-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_pos_commands) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_pos_commands)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_vel_commands) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_vel_commands)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<inverse_solution-response>)))
  "Returns string type for a service object of type '<inverse_solution-response>"
  "birl_module_robot/inverse_solutionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'inverse_solution-response)))
  "Returns string type for a service object of type 'inverse_solution-response"
  "birl_module_robot/inverse_solutionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<inverse_solution-response>)))
  "Returns md5sum for a message object of type '<inverse_solution-response>"
  "fd70c212af5c1d03d9d1a73214023d9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'inverse_solution-response)))
  "Returns md5sum for a message object of type 'inverse_solution-response"
  "fd70c212af5c1d03d9d1a73214023d9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<inverse_solution-response>)))
  "Returns full string definition for message of type '<inverse_solution-response>"
  (cl:format cl:nil "~%~%float32[] joint_pos_commands~%~%~%~%float32[] joint_vel_commands~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'inverse_solution-response)))
  "Returns full string definition for message of type 'inverse_solution-response"
  (cl:format cl:nil "~%~%float32[] joint_pos_commands~%~%~%~%float32[] joint_vel_commands~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <inverse_solution-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_pos_commands) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_vel_commands) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <inverse_solution-response>))
  "Converts a ROS message object to a list"
  (cl:list 'inverse_solution-response
    (cl:cons ':joint_pos_commands (joint_pos_commands msg))
    (cl:cons ':joint_vel_commands (joint_vel_commands msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'inverse_solution)))
  'inverse_solution-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'inverse_solution)))
  'inverse_solution-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'inverse_solution)))
  "Returns string type for a service object of type '<inverse_solution>"
  "birl_module_robot/inverse_solution")