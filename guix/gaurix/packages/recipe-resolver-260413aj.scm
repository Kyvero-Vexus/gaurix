;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413aj
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 20 recipes created (autotools, cmake, meson, pyproject, copy-build-system)
;;;   - 10 re-blocked with EXHAUSTED notes
;;;
;;; Recipes (20):
;;;   kalibrate-rtl, qadwaitadecorations-qt5, libastal-powerprofiles,
;;;   libastal-battery, libastal-mpris, libastal-apps,
;;;   libastal-auth, libastal-notifd, commit-ai, mathics,
;;;   plasma6-applets-separator, vswaybar-studio, autopsy-bin,
;;;   python-mariadb-connector, waypaper, wcm,
;;;   xplayer, blivet-gui, razercommander, clipgrab
;;;
;;; Re-blocked (10):
;;;   nodejs-nativefier (#7325) — DEPRECATED
;;;   nvidia-340xx-dkms (#7710) — PROPRIETARY_DKMS
;;;   staruml (#7506) — PROPRIETARY
;;;   velocidrone (#7322) — PROPRIETARY
;;;   vstax (#7329) — PROPRIETARY
;;;   gnome-system-tools (#7365) — DISCONTINUED
;;;   hyprshade (#7372) — MISSING_GUIX_DEPS
;;;   omnissa-horizon-integrated-printing (#7369) — PROPRIETARY
;;;   pkhex-bin (#7472) — DOTNET_WINE_BINARY
;;;   xpad-dkms-git (#7487) — DKMS_INCOMPATIBLE
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413aj)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages radio)
  #:use-module (gnu packages time)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xorg)
  #:export (kalibrate-rtl
            qadwaitadecorations-qt5
            libastal-powerprofiles
            libastal-battery
            libastal-mpris
            libastal-apps
            libastal-auth
            libastal-notifd
            commit-ai
            mathics
            plasma6-applets-separator
            vswaybar-studio
            autopsy-bin
            python-mariadb-connector
            waypaper
            wcm
            xplayer
            blivet-gui
            razercommander
            clipgrab))

;;; ──────────────────────────────────────────────────────────────────
;;; Autotools builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── kalibrate-rtl (#7421) ──
;;; RTL-SDR GSM frequency calibration tool.  Fork of kalibrate
;;; for use with rtl-sdr devices.

(define-public kalibrate-rtl
  (package
    (name "kalibrate-rtl")
    (version "0.4.1-git.340003e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/steve-m/kalibrate-rtl")
                    (commit "340003ea44aa77cb62937a6f6a8e4e3a17143f07")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-vif"))))))
    (inputs (list fftw rtl-sdr))
    (native-inputs (list autoconf automake pkg-config))
    (home-page "https://github.com/steve-m/kalibrate-rtl")
    (synopsis "GSM frequency calibration tool for RTL-SDR devices")
    (description "Kalibrate-rtl scans for GSM base stations in a given
frequency band and uses the GSM clock to compute the local oscillator
frequency offset of an RTL-SDR device.  This is useful for calibrating
inexpensive SDR receivers.")
    (license license:bsd-2)))

;;; ──────────────────────────────────────────────────────────────────
;;; CMake builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── qadwaitadecorations-qt5 (#7435) ──
;;; Qt5 decoration plugin implementing Adwaita-like client-side decorations.

(define-public qadwaitadecorations-qt5
  (package
    (name "qadwaitadecorations-qt5")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FedoraQt/QAdwaitaDecorations/archive/"
                    "refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DUSE_QT6=OFF")
           #:tests? #f))
    (inputs (list qtbase-5 qtwayland-5 qtsvg-5))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/FedoraQt/QAdwaitaDecorations")
    (synopsis "Qt5 decoration plugin with Adwaita-like client-side decorations")
    (description "QAdwaitaDecorations provides a Qt5 platform decoration plugin
that renders Adwaita-style client-side decorations on Wayland compositors.
It gives Qt5 applications a consistent GNOME-like appearance without requiring
full GTK integration.")
    (license license:lgpl2.1+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Meson builds — Astal libraries (from Aylur/astal monorepo)
;;; ──────────────────────────────────────────────────────────────────

;;; All six Astal libraries share the same monorepo commit.
;;; Each builds from a subdirectory via chdir phase.

;;; ── libastal-powerprofiles (#8366) ──
;;; Library and CLI to control upowerd power profiles.

(define-public libastal-powerprofiles
  (package
    (name "libastal-powerprofiles")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "41b50290c6a1cdce7b482897c22fe49286912b9a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/powerprofiles"))))))
    (inputs (list glib json-glib))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala))
    (home-page "https://aylur.github.io/astal/")
    (synopsis "library for controlling power profiles via UPower")
    (description "Libastal-powerprofiles provides a GObject-based library and
CLI tool for querying and switching power profiles through the UPower D-Bus
interface.  It is part of the Astal desktop widget toolkit.")
    (license license:lgpl2.1)))

;;; ── libastal-battery (#8367) ──
;;; DBus proxy library for upower daemon battery information.

(define-public libastal-battery
  (package
    (name "libastal-battery")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "41b50290c6a1cdce7b482897c22fe49286912b9a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/battery"))))))
    (inputs (list glib json-glib))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala))
    (home-page "https://aylur.github.io/astal/")
    (synopsis "library for querying battery status via UPower D-Bus")
    (description "Libastal-battery provides a GObject-based library and CLI tool
for monitoring battery state through the UPower D-Bus daemon.  It exposes device
charge level, charging status, and power supply information for building desktop
widgets and status bars.")
    (license license:lgpl2.1)))

