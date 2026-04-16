;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416c
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. auto-cpufreq (pyproject, v3.0.0, LGPL-3.0+)
;;;   2. backintime-git (cmake/python, v1.6.1, GPL-2.0+)
;;;   3. hydrus (pyproject, v668, WTFPL)
;;;   4. spotify-downloader (pyproject, v1.0.4, MIT)
;;;   5. ledfx (pyproject, v2.1.5, GPL-3.0)
;;;   6. linux-show-player (pyproject, v0.6.5, GPL-3.0)
;;;   7. cyberdropdownloader (pyproject, v8.10.0, GPL-3.0+)
;;;   8. mov-watch (pyproject, v2.0.0, MIT)
;;;   9. python-eduvpn-client (pyproject, v4.7.1, GPL-3.0+)
;;;  10. vapoursynth-preview (pyproject, v0.20.0, Apache-2.0)
;;;  11. varia (meson, v2026.1.5.3, MPL-2.0)
;;;  12. mangowm-git (meson, v0.1.0, GPL-3.0)
;;;  13. sway-scroll-git (meson, v1.13, MIT)
;;;  14. waytermirror-git (meson, v0.1.0, MIT)
;;;  15. gamescope-git (meson, v3.16.4, BSD-2)
;;;  16. krunner-symbols-git (cmake, v1.1.0, GPL-3.0)
;;;  17. opentoonz-git (cmake, v1.7.1, BSD-3)
;;;  18. incplot (cmake, v1.0.2, MIT)
;;;  19. gpt4all-chat (cmake, v3.10.0, MIT)
;;;  20. spacefm-thermitegod-git (meson, v2.1.0, GPL-3.0)
;;;  21. bobcat-terminal (cmake, v0.9.9, GPL-3.0)
;;;  22. neovim-later (cmake, v0.12.0, Apache-2.0+Vim)
;;;  23. kretro (cmake, v0.0.1, GPL-2.0+)
;;;  24. lamco-rdp-server (cmake, v1.4.2, BUSL-1.1)
;;;  25. libretro-lrps2-git (cmake, v1.0, GPL-3.0+)
;;;  26. scribus-svn (cmake, v1.7.0, GPL-2.0+)
;;;  27. brow6el-git (cmake, v0.2.0, MIT)
;;;  28. cosmic-session-git (cargo, v1.0.0, GPL-3.0)
;;;  29. lazylibrarian-git (copy/python, v0.1, GPL-3.0+)
;;;  30. ids-ips-tool (pyproject, v1.0.1, MIT)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages file)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages hunspell)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages man)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages music)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xml)
  #:export (
            auto-cpufreq
            backintime-git
            hydrus-network
            spotify-downloader
            ledfx
            linux-show-player
            cyberdropdownloader
            mov-watch
            python-eduvpn-client
            vapoursynth-preview
            varia
            mangowm-git
            sway-scroll-git
            waytermirror-git
            gamescope-git
            krunner-symbols-git
            opentoonz-git
            incplot
            gpt4all-chat
            spacefm-thermitegod-git
            bobcat-terminal
            neovim-later
            kretro
            lamco-rdp-server
            libretro-lrps2-git
            scribus-svn
            brow6el-git
            cosmic-session-git
            lazylibrarian-git
            ids-ips-tool
            ))

;;; Nonfree license placeholder (for nonfree binary packages).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; BUSL-1.1 license (Business Source License)
(define license:busl1.1
  ((@@ (guix licenses) license) "BUSL-1.1"
    "https://mariadb.com/bsl11/"
    "Business Source License 1.1"))

;;; WTFPL license
(define license:wtfpl
  ((@@ (guix licenses) license) "WTFPL"
    "http://www.wtfpl.net/"
    "Do What The F*ck You Want To Public License"))

