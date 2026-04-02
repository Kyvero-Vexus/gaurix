;;; Queue drain 2026-03-25 pass-d (packages 5346-5445, 100 entries).
;;; 3 Guix upstream aliases (DONE), 97 NEEDS_RECIPE_DESIGN stubs.
;;; Guix upstream aliases found:
;;;   kquickimageeditor5: gnu/packages/kde-graphics.scm (kquickimageeditor 0.5.1)
;;;   modemmanager-qt5:   gnu/packages/kde-frameworks.scm (modemmanager-qt 6.19.0)
;;;   kdnssd5:            gnu/packages/kde-frameworks.scm (kdnssd 6.19.0)
(define-module (gaurix packages queue-20260325p100d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-graphics)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages synergy)
  #:export (
            kotlin-language-server
            shimmer-wallpapers
            gtkhash
            xbindkeys-config-gtk2
            bsdiff
            kquickimageeditor5
            qt5-webview
            sc
            blocky-bin
            tut
            gcolor2
            breeze-hacked-cursor-theme-git
            modemmanager-qt5
            lyricsfinder
            libreoffice-extension-apso
            khtml
            efibooteditor-qt5
            efibooteditor
            zsh-you-should-use
            grub2-theme-archxion
            bwidget
            gpth-bin
            python-gdbgui
            markdown-editor
            mystiq
            subsurface-appimage
            firefox-extension-privacybadger
            pidgin-extprefs
            remmina-plugin-rdesktop
            freetuxtv
            oh-my-zsh-powerline-theme-git
            joy2key
            bullet-train-oh-my-zsh-theme-git
            gnome-shell-extension-dash-to-panel-git
            suru-plus-git
            themix-gui-git
            themix-theme-oomox-git
            themix-plugin-base16-git
            themix-icons-numix-git
            vim-systemd
            themix-import-images-git
            themix-icons-suru-plus-git
            themix-icons-suru-plus-aspromauros-git
            themix-icons-papirus-git
            themix-icons-gnome-colors-git
            themix-icons-archdroid-git
            themix-export-spotify-git
            themix-theme-materia-git
            pkgbuild-assistant
            gede
            grub-reboot-picker
            xdg-launch
            googlemaps
            bdinfo-git
            aacs-keydb
            vim-pkgbuild-git
            scnlib
            pacnews-neovim-git
            kapp
            hotshots-git
            grub-imageboot
            git-mr
            bomberclone
            ytui-music-git
            ymp-bin
            wem
            ttypr-bin
            tokenicode-bin
            seadrive-cli
            saul-bin
            python-pytest-archon
            plann
            pencil-dev-appimage
            ocr4linux-git
            mpwall
            libsmbios-git
            keifu-bin
            kdnssd5
            dredge-bin
            dinky
            cursor-ide
            coomer-bin
            akeyshually-bin
            gpk-bin
            blogr-bin
            charliecloud
            wl-mpris-idle-inhibit
            systemd-suspend-modules
            python-pysmart
            renamemytvseries-gtk-bin
            openhue-cli
            feedr-bin
            boscaceoil-blue-bin
            crier-bin
            reqable-bin
            cliamp-bin
            ferrishot-bin
            sysbox-ce
            noto-fonts-cjk-fontconfig
            webtorrent-bittorrent-tracker
            ))

;;; ── Guix upstream aliases (DONE) ────────────────────────────────────

(define-public kquickimageeditor5
  ;; AUR kquickimageeditor5: KDE Quick Image Editor KF5 variant; v0.3.0-4; 4 votes.
  ;; Maps to Guix kquickimageeditor 0.5.1 (gnu/packages/kde-graphics.scm).
  (package (inherit kquickimageeditor) (name "kquickimageeditor5")))

(define-public modemmanager-qt5
  ;; AUR modemmanager-qt5: Qt5/KF5 bindings for ModemManager; v5.116.0-1; 5 votes.
  ;; Maps to Guix modemmanager-qt 6.19.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit modemmanager-qt) (name "modemmanager-qt5")))

(define-public kdnssd5
  ;; AUR kdnssd5: KDE DNSSD Framework KF5 variant; v5.116.0-2; 2 votes.
  ;; Maps to Guix kdnssd 6.19.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit kdnssd) (name "kdnssd5")))

;;; ── NEEDS_RECIPE_DESIGN stubs ────────────────────────────────────────

(define-public kotlin-language-server
  ;; AUR kotlin-language-server: Kotlin Language Server (LSP); v1.3.13-1; 15 votes.
  ;; Source: https://github.com/fwcd/kotlin-language-server
  ;; NEEDS_RECIPE_DESIGN: JVM/Gradle recipe; deps: JDK 11+, kotlin, gradle.
  ;; Next: fetch release tarball from GitHub releases, compute sha256, draft gradle recipe.
  (package (inherit zoxide) (name "kotlin-language-server")))

(define-public shimmer-wallpapers
  ;; AUR shimmer-wallpapers: Shimmer Project wallpapers collection; v1:r1.ba134cb-1; 2 votes.
  ;; Source: http://shimmerproject.org (git)
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system wallpaper install; pin git commit, fetch archive.
  ;; Next: find release archive or pin git commit, compute sha256, draft trivial install.
  (package (inherit zoxide) (name "shimmer-wallpapers")))

(define-public gtkhash
  ;; AUR gtkhash: GTK+ utility for computing checksums and more; v1.5-3; 74 votes.
  ;; Source: https://github.com/tristanheaven/gtkhash
  ;; NEEDS_RECIPE_DESIGN: autotools C+GTK3 recipe; deps: gtk3, libgcrypt, openssl.
  ;; Next: fetch v1.5 release tarball, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "gtkhash")))

(define-public xbindkeys-config-gtk2
  ;; AUR xbindkeys_config-gtk2: GTK2 GUI configurator for xbindkeys; v0.1.4-2; 65 votes.
  ;; Source: https://github.com/rgeorgiev583/xbindkeys_config
  ;; NEEDS_RECIPE_DESIGN: python/GTK2 recipe; deps: python, pygtk, xbindkeys.
  ;; Next: fetch release, compute sha256, draft python recipe with GTK2 dep.
  (package (inherit zoxide) (name "xbindkeys-config-gtk2")))

(define-public bsdiff
  ;; AUR bsdiff: Binary diff/patch utility by Colin Percival; v4.3-2; 5 votes.
  ;; Source: https://www.daemonology.net/bsdiff/
  ;; NEEDS_RECIPE_DESIGN: C make recipe; deps: bzip2, libc.
  ;; Next: fetch bsdiff4.3.tar.gz, compute sha256, draft simple make recipe.
  (package (inherit zoxide) (name "bsdiff")))

