;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415l
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 5 resolved with new recipes (plus 1 new dependency);
;;; 9 already packaged in prior passes;
;;; 16 re-evaluated with concrete exhaust reasons.
;;;
;;; Recipes (6 new):
;;;   1. python-pkb-client (pyproject, v2.3.1, Porkbun DNS API client, MIT)
;;;   2. certbot-dns-porkbun (python, v0.11.0, Certbot DNS plugin, Apache-2.0)
;;;   3. protonplus (meson, v0.5.19, Proton/Wine manager for Linux gaming,
;;;      GPL-3.0+)
;;;   4. osdlyrics (gnu, v0.5.15, on-screen lyrics display, GPL-3.0+)
;;;   5. aaaaxy-bin (copy, v1.7.50, nonlinear puzzle platformer, Apache-2.0)
;;;   6. linnote (cmake, v1.0.0, scratchpad/note-taking app with Qt6, MIT)
;;;
;;; Already packaged (9):
;;;   - gameoftrees (#4023): upstream Guix as got v0.122; gaurix
;;;     general-compat.scm as got-vcs
;;;   - ripdrag (#3572): recipe in recipe-resolver-260415b.scm
;;;   - fzffm (#7783): recipe in recipe-resolver-260414ad.scm
;;;   - preview (#7784): recipe in recipe-resolver-260414ad.scm
;;;     (as preview-fm)
;;;   - bar_daemon (#3661): recipe in recipe-resolver-260415b.scm
;;;     (as bar-daemon)
;;;   - conky-colors-git (#3249): recipe in recipe-resolver-260413ak.scm
;;;     (as conky-colors)
;;;   - flameget (#3469): recipe in recipe-resolver-260415b.scm
;;;   - wlr-which-key (#8384): recipe in recipe-resolver-260415e.scm
;;;     (as wlr-which-key-bin)
;;;   - faircamp (#7411): recipe in recipe-resolver-260414ad.scm
;;;
;;; Exhausted (15):
;;;   - gx52 (#10061): MISSING_DEPS: Python/Meson app needing
;;;     python-injector and python-rx (neither in Guix); A1: package 2
;;;     deps — significant scope for niche hardware tool; A2: no binary
;;;     releases; A3: Flatpak only — not suitable for Guix
;;;   - tagger (#7755): DOTNET_UNSUPPORTED: C#/.NET app (NickvisionApps);
;;;     A1: .NET SDK not in Guix; A2: NuGet restore needs network;
;;;     A3: no Linux binary releases
;;;   - note-gen (#3976): TAURI_COMPLEX: Tauri 2.0 app (TypeScript +
;;;     Rust); A1: requires pnpm + Cargo dual build; A2: webkit2gtk +
;;;     dozens of crate deps; A3: AppImage available but repack non-trivial
;;;   - auto-cpufreq (#11477): SYSTEMD_ONLY: Python daemon requiring
;;;     systemd service integration and polkit policies; A1: Shepherd
;;;     service needed for Guix System — out of batch scope;
;;;     A2: pyinotify pinned to custom fork; A3: CLI-only mode loses
;;;     main daemon feature
;;;   - haguichi (#11820): PROPRIETARY_DEP: Vala/GTK4 GUI frontend for
;;;     LogMeIn Hamachi (proprietary, closed-source VPN); A1: Hamachi
;;;     cannot be packaged (non-free); A2: app is useless without
;;;     Hamachi; A3: no FOSS alternative client
;;;   - syca (#4162): ARCH_SPECIFIC: Arch Linux build helper depending on
;;;     pacman/makepkg; A1: requires pacman infrastructure; A2: no
;;;     purpose outside Arch; A3: already classified ARCH_SPECIFIC
;;;   - blinky (#4527): ARCH_SPECIFIC: AUR helper depending on pyalpm
;;;     (Python bindings for libalpm/pacman); A1: pyalpm not in Guix;
;;;     A2: requires AUR/pacman infrastructure; A3: no utility on Guix
;;;   - helion (#3787): DOTNET_UNSUPPORTED: C#/.NET Doom engine requiring
;;;     dotnet-sdk >= 10.0; A1: .NET SDK not in Guix; A2: circular
;;;     bootstrap problem; A3: AOT binary available but large (100MB+)
;;;   - pastelock (#7586): LICENSE_UNCLEAR_LOW_QUALITY: Python clipboard
;;;     manager with unspecified license; A1: custom/unclear license
;;;     blocks packaging; A2: needs python-customtkinter +
;;;     python-ctkmessagebox (not in Guix); A3: zero community adoption
;;;     (0 stars)
;;;   - bobcat-terminal (#7284): EXOTIC_BUILD: C++ terminal using
;;;     Ultimate++ (U++) framework; A1: U++ build system (umk) not in
;;;     Guix; A2: requires downloading entire U++ uppsrc tree;
;;;     A3: Ubuntu binary available but not ideal
;;;   - keypunch-git (#4146): DUAL_BUILD_COMPLEX: Rust + Meson GNOME app;
;;;     A1: Meson wrapping Cargo — requires both build systems;
;;;     A2: full cargo-inputs enumeration for GTK4/libadwaita crates;
;;;     A3: blueprint-compiler feature flag adds complexity
;;;   - mytimer (#7309): MISSING_DEPS_CHAIN: Python terminal timer needing
;;;     python-art (700+ font deps), python-nava (platform audio),
;;;     python-jdatetime; A1: python-art dependency tree enormous;
;;;     A2: python-nava uses platform-specific audio APIs;
;;;     A3: 3 deps to package for a simple timer
;;;   - linux-cachyos-headers (#1069): KERNEL_VARIANT: CachyOS custom
;;;     kernel headers; Guix uses linux-libre with its own kernel
;;;     packaging model; A1: custom kernel config infrastructure not
;;;     available in batch; A2: non-libre firmware blobs; A3: use Guix
;;;     linux-libre-headers
;;;   - linux-cachyos (#1070): KERNEL_VARIANT: CachyOS custom kernel;
;;;     same as linux-cachyos-headers; A1: requires kernel config
;;;     infrastructure; A2: BORE/EEVDF scheduler patches need integration;
;;;     A3: use Guix linux-libre
;;;   - linux-xanmod (#3137): KERNEL_VARIANT: XanMod custom kernel;
;;;     A1: requires kernel config infrastructure + patchset integration;
;;;     A2: kernel-style build phases not available in batch;
;;;     A3: use Guix linux-libre
;;;   - linux-xanmod-headers (#3138): KERNEL_VARIANT: XanMod kernel
;;;     headers; depends on linux-xanmod which is blocked;
;;;     A1: kernel infrastructure needed; A2: depends on blocked package;
;;;     A3: use Guix linux-libre-headers
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages ocr)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:export (
            python-pkb-client
            certbot-dns-porkbun
            protonplus
            osdlyrics
            aaaaxy-bin
            linnote
            ))

;;;
;;; --- 1. python-pkb-client ---
;;; Porkbun DNS API client library (dependency for certbot-dns-porkbun).
;;; Upstream: https://github.com/infinityofspace/pkb_client
;;;

(define-public python-pkb-client
  (package
    (name "python-pkb-client")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pkb_client" version))
              (sha256
               (base32
                "0iwbryx9mzzqw11bwas2w234mad5j6mifpvi5qcmb5m95cz0d8cw"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                  ;tests require network access
    (propagated-inputs (list python-requests python-dnspython))
    (synopsis "API client for the Porkbun DNS service")
    (description
     "pkb-client is a Python client library for the Porkbun DNS hosting
API.  It provides programmatic access to DNS record management,
including creating, updating, deleting, and listing DNS records for
domains hosted on Porkbun.")
    (home-page "https://github.com/infinityofspace/pkb_client")
    (license license:expat)))

;;;
;;; --- 2. certbot-dns-porkbun ---
;;; Certbot DNS authenticator plugin for Porkbun.
;;; Upstream: https://github.com/infinityofspace/certbot_dns_porkbun
;;;

(define-public certbot-dns-porkbun
  (package
    (name "certbot-dns-porkbun")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "certbot_dns_porkbun" version))
              (sha256
               (base32
                "1ik8nwvcn7pcr03q9vgdca83rg5ypdpi7xfvrjixmsw82z7a2aiy"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))                  ;tests require network + API keys
    (propagated-inputs (list certbot
                             python-pkb-client
                             python-dnspython
                             python-tldextract))
    (synopsis "Certbot DNS authenticator plugin for Porkbun")
    (description
     "certbot-dns-porkbun is a Certbot plugin that automates DNS-01
challenge completion using the Porkbun DNS API.  It allows automated
certificate issuance and renewal for domains hosted on Porkbun by
creating and cleaning up DNS TXT records automatically.")
    (home-page "https://github.com/infinityofspace/certbot_dns_porkbun")
    (license license:asl2.0)))

;;;
;;; --- 3. protonplus ---
;;; Proton/Wine compatibility tool manager for Linux gaming.
;;; Vala/GTK4/libadwaita app built with Meson.
;;; Upstream: https://github.com/Vysp3r/ProtonPlus
;;;

(define-public protonplus
  (package
    (name "protonplus")
    (version "0.5.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Vysp3r/ProtonPlus/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "173q0p2jn438gpgx1q4hjrysa253yzj1lffikp9gz7f51ym9dla6"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t))
    (native-inputs (list gettext-minimal
                         `(,glib "bin")        ;glib-compile-schemas
                         `(,gtk+ "bin")        ;gtk-update-icon-cache
                         desktop-file-utils
                         pkg-config
                         vala))
    (inputs (list gtk
                  glib
                  json-glib
                  libadwaita
                  libarchive
                  libgee
                  libsoup))
    (synopsis "Proton and Wine compatibility tool manager for Linux gaming")
    (description
     "ProtonPlus is a graphical tool for managing Proton and Wine
compatibility layers for Linux gaming.  It supports Steam, Lutris,
Heroic Games Launcher, and Bottles, allowing users to install, update,
and remove various compatibility tool versions including Proton-GE,
Wine-GE, and Luxtorpeda.")
    (home-page "https://github.com/Vysp3r/ProtonPlus")
    (license license:gpl3+)))

;;;
;;; --- 4. osdlyrics ---
;;; Desktop lyrics display for various media players via D-Bus.
;;; C/Python hybrid with GNU autotools build system.
;;; Upstream: https://github.com/osdlyrics/osdlyrics
;;;

(define-public osdlyrics
  (package
    (name "osdlyrics")
    (version "0.5.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/osdlyrics/osdlyrics/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0sriphhphn85dchnyg8c8axvmlmcsd619d1zzsnfj09gz92xqj2r"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'bootstrap
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool
                         intltool
                         pkg-config
                         desktop-file-utils))
    (inputs (list dbus-glib
                  gtk+
                  python
                  python-dbus
                  python-pygobject))
    (synopsis "on-screen lyrics display for desktop media players")
    (description
     "OSD Lyrics displays synchronized lyrics on the desktop for music
played through various media players.  It supports MPRIS-compatible
players via D-Bus, automatic lyric downloading from online sources,
and configurable on-screen display with transparency, font, and
position settings.  Both scrolling and karaoke-style display modes are
available.")
    (home-page "https://github.com/osdlyrics/osdlyrics")
    (license license:gpl3+)))

;;;
;;; --- 5. aaaaxy-bin ---
;;; Nonlinear puzzle platformer vaguely inspired by Portal.
;;; Prebuilt Linux binary from GitHub releases.
;;; Upstream: https://github.com/divVerent/aaaaxy
;;;

(define-public aaaaxy-bin
  (package
    (name "aaaaxy-bin")
    (version "1.7.50")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/divVerent/aaaaxy/releases/download/v"
                    version "/aaaaxy-linux-amd64-v" version ".zip"))
              (sha256
               (base32
                "0fk5ihlb9rk642dnf6cmi9m28i3h3zb0pi6zwbfh1y26h3yjkz4a"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("aaaaxy" "bin/aaaaxy"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/aaaaxy")
                     #o755))))))
    (native-inputs (list unzip))
    (synopsis "nonlinear puzzle platformer inspired by Portal")
    (description
     "AAAAXY is a nonlinear puzzle platformer game vaguely inspired by
Portal.  Players explore interconnected rooms, solving physics-based
puzzles involving gravity, portals, and spatial reasoning.  The game
features a hand-drawn art style and supports keyboard, mouse, and
gamepad controls.")
    (home-page "https://aaaaxy.esoterik.org/")
    (license license:asl2.0)))

;;;
;;; --- 6. linnote ---
;;; Desktop scratchpad and note-taking application built with Qt6.
;;; Features OCR via tesseract, system tray, markdown highlighting.
;;; Upstream: https://github.com/sfnemis/linnote
;;;

(define-public linnote
  (package
    (name "linnote")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sfnemis/linnote/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0ifk0yycvcqzj3817vbdsgz7arby44mqb87kjqakg7m3jirp4gww"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))                  ;no test suite
    (inputs (list qtbase
                  qtsvg
                  kwindowsystem
                  kglobalaccel
                  layer-shell-qt
                  tesseract-ocr))          ;runtime OCR via QProcess
    (synopsis "desktop scratchpad and note-taking app with Qt6")
    (description
     "LinNote is a desktop scratchpad and note-taking application built
with Qt6.  It provides a system tray note editor with markdown syntax
highlighting, code highlighting, OCR text extraction via Tesseract,
slash commands for quick actions like math evaluation and unit
conversion, and Wayland layer-shell support for always-on-top mode.")
    (home-page "https://github.com/sfnemis/linnote")
    (license license:expat)))
