; Auto-generated. Do not edit!


(cl:in-package ui-msg)


;//! \htmlinclude robot_command.msg.html

(cl:defclass <robot_command> (roslisp-msg-protocol:ros-message)
  ((timeHeader
    :reader timeHeader
    :initarg :timeHeader
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (CommandPosData
    :reader CommandPosData
    :initarg :CommandPosData
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (CommandVelData
    :reader CommandVelData
    :initarg :CommandVelData
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass robot_command (<robot_command>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_command>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_command)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ui-msg:<robot_command> is deprecated: use ui-msg:robot_command instead.")))

(cl:ensure-generic-function 'timeHeader-val :lambda-list '(m))
(cl:defmethod timeHeader-val ((m <robot_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ui-msg:timeHeader-val is deprecated.  Use ui-msg:timeHeader instead.")
  (timeHeader m))

(cl:ensure-generic-function 'CommandPosData-val :lambda-list '(m))
(cl:defmethod CommandPosData-val ((m <robot_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ui-msg:CommandPosData-val is deprecated.  Use ui-msg:CommandPosData instead.")
  (CommandPosData m))

(cl:ensure-generic-function 'CommandVelData-val :lambda-list '(m))
(cl:defmethod CommandVelData-val ((m <robot_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ui-msg:CommandVelData-val is deprecated.  Use ui-msg:CommandVelData instead.")
  (CommandVelData m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_command>) ostream)
  "Serializes a message object of type '<robot_command>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'timeHeader) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'CommandPosData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'CommandPosData))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'CommandVelData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'CommandVelData))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_command>) istream)
  "Deserializes a message object of type '<robot_command>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'timeHeader) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'CommandPosData) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'CommandPosData)))
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
  (cl:setf (cl:slot-value msg 'CommandVelData) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'CommandVelData)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_command>)))
  "Returns string type for a message object of type '<robot_command>"
  "ui/robot_command")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_command)))
  "Returns string type for a message object of type 'robot_command"
  "ui/robot_command")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_command>)))
  "Returns md5sum for a message object of type '<robot_command>"
  "fc01d01e3e5b26ff37d3ece2d39ae6d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_command)))
  "Returns md5sum for a message object of type 'robot_command"
  "fc01d01e3e5b26ff37d3ece2d39ae6d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_command>)))
  "Returns full string definition for message of type '<robot_command>"
  (cl:format cl:nil "# 时间戳~%Header timeHeader~%# 关节位置命令 I1 T2 T3 T4 I5~%float32[] CommandPosData~%# 关节速度命令~%float32[] CommandVelData~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_command)))
  "Returns full string definition for message of type 'robot_command"
  (cl:format cl:nil "# 时间戳~%Header timeHeader~%# 关节位置命令 I1 T2 T3 T4 I5~%float32[] CommandPosData~%# 关节速度命令~%float32[] CommandVelData~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_command>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'timeHeader))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'CommandPosData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'CommandVelData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_command>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_command
    (cl:cons ':timeHeader (timeHeader msg))
    (cl:cons ':CommandPosData (CommandPosData msg))
    (cl:cons ':CommandVelData (CommandVelData msg))
))
