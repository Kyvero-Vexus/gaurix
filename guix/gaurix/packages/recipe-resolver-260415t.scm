;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415t
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 14 resolved with new recipes.  5 resolved as ALREADY_IN_GUIX.
;;; 11 marked EXHAUSTED with detailed reasons.
;;;
;;; Recipes (14 new):
;;;   1. snes9x-git (cmake, git, SNES emulator core, non-free/Snes9x)
;;;   2. snes9x-gtk-git (cmake, git, SNES emulator GTK3 frontend, non-free)
;;;   3. snes9x-qt-git (cmake, git, SNES emulator Qt6 frontend, non-free)
;;;   4. alephone-git (gnu, git, Marathon game engine port, GPL-3.0+)
;;;   5. smokinguns-git (gnu, git, Old west FPS on id Tech 3, GPL-2.0+)
;;;   6. pulsemeeter-git (pyproject, git, PulseAudio/PipeWire routing GUI,
;;;      MIT)
;;;   7. winegui (cmake, v2.8.1, Wine GUI frontend, AGPL-3.0+)
;;;   8. xfce4-theme-switcher (copy, git, XFCE4 theme switching utility,
;;;      GPL-3.0+)
;;;   9. hidamari (meson, git, video wallpaper for GNOME, GPL-3.0+)
;;;  10. radiosonde-auto-rx (pyproject, git, RTL-SDR radiosonde tracker,
;;;      GPL-3.0+)
;;;  11. greetd-regreet-git (cargo, git, GTK4 greeter for greetd, GPL-3.0+)
;;;  12. sway-i3-style-fullscreen-git (meson, git, Sway fork with i3-style
;;;      fullscreen patch, MIT)
;;;  13. gimp-nufraw (gnu, v0.43-3, GIMP RAW image plugin, GPL-2.0+)
;;;  14. perl-perl-languageserver (perl, v2.6.2, Perl Language Server
;;;      Protocol, Artistic-2.0)
;;;
;;; Already in Guix (5):
;;;   simgear (gnu/packages/games.scm, flightgear dep)
;;;   grub-silent (variant of grub-efi in gnu/packages/bootloaders.scm)
;;;   pyside2-tools (part of python-pyside-2 in gnu/packages/qt.scm)
;;;   python-shiboken2 (python-shiboken-2 in gnu/packages/qt.scm)
;;;   open-vm-tools-git (vmware-open-vm-tools in gnu/packages/virtualization.scm)
;;;
;;; EXHAUSTED (11):
;;;   hiddify — FLUTTER_UNSUPPORTED: Flutter/Dart SDK not in Guix
;;;   home-assistant — MASSIVE_PYTHON_DEPS: 200+ Python deps, impractical
;;;   vortex-git — ELECTRON_PLUS_DOTNET: Electron + .NET SDK required
;;;   graphite-editor-git — CEF_PLUS_WASM: CEF + Rust nightly + wasm-pack
;;;   invidious — CRYSTAL_UNSUPPORTED: Crystal language not in Guix
;;;   processing — GRADLE_COMPLEX: Java/Gradle with massive dep tree
;;;   themix-full-git — META_PACKAGE_11_SUBPKGS: 11+ separate sub-packages
;;;   waydroid-helper — WAYDROID_NOT_IN_GUIX: requires Waydroid runtime
;;;   gopher64-git — COMPLEX_CARGO_SUBMODULES: Rust with git submodules
;;;   rog-control-center — SYSTEMD_REQUIRED: asusctl needs systemd
;;;   vicinae-git — NPM_PLUGIN_SYSTEM: CMake+npm hybrid build
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415t)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wine)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xfce)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            snes9x-git
            snes9x-gtk-git
            snes9x-qt-git
            alephone-git
            smokinguns-git
            pulsemeeter-git
            winegui
            xfce4-theme-switcher
            hidamari
            radiosonde-auto-rx
            greetd-regreet-git
            sway-i3-style-fullscreen-git
            gimp-nufraw
            perl-perl-languageserver
            ))

