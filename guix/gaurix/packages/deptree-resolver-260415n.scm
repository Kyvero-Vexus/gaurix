;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415n
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (            joplin
            komorebi
            liboqs-git
            limine-entry-tool-git
            luminance
            lyrionmusicserver
            materia-transparent-gtk-theme-git
            mesen2-git
            nut-monitor
            openclaw-git
            opendeck-git
            pantheon-settings-daemon-git
            perl-gis-distance-git
            python-qiskit-gym
            qflipper-git
            qtarcan-git
            river-creek
            scx-tools-git
            sddm-conf-git
            serialplot-git
            shadowsocks-libev-static
            sysd-manager
            telegram-tdlib-purple-git
            tmuzika
            tomcat8
            ultimate-doom-builder-git
            way-displays
            wayfarer
            xlibre-video-amdgpu
            ytdownloader-gui
            zelda64recomp-bin
            aeth-git
            autopilot-rs
            balena-etcher
            chawan-git
            com-163-music-spark
            continuwuity-git
            dunelegacy
            flowtime
            ghostmirror
            git-incrypt-git
            gixy-next
            gnome-shell-extension-ddterm-git
            hyprkcs-git
            hyprland-autoname-workspaces-git
            hytale-f2p-git
            i2pd-tools-git
            intellij-idea-open-eap
            kapitano
            kumir2-git
            libggml
            libggml-git
            libvgm-git
            livebook
            loliashizuku-git
            m33mu-git
            nitrox
            noctalia-shell-git
            openmeters-git
            plasma6-applets-kurve-git
            plasma6-applets-thermal-monitor-git
            python-opentelemetry-exporter-prometheus
            python-pymatgen
            qt-web-extractor
            quantum-espresso
            qvtfpp
            rofi-gpaste-git
            roomeqwizard-beta
            rusty-path-of-building
            scrcpy-git
            sitra
            susops
            tosu-overlay-git
            vial-keychron-git
            vim-youcompleteme-git
            vk-hdr-layer-kwin6-git
            vkd3d-proton-git
            vscoq-language-server-git
            vtm
            waydroid-git
            ww-manager))

(define-public joplin
  (package
    (name "joplin")
    (version "3.5.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/joplin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a note taking and to-do application with synchronization capabilities - CLI App")
    (description "A note taking and to-do application with synchronization capabilities - CLI App.")
    (home-page "https://joplinapp.org/")
    (license license:agpl3+)))

(define-public komorebi
  (package
    (name "komorebi")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/komorebi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a beautiful and customizable wallpaper manager for Linux")
    (description "A beautiful and customizable wallpaper manager for Linux.")
    (home-page "https://github.com/Komorebi-Fork/komorebi")
    (license license:gpl3)))

(define-public liboqs-git
  (package
    (name "liboqs-git")
    (version "0.14.0.r37.gdd942d4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liboqs-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c library for prototyping and experimenting with quantum-resistant cryptography")
    (description "C library for prototyping and experimenting with quantum-resistant cryptography.")
    (home-page "https://openquantumsafe.org/liboqs/")
    (license license:expat)))

(define-public limine-entry-tool-git
  (package
    (name "limine-entry-tool-git")
    (version "r602.d9b54ee")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Zesko/limine-entry-tool")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "entry management for the Limine bootloader")
    (description "Entry management for the Limine bootloader.")
    (home-page "https://gitlab.com/Zesko/limine-entry-tool")
    (license license:gpl3)))

(define-public luminance
  (package
    (name "luminance")
    (version "1.4.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/luminance.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple GTK application to control brightness of displays including external...")
    (description "A simple GTK application to control brightness of displays including external displays supporting DDC/CI.")
    (home-page "https://github.com/sidevesh/Luminance")
    (license license:gpl3)))

(define-public lyrionmusicserver
  (package
    (name "lyrionmusicserver")
    (version "9.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lyrionmusicserver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "slimserver for Logitech Squeezebox players. This server is also called Logite...")
    (description "Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server).")
    (home-page "https://github.com/LMS-Community/slimserver")
    (license license:gpl2)))

(define-public materia-transparent-gtk-theme-git
  (package
    (name "materia-transparent-gtk-theme-git")
    (version "r1648.85bdc295")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ckissane/materia-theme-transparent")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Transparent Material Design theme for GNOME/GTK+ based desktop environments")
    (description "A Transparent Material Design theme for GNOME/GTK+ based desktop environments.")
    (home-page "https://github.com/ckissane/materia-theme-transparent")
    (license license:non-copyleft)))