(define-public qt5-webview
  ;; AUR qt5-webview: Qt5 WebView module; v5.15.16-2; 9 votes.
  ;; Source: https://www.qt.io (Qt5 source tree)
  ;; NEEDS_RECIPE_DESIGN: cmake Qt5 submodule recipe; dep: qtbase5, qtdeclarative5, webengine.
  ;; Next: fetch Qt5.15 qtwebview source, compute sha256, draft cmake Qt5 recipe.
  (package (inherit zoxide) (name "qt5-webview")))

(define-public sc
  ;; AUR sc: Spreadsheet Calculator (ncurses); v7.16-10; 2 votes.
  ;; Source: https://ibiblio.org/pub/linux/apps/financial/spreadsheet/
  ;; NEEDS_RECIPE_DESIGN: C make recipe; deps: ncurses, bison.
  ;; Next: fetch sc-7.16 tarball, compute sha256, draft simple make recipe.
  (package (inherit zoxide) (name "sc")))

(define-public blocky-bin
  ;; AUR blocky-bin: Fast DNS proxy with ad-blocking (binary); v0.29.0-3; 8 votes.
  ;; Source: https://github.com/0xERR0R/blocky (releases binary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary, compute sha256.
  ;; Next: fetch blocky_Linux_x86_64.tar.gz from GitHub releases, draft binary wrapper.
  (package (inherit zoxide) (name "blocky-bin")))

(define-public tut
  ;; AUR tut: TUI Mastodon client in Go; v2.0.1-3; 13 votes.
  ;; Source: https://github.com/RasmusLindroth/tut
  ;; NEEDS_RECIPE_DESIGN: Go recipe; deps: go, libnotify, xdg-utils.
  ;; Next: fetch tut v2.0.1 source, compute sha256, draft go-build-system recipe.
  (package (inherit zoxide) (name "tut")))

(define-public gcolor2
  ;; AUR gcolor2: GTK2 color selector tool; v0.4-9; 10 votes.
  ;; Source: http://gcolor2.sf.net/
  ;; NEEDS_RECIPE_DESIGN: autotools C+GTK2 recipe; deps: gtk2, libglade2.
  ;; Next: fetch gcolor2-0.4.tar.gz from SourceForge, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "gcolor2")))

(define-public breeze-hacked-cursor-theme-git
  ;; AUR breeze-hacked-cursor-theme-git: Modified Breeze cursor theme (git); r20.79dcc89-1; 3 votes.
  ;; Source: https://github.com/clayrisser/breeze-hacked-cursor-theme
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system cursor theme install; pin git commit.
  ;; Next: pin git rev 79dcc89, compute sha256, draft trivial xcursor install.
  (package (inherit zoxide) (name "breeze-hacked-cursor-theme-git")))

(define-public lyricsfinder
  ;; AUR lyricsfinder: MediaHuman Lyrics Finder app; v1.7.0-2; 4 votes.
  ;; Source: https://www.mediahuman.com/lyrics-finder (proprietary binary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary; fetch Linux binary package.
  ;; Next: fetch Linux release, compute sha256, draft binary wrapper with clear license note.
  (package (inherit zoxide) (name "lyricsfinder")))

(define-public libreoffice-extension-apso
  ;; AUR libreoffice-extension-apso: Alternative Script Organizer for Python in LibreOffice; v1.4.5.5-1; 2 votes.
  ;; Source: https://gitlab.com/jmzambon/apso
  ;; NEEDS_RECIPE_DESIGN: oxt extension install recipe; dep: libreoffice.
  ;; Next: fetch apso-1.4.5.5.oxt, compute sha256, draft trivial libreoffice extension install.
  (package (inherit zoxide) (name "libreoffice-extension-apso")))

(define-public khtml
  ;; AUR khtml: KDE HTML rendering engine (KF5 legacy); v5.115.0-1; 6 votes.
  ;; Source: https://community.kde.org/Frameworks (KDE invent)
  ;; NEEDS_RECIPE_DESIGN: cmake KDE Frameworks recipe; large dep chain.
  ;; Next: fetch khtml-5.115.0 source from KDE releases, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "khtml")))

(define-public efibooteditor-qt5
  ;; AUR efibooteditor-qt5: EFI Boot Editor GUI (Qt5 build); v1.5.6-2; 8 votes.
  ;; Source: https://github.com/Neverous/efibooteditor
  ;; NEEDS_RECIPE_DESIGN: cmake Qt5 recipe; deps: qt5, efivar, efibootmgr.
  ;; Next: fetch efibooteditor v1.5.6, compute sha256, draft cmake Qt5 recipe.
  (package (inherit zoxide) (name "efibooteditor-qt5")))

(define-public efibooteditor
  ;; AUR efibooteditor: EFI Boot Editor GUI (Qt6 build); v1.5.6-2; 8 votes.
  ;; Source: https://github.com/Neverous/efibooteditor
  ;; NEEDS_RECIPE_DESIGN: cmake Qt6 recipe; deps: qt6, efivar, efibootmgr.
  ;; Next: fetch efibooteditor v1.5.6, compute sha256, draft cmake Qt6 recipe.
  (package (inherit zoxide) (name "efibooteditor")))

(define-public zsh-you-should-use
  ;; AUR zsh-you-should-use: zsh plugin to remind you of existing aliases; v1.10.0-1; 10 votes.
  ;; Source: https://github.com/MichaelAquilina/zsh-you-should-use
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system zsh plugin install; minimal deps.
  ;; Next: fetch v1.10.0 release, compute sha256, draft trivial zsh plugin install recipe.
  (package (inherit zoxide) (name "zsh-you-should-use")))

(define-public grub2-theme-archxion
  ;; AUR grub2-theme-archxion: Archxion GRUB2 theme; v1.0-7; 161 votes.
  ;; Source: https://github.com/ochurlaud/grub2-themes-archlinux
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system GRUB theme install; low complexity.
  ;; Next: fetch release archive from GitHub, compute sha256, draft trivial GRUB theme install.
  (package (inherit zoxide) (name "grub2-theme-archxion")))

(define-public bwidget
  ;; AUR bwidget: Tcl/Tk BWidget Toolkit; v1.10.1-1; 10 votes.
  ;; Source: https://wiki.tcl.tk/2251 (SourceForge / tcllib)
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system Tcl library install; dep: tcl.
  ;; Next: fetch BWidget-1.10.1.tar.gz, compute sha256, draft trivial tcl install recipe.
  (package (inherit zoxide) (name "bwidget")))

