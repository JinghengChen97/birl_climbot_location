
(cl:in-package :asdf)

(defsystem "ui-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "robot_command" :depends-on ("_package_robot_command"))
    (:file "_package_robot_command" :depends-on ("_package"))
    (:file "robot_feedback" :depends-on ("_package_robot_feedback"))
    (:file "_package_robot_feedback" :depends-on ("_package"))
  ))