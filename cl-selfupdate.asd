;;; cl-selfupdate.asd
;;;
;;; SPDX-License-Identifier: MIT
;;;
;;; Copyright (C) 2026 Anthony Green <green@moxielogic.com>

;;; Load pure-tls compatibility layer before any cl+ssl-dependent systems
(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:load-system :pure-tls/cl+ssl-compat)
  (asdf:register-immutable-system "cl+ssl"))

(asdf:defsystem #:cl-selfupdate
  :description "Self-update functionality for Common Lisp executables via GitHub/GitLab/Gitea Releases"
  :author      "Anthony Green <green@moxielogic.com>"
  :license     "MIT"
  :version     "0.1.0"
  :depends-on  ("dexador"
                "jsown"
                "cl-semver"
                "chipz"
                "archive"
                "zip"
                "flexi-streams"
                "alexandria"
                "cl-ppcre"
                "ironclad"
                "quri")
  :serial t
  :components ((:file "src/package")
               (:file "src/platform")
               (:file "src/structures")
               (:file "src/provider")
               (:file "src/github")
               (:file "src/gitlab")
               (:file "src/archives")
               (:file "src/validate")
               (:file "src/selfupdate")))
