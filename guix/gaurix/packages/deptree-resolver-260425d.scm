;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425d
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (5): server-box-bin, dagger-bin, rip2-bin,
;;;   smtube, electrum-personal-server
;;; Already resolved (0)
;;; Already in Guix (0)
;;; Remaining BLOCKED: 95 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:export (server-box-bin
            dagger-bin
            rip2-bin
            smtube
            electrum-personal-server))


;;; ---- 1. server-box-bin ----
;;; AUR: server-box-bin (#18700) -- Server monitoring & management tool.
;;; Flutter AppImage from GitHub releases.
;;; License: GPL-3.0 (per upstream repo)

(define-public server-box-bin
  (package
    (name "server-box-bin")
    (version "1.0.1365")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lollipopkit/flutter_server_box"
                    "/releases/download/v" version
                    "/ServerBox_v" version "_amd64.AppImage"))
              (sha256
               (base32
                "02fdfzqlkg1ba0vmzbz0c9v7g8a1s2ql5pzmgijw9mwvg8b5as31"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ServerBox.AppImage" "bin/server-box"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "ServerBox.AppImage")
                   (chmod "ServerBox.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Server monitoring and management tool")
    (description "ServerBox is a Flutter application that helps you connect
to and monitor your servers via SSH.  It provides real-time CPU, memory,
disk, and network statistics.  This is the prebuilt AppImage version.")
    (home-page "https://github.com/lollipopkit/flutter_server_box")
    (license license:gpl3)))


;;; ---- 2. dagger-bin ----
;;; AUR: dagger-git (#18285) -- Portable devkit for CI/CD pipelines.
;;; Prebuilt Go binary from GitHub releases.
;;; License: Apache-2.0

(define-public dagger-bin
  (package
    (name "dagger-bin")
    (version "0.20.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dagger/dagger/releases/download/v"
                    version "/dagger_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0i9g3r1f039lp4pzf7v6a2mc8c1aaxvyzay08rmywm393a2cpz1v"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("dagger" "bin/dagger"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Portable devkit for CI/CD pipelines")
    (description "Dagger is a programmable CI/CD engine that runs pipelines
in containers.  It lets you develop powerful CI/CD pipelines as code, in
the same programming language as your application, and run them anywhere.")
    (home-page "https://dagger.io")
    (license license:asl2.0)))


;;; ---- 3. rip2-bin ----
;;; AUR: rm-improved (#18285) -- Safe and ergonomic alternative to rm.
;;; Prebuilt statically-linked Rust binary (musl) from GitHub releases.
;;; Packaged as rip2-bin since rip2 is the actively maintained successor.
;;; License: GPL-3.0+

(define-public rip2-bin
  (package
    (name "rip2-bin")
    (version "0.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MilesCranmer/rip2/releases/download/v"
                    version "/rip-Linux-x86_64-musl.tar.gz"))
              (sha256
               (base32
                "1mfdp08y91yqnc4dma90pxkbpqql20mls1w52shphfhp0v0l2n1h"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("rip" "bin/rip"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Safe and ergonomic alternative to rm")
    (description "Rip2 (rm improved) is a command-line deletion tool focused
on safety, ergonomics, and performance.  Instead of permanently deleting
files, it moves them to a graveyard directory, allowing easy recovery.
This is the statically-linked prebuilt binary.")
    (home-page "https://github.com/MilesCranmer/rip2")
    (license license:gpl3+)))


;;; ---- 4. smtube ----
;;; AUR: smtube (#18285) -- YouTube browser for SMPlayer.
;;; Qt5/qmake source build from GitHub releases.
;;; License: GPL-2.0+

(define-public smtube
  (package
    (name "smtube")
    (version "21.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/smplayer-dev/smtube/releases"
                    "/download/v" version "/smtube-" version ".tar.bz2"))
              (sha256
               (base32
                "0mfnl1hgjn8dfpk8hbpsyhd8vbp4v6d9cqbmc3nfq2yq5w1180k5"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (substitute* "Makefile"
                  (("PREFIX=/usr/local")
                   (string-append "PREFIX=" out))
                  (("QMAKE=qmake")
                   (string-append "QMAKE="
                                  (search-input-file inputs "bin/qmake")))
                  (("LRELEASE=lrelease")
                   (string-append "LRELEASE="
                                  (search-input-file inputs
                                                     "bin/lrelease"))))))))))
    (native-inputs (list qttools-5))
    (inputs (list qtbase-5))
    (synopsis "Application for browsing and playing YouTube videos")
    (description "SMTube is an application that allows you to browse, search,
and play YouTube videos.  Videos are played back via an external media
player such as SMPlayer, mpv, or VLC.  It uses yt-dlp to fetch video
streams.")
    (home-page "https://www.smtube.org/")
    (license license:gpl2+)))


;;; ---- 5. electrum-personal-server ----
;;; AUR: electrum-personal-server-git (#18285) -- Electrum server for Bitcoin.
;;; Pure Python package with no external dependencies.
;;; License: MIT

(define-public electrum-personal-server
  (package
    (name "electrum-personal-server")
    (version "0.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chris-belcher/electrum-personal-server")
                    (commit (string-append "eps-v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0rgdaz111vwifbcwllh2kgc2j9w04pxyjdgmf6nxjcy90wwf980b"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list python))
    (synopsis "Lightweight Electrum server for a single user")
    (description "Electrum Personal Server is a lightweight implementation of
the Electrum server protocol, designed for a single user connecting their
Electrum wallet to their own full Bitcoin Core node.  It requires no
external Python dependencies beyond the standard library.")
    (home-page "https://github.com/chris-belcher/electrum-personal-server")
    (license license:expat)))