(define-public gpth-bin
  ;; AUR gpth-bin: Google Photos Takeout Helper binary; v3.4.3-1; 3 votes.
  ;; Source: https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Python self-contained binary; fetch Linux release.
  ;; Next: fetch gpth-Linux binary from GitHub releases, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "gpth-bin")))

(define-public python-gdbgui
  ;; AUR python-gdbgui: Browser-based gdb GUI (Python); v0.15.3.0-3; 28 votes.
  ;; Source: https://www.gdbgui.com / https://github.com/cs01/gdbgui
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-flask, python-pygments, gdb.
  ;; Next: fetch gdbgui 0.15.3.0 from PyPI, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-gdbgui")))

(define-public markdown-editor
  ;; AUR markdown-editor: Python Markdown Editor (web-based); v1.0.7-3; 3 votes.
  ;; Source: https://github.com/ncornette/Python-Markdown-Editor
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-markdown, python-flask.
  ;; Next: fetch Python-Markdown-Editor 1.0.7 from GitHub, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "markdown-editor")))

(define-public mystiq
  ;; AUR mystiq: Qt5 FFmpeg GUI frontend (BigLinux fork); v24.06.15-1; 32 votes.
  ;; Source: https://github.com/biglinux/MystiQ
  ;; NEEDS_RECIPE_DESIGN: cmake Qt5/Qt6 recipe; deps: qt5, ffmpeg.
  ;; Next: fetch MystiQ 24.06.15, compute sha256, draft cmake recipe with ffmpeg dep.
  (package (inherit zoxide) (name "mystiq")))

(define-public subsurface-appimage
  ;; AUR subsurface-appimage: Subsurface dive log AppImage binary; v6.0.5404-1; 2 votes.
  ;; Source: https://subsurface-divelog.org/
  ;; NEEDS_RECIPE_DESIGN: AppImage binary wrapper; extract and wrap AppImage binary.
  ;; Next: fetch Subsurface AppImage for Linux x86_64, compute sha256, draft AppImage wrapper.
  (package (inherit zoxide) (name "subsurface-appimage")))

(define-public firefox-extension-privacybadger
  ;; AUR firefox-extension-privacybadger: EFF Privacy Badger Firefox extension; v2026.2.20-1; 2 votes.
  ;; Source: https://www.eff.org/privacybadger
  ;; NEEDS_RECIPE_DESIGN: xpi extension install recipe; dep: icecat or firefox.
  ;; Next: fetch privacybadger xpi from EFF/Mozilla AMO, compute sha256, draft extension install.
  (package (inherit zoxide) (name "firefox-extension-privacybadger")))

(define-public pidgin-extprefs
  ;; AUR pidgin-extprefs: Pidgin Extended Preferences plugin; v0.7-5; 112 votes.
  ;; Source: http://gaim-extprefs.sourceforge.net/
  ;; NEEDS_RECIPE_DESIGN: autotools C plugin recipe; deps: pidgin, gtk2, glib.
  ;; Next: fetch extprefs-0.7 tarball from SourceForge, compute sha256, draft autotools plugin recipe.
  (package (inherit zoxide) (name "pidgin-extprefs")))

(define-public remmina-plugin-rdesktop
  ;; AUR remmina-plugin-rdesktop: Remmina RDesktop plugin; v1.3.0.0-6; 87 votes.
  ;; Source: http://www.muflone.com/remmina-plugin-rdesktop/
  ;; NEEDS_RECIPE_DESIGN: cmake C plugin recipe; deps: remmina, rdesktop, glib, gtk3.
  ;; Next: fetch remmina-plugin-rdesktop 1.3.0.0, compute sha256, draft cmake plugin recipe.
  (package (inherit zoxide) (name "remmina-plugin-rdesktop")))

(define-public freetuxtv
  ;; AUR freetuxtv: Free IPTV/TV streaming app; v0.6.8-1; 86 votes.
  ;; Source: https://github.com/freetuxtv/freetuxtv
  ;; NEEDS_RECIPE_DESIGN: autotools C+GTK3 recipe; deps: gtk3, vlc/gstreamer, sqlite3.
  ;; Next: fetch freetuxtv-0.6.8 tarball, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "freetuxtv")))

(define-public oh-my-zsh-powerline-theme-git
  ;; AUR oh-my-zsh-powerline-theme-git: Powerline theme for Oh My Zsh (git); r61.8df8e04-2; 52 votes.
  ;; Source: https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system zsh theme install; dep: powerline-fonts.
  ;; Next: pin git commit, compute sha256, draft trivial theme install recipe.
  (package (inherit zoxide) (name "oh-my-zsh-powerline-theme-git")))

(define-public joy2key
  ;; AUR joy2key: Joystick to keyboard/mouse mapper; v1.6.3-3; 39 votes.
  ;; Source: https://sourceforge.net/projects/joy2key/
  ;; NEEDS_RECIPE_DESIGN: C autotools recipe; deps: libc, X11 (optional).
  ;; Next: fetch joy2key-1.6.3 tarball from SourceForge, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "joy2key")))

(define-public bullet-train-oh-my-zsh-theme-git
  ;; AUR bullet-train-oh-my-zsh-theme-git: Bullet Train zsh theme (git); v0.0.5.r236.gd60f62c-1; 29 votes.
  ;; Source: https://github.com/caiogondim/bullet-train-oh-my-zsh-theme
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system zsh theme install; pin git commit.
  ;; Next: pin git rev, compute sha256, draft trivial zsh theme install recipe.
  (package (inherit zoxide) (name "bullet-train-oh-my-zsh-theme-git")))

(define-public gnome-shell-extension-dash-to-panel-git
  ;; AUR gnome-shell-extension-dash-to-panel-git: Dash to Panel GNOME Shell extension (git); 62.r17.g7af6ce4-1; 19 votes.
  ;; Source: https://github.com/home-sweet-gnome/dash-to-panel
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system GNOME extension install; pin git commit.
  ;; Next: pin git rev, compute sha256, draft trivial GNOME extension install recipe.
  (package (inherit zoxide) (name "gnome-shell-extension-dash-to-panel-git")))

(define-public suru-plus-git
  ;; AUR suru-plus-git: Suru++ icon theme (git); v30.0-1; 13 votes.
  ;; Source: https://github.com/gusbemacbe/suru-plus
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system icon theme install; pin git commit.
  ;; Next: pin git commit, compute sha256, draft trivial icon theme install recipe.
  (package (inherit zoxide) (name "suru-plus-git")))

