;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418r
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (15):
;;;     1.  positron-ide-devel-bin (copy-build-system, v2026.04.0-269, elastic2.0)
;;;     2.  muffon-bin (copy-build-system, v2.4.0, agpl3)
;;;     3.  sshpilot-bin (copy-build-system, v4.7.9, gpl3)
;;;     4.  godot-preview-bin (copy-build-system, v4.7-dev4, expat)
;;;     5.  stretchly-bin (copy-build-system, v1.20.0, bsd-2)
;;;     6.  filen-desktop-bin (copy-build-system, v3.0.47, agpl3)
;;;     7.  freetube-electron-bin (copy-build-system, v0.24.0, agpl3+)
;;;     8.  dbgate-bin (copy-build-system, v7.1.8, gpl3)
;;;     9.  cs-demo-manager-appimage (copy-build-system, v3.19.0, expat)
;;;    10.  reticulum-meshchat-bin (copy-build-system, v2.3.0, expat)
;;;    11.  folo-appimage (copy-build-system, v1.6.1, agpl3)
;;;    12.  whatsdesk-bin (copy-build-system, v0.3.12, expat)
;;;    13.  affine-bin (copy-build-system, v0.26.3, expat)
;;;    14.  jitsi-meet-electron-bin (copy-build-system, v1.0.9139, asl2.0)
;;;    15.  wayback-x11 (meson-build-system, v0.3, expat)
;;;
;;; BLOCKED EXHAUSTED (15):
;;;    16.  postman-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY:
;;;         API development platform; no open-source license; Postman EULA
;;;         prohibits redistribution;
;;;         A1: no source available; A2: ToS blocks repackaging; A3: use Insomnia or Hoppscotch
;;;    17.  kibo-appimage -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY:
;;;         anime streaming app; no source repo, no license declaration;
;;;         A1: no source code; A2: binary download domain proprietary; A3: no open alternative
;;;    18.  plexamp-appimage -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY:
;;;         Plex music player; proprietary by Plex Inc;
;;;         A1: no source code; A2: redistribution prohibited; A3: use Finamp or similar
;;;    19.  haproxy-awslc -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEP:
;;;         HAProxy with AWS-LC crypto; requires aws-lc (Amazon LibCrypto) not in Guix;
;;;         A1: aws-lc is large C/C++/assembly project needing packaging first;
;;;         A2: custom Makefile build with non-standard flags; A3: standard HAProxy already in Guix
;;;    20.  idescriptor-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_BUILD:
;;;         iDevice management tool; requires cmake+Go+Cargo triple toolchain;
;;;         A1: 30+ dependencies including libtatsu, qtermwidget (not in Guix);
;;;         A2: git submodules for Go/Rust components; A3: no binary releases available
;;;    21.  openbuilds-control-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_BUILD:
;;;         CNC controller Electron app; pinned to obsolete electron23;
;;;         A1: Guix lacks Electron packaging infrastructure; A2: source build requires
;;;         Chromium stack; A3: binary .deb has complex native dep chain
;;;    22.  webtorrent-bittorrent-tracker -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_DEPS:
;;;         BitTorrent tracker in Node.js; deep npm dependency tree;
;;;         A1: npm dependency resolution incompatible with Guix functional model;
;;;         A2: no pre-built binary; A3: Guix node-build-system cannot handle transitive deps
;;;    23.  nodemcu-tool -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_DEPS:
;;;         NodeMCU CLI tool; npm package requiring npm install at build time;
;;;         A1: depends on deprecated python2; A2: npm dep tree; A3: stale (last AUR update 2021)
;;;    24.  buuf-icon-theme -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NONFREE_LICENSE:
;;;         Buuf icon theme; licensed CC-BY-NC-SA (NonCommercial clause);
;;;         A1: non-free license incompatible with Guix; A2: no relicensing available;
;;;         A3: no versioned releases (master branch only)
;;;    25.  dopamine-official -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_BUILD:
;;;         music player Electron+Angular app; distributed only as AppImage binary;
;;;         A1: source build requires Electron v37 + Angular 16 + npm;
;;;         A2: no source build path in Guix; A3: use Lollypop, GNOME Music, or Amberol
;;;    26.  streamcontroller -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NO_BUILD_SYSTEM:
;;;         Stream Deck controller; no pyproject.toml, uses pip virtualenv only;
;;;         A1: 50+ pinned pip dependencies; A2: only beta releases exist;
;;;         A3: incompatible with Guix functional build model
;;;    27.  nautilus-typeahead -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS:
;;;         Nautilus with type-ahead patches; needs glycin, libcloudproviders,
;;;         localsearch, tinysparql (not in Guix);
;;;         A1: 4+ GNOME libraries missing; A2: version 50.1 ahead of Guix Nautilus;
;;;         A3: Nautilus in Guix is older version with different dep chain
;;;    28.  maestral -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS:
;;;         Dropbox client Python app; needs 5+ missing Python deps
;;;         (python-dropbox, python-desktop-notifier, python-pyro5, python-survey,
;;;         python-fasteners); A1: python-dropbox has own dep chain (stone, requests);
;;;         A2: python-pyro5 needs serpent serializer; A3: estimated 10+ packages to add
;;;    29.  backup-warden -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS:
;;;         backup management tool; needs 8+ missing Python deps
;;;         (python-slack-sdk, python-simpleeval, python-loguru, fabric, python-boto3,
;;;         python-botocore, python-humanfriendly);
;;;         A1: python-boto3 alone needs python-botocore + python-s3transfer (large);
;;;         A2: fabric needs python-invoke + paramiko; A3: estimated 15+ packages to add
;;;    30.  manim -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS:
;;;         math animation engine; needs 6+ missing Python deps
;;;         (python-manimpango, python-moderngl, python-mapbox-earcut, python-skia-pathops,
;;;         python-isosurfaces, python-svgelements);
;;;         A1: python-manimpango has C extension needing pango/cairo dev;
;;;         A2: python-skia-pathops wraps Skia (massive C++ library);
;;;         A3: python-moderngl needs OpenGL dev + custom build system
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            positron-ide-devel-bin
            muffon-bin
            sshpilot-bin
            godot-preview-bin
            stretchly-bin
            filen-desktop-bin
            freetube-electron-bin
            dbgate-bin
            cs-demo-manager-appimage
            reticulum-meshchat-bin
            folo-appimage
            whatsdesk-bin
            affine-bin
            jitsi-meet-electron-bin
            wayback-x11))

