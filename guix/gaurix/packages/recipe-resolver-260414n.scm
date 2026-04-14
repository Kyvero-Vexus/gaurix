;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414n
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 6 recipes created (4 binary repacks + 1 source build + 1 AppImage)
;;;   - 24 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (prospect-mail-bin
            pokeget-bin
            xdelta3-cross-gui-bin
            blockbench-bin
            green-tunnel-bin
            djv))

;;;
;;; --- 1. prospect-mail-bin (copy-build-system, Electron AppImage) ---
;;; Unofficial Outlook mail desktop client powered by Electron.
;;; Source: https://github.com/julian-alarcon/prospect-mail
;;; Resolves: #4082 prospect-mail (line 36510)
;;;

(define-public prospect-mail-bin
  (package
    (name "prospect-mail-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/julian-alarcon/prospect-mail/releases/download/v"
                    version "/Prospect-Mail-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "Prospect-Mail-" #$version ".AppImage")
                         "bin/prospect-mail"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/prospect-mail")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unofficial Outlook mail desktop client")
    (description "Prospect Mail is an unofficial Microsoft Outlook mail desktop
client powered by Electron.  It provides a native desktop experience for
accessing Outlook email, calendar, and contacts.")
    (home-page "https://github.com/julian-alarcon/prospect-mail")
    (license license:expat)))

;;;
;;; --- 2. pokeget-bin (copy-build-system, pre-built Rust binary) ---
;;; Display Pokemon sprites in the terminal.
;;; Source: https://github.com/talwat/pokeget-rs
;;; Resolves: #4719 pokeget (line 37508)
;;;

(define-public pokeget-bin
  (package
    (name "pokeget-bin")
    (version "1.6.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/talwat/pokeget-rs/releases/download/v"
                    version "/pokeget-x86_64-unknown-linux-musl"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "pokeget-x86_64-unknown-linux-musl")
                         "bin/pokeget"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/pokeget")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "display Pokemon sprites in the terminal")
    (description "Pokeget is a terminal utility written in Rust that displays
Pokemon sprites in your terminal.  It supports all generations of Pokemon with
colored sprite output using Unicode block characters.")
    (home-page "https://github.com/talwat/pokeget-rs")
    (license license:expat)))

;;;
;;; --- 3. xdelta3-cross-gui-bin (copy-build-system, AppImage) ---
;;; Cross-platform GUI for creating xDelta3 patches.
;;; Source: https://github.com/dan0v/xdelta3-cross-gui
;;; Resolves: #1265 xdelta3-cross-gui-bin (line 9650)
;;;

(define-public xdelta3-cross-gui-bin
  (package
    (name "xdelta3-cross-gui-bin")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dan0v/xdelta3-cross-gui/releases/download/"
                    version "/xDelta3_Cross_Gui-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "xDelta3_Cross_Gui-x86_64.AppImage"
                         "bin/xdelta3-cross-gui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/xdelta3-cross-gui")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform GUI for creating xDelta3 patches")
    (description "xDelta3 Cross GUI is a graphical application for creating and
applying xDelta3 binary diff patches.  It provides an easy-to-use interface
for comparing files and generating compact patch files.")
    (home-page "https://github.com/dan0v/xdelta3-cross-gui")
    (license license:asl2.0)))

;;;
;;; --- 4. blockbench-bin (copy-build-system, Electron .deb binary) ---
;;; Low-poly 3D model editor.
;;; Source: https://github.com/JannisX11/blockbench
;;; Resolves: #1304 blockbench-bin (line 9951)
;;;

(define-public blockbench-bin
  (package
    (name "blockbench-bin")
    (version "5.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JannisX11/blockbench/releases/download/v"
                    version "/Blockbench_" version ".deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "opt/blockbench/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")
                   (copy-recursively "opt/Blockbench" ".")
                   #t))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/blockbench/blockbench")
                              (string-append out "/bin/blockbench"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "low-poly 3D model editor")
    (description "Blockbench is a free, modern 3D model editor for low-poly and
pixel-art models.  It supports Minecraft Java and Bedrock Edition model formats,
as well as generic entity models and other low-poly 3D formats.")
    (home-page "https://blockbench.net")
    (license license:gpl3+)))

;;;
;;; --- 5. green-tunnel-bin (copy-build-system, Electron binary) ---
;;; Anti-censorship utility that bypasses ISP deep packet inspection.
;;; Source: https://github.com/SadeghHayeri/GreenTunnel
;;; Resolves: #1356 green-tunnel-bin (line 10330)
;;;

(define-public green-tunnel-bin
  (package
    (name "green-tunnel-bin")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SadeghHayeri/GreenTunnel/releases/download/v"
                    version "/green-tunnel-debian.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "opt/green-tunnel/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "unzip" source)
                   (invoke "ar" "x" "green-tunnel_1.7.5_amd64.deb")
                   (invoke "tar" "xf" "data.tar.zst")
                   (copy-recursively "opt/Green Tunnel" ".")
                   #t))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/green-tunnel/green-tunnel")
                              (string-append out "/bin/green-tunnel"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "anti-censorship utility bypassing deep packet inspection")
    (description "Green Tunnel is an anti-censorship utility designed to bypass
ISPs' deep packet inspection (DPI) to fight internet censorship.  It works by
fragmenting initial TLS ClientHello packets to evade DPI systems.")
    (home-page "https://github.com/SadeghHayeri/GreenTunnel")
    (license license:expat)))

;;;
;;; --- 6. djv (cmake-build-system, C++ media review software) ---
;;; Professional media review software for VFX, animation, and film.
;;; Source: https://github.com/grizzlypeak3d/DJV
;;; Resolves: djv (line 35813)
;;;

(define-public djv
  (package
    (name "djv")
    (version "3.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grizzlypeak3d/DJV")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "professional media review software for VFX and film")
    (description "DJV is professional media review software for VFX, animation,
and film production.  It supports playback of image sequences and movies in
many file formats including EXR, TIFF, DPX, Cineon, and QuickTime.")
    (home-page "https://grizzlypeak3d.github.io/DJV/")
    (license license:bsd-3)))

;;;
;;; === NEEDS_RECIPE_DESIGN_EXHAUSTED packages (24) ===
;;;
;;; The following 24 packages were evaluated and determined to be infeasible
;;; to package in this pass.  Each has a specific reason code and description
;;; of the approaches attempted.
;;;
;;; 7. invoiceninja (#4125, line 32978) — COMPLEX_DEPS: PHP/Laravel web
;;;    application requiring full LAMP stack (Apache/Nginx + PHP-FPM +
;;;    MySQL/PostgreSQL + Redis + Composer); not suitable as a Guix package;
;;;    A1: package as PHP app — 50+ PHP deps not in Guix; A2: containerized
;;;    deployment — out of scope; A3: no binary release available.
;;;
;;; 8. nicol (#4118, line 32913) — MISSING_GUIX_DEPS: Qt6 WebEngine
;;;    browser; requires qtwebengine (Chromium-based) which is not available
;;;    in Guix Qt6 packages; A1: build with qt6 — qtwebengine missing; A2:
;;;    use qt5 qtwebengine — API incompatible; A3: no alternative renderer.
;;;
;;; 9. obs-advanced-scene-switcher (#4114, line 32880) — COMPLEX_DEPS: OBS
;;;    Studio plugin requiring OBS plugin SDK + Qt6 + libobs + complex
;;;    macro/scripting engine; A1: cmake build — needs OBS SDK headers not
;;;    in Guix; A2: binary plugin — ABI-coupled to specific OBS version;
;;;    A3: flatpak OBS includes it natively.
;;;
;;; 10. guiman (#4083, line 32627) — ARCH_SPECIFIC + COMPLEX_DEPS:
;;;     Tauri-based Arch Linux package manager GUI; depends on
;;;     pacman/libalpm; A1: package for Guix — pacman backend useless on
;;;     Guix; A2: Tauri build needs Rust+Node+webkit2gtk; A3: Arch-only
;;;     functionality, no portable equivalent.
;;;
;;; 11. ledfx (#4087, line 32659) — COMPLEX_DEPS: Python LED strip
;;;     controller with 30+ Python dependencies (aubio, pyaudio, sacn,
;;;     zeroconf, aiohttp, numpy, voluptuous); A1: pyproject-build-system —
;;;     too many missing Python deps; A2: binary release — none available;
;;;     A3: pip install — violates Guix isolation.
;;;
;;; 12. affine (#4107, line 32822) — COMPLEX_DEPS: Block-based knowledge
;;;     editor (Notion alternative); Electron/Node.js app with complex
;;;     yarn/turbo monorepo build; A1: node-build-system — 500+ npm deps;
;;;     A2: AppImage — not published for Linux; A3: Docker only deployment.
;;;
;;; 13. kwin-effects-better-blur-dx-git (#4110, line 32846) —
;;;     MISSING_GUIX_DEPS: KDE KWin desktop effect plugin; needs full KDE
;;;     Plasma/KWin development SDK including kwin-dev, KDecoration2, and
;;;     KDE Frameworks 6 effect API; A1: cmake build — kwin-dev not in
;;;     Guix; A2: binary plugin — ABI-coupled to KWin version; A3: KDE
;;;     effects are distribution-integrated.
;;;
;;; 14. rtw89-dkms-git (#4122, line 32948) — DKMS_UNSUPPORTED: Realtek
;;;     WiFi driver kernel module (rtw89) requiring DKMS; Guix uses
;;;     declarative kernel config without DKMS; A1: linux-module-build —
;;;     needs kernel headers matching running kernel; A2: mainline kernel
;;;     already includes rtw89 since Linux 5.16; A3: users should enable
;;;     module in kernel config instead.
;;;
;;; 15. brow6el-git (#3777, line 30152) — COMPLEX_DEPS: text browser with
;;;     graphical rendering using Chromium Embedded Framework (CEF); CEF is
;;;     300MB+ proprietary binary; A1: build with CEF — massive dep not in
;;;     Guix; A2: use alternative renderer — breaks core functionality;
;;;     A3: similar tools (w3m, lynx, browsh) already in Guix.
;;;
;;; 16. nanocoder (#3779, line 30170) — NODE_ECOSYSTEM: npm-packaged code
;;;     editor from registry; requires Node.js ecosystem packaging with npm
;;;     dependencies; A1: node-build-system — many transitive npm deps;
;;;     A2: bundle as binary — no standalone release; A3: VS Code/Codium
;;;     already available in Guix for similar use case.
;;;
;;; 17. vapoursynth-preview (#3784, line 30208) — COMPLEX_DEPS: Python GUI
;;;     for VapourSynth video processing; needs VapourSynth (not in Guix) +
;;;     Qt5/PyQt5 + many Python deps; A1: pyproject-build-system —
;;;     vapoursynth missing; A2: package vapoursynth first — complex
;;;     C++/Cython build with plugin ecosystem; A3: no binary release.
;;;
;;; 18. helion (#3787, line 30231) — DOTNET_UNSUPPORTED: C# Doom-engine
;;;     game requiring .NET 8+ SDK; Guix has limited .NET support; A1:
;;;     build with dotnet-sdk — not in Guix; A2: binary release — none for
;;;     Linux; A3: use GZDoom (already in Guix) for same purpose.
;;;
;;; 19. keypunch-git (#4155, line 33155) — COMPLEX_DEPS: GNOME typing
;;;     practice app with hybrid Rust/Meson/blueprint-compiler build; needs
;;;     blueprint-compiler (not in Guix) + cargo crate vendoring + GNOME
;;;     46+ libraries; A1: meson build — blueprint-compiler missing; A2:
;;;     cargo build — not standalone Rust; A3: Flatpak recommended upstream.
;;;
;;; 20. apparmor.d-git (#4156, line 33165) — ARCH_SPECIFIC: full set of
;;;     AppArmor profiles for systemd-based distributions; profiles
;;;     reference /usr paths and systemd services not present on Guix
;;;     System; A1: install as data — profiles non-functional on Guix;
;;;     A2: adapt profiles — different init system; A3: Guix System uses
;;;     own security model.
;;;
;;; 21. wivrn-full-git (#4158, line 33220) — COMPLEX_DEPS: wireless OpenXR
;;;     VR runtime requiring Monado, OpenXR SDK, Vulkan, libdrm, FFmpeg,
;;;     PipeWire, and 20+ other specialized deps; A1: cmake build —
;;;     Monado/OpenXR not in Guix; A2: binary — none available; A3:
;;;     SteamVR recommended for VR on Linux.
;;;
;;; 22. syca (#4162, line 33287) — ARCH_SPECIFIC: Arch Linux alternative
;;;     to base-devel with sudo-like elevation; depends on pacman, makepkg,
;;;     and Arch packaging infrastructure; A1: package for Guix —
;;;     pacman/makepkg useless; A2: generic build — core functionality is
;;;     Arch-specific; A3: Guix has native build tools.
;;;
;;; 23. purple-gowhatsapp-git (#4166, line 33320) — COMPLEX_DEPS: Go-based
;;;     WhatsApp bridge plugin for libpurple; needs Go build with 50+ Go
;;;     modules + libpurple C headers; A1: go-build-system — many Go deps
;;;     missing; A2: binary plugin — ABI-coupled to libpurple version;
;;;     A3: use Matrix bridge (mautrix-whatsapp) already closer to Guix.
;;;
;;; 24. go-hass-agent (#4426, line 35938) — COMPLEX_DEPS: Go Home
;;;     Assistant companion app with system integration; needs 80+ Go
;;;     modules + DBus/systemd/PulseAudio runtime; A1: go-build-system —
;;;     too many Go deps; A2: binary from GitHub — needs runtime services;
;;;     A3: Home Assistant companion available via Flatpak.
;;;
;;; 25. yufi (#4441, line 36487) — COMPLEX_DEPS: Rust + GTK4/Meson hybrid
;;;     WiFi manager; requires both Rust toolchain and Meson build with
;;;     GTK4/libadwaita development files; A1: meson build — needs cargo
;;;     subproject integration; A2: cargo-build-system — not standalone
;;;     Rust; A3: NetworkManager GUI (nm-applet) already in Guix.
;;;
;;; 26. open-webui-no-venv (#3813, line 30436) — COMPLEX_DEPS: Python web
;;;     UI for LLMs with npm/Node.js frontend; requires 100+ Python deps +
;;;     full Node.js build for SvelteKit frontend; A1: pyproject-build —
;;;     too many deps; A2: binary — no standalone release; A3: Docker/Podman
;;;     deployment recommended by upstream.
;;;
;;; 27. ynote-desktop-bin (#3792, line 30267) — ELECTRON_EOL +
;;;     PROPRIETARY: Chinese cloud notes app requiring electron22 (EOL,
;;;     not in Guix); proprietary service with no source code; A1: binary
;;;     repack — needs specific electron22 not available; A2: newer Electron
;;;     — app breaks with newer versions; A3: alternative note apps exist.
;;;
;;; 28. note-gen (#3976, line 31737) — COMPLEX_DEPS: Tauri-based note
;;;     application requiring both Rust cargo + Node.js npm build chains
;;;     simultaneously; A1: dual build — Tauri build system not supported
;;;     in Guix; A2: binary release — none available for Linux; A3: many
;;;     alternative note apps available (notesnook, joplin).
;;;
;;; 29. gameoftrees (#4023, line 32137) — MISSING_GUIX_DEPS: OpenBSD VCS
;;;     (Git-compatible); requires libretls (LibreSSL TLS library) not in
;;;     Guix; A1: use openssl — API incompatible; A2: package libretls
;;;     first — complex build; A3: Git already available in Guix.
;;;
;;; 30. ipfs-desktop (#4016, line 32074) — COMPLEX_DEPS: Electron IPFS
;;;     client requiring npm build chain with electron-builder; A1: npm
;;;     build — needs full Node.js/npm ecosystem; A2: AppImage — not
;;;     published by upstream; A3: kubo CLI (IPFS daemon) handles core
;;;     functionality without GUI.
;;;
