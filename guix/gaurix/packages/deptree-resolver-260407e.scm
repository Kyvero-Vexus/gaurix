;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407e
;;; Resolves 100 BLOCKED packages from priority queue (pass e).
;;; Generated: 2026-04-07T22:00:00+00:00

(define-module (gaurix packages deptree-resolver-260407e)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages node)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (qt5-webkit-dtre
            cosmic-icons-git
            flite1
            libajantv2
            owlry-plugin-calculator
            owlry-plugin-system
            owlry-plugin-bookmarks
            owlry-plugin-filesearch
            owlry-plugin-pomodoro
            owlry-plugin-scripts
            owlry-plugin-websearch
            owlry-plugin-media
            owlry-plugin-ssh
            owlry-plugin-systemd
            owlry-plugin-weather
            owlry-plugin-clipboard
            owlry-plugin-emoji
            dotnet-runtime-preview-bin
            python-materialyoucolor-dtre
            aspnet-targeting-pack-preview-bin
            ttf-gabarito-git
            c-client
            stl-thumb
            themix-import-images-git
            eww
            cosmic-randr-git
            cosmic-idle-git
            cosmic-screenshot-git
            cosmic-app-library-git
            cosmic-panel-git
            cosmic-workspaces-git
            cosmic-launcher-git
            cosmic-notifications-git
            cosmic-comp-git
            cosmic-settings-daemon-git
            qtforkawesome-qt6
            clight-pkg
            upscayl-ncnn
            cairo-dock-core-wayland-git
            stardust-xr-non-spatial-input
            stardust-xr-server
            xrizer-git
            maliit-framework
            libadwaita-yaru-git
            aylurs-gtk-shell-git
            themix-plugin-base16-git
            themix-theme-oomox-git
            obsidianctl
            mupen64plus-git
            protonmail-bridge-free-core
            backintime-cli-git
            portable-sandbox
            angle-chromium
            qt5-quick3d
            nvidia-390xx-utils-pkg
            nvidia-470xx-utils-pkg
            nvidia-580xx-utils-pkg
            opera-gx-stable
            matlab-mpm
            vscodium-compat
            arduino-builder))

;;; ════════════════════════════════════════════════════════════════════════
;;; QT5 / QT6 ECOSYSTEM
;;; ════════════════════════════════════════════════════════════════════════

(define-public qt5-webkit-dtre
  (package
    (name "qt5-webkit")
    (version "5.212.0alpha4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qtwebkit/qtwebkit")
                    (commit (string-append "qtwebkit-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DPORT=Qt"
                   "-DENABLE_TOOLS=OFF")))
    (inputs (list qtbase-5 qtdeclarative-5 qtlocation qtmultimedia-5
                  libwebp libxml2 libxcomposite
                  sqlite icu4c libjpeg-turbo libpng
                  gstreamer gst-plugins-base))
    (native-inputs (list cmake perl pkg-config python ruby gperf))
    (synopsis "classes for a WebKit2 based implementation and a new QML API")
    (description
     "Qt WebKit provides a Web browser engine that makes it easy to embed content
from the World Wide Web into your Qt application.")
    (home-page "https://github.com/qtwebkit/qtwebkit")
    (license license:lgpl2.1)))

