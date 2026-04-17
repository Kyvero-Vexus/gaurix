;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ak
;;; Resolves 10 NEEDS_RECIPE_DESIGN packages (final sweep — pool depleted).
;;;
;;; New recipes (3):
;;;    1. python-nvidia-ml-py (pyproject-build-system, v13.595.45, BSD-3)
;;;    2. python-gpustat (pyproject-build-system, v1.1.1, MIT)
;;;    3. iriunwebcam-bin (copy-build-system, v2.9.1, nonfree)
;;;
;;; BLOCKED (7):
;;;    4. godot-double-mono (DOTNET_UNSUPPORTED)
;;;    5. pacwall-git (ARCH_SPECIFIC)
;;;    6. asp (ARCH_SPECIFIC + DEPRECATED)
;;;    7. odoo18-nightly (MASSIVE_SCALE)
;;;    8. dude-bin (ARCH_SPECIFIC)
;;;    9. arch-shell (ARCH_SPECIFIC)
;;;   10. mt76-dkms-git (DKMS_UNSUPPORTED)
;;;
;;; NOTE: gdrcopy (#15131) re-evaluated — userspace lib could build
;;; but is non-functional without NVIDIA kernel module; marked EXHAUSTED.
;;;
;;; 3 new recipes + 7 BLOCKED = 10 total.
;;; Only 10 NEEDS_RECIPE_DESIGN items remained in queue.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417ak)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages linux)
  #:export (
            python-nvidia-ml-py
            python-gpustat
            iriunwebcam-bin
            ))

;;; ===================================================================
;;; 1. python-nvidia-ml-py — Python bindings for NVIDIA Management Library
;;; ===================================================================
(define-public python-nvidia-ml-py
  (package
    (name "python-nvidia-ml-py")
    (version "13.595.45")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "nvidia_ml_py" version))
              (sha256
               (base32
                "0yghmik0xg15lgh73kp6yjq202l31zwbldcgphszyh84zsbliwy9"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))   ;no test suite included
    (native-inputs
     (list python-setuptools))
    (synopsis "Python bindings for the NVIDIA Management Library (NVML)")
    (description "This package provides Python bindings for the NVIDIA
Management Library (NVML), which allows monitoring and managing NVIDIA
GPU devices.  It is a pure Python ctypes wrapper that requires NVIDIA
GPU drivers to be installed at runtime.")
    (home-page "https://pypi.org/project/nvidia-ml-py/")
    (license license:bsd-3)))

;;; ===================================================================
;;; 2. python-gpustat — GPU monitoring command-line utility
;;; ===================================================================
(define-public python-gpustat
  (package
    (name "python-gpustat")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "gpustat" version))
              (sha256
               (base32
                "1n7ribxbaqsdnqfizsfaanzb7sqaqzmlss9dqh067hcga7akx3f1"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))   ;tests require NVIDIA GPU hardware
    (native-inputs
     (list python-setuptools python-setuptools-scm))
    (propagated-inputs
     (list python-nvidia-ml-py
           python-psutil
           python-blessed))
    (synopsis "GPU monitoring utility showing usage and process info")
    (description "Gpustat is a command-line utility for querying and
monitoring NVIDIA GPU status.  It displays GPU utilization, memory
usage, temperature, fan speed, and running processes in a compact
format.  Requires NVIDIA GPU drivers installed at runtime.")
    (home-page "https://github.com/wookayin/gpustat")
    (license license:expat)))

;;; ===================================================================
;;; 3. iriunwebcam-bin — phone as wireless webcam (binary repack)
;;; ===================================================================
(define-public iriunwebcam-bin
  (package
    (name "iriunwebcam-bin")
    (version "2.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://iriun.gitlab.io/iriunwebcam-"
                    version ".deb"))
              (sha256
               (base32
                "110b2rzwbhlm6dh8hwww4rk7zn8dk5s73vxm8wdarxskxg4m6nmj"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:validate-runpath? #f
      #:install-plan
      #~'(("usr/local/bin/iriunwebcam" "bin/iriunwebcam"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.zst")))
          (delete 'install-license-files))))
    (native-inputs
     (list binutils tar zstd))
    (inputs
     (list alsa-lib
           avahi
           libdrm
           qtbase-5))
    (synopsis "Use your phone's camera as a wireless webcam")
    (description "Iriun Webcam lets you use your phone's camera as a
wireless webcam on your PC.  It supports high-quality video streaming
over WiFi or USB.  Requires the v4l2loopback kernel module to be loaded
at runtime for virtual camera device creation.")
    (home-page "https://iriun.com/")
    ;; Proprietary freeware.
    (license #f)))
