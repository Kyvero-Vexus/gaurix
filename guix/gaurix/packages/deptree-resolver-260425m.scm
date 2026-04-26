;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425m
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (1): wayfire-git
;;; Remaining BLOCKED: 99 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)          ; libseat
  #:use-module (gnu packages bash)           ; bash-minimal
  #:use-module (gnu packages c)              ; yyjson
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages freedesktop)    ; wayland, wayland-protocols, libinput
  #:use-module (gnu packages gl)             ; mesa
  #:use-module (gnu packages glib)           ; glib
  #:use-module (gnu packages gtk)            ; cairo, pango
  #:use-module (gnu packages image)          ; libjpeg-turbo, libpng
  #:use-module (gnu packages linux)          ; eudev
  #:use-module (gnu packages maths)          ; glm
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)         ; polkit
  #:use-module (gnu packages vulkan)         ; vulkan-headers
  #:use-module (gnu packages wm)             ; wlroots, wf-config, libdisplay-info
  #:use-module (gnu packages xdisorg)        ; libdrm, pixman, libxkbcommon
  #:use-module (gnu packages xorg)           ; libxcb, xcb-util-*, xorg-server-xwayland, libevdev
  #:export (wayfire-git))


;;; ---- 1. wayfire-git ----
;;; AUR: wayfire-git (#18359)
;;; 3D Wayland compositor based on wlroots.
;;; AUR lists wlroots0.20 as dep, but stable v0.10.1 works with
;;; wlroots >= 0.19.0 (Guix has 0.19.2).  All deps in Guix:
;;; wf-config, yyjson, libdisplay-info, etc.
;;; wf-touch and wf-utils are built from bundled submodules (fetched
;;; as separate sources and placed in subprojects/ at build time).
;;; License: MIT

(define %wf-touch-commit "093d8943df03cc8a2667990a065513c1bf2b57e0")
(define %wf-utils-commit "3ef27d1f76b5f3d1f34305bff12b3174e81727c2")

(define wf-touch-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/WayfireWM/wf-touch/archive/"
          %wf-touch-commit ".tar.gz"))
    (sha256
     (base32 "159gbpyvj27b6ckcspph268gwbx8fnwar7fdw20lms15nsavp5yl"))))

(define wf-utils-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/WayfireWM/wf-utils/archive/"
          %wf-utils-commit ".tar.gz"))
    (sha256
     (base32 "07my7plfrfqris3isq0r0bmc1a7rgf3fw9mddk69hmybiw8xiy64"))))

(define-public wayfire-git
  (package
    (name "wayfire-git")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/WayfireWM/wayfire/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "051m1s5fddq3ccd0vrqln8mag9g7rn0k88db7wl6256jspx2kks0"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-Duse_system_wlroots=enabled"
              "-Duse_system_wfconfig=enabled"
              "-Dxwayland=auto"
              "-Dprint_trace=false"
              "-Dtests=disabled")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'install-subprojects
            (lambda _
              ;; Place wf-touch and wf-utils in subprojects/ so meson finds them.
              (let ((touch-src #$(file-append wf-touch-source))
                    (utils-src #$(file-append wf-utils-source)))
                ;; Extract wf-touch
                (invoke "tar" "xzf" touch-src "-C" "subprojects")
                (rename-file
                 (string-append "subprojects/wf-touch-" #$%wf-touch-commit)
                 "subprojects/wf-touch")
                ;; Extract wf-utils
                (invoke "tar" "xzf" utils-src "-C" "subprojects")
                (rename-file
                 (string-append "subprojects/wf-utils-" #$%wf-utils-commit)
                 "subprojects/wf-utils"))))
          (add-after 'install-subprojects 'patch-bin-sh
            (lambda* (#:key inputs #:allow-other-keys)
              ;; Replace /bin/sh with the store path for bash.
              (let ((bash (search-input-file inputs "bin/sh")))
                (substitute* "meson.build"
                  (("/bin/sh") bash))
                (substitute* "src/core/core.cpp"
                  (("/bin/sh") bash)))))
          (add-after 'configure 'remove-src-dir-from-config
            (lambda _
              (when (file-exists? "build/config.h")
                (substitute* "build/config.h"
                  ((".*WF_SRC_DIR.*") ""))))))))
    (native-inputs
     (list cmake-minimal pkg-config wayland bash-minimal))
    (inputs
     (list cairo
           eudev
           glib
           glm
           libdrm
           libdisplay-info
           libevdev
           libinput
           libjpeg-turbo
           libpng
           libseat
           libxcb
           libxkbcommon
           mesa
           pango
           pixman
           polkit
           vulkan-headers
           wayland-protocols
           wf-config
           wlroots
           xcb-util-errors
           xcb-util-renderutil
           xcb-util-wm
           xorg-server-xwayland
           yyjson))
    (home-page "https://github.com/WayfireWM/wayfire")
    (synopsis "3D Wayland compositor based on wlroots")
    (description "Wayfire is a 3D Wayland compositor based on wlroots.  It
aims to create a customizable, extendable and lightweight desktop environment
using the latest Wayland protocols.  It includes support for Xwayland, window
management plugins, animations, and a flexible configuration system via
wf-config.")
    (license license:expat)))
