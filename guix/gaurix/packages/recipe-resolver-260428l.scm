;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428l
;;; Resolves 100 packages from queue (97 recipes, 3 blocked).
;;; Groups: CLI tools & utilities (28), binary packages (22),
;;;         fonts & themes (15), Python libraries (8), desktop apps (12),
;;;         development tools (12).
;;;
;;; BLOCKED (3):
;;;   fcitx5-lotus-openrc-git -> TOOLING_FAILURE (OpenRC init system)
;;;   fcitx5-lotus-runit-git -> TOOLING_FAILURE (runit init system)
;;;   intel-level-zero-raytracing-support -> DEP_RESOLUTION_FAILED (Intel L0 runtime)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages recipe-resolver-260428l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:export (
            veloren
            thunderbird-beta
            opendrop-git
            pantheon-polkit-agent-git
            mailspring
            paperde
            scratch-everywhere
            yt-dlp-getpot-wpc-git
            signal-cli-native
            sigtop-git
            timg-git
            unrarall-git
            godot-mono-beta-bin
            adguard-cli-nightly-bin
            aerothemeplasma-icons-git
            aerothemeplasma-sounds-git
            arrpc-bun
            bynfont
            catppuccinifier-gui-bin
            chatterino2-7tv-native-git
            citron-neo-git
            deletor
            desktopimage
            devilutionx-mpq-tools-git
            discord-history-tracker-bin
            download-guardian
            dwarf2json-git
            easyeffects-jtrv-presets-git
            easyeffects-record
            flow-control-nightly-bin
            fount-bin
            ghidra-mcp
            gnome-shell-extension-xwayland-indicator
            goat-cli-bin
            goat-cli-git
            gotohp-bin
            gotohp-git
            gruvbox-wallpaper
            hfdownloader
            hn-bin
            inconsolata-psf-git
            kick-talk-git
            memtier-benchmark
            mic-indicator
            mise-git
            moonlight-cli
            nerdfetch-git
            niri-autostart
            niri-autostart-bin
            ntttcp-for-linux-git
            obsidianirc-bin
            openscreen-bin
            otaripper-bin
            papirus-paleorange-icon-theme
            patched-mullvad-vpn-daemon-bin
            pcf-profont-powerline
            pcf-spectrum-berry
            pcf-unifont
            pcf-unifont-extra
            peguni-draem-la
            pgp2ssh-git
            play-timer-git
            plezy-bin
            power-options-gtk
            psf-envypn
            python-backports
            python-events
            python-mmh3
            python-oracledb
            python-peewee-migrate
            python-pinecone
            python-sqlcipher3
            python-wget
            qsort
            qt5ct-refresh-git
            qtcreator-qodeassist-plugin
            quickemu-rs
            rainbowfetch
            sdl-gamecontrollerdb-git
            slit-git
            spr-bin
            starfish
            streamlink-handoff-host
            uniextract2
            vanish
            waveterm-vis
            wpets
            xdg-desktop-portal-rs
            xsg-fonts-bdf
            xsg-fonts-otb
            xsg-fonts-pcf
            zmusic-git
            mine-core-bin
            dotenv-sync-bin
            libastal-lua54-git
            nyarchassistant
            ghostty-git-zen3
            ))

;;; Non-free license helper (for proprietary binary packages)
(define license:nonfree
  (lambda (uri)
    ((@@ (guix licenses) license) "nonfree"
      uri
      "Nonfree license; package included for user convenience.")))

;;; veloren --- open-world multiplayer voxel RPG
(define-public veloren
  (package
    (name "veloren")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/veloren.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-world multiplayer voxel RPG")
    (description "Veloren is an open-world, open-source multiplayer voxel RPG.  The game takes inspiration from titles such as Cube World, Legend of Zelda: Breath of the Wild, Dwarf Fortress, and Minecraft.")
    (home-page "https://aur.archlinux.org/packages/veloren")
    (license license:gpl3+)))

;;; thunderbird-beta --- beta version of Mozilla Thunderbird mail client
(define-public thunderbird-beta
  (package
    (name "thunderbird-beta")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thunderbird-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "beta version of Mozilla Thunderbird mail client")
    (description "Beta version of the standalone mail and news reader from Mozilla.  Thunderbird is a free and open source email, newsfeed, chat, and calendaring client.")
    (home-page "https://aur.archlinux.org/packages/thunderbird-beta")
    (license license:mpl2.0)))

;;; opendrop-git --- open source AirDrop implementation
(define-public opendrop-git
  (package
    (name "opendrop-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opendrop-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source AirDrop implementation")
    (description "OpenDrop is an open source implementation of the Apple AirDrop protocol, enabling wireless file transfer between devices.")
    (home-page "https://aur.archlinux.org/packages/opendrop-git")
    (license license:gpl3+)))

;;; pantheon-polkit-agent-git --- Pantheon polkit authentication agent
(define-public pantheon-polkit-agent-git
  (package
    (name "pantheon-polkit-agent-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pantheon-polkit-agent-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Pantheon polkit authentication agent")
    (description "Pantheon Polkit Agent is a polkit authentication agent designed for the Pantheon desktop environment from elementary OS.")
    (home-page "https://aur.archlinux.org/packages/pantheon-polkit-agent-git")
    (license license:gpl3+)))

;;; mailspring --- beautiful and fast email client
(define-public mailspring
  (package
    (name "mailspring")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mailspring.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "beautiful and fast email client")
    (description "Mailspring is a beautiful, fast and maintained fork of Nylas Mail, providing a modern email client experience with support for multiple accounts.")
    (home-page "https://aur.archlinux.org/packages/mailspring")
    (license license:gpl3+)))

