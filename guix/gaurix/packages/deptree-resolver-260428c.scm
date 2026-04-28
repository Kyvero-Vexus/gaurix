;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428c
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 1 resolved (vdhcoapp) + 0 deps packaged.
;;; 99 remain BLOCKED.
;;; Generated: 2026-04-28
;;;
;;; Key finding: vdhcoapp was previously marked SOURCE_UNAVAILABLE (deleted
;;; from AUR) but the upstream GitHub repo (aclap-dev/vdhcoapp) is active
;;; with binary releases.  The noffmpeg variant provides a compact binary
;;; that uses system ffmpeg/ffprobe.  All other 99 packages fall into
;;; genuinely intractable categories documented in
;;; deptree-resolver-260428c-blocked-notes.scm.

(define-module (gaurix packages deptree-resolver-260428c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages video)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xorg)
  #:export (vdhcoapp))

;;; ============================================================
;;; vdhcoapp — Video DownloadHelper companion application
;;; ============================================================
;;; Prior status: BLOCKED (SOURCE_UNAVAILABLE — deleted from AUR).
;;; Resolution: Upstream repo at github.com/aclap-dev/vdhcoapp is active
;;; with v2.0.19 binary releases.  Using the noffmpeg variant so we can
;;; provide ffmpeg/ffprobe from Guix.
;;;
;;; The binary is a native messaging host for the Video DownloadHelper
;;; browser extension.  Two ELF binaries: vdhcoapp (Go/CGo, minimal deps)
;;; and filepicker (C/GTK3 file chooser dialog).
;;;
;;; Technical notes:
;;; - vdhcoapp is a Go/CGo binary with embedded data.  It reads itself
;;;   via /proc/self/exe to extract resources, so both patchelf and
;;;   ld.so invocation break it.
;;; - The binary requires 'filepicker' to be in the same directory
;;;   (discovered via the binary's own path).
;;; - We leave the Go binary unmodified and use LD_LIBRARY_PATH via
;;;   a wrapper script.  The system's /lib64/ld-linux-x86-64.so.2 is
;;;   used as the interpreter (works on foreign distros).
;;; - The filepicker binary (C/GTK3) is safely patched with patchelf.

(define-public vdhcoapp
  (package
    (name "vdhcoapp")
    (version "2.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aclap-dev/vdhcoapp/releases/download/v"
                    version "/vdhcoapp-noffmpeg-linux-x86_64.tar.bz2"))
              (sha256
               (base32
                "08laza4hv4c0bwywkakqzxpvrr0x1bwcyiczqp6kcvbywxl1r9cd"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:validate-runpath? #f
      #:strip-binaries? #f           ;Go binary has embedded resources
      #:install-plan #~'()
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (libexec (string-append out "/libexec/vdhcoapp")))
                (mkdir-p libexec)
                ;; Both binaries must be co-located (vdhcoapp finds filepicker
                ;; via its own directory path from /proc/self/exe).
                (install-file "vdhcoapp" libexec)
                (install-file "filepicker" libexec)
                (mkdir-p bin))))
          (add-after 'install 'patch-filepicker
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (fp (string-append out "/libexec/vdhcoapp/filepicker"))
                     (ld-so (search-input-file inputs
                              "lib/ld-linux-x86-64.so.2"))
                     (libc-lib (dirname ld-so))
                     (gcc-lib (dirname
                               (search-input-file inputs
                                 "lib/libstdc++.so.6")))
                     (gtk-lib (dirname
                               (search-input-file inputs
                                 "lib/libgtk-3.so.0")))
                     (glib-lib (dirname
                                (search-input-file inputs
                                  "lib/libglib-2.0.so.0")))
                     (cairo-lib (dirname
                                 (search-input-file inputs
                                   "lib/libcairo.so.2")))
                     (pango-lib (dirname
                                 (search-input-file inputs
                                   "lib/libpango-1.0.so.0")))
                     (gdk-lib (dirname
                               (search-input-file inputs
                                 "lib/libgdk_pixbuf-2.0.so.0")))
                     (atspi-lib (dirname
                                 (search-input-file inputs
                                   "lib/libatspi.so.0")))
                     (rpath (string-join
                             (list libc-lib gcc-lib gtk-lib glib-lib
                                   cairo-lib pango-lib gdk-lib atspi-lib)
                             ":")))
                ;; filepicker is a standard C/GTK3 binary; safe to patchelf
                (invoke "patchelf" "--set-interpreter" ld-so fp)
                (invoke "patchelf" "--set-rpath" rpath fp))))
          (add-after 'patch-filepicker 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/vdhcoapp"))
                     (libexec (string-append out "/libexec/vdhcoapp"))
                     (real-bin (string-append libexec "/vdhcoapp"))
                     (libc-lib (dirname
                                (search-input-file inputs
                                  "lib/ld-linux-x86-64.so.2")))
                     (gcc-lib (dirname
                               (search-input-file inputs
                                 "lib/libstdc++.so.6")))
                     (ffmpeg-bin (dirname
                                  (search-input-file inputs "bin/ffmpeg")))
                     (xdg-bin (dirname
                                (search-input-file inputs "bin/xdg-open"))))
                ;; Wrapper sets LD_LIBRARY_PATH and PATH, then execs the
                ;; unmodified Go binary directly.  The binary uses
                ;; /proc/self/exe to find itself and its sibling filepicker,
                ;; so we must not use ld.so invocation.
                (call-with-output-file bin
                  (lambda (port)
                    (format port "#!~a~%"
                            (search-input-file inputs "bin/bash"))
                    (format port "export LD_LIBRARY_PATH=\"~a:~a${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}\"~%"
                            libc-lib gcc-lib)
                    (format port "export PATH=\"~a:~a${PATH:+:$PATH}\"~%"
                            ffmpeg-bin xdg-bin)
                    (format port "exec \"~a\" \"$@\"~%" real-bin)))
                (chmod bin #o755)))))))
    (native-inputs
     (list patchelf))
    (inputs
     (list bash-minimal
           (list gcc "lib")
           glibc
           gtk+
           glib
           gdk-pixbuf
           cairo
           pango
           at-spi2-core
           ffmpeg
           xdg-utils))
    (supported-systems '("x86_64-linux"))
    (synopsis "companion application for Video DownloadHelper browser add-on")
    (description
     "VdhCoApp is the companion application for the Video DownloadHelper
browser extension.  It provides native messaging support for downloading
and converting videos from the browser.  Features include file system
access for saving downloads, a file picker dialog, and video conversion
via FFmpeg.")
    (home-page "https://github.com/aclap-dev/vdhcoapp")
    (license license:gpl2)))
