
(cl:in-package :asdf)

(defsystem "uwb_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "UWB" :depends-on ("_package_UWB"))
    (:file "_package_UWB" :depends-on ("_package"))
  ))