;;; Blocked notes for queue-20260325p100d queue drain (2026-03-25 pass-d, packages 5346-5445).
;;; 3 entries resolved via Guix upstream aliases (DONE).
;;; 97 NEEDS_RECIPE_DESIGN stubs.
(define-module (gaurix packages queue-20260325p100d-blocked-notes)
  #:export (queue-20260325p100d-blocked-notes))

(define queue-20260325p100d-blocked-notes
  (list

  ;; ── Guix upstream aliases (DONE) ────────────────────────────────────

  '(kquickimageeditor5 DONE
    "Maps to Guix kquickimageeditor 0.5.1 (gnu/packages/kde-graphics.scm)"
    "KF5 split name; Guix ships unified kquickimageeditor"
    "Exported alias: (package (inherit kquickimageeditor) (name \"kquickimageeditor5\"))")

  '(modemmanager-qt5 DONE
    "Maps to Guix modemmanager-qt 6.19.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 split name; Guix ships unified modemmanager-qt"
    "Exported alias: (package (inherit modemmanager-qt) (name \"modemmanager-qt5\"))")

  '(kdnssd5 DONE
    "Maps to Guix kdnssd 6.19.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 split name; Guix ships unified kdnssd"
    "Exported alias: (package (inherit kdnssd) (name \"kdnssd5\"))")

  ;; ── NEEDS_RECIPE_DESIGN stubs ────────────────────────────────────────

  '(kotlin-language-server NEEDS_RECIPE_DESIGN
    "Source: https://github.com/fwcd/kotlin-language-server v1.3.13"
    "JVM/Gradle recipe; deps: JDK 11+, kotlin, gradle"
    "Next: fetch release tarball, compute sha256, draft gradle recipe")

  '(shimmer-wallpapers NEEDS_RECIPE_DESIGN
    "Source: http://shimmerproject.org (git, ba134cb)"
    "Trivial wallpaper install; pin git commit"
    "Next: fetch archive at pinned commit, compute sha256, draft trivial install")

  '(gtkhash NEEDS_RECIPE_DESIGN
    "Source: https://github.com/tristanheaven/gtkhash v1.5"
    "Autotools C+GTK3 recipe; deps: gtk3, libgcrypt, openssl"
    "Next: fetch gtkhash-1.5.tar.gz, compute sha256, draft autotools recipe")

  '(xbindkeys-config-gtk2 NEEDS_RECIPE_DESIGN
    "Source: https://github.com/rgeorgiev583/xbindkeys_config v0.1.4"
    "Python/GTK2 recipe; deps: pygtk, xbindkeys"
    "Next: fetch release, compute sha256, draft python recipe with GTK2 dep")

  '(bsdiff NEEDS_RECIPE_DESIGN
    "Source: https://www.daemonology.net/bsdiff/ v4.3"
    "C make recipe; deps: bzip2"
    "Next: fetch bsdiff4.3.tar.gz, compute sha256, draft simple make recipe")

  '(qt5-webview NEEDS_RECIPE_DESIGN
    "Source: https://www.qt.io (Qt5.15 qtwebview submodule) v5.15.16"
    "cmake Qt5 recipe; deps: qtbase5, qtdeclarative5, qtwebengine"
    "Next: fetch Qt5 qtwebview 5.15.16 source, compute sha256, draft cmake recipe")

  '(sc NEEDS_RECIPE_DESIGN
    "Source: https://ibiblio.org/pub/linux/apps/financial/spreadsheet/ v7.16"
    "C make recipe; deps: ncurses, bison"
    "Next: fetch sc-7.16 tarball, compute sha256, draft simple make recipe")

  '(blocky-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/0xERR0R/blocky v0.29.0"
    "Binary wrapper; fetch Linux amd64 blocky_Linux_x86_64.tar.gz from GitHub releases"
    "Next: fetch binary, compute sha256, draft binary wrapper")

  '(tut NEEDS_RECIPE_DESIGN
    "Source: https://github.com/RasmusLindroth/tut v2.0.1"
    "Go recipe; deps: go, libnotify, xdg-utils"
    "Next: fetch tut v2.0.1 source, compute sha256, draft go-build-system recipe")

  '(gcolor2 NEEDS_RECIPE_DESIGN
    "Source: http://gcolor2.sf.net/ v0.4"
    "Autotools C+GTK2 recipe; deps: gtk2, libglade2"
    "Next: fetch gcolor2-0.4.tar.gz, compute sha256, draft autotools recipe")

  '(breeze-hacked-cursor-theme-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/clayrisser/breeze-hacked-cursor-theme (rev 79dcc89)"
    "Trivial xcursor theme install; pin git commit"
    "Next: fetch at pinned rev, compute sha256, draft trivial xcursor install")

  '(lyricsfinder NEEDS_RECIPE_DESIGN
    "Source: https://www.mediahuman.com/lyrics-finder v1.7.0 (proprietary binary)"
    "Binary wrapper; proprietary; needs Linux binary identification from vendor"
    "Next: fetch Linux release from MediaHuman, compute sha256, draft binary wrapper")

  '(libreoffice-extension-apso NEEDS_RECIPE_DESIGN
    "Source: https://gitlab.com/jmzambon/apso v1.4.5.5"
    "oxt extension install recipe; dep: libreoffice"
    "Next: fetch apso-1.4.5.5.oxt, compute sha256, draft trivial libreoffice extension install")

  '(khtml NEEDS_RECIPE_DESIGN
    "Source: https://community.kde.org/Frameworks (KDE invent) v5.115.0"
    "cmake KDE Frameworks recipe; large dep chain; requires kdelibs compat"
    "Next: fetch khtml-5.115.0, compute sha256, draft cmake KDE recipe")

  '(efibooteditor-qt5 NEEDS_RECIPE_DESIGN
    "Source: https://github.com/Neverous/efibooteditor v1.5.6"
    "cmake Qt5 recipe; deps: qt5, efivar, efibootmgr"
    "Next: fetch efibooteditor v1.5.6, compute sha256, draft cmake Qt5 recipe")

  '(efibooteditor NEEDS_RECIPE_DESIGN
    "Source: https://github.com/Neverous/efibooteditor v1.5.6"
    "cmake Qt6 recipe; deps: qt6, efivar, efibootmgr"
    "Next: fetch efibooteditor v1.5.6, compute sha256, draft cmake Qt6 recipe")

  '(zsh-you-should-use NEEDS_RECIPE_DESIGN
    "Source: https://github.com/MichaelAquilina/zsh-you-should-use v1.10.0"
    "Trivial zsh plugin install; minimal deps"
    "Next: fetch v1.10.0 release, compute sha256, draft trivial zsh plugin recipe")

  '(grub2-theme-archxion NEEDS_RECIPE_DESIGN
    "Source: https://github.com/ochurlaud/grub2-themes-archlinux v1.0"
    "Trivial GRUB theme install"
    "Next: fetch release archive, compute sha256, draft trivial GRUB theme install")

  '(bwidget NEEDS_RECIPE_DESIGN
    "Source: https://wiki.tcl.tk/2251 (tcllib) v1.10.1"
    "Trivial Tcl library install; dep: tcl"
    "Next: fetch BWidget-1.10.1.tar.gz, compute sha256, draft trivial tcl install")

  '(gpth-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper v3.4.3"
    "Binary wrapper; Python self-contained binary; fetch Linux binary from GitHub releases"
    "Next: fetch gpth Linux binary, compute sha256, draft binary wrapper")

  '(python-gdbgui NEEDS_RECIPE_DESIGN
    "Source: https://github.com/cs01/gdbgui v0.15.3.0"
    "python-build-system; deps: python-flask, python-pygments, gdb"
    "Next: fetch gdbgui 0.15.3.0 from PyPI, compute sha256, draft python recipe")

  '(markdown-editor NEEDS_RECIPE_DESIGN
    "Source: https://github.com/ncornette/Python-Markdown-Editor v1.0.7"
    "python-build-system; deps: python-markdown, python-flask"
    "Next: fetch Python-Markdown-Editor 1.0.7, compute sha256, draft python recipe")

  '(mystiq NEEDS_RECIPE_DESIGN
    "Source: https://github.com/biglinux/MystiQ v24.06.15"
    "cmake Qt5/Qt6 recipe; deps: qt, ffmpeg"
    "Next: fetch MystiQ 24.06.15 tarball, compute sha256, draft cmake recipe")

  '(subsurface-appimage NEEDS_RECIPE_DESIGN
    "Source: https://subsurface-divelog.org/ v6.0.5404"
    "AppImage binary wrapper; fetch Linux AppImage for x86_64"
    "Next: fetch Subsurface AppImage, compute sha256, draft AppImage wrapper")

  '(firefox-extension-privacybadger NEEDS_RECIPE_DESIGN
    "Source: https://www.eff.org/privacybadger v2026.2.20"
    "xpi extension install; dep: icecat or firefox"
    "Next: fetch privacybadger xpi from AMO/EFF, compute sha256, draft extension install")

  '(pidgin-extprefs NEEDS_RECIPE_DESIGN
    "Source: http://gaim-extprefs.sourceforge.net/ v0.7"
    "Autotools C plugin; deps: pidgin, gtk2, glib"
    "Next: fetch extprefs-0.7 from SourceForge, compute sha256, draft autotools plugin recipe")

  '(remmina-plugin-rdesktop NEEDS_RECIPE_DESIGN
    "Source: http://www.muflone.com/remmina-plugin-rdesktop/ v1.3.0.0"
    "cmake C plugin; deps: remmina, rdesktop, glib, gtk3"
    "Next: fetch remmina-plugin-rdesktop 1.3.0.0, compute sha256, draft cmake plugin recipe")

  '(freetuxtv NEEDS_RECIPE_DESIGN
    "Source: https://github.com/freetuxtv/freetuxtv v0.6.8"
    "Autotools C+GTK3; deps: gtk3, vlc/gstreamer, sqlite3"
    "Next: fetch freetuxtv-0.6.8, compute sha256, draft autotools recipe")

  '(oh-my-zsh-powerline-theme-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme (rev 8df8e04)"
    "Trivial zsh theme install; dep: powerline-fonts"
    "Next: pin git commit, compute sha256, draft trivial theme install")

  '(joy2key NEEDS_RECIPE_DESIGN
    "Source: https://sourceforge.net/projects/joy2key/ v1.6.3"
    "C autotools recipe; deps: libc, X11 optional"
    "Next: fetch joy2key-1.6.3 from SourceForge, compute sha256, draft autotools recipe")

  '(bullet-train-oh-my-zsh-theme-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/caiogondim/bullet-train-oh-my-zsh-theme (rev d60f62c)"
    "Trivial zsh theme install; pin git commit"
    "Next: pin git rev, compute sha256, draft trivial zsh theme install")

  '(gnome-shell-extension-dash-to-panel-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/home-sweet-gnome/dash-to-panel (rev 7af6ce4)"
    "Trivial GNOME extension install; pin git commit"
    "Next: pin git rev, compute sha256, draft trivial GNOME extension install")

  '(suru-plus-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/gusbemacbe/suru-plus v30.0"
    "Trivial icon theme install; pin git commit"
    "Next: pin git commit, compute sha256, draft trivial icon install")

  '(themix-gui-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/themix-project/oomox v1.15.1"
    "python-build-system; deps: python-gtk, python-cairo, librsvg"
    "Next: pin git commit, compute sha256, draft python recipe with GTK deps")

  '(themix-theme-oomox-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/themix-project/oomox-gtk-theme v1.12.8"
    "Trivial GTK theme install; deps: gtk-engines, sass"
    "Next: pin git commit, compute sha256, draft trivial GTK theme install")

  '(themix-plugin-base16-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/themix-project/themix-plugin-base16 v1.6.2"
    "python-build-system plugin; dep: themix-gui"
    "Next: pin git commit, compute sha256, draft python plugin install")

  '(themix-icons-numix-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/numixproject/numix-icon-theme (rev b5001d962)"
    "Trivial icon theme install; pin git commit"
    "Next: pin git commit, compute sha256, draft trivial icon install")

  '(vim-systemd NEEDS_RECIPE_DESIGN
    "Source: https://github.com/wgwoods/vim-scripts (rev 7c4724d)"
    "Trivial vim plugin install; dep: vim"
    "Next: pin git commit, compute sha256, draft trivial vim plugin install")

  '(themix-import-images-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/themix-project/oomox v1.15.1"
    "python-build-system plugin; dep: themix-gui, pillow"
    "Next: pin git commit, compute sha256, draft python import-images plugin")

  '(themix-icons-suru-plus-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/gusbemacbe/suru-plus/ v30.0.r2"
    "Trivial icon theme install; pin git commit"
    "Next: pin git commit, compute sha256, draft trivial icon install")

  '(themix-icons-suru-plus-aspromauros-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/gusbemacbe/suru-plus-aspromauros/ v3.0.r0"
    "Trivial icon theme install; pin git commit"
    "Next: pin git commit, compute sha256, draft trivial icon install")

  '(themix-icons-papirus-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/ 20220910.r12"
    "Trivial icon theme install; pin git commit"
    "Next: pin git commit, compute sha256, draft trivial icon install")

  '(themix-icons-gnome-colors-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/themix-project/gnome-colors-icon-theme v5.5.6.r0"
    "Trivial icon theme install; pin git commit"
    "Next: pin git commit, compute sha256, draft trivial icon install")

  '(themix-icons-archdroid-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/themix-project/archdroid-icon-theme v1.0.3.r0"
    "Trivial icon theme install; pin git commit"
    "Next: pin git commit, compute sha256, draft trivial icon install")

  '(themix-export-spotify-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/themix-project/oomoxify v1.2.9"
    "python-build-system plugin; dep: spicetify or spotify"
    "Next: pin git commit, compute sha256, draft python export-spotify plugin")

  '(themix-theme-materia-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/nana-4/materia-theme 20210322.r6"
    "meson GTK theme recipe; deps: gtk-murrine-engine, sass, inkscape"
    "Next: pin git commit, compute sha256, draft meson GTK theme recipe")

  '(pkgbuild-assistant NEEDS_RECIPE_DESIGN
    "Source: https://github.com/skykeyjoker/PKGBUILD-Assistant v2.2.0"
    "cmake Qt5 recipe; deps: qt5-base, qt5-declarative"
    "Next: fetch v2.2.0 tarball, compute sha256, draft cmake Qt5 recipe")

  '(gede NEEDS_RECIPE_DESIGN
    "Source: https://gede.dexar.se/ v2.19.3"
    "qmake Qt5 recipe; deps: qt5, gdb"
    "Next: fetch gede-2.19.3 source, compute sha256, draft qmake Qt5 recipe")

  '(grub-reboot-picker NEEDS_RECIPE_DESIGN
    "Source: https://github.com/mendhak/grub-reboot-picker v0.0.11"
    "python/GTK recipe or AppImage; determine release format"
    "Next: fetch v0.0.11 release, determine format, compute sha256, draft recipe")

  '(xdg-launch NEEDS_RECIPE_DESIGN
    "Source: http://github.com/bbidulock/xdg-launch v1.12"
    "Autotools C recipe; deps: libxde, xdg-utils, libunique"
    "Next: fetch xdg-launch-1.12 tarball, compute sha256, draft autotools recipe")

  '(googlemaps NEEDS_RECIPE_DESIGN
    "Source: https://github.com/vladest/googlemaps 20240121"
    "cmake Qt5 QML plugin; deps: qt5-location, qt5-declarative"
    "Next: pin git commit at 20240121, compute sha256, draft cmake Qt5 QML recipe")

  '(bdinfo-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/schnusch/bdinfo (rev 4b534fb)"
    "python-build-system; deps: python, libbluray"
    "Next: pin git rev, compute sha256, draft python recipe with libbluray dep")

  '(aacs-keydb NEEDS_RECIPE_DESIGN
    "Source: http://fvonline-db.bplaced.net/ v1.0"
    "Trivial data file install; fetch keydb.cfg"
    "Next: fetch keydb.cfg, compute sha256, draft trivial data install")

  '(vim-pkgbuild-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/m-pilia/vim-pkgbuild (rev 2469a0a)"
    "Trivial vim plugin install; pin git commit"
    "Next: pin git rev, compute sha256, draft trivial vim plugin install")

  '(scnlib NEEDS_RECIPE_DESIGN
    "Source: https://github.com/eliaskosunen/scnlib v4.0.1"
    "cmake C++ library recipe; deps: cmake, C++17"
    "Next: fetch scnlib-4.0.1 tarball, compute sha256, draft cmake recipe")

  '(pacnews-neovim-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/pbrisbin/dotfiles (rev d78c8ac, tag v1.0)"
    "Trivial script install; dep: neovim"
    "Next: fetch script at pinned rev, compute sha256, draft trivial install")

  '(kapp NEEDS_RECIPE_DESIGN
    "Source: https://carvel.dev/kapp v0.65.1 (GitHub releases binary)"
    "Binary wrapper; fetch kapp-linux-amd64 v0.65.1 from GitHub releases"
    "Next: fetch binary, compute sha256, draft binary wrapper")

  '(hotshots-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/obiwankennedy/HotShots (rev e3712ae)"
    "cmake Qt5 recipe; deps: qt5, libqxt"
    "Next: pin git rev, compute sha256, draft cmake Qt5 recipe")

  '(grub-imageboot NEEDS_RECIPE_DESIGN
    "Source: https://launchpad.net/ubuntu/+source/grub-imageboot/ v0.6+nmu2"
    "Trivial GRUB script install; dep: grub2"
    "Next: fetch grub-imageboot_0.6+nmu2 source, compute sha256, draft trivial install")

  '(git-mr NEEDS_RECIPE_DESIGN
    "Source: https://gitlab.com/glensc/git-mr/ v1.0.0"
    "Trivial shell script install; deps: git, curl, jq"
    "Next: fetch v1.0.0 from GitLab, compute sha256, draft trivial script install")

  '(bomberclone NEEDS_RECIPE_DESIGN
    "Source: https://www.bomberclone.de/core.html v0.11.9"
    "Autotools C+SDL; deps: sdl, sdl-net, sdl-image"
    "Next: fetch bomberclone-0.11.9 tarball, compute sha256, draft autotools SDL recipe")

  '(ytui-music-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/sudipghimire533/ytui-music v2.0.0"
    "cargo build recipe; deps: rust, mpv, yt-dlp"
    "Next: pin git commit for v2.0.0, compute sha256, draft cargo recipe")

  '(ymp-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/trap251/ymp v0.2.1"
    "Binary wrapper; fetch Linux binary from GitHub releases"
    "Next: fetch ymp v0.2.1 Linux binary, compute sha256, draft binary wrapper")

  '(wem NEEDS_RECIPE_DESIGN
    "Source: https://gitlab.com/hristoast/wem v0.14.0"
    "python-build-system; deps: python-evdev, python-uinput"
    "Next: fetch wem 0.14.0 from GitLab, compute sha256, draft python recipe")

  '(ttypr-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/tanciaku/ttypr v0.3.6"
    "Binary wrapper; fetch Linux amd64 binary from GitHub releases"
    "Next: fetch ttypr v0.3.6 Linux binary, compute sha256, draft binary wrapper")

  '(tokenicode-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/yiliqi78/TOKENICODE v0.8.23"
    "Binary wrapper; fetch Linux binary from GitHub releases"
    "Next: fetch TOKENICODE v0.8.23 Linux binary, compute sha256, draft binary wrapper")

  '(seadrive-cli NEEDS_RECIPE_DESIGN
    "Source: https://github.com/seafileltd/seadrive-fuse v3.0.20"
    "cmake C recipe; deps: fuse3, libseafile, sqlite, glib"
    "Next: fetch seadrive-fuse 3.0.20, compute sha256, draft cmake recipe")

  '(saul-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/DeprecatedLuar/better-curl-saul v0.3.4"
    "Binary wrapper; fetch Linux amd64 binary from GitHub releases"
    "Next: fetch saul v0.3.4 Linux binary, compute sha256, draft binary wrapper")

  '(python-pytest-archon NEEDS_RECIPE_DESIGN
    "Source: https://github.com/jwbargsten/pytest-archon v0.0.7 (PyPI)"
    "python-build-system; deps: python-pytest"
    "Next: fetch pytest-archon 0.0.7 from PyPI, compute sha256, draft python recipe")

  '(plann NEEDS_RECIPE_DESIGN
    "Source: https://github.com/tobixen/plann v1.0.0"
    "python-build-system; deps: python-caldav, python-click"
    "Next: fetch plann 1.0.0 from PyPI/GitHub, compute sha256, draft python recipe")

  '(pencil-dev-appimage NEEDS_RECIPE_DESIGN
    "Source: https://pencil.dev (GitHub: pencil2d/pencil) v1.1.38"
    "AppImage binary wrapper; fetch Linux AppImage for x86_64"
    "Next: fetch Pencil2D AppImage v1.1.38, compute sha256, draft AppImage wrapper")

  '(ocr4linux-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/moheladwy/OCR4Linux (rev 0ef3354)"
    "python-build-system; deps: python-pytesseract, python-pillow, tesseract"
    "Next: pin git rev, compute sha256, draft python recipe")

  '(mpwall NEEDS_RECIPE_DESIGN
    "Source: https://github.com/Lamess-UI/mpwall v1.0.5"
    "Shell script recipe; deps: mpv, xrandr"
    "Next: fetch v1.0.5, compute sha256, draft trivial script install")

  '(libsmbios-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/dell/libsmbios (rev f01a217)"
    "Autotools C++ recipe; deps: libxml2, pkg-config"
    "Next: pin git rev, compute sha256, draft autotools recipe")

  '(keifu-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/trasta298/keifu v0.3.0"
    "Binary wrapper; fetch Linux amd64 binary from GitHub releases"
    "Next: fetch keifu v0.3.0 Linux binary, compute sha256, draft binary wrapper")

  '(dredge-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/DeprecatedLuar/dredge v0.9.2"
    "Binary wrapper; fetch Linux amd64 binary from GitHub releases"
    "Next: fetch dredge v0.9.2 Linux binary, compute sha256, draft binary wrapper")

  '(dinky NEEDS_RECIPE_DESIGN
    "Source: https://github.com/sedwards2009/dinky v0.8.0"
    "Electron/Node.js app recipe; deps: electron, node"
    "Next: fetch dinky v0.8.0, compute sha256, draft Electron/Node recipe")

  '(cursor-ide NEEDS_RECIPE_DESIGN
    "Source: https://www.cursor.com v2.6.21 (proprietary)"
    "Binary AppImage/deb wrapper; proprietary; fetch Linux installer"
    "Next: fetch Cursor Linux AppImage/installer, compute sha256, draft binary wrapper")

  '(coomer-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/yuzujr/coomer v1.2.1"
    "Binary wrapper; fetch Linux amd64 binary from GitHub releases"
    "Next: fetch coomer v1.2.1 Linux binary, compute sha256, draft binary wrapper")

  '(akeyshually-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/DeprecatedLuar/akeyshually v0.3.2"
    "Binary wrapper; fetch Linux amd64 binary from GitHub releases"
    "Next: fetch akeyshually v0.3.2 Linux binary, compute sha256, draft binary wrapper")

  '(gpk-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/neur0map/glazepkg v0.3.6"
    "Binary wrapper; fetch Linux amd64 binary from GitHub releases"
    "Next: fetch glazepkg v0.3.6 Linux binary, compute sha256, draft binary wrapper")

  '(wl-mpris-idle-inhibit NEEDS_RECIPE_DESIGN
    "Source: https://github.com/sameer/wl-mpris-idle-inhibit v0.1.8"
    "Blocked in this pass after 4 attempts: offline cargo fails on git deps, required rust crate specs unavailable, crate import lockfile path crashes, and upstream release has no binary assets"
    "Next: package/update required Rust crate graph (including git-sourced deps), then retry cargo-build-system recipe")

  '(crier-bin DONE
    "Implemented trivial-build-system binary recipe from GitHub release v0.2.3"
    "Installed crier executable plus README and LICENSE from release tarball"
    "Validation: guix build -L guix -f guix/gaurix/packages/queue-20260325p100d.scm -n crier-bin; guix lint -L guix -f guix/gaurix/packages/queue-20260325p100d.scm crier-bin")

  '(reqable-bin DONE
    "Implemented proprietary .deb repack from Reqable GitHub release v3.0.40"
    "Installs app payload under /lib/reqable with launcher and desktop/icon assets"
    "Validation: guix build -L guix -f guix/gaurix/packages/queue-20260325p100d.scm -n reqable-bin; guix lint -L guix -f guix/gaurix/packages/queue-20260325p100d.scm reqable-bin")

  '(cliamp-bin DONE
    "Implemented trivial binary package from upstream cliamp v1.31.7 Linux amd64 release"
    "Direct install of prebuilt cliamp executable into $out/bin"
    "Validation: guix build -L guix -f guix/gaurix/packages/queue-20260325p100d.scm -n cliamp-bin; guix lint -L guix -f guix/gaurix/packages/queue-20260325p100d.scm cliamp-bin")

  '(ferrishot-bin DONE
    "Implemented trivial-build-system package from ferrishot v0.2.0 x86_64 tarball"
    "Installs binary and bundled README/CHANGELOG/license files"
    "Validation: guix build -L guix -f guix/gaurix/packages/queue-20260325p100d.scm -n ferrishot-bin; guix lint -L guix -f guix/gaurix/packages/queue-20260325p100d.scm ferrishot-bin")

  '(sysbox-ce DONE
    "Implemented binary .deb repack from upstream sysbox-ce v0.6.7 release"
    "Installs sysbox-fs/sysbox-mgr/sysbox-runc plus bundled systemd and sysctl files"
    "Validation: guix build -L guix -f guix/gaurix/packages/queue-20260325p100d.scm -n sysbox-ce; guix lint -L guix -f guix/gaurix/packages/queue-20260325p100d.scm sysbox-ce")

  '(noto-fonts-cjk-fontconfig DONE
    "Implemented trivial fontconfig package from pinned AUR 70-noto-cjk.conf"
    "Installs conf.avail snippet and conf.default symlink; propagates Noto CJK font packages"
    "Validation: guix build -L guix -f guix/gaurix/packages/queue-20260325p100d.scm -n noto-fonts-cjk-fontconfig; guix lint -L guix -f guix/gaurix/packages/queue-20260325p100d.scm noto-fonts-cjk-fontconfig")

  '(webtorrent-bittorrent-tracker BLOCKED
    "Attempt 1: upstream/equivalent survey via guix search and repo grep found no existing Guix/Gaurix package to alias"
    "Attempt 2: dependency closure check showed most runtime deps missing in Guix (e.g., node-bencode, node-ws, node-socks, node-run-parallel)"
    "Attempt 3: offline npm install of bittorrent-tracker-11.2.2.tgz failed ENOTCACHED (@thaunknown/simple-peer); GitHub release has no bundled binary assets")

  ))