(define-public mesen2-git
  (package
    (name "mesen2-git")
    (version "r3343.af9eda35")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mesen2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-system emulator (NES, SNES, Game Boy and PC Engine)")
    (description "Multi-system emulator (NES, SNES, Game Boy and PC Engine).")
    (home-page "https://www.mesen.ca")
    (license license:gpl3)))

(define-public nut-monitor
  (package
    (name "nut-monitor")
    (version "2.8.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nut-monitor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI to manage devices connected a NUT server")
    (description "GUI to manage devices connected a NUT server.")
    (home-page "http://www.networkupstools.org/")
    (license license:gpl3+)))

(define-public openclaw-git
  (package
    (name "openclaw-git")
    (version "2026.3.24.r531.g2e23d44491c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openclaw/openclaw")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "personal AI assistant that runs on your own devices")
    (description "Personal AI assistant that runs on your own devices.")
    (home-page "https://github.com/openclaw/openclaw")
    (license license:expat)))

(define-public opendeck-git
  (package
    (name "opendeck-git")
    (version "r266.1d9ca83")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nekename/OpenDeck")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform desktop application that provides functionality for stream c...")
    (description "A cross-platform desktop application that provides functionality for stream controller devices.")
    (home-page "https://github.com/nekename/OpenDeck")
    (license license:gpl3)))

(define-public pantheon-settings-daemon-git
  (package
    (name "pantheon-settings-daemon-git")
    (version "1.0.0.r18.e4b709d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elementary/settings-daemon")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Pantheon Settings Daemon")
    (description "The Pantheon Settings Daemon.")
    (home-page "https://github.com/elementary/settings-daemon")
    (license license:gpl3)))

(define-public perl-gis-distance-git
  (package
    (name "perl-gis-distance-git")
    (version "0.20.0+r114.20230607.g7611336")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bluefeet/GIS-Distance")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gIS::Distance -- Perl interface to calculate calculate geographic distances")
    (description "GIS::Distance -- Perl interface to calculate calculate geographic distances.")
    (home-page "https://github.com/bluefeet/GIS-Distance")
    (license license:non-copyleft)))

(define-public python-qiskit-gym
  (package
    (name "python-qiskit-gym")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-qiskit-gym.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quantum information science problems formulated as reinforcement learning env...")
    (description "Quantum information science problems formulated as reinforcement learning environments.")
    (home-page "https://github.com/AI4quantum/qiskit-gym")
    (license license:asl2.0)))

(define-public qflipper-git
  (package
    (name "qflipper-git")
    (version "1.3.3.r3.g1d26683")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/flipperdevices/qFlipper")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop application for updating Flipper Zero firmware via PC")
    (description "Desktop application for updating Flipper Zero firmware via PC.")
    (home-page "https://github.com/flipperdevices/qFlipper")
    (license license:gpl3)))

(define-public qtarcan-git
  (package
    (name "qtarcan-git")
    (version "r50.bbdded1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/vimpostor/qtarcan")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt platform abstraction platform plugin for Arcan")
    (description "Qt platform abstraction platform plugin for Arcan.")
    (home-page "https://codeberg.org/vimpostor/qtarcan")
    (license license:gpl2)))

(define-public river-creek
  (package
    (name "river-creek")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/river-creek.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a malleable and minimalist status bar for the River compositor")
    (description "A malleable and minimalist status bar for the River compositor.")
    (home-page "https://github.com/nmeum/creek")
    (license license:expat)))

(define-public scx-tools-git
  (package
    (name "scx-tools-git")
    (version "1.0.18.r6.g0bacdf7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sched-ext/scx-loader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scx_loader: A DBUS Interface for Managing sched_ext Schedulers")
    (description "Scx_loader: A DBUS Interface for Managing sched_ext Schedulers.")
    (home-page "https://github.com/sched-ext/scx-loader")
    (license license:gpl2)))

(define-public sddm-conf-git
  (package
    (name "sddm-conf-git")
    (version "0.4.0.r0.g11d96aa")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qtilities/sddm-conf")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sDDM Configuration Editor")
    (description "SDDM Configuration Editor.")
    (home-page "https://github.com/qtilities/sddm-conf")
    (license license:expat)))