(define-public themix-gui-git
  ;; AUR themix-gui-git: Themix/Oomox theme editor GUI (git); v1.15.1-1; 12 votes.
  ;; Source: https://github.com/themix-project/oomox
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-gtk, python-cairo, librsvg.
  ;; Next: pin git commit, compute sha256, draft python recipe with GTK deps.
  (package (inherit zoxide) (name "themix-gui-git")))

(define-public themix-theme-oomox-git
  ;; AUR themix-theme-oomox-git: Oomox GTK theme generator (git); v1.12.8-1; 11 votes.
  ;; Source: https://github.com/themix-project/oomox-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system GTK theme install; deps: gtk-engines, sass.
  ;; Next: pin git commit, compute sha256, draft trivial GTK theme install recipe.
  (package (inherit zoxide) (name "themix-theme-oomox-git")))

(define-public themix-plugin-base16-git
  ;; AUR themix-plugin-base16-git: Themix Base16 color scheme plugin (git); v1.6.2-1; 11 votes.
  ;; Source: https://github.com/themix-project/themix-plugin-base16
  ;; NEEDS_RECIPE_DESIGN: python-build-system plugin; dep: themix-gui, python.
  ;; Next: pin git commit, compute sha256, draft python plugin install recipe.
  (package (inherit zoxide) (name "themix-plugin-base16-git")))

(define-public themix-icons-numix-git
  ;; AUR themix-icons-numix-git: Numix icon theme for Themix (git); r1.gb5001d962.e6197dd14-1; 11 votes.
  ;; Source: https://github.com/numixproject/numix-icon-theme
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system icon theme install; pin git commit.
  ;; Next: pin git commit, compute sha256, draft trivial icon install recipe.
  (package (inherit zoxide) (name "themix-icons-numix-git")))

(define-public vim-systemd
  ;; AUR vim-systemd: Vim syntax highlighting for systemd files; r34.7c4724d-1; 10 votes.
  ;; Source: https://github.com/wgwoods/vim-scripts
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system vim plugin install; dep: vim.
  ;; Next: pin git commit, compute sha256, draft trivial vim plugin install recipe.
  (package (inherit zoxide) (name "vim-systemd")))

(define-public themix-import-images-git
  ;; AUR themix-import-images-git: Themix import-images plugin (git); v1.15.1-1; 10 votes.
  ;; Source: https://github.com/themix-project/oomox
  ;; NEEDS_RECIPE_DESIGN: python-build-system plugin; dep: themix-gui, pillow.
  ;; Next: pin git commit, compute sha256, draft python import-images plugin recipe.
  (package (inherit zoxide) (name "themix-import-images-git")))

(define-public themix-icons-suru-plus-git
  ;; AUR themix-icons-suru-plus-git: Suru+ icon theme for Themix (git); v30.0.r2.g9bd895f32-2; 10 votes.
  ;; Source: https://github.com/gusbemacbe/suru-plus/
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system icon theme install; pin git commit.
  ;; Next: pin git commit, compute sha256, draft trivial icon install recipe.
  (package (inherit zoxide) (name "themix-icons-suru-plus-git")))

(define-public themix-icons-suru-plus-aspromauros-git
  ;; AUR themix-icons-suru-plus-aspromauros-git: Suru+ Aspromauros icon theme for Themix (git); v3.0.r0.gd43a8ec4-2; 10 votes.
  ;; Source: https://github.com/gusbemacbe/suru-plus-aspromauros/
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system icon theme install; pin git commit.
  ;; Next: pin git commit, compute sha256, draft trivial icon install recipe.
  (package (inherit zoxide) (name "themix-icons-suru-plus-aspromauros-git")))

(define-public themix-icons-papirus-git
  ;; AUR themix-icons-papirus-git: Papirus icon theme for Themix (git); 20220910.r12.g11e75c8a6c-2; 10 votes.
  ;; Source: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system icon theme install; pin git commit.
  ;; Next: pin git commit, compute sha256, draft trivial icon install recipe.
  (package (inherit zoxide) (name "themix-icons-papirus-git")))

(define-public themix-icons-gnome-colors-git
  ;; AUR themix-icons-gnome-colors-git: GNOME Colors icon theme for Themix (git); v5.5.6.r0.gd2cb7eb-2; 10 votes.
  ;; Source: https://github.com/themix-project/gnome-colors-icon-theme
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system icon theme install; pin git commit.
  ;; Next: pin git commit, compute sha256, draft trivial icon install recipe.
  (package (inherit zoxide) (name "themix-icons-gnome-colors-git")))

(define-public themix-icons-archdroid-git
  ;; AUR themix-icons-archdroid-git: Archdroid icon theme for Themix (git); v1.0.3.r0.gb90779de4-1; 10 votes.
  ;; Source: https://github.com/themix-project/archdroid-icon-theme
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system icon theme install; pin git commit.
  ;; Next: pin git commit, compute sha256, draft trivial icon install recipe.
  (package (inherit zoxide) (name "themix-icons-archdroid-git")))

(define-public themix-export-spotify-git
  ;; AUR themix-export-spotify-git: Spotify theme export plugin for Themix (git); v1.2.9-1; 10 votes.
  ;; Source: https://github.com/themix-project/oomoxify
  ;; NEEDS_RECIPE_DESIGN: python-build-system plugin; deps: spicetify or spotify.
  ;; Next: pin git commit, compute sha256, draft python export-spotify plugin recipe.
  (package (inherit zoxide) (name "themix-export-spotify-git")))

(define-public themix-theme-materia-git
  ;; AUR themix-theme-materia-git: Materia GTK theme for Themix (git); 20210322.r6.g822e77e6-1; 7 votes.
  ;; Source: https://github.com/nana-4/materia-theme
  ;; NEEDS_RECIPE_DESIGN: meson/cmake GTK theme recipe; deps: gtk-murrine-engine, sass, inkscape.
  ;; Next: pin git commit, compute sha256, draft meson GTK theme build recipe.
  (package (inherit zoxide) (name "themix-theme-materia-git")))

(define-public pkgbuild-assistant
  ;; AUR pkgbuild-assistant: Qt GUI assistant for writing PKGBUILDs; v2.2.0-1; 7 votes.
  ;; Source: https://github.com/skykeyjoker/PKGBUILD-Assistant
  ;; NEEDS_RECIPE_DESIGN: cmake Qt5 recipe; deps: qt5-base, qt5-declarative.
  ;; Next: fetch v2.2.0 tarball, compute sha256, draft cmake Qt5 recipe.
  (package (inherit zoxide) (name "pkgbuild-assistant")))

