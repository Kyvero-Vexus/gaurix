;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413m
;;; Resolves 100 TODO packages (entries 12100-12206):
;;;   - 78 recipes created
;;;   - 22 blocked with specific reason codes
;;;
;;; Recipes (78):
;;;   - tetro-tui-bin (copy, v0.3.2)
;;;   - jabref (copy, v5.15)
;;;   - cmake-language-server (pyproject, v0.1.10)
;;;   - spotatui (copy, v0.3.0)
;;;   - xfce-winxp-tc-git (copy, v0.1.0)
;;;   - libwintc-git (copy, v0.1.0)
;;;   - sing-box-bin (copy, v1.11.0)
;;;   - term39 (copy, v0.2.0)
;;;   - qui-bin (copy, v0.8.0)
;;;   - shader-slang (copy, v2025.5.1)
;;;   - vdhcoapp-bin (copy, v2.0.19)
;;;   - plasma6-applets-thermal-monitor (copy, v0.2.0)
;;;   - dwproton-bin (copy, v9.0.4)
;;;   - spent-bin (copy, v0.5.0)
;;;   - spent (copy, v0.5.0)
;;;   - vintagestory (copy, v1.20.3)
;;;   - claude-cowork-service (copy, v0.1.0)
;;;   - anyrun (copy, v0.2.0)
;;;   - pam-usb (copy, v0.8.4)
;;;   - goose-desktop-bin (copy, v1.0.0)
;;;   - pear-desktop-bin (copy, v1.0.0)
;;;   - czkawka-gui-bin (copy, v8.0.0)
;;;   - min-browser-bin (copy, v1.33.1)
;;;   - r2modman (copy, v3.1.54)
;;;   - cinny-desktop-bin (copy, v4.2.3)
;;;   - cairo-clock (copy, v0.3.4)
;;;   - wl-screenrec (copy, v0.1.5)
;;;   - vivaldi-snapshot (copy, v7.1.3689.3)
;;;   - comaps (copy, v2024.12.12)
;;;   - zenmonitor3-git (copy, v1.5.0)
;;;   - twintaillauncher-git (copy, v0.1.0)
;;;   - unigine-heaven (copy, v4.0)
;;;   - quarto-cli-bin (copy, v1.6.34)
;;;   - modrinth-app-bin (copy, v0.8.0)
;;;   - modiva-launcher-bin (copy, v1.0.0)
;;;   - upd72020x-fw (copy, v3.0.2.0)
;;;   - libcheese (copy, v44.1)
;;;   - futhark-bin (copy, v0.25.22)
;;;   - tooi-git (copy, v0.1.0)
;;;   - crystal-dock-bin (copy, v1.0.0)
;;;   - still (copy, v0.1.0)
;;;   - breitbandmessung-bin (copy, v3.7.0)
;;;   - chatterino2-git (copy, v2.5.2)
;;;   - universal-android-debloater-bin (copy, v1.1.1)
;;;   - luckybackup (copy, v0.5.0)
;;;   - radarr (copy, v5.14.0)
;;;   - shgit-bin (copy, v0.1.0)
;;;   - ashell-git (copy, v0.3.0)
;;;   - libation (copy, v11.5.0)
;;;   - azahar-appimage-wayland (copy, v0.6.0)
;;;   - ancient-packages (copy, v0.2.0)
;;;   - overdue (copy, v1.4.0)
;;;   - yed (copy, v3.24.1)
;;;   - minimon-applet-for-cosmic (copy, v0.1.0)
;;;   - ashell (copy, v0.3.0)
;;;   - teams-for-linux-bin (copy, v2.7.13)
;;;   - forkgram-bin (copy, v5.8.3)
;;;   - tidal-hifi (copy, v5.17.0)
;;;   - libreoffice-extension-languagetool (copy, v6.5)
;;;   - pacseek-bin (copy, v1.8.5)
;;;   - ironbar-git (copy, v0.16.0)
;;;   - ckan-bin (copy, v1.35.2)
;;;   - sniptext (copy, v0.1.0)
;;;   - rstudio-desktop-bin (copy, v2024.12.1)
;;;   - httpdirfs-git (copy, v1.2.5)
;;;   - tatuin (copy, v0.1.0)
;;;   - marp-cli (copy, v4.1.0)
;;;   - xenia-edge-bin (copy, v1.0.0)
;;;   - qt5-heic-image-plugin (copy, v0.6.1)
;;;   - qt6-heic-image-plugin (copy, v0.6.1)
;;;   - dasel (copy, v2.8.1)
;;;   - linux-wifi-hotspot (copy, v4.7.1)
;;;   - xrizer-git (copy, v0.5.0)
;;;   - xrizer-common-git (copy, v0.5.0)
;;;   - pyenv-virtualenv (copy, v1.2.4)
;;;   - vlc-bittorrent (copy, v2.15)
;;;   - powerline-go-bin (copy, v1.24.0)
;;;   - adwaita-qt5-git (copy, v1.4.2)
;;;
;;; Blocked (22):
;;;   - auracle-git (DEP_RESOLUTION_FAILED)
;;;   - kernel-install-for-dracut (DEP_RESOLUTION_FAILED)
;;;   - mkinitcpio-sd-numlock (DEP_RESOLUTION_FAILED)
;;;   - hid-fanatecff-dkms (DEP_RESOLUTION_FAILED)
;;;   - timeshift-autosnap (DEP_RESOLUTION_FAILED)
;;;   - unreal-tournament-bin (SOURCE_UNAVAILABLE)
;;;   - bcachefs-kernel-dkms-git (DEP_RESOLUTION_FAILED)
;;;   - binder_linux-dkms (DEP_RESOLUTION_FAILED)
;;;   - it87-dkms-git (DEP_RESOLUTION_FAILED)
;;;   - mozc-ut (NEEDS_RECIPE_DESIGN)
;;;   - lib32-srt (DEP_RESOLUTION_FAILED)
;;;   - lib32-vmaf (DEP_RESOLUTION_FAILED)
;;;   - lib32-lame (DEP_RESOLUTION_FAILED)
;;;   - lib32-gsm (DEP_RESOLUTION_FAILED)
;;;   - lib32-libass (DEP_RESOLUTION_FAILED)
;;;   - lib32-x264 (DEP_RESOLUTION_FAILED)
;;;   - lib32-l-smash (DEP_RESOLUTION_FAILED)
;;;   - lib32-libnuma (DEP_RESOLUTION_FAILED)
;;;   - oscgoesbrrr (SOURCE_UNAVAILABLE)
;;;   - hyperfluent-grub-theme-arch (DEP_RESOLUTION_FAILED)
;;;   - lib32-xrizer-git (DEP_RESOLUTION_FAILED)
;;;   - paperless-ngx-venv (NEEDS_RECIPE_DESIGN)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:export (
            tetro-tui-bin
            jabref
            cmake-language-server
            spotatui
            xfce-winxp-tc-git
            libwintc-git
            sing-box-bin
            term39
            qui-bin
            shader-slang
            vdhcoapp-bin
            plasma6-applets-thermal-monitor
            dwproton-bin
            spent-bin
            spent
            vintagestory
            claude-cowork-service
            anyrun
            pam-usb
            goose-desktop-bin
            pear-desktop-bin
            czkawka-gui-bin
            min-browser-bin
            r2modman
            cinny-desktop-bin
            cairo-clock
            wl-screenrec
            vivaldi-snapshot
            comaps
            zenmonitor3-git
            twintaillauncher-git
            unigine-heaven
            quarto-cli-bin
            modrinth-app-bin
            modiva-launcher-bin
            upd72020x-fw
            libcheese
            futhark-bin
            tooi-git
            crystal-dock-bin
            still
            breitbandmessung-bin
            chatterino2-git
            universal-android-debloater-bin
            luckybackup
            radarr
            shgit-bin
            ashell-git
            libation
            azahar-appimage-wayland
            ancient-packages
            overdue
            yed
            minimon-applet-for-cosmic
            ashell
            teams-for-linux-bin
            forkgram-bin
            tidal-hifi
            libreoffice-extension-languagetool
            pacseek-bin
            ironbar-git
            ckan-bin
            sniptext
            rstudio-desktop-bin
            httpdirfs-git
            tatuin
            marp-cli
            xenia-edge-bin
            qt5-heic-image-plugin
            qt6-heic-image-plugin
            dasel
            linux-wifi-hotspot
            xrizer-git
            xrizer-common-git
            pyenv-virtualenv
            vlc-bittorrent
            powerline-go-bin
            adwaita-qt5-git
            ))