;;; -------------------------------------------------------------------
;;; 1. positron-ide-devel-bin --- data science IDE by Posit (binary)
;;; VS Code fork for Python/R data science; Electron app with bundled
;;; runtime.  Source build requires full VS Code/Electron toolchain.
;;; -------------------------------------------------------------------
(define-public positron-ide-devel-bin
  (package
    (name "positron-ide-devel-bin")
    (version "2026.04.0-269")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.posit.co/positron/releases/deb/x86_64/"
                    "Positron-" version "-x64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/share/positron" "share/positron/")
          ("usr/share/applications" "share/applications/")
          ("usr/share/pixmaps" "share/pixmaps/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (positron (string-append out "/share/positron/positron")))
                (mkdir-p bin)
                (symlink positron (string-append bin "/positron"))))))))
    (native-inputs (list tar))
    (home-page "https://github.com/posit-dev/positron")
    (synopsis "data science IDE for Python and R by Posit")
    (description "Positron is a next-generation data science IDE built by Posit
on the VS Code platform.  It provides an integrated environment for writing
code and exploring data in Python, R, and other languages, with built-in data
viewer, variable explorer, and plot panes.")
    (license (license:non-copyleft
              "https://www.elastic.co/licensing/elastic-license"
              "Elastic License 2.0"))))