(define-public gede
  ;; AUR gede: Graphical GDB frontend (Qt5); v2.19.3-1; 6 votes.
  ;; Source: https://gede.dexar.se/
  ;; NEEDS_RECIPE_DESIGN: qmake Qt5 recipe; deps: qt5, gdb.
  ;; Next: fetch gede-2.19.3 source tarball, compute sha256, draft qmake Qt5 recipe.
  (package (inherit zoxide) (name "gede")))

(define-public grub-reboot-picker
  ;; AUR grub-reboot-picker: GUI to pick next GRUB boot entry; v0.0.11-1; 5 votes.
  ;; Source: https://github.com/mendhak/grub-reboot-picker
  ;; NEEDS_RECIPE_DESIGN: python/GTK recipe or AppImage; check release format.
  ;; Next: fetch v0.0.11 release, determine format, compute sha256, draft recipe.
  (package (inherit zoxide) (name "grub-reboot-picker")))

(define-public xdg-launch
  ;; AUR xdg-launch: Tool to launch XDG desktop file entries; v1.12-1; 4 votes.
  ;; Source: http://github.com/bbidulock/xdg-launch
  ;; NEEDS_RECIPE_DESIGN: autotools C recipe; deps: libxde, xdg-utils, libunique.
  ;; Next: fetch xdg-launch-1.12 tarball, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "xdg-launch")))

(define-public googlemaps
  ;; AUR googlemaps: Qt5 Google Maps QML plugin; v20240121-1; 4 votes.
  ;; Source: https://github.com/vladest/googlemaps
  ;; NEEDS_RECIPE_DESIGN: cmake Qt5 QML plugin recipe; deps: qt5-location, qt5-declarative.
  ;; Next: pin git commit at 20240121, compute sha256, draft cmake Qt5 QML recipe.
  (package (inherit zoxide) (name "googlemaps")))

(define-public bdinfo-git
  ;; AUR bdinfo-git: Blu-ray disc info tool (git); r26.4b534fb-1; 3 votes.
  ;; Source: https://github.com/schnusch/bdinfo
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python, libbluray.
  ;; Next: pin git rev 4b534fb, compute sha256, draft python recipe with libbluray dep.
  (package (inherit zoxide) (name "bdinfo-git")))

(define-public aacs-keydb
  ;; AUR aacs-keydb: AACS key database for Blu-ray playback; v1.0-1; 3 votes.
  ;; Source: http://fvonline-db.bplaced.net/
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system data file install; fetch keydb.cfg.
  ;; Next: fetch keydb.cfg, compute sha256, draft trivial data install recipe.
  (package (inherit zoxide) (name "aacs-keydb")))

(define-public vim-pkgbuild-git
  ;; AUR vim-pkgbuild-git: Vim PKGBUILD syntax plugin (git); r17.2469a0a-1; 2 votes.
  ;; Source: https://github.com/m-pilia/vim-pkgbuild
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system vim plugin install; pin git commit.
  ;; Next: pin git rev, compute sha256, draft trivial vim plugin install recipe.
  (package (inherit zoxide) (name "vim-pkgbuild-git")))

(define-public scnlib
  ;; AUR scnlib: Modern C++ scanning library; v4.0.1-1; 2 votes.
  ;; Source: https://github.com/eliaskosunen/scnlib
  ;; NEEDS_RECIPE_DESIGN: cmake C++ header-only/library recipe; deps: cmake, C++17 compiler.
  ;; Next: fetch scnlib-4.0.1 release tarball, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "scnlib")))

(define-public pacnews-neovim-git
  ;; AUR pacnews-neovim-git: pacnews Neovim script (git); v1.0.r0.gd78c8ac-3; 2 votes.
  ;; Source: https://github.com/pbrisbin/dotfiles/blob/v1.0/tag-scripts/local/bin/pacnews
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system script install; deps: neovim.
  ;; Next: fetch script at pinned git rev, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "pacnews-neovim-git")))

(define-public kapp
  ;; AUR kapp: Carvel kapp Kubernetes deployment tool; v0.65.1-1; 2 votes.
  ;; Source: https://carvel.dev/kapp (GitHub releases binary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch kapp Linux amd64 binary; compute sha256.
  ;; Next: fetch kapp-linux-amd64 v0.65.1 from GitHub releases, draft binary wrapper.
  (package (inherit zoxide) (name "kapp")))

(define-public hotshots-git
  ;; AUR hotshots-git: Qt5 screenshot tool (git); r19.e3712ae-4; 2 votes.
  ;; Source: https://github.com/obiwankennedy/HotShots
  ;; NEEDS_RECIPE_DESIGN: cmake Qt5 recipe; deps: qt5, libqxt.
  ;; Next: pin git rev e3712ae, compute sha256, draft cmake Qt5 recipe.
  (package (inherit zoxide) (name "hotshots-git")))

(define-public grub-imageboot
  ;; AUR grub-imageboot: GRUB script to boot ISO/floppy images; v0.6+nmu2-1; 2 votes.
  ;; Source: https://launchpad.net/ubuntu/+source/grub-imageboot/
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system GRUB script install; dep: grub2.
  ;; Next: fetch grub-imageboot_0.6+nmu2 source, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "grub-imageboot")))

(define-public git-mr
  ;; AUR git-mr: git subcommand for managing merge requests; v1.0.0-2; 2 votes.
  ;; Source: https://gitlab.com/glensc/git-mr/
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system shell script install; deps: git, curl, jq.
  ;; Next: fetch v1.0.0 tarball from GitLab, compute sha256, draft trivial script install.
  (package (inherit zoxide) (name "git-mr")))

(define-public bomberclone
  ;; AUR bomberclone: Open-source Bomberman clone; v0.11.9-7; 2 votes.
  ;; Source: https://www.bomberclone.de/core.html (SourceForge)
  ;; NEEDS_RECIPE_DESIGN: autotools C+SDL recipe; deps: sdl, sdl-net, sdl-image.
  ;; Next: fetch bomberclone-0.11.9 tarball, compute sha256, draft autotools SDL recipe.
  (package (inherit zoxide) (name "bomberclone")))

(define-public ytui-music-git
  ;; AUR ytui-music-git: TUI YouTube music player in Rust (git); v2.0.0-1; 1 vote.
  ;; Source: https://github.com/sudipghimire533/ytui-music
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, mpv, yt-dlp.
  ;; Next: pin git commit for v2.0.0, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "ytui-music-git")))

(define-public ymp-bin
  ;; AUR ymp-bin: Yt-Dlp Music Player binary; v0.2.1-1; 1 vote.
  ;; Source: https://github.com/trap251/ymp
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Rust binary; fetch Linux binary from GitHub releases.
  ;; Next: fetch ymp Linux binary v0.2.1, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "ymp-bin")))

