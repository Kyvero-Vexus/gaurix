;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426d
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (1):
;;;   1. swscreenshot-gui (GTK3/Python screenshot GUI for Sway/Wayland)
;;;
;;; Remaining BLOCKED: 99 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260426d)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:export (swscreenshot-gui))


;;; ---- 1. swscreenshot-gui ----
;;; GTK3/Python screenshot GUI for Sway/Wayland compositors.
;;; Upstream: https://gitlab.com/ricardoca/swscreenshot-gui
;;; Single Python script with PyGObject/GTK3 GUI; no build system.
;;; Uses grim for capture, slurp for region selection, wl-clipboard
;;; for clipboard, swaybg for overlay, notify-send for notifications.
;;; Resolves AUR swscreenshot-gui.
;;; License: GPL-3.0+

(define-public swscreenshot-gui
  (package
    (name "swscreenshot-gui")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/ricardoca/swscreenshot-gui")
             (commit "2a333a056fefc675fc44f0829e2870563122aa76")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xlf0kl118330rccp3078sx5d0w5vzfn510jwbgsdlcmf2qj6cwy"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("swscreenshot-gui.py"
           "share/swscreenshot-gui/swscreenshot-gui.py"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-executable
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (script (string-append
                              out "/share/swscreenshot-gui/swscreenshot-gui.py"))
                     (bash (search-input-file inputs "bin/bash"))
                     (python (search-input-file inputs "bin/python3")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/swscreenshot-gui")
                  (lambda (port)
                    (format port "#!~a~%exec ~a ~a \"$@\"~%"
                            bash python script)))
                (chmod (string-append bin "/swscreenshot-gui") #o755))))
          (add-after 'create-executable 'wrap-executable
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (wrap-program (string-append out "/bin/swscreenshot-gui")
                  `("GI_TYPELIB_PATH" prefix
                    (,(string-append (assoc-ref inputs "gtk+")
                                    "/lib/girepository-1.0")
                     ,(string-append (assoc-ref inputs "gdk-pixbuf")
                                    "/lib/girepository-1.0")
                     ,(string-append (assoc-ref inputs "pango")
                                    "/lib/girepository-1.0")
                     ,(string-append (assoc-ref inputs "at-spi2-core")
                                    "/lib/girepository-1.0")
                     ,(string-append (assoc-ref inputs "harfbuzz")
                                    "/lib/girepository-1.0")))
                  `("GUIX_PYTHONPATH" prefix
                    (,(string-append (assoc-ref inputs "python-pygobject")
                                    "/lib/python3.11/site-packages")))
                  `("PATH" prefix
                    (,(string-append (assoc-ref inputs "grim") "/bin")
                     ,(string-append (assoc-ref inputs "slurp") "/bin")
                     ,(string-append (assoc-ref inputs "wl-clipboard") "/bin")
                     ,(string-append (assoc-ref inputs "swaybg") "/bin")
                     ,(string-append (assoc-ref inputs "libnotify") "/bin")
                     ,(string-append (assoc-ref inputs "coreutils")
                                    "/bin")))))))
          (add-after 'wrap-executable 'install-desktop-file
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (apps (string-append out "/share/applications")))
                (mkdir-p apps)
                (call-with-output-file
                    (string-append apps "/swscreenshot-gui.desktop")
                  (lambda (port)
                    (format port "[Desktop Entry]
Name=SwScreenshot GUI
Comment=Screenshot GUI for Sway/Wayland
Exec=~a/bin/swscreenshot-gui
Icon=applets-screenshooter
Type=Application
Categories=Utility;Graphics;
Keywords=screenshot;sway;wayland;~%"
                            out)))))))))
    (inputs
     (list at-spi2-core
           bash-minimal
           coreutils
           gdk-pixbuf
           grim
           gtk+
           harfbuzz
           libnotify
           pango
           python
           python-pygobject
           slurp
           swaybg
           wl-clipboard))
    (home-page "https://gitlab.com/ricardoca/swscreenshot-gui")
    (synopsis "Screenshot GUI for Sway and Wayland compositors")
    (description "SwScreenshot GUI is a graphical screenshot tool for Sway
and other Wayland compositors.  It provides a GTK3 interface for capturing
full-screen, active-window, or region screenshots using @command{grim} and
@command{slurp}, with clipboard integration via @command{wl-copy} and
desktop notifications via @command{notify-send}.")
    (license license:gpl3+)))
