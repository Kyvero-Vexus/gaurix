;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408l pass
;;; 20 packages re-evaluated and re-blocked with specific reasons.

(define recipe-resolver-260408l-blocked-notes
  (list
    '(3765 "gtkhash-thunar"
      reason: "ALREADY_IN_GUIX"
      details: "gtkhash already exists in Guix (v0.9.8). The -thunar variant is a Thunar plugin built from the same source. Packaging as separate recipe requires gtkhash source with --enable-thunar configure flag. Not a pure NEEDS_RECIPE_DESIGN case."
      attempts: ("checked guix show gtkhash: exists at 0.9.8"
                 "reviewed upstream: same source tree, variant build"
                 "considered inherit+modify from upstream gtkhash: feasible but version mismatch"))

    '(4337 "logiops-git"
      reason: "SUBMODULE_DEPENDENCY"
      details: "C++20 cmake project (github.com/PixlOne/logiops v0.3.5, GPL-3.0). Requires ipcgull submodule (glib/gio/dbus integration) which must be separately packaged or bundled. C++20 and submodule handling complicates batch processing."
      attempts: ("verified source at GitHub: v0.3.5 tag exists"
                 "audited deps: libevdev, libconfig, eudev all in Guix"
                 "identified ipcgull submodule as blocker: not in Guix, not a standalone project"))

    '(4929 "wleave"
      reason: "CARGO_DEPS_NOT_AVAILABLE"
      details: "Wayland logout menu (github.com/AMNatty/wleave v0.7.1, MIT). Written in Rust with GTK4/libadwaita Rust bindings. Requires individual cargo crate packaging for gtk4-rs, libadwaita-rs, gtk4-layer-shell crate, etc."
      attempts: ("verified source: v0.7.1 tag exists"
                 "audited system deps: gtk4, libadwaita, gtk4-layer-shell all in Guix"
                 "evaluated cargo deps: Rust crate dependency tree too large for batch"))

    '(4461 "libpurple-lurch-git"
      reason: "MISSING_DEPENDENCY"
      details: "OMEMO plugin for libpurple (github.com/gkdr/lurch v0.7.0, GPL-3.0). Requires libaxc (github.com/gkdr/axc v0.3.7) which is not in Guix. libaxc is a small C/cmake library wrapping libsignal-protocol-c."
      attempts: ("verified source: v0.7.0 tag exists"
                 "audited deps: pidgin/libpurple, libgcrypt, libxml2, sqlite, minixml all in Guix"
                 "identified libaxc as missing dep: must be packaged first"))

    '(4268 "gittyup"
      reason: "BUILD_SYSTEM_TOO_COMPLEX"
      details: "Qt6/cmake Git GUI (github.com/Murmele/Gittyup v2.5.9, MIT). Has 8+ git submodules (libgit2, libssh2, openssl, cmark, hunspell, lua, lexilla, scintillua). USE_SYSTEM_* cmake flags help but untested. Scintillua bundling may need special handling."
      attempts: ("verified source: v2.5.9 tag exists"
                 "audited cmake options: USE_SYSTEM_LIBGIT2, USE_SYSTEM_OPENSSL etc. available"
                 "evaluated complexity: too many submodules for batch processing"))

    '(4200 "tacentview-git"
      reason: "FETCHCONTENT_BUNDLING"
      details: "C++ cmake image viewer (github.com/bluescan/tacentview v1.0.47, ISC). Uses cmake FetchContent to download tacent library at build time. Bundles imgui and GLFW static .a. Requires unbundling and patching cmake to use system libs."
      attempts: ("verified source: v1.0.47 tag exists"
                 "audited build: FetchContent downloads tacent from GitHub at configure time"
                 "evaluated unbundling effort: tacent not a standalone package, would need separate packaging"))

    '(4202 "xviewer-plugins"
      reason: "MISSING_DEPENDENCY"
      details: "Linux Mint xviewer plugin pack (github.com/linuxmint/xviewer-plugins v3.4.3, GPL-2.0). Requires xviewer (Linux Mint image viewer) which is not in Guix. Also libpeas version mismatch (2.x in Guix vs 1.x API needed)."
      attempts: ("verified source: v3.4.3 tag exists, meson build"
                 "checked guix show xviewer: not found"
                 "audited other deps: libchamplain, clutter, clutter-gtk all in Guix"))

    '(4260 "fulcrum"
      reason: "BUILD_SYSTEM_UNCOMMON"
      details: "Bitcoin Electrum SPV server (github.com/cculianu/Fulcrum v2.1.0, GPL-3.0). Uses qmake build system (not cmake despite earlier notes). qmake is less common in Guix. Deps (qtbase, rocksdb, zeromq) all available."
      attempts: ("verified source: v2.1.0 tag exists"
                 "audited build system: uses .pro qmake file, not cmake"
                 "checked deps: qtbase, rocksdb, zeromq, miniupnpc all in Guix"))

    '(4426 "adwaita-dark-darose"
      reason: "NO_UPSTREAM_SOURCE"
      details: "AUR-only custom Adwaita-dark color variant (v3.28). No upstream repository. Build process extracts CSS from installed GTK3 libgtk-3.so using gresource tool and applies sed color substitutions. Fragile and non-standard."
      attempts: ("searched for upstream repo: none found, AUR-only"
                 "reviewed PKGBUILD: generates theme from installed GTK resources at build time"
                 "evaluated reproducibility: gresource extraction is fragile and version-dependent"))

    '(4842 "zgen-git"
      reason: "ABANDONED_PROJECT"
      details: "Zsh plugin manager (github.com/tarjoilija/zgen, BSD-2-Clause). Project is unmaintained; README recommends successor zgenom (github.com/jandamm/zgenom). No tagged releases. Trivial to package but obsolete."
      attempts: ("verified repo: exists but no recent activity"
                 "read README: explicitly recommends zgenom as replacement"
                 "evaluated value: packaging abandoned tool not worthwhile"))

    '(4908 "virtnbdbackup"
      reason: "MISSING_DEPENDENCY"
      details: "libvirt NBD backup tool (github.com/abbbi/virtnbdbackup v2.46, GPL-2.0+). Python with many deps. Requires python-libnbd and nbdkit which are not in Guix. nbdkit is a substantial C project (Red Hat NBD toolkit)."
      attempts: ("verified source: v2.46 tag exists"
                 "audited Python deps: most in Guix (libvirt, lxml, tqdm, lz4, paramiko)"
                 "identified blockers: python-libnbd and nbdkit missing from Guix"))

    '(5003 "pmb887x-emu-git"
      reason: "BUILD_SYSTEM_TOO_COMPLEX"
      details: "Siemens PMB887x phone emulator (github.com/siemens-mobile-hacks/pmb887x-emu v0.1.0, GPL-2.0). Embeds a heavily patched QEMU fork as ExternalProject_Add submodule. Cannot cleanly separate QEMU fork from main build."
      attempts: ("verified source: v0.1.0 tag exists"
                 "audited build: embeds custom QEMU fork via ExternalProject_Add"
                 "evaluated unbundling: QEMU fork is too custom to use system QEMU"))

    '(5007 "pineapple-midi-player"
      reason: "FETCHCONTENT_BUNDLING"
      details: "Qt6/cmake MIDI player (github.com/BLumia/pineapple-midi-player v2.0.0, MIT). Uses cmake FetchContent to download PortAudio at build time. Guix portaudio package is very old. Bundled TinySoundFont is header-only (OK)."
      attempts: ("verified source: v2.0.0 tag exists"
                 "audited build: FetchContent grabs PortAudio from git"
                 "checked guix portaudio: old version 190600.20161030, may be incompatible"))

    '(4980 "bitwarden-systemd"
      reason: "SYSTEMD_INCOMPATIBLE"
      details: "Systemd service files for Bitwarden CLI (github.com/OJFord/bitwarden-systemd v1.0.0, GPL-3.0). Guix uses GNU Shepherd, not systemd. Also requires bitwarden-cli (Electron/Node.js) which is not in Guix."
      attempts: ("verified source: v1.0.0 tag exists"
                 "evaluated Guix compatibility: systemd service files useless on Guix"
                 "checked bitwarden-cli: not in Guix, Electron app"))

    '(4974 "memoria-ui"
      reason: "MISSING_DEPENDENCY"
      details: "Qt6 Quick clipboard manager UI (github.com/Bumblebee-3/memoria v1.1.0, MIT). The UI is cmake+Qt6 Quick (straightforward) but requires memoria-daemon which is a separate Rust/Cargo binary with many crate dependencies."
      attempts: ("verified source: v1.1.0 tag exists"
                 "audited build: UI is simple cmake+Qt6 Quick"
                 "identified blocker: daemon is Rust/Cargo with large dep tree"))

    '(4975 "mistserver"
      reason: "MISSING_DEPENDENCY"
      details: "Open-source streaming media server (github.com/DDVTECH/mistserver v3.10, Unlicense). Meson build with ffmpeg, libsrtp2, usrsctp, srt deps (all in Guix). Requires librist which is not in Guix."
      attempts: ("verified source: v3.10 tag exists"
                 "audited deps: most available (ffmpeg, libsrtp, srt, mbedtls)"
                 "identified blocker: librist not in Guix"))

    '(4930 "heidisql-qt6-git"
      reason: "BUILD_SYSTEM_TOO_COMPLEX"
      details: "Database management GUI (github.com/HeidiSQL/HeidiSQL v12.16, GPL-2.0). Despite AUR name suggesting Qt6, actually written in Free Pascal using Lazarus IDE. Build is Windows-oriented. Lazarus/FPC are in Guix but HeidiSQL build system targets Win32/Win64."
      attempts: ("verified source: v12.16 tag exists"
                 "audited build: uses Lazarus .lpr project file, not Qt/cmake"
                 "evaluated Linux build: heavily Windows-oriented, unclear Linux support"))

    '(6109 "windows-10-cursor"
      reason: "LICENSE_UNCLEAR"
      details: "Cursor theme mimicking Windows 10 cursors (github.com/red-magic/cursor-themes v2.0). No LICENSE file in repository. Cursor design likely derived from Microsoft copyrighted assets. Cannot distribute without clear license."
      attempts: ("verified source: v2.0 tag exists"
                 "checked license: no LICENSE file in repo"
                 "evaluated copyright: cursor designs likely Microsoft-derived"))

    '(4562 "katifetch"
      reason: "POOR_QUALITY"
      details: "System info fetcher (github.com/ximimoments/katifetch, MIT). No proper version tags (tags named 'sss' and 'idk'). Dozens of platform-variant scripts with no coherent project structure. Not suitable for packaging."
      attempts: ("verified repo: exists at GitHub"
                 "audited tags: only joke names ('sss', 'idk')"
                 "evaluated quality: hobbyist project with no release discipline"))

    '(4919 "libcryptui"
      reason: "ARCHIVED_PROJECT"
      details: "GNOME crypto dialog library (gitlab.gnome.org/Archive/libcryptui v3.12.2, LGPL-2.1+). Archived/unmaintained since 2014. Part of old Seahorse/GNOME crypto stack. All deps in Guix (gtk3, gcr, gpgme). Could be packaged if needed as dep for something."
      attempts: ("verified source: v3.12.2 tarball at download.gnome.org"
                 "checked deps: all available in Guix"
                 "evaluated relevance: archived 12 years ago, only useful as transitive dep"))))