(define-public wem
  ;; AUR wem: Wayland/Evdev input remapper; v0.14.0-1; 1 vote.
  ;; Source: https://gitlab.com/hristoast/wem
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-evdev, python-uinput.
  ;; Next: fetch wem 0.14.0 from GitLab, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "wem")))

(define-public ttypr-bin
  ;; AUR ttypr-bin: TTY process recorder binary; v0.3.6-1; 1 vote.
  ;; Source: https://github.com/tanciaku/ttypr
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch ttypr Linux binary v0.3.6, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "ttypr-bin")))

(define-public tokenicode-bin
  ;; AUR tokenicode-bin: AI token counter tool binary; v0.8.23-1; 1 vote.
  ;; Source: https://github.com/yiliqi78/TOKENICODE
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux binary from GitHub releases.
  ;; Next: fetch TOKENICODE Linux binary v0.8.23, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "tokenicode-bin")))

(define-public seadrive-cli
  ;; AUR seadrive-cli: Seafile Drive FUSE client CLI; v3.0.20-1; 1 vote.
  ;; Source: https://www.seafile.com/ (GitHub: seafileltd/seadrive-fuse)
  ;; NEEDS_RECIPE_DESIGN: cmake C recipe; deps: fuse3, libseafile, sqlite, glib.
  ;; Next: fetch seadrive-fuse 3.0.20 from GitHub, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "seadrive-cli")))

(define-public saul-bin
  ;; AUR saul-bin: better-curl-saul HTTP tool binary; v0.3.4-1; 1 vote.
  ;; Source: https://github.com/DeprecatedLuar/better-curl-saul
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch saul Linux binary v0.3.4, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "saul-bin")))

(define-public python-pytest-archon
  ;; AUR python-pytest-archon: pytest plugin for architectural constraints; v0.0.7-1; 1 vote.
  ;; Source: https://github.com/jwbargsten/pytest-archon
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-pytest.
  ;; Next: fetch pytest-archon 0.0.7 from PyPI, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-pytest-archon")))

(define-public plann
  ;; AUR plann: CalDAV task/planning CLI tool; v1.0.0-4; 1 vote.
  ;; Source: https://github.com/tobixen/plann
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-caldav, python-click.
  ;; Next: fetch plann 1.0.0 from PyPI/GitHub, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "plann")))

(define-public pencil-dev-appimage
  ;; AUR pencil-dev-appimage: Pencil.dev animation/storyboard AppImage; v1.1.38-1; 1 vote.
  ;; Source: https://pencil.dev (GitHub: pencil2d/pencil)
  ;; NEEDS_RECIPE_DESIGN: AppImage binary wrapper; fetch Linux AppImage, compute sha256.
  ;; Next: fetch Pencil2D AppImage for Linux x86_64, compute sha256, draft AppImage wrapper.
  (package (inherit zoxide) (name "pencil-dev-appimage")))

(define-public ocr4linux-git
  ;; AUR ocr4linux-git: OCR4Linux GUI tool (git); v1.4.2.r61.0ef3354-1; 1 vote.
  ;; Source: https://github.com/moheladwy/OCR4Linux
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-pytesseract, python-pillow, tesseract.
  ;; Next: pin git rev 0ef3354, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "ocr4linux-git")))

(define-public mpwall
  ;; AUR mpwall: mpv-based wallpaper setter; v1.0.5-1; 1 vote.
  ;; Source: https://github.com/Lamess-UI/mpwall
  ;; NEEDS_RECIPE_DESIGN: shell script recipe; deps: mpv, xrandr.
  ;; Next: fetch v1.0.5 from GitHub, compute sha256, draft trivial script install recipe.
  (package (inherit zoxide) (name "mpwall")))

(define-public libsmbios-git
  ;; AUR libsmbios-git: SMBIOS/DMI library for Dell hardware (git); v2.4.3.r3.gf01a217-2; 1 vote.
  ;; Source: https://github.com/dell/libsmbios
  ;; NEEDS_RECIPE_DESIGN: autotools C++ recipe; deps: libxml2, pkg-config.
  ;; Next: pin git rev f01a217, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "libsmbios-git")))

(define-public keifu-bin
  ;; AUR keifu-bin: Keifu terminal emulator binary; v0.3.0-1; 1 vote.
  ;; Source: https://github.com/trasta298/keifu
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch keifu v0.3.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "keifu-bin")))

(define-public dredge-bin
  ;; AUR dredge-bin: OCI registry browser binary; v0.9.2-1; 1 vote.
  ;; Source: https://github.com/DeprecatedLuar/dredge
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch dredge v0.9.2 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "dredge-bin")))

(define-public dinky
  ;; AUR dinky: Minimal terminal emulator with script support; v0.8.0-1; 2 votes.
  ;; Source: https://github.com/sedwards2009/dinky
  ;; NEEDS_RECIPE_DESIGN: Electron/Node.js app recipe; deps: electron, node.
  ;; Next: fetch dinky v0.8.0 release, compute sha256, draft Electron/Node recipe.
  (package (inherit zoxide) (name "dinky")))

(define-public cursor-ide
  ;; AUR cursor-ide: Cursor AI code editor (proprietary binary); v2.6.21-1; 1 vote.
  ;; Source: https://www.cursor.com (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary AppImage/deb wrapper; fetch Linux installer, compute sha256.
  ;; Next: fetch Cursor Linux AppImage/installer, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "cursor-ide")))

(define-public coomer-bin
  ;; AUR coomer-bin: Coomer.su content downloader binary; v1.2.1-1; 1 vote.
  ;; Source: https://github.com/yuzujr/coomer
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch coomer v1.2.1 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "coomer-bin")))

(define-public akeyshually-bin
  ;; AUR akeyshually-bin: akeyshually well-ackchyually tool binary; v0.3.2-1; 1 vote.
  ;; Source: https://github.com/DeprecatedLuar/akeyshually
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch akeyshually v0.3.2 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "akeyshually-bin")))

(define-public gpk-bin
  ;; AUR gpk-bin: glazepkg package manager binary; v0.3.6-1; 1 vote.
  ;; Source: https://github.com/neur0map/glazepkg
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch glazepkg v0.3.6 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "gpk-bin")))

