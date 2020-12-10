;; Auto-generated. Do not edit!


(when (boundp 'birl_module_robot::inverse_solution)
  (if (not (find-package "BIRL_MODULE_ROBOT"))
    (make-package "BIRL_MODULE_ROBOT"))
  (shadow 'inverse_solution (find-package "BIRL_MODULE_ROBOT")))
(unless (find-package "BIRL_MODULE_ROBOT::INVERSE_SOLUTION")
  (make-package "BIRL_MODULE_ROBOT::INVERSE_SOLUTION"))
(unless (find-package "BIRL_MODULE_ROBOT::INVERSE_SOLUTIONREQUEST")
  (make-package "BIRL_MODULE_ROBOT::INVERSE_SOLUTIONREQUEST"))
(unless (find-package "BIRL_MODULE_ROBOT::INVERSE_SOLUTIONRESPONSE")
  (make-package "BIRL_MODULE_ROBOT::INVERSE_SOLUTIONRESPONSE"))

(in-package "ROS")





(defclass birl_module_robot::inverse_solutionRequest
  :super ros::object
  :slots (_which_robot _base _descartes_pos_commands _descartes_vel_commands _current_joint_state ))

(defmethod birl_module_robot::inverse_solutionRequest
  (:init
   (&key
    ((:which_robot __which_robot) 0)
    ((:base __base) nil)
    ((:descartes_pos_commands __descartes_pos_commands) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:descartes_vel_commands __descartes_vel_commands) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:current_joint_state __current_joint_state) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _which_robot (round __which_robot))
   (setq _base __base)
   (setq _descartes_pos_commands __descartes_pos_commands)
   (setq _descartes_vel_commands __descartes_vel_commands)
   (setq _current_joint_state __current_joint_state)
   self)
  (:which_robot
   (&optional __which_robot)
   (if __which_robot (setq _which_robot __which_robot)) _which_robot)
  (:base
   (&optional __base)
   (if __base (setq _base __base)) _base)
  (:descartes_pos_commands
   (&optional __descartes_pos_commands)
   (if __descartes_pos_commands (setq _descartes_pos_commands __descartes_pos_commands)) _descartes_pos_commands)
  (:descartes_vel_commands
   (&optional __descartes_vel_commands)
   (if __descartes_vel_commands (setq _descartes_vel_commands __descartes_vel_commands)) _descartes_vel_commands)
  (:current_joint_state
   (&optional __current_joint_state)
   (if __current_joint_state (setq _current_joint_state __current_joint_state)) _current_joint_state)
  (:serialization-length
   ()
   (+
    ;; int16 _which_robot
    2
    ;; bool _base
    1
    ;; float32[] _descartes_pos_commands
    (* 4    (length _descartes_pos_commands)) 4
    ;; float32[] _descartes_vel_commands
    (* 4    (length _descartes_vel_commands)) 4
    ;; float32[] _current_joint_state
    (* 4    (length _current_joint_state)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _which_robot
       (write-word _which_robot s)
     ;; bool _base
       (if _base (write-byte -1 s) (write-byte 0 s))
     ;; float32[] _descartes_pos_commands
     (write-long (length _descartes_pos_commands) s)
     (dotimes (i (length _descartes_pos_commands))
       (sys::poke (elt _descartes_pos_commands i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _descartes_vel_commands
     (write-long (length _descartes_vel_commands) s)
     (dotimes (i (length _descartes_vel_commands))
       (sys::poke (elt _descartes_vel_commands i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _current_joint_state
     (write-long (length _current_joint_state) s)
     (dotimes (i (length _current_joint_state))
       (sys::poke (elt _current_joint_state i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _which_robot
     (setq _which_robot (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _base
     (setq _base (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32[] _descartes_pos_commands
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _descartes_pos_commands (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _descartes_pos_commands i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _descartes_vel_commands
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _descartes_vel_commands (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _descartes_vel_commands i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _current_joint_state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _current_joint_state (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _current_joint_state i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass birl_module_robot::inverse_solutionResponse
  :super ros::object
  :slots (_joint_pos_commands _joint_vel_commands ))

(defmethod birl_module_robot::inverse_solutionResponse
  (:init
   (&key
    ((:joint_pos_commands __joint_pos_commands) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:joint_vel_commands __joint_vel_commands) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_pos_commands __joint_pos_commands)
   (setq _joint_vel_commands __joint_vel_commands)
   self)
  (:joint_pos_commands
   (&optional __joint_pos_commands)
   (if __joint_pos_commands (setq _joint_pos_commands __joint_pos_commands)) _joint_pos_commands)
  (:joint_vel_commands
   (&optional __joint_vel_commands)
   (if __joint_vel_commands (setq _joint_vel_commands __joint_vel_commands)) _joint_vel_commands)
  (:serialization-length
   ()
   (+
    ;; float32[] _joint_pos_commands
    (* 4    (length _joint_pos_commands)) 4
    ;; float32[] _joint_vel_commands
    (* 4    (length _joint_vel_commands)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _joint_pos_commands
     (write-long (length _joint_pos_commands) s)
     (dotimes (i (length _joint_pos_commands))
       (sys::poke (elt _joint_pos_commands i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _joint_vel_commands
     (write-long (length _joint_vel_commands) s)
     (dotimes (i (length _joint_vel_commands))
       (sys::poke (elt _joint_vel_commands i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _joint_pos_commands
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_pos_commands (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_pos_commands i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _joint_vel_commands
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_vel_commands (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_vel_commands i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass birl_module_robot::inverse_solution
  :super ros::object
  :slots ())

(setf (get birl_module_robot::inverse_solution :md5sum-) "fd70c212af5c1d03d9d1a73214023d9c")
(setf (get birl_module_robot::inverse_solution :datatype-) "birl_module_robot/inverse_solution")
(setf (get birl_module_robot::inverse_solution :request) birl_module_robot::inverse_solutionRequest)
(setf (get birl_module_robot::inverse_solution :response) birl_module_robot::inverse_solutionResponse)

(defmethod birl_module_robot::inverse_solutionRequest
  (:response () (instance birl_module_robot::inverse_solutionResponse :init)))

(setf (get birl_module_robot::inverse_solutionRequest :md5sum-) "fd70c212af5c1d03d9d1a73214023d9c")
(setf (get birl_module_robot::inverse_solutionRequest :datatype-) "birl_module_robot/inverse_solutionRequest")
(setf (get birl_module_robot::inverse_solutionRequest :definition-)
      "
int16 which_robot


bool base


float32[] descartes_pos_commands


float32[] descartes_vel_commands



float32[] current_joint_state

---


float32[] joint_pos_commands



float32[] joint_vel_commands

")

(setf (get birl_module_robot::inverse_solutionResponse :md5sum-) "fd70c212af5c1d03d9d1a73214023d9c")
(setf (get birl_module_robot::inverse_solutionResponse :datatype-) "birl_module_robot/inverse_solutionResponse")
(setf (get birl_module_robot::inverse_solutionResponse :definition-)
      "
int16 which_robot


bool base


float32[] descartes_pos_commands


float32[] descartes_vel_commands



float32[] current_joint_state

---


float32[] joint_pos_commands



float32[] joint_vel_commands

")



(provide :birl_module_robot/inverse_solution "fd70c212af5c1d03d9d1a73214023d9c")


