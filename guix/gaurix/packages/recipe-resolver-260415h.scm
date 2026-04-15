;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415h
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 5 resolved with recipes; 25 re-evaluated with concrete exhaust reasons.
;;;
;;; Recipes (5 new):
;;;   1. proto-bin (copy, v0.56.1, pluggable multi-language version manager, MIT)
;;;   2. qbittorrent-enhanced-nox-bin (copy, v5.1.3.10, headless qBittorrent fork, GPL-2.0+)
;;;   3. qbittorrent-enhanced-bin (copy, v5.1.3.10, qBittorrent Enhanced AppImage, GPL-2.0+)
;;;   4. yacreader (gnu/qmake, v9.16.3, Qt comic reader with poppler, GPL-3.0+)
;;;   5. glaxnimate (cmake, v0.5.4, vector animation editor, GPL-3.0+)
;;;
;;; Exhausted (25):
;;;   - portage-manifest (#13162): Electron/npm + CC-BY-NC non-free license + Arch pacman deps
;;;   - simracing-essentials (#13185): no upstream repo; hardware-specific USB HID bundle
;;;   - scx-scheds-git (#13199): BPF toolchain + 50+ Rust crate deps + kernel 6.12+ config
;;;   - zephyr-sdk (#13214): 2+GB cross-compiler bundle for 12+ architectures; Guix handles
;;;     cross-compilation natively
;;;   - xmcl-launcher (#13223): Electron + 1000+ npm deps; no prebuilt Linux binary
;;;   - organicmaps (#13304): 100+ C++/Qt native deps with custom Boost extensions; mobile-first
;;;   - penpot (#13305): Clojure/ClojureScript multi-service (backend+frontend+exporter);
;;;     leiningen + shadow-cljs + PostgreSQL + Redis
;;;   - penpot-exporter (#13306): depends on penpot backend (blocked); requires Playwright/Chromium
;;;   - collabora-office (#13314): 10M+ LOC LibreOffice fork + WebSocket server + Qt6 wrapper
;;;   - rust-aarch64-musl-git (#13316): GUIX_NATIVE_CROSS: Guix handles cross-compilation
;;;     natively via --target; Arch-specific rustup wrapper unnecessary
;;;   - rust-aarch64-gnu-git (#13317): GUIX_NATIVE_CROSS: same as rust-aarch64-musl-git
;;;   - lib32-rust-libs-git (#13318): MULTILIB_UNSUPPORTED: Guix uses separate i686-linux builds
;;;   - sulis-git (#13328): 100+ Rust crate deps + custom OpenGL engine + embedded game assets
;;;   - optimus-manager-git (#13329): requires proprietary NVIDIA drivers; 20+ hardcoded /usr
;;;     paths; X11-only; systemd→Shepherd conversion needed
;;;   - linuxcnc (#4651): requires Preempt-RT kernel patches; CNC hardware integration;
;;;     tcl/tk/Python GUI not portable to Guix kernel model
;;;   - arduino (#4657): 8+ source archives; Java+Electron+Processing toolchain;
;;;     AVR cross-compilation needs specialized handling
;;;   - cosmic-session-git (#4661): needs entire COSMIC desktop ecosystem (cosmic-comp,
;;;     cosmic-panel, cosmic-applets, iced toolkit) — none in Guix
;;;   - azahar-git (#11776): Nintendo 3DS emulator fork; 100+ deps with Vulkan, Qt6,
;;;     SPIRV-Tools; git submodules management required
;;;   - noctalia-shell-git (#4638): depends on Quickshell runtime not available in Guix
;;;   - loliashizuku-git (#3479): Wails framework (Go+WebKit) + Bun JS runtime; neither in Guix
;;;   - pwmenu-git (#3489): Rust PipeWire audio menu; 30+ crate deps with PipeWire bindings
;;;     not enumerated; no binary releases
;;;   - equicord-openasar (#4590): Electron Discord fork with pnpm/nvm/asar toolchain;
;;;     Electron infrastructure absent from Guix
;;;   - linux-libre-hardened (#7202): custom kernel variant; Guix has own kernel packaging model
;;;     with linux-libre; hardened patches need integration into Guix kernel infrastructure
;;;   - karukan (#11921): neural kana-kanji conversion engine; requires downloading model
;;;     weights at build time; fcitx5 integration with neural backend
;;;   - proto (#10247 source build): 300+ Rust crate deps in workspace; binary provided instead
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages video)
  #:export (
            proto-bin
            qbittorrent-enhanced-nox-bin
            qbittorrent-enhanced-bin
            yacreader
            glaxnimate
            ))

;;;
;;; --- 1. proto-bin ---
;;; Pluggable multi-language version manager.
;;; Manages Node, Deno, Rust, Go, Python, Bun, and more.
;;; Pre-built x86_64 Linux binary from GitHub releases.
;;; Upstream: https://github.com/moonrepo/proto
;;;

(define-public proto-bin
  (package
    (name "proto-bin")
    (version "0.56.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/moonrepo/proto/releases/download/v"
                    version "/proto_cli-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "1iq3x14nm41dca7n759yph50j89i7rp3x47pzv06wjy35hswvwcm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("proto" "bin/proto")
          ("proto-shim" "bin/proto-shim"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname
                                    (search-input-file inputs
                                                       "lib/ld-linux-x86-64.so.2"))
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (for-each (lambda (bin)
                            (let ((path (string-append out "/bin/" bin)))
                              (when (file-exists? path)
                                (invoke "patchelf" "--set-interpreter" ld-so path)
                                (invoke "patchelf" "--set-rpath" rpath path))))
                          '("proto" "proto-shim"))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "pluggable multi-language version manager")
    (description
     "Proto is a pluggable version manager for programming languages and
tools such as Node.js, Deno, Rust, Go, Python, and Bun.  It provides
a unified interface for installing, managing, and switching between
multiple versions of development toolchains.  This package provides
the pre-built binary release.")
    (home-page "https://github.com/moonrepo/proto")
    (license license:expat)))

;;;
;;; --- 2. qbittorrent-enhanced-nox-bin ---
;;; Headless (daemon) variant of qBittorrent Enhanced Edition.
;;; Pre-built static musl binary.
;;; Upstream: https://github.com/c0re100/qBittorrent-Enhanced-Edition
;;;

(define-public qbittorrent-enhanced-nox-bin
  (package
    (name "qbittorrent-enhanced-nox-bin")
    (version "5.1.3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/c0re100/qBittorrent-Enhanced-Edition/"
                    "releases/download/release-" version
                    "/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"))
              (sha256
               (base32
                "0qzlbhw1yjx9a0377g4mbci19gb4sydhg6ah3yn3xdcq0808p3b6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("qbittorrent-nox" "bin/qbittorrent-enhanced-nox"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" source)
              (chmod "qbittorrent-nox" #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "headless BitTorrent client with enhanced features")
    (description
     "qBittorrent Enhanced Edition is a fork of qBittorrent with additional
features including auto-banning of known bad peers (Xunlei, QQ, BitComet
leechers), peer ID and client name spoofing detection, and enhanced
privacy controls.  This headless (nox) variant runs as a daemon with
a web interface.  This package provides the pre-built static binary.")
    (home-page "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (license license:gpl2+)))

;;;
;;; --- 3. qbittorrent-enhanced-bin ---
;;; GUI variant of qBittorrent Enhanced Edition.
;;; AppImage from GitHub releases.
;;; Upstream: https://github.com/c0re100/qBittorrent-Enhanced-Edition
;;;

(define-public qbittorrent-enhanced-bin
  (package
    (name "qbittorrent-enhanced-bin")
    (version "5.1.3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/c0re100/qBittorrent-Enhanced-Edition/"
                    "releases/download/release-" version
                    "/qBittorrent-Enhanced-Edition-x86_64.AppImage"))
              (sha256
               (base32
                "0dsqnaidbh0imj05a6lv6jgf807d6i7nvpfy3cjk136fhar43zr9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("qbittorrent-enhanced.AppImage" "bin/qbittorrent-enhanced"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "qbittorrent-enhanced.AppImage")
              (chmod "qbittorrent-enhanced.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "BitTorrent client with enhanced privacy and peer filtering")
    (description
     "qBittorrent Enhanced Edition is a fork of qBittorrent with additional
features including auto-banning of known bad peers (Xunlei, QQ, BitComet
leechers), peer ID and client name spoofing detection, and enhanced
privacy controls.  This GUI variant provides the full desktop experience
with Qt interface.  This package provides the pre-built AppImage.")
    (home-page "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (license license:gpl2+)))

;;;
;;; --- 4. yacreader ---
;;; Comic book reader and library manager.
;;; Qt5 source build using qmake.
;;; Upstream: https://github.com/YACReader/yacreader
;;;

(define-public yacreader
  (package
    (name "yacreader")
    (version "9.16.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/YACReader/yacreader/releases/download/"
                    version "/yacreader-" version "-src.tar.xz"))
              (sha256
               (base32
                "08msppak2p6vvc1ls9f382mfh3n88snkdkdibzaqbz36pg6fkw27"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (invoke "qmake"
                        (string-append "PREFIX=" out)
                        "CONFIG+=unarr"
                        "CONFIG+=poppler"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (invoke "make"
                        (string-append "INSTALL_ROOT=" out)
                        "install")))))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list poppler
           qtbase-5
           qtdeclarative-5
           qtmultimedia-5
           qtsvg-5))
    (synopsis "comic book reader and library manager")
    (description
     "YACReader is a comic book reader and comic library manager for reading
CBR, CBZ, CB7, PDF, and image-based comics.  It provides a clean reading
interface, library management with metadata support, bookmarks, and reading
lists.  The poppler backend enables native PDF rendering.")
    (home-page "https://github.com/YACReader/yacreader")
    (license license:gpl3+)))

;;;
;;; --- 5. glaxnimate ---
;;; Simple vector animation editor with Lottie support.
;;; CMake source build with Qt5.
;;; Upstream: https://gitlab.com/mattbas/glaxnimate
;;;

(define-public glaxnimate
  (package
    (name "glaxnimate")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/mattbas/glaxnimate/-/archive/"
                    version "/glaxnimate-" version ".tar.gz"))
              (sha256
               (base32
                "19c6hsycz55z6kwf8a638yr9ryd87zjglkxyji5r3z6zcf1vnsas"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f                         ;tests need Qt test infrastructure
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs
     (list pkg-config python-3))
    (inputs
     (list potrace
           qtbase-5
           qtsvg-5))
    (synopsis "simple vector graphics animation editor")
    (description
     "Glaxnimate is a vector graphics animation editor focused on Lottie
and SVG animations.  It provides an intuitive timeline-based interface
for creating and editing motion graphics, shape animations, and
path-based effects.  Animations can be exported to Lottie JSON, SVG,
GIF, and video formats.")
    (home-page "https://gitlab.com/mattbas/glaxnimate")
    (license license:gpl3+)))
