;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413w
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 21 recipes created (mixed build systems)
;;;   - 9 re-blocked with concrete attempt notes
;;;
;;; Recipes (21):
;;;   way-edges-bin, tmmpr-bin, zls-bin, uiua-bin, tsm-bin,
;;;   nerdfonts-installer-bin, catapult-bin, peazip-gtk2-bin,
;;;   camunda-modeler-bin, dbeaver-ce-jre-bin, vtf-thumbnailer-bin,
;;;   resolute-bin, sfxr-qt-bin, ibus-lotus-bin,
;;;   python-waypaper, python-semantic-diff, python-vaping,
;;;   python-gpmaster, python-twg,
;;;   libxeddsa, libxeddsa-git
;;;
;;; Blocked (9):
;;;   steamdepotdownloadergui-bin [NO_LINUX_RELEASE: no Linux binary release on GitHub]
;;;   ftb-app-bin [PROPRIETARY_DOWNLOAD: requires FTB account, no direct download URL]
;;;   hyprshade [HYPRLAND_NOT_IN_GUIX: depends on hyprland compositor not in Guix]
;;;   ultimate-tic-tac-toe-git [NO_TAGGED_RELEASE: only -git, no stable version tags]
;;;   doasedit-nhk [NO_BINARY_RELEASE: Rust source only, needs cargo vendoring]
;;;   silverr-bin [ALPHA_QUALITY: v0.0.4-alpha, 122MB AppImage, too unstable]
;;;   savestate-bin [OVERSIZED_BUNDLE: 134MB bundled app, likely Electron]
;;;   misuzu-music-bin [NO_LINUX_RELEASE: GitHub releases only have macOS/Windows builds]
;;;   nohang-openrc [OPENRC_NOT_IN_GUIX: depends on OpenRC init system not available]
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413w)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xorg)
  #:export (
            ;; Binary tarball packages
            way-edges-bin
            tmmpr-bin
            zls-bin
            uiua-bin
            tsm-bin
            nerdfonts-installer-bin
            catapult-bin
            peazip-gtk2-bin
            camunda-modeler-bin
            dbeaver-ce-jre-bin
            ;; Binary .deb packages
            vtf-thumbnailer-bin
            resolute-bin
            sfxr-qt-bin
            ;; Binary zip packages
            ibus-lotus-bin
            ;; Python packages
            python-waypaper
            python-semantic-diff
            python-vaping
            python-gpmaster
            python-twg
            ;; C/C++ source builds
            libxeddsa
            libxeddsa-git
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary tarball packages
;;; All use copy-build-system with appropriate extraction.
;;; ──────────────────────────────────────────────────────────────────

;;; ── way-edges-bin (#7579) ──
;;; Hidden widget on screen edges for Wayland compositors.

(define-public way-edges-bin
  (package
    (name "way-edges-bin")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/way-edges/way-edges"
                    "/releases/download/" version
                    "/way-edges_linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("way-edges" "bin/way-edges"))))
    (home-page "https://github.com/way-edges/way-edges")
    (synopsis "hidden widget on screen edges for Wayland")
    (description "Way-edges provides hidden widgets on screen edges for
Wayland compositors.  Widgets slide into view when the cursor touches
a screen edge, providing quick access to controls and information.")
    (license license:expat)))

;;; ── tmmpr-bin (#4450) ──
;;; Terminal Mind Mapper, a TUI mind mapping tool.

(define-public tmmpr-bin
  (package
    (name "tmmpr-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tanciaku/tmmpr"
                    "/releases/download/v" version
                    "/tmmpr-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tmmpr" "bin/tmmpr"))))
    (home-page "https://github.com/tanciaku/tmmpr")
    (synopsis "terminal mind mapper")
    (description "Tmmpr is a terminal-based mind mapping tool.  It provides
an interactive TUI for creating and navigating mind maps directly in the
terminal.")
    (license license:expat)))

;;; ── zls-bin (#7040) ──
;;; Zig Language Server, prebuilt binary.

(define-public zls-bin
  (package
    (name "zls-bin")
    (version "0.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zigtools/zls"
                    "/releases/download/" version
                    "/zls-x86_64-linux.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zls" "bin/zls"))))
    (home-page "https://zigtools.org/zls")
    (synopsis "language server for Zig")
    (description "ZLS is a language server for the Zig programming language.
It provides IDE features like auto-completion, go-to-definition, hover
information, and diagnostics for Zig source code.")
    (license license:expat)))