;;; -------------------------------------------------------------------
;;; 2. muffon-bin --- music streaming browser (binary)
;;; Electron app; source build requires full npm/Electron toolchain.
;;; -------------------------------------------------------------------
(define-public muffon-bin
  (package
    (name "muffon-bin")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/staniel359/muffon/releases/download/v"
                    version "/muffon-" version "-linux-amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/muffon" "share/muffon/")
          ("usr/share/applications" "share/applications/")
          ("usr/share/icons" "share/icons/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/muffon/muffon")))
                (mkdir-p bin)
                (symlink app (string-append bin "/muffon"))))))))
    (native-inputs (list tar))
    (home-page "https://github.com/staniel359/muffon")
    (synopsis "music streaming browser for multiple sources")
    (description "Muffon is a cross-platform music streaming browser that
retrieves audio, video, and metadata from various internet sources.  It
provides a unified interface for searching and playing music from multiple
services without requiring individual accounts.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 3. sshpilot-bin --- SSH connection manager (binary)
;;; Python/GTK4 app distributed as arch-independent .deb; building from
;;; source needs full Python/GTK4 stack with many deps.
;;; -------------------------------------------------------------------
(define-public sshpilot-bin
  (package
    (name "sshpilot-bin")
    (version "4.7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mfat/sshpilot/releases/download/v"
                    version "/sshpilot_" version "-1_all.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr" ""))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (home-page "https://github.com/mfat/sshpilot")
    (synopsis "SSH connection manager with integrated terminal")
    (description "SSHPilot is an SSH connection manager with integrated
terminal, tunneling support, tabbed interface, and SCP file upload.  It
provides a graphical interface for managing SSH connections, keys, and
port forwarding configurations.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 4. godot-preview-bin --- Godot game engine preview build (binary)
;;; Single static binary; source build requires full SCons + C++ toolchain.
;;; -------------------------------------------------------------------
(define-public godot-preview-bin
  (package
    (name "godot-preview-bin")
    (version "4.7-dev4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/godotengine/godot-builds/releases/download/"
                    version "/Godot_v" version "_linux.x86_64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "Godot_v" #$version "_linux.x86_64") "bin/godot-preview"))))
    (native-inputs (list unzip))
    (home-page "https://godotengine.org")
    (synopsis "Godot game engine development preview build")
    (description "Godot is a free and open-source 2D and 3D game engine
with a fully integrated development environment.  This package provides
preview (development) builds for testing upcoming features and bug fixes
before the next stable release.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. stretchly-bin --- break time reminder (binary)
;;; Electron app; .deb binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public stretchly-bin
  (package
    (name "stretchly-bin")
    (version "1.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hovancik/stretchly/releases/download/v"
                    version "/Stretchly_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/Stretchly" "share/stretchly/")
          ("usr/share/applications" "share/applications/")
          ("usr/share/icons" "share/icons/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/stretchly/stretchly")))
                (mkdir-p bin)
                (symlink app (string-append bin "/stretchly"))))))))
    (native-inputs (list tar))
    (home-page "https://hovancik.net/stretchly")
    (synopsis "break time reminder encouraging healthy work habits")
    (description "Stretchly is a cross-platform Electron app that reminds you
to take breaks during long computer sessions.  It supports customizable micro
and full break intervals, with options for sounds, themes, and system tray
integration.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 6. filen-desktop-bin --- encrypted cloud storage client (binary)
;;; Electron AppImage; source build requires full npm/Electron toolchain.
;;; -------------------------------------------------------------------
(define-public filen-desktop-bin
  (package
    (name "filen-desktop-bin")
    (version "3.0.47")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FilenCloudDienste/filen-desktop/"
                    "releases/download/v" version
                    "/Filen_linux_x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((#$(string-append "Filen_linux_x86_64.AppImage")
           "bin/filen-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "Filen_linux_x86_64.AppImage")
              (chmod "Filen_linux_x86_64.AppImage" #o755)))
          (add-after 'install 'fix-permissions
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/filen-desktop") #o755))))))
    (home-page "https://filen.io")
    (synopsis "end-to-end encrypted cloud storage desktop client")
    (description "Filen is an end-to-end encrypted cloud storage service.  This
desktop client provides file syncing, virtual drive mounting, S3 gateway, and
WebDAV support.  All data is encrypted client-side before upload.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 7. freetube-electron-bin --- privacy-focused YouTube client (binary)
;;; Electron app; .deb binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public freetube-electron-bin
  (package
    (name "freetube-electron-bin")
    (version "0.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FreeTubeApp/FreeTube/releases/download/"
                    "v" version "-beta/freetube_" version "_beta_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/FreeTube" "share/freetube/")
          ("usr/share/applications" "share/applications/")
          ("usr/share/icons" "share/icons/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/freetube/freetube")))
                (mkdir-p bin)
                (symlink app (string-append bin "/freetube"))))))))
    (native-inputs (list tar))
    (home-page "https://freetubeapp.io")
    (synopsis "privacy-focused desktop YouTube player")
    (description "FreeTube is a privacy-focused open-source desktop YouTube
player.  It uses local subscriptions and can proxy through Invidious instances,
allowing YouTube viewing without Google tracking.  It supports importing
subscriptions, playlists, and local history storage.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 8. dbgate-bin --- cross-platform database manager (binary)
;;; Electron app; .deb binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public dbgate-bin
  (package
    (name "dbgate-bin")
    (version "7.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dbgate/dbgate/releases/download/v"
                    version "/dbgate-" version "-linux_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/dbgate" "share/dbgate/")
          ("usr/share/applications" "share/applications/")
          ("usr/share/icons" "share/icons/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/dbgate/dbgate")))
                (mkdir-p bin)
                (symlink app (string-append bin "/dbgate"))))))))
    (native-inputs (list tar))
    (home-page "https://dbgate.org")
    (synopsis "cross-platform database manager for SQL and NoSQL")
    (description "DbGate is a cross-platform database manager supporting MySQL,
PostgreSQL, SQL Server, MongoDB, SQLite, CockroachDB, and others.  It provides
a modern graphical interface for query editing, data browsing, table design,
import/export, and database comparison.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. cs-demo-manager-appimage --- CS:GO/CS2 demo analyzer (binary)
;;; Electron AppImage from GitHub.
;;; -------------------------------------------------------------------
(define-public cs-demo-manager-appimage
  (package
    (name "cs-demo-manager-appimage")
    (version "3.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/akiver/cs-demo-manager/releases/download/v"
                    version "/CS-Demo-Manager-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "CS-Demo-Manager-" #$version ".AppImage")
           "bin/cs-demo-manager"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source (string-append
                                 "CS-Demo-Manager-" #$version ".AppImage"))
              (chmod (string-append
                      "CS-Demo-Manager-" #$version ".AppImage") #o755)))
          (add-after 'install 'fix-permissions
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/cs-demo-manager") #o755))))))
    (home-page "https://cs-demo-manager.com")
    (synopsis "Counter-Strike demo file manager and analyzer")
    (description "CS Demo Manager is a companion application for managing and
analyzing Counter-Strike 2 and CS:GO demo files.  It parses match replays to
extract statistics, player performance data, and round-by-round breakdowns.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. reticulum-meshchat-bin --- mesh network chat (binary)
;;; Electron AppImage from GitHub.
;;; -------------------------------------------------------------------
(define-public reticulum-meshchat-bin
  (package
    (name "reticulum-meshchat-bin")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/liamcottle/reticulum-meshchat/"
                    "releases/download/v" version
                    "/ReticulumMeshChat-v" version "-linux.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "ReticulumMeshChat-v" #$version "-linux.AppImage")
           "bin/reticulum-meshchat"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source (string-append
                                 "ReticulumMeshChat-v" #$version "-linux.AppImage"))
              (chmod (string-append
                      "ReticulumMeshChat-v" #$version "-linux.AppImage") #o755)))
          (add-after 'install 'fix-permissions
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/reticulum-meshchat") #o755))))))
    (home-page "https://github.com/liamcottle/reticulum-meshchat")
    (synopsis "mesh network communications app using Reticulum")
    (description "Reticulum MeshChat is a communications app powered by the
Reticulum Network Stack.  It enables encrypted off-grid messaging, file
sharing, and voice communication over mesh networks using LoRa radios,
serial links, TCP, UDP, and other transport methods.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. folo-appimage --- AI-powered RSS feed reader (binary)
;;; Electron AppImage from GitHub.
;;; -------------------------------------------------------------------
(define-public folo-appimage
  (package
    (name "folo-appimage")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RSSNext/Folo/releases/download/"
                    "desktop%2Fv" version "/Folo-" version
                    "-linux-x64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "Folo-" #$version "-linux-x64.AppImage")
           "bin/folo"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source (string-append
                                 "Folo-" #$version "-linux-x64.AppImage"))
              (chmod (string-append
                      "Folo-" #$version "-linux-x64.AppImage") #o755)))
          (add-after 'install 'fix-permissions
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/folo") #o755))))))
    (home-page "https://github.com/RSSNext/Folo")
    (synopsis "AI-powered RSS feed reader and content aggregator")
    (description "Folo (formerly Follow) is a modern RSS feed reader with
AI-powered content summarization and translation.  It supports RSS, Atom,
and JSON feeds with a clean interface for organizing and reading subscriptions.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 12. whatsdesk-bin --- unofficial WhatsApp client (binary)
;;; Electron .deb binary from GitLab Pages.
;;; -------------------------------------------------------------------
(define-public whatsdesk-bin
  (package
    (name "whatsdesk-bin")
    (version "0.3.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://zerkc.gitlab.io/whatsdesk/whatsdesk_"
                    version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/whatsdesk" "share/whatsdesk/")
          ("usr/share/applications" "share/applications/")
          ("usr/share/icons" "share/icons/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/whatsdesk/whatsdesk")))
                (mkdir-p bin)
                (symlink app (string-append bin "/whatsdesk"))))))))
    (native-inputs (list tar))
    (home-page "https://gitlab.com/niclas.io/nicechat")
    (synopsis "unofficial WhatsApp desktop client")
    (description "WhatsDesk is an unofficial WhatsApp desktop client built with
Electron.  It provides WhatsApp Web functionality in a standalone desktop
application with system tray integration and notification support.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. affine-bin --- knowledge base and wiki (binary)
;;; Electron AppImage from GitHub; source build requires full
;;; npm/Electron/pnpm toolchain with monorepo workspace.
;;; -------------------------------------------------------------------
(define-public affine-bin
  (package
    (name "affine-bin")
    (version "0.26.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/toeverything/AFFiNE/releases/download/v"
                    version "/AFFiNE-" version "-stable-linux-x64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "AFFiNE-" #$version "-stable-linux-x64.AppImage")
           "bin/affine"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source (string-append
                                 "AFFiNE-" #$version "-stable-linux-x64.AppImage"))
              (chmod (string-append
                      "AFFiNE-" #$version "-stable-linux-x64.AppImage") #o755)))
          (add-after 'install 'fix-permissions
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/affine") #o755))))))
    (home-page "https://affine.pro")
    (synopsis "open-source knowledge base and collaborative wiki")
    (description "AFFiNE is an open-source alternative to Notion, combining
a wiki, knowledge base, and whiteboard with real-time collaboration.  It
supports block-based editing, Markdown, kanban boards, and offline-first
local storage with optional cloud sync.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. jitsi-meet-electron-bin --- Jitsi Meet video conferencing (binary)
;;; Electron app; .deb binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public jitsi-meet-electron-bin
  (package
    (name "jitsi-meet-electron-bin")
    (version "1.0.9139")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jitsi/jitsi-meet-electron/releases/"
                    "download/v" version "/jitsi-meet-amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/Jitsi Meet" "share/jitsi-meet/")
          ("usr/share/applications" "share/applications/")
          ("usr/share/icons" "share/icons/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/jitsi-meet/jitsi-meet")))
                (mkdir-p bin)
                (symlink app (string-append bin "/jitsi-meet"))))))))
    (native-inputs (list tar))
    (home-page "https://jitsi.org/jitsi-meet/")
    (synopsis "Jitsi Meet video conferencing desktop client")
    (description "Jitsi Meet is a free, open-source video conferencing platform.
This desktop client wraps the Jitsi Meet web application in Electron, providing
native desktop integration with screen sharing, virtual backgrounds, end-to-end
encryption, and system notifications.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 15. wayback-x11 --- experimental X11 compatibility layer (source)
;;; Small C/meson project; all deps (wlroots, wayland, xwayland) in Guix.
;;; -------------------------------------------------------------------
(define-public wayback-x11
  (package
    (name "wayback-x11")
    (version "0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/wayback/wayback")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list wlroots
                  wayland
                  wayland-protocols
                  libxkbcommon
                  xorg-server-xwayland
                  pixman
                  libdrm
                  mesa))
    (native-inputs (list pkg-config scdoc))
    (home-page "https://wayback.freedesktop.org/")
    (synopsis "experimental X11 compatibility layer using Wayland")
    (description "Wayback is an experimental X11 compatibility layer that allows
running X11 desktop environments using Wayland components.  It provides a stub
compositor in front of Xwayland, enabling X11 window managers and applications
to run on a Wayland-based display server stack.")
    (license license:expat)))