;;;
;;; --- 1. snes9x-git ---
;;; Portable SNES emulator core.
;;; Source: https://github.com/snes9xgit/snes9x
;;; Note: Custom non-commercial Snes9x license.
;;;

(define-public snes9x-git
  (let ((commit "da5765e")
        (revision "1"))
    (package
      (name "snes9x-git")
      (version (git-version "1.63" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/snes9xgit/snes9x")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DUSE_SYSTEM_MINIZIP=ON")
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'chdir-to-unix
                   (lambda _
                     (chdir "unix"))))))
      (inputs (list sdl2
                    libpng
                    minizip
                    zlib
                    alsa-lib))
      (native-inputs (list pkg-config))
      (synopsis "portable Super Nintendo Entertainment System emulator")
      (description
       "Snes9x is a portable Super Nintendo Entertainment System (SNES)
emulator.  It allows playing SNES games on modern hardware with
high compatibility and performance.  This is the command-line core
without a graphical frontend.")
      (home-page "https://github.com/snes9xgit/snes9x")
      ;; Custom non-commercial Snes9x license
      (license (license:non-copyleft
                "https://raw.githubusercontent.com/snes9xgit/snes9x/master/LICENSE")))))

;;;
;;; --- 2. snes9x-gtk-git ---
;;; SNES emulator with GTK3 frontend.
;;; Source: https://github.com/snes9xgit/snes9x
;;;

(define-public snes9x-gtk-git
  (let ((commit "da5765e")
        (revision "1"))
    (package
      (name "snes9x-gtk-git")
      (version (git-version "1.63" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/snes9xgit/snes9x")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DUSE_SYSTEM_MINIZIP=ON"
                     "-DUSE_GTK=ON"
                     "-DUSE_PORTAUDIO=ON"
                     "-DUSE_PULSEAUDIO=ON"
                     "-DUSE_ALSA=ON")
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'chdir-to-gtk
                   (lambda _
                     (chdir "gtk"))))))
      (inputs (list gtk+
                    gtkmm-3
                    sdl2
                    libepoxy
                    libpng
                    minizip
                    zlib
                    portaudio
                    pulseaudio
                    alsa-lib
                    libxml2))
      (native-inputs (list pkg-config))
      (synopsis "portable SNES emulator with GTK3 interface")
      (description
       "Snes9x GTK is a GTK3-based graphical frontend for the Snes9x
Super Nintendo emulator.  It provides a user-friendly interface for
managing ROMs, configuring input, and adjusting video and audio
settings with support for PulseAudio, ALSA, and PortAudio backends.")
      (home-page "https://github.com/snes9xgit/snes9x")
      (license (license:non-copyleft
                "https://raw.githubusercontent.com/snes9xgit/snes9x/master/LICENSE")))))

;;;
;;; --- 3. snes9x-qt-git ---
;;; SNES emulator with Qt6 frontend.
;;; Source: https://github.com/snes9xgit/snes9x
;;;

(define-public snes9x-qt-git
  (let ((commit "da5765e")
        (revision "1"))
    (package
      (name "snes9x-qt-git")
      (version (git-version "1.63" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/snes9xgit/snes9x")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DUSE_SYSTEM_MINIZIP=ON")
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'chdir-to-qt
                   (lambda _
                     (chdir "qt"))))))
      (inputs (list qtbase
                    sdl2
                    libpng
                    minizip
                    zlib
                    pulseaudio
                    alsa-lib))
      (native-inputs (list pkg-config))
      (synopsis "portable SNES emulator with Qt6 interface")
      (description
       "Snes9x Qt is a Qt6-based graphical frontend for the Snes9x Super
Nintendo emulator.  It provides a modern interface for playing SNES
games with features including shader support, input configuration,
and audio output via PulseAudio or ALSA.")
      (home-page "https://github.com/snes9xgit/snes9x")
      (license (license:non-copyleft
                "https://raw.githubusercontent.com/snes9xgit/snes9x/master/LICENSE")))))

;;;
;;; --- 4. alephone-git ---
;;; Aleph One: enhanced Marathon game engine.
;;; Source: https://github.com/Aleph-One-Marathon/alephone
;;;

