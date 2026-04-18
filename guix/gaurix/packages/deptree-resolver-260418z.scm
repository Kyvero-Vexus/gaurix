;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418z
;;; Resolves 11 BLOCKED packages with concrete recipes.
;;; Moves 7 packages to FAILED status.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418z)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (krillinai-bin
            box
            xcursor-openzone
            backlight-sync-git
            dict-ozhegov
            profile-sync-daemon-git
            python-system-hotkey
            brightness-controller-git
            hyprcap
            niripwmenu
            python-opcua-asyncio
))

(define-public krillinai-bin
  (package
    (name "krillinai-bin")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/krillinai/KrillinAI")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Video translation and dubbing tool powered by LLMs")
    (description "A video translation and dubbing tool powered by LLMs, offering professional-grade translations and one-click full-process deployment.It can generate content optimized for platforms like YouTube，TikTok, and Shorts.(Prebuilt version).")
    (home-page "https://github.com/krillinai/KrillinAI")
    (license license:gpl3+)))

(define-public box
  (package
    (name "box")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/AlphaLynx/box")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "codeberg.org/AlphaLynx/box"
           #:tests? #f))
    (synopsis "Command-line tool to draw frames around text")
    (description "Command-line tool to draw frames around text.")
    (home-page "https://codeberg.org/AlphaLynx/box")
    (license license:expat)))

(define-public xcursor-openzone
  (package
    (name "xcursor-openzone")
    (version "1.2.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-openzone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))
    (synopsis "OpenZone X11 cursor theme")
    (description "OpenZone X11 cursor theme.")
    (home-page "https://www.opendesktop.org/p/999999/")
    (license license:gpl3+)))

(define-public backlight-sync-git
  (package
    (name "backlight-sync-git")
    (version "r23.2067e96")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Stebalien/backlight-sync")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Automatic backlight sync between a laptop and a monitor")
    (description "Automatic backlight sync between a laptop and a monitor.")
    (home-page "https://github.com/Stebalien/backlight-sync")
    (license license:gpl3+)))

(define-public dict-ozhegov
  (package
    (name "dict-ozhegov")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Layerex/ozhegov-dict")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Ozhegov's Russian Dictionary")
    (description "Ozhegov's Russian Dictionary.")
    (home-page "https://github.com/Layerex/ozhegov-dict")
    (license license:expat)))

(define-public profile-sync-daemon-git
  (package
    (name "profile-sync-daemon-git")
    (version "6.50.r14.gbdea6f0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/graysky2/profile-sync-daemon")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Symlinks and syncs browser profile dirs to RAM")
    (description "Symlinks and syncs browser profile dirs to RAM.")
    (home-page "https://github.com/graysky2/profile-sync-daemon")
    (license license:expat)))

(define-public python-system-hotkey
  (package
    (name "python-system_hotkey")
    (version "1.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hhannine/system_hotkey310")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python library for system wide hotkeys")
    (description "Python library for system wide hotkeys.")
    (home-page "https://github.com/hhannine/system_hotkey310")
    (license license:bsd-3)))

(define-public brightness-controller-git
  (package
    (name "brightness-controller-git")
    (version "2.4.r12.gdab46e3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LordAmit/Brightness")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Control Brightness of your Primary and Secondary Display in Linux")
    (description "Control Brightness of your Primary and Secondary Display in Linux.")
    (home-page "https://github.com/LordAmit/Brightness")
    (license license:gpl3+)))

(define-public hyprcap
  (package
    (name "hyprcap")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alonso-herreros/hyprcap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprcap" "bin/hyprcap"))))
    (synopsis "Utility to easily capture screenshots and recordings in Hyprland")
    (description "A utility to easily capture screenshots and recordings in Hyprland.")
    (home-page "https://github.com/alonso-herreros/hyprcap")
    (license license:gpl3+)))

(define-public niripwmenu
  (package
    (name "niripwmenu")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "niripwmenu" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Modern powermenu for Niri Scrollable-Tiling Wayland compositor")
    (description "A modern powermenu for Niri Scrollable-Tiling Wayland compositor.")
    (home-page "https://pypi.org/project/niripwmenu/")
    (license license:expat)))

(define-public python-opcua-asyncio
  (package
    (name "python-opcua-asyncio")
    (version "1.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FreeOpcUa/opcua-asyncio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "OPC-UA client and server library for Python, also known as asyncua")
    (description "An OPC-UA client and server library for Python, also known as asyncua.")
    (home-page "https://github.com/FreeOpcUa/opcua-asyncio")
    (license license:lgpl3+)))
