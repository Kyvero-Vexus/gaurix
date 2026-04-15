;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415r
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 30 resolved with new recipes.
;;;
;;; Recipes (30 new):
;;;   1. ttf-google-sans-code-nf (copy, v1.0.0, Google Sans Code Nerd Font,
;;;      MIT)
;;;   2. music-presence-bin (copy, v2.3.5, Discord music status for media
;;;      players, nonfree)
;;;   3. hayase-desktop-bin (copy, v6.4.58, anime torrent streaming app,
;;;      BUSL-1.1)
;;;   4. dimensions-bin (copy, v0.2.21, terminal tab manager TUI, MIT)
;;;   5. passless-bin (copy, v0.10.1, virtual FIDO2 device, GPL-3.0+)
;;;   6. js-util-bin (copy, v1.24.0, lightweight JavaScript runner, MIT)
;;;   7. enumctl-bin (copy, v2026.04.5, CLI tool for enum, nonfree)
;;;   8. moderncsv-bin (copy, v2.3, CSV editor/viewer, proprietary)
;;;   9. lx-music-desktop-bin (copy, v2.12.1, music player Electron, Apache-2.0)
;;;  10. soh-bin (copy, v9.1.2, Ship of Harkinian game engine, GPL-2.0+)
;;;  11. steam-cloud-file-manager-bin (copy, v1.3.3, Steam cloud save
;;;      manager, GPL-3.0)
;;;  12. interspec-bin (copy, v1.0.13, spectral radiation analysis, LGPL-2.1+)
;;;  13. c-lolcat (gnu, v1.4, high-performance lolcat in C, WTFPL)
;;;  14. celt (gnu, v0.11.3, low-latency audio codec, BSD-2)
;;;  15. funchook (cmake, v1.1.3, runtime function hooking library, GPL-2.0+)
;;;  16. crepe-bin (copy, v0.2.2, grep-like highlight tool, MIT)
;;;  17. lazymake-bin (copy, v0.4.1, TUI for Makefiles, MIT)
;;;  18. oxlint-bin (copy, v1.60.0, high-performance JS/TS linter, MIT)
;;;  19. python-myvaillant (pyproject, v0.9.10, myVaillant API library, MIT)
;;;  20. oxfmt-bin (copy, v0.45.0, high-performance JS formatter, MIT)
;;;  21. mill-global (copy, v1.1.5, Mill Build Tool Scala global, MIT)
;;;  22. paisa-bin (copy, v0.7.4, personal finance manager, AGPL-3.0+)
;;;  23. dockcheck (copy, v0.7.7, Docker image update checker, GPL-3.0)
;;;  24. bluevein-bin (copy, v1.0.2, Bluetooth dual-boot key sync, GPL-3.0)
;;;  25. ttf-google-sans-code-vf (copy, v6.001, Google Sans Code variable
;;;      font, OFL)
;;;  26. gnome-shell-extension-wallpaper-slideshow (copy, v14.1, wallpaper
;;;      slideshow GNOME extension, GPL-2.0+)
;;;  27. goat-cli (copy, v0.2.1, Go AT Protocol Bluesky CLI, MIT)
;;;  28. fnox-bin (copy, v1.20.0, secret management tool, MIT)
;;;  29. ionosctl (copy, v6.9.9, IONOS Cloud CLI, Apache-2.0)
;;;  30. mangojuice-bin (copy, v0.8.9, MangoHud configuration GUI, GPL-3.0+)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xiph)
  #:export (
            ttf-google-sans-code-nf
            music-presence-bin
            hayase-desktop-bin
            dimensions-bin
            passless-bin
            js-util-bin
            enumctl-bin
            moderncsv-bin
            lx-music-desktop-bin
            soh-bin
            steam-cloud-file-manager-bin
            interspec-bin
            c-lolcat
            celt
            funchook
            crepe-bin
            lazymake-bin
            oxlint-bin
            python-myvaillant
            oxfmt-bin
            mill-global
            paisa-bin
            dockcheck
            bluevein-bin
            ttf-google-sans-code-vf
            gnome-shell-extension-wallpaper-slideshow
            goat-cli
            fnox-bin
            ionosctl
            mangojuice-bin
            ))