(define-public serialplot-git
  (package
    (name "serialplot-git")
    (version "v0.13.0.r4.gdc6efa6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyOzd/serialplot")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small and simple software for plotting data from serial port in realtime")
    (description "Small and simple software for plotting data from serial port in realtime.")
    (home-page "https://github.com/hyOzd/serialplot")
    (license license:gpl3)))

(define-public shadowsocks-libev-static
  (package
    (name "shadowsocks-libev-static")
    (version "3.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shadowsocks-libev-static.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "statically-compiled shadowsocks-libev, intended to replace community/shadowso...")
    (description "Statically-compiled shadowsocks-libev, intended to replace community/shadowsocks-libev.")
    (home-page "https://github.com/shadowsocks/shadowsocks-libev")
    (license license:gpl3)))

(define-public sysd-manager
  (package
    (name "sysd-manager")
    (version "2.17.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sysd-manager.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a systemd GUI to manage service, timer, socket and other units")
    (description "A systemd GUI to manage service, timer, socket and other units.")
    (home-page "https://github.com/plrigaux/sysd-manager")
    (license license:gpl3+)))

(define-public telegram-tdlib-purple-git
  (package
    (name "telegram-tdlib-purple-git")
    (version "0.8.1.r523.d220fa8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BenWiederhake/tdlib-purple/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libpurple/pidgin Telegram plugin implemented using official tdlib client library")
    (description "Libpurple/pidgin Telegram plugin implemented using official tdlib client library.")
    (home-page "https://github.com/BenWiederhake/tdlib-purple/")
    (license license:non-copyleft)))

(define-public tmuzika
  (package
    (name "tmuzika")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tmuzika.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal music player with ncurses UI and GStreamer backend")
    (description "Terminal music player with ncurses UI and GStreamer backend.")
    (home-page "https://github.com/ivanjeka/tmuzika.git")
    (license license:gpl3+)))

(define-public tomcat8
  (package
    (name "tomcat8")
    (version "8.5.100")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tomcat8.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source implementation of the Java Servlet 3.1 and JavaServer Pages 2.3 t...")
    (description "Open source implementation of the Java Servlet 3.1 and JavaServer Pages 2.3 technologies.")
    (home-page "https://tomcat.apache.org/")
    (license license:asl2.0)))

(define-public ultimate-doom-builder-git
  (package
    (name "ultimate-doom-builder-git")
    (version "3.0.0.4298.ad1ddaf")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/UltimateDoomBuilder/UltimateDoomBuilder")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a level editor for Doom-engine games")
    (description "A level editor for Doom-engine games.")
    (home-page "https://github.com/UltimateDoomBuilder/UltimateDoomBuilder")
    (license license:gpl3+)))

(define-public way-displays
  (package
    (name "way-displays")
    (version "1.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/way-displays.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "way-displays: Auto Manage Your Wayland Displays")
    (description "Way-displays: Auto Manage Your Wayland Displays.")
    (home-page "https://github.com/alex-courtis/way-displays")
    (license license:expat)))

(define-public wayfarer
  (package
    (name "wayfarer")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wayfarer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal")
    (description "Screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal.")
    (home-page "https://github.com/stronnag/wayfarer")
    (license license:gpl3)))

(define-public xlibre-video-amdgpu
  (package
    (name "xlibre-video-amdgpu")
    (version "25.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xlibre-video-amdgpu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xLibre fork of X.Org amdgpu video driver")
    (description "XLibre fork of X.Org amdgpu video driver.")
    (home-page "https://github.com/X11Libre/xf86-video-amdgpu")
    (license license:non-copyleft)))

(define-public ytdownloader-gui
  (package
    (name "ytdownloader-gui")
    (version "3.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ytdownloader-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI video downloader supporting hundreds of sites")
    (description "GUI video downloader supporting hundreds of sites.")
    (home-page "https://github.com/aandrew-me/ytDownloader")
    (license license:gpl3)))

(define-public zelda64recomp-bin
  (package
    (name "zelda64recomp-bin")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zelda64recomp-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "static recompilation of Majora's Mask for PC")
    (description "Static recompilation of Majora's Mask for PC.")
    (home-page "https://github.com/Mr-Wiseguy/Zelda64Recomp")
    (license license:gpl3)))

(define-public aeth-git
  (package
    (name "aeth-git")
    (version "r21.a99d56d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/prabinpanta0/Aeth")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an elegant polymorphic shell that lacks the concept of elegance. Written in H...")
    (description "An elegant polymorphic shell that lacks the concept of elegance. Written in Haskell.")
    (home-page "https://github.com/prabinpanta0/Aeth")
    (license license:expat)))