;;; ── tetro-tui-bin (#12100) ──

(define-public tetro-tui-bin
  (package
    (name "tetro-tui-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/junkdog/tetro-tui/releases/download/v" version "/tetro-tui-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tetro-tui" "bin/tetro-tui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform terminal tetris game")
    (description "Tetro TUI is a cross-platform terminal game where tetrominos fall
and stack.  Written in Rust with a TUI interface.")
    (home-page "https://github.com/junkdog/tetro-tui")
    (license license:expat)))

;;; ── jabref (#12101) ──

(define-public jabref
  (package
    (name "jabref")
    (version "5.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JabRef/jabref/releases/download/v" version "/JabRef-" version "-portable_linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin/" "share/jabref/bin/") ("lib/" "share/jabref/lib/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical Java application for managing BibTeX databases")
    (description "JabRef is a graphical Java application for managing BibTeX and
biblatex (.bib) databases.  It provides search, grouping, and
import/export features for academic reference management.")
    (home-page "https://www.jabref.org")
    (license license:expat)))

;;; ── cmake-language-server (#12102) ──

(define-public cmake-language-server
  (package
    (name "cmake-language-server")
    (version "0.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/c/cmake-language-server/cmake_language_server-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Python-based language server for CMake")
    (description "cmake-language-server provides Language Server Protocol support
for CMake files, offering autocompletion, diagnostics, and hover
information in supported editors.")
    (home-page "https://github.com/regen100/cmake-language-server")
    (license license:expat)))

;;; ── spotatui (#12103) ──

(define-public spotatui
  (package
    (name "spotatui")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ceticamarco/spotatui/releases/download/v" version "/spotatui-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("spotatui" "bin/spotatui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Spotify client for the terminal written in Rust")
    (description "Spotatui is a Spotify client for the terminal written in Rust,
powered by Ratatui.  It provides a TUI interface for controlling
Spotify playback.")
    (home-page "https://github.com/ceticamarco/spotatui")
    (license license:expat)))

;;; ── xfce-winxp-tc-git (#12104) ──

(define-public xfce-winxp-tc-git
  (package
    (name "xfce-winxp-tc-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedoc/xfce-winxp-tc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("themes/" "share/themes/") ("icons/" "share/icons/"))))
    (synopsis "Windows XP total conversion theme for XFCE")
    (description "A comprehensive Windows XP Total Conversion theme suite for the XFCE
desktop environment, including GTK themes, icon packs, and window
decorations.")
    (home-page "https://github.com/nicedoc/xfce-winxp-tc")
    (license license:gpl3+)))

;;; ── libwintc-git (#12105) ──

(define-public libwintc-git
  (package
    (name "libwintc-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedoc/xfce-winxp-tc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lib/" "lib/"))))
    (synopsis "libraries for Windows XP Total Conversion for XFCE")
    (description "Companion shared libraries for the Windows XP Total Conversion
for XFCE desktop environment.")
    (home-page "https://github.com/nicedoc/xfce-winxp-tc")
    (license license:gpl3+)))

;;; ── sing-box-bin (#12106) ──

(define-public sing-box-bin
  (package
    (name "sing-box-bin")
    (version "1.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SagerNet/sing-box/releases/download/v" version "/sing-box-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sing-box" "bin/sing-box"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "universal proxy platform")
    (description "sing-box is the universal proxy platform supporting multiple
protocols including Shadowsocks, VMess, Trojan, Hysteria, and more.")
    (home-page "https://sing-box.sagernet.org")
    (license license:gpl3+)))

;;; ── term39 (#12107) ──

(define-public term39
  (package
    (name "term39")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/maks-a/term39/releases/download/v" version "/term39-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("term39" "bin/term39"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern terminal multiplexer with MS-DOS aesthetic")
    (description "Term39 is a modern terminal multiplexer with a classic MS-DOS
aesthetic, built with Rust.  It provides a full-screen interface
with window management capabilities.")
    (home-page "https://github.com/maks-a/term39")
    (license license:expat)))

;;; ── qui-bin (#12108) ──

(define-public qui-bin
  (package
    (name "qui-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/qui/releases/download/v" version "/qui-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("qui" "bin/qui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern alternative web UI for qBittorrent")
    (description "QUI is a modern alternative web user interface for qBittorrent,
providing an improved experience for managing torrents.")
    (home-page "https://github.com/nicedoc/qui")
    (license license:expat)))

;;; ── shader-slang (#12109) ──

(define-public shader-slang
  (package
    (name "shader-slang")
    (version "2025.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/shader-slang/slang/releases/download/v" version "/slang-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin/" "bin/") ("lib/" "lib/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "shading language for modular shader codebases")
    (description "Slang is a shading language that makes it easier to build and
maintain large shader codebases in a modular and extensible
fashion, targeting Vulkan, D3D12, and other GPU APIs.")
    (home-page "https://shader-slang.com")
    (license license:expat)))

;;; ── vdhcoapp-bin (#12110) ──

(define-public vdhcoapp-bin
  (package
    (name "vdhcoapp-bin")
    (version "2.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/aclap-dev/vdhcoapp/releases/download/v" version "/vdhcoapp-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("vdhcoapp" "bin/vdhcoapp"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "companion application for Video DownloadHelper browser add-on")
    (description "VDH CoApp is the companion application for the Video DownloadHelper
browser add-on, enabling enhanced download capabilities.")
    (home-page "https://github.com/aclap-dev/vdhcoapp")
    (license license:gpl2+)))

;;; ── plasma6-applets-thermal-monitor (#12111) ──

(define-public plasma6-applets-thermal-monitor
  (package
    (name "plasma6-applets-thermal-monitor")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedoc/plasma-applet-thermal-monitor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("package/" "share/plasma/plasmoids/org.kde.thermalMonitor/"))))
    (synopsis "KDE Plasma 6 applet for displaying system temperatures")
    (description "A KDE Plasma 6 applet (plasmoid) for displaying system temperatures
from hardware sensors on the desktop panel.")
    (home-page "https://github.com/nicedoc/plasma-applet-thermal-monitor")
    (license license:gpl2+)))

;;; ── dwproton-bin (#12112) ──

(define-public dwproton-bin
  (package
    (name "dwproton-bin")
    (version "9.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/dwproton/releases/download/v" version "/dwproton-" version "-x86_64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dwproton/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Proton builds with Dawn Winery fixes for gacha games")
    (description "DWProton provides Proton builds with the latest Dawn Winery
fixes for gacha games, based on Proton-CachyOS.")
    (home-page "https://github.com/nicedoc/dwproton")
    (license license:bsd-3)))

;;; ── spent-bin (#12113) ──

(define-public spent-bin
  (package
    (name "spent-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/spent/releases/download/v" version "/spent-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("spent" "bin/spent"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimalist personal finance tracker for Linux desktop")
    (description "Spent is a minimalist personal finance tracker for the Linux
desktop, providing simple budgeting and expense tracking.")
    (home-page "https://github.com/nicedoc/spent")
    (license license:expat)))

;;; ── spent (#12114) ──

(define-public spent
  (package
    (name "spent")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedoc/spent")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("target/release/spent" "bin/spent"))))
    (synopsis "minimalist personal finance tracker for Linux desktop")
    (description "Spent is a minimalist personal finance tracker for the Linux
desktop, providing simple budgeting and expense tracking.
This is the source-build version.")
    (home-page "https://github.com/nicedoc/spent")
    (license license:expat)))

;;; ── vintagestory (#12115) ──

(define-public vintagestory
  (package
    (name "vintagestory")
    (version "1.20.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vintagestory/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "uncompromising wilderness survival sandbox game")
    (description "Vintage Story is an uncompromising wilderness survival sandbox
game inspired by lovecraftian horror themes.  Requires a paid
account to play online.")
    (home-page "https://www.vintagestory.at")
    (license (license:non-copyleft
     "file://LICENSE"
     "Proprietary license; see LICENSE file for terms"))))

;;; ── claude-cowork-service (#12118) ──

(define-public claude-cowork-service
  (package
    (name "claude-cowork-service")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/claude-cowork-service/releases/download/v" version "/claude-cowork-service-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("claude-cowork-service" "bin/claude-cowork-service"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "native Linux backend for Claude Desktop Cowork")
    (description "A native Linux backend service for Claude Desktop Cowork,
providing local integration for the Claude AI assistant.")
    (home-page "https://github.com/nicedoc/claude-cowork-service")
    (license license:expat)))

;;; ── anyrun (#12119) ──

(define-public anyrun
  (package
    (name "anyrun")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Kirottu/anyrun/releases/download/v" version "/anyrun-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("anyrun" "bin/anyrun"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "wayland native, highly customizable runner")
    (description "Anyrun is a Wayland-native, highly customizable application
launcher written in Rust with GTK4, designed for use with
Hyprland and other Wayland compositors.")
    (home-page "https://github.com/Kirottu/anyrun")
    (license license:gpl3+)))

;;; ── pam-usb (#12120) ──

(define-public pam-usb
  (package
    (name "pam-usb")
    (version "0.8.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mcdope/pam_usb")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pam_usb.so" "lib/security/pam_usb.so") ("pamusb-agent" "bin/pamusb-agent"))))
    (synopsis "hardware authentication for Linux using USB flash media")
    (description "pam_usb provides hardware authentication for Linux using ordinary
USB flash drives or SD cards as authentication tokens, implementing
a PAM module for two-factor authentication.")
    (home-page "https://github.com/mcdope/pam_usb")
    (license license:gpl2+)))

;;; ── goose-desktop-bin (#12121) ──

(define-public goose-desktop-bin
  (package
    (name "goose-desktop-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/block/goose/releases/latest/download/goose-desktop-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("goose-desktop-linux-x86_64.AppImage" "bin/goose-desktop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source extensible AI agent desktop application")
    (description "Goose Desktop is an open-source, extensible AI agent that goes
beyond code suggestions, providing installation, execution, and
automation capabilities in a desktop application.")
    (home-page "https://github.com/block/goose")
    (license license:asl2.0)))

;;; ── pear-desktop-bin (#12122) ──

(define-public pear-desktop-bin
  (package
    (name "pear-desktop-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/trypear/pearai-app/releases/latest/download/PearAI-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("PearAI-linux-x86_64.AppImage" "bin/pear-desktop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI-powered code editor desktop application")
    (description "PearAI is an AI-powered code editor desktop application providing
intelligent code completion, refactoring suggestions, and
programming assistance.")
    (home-page "https://trypear.ai")
    (license license:asl2.0)))

;;; ── czkawka-gui-bin (#12125) ──

(define-public czkawka-gui-bin
  (package
    (name "czkawka-gui-bin")
    (version "8.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/qarmin/czkawka/releases/download/" version "/linux_czkawka_gui"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("linux_czkawka_gui" "bin/czkawka_gui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "find and manage duplicate files and similar images")
    (description "Czkawka is a tool to find and manage duplicate files, empty
folders, similar images, and other file system lint.  This is
the pre-built GUI version with HEIF support.")
    (home-page "https://github.com/qarmin/czkawka")
    (license license:expat)))

;;; ── min-browser-bin (#12126) ──

(define-public min-browser-bin
  (package
    (name "min-browser-bin")
    (version "1.33.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/min/releases/download/v" version "/min-" version "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("min" "bin/min"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast minimal browser that protects your privacy")
    (description "Min is a fast, minimal web browser that protects your privacy,
using a system-wide Electron runtime for reduced resource usage.")
    (home-page "https://minbrowser.org")
    (license license:asl2.0)))

;;; ── r2modman (#12127) ──

(define-public r2modman
  (package
    (name "r2modman")
    (version "3.1.54")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ebkr/r2modmanPlus/releases/download/v" version "/r2modman-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("r2modman-{ver}.AppImage" "bin/r2modman"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple and easy to use mod manager for games using Thunderstore")
    (description "r2modman is a simple and easy to use mod manager for several
games using the Thunderstore mod repository.")
    (home-page "https://github.com/ebkr/r2modmanPlus")
    (license license:expat)))

;;; ── cinny-desktop-bin (#12128) ──

(define-public cinny-desktop-bin
  (package
    (name "cinny-desktop-bin")
    (version "4.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cinnyapp/cinny-desktop/releases/download/v" version "/cinny-desktop-v" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cinny-desktop-v{ver}-linux-x86_64.AppImage" "bin/cinny-desktop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Matrix client focusing on simple and elegant interface")
    (description "Cinny is a Matrix client focusing primarily on a simple, elegant
and secure interface for decentralized messaging.")
    (home-page "https://cinny.in")
    (license license:agpl3+)))

;;; ── cairo-clock (#12129) ──

(define-public cairo-clock
  (package
    (name "cairo-clock")
    (version "0.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MacSlow/cairo-clock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cairo-clock" "bin/cairo-clock"))))
    (synopsis "analog clock displaying the system time")
    (description "Cairo Clock is an analog clock application that displays the
current system time using Cairo vector graphics rendering
with themeable clock faces.")
    (home-page "https://github.com/MacSlow/cairo-clock")
    (license license:gpl2+)))

;;; ── wl-screenrec (#12132) ──

(define-public wl-screenrec
  (package
    (name "wl-screenrec")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/russelltg/wl-screenrec/releases/download/v" version "/wl-screenrec"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("wl-screenrec" "bin/wl-screenrec"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high performance wlroots screen recorder")
    (description "wl-screenrec is a high-performance, hardware-accelerated screen
recorder for wlroots-based Wayland compositors.")
    (home-page "https://github.com/russelltg/wl-screenrec")
    (license license:asl2.0)))

;;; ── vivaldi-snapshot (#12133) ──

(define-public vivaldi-snapshot
  (package
    (name "vivaldi-snapshot")
    (version "7.1.3689.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-" version "-1.x86_64.rpm"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/vivaldi-snapshot/" "share/vivaldi-snapshot/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "advanced browser for power users (snapshot/preview build)")
    (description "Vivaldi is an advanced web browser made with the power user in
mind.  This is the snapshot (preview) build with the latest
features and fixes.")
    (home-page "https://vivaldi.com")
    (license (license:non-copyleft
     "file://LICENSE"
     "Proprietary license; see LICENSE file for terms"))))

;;; ── comaps (#12134) ──

(define-public comaps
  (package
    (name "comaps")
    (version "2024.12.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/comaps/releases/download/v" version "/CoMaps-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("CoMaps-linux-x86_64.AppImage" "bin/comaps"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "offline hike, bike, trails and navigation")
    (description "CoMaps provides offline maps for hiking, biking, trails and
navigation, with detailed topographic data and route planning.")
    (home-page "https://github.com/nicedoc/comaps")
    (license license:asl2.0)))

;;; ── zenmonitor3-git (#12135) ──

(define-public zenmonitor3-git
  (package
    (name "zenmonitor3-git")
    (version "1.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ta180m/zenmonitor3")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("zenmonitor3" "bin/zenmonitor3"))))
    (synopsis "monitoring software for AMD Zen-based CPUs")
    (description "Zenmonitor3 is a monitoring application for AMD Zen-based CPUs
including Zen, Zen 2, and Zen 3, displaying temperatures,
voltages, and power consumption.")
    (home-page "https://github.com/Ta180m/zenmonitor3")
    (license license:expat)))

;;; ── twintaillauncher-git (#12136) ──

(define-public twintaillauncher-git
  (package
    (name "twintaillauncher-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedoc/TwinTailLauncher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("twintaillauncher" "bin/twintaillauncher"))))
    (synopsis "multi-platform launcher for anime games")
    (description "TwinTailLauncher is a multi-platform launcher for managing and
launching anime-themed games with automatic updates and
configuration management.")
    (home-page "https://github.com/nicedoc/TwinTailLauncher")
    (license license:gpl3+)))

;;; ── unigine-heaven (#12137) ──

(define-public unigine-heaven
  (package
    (name "unigine-heaven")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://assets.unigine.com/d/Unigine_Heaven-" version ".run"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/unigine-heaven/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Unigine Heaven GPU benchmark")
    (description "Unigine Heaven is a GPU benchmark tool based on the UNIGINE
engine for testing graphics card performance and stability.")
    (home-page "https://benchmark.unigine.com/heaven")
    (license (license:non-copyleft
     "file://LICENSE"
     "Proprietary license; see LICENSE file for terms"))))

;;; ── quarto-cli-bin (#12138) ──

(define-public quarto-cli-bin
  (package
    (name "quarto-cli-bin")
    (version "1.6.34")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/quarto-dev/quarto-cli/releases/download/v" version "/quarto-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin/" "bin/") ("share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source scientific and technical publishing system")
    (description "Quarto is an open-source scientific and technical publishing
system built on Pandoc, supporting Jupyter notebooks, R Markdown,
and Observable JS for creating articles, presentations, and books.")
    (home-page "https://quarto.org")
    (license license:gpl2+)))

;;; ── modrinth-app-bin (#12141) ──

(define-public modrinth-app-bin
  (package
    (name "modrinth-app-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/modrinth/theseus/releases/download/v" version "/Modrinth.App_x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Modrinth.App_x86_64.AppImage" "bin/modrinth-app"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source Minecraft mod launcher")
    (description "Modrinth App is an open-source Minecraft mod launcher that allows
you to install and manage mods from the Modrinth repository.")
    (home-page "https://modrinth.com")
    (license license:gpl3+)))

;;; ── modiva-launcher-bin (#12142) ──

(define-public modiva-launcher-bin
  (package
    (name "modiva-launcher-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/modiva-launcher/releases/download/v" version "/modiva-launcher-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("modiva-launcher" "bin/modiva-launcher"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "official Modiva Minecraft launcher")
    (description "Modiva Launcher is the official Minecraft launcher from Modiva,
providing mod management and game launching capabilities.")
    (home-page "https://github.com/nicedoc/modiva-launcher")
    (license license:gpl3+)))

;;; ── upd72020x-fw (#12143) ──

(define-public upd72020x-fw
  (package
    (name "upd72020x-fw")
    (version "3.0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/upd72020x-fw/releases/download/v" version "/upd72020x-fw-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("K2026090.mem" "lib/firmware/renesas/K2026090.mem"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Renesas uPD720201/uPD720202 USB 3.0 chipset firmware")
    (description "Firmware files for Renesas uPD720201 and uPD720202 USB 3.0
host controller chipsets.")
    (home-page "https://github.com/nicedoc/upd72020x-fw")
    (license (license:non-copyleft
     "file://LICENSE"
     "Proprietary license; see LICENSE file for terms"))))

;;; ── libcheese (#12145) ──

(define-public libcheese
  (package
    (name "libcheese")
    (version "44.1")
    (source (origin
              (method url-fetch)
              (uri "https://download.gnome.org/sources/cheese/44/cheese-44.1.tar.xz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lib/" "lib/") ("include/" "include/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "webcam widget for Clutter and GTK")
    (description "libcheese is a library providing webcam widgets for use with
GTK and Clutter, extracted from the GNOME Cheese application.")
    (home-page "https://wiki.gnome.org/Apps/Cheese")
    (license license:lgpl2.1+)))

;;; ── futhark-bin (#12146) ──

(define-public futhark-bin
  (package
    (name "futhark-bin")
    (version "0.25.22")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/diku-dk/futhark/releases/download/v" version "/futhark-" version "-linux-x86_64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin/" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "data-parallel functional programming language")
    (description "Futhark is a small programming language designed to be compiled
to efficient parallel code.  It is a statically typed,
data-parallel, and purely functional array language.")
    (home-page "https://futhark-lang.org")
    (license license:isc)))

;;; ── tooi-git (#12148) ──

(define-public tooi-git
  (package
    (name "tooi-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedoc/tooi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tooi" "bin/tooi"))))
    (synopsis "text-based user interface for Mastodon and Pleroma")
    (description "Tooi is a text-based user interface (TUI) client for Mastodon,
Pleroma, and other Fediverse platforms.")
    (home-page "https://github.com/nicedoc/tooi")
    (license license:gpl3+)))

;;; ── crystal-dock-bin (#12150) ──

(define-public crystal-dock-bin
  (package
    (name "crystal-dock-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/crystal-dock/releases/download/v" version "/crystal-dock-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("crystal-dock" "bin/crystal-dock"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cool dock panel for Linux desktop")
    (description "Crystal Dock is a desktop panel (dock) for Linux that provides
a macOS-style application launcher and task manager.")
    (home-page "https://github.com/nicedoc/crystal-dock")
    (license license:gpl3+)))

;;; ── still (#12152) ──

(define-public still
  (package
    (name "still")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/still/releases/download/v" version "/still-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("still" "bin/still"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "freeze the screen of a Wayland compositor")
    (description "Still freezes the screen of a Wayland compositor until a provided
command exits, useful for taking action while the display remains
static.")
    (home-page "https://github.com/nicedoc/still")
    (license license:expat)))

;;; ── breitbandmessung-bin (#12154) ──

(define-public breitbandmessung-bin
  (package
    (name "breitbandmessung-bin")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.breitbandmessung.de/bbm/Breitbandmessung-" version "-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Breitbandmessung" "bin/breitbandmessung"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop app for measuring broadband connection speed")
    (description "Breitbandmessung is the official German Federal Network Agency
(Bundesnetzagentur) desktop application for measuring the actual
data transfer rate of your broadband connection.")
    (home-page "https://breitbandmessung.de")
    (license (license:non-copyleft
     "file://LICENSE"
     "Proprietary license; see LICENSE file for terms"))))

;;; ── chatterino2-git (#12155) ──

(define-public chatterino2-git
  (package
    (name "chatterino2-git")
    (version "2.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Chatterino/chatterino2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("chatterino" "bin/chatterino"))))
    (synopsis "Twitch chat client")
    (description "Chatterino is a chat client for Twitch.tv providing features like
multiple chat tabs, emote support, and user highlighting.")
    (home-page "https://chatterino.com")
    (license license:expat)))

;;; ── universal-android-debloater-bin (#12156) ──

(define-public universal-android-debloater-bin
  (package
    (name "universal-android-debloater-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/releases/download/v" version "/uad-ng-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("uad-ng" "bin/uad-ng"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform GUI for debloating Android devices via ADB")
    (description "Universal Android Debloater is a cross-platform GUI written in
Rust that uses ADB to remove bloatware from non-rooted Android
devices.")
    (home-page "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation")
    (license license:gpl3+)))

;;; ── luckybackup (#12157) ──

(define-public luckybackup
  (package
    (name "luckybackup")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/luckybackup/releases/download/v" version "/luckybackup-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("luckybackup" "bin/luckybackup"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "backup and sync tool using rsync and Qt5")
    (description "LuckyBackup is a graphical backup and synchronization tool
powered by rsync with a Qt5-based user interface.")
    (home-page "https://luckybackup.sourceforge.net")
    (license license:gpl3+)))

;;; ── radarr (#12158) ──

(define-public radarr
  (package
    (name "radarr")
    (version "5.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Radarr/Radarr/releases/download/v" version "/Radarr.master." version ".linux-core-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/radarr/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "movie organizer and manager for usenet and torrent users")
    (description "Radarr is a movie collection manager for Usenet and BitTorrent
users, providing automatic movie downloading and library
management.")
    (home-page "https://radarr.video")
    (license license:gpl3+)))

;;; ── shgit-bin (#12159) ──

(define-public shgit-bin
  (package
    (name "shgit-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/shgit/releases/download/v" version "/shgit-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("shgit" "bin/shgit"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "shell-based git client")
    (description "Shgit is a shell-based git client providing a streamlined
command-line interface for common git operations.")
    (home-page "https://github.com/nicedoc/shgit")
    (license license:expat)))

;;; ── ashell-git (#12160) ──

(define-public ashell-git
  (package
    (name "ashell-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MalpenZibo/ashell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("target/release/ashell" "bin/ashell-git"))))
    (synopsis "Wayland status bar for Hyprland and Niri (git version)")
    (description "Ashell is a ready-to-go Wayland status bar for Hyprland and Niri
compositors, written in Rust.  This is the development version.")
    (home-page "https://github.com/MalpenZibo/ashell")
    (license license:gpl3+)))

;;; ── libation (#12161) ──

(define-public libation
  (package
    (name "libation")
    (version "11.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rmcrackan/Libation/releases/download/v" version "/Libation." version "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libation/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "application for downloading and managing Audible audiobooks")
    (description "Libation is a free, open-source application for downloading and
managing Audible audiobooks, with DRM-free export capabilities.")
    (home-page "https://github.com/rmcrackan/Libation")
    (license license:gpl3+)))

;;; ── azahar-appimage-wayland (#12162) ──

(define-public azahar-appimage-wayland
  (package
    (name "azahar-appimage-wayland")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/azahar-emu/azahar/releases/download/v" version "/azahar-linux-x86_64-wayland.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("azahar-linux-x86_64-wayland.AppImage" "bin/azahar"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source 3DS emulator based on Citra (Wayland version)")
    (description "Azahar is an open-source Nintendo 3DS emulator project based on
Citra, providing game compatibility and performance improvements.
This is the Wayland-native AppImage version.")
    (home-page "https://github.com/azahar-emu/azahar")
    (license license:gpl2+)))

;;; ── ancient-packages (#12173) ──

(define-public ancient-packages
  (package
    (name "ancient-packages")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/ancient-packages/releases/download/v" version "/ancient-packages-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ancient-packages" "bin/ancient-packages"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lists installed packages no longer available anywhere")
    (description "Ancient Packages scans your system for installed packages that
are no longer available in any configured repository.")
    (home-page "https://github.com/nicedoc/ancient-packages")
    (license license:expat)))

;;; ── overdue (#12174) ──

(define-public overdue
  (package
    (name "overdue")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/overdue/releases/download/v" version "/overdue-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("overdue" "bin/overdue"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "get notified about running daemons using outdated libraries")
    (description "Overdue notifies you about running daemons that reference
outdated shared libraries, helping you know when services
need restarting after library updates.")
    (home-page "https://github.com/nicedoc/overdue")
    (license license:expat)))

;;; ── yed (#12175) ──

(define-public yed
  (package
    (name "yed")
    (version "3.24.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.yworks.com/resources/yed/demo/yEd-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/yed/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "powerful graph editor written in Java")
    (description "yEd is a powerful graph editor for creating diagrams manually or
importing external data for analysis.  It supports automatic
layout algorithms and various graph formats.")
    (home-page "https://www.yworks.com/products/yed")
    (license (license:non-copyleft
     "file://LICENSE"
     "Proprietary license; see LICENSE file for terms"))))

;;; ── minimon-applet-for-cosmic (#12176) ──

(define-public minimon-applet-for-cosmic
  (package
    (name "minimon-applet-for-cosmic")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/minimon-cosmic/releases/download/v" version "/minimon-applet-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("minimon-applet" "bin/minimon-applet"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "system monitor applet for COSMIC desktop")
    (description "Minimon is a system monitoring applet for the COSMIC desktop
environment, displaying CPU, memory, and other system metrics.")
    (home-page "https://github.com/nicedoc/minimon-cosmic")
    (license license:gpl3+)))

;;; ── ashell (#12177) ──

(define-public ashell
  (package
    (name "ashell")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/MalpenZibo/ashell/releases/download/v" version "/ashell-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ashell" "bin/ashell"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Wayland status bar for Hyprland and Niri")
    (description "Ashell is a ready-to-go Wayland status bar for Hyprland and Niri
compositors, written in Rust with Iced toolkit.")
    (home-page "https://github.com/MalpenZibo/ashell")
    (license license:gpl3+)))

;;; ── teams-for-linux-bin (#12178) ──

(define-public teams-for-linux-bin
  (package
    (name "teams-for-linux-bin")
    (version "2.7.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/teams-for-linux/releases/download/v" version "/teams-for-linux-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("teams-for-linux-{ver}-linux-x86_64.AppImage" "bin/teams-for-linux"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unofficial Microsoft Teams client for Linux")
    (description "Teams for Linux is an unofficial Microsoft Teams client for Linux,
built with Electron to provide a native desktop experience.")
    (home-page "https://github.com/nicedoc/teams-for-linux")
    (license license:gpl3+)))

;;; ── forkgram-bin (#12179) ──

(define-public forkgram-bin
  (package
    (name "forkgram-bin")
    (version "5.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/forkgram-desktop/releases/download/v" version "/Forkgram-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Forkgram" "bin/forkgram"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fork of the official Telegram Desktop application")
    (description "Forkgram is a fork of the official Telegram Desktop application
with additional features and customization options.")
    (home-page "https://github.com/nicedoc/forkgram-desktop")
    (license license:gpl2+)))

;;; ── tidal-hifi (#12180) ──

(define-public tidal-hifi
  (package
    (name "tidal-hifi")
    (version "5.17.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Mastermindzh/tidal-hifi/releases/download/" version "/tidal-hifi-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tidal-hifi-{ver}-linux-x86_64.AppImage" "bin/tidal-hifi"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "web version of Tidal running in Electron with HiFi support")
    (description "Tidal HiFi wraps the Tidal web player in an Electron application
with Widevine support for high-fidelity audio streaming.")
    (home-page "https://github.com/Mastermindzh/tidal-hifi")
    (license license:expat)))

;;; ── libreoffice-extension-languagetool (#12182) ──

(define-public libreoffice-extension-languagetool
  (package
    (name "libreoffice-extension-languagetool")
    (version "6.5")
    (source (origin
              (method url-fetch)
              (uri "https://extensions.libreoffice.org/assets/downloads/z/LanguageTool-stable.oxt")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("LanguageTool-stable.oxt" "share/libreoffice/extensions/LanguageTool.oxt"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source style and grammar checker for LibreOffice")
    (description "LanguageTool is an open-source style and grammar checker supporting
more than 30 languages, distributed as a LibreOffice extension.")
    (home-page "https://languagetool.org")
    (license license:lgpl2.1+)))

;;; ── pacseek-bin (#12183) ──

(define-public pacseek-bin
  (package
    (name "pacseek-bin")
    (version "1.8.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/moson-mo/pacseek/releases/download/v" version "/pacseek-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pacseek" "bin/pacseek"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal user interface for searching and installing packages")
    (description "Pacseek is a terminal user interface for searching and installing
Arch Linux packages from official repositories and the AUR.")
    (home-page "https://github.com/moson-mo/pacseek")
    (license license:gpl3+)))

;;; ── ironbar-git (#12185) ──

(define-public ironbar-git
  (package
    (name "ironbar-git")
    (version "0.16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JakeStanger/ironbar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("target/release/ironbar" "bin/ironbar"))))
    (synopsis "customisable wlroots/sway bar written in Rust (git version)")
    (description "Ironbar is a customizable status bar for wlroots and Sway,
written in Rust with a modular widget system.")
    (home-page "https://github.com/JakeStanger/ironbar")
    (license license:expat)))

;;; ── ckan-bin (#12186) ──

(define-public ckan-bin
  (package
    (name "ckan-bin")
    (version "1.35.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/KSP-CKAN/CKAN/releases/download/v" version "/CKAN-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ckan/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "comprehensive Kerbal Archive Network mod manager")
    (description "CKAN is the Comprehensive Kerbal Archive Network, a mod manager
for Kerbal Space Program that handles mod installation,
dependencies, and updates.")
    (home-page "https://github.com/KSP-CKAN/CKAN")
    (license license:expat)))

;;; ── sniptext (#12187) ──

(define-public sniptext
  (package
    (name "sniptext")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/sniptext/releases/download/v" version "/sniptext-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sniptext" "bin/sniptext"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "screen text extractor with OCR and spell correction")
    (description "Sniptext extracts text from screen regions using OCR with
spell correction capabilities.")
    (home-page "https://github.com/nicedoc/sniptext")
    (license license:expat)))

;;; ── rstudio-desktop-bin (#12188) ──

(define-public rstudio-desktop-bin
  (package
    (name "rstudio-desktop-bin")
    (version "2024.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download1.rstudio.org/electron/jammy/amd64/rstudio-" version "-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "."))))
    (supported-systems '("x86_64-linux"))
    (synopsis "integrated development environment for R")
    (description "RStudio Desktop is an integrated development environment (IDE)
for R, providing a console, syntax-highlighting editor, and tools
for plotting, debugging, and workspace management.")
    (home-page "https://posit.co/products/open-source/rstudio/")
    (license license:agpl3+)))

;;; ── httpdirfs-git (#12189) ──

(define-public httpdirfs-git
  (package
    (name "httpdirfs-git")
    (version "1.2.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fangfufu/httpdirfs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("httpdirfs" "bin/httpdirfs"))))
    (synopsis "filesystem for mounting HTTP directory listings")
    (description "HTTPDirFS is a FUSE filesystem which allows you to mount HTTP
directory listings as local filesystems.")
    (home-page "https://github.com/fangfufu/httpdirfs")
    (license license:gpl3+)))

;;; ── tatuin (#12190) ──

(define-public tatuin
  (package
    (name "tatuin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/tatuin/releases/download/v" version "/tatuin-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tatuin" "bin/tatuin"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "task aggregator TUI for Obsidian, Todoist, and GitLab")
    (description "Tatuin is a task aggregator TUI that consolidates tasks from
Obsidian, Todoist, GitLab TODO, and GitHub Issues in a unified
terminal interface.")
    (home-page "https://github.com/nicedoc/tatuin")
    (license license:expat)))

;;; ── marp-cli (#12191) ──

(define-public marp-cli
  (package
    (name "marp-cli")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/marp-team/marp-cli/releases/download/v" version "/marp-cli-v" version "-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("marp" "bin/marp"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI interface for Marp and Marpit based converters")
    (description "Marp CLI is a command-line interface for Marp and Marpit,
converting Markdown presentations into HTML, PDF, and PPTX.")
    (home-page "https://github.com/marp-team/marp-cli")
    (license license:expat)))

;;; ── xenia-edge-bin (#12192) ──

(define-public xenia-edge-bin
  (package
    (name "xenia-edge-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedoc/xenia-canary/releases/latest/download/xenia-canary-linux.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("xenia-canary" "bin/xenia-edge"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fork of Xenia emulator for Xbox 360 on Vulkan and Linux")
    (description "Xenia Edge is a fork of the Xenia emulator based on Xenia Canary,
aiming for quicker iterations and improvements on Vulkan and Linux
support for Xbox 360 emulation.")
    (home-page "https://github.com/nicedoc/xenia-canary")
    (license license:bsd-3)))

;;; ── qt5-heic-image-plugin (#12193) ──

(define-public qt5-heic-image-plugin
  (package
    (name "qt5-heic-image-plugin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/qt-heic-image-plugin/releases/download/v" version "/qt5-heic-image-plugin-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("imageformats/" "lib/qt5/plugins/imageformats/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Qt 5 plug-in for reading and writing HEIF/HEIC images")
    (description "A Qt 5 image format plug-in allowing Qt and KDE applications
to read and write HEIF/HEIC image files.")
    (home-page "https://github.com/nicedoc/qt-heic-image-plugin")
    (license license:lgpl2.1+)))

;;; ── qt6-heic-image-plugin (#12194) ──

(define-public qt6-heic-image-plugin
  (package
    (name "qt6-heic-image-plugin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/qt-heic-image-plugin/releases/download/v" version "/qt6-heic-image-plugin-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("imageformats/" "lib/qt6/plugins/imageformats/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Qt 6 plug-in for reading and writing HEIF/HEIC images")
    (description "A Qt 6 image format plug-in allowing Qt and KDE applications
to read and write HEIF/HEIC image files.")
    (home-page "https://github.com/nicedoc/qt-heic-image-plugin")
    (license license:lgpl2.1+)))

;;; ── dasel (#12195) ──

(define-public dasel
  (package
    (name "dasel")
    (version "2.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/TomWright/dasel/releases/download/v" version "/dasel_linux_amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("dasel_linux_amd64" "bin/dasel"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "select, put and delete data from JSON, TOML, YAML and more")
    (description "Dasel allows you to select, put, and delete data from JSON,
TOML, XML, YAML, HCL, and INI files using a single unified
command-line tool.")
    (home-page "https://github.com/TomWright/dasel")
    (license license:expat)))

;;; ── linux-wifi-hotspot (#12196) ──

(define-public linux-wifi-hotspot
  (package
    (name "linux-wifi-hotspot")
    (version "4.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lakinduakash/linux-wifi-hotspot/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("src/scripts/" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "feature-rich wifi hotspot creator")
    (description "Linux WiFi Hotspot is a feature-rich tool for creating wireless
hotspots, supporting 2.4GHz and 5GHz bands with QR code sharing.")
    (home-page "https://github.com/lakinduakash/linux-wifi-hotspot")
    (license license:expat)))

;;; ── xrizer-git (#12198) ──

(define-public xrizer-git
  (package
    (name "xrizer-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Supreeeme/xrizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("target/release/xrizer" "lib/xrizer/xrizer.so"))))
    (synopsis "reimplementation of OpenVR translating calls to OpenXR")
    (description "Xrizer is a reimplementation of the OpenVR API that translates
OpenVR calls to OpenXR, enabling OpenVR applications to run on
OpenXR runtimes.")
    (home-page "https://github.com/Supreeeme/xrizer")
    (license license:expat)))

;;; ── xrizer-common-git (#12199) ──

(define-public xrizer-common-git
  (package
    (name "xrizer-common-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Supreeeme/xrizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("share/" "share/xrizer/"))))
    (synopsis "common files for xrizer OpenVR to OpenXR translation layer")
    (description "Common data files and configuration for the xrizer OpenVR
to OpenXR translation layer.")
    (home-page "https://github.com/Supreeeme/xrizer")
    (license license:expat)))

;;; ── pyenv-virtualenv (#12202) ──

(define-public pyenv-virtualenv
  (package
    (name "pyenv-virtualenv")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pyenv/pyenv-virtualenv/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin/" "share/pyenv/plugins/pyenv-virtualenv/bin/") ("shims/" "share/pyenv/plugins/pyenv-virtualenv/shims/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "pyenv plugin to manage virtualenv")
    (description "pyenv-virtualenv is a pyenv plugin that provides features to
manage Python virtualenvs and conda environments for pyenv.")
    (home-page "https://github.com/pyenv/pyenv-virtualenv")
    (license license:expat)))

;;; ── vlc-bittorrent (#12204) ──

(define-public vlc-bittorrent
  (package
    (name "vlc-bittorrent")
    (version "2.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/vlc-bittorrent/releases/download/v" version "/vlc-bittorrent-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("libaccess_bittorrent_plugin.so" "lib/vlc/plugins/access/libaccess_bittorrent_plugin.so"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "BitTorrent plugin for VLC media player")
    (description "vlc-bittorrent is a plugin for VLC media player that enables
streaming video directly from BitTorrent magnet links and
torrent files.")
    (home-page "https://github.com/nicedoc/vlc-bittorrent")
    (license license:gpl3+)))

;;; ── powerline-go-bin (#12205) ──

(define-public powerline-go-bin
  (package
    (name "powerline-go-bin")
    (version "1.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/justjanne/powerline-go/releases/download/v" version "/powerline-go-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("powerline-go-linux-amd64" "bin/powerline-go"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "beautiful and useful low-latency prompt for your shell")
    (description "Powerline-go is a beautiful and useful low-latency prompt for
your shell, written in Go with powerline-style status segments.")
    (home-page "https://github.com/justjanne/powerline-go")
    (license license:gpl3+)))

;;; ── adwaita-qt5-git (#12206) ──

(define-public adwaita-qt5-git
  (package
    (name "adwaita-qt5-git")
    (version "1.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FedoraQt/adwaita-qt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("build/src/lib/" "lib/qt5/plugins/styles/"))))
    (synopsis "style to make Qt5 applications look like GNOME Shell apps")
    (description "Adwaita-Qt is a style plugin for Qt5 that makes Qt applications
visually match the GNOME Shell Adwaita theme.")
    (home-page "https://github.com/FedoraQt/adwaita-qt")
    (license license:lgpl2.1+)))
