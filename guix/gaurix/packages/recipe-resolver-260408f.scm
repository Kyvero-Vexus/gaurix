;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408f
;;; Resolves 7 NEEDS_RECIPE_DESIGN packages:
;;;   Pre-built desktop applications and binary tools.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            logseq-desktop-bin
            rider-bin
            xnviewmp-bin
            tutanota-desktop-bin
            shutter-encoder-bin
            freefilesync-bin
            appimagelauncher-bin))

;;;
;;; ── logseq-desktop-bin ──────────────────────────────────────────
;;; Privacy-first knowledge management and note-taking application
;;;
(define-public logseq-desktop-bin
  (package
    (name "logseq-desktop-bin")
    (version "0.10.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/logseq/logseq/releases/download/"
             version
             "/Logseq-linux-x64-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("logseq-desktop" "bin/logseq-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "logseq-desktop")
              (chmod "logseq-desktop" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://logseq.com")
    (synopsis "local-first knowledge management and note-taking app")
    (description
     "Logseq is a privacy-first, open-source knowledge management and
note-taking application with outliner-based editing, bidirectional
linking, and graph visualization.  This package provides the pre-built
AppImage binary.")
    (license license:agpl3+)))

;;;
;;; ── rider-bin ──────────────────────────────────────────
;;; JetBrains Rider .NET IDE
;;;
(define-public rider-bin
  (package
    (name "rider-bin")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/rider/JetBrains.Rider-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rider/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (rider (string-append out "/share/rider/bin/rider")))
                (mkdir-p bin)
                (symlink rider (string-append bin "/rider")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/rider/")
    (synopsis "cross-platform .NET IDE by JetBrains")
    (description
     "JetBrains Rider is a cross-platform .NET IDE supporting C#, F#,
VB.NET, ASP.NET, and Unity/Unreal game development.  This package
provides the pre-built binary distribution.")
    ;; Proprietary; JetBrains subscription license.
    (license #f)))

;;;
;;; ── xnviewmp-bin ──────────────────────────────────────────
;;; Multi-format image viewer and converter
;;;
(define-public xnviewmp-bin
  (package
    (name "xnviewmp-bin")
    (version "1.10.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://download.xnview.com/XnViewMP-linux-x64.tgz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/xnviewmp/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/xnviewmp/xnview")
                         (string-append bin "/xnviewmp")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.xnview.com/en/xnviewmp/")
    (synopsis "versatile image viewer, browser, and converter")
    (description
     "XnViewMP is a versatile image viewer, browser, and converter
supporting over 500 image formats with batch processing, metadata
editing, and slideshow capabilities.  This package provides the
pre-built binary distribution.")
    ;; Freeware for personal/educational use; commercial use requires license.
    (license #f)))

;;;
;;; ── tutanota-desktop-bin ──────────────────────────────────────────
;;; Secure encrypted email client (Tuta)
;;;
(define-public tutanota-desktop-bin
  (package
    (name "tutanota-desktop-bin")
    (version "340.260326.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://app.tuta.com/desktop/tutanota-desktop-linux.AppImage")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tutanota-desktop" "bin/tutanota-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "tutanota-desktop")
              (chmod "tutanota-desktop" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tuta.com")
    (synopsis "secure end-to-end encrypted email and calendar client")
    (description
     "Tuta (formerly Tutanota) is a secure, end-to-end encrypted email
and calendar client focused on privacy, with offline access and deep OS
integration.  This package provides the pre-built AppImage binary.")
    (license license:gpl3+)))

;;;
;;; ── shutter-encoder-bin ──────────────────────────────────────────
;;; Professional video/audio/image converter based on FFmpeg
;;;
(define-public shutter-encoder-bin
  (package
    (name "shutter-encoder-bin")
    (version "20.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.shutterencoder.com/Shutter%20Encoder%20"
             version "%20Linux%2064bits.AppImage"))
       (file-name (string-append "shutter-encoder-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("shutter-encoder" "bin/shutter-encoder"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "shutter-encoder")
              (chmod "shutter-encoder" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.shutterencoder.com")
    (synopsis "professional video, audio, and image conversion tool")
    (description
     "Shutter Encoder is a professional video, audio, and image conversion
tool based on FFmpeg, supporting a wide range of codecs and formats.
This package provides the pre-built AppImage binary.")
    (license license:gpl3+)))

;;;
;;; ── freefilesync-bin ──────────────────────────────────────────
;;; Folder comparison and synchronization tool
;;;
(define-public freefilesync-bin
  (package
    (name "freefilesync-bin")
    (version "14.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://freefilesync.org/download/FreeFileSync_"
             version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/freefilesync/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/freefilesync/FreeFileSync")
                         (string-append bin "/freefilesync")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://freefilesync.org")
    (synopsis "folder comparison and synchronization tool")
    (description
     "FreeFileSync is a folder comparison and synchronization tool that
creates and manages backup copies of files, supporting mirror, two-way,
and update synchronization.  This package provides the pre-built binary
distribution.")
    (license license:gpl3+)))

;;;
;;; ── appimagelauncher-bin ──────────────────────────────────────────
;;; AppImage desktop integration helper
;;;
(define-public appimagelauncher-bin
  (package
    (name "appimagelauncher-bin")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TheAssassin/AppImageLauncher/releases/download/v"
             version "/appimagelauncher_" version
             "-travis995.0f91801.bionic_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/" ""))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (delete 'install-license-files))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TheAssassin/AppImageLauncher")
    (synopsis "desktop integration helper for AppImage files")
    (description
     "AppImageLauncher is a helper application for Linux that integrates
AppImages into the system by registering them with the desktop
environment, providing a menu entry and optional desktop integration on
first launch.  This package provides the pre-built binary distribution.")
    (license license:expat)))