(define-public autopilot-rs
  (package
    (name "autopilot-rs")
    (version "0.1.0.beta")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/autopilot-rs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "autoPilot-rs runs automation jobs based on conditions like WiFi, Bluetooth, b...")
    (description "AutoPilot-rs runs automation jobs based on conditions like WiFi, Bluetooth, battery, CPU usage, and more.")
    (home-page "https://github.com/streamtechteam/autopilot-rs")
    (license license:expat)))

(define-public balena-etcher
  (package
    (name "balena-etcher")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/balena-etcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flash OS images to SD cards & USB drives, safely and easily")
    (description "Flash OS images to SD cards & USB drives, safely and easily.")
    (home-page "https://balena.io/etcher")
    (license license:asl2.0)))

(define-public chawan-git
  (package
    (name "chawan-git")
    (version "r3746.daed0cb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~bptato/chawan")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web browser for your terminal")
    (description "Web browser for your terminal.")
    (home-page "https://git.sr.ht/~bptato/chawan")
    (license license:unlicense)))

(define-public com-163-music-spark
  (package
    (name "com-163-music-spark")
    (version "3.0.1.202031spark12.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/com.163.music.spark.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "netease Music Wine Client from Spark Store")
    (description "Netease Music Wine Client from Spark Store.")
    (home-page "https://music.163.com/")
    (license license:non-copyleft)))

(define-public continuwuity-git
  (package
    (name "continuwuity-git")
    (version "0.5.4.6016.g19146166c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/continuwuity-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a very cool, featureful fork of conduit (rust matrix homeserver)")
    (description "A very cool, featureful fork of conduit (rust matrix homeserver).")
    (home-page "https://forgejo.ellis.link/continuwuation/continuwuity")
    (license license:asl2.0)))

(define-public dunelegacy
  (package
    (name "dunelegacy")
    (version "0.99.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dunelegacy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "updated clone of Westood Studios' Dune2")
    (description "Updated clone of Westood Studios' Dune2.")
    (home-page "http://dunelegacy.sourceforge.net")
    (license license:gpl2+)))

(define-public flowtime
  (package
    (name "flowtime")
    (version "6.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flowtime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "get what motivates you done, without losing concentration")
    (description "Get what motivates you done, without losing concentration.")
    (home-page "https://github.com/Diego-Ivan/Flowtime")
    (license license:gpl3+)))

(define-public ghostmirror
  (package
    (name "ghostmirror")
    (version "0.18.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghostmirror.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern alternative to reflector, true check mirror status, mirror download sp...")
    (description "Modern alternative to reflector, true check mirror status, mirror download speed and more.")
    (home-page "https://github.com/vbextreme/ghostmirror.git")
    (license license:gpl3)))

(define-public git-incrypt-git
  (package
    (name "git-incrypt-git")
    (version "0.9.0.r8.gaa933c2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/schiele/git-incrypt/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a git remote helper to encrypt git repositories incrementally")
    (description "A git remote helper to encrypt git repositories incrementally.")
    (home-page "https://github.com/schiele/git-incrypt/")
    (license license:gpl2)))

(define-public gixy-next
  (package
    (name "gixy-next")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gixy-next.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nginx configuration static analyzer")
    (description "Nginx configuration static analyzer.")
    (home-page "https://gixy.io")
    (license license:mpl2.0)))

(define-public gnome-shell-extension-ddterm-git
  (package
    (name "gnome-shell-extension-ddterm-git")
    (version "62.0.2.r55.g10820aad")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ddterm/gnome-shell-extension-ddterm")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "another Drop Down Terminal Extension for GNOME Shell (Github version)")
    (description "Another Drop Down Terminal Extension for GNOME Shell (Github version).")
    (home-page "https://github.com/ddterm/gnome-shell-extension-ddterm")
    (license license:gpl3+)))

(define-public hyprkcs-git
  (package
    (name "hyprkcs-git")
    (version "1.25.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kosa12/hyprKCS")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast, minimal Hyprland keybind cheat sheet and editor written in Rust/GTK4")
    (description "A fast, minimal Hyprland keybind cheat sheet and editor written in Rust/GTK4.")
    (home-page "https://github.com/kosa12/hyprKCS")
    (license license:gpl3)))

(define-public hyprland-autoname-workspaces-git
  (package
    (name "hyprland-autoname-workspaces-git")
    (version "v1.1.7.r2.ga3aae4f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprland-community/hyprland-autoname-workspaces")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hyprland autoname workspace")
    (description "Hyprland autoname workspace.")
    (home-page "https://github.com/hyprland-community/hyprland-autoname-workspaces")
    (license license:isc)))

(define-public hytale-f2p-git
  (package
    (name "hytale-f2p-git")
    (version "2.4.8.r516.ga2b60ba")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hytale-f2p-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hytale-F2P - unofficial Hytale Launcher for free to play with multiplayer sup...")
    (description "Hytale-F2P - unofficial Hytale Launcher for free to play with multiplayer support (This project has been superseded by F2P Evo. Download the new launcher: https://git.sanhost.net/sanasol/f2p-evo/releases/latest).")
    (home-page "https://git.sanhost.net/sanasol/hytale-f2p")
    (license license:non-copyleft)))

(define-public i2pd-tools-git
  (package
    (name "i2pd-tools-git")
    (version "r321.gb483a59")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PurpleI2P/i2pd-tools/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "useful tools for I2P (git version)")
    (description "Useful tools for I2P (git version).")
    (home-page "https://github.com/PurpleI2P/i2pd-tools/")
    (license license:bsd-3)))

(define-public intellij-idea-open-eap
  (package
    (name "intellij-idea-open-eap")
    (version "2026.1.1.0.261.23567.28.preview")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/intellij-idea-open-eap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iDE for Java, Groovy and other programming languages with advanced refactorin...")
    (description "IDE for Java, Groovy and other programming languages with advanced refactoring features. Open-source, latest-tag (usually EAP) version.")
    (home-page "https://www.jetbrains.com/idea/")
    (license license:asl2.0)))

(define-public kapitano
  (package
    (name "kapitano")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kapitano.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern ClamAV front-end that uses gtk4/libadwaita")
    (description "Modern ClamAV front-end that uses gtk4/libadwaita.")
    (home-page "https://codeberg.org/zynequ/Kapitano")
    (license license:gpl3+)))

(define-public kumir2-git
  (package
    (name "kumir2-git")
    (version "19.04.2020")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kumir2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an educational programming language and IDE in Russian schools")
    (description "An educational programming language and IDE in Russian schools.")
    (home-page "https://www.niisi.ru/kumir/index.htm")
    (license license:gpl2)))

(define-public libggml
  (package
    (name "libggml")
    (version "0.9.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libggml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tensor library for machine learning with OpenBLAS + Vulkan optimizations")
    (description "Tensor library for machine learning with OpenBLAS + Vulkan optimizations.")
    (home-page "https://github.com/ggml-org/ggml")
    (license license:expat)))

(define-public libggml-git
  (package
    (name "libggml-git")
    (version "0.9.4.r387.g3e9f2ba")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggml-org/ggml")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tensor library for machine learning with OpenBLAS + Vulkan optimizations")
    (description "Tensor library for machine learning with OpenBLAS + Vulkan optimizations.")
    (home-page "https://github.com/ggml-org/ggml")
    (license license:expat)))

(define-public libvgm-git
  (package
    (name "libvgm-git")
    (version "r578.798cb20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ValleyBell/libvgm")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for decoding and playing VGM files")
    (description "Library for decoding and playing VGM files.")
    (home-page "https://github.com/ValleyBell/libvgm")
    (license license:non-copyleft)))

(define-public livebook
  (package
    (name "livebook")
    (version "0.19.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/livebook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automate code & data workflows with interactive Elixir notebooks")
    (description "Automate code & data workflows with interactive Elixir notebooks.")
    (home-page "https://livebook.dev")
    (license license:asl2.0)))

(define-public loliashizuku-git
  (package
    (name "loliashizuku-git")
    (version "0.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mxmilu666/LoliaShizuku")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wails-powered third-party desktop client for Lolia FRP")
    (description "Wails-powered third-party desktop client for Lolia FRP.")
    (home-page "https://github.com/Mxmilu666/LoliaShizuku")
    (license license:expat)))

(define-public m33mu-git
  (package
    (name "m33mu-git")
    (version "r138.0ad1f71")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/danielinux/m33mu")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Cortex-M33 emulator with TrustZone awareness")
    (description "A Cortex-M33 emulator with TrustZone awareness.")
    (home-page "https://github.com/danielinux/m33mu")
    (license license:agpl3+)))

