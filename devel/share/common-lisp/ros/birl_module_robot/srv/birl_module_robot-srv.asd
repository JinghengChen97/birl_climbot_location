
(cl:in-package :asdf)

(defsystem "birl_module_robot-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "inverse_solution" :depends-on ("_package_inverse_solution"))
    (:file "_package_inverse_solution" :depends-on ("_package"))
    (:file "positive_solution" :depends-on ("_package_positive_solution"))
    (:file "_package_positive_solution" :depends-on ("_package"))
  ))