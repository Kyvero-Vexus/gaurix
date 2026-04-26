;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426b
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (1): qtspim-bin (binary from SourceForge .deb, provides qtspim-iconfix)
;;; Remaining BLOCKED: 99 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260426b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:export (qtspim-bin))


;;; ---- 1. qtspim-bin ----
;;; MIPS simulator with Qt GUI.
;;; Upstream: http://spimsimulator.sourceforge.net/
;;; Binary package from SourceForge .deb (v9.1.24).
;;; Resolves AUR qtspim-iconfix (provides qtspim with icon fixes).
;;; Source build requires SVN checkout which is not easily hashable;
;;; binary from official .deb is the pragmatic approach.
;;; License: BSD

(define-public qtspim-bin
  (package
    (name "qtspim-bin")
    (version "9.1.24")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sourceforge.net/projects/spimsimulator/files/"
             "qtspim_" version "_linux64.deb/download"))
       (sha256
        (base32 "16s9kfichw4jxrv4lkg7zi398rdxn5a2z1wpwdh42bvqk7b11xqb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'()
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((source (assoc-ref inputs "source")))
                ;; Extract .deb using ar
                (invoke "ar" "x" source)
                ;; Extract data tarball
                (invoke "tar" "xf" "data.tar.xz"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (share (string-append out "/share")))
                ;; Install binary
                (install-file "usr/bin/qtspim" bin)
                ;; Install help files
                (let ((help-dir (string-append share "/qtspim")))
                  (mkdir-p help-dir)
                  (copy-recursively "usr/share/qtspim" help-dir))
                ;; Install man page
                (let ((man1 (string-append share "/man/man1")))
                  (mkdir-p man1)
                  (when (file-exists? "usr/share/man/man1/qtspim.1.gz")
                    (install-file "usr/share/man/man1/qtspim.1.gz" man1)))
                ;; Install desktop file
                (let ((apps (string-append share "/applications")))
                  (mkdir-p apps)
                  (when (file-exists? "usr/share/applications/qtspim.desktop")
                    (install-file "usr/share/applications/qtspim.desktop"
                                  apps)))
                ;; Install icons
                (for-each
                 (lambda (size)
                   (let* ((icon-src (string-append
                                     "usr/share/icons/hicolor/"
                                     size "x" size "/apps/qtspim.png"))
                          (icon-dir (string-append
                                     share "/icons/hicolor/"
                                     size "x" size "/apps")))
                     (when (file-exists? icon-src)
                       (mkdir-p icon-dir)
                       (install-file icon-src icon-dir))))
                 '("48" "256")))))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/qtspim"))
                     (libc (assoc-ref inputs "libc"))
                     (gcc-lib (assoc-ref inputs "gcc"))
                     (qtbase (assoc-ref inputs "qtbase"))
                     (libx11 (assoc-ref inputs "libx11"))
                     (libxcb (assoc-ref inputs "libxcb"))
                     (mesa (assoc-ref inputs "mesa"))
                     (glib (assoc-ref inputs "glib"))
                     (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (string-append libc "/lib")
                                   (string-append gcc-lib "/lib")
                                   (string-append qtbase "/lib")
                                   (string-append libx11 "/lib")
                                   (string-append libxcb "/lib")
                                   (string-append mesa "/lib")
                                   (string-append glib "/lib"))
                             ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs
     (list patchelf
           binutils))
    (inputs
     (list (list gcc "lib")
           glibc
           qtbase-5
           libx11
           libxcb
           mesa
           glib))
    (supported-systems '("x86_64-linux"))
    (home-page "https://spimsimulator.sourceforge.net/")
    (synopsis "MIPS simulator with Qt graphical user interface")
    (description
     "QtSpim is a graphical user interface for SPIM, a self-contained
simulator for the MIPS R2000/R3000 processor.  It reads and executes
assembly language programs written for this processor.  QtSpim provides
a modern Qt-based interface with syntax highlighting, register display,
and memory inspection for teaching and learning MIPS assembly programming.")
    (license license:bsd-3)))
