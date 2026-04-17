;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417n
;;; Evaluates all 14 remaining NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (3 — unique to this pass, not covered by deptree-resolver-260417n):
;;;   1. lenovolegionlinux-dkms-git (gnu/make, v0.0.20, GPL-2.0)
;;;      — kernel module source for out-of-tree compilation
;;;   2. leetmouse-driver-dkms (gnu/make kernel module, git-20260331, GPL-2.0)
;;;      — USB mouse acceleration kernel module source
;;;   3. omada-controller-bin (copy/binary, v5.14.32.3, proprietary)
;;;      — TP-Link SDN controller Java binary
;;;
;;; Already resolved by deptree-resolver-260417n (5 packages):
;;;   - swaysettings (#14632): meson/vala recipe
;;;   - libjxl-doc (#14607): cmake doc-only recipe
;;;   - capnproto-java (#14567): gnu-build-system recipe
;;;   - xpipe-ptb (#14608): copy-build-system binary recipe
;;;   - vs1clickmodinstaller (#14602): copy-build-system recipe
;;;
;;; Blocked EXHAUSTED (6):
;;;   9. transistor-git — ANDROID_APP: Android/Kotlin app, not a Linux
;;;      desktop application; repository archived Feb 2025
;;;  10. godot-double-mono — DOTNET_UNSUPPORTED: requires Mono/.NET SDK
;;;      for C# scripting; Mono not bootstrapped in Guix
;;;  11. asp — ARCH_SPECIFIC: Arch Linux build source tool; depends on
;;;      pacman/devtools; deprecated in favor of pkgctl
;;;  12. pacwall-git — ARCH_SPECIFIC: dependency graph wallpaper; supports
;;;      only pacman as package manager backend; not useful on Guix
;;;  13. gridmonger-git — NIM_UNSUPPORTED: requires Nim compiler v2.0+
;;;      not available in Guix; no Linux binary releases
;;;      (deptree-resolver-260417n also provides a recipe attempt)
;;;  14. ccdciel — FPC_UNSUPPORTED: requires Free Pascal compiler + Lazarus
;;;      IDE not available in Guix; no prebuilt Linux binaries
;;;      (deptree-resolver-260417n also provides a recipe attempt)
;;;
;;; 3 new recipes + 5 already resolved + 6 BLOCKED = 14 total.
;;; POOL DEPLETED: All NEEDS_RECIPE_DESIGN items processed.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260417n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages java)
  #:export (
            lenovolegionlinux-dkms-git
            leetmouse-driver-dkms
            omada-controller-bin
            ))

;;; -------------------------------------------------------------------
;;; 1. lenovolegionlinux-dkms-git — Lenovo Legion Linux kernel module
;;; -------------------------------------------------------------------
(define-public lenovolegionlinux-dkms-git
  (package
    (name "lenovolegionlinux-dkms-git")
    (version "0.0.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/johnfanv2/LenovoLegionLinux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-after 'unpack 'chdir-to-module
                 (lambda _
                   (chdir "kernel_module")))
               (replace 'build
                 (lambda _
                   ;; Kernel module source — installed for out-of-tree
                   ;; compilation against the running kernel.
                   #t))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (src-dir (string-append out "/src/lenovolegionlinux-"
                                                  #$version))
                          (doc-dir (string-append out "/share/doc/"
                                                  #$name)))
                     ;; Install kernel module source
                     (mkdir-p src-dir)
                     (for-each (lambda (f)
                                 (install-file f src-dir))
                               (find-files "." "\\.(c|h|Makefile)$"))
                     (when (file-exists? "dkms.conf")
                       (install-file "dkms.conf" src-dir))
                     ;; Install documentation
                     (mkdir-p doc-dir)
                     (chdir "..")
                     (when (file-exists? "README.md")
                       (install-file "README.md" doc-dir))))))))
    (synopsis "kernel module for Lenovo Legion laptop features")
    (description "LenovoLegionLinux provides a Linux kernel module for
controlling fan speed, power modes, and other hardware features of Lenovo
Legion gaming laptops.  This package installs the kernel module source
files for out-of-tree compilation against your running kernel.")
    (home-page "https://github.com/johnfanv2/LenovoLegionLinux")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2. leetmouse-driver-dkms — USB mouse driver with acceleration
;;; -------------------------------------------------------------------
(define-public leetmouse-driver-dkms
  (let ((commit "eb36c3a")
        (revision "0"))
    (package
      (name "leetmouse-driver-dkms")
      (version (git-version "0.9.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/systemofapwne/leetmouse")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure)
                 (replace 'build
                   (lambda _
                     ;; Kernel module source — installed for out-of-tree
                     ;; compilation against the running kernel.
                     #t))
                 (replace 'install
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let* ((out (assoc-ref outputs "out"))
                            (src-dir (string-append out "/src/leetmouse-"
                                                    #$version)))
                       (mkdir-p src-dir)
                       (for-each (lambda (f)
                                   (install-file f src-dir))
                                 (find-files "driver" "\\.(c|h|Makefile)$"))
                       (when (file-exists? "dkms.conf")
                         (install-file "dkms.conf" src-dir))))))))
      (synopsis "USB HID mouse driver with custom acceleration curves")
      (description "Leetmouse is a Linux kernel module that replaces the
default USB HID mouse driver with one that supports custom acceleration
curves.  This is useful for gamers who want precise mouse acceleration
control similar to custom Windows mouse drivers.  This package installs the
kernel module source files for out-of-tree compilation.")
      (home-page "https://github.com/systemofapwne/leetmouse")
      (license license:gpl2))))

;;; -------------------------------------------------------------------
;;; 3. omada-controller-bin — TP-Link Omada SDN controller (binary)
;;; -------------------------------------------------------------------
(define-public omada-controller-bin
  (package
    (name "omada-controller-bin")
    (version "5.14.32.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://static.tp-link.com/upload/software/"
                    "2024/202412/20241209/"
                    "Omada_SDN_Controller_v" version "_linux_x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/omada-controller/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (java (search-input-file inputs "bin/java"))
                          (omada (string-append out
                                  "/share/omada-controller")))
                     (mkdir-p bin)
                     (let ((wrapper (string-append bin "/omada-controller")))
                       (call-with-output-file wrapper
                         (lambda (port)
                           (format port "#!~a~%export JAVA_HOME=~a~%cd ~a~%exec ~a -jar lib/omada.jar \"$@\"~%"
                                   (which "bash")
                                   (dirname (dirname java))
                                   omada java)))
                       (chmod wrapper #o755))))))))
    (inputs
     (list openjdk))
    (supported-systems '("x86_64-linux"))
    (synopsis "TP-Link Omada software-defined networking controller")
    (description "Omada SDN Controller is TP-Link's centralized management
platform for Omada access points, switches, and gateways.  This package
provides the Java-based web controller application as a prebuilt binary.
Note: this is proprietary software; a running MongoDB instance is required.")
    (home-page "https://www.tp-link.com/us/omada-sdn/")
    ;; Proprietary TP-Link license
    (license ((@@ (guix licenses) license) "TP-Link"
              "https://www.tp-link.com/us/about-us/privacy/"
              "TP-Link proprietary software license"))))