(define-public nitrox
  (package
    (name "nitrox")
    (version "1.8.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nitrox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source, multiplayer modification for the game Subnautica")
    (description "An open-source, multiplayer modification for the game Subnautica.")
    (home-page "https://github.com/SubnauticaNitrox/Nitrox")
    (license license:gpl3)))

(define-public noctalia-shell-git
  (package
    (name "noctalia-shell-git")
    (version "2.3.1.r16.g330eac0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/noctalia-dev/noctalia-shell")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a sleek and minimal desktop shell thoughtfully crafted for Wayland, built wit...")
    (description "A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell. (git version).")
    (home-page "https://github.com/noctalia-dev/noctalia-shell")
    (license license:expat)))

(define-public openmeters-git
  (package
    (name "openmeters-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/httpsworldview/openmeters")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast and professional audio metering/visualization for Linux")
    (description "Fast and professional audio metering/visualization for Linux.")
    (home-page "https://github.com/httpsworldview/openmeters")
    (license license:gpl3+)))

(define-public plasma6-applets-kurve-git
  (package
    (name "plasma6-applets-kurve-git")
    (version "3.4.0.r4.g80d9e87")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/luisbocanegra/kurve")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "audio visualizer widget powered by CAVA for the KDE Plasma Desktop")
    (description "Audio visualizer widget powered by CAVA for the KDE Plasma Desktop.")
    (home-page "https://github.com/luisbocanegra/kurve")
    (license license:gpl3)))