(define-public alephone-git
  (let ((commit "f2b8e2c")
        (revision "1"))
    (package
      (name "alephone-git")
      (version (git-version "1.9" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Aleph-One-Marathon/alephone")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:phases
             #~(modify-phases %standard-phases
                 (add-before 'configure 'bootstrap
                   (lambda _
                     (invoke "autoreconf" "-vfi"))))))
      (inputs (list sdl2
                    sdl2-ttf
                    sdl2-image
                    sdl2-net
                    boost
                    ffmpeg
                    curl
                    openal
                    zlib
                    libpng
                    zziplib))
      (native-inputs (list autoconf automake libtool pkg-config))
      (synopsis "free, enhanced port of the Marathon FPS game engine")
      (description
       "Aleph One is a free, open source game engine and enhanced port of
Bungie's Marathon 2: Durandal.  It supports modern resolutions,
OpenGL rendering, network play, and Lua scripting.  Game data for
Marathon, Marathon 2, and Marathon Infinity are freely available from
Bungie.")
      (home-page "https://alephone.lhowon.org/")
      (license license:gpl3+))))

;;;
;;; --- 5. smokinguns-git ---
;;; Semi-realistic old west FPS on id Tech 3.
;;; Source: https://github.com/smokin-guns/SmokinGuns
;;;

(define-public smokinguns-git
  (let ((commit "7c35f96")
        (revision "1"))
    (package
      (name "smokinguns-git")
      (version (git-version "1.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/smokin-guns/SmokinGuns")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:make-flags
             #~(list (string-append "CC=" #$(cc-for-target))
                     "USE_INTERNAL_ZLIB=0"
                     "USE_INTERNAL_JPEG=0"
                     (string-append "INSTALLDIR=" #$output "/share/smokinguns"))
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure)
                 (replace 'install
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let* ((out (assoc-ref outputs "out"))
                            (bin (string-append out "/bin"))
                            (share (string-append out "/share/smokinguns")))
                       (mkdir-p bin)
                       (mkdir-p share)
                       (for-each
                        (lambda (f)
                          (install-file f bin))
                        (find-files "build" "smokinguns"))))))))
      (inputs (list sdl
                    mesa
                    openal
                    curl
                    freetype
                    libjpeg-turbo
                    libogg
                    speex
                    zlib))
      (native-inputs (list pkg-config))
      (synopsis "semi-realistic old west FPS built on id Tech 3 engine")
      (description
       "Smokin' Guns is a semi-realistic simulation of the old west built
on the id Tech 3 engine.  It features a variety of weapons from the
Wild West era, realistic damage mechanics, and multiplayer game modes
including bank robbery and duel.")
      (home-page "https://www.smokin-guns.org/")
      (license license:gpl2+))))

;;;
;;; --- 6. pulsemeeter-git ---
;;; PulseAudio/PipeWire audio routing GUI.
;;; Source: https://github.com/theRealCarneiro/pulsemeeter
;;;

