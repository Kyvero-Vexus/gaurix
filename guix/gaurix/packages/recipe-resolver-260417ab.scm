;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ab
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (14):
;;;    1. zoraxy-bin (copy/binary, v3.3.2, AGPL-3.0)
;;;    2. argus-bin (copy/binary, v0.29.4, MIT)
;;;    3. buildozer-bin (copy/binary, v8.5.1, Apache-2.0)
;;;    4. porla-bin (copy/binary, v0.41.0, AGPL-3.0)
;;;    5. watchman-bin (copy/binary, v2026.04.13.00, MIT)
;;;    6. kotlin-lsp-bin (copy/binary, v1.3.13, MIT)
;;;    7. redot-bin (copy/binary, v26.1-stable, MIT)
;;;    8. xpipe-bin (copy/binary, v22.9, Apache-2.0)
;;;    9. zulu21-fx-bin (copy/binary, v21.0.10, GPL-2.0 w/CPE)
;;;   10. zulu-17-fx-bin (copy/binary, v17.0.18, GPL-2.0 w/CPE)
;;;   11. webots-bin (copy/binary, R2025a, Apache-2.0)
;;;   12. man-pages-ja (copy, v20250315, custom-permissive)
;;;   13. choco-fontviewer (meson, v1.2.0, GPL-3.0)
;;;   14. noto-fonts-cjk-chws (copy/font, Sans2.004, OFL-1.1)
;;;
;;; Blocked (16):
;;;   15. pacwall-git — EXHAUSTED: ARCH_SPECIFIC (pacman-only)
;;;   16. asp — EXHAUSTED: ARCH_SPECIFIC (deprecated Arch tool)
;;;   17. dude-bin — EXHAUSTED: ARCH_SPECIFIC (requires libalpm/pacman)
;;;   18. arch-shell — EXHAUSTED: ARCH_SPECIFIC (requires devtools/pacman)
;;;   19. godot-double-mono — EXHAUSTED: DOTNET_UNSUPPORTED (needs Mono/.NET SDK)
;;;   20. mt76-dkms-git — EXHAUSTED: DKMS_UNSUPPORTED (kernel module)
;;;   21. gdrcopy — EXHAUSTED: CUDA_KERNEL_MODULE (NVIDIA kernel mod)
;;;   22. iriunwebcam-bin — EXHAUSTED: KERNEL_MODULE (v4l2loopback)
;;;   23. openutau-bin — EXHAUSTED: DOTNET_UNSUPPORTED (.NET runtime)
;;;   24. unofficial-homestuck-collection-bin — EXHAUSTED: ELECTRON_MASSIVE (2GB+)
;;;   25. cryptpad — EXHAUSTED: NPM_COMPLEX (deep npm deps)
;;;   26. amass — EXHAUSTED: GO_DEPS_MASSIVE (50+ Go modules)
;;;   27. termusic-git — EXHAUSTED: CARGO_DEPS (30+ Rust crates)
;;;   28. odoo18-nightly — EXHAUSTED: MASSIVE_SCALE (500+ Python deps)
;;;   29. python-jupyterlab-variableinspector — EXHAUSTED: NPM_PYTHON_HYBRID
;;;   30. basedpyright-bin — EXHAUSTED: NPM_RUNTIME (Node.js dep tree)
;;;
;;; 14 recipes + 16 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417ab)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bootstrap)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages json)
  #:use-module (gnu packages man)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:export (
            zoraxy-bin
            argus-bin
            buildozer-bin
            porla-bin
            watchman-bin
            kotlin-lsp-bin
            redot-bin
            xpipe-bin
            zulu21-fx-bin
            zulu-17-fx-bin
            webots-bin
            man-pages-ja
            choco-fontviewer
            noto-fonts-cjk-chws
            ))