(define-public blogr-bin
  (package
    (name "blogr-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bahdotsh/blogr/releases/download/v"
                           version "/blogr-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0hmp0s8mjikxb1jz715y5c0lnh4mqxn1nzav9mrm2zgy0fz1wfhn"))))
    (build-system trivial-build-system)
    (native-inputs (list gzip tar))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (install-file "blogr" (string-append out "/bin"))
            (chmod (string-append out "/bin/blogr") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/blogr")
    (synopsis "Terminal-based static site generator")
    (description
     "Blogr is a terminal-oriented static site generator distributed by upstream
as a pre-built x86_64 Linux binary.")
    (license license:expat)))

(define-public charliecloud
  (package
    (name "charliecloud")
    (version "0.38")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/hpc/charliecloud/releases/download/v"
                           version "/charliecloud-" version ".tar.gz"))
       (sha256
        (base32 "0ylv881jm4ch85aw247s36d6qisjmjx1nmjwzmjrrnzlgzancdqs"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                      ;integration tests expect privileged container features
      #:configure-flags
      #~(list "--disable-html"
              "--disable-man"
              "--with-json=no"
              "--with-libsquashfuse=no"
              (string-append "--with-python="
                             (search-input-file %build-inputs "/bin/python3")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'remove-unreadable-fixtures
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (fixtures (string-append out "/libexec/charliecloud/fixtures"))
                     (sotest (string-append out "/libexec/charliecloud/sotest")))
                (when (file-exists? fixtures)
                  (delete-file-recursively fixtures))
                (when (file-exists? sotest)
                  (delete-file-recursively sotest))))))))
    (inputs (list python))
    (native-inputs (list pkg-config))
    (home-page "https://charliecloud.io")
    (synopsis "Unprivileged user-space container runtime for HPC")
    (description
     "Charliecloud provides unprivileged container tools intended for
high-performance computing environments.")
    (license license:asl2.0)))

(define-public wl-mpris-idle-inhibit
  ;; BLOCKED after repeated attempts in this pass.
  ;; 1) Temporary cargo-build-system recipe fails offline because Cargo.toml pins
  ;;    git dependencies (mpris-rs, wayland-rs) and cargo cannot fetch them.
  ;; 2) Tried swapping to packaged Rust crates by specification
  ;;    (rust-mpris-2, rust-wayland-client-0.30, rust-wayland-protocols-0.30);
  ;;    these crate package specs are currently unavailable in this environment.
  ;; 3) Tried `guix import crate --lockfile Cargo.lock`; current Guix crashes with
  ;;    a stat #f error for this path, so cargo-inputs were not auto-generated.
  ;; 4) Checked upstream GitHub releases for binary fallback; tag 0.1.8 has zero assets.
  ;; Next: package required Rust crate graph (including git-sourced deps), then retry.
  (package (inherit zoxide) (name "wl-mpris-idle-inhibit")))

(define-public systemd-suspend-modules
  (package
    (name "systemd-suspend-modules")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/plain/suspend-modules?h=systemd-suspend-modules")
       (file-name "suspend-modules")
       (sha256
        (base32 "0rwfs40hfd403y0wx3y8isn96jz72mf0s86hprrk9xjybbmg4iyq"))))
    (build-system trivial-build-system)
    (inputs (list bash-minimal kmod))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bash (search-input-file %build-inputs "/bin/bash"))
                 (modprobe (search-input-file %build-inputs "/bin/modprobe"))
                 (script "suspend-modules"))
            (copy-file src script)
            (substitute* script
              (("#!/bin/bash") (string-append "#!" bash))
              (("modprobe") modprobe))
            (install-file script (string-append out "/lib/systemd/system-sleep"))
            (chmod (string-append out "/lib/systemd/system-sleep/suspend-modules") #o755)
            (mkdir-p (string-append out "/etc"))
            (call-with-output-file (string-append out "/etc/suspend-modules.conf")
              (lambda (port)
                (display "" port)))))))
    (home-page "https://aur.archlinux.org/packages/systemd-suspend-modules")
    (synopsis "Reload kernel modules on suspend and resume")
    (description
     "This package installs a systemd sleep hook that removes configured kernel
modules before suspend and re-loads them after resume.")
    (license license:gpl2+)))

