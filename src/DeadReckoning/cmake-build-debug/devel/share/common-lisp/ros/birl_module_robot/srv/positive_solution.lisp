; Auto-generated. Do not edit!


(cl:in-package birl_module_robot-srv)


;//! \htmlinclude positive_solution-request.msg.html

(cl:defclass <positive_solution-request> (roslisp-msg-protocol:ros-message)
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
   (current_joint_state
    :reader current_joint_state
    :initarg :current_joint_state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass positive_solution-request (<positive_solution-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <positive_solution-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'positive_solution-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name birl_module_robot-srv:<positive_solution-request> is deprecated: use birl_module_robot-srv:positive_solution-request instead.")))

(cl:ensure-generic-function 'which_robot-val :lambda-list '(m))
(cl:defmethod which_robot-val ((m <positive_solution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:which_robot-val is deprecated.  Use birl_module_robot-srv:which_robot instead.")
  (which_robot m))

(cl:ensure-generic-function 'base-val :lambda-list '(m))
(cl:defmethod base-val ((m <positive_solution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:base-val is deprecated.  Use birl_module_robot-srv:base instead.")
  (base m))

(cl:ensure-generic-function 'current_joint_state-val :lambda-list '(m))
(cl:defmethod current_joint_state-val ((m <positive_solution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:current_joint_state-val is deprecated.  Use birl_module_robot-srv:current_joint_state instead.")
  (current_joint_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <positive_solution-request>) ostream)
  "Serializes a message object of type '<positive_solution-request>"
  (cl:let* ((signed (cl:slot-value msg 'which_robot)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'base) 1 0)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <positive_solution-request>) istream)
  "Deserializes a message object of type '<positive_solution-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<positive_solution-request>)))
  "Returns string type for a service object of type '<positive_solution-request>"
  "birl_module_robot/positive_solutionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'positive_solution-request)))
  "Returns string type for a service object of type 'positive_solution-request"
  "birl_module_robot/positive_solutionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<positive_solution-request>)))
  "Returns md5sum for a message object of type '<positive_solution-request>"
  "c5997f26c5a0a6d545568596a384fa2e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'positive_solution-request)))
  "Returns md5sum for a message object of type 'positive_solution-request"
  "c5997f26c5a0a6d545568596a384fa2e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<positive_solution-request>)))
  "Returns full string definition for message of type '<positive_solution-request>"
  (cl:format cl:nil "~%int16 which_robot~%~%~%bool base~%~%~%~%float32[] current_joint_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'positive_solution-request)))
  "Returns full string definition for message of type 'positive_solution-request"
  (cl:format cl:nil "~%int16 which_robot~%~%~%bool base~%~%~%~%float32[] current_joint_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <positive_solution-request>))
  (cl:+ 0
     2
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current_joint_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <positive_solution-request>))
  "Converts a ROS message object to a list"
  (cl:list 'positive_solution-request
    (cl:cons ':which_robot (which_robot msg))
    (cl:cons ':base (base msg))
    (cl:cons ':current_joint_state (current_joint_state msg))
))
;//! \htmlinclude positive_solution-response.msg.html

(cl:defclass <positive_solution-response> (roslisp-msg-protocol:ros-message)
  ((descartes_pos_state
    :reader descartes_pos_state
    :initarg :descartes_pos_state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass positive_solution-response (<positive_solution-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <positive_solution-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'positive_solution-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name birl_module_robot-srv:<positive_solution-response> is deprecated: use birl_module_robot-srv:positive_solution-response instead.")))

(cl:ensure-generic-function 'descartes_pos_state-val :lambda-list '(m))
(cl:defmethod descartes_pos_state-val ((m <positive_solution-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader birl_module_robot-srv:descartes_pos_state-val is deprecated.  Use birl_module_robot-srv:descartes_pos_state instead.")
  (descartes_pos_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <positive_solution-response>) ostream)
  "Serializes a message object of type '<positive_solution-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'descartes_pos_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'descartes_pos_state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <positive_solution-response>) istream)
  "Deserializes a message object of type '<positive_solution-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'descartes_pos_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'descartes_pos_state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<positive_solution-response>)))
  "Returns string type for a service object of type '<positive_solution-response>"
  "birl_module_robot/positive_solutionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'positive_solution-response)))
  "Returns string type for a service object of type 'positive_solution-response"
  "birl_module_robot/positive_solutionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<positive_solution-response>)))
  "Returns md5sum for a message object of type '<positive_solution-response>"
  "c5997f26c5a0a6d545568596a384fa2e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'positive_solution-response)))
  "Returns md5sum for a message object of type 'positive_solution-response"
  "c5997f26c5a0a6d545568596a384fa2e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<positive_solution-response>)))
  "Returns full string definition for message of type '<positive_solution-response>"
  (cl:format cl:nil "~%float32[] descartes_pos_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'positive_solution-response)))
  "Returns full string definition for message of type 'positive_solution-response"
  (cl:format cl:nil "~%float32[] descartes_pos_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <positive_solution-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'descartes_pos_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <positive_solution-response>))
  "Converts a ROS message object to a list"
  (cl:list 'positive_solution-response
    (cl:cons ':descartes_pos_state (descartes_pos_state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'positive_solution)))
  'positive_solution-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'positive_solution)))
  'positive_solution-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'positive_solution)))
  "Returns string type for a service object of type '<positive_solution>"
  "birl_module_robot/positive_solution")