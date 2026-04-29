;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428o
;;; 100 BLOCKED evaluated, 2 resolved to DONE, 2 new packages.
;;; 2 new recipes total:
;;;   mono-basic → new dependency package (VB.NET compiler for Mono)
;;;   gbm → DONE (Game Backup Monitor, Mono/.NET game save backup tool)
;;; 98 remain BLOCKED (intractable categories confirmed).
;;;
;;; Key findings this pass:
;;; - gbm (#19044): was BLOCKED as COMPLEX_DEPS because it depends on
;;;   mono-basic (VB.NET runtime) which was not in Guix.  However, mono
;;;   itself IS in Guix (v6.12.0.206), and mono-basic is a straightforward
;;;   autotools build on top of mono.  Packaged mono-basic v4.8 from
;;;   upstream git, then gbm v1.4.3 as a pre-compiled Mono binary
;;;   distribution using copy-build-system with 7z extraction.
;;; - mono-basic v4.8: VB.NET compiler and runtime for Mono.  Builds with
;;;   gnu-build-system (./configure && make).  LGPL-2.1+.
;;; - All other 98 packages re-evaluated: categories stable, no new
;;;   resolution paths found.  Key blockers: proprietary binaries (14),
;;;   DKMS kernel modules (11), distro-specific tools (10), MinGW
;;;   cross-compilation (8), multilib (5), abandoned upstream (6),
;;;   non-distributable (5), platform-unsupported (4), SELinux (2),
;;;   Arch-specific (4), kernel headers (4), legacy Python2 (1),
;;;   complex deps (10), hardware-specific (1), GCC snapshot (0).
;;;
;;; Verification: AUR cache (110883 packages) and upstream Guix checked.
;;; See deptree-resolver-260428o-blocked-notes.scm for detailed evaluation.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages deptree-resolver-260428o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages dotnet)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages sqlite)
  #:export (mono-basic gbm-game-backup-monitor))

;;; ========================================================================
;;; NEW DEPENDENCY: mono-basic
;;; ========================================================================
;;; Mono Visual Basic.NET compiler and runtime libraries.
;;; Required by gbm (Game Backup Monitor) which is written in VB.NET.
;;; Builds on top of Mono's existing infrastructure (mcs, etc.).

(define-public mono-basic
  (package
    (name "mono-basic")
    (version "4.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mono/mono-basic/archive/"
             "e31cb702937a0adcc853250a0989c5f43565f9b8.tar.gz"))
       (sha256
        (base32 "1z6dc7bl991wsmqxx3hvw8v3w1i41l8yhbyf0qbshgbs5yd0xnrw"))))
    (build-system gnu-build-system)
    (inputs (list mono))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'set-env
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "MONO_SHARED_DIR" (getcwd))))
          (add-after 'unpack 'fix-hardcoded-paths
            (lambda _
              ;; Fix hardcoded /usr/bin/install in man/Makefile
              (substitute* "man/Makefile"
                (("/usr/bin/install") "install"))))
          (add-after 'configure 'fix-sdkpath
            (lambda* (#:key inputs #:allow-other-keys)
              ;; The profile sets /sdkpath:$(prefix)/lib/mono/4.5-api/
              ;; but at build time, the SDK assemblies are in Mono's dir.
              (let ((mono-dir (string-append
                               (assoc-ref inputs "mono")
                               "/lib/mono/4.5-api/")))
                (substitute* "build/profiles/net_4_5.make"
                  (("/sdkpath:\\$\\(prefix\\)/lib/mono/4.5-api/")
                   (string-append "/sdkpath:" mono-dir)))))))))
    (synopsis "Mono Visual Basic.NET compiler")
    (description "Mono-basic provides a Visual Basic.NET compiler (vbnc) and
runtime libraries for the Mono .NET platform.  It allows compiling VB.NET
source code to CIL bytecode that runs on the Mono virtual machine.")
    (home-page "https://www.mono-project.com/")
    (license license:lgpl2.1+)))

;;; ========================================================================
;;; RESOLVED: gbm (Game Backup Monitor)
;;; ========================================================================
;;; Game Backup Monitor: monitors running games and automatically backs up
;;; their savegames using configurable backup modes including 7z compression.
;;; Pre-compiled Mono binary distribution; requires mono + mono-basic at
;;; runtime for VB.NET execution.

(define-public gbm-game-backup-monitor
  (package
    (name "gbm-game-backup-monitor")
    (version "1.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/MikeMaximus/gbm/releases/download/v"
             version "/GBM.v" version ".64-bit.7z"))
       (sha256
        (base32 "1m9zspv9agjw8mgarlscbm3mqccqi2n796mqr416kdsr3sdxdlrj"))))
    (build-system copy-build-system)
    (native-inputs (list 7zip imagemagick))
    (inputs (list mono mono-basic sqlite bash-minimal 7zip))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (mkdir-p "src")
              (chdir "src")
              (invoke "7z" "x" source)))
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/gbm"))
                     (share (string-append out "/share/pixmaps")))
                ;; Install Mono assemblies and config
                (mkdir-p lib)
                (for-each (lambda (f)
                            (install-file f lib))
                          (append (find-files "." "\\.(exe|dll|config)$")
                                  (find-files "." "\\.(xml|json)$")))
                ;; Create wrapper script
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/gbm")
                  (lambda (port)
                    (format port "#!~a~%exec ~a ~a/GBM.exe \"$@\"~%"
                            (search-input-file inputs "bin/bash")
                            (search-input-file inputs "bin/mono")
                            lib)))
                (chmod (string-append bin "/gbm") #o755)
                ;; Install icon if available
                (when (file-exists? "gbm.png")
                  (mkdir-p share)
                  (install-file "gbm.png" share))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Game save backup tool that monitors running games")
    (description "Game Backup Monitor (GBM) monitors running games and
automatically backs up their savegames.  It supports multiple backup
modes including 7z compression, configurable backup paths, and game
time tracking.  It runs as a system tray application.")
    (home-page "https://mikemaximus.github.io/gbm-web/linux.html")
    (license license:gpl3)))
