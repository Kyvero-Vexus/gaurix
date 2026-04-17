;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417ak
;;; Resolves 3 BLOCKED packages from dependency tree queue.
;;; 25 packages remain BLOCKED after evaluation.
;;;
;;; New recipes (3):
;;;    1. void-electron-latest-bin (copy-build-system, v1.99.30044, Apache-2.0)
;;;    2. chatgqt (copy-build-system, v2.2, GPL-3.0+)
;;;    3. redact-bin (copy-build-system, v0.21.18, nonfree)
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages deptree-resolver-260417ak)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:export (void-electron-latest-bin
            chatgqt
            redact-bin))

;;; Nonfree license for proprietary packages
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; ===================================================================
;;; 1. void-electron-latest-bin — VS Code fork (Void editor) on Electron
;;; ===================================================================
;;; Previously BLOCKED (COMPLEX_DEPS: No Linux binaries published).
;;; Re-evaluated: Linux x64 tar.gz now available on GitHub releases.
;;; Apache-2.0 license.  Binary packaging via copy-build-system.
(define-public void-electron-latest-bin
  (package
    (name "void-electron-latest-bin")
    (version "1.99.30044")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/voideditor/binaries/releases/download/"
                    version "/Void-linux-x64-" version ".tar.gz"))
              (sha256
               (base32
                "013aq1k0f5mayz73wfb5acadfpk20g0y0874jxryfsvia95rgsvv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/void-editor/"))))
    (synopsis "open-source AI code editor forked from VS Code")
    (description
     "Void is an open-source AI code editor forked from Visual Studio Code.
It provides AI-powered code completion, chat, and editing features while
keeping the familiar VS Code interface.  This package installs the
prebuilt Linux x64 binary.")
    (home-page "https://github.com/voideditor/void")
    (license license:asl2.0)))

;;; ===================================================================
;;; 2. chatgqt — ChatGPT WebView client based on Qt6
;;; ===================================================================
;;; Previously BLOCKED (MISSING_SOURCE: No upstream repository).
;;; Re-evaluated: Source tarball available in AUR git tree at
;;; aur.archlinux.org/cgit/aur.git/plain/ChatGQT.tar.gz?h=chatgqt.
;;; GPLv3 Python script with PyQt6 WebEngine, icons, and .desktop file.
(define-public chatgqt
  (package
    (name "chatgqt")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/plain/ChatGQT.tar.gz?h=chatgqt")
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "076dzwxf8r51kglakp9wy9nxhxjya2makppcq1l83ng37nz1bg6l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/chatgqt" "bin/chatgqt")
                ("usr/share/" "share/"))))
    (synopsis "simple ChatGPT webview client based on Qt")
    (description
     "ChatGQT is a lightweight ChatGPT desktop client built with Python
and PyQt6 WebEngine.  It provides a system tray icon, theme detection,
download handling, and configurable permissions for microphone,
notifications, and clipboard access.")
    (home-page "https://aur.archlinux.org/packages/chatgqt")
    (license license:gpl3+)))

;;; ===================================================================
;;; 3. redact-bin — Content removal tool for social media
;;; ===================================================================
;;; Previously BLOCKED (PROPRIETARY_LICENSE: No source code available).
;;; Re-evaluated: Direct download URL works for the zip archive.
;;; Proprietary Electron app; packaged as nonfree binary.
(define-public redact-bin
  (package
    (name "redact-bin")
    (version "0.21.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://update-desktop.redact.dev/build/Redact-"
                    version ".zip"))
              (sha256
               (base32
                "1w3spp7lfmmkawrchr5xpf0nb465p52i5kh07q9hwj75f4yaqpjf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/redact/"))))
    (native-inputs
     (list unzip))
    (synopsis "tool to remove old social media content")
    (description
     "Redact lets you remove old tweets, images, Discord messages, Reddit
posts, and other social media content in bulk.  This package installs
the prebuilt desktop application.")
    (home-page "https://redact.dev/")
    (license license:nonfree)))