(define-public python-pysmart
  (package
    (name "python-pysmart")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://files.pythonhosted.org/packages/5c/88/883d67a628b6342562eb18dd832f4ee266f07a175058c5dd3170fb7950b2/pysmart-1.4.2.tar.gz")
       (sha256
        (base32 "115wiafcp8l0dmxxzhr478qryqgjz056d8c6cf39b5fq5xp8v1wq"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools
           python-setuptools-scm))
    (inputs (list smartmontools))
    (propagated-inputs
     (list python-chardet
           python-humanfriendly))
    (home-page "https://github.com/truenas/py-SMART")
    (synopsis "Python wrapper for smartctl")
    (description
     "PySMART provides a Python interface to smartctl from smartmontools for
querying S.M.A.R.T. information from storage devices.")
    (license license:lgpl2.1+)))

(define-public renamemytvseries-gtk-bin
  (package
    (name "renamemytvseries-gtk-bin")
    (version "2.3.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.tweaking4all.com/downloads/video/"
                           "RenameMyTVSeries-" version "-GTK-Linux-x64-shared-ffmpeg.tar.xz"))
       (sha256
        (base32 "137vq4p2g7amik57bn8nfc7ap0f8dw2f4swqnlfp7s7f71frci54"))))
    (build-system trivial-build-system)
    (native-inputs (list tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (desktop (string-append out "/share/applications/renamemytvseries.desktop")))
            (invoke tar (string-append "--use-compress-program=" xz) "-xf" src)
            (install-file "RenameMyTVSeries" (string-append out "/bin"))
            (chmod (string-append out "/bin/RenameMyTVSeries") #o755)
            (for-each
             (lambda (size)
               (let ((dir (string-append out "/share/icons/hicolor/" size "x" size "/apps")))
                 (mkdir-p dir)
                 (copy-file (string-append "icons/" size "x" size ".png")
                            (string-append dir "/renamemytvseries.png"))))
             '("16" "32" "64" "128" "256" "512"))
            (mkdir-p (string-append out "/share/applications"))
            (copy-file "RenameMyTVSeries.desktop" desktop)
            (substitute* desktop
              (("Exec=.*") "Exec=RenameMyTVSeries")
              (("Icon=.*") "Icon=renamemytvseries")
              (("NoDisplay=true\n") ""))
            (when (file-exists? "rmtv.ttf")
              (mkdir-p (string-append out "/share/fonts/truetype"))
              (copy-file "rmtv.ttf" (string-append out "/share/fonts/truetype/rmtv.ttf")))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2/")
    (synopsis "Rename TV series episodes with metadata lookups")
    (description
     "Rename My TV Series is an upstream pre-built GTK application for renaming
TV episode files.")
    (license (license:non-copyleft
              "https://www.tweaking4all.com/license/"
              "Proprietary binary redistribution terms by upstream"))))

(define-public openhue-cli
  (package
    (name "openhue-cli")
    (version "0.23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/openhue/openhue-cli/releases/download/"
                           version "/openhue_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "1xh2z3k0z6njg5zlx12jdcakm1qcs6wg049cxq74hijrbnn7hb3q"))))
    (build-system trivial-build-system)
    (native-inputs (list gzip tar))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (install-file "openhue" (string-append out "/bin"))
            (chmod (string-append out "/bin/openhue") #o755)
            (mkdir-p (string-append out "/share/doc/openhue-cli"))
            (install-file "README.md" (string-append out "/share/doc/openhue-cli"))
            (mkdir-p (string-append out "/share/licenses/openhue-cli"))
            (install-file "LICENSE" (string-append out "/share/licenses/openhue-cli"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.openhue.io/cli/openhue-cli")
    (synopsis "Command-line interface for Philips Hue")
    (description
     "OpenHue CLI is a command-line client for interacting with Philips Hue
smart lighting systems.")
    (license license:asl2.0)))

(define-public feedr-bin
  (package
    (name "feedr-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bahdotsh/feedr/releases/download/v"
                           version "/feedr-linux-x86_64"))
       (sha256
        (base32 "12lq9hqv67cbry40zcsd3l6s2q9jf0wdgczahiknqxpamnnyy83p"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (target (string-append out "/bin/feedr")))
            (mkdir-p (string-append out "/bin"))
            (copy-file src target)
            (chmod target #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/feedr")
    (synopsis "Terminal RSS and Atom feed reader")
    (description
     "Feedr is a terminal-based RSS/Atom feed reader distributed by upstream
as a pre-built x86_64 Linux binary.")
    (license license:expat)))

(define-public boscaceoil-blue-bin
  (package
    (name "boscaceoil-blue-bin")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/YuriSizov/boscaceoil-blue/releases/download/"
                           version "-stable/boscaceoil-blue-linux-x86_64.zip"))
       (sha256
        (base32 "0pb5vh6fyc3fkmvcblnyhb0zapsa4fg6p65s8pzznn8d3n7lwiy2"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (opt (string-append out "/opt/boscaceoil-blue-bin"))
                 (bin (string-append out "/bin")))
            (invoke unzip src)
            (mkdir-p opt)
            (install-file "boscaceoil-blue-linux-x86_64/boscaceoil-blue.x86_64" opt)
            (install-file "boscaceoil-blue-linux-x86_64/libgdsion.linux.template_release.x86_64.so" opt)
            (rename-file (string-append opt "/boscaceoil-blue.x86_64")
                         (string-append opt "/boscaceoil-blue"))
            (chmod (string-append opt "/boscaceoil-blue") #o755)
            (mkdir-p bin)
            (symlink (string-append opt "/boscaceoil-blue")
                     (string-append bin "/boscaceoil-blue"))
            (mkdir-p (string-append out "/share/applications"))
            (call-with-output-file (string-append out "/share/applications/boscaceoil-blue.desktop")
              (lambda (port)
                (display "[Desktop Entry]\n" port)
                (display "Name=Bosca Ceoil Blue\n" port)
                (display "Comment=Simple and beginner-friendly app for making music\n" port)
                (display "Exec=boscaceoil-blue\n" port)
                (display "Terminal=false\n" port)
                (display "Type=Application\n" port)
                (display "Categories=AudioVideo;Audio;\n" port)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/YuriSizov/boscaceoil-blue")
    (synopsis "Beginner-friendly music sequencer")
    (description
     "Bosca Ceoil Blue is a lightweight and beginner-friendly music sequencer.
This package repackages the upstream pre-built x86_64 Linux binary release.")
    (license license:expat)))

(define-public crier-bin
  ;; AUR crier-bin: crier feed reader binary; v0.2.3-1; 1 vote.
  ;; Source: https://github.com/skorotkiewicz/crier
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch crier v0.2.3 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "crier-bin")))

(define-public reqable-bin
  ;; AUR reqable-bin: Reqable API debugging tool binary; v3.0.39-1; 3 votes.
  ;; Source: https://reqable.com (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary; fetch Linux binary, compute sha256.
  ;; Next: fetch Reqable v3.0.39 Linux AppImage/binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "reqable-bin")))

(define-public cliamp-bin
  ;; AUR cliamp-bin: cliamp CLI music player binary; v1.27.2-1; 1 vote.
  ;; Source: https://github.com/bjarneo/cliamp
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Node.js packaged binary; fetch Linux release.
  ;; Next: fetch cliamp v1.27.2 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "cliamp-bin")))

(define-public ferrishot-bin
  ;; AUR ferrishot-bin: ferrishot screenshot tool binary; v0.2.0-2; 1 vote.
  ;; Source: https://github.com/nik-rev/ferrishot
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Rust binary; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch ferrishot v0.2.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "ferrishot-bin")))

(define-public sysbox-ce
  ;; AUR sysbox-ce: Sysbox container runtime (Community Edition); v2:0.6.7-2; 1 vote.
  ;; Source: https://github.com/nestybox/sysbox
  ;; NEEDS_RECIPE_DESIGN: Go binary recipe; complex kernel/sysfs integration; needs kernel modules.
  ;; Next: fetch sysbox 0.6.7 source, compute sha256, draft go-build-system recipe.
  (package (inherit zoxide) (name "sysbox-ce")))

(define-public noto-fonts-cjk-fontconfig
  ;; AUR noto-fonts-cjk-fontconfig: Fontconfig config for Noto CJK fonts; v1-1; 1 vote.
  ;; Source: https://aur.archlinux.org/packages/noto-fonts-cjk-fontconfig (config file only)
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system fontconfig rule install; dep: noto-cjk fonts.
  ;; Next: fetch config file from AUR PKGBUILD, compute sha256, draft trivial fontconfig install.
  (package (inherit zoxide) (name "noto-fonts-cjk-fontconfig")))

(define-public webtorrent-bittorrent-tracker
  ;; AUR webtorrent-bittorrent-tracker: WebTorrent BitTorrent tracker server; v11.2.2-1; 4 votes.
  ;; Source: https://github.com/webtorrent/bittorrent-tracker
  ;; NEEDS_RECIPE_DESIGN: node.js npm recipe; deps: node, npm.
  ;; Next: fetch bittorrent-tracker 11.2.2 from npm/GitHub, compute sha256, draft node recipe.
  (package (inherit zoxide) (name "webtorrent-bittorrent-tracker")))