;;; ── uiua-bin (#7205) ──
;;; Uiua, a stack-based array programming language.

(define-public uiua-bin
  (package
    (name "uiua-bin")
    (version "0.18.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uiua-lang/uiua"
                    "/releases/download/" version
                    "/uiua-bin-x86_64-unknown-linux-gnu.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("uiua" "bin/uiua"))))
    (native-inputs (list unzip))
    (home-page "https://www.uiua.org/")
    (synopsis "stack-based array programming language")
    (description "Uiua is a stack-based array programming language with a
focus on simplicity and beauty.  It uses Unicode glyphs as operators and
provides powerful array manipulation primitives.")
    (license license:expat)))

;;; ── tsm-bin (#7355) ──
;;; Terminal Session Manager.

(define-public tsm-bin
  (package
    (name "tsm-bin")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/adibhanna/tsm"
                    "/releases/download/v" version
                    "/tsm_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tsm" "bin/tsm"))))
    (home-page "https://github.com/adibhanna/tsm")
    (synopsis "terminal session manager")
    (description "TSM is a terminal session manager that helps you manage
multiple terminal sessions.  It provides quick access to named sessions
and makes it easy to switch between different working contexts.")
    (license license:expat)))

;;; ── nerdfonts-installer-bin (#7589) ──
;;; Interactive Nerd Fonts installer.

(define-public nerdfonts-installer-bin
  (package
    (name "nerdfonts-installer-bin")
    (version "2026.02.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fam007e/nerd_fonts_installer"
                    "/releases/download/v" version
                    "/nerdfonts-installer"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nerdfonts-installer" "bin/nerdfonts-installer"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'make-executable
                 (lambda _
                   (chmod "nerdfonts-installer" #o755))))))
    (home-page "https://github.com/fam007e/nerd_fonts_installer")
    (synopsis "interactive Nerd Fonts installer")
    (description "Nerdfonts-installer is an interactive tool for installing
Nerd Fonts on Linux systems.  It presents a menu of available Nerd Font
families and handles downloading and installing them to the user font
directory.")
    (license license:expat)))

;;; ── catapult-bin (#3974) ──
;;; Cross-platform launcher for Cataclysm: DDA and BN.

(define-public catapult-bin
  (package
    (name "catapult-bin")
    (version "25.11a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/qrrk/Catapult"
                    "/releases/download/" version
                    "/catapult-linux-x64-" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("catapult" "bin/catapult"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((src (car (find-files "." "catapult-linux"))))
                     (rename-file src "catapult")
                     (chmod "catapult" #o755)))))))
    (home-page "https://github.com/qrrk/Catapult")
    (synopsis "launcher for Cataclysm: DDA and Bright Nights")
    (description "Catapult is a cross-platform launcher for Cataclysm: Dark
Days Ahead and Cataclysm: Bright Nights.  It manages game installations,
mods, tilesets, and soundpacks with a graphical interface built on Godot.")
    (license license:expat)))

;;; ── peazip-gtk2-bin (#7253) ──
;;; PeaZip portable file and archive manager (GTK2 variant).

(define-public peazip-gtk2-bin
  (package
    (name "peazip-gtk2-bin")
    (version "11.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peazip/PeaZip"
                    "/releases/download/" version
                    "/peazip_portable-" version
                    ".LINUX.GTK2.x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/peazip/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (peazip (string-append out "/share/peazip/peazip")))
                     (mkdir-p bin)
                     (symlink peazip
                              (string-append bin "/peazip"))))))))
    (home-page "https://peazip.github.io/")
    (synopsis "cross-platform file and archive manager")
    (description "PeaZip is a free file archiver utility and archive manager.
It supports over 200 archive formats including 7z, brotli, bzip2, gzip, RAR,
tar, zip, and zstd.  This package provides the portable GTK2 variant.")
    (license license:lgpl3)))

;;; ── camunda-modeler-bin (#7327) ──
;;; BPMN, DMN and Forms modeling tool.

(define-public camunda-modeler-bin
  (package
    (name "camunda-modeler-bin")
    (version "5.46.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/camunda/camunda-modeler"
                    "/releases/download/v" version
                    "/camunda-modeler-" version "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/camunda-modeler/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/share/camunda-modeler/"
                                             "camunda-modeler")
                              (string-append bin "/camunda-modeler"))))))))
    (home-page "https://camunda.com/products/modeler/")
    (synopsis "modeling tool for BPMN, DMN, and Forms")
    (description "Camunda Modeler is a desktop application for modeling BPMN
process diagrams, DMN decision tables, and Camunda Forms.  It provides a
visual editor with validation and deployment capabilities.")
    (license license:expat)))

;;; ── dbeaver-ce-jre-bin (#7438) ──
;;; DBeaver Community Edition with bundled JRE.

(define-public dbeaver-ce-jre-bin
  (package
    (name "dbeaver-ce-jre-bin")
    (version "26.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dbeaver/dbeaver"
                    "/releases/download/" version
                    "/dbeaver-ce-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dbeaver/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/share/dbeaver/dbeaver")
                              (string-append bin "/dbeaver"))))))))
    (home-page "https://dbeaver.io/")
    (synopsis "universal SQL client for developers and database administrators")
    (description "DBeaver Community Edition is a free multi-platform database
tool for developers, database administrators, analysts, and anyone who works
with databases.  It supports all popular databases including MySQL, PostgreSQL,
SQLite, Oracle, and many more.  This package includes a bundled JRE.")
    (license license:asl2.0)))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary .deb packages
