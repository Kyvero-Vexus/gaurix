;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424e
;;; Resolves 5 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (5):
;;;         1.  yay-bin (copy-build-system, v12.5.7, GPL-3.0+)
;;;         2.  teleport-client-bin (copy-build-system, v18.7.1, Apache-2.0)
;;;         3.  marmite-bin (copy-build-system, v0.3.0, AGPL-3.0+)
;;;         4.  rtimelog (copy-build-system, v0.3.6, MIT)
;;;         5.  7zip-docs (copy-build-system, v26.00, LGPL-2.1+)
;;;
;;; Already packaged prior: (none)
;;; Blocked: (none)
;;;
;;; NOTE: sha256 hashes are REAL (obtained via `guix download`).

(define-module (gaurix packages recipe-resolver-260424e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            yay-bin
            teleport-client-bin
            marmite-bin
            rtimelog
            7zip-docs
            ))

;;; -------------------------------------------------------------------
;;; 1. yay-bin --- yet another yogurt, an AUR helper written in Go
;;; -------------------------------------------------------------------
(define-public yay-bin
  (package
    (name "yay-bin")
    (version "12.5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jguer/yay/releases/download/v"
                    version "/yay_" version "_x86_64.tar.gz"))
              (sha256
               (base32 "1cxypnmfczywlrhdcvmz9151x89xg24jcgwgqliv3n9rzp9wbcr8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("yay" "bin/yay")
                ("yay.8" "share/man/man8/yay.8")
                ("bash" "share/bash-completion/completions/yay")
                ("zsh" "share/zsh/site-functions/_yay")
                ("fish" "share/fish/vendor_completions.d/yay.fish"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Jguer/yay")
    (synopsis "yet another yogurt, an AUR helper written in Go")
    (description "Yay is a Pacman wrapper and AUR helper written in Go.
It provides an interface for searching and installing packages from the Arch
User Repository (AUR) alongside standard Arch Linux repositories.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. teleport-client-bin --- Teleport SSH/access client binaries
;;; -------------------------------------------------------------------
(define-public teleport-client-bin
  (package
    (name "teleport-client-bin")
    (version "18.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.teleport.dev/teleport-v"
                    version "-linux-amd64-bin.tar.gz"))
              (sha256
               (base32 "0f5ax0j21gfiv5dl0mq8pxx7l7j9pzczcyr4s6y0hv3kz1367dj5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("teleport/tctl" "bin/tctl")
                ("teleport/tsh" "bin/tsh"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gravitational/teleport")
    (synopsis "client tools for Gravitational Teleport access platform")
    (description "Teleport is a tool for providing zero-trust access to
servers and cloud resources.  This package provides the client-side tools
@command{tsh} for SSH access and @command{tctl} for cluster administration.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. marmite-bin --- static site generator for Markdown blogs
;;; -------------------------------------------------------------------
(define-public marmite-bin
  (package
    (name "marmite-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rochacbruno/marmite/releases/download/"
                    version "/marmite-" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0gbk87aa8pwgisrrw825v4ss9zd0k4dbl203983fb6x6w1yg4dhg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("marmite" "bin/marmite"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rochacbruno.github.io/marmite/")
    (synopsis "static site generator for Markdown content")
    (description "Marmite is a static site generator that turns Markdown
files into a blog or website.  It requires no configuration and supports
themes, custom templates, and content tagging out of the box.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 4. rtimelog --- time tracking CLI using SQLite
;;; -------------------------------------------------------------------
(define-public rtimelog
  (package
    (name "rtimelog")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/umpire274/rtimelog/releases/download/v"
                    version "/rtimelog-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0m165crsp7skayvjgqa21i1yag4yhdpn8h00vprz07g4b49al31w"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rtimelog" "bin/rtimelog"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/umpire274/rtimelog")
    (synopsis "time tracking CLI using SQLite")
    (description "Rtimelog is a Rust program to track working hours and
calculate surplus time using SQLite.  It provides a simple command-line
interface for logging work sessions and generating time reports.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. 7zip-docs --- HTML documentation for the 7-Zip archiver
;;; -------------------------------------------------------------------
(define-public 7zip-docs
  (package
    (name "7zip-docs")
    (version "26.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://7-zip.org/a/7z"
                    (string-join (string-split version #\.) "")
                    "-linux-x64.tar.xz"))
              (sha256
               (base32 "1ipdfz225js41iirv9k298754vx6n8zxa47cbwzy9kcjhjjc8kf7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("MANUAL/" "share/doc/7zip/"))))
    (home-page "https://7-zip.org/")
    (synopsis "HTML documentation for the 7-Zip file archiver")
    (description "This package provides the HTML manual and documentation
files for the 7-Zip file archiver.  It includes usage guides, command-line
reference, and format specifications.")
    (license license:lgpl2.1+)))