;;; paperde --- desktop environment built on Qt and Wayfire
(define-public paperde
  (package
    (name "paperde")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paperde.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop environment built on Qt and Wayfire")
    (description "PaperDE is a desktop environment built on top of Qt and Wayfire compositor, providing a lightweight and modern Wayland desktop experience.")
    (home-page "https://aur.archlinux.org/packages/paperde")
    (license license:gpl3+)))

;;; scratch-everywhere --- custom Scratch runtime written in C++
(define-public scratch-everywhere
  (package
    (name "scratch-everywhere")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scratch-everywhere.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "custom Scratch runtime written in C++")
    (description "Scratch Everywhere is a custom Scratch runtime written in C++, allowing Scratch projects to run natively on Linux without a browser.")
    (home-page "https://aur.archlinux.org/packages/scratch-everywhere")
    (license license:gpl3+)))

;;; yt-dlp-getpot-wpc-git --- PO token provider plugin for yt-dlp
(define-public yt-dlp-getpot-wpc-git
  (package
    (name "yt-dlp-getpot-wpc-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yt-dlp-getpot-wpc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PO token provider plugin for yt-dlp")
    (description "An experimental PO Token Provider for yt-dlp that uses the browser to mint tokens, helping bypass certain download restrictions.")
    (home-page "https://aur.archlinux.org/packages/yt-dlp-getpot-wpc-git")
    (license license:gpl3+)))

;;; signal-cli-native --- command-line interface for Signal messaging
(define-public signal-cli-native
  (package
    (name "signal-cli-native")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/signal-cli-native.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "command-line interface for Signal messaging")
    (description "Signal-cli-native provides a command-line interface for the Signal private messenger, compiled as a GraalVM native image for fast startup.")
    (home-page "https://aur.archlinux.org/packages/signal-cli-native")
    (license license:gpl3+)))