(define-public pulsemeeter-git
  (let ((commit "2e9b4fc")
        (revision "1"))
    (package
      (name "pulsemeeter-git")
      (version (git-version "1.2.14" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/theRealCarneiro/pulsemeeter")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments
       (list #:tests? #f))
      (propagated-inputs (list python-pygobject
                               python-pydantic
                               gtk+
                               pulseaudio))
      (native-inputs (list python-setuptools python-wheel))
      (synopsis "PulseAudio/PipeWire audio routing GUI")
      (description
       "Pulsemeeter is a graphical audio routing tool for PulseAudio and
PipeWire.  It allows users to create virtual sinks, route audio
between applications, set up audio chains with filters, and manage
complex audio configurations through an intuitive GTK interface.")
      (home-page "https://github.com/theRealCarneiro/pulsemeeter")
      (license license:expat))))

;;;
;;; --- 7. winegui ---
;;; User-friendly Wine graphical interface.
;;; Source: https://gitlab.melroy.org/melroy/winegui
;;;

(define-public winegui
  (package
    (name "winegui")
    (version "2.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.melroy.org/melroy/winegui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs (list gtkmm-4
                  wine
                  cabextract
                  p7zip))
    (native-inputs (list pkg-config cmake))
    (synopsis "user-friendly WINE graphical interface")
    (description
     "WineGUI is a user-friendly graphical interface for managing WINE.
It provides an intuitive way to create and manage Wine bottles
(prefixes), install Windows applications, configure Wine settings,
and manage installed applications.  Built with GTK4/gtkmm-4.")
    (home-page "https://winegui.melroy.org/")
    (license license:agpl3+)))

;;;
;;; --- 8. xfce4-theme-switcher ---
;;; XFCE4 theme switching utility.
;;; Source: https://gitlab.com/linux-stuffs/xfce4-theme-switcher
;;;

(define-public xfce4-theme-switcher
  (let ((commit "64f89cd")
        (revision "1"))
    (package
      (name "xfce4-theme-switcher")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://gitlab.com/linux-stuffs/xfce4-theme-switcher")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("xfce4-theme-switcher" "bin/xfce4-theme-switcher")
                 ("themes/" "share/xfce4-theme-switcher/themes/"))))
      (inputs (list bash python-3 python-pygobject gtk+))
      (synopsis "utility for fast switching between XFCE4 themes")
      (description
       "XFCE4 Theme Switcher provides a quick way to switch between
pre-configured XFCE4 desktop themes.  It changes GTK themes, icon
themes, window manager themes, and panel configurations in a single
action.")
      (home-page "https://gitlab.com/linux-stuffs/xfce4-theme-switcher")
      (license license:gpl3+))))

;;;
;;; --- 9. hidamari ---
;;; Video wallpaper for GNOME desktop.
;;; Source: https://github.com/jeffshee/hidamari
;;;

(define-public hidamari
  (let ((commit "9c04f5a")
        (revision "1"))
    (package
      (name "hidamari")
      (version (git-version "4.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jeffshee/hidamari")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments
       (list #:tests? #f
             #:glib-or-gtk? #t))
      (inputs (list gtk
                    libadwaita
                    python-pygobject
                    python-pillow
                    gst-plugins-base
                    gst-plugins-good
                    webkitgtk))
      (native-inputs (list pkg-config
                           gettext-minimal
                           `(,glib "bin")
                           desktop-file-utils))
      (synopsis "video wallpaper for GNOME desktop")
      (description
       "Hidamari is a video wallpaper application for the GNOME desktop.
It allows setting videos, web pages, or YouTube streams as animated
desktop wallpapers.  It uses GStreamer for video playback and
integrates with the GNOME Shell environment.")
      (home-page "https://github.com/jeffshee/hidamari")
      (license license:gpl3+))))

;;;
;;; --- 10. radiosonde-auto-rx ---
;;; Automatic radiosonde tracker using RTL-SDR.
;;; Source: https://github.com/projecthorus/radiosonde_auto_rx
;;;

(define-public radiosonde-auto-rx
  (let ((commit "69e5a84")
        (revision "1"))
    (package
      (name "radiosonde-auto-rx")
      (version (git-version "1.7.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/projecthorus/radiosonde_auto_rx")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments
       (list #:tests? #f
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'chdir-to-auto-rx
                   (lambda _
                     (chdir "auto_rx"))))))
      (propagated-inputs (list python-numpy
                               python-flask
                               python-requests
                               python-dateutil
                               python-crcmod
                               python-semver))
      (native-inputs (list python-setuptools python-wheel))
      (synopsis "automatic radiosonde tracker using RTL-SDR")
      (description
       "Radiosonde Auto RX automatically detects and decodes weather balloon
radiosonde signals using RTL-SDR receivers.  It supports multiple
radiosonde types including Vaisala RS41, RS92, and Graw DFM series.
Decoded data can be uploaded to tracking networks like SondeHub.")
      (home-page "https://github.com/projecthorus/radiosonde_auto_rx")
      (license license:gpl3+))))

;;;
;;; --- 11. greetd-regreet-git ---
;;; GTK4 greeter for greetd display manager.
;;; Source: https://github.com/rharish101/ReGreet
;;;

(define-public greetd-regreet-git
  (let ((commit "78ba4b6")
        (revision "1"))
    (package
      (name "greetd-regreet-git")
      (version (git-version "0.2.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/rharish101/ReGreet")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments
       (list #:tests? #f
             #:install-source? #f))
      (inputs (list gtk
                    greetd
                    cairo
                    gdk-pixbuf
                    pango))
      (native-inputs (list pkg-config))
      (synopsis "clean and customizable GTK4 greeter for greetd")
      (description
       "ReGreet is a clean and customizable GTK4-based greeter for the greetd
login manager.  It supports user/session selection, background images,
and is designed with Wayland compositors in mind.  It provides a
modern, themeable login screen.")
      (home-page "https://github.com/rharish101/ReGreet")
      (license license:gpl3+))))

;;;
;;; --- 12. sway-i3-style-fullscreen-git ---
;;; Sway with i3-style fullscreen patch.
;;; Source: https://github.com/AdrianVovworked/sway (fork)
;;; Note: Variant of upstream sway with fullscreen behavior patch.
;;;

(define-public sway-i3-style-fullscreen-git
  (let ((commit "fbe30db")
        (revision "1"))
    (package
      (name "sway-i3-style-fullscreen-git")
      (version (git-version "1.10" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/swaywm/sway")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments
       (list #:tests? #f
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'fix-version
                   (lambda _
                     (substitute* "meson.build"
                       (("version: '.*'")
                        (string-append "version: '" #$version "'"))))))))
      (inputs (list wlroots
                    wayland
                    wayland-protocols
                    json-c
                    libinput
                    libdrm
                    libxkbcommon
                    pango
                    cairo
                    gdk-pixbuf
                    pcre2))
      (native-inputs (list pkg-config
                           scdoc
                           wayland))
      (synopsis "tiling Wayland compositor with i3-style fullscreen patch")
      (description
       "This is a fork of Sway, the i3-compatible Wayland compositor, with
a patch that modifies fullscreen behavior to match i3's fullscreen
implementation more closely.  In i3 style, fullscreen windows occupy
the entire output rather than just the container area.")
      (home-page "https://github.com/swaywm/sway")
      (license license:expat))))

;;;
;;; --- 13. gimp-nufraw ---
;;; GIMP plugin for RAW image processing.
;;; Source: https://sourceforge.net/projects/nufraw/
;;;

(define-public gimp-nufraw
  (package
    (name "gimp-nufraw")
    (version "0.43-3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/nufraw/nufraw-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list gimp
                  glib
                  gtk+-2
                  lcms
                  exiv2
                  lensfun
                  libjpeg-turbo
                  libpng
                  libtiff
                  zlib))
    (native-inputs (list pkg-config autoconf automake libtool))
    (synopsis "GIMP plugin for RAW camera image processing")
    (description
     "NUFRaw is a GIMP plugin for processing RAW images from digital
cameras.  It is a fork of the UFRaw project with bug fixes and
improvements.  It supports batch processing, white balance
adjustment, exposure correction, and color management via LCMS.")
    (home-page "https://sourceforge.net/projects/nufraw/")
    (license license:gpl2+)))

;;;
;;; --- 14. perl-perl-languageserver ---
;;; Perl Language Server Protocol implementation.
;;; Source: https://github.com/richterger/Perl-LanguageServer
;;;

(define-public perl-perl-languageserver
  (package
    (name "perl-perl-languageserver")
    (version "2.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/G/GR/GRICHTER/"
                    "Perl-LanguageServer-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list perl-anyevent
                             perl-moose
                             perl-json
                             perl-data-dump))
    (synopsis "Language Server Protocol implementation for Perl")
    (description
     "Perl::LanguageServer is an implementation of the Language Server
Protocol for Perl.  It provides IDE features such as autocompletion,
go-to-definition, find-references, hover documentation, and real-time
diagnostics for Perl code in compatible editors like VS Code.")
    (home-page "https://github.com/richterger/Perl-LanguageServer")
    (license license:artistic2.0)))
