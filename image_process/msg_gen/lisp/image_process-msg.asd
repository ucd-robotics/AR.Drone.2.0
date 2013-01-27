
(cl:in-package :asdf)

(defsystem "image_process-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Positions" :depends-on ("_package_Positions"))
    (:file "_package_Positions" :depends-on ("_package"))
  ))