(define-public plasma6-applets-thermal-monitor-git
  (package
    (name "plasma6-applets-thermal-monitor-git")
    (version "0.1.4.r0.g3d0878f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma6-applets-thermal-monitor-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a KDE Plasmoid for displaying system temperatures. Latest commit")
    (description "A KDE Plasmoid for displaying system temperatures. Latest commit.")
    (home-page "https://invent.kde.org/olib/thermalmonitor")
    (license license:expat)))

(define-public python-opentelemetry-exporter-prometheus
  (package
    (name "python-opentelemetry-exporter-prometheus")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-opentelemetry-exporter-prometheus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "prometheus Metric Exporter for OpenTelemetry")
    (description "Prometheus Metric Exporter for OpenTelemetry.")
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

(define-public python-pymatgen
  (package
    (name "python-pymatgen")
    (version "2025.7.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pymatgen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python Materials Genomics - bibliothèque Python open source pour l’analyse de...")
    (description "Python Materials Genomics - bibliothèque Python open source pour l’analyse des matériaux.")
    (home-page "https://github.com/materialsproject/pymatgen")
    (license license:expat)))

(define-public qt-web-extractor
  (package
    (name "qt-web-extractor")
    (version "r23.20260410.98c8f41")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt-web-extractor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt WebEngine based web content extractor with HTTP server")
    (description "Qt WebEngine based web content extractor with HTTP server.")
    (home-page "https://github.com/wszqkzqk/qt-web-extractor")
    (license license:gpl3+)))

(define-public quantum-espresso
  (package
    (name "quantum-espresso")
    (version "7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quantum-espresso.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a suite of codes for electronic-structure calculations and modeling")
    (description "A suite of codes for electronic-structure calculations and modeling.")
    (home-page "https://www.quantum-espresso.org/")
    (license license:gpl2)))

(define-public qvtfpp
  (package
    (name "qvtfpp")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qvtfpp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Qt6 QImageIO plugin to load VTF textures")
    (description "A Qt6 QImageIO plugin to load VTF textures.")
    (home-page "https://github.com/craftablescience/qvtfpp")
    (license license:lgpl2.1)))

(define-public rofi-gpaste-git
  (package
    (name "rofi-gpaste-git")
    (version "r33.e3f5313")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yusufaktepe/rofi-gpaste")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rofi frontend for GPaste clipboard manager")
    (description "Rofi frontend for GPaste clipboard manager.")
    (home-page "https://github.com/yusufaktepe/rofi-gpaste")
    (license license:gpl3+)))

(define-public roomeqwizard-beta
  (package
    (name "roomeqwizard-beta")
    (version "5.40.beta.122")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roomeqwizard-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a room acoustics analysis software for measuring and analysing room and louds...")
    (description "A room acoustics analysis software for measuring and analysing room and loudspeaker responses.")
    (home-page "https://www.roomeqwizard.com")
    (license license:non-copyleft)))