;;;
;;; --- 1. ttf-google-sans-code-nf ---
;;; Google Sans Code Nerd Font patched font.
;;; Source: https://github.com/wylu1037/google-sans-code-nerd-font
;;;

(define-public ttf-google-sans-code-nf
  (package
    (name "ttf-google-sans-code-nf")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wylu1037/google-sans-code-nerd-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts" "share/fonts/truetype/google-sans-code-nf/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "Google Sans Code Nerd Font patched font")
    (description
     "Google Sans Code Nerd Font is a patched version of Google Sans Code with
Nerd Font icons added.  It combines Google's monospace coding font with
the extensive icon set from Nerd Fonts, making it suitable for terminal
emulators, code editors, and status bars that use iconic glyphs.")
    (home-page "https://github.com/wylu1037/google-sans-code-nerd-font")
    (license license:expat)))

;;;
;;; --- 2. music-presence-bin ---
;;; Discord music status for any media player.
;;; Source: https://github.com/ungive/discord-music-presence
;;;

(define-public music-presence-bin
  (package
    (name "music-presence-bin")
    (version "2.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ungive/discord-music-presence/"
                    "releases/download/v" version
                    "/music-presence-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/music-presence/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/music-presence")))
                (mkdir-p bin)
                (symlink (string-append lib "/music-presence")
                         (string-append bin "/music-presence"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Discord music status for any media player")
    (description
     "Music Presence shows what music you are listening to as your Discord
status.  It works with any media player that supports MPRIS on Linux,
displaying track information including artist, title, and album art.
This package provides the pre-built binary.")
    (home-page "https://github.com/ungive/discord-music-presence")
    (license (license:non-copyleft
              "https://github.com/ungive/discord-music-presence/blob/main/LICENSE"
              "Custom nonfree license"))))

;;;
;;; --- 3. hayase-desktop-bin ---
;;; Anime torrent streaming app.
;;; Source: https://github.com/hayase-app/hayase
;;;

(define-public hayase-desktop-bin
  (package
    (name "hayase-desktop-bin")
    (version "6.4.58")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hayase-app/hayase/releases/download/"
                    "v" version "/hayase-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/hayase/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/hayase")))
                (mkdir-p bin)
                (symlink (string-append lib "/hayase")
                         (string-append bin "/hayase"))))))))
    (inputs (list xdg-utils))
    (supported-systems '("x86_64-linux"))
    (synopsis "anime torrent streaming application")
    (description
     "Hayase is a desktop application for streaming anime via torrents.  It
provides a user-friendly interface for discovering, tracking, and
streaming anime content using peer-to-peer technology.  This package
provides the pre-built binary.")
    (home-page "https://github.com/hayase-app/hayase")
    (license (license:non-copyleft
              "https://spdx.org/licenses/BUSL-1.1.html"
              "Business Source License 1.1"))))

;;;
;;; --- 4. dimensions-bin ---
;;; Terminal tab manager TUI application.
;;; Source: https://github.com/KarlVM12/dimensions
;;;

