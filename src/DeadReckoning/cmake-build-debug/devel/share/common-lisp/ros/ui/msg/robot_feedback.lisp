; Auto-generated. Do not edit!


(cl:in-package ui-msg)


;//! \htmlinclude robot_feedback.msg.html

(cl:defclass <robot_feedback> (roslisp-msg-protocol:ros-message)
  ((timeHeader
    :reader timeHeader
    :initarg :timeHeader
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (feedbackPosData
    :reader feedbackPosData
    :initarg :feedbackPosData
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (feedbackVelData
    :reader feedbackVelData
    :initarg :feedbackVelData
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (feedbackCurrData
    :reader feedbackCurrData
    :initarg :feedbackCurrData
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (isGrasping
    :reader isGrasping
    :initarg :isGrasping
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass robot_feedback (<robot_feedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_feedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_feedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ui-msg:<robot_feedback> is deprecated: use ui-msg:robot_feedback instead.")))

(cl:ensure-generic-function 'timeHeader-val :lambda-list '(m))
(cl:defmethod timeHeader-val ((m <robot_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ui-msg:timeHeader-val is deprecated.  Use ui-msg:timeHeader instead.")
  (timeHeader m))

(cl:ensure-generic-function 'feedbackPosData-val :lambda-list '(m))
(cl:defmethod feedbackPosData-val ((m <robot_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ui-msg:feedbackPosData-val is deprecated.  Use ui-msg:feedbackPosData instead.")
  (feedbackPosData m))

(cl:ensure-generic-function 'feedbackVelData-val :lambda-list '(m))
(cl:defmethod feedbackVelData-val ((m <robot_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ui-msg:feedbackVelData-val is deprecated.  Use ui-msg:feedbackVelData instead.")
  (feedbackVelData m))

(cl:ensure-generic-function 'feedbackCurrData-val :lambda-list '(m))
(cl:defmethod feedbackCurrData-val ((m <robot_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ui-msg:feedbackCurrData-val is deprecated.  Use ui-msg:feedbackCurrData instead.")
  (feedbackCurrData m))

(cl:ensure-generic-function 'isGrasping-val :lambda-list '(m))
(cl:defmethod isGrasping-val ((m <robot_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ui-msg:isGrasping-val is deprecated.  Use ui-msg:isGrasping instead.")
  (isGrasping m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_feedback>) ostream)
  "Serializes a message object of type '<robot_feedback>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'timeHeader) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'feedbackPosData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'feedbackPosData))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'feedbackVelData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'feedbackVelData))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'feedbackCurrData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'feedbackCurrData))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'isGrasping))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'isGrasping))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_feedback>) istream)
  "Deserializes a message object of type '<robot_feedback>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'timeHeader) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'feedbackPosData) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'feedbackPosData)))
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
  (cl:setf (cl:slot-value msg 'feedbackVelData) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'feedbackVelData)))
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
  (cl:setf (cl:slot-value msg 'feedbackCurrData) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'feedbackCurrData)))
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
  (cl:setf (cl:slot-value msg 'isGrasping) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'isGrasping)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_feedback>)))
  "Returns string type for a message object of type '<robot_feedback>"
  "ui/robot_feedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_feedback)))
  "Returns string type for a message object of type 'robot_feedback"
  "ui/robot_feedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_feedback>)))
  "Returns md5sum for a message object of type '<robot_feedback>"
  "cbe9d95f303b479c3949a62170244b88")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_feedback)))
  "Returns md5sum for a message object of type 'robot_feedback"
  "cbe9d95f303b479c3949a62170244b88")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_feedback>)))
  "Returns full string definition for message of type '<robot_feedback>"
  (cl:format cl:nil "# 时间戳~%Header timeHeader~%# 反馈关节位置数据 I1 T2 T3 T4 I5~%float32[] feedbackPosData~%# 反馈关节速度数据~%float32[] feedbackVelData~%# 反馈关节电流数据~%float32[] feedbackCurrData~%# 双爪抓夹情况(true:处于抓紧状态；false:处于松开状态),顺序：G0、G6~%bool[] isGrasping~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_feedback)))
  "Returns full string definition for message of type 'robot_feedback"
  (cl:format cl:nil "# 时间戳~%Header timeHeader~%# 反馈关节位置数据 I1 T2 T3 T4 I5~%float32[] feedbackPosData~%# 反馈关节速度数据~%float32[] feedbackVelData~%# 反馈关节电流数据~%float32[] feedbackCurrData~%# 双爪抓夹情况(true:处于抓紧状态；false:处于松开状态),顺序：G0、G6~%bool[] isGrasping~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_feedback>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'timeHeader))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'feedbackPosData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'feedbackVelData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'feedbackCurrData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'isGrasping) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_feedback>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_feedback
    (cl:cons ':timeHeader (timeHeader msg))
    (cl:cons ':feedbackPosData (feedbackPosData msg))
    (cl:cons ':feedbackVelData (feedbackVelData msg))
    (cl:cons ':feedbackCurrData (feedbackCurrData msg))
    (cl:cons ':isGrasping (isGrasping msg))
))
