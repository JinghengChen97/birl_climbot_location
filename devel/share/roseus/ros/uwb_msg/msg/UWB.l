;; Auto-generated. Do not edit!


(when (boundp 'uwb_msg::UWB)
  (if (not (find-package "UWB_MSG"))
    (make-package "UWB_MSG"))
  (shadow 'UWB (find-package "UWB_MSG")))
(unless (find-package "UWB_MSG::UWB")
  (make-package "UWB_MSG::UWB"))

(in-package "ROS")
;;//! \htmlinclude UWB.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass uwb_msg::UWB
  :super ros::object
  :slots (_coordinates _position _range _ID _solver_error_code _LED_flag _header ))

(defmethod uwb_msg::UWB
  (:init
   (&key
    ((:coordinates __coordinates) (make-array 3 :initial-element 0 :element-type :integer))
    ((:position __position) (make-array 3 :initial-element 0 :element-type :integer))
    ((:range __range) 0)
    ((:ID __ID) 0)
    ((:solver_error_code __solver_error_code) 0)
    ((:LED_flag __LED_flag) 0)
    ((:header __header) (instance std_msgs::Header :init))
    )
   (send-super :init)
   (setq _coordinates __coordinates)
   (setq _position __position)
   (setq _range (round __range))
   (setq _ID (round __ID))
   (setq _solver_error_code (round __solver_error_code))
   (setq _LED_flag (round __LED_flag))
   (setq _header __header)
   self)
  (:coordinates
   (&optional __coordinates)
   (if __coordinates (setq _coordinates __coordinates)) _coordinates)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:solver_error_code
   (&optional __solver_error_code)
   (if __solver_error_code (setq _solver_error_code __solver_error_code)) _solver_error_code)
  (:LED_flag
   (&optional __LED_flag)
   (if __LED_flag (setq _LED_flag __LED_flag)) _LED_flag)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:serialization-length
   ()
   (+
    ;; int32[3] _coordinates
    (* 4    3)
    ;; int32[3] _position
    (* 4    3)
    ;; int32 _range
    4
    ;; int32 _ID
    4
    ;; int8 _solver_error_code
    1
    ;; int16 _LED_flag
    2
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[3] _coordinates
     (dotimes (i 3)
       (write-long (elt _coordinates i) s)
       )
     ;; int32[3] _position
     (dotimes (i 3)
       (write-long (elt _position i) s)
       )
     ;; int32 _range
       (write-long _range s)
     ;; int32 _ID
       (write-long _ID s)
     ;; int8 _solver_error_code
       (write-byte _solver_error_code s)
     ;; int16 _LED_flag
       (write-word _LED_flag s)
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[3] _coordinates
   (dotimes (i (length _coordinates))
     (setf (elt _coordinates i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;; int32[3] _position
   (dotimes (i (length _position))
     (setf (elt _position i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;; int32 _range
     (setq _range (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _ID
     (setq _ID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8 _solver_error_code
     (setq _solver_error_code (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _solver_error_code 127) (setq _solver_error_code (- _solver_error_code 256)))
   ;; int16 _LED_flag
     (setq _LED_flag (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;;
   self)
  )

(setf (get uwb_msg::UWB :md5sum-) "fa8236775a30fd2c3a9eb3c944966d32")
(setf (get uwb_msg::UWB :datatype-) "uwb_msg/UWB")
(setf (get uwb_msg::UWB :definition-)
      "int32[3] coordinates    #coordinates of the anchor
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

")



(provide :uwb_msg/UWB "fa8236775a30fd2c3a9eb3c944966d32")


