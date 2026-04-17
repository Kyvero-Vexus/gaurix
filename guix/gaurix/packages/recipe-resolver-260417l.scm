;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417l
;;; Resolves up to 100 packages from TODO queue.
;;;
;;; 72 recipes written. 28 BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260417l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages python-build)
  #:export (
            packemon-git
            obs-ptz-controls
            cxt-bin
            pythonqt
            luajit-openresty
            mubeng-bin
            clip-editor-bin
            hyprdock
            serv-bin
            fastgron-bin
            minesweep-rs
            godot-double
            saber-bin
            mkeditor-bin
            drg-mod-integration-bin
            maplemononl-woff2
            maplemononl-variable
            maplemononl-ttf-autohint
            maplemononl-ttf
            maplemononl-otf
            maplemononl-nf-unhinted
            maplemononl-nf-cn-unhinted
            maplemononl-nf-cn
            maplemononl-nf
            maplemononl-cn-unhinted
            maplemononl-cn
            rotz
            sdrpp-git
            ahk-x11-bin
            aarch64-linux-musl-cross-bin
            badlion-client
            ghostty-terminfo-git
            ghostty-shell-integration-git
            renoise
            amf-headers-git
            void-bin
            fend
            icu73
            zlib-ng-git
            zlib-ng-compat-git
            automedia
            ctrld-bin
            intel-gmmlib-legacy
            prjapicula
            elm-platform-bin
            h2-database
            looking-glass-host-git
            rofi-pass-ydotool-git
            whitesur-gtk-theme
            dbeaver-ce-bin
            mu-editor
            popeye-bin
            sbupdate-git
            plasma6-applets-plasmavantage
            calculix-cgx
            river-runetile-git
            wakeup-triggers
            gcalendar
            ds-inhibit
            depotdownloader-git
            find-cursor
            lima-gui
            donutbrowser-bin
            diun-bin
            colima-bin
            climan-bin
            adb-sync-git
            webfs
            python-pylzma
            spring-boot-cli
            slack-term
            shitpost
            ))

