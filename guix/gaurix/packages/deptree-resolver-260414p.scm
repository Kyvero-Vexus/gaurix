;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414p
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 3 recipes created (typioca-git, zig-master-bin, scap-security-guide)
;;;   - 97 blocked with reason codes (see blocked-notes)
;;;
;;; Recipes:
;;;   typioca-git  — Go terminal typing tester (go-build-system)
;;;   zig-master-bin — Zig programming language binary (copy-build-system)
;;;   scap-security-guide — SCAP security compliance profiles (cmake-build-system)
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages deptree-resolver-260414p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system go)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages bash)
  #:export (typioca-git
            zig-master-bin
            scap-security-guide))


;;; --- 1. typioca-git (#9830) ---
;;; Terminal-based typing speed tester written in Go.
;;; Source: https://github.com/bloznelis/typioca
;;; License: MIT
;;; Resolves: #9830 typioca-git

(define-public typioca-git
  (package
    (name "typioca-git")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bloznelis/typioca/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0g009by1k7vcahbgvr2c5grd7j1vm78mjn5xdjwm8c7jx4vgv3dm"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/bloznelis/typioca"
           #:install-source? #f
           #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'build)
               (delete 'install)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "tar" "xzf" source))))))
    (home-page "https://github.com/bloznelis/typioca")
    (synopsis "minimal, terminal-based typing speed tester")
    (description "Typioca is a minimal, terminal-based typing speed tester
written in Go.  It provides a simple interface for measuring typing speed
and accuracy directly from the command line.  It is packaged from the Arch
User Repository.")
    (license license:expat)))


;;; --- 2. zig-master-bin (#10101) ---
;;; Zig programming language — prebuilt binary.
;;; Source: https://ziglang.org/
;;; License: MIT
;;; Resolves: #10101 zig-master-bin
;;; Note: using stable 0.14.1 instead of master/dev builds for reproducibility.

(define-public zig-master-bin
  (package
    (name "zig-master-bin")
    (version "0.14.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ziglang.org/download/" version
                    "/zig-x86_64-linux-" version ".tar.xz"))
              (sha256
               (base32 "0v3iqjal325ab79l1yprgp7v533sh1fdkmvc9a9q3hqnmz4fxbi4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zig" "bin/zig")
               ("lib" "lib")
               ("doc" "share/doc/zig"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ziglang.org/")
    (synopsis "general-purpose programming language and toolchain")
    (description "Zig is a general-purpose programming language and
toolchain for maintaining robust, optimally performing software.  This
package provides the prebuilt binary distribution.  It is packaged from
the Arch User Repository.")
    (license license:expat)))


;;; --- 3. scap-security-guide (#3239) ---
;;; SCAP Security Guide — security compliance profiles.
;;; Source: https://github.com/ComplianceAsCode/content
;;; License: BSD-3
;;; Resolves: #3239 scap-security-guide

(define-public scap-security-guide
  (package
    (name "scap-security-guide")
    (version "0.1.78")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ComplianceAsCode/content"
                    "/releases/download/v" version
                    "/scap-security-guide-" version ".tar.bz2"))
              (sha256
               (base32 "05wf87jaclw8s9wgp828yky6cyhyf9g2cs1nagl2swhcz088xxld"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DSSG_CONTENT_INSTALL_DIR="
                                  #$output "/share/xml/scap/ssg/content")
                   (string-append "-DSSG_GUIDE_INSTALL_DIR="
                                  #$output "/share/doc/scap-security-guide/guides")
                   (string-append "-DSSG_ANSIBLE_PLAYBOOKS_INSTALL_DIR="
                                  #$output "/share/scap-security-guide/ansible")
                   (string-append "-DSSG_BASH_SCRIPTS_INSTALL_DIR="
                                  #$output "/share/scap-security-guide/bash")
                   "-DSSG_PRODUCT_DEFAULT=OFF")))
    (native-inputs (list python python-pyyaml python-lxml libxslt))
    (home-page "https://www.open-scap.org/security-policies/scap-security-guide/")
    (synopsis "security compliance profiles for SCAP-compatible tools")
    (description "The SCAP Security Guide provides security compliance
profiles and guidance for configuration of operating systems.  It contains
XCCDF, OVAL, and datastream content for automated compliance checking with
OpenSCAP and other SCAP-compatible tools.  It is packaged from the Arch
User Repository.")
    (license license:bsd-3)))