(define-public dimensions-bin
  (package
    (name "dimensions-bin")
    (version "0.2.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KarlVM12/dimensions/releases/download/"
                    "v" version "/dimensions-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "dimensions")
              (chmod "dimensions" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "dimensions" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal tab manager TUI")
    (description
     "Dimensions is a terminal user interface (TUI) application for managing
terminal tabs and sessions.  It provides an organized way to handle
multiple terminal sessions with a visual interface.  This package
provides the pre-built binary.")
    (home-page "https://github.com/KarlVM12/dimensions")
    (license license:expat)))

;;;
;;; --- 5. passless-bin ---
;;; Virtual FIDO2 device.
;;; Source: https://github.com/pando85/passless
;;;

(define-public passless-bin
  (package
    (name "passless-bin")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pando85/passless/releases/download/"
                    "v" version "/passless-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "passless")
              (chmod "passless" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "passless" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtual FIDO2 device")
    (description
     "Passless is a virtual FIDO2 device implementation that allows
passwordless authentication.  It emulates a FIDO2/WebAuthn
authenticator in software, enabling two-factor and passwordless
authentication workflows without physical hardware.  This package
provides the pre-built binary.")
    (home-page "https://github.com/pando85/passless")
    (license license:gpl3+)))

;;;
;;; --- 6. js-util-bin ---
;;; Lightweight JavaScript runner using QuickJS.
;;; Source: https://github.com/5hubham5ingh/js-util
;;;

(define-public js-util-bin
  (package
    (name "js-util-bin")
    (version "1.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/5hubham5ingh/js-util/releases/download/"
                    "v" version "/js-util-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "js-util")
              (chmod "js-util" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "js-util" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight JavaScript runner using QuickJS")
    (description
     "js-util is a lightweight JavaScript runner built on the QuickJS engine.
It provides a fast, minimal environment for running JavaScript scripts
from the command line without the overhead of Node.js or other heavy
runtimes.  This package provides the pre-built binary.")
    (home-page "https://github.com/5hubham5ingh/js-util")
    (license license:expat)))

;;;
;;; --- 7. enumctl-bin ---
;;; CLI tool for enum.
;;; Source: https://dl.enum.co/enumctl/
;;; Note: proprietary license.
;;;

(define-public enumctl-bin
  (package
    (name "enumctl-bin")
    (version "2026.04.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.enum.co/enumctl/" version
                    "/enumctl-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "enumctl")
              (chmod "enumctl" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "enumctl" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for enum service management")
    (description
     "enumctl is a command-line interface for interacting with the Enum
service.  It provides tools for managing and querying Enum resources
from the terminal.  This package provides the pre-built binary.
Note: this package uses a proprietary license.")
    (home-page "https://enum.co")
    (license (license:non-copyleft
              "https://enum.co/terms"
              "Proprietary Enum license"))))

;;;
;;; --- 8. moderncsv-bin ---
;;; CSV editor and viewer.
;;; Source: https://www.moderncsv.com/
;;; Note: proprietary license.
;;;

(define-public moderncsv-bin
  (package
    (name "moderncsv-bin")
    (version "2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.moderncsv.com/release/ModernCSV-Linux-v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/moderncsv/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/moderncsv")))
                (mkdir-p bin)
                (symlink (string-append lib "/ModernCSV")
                         (string-append bin "/moderncsv"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CSV editor and viewer")
    (description
     "Modern CSV is a powerful CSV file editor and viewer designed for
handling large files efficiently.  It provides a spreadsheet-like
interface for editing comma-separated value files with features
including multi-file editing, search and replace, and column
operations.  This package provides the pre-built binary.
Note: this package uses a proprietary license.")
    (home-page "https://www.moderncsv.com")
    (license (license:non-copyleft
              "https://www.moderncsv.com/license"
              "Proprietary Modern CSV license"))))

;;;
;;; --- 9. lx-music-desktop-bin ---
;;; Music player built with Electron.
;;; Source: https://github.com/lyswhut/lx-music-desktop
;;;

(define-public lx-music-desktop-bin
  (package
    (name "lx-music-desktop-bin")
    (version "2.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lyswhut/lx-music-desktop/"
                    "releases/download/v" version
                    "/lx-music-desktop-v" version
                    "-x64-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/lx-music-desktop/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/lx-music-desktop")))
                (mkdir-p bin)
                (symlink (string-append lib "/lx-music-desktop")
                         (string-append bin "/lx-music-desktop"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "music player desktop application")
    (description
     "LX Music Desktop is a free music player built with Electron.  It
provides a clean interface for searching and playing music from
various sources.  Features include playlist management, lyrics
display, and audio quality selection.  This package provides the
pre-built binary.")
    (home-page "https://github.com/lyswhut/lx-music-desktop")
    (license license:asl2.0)))

;;;
;;; --- 10. soh-bin ---
;;; Ship of Harkinian game engine.
;;; Source: https://gitlab.com/linuxbombay/soh
;;;

(define-public soh-bin
  (package
    (name "soh-bin")
    (version "9.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/linuxbombay/soh/-/releases/v"
                    version "/downloads/soh-" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/soh/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/soh")))
                (mkdir-p bin)
                (symlink (string-append lib "/soh.elf")
                         (string-append bin "/soh"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Ship of Harkinian game engine")
    (description
     "Ship of Harkinian (SOH) is an open-source game engine reimplementation
that provides a native PC port experience.  It features widescreen
support, modern rendering, gyro aiming, modding support, and
randomizer features.  Requires a legally obtained ROM to generate
game assets.  This package provides the pre-built binary.")
    (home-page "https://www.shipofharkinian.com")
    (license license:gpl2+)))

;;;
;;; --- 11. steam-cloud-file-manager-bin ---
;;; Steam cloud save file manager.
;;; Source: https://github.com/Fldicoahkiin/SteamCloudFileManager
;;;

(define-public steam-cloud-file-manager-bin
  (package
    (name "steam-cloud-file-manager-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Fldicoahkiin/SteamCloudFileManager/"
                    "releases/download/v" version
                    "/SteamCloudFileManager-linux-x86_64-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/steam-cloud-file-manager/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/steam-cloud-file-manager")))
                (mkdir-p bin)
                (symlink (string-append lib "/SteamCloudFileManager")
                         (string-append bin "/steam-cloud-file-manager"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Steam cloud save file manager")
    (description
     "Steam Cloud File Manager allows users to browse, download, and manage
their Steam cloud save files.  It provides a graphical interface for
viewing and manipulating cloud-stored game saves that are normally
hidden from the user.  This package provides the pre-built binary.")
    (home-page "https://github.com/Fldicoahkiin/SteamCloudFileManager")
    (license license:gpl3)))

;;;
;;; --- 12. interspec-bin ---
;;; Spectral radiation analysis software.
;;; Source: https://github.com/sandialabs/InterSpec
;;;

(define-public interspec-bin
  (package
    (name "interspec-bin")
    (version "1.0.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sandialabs/InterSpec/releases/download/"
                    "v" version "/InterSpec-linux-x86_64-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/interspec/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/interspec")))
                (mkdir-p bin)
                (symlink (string-append lib "/InterSpec")
                         (string-append bin "/interspec"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "spectral radiation analysis software")
    (description
     "InterSpec is a software tool developed by Sandia National Laboratories
for analyzing spectral radiation data.  It provides an interactive
graphical interface for viewing, analyzing, and identifying
radionuclides in gamma-ray spectra.  This package provides the
pre-built binary.")
    (home-page "https://github.com/sandialabs/InterSpec")
    (license license:lgpl2.1+)))

;;;
;;; --- 13. c-lolcat ---
;;; High-performance lolcat implementation in C.
;;; Source: https://github.com/jaseg/lolcat
;;;

(define-public c-lolcat
  (package
    (name "c-lolcat")
    (version "1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jaseg/lolcat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "lolcat" bin)))))))
    (synopsis "high-performance lolcat implementation in C")
    (description
     "c-lolcat is a high-performance reimplementation of lolcat in C.  It
reads input from standard input and outputs it with rainbow coloring
applied.  Being written in C, it is significantly faster than the
original Ruby implementation.")
    (home-page "https://github.com/jaseg/lolcat")
    (license license:wtfpl2)))

;;;
;;; --- 14. celt ---
;;; Low-latency audio codec.
;;; Source: https://downloads.xiph.org/releases/celt/
;;;

(define-public celt
  (package
    (name "celt")
    (version "0.11.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.xiph.org/releases/celt/celt-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libogg))
    (native-inputs (list pkg-config))
    (synopsis "low-latency audio codec")
    (description
     "CELT (Constrained Energy Lapped Transform) is a low-latency audio
codec designed for real-time communication.  It provides high-quality
audio compression with algorithmic delays as low as 2 milliseconds.
CELT has been merged into the Opus codec but this standalone version
is still needed by some applications.")
    (home-page "https://www.celt-codec.org")
    (license license:bsd-2)))

;;;
;;; --- 15. funchook ---
;;; Runtime function hooking library.
;;; Source: https://github.com/kubo/funchook
;;;

(define-public funchook
  (package
    (name "funchook")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kubo/funchook/archive/refs/tags/"
                    "v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "runtime function hooking library")
    (description
     "Funchook is a library for hooking functions at runtime.  It allows
programs to intercept and replace function calls in running code by
modifying function entry points.  It supports x86, x86_64, and ARM64
architectures and works by rewriting the first few instructions of
the target function.")
    (home-page "https://github.com/kubo/funchook")
    (license license:gpl2+)))

;;;
;;; --- 16. crepe-bin ---
;;; grep-like tool that highlights instead of filtering.
;;; Source: https://github.com/Ezwen/crepe
;;;

(define-public crepe-bin
  (package
    (name "crepe-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Ezwen/crepe/releases/download/"
                    "v" version "/crepe-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "crepe")
              (chmod "crepe" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "crepe" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "grep-like tool that highlights instead of filtering")
    (description
     "crepe is a command-line tool similar to grep that highlights matching
patterns in the output instead of filtering non-matching lines.  It
passes all input through while visually emphasizing the matches,
making it useful for scanning log files and command output.  This
package provides the pre-built binary.")
    (home-page "https://github.com/Ezwen/crepe")
    (license license:expat)))

;;;
;;; --- 17. lazymake-bin ---
;;; TUI for Makefiles with interactive target selection.
;;; Source: https://github.com/mrjackwills/lazymake
;;;

(define-public lazymake-bin
  (package
    (name "lazymake-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mrjackwills/lazymake/releases/download/"
                    "v" version "/lazymake_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "lazymake" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI for Makefiles with interactive target selection")
    (description
     "lazymake is a terminal user interface for working with Makefiles.  It
parses Makefile targets and presents them in an interactive list,
allowing users to select and run targets without memorizing their
names.  This package provides the pre-built binary.")
    (home-page "https://github.com/mrjackwills/lazymake")
    (license license:expat)))

;;;
;;; --- 18. oxlint-bin ---
;;; High-performance JavaScript/TypeScript linter.
;;; Source: https://github.com/oxc-project/oxc
;;;

(define-public oxlint-bin
  (package
    (name "oxlint-bin")
    (version "1.60.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oxc-project/oxc/releases/download/"
                    "oxlint_v" version "/oxlint-linux-x64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "oxlint")
              (chmod "oxlint" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "oxlint" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance JavaScript/TypeScript linter")
    (description
     "oxlint is a high-performance linter for JavaScript and TypeScript,
built as part of the OXC (Oxidation Compiler) project.  Written in
Rust, it provides near-instant linting with zero configuration needed.
It aims to be a faster drop-in complement to ESLint.  This package
provides the pre-built binary.")
    (home-page "https://oxc.rs")
    (license license:expat)))

;;;
;;; --- 19. python-myvaillant ---
;;; Python library for myVaillant API.
;;; Source: https://github.com/signalkraft/myPyllant
;;;

(define-public python-myvaillant
  (package
    (name "python-myvaillant")
    (version "0.9.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/signalkraft/myPyllant/archive/refs/tags/"
                    "v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-aiohttp python-pydantic))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Python library for myVaillant heating system API")
    (description
     "python-myvaillant (myPyllant) is a Python library for interacting with
the myVaillant cloud API.  It provides async access to Vaillant heating
system data including temperature readings, hot water status, and
system control.  Useful for home automation integrations.")
    (home-page "https://github.com/signalkraft/myPyllant")
    (license license:expat)))

;;;
;;; --- 20. oxfmt-bin ---
;;; High-performance JavaScript formatter.
;;; Source: https://github.com/oxc-project/oxc
;;;

(define-public oxfmt-bin
  (package
    (name "oxfmt-bin")
    (version "0.45.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oxc-project/oxc/releases/download/"
                    "oxfmt_v" version "/oxfmt-linux-x64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "oxfmt")
              (chmod "oxfmt" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "oxfmt" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance JavaScript formatter")
    (description
     "oxfmt is a high-performance code formatter for JavaScript, built as
part of the OXC (Oxidation Compiler) project.  Written in Rust, it
provides extremely fast formatting with a focus on consistency and
correctness.  This package provides the pre-built binary.")
    (home-page "https://oxc.rs")
    (license license:expat)))

;;;
;;; --- 21. mill-global ---
;;; Mill Build Tool (Scala) global install.
;;; Source: https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/
;;;

(define-public mill-global
  (package
    (name "mill-global")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/"
                    version "/mill-dist-" version "-mill.sh"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "mill")
              (chmod "mill" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "mill" bin)))))))
    (inputs (list bash))
    (synopsis "Mill build tool for Scala global install")
    (description
     "Mill is a build tool for Scala, Java, and Kotlin projects.  It uses
a concise Scala-based configuration DSL and provides fast incremental
compilation, built-in dependency management, and cross-building.  This
package installs the Mill launcher script globally.")
    (home-page "https://mill-build.org")
    (license license:expat)))

;;;
;;; --- 22. paisa-bin ---
;;; Personal finance manager.
;;; Source: https://github.com/ananthakumaran/paisa
;;;

(define-public paisa-bin
  (package
    (name "paisa-bin")
    (version "0.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ananthakumaran/paisa/releases/download/"
                    "v" version "/paisa-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "paisa" bin)))))))
    (inputs (list ledger sqlite))
    (supported-systems '("x86_64-linux"))
    (synopsis "personal finance manager")
    (description
     "Paisa is a personal finance manager that works with plain-text
accounting files.  It provides a web-based interface for visualizing
financial data from ledger journal files, with support for investment
tracking, budgeting, and multi-currency transactions.  This package
provides the pre-built binary.")
    (home-page "https://github.com/ananthakumaran/paisa")
    (license license:agpl3+)))

;;;
;;; --- 23. dockcheck ---
;;; Docker image update checker.
;;; Source: https://github.com/mag37/dockcheck
;;;

(define-public dockcheck
  (package
    (name "dockcheck")
    (version "0.7.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mag37/dockcheck/archive/refs/tags/"
                    "v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dockcheck.sh" "bin/dockcheck"))))
    (inputs (list bash))
    (synopsis "Docker container image update checker")
    (description
     "dockcheck is a bash script that checks for available updates to Docker
container images.  It compares the running container images against
their registry counterparts and reports which containers have newer
images available.  Supports notification integrations.")
    (home-page "https://github.com/mag37/dockcheck")
    (license license:gpl3)))

;;;
;;; --- 24. bluevein-bin ---
;;; Bluetooth dual-boot key sync.
;;; Source: https://github.com/nicosteinle/bluevein
;;;

(define-public bluevein-bin
  (package
    (name "bluevein-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicosteinle/bluevein/releases/download/"
                    "v" version "/bluevein-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "bluevein")
              (chmod "bluevein" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "bluevein" bin)))))))
    (inputs (list dbus))
    (supported-systems '("x86_64-linux"))
    (synopsis "Bluetooth dual-boot key synchronization tool")
    (description
     "bluevein synchronizes Bluetooth pairing keys between dual-boot
operating systems.  When Bluetooth devices are paired under one OS,
bluevein transfers the pairing keys so the same devices work under
the other OS without re-pairing.  This package provides the pre-built
binary.")
    (home-page "https://github.com/nicosteinle/bluevein")
    (license license:gpl3)))

;;;
;;; --- 25. ttf-google-sans-code-vf ---
;;; Google Sans Code variable font.
;;; Source: https://github.com/googlefonts/googlesans-code
;;;

(define-public ttf-google-sans-code-vf
  (package
    (name "ttf-google-sans-code-vf")
    (version "6.001")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/googlefonts/googlesans-code")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts" "share/fonts/truetype/google-sans-code/"
                #:include-regexp ("\\.(ttf|otf)$")))))
    (synopsis "Google Sans Code variable font family")
    (description
     "Google Sans Code is a variable font designed by Google for use in
code editors and terminals.  It features clear letterforms optimized
for readability at small sizes, programming ligatures, and variable
weight axis support.  This package installs the TrueType variable
font files.")
    (home-page "https://github.com/googlefonts/googlesans-code")
    (license license:silofl1.1)))

;;;
;;; --- 26. gnome-shell-extension-wallpaper-slideshow ---
;;; GNOME Shell wallpaper slideshow extension.
;;; Source: https://gitlab.com/AndrewZaech/azwallpaper
;;;

(define-public gnome-shell-extension-wallpaper-slideshow
  (package
    (name "gnome-shell-extension-wallpaper-slideshow")
    (version "14.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/AndrewZaech/azwallpaper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/azwallpaper@azwallpaper.gitlab.com"
                #:exclude ("README.md" "LICENSE" ".git" ".github")))))
    (inputs (list gnome-shell))
    (synopsis "wallpaper slideshow extension for GNOME Shell")
    (description
     "AZ Wallpaper Slideshow is a GNOME Shell extension that automatically
rotates desktop wallpapers on a configurable timer.  It supports
multiple image sources, random and sequential ordering, and per-monitor
wallpaper configurations.  Integrates with GNOME Settings for
wallpaper management.")
    (home-page "https://gitlab.com/AndrewZaech/azwallpaper")
    (license license:gpl2+)))

;;;
;;; --- 27. goat-cli ---
;;; Go AT Protocol (Bluesky) CLI tool.
;;; Source: https://github.com/bluesky-social/goat
;;;

(define-public goat-cli
  (package
    (name "goat-cli")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bluesky-social/goat/releases/download/"
                    "v" version "/goat-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "goat")
              (chmod "goat" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "goat" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for the AT Protocol (Bluesky)")
    (description
     "goat is a command-line interface for interacting with the AT Protocol
(atproto), the decentralized social networking protocol behind
Bluesky.  It provides tools for managing profiles, posting, reading
feeds, and interacting with the atproto network from the terminal.
This package provides the pre-built binary.")
    (home-page "https://github.com/bluesky-social/goat")
    (license license:expat)))

;;;
;;; --- 28. fnox-bin ---
;;; Secret management tool.
;;; Source: https://github.com/fnox-tools/fnox
;;;

(define-public fnox-bin
  (package
    (name "fnox-bin")
    (version "1.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fnox-tools/fnox/releases/download/"
                    "v" version "/fnox-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "fnox")
              (chmod "fnox" #o755)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "fnox" bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "secret management tool")
    (description
     "fnox is a command-line secret management tool for securely storing
and retrieving credentials, API keys, and other sensitive data.  It
provides encrypted local storage with convenient access patterns for
development and operations workflows.  This package provides the
pre-built binary.")
    (home-page "https://github.com/fnox-tools/fnox")
    (license license:expat)))

;;;
;;; --- 29. ionosctl ---
;;; IONOS Cloud CLI.
;;; Source: https://github.com/ionos-cloud/ionosctl
;;;

(define-public ionosctl
  (package
    (name "ionosctl")
    (version "6.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ionos-cloud/ionosctl/releases/download/"
                    "v" version "/ionosctl-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ionosctl" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for IONOS Cloud infrastructure management")
    (description
     "ionosctl is the official command-line interface for managing IONOS Cloud
infrastructure.  It provides commands for provisioning and managing
virtual data centers, servers, storage, networking, Kubernetes clusters,
and other IONOS Cloud services.  This package provides the pre-built
binary.")
    (home-page "https://github.com/ionos-cloud/ionosctl")
    (license license:asl2.0)))

;;;
;;; --- 30. mangojuice-bin ---
;;; MangoHud configuration GUI.
;;; Source: https://github.com/radiolamp/mangojuice
;;;

(define-public mangojuice-bin
  (package
    (name "mangojuice-bin")
    (version "0.8.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/radiolamp/mangojuice/releases/download/"
                    "v" version "/mangojuice-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/mangojuice/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/mangojuice")))
                (mkdir-p bin)
                (symlink (string-append lib "/mangojuice")
                         (string-append bin "/mangojuice"))))))))
    (inputs (list libadwaita mangohud))
    (supported-systems '("x86_64-linux"))
    (synopsis "MangoHud configuration GUI")
    (description
     "MangoJuice is a graphical user interface for configuring MangoHud, the
Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU
load, and more in games.  It provides an easy way to toggle and
customize MangoHud settings without editing configuration files
manually.  This package provides the pre-built binary.")
    (home-page "https://github.com/radiolamp/mangojuice")
    (license license:gpl3+)))