;;; ── libastal-mpris (#8368) ──
;;; Library and CLI tool for controlling media players via MPRIS.

(define-public libastal-mpris
  (package
    (name "libastal-mpris")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "41b50290c6a1cdce7b482897c22fe49286912b9a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/mpris"))))))
    (inputs (list glib json-glib))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala))
    (home-page "https://aylur.github.io/astal/")
    (synopsis "library for controlling media players via MPRIS D-Bus")
    (description "Libastal-mpris provides a GObject-based library and CLI tool
for monitoring and controlling media players through the MPRIS D-Bus interface.
It supports playback control, metadata retrieval, and player enumeration for
building media widgets in desktop panels.")
    (license license:lgpl2.1)))

;;; ── libastal-apps (#8371) ──
;;; Library and CLI tool for querying installed applications.

(define-public libastal-apps
  (package
    (name "libastal-apps")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "41b50290c6a1cdce7b482897c22fe49286912b9a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/apps"))))))
    (inputs (list glib json-glib))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala))
    (home-page "https://aylur.github.io/astal/")
    (synopsis "library for querying installed desktop applications")
    (description "Libastal-apps provides a GObject-based library and CLI tool
for querying installed applications through desktop entry files.  It supports
fuzzy search, frequency-based sorting, and application launching for building
application launchers and menus.")
    (license license:lgpl2.1)))

;;; ── libastal-auth (#8372) ──
;;; Authentication library using PAM for the Astal suite.

(define-public libastal-auth
  (package
    (name "libastal-auth")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "41b50290c6a1cdce7b482897c22fe49286912b9a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/auth"))))))
    (inputs (list glib linux-pam))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala))
    (home-page "https://aylur.github.io/astal/")
    (synopsis "PAM authentication library for the Astal widget toolkit")
    (description "Libastal-auth provides a GObject-based library for
authenticating users through PAM (Pluggable Authentication Modules).  It is
designed for use in lock screens and authentication prompts built with the
Astal desktop widget toolkit.")
    (license license:lgpl2.1)))

;;; ── libastal-notifd (#8373) ──
;;; Notification daemon library and CLI tool.

(define-public libastal-notifd
  (package
    (name "libastal-notifd")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "41b50290c6a1cdce7b482897c22fe49286912b9a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/notifd"))))))
    (inputs (list glib json-glib gdk-pixbuf))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala))
    (home-page "https://aylur.github.io/astal/")
    (synopsis "notification daemon library for the Astal widget toolkit")
    (description "Libastal-notifd provides a GObject-based notification daemon
library and CLI tool implementing the freedesktop.org notification specification.
It allows desktop widgets and panels to receive, display, and manage desktop
notifications programmatically.")
    (license license:lgpl2.1)))

