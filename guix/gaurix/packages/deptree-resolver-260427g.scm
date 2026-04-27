;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260427g
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 1 resolved (luniistore), 99 remain BLOCKED.
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:export (luniistore))

;;; ============================================================
;;; 1. luniistore (#18478)
;;; ============================================================
;;;
;;; Luniistore is the desktop application for managing content on
;;; Lunii "My Fabulous Storyteller" devices.  It is a Java-based
;;; proprietary binary distributed as a .deb package.
;;;
;;; Prior passes (260425b, 260425e, 260425h, 260425k, 260426g, 260426i)
;;; reported SOURCE_UNAVAILABLE / download 403, but the Google Cloud
;;; Storage URL is now publicly accessible without authentication.
;;;
;;; Approach: extract .deb (ar + tar), install to /opt/Lunii, create
;;; wrapper script that sets up the Java environment.
;;;
;;; The .deb contains a bundled JRE under opt/Lunii/runtime/.

(define-public luniistore
  (package
    (name "luniistore")
    (version "4.1.312")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://storage.googleapis.com/storage.lunii.fr/"
                    "public/deploy/installers/linux/64bits/"
                    "lunii-" version "-amd64.deb"))
              (sha256
               (base32
                "0f5ja75vmlcq7qdnn5f3dgc7cf459kalhmrpsisp3qnpjzm3nq95"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'()
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (use-modules (guix build utils))
              (let* ((out (assoc-ref outputs "out"))
                     (opt (string-append out "/opt/Lunii"))
                     (bin (string-append out "/bin"))
                     (apps (string-append out "/share/applications"))
                     (rules (string-append out "/lib/udev/rules.d")))
                ;; Extract the .deb (it's an ar archive containing data.tar.xz)
                (invoke "ar" "x" (assoc-ref %build-inputs "source"))
                (invoke "tar" "xf" "data.tar.xz")
                ;; Install application files
                (copy-recursively "opt/Lunii" opt)
                ;; Create wrapper script
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/luniistore")
                  (lambda (port)
                    (display "#!/bin/sh\n" port)
                    (display "# Luniistore wrapper\n" port)
                    (display (string-append "exec " opt "/Lunii \"$@\"\n") port)))
                (chmod (string-append bin "/luniistore") #o755)
                ;; Install desktop entry
                (mkdir-p apps)
                (when (file-exists? "usr/share/applications/Lunii.desktop")
                  (copy-file "usr/share/applications/Lunii.desktop"
                             (string-append apps "/luniistore.desktop")))
                ;; Install udev rules for Lunii device access
                (mkdir-p rules)
                (call-with-output-file
                    (string-append rules "/99-lunii.rules")
                  (lambda (port)
                    (display (string-append
                              "SUBSYSTEM==\"usb\", "
                              "ATTR{idVendor}==\"0483\", "
                              "ATTR{idProduct}==\"a341\", "
                              "MODE=\"0666\"\n")
                             port)
                    (display (string-append
                              "SUBSYSTEM==\"usb\", "
                              "ATTR{idVendor}==\"0483\", "
                              "ATTR{idProduct}==\"d320\", "
                              "MODE=\"0666\"\n")
                             port)))))))))
    (native-inputs
     (list tar xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (synopsis "Manage Lunii storyteller device content")
    (description "Luniistore is the desktop application for managing content on
Lunii ``My Fabulous Storyteller'' devices.  It allows users to browse, purchase,
and transfer audio stories to their Lunii device.

The application bundles its own Java runtime.  This package installs a wrapper
script @command{luniistore} and udev rules for device access.")
    (home-page "https://www.lunii.fr")
    (license (license:non-copyleft
              "https://www.lunii.fr/conditions-generales-de-vente/"
              "Proprietary; Lunii terms of service apply"))))
