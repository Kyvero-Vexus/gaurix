;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413y
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 25 recipes created (binary packages, mixed formats)
;;;   - 5 re-blocked with concrete attempt notes
;;;
;;; Recipes (25):
;;;   materialgram-bin, marktext-tkaixiang-bin, anytype-alpha-bin,
;;;   sideloader-bin, youtube-tui-full-bin, bluebubbles-bin,
;;;   deepchat-bin, ripes-bin, freeshow-bin, kanri-bin, loopi-bin,
;;;   alt-sendme-bin, vcard-studio-bin, firedragon-alpha-bin,
;;;   paket-bin, fchat-horizon-bin, classisland-bin, stremio-service-bin,
;;;   electron12-bin, firestorm-bin, microsoft-edge-dev-bin,
;;;   dbeaver-ce-jre-bin, alchitry-labs-bin, anycubicslicernext-bin,
;;;   local-by-flywheel-bin
;;;
;;; Blocked (5):
;;;   ttime-bin [PYTHON_DEPS_NEEDED: still missing python-playsound3]
;;;   kando-bin [ELECTRON_NOT_IN_GUIX: requires system electron37]
;;;   larksuite-bin [DYNAMIC_URL: API endpoint, not stable versioned URL]
;;;   flutter-bin [OVERSIZED_SDK: ~2GB bundle, needs dedicated pass]
;;;   obs-captions-plugin-bin [OBS_NOT_IN_GUIX: OBS Studio not packaged]
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413y)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            ;; Tarball binary packages
            materialgram-bin
            marktext-tkaixiang-bin
            firedragon-alpha-bin
            paket-bin
            fchat-horizon-bin
            bluebubbles-bin
            firestorm-bin
            dbeaver-ce-jre-bin
            alchitry-labs-bin
            ;; .deb binary packages
            anytype-alpha-bin
            freeshow-bin
            kanri-bin
            loopi-bin
            alt-sendme-bin
            vcard-studio-bin
            classisland-bin
            stremio-service-bin
            microsoft-edge-dev-bin
            anycubicslicernext-bin
            local-by-flywheel-bin
            ;; Zip binary packages
            sideloader-bin
            electron12-bin
            ;; Raw binary packages
            youtube-tui-full-bin
            ;; AppImage packages
            deepchat-bin
            ripes-bin
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; Tarball binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── materialgram-bin (#7071) ──

(define-public materialgram-bin
  (package
    (name "materialgram-bin")
    (version "6.4.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kukuruzka165/materialgram/releases/download/v"
                    version "/materialgram-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kukuruzka165/materialgram")
    (synopsis "material Design Telegram desktop client")
    (description "Materialgram is a fork of Telegram Desktop with Material
Design UI and additional features.  It provides a native desktop messaging
experience with customized visual design.")
    (license license:gpl3)))

;;; ── marktext-tkaixiang-bin (#7217) ──

(define-public marktext-tkaixiang-bin
  (package
    (name "marktext-tkaixiang-bin")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Tkaixiang/marktext/releases/download/v"
                    version "/marktext-linux-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Tkaixiang/marktext")
    (synopsis "modernized MarkText Markdown editor fork")
    (description "MarkText Tkaixiang is a modernized fork of the MarkText
simple and elegant Markdown editor.  It supports CommonMark Spec, GitHub
Flavored Markdown, and real-time preview.")
    (license license:expat)))

;;; ── firedragon-alpha-bin (#7567) ──

(define-public firedragon-alpha-bin
  (package
    (name "firedragon-alpha-bin")
    (version "13.0.0-beta.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/garuda-linux/firedragon/firedragon13/"
                    "-/releases/v" version
                    "/downloads/firedragon.linux-x64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firedragon/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/garuda-linux/firedragon")
    (synopsis "floorp-based privacy browser with Garuda Linux branding")
    (description "FireDragon is a Floorp fork Firefox-based browser with
custom Garuda Linux branding, enhanced privacy features, and performance
optimizations.  This is the alpha/beta testing channel.")
    (license license:mpl2.0)))

;;; ── paket-bin (#7190) ──

(define-public paket-bin
  (package
    (name "paket-bin")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/joseluisq/paket/releases/download/v"
                    version "/paket-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("paket" "bin/paket"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joseluisq/paket")
    (synopsis "simple and fast package manager for Fish shell")
    (description "Paket is a simple and fast package manager for the Fish
shell, written in Rust.  It provides efficient plugin and theme management
for Fish shell users.")
    (license (list license:expat license:asl2.0))))

;;; ── fchat-horizon-bin (#7256) ──

(define-public fchat-horizon-bin
  (package
    (name "fchat-horizon-bin")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Fchat-Horizon/Horizon/releases/download/v"
                    version "/F-Chat.Horizon-" version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fchat-horizon/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Fchat-Horizon/Horizon")
    (synopsis "modern community-driven F-Chat client fork")
    (description "F-Chat Horizon is a community-driven fork of the F-Chat
3.0 client with expanded customization and feature enhancements.  It
provides real-time chat with custom theming support.")
    (license license:mpl2.0)))

;;; ── bluebubbles-bin (#7530) ──

(define-public bluebubbles-bin
  (package
    (name "bluebubbles-bin")
    (version "1.15.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BlueBubblesApp/bluebubbles-app/"
                    "releases/download/v" version
                    "%2B2B76-desktop/bluebubbles-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bluebubbles/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bluebubbles.app")
    (synopsis "cross-platform iMessage client for Linux")
    (description "BlueBubbles is a cross-platform application that brings
iMessage to Android, Windows, and Linux.  It requires a Mac server to
relay messages and provides full iMessage functionality.")
    (license license:asl2.0)))

;;; ── firestorm-bin (#8393) ──

(define-public firestorm-bin
  (package
    (name "firestorm-bin")
    (version "7.2.3.80036")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.firestormviewer.org/release/linux/"
                    "Phoenix-Firestorm-Releasex64_AVX2-7-2-3-80036.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/firestorm/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.firestormviewer.org")
    (synopsis "feature-packed third-party viewer for Second Life")
    (description "Firestorm is a feature-packed third-party viewer for
Second Life and OpenSimulator virtual worlds.  It provides advanced
building tools, RLV support, and extensive customization options.")
    (license license:gpl2)))

;;; ── dbeaver-ce-jre-bin (#7438) ──

(define-public dbeaver-ce-jre-bin
  (package
    (name "dbeaver-ce-jre-bin")
    (version "26.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dbeaver/dbeaver/releases/download/"
                    version "/dbeaver-ce-" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dbeaver/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dbeaver.io")
    (synopsis "free universal database tool with bundled JRE")
    (description "DBeaver Community Edition is a free universal database tool
and SQL client supporting all popular databases: MySQL, PostgreSQL, SQLite,
Oracle, DB2, SQL Server, and more.  This version bundles a Java Runtime
Environment so no separate JRE installation is needed.")
    (license license:asl2.0)))

;;; ── alchitry-labs-bin (#7292) ──

(define-public alchitry-labs-bin
  (package
    (name "alchitry-labs-bin")
    (version "2.0.52")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alchitry/Alchitry-Labs-V2/"
                    "releases/download/" version
                    "/alchitry-labs-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/alchitry-labs/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://alchitry.com")
    (synopsis "FPGA development IDE for Alchitry boards")
    (description "Alchitry Labs is an FPGA integrated development environment
designed for Alchitry FPGA development boards.  It provides a visual editor,
constraint management, and synthesis integration for learning and prototyping
with FPGAs.")
    (license (license:non-copyleft
              "https://alchitry.com/pages/terms-of-use"
              "Proprietary Alchitry Labs license"))))

;;; ──────────────────────────────────────────────────────────────────
;;; .deb binary packages
;;; All use copy-build-system with ar+tar extraction.
;;; ──────────────────────────────────────────────────────────────────

;;; ── anytype-alpha-bin (#7389) ──

(define-public anytype-alpha-bin
  (package
    (name "anytype-alpha-bin")
    (version "0.54.30-alpha")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anyproto/anytype-ts/releases/download/v"
                    version "/anytype_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://anytype.io")
    (synopsis "local-first knowledge management and collaboration platform")
    (description "Anytype is a local-first, peer-to-peer knowledge management
tool for creating documents, tasks, and knowledge bases.  Data is stored
locally and encrypted, with optional sync across devices.")
    (license (license:non-copyleft
              "https://github.com/anyproto/anytype-ts/blob/main/LICENSE"
              "Any Source Available License 1.0"))))

;;; ── freeshow-bin (#7703) ──

(define-public freeshow-bin
  (package
    (name "freeshow-bin")
    (version "1.5.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ChurchApps/FreeShow/releases/download/v"
                    version "/freeshow-" version "-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://freeshow.app")
    (synopsis "free and open-source presentation software")
    (description "FreeShow is a free and open-source presenter application
for churches and other organizations.  It supports multimedia presentations,
scripture display, stage monitors, and remote control.")
    (license license:lgpl3+)))

;;; ── kanri-bin (#7711) ──

(define-public kanri-bin
  (package
    (name "kanri-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kanriapp/kanri/releases/download/app-v"
                    version "/kanri_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kanriapp.com")
    (synopsis "modern offline Kanban board application")
    (description "Kanri is a modern offline Kanban board application built
with Tauri.  It provides a clean interface for managing tasks and projects
using the Kanban methodology, with all data stored locally.")
    (license license:gpl3+)))

;;; ── loopi-bin (#7583) ──

(define-public loopi-bin
  (package
    (name "loopi-bin")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Dyan-Dev/loopi/releases/download/v"
                    version "/loopi_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.zst"))))))
    (native-inputs (list tar zstd))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Dyan-Dev/loopi")
    (synopsis "visual automation builder with scheduling")
    (description "Loopi is a visual automation builder with scheduling and
secure credential management.  It allows creating automated workflows
through a visual interface with support for timed execution.")
    (license license:expat)))

;;; ── alt-sendme-bin (#4663) ──

(define-public alt-sendme-bin
  (package
    (name "alt-sendme-bin")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tonyantony300/alt-sendme/releases/download/v"
                    version "/AltSendme_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tonyantony300/alt-sendme")
    (synopsis "frictionless real-time file transfer tool")
    (description "AltSendme is a frictionless, real-time file transfer tool
built with Tauri.  It provides simple peer-to-peer file sharing without
requiring account registration or cloud storage.")
    (license license:agpl3+)))

;;; ── vcard-studio-bin (#7559) ──

(define-public vcard-studio-bin
  (package
    (name "vcard-studio-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://svn.zdechov.net/vcard-studio/bin/deb/vcard-studio_"
                    version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://svn.zdechov.net/vcard-studio")
    (synopsis "contact management application for vCard files")
    (description "vCard Studio is a contact management application with
support for the vCard (.vcf) file format.  It provides editing, merging,
and organizing of contact information stored in vCard files.")
    (license license:cc0)))

;;; ── classisland-bin (#8379) ──

(define-public classisland-bin
  (package
    (name "classisland-bin")
    (version "2.0.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ClassIsland/ClassIsland/releases/download/"
                    version "/ClassIsland_app_linux_x64_selfContained_deb.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ClassIsland/ClassIsland")
    (synopsis "class schedule display tool for interactive whiteboards")
    (description "ClassIsland is a class schedule displaying tool designed
for interactive whiteboards in classrooms.  It shows timetables, class
information, and notifications in a clean display format.")
    (license license:gpl3)))

;;; ── stremio-service-bin (#4335) ──

(define-public stremio-service-bin
  (package
    (name "stremio-service-bin")
    (version "0.1.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Stremio/stremio-service/releases/download/v"
                    version "/stremio-service_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.stremio.com")
    (synopsis "companion background service for Stremio Web")
    (description "Stremio Service is a companion background service for
Stremio Web.  It provides local streaming server functionality to enable
media playback through the Stremio web interface.")
    (license license:gpl2)))

;;; ── microsoft-edge-dev-bin (#7295) ──

(define-public microsoft-edge-dev-bin
  (package
    (name "microsoft-edge-dev-bin")
    (version "148.0.3956.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://packages.microsoft.com/repos/edge/pool/main/m/"
                    "microsoft-edge-dev/microsoft-edge-dev_"
                    version "-1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/" "share/")
                              ("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.microsoft.com/edge")
    (synopsis "Microsoft Edge browser, development channel")
    (description "Microsoft Edge Dev is the development channel of the
Microsoft Edge browser for Linux.  It provides early access to upcoming
features and is based on the Chromium engine.")
    (license (license:non-copyleft
              "https://www.microsoft.com/en-us/servicesagreement/"
              "Microsoft Standard Application License"))))

;;; ── anycubicslicernext-bin (#7320) ──

(define-public anycubicslicernext-bin
  (package
    (name "anycubicslicernext-bin")
    (version "1.3.9600")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn-universe-slicer.anycubic.com/prod/dists/noble/"
                    "main/binary-amd64/"
                    "develop_AnycubicSlicerNext-1.3.96_20260131_153250"
                    "-Ubuntu_24_04_3_LTS.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.anycubic.com")
    (synopsis "open source FDM 3D printer slicer from Anycubic")
    (description "AnycubicSlicerNext is an open source slicer for FDM 3D
printers by Anycubic.  It converts 3D models into G-code instructions
for Anycubic and compatible FDM printers with optimized print profiles.")
    (license license:agpl3)))

;;; ── local-by-flywheel-bin (#7319) ──

(define-public local-by-flywheel-bin
  (package
    (name "local-by-flywheel-bin")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.localwp.com/releases-stable/"
                    version "+6907/local-" version "-linux.deb"))
              (file-name (string-append name "-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/" "share/")
                              ("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://localwp.com")
    (synopsis "local WordPress development environment")
    (description "Local (formerly Local by Flywheel) is a WordPress local
development tool.  It provides one-click WordPress site creation with
configurable PHP versions, web servers, and database engines.")
    (license (license:non-copyleft
              "https://localwp.com/legal/terms-of-service/"
              "Proprietary Local by Flywheel license"))))

;;; ──────────────────────────────────────────────────────────────────
;;; Zip binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── sideloader-bin (#7452) ──

(define-public sideloader-bin
  (package
    (name "sideloader-bin")
    (version "1.0-pre4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Dadoum/Sideloader/releases/download/"
                    version "/sideloader-gtk-x86_64-linux-gnu.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sideloader-gtk" "bin/sideloader-gtk"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/sideloader-gtk")
                          #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Dadoum/Sideloader")
    (synopsis "open-source cross-platform iOS app sideloader")
    (description "Sideloader is an open-source cross-platform tool for
sideloading applications onto iOS devices.  It provides both a GTK GUI
and a command-line interface for installing IPA files.")
    (license (license:non-copyleft
              "https://github.com/Dadoum/Sideloader/blob/main/LICENSE"
              "Server Side Public License 1.0"))))

;;; ── electron12-bin (#4513) ──

(define-public electron12-bin
  (package
    (name "electron12-bin")
    (version "12.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/electron/electron/releases/download/v"
                    version "/electron-v" version "-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/electron12/"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.electronjs.org")
    (synopsis "electron v12 runtime for cross-platform desktop apps")
    (description "Electron 12 is a framework for building cross-platform
desktop applications using JavaScript, HTML, and CSS.  This is a legacy
version provided for applications that require Electron 12 specifically.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Raw binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── youtube-tui-full-bin (#7483) ──

(define-public youtube-tui-full-bin
  (package
    (name "youtube-tui-full-bin")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Siriusmart/youtube-tui/releases/download/v"
                    version "/youtube-tui-full_arch-x86_64"))
              (file-name (string-append name "-" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "youtube-tui-full-bin-" #$version)
                "bin/youtube-tui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/youtube-tui")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Siriusmart/youtube-tui")
    (synopsis "aesthetically pleasing TUI frontend for YouTube")
    (description "YouTube TUI is an aesthetically pleasing terminal user
interface for browsing YouTube.  It provides video search, playback
integration, and channel browsing from the terminal.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; AppImage packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── deepchat-bin (#7546) ──

(define-public deepchat-bin
  (package
    (name "deepchat-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ThinkInAIXYZ/deepchat/releases/download/v"
                    version "/DeepChat-" version
                    "-linux-x86_64.AppImage"))
              (file-name (string-append name "-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "deepchat-bin-" #$version ".AppImage")
                "bin/deepchat"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/deepchat")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ThinkInAIXYZ/deepchat")
    (synopsis "smart AI assistant for personal productivity")
    (description "DeepChat is a smart AI assistant that connects powerful AI
models to your personal world.  It provides a desktop interface for
interacting with various AI providers for chat, coding, and analysis.")
    (license license:asl2.0)))

;;; ── ripes-bin (#7675) ──

(define-public ripes-bin
  (package
    (name "ripes-bin")
    (version "2.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mortbopet/Ripes/releases/download/v"
                    version "/Ripes-v" version
                    "-linux-x86_64.AppImage"))
              (file-name (string-append name "-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "ripes-bin-" #$version ".AppImage")
                "bin/ripes"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ripes")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mortbopet/Ripes")
    (synopsis "graphical RISC-V processor simulator and assembly editor")
    (description "Ripes is a graphical processor simulator and assembly
editor for the RISC-V instruction set architecture.  It provides
visualization of pipeline stages, cache simulation, and step-by-step
execution for educational purposes.")
    (license license:expat)))
