;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414z
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 3 recipes created (Python CLI, Qt5 Neovim GUI, Doom fork)
;;;   - 2 compat aliases (upstream Guix re-exports)
;;;   - 25 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; Recipes (3):
;;;   ww-manager v2.1.10 (pyproject-build-system, Wuthering Waves CLI manager)
;;;   tg-config v1.0.1 (pyproject-build-system, Telegram config tool)
;;;   psdoom-ng 2017.10.02 (gnu-build-system, process-killing Doom fork)
;;;
;;; Compat aliases (2):
;;;   cvs-feature-bin -> cvs (upstream Guix)
;;;   neovim-qt-git -> neovim-qt (new recipe)
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages recipe-resolver-260414z)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages games)
  #:export (ww-manager
            tg-config
            neovim-qt
            neovim-qt-git
            cvs-feature-bin
            psdoom-ng))

;;;
;;; --- 1. ww-manager (pyproject-build-system, Python CLI) ---
;;; Wuthering Waves CLI manager for managing game installations,
;;; configs, and updates.
;;; Source: https://pypi.org/project/ww-manager/
;;; Resolves: #13409 ww-manager
;;;

(define-public ww-manager
  (package
    (name "ww-manager")
    (version "2.1.10")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ww_manager" version))
              (sha256
               (base32
                "1r0949j05hsbgyzlxcf5mrv5ifdr6xhbdrf4kgfmf525p0cz01s8"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-certifi
                             python-rich
                             python-typer
                             python-typing-extensions))
    (synopsis "Command-line manager for Wuthering Waves")
    (description "ww-manager is a command-line tool for managing
Wuthering Waves game installations, configuration, and updates.  It
provides utilities for launcher management and game file operations.")
    (home-page "https://github.com/timetetng/wutheringwaves-cli-manager")
    (license license:expat)))

;;;
;;; --- 2. tg-config (pyproject-build-system, Telegram config) ---
;;; Declarative Telegram Desktop configuration via TOML config
;;; files, useful for dotfiles management and ricing.
;;; Source: https://github.com/meowrch/tg-config
;;; Resolves: #13421 tg-config
;;;

(define-public tg-config
  (package
    (name "tg-config")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meowrch/tg-config")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0wcdsnch8wnql5b7akx57zgnybxf2myy49glhsz9gaid1pfwdalv"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-cryptography))
    (synopsis "Declarative Telegram Desktop configuration via TOML")
    (description "tg-config allows declarative configuration of
Telegram Desktop settings using TOML config files.  This is useful
for dotfiles management and reproducible desktop ricing setups.")
    (home-page "https://github.com/meowrch/tg-config")
    (license license:gpl3+)))

;;;
;;; --- 3. neovim-qt (cmake-build-system, Qt5 GUI for Neovim) ---
;;; A Qt5 graphical user interface for Neovim, providing a native
;;; desktop window with proper font rendering and GUI features.
;;; Source: https://github.com/equalsraf/neovim-qt
;;; Resolves: #10654 neovim-qt-git
;;;

(define-public neovim-qt
  (package
    (name "neovim-qt")
    (version "0.2.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/equalsraf/neovim-qt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0i7gr33q85mg1znf2383lqan7cbsb2kh7k9hzzb62yjmgj1yvgmg"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require a running Neovim instance
    (inputs (list neovim
                  qtbase-5
                  qtsvg-5
                  msgpack-c))
    (synopsis "Qt5 GUI for Neovim")
    (description "Neovim-Qt is a lightweight Qt5 GUI for Neovim.  It
communicates with a Neovim process through the msgpack-RPC API,
providing a native desktop window with proper font rendering,
clipboard integration, and other GUI features.")
    (home-page "https://github.com/equalsraf/neovim-qt")
    (license license:isc)))

;;;
;;; --- 4. neovim-qt-git (compat alias) ---
;;; The AUR "neovim-qt-git" tracks the git development version.
;;; The gaurix channel has neovim-qt packaged from stable releases.
;;; Resolves: #10654 neovim-qt-git
;;;

(define-public neovim-qt-git
  (package
    (inherit neovim-qt)
    (name "neovim-qt-git")
    (properties '((hidden? . #t)))))

;;;
;;; --- 5. cvs-feature-bin (compat alias) ---
;;; The AUR "cvs-feature-bin" provides CVS v1.12.13 binaries
;;; extracted from Debian packages.  Upstream Guix already has
;;; cvs at the same version (1.12.13).
;;; Resolves: #13491 cvs-feature-bin
;;;

(define-public cvs-feature-bin
  (package
    (inherit cvs)
    (name "cvs-feature-bin")
    (properties '((hidden? . #t)))))

;;;
;;; --- 6. psdoom-ng (gnu-build-system, Doom process killer) ---
;;; PSDoom-NG is a fork of Chocolate Doom that visualizes running
;;; system processes as in-game enemies.  Killing an enemy kills the
;;; corresponding process on the host system.
;;; Source: https://github.com/yeoldegrove/psdoom-ng1
;;; Resolves: #10238 psdoom-ng
;;;

(define-public psdoom-ng
  (package
    (inherit chocolate-doom)
    (name "psdoom-ng")
    (version "2017.10.02")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yeoldegrove/psdoom-ng1"
                    "/archive/refs/tags/psdoom-ng-"
                    version ".2.3.0.20181229.tar.gz"))
              (sha256
               (base32
                "1qak2vd47dfjy7j5lg7339lfgra530v4pfar9gl6i9fs2ikn1v6l"))))
    (native-inputs (list autoconf automake pkg-config))
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'run-autoreconf
                 (lambda _
                   (invoke "autoreconf" "-vfi"))))))
    (synopsis "Process-killing Doom game based on Chocolate Doom")
    (description "PSDoom-NG is a modification of Chocolate Doom that
visualizes running system processes as in-game enemies.  Killing an
enemy in the game kills the corresponding process on the host system.
It is based on the original psDooM concept and built on top of the
Chocolate Doom engine.")
    (home-page "https://github.com/yeoldegrove/psdoom-ng1")
    (license license:gpl2+)))
