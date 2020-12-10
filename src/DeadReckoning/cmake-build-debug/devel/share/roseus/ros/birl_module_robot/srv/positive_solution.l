;; Auto-generated. Do not edit!


(when (boundp 'birl_module_robot::positive_solution)
  (if (not (find-package "BIRL_MODULE_ROBOT"))
    (make-package "BIRL_MODULE_ROBOT"))
  (shadow 'positive_solution (find-package "BIRL_MODULE_ROBOT")))
(unless (find-package "BIRL_MODULE_ROBOT::POSITIVE_SOLUTION")
  (make-package "BIRL_MODULE_ROBOT::POSITIVE_SOLUTION"))
(unless (find-package "BIRL_MODULE_ROBOT::POSITIVE_SOLUTIONREQUEST")
  (make-package "BIRL_MODULE_ROBOT::POSITIVE_SOLUTIONREQUEST"))
(unless (find-package "BIRL_MODULE_ROBOT::POSITIVE_SOLUTIONRESPONSE")
  (make-package "BIRL_MODULE_ROBOT::POSITIVE_SOLUTIONRESPONSE"))

(in-package "ROS")





(defclass birl_module_robot::positive_solutionRequest
  :super ros::object
  :slots (_which_robot _base _current_joint_state ))

(defmethod birl_module_robot::positive_solutionRequest
  (:init
   (&key
    ((:which_robot __which_robot) 0)
    ((:base __base) nil)
    ((:current_joint_state __current_joint_state) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _which_robot (round __which_robot))
   (setq _base __base)
   (setq _current_joint_state __current_joint_state)
   self)
  (:which_robot
   (&optional __which_robot)
   (if __which_robot (setq _which_robot __which_robot)) _which_robot)
  (:base
   (&optional __base)
   (if __base (setq _base __base)) _base)
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

(defclass birl_module_robot::positive_solutionResponse
  :super ros::object
  :slots (_descartes_pos_state ))

(defmethod birl_module_robot::positive_solutionResponse
  (:init
   (&key
    ((:descartes_pos_state __descartes_pos_state) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _descartes_pos_state __descartes_pos_state)
   self)
  (:descartes_pos_state
   (&optional __descartes_pos_state)
   (if __descartes_pos_state (setq _descartes_pos_state __descartes_pos_state)) _descartes_pos_state)
  (:serialization-length
   ()
   (+
    ;; float32[] _descartes_pos_state
    (* 4    (length _descartes_pos_state)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _descartes_pos_state
     (write-long (length _descartes_pos_state) s)
     (dotimes (i (length _descartes_pos_state))
       (sys::poke (elt _descartes_pos_state i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _descartes_pos_state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _descartes_pos_state (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _descartes_pos_state i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass birl_module_robot::positive_solution
  :super ros::object
  :slots ())

(setf (get birl_module_robot::positive_solution :md5sum-) "c5997f26c5a0a6d545568596a384fa2e")
(setf (get birl_module_robot::positive_solution :datatype-) "birl_module_robot/positive_solution")
(setf (get birl_module_robot::positive_solution :request) birl_module_robot::positive_solutionRequest)
(setf (get birl_module_robot::positive_solution :response) birl_module_robot::positive_solutionResponse)

(defmethod birl_module_robot::positive_solutionRequest
  (:response () (instance birl_module_robot::positive_solutionResponse :init)))

(setf (get birl_module_robot::positive_solutionRequest :md5sum-) "c5997f26c5a0a6d545568596a384fa2e")
(setf (get birl_module_robot::positive_solutionRequest :datatype-) "birl_module_robot/positive_solutionRequest")
(setf (get birl_module_robot::positive_solutionRequest :definition-)
      "
int16 which_robot


bool base



float32[] current_joint_state

---

float32[] descartes_pos_state

")

(setf (get birl_module_robot::positive_solutionResponse :md5sum-) "c5997f26c5a0a6d545568596a384fa2e")
(setf (get birl_module_robot::positive_solutionResponse :datatype-) "birl_module_robot/positive_solutionResponse")
(setf (get birl_module_robot::positive_solutionResponse :definition-)
      "
int16 which_robot


bool base



float32[] current_joint_state

---

float32[] descartes_pos_state

")



(provide :birl_module_robot/positive_solution "c5997f26c5a0a6d545568596a384fa2e")


