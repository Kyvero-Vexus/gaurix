;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; NEEDS_RECIPE_DESIGN resolution — round 14, worker 03
;;; Worker: cron-5a2fb251-r14-w03

(define-module (gaurix packages cron-5a2fb251-r14-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (python-pysmart
            renamemytvseries-gtk-bin
            feedr-bin
            openhue-cli
            boscaceoil-blue-bin
            crier-bin
            reqable-bin
            cliamp-bin
            ferrishot-bin
            sysbox-ce))

;;;
;;; 1. python-pysmart — Python S.M.A.R.T. disk monitoring
;;;    Built from PyPI sdist using pyproject-build-system.
;;;
(define-public python-pysmart
  (package
    (name "python-pysmart")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/5c/88/"
             "883d67a628b6342562eb18dd832f4ee266f07a175058c5dd3170fb7950b2/"
             "pysmart-" version ".tar.gz"))
       (sha256
        (base32 "115wiafcp8l0dmxxzhr478qryqgjz056d8c6cf39b5fq5xp8v1wq"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/freenas/py-SMART")
    (synopsis "Python wrapper for smartctl (smartmontools)")
    (description
     "pySMART is a Python module that provides a programmatic interface to
smartctl, part of the smartmontools package.  It can be used to monitor
S.M.A.R.T. data on hard drives and SSDs, detecting disk health issues
and predicting failures.")
    (license license:lgpl2.1)))

;;;
;;; 2. renamemytvseries-gtk-bin — GTK app for renaming TV series files
;;;    Proprietary binary from tweaking4all.com.
;;;
(define-public renamemytvseries-gtk-bin
  (package
    (name "renamemytvseries-gtk-bin")
    (version "2.3.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.tweaking4all.com/downloads/"
             "RenameMyTVSeries-" version
             "-GTK-Linux-x64-static-ffmpeg.tar.xz"))
       (sha256
        (base32 "0s3pqxp7rnlaydmg3gg5rnpb2c54jcjr3v9l3r0ad0yqp1670avn"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib/renamemytvseries"))
                 (share (string-append out "/share"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname xz)))
            (invoke tar "xf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (mkdir-p lib)
            ;; Copy main binary and support files
            (copy-file "RenameMyTVSeries"
                       (string-append lib "/RenameMyTVSeries"))
            (chmod (string-append lib "/RenameMyTVSeries") #o755)
            ;; Patch the binary
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append lib "/RenameMyTVSeries"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append lib "/RenameMyTVSeries"))
            ;; Create wrapper script
            (call-with-output-file (string-append bin "/renamemytvseries-gtk")
              (lambda (port)
                (format port "#!~a~%exec ~a/RenameMyTVSeries \"$@\"~%"
                        (search-input-file %build-inputs "/bin/bash")
                        lib)))
            (chmod (string-append bin "/renamemytvseries-gtk") #o755)))))
    (native-inputs (list tar xz patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.tweaking4all.com/software/renamemytvseries2/")
    (synopsis "GTK application for renaming TV series files")
    (description
     "RenameMy TV Series is a desktop application that helps rename TV series
episode files into a clean, consistent format.  It supports automatic
episode detection using online databases and provides a graphical
interface for batch renaming operations.")
    (license (license:non-copyleft
              "https://www.tweaking4all.com/"
              "Tweaking4All proprietary freeware license"))))

;;;
;;; 3. feedr-bin — RSS feed reader CLI
;;;    Pre-built Rust binary from GitHub Releases.
;;;
(define-public feedr-bin
  (package
    (name "feedr-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bahdotsh/feedr/releases/download/v"
             version "/feedr-linux-x86_64"))
       (sha256
        (base32 "08065vqy6vcffac75y9l622biwq7gp484sfgwlva6lwxmj39r94h"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/feedr"))
            (chmod (string-append bin "/feedr") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/feedr"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/feedr"))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/feedr")
    (synopsis "Command-line RSS feed reader")
    (description
     "feedr is a terminal-based RSS feed reader written in Rust.  It provides
a simple command-line interface for subscribing to and reading RSS/Atom
feeds directly from the terminal.")
    (license license:expat)))

;;;
;;; 4. openhue-cli — Philips Hue CLI tool
;;;    Pre-built Go binary from GitHub Releases.
;;;
(define-public openhue-cli
  (package
    (name "openhue-cli")
    (version "0.23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/openhue/openhue-cli/releases/download/"
             version "/openhue_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "1xh2z3k0z6njg5zlx12jdcakm1qcs6wg049cxq74hijrbnn7hb3q"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname gzip)))
            (invoke tar "xf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "openhue" (string-append bin "/openhue"))
            (chmod (string-append bin "/openhue") #o755)))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openhue/openhue-cli")
    (synopsis "Command-line interface for Philips Hue smart lighting")
    (description
     "openhue-cli is a command-line tool for controlling Philips Hue smart
lights and accessories.  It communicates with the Hue Bridge using the
official Hue API v2, allowing users to manage lights, rooms, scenes, and
automations from the terminal.")
    (license license:asl2.0)))

;;;
;;; 5. boscaceoil-blue-bin — Beginner-friendly music composition tool
;;;    Pre-built Godot application from GitHub Releases.
;;;
(define-public boscaceoil-blue-bin
  (package
    (name "boscaceoil-blue-bin")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/YuriSizov/boscaceoil-blue/releases/download/"
             version "-stable/boscaceoil-blue-linux-x86_64.zip"))
       (sha256
        (base32 "0pb5vh6fyc3fkmvcblnyhb0zapsa4fg6p65s8pzznn8d3n7lwiy2"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib/boscaceoil-blue"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (bash (search-input-file %build-inputs "/bin/bash"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (invoke unzip (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (mkdir-p lib)
            ;; Install the Godot binary and shared library
            (let ((srcdir "boscaceoil-blue-linux-x86_64"))
              (copy-file (string-append srcdir "/boscaceoil-blue.x86_64")
                         (string-append lib "/boscaceoil-blue.x86_64"))
              (copy-file (string-append srcdir
                          "/libgdsion.linux.template_release.x86_64.so")
                         (string-append lib
                          "/libgdsion.linux.template_release.x86_64.so"))
              (chmod (string-append lib "/boscaceoil-blue.x86_64") #o755)
              (chmod (string-append lib
                      "/libgdsion.linux.template_release.x86_64.so") #o755))
            ;; Patch the main binary
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append lib "/boscaceoil-blue.x86_64"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib:"
                                   lib)
                    (string-append lib "/boscaceoil-blue.x86_64"))
            ;; Create wrapper script
            (call-with-output-file (string-append bin "/boscaceoil-blue")
              (lambda (port)
                (format port "#!~a~%exec ~a/boscaceoil-blue.x86_64 \"$@\"~%"
                        bash lib)))
            (chmod (string-append bin "/boscaceoil-blue") #o755)))))
    (native-inputs (list unzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/YuriSizov/boscaceoil-blue")
    (synopsis "Beginner-friendly music composition tool")
    (description
     "Bosca Ceoil Blue is a simple, beginner-friendly music making application
built with the Godot engine.  It provides an intuitive interface for
creating chiptune and retro-style music with various built-in instruments
and effects, without requiring any music theory knowledge.")
    (license license:expat)))

;;;
;;; 6. crier-bin — Notification tool
;;;    Pre-built binary from GitHub Releases.
;;;
(define-public crier-bin
  (package
    (name "crier-bin")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/skorotkiewicz/crier/releases/download/"
             version "/crier-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0b204py1nf70fw5zdbn4xdcfj659d5v27bsglrn704qjib62ghhl"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname gzip)))
            (invoke tar "xf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "crier" (string-append bin "/crier"))
            (chmod (string-append bin "/crier") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/crier"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/crier"))))))
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/skorotkiewicz/crier")
    (synopsis "Command-line notification tool")
    (description
     "Crier is a lightweight notification tool that sends desktop notifications
from the command line.  It can be used in scripts to notify users when
long-running tasks complete or when specific events occur.")
    (license license:expat)))

;;;
;;; 7. reqable-bin — HTTP debugging proxy
;;;    Proprietary binary from GitHub Releases (.deb extraction).
;;;
(define-public reqable-bin
  (package
    (name "reqable-bin")
    (version "3.0.39")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/reqable/reqable-app/releases/download/"
             version "/reqable-app-linux-x86_64.deb"))
       (sha256
        (base32 "0wcwzvqjd1qj8vvwkxh1rdaxhngk3xv3zjmj948n6j5md55hian4"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib/reqable"))
                 (ar  (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (bash (search-input-file %build-inputs "/bin/bash")))
            (setenv "PATH" (string-append
                            (dirname ar) ":"
                            (dirname tar) ":"
                            (dirname xz)))
            (invoke ar "x" (assoc-ref %build-inputs "source"))
            (invoke tar "xf" "data.tar.xz")
            (mkdir-p bin)
            (mkdir-p lib)
            ;; Copy application files
            (copy-recursively "usr/share/reqable" lib)
            (when (file-exists? (string-append lib "/reqable"))
              (chmod (string-append lib "/reqable") #o755))
            ;; Create wrapper script
            (call-with-output-file (string-append bin "/reqable")
              (lambda (port)
                (format port "#!~a~%exec ~a/reqable \"$@\"~%"
                        bash lib)))
            (chmod (string-append bin "/reqable") #o755)))))
    (native-inputs (list binutils tar xz))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://reqable.com")
    (synopsis "HTTP traffic debugging and API testing tool")
    (description
     "Reqable is a professional HTTP debugging proxy and API testing tool.  It
can capture, inspect, and modify HTTP/HTTPS traffic for debugging web
applications and APIs.  It supports request/response inspection, API
composition, and traffic replay.")
    (license (license:non-copyleft
              "https://reqable.com/policy/license/"
              "Reqable proprietary license"))))

;;;
;;; 8. cliamp-bin — CLI audio player
;;;    Pre-built Go binary from GitHub Releases.
;;;
(define-public cliamp-bin
  (package
    (name "cliamp-bin")
    (version "1.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bjarneo/cliamp/releases/download/v"
             version "/cliamp-linux-amd64"))
       (sha256
        (base32 "1qyf0cpsbadm7bmfjpmm96ps0zpxis6frp6i22xhbh4n5j212b3a"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/cliamp"))
            (chmod (string-append bin "/cliamp") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/cliamp"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/cliamp"))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "Command-line audio player")
    (description
     "cliamp is a command-line audio player that supports various audio formats.
It provides a simple terminal interface for playing music files with basic
playback controls like play, pause, stop, and volume adjustment.")
    (license license:expat)))

;;;
;;; 9. ferrishot-bin — Screenshot tool
;;;    Pre-built Rust binary from GitHub Releases.
;;;    Note: repository was renamed from ferrishot to peashot, but release
;;;    assets still use the ferrishot name.
;;;
(define-public ferrishot-bin
  (package
    (name "ferrishot-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nik-rev/peashot/releases/download/v"
             version "/ferrishot-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "06r4glglzilbvrwgf5xw2r12l7v32zvni5avk20phgm0xkdgpgml"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname xz)))
            (invoke tar "xf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "ferrishot-x86_64-unknown-linux-gnu/ferrishot"
                       (string-append bin "/ferrishot"))
            (chmod (string-append bin "/ferrishot") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/ferrishot"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/ferrishot"))))))
    (native-inputs (list tar xz patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nik-rev/ferrishot")
    (synopsis "Screenshot tool written in Rust")
    (description
     "Ferrishot (now known as Peashot) is a screenshot tool written in Rust.
It provides quick screen capture functionality with annotation and
editing capabilities directly in the capture interface.")
    (license license:asl2.0)))

;;;
;;; 10. sysbox-ce — Container runtime (Community Edition)
;;;     Pre-built binaries from .deb package on GitHub Releases.
;;;
(define-public sysbox-ce
  (package
    (name "sysbox-ce")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nestybox/sysbox/releases/download/v"
             version "/sysbox-ce_" version ".linux_amd64.deb"))
       (sha256
        (base32 "0bhpai2zckybw6cpy6vfiw91d5ci807a633fy6njqn8rbag3ib5p"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (ar  (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname ar) ":"
                            (dirname tar) ":"
                            (dirname xz)))
            (invoke ar "x" (assoc-ref %build-inputs "source"))
            (invoke tar "xf" "data.tar.xz")
            (mkdir-p bin)
            ;; Install the three sysbox binaries
            (for-each
             (lambda (name)
               (let ((src (string-append "usr/bin/" name)))
                 (when (file-exists? src)
                   (copy-file src (string-append bin "/" name))
                   (chmod (string-append bin "/" name) #o755)
                   (invoke patchelf "--set-interpreter" ld-so
                           (string-append bin "/" name))
                   (invoke patchelf "--set-rpath"
                           (string-append libc-lib "/lib:"
                                          gcc-lib "/lib")
                           (string-append bin "/" name)))))
             '("sysbox-fs" "sysbox-mgr" "sysbox-runc"))))))
    (native-inputs (list binutils tar xz patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nestybox/sysbox")
    (synopsis "Next-generation container runtime for system containers")
    (description
     "Sysbox is an open-source, next-generation container runtime that enables
Docker containers to act as virtual servers capable of running systemd,
Docker, Kubernetes, and other system-level software with proper isolation.
It enhances container security and functionality without requiring
privileged containers.")
    (license license:asl2.0)))
