;; Auto-generated. Do not edit!


(when (boundp 'ui::robot_command)
  (if (not (find-package "UI"))
    (make-package "UI"))
  (shadow 'robot_command (find-package "UI")))
(unless (find-package "UI::ROBOT_COMMAND")
  (make-package "UI::ROBOT_COMMAND"))

(in-package "ROS")
;;//! \htmlinclude robot_command.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ui::robot_command
  :super ros::object
  :slots (_timeHeader _CommandPosData _CommandVelData ))

(defmethod ui::robot_command
  (:init
   (&key
    ((:timeHeader __timeHeader) (instance std_msgs::Header :init))
    ((:CommandPosData __CommandPosData) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:CommandVelData __CommandVelData) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _timeHeader __timeHeader)
   (setq _CommandPosData __CommandPosData)
   (setq _CommandVelData __CommandVelData)
   self)
  (:timeHeader
   (&rest __timeHeader)
   (if (keywordp (car __timeHeader))
       (send* _timeHeader __timeHeader)
     (progn
       (if __timeHeader (setq _timeHeader (car __timeHeader)))
       _timeHeader)))
  (:CommandPosData
   (&optional __CommandPosData)
   (if __CommandPosData (setq _CommandPosData __CommandPosData)) _CommandPosData)
  (:CommandVelData
   (&optional __CommandVelData)
   (if __CommandVelData (setq _CommandVelData __CommandVelData)) _CommandVelData)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _timeHeader
    (send _timeHeader :serialization-length)
    ;; float32[] _CommandPosData
    (* 4    (length _CommandPosData)) 4
    ;; float32[] _CommandVelData
    (* 4    (length _CommandVelData)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _timeHeader
       (send _timeHeader :serialize s)
     ;; float32[] _CommandPosData
     (write-long (length _CommandPosData) s)
     (dotimes (i (length _CommandPosData))
       (sys::poke (elt _CommandPosData i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _CommandVelData
     (write-long (length _CommandVelData) s)
     (dotimes (i (length _CommandVelData))
       (sys::poke (elt _CommandVelData i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _timeHeader
     (send _timeHeader :deserialize buf ptr-) (incf ptr- (send _timeHeader :serialization-length))
   ;; float32[] _CommandPosData
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _CommandPosData (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _CommandPosData i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _CommandVelData
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _CommandVelData (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _CommandVelData i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get ui::robot_command :md5sum-) "fc01d01e3e5b26ff37d3ece2d39ae6d6")
(setf (get ui::robot_command :datatype-) "ui/robot_command")
(setf (get ui::robot_command :definition-)
      "# 时间戳
Header timeHeader
# 关节位置命令 I1 T2 T3 T4 I5
float32[] CommandPosData
# 关节速度命令
float32[] CommandVelData

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



(provide :ui/robot_command "fc01d01e3e5b26ff37d3ece2d39ae6d6")


