;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414r
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 8 recipes created (4 binary repacks + 1 theme + 1 script + 2 Python source)
;;;   - 22 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages recipe-resolver-260414r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (magika-bin
            sddm-eucalyptus-drop
            gamepadla-polling
            rivetui-bin
            ins-bin
            git-wizard
            ytconverter
            cai))

;;;
;;; --- 1. magika-bin (copy-build-system, pre-built Rust binary) ---
;;; AI-powered file content type detection CLI by Google.
;;; Source: https://github.com/google/magika
;;; Resolves: #7418 magika (line 56762)
;;;

(define-public magika-bin
  (package
    (name "magika-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/google/magika/releases/download/"
                    "cli%2Fv" version
                    "/magika-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "1d5siycb7s853mrgivlvckcbjyd40fiyhlzwnljff86dcp4pbr2c"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "magika" "bin/magika"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   ;; The tarball extracts to a directory
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/magika")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI-powered file content type detection")
    (description "Magika is a tool by Google for detecting file content types
using deep learning.  It identifies over 200 content types with high accuracy,
including binary formats, text encodings, and programming languages, using a
custom neural network optimized for speed.")
    (home-page "https://github.com/google/magika")
    (license license:asl2.0)))

;;;
;;; --- 2. sddm-eucalyptus-drop (copy-build-system, QML theme) ---
;;; QML theme for SDDM display manager with eucalyptus aesthetic.
;;; Source: https://gitlab.com/Matt.Jolly/sddm-eucalyptus-drop
;;; Resolves: #7588 sddm-eucalyptus-drop (line 57957)
;;;

(define-public sddm-eucalyptus-drop
  (package
    (name "sddm-eucalyptus-drop")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/Matt.Jolly/sddm-eucalyptus-drop"
                    "/-/archive/v" version
                    "/sddm-eucalyptus-drop-v" version ".tar.gz"))
              (sha256
               (base32
                "0hh3nyh9x6j9xda46nj6kay2vm7ibrqb9isfn8q8brka20kvzb8z"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/sddm/themes/eucalyptus-drop/"
                         #:exclude ("README.md" "LICENSE" ".gitlab-ci.yml")))))
    (synopsis "eucalyptus-themed login screen for SDDM")
    (description "Eucalyptus Drop is a QML theme for the SDDM display manager
featuring a clean eucalyptus-inspired aesthetic.  It supports Qt6 and provides
a modern, customizable login screen with background image support.")
    (home-page "https://gitlab.com/Matt.Jolly/sddm-eucalyptus-drop")
    (license license:gpl3)))

;;;
;;; --- 3. gamepadla-polling (trivial-build-system, Python script) ---
;;; Gamepad latency and polling rate tester for Linux.
;;; Source: https://github.com/cakama3a/Polling
;;; Resolves: #7596 gamepadla-polling (line 58006)
;;;

(define-public gamepadla-polling
  (package
    (name "gamepadla-polling")
    (version "1.3.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cakama3a/Polling/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1hivgw7080g9ij3k2yc9lvh87dg92sisxwh781ncz6gd7ijibzjr"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out (assoc-ref %outputs "out"))
                      (bin (string-append out "/bin"))
                      (source (assoc-ref %build-inputs "source")))
                 (setenv "PATH"
                         (string-append
                          (assoc-ref %build-inputs "tar") "/bin:"
                          (assoc-ref %build-inputs "gzip") "/bin"))
                 (invoke "tar" "xzf" source)
                 (mkdir-p bin)
                 (let ((script (string-append bin "/gamepadla-polling")))
                   (copy-file
                    (car (find-files "." "^Python\\.py$"))
                    script)
                   (substitute* script
                     (("#!/usr/bin/env python3")
                      (string-append "#!" (assoc-ref %build-inputs "python")
                                     "/bin/python3")))
                   (chmod script #o755))))))
    (native-inputs (list tar gzip))
    (inputs (list python))
    (supported-systems '("x86_64-linux"))
    (synopsis "gamepad latency and polling rate tester")
    (description "Gamepadla Polling is a Linux tool for measuring gamepad
input latency and USB polling rates.  It provides real-time statistics
including minimum, maximum, and average polling intervals, helping users
diagnose controller responsiveness issues.")
    (home-page "https://github.com/cakama3a/Polling")
    (license license:expat)))

;;;
;;; --- 4. rivetui-bin (copy-build-system, pre-built Rust binary) ---
;;; Terminal UI Discord client written in Rust.
;;; Source: https://github.com/YetAnotherMechanicusEnjoyer/vimcord
;;; Resolves: #7623 rivetui (line 58166)
;;;

(define-public rivetui-bin
  (package
    (name "rivetui-bin")
    (version "0.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/YetAnotherMechanicusEnjoyer/vimcord"
                    "/releases/download/v" version
                    "/vimcord-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "143picw3rmwinfz97bj40dkz56jrm8gpwmy4llhrnzk212qgnzq2"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "vimcord" "bin/rivetui"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/rivetui")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal UI Discord client")
    (description "Rivet (formerly Vimcord) is a terminal-based Discord client
written in Rust.  It provides a vim-like interface for reading and sending
messages, managing channels, and interacting with Discord servers from the
command line.")
    (home-page "https://github.com/YetAnotherMechanicusEnjoyer/vimcord")
    (license license:expat)))

;;;
;;; --- 5. ins-bin (copy-build-system, AppImage) ---
;;; CLI tool for managing dotfiles and system diagnostics.
;;; Source: https://github.com/instantOS/instantCLI
;;; Resolves: #7461 ins (line 57119)
;;;

(define-public ins-bin
  (package
    (name "ins-bin")
    (version "0.13.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/instantOS/instantCLI"
                    "/releases/download/v" version
                    "/ins-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0bjvfagg2dhikn6d7f0irqxrx1q5r22mzjli6ar1x8ljbch53fhb"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "ins-" #$version
                                        "-x86_64.AppImage")
                         "bin/ins"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ins")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "dotfile manager and system diagnostics CLI")
    (description "Ins (instantCLI) is a command-line tool for managing dotfiles,
running system diagnostics, and automating common configuration tasks.  It
provides commands for file synchronization, version tracking, and system
information gathering.")
    (home-page "https://github.com/instantOS/instantCLI")
    (license license:gpl2)))

;;;
;;; --- 6. git-wizard (pyproject-build-system, Python source) ---
;;; CLI tool to automate Git setup and GitHub repo creation.
;;; Source: https://github.com/noufalkdlr/git-wizard
;;; Resolves: #7384 git-wizard (line 56492)
;;;

(define-public git-wizard
  (package
    (name "git-wizard")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/noufalkdlr/git-wizard"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1l9bdvpnq977ggk3rslis3r8axryxqgnb3641cglxz9ga2b9gwim"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;no test suite
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (synopsis "CLI tool for automating Git and GitHub setup")
    (description "Git Wizard automates common Git workflows including
repository initialization, SSH key configuration, GitHub repository creation,
and remote setup.  It provides an interactive CLI for quickly setting up
new projects with proper Git configuration.")
    (home-page "https://github.com/noufalkdlr/git-wizard")
    (license license:gpl3)))

;;;
;;; --- 7. ytconverter (pyproject-build-system, PyPI source) ---
;;; Terminal-based YouTube video/audio downloader using yt-dlp.
;;; Source: https://pypi.org/project/ytconverter/
;;; Resolves: #7566 ytconverter (line 57820)
;;;

(define-public ytconverter
  (package
    (name "ytconverter")
    (version "4.0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/y/"
                    "ytconverter/ytconverter-" version ".tar.gz"))
              (sha256
               (base32
                "1vy588zjrxvlz2wyhhyv6d67f2nzc22jk4jmp4bivsbyphdls7cz"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;no test suite
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (synopsis "terminal-based YouTube video and audio downloader")
    (description "YTConverter is a terminal-based tool for downloading YouTube
videos and audio tracks.  It uses yt-dlp as its download backend and supports
conversion to various formats using ffmpeg.  The tool provides a simple
command-line interface for quick media downloads.")
    (home-page "https://github.com/kaifcodec/ytconverter")
    (license license:expat)))

;;;
;;; --- 8. cai (pyproject-build-system, Python source) ---
;;; CLI tool that generates git commit messages from diffs using LLMs.
;;; Source: https://github.com/thorstenfoltz/cai
;;; Resolves: #7399 cai (line 56618)
;;;

(define-public cai
  (package
    (name "cai")
    (version "0.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thorstenfoltz/cai"
                    "/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "1ragg0hik9ljyv9bqyf4n0sbhfvhx8dcwin0wja81wyyqpqf2gjc"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;no test suite
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (propagated-inputs (list python-requests python-pyyaml))
    (synopsis "AI-powered git commit message generator")
    (description "Cai generates git commit messages from diffs using large
language models.  It analyzes staged changes and produces descriptive,
conventional commit messages.  Cai supports multiple LLM backends including
OpenAI-compatible APIs.")
    (home-page "https://github.com/thorstenfoltz/cai")
    (license license:expat)))
