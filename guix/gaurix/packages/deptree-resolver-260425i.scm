;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425i
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (2): xidlehook, musique
;;; Already resolved (0): --
;;; Remaining BLOCKED: 98 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages video)
  #:use-module (gnu packages mp3)
  #:export (xidlehook
            musique))


;;; ---- 1. xidlehook ----
;;; AUR: xidlehook (#18362)
;;; xautolock rewrite in Rust, with a few extra features.
;;; License: MIT

(define-public xidlehook
  (package
    (name "xidlehook")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xidlehook" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1p4agz37fvwzrhl9zywgb5p375ljr6j01h34ijyzzic8i2zrkm97"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:tests? #f
      #:cargo-inputs '()))
    (native-inputs (list pkg-config))
    (inputs (list pulseaudio libxcb libx11))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/jD91mZM2/xidlehook")
    (synopsis "xautolock rewrite in Rust with extra features")
    (description "Xidlehook is a general-purpose replacement for xautolock,
written in Rust.  It executes a command when the computer has been idle for a
specified amount of time, with support for cancellers that can abort a timer
when certain conditions are met (e.g., audio playing or fullscreen window
active).  It supports PulseAudio-based audio detection and has a socket-based
API for runtime control.")
    (license license:expat)))


;;; ---- 2. musique ----
;;; AUR: musique (#18381)
;;; A finely crafted music player using Qt6 and MPV.
;;; License: GPL-3.0

(define-public musique
  (package
    (name "musique")
    (version "1.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/flaviotordini/musique")
                    (commit version)
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1sxj591j08g19gbi2y6075d3hdixssz9m1qy70lyqn2ix6axmyra"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (qmake (search-input-file inputs "bin/qmake")))
                (invoke qmake
                        (string-append "PREFIX=" out)
                        "musique.pro")))))))
    (native-inputs (list qttools))
    (inputs (list qtbase qtdeclarative taglib mpv))
    (home-page "https://flavio.tordini.org/musique")
    (synopsis "Music player with a clean, simple interface")
    (description "Musique is a finely crafted music player for people who enjoy
their personal music collections.  It features a clean and simple interface
that lets you browse by folder, artist, or album.  Built with Qt6 and MPV
for audio playback, it supports a wide range of audio formats and provides
features like album art display, scrobbling, and a minimal resource
footprint.")
    (license license:gpl3+)))
