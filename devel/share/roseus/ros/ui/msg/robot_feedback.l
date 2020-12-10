;; Auto-generated. Do not edit!


(when (boundp 'ui::robot_feedback)
  (if (not (find-package "UI"))
    (make-package "UI"))
  (shadow 'robot_feedback (find-package "UI")))
(unless (find-package "UI::ROBOT_FEEDBACK")
  (make-package "UI::ROBOT_FEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude robot_feedback.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ui::robot_feedback
  :super ros::object
  :slots (_timeHeader _feedbackPosData _feedbackVelData _feedbackCurrData _isGrasping ))

(defmethod ui::robot_feedback
  (:init
   (&key
    ((:timeHeader __timeHeader) (instance std_msgs::Header :init))
    ((:feedbackPosData __feedbackPosData) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:feedbackVelData __feedbackVelData) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:feedbackCurrData __feedbackCurrData) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:isGrasping __isGrasping) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _timeHeader __timeHeader)
   (setq _feedbackPosData __feedbackPosData)
   (setq _feedbackVelData __feedbackVelData)
   (setq _feedbackCurrData __feedbackCurrData)
   (setq _isGrasping __isGrasping)
   self)
  (:timeHeader
   (&rest __timeHeader)
   (if (keywordp (car __timeHeader))
       (send* _timeHeader __timeHeader)
     (progn
       (if __timeHeader (setq _timeHeader (car __timeHeader)))
       _timeHeader)))
  (:feedbackPosData
   (&optional __feedbackPosData)
   (if __feedbackPosData (setq _feedbackPosData __feedbackPosData)) _feedbackPosData)
  (:feedbackVelData
   (&optional __feedbackVelData)
   (if __feedbackVelData (setq _feedbackVelData __feedbackVelData)) _feedbackVelData)
  (:feedbackCurrData
   (&optional __feedbackCurrData)
   (if __feedbackCurrData (setq _feedbackCurrData __feedbackCurrData)) _feedbackCurrData)
  (:isGrasping
   (&optional __isGrasping)
   (if __isGrasping (setq _isGrasping __isGrasping)) _isGrasping)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _timeHeader
    (send _timeHeader :serialization-length)
    ;; float32[] _feedbackPosData
    (* 4    (length _feedbackPosData)) 4
    ;; float32[] _feedbackVelData
    (* 4    (length _feedbackVelData)) 4
    ;; float32[] _feedbackCurrData
    (* 4    (length _feedbackCurrData)) 4
    ;; bool[] _isGrasping
    (* 1    (length _isGrasping)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _timeHeader
       (send _timeHeader :serialize s)
     ;; float32[] _feedbackPosData
     (write-long (length _feedbackPosData) s)
     (dotimes (i (length _feedbackPosData))
       (sys::poke (elt _feedbackPosData i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _feedbackVelData
     (write-long (length _feedbackVelData) s)
     (dotimes (i (length _feedbackVelData))
       (sys::poke (elt _feedbackVelData i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _feedbackCurrData
     (write-long (length _feedbackCurrData) s)
     (dotimes (i (length _feedbackCurrData))
       (sys::poke (elt _feedbackCurrData i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool[] _isGrasping
     (write-long (length _isGrasping) s)
     (dotimes (i (length _isGrasping))
       (if (elt _isGrasping i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _timeHeader
     (send _timeHeader :deserialize buf ptr-) (incf ptr- (send _timeHeader :serialization-length))
   ;; float32[] _feedbackPosData
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _feedbackPosData (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _feedbackPosData i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _feedbackVelData
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _feedbackVelData (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _feedbackVelData i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _feedbackCurrData
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _feedbackCurrData (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _feedbackCurrData i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; bool[] _isGrasping
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _isGrasping (make-list n))
     (dotimes (i n)
     (setf (elt _isGrasping i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get ui::robot_feedback :md5sum-) "cbe9d95f303b479c3949a62170244b88")
(setf (get ui::robot_feedback :datatype-) "ui/robot_feedback")
(setf (get ui::robot_feedback :definition-)
      "# 时间戳
Header timeHeader
# 反馈关节位置数据 I1 T2 T3 T4 I5
float32[] feedbackPosData
# 反馈关节速度数据
float32[] feedbackVelData
# 反馈关节电流数据
float32[] feedbackCurrData
# 双爪抓夹情况(true:处于抓紧状态；false:处于松开状态),顺序：G0、G6
bool[] isGrasping

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



(provide :ui/robot_feedback "cbe9d95f303b479c3949a62170244b88")


