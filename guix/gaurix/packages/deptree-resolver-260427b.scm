;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260427b
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 3 ALREADY_RESOLVED (prior recipes exist), 1 new recipe, 96 remain BLOCKED.
;;; 1 new recipe created this pass.
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427b)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages gcc)
  #:export (rocketchat-desktop-bin))

;;; ====================================================================
;;; PACKAGE DEFINITIONS (1 new package)
;;; ====================================================================

;;;
;;; ── rocketchat-desktop-bin ─────────────────────────────────────────────
;;; Rocket.Chat desktop client (Electron-based) from prebuilt .deb
;;; https://github.com/RocketChat/Rocket.Chat.Electron
;;;
(define-public rocketchat-desktop-bin
  (package
    (name "rocketchat-desktop-bin")
    (version "4.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RocketChat/Rocket.Chat.Electron/"
             "releases/download/" version
             "/rocketchat-" version "-linux-amd64.deb"))
       (sha256
        (base32 "1609m73vh5dfdmp6z9cdf17l4fp5gbvknqk0irll40lxpk0p5f48"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib/rocketchat"))
                 (share (string-append out "/share"))
                 (source (assoc-ref %build-inputs "source"))
                 (ar (search-input-file %build-inputs "bin/ar"))
                 (tar (search-input-file %build-inputs "bin/tar"))
                 (xz (search-input-file %build-inputs "bin/xz")))
            ;; Extract the .deb (ar archive containing data.tar.xz)
            (invoke ar "x" source)
            (invoke tar "xf" "data.tar.xz"
                    (string-append "--use-compress-program=" xz))
            ;; Install application files
            (mkdir-p lib)
            (copy-recursively "opt/Rocket.Chat" lib)
            ;; Install desktop file and icons
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            ;; Create bin symlink
            (mkdir-p bin)
            (symlink (string-append lib "/rocketchat-desktop")
                     (string-append bin "/rocketchat-desktop"))
            ;; Make executable
            (chmod (string-append lib "/rocketchat-desktop") #o755)
            #t))))
    (native-inputs (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RocketChat/Rocket.Chat.Electron")
    (synopsis "Rocket.Chat desktop client for Linux")
    (description
     "Rocket.Chat is an open-source team communication platform.  This package
provides the official Electron-based desktop client, extracted from a prebuilt
Debian package.  It supports direct messaging, channels, file sharing, video
calls, and integrations.")
    (license license:expat)))