;;; ===================================================================
;;; SINGLE-BINARY PACKAGES (Go/Rust static binaries)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. zoraxy-bin — general purpose HTTP reverse proxy (Go binary)
;;; -------------------------------------------------------------------
(define-public zoraxy-bin
  (package
    (name "zoraxy-bin")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tobychui/zoraxy/releases/download/v"
                    version "/zoraxy_linux_amd64"))
              (sha256
               (base32
                "0vqdr70hn3xz781nq5ml3i2licvy78xlj6n5an72v32876abzahz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zoraxy_linux_amd64" "bin/zoraxy"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/zoraxy")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "general purpose HTTP reverse proxy and forwarding tool")
    (description "Zoraxy is a general purpose HTTP reverse proxy and
forwarding tool written in Go.  It provides a web-based management
interface for configuring virtual hosts, TLS certificates, access
control, and load balancing.")
    (home-page "https://github.com/tobychui/zoraxy")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 2. argus-bin — release monitor with webhook notifications (Go binary)
;;; -------------------------------------------------------------------
(define-public argus-bin
  (package
    (name "argus-bin")
    (version "0.29.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/release-argus/Argus/releases/download/"
                    version "/Argus-" version ".linux-amd64"))
              (sha256
               (base32
                "1gxxwq03mjb75vb6baglxgbxb7qzxk49gmh0zcnv6h8p1msas9rm"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "Argus-" #$version ".linux-amd64")
                "bin/argus"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/argus")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "monitor software releases and notify via webhooks")
    (description "Argus is a lightweight monitor that watches for new software
releases and sends notifications via Gotify, Slack, or other messaging
services and webhooks.  It supports GitHub releases, web page scraping,
and Docker Hub image tracking.")
    (home-page "https://github.com/release-argus/Argus")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. buildozer-bin — Bazel BUILD file rewriter (Go binary)
;;; -------------------------------------------------------------------
(define-public buildozer-bin
  (package
    (name "buildozer-bin")
    (version "8.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bazelbuild/buildtools/releases/download/v"
                    version "/buildozer-linux-amd64"))
              (sha256
               (base32
                "1x92anlhagacsvx207aw20kclibbmx8aqngvfcbf1wa1mni5qx1b"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("buildozer-linux-amd64" "bin/buildozer"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/buildozer")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line tool to rewrite Bazel BUILD files")
    (description "Buildozer is a command line tool to rewrite multiple Bazel
BUILD files using standard commands.  It can add, remove, or modify rules,
attributes, and dependencies across an entire Bazel project.")
    (home-page "https://github.com/bazelbuild/buildtools")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. porla-bin — high-performance BitTorrent client (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public porla-bin
  (package
    (name "porla-bin")
    (version "0.41.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/porla/porla/releases/download/v"
                    version "/porla-linux-amd64"))
              (sha256
               (base32
                "1a5yf66jakwr9nwz8xyvhmab5f2b2242nd6a2i8a3ypa97z3grh0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("porla-linux-amd64" "bin/porla"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/porla")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance BitTorrent client for seedboxes and servers")
    (description "Porla is a high-performance BitTorrent client designed for
seedboxes and servers.  It features a web UI, Lua scripting for automation,
and is built on libtorrent-rasterbar for efficient torrent handling.")
    (home-page "https://github.com/porla/porla")
    (license license:agpl3)))

;;; ===================================================================
;;; ZIP/TARBALL BINARY PACKAGES (need extraction)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 5. watchman-bin — Facebook file watching service (prebuilt)
;;; -------------------------------------------------------------------
(define-public watchman-bin
  (package
    (name "watchman-bin")
    (version "2026.04.13.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/facebook/watchman/releases/download/v"
                    version "/watchman-v" version "-linux.zip"))
              (sha256
               (base32
                "1pbls0sgmbw25hrjpf04ck75ybg0jlr78zr98ms7i5rr6g1619r4"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (string-prefix? "watchman-" f)))))
                     (when (pair? dirs)
                       (chdir (car dirs)))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "file watching service that triggers actions on file changes")
    (description "Watchman is a file watching service developed by Meta that
watches files and records or triggers actions when they change.  It can
recursively watch directory trees and provides a query language for matching
files by name, type, or content.")
    (home-page "https://github.com/facebook/watchman")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. kotlin-lsp-bin — Kotlin language server (JVM, prebuilt)
;;; -------------------------------------------------------------------
(define-public kotlin-lsp-bin
  (package
    (name "kotlin-lsp-bin")
    (version "1.3.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fwcd/kotlin-language-server"
                    "/releases/download/" version "/server.zip"))
              (sha256
               (base32
                "1lmnv6r4x8mhk28bh9bwrn244slcknyp2q83d5w7qc3v10fxgrsg"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("server/bin/" "bin/")
               ("server/lib/" "lib/kotlin-language-server/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "smart code completion and diagnostics for Kotlin via LSP")
    (description "Kotlin Language Server provides smart code completion,
diagnostics, hover information, go-to-definition, and other IDE features
for Kotlin using the Language Server Protocol.  It integrates with any
LSP-capable editor.")
    (home-page "https://github.com/fwcd/kotlin-language-server")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. redot-bin — Redot game engine (Godot fork, prebuilt)
;;; -------------------------------------------------------------------
(define-public redot-bin
  (package
    (name "redot-bin")
    (version "26.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Redot-Engine/redot-engine"
                    "/releases/download/redot-" version "-stable"
                    "/Redot_v" version "-stable_linux_x64.zip"))
              (sha256
               (base32
                "1h7w9fag0fb1qzykdf94f21lf88gk0ffbnny3dbqlx5w4s3vkdqr"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~`((,(string-append "Redot_v" #$version "-stable_linux.x86_64")
                "bin/redot"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/redot")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform 2D and 3D game engine (Godot fork)")
    (description "Redot Engine is a community-driven fork of the Godot game
engine.  It provides a complete set of tools for 2D and 3D game development
including a visual editor, scripting with GDScript, and export to multiple
platforms.")
    (home-page "https://github.com/Redot-Engine/redot-engine")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. xpipe-bin — server infrastructure management hub (prebuilt)
;;; -------------------------------------------------------------------
(define-public xpipe-bin
  (package
    (name "xpipe-bin")
    (version "22.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xpipe-io/xpipe/releases/download/"
                    version "/xpipe-portable-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "1ij6r8fgbgmyhajy2n2jbp0qd373jh3akpgcmx895lpyrld4bp70"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/xpipe/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/lib/xpipe/bin/xpiped")
                              (string-append out "/bin/xpipe"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "server infrastructure management from your desktop")
    (description "XPipe is a connection hub for your remote servers.  It
provides a desktop application to manage SSH connections, Docker containers,
Kubernetes clusters, and other infrastructure from a unified interface
with shell integration and file browsing.")
    (home-page "https://github.com/xpipe-io/xpipe")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. zulu21-fx-bin — Azul Zulu JDK 21 with JavaFX (prebuilt)
;;; -------------------------------------------------------------------
(define-public zulu21-fx-bin
  (package
    (name "zulu21-fx-bin")
    (version "21.0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.azul.com/zulu/bin/"
                    "zulu21.48.17-ca-fx-jdk" version
                    "-linux_x64.tar.gz"))
              (sha256
               (base32
                "0cqraq0vj4f35xnjdl6dynwjkk65b0f7z3fpmbqgk6ifjx6h6rgc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "zulu21.48.17-ca-fx-jdk" #$version
                                "-linux_x64/.")
                "."))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Azul Zulu build of OpenJDK 21 with JavaFX bundled")
    (description "Azul Zulu Builds of OpenJDK with JavaFX are open source,
TCK-tested and certified builds of OpenJDK.  This package provides JDK 21
with JavaFX modules included for building GUI applications.")
    (home-page "https://www.azul.com/downloads/")
    (license license:gpl2)))   ; GPL-2.0 with Classpath Exception

;;; -------------------------------------------------------------------
;;; 10. zulu-17-fx-bin — Azul Zulu JDK 17 with JavaFX (prebuilt)
;;; -------------------------------------------------------------------
(define-public zulu-17-fx-bin
  (package
    (name "zulu-17-fx-bin")
    (version "17.0.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.azul.com/zulu/bin/"
                    "zulu17.64.17-ca-fx-jdk" version
                    "-linux_x64.tar.gz"))
              (sha256
               (base32
                "1cain1wv3ymdx60qypdaqy6p4jqa37rjqzvjyqfgm2mdhb4823cd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "zulu17.64.17-ca-fx-jdk" #$version
                                "-linux_x64/.")
                "."))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Azul Zulu build of OpenJDK 17 with JavaFX bundled")
    (description "Azul Zulu Builds of OpenJDK with JavaFX are open source,
TCK-tested and certified builds of OpenJDK.  This package provides JDK 17
LTS with JavaFX modules included for building GUI applications.")
    (home-page "https://www.azul.com/downloads/")
    (license license:gpl2)))   ; GPL-2.0 with Classpath Exception

;;; -------------------------------------------------------------------
;;; 11. webots-bin — Cyberbotics robotics simulator (prebuilt)
;;; -------------------------------------------------------------------
(define-public webots-bin
  (package
    (name "webots-bin")
    (version "R2025a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cyberbotics/webots/releases/download/"
                    version "/webots-" version "-x86-64.tar.bz2"))
              (sha256
               (base32
                "0f4cyckg4fg1jn2y16kdjb40nrwbvbrvgw93anpaamvc42s7y4n5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("webots/." "lib/webots/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/lib/webots/webots")
                              (string-append out "/bin/webots"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source robot simulator for education and research")
    (description "Webots is an open-source robot simulator developed by
Cyberbotics.  It provides a complete development environment for modeling,
programming, and simulating robots including wheeled robots, legged robots,
flying robots, and industrial robots.")
    (home-page "https://cyberbotics.com/")
    (license license:asl2.0)))

;;; ===================================================================
;;; DATA/DOCUMENTATION PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 12. man-pages-ja — Japanese translation of Linux man pages
;;; -------------------------------------------------------------------
(define-public man-pages-ja
  (package
    (name "man-pages-ja")
    (version "20250315")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://linuxjm.osdn.jp/man-pages-ja-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0b0vzdajy8ifqrzhvvlh0pr3j5d8hvc4dzhhvrbyanjz43zk21g6"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (for-each
                      (lambda (section)
                        (let ((src (string-append "manual/man" section))
                              (dst (string-append out "/share/man/ja/man"
                                                  section)))
                          (when (file-exists? src)
                            (mkdir-p dst)
                            (for-each
                             (lambda (f)
                               (let ((src-f (string-append src "/" f)))
                                 (when (not (eq? 'directory
                                                 (stat:type (stat src-f))))
                                   (copy-file src-f
                                              (string-append dst "/" f)))))
                             (scandir src
                               (lambda (f) (not (member f '("." "..")))))))))
                      '("1" "2" "3" "4" "5" "6" "7" "8"))))))
           #:install-plan #~'()))
    (synopsis "japanese translation of Linux manual pages")
    (description "Man-pages-ja provides Japanese translations of the Linux
manual pages.  It covers sections 1 through 8, including user commands,
system calls, library functions, device files, file formats, games,
conventions, and system administration commands.")
    (home-page "https://linuxjm.osdn.jp/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 13. choco-fontviewer — GTK3 font viewer with Google Fonts support
;;; -------------------------------------------------------------------
(define-public choco-fontviewer
  (package
    (name "choco-fontviewer")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/chocolateimage/fontviewer"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "142w1jps7hp9kyn4pv4rz748r7rgdhgm0dw4karvxw9gk046f5gs"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list fontconfig
                  gtkmm-3
                  cairomm-1.14
                  freetype
                  json-glib
                  curl))
    (synopsis "font viewer and installer with Google Fonts integration")
    (description "Choco Font Viewer is a GTK3 application for viewing and
installing fonts.  It supports browsing locally installed fonts and
downloading fonts from Google Fonts with preview and one-click installation.")
    (home-page "https://github.com/chocolateimage/fontviewer")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. noto-fonts-cjk-chws — Noto CJK fonts with chws/vchw features
;;; -------------------------------------------------------------------
(define-public noto-fonts-cjk-chws
  (package
    (name "noto-fonts-cjk-chws")
    (version "2.004")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tjw123hh/noto-cjk-chws"
                    "/releases/download/Sans" version "_CHWS"
                    "/00_NotoSansCJK.ttc.zip"))
              (sha256
               (base32
                "0ph0m59qf2y8jr6n31gj1nnq9rajv4nzc055z4gp8pxfayj1srda"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/noto-cjk-chws/"
                #:include-regexp (".*\\.ttc$")))))
    (synopsis "Google Noto CJK fonts with contextual half-width spacing")
    (description "This package provides Google Noto Sans CJK fonts with
OpenType chws (Contextual Half-width Spacing) and vchw (Vertical Contextual
Half-width Spacing) features added.  These features improve typographic
quality by automatically adjusting spacing around CJK punctuation.")
    (home-page "https://github.com/tjw123hh/noto-cjk-chws")
    (license license:silofl1.1)))
