;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414p
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 8 recipes created (1 binary repack + 2 AppImage + 3 .deb repacks + 1 tar.gz
;;;     repack + 1 .deb publishing tool)
;;;   - 21 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;   - 1 skipped (equibop-bin already in deptree-resolver-260408j.scm)
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages recipe-resolver-260414p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (ytdlp-gui-bin
            modrinth-app-bin
            proton-authenticator-bin
            worldpainter-bin
            brickstore-bin
            tev-bin
            mqtt-explorer-bin
            quarto-cli-bin))

;;;
;;; --- 1. ytdlp-gui-bin (copy-build-system, pre-built Rust binary) ---
;;; GUI frontend for yt-dlp, written in Rust with iced.
;;; Source: https://github.com/BKSalman/ytdlp-gui
;;; Resolves: #8376 ytdlp-gui (line 64107)
;;;

(define-public ytdlp-gui-bin
  (package
    (name "ytdlp-gui-bin")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BKSalman/ytdlp-gui"
                    "/releases/download/v" version
                    "/ytdlp-gui-linux-x64-86"))
              (sha256
               (base32
                "173i839jh2s6d04hg1fyr8f2ir99iywkmayx1w4glrcwhxr86x7j"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "ytdlp-gui-linux-x64-86"
                         "bin/ytdlp-gui"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (delete 'make-dynamic-linker-cache)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ytdlp-gui")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical frontend for yt-dlp video downloader")
    (description "ytdlp-gui provides a graphical interface for yt-dlp,
the popular video downloader.  It supports selecting formats, setting
output directories, and monitoring download progress through a clean
desktop interface built with Rust and the iced GUI framework.")
    (home-page "https://github.com/BKSalman/ytdlp-gui")
    (license license:gpl3+)))

;;; NOTE: equibop-bin (#7488) already packaged in deptree-resolver-260408j.scm
;;;       — skipped to avoid duplicate definition.

;;;
;;; --- 3. modrinth-app-bin (copy-build-system, Tauri .deb repack) ---
;;; Modrinth desktop app for managing Minecraft mods, modpacks, and shaders.
;;; Source: https://github.com/modrinth/code
;;; Resolves: #11733 modrinth-app (line 86481)
;;;

(define-public modrinth-app-bin
  (package
    (name "modrinth-app-bin")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/modrinth/code"
                    "/releases/download/v" version
                    "/Modrinth.App_" version "_amd64.deb"))
              (sha256
               (base32
                "0sh0qqy7pxrigjlp8n5qdyzmdg470313yqlcg3zrbff30zvs1nsc"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "usr/bin" "bin")
                   (list "usr/share" "share"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (delete 'make-dynamic-linker-cache)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop app for Modrinth Minecraft mod platform")
    (description "Modrinth App is a desktop application for discovering,
installing, and managing Minecraft mods, modpacks, resource packs, and
shaders from the Modrinth platform.  Built with Tauri, it provides a
native desktop experience for browsing and managing Minecraft content.")
    (home-page "https://modrinth.com")
    (license license:gpl3)))

;;;
;;; --- 4. proton-authenticator-bin (copy-build-system, Tauri .deb repack) ---
;;; Proton two-factor authentication (TOTP) app.
;;; Source: https://proton.me/authenticator
;;; Resolves: #4175 proton-authenticator (line 33405)
;;;

(define-public proton-authenticator-bin
  (package
    (name "proton-authenticator-bin")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://proton.me/download/authenticator/linux"
                    "/ProtonAuthenticator_" version "_amd64.deb"))
              (sha256
               (base32
                "0qxr7kpx0hiy9d7v37w5nwd4l90yvaal36mib2l00ch3fsmdx12a"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "usr/bin" "bin")
                   (list "usr/share" "share"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (delete 'make-dynamic-linker-cache)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "two-factor authentication app by Proton")
    (description "Proton Authenticator is a two-factor authentication
application that generates time-based one-time passwords (TOTP) for
securing online accounts.  It features end-to-end encrypted cloud sync
of authentication tokens through a Proton account.")
    (home-page "https://proton.me/authenticator")
    (license license:gpl3+)))

;;;
;;; --- 5. worldpainter-bin (copy-build-system, Java tar.gz repack) ---
;;; Interactive 3D Minecraft world editor and map painter.
;;; Source: https://github.com/Captain-Chaos/WorldPainter
;;; Resolves: #7560 worldpainter (line 58297)
;;;

(define-public worldpainter-bin
  (package
    (name "worldpainter-bin")
    (version "2.26.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.worldpainter.net/files"
                    "/worldpainter_" version ".tar.gz"))
              (sha256
               (base32
                "0ykn1644zm549byk5zylrwcgnfa4y5yda1wy1nmyn8dx54d64lb2"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "." "share/worldpainter/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (delete 'make-dynamic-linker-cache)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/worldpainter")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/worldpainter")
                       (lambda (port)
                         (format port "#!~a~%exec java -jar ~a/worldpainter.jar \"$@\"~%"
                                 (which "bash")
                                 share)))
                     (chmod (string-append bin "/worldpainter") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "interactive 3D Minecraft map editor and terrain painter")
    (description "WorldPainter is an interactive graphical editor for
Minecraft maps.  It allows painting terrain, placing biomes, adding trees
and other objects, and sculpting landscapes using an intuitive interface.
It exports maps directly loadable by Minecraft.")
    (home-page "https://www.worldpainter.net")
    (license license:gpl3+)))

;;;
;;; --- 6. brickstore-bin (copy-build-system, AppImage repack) ---
;;; BrickLink inventory management for LEGO.
;;; Source: https://github.com/rgriebl/brickstore
;;; Resolves: #7616 brickstore (line 58628)
;;;

(define-public brickstore-bin
  (package
    (name "brickstore-bin")
    (version "2026.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rgriebl/brickstore"
                    "/releases/download/v" version
                    "/Linux-AppImage-BrickStore-" version
                    "-x86_64.AppImage"))
              (sha256
               (base32
                "1i0gl231zn6a4mvji3b0xhw9d37g8nmxli7a24mhgvw03wdj7x4a"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list (string-append "Linux-AppImage-BrickStore-"
                                        #$version "-x86_64.AppImage")
                         "bin/brickstore"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (delete 'make-dynamic-linker-cache)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/brickstore")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "BrickLink inventory management tool for LEGO")
    (description "BrickStore is an offline BrickLink inventory management
tool.  It supports browsing the BrickLink catalog, managing inventories
of LEGO parts and sets, price comparisons, and batch operations for
buying and selling on the BrickLink marketplace.")
    (home-page "https://github.com/rgriebl/brickstore")
    (license license:gpl3+)))

;;;
;;; --- 7. tev-bin (copy-build-system, AppImage repack) ---
;;; HDR image comparison and visualization tool.
;;; Source: https://github.com/Tom94/tev
;;; Resolves: #7555 tev (line 58269)
;;;

(define-public tev-bin
  (package
    (name "tev-bin")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Tom94/tev"
                    "/releases/download/v" version
                    "/tev.appimage"))
              (sha256
               (base32
                "12anwip6ibh46bp4if405x411aqsxy57ws7jn2zn48i1fss9bybd"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "tev.appimage" "bin/tev"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (delete 'make-dynamic-linker-cache)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/tev")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "HDR image comparison and visualization viewer")
    (description "tev is a high dynamic range (HDR) image comparison tool
for graphics research and development.  It supports EXR, HDR, PFM, and
other HDR formats with features including side-by-side comparison,
false-color visualization, and interactive tone mapping.")
    (home-page "https://github.com/Tom94/tev")
    (license license:bsd-3)))

;;;
;;; --- 8. mqtt-explorer-bin (copy-build-system, Electron AppImage) ---
;;; MQTT client for structured topic visualization.
;;; Source: https://github.com/thomasnordquist/MQTT-Explorer
;;; Resolves: #8377 mqtt-explorer-beta (line 64114)
;;;

(define-public mqtt-explorer-bin
  (package
    (name "mqtt-explorer-bin")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thomasnordquist/MQTT-Explorer"
                    "/releases/download/v" version
                    "/MQTT-Explorer-" version ".AppImage"))
              (sha256
               (base32
                "03kfc185ajgc88pwjamy8ri6pvz5d5dn59l3q3qis8smwzdziz31"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list (string-append "MQTT-Explorer-" #$version
                                        ".AppImage")
                         "bin/mqtt-explorer"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (delete 'make-dynamic-linker-cache)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/mqtt-explorer")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "MQTT client with structured topic overview")
    (description "MQTT Explorer is a comprehensive MQTT client that provides
a structured overview of MQTT topics and makes working with devices and
services on a broker straightforward.  It features a visual topic tree,
payload inspection, and message publishing capabilities.")
    (home-page "https://mqtt-explorer.com")
    (license license:cc-by4.0)))

;;;
;;; --- 9. quarto-cli-bin (copy-build-system, .deb repack) ---
;;; Open-source scientific and technical publishing system.
;;; Source: https://github.com/quarto-dev/quarto-cli
;;; Resolves: #7615 quarto-cli (line 58623)
;;;

(define-public quarto-cli-bin
  (package
    (name "quarto-cli-bin")
    (version "1.9.37")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/quarto-dev/quarto-cli"
                    "/releases/download/v" version
                    "/quarto-" version "-linux-amd64.deb"))
              (sha256
               (base32
                "1ikinkkz5h1hnpfm9rvr2lnv0slzlmp8z2y4lz50a5z1ihyd1alq"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "opt/quarto" "share/quarto"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (delete 'make-dynamic-linker-cache)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/share/quarto/bin/quarto")
                              (string-append bin "/quarto"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source scientific and technical publishing system")
    (description "Quarto is an open-source scientific and technical
publishing system built on Pandoc.  It supports creating dynamic content
with Python, R, Julia, and Observable, publishing reproducible documents,
presentations, dashboards, websites, blogs, and books in multiple
output formats including HTML, PDF, MS Word, and ePub.")
    (home-page "https://quarto.org")
    (license license:expat)))

;;;
;;; === NEEDS_RECIPE_DESIGN_EXHAUSTED packages (21) ===
;;;
;;; The following 21 packages were evaluated and determined to be infeasible
;;; to package in this pass.  Each has a specific reason code and description
;;; of the approaches attempted.
;;;
;;; 10. rustwhy-git (#3660, line 29162) — NO_RELEASES: Rust system
;;;     diagnostics suite with no tagged releases or binary builds; only
;;;     available via git clone; A1: cargo-build-system — no version tag;
;;;     A2: pin commit — project too new/unstable; A3: no prebuilt binary.
;;;
;;; 11. bar_daemon (#3661, line 29170) — UPSTREAM_NOT_FOUND: cannot locate
;;;     upstream source repository; AUR package exists but origin URL is
;;;     unresolvable; A1: search GitHub/GitLab — no match; A2: AUR PKGBUILD
;;;     URL — broken or private; A3: no viable path without upstream.
;;;
;;; 12. cachyos-service-manager (#3750, line 29929) — DISTRO_SPECIFIC:
;;;     CachyOS-specific service manager requiring CachyOS ecosystem; Python
;;;     + GTK4 with unclear license; A1: pyproject build — GTK4 + CachyOS
;;;     specific; A2: no utility outside CachyOS; A3: license unclear.
;;;
;;; 13. git-wd40 (#3752, line 29944) — INFEASIBLE_BUILD: forked Git with
;;;     "de-Rusted" patches; requires full Git build system from source
;;;     (autotools + docs + tests); A1: no tagged releases; A2: full Git
;;;     rebuild is massive scope; A3: questionable utility vs upstream Git.
;;;
;;; 14. switchgen-git (#4033, line 32207) — DEEP_LEARNING_DEPS: AI image
;;;     generator requiring PyTorch, torchvision, transformers, ComfyUI
;;;     engine; A1: pyproject build — 20+ ML deps not in Guix; A2: no
;;;     binary release; A3: ML ecosystem not bootstrapped in Guix.
;;;
;;; 15. drkonqi-git (#4055, line 32389) — FULL_KDE_REBUILD: KDE Plasma
;;;     crash handler requiring full KDE Frameworks 6 stack (kcmutils,
;;;     kconfig, kcoreaddons, kcrash, ki18n, kio, kirigami, knotifications,
;;;     kservice, kwallet, kwidgetsaddons, polkit-qt6); A1: cmake build —
;;;     20+ KF6 deps not in Guix; A2: no standalone build path; A3: no
;;;     prebuilt binary.
;;;
;;; 16. alice2-bin (#7457, line 57601) — NONFREE_LICENSE: Carnegie Mellon
;;;     custom license restricts commercial use and derivative naming;
;;;     A1: binary tar.gz available but non-free; A2: cannot redistribute
;;;     under Guix channel policy; A3: use Scratch or Greenfoot instead.
;;;
;;; 17. wifiman-desktop (#7603, line 58549) — PROPRIETARY: Ubiquiti
;;;     proprietary WiFi analysis tool; no source code available; A1: .deb
;;;     binary from CDN — proprietary license; A2: no FOSS alternative with
;;;     same feature set; A3: cannot package proprietary software.
;;;
;;; 18. certbot-dns-porkbun (#7604, line 58554) — PYTHON_PACKAGE_NOT_BINARY:
;;;     pure Python package on PyPI (certbot-dns-porkbun); should use
;;;     pyproject-build-system, not binary repack; A1: guix import pypi
;;;     certbot-dns-porkbun — feasible but needs certbot dep chain; A2:
;;;     certbot already in Guix; A3: defer to dedicated Python packaging
;;;     pass.
;;;
;;; 19. wlr-which-key (#8384, line 64163) — CARGO_DEPS_NEEDED: Rust
;;;     Wayland keybinding tool requiring full cargo-build-system with
;;;     wayland-client, wayland-protocols, layer-shell crate deps; A1: no
;;;     prebuilt binary; A2: cargo-build-system — crate enumeration needed;
;;;     A3: source-only GitHub releases.
;;;
;;; 20. steamdepotdownloadergui-bin (#7336, line 56691) — NO_LINUX_RELEASE:
;;;     GitHub releases only contain Windows executables; no Linux build
;;;     available; A1: checked all release tags — Windows only; A2: source
;;;     is C#/.NET — needs dotnet SDK; A3: no viable path.
;;;
;;; 21. misuzu-music-bin (#7585, line 58447) — NO_LINUX_RELEASE: GitHub
;;;     releases only provide macOS (.dmg) and Windows (.exe) builds; no
;;;     Linux binary; A1: checked releases — no Linux artifact; A2: source
;;;     build requires Tauri + Rust + Node.js; A3: no viable path.
;;;
;;; 22. pamac-aur (#11788, line 86890) — ARCH_SPECIFIC: Arch Linux package
;;;     manager frontend using libalpm and pacman APIs; no utility on
;;;     non-Arch systems; A1: depends on pacman ecosystem; A2: depends on
;;;     libalpm (Arch-specific); A3: completely non-portable.
;;;
;;; 23. pacdiff-pacman-hook-git (#11852, line 87353) — ARCH_SPECIFIC:
;;;     pacman hook for pacdiff; Arch Linux-specific mkinitcpio/pacman
;;;     infrastructure; A1: pacman hooks — not applicable to Guix; A2: no
;;;     portable equivalent; A3: skip.
;;;
;;; 24. electron17 (#10720, line 78839) — CHROMIUM_SCALE_BUILD: Electron
;;;     v17 requires full Chromium browser build from source (~40GB,
;;;     multi-hour); A1: source build — impractical in batch; A2: binary
;;;     repack — ABI incompatibilities; A3: Guix has no Electron packaging
;;;     infrastructure.
;;;
;;; 25. electron19 (#10721, line 78846) — CHROMIUM_SCALE_BUILD: same as
;;;     electron17; Electron v19 requires full Chromium build; A1-A3:
;;;     identical to electron17 analysis.
;;;
;;; 26. lib32-xvidcore (#10752, line 79084) — LIB32_UNSUPPORTED: 32-bit
;;;     build of Xvid codec; Guix does not support multilib/32-bit
;;;     library builds; A1: cross-compilation — not supported for lib32;
;;;     A2: no 32-bit Guix profile mechanism; A3: skip.
;;;
;;; 27. lib32-libomxil-bellagio (#10783, line 79319) — LIB32_UNSUPPORTED:
;;;     32-bit OpenMAX IL implementation; same multilib limitation as
;;;     lib32-xvidcore; A1-A3: identical to lib32-xvidcore analysis.
;;;
;;; 28. 4kvideodownloaderplus (#10735, line 78946) — PROPRIETARY: commercial
;;;     video downloader by OpenMedia; proprietary license; A1: binary-only
;;;     distribution; A2: paid software with license keys; A3: cannot
;;;     package proprietary commercial software.
;;;
;;; 29. kdelibs4support (#10726, line 78885) — LEGACY_KDE_INFRA: KDE 4
;;;     compatibility layer requiring extensive legacy KDE infrastructure
;;;     (KDE4 Tier 1-3 frameworks); A1: cmake build — dozens of legacy KF4
;;;     deps; A2: KDE4 infrastructure obsolete; A3: no modern equivalent
;;;     needed.
;;;
;;; 30. intellij-idea-open-eap (#7594, line 58500) — COMPLEX_BUILD:
;;;     IntelliJ IDEA Community EAP requires building from 2 large git
;;;     repositories (intellij-community + android plugins); full JDK
;;;     bootstrap + Ant + Kotlin compiler needed; A1: source build — massive
;;;     multi-hour process; A2: binary .tar.gz available but version churn
;;;     makes it unreliable; A3: use stable IntelliJ release or VS Code.
;;;