(define-public rusty-path-of-building
  (package
    (name "rusty-path-of-building")
    (version "0.2.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rusty-path-of-building.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an offline build planner for Path of Exile 1 and 2 using the cross-platform '...")
    (description "An offline build planner for Path of Exile 1 and 2 using the cross-platform 'rusty-path-of-building' runtime.")
    (home-page "https://github.com/meehl/rusty-path-of-building")
    (license license:expat)))

(define-public scrcpy-git
  (package
    (name "scrcpy-git")
    (version "3.3.3_r2875.gf3d4fde1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Genymobile/scrcpy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "display and control your Android device")
    (description "Display and control your Android device.")
    (home-page "https://github.com/Genymobile/scrcpy")
    (license license:asl2.0)))

(define-public sitra
  (package
    (name "sitra")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sitra.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "install fonts on your system")
    (description "Install fonts on your system.")
    (home-page "https://github.com/sitraorg/sitra")
    (license license:gpl3+)))

(define-public susops
  (package
    (name "susops")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/susops.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "system tray app for managing SusOps SSH SOCKS5 proxy and port forwards")
    (description "System tray app for managing SusOps SSH SOCKS5 proxy and port forwards.")
    (home-page "https://github.com/mashb1t/susops-linux")
    (license license:expat)))

(define-public tosu-overlay-git
  (package
    (name "tosu-overlay-git")
    (version "2.1.1.r0.g2345251")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/K4zoku/tosu-overlay-qt")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt")
    (description "Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt.")
    (home-page "https://github.com/K4zoku/tosu-overlay-qt")
    (license license:expat)))

(define-public vial-keychron-git
  (package
    (name "vial-keychron-git")
    (version "r701.99b73db")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Tymon3310/vial-gui")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK ...")
    (description "Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time, similar to VIA. Keychron branch.")
    (home-page "https://github.com/Tymon3310/vial-gui")
    (license license:gpl2)))

(define-public vim-youcompleteme-git
  (package
    (name "vim-youcompleteme-git")
    (version "r3216.0d855962")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-youcompleteme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a code-completion engine for Vim")
    (description "A code-completion engine for Vim.")
    (home-page "https://ycm-core.github.io/YouCompleteMe/")
    (license license:gpl3)))

(define-public vk-hdr-layer-kwin6-git
  (package
    (name "vk-hdr-layer-kwin6-git")
    (version "r31.f5f13b7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zamundaaa/VK_hdr_layer")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vulkan Wayland HDR WSI Layer (Xaver Hugl's fork for KWin 6)")
    (description "Vulkan Wayland HDR WSI Layer (Xaver Hugl's fork for KWin 6).")
    (home-page "https://github.com/Zamundaaa/VK_hdr_layer")
    (license license:expat)))

(define-public vkd3d-proton-git
  (package
    (name "vkd3d-proton-git")
    (version "v2.1.r38.g2560c768")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vkd3d-proton-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "direct3D 12 to Vulkan translation library By WineHQ")
    (description "Direct3D 12 to Vulkan translation library By WineHQ.")
    (home-page "https://wiki.winehq.org/Vkd3d")
    (license license:lgpl3+)))

(define-public vscoq-language-server-git
  (package
    (name "vscoq-language-server-git")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rocq-prover/vsrocq")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vSCode coq / rocq language server")
    (description "VSCode coq / rocq language server.")
    (home-page "https://github.com/rocq-prover/vsrocq")
    (license license:expat)))

(define-public vtm
  (package
    (name "vtm")
    (version "2026.04.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vtm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal multiplexer with window manager and session sharing")
    (description "Terminal multiplexer with window manager and session sharing.")
    (home-page "https://github.com/directvt/vtm")
    (license license:expat)))

(define-public waydroid-git
  (package
    (name "waydroid-git")
    (version "1.3.4.r43.gf4506ff")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/waydroid/waydroid")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a container-based approach to boot a full Android system on a regular Linux s...")
    (description "A container-based approach to boot a full Android system on a regular Linux system.")
    (home-page "https://github.com/waydroid/waydroid")
    (license license:gpl3)))

(define-public ww-manager
  (package
    (name "ww-manager")
    (version "2.1.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ww-manager.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ww-manager (A Wuthering Waves CLI Manager)")
    (description "Ww-manager (A Wuthering Waves CLI Manager).")
    (home-page "https://github.com/timetetng/wutheringwaves-cli-manager")
    (license license:expat)))