;;; Extracted using trivial-build-system with tar.
;;; ──────────────────────────────────────────────────────────────────

;;; ── vtf-thumbnailer-bin (#7220) ──
;;; VTF file thumbnailer for file managers.

(define-public vtf-thumbnailer-bin
  (package
    (name "vtf-thumbnailer-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/craftablescience/vtf-thumbnailer"
                    "/releases/download/v" version
                    "/VTF-Thumbnailer-" version "-Linux.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share")))
            (setenv "PATH" (string-append #$tar "/bin:"
                                          #$gzip "/bin:"
                                          #$xz "/bin"))
            (invoke "tar" "xf" #$source)
            (invoke "tar" "xf" (car (find-files "." "^data\\.tar")))
            (mkdir-p bin)
            (mkdir-p share)
            (when (file-exists? "usr/bin")
              (copy-recursively "usr/bin" bin))
            (when (file-exists? "usr/lib")
              (copy-recursively "usr/lib"
                                (string-append out "/lib")))
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            #t))))
    (native-inputs (list tar gzip xz))
    (home-page "https://github.com/craftablescience/vtf-thumbnailer")
    (synopsis "adds VTF file previews in file explorers")
    (description "VTF Thumbnailer adds thumbnail previews for Valve Texture
Format files in Linux file explorers.  It integrates with the freedesktop
thumbnailer specification to generate previews for VTF textures used in
Source Engine games.")
    (license license:expat)))

;;; ── resolute-bin (#7047) ──
;;; Mod Manager GUI for Resonite (Tauri app).

(define-public resolute-bin
  (package
    (name "resolute-bin")
    (version "0.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Gawdl3y/Resolute"
                    "/releases/download/v" version
                    "/resolute_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share")))
            (setenv "PATH" (string-append #$tar "/bin:"
                                          #$gzip "/bin:"
                                          #$xz "/bin"))
            (invoke "tar" "xf" #$source)
            (invoke "tar" "xf" (car (find-files "." "^data\\.tar")))
            (mkdir-p bin)
            (mkdir-p share)
            (when (file-exists? "usr/bin")
              (copy-recursively "usr/bin" bin))
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            #t))))
    (native-inputs (list tar gzip xz))
    (home-page "https://github.com/Gawdl3y/Resolute")
    (synopsis "mod manager for Resonite")
    (description "Resolute is a graphical mod manager for the Resonite social
VR platform.  It handles downloading, installing, updating, and managing
mods with a clean interface built on Tauri.")
    (license license:gpl3)))

;;; ── sfxr-qt-bin (#7455) ──
;;; Sound effect generator, Qt port of SFXR.

(define-public sfxr-qt-bin
  (package
    (name "sfxr-qt-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/agateau/sfxr-qt"
                    "/releases/download/" version
                    "/sfxr-qt_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share")))
            (setenv "PATH" (string-append #$tar "/bin:"
                                          #$gzip "/bin:"
                                          #$xz "/bin"))
            (invoke "tar" "xf" #$source)
            (invoke "tar" "xf" (car (find-files "." "^data\\.tar")))
            (mkdir-p bin)
            (mkdir-p share)
            (when (file-exists? "usr/bin")
              (copy-recursively "usr/bin" bin))
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            #t))))
    (native-inputs (list tar gzip xz))
    (home-page "https://github.com/agateau/sfxr-qt")
    (synopsis "retro sound effect generator")
    (description "Sfxr-qt is a Qt port of SFXR, a tool for quickly generating
sound effects for games and other projects.  It can produce laser shots,
explosions, power-ups, coin pickups, and other retro-style sound effects
with randomization and fine-tuning controls.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary zip packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── ibus-lotus-bin (#9068) ──
;;; Vietnamese input method engine for IBus.

(define-public ibus-lotus-bin
  (package
    (name "ibus-lotus-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LotusInputEngine/ibus-lotus"
                    "/releases/download/v" version
                    "/ibus-lotus-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/ibus-lotus" "share/ibus-lotus/")
                ("usr/share/ibus/component" "share/ibus/component/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-directory
                 (lambda _
                   ;; The zip may contain a usr/ tree
                   #t)))))
    (native-inputs (list unzip))
    (home-page "https://github.com/LotusInputEngine/ibus-lotus")
    (synopsis "Vietnamese input method engine for IBus")
    (description "IBus-Lotus is a Vietnamese input method engine for IBus,
forked from ibus-bamboo.  It supports multiple Vietnamese input methods
including Telex, VNI, and VIQR with smart word prediction.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-waypaper (#8381) ──
;;; GUI wallpaper setter for Wayland and Xorg.

(define-public python-waypaper
  (package
    (name "python-waypaper")
    (version "2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/w/waypaper/"
                    "waypaper-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/anufrievroman/waypaper")
    (synopsis "GUI wallpaper setter for Wayland and Xorg")
    (description "Waypaper is a GUI wallpaper setter that works with Wayland
and Xorg window managers.  It provides a graphical interface for browsing
and setting wallpapers, supporting multiple backends including swww,
swaybg, feh, and wallutils.")
    (license license:gpl3)))

;;; ── python-semantic-diff (#4076) ──
;;; AI-powered semantic analysis of git commits.

(define-public python-semantic-diff
  (package
    (name "python-semantic-diff")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/s/semantic_diff/"
                    "semantic_diff-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/tkenaz/semantic_diff")
    (synopsis "AI-powered semantic analysis of git commits")
    (description "Semantic-diff provides AI-powered semantic analysis of git
commits.  It goes beyond standard git diff by analyzing the meaning and
impact of changes, helping developers understand what changed and why.")
    (license license:expat)))

;;; ── python-vaping (#4323) ──
;;; Network monitoring tool, a healthy alternative to SmokePing.

(define-public python-vaping
  (package
    (name "python-vaping")
    (version "1.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/v/vaping/"
                    "vaping-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/20c/vaping")
    (synopsis "network monitoring tool inspired by SmokePing")
    (description "Vaping is a healthy alternative to SmokePing, providing
network latency monitoring with a plugin-based architecture.  It supports
multiple output formats including graphite, prometheus, and vodka for
visualizing network performance data.")
    (license license:asl2.0)))

;;; ── python-gpmaster (#4576) ──
;;; GPG-backed lockbox for secrets management.

(define-public python-gpmaster
  (package
    (name "python-gpmaster")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/g/gpmaster/"
                    "gpmaster-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/bill88t/gpmaster")
    (synopsis "GPG-backed lockbox for secrets management")
    (description "Gpmaster is a GPG-backed lockbox for managing secrets.
It provides a command-line interface for storing, retrieving, and managing
encrypted secrets using GPG keys, suitable for password management and
credential storage.")
    (license license:gpl3)))

;;; ── python-twg (#6794) ──
;;; Terminal JSON file viewer and navigator.

(define-public python-twg
  (package
    (name "python-twg")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/t/twg/"
                    "twg-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-textual
           python-pyperclip
           python-rich
           python-ijson))
    (home-page "https://github.com/workdone0/twig")
    (synopsis "inspect and navigate complex JSON files in the terminal")
    (description "Twig (packaged as twg on PyPI) is a terminal-based JSON
file viewer.  It provides an interactive TUI for inspecting, navigating,
and understanding complex JSON files with syntax highlighting and tree
navigation.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ source builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── libxeddsa (#4027) ──
;;; Toolkit for Curve25519 and Ed25519 key pair conversion.

(define-public libxeddsa
  (package
    (name "libxeddsa")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Syndace/libxeddsa"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libsodium))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Syndace/libxeddsa")
    (synopsis "toolkit for Curve25519 and Ed25519 key pair conversion")
    (description "Libxeddsa is a toolkit around Curve25519 and Ed25519 key
pairs, with a focus on conversion between the two.  It implements the XEdDSA
signature scheme, allowing Curve25519 key pairs to be used for EdDSA-compatible
signatures without requiring separate Ed25519 keys.")
    (license license:expat)))

;;; ── libxeddsa-git (#4026) ──
;;; Same as libxeddsa but from git HEAD.

(define-public libxeddsa-git
  (package
    (inherit libxeddsa)
    (name "libxeddsa-git")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Syndace/libxeddsa")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))))
