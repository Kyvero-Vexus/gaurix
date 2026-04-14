;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414o
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 5 recipes created (3 binary repacks + 1 AppImage + 1 .deb repack)
;;;   - 25 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages recipe-resolver-260414o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (telepresence2-bin
            sysd-manager-bin
            typhoon
            collapseloader-bin
            discord-rpc-wine))

;;;
;;; --- 1. telepresence2-bin (copy-build-system, pre-built Go binary) ---
;;; Local development against Kubernetes/OpenShift clusters.
;;; Source: https://github.com/telepresenceio/telepresence
;;; Resolves: #4196 telepresence2 (line 33557)
;;;

(define-public telepresence2-bin
  (package
    (name "telepresence2-bin")
    (version "2.27.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/telepresenceio/telepresence"
                    "/releases/download/v" version
                    "/telepresence-linux-amd64"))
              (sha256
               (base32
                "0l9z6qf4rqfhsy3zq5swb3gphjcm651kykkdla2clpvfia2v9sbw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "telepresence-linux-amd64"
                         "bin/telepresence"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/telepresence")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "local development against Kubernetes clusters")
    (description "Telepresence is a tool for fast, local development of
Kubernetes and OpenShift microservices.  It lets you run a service locally
while connecting it to a remote Kubernetes cluster, enabling rapid
iteration without slow container build and push cycles.")
    (home-page "https://www.telepresence.io")
    (license license:asl2.0)))

;;;
;;; --- 2. sysd-manager-bin (copy-build-system, GTK4 AppImage) ---
;;; Systemd GUI manager for services, timers, sockets, and other units.
;;; Source: https://github.com/plrigaux/sysd-manager
;;; Resolves: #11702 sysd-manager (line 86195)
;;;

(define-public sysd-manager-bin
  (package
    (name "sysd-manager-bin")
    (version "2.17.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/plrigaux/sysd-manager"
                    "/releases/download/" version
                    "/SysDManager-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "09wpba0ynxvffwlv7id2p4krrl9wnf87r2vpfp7rp9w8psfm19m9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "SysDManager-" #$version
                                        "-x86_64.AppImage")
                         "bin/sysd-manager"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/sysd-manager")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical systemd unit manager")
    (description "SysD Manager is a GTK4 application for managing systemd
services, timers, sockets, and other units.  It provides a graphical
interface for starting, stopping, enabling, and disabling units, and
viewing their logs and properties.")
    (home-page "https://github.com/plrigaux/sysd-manager")
    (license license:gpl3+)))

;;;
;;; --- 3. typhoon (copy-build-system, Python .deb repack) ---
;;; Stylish weather application with animated backgrounds.
;;; Source: https://github.com/archisman-panigrahi/typhoon
;;; Resolves: #4336 typhoon (line 34613)
;;;

(define-public typhoon
  (package
    (name "typhoon")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/archisman-panigrahi/typhoon"
                    "/releases/download/v" version
                    "/typhoon_" version "_all.deb"))
              (sha256
               (base32
                "05wyj5131wbp2kzbs8jcg1dgciw5b0xxdkc3xyimgv2j6x8ld35n"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "usr/share" "share")
                   (list "usr/bin" "bin")
                   (list "usr/lib" "lib"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (synopsis "stylish weather application")
    (description "Typhoon is a weather application that displays current
conditions and forecasts with stylish animated backgrounds.  It provides
an intuitive interface for viewing weather data from various locations.")
    (home-page "https://github.com/archisman-panigrahi/typhoon")
    (license license:gpl3+)))

;;;
;;; --- 4. collapseloader-bin (copy-build-system, Tauri AppImage) ---
;;; GUI utility for launching Minecraft clients.
;;; Source: https://github.com/dest4590/CollapseLoader
;;; Resolves: #7591 collapseloader-git (line 58449)
;;; Note: Project is archived/LTS as of v9.9.9.
;;;

(define-public collapseloader-bin
  (package
    (name "collapseloader-bin")
    (version "9.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dest4590/CollapseLoader"
                    "/releases/download/" version
                    "/CollapseLoader_" version "_amd64.AppImage"))
              (sha256
               (base32
                "1h2yv2aiqlkiylfdm1xa4a21z6jbh8z178yvxvr70g1f5sy1il1q"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "CollapseLoader_" #$version
                                        "_amd64.AppImage")
                         "bin/collapseloader"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/collapseloader")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GUI launcher for Minecraft clients")
    (description "CollapseLoader is a graphical utility for launching
Minecraft clients, built with Rust and Tauri.  It provides a clean
interface for managing and launching different Minecraft client
installations.")
    (home-page "https://github.com/dest4590/CollapseLoader")
    (license license:gpl3)))

;;;
;;; --- 5. discord-rpc-wine (copy-build-system, pre-built C++ library) ---
;;; Discord Rich Presence bridge for Wine games.
;;; Source: https://github.com/mellowagain/rpc-wine
;;; Resolves: #10737 discord-rpc-wine-git (line 78917)
;;;

(define-public discord-rpc-wine
  (package
    (name "discord-rpc-wine")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mellowagain/rpc-wine"
                    "/releases/download/" version
                    "/rpc-wine.tar.gz"))
              (sha256
               (base32
                "01swcn18dlv7mvrvffphw5k41p66sr49gbir856662gppjd7rf8f"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "discord-ipc-0.dll" "lib/wine/discord-ipc-0.dll"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Discord Rich Presence implementation for Wine")
    (description "Discord RPC Wine is a bridge that allows Wine games to
interact with the native Discord client for Rich Presence.  It implements
the Discord IPC protocol as a Wine DLL, enabling games running under Wine
to display their status in Discord.")
    (home-page "https://github.com/mellowagain/rpc-wine")
    (license license:expat)))

;;;
;;; === NEEDS_RECIPE_DESIGN_EXHAUSTED packages (25) ===
;;;
;;; The following 25 packages were evaluated and determined to be infeasible
;;; to package in this pass.  Each has a specific reason code and description
;;; of the approaches attempted.
;;;
;;; 6. syncthingtray (#29, line 234) — COMPLEX_DEPS: Qt5/6 Syncthing tray
;;;    app; needs c++utilities, qtutilities, qtforkawesome (3 custom libs by
;;;    Martchus, none in Guix); A1: package 3 deps first — significant scope,
;;;    each needs custom CMake build; A2: bundled build — not supported
;;;    upstream; A3: use syncthing CLI + syncthing-gtk (already in Guix).
;;;
;;; 7. rstudio-desktop (#3437, line 27258) — COMPLEX_BUILD: R IDE requiring
;;;    C++/Java/Qt hybrid build with 50+ bundled dependencies (Boost, pandoc,
;;;    Hunspell, mathjax, etc.); A1: cmake build — needs java-environment=17
;;;    + ant + custom GWT compile; A2: binary .deb — not redistributable per
;;;    AGPL without full source build; A3: use R + Emacs/ESS instead.
;;;
;;; 8. archforge-git (#3696, line 29464) — ARCH_SPECIFIC: AI-powered TUI for
;;;    PKGBUILD generation and AUR management; Rust tool that depends on
;;;    pacman/AUR infrastructure; A1: cargo build — functional but useless on
;;;    Guix (no PKGBUILDs); A2: adapt for Guix — complete rewrite; A3: no
;;;    portable equivalent exists.
;;;
;;; 9. openclaw-git (#3955, line 31546) — NPM_COMPLEX: personal AI assistant
;;;    requiring Bun + pnpm + Node.js 22+ build toolchain; A1: node-build-
;;;    system — Bun runtime not in Guix; A2: npm-only build — pnpm workspace
;;;    management required; A3: no binary releases available.
;;;
;;; 10. zen-browser-git (#4438, line 35385) — BROWSER_SCALE: Firefox-based
;;;     browser requiring full Mozilla build system (31 runtime + 25 build
;;;     deps including llvm, clang, rust, nodejs, wasi-*); A1: mach build —
;;;     needs wasi-compiler-rt/wasi-libc not in Guix; A2: binary — available
;;;     via Flatpak; A3: Firefox/IceCat already in Guix.
;;;
;;; 11. jivexdv-bin (#4568, line 36368) — WINDOWS_ONLY: JiveX DICOM Viewer
;;;     binary; AUR PKGBUILD downloads Windows .exe installer (SETUP_JiveXdv
;;;     .exe); no native Linux binary exists; A1: wine wrapper — medical
;;;     imaging viewer needs native performance; A2: source build — no source
;;;     available (proprietary); A3: use weasis or dicompyler instead.
;;;
;;; 12. winscp (#4680, line 37205) — WINE_WRAPPER: WinSCP Windows SFTP
;;;     client wrapped with Wine; A1: wine binary — works but fragile,
;;;     Wine version-dependent; A2: native build — Delphi/C++ source needs
;;;     Free Pascal not in Guix; A3: use filezilla, lftp, or sftp CLI
;;;     (all already in Guix).
;;;
;;; 13. unofficial-homestuck-collection (#6820, line 52864) — ELECTRON_
;;;     COMPLEX: Electron webcomic reader with yarn build and complex
;;;     licensing (GPL-3.0 + Chrome + Electron licenses); A1: node-build-
;;;     system — electron + yarn ecosystem deps; A2: AppImage — not
;;;     published; A3: web browser sufficient for webcomic reading.
;;;
;;; 14. python-tensorrt (#7026, line 54398) — PROPRIETARY_CUDA: NVIDIA
;;;     TensorRT Python bindings requiring CUDA toolkit + cuDNN (proprietary);
;;;     A1: cmake build — needs proprietary CUDA/cuDNN not in Guix; A2:
;;;     pip wheel — ships proprietary .so files; A3: use python-onnxruntime
;;;     as open-source alternative.
;;;
;;; 15. sle-suite-pro-git (#7198, line 55655) — PYSIDE6_MISSING: SLE card
;;;     tool requiring PySide6 (Qt6 Python bindings) not packaged in Guix;
;;;     A1: pyproject build — PySide6 missing; A2: package PySide6 first —
;;;     massive C++/Qt6/shiboken build; A3: python-pyscard alone insufficient.
;;;
;;; 16. riseup-vpn (#7252, line 56066) — COMPLEX_BUILD: privacy VPN client
;;;     requiring Go + Qt6 + CMake hybrid build; A1: cmake build — Go
;;;     modules + Qt6 QML integration; A2: binary — Riseup distributes via
;;;     Snap/Flatpak only; A3: openvpn CLI (in Guix) with manual config.
;;;
;;; 17. winboat (#7376, line 56924) — COMPLEX_BUILD: Windows-on-Linux tool
;;;     requiring Go + Node.js dual ecosystem build with FreeRDP and GTK3
;;;     integration; A1: go build — npm frontend needed; A2: binary — no
;;;     pre-built available; A3: use bottles or lutris for Windows app
;;;     management.
;;;
;;; 18. hyprsettings-git (#7440, line 57436) — MISSING_GUIX_DEPS: Hyprland
;;;     configurator requiring python-pywebview (not in Guix) + webkit2gtk
;;;     4.1 integration + python-flask web backend; A1: pyproject build —
;;;     pywebview missing; A2: package pywebview — needs webkit2gtk-4.1
;;;     bindings; A3: edit hyprland.conf directly.
;;;
;;; 19. karp-git (#7521, line 58031) — KDE6_MISSING: KDE PDF editor
;;;     requiring Kirigami + kirigami-addons + KDE Frameworks 6 (KF6)
;;;     modules not in Guix; A1: cmake build — extra-cmake-modules for
;;;     KF6 missing; A2: binary from KDE Neon — ABI mismatch; A3: use
;;;     okular or qpdfview (in Guix).
;;;
;;; 20. waveloggate-git (#7637, line 58725) — ELECTRON_MISSING: amateur
;;;     radio CAT/WSJT-X bridge requiring Electron + npm build chain; Guix
;;;     lacks Electron packaging infrastructure; A1: npm build — Electron
;;;     framework missing; A2: binary — none published; A3: niche ham
;;;     radio tool with no CLI alternative.
;;;
;;; 21. hyprlauncher-git (#7694, line 59104) — HYPRLAND_ECOSYSTEM: Hyprland
;;;     launcher requiring 5+ unreleased -git libraries (hyprlang-git,
;;;     hyprtoolkit-git, hyprutils-git, hyprwire-git); A1: cmake build —
;;;     all -git deps missing from Guix; A2: pin stable versions — no
;;;     stable releases yet; A3: use rofi/wofi with Hyprland instead.
;;;
;;; 22. audacious-plugins-gtk3 (#7758, line 59516) — VARIANT_REBUILD:
;;;     GTK3-specific variant of Audacious plugins; Guix ships audacious
;;;     4.4.2 (Qt variant); building GTK3 variant needs separate audacious-
;;;     gtk3 base package + 30+ codec library inputs; A1: meson build —
;;;     needs separate audacious-gtk3; A2: configure flag — audacious in
;;;     Guix is Qt-only; A3: use existing audacious (Qt) in Guix.
;;;
;;; 23. gx52 (#10061, line 74463) — MISSING_GUIX_DEPS: Logitech X52
;;;     HOTAS controller app requiring python-usb, python-injector, and
;;;     python-xlib (not all available in Guix); A1: meson build — python-
;;;     injector missing; A2: package python-injector — deep dep chain;
;;;     A3: use evdev/udev rules directly for basic joystick control.
;;;
;;; 24. openhv (#10286, line 76043) — DOTNET_MISSING: open-source RTS game
;;;     requiring .NET SDK 6.0 runtime; Guix has no .NET build system; A1:
;;;     dotnet build — SDK not in Guix; A2: binary — upstream distributes
;;;     via Flatpak/AppImage with bundled runtime; A3: no Flatpak-less
;;;     binary for extraction.
;;;
;;; 25. phonon-qt6-mpv-git (#10968, line 80533) — PHONON_QT6_MISSING:
;;;     Phonon MPV backend requiring phonon-qt6 (not in Guix; only
;;;     phonon for Qt5 exists); A1: cmake build — phonon-qt6 headers
;;;     missing; A2: package phonon-qt6 — needs full Qt6 multimedia
;;;     stack; A3: use qt6-multimedia directly for audio/video.
;;;
;;; 26. spacefm-thermitegod (#11093, line 81383) — FORK_DIVERGED: SpaceFM
;;;     fork (C++20 rewrite by thermitegod) diverged significantly from
;;;     Guix's spacefm 1.0.6; A1: meson build — needs ztd::logger,
;;;     ztd::out (custom deps by same author, not in Guix); A2: package
;;;     ztd first — custom C++20 utility library; A3: use existing spacefm
;;;     or thunar in Guix.
;;;
;;; 27. code-translucent (#11283, line 82711) — ELECTRON_COMPLEX: VS Code
;;;     fork with translucent window patches; requires full VS Code build
;;;     (TypeScript/npm/pnpm with 500+ deps); A1: node-build-system — too
;;;     many npm deps; A2: binary .deb — proprietary marketplace integration;
;;;     A3: use visual-studio-code-bin or codium in Gaurix.
;;;
;;; 28. wivrn-dashboard (#11521, line 84649) — VR_STACK_MISSING: wireless
;;;     OpenXR VR runtime dashboard requiring Monado, OpenXR SDK, Vulkan,
;;;     KDE Frameworks 6, and wivrn-server; A1: cmake build — Monado +
;;;     OpenXR + KF6 all missing; A2: binary — Flatpak only; A3: SteamVR
;;;     for Linux VR.
;;;
;;; 29. plasma-login-manager-git (#11631, line 85569) — KDE6_SYSTEM: core
;;;     KDE Plasma 6 display manager (SDDM fork) requiring full Plasma 6
;;;     stack (kpackage, layer-shell-qt, libplasma, kio, etc.); A1: cmake
;;;     build — 15+ KDE6 deps missing; A2: binary — system service, must
;;;     match host KDE version; A3: use sddm or greetd in Guix.
;;;
;;; 30. kanidm (#11836, line 87180) — CARGO_DEPS_NEEDED: identity management
;;;     system with 300+ Rust crate dependencies + wasm-pack frontend build
;;;     + TPM2 system integration; A1: cargo build — 300+ crates to package;
;;;     A2: binary — not published by upstream; A3: use keycloak or FreeIPA
;;;     for identity management.
;;;