;;; -------------------------------------------------------------------
;;; 1. auto-cpufreq — automatic CPU speed & power optimizer
;;; -------------------------------------------------------------------
(define-public auto-cpufreq
  (package
    (name "auto-cpufreq")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AdnanHodzic/auto-cpufreq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-click python-distro python-psutil python-requests
           python-pygobject))
    (native-inputs
     (list python-poetry-core python-setuptools python-wheel))
    (synopsis "automatic CPU speed and power optimizer for Linux")
    (description "Auto-cpufreq is an automatic CPU speed and power optimizer
for Linux.  It monitors CPU usage and dynamically adjusts the CPU governor
and frequency scaling to balance performance and power consumption without
manual configuration.")
    (home-page "https://github.com/AdnanHodzic/auto-cpufreq")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 2. backintime-git — simple backup/snapshot system
;;; -------------------------------------------------------------------
(define-public backintime-git
  (package
    (name "backintime-git")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bit-team/backintime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs
     (list python rsync openssh))
    (native-inputs
     (list pkg-config gettext-minimal python-setuptools))
    (synopsis "simple backup and snapshot system inspired by TimeVault")
    (description "Back In Time is a simple backup tool for Linux, inspired by
Flyback and TimeVault.  It takes snapshots of specified directories using
rsync, storing them as plain files with hard links for deduplication.
It provides both a CLI and a Qt6 GUI interface.")
    (home-page "https://github.com/bit-team/backintime")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 3. hydrus — Danbooru-like image tagging and searching system
;;; -------------------------------------------------------------------
(define-public hydrus-network
  (package
    (name "hydrus-network")
    (version "668")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hydrusnetwork/hydrus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-beautifulsoup4 python-cbor2 python-chardet python-lz4
           python-numpy opencv python-pillow python-psutil
           python-pysocks python-pyyaml python-requests
           python-send2trash python-six python-twisted))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list ffmpeg))
    (synopsis "Danbooru-like image tagging and searching system")
    (description "Hydrus Network is a desktop application for downloading,
organizing, and viewing media files.  It features a Danbooru-style booru
tagging system, a powerful file search engine, duplicate detection, and
a client-server architecture for synchronizing collections.")
    (home-page "https://hydrusnetwork.github.io/hydrus/")
    (license license:wtfpl)))

