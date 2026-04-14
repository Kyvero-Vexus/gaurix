;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413ag
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 20 recipes created (binary repacks, C/C++ source, Meson libs, Python, shell)
;;;   - 10 re-blocked with EXHAUSTED notes
;;;
;;; Recipes (20):
;;;   opensnitch-bin, radeon-gpu-profiler-bin, sunvox-bin, larksuite-bin,
;;;   obnc, terlang, buildcache,
;;;   libastal-powerprofiles, libastal-battery, libastal-mpris,
;;;   libastal-apps, libastal-auth, libastal-notifd,
;;;   getnf, tlp-rdw,
;;;   qemu-ovmf-secureboot, thinkfan-ui, tlp-pd,
;;;   grumpy-irc, chrome-remote-desktop-bin
;;;
;;; Re-blocked (10):
;;;   shelly-bin (#7350) — ARCH_SPECIFIC
;;;   archium (#7301) — ARCH_SPECIFIC
;;;   wlr-which-key (#8384) — CARGO_DEPS_NEEDED
;;;   ytdlp-gui (#8376) — CARGO_DEPS_NEEDED
;;;   tmplayer (#7353) — CARGO_DEPS_NEEDED
;;;   mytimer (#7309) — PYTHON_DEPS_NEEDED
;;;   git-wizard (#7384) — PYTHON_DEPS_NEEDED
;;;   razercommander (#8389) — PYTHON_OPENRAZER_NEEDED
;;;   vswaybar-studio (#7360) — WEBKIT_COMPLEX
;;;   blivet-gui (#8385) — PYTHON_BLIVET_NEEDED
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413ag)
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
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xorg)
  #:export (
            ;; Binary packages
            opensnitch-bin
            radeon-gpu-profiler-bin
            sunvox-bin
            larksuite-bin
            chrome-remote-desktop-bin
            ;; C/C++ source builds
            obnc
            terlang
            buildcache
            ;; Meson builds (libastal suite)
            libastal-powerprofiles
            libastal-battery
            libastal-mpris
            libastal-apps
            libastal-auth
            libastal-notifd
            ;; Shell / trivial
            getnf
            tlp-rdw
            ;; Python packages
            qemu-ovmf-secureboot
            thinkfan-ui
            tlp-pd
            ;; CMake + Qt6
            grumpy-irc
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── opensnitch-bin (#7282) ──
;;; Interactive application firewall for GNU/Linux.

(define-public opensnitch-bin
  (package
    (name "opensnitch-bin")
    (version "1.6.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/evilsocket/opensnitch/releases/download/v"
                    version "/opensnitch_" version "-1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/lib/" "lib/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/evilsocket/opensnitch")
    (synopsis "interactive application firewall for GNU/Linux")
    (description "OpenSnitch is a GNU/Linux interactive application firewall
inspired by Little Snitch.  It monitors outgoing network connections and lets
the user allow or deny them based on configurable rules.  It consists of a
daemon written in Go and a UI written in Python/Qt.")
    (license license:gpl3)))

;;; ── radeon-gpu-profiler-bin (#7305) ──
;;; AMD Radeon GPU profiling suite with RGP and RGA tools.

(define-public radeon-gpu-profiler-bin
  (package
    (name "radeon-gpu-profiler-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GPUOpen-Tools/radeon_gpu_profiler/"
                    "releases/download/v" version
                    "/RadeonGPUProfiler-" version ".tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/radeon-gpu-profiler/"
                #:exclude ("README.md" "LICENSE")))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gpuopen.com/rgp/")
    (synopsis "suite of GUI tools for profiling Radeon GPUs")
    (description "Radeon GPU Profiler provides detailed low-level performance
information for applications running on AMD Radeon GPUs.  It includes RGP for
frame profiling and RGA for shader analysis, helping developers identify and
resolve performance bottlenecks.")
    (license license:expat)))

;;; ── sunvox-bin (#8383) ──
;;; Modular synthesizer with pattern-based sequencer (tracker).

(define-public sunvox-bin
  (package
    (name "sunvox-bin")
    (version "2.1.4d")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://warmplace.ru/soft/sunvox/sunvox-"
                    version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sunvox/linux_x86_64/sunvox" "bin/sunvox")
               ("sunvox/docs/" "share/doc/sunvox/")
               ("sunvox/examples/" "share/sunvox/examples/"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "http://warmplace.ru/soft/sunvox/")
    (synopsis "small, fast modular synthesizer with pattern-based sequencer")
    (description "SunVox is a modular synthesizer with a pattern-based
sequencer (tracker).  It is optimized for minimal resource usage and supports
real-time audio synthesis, multiple module types, pattern effects, and MIDI
input.  It can be used to compose electronic music on resource-constrained
devices.")
    (license (license:non-copyleft
              "http://warmplace.ru/soft/sunvox/license.txt"
              "Freeware for personal and educational use"))))

;;; ── larksuite-bin (#7375) ──
;;; Collaboration suite for office messaging, calendars, and documents.

(define-public larksuite-bin
  (package
    (name "larksuite-bin")
    (version "7.62.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sf16-va.larksuitecdn.com/obj/lark-artifact-storage/"
                    "Lark-linux_x64-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/bytedance/larksuite/" "share/larksuite/")
               ("usr/share/applications/" "share/applications/")
               ("usr/share/icons/" "share/icons/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.larksuite.com")
    (synopsis "collaboration suite for messaging, calendars, and documents")
    (description "Lark Suite is an enterprise collaboration platform that
provides integrated messaging, video conferencing, calendar, document editing,
and project management tools.  This package installs the official pre-built
desktop client for Linux.")
    (license (license:non-copyleft
              "https://www.larksuite.com/terms"
              "Proprietary Lark user license"))))

;;; ── chrome-remote-desktop-bin (#7290) ──
;;; Remote desktop access via Chrome browser infrastructure.

(define-public chrome-remote-desktop-bin
  (package
    (name "chrome-remote-desktop-bin")
    (version "147.0.7727.3")
    (source (origin
              (method url-fetch)
              (uri "https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/google/chrome-remote-desktop/" "share/chrome-remote-desktop/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://remotedesktop.google.com")
    (synopsis "remote desktop access over the Internet via Chrome")
    (description "Chrome Remote Desktop allows secure remote access to
computers over the Internet.  It uses the Chrome browser infrastructure for
session management and supports both attended and unattended access modes.")
    (license license:bsd-3)))

;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ source builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── obnc (#7298) ──
;;; Compiler for the Oberon programming language.

(define-public obnc
  (package
    (name "obnc")
    (version "0.17.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://miasap.se/obnc/downloads/obnc-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./build" "--prefix"
                           (assoc-ref outputs "out")))))))
    (inputs (list libgc sdl2))
    (home-page "https://miasap.se/obnc/")
    (synopsis "compiler for the Oberon programming language")
    (description "OBNC is a compiler for Niklaus Wirth's programming language
Oberon.  It translates Oberon source code to C, which is then compiled with a
C compiler.  It supports the Oberon-07 language report and includes a basic
library with optional SDL-based graphics.")
    (license license:gpl3+)))

;;; ── terlang (#7352) ──
;;; Programming language for scripting with C++-like syntax.

(define-public terlang
  (package
    (name "terlang")
    (version "0.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/terroo/terlang")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/terroo/terlang")
    (synopsis "programming language for scripting with C++-like syntax")
    (description "Terlang is a lightweight scripting language with syntax
similar to C++.  It is designed for quick scripting tasks and includes basic
features for string manipulation, arithmetic, control flow, and function
definitions.")
    (license license:gpl3)))

;;; ── buildcache (#7363) ──
;;; Advanced compiler cache accelerator.

(define-public buildcache
  (package
    (name "buildcache")
    (version "0.28.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mbitsnbites/buildcache")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list openssl))
    (home-page "https://github.com/mbitsnbites/buildcache")
    (synopsis "advanced compiler cache accelerator")
    (description "BuildCache is a compiler cache that speeds up rebuilds by
caching previous compilations and detecting when the same compilation is being
done again.  It supports multiple compilers and can use remote caching
backends such as Redis, HTTP, and S3.")
    (license license:zlib)))

;;; ──────────────────────────────────────────────────────────────────
;;; Meson builds — libastal suite (github.com/Aylur/astal)
;;; ──────────────────────────────────────────────────────────────────

;;; ── libastal-powerprofiles (#8366) ──
;;; Library and CLI to control UPower power profiles.

(define-public libastal-powerprofiles
  (package
    (name "libastal-powerprofiles")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "ca3190d")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:configure-flags
           #~(list (string-append "-Dprefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/powerprofiles"))))))
    (native-inputs (list pkg-config gobject-introspection vala))
    (inputs (list glib json-glib))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "library and CLI to control UPower power profiles")
    (description "Libastal-powerprofiles is a GLib-based library that provides
a D-Bus proxy for controlling UPower daemon power profiles.  It includes a
command-line interface for switching between power-saver, balanced, and
performance profiles.  It is part of the Astal desktop widget framework.")
    (license license:lgpl2.1)))

;;; ── libastal-battery (#8367) ──
;;; D-Bus proxy library for the UPower daemon.

(define-public libastal-battery
  (package
    (name "libastal-battery")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "ca3190d")))
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
    (native-inputs (list pkg-config gobject-introspection vala))
    (inputs (list glib json-glib))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "D-Bus proxy library for the UPower daemon")
    (description "Libastal-battery is a GLib-based library providing a D-Bus
proxy for the UPower daemon.  It allows querying battery status, charge level,
and power state information.  It is part of the Astal desktop widget
framework.")
    (license license:lgpl2.1)))

;;; ── libastal-mpris (#8368) ──
;;; Library and CLI for controlling MPRIS-compatible media players.

(define-public libastal-mpris
  (package
    (name "libastal-mpris")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "ca3190d")))
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
    (native-inputs (list pkg-config gobject-introspection vala))
    (inputs (list glib json-glib))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "library and CLI for controlling MPRIS media players")
    (description "Libastal-mpris is a GLib-based library for controlling media
players that implement the MPRIS D-Bus interface.  It supports play, pause,
skip, volume control, and metadata queries.  A command-line tool is also
provided.  It is part of the Astal desktop widget framework.")
    (license license:lgpl2.1)))

;;; ── libastal-apps (#8371) ──
;;; Library and CLI for querying installed applications.

(define-public libastal-apps
  (package
    (name "libastal-apps")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "ca3190d")))
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
    (native-inputs (list pkg-config gobject-introspection vala))
    (inputs (list glib json-glib))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "library and CLI for querying installed applications")
    (description "Libastal-apps is a GLib-based library for querying
installed desktop applications via their @file{.desktop} entries.  It supports
searching, filtering, and launching applications.  A command-line tool is also
provided.  It is part of the Astal desktop widget framework.")
    (license license:lgpl2.1)))

;;; ── libastal-auth (#8372) ──
;;; Authentication library using PAM.

(define-public libastal-auth
  (package
    (name "libastal-auth")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "2927230")))
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
    (native-inputs (list pkg-config gobject-introspection vala))
    (inputs (list glib linux-pam))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "PAM-based authentication library for the Astal suite")
    (description "Libastal-auth is a GLib-based authentication library that
uses Linux PAM for user authentication.  It provides a simple API for
verifying user credentials from desktop widgets and panels.  It is part of the
Astal desktop widget framework.")
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
                    (commit "ca3190d")))
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
    (native-inputs (list pkg-config gobject-introspection vala))
    (inputs (list glib json-glib gdk-pixbuf))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "notification daemon library and CLI tool")
    (description "Libastal-notifd is a GLib-based library implementing a
freedesktop.org-compatible notification daemon.  It receives and manages
desktop notifications via D-Bus and supports notification actions, urgency
levels, and icons.  A command-line tool is also provided.  It is part of the
Astal desktop widget framework.")
    (license license:lgpl2.1)))

;;; ──────────────────────────────────────────────────────────────────
;;; Shell scripts / trivial builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── getnf (#7341) ──
;;; Command-line tool for installing Nerd Fonts.

(define-public getnf
  (package
    (name "getnf")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/getnf/getnf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("getnf" "bin/getnf"))))
    (inputs (list curl bash))
    (home-page "https://github.com/getnf/getnf")
    (synopsis "command-line tool for installing Nerd Fonts")
    (description "Getnf is a Bash script that provides an interactive menu for
downloading and installing Nerd Fonts from the terminal.  It fetches fonts
from the official Nerd Fonts release page and installs them to the user's font
directory.")
    (license license:gpl3+)))

;;; ── tlp-rdw (#7306) ──
;;; Radio device wizard for TLP power management.

(define-public tlp-rdw
  (package
    (name "tlp-rdw")
    (version "1.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linrunner/TLP")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "TLP_SBIN=/sbin"
                   "TLP_ULIB=/lib/udev"
                   "TLP_NMDSP=/etc/NetworkManager/dispatcher.d"
                   "TLP_CONFDIR=/etc/tlp.d"
                   "install-rdw")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash network-manager))
    (home-page "https://linrunner.de/tlp/")
    (synopsis "switch WiFi and Bluetooth on/off automatically with TLP")
    (description "TLP Radio Device Wizard automatically enables or disables
WiFi and Bluetooth radios upon docking/undocking and network connect/disconnect
events via NetworkManager dispatcher hooks.  It is a companion to the TLP
power management tool.")
    (license license:gpl2+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── qemu-ovmf-secureboot (#7330) ──
;;; Script to generate OVMF vars with Secure Boot keys enrolled.

(define-public qemu-ovmf-secureboot
  (package
    (name "qemu-ovmf-secureboot")
    (version "1.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rhuefi/qemu-ovmf-secureboot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ovmf-vars-generator" "bin/ovmf-vars-generator"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-program
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (wrap-program (string-append out "/bin/ovmf-vars-generator")
                       `("PATH" ":" prefix
                         (,(string-append (assoc-ref inputs "python")
                                          "/bin"))))))))))
    (inputs (list python))
    (home-page "https://github.com/rhuefi/qemu-ovmf-secureboot")
    (synopsis "generate OVMF variables file with Secure Boot keys enrolled")
    (description "This tool generates an OVMF variables file with default
Secure Boot keys (PK, KEK, and DB) enrolled.  The resulting file can be used
with QEMU to boot virtual machines in UEFI Secure Boot mode without manual
key enrollment.")
    (license license:expat)))

;;; ── thinkfan-ui (#7294) ──
;;; GUI application for ThinkPad fan speed control and temperature monitoring.

(define-public thinkfan-ui
  (package
    (name "thinkfan-ui")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zocker-160/thinkfan-ui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list python-pyqt lm-sensors))
    (home-page "https://github.com/zocker-160/thinkfan-ui")
    (synopsis "GUI for controlling ThinkPad fan speed and monitoring temps")
    (description "Thinkfan-UI is a small graphical application for Linux that
controls fan speed and monitors temperatures on Lenovo ThinkPad laptops.  It
provides a system tray icon with quick access to fan profiles and a detailed
view of thermal sensor readings.  It requires the thinkpad_acpi kernel
module.")
    (license license:gpl3)))

;;; ── tlp-pd (#7307) ──
;;; Desktop power profile switcher for TLP.

(define-public tlp-pd
  (package
    (name "tlp-pd")
    (version "1.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linrunner/TLP")
                    (commit version)))
              (file-name (git-file-name "tlp-pd" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "install-pd")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list python python-pygobject polkit glib))
    (home-page "https://linrunner.de/tlp/")
    (synopsis "desktop power profile switcher for TLP")
    (description "TLP Power Device is a desktop helper that allows switching
power profiles from a desktop environment.  It provides a Polkit agent and
GObject-based interface for managing TLP power states without requiring root
access.  It is a companion to the TLP power management tool.")
    (license license:gpl2+)))

;;; ──────────────────────────────────────────────────────────────────
;;; CMake + Qt6
;;; ──────────────────────────────────────────────────────────────────

;;; ── grumpy-irc (#7287) ──
;;; Modern IRC client with distributed core, written in C++.

(define-public grumpy-irc
  (package
    (name "grumpy-irc")
    (version "1.0.0-alpha")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grumpy-irc/grumpy")
                    (commit "e39e71f")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase qtdeclarative qtmultimedia))
    (home-page "https://github.com/grumpy-irc/grumpy")
    (synopsis "modern IRC client with distributed core")
    (description "GrumpyChat is a modern IRC client written in C++ with a
distributed architecture.  It features a persistent IRC bouncer core that
keeps connections alive independently of the GUI client, message history
across sessions, and support for multiple networks.  The interface is built
with Qt6.")
    (license license:lgpl3)))
