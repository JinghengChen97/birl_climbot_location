; Auto-generated. Do not edit!


(cl:in-package uwb_msg-msg)


;//! \htmlinclude UWB.msg.html

(cl:defclass <UWB> (roslisp-msg-protocol:ros-message)
  ((coordinates
    :reader coordinates
    :initarg :coordinates
    :type (cl:vector cl:integer)
   :initform (cl:make-array 3 :element-type 'cl:integer :initial-element 0))
   (position
    :reader position
    :initarg :position
    :type (cl:vector cl:integer)
   :initform (cl:make-array 3 :element-type 'cl:integer :initial-element 0))
   (range
    :reader range
    :initarg :range
    :type cl:integer
    :initform 0)
   (ID
    :reader ID
    :initarg :ID
    :type cl:integer
    :initform 0)
   (solver_error_code
    :reader solver_error_code
    :initarg :solver_error_code
    :type cl:fixnum
    :initform 0)
   (LED_flag
    :reader LED_flag
    :initarg :LED_flag
    :type cl:fixnum
    :initform 0)
   (header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header)))
)

(cl:defclass UWB (<UWB>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UWB>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UWB)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uwb_msg-msg:<UWB> is deprecated: use uwb_msg-msg:UWB instead.")))

(cl:ensure-generic-function 'coordinates-val :lambda-list '(m))
(cl:defmethod coordinates-val ((m <UWB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msg-msg:coordinates-val is deprecated.  Use uwb_msg-msg:coordinates instead.")
  (coordinates m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <UWB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msg-msg:position-val is deprecated.  Use uwb_msg-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <UWB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msg-msg:range-val is deprecated.  Use uwb_msg-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <UWB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msg-msg:ID-val is deprecated.  Use uwb_msg-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'solver_error_code-val :lambda-list '(m))
(cl:defmethod solver_error_code-val ((m <UWB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msg-msg:solver_error_code-val is deprecated.  Use uwb_msg-msg:solver_error_code instead.")
  (solver_error_code m))

(cl:ensure-generic-function 'LED_flag-val :lambda-list '(m))
(cl:defmethod LED_flag-val ((m <UWB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msg-msg:LED_flag-val is deprecated.  Use uwb_msg-msg:LED_flag instead.")
  (LED_flag m))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <UWB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msg-msg:header-val is deprecated.  Use uwb_msg-msg:header instead.")
  (header m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UWB>) ostream)
  "Serializes a message object of type '<UWB>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'coordinates))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'position))
  (cl:let* ((signed (cl:slot-value msg 'range)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'solver_error_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'LED_flag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UWB>) istream)
  "Deserializes a message object of type '<UWB>"
  (cl:setf (cl:slot-value msg 'coordinates) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'coordinates)))
    (cl:dotimes (i 3)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i 3)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'range) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ID) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'solver_error_code) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'LED_flag) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UWB>)))
  "Returns string type for a message object of type '<UWB>"
  "uwb_msg/UWB")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UWB)))
  "Returns string type for a message object of type 'UWB"
  "uwb_msg/UWB")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UWB>)))
  "Returns md5sum for a message object of type '<UWB>"
  "fa8236775a30fd2c3a9eb3c944966d32")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UWB)))
  "Returns md5sum for a message object of type 'UWB"
  "fa8236775a30fd2c3a9eb3c944966d32")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UWB>)))
  "Returns full string definition for message of type '<UWB>"
  (cl:format cl:nil "int32[3] coordinates    #coordinates of the anchor~%int32[3] position       #locating result ~%int32 range             #distance between anchor and tag~%int32 ID                #id of the anchor~%int8 solver_error_code  ~%int16 LED_flag          #flag for NLOS/LOS~%std_msgs/Header header~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UWB)))
  "Returns full string definition for message of type 'UWB"
  (cl:format cl:nil "int32[3] coordinates    #coordinates of the anchor~%int32[3] position       #locating result ~%int32 range             #distance between anchor and tag~%int32 ID                #id of the anchor~%int8 solver_error_code  ~%int16 LED_flag          #flag for NLOS/LOS~%std_msgs/Header header~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UWB>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'coordinates) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     1
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UWB>))
  "Converts a ROS message object to a list"
  (cl:list 'UWB
    (cl:cons ':coordinates (coordinates msg))
    (cl:cons ':position (position msg))
    (cl:cons ':range (range msg))
    (cl:cons ':ID (ID msg))
    (cl:cons ':solver_error_code (solver_error_code msg))
    (cl:cons ':LED_flag (LED_flag msg))
    (cl:cons ':header (header msg))
))