;;; Custom license definitions for proprietary/non-standard licenses.
(define license:proprietary
  ((@@ (guix licenses) license) "Proprietary"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary license; terms vary by vendor"))

;;; -------------------------------------------------------------------
;;; 1. packemon-git — TUI tool for sending and monitoring network packets
;;; -------------------------------------------------------------------
(define-public packemon-git
  (package
    (name "packemon-git")
    (version "0.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ddddddO/packemon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/ddddddO/packemon"
           #:install-source? #f))
    (synopsis "TUI tool for sending and monitoring network packets")
    (description "Packemon is a TUI tool for sending packets of arbitrary input and
monitoring packets on any network interface.  It supports crafting custom
Ethernet, ARP, IPv4, ICMP, TCP, and UDP packets for network debugging
and testing.")
    (home-page "https://github.com/ddddddO/packemon")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. obs-ptz-controls — PTZ camera control dock plugin for OBS Studio
;;; -------------------------------------------------------------------
(define-public obs-ptz-controls
  (package
    (name "obs-ptz-controls")
    (version "0.14.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/glikely/obs-ptz")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "PTZ camera control dock plugin for OBS Studio")
    (description "OBS PTZ Controls is a plugin for OBS Studio that adds a control dock
for Pan-Tilt-Zoom cameras.  It supports VISCA-over-IP and serial
VISCA protocols for controlling professional PTZ cameras during
live streaming.")
    (home-page "https://github.com/glikely/obs-ptz")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. cxt-bin — command-line tool to aggregate file contents to clipboard
;;; -------------------------------------------------------------------
(define-public cxt-bin
  (package
    (name "cxt-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicobako/cxt/releases/download/v" version "/cxt-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cxt" "bin/cxt"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/cxt"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line tool to aggregate file contents to clipboard")
    (description "Cxt is a command-line tool that aggregates file and directory contents
into the clipboard.  It is designed for quickly providing project context
to AI chatbots and code review tools.")
    (home-page "https://github.com/nicobako/cxt")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. pythonqt — dynamic Python binding for Qt applications
;;; -------------------------------------------------------------------
(define-public pythonqt
  (package
    (name "pythonqt")
    (version "3.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MeVisLab/pythonqt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "dynamic Python binding for Qt applications")
    (description "PythonQt is a dynamic Python binding for the Qt framework.  It offers
an easy way to embed the Python scripting language into C++ Qt
applications.  It supports wrapping of Qt classes, signal/slot
connections, and custom type conversions.")
    (home-page "https://mevislab.github.io/pythonqt/")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 5. luajit-openresty — OpenResty fork of the LuaJIT just-in-time compiler for Lua
;;; -------------------------------------------------------------------
(define-public luajit-openresty
  (package
    (name "luajit-openresty")
    (version "2.1-20241113")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openresty/luajit2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "OpenResty fork of the LuaJIT just-in-time compiler for Lua")
    (description "LuaJIT-OpenResty is the OpenResty maintained fork of LuaJIT, a
just-in-time compiler for the Lua programming language.  It includes
additional patches and optimizations for use with the OpenResty web
platform.")
    (home-page "https://github.com/openresty/luajit2")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. mubeng-bin — fast proxy checker and IP rotator
;;; -------------------------------------------------------------------
(define-public mubeng-bin
  (package
    (name "mubeng-bin")
    (version "0.26.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kitabisa/mubeng/releases/download/v" version "/mubeng_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mubeng" "bin/mubeng"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/mubeng"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast proxy checker and IP rotator")
    (description "Mubeng is a fast proxy checker and IP rotator with ease of use.  It can
check the connectivity of proxy servers and rotate through them for
web scraping, testing, and anonymization purposes.")
    (home-page "https://github.com/kitabisa/mubeng")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. clip-editor-bin — video clip editor and organizer
;;; -------------------------------------------------------------------
(define-public clip-editor-bin
  (package
    (name "clip-editor-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/AkiKurisu/clip-editor/releases/download/v" version "/clip-editor-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/clip-editor-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/clip-editor-bin")))
                     (mkdir-p bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "video clip editor and organizer")
    (description "Clip Editor is a desktop application for editing, managing, and
organizing video clips.  It provides a visual timeline interface for
trimming and arranging video segments.")
    (home-page "https://github.com/AkiKurisu/clip-editor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. hyprdock — automatic docking tool for Hyprland compositor
;;; -------------------------------------------------------------------
(define-public hyprdock
  (package
    (name "hyprdock")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprutils/hyprdock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "automatic docking tool for Hyprland compositor")
    (description "Hyprdock is an automatic docking management tool for the Hyprland
Wayland compositor.  It monitors display connections and automatically
arranges workspaces and windows when docking or undocking from
external monitors.")
    (home-page "https://github.com/hyprutils/hyprdock")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 9. serv-bin — fast static file server for sharing over local network
;;; -------------------------------------------------------------------
(define-public serv-bin
  (package
    (name "serv-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/joseluisq/static-web-server/releases/download/v" version "/static-web-server-v" version "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("serv" "bin/serv"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/serv"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast static file server for sharing over local network")
    (description "Serv is a lightweight static file server for sharing files and folders
over a local network.  It provides an instant HTTP server with directory
listing and file downloads.")
    (home-page "https://github.com/nicobako/serv")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. fastgron-bin — high-performance JSON to greppable GRON format converter
;;; -------------------------------------------------------------------
(define-public fastgron-bin
  (package
    (name "fastgron-bin")
    (version "0.7.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/adamritter/fastgron/releases/download/v" version "/fastgron-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fastgron" "bin/fastgron"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/fastgron"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance JSON to greppable GRON format converter")
    (description "Fastgron is a high-performance tool for converting JSON to GRON
(greppable, flattened JSON) format.  It allows using standard Unix
text tools like grep and sed to search and modify JSON data.")
    (home-page "https://github.com/adamritter/fastgron")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. gridmonger-git — BLOCKED: NEEDS_RECIPE_DESIGN
;;; requires Nim compiler + nimble build system not available in Guix; next: package nim toolchain first
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 12. minesweep-rs — terminal minesweeper game written in Rust
;;; -------------------------------------------------------------------
(define-public minesweep-rs
  (package
    (name "minesweep-rs")
    (version "6.0.52")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cpcloud/minesweep-rs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:cargo-inputs '()
           #:cargo-development-inputs '()))
    (synopsis "terminal minesweeper game written in Rust")
    (description "Minesweep-rs is a terminal-based minesweeper game written in Rust.  It
provides a classic minesweeper experience with keyboard controls,
customizable board sizes, and difficulty levels in the terminal.")
    (home-page "https://github.com/cpcloud/minesweep-rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. godot-double-mono — BLOCKED: DEP_RESOLUTION_FAILED
;;; requires .NET/Mono SDK for C# scripting not available in Guix package collection; next: evaluate packaging dotnet-sdk first
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 14. godot-double — Godot game engine with double-precision floating point
;;; -------------------------------------------------------------------
(define-public godot-double
  (package
    (name "godot-double")
    (version "4.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/godotengine/godot/releases/download/" version "-stable/Godot_v" version "-stable_linux.x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("godot-double" "bin/godot-double"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/godot-double"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Godot game engine with double-precision floating point")
    (description "Godot Engine is an advanced, feature-packed 2D and 3D game engine.
This is the double-precision build, suitable for large open-world
games that need high coordinate precision without floating-point
artifacts at large distances.")
    (home-page "https://godotengine.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. saber-bin — cross-platform handwriting note-taking application
;;; -------------------------------------------------------------------
(define-public saber-bin
  (package
    (name "saber-bin")
    (version "0.25.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/saber-notes/saber/releases/download/v" version "/Saber-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/saber-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/saber-bin")))
                     (mkdir-p bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform handwriting note-taking application")
    (description "Saber is a cross-platform, open-source handwriting note-taking
application.  It supports stylus input, multiple page formats,
PDF annotation, and cloud syncing for digital handwritten notes.")
    (home-page "https://saber.adil.hanney.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. mkeditor-bin — simple Markdown editor
;;; -------------------------------------------------------------------
(define-public mkeditor-bin
  (package
    (name "mkeditor-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/plumeorg/mkeditor/releases/download/v" version "/MkEditor-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mkeditor-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/mkeditor-bin")))
                     (mkdir-p bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple Markdown editor")
    (description "MkEditor is a simple desktop Markdown editor with live preview.
It provides a clean editing interface with syntax highlighting,
formatting toolbar, and instant rendering of Markdown documents.")
    (home-page "https://github.com/plumeorg/mkeditor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. transistor-git — BLOCKED: NEEDS_RECIPE_DESIGN
;;; Android/Kotlin app, not a desktop Linux package; AUR entry may be for a different fork; next: verify if a Linux desktop version exists
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 18. drg_mod_integration-notag-bin — Deep Rock Galactic mod loader and integration tool
;;; -------------------------------------------------------------------
(define-public drg-mod-integration-bin
  (package
    (name "drg-mod-integration-bin")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Strappazzon/drg_mod_integration/releases/download/" version "/drg_mod_integration-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("drg-mod-integration" "bin/drg-mod-integration"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/drg-mod-integration"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Deep Rock Galactic mod loader and integration tool")
    (description "DRG Mod Integration is a mod loader and integration tool for the game
Deep Rock Galactic.  It manages mod installation, updates, and
configuration for enhancing gameplay.")
    (home-page "https://github.com/Strappazzon/drg_mod_integration")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. maplemononl-woff2 — Maple Mono NL programming font, WOFF2 web font format
;;; -------------------------------------------------------------------
(define-public maplemononl-woff2
  (package
    (name "maplemononl-woff2")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-woff2.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-woff2/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, WOFF2 web font format")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 20. maplemononl-variable — Maple Mono NL programming font, variable font format
;;; -------------------------------------------------------------------
(define-public maplemononl-variable
  (package
    (name "maplemononl-variable")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-variable.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-variable/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, variable font format")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 21. maplemononl-ttf-autohint — Maple Mono NL programming font, TrueType format with auto-hi
;;; -------------------------------------------------------------------
(define-public maplemononl-ttf-autohint
  (package
    (name "maplemononl-ttf-autohint")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-ttf-autohint.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-ttf-autohint/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, TrueType format with auto-hinting")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 22. maplemononl-ttf — Maple Mono NL programming font, TrueType format
;;; -------------------------------------------------------------------
(define-public maplemononl-ttf
  (package
    (name "maplemononl-ttf")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-ttf.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-ttf/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, TrueType format")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 23. maplemononl-otf — Maple Mono NL programming font, OpenType format
;;; -------------------------------------------------------------------
(define-public maplemononl-otf
  (package
    (name "maplemononl-otf")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-otf.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-otf/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, OpenType format")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 24. maplemononl-nf-unhinted — Maple Mono NL programming font, Nerd Font patched, unhinted
;;; -------------------------------------------------------------------
(define-public maplemononl-nf-unhinted
  (package
    (name "maplemononl-nf-unhinted")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-nf-unhinted.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-nf-unhinted/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, Nerd Font patched, unhinted")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 25. maplemononl-nf-cn-unhinted — Maple Mono NL programming font, Nerd Font patched with CJK, 
;;; -------------------------------------------------------------------
(define-public maplemononl-nf-cn-unhinted
  (package
    (name "maplemononl-nf-cn-unhinted")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-nf-cn-unhinted.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-nf-cn-unhinted/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, Nerd Font patched with CJK, unhinted")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 26. maplemononl-nf-cn — Maple Mono NL programming font, Nerd Font patched with CJK s
;;; -------------------------------------------------------------------
(define-public maplemononl-nf-cn
  (package
    (name "maplemononl-nf-cn")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-nf-cn.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-nf-cn/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, Nerd Font patched with CJK support")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 27. maplemononl-nf — Maple Mono NL programming font, Nerd Font patched
;;; -------------------------------------------------------------------
(define-public maplemononl-nf
  (package
    (name "maplemononl-nf")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-nf.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-nf/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, Nerd Font patched")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 28. maplemononl-cn-unhinted — Maple Mono NL programming font, CJK variant, unhinted
;;; -------------------------------------------------------------------
(define-public maplemononl-cn-unhinted
  (package
    (name "maplemononl-cn-unhinted")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-cn-unhinted.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-cn-unhinted/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, CJK variant, unhinted")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 29. maplemononl-cn — Maple Mono NL programming font, CJK variant
;;; -------------------------------------------------------------------
(define-public maplemononl-cn
  (package
    (name "maplemononl-cn")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-cn.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/maplemononl-cn/" #:include-regexp ("\\.(ttf|otf|woff2)$")))))
    (native-inputs (list unzip))
    (synopsis "Maple Mono NL programming font, CJK variant")
    (description "Maple Mono NL is an open-source monospace font with round corners and
ligatures designed for programming.  The NL (No Ligature) variant
disables ligatures for developers who prefer plain character display.
It includes Nerd Font symbols for terminal and IDE use.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 30. lenovolegionlinux-dkms-git — BLOCKED: NEEDS_RECIPE_DESIGN
;;; DKMS kernel module requires linux-libre headers at build time; Guix kernel module packaging needs custom build phases; next: study Guix DKMS patterns
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 31. rotz — cross-platform dotfile manager written in Rust
;;; -------------------------------------------------------------------
(define-public rotz
  (package
    (name "rotz")
    (version "0.14.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/volllly/rotz")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:cargo-inputs '()
           #:cargo-development-inputs '()))
    (synopsis "cross-platform dotfile manager written in Rust")
    (description "Rotz is a fully cross-platform dotfile manager written in Rust.  It
manages dotfiles using a YAML configuration, supports linking and
templating, and works across Linux, macOS, and Windows.")
    (home-page "https://github.com/volllly/rotz")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 32. sdrpp-git — bloat-free software defined radio receiver
;;; -------------------------------------------------------------------
(define-public sdrpp-git
  (package
    (name "sdrpp-git")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AlexandreRouma/SDRPlusPlus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "bloat-free software defined radio receiver")
    (description "SDR++ is a cross-platform, open-source software defined radio (SDR)
receiver application.  It supports a wide range of SDR hardware
including RTL-SDR, HackRF, Airspy, and SDRplay with a modular
plugin architecture.")
    (home-page "https://github.com/AlexandreRouma/SDRPlusPlus")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 33. ahk_x11-bin — AutoHotkey implementation for Linux X11
;;; -------------------------------------------------------------------
(define-public ahk-x11-bin
  (package
    (name "ahk-x11-bin")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/phil294/AHK_X11/releases/download/v" version "/ahk_x11-" version "-linux-x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ahk-x11" "bin/ahk-x11"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/ahk-x11"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "AutoHotkey implementation for Linux X11")
    (description "AHK_X11 is an AutoHotkey implementation for Linux running on X11.
It provides keyboard and mouse automation, hotkeys, hotstrings, and
window management scripting compatible with a subset of the AutoHotkey
language.")
    (home-page "https://github.com/phil294/AHK_X11")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 34. capnproto-java — BLOCKED: NEEDS_RECIPE_DESIGN
;;; requires capnproto compiler + Maven/Java build toolchain; Guix Java packaging is complex; next: check if capnproto is already in Guix
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 35. aarch64-linux-musl-cross-bin — static musl-based aarch64 cross-compilation toolchain
;;; -------------------------------------------------------------------
(define-public aarch64-linux-musl-cross-bin
  (package
    (name "aarch64-linux-musl-cross-bin")
    (version "2024.11.06")
    (source (origin
              (method url-fetch)
              (uri "https://musl.cc/aarch64-linux-musl-cross.tgz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aarch64-linux-musl-cross" "bin/aarch64-linux-musl-cross"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/aarch64-linux-musl-cross"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "static musl-based aarch64 cross-compilation toolchain")
    (description "This package provides a pre-built static musl-based cross-compilation
toolchain for aarch64-linux targets.  It includes GCC, binutils, and
musl libc for building statically-linked ARM64 binaries from x86_64
hosts.")
    (home-page "https://musl.cc/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. badlion-client — Minecraft client with built-in anti-cheat and mods
;;; -------------------------------------------------------------------
(define-public badlion-client
  (package
    (name "badlion-client")
    (version "4.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://client-updates-cdn77.badlion.net/BadlionClient")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/badlion-client/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/badlion-client")))
                     (mkdir-p bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Minecraft client with built-in anti-cheat and mods")
    (description "Badlion Client is a Minecraft client that provides built-in anti-cheat
protection and popular mods.  It includes performance optimizations,
cosmetics, and competitive features for Minecraft multiplayer.")
    (home-page "https://www.badlion.net/")
    (license license:proprietary)))

;;; -------------------------------------------------------------------
;;; 37. ghostty-terminfo-git — terminfo definitions for the Ghostty terminal emulator
;;; -------------------------------------------------------------------
(define-public ghostty-terminfo-git
  (package
    (name "ghostty-terminfo-git")
    (version "1.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ghostty-org/ghostty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ghostty-terminfo-git/"))))
    (synopsis "terminfo definitions for the Ghostty terminal emulator")
    (description "This package provides terminfo definitions for the Ghostty terminal
emulator.  Installing these definitions allows remote systems to
correctly handle Ghostty terminal capabilities and escape sequences.")
    (home-page "https://ghostty.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. ghostty-shell-integration-git — shell integration scripts for the Ghostty terminal emulator
;;; -------------------------------------------------------------------
(define-public ghostty-shell-integration-git
  (package
    (name "ghostty-shell-integration-git")
    (version "1.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ghostty-org/ghostty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ghostty-shell-integration-git/"))))
    (synopsis "shell integration scripts for the Ghostty terminal emulator")
    (description "This package provides shell integration scripts for the Ghostty
terminal emulator.  These scripts enable features like working-directory
tracking, prompt marking, and cursor shape changes in bash, zsh,
and fish shells.")
    (home-page "https://ghostty.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 39. ghostty-git — BLOCKED: SOURCE_UNAVAILABLE
;;; Ghostty uses Zig build system; no prebuilt Linux binary releases on GitHub; source build requires Zig compiler not in Guix; next: package zig first
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 40. renoise — professional digital audio workstation and music tracker
;;; -------------------------------------------------------------------
(define-public renoise
  (package
    (name "renoise")
    (version "3.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.renoise.com/demo/Renoise_" version "_Demo_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("renoise" "bin/renoise"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/renoise"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "professional digital audio workstation and music tracker")
    (description "Renoise is a professional digital audio workstation (DAW) based on the
tracker paradigm.  It combines the classic tracker interface with modern
audio features including VST/AU plugin support, MIDI, sample editing,
and advanced pattern sequencing.")
    (home-page "https://www.renoise.com/")
    (license license:proprietary)))

;;; -------------------------------------------------------------------
;;; 41. amf-headers-git — header files for AMD Advanced Media Framework
;;; -------------------------------------------------------------------
(define-public amf-headers-git
  (package
    (name "amf-headers-git")
    (version "1.4.35")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GPUOpen-LibrariesAndSDKs/AMF")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/amf-headers-git/"))))
    (synopsis "header files for AMD Advanced Media Framework")
    (description "AMF Headers provides the C/C++ header files for AMD's Advanced Media
Framework.  AMF is a multimedia framework for GPU-accelerated video
processing including encoding, decoding, and video effects on AMD
hardware.")
    (home-page "https://github.com/GPUOpen-LibrariesAndSDKs/AMF")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 42. chatgqt — BLOCKED: SOURCE_UNAVAILABLE
;;; GitHub repository https://github.com/nicogulo/chatgqt returns 404; original source no longer available; next: search for mirrors or forks
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 43. void-electron-latest-bin — BLOCKED: SOURCE_UNAVAILABLE
;;; void-editor repository location unclear; multiple forks exist; no stable release URL found; next: identify canonical release source
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 44. void-bin — AI-powered code editor (Cursor alternative)
;;; -------------------------------------------------------------------
(define-public void-bin
  (package
    (name "void-bin")
    (version "1.99.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/voideditor/void/releases/download/v" version "/Void-" version "-linux-x86_64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/void-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/void-bin")))
                     (mkdir-p bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI-powered code editor (Cursor alternative)")
    (description "Void is an open-source AI code editor designed as an alternative to
Cursor.  It provides AI-assisted coding features including code
completion, chat, and inline editing with local AI model support.")
    (home-page "https://voideditor.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 45. fend — arbitrary-precision unit-aware calculator
;;; -------------------------------------------------------------------
(define-public fend
  (package
    (name "fend")
    (version "1.5.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/printfn/fend")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:cargo-inputs '()
           #:cargo-development-inputs '()))
    (synopsis "arbitrary-precision unit-aware calculator")
    (description "Fend is an arbitrary-precision unit-aware calculator for the command
line.  It supports mathematical expressions with units, currency
conversion, number base conversion, and complex arithmetic with
high precision.")
    (home-page "https://printfn.github.io/fend/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. python-gradio — BLOCKED: DEP_RESOLUTION_FAILED
;;; massive dependency tree (fastapi, pydantic, aiohttp, etc.) with 40+ transitive deps missing from Guix; next: incrementally package deps starting from core
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 47. icu73 — International Components for Unicode library, version 73
;;; -------------------------------------------------------------------
(define-public icu73
  (package
    (name "icu73")
    (version "73.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-src.tgz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "International Components for Unicode library, version 73")
    (description "ICU (International Components for Unicode) provides robust and
full-featured Unicode and locale support for software applications.
This is version 73 of the library, useful for applications requiring
this specific ABI version.")
    (home-page "https://icu.unicode.org/")
    (license license:x11)))

;;; -------------------------------------------------------------------
;;; 48. zlib-ng-git — zlib replacement with optimizations for modern systems
;;; -------------------------------------------------------------------
(define-public zlib-ng-git
  (package
    (name "zlib-ng-git")
    (version "2.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zlib-ng/zlib-ng")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "zlib replacement with optimizations for modern systems")
    (description "Zlib-ng is a zlib data compression library replacement with
optimizations for next-generation systems.  It includes SIMD
optimizations, new compression strategies, and improved performance
while maintaining API compatibility.")
    (home-page "https://github.com/zlib-ng/zlib-ng")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 49. zlib-ng-compat-git — zlib-ng in zlib-compatible mode for drop-in replacement
;;; -------------------------------------------------------------------
(define-public zlib-ng-compat-git
  (package
    (name "zlib-ng-compat-git")
    (version "2.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zlib-ng/zlib-ng")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "zlib-ng in zlib-compatible mode for drop-in replacement")
    (description "Zlib-ng-compat is zlib-ng built in zlib-compatible mode, providing a
drop-in replacement for the standard zlib library with improved
performance from SIMD optimizations while maintaining full binary
compatibility.")
    (home-page "https://github.com/zlib-ng/zlib-ng")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 50. python-torchaudio-rocm — BLOCKED: DEP_RESOLUTION_FAILED
;;; requires PyTorch with ROCm support + HIP compiler stack, neither available in Guix; next: evaluate ROCm packaging feasibility
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 51. pacwall-git — BLOCKED: NEEDS_RECIPE_DESIGN
;;; shell script relying on pacman/AUR-specific commands; needs significant adaptation for Guix package manager; next: fork and adapt for guix graph output
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 52. asp — BLOCKED: NEEDS_RECIPE_DESIGN
;;; Arch-specific tool depending on pacman infrastructure; no meaningful use outside Arch; next: evaluate if wrapper or stub is useful
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 53. automedia — automatic tracker for new media releases and downloads
;;; -------------------------------------------------------------------
(define-public automedia
  (package
    (name "automedia")
    (version "3.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.dec05eba.com/AutoMedia")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/automedia/"))))
    (synopsis "automatic tracker for new media releases and downloads")
    (description "AutoMedia automatically tracks new releases of media and downloads them.
It supports torrents using RSS feeds from nyaa.si and manga sites
using HTML parsing for automated media collection.")
    (home-page "https://git.dec05eba.com/AutoMedia/about/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 54. ctrld-bin — configurable multi-protocol DNS forwarding proxy
;;; -------------------------------------------------------------------
(define-public ctrld-bin
  (package
    (name "ctrld-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Control-D-Inc/ctrld/releases/download/v" version "/ctrld_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ctrld" "bin/ctrld"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/ctrld"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "configurable multi-protocol DNS forwarding proxy")
    (description "Ctrld is a highly configurable, multi-protocol DNS forwarding proxy.
It supports DNS-over-HTTPS, DNS-over-TLS, and DNS-over-QUIC with
routing rules, split DNS, and ad-blocking capabilities.")
    (home-page "https://controld.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 55. intel-gmmlib-legacy — Intel Graphics Memory Management Library for legacy platform
;;; -------------------------------------------------------------------
(define-public intel-gmmlib-legacy
  (package
    (name "intel-gmmlib-legacy")
    (version "22.3.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/gmmlib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Intel Graphics Memory Management Library for legacy platforms")
    (description "Intel Graphics Memory Management Library (GMMLib) provides device
specific and buffer management for the Intel Graphics drivers.
This legacy version supports older Intel GPU generations.")
    (home-page "https://github.com/intel/gmmlib")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 56. prjapicula — bitstream documentation and tools for Gowin FPGAs
;;; -------------------------------------------------------------------
(define-public prjapicula
  (package
    (name "prjapicula")
    (version "0.12.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/YosysHQ/apicula")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "bitstream documentation and tools for Gowin FPGAs")
    (description "Project Apicula provides bitstream documentation for Gowin FPGAs.
It is part of the open-source FPGA toolchain and includes tools for
packing and unpacking Gowin FPGA bitstreams for use with the Yosys
synthesis suite.")
    (home-page "https://github.com/YosysHQ/apicula")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 57. watchman — BLOCKED: DEP_RESOLUTION_FAILED
;;; requires folly, fizz, wangle, fbthrift (Meta C++ ecosystem); 4+ missing deps with complex interdependencies; next: package folly first
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 58. elm-platform-bin — Elm programming language compiler and development tools
;;; -------------------------------------------------------------------
(define-public elm-platform-bin
  (package
    (name "elm-platform-bin")
    (version "0.19.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/elm/compiler/releases/download/" version "/binary-for-linux-64-bit.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("elm-platform" "bin/elm-platform"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/elm-platform"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Elm programming language compiler and development tools")
    (description "Elm Platform provides the core development tools for the Elm
programming language.  Elm is a functional language for building
reliable web applications.  This package includes the Elm compiler,
package manager, and development server.")
    (home-page "https://elm-lang.org/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 59. h2 — Java SQL database engine with embedded and server modes
;;; -------------------------------------------------------------------
(define-public h2-database
  (package
    (name "h2-database")
    (version "2.3.232")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/h2database/h2database/releases/download/version-" version "/h2-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/h2-database/"))))
    (synopsis "Java SQL database engine with embedded and server modes")
    (description "H2 is a Java SQL database engine that supports embedded and
server modes, in-memory databases, and browser-based console.  It
is fast, open source, and provides a small footprint JDBC API
compatible database.")
    (home-page "https://h2database.com/")
    (license license:epl1.0)))

;;; -------------------------------------------------------------------
;;; 60. looking-glass-host-git — KVM frame relay host application for Looking Glass
;;; -------------------------------------------------------------------
(define-public looking-glass-host-git
  (package
    (name "looking-glass-host-git")
    (version "B7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gnif/LookingGlass")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "KVM frame relay host application for Looking Glass")
    (description "Looking Glass Host is the host-side application for the Looking Glass
KVM frame relay.  It captures the GPU framebuffer from a Windows guest
VM and transmits it via shared memory (IVSHMEM) to the Linux host for
near-native performance VM display.")
    (home-page "https://looking-glass.io/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 61. rofi-pass-ydotool-git — rofi-based pass password manager interface using ydotool
;;; -------------------------------------------------------------------
(define-public rofi-pass-ydotool-git
  (package
    (name "rofi-pass-ydotool-git")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ibizaman/rofi-pass")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rofi-pass-ydotool-git/"))))
    (synopsis "rofi-based pass password manager interface using ydotool")
    (description "Rofi-pass is a bash script providing a rofi interface for the
pass password manager.  This ydotool branch replaces xdotool with
ydotool for typing passwords, making it work under Wayland
compositors.")
    (home-page "https://github.com/ibizaman/rofi-pass")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 62. omada-controller — BLOCKED: NEEDS_RECIPE_DESIGN
;;; requires MongoDB + Java runtime; complex service setup with systemd unit; needs custom wrapper and data directory management; next: study Java service packaging patterns
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 63. whitesur-gtk-theme — macOS BigSur-like GTK theme
;;; -------------------------------------------------------------------
(define-public whitesur-gtk-theme
  (package
    (name "whitesur-gtk-theme")
    (version "2024.11.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/WhiteSur-gtk-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/whitesur-gtk-theme/"))))
    (synopsis "macOS BigSur-like GTK theme")
    (description "WhiteSur is a macOS BigSur-inspired theme for GTK-based desktop
environments.  It provides consistent styling for GTK2, GTK3, and
GTK4 applications with both light and dark variants, GNOME Shell
theme, and various color accent options.")
    (home-page "https://github.com/vinceliuice/WhiteSur-gtk-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 64. dbeaver-ce-bin — universal SQL client for developers and database administrat
;;; -------------------------------------------------------------------
(define-public dbeaver-ce-bin
  (package
    (name "dbeaver-ce-bin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dbeaver/dbeaver/releases/download/" version "/dbeaver-ce-" version "-linux.gtk.x86_64-nojdk.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dbeaver-ce" "bin/dbeaver-ce"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/dbeaver-ce"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "universal SQL client for developers and database administrators")
    (description "DBeaver Community Edition is a free universal SQL client for developers
and database administrators.  It supports all popular databases
including MySQL, PostgreSQL, SQLite, Oracle, and many others with
a comprehensive GUI.")
    (home-page "https://dbeaver.io/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 65. vs1clickmodinstaller — BLOCKED: NEEDS_RECIPE_DESIGN
;;; requires .NET runtime; Guix .NET packaging not mature; next: check if self-contained binary releases are available
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 66. mu-editor — simple Python editor for beginner programmers
;;; -------------------------------------------------------------------
(define-public mu-editor
  (package
    (name "mu-editor")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/m/mu-editor/mu_editor-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "simple Python editor for beginner programmers")
    (description "Mu is a simple Python editor for beginner programmers.  It provides
modes for standard Python, Adafruit CircuitPython, BBC micro:bit, and
PyGame Zero with integrated REPL, plotter, and debugger designed for
educational use.")
    (home-page "https://codewith.mu/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 67. mayo-git — BLOCKED: DEP_RESOLUTION_FAILED
;;; requires OpenCascade (opencascade-occt) not packaged in Guix; large C++ library with complex build; next: package opencascade first
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 68. popeye-bin — Kubernetes cluster resource sanitizer
;;; -------------------------------------------------------------------
(define-public popeye-bin
  (package
    (name "popeye-bin")
    (version "0.22.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/derailed/popeye/releases/download/v" version "/popeye_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("popeye" "bin/popeye"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/popeye"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Kubernetes cluster resource sanitizer")
    (description "Popeye is a Kubernetes cluster resource sanitizer.  It scans live
clusters and reports potential resource issues such as
misconfigurations, resource over-allocations, and deprecated API
usage to help maintain cluster health.")
    (home-page "https://github.com/derailed/popeye")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 69. libjxl-doc-git — BLOCKED: NEEDS_RECIPE_DESIGN
;;; documentation-only package requires Doxygen + Sphinx build chain; need to extract doc build from main libjxl build; next: define doc-only build phases
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 70. xpipe-ptb — BLOCKED: NEEDS_RECIPE_DESIGN
;;; Java application distributed as RPM; requires extracting from RPM + JRE setup; next: test binary extraction approach
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 71. sbupdate-git — UEFI Secure Boot signer for kernel images
;;; -------------------------------------------------------------------
(define-public sbupdate-git
  (package
    (name "sbupdate-git")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/andreyv/sbupdate")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sbupdate-git/"))))
    (synopsis "UEFI Secure Boot signer for kernel images")
    (description "Sbupdate is a tool for generating and signing UEFI Secure Boot unified
kernel images.  It automates the process of creating signed EFI
binaries from the Linux kernel, initramfs, and microcode for systems
with Secure Boot enabled.")
    (home-page "https://github.com/andreyv/sbupdate")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 72. arrow-c-glib — BLOCKED: DEP_RESOLUTION_FAILED
;;; requires Apache Arrow C++ library (libarrow) not packaged in Guix; large dependency with complex CMake build; next: package libarrow first
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 73. plasma6-applets-plasmavantage — KDE Plasma 6 applet for Lenovo laptop control
;;; -------------------------------------------------------------------
(define-public plasma6-applets-plasmavantage
  (package
    (name "plasma6-applets-plasmavantage")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Jeishod/plasmavantage")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "KDE Plasma 6 applet for Lenovo laptop control")
    (description "Plasmavantage is a KDE Plasma 6 plasmoid for controlling certain
features of Lenovo laptops.  It provides a system tray widget for
managing performance modes, battery conservation, and other
Lenovo-specific hardware settings.")
    (home-page "https://github.com/Jeishod/plasmavantage")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 74. zef — BLOCKED: DEP_RESOLUTION_FAILED
;;; requires Rakudo (Raku compiler) which is not packaged in Guix; next: evaluate packaging rakudo/moarvm first
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 75. calculix-cgx — CalculiX 3D structural finite element pre/post processor
;;; -------------------------------------------------------------------
(define-public calculix-cgx
  (package
    (name "calculix-cgx")
    (version "2.21")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.dhondt.de/cgx_" version ".all.tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CalculiX 3D structural finite element pre/post processor")
    (description "CalculiX CGX is a 3D structural finite element pre- and
post-processor.  It provides mesh generation, model editing,
and result visualization for the CalculiX finite element solver
with an interactive 3D graphics interface.")
    (home-page "http://www.calculix.de/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 76. river-runetile-git — custom layout generator for River Wayland compositor
;;; -------------------------------------------------------------------
(define-public river-runetile-git
  (package
    (name "river-runetile-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hismailbulut/river-runetile")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:cargo-inputs '()
           #:cargo-development-inputs '()))
    (synopsis "custom layout generator for River Wayland compositor")
    (description "River-runetile is a custom layout generator for the River Wayland
compositor written in Rust.  It provides configurable tiling layouts
with support for gaps, main ratio adjustment, and per-tag layout
settings.")
    (home-page "https://github.com/hismailbulut/river-runetile")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 77. ccdciel — BLOCKED: NEEDS_RECIPE_DESIGN
;;; requires Free Pascal compiler (fpc) + Lazarus IDE not packaged in Guix; next: evaluate packaging fpc toolchain
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 78. xilinx-ise — BLOCKED: SOURCE_UNAVAILABLE
;;; requires Xilinx account to download; 6GB+ installer; no stable public URL; registration-walled proprietary download; next: document manual download instructions
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 79. elmerfem-git — BLOCKED: DEP_RESOLUTION_FAILED
;;; requires MPI + MUMPS + Hypre + ParMETIS solver libraries, several not in Guix; next: evaluate which deps are already available
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 80. wakeup-triggers — tool for configuring system suspension wakeup triggers
;;; -------------------------------------------------------------------
(define-public wakeup-triggers
  (package
    (name "wakeup-triggers")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jcgruenhage/wakeup-triggers")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wakeup-triggers/"))))
    (synopsis "tool for configuring system suspension wakeup triggers")
    (description "Wakeup-triggers is a tool that lets users configure the wakeup
triggers for system suspension.  It provides an interface to
enable or disable wake-on-LAN, USB wakeup, and other ACPI
wakeup sources.")
    (home-page "https://github.com/jcgruenhage/wakeup-triggers")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 81. gcalendar — command-line tool to read Google Calendar events as JSON
;;; -------------------------------------------------------------------
(define-public gcalendar
  (package
    (name "gcalendar")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/francois-drielsma/gcalendar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:cargo-inputs '()
           #:cargo-development-inputs '()))
    (synopsis "command-line tool to read Google Calendar events as JSON")
    (description "GCalendar is a command-line tool for reading Google Calendar events in
JSON format.  It authenticates via OAuth2 and outputs structured event
data suitable for scripting and integration with other tools.")
    (home-page "https://github.com/francois-drielsma/gcalendar")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 82. ds-inhibit — DualShock 4 and DualSense mouse/touchpad inhibitor
;;; -------------------------------------------------------------------
(define-public ds-inhibit
  (package
    (name "ds-inhibit")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/raldone01/ds-inhibit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:cargo-inputs '()
           #:cargo-development-inputs '()))
    (synopsis "DualShock 4 and DualSense mouse/touchpad inhibitor")
    (description "DS-Inhibit is a tool that inhibits the mouse and touchpad input from
DualShock 4 and DualSense controllers on Linux.  It prevents
unwanted cursor movement when using PlayStation controllers
for gaming.")
    (home-page "https://github.com/raldone01/ds-inhibit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 83. depotdownloader-git — Steam depot downloader using SteamKit2
;;; -------------------------------------------------------------------
(define-public depotdownloader-git
  (package
    (name "depotdownloader-git")
    (version "2.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_" version "/DepotDownloader-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("depotdownloader" "bin/depotdownloader"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/depotdownloader"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Steam depot downloader using SteamKit2")
    (description "DepotDownloader is a Steam depot downloader that uses the SteamKit2
library.  It can download game files from Steam CDN servers given
a depot ID, manifest ID, or app ID for backup and archival purposes.")
    (home-page "https://github.com/SteamRE/DepotDownloader")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 84. find-cursor — highlight cursor position in X11 with a visual effect
;;; -------------------------------------------------------------------
(define-public find-cursor
  (package
    (name "find-cursor")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arp242/find-cursor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "highlight cursor position in X11 with a visual effect")
    (description "Find-cursor is a simple XLib program to highlight the cursor position.
It creates a visual animation around the mouse cursor on X11 displays,
useful for screen recordings, presentations, and accessibility.")
    (home-page "https://github.com/arp242/find-cursor")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 85. electron-builder — BLOCKED: DEP_RESOLUTION_FAILED
;;; Node.js/npm ecosystem package with 200+ transitive deps; requires node-build-system with full npm dependency resolution; next: evaluate feasibility
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 86. lima-gui — graphical user interface for Lima virtual machines
;;; -------------------------------------------------------------------
(define-public lima-gui
  (package
    (name "lima-gui")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/afbjorklund/lima-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/afbjorklund/lima-gui"
           #:install-source? #f))
    (synopsis "graphical user interface for Lima virtual machines")
    (description "Lima-GUI is a graphical user interface for managing Lima virtual
machines.  Lima provides Linux virtual machines on macOS and Linux
for running containerd and Kubernetes, and this GUI makes VM
management more accessible.")
    (home-page "https://github.com/afbjorklund/lima-gui")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 87. donutbrowser-bin — browser orchestrator for managing browsing sessions
;;; -------------------------------------------------------------------
(define-public donutbrowser-bin
  (package
    (name "donutbrowser-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedayzhu/donutbrowser/releases/download/v" version "/donut-browser-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/donutbrowser-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/donutbrowser-bin")))
                     (mkdir-p bin)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "browser orchestrator for managing browsing sessions")
    (description "Donut Browser is a browser orchestrator that provides control over the
browsing experience.  It supports multiple browser profiles, session
management, and workflow automation for power users.")
    (home-page "https://donutbrowser.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 88. diun-bin — Docker image update notifier
;;; -------------------------------------------------------------------
(define-public diun-bin
  (package
    (name "diun-bin")
    (version "4.29.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/crazy-max/diun/releases/download/v" version "/diun_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("diun" "bin/diun"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/diun"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Docker image update notifier")
    (description "Diun (Docker Image Update Notifier) monitors Docker registries for
image updates and sends notifications.  It supports Docker Hub, GitHub
Container Registry, and private registries with multiple notification
backends including email, Slack, and Telegram.")
    (home-page "https://crazymax.dev/diun/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 89. colima-bin — container runtimes on Linux and macOS with minimal setup
;;; -------------------------------------------------------------------
(define-public colima-bin
  (package
    (name "colima-bin")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/abiosoft/colima/releases/download/v" version "/colima-Linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("colima" "bin/colima"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/colima"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "container runtimes on Linux and macOS with minimal setup")
    (description "Colima provides container runtimes with minimal setup.  It manages
container runtime environments using Lima VMs and supports Docker
and containerd backends with Kubernetes integration.")
    (home-page "https://github.com/abiosoft/colima")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 90. climan-bin — file-based HTTP API client for the command line
;;; -------------------------------------------------------------------
(define-public climan-bin
  (package
    (name "climan-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickgerace/climan/releases/download/v" version "/climan-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("climan" "bin/climan"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/climan"))
                          (libc (assoc-ref inputs "libc"))
                          (gcc-lib (assoc-ref inputs "gcc:lib"))
                          (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-join
                                  (list (string-append libc "/lib")
                                        (string-append gcc-lib "/lib"))
                                  ":")))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "file-based HTTP API client for the command line")
    (description "Climan is a file-based HTTP client for the command line.  It reads
HTTP request definitions from files and executes them, providing a
simple way to test and interact with REST APIs from the terminal.")
    (home-page "https://github.com/nickgerace/climan")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 91. atom-ng-bin — BLOCKED: SOURCE_UNAVAILABLE
;;; atom-ng release artifacts not found on GitHub; project may not publish Linux binaries; next: verify release page exists
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 92. adb-sync-git — file synchronization tool between PC and Android via ADB
;;; -------------------------------------------------------------------
(define-public adb-sync-git
  (package
    (name "adb-sync-git")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google/adb-sync")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/adb-sync-git/"))))
    (synopsis "file synchronization tool between PC and Android via ADB")
    (description "Adb-sync is a tool for synchronizing files between a PC and an
Android device using ADB (Android Debug Bridge).  It works similarly
to rsync but operates over an ADB connection for efficient file
transfer to and from Android devices.")
    (home-page "https://github.com/google/adb-sync")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 93. webfs — lightweight HTTP server for static content
;;; -------------------------------------------------------------------
(define-public webfs
  (package
    (name "webfs")
    (version "1.21")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://linux.bytesex.org/misc/webfs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight HTTP server for static content")
    (description "Webfs is a simple and lightweight HTTP server for serving mostly static
content.  It provides an instant web server with CGI support, virtual
hosting, and SSL/TLS for quickly sharing files over a local network.")
    (home-page "https://linux.bytesex.org/misc/webfs.html")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 94. swaysettings-git — BLOCKED: NEEDS_RECIPE_DESIGN
;;; Vala/Meson project requiring valac + libhandy/libadwaita; needs Vala compiler support verification in Guix; next: check if valac is available
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 95. leetmouse-driver-dkms — BLOCKED: NEEDS_RECIPE_DESIGN
;;; DKMS kernel module; same challenge as lenovolegionlinux-dkms-git; requires kernel headers build integration; next: study Guix kernel module patterns
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 96. cookc — BLOCKED: SOURCE_UNAVAILABLE
;;; GitHub repository not found at expected URL; AUR package source unclear; next: search for canonical source repository
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 97. python-pylzma — Python bindings for the LZMA compression library
;;; -------------------------------------------------------------------
(define-public python-pylzma
  (package
    (name "python-pylzma")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/p/pylzma/pylzma-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Python bindings for the LZMA compression library")
    (description "Pylzma provides platform-independent Python bindings for the LZMA
compression library.  It supports compression and decompression of
data using the LZMA algorithm, compatible with the 7-Zip archive
format.")
    (home-page "https://www.joachim-bauch.de/projects/pylzma/")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 98. spring-boot-cli — command-line interface for Spring Boot applications
;;; -------------------------------------------------------------------
(define-public spring-boot-cli
  (package
    (name "spring-boot-cli")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/" version "/spring-boot-cli-" version "-bin.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/spring-boot-cli/"))))
    (synopsis "command-line interface for Spring Boot applications")
    (description "Spring Boot CLI is a command-line tool for creating and running Spring
Boot applications.  It provides quick project scaffolding, dependency
management, and a Groovy-based scripting interface for rapid
prototyping with Spring.")
    (home-page "https://spring.io/projects/spring-boot")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 99. slack-term — Slack client for the terminal
;;; -------------------------------------------------------------------
(define-public slack-term
  (package
    (name "slack-term")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/erroneousboat/slack-term")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/erroneousboat/slack-term"
           #:install-source? #f))
    (synopsis "Slack client for the terminal")
    (description "Slack-term is a terminal-based client for Slack.  It provides a
text user interface for reading and sending messages, switching
channels, and managing Slack workspaces from the command line.")
    (home-page "https://github.com/erroneousboat/slack-term")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 100. shitpost — command-line tool for creating memes from text
;;; -------------------------------------------------------------------
(define-public shitpost
  (package
    (name "shitpost")
    (version "0.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mattgreen/shitpost")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:cargo-inputs '()
           #:cargo-development-inputs '()))
    (synopsis "command-line tool for creating memes from text")
    (description "Shitpost is a command-line tool for generating memes and image
macros.  It takes text input and overlays it onto images using
configurable fonts, positioning, and effects for quick meme
creation from the terminal.")
    (home-page "https://github.com/mattgreen/shitpost")
    (license license:expat)))