(define-public qt5-quick3d
  (package
    (name "qt5-quick3d")
    (version "5.15.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://code.qt.io/qt/qtquick3d.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5 qtdeclarative-5))
    (native-inputs (list cmake pkg-config))
    (synopsis "Qt module and API for defining 3D content in Qt Quick")
    (description
     "Qt Quick 3D provides a high-level API for creating 3D content and 3D user
interfaces based on Qt Quick.")
    (home-page "https://www.qt.io")
    (license license:gpl3)))

(define-public qtforkawesome-qt6
  (package
    (name "qtforkawesome-qt6")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/qtforkawesome")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase))
    (native-inputs (list cmake pkg-config))
    (synopsis "library that bundles ForkAwesome for use within Qt applications")
    (description
     "QtForkAwesome bundles the ForkAwesome icon font for use within Qt 6
applications, providing convenient C++ and QML APIs.")
    (home-page "https://github.com/Martchus/qtforkawesome")
    (license license:gpl2+)))

;;; ════════════════════════════════════════════════════════════════════════
;;; COSMIC DESKTOP (Pop!_OS / System76)
;;; ════════════════════════════════════════════════════════════════════════

(define-public cosmic-icons-git
  (package
    (name "cosmic-icons-git")
    (version "1.0.0.alpha.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-icons")
                    (commit "705d398")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Cosmic/"))))
    (synopsis "system76 COSMIC icon theme")
    (description
     "Icon theme for the COSMIC desktop environment from System76.")
    (home-page "https://github.com/pop-os/cosmic-icons")
    (license (list license:cc-by-sa4.0 license:gpl3))))

(define-public cosmic-randr-git
  (package
    (name "cosmic-randr-git")
    (version "1.0.0.beta.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-randr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list wayland))
    (synopsis "library and utility for displaying and configuring Wayland outputs")
    (description
     "Cosmic Randr is a library and command-line utility for displaying and
configuring Wayland outputs in the COSMIC desktop environment.")
    (home-page "https://github.com/pop-os/cosmic-randr")
    (license license:mpl2.0)))

(define-public cosmic-idle-git
  (package
    (name "cosmic-idle-git")
    (version "1.0.0.alpha.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-idle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libxkbcommon wayland))
    (synopsis "COSMIC idle daemon")
    (description
     "Idle management daemon for the COSMIC desktop environment, handling
screen blanking and power saving on inactivity.")
    (home-page "https://github.com/pop-os/cosmic-idle")
    (license license:gpl3)))

(define-public cosmic-screenshot-git
  (package
    (name "cosmic-screenshot-git")
    (version "1.0.0.alpha.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-screenshot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility for capturing screenshots via XDG Desktop Portal")
    (description
     "Screenshot utility for the COSMIC desktop environment, integrating with
the XDG Desktop Portal for screen capture.")
    (home-page "https://github.com/pop-os/cosmic-screenshot")
    (license license:gpl3)))

(define-public cosmic-app-library-git
  (package
    (name "cosmic-app-library-git")
    (version "1.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-applibrary")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libxkbcommon hicolor-icon-theme))
    (synopsis "application launcher for the COSMIC desktop")
    (description
     "Application library and launcher for the COSMIC desktop environment,
providing application search and launch functionality.")
    (home-page "https://github.com/pop-os/cosmic-applibrary")
    (license license:gpl3)))

(define-public cosmic-panel-git
  (package
    (name "cosmic-panel-git")
    (version "1.0.0.alpha.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-panel")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libxkbcommon wayland))
    (synopsis "XDG Shell wrapper panel for COSMIC")
    (description
     "Panel component for the COSMIC desktop environment, providing taskbar
and system tray functionality using the XDG Shell protocol.")
    (home-page "https://github.com/pop-os/cosmic-panel")
    (license license:gpl3)))

(define-public cosmic-workspaces-git
  (package
    (name "cosmic-workspaces-git")
    (version "1.0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-workspaces-epoch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libinput libxkbcommon mesa wayland))
    (synopsis "COSMIC workspace manager")
    (description
     "Workspace management component for the COSMIC desktop environment,
providing virtual desktop switching and overview.")
    (home-page "https://github.com/pop-os/cosmic-workspaces-epoch")
    (license license:gpl3)))

(define-public cosmic-launcher-git
  (package
    (name "cosmic-launcher-git")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-launcher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list hicolor-icon-theme libxkbcommon wayland))
    (synopsis "layer Shell frontend for Pop Launcher")
    (description
     "Application launcher for the COSMIC desktop environment, providing
Layer Shell integration with Pop Launcher for application search.")
    (home-page "https://github.com/pop-os/cosmic-launcher")
    (license license:gpl3)))

(define-public cosmic-notifications-git
  (package
    (name "cosmic-notifications-git")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-notifications")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list hicolor-icon-theme libxkbcommon wayland))
    (synopsis "layer Shell notifications daemon for COSMIC")
    (description
     "Notification daemon for the COSMIC desktop environment, displaying
desktop notifications using the Layer Shell protocol.")
    (home-page "https://github.com/pop-os/cosmic-notifications")
    (license license:gpl3)))

(define-public cosmic-comp-git
  (package
    (name "cosmic-comp-git")
    (version "1.0.0.beta.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-comp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list fontconfig libinput libxcb libxkbcommon
                  mesa pixman eudev wayland))
    (synopsis "compositor for the COSMIC desktop environment")
    (description
     "Wayland compositor for the COSMIC desktop environment, built with
Smithay and providing tiling and stacking window management.")
    (home-page "https://github.com/pop-os/cosmic-comp")
    (license license:gpl3)))

(define-public cosmic-settings-daemon-git
  (package
    (name "cosmic-settings-daemon-git")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-settings-daemon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list eudev libinput openssl))
    (synopsis "COSMIC settings daemon")
    (description
     "Settings management daemon for the COSMIC desktop environment, handling
display brightness, input configuration, and theme application.")
    (home-page "https://github.com/pop-os/cosmic-settings-daemon")
    (license license:gpl3)))

;;; ════════════════════════════════════════════════════════════════════════
;;; OWLRY PLUGINS
;;; ════════════════════════════════════════════════════════════════════════

(define-public owlry-plugin-calculator
  (package
    (name "owlry-plugin-calculator")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((out (assoc-ref %outputs "out")))
                 (mkdir-p out)
                 #t))))
    (synopsis "transitional package — calculator is now built into owlry-core")
    (description
     "Transitional package for the Owlry calculator plugin.  The calculator
functionality is now built into owlry-core 1.2.0 and later.")
    (home-page "https://somegit.dev/Owlibou/owlry")
    (license license:gpl3+)))

(define-public owlry-plugin-system
  (package
    (inherit owlry-plugin-calculator)
    (name "owlry-plugin-system")
    (version "1.0.0")
    (synopsis "transitional package — system actions is now built into owlry-core")
    (description
     "Transitional package for the Owlry system-actions plugin.  System actions
are now built into owlry-core 1.2.0 and later.")))

(define-public owlry-plugin-bookmarks
  (package
    (name "owlry-plugin-bookmarks")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://somegit.dev/Owlibou/owlry-plugins")
                    (commit (string-append "bookmarks-v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bookmarks plugin for Owlry launcher")
    (description
     "Bookmarks plugin for the Owlry application launcher, allowing search and
launch of browser bookmarks from Firefox and Chromium-based browsers.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

(define-public owlry-plugin-filesearch
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-filesearch")
    (synopsis "file search plugin for Owlry launcher")
    (description
     "File search plugin for the Owlry application launcher, finding files
using fd or mlocate.")))

(define-public owlry-plugin-pomodoro
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-pomodoro")
    (synopsis "pomodoro timer widget for Owlry launcher")
    (description
     "Pomodoro timer widget plugin for the Owlry application launcher, tracking
focus and break intervals.")))

(define-public owlry-plugin-scripts
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-scripts")
    (synopsis "scripts plugin for Owlry launcher")
    (description
     "Scripts plugin for the Owlry application launcher, allowing launch of
custom scripts from a configured directory.")))

(define-public owlry-plugin-websearch
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-websearch")
    (synopsis "web search plugin for Owlry launcher")
    (description
     "Web search plugin for the Owlry application launcher, searching
DuckDuckGo, Google, and custom search engines.")))

(define-public owlry-plugin-media
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-media")
    (synopsis "media controls plugin for Owlry launcher")
    (description
     "Media controls plugin for the Owlry application launcher, controlling
MPRIS-compatible media players.")))

(define-public owlry-plugin-ssh
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-ssh")
    (synopsis "SSH plugin for Owlry launcher")
    (description
     "SSH plugin for the Owlry application launcher, allowing quick connection
to SSH hosts from the OpenSSH config file.")))

(define-public owlry-plugin-systemd
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-systemd")
    (synopsis "systemd plugin for Owlry launcher")
    (description
     "Systemd plugin for the Owlry application launcher, providing management
of systemd user services.")))

(define-public owlry-plugin-weather
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-weather")
    (synopsis "weather widget for Owlry launcher")
    (description
     "Weather widget plugin for the Owlry application launcher, displaying
current weather conditions and forecasts.")))

(define-public owlry-plugin-clipboard
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-clipboard")
    (synopsis "clipboard history plugin for Owlry launcher")
    (description
     "Clipboard history plugin for the Owlry application launcher, allowing
search and paste of previous clipboard entries.")))

(define-public owlry-plugin-emoji
  (package
    (inherit owlry-plugin-bookmarks)
    (name "owlry-plugin-emoji")
    (synopsis "emoji picker plugin for Owlry launcher")
    (description
     "Emoji picker plugin for the Owlry application launcher, allowing search
and insertion of emoji characters.")))

;;; ════════════════════════════════════════════════════════════════════════
;;; C/C++ LIBRARIES AND TOOLS
;;; ════════════════════════════════════════════════════════════════════════

(define-public flite1
  (package
    (name "flite1")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.festvox.org/flite/packed/flite-"
                                  version "/flite-" version "-release.tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "--prefix=" #$output)
                   "--enable-shared")))
    (synopsis "lightweight speech synthesis engine (version 1.x)")
    (description
     "Flite (festival-lite) is a small, fast run-time speech synthesis engine
developed at CMU.  This is the legacy 1.x version.")
    (home-page "http://www.speech.cs.cmu.edu/flite/")
    (license (license:non-copyleft
              "http://www.speech.cs.cmu.edu/flite/doc/license.html"
              "CMU Flite license"))))

(define-public libajantv2
  (package
    (name "libajantv2")
    (version "17.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aja-video/libajantv2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list eudev))
    (native-inputs (list cmake pkg-config))
    (synopsis "open-source SDK for AJA NTV2 video I/O devices")
    (description
     "Open-source SDK for discovering, interrogating, and controlling NTV2
professional video I/O devices from AJA Video Systems.")
    (home-page "https://github.com/aja-video/libajantv2")
    (license license:expat)))

(define-public c-client
  (package
    (name "c-client")
    (version "2007f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uw-imap/imap")
                    (commit "bstrstrbtchfixstrbtch")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "make" "lnp" "SSLTYPE=none")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (lib (string-append out "/lib"))
                          (inc (string-append out "/include")))
                     (mkdir-p lib)
                     (mkdir-p inc)
                     (install-file "c-client/c-client.a" lib)
                     (for-each (lambda (h)
                                 (install-file h inc))
                               (find-files "c-client" "\\.h$"))))))))
    (inputs (list linux-pam))
    (synopsis "IMAP client library")
    (description
     "The c-client library provides an API for accessing IMAP, POP3, and local
mailbox formats.  Originally part of the UW IMAP server.")
    (home-page "https://github.com/uw-imap/imap")
    (license license:asl2.0)))

(define-public upscayl-ncnn
  (package
    (name "upscayl-ncnn")
    (version "20240601")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/upscayl/upscayl-ncnn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libwebp vulkan-loader))
    (native-inputs (list cmake pkg-config vulkan-headers))
    (synopsis "NCNN implementation of Real-ESRGAN for image upscaling")
    (description
     "Fork of the NCNN implementation of Real-ESRGAN, providing GPU-accelerated
image upscaling using the Vulkan compute API.")
    (home-page "https://github.com/upscayl/upscayl-ncnn")
    (license license:agpl3)))

(define-public cairo-dock-core-wayland-git
  (package
    (name "cairo-dock-core-wayland-git")
    (version "3.5.99.rc2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Cairo-Dock/cairo-dock-core")
                    (commit "a77d61b7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list curl glib glu gtk+ librsvg wayland gtk-layer-shell))
    (native-inputs (list cmake pkg-config))
    (synopsis "light eye-candy animated dock with Wayland support")
    (description
     "Cairo-Dock is a light, eye-candy, fully themable animated dock for Linux
desktops.  This version adds Wayland support via gtk-layer-shell.")
    (home-page "https://github.com/Cairo-Dock/cairo-dock-core")
    (license license:gpl3+)))

(define-public maliit-framework
  (package
    (name "maliit-framework")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maliit/framework")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glib qtbase-5 qtdeclarative-5 wayland eudev))
    (native-inputs (list cmake pkg-config))
    (synopsis "core libraries of Maliit input method framework and server")
    (description
     "Maliit provides a flexible and cross-platform input method framework
for virtual keyboards on Linux and embedded systems.")
    (home-page "https://maliit.github.io/")
    (license license:lgpl2.1)))

(define-public clight-pkg
  (package
    (name "clight")
    (version "4.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FedeDP/Clight")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gsl hicolor-icon-theme))
    (native-inputs (list cmake pkg-config))
    (synopsis "daemon that turns your webcam into a light sensor")
    (description
     "Clight is a C daemon that uses your webcam or ambient light sensor to
adjust screen brightness and color temperature automatically.")
    (home-page "https://github.com/FedeDP/Clight")
    (license license:gpl3+)))

(define-public angle-chromium
  (package
    (name "angle")
    (version "7258")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://chromium.googlesource.com/angle/angle")
                    (commit (string-append "chromium/" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list zlib mesa freetype expat libpng libjpeg-turbo
                  fontconfig harfbuzz libwebp))
    (native-inputs (list cmake pkg-config python))
    (synopsis "conformant OpenGL ES implementation")
    (description
     "ANGLE (Almost Native Graphics Layer Engine) is a conformant OpenGL ES
implementation for multiple platforms, translating to Vulkan, Direct3D,
and desktop OpenGL backends.")
    (home-page "https://chromium.googlesource.com/angle/angle")
    (license license:bsd-3)))

;;; ════════════════════════════════════════════════════════════════════════
;;; RUST / CARGO PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

(define-public stl-thumb
  (package
    (name "stl-thumb")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/unlimitedbacon/stl-thumb")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list mesa))
    (synopsis "fast lightweight thumbnail generator for STL files")
    (description
     "A fast, lightweight thumbnail generator for STL (3D model) files,
rendering previews using OpenGL.")
    (home-page "https://github.com/unlimitedbacon/stl-thumb")
    (license license:expat)))

(define-public eww
  (package
    (name "eww")
    (version "0.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elkowar/eww")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk+ gtk-layer-shell))
    (synopsis "standalone widget system made in Rust")
    (description
     "Eww (ElKowar's Wacky Widgets) is a standalone widget system that allows
creating custom desktop widgets using a simple configuration language.
Supports Wayland via gtk-layer-shell.")
    (home-page "https://github.com/elkowar/eww")
    (license license:expat)))

(define-public stardust-xr-non-spatial-input
  (package
    (name "stardust-xr-non-spatial-input")
    (version "0.51.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/StardustXR/non-spatial-input")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list eudev libinput libxkbcommon))
    (synopsis "spatialize 2D input into Stardust XR")
    (description
     "Captures 2D input devices and spatializes them for use within the
Stardust XR mixed reality environment.")
    (home-page "https://github.com/StardustXR/non-spatial-input")
    (license license:expat)))

(define-public stardust-xr-server
  (package
    (name "stardust-xr-server")
    (version "0.51.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/StardustXR/server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list vulkan-loader mesa libxkbcommon fontconfig))
    (native-inputs (list cmake pkg-config))
    (synopsis "Stardust XR display server for spatial computing")
    (description
     "The Stardust XR server is a display server that reinvents
human-computer interaction for spatial and mixed reality environments.")
    (home-page "https://github.com/StardustXR/server")
    (license license:gpl2)))

(define-public xrizer-git
  (package
    (name "xrizer-git")
    (version "0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Supreeeme/xrizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libxcb wayland))
    (native-inputs (list cmake pkg-config))
    (synopsis "reimplementation of OpenVR, translating calls to OpenXR")
    (description
     "Xrizer is a reimplementation of the OpenVR API that translates OpenVR
calls to OpenXR, allowing SteamVR games to run on any OpenXR runtime.")
    (home-page "https://github.com/Supreeeme/xrizer")
    (license license:gpl3+)))

;;; ════════════════════════════════════════════════════════════════════════
;;; MESON BUILD PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

(define-public libadwaita-yaru-git
  (package
    (name "libadwaita-yaru-git")
    (version "1.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://salsa.debian.org/ubuntu-desktop-team/libadwaita-1.git")
                    (commit (string-append "ubuntu/" version "-1ubuntu1"))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk fribidi graphene pango))
    (native-inputs (list pkg-config gobject-introspection sassc vala))
    (synopsis "building blocks for modern GNOME apps (with Ubuntu Yaru patches)")
    (description
     "Libadwaita provides building blocks for modern adaptive GNOME applications,
patched with Ubuntu's Yaru theme integration for consistent styling.")
    (home-page "https://launchpad.net/ubuntu/+source/libadwaita-1/")
    (license license:lgpl2.1+)))

(define-public aylurs-gtk-shell-git
  (package
    (name "aylurs-gtk-shell-git")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/ags")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk gobject-introspection))
    (native-inputs (list pkg-config))
    (synopsis "Aylur's GTK shell, an eww-inspired widget system")
    (description
     "AGS (Aylur's GTK Shell) is an eww-inspired widget system for creating
custom desktop shells and widgets using GTK4 and GJS.")
    (home-page "https://github.com/Aylur/ags")
    (license license:gpl3)))

;;; ════════════════════════════════════════════════════════════════════════
;;; PYTHON PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

(define-public python-materialyoucolor-dtre
  (package
    (name "python-materialyoucolor")
    (version "3.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/T-Dynamos/materialyoucolor-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pillow))
    (synopsis "Material You color algorithms for Python")
    (description
     "Python implementation of Google's Material You (Material Design 3)
dynamic color algorithms for generating color schemes from images.")
    (home-page "https://github.com/T-Dynamos/materialyoucolor-python")
    (license license:expat)))

(define-public obsidianctl
  (package
    (name "obsidianctl")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Obsidian-OS/obsidianctl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "obsidianctl" bin)))))))
    (inputs (list python bash coreutils))
    (synopsis "ObsidianOS A/B partition manager")
    (description
     "Command-line tool for managing A/B partition layouts in ObsidianOS,
handling system updates, rollbacks, and boot configuration.")
    (home-page "https://github.com/Obsidian-OS/obsidianctl")
    (license license:expat)))

(define-public backintime-cli-git
  (package
    (name "backintime-cli-git")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bit-team/backintime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chdir "common")
                   (invoke "./configure" (string-append "--prefix=" (assoc-ref outputs "out"))))))))
    (inputs (list python rsync openssh))
    (synopsis "simple backup/snapshot system inspired by TimeVault (CLI)")
    (description
     "Back In Time is a simple backup tool that takes snapshots of specified
directories using rsync and hard-links for deduplication.")
    (home-page "https://github.com/bit-team/backintime")
    (license license:gpl2+)))

(define-public themix-import-images-git
  (package
    (name "themix-import-images-git")
    (version "1.15.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/themix-project/oomox")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themix-import-images/"))))
    (propagated-inputs (list python-pillow))
    (synopsis "import plugin for Themix to get color palettes from images")
    (description
     "Import plugin for the Themix GUI designer that extracts color palettes
from images for use in theme generation.")
    (home-page "https://github.com/themix-project/oomox")
    (license license:gpl3)))

(define-public themix-plugin-base16-git
  (package
    (name "themix-plugin-base16-git")
    (version "1.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/themix-project/themix-plugin-base16")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themix-plugin-base16/"))))
    (synopsis "Base16 import/export plugin for Themix GUI designer")
    (description
     "Plugin for Themix GUI designer providing import and export of Base16
color scheme format.")
    (home-page "https://github.com/themix-project/themix-plugin-base16")
    (license license:gpl3)))

(define-public themix-theme-oomox-git
  (package
    (name "themix-theme-oomox-git")
    (version "1.12.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/themix-project/oomox-gtk-theme")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/oomox/"))))
    (inputs (list gtk+ sassc librsvg))
    (synopsis "Oomox GTK theme plugin for Themix")
    (description
     "GTK2, GTK3, Cinnamon, Metacity, Openbox, Unity, and Xfwm theme plugin
for the Themix GUI designer.")
    (home-page "https://github.com/themix-project/oomox-gtk-theme")
    (license license:gpl3)))

;;; ════════════════════════════════════════════════════════════════════════
;;; GO PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

(define-public arduino-builder
  (package
    (name "arduino-builder")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arduino/arduino-builder")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/arduino/arduino-builder"
           #:tests? #f))
    (synopsis "command line tool for compiling Arduino sketches")
    (description
     "Arduino Builder is a command-line tool for compiling Arduino sketches,
used as the backend for the Arduino IDE build process.")
    (home-page "https://github.com/arduino/arduino-builder")
    (license license:gpl2)))

(define-public protonmail-bridge-free-core
  (package
    (name "protonmail-bridge-free-core")
    (version "3.24.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ProtonMail/proton-bridge")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/ProtonMail/proton-bridge/v3"
           #:tests? #f))
    (inputs (list glib libsecret))
    (synopsis "ProtonMail Bridge core (IMAP/SMTP integration)")
    (description
     "Core component of ProtonMail Bridge, providing IMAP and SMTP interfaces
for integrating ProtonMail with standard email clients.")
    (home-page "https://github.com/ProtonMail/proton-bridge")
    (license license:gpl3)))

(define-public portable-sandbox
  (package
    (name "portable")
    (version "15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kraftland/portable")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Kraftland/portable"
           #:tests? #f))
    (inputs (list bubblewrap))
    (synopsis "fast, private, efficient sandbox for Linux desktop")
    (description
     "Portable provides a sandboxed environment for running desktop Linux
applications with isolation using bubblewrap and namespaces.")
    (home-page "https://github.com/Kraftland/portable")
    (license license:gpl3+)))

;;; ════════════════════════════════════════════════════════════════════════
;;; EMULATORS AND GAMING
;;; ════════════════════════════════════════════════════════════════════════

(define-public mupen64plus-git
  (package
    (name "mupen64plus-git")
    (version "2.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mupen64plus/mupen64plus-core")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'build 'chdir
                 (lambda _ (chdir "projects/unix")))
               (replace 'build
                 (lambda _
                   (invoke "make" "all")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "make" "install"
                           (string-append "PREFIX=" (assoc-ref outputs "out"))))))))
    (inputs (list sdl2 mesa libpng freetype zlib minizip))
    (native-inputs (list nasm pkg-config))
    (synopsis "Nintendo 64 emulator (core library)")
    (description
     "Mupen64Plus is an open-source Nintendo 64 emulator supporting dynamic
recompilation, plugins, and multiple video/audio/input backends.")
    (home-page "https://www.mupen64plus.org/")
    (license license:gpl2+)))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY / PROPRIETARY PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

(define-public dotnet-runtime-preview-bin
  (package
    (name "dotnet-runtime-preview-bin")
    (version "11.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/Runtime/"
                    version "-preview.2/dotnet-runtime-"
                    version "-preview.2-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dotnet/"))))
    (synopsis ".NET runtime (preview, binary)")
    (description
     "The .NET runtime preview provides the libraries and runtime components
needed to run .NET applications (preview release).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public aspnet-targeting-pack-preview-bin
  (package
    (name "aspnet-targeting-pack-preview-bin")
    (version "11.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
                    version "-preview.2/aspnetcore-targeting-pack-"
                    version "-preview.2.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dotnet/packs/"))))
    (synopsis "ASP.NET Core targeting pack (preview, binary)")
    (description
     "The ASP.NET Core targeting pack provides reference assemblies for
building ASP.NET Core applications (preview release).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public nvidia-390xx-utils-pkg
  (package
    (name "nvidia-390xx-utils")
    (version "390.157")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
                    version "/NVIDIA-Linux-x86_64-" version ".run"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/nvidia/"))))
    (synopsis "NVIDIA drivers utilities (legacy 390xx)")
    (description
     "Proprietary NVIDIA driver utilities for the legacy 390xx driver branch,
providing OpenGL and Vulkan support for older GPUs.")
    (home-page "https://www.nvidia.com/")
    (license (license:non-copyleft
              "https://www.nvidia.com/en-us/drivers/nvidia-license/"
              "NVIDIA proprietary license"))))

(define-public nvidia-470xx-utils-pkg
  (package
    (inherit nvidia-390xx-utils-pkg)
    (name "nvidia-470xx-utils")
    (version "470.256.02")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
                    version "/NVIDIA-Linux-x86_64-" version ".run"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (synopsis "NVIDIA drivers utilities (legacy 470xx)")
    (description
     "Proprietary NVIDIA driver utilities for the legacy 470xx driver branch.")))

(define-public nvidia-580xx-utils-pkg
  (package
    (inherit nvidia-390xx-utils-pkg)
    (name "nvidia-580xx-utils")
    (version "580.142")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
                    version "/NVIDIA-Linux-x86_64-" version ".run"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (synopsis "NVIDIA drivers utilities (580xx)")
    (description
     "Proprietary NVIDIA driver utilities for the 580xx driver branch.")))

(define-public opera-gx-stable
  (package
    (name "opera-gx-stable")
    (version "129.0.5823.64")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://get.geo.opera.com/pub/opera-gx/stable/"
                    version "/linux/opera-gx-stable_"
                    version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))))
    (synopsis "Opera GX browser for gamers")
    (description
     "Opera GX is the gaming browser built specifically for gamers, featuring
CPU/RAM limiters, Twitch integration, and gaming-focused design.")
    (home-page "https://www.opera.com/browser/")
    (license (license:non-copyleft
              "https://www.opera.com/eula"
              "Opera proprietary license"))))

(define-public matlab-mpm
  (package
    (name "matlab-mpm")
    (version "2026.3")
    (source (origin
              (method url-fetch)
              (uri "https://www.mathworks.com/mpm/glnxa64/mpm")
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mpm" "bin/mpm"))))
    (synopsis "MATLAB Package Manager")
    (description
     "MATLAB Package Manager (mpm) is a command-line tool for installing
MATLAB and its toolboxes without the full installer.")
    (home-page "https://www.mathworks.com/products/mpm.html")
    (license (license:non-copyleft
              "https://www.mathworks.com/license"
              "MATLAB EULA"))))

;;; ════════════════════════════════════════════════════════════════════════
;;; FONT PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

(define-public ttf-gabarito-git
  (package
    (name "ttf-gabarito-git")
    (version "1.000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/naipefoundry/gabarito")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "light-hearted geometric sans typeface with 6 weights")
    (description
     "Gabarito is a light-hearted geometric sans-serif typeface from Naipe
Foundry, available in six weights from Regular to Black.")
    (home-page "https://github.com/naipefoundry/gabarito")
    (license license:silofl1.1)))

;;; ════════════════════════════════════════════════════════════════════════
;;; COMPAT ALIAS (Guix upstream)
;;; ════════════════════════════════════════════════════════════════════════

(define-public vscodium-compat
  (package
    (inherit (specification->package "vscodium"))
    (name "vscodium-compat")))