;;; sigtop-git --- export messages from Signal Desktop
(define-public sigtop-git
  (package
    (name "sigtop-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sigtop-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "export messages from Signal Desktop")
    (description "Sigtop exports messages and other data from the Signal Desktop application for backup or analysis purposes.")
    (home-page "https://aur.archlinux.org/packages/sigtop-git")
    (license license:isc)))

;;; timg-git --- terminal image and video viewer
(define-public timg-git
  (package
    (name "timg-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/timg-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal image and video viewer")
    (description "Timg is a terminal image and video viewer that displays images and plays videos directly in the terminal using various output methods.")
    (home-page "https://aur.archlinux.org/packages/timg-git")
    (license license:gpl2+)))

;;; unrarall-git --- utility to unrar and clean up files
(define-public unrarall-git
  (package
    (name "unrarall-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unrarall-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to unrar and clean up files")
    (description "Unrarall is a utility to unrar and clean up various files, recursively extracting rar archives from directories.")
    (home-page "https://aur.archlinux.org/packages/unrarall-git")
    (license license:gpl3+)))

;;; godot-mono-beta-bin --- advanced 2D and 3D game engine with C# support
(define-public godot-mono-beta-bin
  (package
    (name "godot-mono-beta-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/godot-mono-beta-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "advanced 2D and 3D game engine with C# support")
    (description "Godot Engine is an advanced, feature-packed, multi-platform 2D and 3D open-source game engine.  This beta version includes C# scripting support via Mono.")
    (home-page "https://aur.archlinux.org/packages/godot-mono-beta-bin")
    (license license:expat)))

;;; adguard-cli-nightly-bin --- command-line ad and tracker blocker
(define-public adguard-cli-nightly-bin
  (package
    (name "adguard-cli-nightly-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adguard-cli-nightly-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "command-line ad and tracker blocker")
    (description "AdGuard CLI is a command-line tool to protect against ads, trackers, and malicious websites at the system level.")
    (home-page "https://aur.archlinux.org/packages/adguard-cli-nightly-bin")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; aerothemeplasma-icons-git --- icon theme for AeroThemePlasma
(define-public aerothemeplasma-icons-git
  (package
    (name "aerothemeplasma-icons-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aerothemeplasma-icons-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "icon theme for AeroThemePlasma")
    (description "Icon theme designed to complement the AeroThemePlasma desktop theme, providing Windows Aero-style icons for KDE Plasma.")
    (home-page "https://aur.archlinux.org/packages/aerothemeplasma-icons-git")
    (license license:gpl3+)))

;;; aerothemeplasma-sounds-git --- sound themes for AeroThemePlasma
(define-public aerothemeplasma-sounds-git
  (package
    (name "aerothemeplasma-sounds-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aerothemeplasma-sounds-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "sound themes for AeroThemePlasma")
    (description "Collection of sound themes designed for AeroThemePlasma, providing Windows-style sound effects for the KDE Plasma desktop.")
    (home-page "https://aur.archlinux.org/packages/aerothemeplasma-sounds-git")
    (license license:gpl3+)))

;;; arrpc-bun --- open Discord RPC server using Bun
(define-public arrpc-bun
  (package
    (name "arrpc-bun")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arrpc-bun.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Discord RPC server using Bun")
    (description "arRPC-Bun is a TypeScript/Bun port of arRPC, providing an open Discord Rich Presence server for third-party Discord clients.")
    (home-page "https://aur.archlinux.org/packages/arrpc-bun")
    (license license:expat)))

;;; bynfont --- bitmap font combining best features of other fonts
(define-public bynfont
  (package
    (name "bynfont")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bynfont.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "bitmap font combining best features of other fonts")
    (description "Bynfont is a bitmap font for the Linux console that combines the best features of several popular console fonts.")
    (home-page "https://aur.archlinux.org/packages/bynfont")
    (license license:gpl2+)))

;;; catppuccinifier-gui-bin --- GUI tool to apply Catppuccin color scheme to images
(define-public catppuccinifier-gui-bin
  (package
    (name "catppuccinifier-gui-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/catppuccinifier-gui-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "GUI tool to apply Catppuccin color scheme to images")
    (description "Catppuccinifier GUI applies the Catppuccin color palette to images, converting them to match the popular pastel color scheme.")
    (home-page "https://aur.archlinux.org/packages/catppuccinifier-gui-bin")
    (license license:expat)))

;;; chatterino2-7tv-native-git --- Chatterino2 fork with 7tv emote support
(define-public chatterino2-7tv-native-git
  (package
    (name "chatterino2-7tv-native-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chatterino2-7tv-native-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Chatterino2 fork with 7tv emote support")
    (description "Chatterino2 fork with support for 7tv emotes, patched to use native system Qt style for better desktop integration.")
    (home-page "https://aur.archlinux.org/packages/chatterino2-7tv-native-git")
    (license license:expat)))

;;; citron-neo-git --- Nintendo Switch emulator fork
(define-public citron-neo-git
  (package
    (name "citron-neo-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/citron-neo-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Nintendo Switch emulator fork")
    (description "Citron Neo is a Nintendo Switch emulator fork focused on compatibility and performance improvements for running Switch games on Linux.")
    (home-page "https://aur.archlinux.org/packages/citron-neo-git")
    (license license:gpl3+)))

;;; deletor --- interactive TUI file deletion manager
(define-public deletor
  (package
    (name "deletor")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deletor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive TUI file deletion manager")
    (description "Deletor lets you manage and delete files efficiently with an interactive TUI and scriptable CLI, providing safe bulk file operations.")
    (home-page "https://aur.archlinux.org/packages/deletor")
    (license license:expat)))

;;; desktopimage --- desktop file generator for AppImage applications
(define-public desktopimage
  (package
    (name "desktopimage")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/desktopimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop file generator for AppImage applications")
    (description "DesktopImage is a tool to automatically generate @file{.desktop} files for AppImage applications, simplifying AppImage integration with the desktop.")
    (home-page "https://aur.archlinux.org/packages/desktopimage")
    (license license:expat)))

;;; devilutionx-mpq-tools-git --- DevilutionX MPQ minifier tool
(define-public devilutionx-mpq-tools-git
  (package
    (name "devilutionx-mpq-tools-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devilutionx-mpq-tools-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DevilutionX MPQ minifier tool")
    (description "DevilutionX MPQ Tools provides utilities for working with MPQ archives used by DevilutionX, an open-source Diablo engine.")
    (home-page "https://aur.archlinux.org/packages/devilutionx-mpq-tools-git")
    (license license:unlicense)))

;;; discord-history-tracker-bin --- Discord chat history archiver and viewer
(define-public discord-history-tracker-bin
  (package
    (name "discord-history-tracker-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/discord-history-tracker-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "Discord chat history archiver and viewer")
    (description "Discord History Tracker saves Discord chat history into a file and provides an offline viewer for browsing saved conversations.")
    (home-page "https://aur.archlinux.org/packages/discord-history-tracker-bin")
    (license license:expat)))

;;; download-guardian --- download folder scanning service
(define-public download-guardian
  (package
    (name "download-guardian")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/download-guardian.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "download folder scanning service")
    (description "Download Guardian is a user-level lightweight service that watches the Downloads folder and prompts to scan new files and folders for safety.")
    (home-page "https://aur.archlinux.org/packages/download-guardian")
    (license license:gpl3+)))

;;; dwarf2json-git --- DWARF debug info to Volatility3 JSON converter
(define-public dwarf2json-git
  (package
    (name "dwarf2json-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dwarf2json-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DWARF debug info to Volatility3 JSON converter")
    (description "Dwarf2json processes files containing symbol and type information to generate Volatility3 Intermediate Symbol File (ISF) JSON output.")
    (home-page "https://aur.archlinux.org/packages/dwarf2json-git")
    (license license:gpl2+)))

;;; easyeffects-jtrv-presets-git --- community presets for EasyEffects
(define-public easyeffects-jtrv-presets-git
  (package
    (name "easyeffects-jtrv-presets-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/easyeffects-jtrv-presets-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "community presets for EasyEffects")
    (description "Community presets for EasyEffects providing NPR-like tuning for masculine voices and noise reduction settings.")
    (home-page "https://aur.archlinux.org/packages/easyeffects-jtrv-presets-git")
    (license license:gpl3+)))

;;; easyeffects-record --- automated recorder for EasyEffects
(define-public easyeffects-record
  (package
    (name "easyeffects-record")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/easyeffects-record.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automated recorder for EasyEffects")
    (description "Automated player and recorder for EasyEffects, allowing re-recording songs with applied audio effects.")
    (home-page "https://aur.archlinux.org/packages/easyeffects-record")
    (license license:gpl3+)))

;;; flow-control-nightly-bin --- programmer's text editor
(define-public flow-control-nightly-bin
  (package
    (name "flow-control-nightly-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flow-control-nightly-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "programmer's text editor")
    (description "Flow Control is a programmer's text editor focused on providing a clean and efficient editing experience.")
    (home-page "https://aur.archlinux.org/packages/flow-control-nightly-bin")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; fount-bin --- terminal-based Fountain screenplay editor
(define-public fount-bin
  (package
    (name "fount-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fount-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "terminal-based Fountain screenplay editor")
    (description "Fount is a terminal-based screenplay editor supporting the Fountain markup language for writing screenplays.")
    (home-page "https://aur.archlinux.org/packages/fount-bin")
    (license license:expat)))

;;; ghidra-mcp --- Model Context Protocol server for Ghidra
(define-public ghidra-mcp
  (package
    (name "ghidra-mcp")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghidra-mcp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Model Context Protocol server for Ghidra")
    (description "Ghidra MCP provides a production-ready Model Context Protocol server for the Ghidra reverse engineering platform, enabling AI-assisted analysis.")
    (home-page "https://aur.archlinux.org/packages/ghidra-mcp")
    (license license:asl2.0)))

;;; gnome-shell-extension-xwayland-indicator --- XWayland window indicator for GNOME
(define-public gnome-shell-extension-xwayland-indicator
  (package
    (name "gnome-shell-extension-xwayland-indicator")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-xwayland-indicator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "XWayland window indicator for GNOME")
    (description "GNOME Shell extension that indicates whether a window in GNOME is running under XWayland or native Wayland.")
    (home-page "https://aur.archlinux.org/packages/gnome-shell-extension-xwayland-indicator")
    (license license:gpl3+)))

;;; goat-cli-bin --- AT Protocol CLI tool written in Go
(define-public goat-cli-bin
  (package
    (name "goat-cli-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goat-cli-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "AT Protocol CLI tool written in Go")
    (description "Goat CLI is a command-line tool for interacting with the AT Protocol (Bluesky), written in Go.")
    (home-page "https://aur.archlinux.org/packages/goat-cli-bin")
    (license license:expat)))

;;; goat-cli-git --- AT Protocol CLI tool written in Go
(define-public goat-cli-git
  (package
    (name "goat-cli-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goat-cli-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AT Protocol CLI tool written in Go")
    (description "Goat CLI is a command-line tool for interacting with the AT Protocol (Bluesky), built from the latest git source.")
    (home-page "https://aur.archlinux.org/packages/goat-cli-git")
    (license license:expat)))

;;; gotohp-bin --- unofficial Google Photos desktop client
(define-public gotohp-bin
  (package
    (name "gotohp-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gotohp-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "unofficial Google Photos desktop client")
    (description "GotoHP is an unofficial Google Photos desktop GUI client for browsing and managing photos.")
    (home-page "https://aur.archlinux.org/packages/gotohp-bin")
    (license license:expat)))

;;; gotohp-git --- unofficial Google Photos desktop client
(define-public gotohp-git
  (package
    (name "gotohp-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gotohp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial Google Photos desktop client")
    (description "GotoHP is an unofficial Google Photos desktop GUI client, built from the latest git source.")
    (home-page "https://aur.archlinux.org/packages/gotohp-git")
    (license license:expat)))

;;; gruvbox-wallpaper --- Gruvbox-themed wallpaper for Linux
(define-public gruvbox-wallpaper
  (package
    (name "gruvbox-wallpaper")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gruvbox-wallpaper.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "Gruvbox-themed wallpaper for Linux")
    (description "Gruvbox Stripes wallpaper for Linux desktops, featuring the popular Gruvbox color scheme.")
    (home-page "https://aur.archlinux.org/packages/gruvbox-wallpaper")
    (license license:cc0)))

;;; hfdownloader --- HuggingFace model and dataset downloader
(define-public hfdownloader
  (package
    (name "hfdownloader")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hfdownloader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "HuggingFace model and dataset downloader")
    (description "HFDownloader is a simple Go utility to download models and datasets from HuggingFace repositories.")
    (home-page "https://aur.archlinux.org/packages/hfdownloader")
    (license license:expat)))

;;; hn-bin --- blazing fast Hacker News CLI
(define-public hn-bin
  (package
    (name "hn-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hn-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "blazing fast Hacker News CLI")
    (description "HN is a blazing fast, terminal-based Hacker News reader with a TUI interface for browsing stories and comments.")
    (home-page "https://aur.archlinux.org/packages/hn-bin")
    (license license:expat)))

;;; inconsolata-psf-git --- Inconsolata fonts in PSF format
(define-public inconsolata-psf-git
  (package
    (name "inconsolata-psf-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/inconsolata-psf-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "Inconsolata fonts in PSF format")
    (description "Inconsolata fonts converted to PSF format for use in the Linux console framebuffer.")
    (home-page "https://aur.archlinux.org/packages/inconsolata-psf-git")
    (license license:silofl1.1)))

;;; kick-talk-git --- Electron-based Kick chat client
(define-public kick-talk-git
  (package
    (name "kick-talk-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kick-talk-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Electron-based Kick chat client")
    (description "Kick Talk is a chat client for the Kick streaming platform, built with Electron and configured to use system-wide Electron.")
    (home-page "https://aur.archlinux.org/packages/kick-talk-git")
    (license license:expat)))

;;; memtier_benchmark --- Redis and Memcached benchmarking tool
(define-public memtier-benchmark
  (package
    (name "memtier_benchmark")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/memtier_benchmark.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Redis and Memcached benchmarking tool")
    (description "Memtier Benchmark is a traffic generation and benchmarking tool for Redis and Memcached, supporting various testing scenarios.")
    (home-page "https://aur.archlinux.org/packages/memtier-benchmark")
    (license license:gpl2+)))

;;; mic-indicator --- PipeWire microphone tray indicator
(define-public mic-indicator
  (package
    (name "mic-indicator")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mic-indicator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PipeWire microphone tray indicator")
    (description "Mic Indicator is a system tray indicator for PipeWire that shows microphone activity status.")
    (home-page "https://aur.archlinux.org/packages/mic-indicator")
    (license license:gpl3+)))

;;; mise-git --- development environment manager
(define-public mise-git
  (package
    (name "mise-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mise-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "development environment manager")
    (description "Mise (formerly rtx) is a polyglot tool version manager and task runner, serving as the front-end to your development environment.")
    (home-page "https://aur.archlinux.org/packages/mise-git")
    (license license:expat)))

;;; moonlight-cli --- Discord mod installer CLI
(define-public moonlight-cli
  (package
    (name "moonlight-cli")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/moonlight-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Discord mod installer CLI")
    (description "Moonlight CLI is a command-line tool to install Moonlight, a Discord client modification.")
    (home-page "https://aur.archlinux.org/packages/moonlight-cli")
    (license license:expat)))

;;; nerdfetch-git --- POSIX system info fetch using Nerd Fonts
(define-public nerdfetch-git
  (package
    (name "nerdfetch-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nerdfetch-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "POSIX system info fetch using Nerd Fonts")
    (description "Nerdfetch is a POSIX-compliant system information fetch script using Nerd Font icons for display.")
    (home-page "https://aur.archlinux.org/packages/nerdfetch-git")
    (license license:expat)))

;;; niri-autostart --- declarative autostart for niri compositor
(define-public niri-autostart
  (package
    (name "niri-autostart")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/niri-autostart.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "declarative autostart for niri compositor")
    (description "Niri Autostart provides declarative autostart and layout restoration for the niri Wayland compositor.")
    (home-page "https://aur.archlinux.org/packages/niri-autostart")
    (license license:gpl3+)))

;;; niri-autostart-bin --- declarative autostart for niri compositor
(define-public niri-autostart-bin
  (package
    (name "niri-autostart-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/niri-autostart-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "declarative autostart for niri compositor")
    (description "Niri Autostart provides declarative autostart and layout restoration for the niri Wayland compositor.  This is the prebuilt binary version.")
    (home-page "https://aur.archlinux.org/packages/niri-autostart-bin")
    (license license:gpl3+)))

;;; ntttcp-for-linux-git --- multi-threaded network throughput benchmark
(define-public ntttcp-for-linux-git
  (package
    (name "ntttcp-for-linux-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ntttcp-for-linux-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-threaded network throughput benchmark")
    (description "NTTTCP for Linux is a multi-threaded network throughput benchmark tool, useful for measuring TCP and UDP performance.")
    (home-page "https://aur.archlinux.org/packages/ntttcp-for-linux-git")
    (license license:expat)))

;;; obsidianirc-bin --- modern IRC client with IRCv3 support
(define-public obsidianirc-bin
  (package
    (name "obsidianirc-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obsidianirc-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "modern IRC client with IRCv3 support")
    (description "ObsidianIRC is a modern IRC client with extensive IRCv3 support, providing a contemporary chat experience.")
    (home-page "https://aur.archlinux.org/packages/obsidianirc-bin")
    (license license:gpl3+)))

;;; openscreen-bin --- open-source screen recording tool
(define-public openscreen-bin
  (package
    (name "openscreen-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openscreen-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "open-source screen recording tool")
    (description "OpenScreen creates stunning screen recordings for free.  It is open-source with no subscriptions, watermarks, and free for commercial use.")
    (home-page "https://aur.archlinux.org/packages/openscreen-bin")
    (license license:expat)))

;;; otaripper-bin --- Android OTA partition extractor
(define-public otaripper-bin
  (package
    (name "otaripper-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otaripper-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "Android OTA partition extractor")
    (description "OTARipper is an ultra-fast partition extractor for Android OTA (Over-The-Air) update files.")
    (home-page "https://aur.archlinux.org/packages/otaripper-bin")
    (license license:expat)))

;;; papirus-paleorange-icon-theme --- Papirus icon theme in pale orange color
(define-public papirus-paleorange-icon-theme
  (package
    (name "papirus-paleorange-icon-theme")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/papirus-paleorange-icon-theme.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "Papirus icon theme in pale orange color")
    (description "Papirus-Paleorange is a color variant of the Papirus icon theme featuring a pale orange accent color.")
    (home-page "https://aur.archlinux.org/packages/papirus-paleorange-icon-theme")
    (license license:gpl3+)))

;;; patched-mullvad-vpn-daemon-bin --- patched Mullvad VPN daemon with split-tunneling
(define-public patched-mullvad-vpn-daemon-bin
  (package
    (name "patched-mullvad-vpn-daemon-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/patched-mullvad-vpn-daemon-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "patched Mullvad VPN daemon with split-tunneling")
    (description "Mullvad VPN daemon and CLI patched with IP range and Netbird/Tailscale split-tunneling support.")
    (home-page "https://aur.archlinux.org/packages/patched-mullvad-vpn-daemon-bin")
    (license license:gpl3+)))

;;; pcf-profont-powerline --- ProFont bitmap font with Powerline glyphs
(define-public pcf-profont-powerline
  (package
    (name "pcf-profont-powerline")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pcf-profont-powerline.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "ProFont bitmap font with Powerline glyphs")
    (description "ProFont is a small bitmap font for programming, patched to include Powerline symbols for terminal status lines.")
    (home-page "https://aur.archlinux.org/packages/pcf-profont-powerline")
    (license license:expat)))

;;; pcf-spectrum-berry --- small monospaced bitmap PCF font
(define-public pcf-spectrum-berry
  (package
    (name "pcf-spectrum-berry")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pcf-spectrum-berry.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "small monospaced bitmap PCF font")
    (description "Spectrum Berry is a small monospaced bitmap PCF font designed for terminal use.")
    (home-page "https://aur.archlinux.org/packages/pcf-spectrum-berry")
    (license license:expat)))

;;; pcf-unifont --- GNU Unifont glyphs in PCF format
(define-public pcf-unifont
  (package
    (name "pcf-unifont")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pcf-unifont.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "GNU Unifont glyphs in PCF format")
    (description "GNU Unifont provides a complete set of Unicode glyphs in PCF bitmap font format, covering the Basic Multilingual Plane.")
    (home-page "https://aur.archlinux.org/packages/pcf-unifont")
    (license license:gpl2+)))

;;; pcf-unifont-extra --- GNU Unifont extra styles in PCF format
(define-public pcf-unifont-extra
  (package
    (name "pcf-unifont-extra")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pcf-unifont-extra.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "GNU Unifont extra styles in PCF format")
    (description "GNU Unifont extra styles (bold and italic) in PCF bitmap font format.")
    (home-page "https://aur.archlinux.org/packages/pcf-unifont-extra")
    (license license:gpl2+)))

;;; peguni-draem-la --- text-based virtual pet simulator in Lua
(define-public peguni-draem-la
  (package
    (name "peguni_draem-la")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/peguni_draem-la.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "text-based virtual pet simulator in Lua")
    (description "Peguni Draem'la: Whispered Companion is a text-based virtual pet simulator written in Lua.")
    (home-page "https://aur.archlinux.org/packages/peguni-draem-la")
    (license license:expat)))

;;; pgp2ssh-git --- PGP to SSH key converter
(define-public pgp2ssh-git
  (package
    (name "pgp2ssh-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pgp2ssh-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PGP to SSH key converter")
    (description "Pgp2ssh converts PGP/GPG private keys to SSH private keys for use with OpenSSH.")
    (home-page "https://aur.archlinux.org/packages/pgp2ssh-git")
    (license license:gpl3+)))

;;; play-timer-git --- CLI timer app with desktop integration
(define-public play-timer-git
  (package
    (name "play-timer-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/play-timer-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI timer app with desktop integration")
    (description "Play Timer is a CLI-friendly easy-to-use timer application with native desktop environment integration.")
    (home-page "https://aur.archlinux.org/packages/play-timer-git")
    (license license:expat)))

;;; plezy-bin --- Plex media server client built with Flutter
(define-public plezy-bin
  (package
    (name "plezy-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plezy-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "Plex media server client built with Flutter")
    (description "Plezy is a beautiful Plex media server client built with Flutter for browsing and streaming media.")
    (home-page "https://aur.archlinux.org/packages/plezy-bin")
    (license license:expat)))

;;; power-options-gtk --- GTK frontend for power management
(define-public power-options-gtk
  (package
    (name "power-options-gtk")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/power-options-gtk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK frontend for power management")
    (description "Power Options GTK is a GTK frontend for managing power options, providing a graphical interface for power management settings.")
    (home-page "https://aur.archlinux.org/packages/power-options-gtk")
    (license license:gpl3+)))

;;; psf-envypn --- readable bitmap font in PSF format
(define-public psf-envypn
  (package
    (name "psf-envypn")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/psf-envypn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "readable bitmap font in PSF format")
    (description "Envypn is a readable bitmap font inspired by Envy Code R, covering ISO 8859-1,2 and Powerline glyphs in PSF console format.")
    (home-page "https://aur.archlinux.org/packages/psf-envypn")
    (license license:expat)))

;;; python-backports --- namespace package for python-backports
(define-public python-backports
  (package
    (name "python-backports")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-backports.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "namespace package for python-backports")
    (description "Common namespace dependency for all python-backports packages, providing the backports namespace for Python backport libraries.")
    (home-page "https://aur.archlinux.org/packages/python-backports")
    (license license:expat)))

;;; python-events --- Python event handling in C# style
(define-public python-events
  (package
    (name "python-events")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-events.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python event handling in C# style")
    (description "Python Events provides C#-style event handling for Python, enabling publisher-subscriber patterns with simple syntax.")
    (home-page "https://aur.archlinux.org/packages/python-events")
    (license license:bsd-3)))

;;; python-mmh3 --- Python MurmurHash3 bindings
(define-public python-mmh3
  (package
    (name "python-mmh3")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-mmh3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python MurmurHash3 bindings")
    (description "Mmh3 is a Python extension for MurmurHash (MurmurHash3), a set of fast and robust non-cryptographic hash functions.")
    (home-page "https://aur.archlinux.org/packages/python-mmh3")
    (license license:cc0)))

;;; python-oracledb --- Python Oracle database driver
(define-public python-oracledb
  (package
    (name "python-oracledb")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-oracledb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python Oracle database driver")
    (description "Python-oracledb is a Python extension module that allows access to Oracle databases, replacing the cx_Oracle driver.")
    (home-page "https://aur.archlinux.org/packages/python-oracledb")
    (license license:asl2.0)))

;;; python-peewee-migrate --- migration engine for Peewee ORM
(define-public python-peewee-migrate
  (package
    (name "python-peewee-migrate")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-peewee-migrate.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "migration engine for Peewee ORM")
    (description "Peewee Migrate is a simple migration engine for the Peewee ORM, providing database schema migration support.")
    (home-page "https://aur.archlinux.org/packages/python-peewee-migrate")
    (license license:expat)))

;;; python-pinecone --- Python Pinecone vector database client
(define-public python-pinecone
  (package
    (name "python-pinecone")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pinecone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python Pinecone vector database client")
    (description "Python Pinecone is the official Python client and SDK for the Pinecone vector database service.")
    (home-page "https://aur.archlinux.org/packages/python-pinecone")
    (license license:asl2.0)))

;;; python-sqlcipher3 --- Python 3 bindings for SQLCipher
(define-public python-sqlcipher3
  (package
    (name "python-sqlcipher3")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-sqlcipher3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python 3 bindings for SQLCipher")
    (description "Python-sqlcipher3 provides Python 3 bindings for SQLCipher, an encrypted SQLite database extension.")
    (home-page "https://aur.archlinux.org/packages/python-sqlcipher3")
    (license license:zlib)))

;;; python-wget --- Python wget implementation
(define-public python-wget
  (package
    (name "python-wget")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-wget.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python wget implementation")
    (description "Python-wget is a pure Python implementation of wget for downloading files from the web.")
    (home-page "https://aur.archlinux.org/packages/python-wget")
    (license license:unlicense)))

;;; qsort --- advanced file sorter
(define-public qsort
  (package
    (name "qsort")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qsort.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced file sorter")
    (description "Qsort is an advanced file sorter for organizing and categorizing files based on configurable rules.")
    (home-page "https://aur.archlinux.org/packages/qsort")
    (license license:gpl3+)))

;;; qt5ct-refresh-git --- utility to refresh qt5ct style settings
(define-public qt5ct-refresh-git
  (package
    (name "qt5ct-refresh-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt5ct-refresh-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to refresh qt5ct style settings")
    (description "Qt5ct-refresh is a simple utility to force-refresh qt5ct style settings without restarting applications.")
    (home-page "https://aur.archlinux.org/packages/qt5ct-refresh-git")
    (license license:bsd-2)))

;;; qtcreator-qodeassist-plugin --- AI coding assistant for Qt Creator
(define-public qtcreator-qodeassist-plugin
  (package
    (name "qtcreator-qodeassist-plugin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qtcreator-qodeassist-plugin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AI coding assistant for Qt Creator")
    (description "QodeAssist is an AI-powered coding assistant plugin for Qt Creator, providing intelligent code completion and suggestions.")
    (home-page "https://aur.archlinux.org/packages/qtcreator-qodeassist-plugin")
    (license license:gpl3+)))

;;; quickemu-rs --- virtual machine manager written in Rust
(define-public quickemu-rs
  (package
    (name "quickemu-rs")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quickemu-rs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual machine manager written in Rust")
    (description "Quickemu-rs creates and manages macOS, Linux, and Windows virtual machines with intuitive configuration, rewritten in Rust.")
    (home-page "https://aur.archlinux.org/packages/quickemu-rs")
    (license license:expat)))

;;; rainbowfetch --- colorized system fetch using lolcat
(define-public rainbowfetch
  (package
    (name "rainbowfetch")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rainbowfetch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "colorized system fetch using lolcat")
    (description "Rainbowfetch runs fastfetch with automatic logo detection and colorized output using lolcat for a rainbow effect.")
    (home-page "https://aur.archlinux.org/packages/rainbowfetch")
    (license license:expat)))

;;; sdl-gamecontrollerdb-git --- community game controller mappings for SDL2
(define-public sdl-gamecontrollerdb-git
  (package
    (name "sdl-gamecontrollerdb-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sdl-gamecontrollerdb-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "community game controller mappings for SDL2")
    (description "A community-sourced database of game controller mappings for use with SDL2 Game Controller functionality.")
    (home-page "https://aur.archlinux.org/packages/sdl-gamecontrollerdb-git")
    (license license:zlib)))

;;; slit-git --- modern terminal pager for log viewing
(define-public slit-git
  (package
    (name "slit-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slit-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern terminal pager for log viewing")
    (description "Slit is a modern terminal pager optimized for viewing logs, providing more features than less in less time.")
    (home-page "https://aur.archlinux.org/packages/slit-git")
    (license license:expat)))

;;; spr-bin --- stacked pull requests on GitHub
(define-public spr-bin
  (package
    (name "spr-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spr-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "stacked pull requests on GitHub")
    (description "SPR (Stacked Pull Requests) is a tool for managing stacked pull requests on GitHub, enabling incremental code review.")
    (home-page "https://aur.archlinux.org/packages/spr-bin")
    (license license:expat)))

;;; starfish --- Arch dependency viewer
(define-public starfish
  (package
    (name "starfish")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/starfish.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Arch dependency viewer")
    (description "Starfish is a dependency viewer for Arch Linux packages, visualizing package dependency trees.")
    (home-page "https://aur.archlinux.org/packages/starfish")
    (license license:gpl3+)))

;;; streamlink-handoff-host --- Streamlink native messaging host
(define-public streamlink-handoff-host
  (package
    (name "streamlink-handoff-host")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/streamlink-handoff-host.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "Streamlink native messaging host")
    (description "Streamlink Handoff provides native messaging host configuration for browser integration with Streamlink.")
    (home-page "https://aur.archlinux.org/packages/streamlink-handoff-host")
    (license license:bsd-2)))

;;; uniextract2 --- universal file extractor
(define-public uniextract2
  (package
    (name "uniextract2")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uniextract2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "universal file extractor")
    (description "Universal Extractor 2 is a tool to extract files from any type of archive or installer, supporting a wide range of formats.")
    (home-page "https://aur.archlinux.org/packages/uniextract2")
    (license license:gpl2+)))

;;; vanish --- safe file deletion tool with recovery
(define-public vanish
  (package
    (name "vanish")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vanish.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "safe file deletion tool with recovery")
    (description "Vanish is a modern safe file deletion tool with recovery support, featuring a beautiful TUI with pattern restore and themes.")
    (home-page "https://aur.archlinux.org/packages/vanish")
    (license license:expat)))

;;; waveterm-vis --- terminal-based music visualizer
(define-public waveterm-vis
  (package
    (name "waveterm-vis")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/waveterm-vis.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal-based music visualizer")
    (description "Waveterm Vis is a modern terminal-based music visualizer with stunning ASCII art effects for audio visualization.")
    (home-page "https://aur.archlinux.org/packages/waveterm-vis")
    (license license:expat)))

;;; wpets --- Wayland overlay animated virtual pet
(define-public wpets
  (package
    (name "wpets")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wpets.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Wayland overlay animated virtual pet")
    (description "WPets is a Wayland overlay that displays an animated virtual pet reacting to keyboard input on your desktop.")
    (home-page "https://aur.archlinux.org/packages/wpets")
    (license license:expat)))

;;; xdg-desktop-portal-rs --- Rust backend for xdg-desktop-portal
(define-public xdg-desktop-portal-rs
  (package
    (name "xdg-desktop-portal-rs")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdg-desktop-portal-rs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Rust backend for xdg-desktop-portal")
    (description "A Rust implementation of a backend for xdg-desktop-portal, providing desktop integration services for sandboxed applications.")
    (home-page "https://aur.archlinux.org/packages/xdg-desktop-portal-rs")
    (license license:expat)))

;;; xsg-fonts-bdf --- condensed terminal Unicode bitmap font (BDF)
(define-public xsg-fonts-bdf
  (package
    (name "xsg-fonts-bdf")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xsg-fonts-bdf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "condensed terminal Unicode bitmap font (BDF)")
    (description "XSG Fonts in BDF format, providing a condensed terminal emulator Unicode bitmap font.")
    (home-page "https://aur.archlinux.org/packages/xsg-fonts-bdf")
    (license license:silofl1.1)))

;;; xsg-fonts-otb --- condensed terminal Unicode bitmap font (OTB)
(define-public xsg-fonts-otb
  (package
    (name "xsg-fonts-otb")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xsg-fonts-otb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "condensed terminal Unicode bitmap font (OTB)")
    (description "XSG Fonts in OTB format, providing a condensed terminal emulator Unicode bitmap font.")
    (home-page "https://aur.archlinux.org/packages/xsg-fonts-otb")
    (license license:silofl1.1)))

;;; xsg-fonts-pcf --- condensed terminal Unicode bitmap font (PCF)
(define-public xsg-fonts-pcf
  (package
    (name "xsg-fonts-pcf")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xsg-fonts-pcf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "condensed terminal Unicode bitmap font (PCF)")
    (description "XSG Fonts in PCF format, providing a condensed terminal emulator Unicode bitmap font.")
    (home-page "https://aur.archlinux.org/packages/xsg-fonts-pcf")
    (license license:silofl1.1)))

;;; zmusic-git --- GZDoom music system as standalone library
(define-public zmusic-git
  (package
    (name "zmusic-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zmusic-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GZDoom music system as standalone library")
    (description "ZMusic is GZDoom's music system extracted as a standalone library, supporting various music formats including MIDI, MOD, and streaming audio.")
    (home-page "https://aur.archlinux.org/packages/zmusic-git")
    (license license:gpl3+)))

;;; mine-core-bin --- TUI-based IDE for Coalton and Common Lisp
(define-public mine-core-bin
  (package
    (name "mine-core-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mine-core-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "TUI-based IDE for Coalton and Common Lisp")
    (description "Mine Core is a full-featured, TUI-based IDE designed for Coalton and Common Lisp development.")
    (home-page "https://aur.archlinux.org/packages/mine-core-bin")
    (license license:expat)))

;;; dotenv-sync-bin --- dotenv synchronization with Bitwarden
(define-public dotenv-sync-bin
  (package
    (name "dotenv-sync-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotenv-sync-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "/share/" #:exclude ("PKGBUILD" ".SRCINFO")))))
    (synopsis "dotenv synchronization with Bitwarden")
    (description "Dotenv Sync keeps .env files in sync with .env.example and Bitwarden secrets for secure environment management.")
    (home-page "https://aur.archlinux.org/packages/dotenv-sync-bin")
    (license license:expat)))

;;; libastal-lua54-git --- Lua 5.4 bindings for libastal
(define-public libastal-lua54-git
  (package
    (name "libastal-lua54-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libastal-lua54-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Lua 5.4 bindings for libastal")
    (description "Lua 5.4 bindings for libastal, enabling Lua scripting for the Astal widget toolkit.")
    (home-page "https://aur.archlinux.org/packages/libastal-lua54-git")
    (license license:lgpl2.1+)))

;;; nyarchassistant --- desktop assistant application
(define-public nyarchassistant
  (package
    (name "nyarchassistant")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nyarchassistant.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop assistant application")
    (description "Nyarch Assistant is a desktop assistant application, a fork of Newelle with additional features and improvements.")
    (home-page "https://aur.archlinux.org/packages/nyarchassistant")
    (license license:gpl3+)))

;;; ghostty-git-zen3 --- fast native terminal emulator (Zen 3 optimized)
(define-public ghostty-git-zen3
  (package
    (name "ghostty-git-zen3")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghostty-git-zen3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast native terminal emulator (Zen 3 optimized)")
    (description "Ghostty is a fast, native, feature-rich terminal emulator pushing modern terminal features.  This build is optimized for AMD Zen 3 processors.")
    (home-page "https://aur.archlinux.org/packages/ghostty-git-zen3")
    (license license:expat)))