;;; ──────────────────────────────────────────────────────────────────
;;; Shell script / copy-build-system packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── commit-ai (#7419) ──
;;; Shell script to generate git commit messages using Gemini AI.

(define-public commit-ai
  (package
    (name "commit-ai")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jhowk14/commit-ai")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("any-linux/commit-ai.sh" "bin/commit-ai"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/commit-ai")
                          #o755)))
               (add-after 'fix-permissions 'wrap-program
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (wrap-program (string-append out "/bin/commit-ai")
                       `("PATH" ":" prefix
                         (,(string-append (assoc-ref inputs "git-minimal") "/bin")
                          ,(string-append (assoc-ref inputs "jq") "/bin")
                          ,(string-append (assoc-ref inputs "curl") "/bin"))))))))))
    (inputs (list git-minimal jq curl bash))
    (home-page "https://github.com/jhowk14/commit-ai")
    (synopsis "generate git commit messages using Gemini AI")
    (description "Commit-ai is a shell script that uses the Google Gemini API
to automatically generate conventional or Gitmoji-style git commit messages
from staged changes.  It requires a Gemini API key configured as an
environment variable.")
    (license license:expat)))

;;; ── plasma6-applets-separator (#7427) ──
;;; KDE Plasma 6 separator applet for panels.

(define-public plasma6-applets-separator
  (package
    (name "plasma6-applets-separator")
    (version "0.1.0-git.3813976")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dhruv8sh/plasma6-separator-applet")
                    (commit "381397684cef0b0b98a9feab3cd6f6e920b3bfe5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plasma/plasmoids/com.github.dhruv8sh.separator/"
                #:exclude ("LICENSE" "README.md" ".git")))))
    (home-page "https://github.com/dhruv8sh/plasma6-separator-applet")
    (synopsis "separator applet for KDE Plasma 6 panels")
    (description "A simple KDE Plasma 6 panel applet that renders a visual
separator between other applets.  It is a QML-only plasmoid with no
compilation required.")
    (license license:gpl2)))

;;; ── vswaybar-studio (#7360) ──
;;; GUI waybar theme configuration tool using Python/GTK.

(define-public vswaybar-studio
  (package
    (name "vswaybar-studio")
    (version "1.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/victorsosaMx/vsWaybar-Studio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/" "share/vswaybar-studio/")
               ("vswaybar-studio" "bin/vswaybar-studio"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/vswaybar-studio")
                          #o755))))))
    (inputs (list python python-pygobject python-pycairo))
    (home-page "https://github.com/victorsosaMx/vsWaybar-Studio")
    (synopsis "GUI theme editor for Waybar status bars")
    (description "VsWaybar-Studio is a Python/GTK graphical tool for designing
and customizing Waybar themes.  It provides a visual editor for configuring
modules, colors, and layouts of the Waybar status bar used with Sway and
other Wayland compositors.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── mathics (#7331) ──
;;; Mathematica-compatible computer algebra system in Python.

(define-public mathics
  (package
    (name "mathics")
    (version "9.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Mathics3/mathics-core/releases/download/"
                    version "/mathics3-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require many optional deps
    (propagated-inputs (list python-mpmath
                             python-numpy
                             python-sympy
                             python-pillow
                             python-scipy
                             python-requests
                             python-dateutil))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://mathics.org/")
    (synopsis "general-purpose computer algebra system compatible with Mathematica")
    (description "Mathics3 is a free, open-source computer algebra system that
is compatible with the Wolfram Language (Mathematica).  It supports symbolic
computation, pattern matching, and numerical evaluation.  The system is
implemented in Python and uses SymPy as its symbolic mathematics backend.")
    (license license:gpl3+)))

;;; ── waypaper (#8381) ──
;;; GUI wallpaper setter for Wayland and Xorg.

(define-public waypaper
  (package
    (name "waypaper")
    (version "2.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anufrievroman/waypaper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (propagated-inputs (list python-pygobject python-pillow python-platformdirs))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/anufrievroman/waypaper")
    (synopsis "GUI wallpaper setter for Wayland and Xorg")
    (description "Waypaper is a graphical wallpaper manager that works as a
frontend for swaybg, swww, feh, and other wallpaper-setting tools.  It provides
a visual gallery to browse, select, and apply wallpapers on both Wayland and
Xorg window managers.")
    (license license:gpl3+)))

;;; ── python-mariadb-connector (#7499) ──
;;; Python DB API 2.0 connector for MariaDB and MySQL.

(define-public python-mariadb-connector
  (package
    (name "python-mariadb-connector")
    (version "1.1.12")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "mariadb" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running MariaDB server
    (inputs (list mariadb))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://mariadb-corporation.github.io/mariadb-connector-python/")
    (synopsis "Python DB API 2.0 connector for MariaDB and MySQL databases")
    (description "MariaDB Connector/Python provides a Python database API 2.0
compliant interface for accessing MariaDB and MySQL databases.  It is
implemented in C for performance and supports connection pooling, prepared
statements, and bulk operations.")
    (license license:lgpl2.1+)))

;;; ── blivet-gui (#8385) ──
;;; GUI tool for storage configuration.

(define-public blivet-gui
  (package
    (name "blivet-gui")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/storaged-project/blivet-gui/archive/"
                    "refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require blivet + running system
    (propagated-inputs (list python-pygobject python-pycairo))
    (native-inputs (list python-setuptools python-wheel gettext-minimal))
    (home-page "https://github.com/storaged-project/blivet-gui")
    (synopsis "GUI tool for disk and storage configuration")
    (description "Blivet-gui is a graphical user interface for configuring
storage devices including disks, partitions, LVM volumes, and RAID arrays.
It uses the blivet Python library as its storage management backend and
provides a GTK3-based interface for common storage operations.")
    (license license:gpl2+)))

;;; ── razercommander (#8389) ──
;;; Razer device manager for Linux.

(define-public razercommander
  (package
    (name "razercommander")
    (version "1.2.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GabMus/razerCommander/archive/"
                    "refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t
           #:tests? #f))  ;; no test suite
    (inputs (list python python-pygobject gtk+))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         desktop-file-utils))
    (home-page "https://github.com/GabMus/razerCommander")
    (synopsis "GTK3 device manager for Razer peripherals")
    (description "RazerCommander is a GTK3-based graphical application for
managing Razer peripherals on Linux.  It allows setting lighting effects,
DPI levels, and polling rates for Razer mice, keyboards, and other devices
through the OpenRazer daemon.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Meson builds (non-Astal)
;;; ──────────────────────────────────────────────────────────────────

;;; ── wcm (#7437) ──
;;; Wayfire Configuration Manager.

(define-public wcm
  (package
    (name "wcm")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/WayfireWM/wcm/archive/"
                    "refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list gtkmm-3 libevdev wayland))
    (native-inputs (list pkg-config wayland-protocols
                         `(,glib "bin")))
    (home-page "https://github.com/WayfireWM/wcm")
    (synopsis "configuration manager for the Wayfire compositor")
    (description "WCM is a graphical configuration manager for the Wayfire
Wayland compositor.  It provides a GTK3-based interface for configuring
Wayfire plugins, key bindings, display settings, and compositor behavior
without editing configuration files manually.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Autotools builds (non-kalibrate)
;;; ──────────────────────────────────────────────────────────────────

;;; ── xplayer (#7502) ──
;;; Linux Mint X-Apps media player (fork of GNOME Totem).

(define-public xplayer
  (package
    (name "xplayer")
    (version "2.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/xplayer/archive/"
                    "refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-vif"))))))
    (inputs (list gtk+ glib
                  gst-plugins-base gst-plugins-good
                  clutter clutter-gtk clutter-gst
                  libpeas
                  python python-pygobject
                  dbus-glib
                  gsettings-desktop-schemas
                  totem-pl-parser))
    (native-inputs (list autoconf automake libtool
                         pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala
                         gnome-common
                         yelp-xsl
                         gettext-minimal
                         itstool))
    (home-page "https://github.com/linuxmint/xplayer")
    (synopsis "media player for the Linux Mint desktop")
    (description "Xplayer is a media player for the Linux Mint desktop
environment, forked from GNOME Totem.  It supports video and audio playback
through GStreamer, includes a plugin system, and integrates with the X-Apps
desktop ecosystem.")
    (license license:gpl2+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Java binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── autopsy-bin (#7496) ──
;;; Digital forensics platform built on The Sleuth Kit.

(define-public autopsy-bin
  (package
    (name "autopsy-bin")
    (version "4.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sleuthkit/autopsy/releases/download/"
                    "autopsy-" version "/autopsy-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/autopsy/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/autopsy")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/share/autopsy/bin/autopsy \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 java out)))
                     (chmod (string-append bin "/autopsy") #o755)))))))
    (inputs (list openjdk17 bash))
    (native-inputs (list unzip))
    (home-page "https://www.autopsy.com/")
    (synopsis "digital forensics platform for analyzing disk images")
    (description "Autopsy is a digital forensics platform and graphical
interface to The Sleuth Kit and other forensic tools.  It supports timeline
analysis, hash filtering, keyword search, web artifacts extraction, and
multimedia analysis of disk images and file systems.")
    (license license:asl2.0)))

;;; ── clipgrab (#7412) ──
;;; Video downloader for YouTube and other sites.

(define-public clipgrab
  (package
    (name "clipgrab")
    (version "3.9.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.clipgrab.org/clipgrab-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase-5 qtwebengine-5
                  ffmpeg yt-dlp))
    (native-inputs (list pkg-config))
    (home-page "https://clipgrab.org/")
    (synopsis "video downloader for YouTube and other sites")
    (description "ClipGrab is a graphical application for downloading videos
from YouTube, Vimeo, Dailymotion, and other video hosting sites.  It uses
yt-dlp as its download backend and provides format selection, audio extraction,
and batch downloading capabilities through a Qt5-based interface.")
    (license license:gpl3)))