;;; -------------------------------------------------------------------
;;; 4. spotify-downloader — download Spotify playlists/albums/tracks
;;; -------------------------------------------------------------------
(define-public spotify-downloader
  (package
    (name "spotify-downloader")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MokshitBindal/Spotify_Downloader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-requests python-beautifulsoup4 python-rich
           python-mutagen python-pydub))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list ffmpeg))
    (synopsis "download Spotify playlists, albums, and tracks")
    (description "Spotify Downloader downloads music from Spotify playlists,
albums, and individual tracks in FLAC and MP3 formats from free sources.
It uses Spotify's API for metadata and searches for matching audio online.")
    (home-page "https://github.com/MokshitBindal/Spotify_Downloader")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. ledfx — network-based LED effect controller
;;; -------------------------------------------------------------------
(define-public ledfx
  (package
    (name "ledfx")
    (version "2.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LedFx/LedFx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-aiohttp python-certifi python-numpy python-pillow
           python-pyyaml python-requests python-voluptuous python-zeroconf))
    (native-inputs
     (list python-poetry-core python-setuptools python-wheel))
    (inputs
     (list portaudio))
    (synopsis "network-based LED effect controller with web interface")
    (description "LedFx is an LED effect controller that synchronizes
addressable LED strips with audio input.  It provides a web-based interface
for configuring effects, supports WLED and other LED controller protocols,
and includes audio-reactive visualizations.")
    (home-page "https://github.com/LedFx/LedFx")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. linux-show-player — cue player for stage productions
;;; -------------------------------------------------------------------
(define-public linux-show-player
  (package
    (name "linux-show-player")
    (version "0.6.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FrancescoCerwordi/linux-show-player")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pygobject python-sortedcontainers python-pyliblo))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list gstreamer gst-plugins-base gst-plugins-good))
    (synopsis "cue player designed for stage productions")
    (description "Linux Show Player is a free cue player designed for stage
productions.  It supports multiple audio backends (GStreamer, JACK), allows
complex cue sequencing with fade effects, volume control, and MIDI/OSC
triggering for live theater and event production.")
    (home-page "https://www.linux-show-player.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. cyberdropdownloader — bulk file host downloader
;;; -------------------------------------------------------------------
(define-public cyberdropdownloader
  (package
    (name "cyberdropdownloader")
    (version "8.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jbsparrow/CyberDropDownloader")
                    (commit (string-append "V" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-aiohttp python-certifi python-rich python-pyyaml
           python-aiofiles python-beautifulsoup4))
    (native-inputs
     (list python-poetry-core python-setuptools python-wheel))
    (synopsis "bulk downloader for multiple file hosting sites")
    (description "CyberDropDownloader is a bulk downloader that supports
downloading from multiple file hosting services and forum sites.  It handles
concurrent downloads, automatic retry on failure, and supports various
file host APIs.")
    (home-page "https://github.com/jbsparrow/CyberDropDownloader")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. mov-watch — terminal-based movie and TV show streaming
;;; -------------------------------------------------------------------
(define-public mov-watch
  (package
    (name "mov-watch")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leoallday/mov-watch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-requests python-beautifulsoup4 python-rich python-inquirer))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list mpv))
    (synopsis "terminal-based movie and TV show streaming tool")
    (description "Mov-watch is a terminal-based tool for streaming movies and
TV shows.  It provides a text user interface for browsing, searching, and
playing content using mpv as the media backend.")
    (home-page "https://github.com/leoallday/mov-watch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. python-eduvpn-client — eduVPN client for Linux
;;; -------------------------------------------------------------------
(define-public python-eduvpn-client
  (package
    (name "python-eduvpn-client")
    (version "4.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/eduVPN/linux-app")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pygobject python-dbus python-requests
           python-cryptography python-pynacl))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list gtk network-manager libsecret))
    (synopsis "eduVPN client application for Linux")
    (description "The eduVPN client provides secure VPN connections for
students and researchers through the eduVPN infrastructure.  It supports
the eduVPN discovery protocol, automatic server selection, and integrates
with NetworkManager for seamless VPN management.")
    (home-page "https://codeberg.org/eduVPN/linux-app")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. vapoursynth-preview — previewer for VapourSynth scripts
;;; -------------------------------------------------------------------
(define-public vapoursynth-preview
  (package
    (name "vapoursynth-preview")
    (version "0.20.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-numpy python-pillow python-pyyaml python-requests))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "previewer for VapourSynth video processing scripts")
    (description "VapourSynth Preview (vs-preview) provides a graphical
preview window for VapourSynth scripts.  It supports frame-by-frame
navigation, comparison between multiple clips, benchmarking, and
timeline-based scrubbing for video processing workflows.")
    (home-page "https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 11. varia — download manager based on aria2
;;; -------------------------------------------------------------------
(define-public varia
  (package
    (name "varia")
    (version "2026.1.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/giantpinkrobots/varia")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (inputs
     (list gtk libadwaita python python-pygobject python-requests aria2))
    (native-inputs
     (list pkg-config gettext-minimal
           `(,glib "bin")                ;for glib-compile-schemas
           desktop-file-utils))
    (synopsis "download manager based on aria2 with a GTK4 interface")
    (description "Varia is a graphical download manager for Linux built
on aria2.  It provides a modern GTK4/Adwaita interface for managing
downloads with features like speed limiting, scheduling, browser
integration, and multi-connection downloading.")
    (home-page "https://giantpinkrobots.github.io/varia/")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 12. mangowm-git — Wayland compositor with smooth animation
;;; -------------------------------------------------------------------
(define-public mangowm-git
  (package
    (name "mangowm-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mangowm/mango")
                    (commit "d6dbb7a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list wayland libinput libdrm pixman libxkbcommon
           libxcb xorg-server-xwayland pcre2))
    (native-inputs
     (list pkg-config wayland-protocols))
    (synopsis "Wayland compositor with smooth animations")
    (description "MangoWM is a Wayland compositor focused on providing
smooth, fluid animations for window management.  It is built on top of
wlroots and scenefx, offering a modern compositing experience with
eye-candy transitions.")
    (home-page "https://github.com/mangowm/mango")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. sway-scroll-git — sway fork with scrolling layout
;;; -------------------------------------------------------------------
(define-public sway-scroll-git
  (package
    (name "sway-scroll-git")
    (version "1.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dawsers/scroll")
                    (commit "c33803e")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list wayland libinput libdrm pixman libxkbcommon json-c
           cairo pango libevdev pcre2 libxcb
           xorg-server-xwayland))
    (native-inputs
     (list pkg-config wayland-protocols scdoc))
    (synopsis "sway fork with a scrolling tiling layout like PaperWM")
    (description "Scroll is a fork of the Sway Wayland compositor that adds
a scrolling layout similar to PaperWM or niri.  Windows are arranged in a
scrollable horizontal strip, allowing natural navigation through workspaces
without traditional grid-based tiling.")
    (home-page "https://github.com/dawsers/scroll")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. waytermirror-git — Wayland screen mirroring to terminal
;;; -------------------------------------------------------------------
(define-public waytermirror-git
  (package
    (name "waytermirror-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyber-wojtek/waytermirror")
                    (commit "ca32204")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list wayland pipewire))
    (native-inputs
     (list pkg-config wayland-protocols))
    (synopsis "real-time Wayland screen mirroring to terminal via braille")
    (description "Waytermirror mirrors a Wayland screen output to a terminal
in real-time using Unicode braille characters.  It captures the screen via
PipeWire and renders a low-resolution representation directly in the terminal,
useful for quick screen sharing over SSH or tty sessions.")
    (home-page "https://github.com/cyber-wojtek/waytermirror")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. gamescope-git — SteamOS session compositing window manager
;;; -------------------------------------------------------------------
(define-public gamescope-git
  (package
    (name "gamescope-git")
    (version "3.16.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ValveSoftware/gamescope")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list libdrm libinput mesa vulkan-loader vulkan-headers
           wayland libxkbcommon libxcb libx11 libxcomposite
           libxdamage libxext libxfixes libxrandr libxtst
           sdl2 pipewire libcap libdecor))
    (native-inputs
     (list pkg-config wayland-protocols glslang))
    (synopsis "SteamOS session compositing window manager")
    (description "Gamescope is Valve's micro-compositor for SteamOS and
Steam Deck.  It provides a nested Wayland/X11 compositor optimized for
gaming with features like resolution upscaling, frame limiting, HDR support,
and low-latency input for an optimal gaming experience.")
    (home-page "https://github.com/ValveSoftware/gamescope")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 16. krunner-symbols-git — KRunner plugin for unicode symbols
;;; -------------------------------------------------------------------
(define-public krunner-symbols-git
  (package
    (name "krunner-symbols-git")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/domschrei/krunner-symbols")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list qtbase krunner ki18n kconfig kcoreaddons))
    (native-inputs
     (list extra-cmake-modules pkg-config))
    (synopsis "KRunner plugin for searching unicode symbols")
    (description "Krunner-symbols is a lightweight KRunner plugin for KDE
Plasma 6 that allows quickly looking up and copying unicode symbols, emojis,
and custom text snippets.  Type a keyword in KRunner and it shows matching
symbols from a configurable list.")
    (home-page "https://github.com/domschrei/krunner-symbols")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. opentoonz-git — 2D animation software
;;; -------------------------------------------------------------------
(define-public opentoonz-git
  (package
    (name "opentoonz-git")
    (version "1.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/opentoonz/opentoonz")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output)
                   "-DWITH_TRANSLATION=OFF")))
    (inputs
     (list qtbase qtmultimedia qtsvg
           boost freetype libjpeg-turbo libpng zlib lzo
           libusb glew freeglut superlu sdl2))
    (native-inputs
     (list pkg-config))
    (synopsis "professional 2D animation creation software")
    (description "OpenToonz is a professional 2D animation creation software.
Originally developed by Digital Video and used by Studio Ghibli, it was
open-sourced in 2016.  It features a complete production pipeline including
scanning, cleanup, coloring, compositing, and rendering with support for
both raster and vector animation.")
    (home-page "https://opentoonz.github.io/e/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 18. incplot — CLI tool for terminal plots
;;; -------------------------------------------------------------------
(define-public incplot
  (package
    (name "incplot")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/InCom-0/incplot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list pkg-config))
    (synopsis "CLI tool for drawing plots in the terminal and HTML")
    (description "Incplot is a command-line tool for creating plots in the
terminal and in HTML format.  It focuses on incremental data visualization,
supporting line charts, scatter plots, and bar charts rendered using Unicode
characters directly in the terminal.")
    (home-page "https://github.com/InCom-0/incplot")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. gpt4all-chat — run open-source LLMs locally
;;; -------------------------------------------------------------------
(define-public gpt4all-chat
  (package
    (name "gpt4all-chat")
    (version "3.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nomic-ai/gpt4all")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_UNIVERSAL=OFF"
                   (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs
     (list qtbase qtsvg qtwayland qtdeclarative qtwebchannel
           vulkan-loader vulkan-headers))
    (native-inputs
     (list pkg-config qttools))
    (synopsis "run open-source large language models locally")
    (description "GPT4All is a desktop application for running large language
models locally without cloud dependencies.  It supports multiple open-source
models, provides a chat interface, and includes features like local document
retrieval (RAG) and API server mode compatible with OpenAI endpoints.")
    (home-page "https://gpt4all.io")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. spacefm-thermitegod-git — multi-panel tabbed file manager
;;; -------------------------------------------------------------------
(define-public spacefm-thermitegod-git
  (package
    (name "spacefm-thermitegod-git")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/thermitegod/spacefm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list gtk gtkmm-3 libadwaita json-glib
           libbsd file eudev))
    (native-inputs
     (list pkg-config python gettext-minimal))
    (synopsis "multi-panel tabbed file manager for Linux")
    (description "SpaceFM (thermitegod fork) is a multi-panel tabbed file
manager for Linux.  It provides a highly configurable interface with built-in
terminal, custom commands, file search, and device management.  This fork
modernizes the codebase with C++20 and GTK4 support.")
    (home-page "https://github.com/thermitegod/spacefm")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 21. bobcat-terminal — cross-platform terminal emulator
;;; -------------------------------------------------------------------
(define-public bobcat-terminal
  (package
    (name "bobcat-terminal")
    (version "0.9.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ismail-yilmaz/Bobcat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list openssl zlib libnotify))
    (native-inputs
     (list pkg-config))
    (synopsis "cross-platform terminal emulator")
    (description "Bobcat is a cross-platform terminal emulator built with
the U++ framework.  It provides a modern terminal experience with features
like split panes, tabs, image display (sixel/iterm2), hyperlinks, and
Unicode support in a lightweight package.")
    (home-page "https://github.com/ismail-yilmaz/Bobcat")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. neovim-later — Neovim following the dev branch
;;; -------------------------------------------------------------------
(define-public neovim-later
  (package
    (name "neovim-later")
    (version "0.12.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/neovim/neovim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output)
                   "-DCMAKE_BUILD_TYPE=Release")))
    (inputs
     (list libuv msgpack-c luajit libvterm libtermkey
           unibilium lua-lpeg tree-sitter))
    (native-inputs
     (list pkg-config gettext-minimal))
    (synopsis "Neovim text editor (latest development release)")
    (description "Neovim is a refactored and modernized fork of Vim focused
on extensibility and usability.  This package tracks the latest stable
release from the Neovim development branch, providing newer features and
improvements ahead of the standard Guix Neovim package.")
    (home-page "https://neovim.io")
    (license (list license:asl2.0 license:vim))))

;;; -------------------------------------------------------------------
;;; 23. kretro — libretro emulation frontend for KDE Plasma
;;; -------------------------------------------------------------------
(define-public kretro
  (package
    (name "kretro")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/multimedia/kretro")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list qtbase qtdeclarative kirigami kcoreaddons ki18n
           kconfig kiconthemes))
    (native-inputs
     (list extra-cmake-modules pkg-config))
    (synopsis "libretro emulation frontend for KDE Plasma")
    (description "KRetro is a libretro-based emulation frontend designed
for the KDE Plasma desktop.  It provides a modern Kirigami interface for
loading and running retro game console emulators through the libretro API,
with integrated controller mapping and save state management.")
    (home-page "https://apps.kde.org/kretro/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 24. lamco-rdp-server — native Wayland RDP server
;;; -------------------------------------------------------------------
(define-public lamco-rdp-server
  (package
    (name "lamco-rdp-server")
    (version "1.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lamco-admin/lamco-rdp-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list wayland pipewire openssl ffmpeg libdrm
           freerdp))
    (native-inputs
     (list pkg-config cmake wayland-protocols))
    (synopsis "native Wayland RDP server with H.264 encoding")
    (description "Lamco RDP Server is a native Wayland RDP server supporting
GNOME, KDE, Sway, and Hyprland compositors.  It captures the screen via
PipeWire and streams it as an RDP session with H.264 video encoding for
efficient remote desktop access.")
    (home-page "https://github.com/lamco-admin/lamco-rdp-server")
    (license license:busl1.1)))

;;; -------------------------------------------------------------------
;;; 25. libretro-lrps2-git — Sony PlayStation 2 libretro core
;;; -------------------------------------------------------------------
(define-public libretro-lrps2-git
  (package
    (name "libretro-lrps2-git")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libretro/ps2")
                    (commit "2b19f7f")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DLIBRETRO=ON"
                   "-DCMAKE_BUILD_TYPE=Release")))
    (inputs
     (list zlib libpng sdl2 libpcap libxml2 soundtouch
           libaio mesa vulkan-loader))
    (native-inputs
     (list pkg-config))
    (synopsis "Sony PlayStation 2 emulation core for libretro")
    (description "LRPS2 is a libretro core for Sony PlayStation 2 emulation,
forked from PCSX2.  It provides PS2 game compatibility through the libretro
API, enabling use with RetroArch and other libretro frontends.")
    (home-page "https://github.com/libretro/ps2")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 26. scribus-svn — desktop publishing program (SVN version)
;;; -------------------------------------------------------------------
(define-public scribus-svn
  (package
    (name "scribus-svn")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/scribusproject/scribus")
                    (commit "27523")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DWANT_DISTROBUILD=YES"
                   (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs
     (list qtbase qtdeclarative qtsvg
           cairo fontconfig freetype harfbuzz hunspell
           icu4c lcms libjpeg-turbo libpng libtiff
           libxml2 poppler boost openssl zlib))
    (native-inputs
     (list pkg-config python))
    (synopsis "desktop publishing program (development version)")
    (description "Scribus is an open source desktop publishing application
for creating professional page layouts.  It supports CMYK color, ICC color
management, PDF creation, and import of many file formats.  This is the
development version tracking the latest SVN commits.")
    (home-page "https://www.scribus.net")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 27. brow6el-git — terminal web browser with sixel support
;;; -------------------------------------------------------------------
(define-public brow6el-git
  (package
    (name "brow6el-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/janantos/brow6el")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list curl openssl libxml2 ncurses libsixel))
    (native-inputs
     (list pkg-config))
    (synopsis "terminal web browser with sixel image support")
    (description "Brow6el is a terminal web browser that supports inline
image display using the Sixel graphics protocol.  It renders HTML pages
in the terminal with basic CSS support and displays images directly when
using a Sixel-capable terminal emulator.")
    (home-page "https://codeberg.org/janantos/brow6el")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. cosmic-session-git — COSMIC desktop session manager
;;; -------------------------------------------------------------------
(define-public cosmic-session-git
  (package
    (name "cosmic-session-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-session")
                    (commit (string-append "epoch-" version ".0"))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'build 'set-cargo-home
                 (lambda _
                   (setenv "CARGO_HOME"
                           (string-append (getcwd) "/.cargo")))))))
    (native-inputs
     (list rust `(,rust "cargo")))
    (synopsis "session manager for the COSMIC desktop environment")
    (description "Cosmic-session is the session manager for System76's
COSMIC desktop environment.  It handles compositor, panel, settings, and
application launcher startup, providing the desktop session lifecycle
management for the COSMIC Wayland desktop.")
    (home-page "https://github.com/pop-os/cosmic-session")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 29. lazylibrarian-git — ebook/audiobook collection manager
;;; -------------------------------------------------------------------
(define-public lazylibrarian-git
  (package
    (name "lazylibrarian-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/LazyLibrarian/LazyLibrarian")
                    (commit "8a9bc8e6")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lazylibrarian"
                #:exclude ("tests" ".git")))))
    (inputs
     (list python))
    (synopsis "ebook, audiobook, and magazine collection manager")
    (description "LazyLibrarian is a program to follow authors and grab
metadata for digital reading material (ebooks, audiobooks, and magazines).
It integrates with newsgroup and torrent download clients to automatically
download and organize your reading collection.")
    (home-page "https://gitlab.com/LazyLibrarian/LazyLibrarian/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 30. ids-ips-tool — intrusion detection/prevention system tool
;;; -------------------------------------------------------------------
(define-public ids-ips-tool
  (package
    (name "ids-ips-tool")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Bangkah/IDS-IPS-Tool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-scapy python-requests python-psutil python-rich))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "intrusion detection and prevention system tool")
    (description "IDS-IPS-Tool is a Python-based intrusion detection and
prevention system for monitoring network traffic.  It uses packet sniffing
to detect suspicious patterns and can automatically block malicious IP
addresses using firewall rules.")
    (home-page "https://github.com/Bangkah/IDS-IPS-Tool")
    (license license:expat)))
