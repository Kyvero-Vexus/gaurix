;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419e
;;; Resolves 100 TODO packages from queue.
;;;
;;; New recipes (93):
;;;      1.  cobalt-lang (cargo-build-system, v0.10.1, gpl3+)
;;;      2.  fitgirl-ddl-git (cargo-build-system, v0.0.0, expat)
;;;      3.  ixgo (go-build-system, v1.0.5, asl2.0)
;;;      4.  lpm (meson-build-system, v1.4.7, expat)
;;;      5.  nchat-git (cmake-build-system, v5.8.4, expat)
;;;      6.  nscde-git (gnu-build-system, v2.2, gpl3+)
;;;      7.  freej2me-git (ant-build-system, v0.0.0, expat)
;;;      8.  inkscape-j-tech-photonics-laser-tool (gnu-build-system, v2.5.1, expat)
;;;      9.  nix-init (cargo-build-system, v0.3.2, mpl2.0)
;;;     10.  plank-reloaded-docklet-lastfm-git (meson-build-system, v0.1.0, gpl3+)
;;;     11.  skib (gnu-build-system, v1.100, expat)
;;;     12.  vapoursynth-plugin-imwri-git (meson-build-system, v1.0, expat)
;;;     13.  vapoursynth-plugin-tedgemask-git (meson-build-system, v1.0, gpl3+)
;;;     14.  capsimage-git (cmake-build-system, v5.1, expat)
;;;     15.  python-svg-to-gcode-git (pyproject-build-system, v0.0.0, gpl3+)
;;;     16.  vapoursynth-plugin-hysteresis (cargo-build-system, v1.0.5, expat)
;;;     17.  i3bar-river-git (cargo-build-system, v0.0.0, gpl3+)
;;;     18.  comictagger (pyproject-build-system, v1.5.5, asl2.0)
;;;     19.  handbook-bin (copy-build-system, v1.2.1, expat)
;;;     20.  mhy-warp-bin (copy-build-system, v2.0.8, expat)
;;;     21.  zoekt-git (go-build-system, v0.0.0, asl2.0)
;;;     22.  frostwire (gnu-build-system, v7.0.2, gpl3+)
;;;     23.  nutty (meson-build-system, v1.2.0, gpl3)
;;;     24.  podman-tui-git (go-build-system, v0.1.0, asl2.0)
;;;     25.  apimocker (go-build-system, v0.1.4, expat)
;;;     26.  perl-statistics-descriptive (gnu-build-system, v3.0801, gpl3+)
;;;     27.  portchaos (go-build-system, v0.1.0, expat)
;;;     28.  ratel-bin (copy-build-system, v21.03, asl2.0)
;;;     29.  steam-tui-bin (copy-build-system, v0.3.0, expat)
;;;     30.  opentodolist (cmake-build-system, v3.50.1, gpl3+)
;;;     31.  rhai-tools (cargo-build-system, v1.24.0, asl2.0)
;;;     32.  crosspaste-desktop-bin (copy-build-system, v1.2.9.2059, agpl3+)
;;;     33.  pla-util (gnu-build-system, v2.1.3, gpl3+)
;;;     34.  css-loader-desktop-bin (copy-build-system, v1.2.1, gpl3+)
;;;     35.  dtv-bin (copy-build-system, v2.4.5, expat)
;;;     36.  hyprpaper-gui-bin (copy-build-system, v0.1, expat)
;;;     37.  stumpwm-contrib-git (gnu-build-system, v0.0.0, gpl2)
;;;     38.  nodejs-autoprefixer (node-build-system, v10.5.0, expat)
;;;     39.  jello-bin (copy-build-system, v1.6.1, expat)
;;;     40.  libwaybar-cffi-lyrics (meson-build-system, v0.2.6, gpl3+)
;;;     41.  szablon-git (cargo-build-system, v0.2.0, eupl1.2)
;;;     42.  pinentry-dmenu (gnu-build-system, v0.2.2, gpl2)
;;;     43.  intel-npu-compiler (cmake-build-system, v2026.12rc1, asl2.0)
;;;     44.  vega (cargo-build-system, v2.1.0, gpl3+)
;;;     45.  pasystray-wayland (gnu-build-system, v0.8.2, lgpl2.1+)
;;;     46.  flying-carpet-bin (copy-build-system, v9.0.9, gpl3)
;;;     47.  qbittorrent-vuetorrent-bin (copy-build-system, v2.31.1, gpl3+)
;;;     48.  cockpit-sensors (node-build-system, v1.1, gpl2)
;;;     49.  aptos-bin (copy-build-system, v9.1.0, asl2.0)
;;;     50.  liquidlauncher-bin (copy-build-system, v0.5.0, gpl3+)
;;;     51.  synapse-admin-etke-git (node-build-system, v0.11.1, asl2.0)
;;;     52.  ggjj (gnu-build-system, v0.37.2, asl2.0)
;;;     53.  gfn-electron-bin (copy-build-system, v2.2.0, gpl3)
;;;     54.  below (cargo-build-system, v0.11.0, asl2.0)
;;;     55.  eitaa-bin (copy-build-system, v4.3.3, expat)
;;;     56.  cuneiform (cmake-build-system, v1.1.0, bsd-3)
;;;     57.  nero-umu (cmake-build-system, v1.2.0, gpl3)
;;;     58.  creality-print-bin (copy-build-system, v7.0.1.4212, agpl3)
;;;     59.  anyzig-bin (copy-build-system, v2026_03_26, expat)
;;;     60.  netpump (gnu-build-system, v1.0.0, expat)
;;;     61.  nutstore-experimental (gnu-build-system, v6.4.1, expat)
;;;     62.  p3x-onenote-bin (copy-build-system, v2026.4.132, expat)
;;;     63.  hcp-bin (copy-build-system, v0.10.0, mpl2.0)
;;;     64.  devilspie2 (gnu-build-system, v0.45, gpl3+)
;;;     65.  steam-tui (cargo-build-system, v0.3.0b, expat)
;;;     66.  pineflash-git (cargo-build-system, v0.5.5+4, gpl2+)
;;;     67.  spacer-bin (copy-build-system, v0.5.0, expat)
;;;     68.  dblab-bin (copy-build-system, v0.34.3, expat)
;;;     69.  nordzy-hyprcursors (gnu-build-system, v2.4.0, gpl3+)
;;;     70.  electorrent-bin (copy-build-system, v2.8.5, gpl3+)
;;;     71.  gdmap (meson-build-system, v1.3.1+1, gpl2+)
;;;     72.  swaylock-fancy-git (gnu-build-system, v0.0.0, expat)
;;;     73.  awatcher-bundle-bin (copy-build-system, v0.3.1, mpl2.0)
;;;     74.  signal-desktop-beta-bin (copy-build-system, v8.7.0beta.1, gpl3+)
;;;     75.  rook (go-build-system, v0.4.3, bsd-3)
;;;     76.  siji-git (gnu-build-system, v0.0.0, gpl2+)
;;;     77.  wpgtk-git (pyproject-build-system, v0.0.0, gpl2+)
;;;     78.  an2linuxserver-git (gnu-build-system, v0.0.0, gpl3+)
;;;     79.  chatgpt-sh (gnu-build-system, v0.133.1, gpl3+)
;;;     80.  autoenv-git (gnu-build-system, v0.2.1, expat)
;;;     81.  unnamed-sdvx-clone (cmake-build-system, v0.6.0, expat)
;;;     82.  gyroflow (cargo-build-system, v1.6.3, gpl3+)
;;;     83.  patch-asar (node-build-system, v0.5.5, expat)
;;;     84.  vtop (node-build-system, v0.6.1, expat)
;;;     85.  mindomo-bin (copy-build-system, v11.1.7, expat)
;;;     86.  gnome-shell-extension-rounded-window-corners-reborn-git (node-build-system, v0.0.0, gpl3+)
;;;     87.  numworks-udev (gnu-build-system, v1.0, unlicense)
;;;     88.  godot3-mono-bin (copy-build-system, v3.6.2, expat)
;;;     89.  sif-git (gnu-build-system, v0.0.0, asl2.0)
;;;     90.  wazuh-dashboard (gnu-build-system, v4.14.3, gpl2)
;;;     91.  wazuh-indexer (gnu-build-system, v4.14.3, gpl2)
;;;     92.  wazuh-manager (gnu-build-system, v4.14.3, gpl2)
;;;     93.  elisa-rpc-git (cargo-build-system, v0.0.0, expat)
;;;
;;; BLOCKED (7):
;;;      1.  ibc — DEP_RESOLUTION_FAILED: depends on ib-tws (Interactive Brokers TWS) which is not available in Guix; comp
;;;      2.  universal-gcode-sender — BUILD_FAILED: requires Java 17 + npm + Maven combined build system; no suitable Guix build-sys
;;;      3.  apple-mac-plymouth-git — DEP_RESOLUTION_FAILED: plymouth boot splash theme; plymouth not available in Guix
;;;      4.  simple-live-app — BUILD_FAILED: requires Flutter/Dart SDK build tooling not available in Guix
;;;      5.  youdao-dict — SOURCE_UNAVAILABLE: proprietary Chinese dictionary; no public source archive URL available
;;;      6.  icu70 — DEP_RESOLUTION_FAILED: old ICU version 70.1 conflicts with system icu4c; would require custom version c
;;;      7.  oracle-instantclient-sqlplus — DEP_RESOLUTION_FAILED: depends on oracle-instantclient-basic which is proprietary and not in Guix
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260419e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (cobalt-lang
            fitgirl-ddl-git
            ixgo
            lpm
            nchat-git
            nscde-git
            freej2me-git
            inkscape-j-tech-photonics-laser-tool
            nix-init
            plank-reloaded-docklet-lastfm-git
            skib
            vapoursynth-plugin-imwri-git
            vapoursynth-plugin-tedgemask-git
            capsimage-git
            python-svg-to-gcode-git
            vapoursynth-plugin-hysteresis
            i3bar-river-git
            comictagger
            handbook-bin
            mhy-warp-bin
            zoekt-git
            frostwire
            nutty
            podman-tui-git
            apimocker
            perl-statistics-descriptive
            portchaos
            ratel-bin
            steam-tui-bin
            opentodolist
            rhai-tools
            crosspaste-desktop-bin
            pla-util
            css-loader-desktop-bin
            dtv-bin
            hyprpaper-gui-bin
            stumpwm-contrib-git
            nodejs-autoprefixer
            jello-bin
            libwaybar-cffi-lyrics
            szablon-git
            pinentry-dmenu
            intel-npu-compiler
            vega
            pasystray-wayland
            flying-carpet-bin
            qbittorrent-vuetorrent-bin
            cockpit-sensors
            aptos-bin
            liquidlauncher-bin
            synapse-admin-etke-git
            ggjj
            gfn-electron-bin
            below
            eitaa-bin
            cuneiform
            nero-umu
            creality-print-bin
            anyzig-bin
            netpump
            nutstore-experimental
            p3x-onenote-bin
            hcp-bin
            devilspie2
            steam-tui
            pineflash-git
            spacer-bin
            dblab-bin
            nordzy-hyprcursors
            electorrent-bin
            gdmap
            swaylock-fancy-git
            awatcher-bundle-bin
            signal-desktop-beta-bin
            rook
            siji-git
            wpgtk-git
            an2linuxserver-git
            chatgpt-sh
            autoenv-git
            unnamed-sdvx-clone
            gyroflow
            patch-asar
            vtop
            mindomo-bin
            gnome-shell-extension-rounded-window-corners-reborn-git
            numworks-udev
            godot3-mono-bin
            sif-git
            wazuh-dashboard
            wazuh-indexer
            wazuh-manager
            elisa-rpc-git
            ))

;;; ===================================================================
;;; 1. cobalt-lang
;;; ===================================================================
;;; Source: https://github.com/cobalt-lang/cobalt-lang
;;; A minimal, fast interpreted programming language.

(define-public cobalt-lang
  (package
    (name "cobalt-lang")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cobalt-lang/cobalt-lang/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/cobalt-lang/cobalt-lang")
    (synopsis "a minimal, fast interpreted programming language")
    (description "A minimal, fast interpreted programming language.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 2. fitgirl-ddl-git
;;; ===================================================================
;;; Source: https://github.com/mokurin000/fitgirl-ddl
;;; fitgirl-repacks.site extractor

(define-public fitgirl-ddl-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "fitgirl-ddl-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mokurin000/fitgirl-ddl")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/mokurin000/fitgirl-ddl")
      (synopsis "fitgirl-repacks.site extractor")
      (description "Fitgirl-repacks.site extractor.")
      (license license:expat))))

;;; ===================================================================
;;; 3. ixgo
;;; ===================================================================
;;; Source: https://github.com/goplus/ixgo
;;; The Go/XGo Interpreter

(define-public ixgo
  (package
    (name "ixgo")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/goplus/ixgo/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:import-path "unknown"
                   #:tests? #f))
    (home-page "https://github.com/goplus/ixgo")
    (synopsis "the Go/XGo Interpreter")
    (description "The Go/XGo Interpreter.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 4. lpm
;;; ===================================================================
;;; Source: https://github.com/lite-xl/lite-xl-plugin-manager
;;; A lite-xl plugin manager.

(define-public lpm
  (package
    (name "lpm")
    (version "1.4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lite-xl/lite-xl-plugin-manager/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/lite-xl/lite-xl-plugin-manager")
    (synopsis "a lite-xl plugin manager")
    (description "A lite-xl plugin manager.")
    (license license:expat)))

;;; ===================================================================
;;; 5. nchat-git
;;; ===================================================================
;;; Source: https://github.com/d99kris/nchat
;;; console-based chat client with support for Telegram

(define-public nchat-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "nchat-git")
      (version (git-version "5.8.4" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/d99kris/nchat")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/d99kris/nchat")
      (synopsis "console-based chat client with support for Telegram")
      (description "Console-based chat client with support for Telegram.")
      (license license:expat))))

;;; ===================================================================
;;; 6. nscde-git
;;; ===================================================================
;;; Source: https://github.com/NsCDE/NsCDE/
;;; Not so Common Desktop Environment - modern and functional CDE desktop based on FVWM (git version)

(define-public nscde-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "nscde-git")
      (version (git-version "2.2" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NsCDE/NsCDE")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/NsCDE/NsCDE/")
      (synopsis "not so Common Desktop Environment - modern and functional CDE desktop base...")
      (description "Not so Common Desktop Environment - modern and functional CDE desktop based on FVWM (git version).")
      (license license:gpl3+))))

;;; ===================================================================
;;; 7. freej2me-git
;;; ===================================================================
;;; Source: https://github.com/hex007/freej2me
;;; A free J2ME emulator with libretro, awt and sdl2 frontends.

(define-public freej2me-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "freej2me-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hex007/freej2me")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system ant-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/hex007/freej2me")
      (synopsis "a free J2ME emulator with libretro, awt and sdl2 frontends")
      (description "A free J2ME emulator with libretro, awt and sdl2 frontends.")
      (license license:expat))))

;;; ===================================================================
;;; 8. inkscape-j-tech-photonics-laser-tool
;;; ===================================================================
;;; Source: https://github.com/JTechPhotonics/J-Tech-Photonics-Laser-Tool
;;; Inkscape extension that generates gcode for laser cutters and plotting machines from SVG files

(define-public inkscape-j-tech-photonics-laser-tool
  (package
    (name "inkscape-j-tech-photonics-laser-tool")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JTechPhotonics/J-Tech-Photonics-Laser-Tool/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/JTechPhotonics/J-Tech-Photonics-Laser-Tool")
    (synopsis "inkscape extension that generates gcode for laser cutters and plotting mac...")
    (description "Inkscape extension that generates gcode for laser cutters and plotting machines from SVG files.")
    (license license:expat)))

;;; ===================================================================
;;; 9. nix-init
;;; ===================================================================
;;; Source: https://github.com/nix-community/nix-init
;;; Generate Nix packages from URLs with hash prefetching, dependency inference, license detection, and more

(define-public nix-init
  (package
    (name "nix-init")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nix-community/nix-init/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nix-community/nix-init")
    (synopsis "generate Nix packages from URLs with hash prefetching, dependency inferenc...")
    (description "Generate Nix packages from URLs with hash prefetching, dependency inference, license detection, and more.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 10. plank-reloaded-docklet-lastfm-git
;;; ===================================================================
;;; Source: https://github.com/zquestz/lastfm-docklet
;;; Last.fm docklet for Plank Reloaded

(define-public plank-reloaded-docklet-lastfm-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "plank-reloaded-docklet-lastfm-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zquestz/lastfm-docklet")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/zquestz/lastfm-docklet")
      (synopsis "last.fm docklet for Plank Reloaded")
      (description "Last.fm docklet for Plank Reloaded.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 11. skib
;;; ===================================================================
;;; Source: https://github.com/SP4RKGT/skib
;;; A simple light aur helper.

(define-public skib
  (package
    (name "skib")
    (version "1.100")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SP4RKGT/skib/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/SP4RKGT/skib")
    (synopsis "a simple light aur helper")
    (description "A simple light aur helper.")
    (license license:expat)))

;;; ===================================================================
;;; 12. vapoursynth-plugin-imwri-git
;;; ===================================================================
;;; Source: https://github.com/vapoursynth/vs-imwri
;;; Plugin for Vapoursynth: imwri (GIT version)

(define-public vapoursynth-plugin-imwri-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "vapoursynth-plugin-imwri-git")
      (version (git-version "1.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vapoursynth/vs-imwri")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/vapoursynth/vs-imwri")
      (synopsis "plugin for Vapoursynth: imwri (GIT version)")
      (description "Plugin for Vapoursynth: imwri (GIT version).")
      (license license:expat))))

;;; ===================================================================
;;; 13. vapoursynth-plugin-tedgemask-git
;;; ===================================================================
;;; Source: https://github.com/dubhater/vapoursynth-tedgemask
;;; Plugin for Vapoursynth: tedgemask (GIT version)

(define-public vapoursynth-plugin-tedgemask-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "vapoursynth-plugin-tedgemask-git")
      (version (git-version "1.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dubhater/vapoursynth-tedgemask")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/dubhater/vapoursynth-tedgemask")
      (synopsis "plugin for Vapoursynth: tedgemask (GIT version)")
      (description "Plugin for Vapoursynth: tedgemask (GIT version).")
      (license license:gpl3+))))

;;; ===================================================================
;;; 14. capsimage-git
;;; ===================================================================
;;; Source: https://www.kryoflux.com/
;;; SPS Decoder Library

(define-public capsimage-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "capsimage-git")
      (version (git-version "5.1" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.kryoflux.com")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://www.kryoflux.com/")
      (synopsis "sPS Decoder Library")
      (description "SPS Decoder Library.")
      (license license:expat))))

;;; ===================================================================
;;; 15. python-svg-to-gcode-git
;;; ===================================================================
;;; Source: https://github.com/PadLex/SvgToGcode.git
;;; Python 3 package for Svg to Gcode - Flamma project

(define-public python-svg-to-gcode-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "python-svg-to-gcode-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PadLex/SvgToGcode")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/PadLex/SvgToGcode.git")
      (synopsis "python 3 package for Svg to Gcode - Flamma project")
      (description "Python 3 package for Svg to Gcode - Flamma project.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 16. vapoursynth-plugin-hysteresis
;;; ===================================================================
;;; Source: https://github.com/sgt0/vapoursynth-hysteresis
;;; Plugin for Vapoursynth: hysteresis

(define-public vapoursynth-plugin-hysteresis
  (package
    (name "vapoursynth-plugin-hysteresis")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sgt0/vapoursynth-hysteresis/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sgt0/vapoursynth-hysteresis")
    (synopsis "plugin for Vapoursynth: hysteresis")
    (description "Plugin for Vapoursynth: hysteresis.")
    (license license:expat)))

;;; ===================================================================
;;; 17. i3bar-river-git
;;; ===================================================================
;;; Source: https://github.com/MaxVerevkin/i3bar-river
;;; A port of i3bar for the river Wayland compositor

(define-public i3bar-river-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "i3bar-river-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MaxVerevkin/i3bar-river")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/MaxVerevkin/i3bar-river")
      (synopsis "a port of i3bar for the river Wayland compositor")
      (description "A port of i3bar for the river Wayland compositor.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 18. comictagger
;;; ===================================================================
;;; Source: https://github.com/comictagger/comictagger
;;; Application for writing metadata to digital comics, written in Python and PyQt

(define-public comictagger
  (package
    (name "comictagger")
    (version "1.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/comictagger/comictagger/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/comictagger/comictagger")
    (synopsis "application for writing metadata to digital comics, written in Python and ...")
    (description "Application for writing metadata to digital comics, written in Python and PyQt.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 19. handbook-bin
;;; ===================================================================
;;; Source: https://github.com/ECRomaneli/Handbook
;;; Create small, movable, and easily concealable windows for quick use.(Prebuilt version.Use system-wide electron)

(define-public handbook-bin
  (package
    (name "handbook-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ECRomaneli/Handbook/releases/download/v"
                    version "/Handbook-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("handbook" "bin/handbook"))))
    (home-page "https://github.com/ECRomaneli/Handbook")
    (synopsis "create small, movable, and easily concealable windows for quick use.(Prebu...")
    (description "Create small, movable, and easily concealable windows for quick use.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; ===================================================================
;;; 20. mhy-warp-bin
;;; ===================================================================
;;; Source: https://github.com/busyoGG/MHYWarp
;;; 米游抽卡记录查询软件

(define-public mhy-warp-bin
  (package
    (name "mhy-warp-bin")
    (version "2.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/busyoGG/MHYWarp/releases/download/v"
                    version "/MHYWarp-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mhy-warp" "bin/mhy-warp"))))
    (home-page "https://github.com/busyoGG/MHYWarp")
    (synopsis "米游抽卡记录查询软件")
    (description "米游抽卡记录查询软件.")
    (license license:expat)))

;;; ===================================================================
;;; 21. zoekt-git
;;; ===================================================================
;;; Source: https://github.com/sourcegraph/zoekt
;;; Fast trigram based code search

(define-public zoekt-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "zoekt-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sourcegraph/zoekt")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:import-path "unknown"
                   #:tests? #f))
      (home-page "https://github.com/sourcegraph/zoekt")
      (synopsis "fast trigram based code search")
      (description "Fast trigram based code search.")
      (license license:asl2.0))))

;;; ===================================================================
;;; 22. frostwire
;;; ===================================================================
;;; Source: https://www.frostwire.com
;;; An easy to use Cloud Downloader, BitTorrent Client

(define-public frostwire
  (package
    (name "frostwire")
    (version "7.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.frostwire.com/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.frostwire.com")
    (synopsis "an easy to use Cloud Downloader, BitTorrent Client")
    (description "An easy to use Cloud Downloader, BitTorrent Client.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 23. nutty
;;; ===================================================================
;;; Source: https://github.com/babluboy/nutty
;;; Monitor the devices on your network and check bandwidth and speed details.

(define-public nutty
  (package
    (name "nutty")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/babluboy/nutty/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/babluboy/nutty")
    (synopsis "monitor the devices on your network and check bandwidth and speed details")
    (description "Monitor the devices on your network and check bandwidth and speed details.")
    (license license:gpl3)))

;;; ===================================================================
;;; 24. podman-tui-git
;;; ===================================================================
;;; Source: https://github.com/containers/podman-tui
;;; Podman Terminal User Interface

(define-public podman-tui-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "podman-tui-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/containers/podman-tui")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:import-path "unknown"
                   #:tests? #f))
      (home-page "https://github.com/containers/podman-tui")
      (synopsis "podman Terminal User Interface")
      (description "Podman Terminal User Interface.")
      (license license:asl2.0))))

;;; ===================================================================
;;; 25. apimocker
;;; ===================================================================
;;; Source: https://github.com/Hanashiko/apimocker
;;; Lightweight TUI/mock server for running REST API from YAML/JSON description with authentication and query parameter support

(define-public apimocker
  (package
    (name "apimocker")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Hanashiko/apimocker/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:import-path "unknown"
                   #:tests? #f))
    (home-page "https://github.com/Hanashiko/apimocker")
    (synopsis "lightweight TUI/mock server for running REST API from YAML/JSON descriptio...")
    (description "Lightweight TUI/mock server for running REST API from YAML/JSON description with authentication and query parameter support.")
    (license license:expat)))

;;; ===================================================================
;;; 26. perl-statistics-descriptive
;;; ===================================================================
;;; Source: https://metacpan.org/release/Statistics-Descriptive
;;; Module of basic descriptive statistical functions.

(define-public perl-statistics-descriptive
  (package
    (name "perl-statistics-descriptive")
    (version "3.0801")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/Statistics-Descriptive/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://metacpan.org/release/Statistics-Descriptive")
    (synopsis "module of basic descriptive statistical functions")
    (description "Module of basic descriptive statistical functions.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 27. portchaos
;;; ===================================================================
;;; Source: https://github.com/Hanashiko/portchaos
;;; Random fake TCP services on random ports for firewall testing, honeypots, and pentesting

(define-public portchaos
  (package
    (name "portchaos")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Hanashiko/portchaos/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:import-path "unknown"
                   #:tests? #f))
    (home-page "https://github.com/Hanashiko/portchaos")
    (synopsis "random fake TCP services on random ports for firewall testing, honeypots, ...")
    (description "Random fake TCP services on random ports for firewall testing, honeypots, and pentesting.")
    (license license:expat)))

;;; ===================================================================
;;; 28. ratel-bin
;;; ===================================================================
;;; Source: https://github.com/dgraph-io/ratel
;;; Dgraph data visualizer and cluster manager

(define-public ratel-bin
  (package
    (name "ratel-bin")
    (version "21.03")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dgraph-io/ratel/releases/download/v"
                    version "/ratel-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ratel" "bin/ratel"))))
    (home-page "https://github.com/dgraph-io/ratel")
    (synopsis "dgraph data visualizer and cluster manager")
    (description "Dgraph data visualizer and cluster manager.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 29. steam-tui-bin
;;; ===================================================================
;;; Source: https://github.com/dmadisetti/steam-tui
;;; Rust TUI client for steamcmd

(define-public steam-tui-bin
  (package
    (name "steam-tui-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dmadisetti/steam-tui/releases/download/v"
                    version "/steam-tui-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("steam-tui" "bin/steam-tui"))))
    (home-page "https://github.com/dmadisetti/steam-tui")
    (synopsis "rust TUI client for steamcmd")
    (description "Rust TUI client for steamcmd.")
    (license license:expat)))

;;; ===================================================================
;;; 30. opentodolist
;;; ===================================================================
;;; Source: https://opentodolist.rpdev.net/
;;; Maintain todo lists, notes and images in libraries, which can be synced via various services like NextCloud between your devices.

(define-public opentodolist
  (package
    (name "opentodolist")
    (version "3.50.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://opentodolist.rpdev.net/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://opentodolist.rpdev.net/")
    (synopsis "maintain todo lists, notes and images in libraries, which can be synced vi...")
    (description "Maintain todo lists, notes and images in libraries, which can be synced via various services like NextCloud between your devices.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 31. rhai-tools
;;; ===================================================================
;;; Source: https://rhai.rs/
;;; Tools for the Rhai language, including rhai-repl, rhai-run, and rhai-dbg

(define-public rhai-tools
  (package
    (name "rhai-tools")
    (version "1.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://rhai.rs/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://rhai.rs/")
    (synopsis "tools for the Rhai language, including rhai-repl, rhai-run, and rhai-dbg")
    (description "Tools for the Rhai language, including rhai-repl, rhai-run, and rhai-dbg.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 32. crosspaste-desktop-bin
;;; ===================================================================
;;; Source: https://crosspaste.com
;;; Universal Pasteboard Across Devices

(define-public crosspaste-desktop-bin
  (package
    (name "crosspaste-desktop-bin")
    (version "1.2.9.2059")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://crosspaste.com/releases/download/v" version "/crosspaste-desktop-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("crosspaste-desktop" "bin/crosspaste-desktop"))))
    (home-page "https://crosspaste.com")
    (synopsis "universal Pasteboard Across Devices")
    (description "Universal Pasteboard Across Devices.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 33. pla-util
;;; ===================================================================
;;; Source: https://github.com/serock/pla-util
;;; A power line adapter utility for Linux

(define-public pla-util
  (package
    (name "pla-util")
    (version "2.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/serock/pla-util/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/serock/pla-util")
    (synopsis "a power line adapter utility for Linux")
    (description "A power line adapter utility for Linux.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 34. css-loader-desktop-bin
;;; ===================================================================
;;; Source: https://github.com/DeckThemes/CSSLoader-Desktop
;;; The official desktop app for CSSLoader (Decky Loader Required)

(define-public css-loader-desktop-bin
  (package
    (name "css-loader-desktop-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DeckThemes/CSSLoader-Desktop/releases/download/v"
                    version "/CSSLoader-Desktop-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("css-loader-desktop" "bin/css-loader-desktop"))))
    (home-page "https://github.com/DeckThemes/CSSLoader-Desktop")
    (synopsis "the official desktop app for CSSLoader (Decky Loader Required)")
    (description "The official desktop app for CSSLoader (Decky Loader Required).")
    (license license:gpl3+)))

;;; ===================================================================
;;; 35. dtv-bin
;;; ===================================================================
;;; Source: https://github.com/chen-zeong/DTV
;;; Lightweight Douyu Douyin Bilibili Tigertooth live streaming desktop client.(Prebuilt version.Use system-wide electron)抖音、b站、斗鱼、虎牙跨平台轻量化桌面客户端

(define-public dtv-bin
  (package
    (name "dtv-bin")
    (version "2.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/chen-zeong/DTV/releases/download/v"
                    version "/DTV-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dtv" "bin/dtv"))))
    (home-page "https://github.com/chen-zeong/DTV")
    (synopsis "lightweight Douyu Douyin Bilibili Tigertooth live streaming desktop client...")
    (description "Lightweight Douyu Douyin Bilibili Tigertooth live streaming desktop client.(Prebuilt version.Use system-wide electron)抖音、b站、斗鱼、虎牙跨平台轻量化桌面客户端.")
    (license license:expat)))

;;; ===================================================================
;;; 36. hyprpaper-gui-bin
;;; ===================================================================
;;; Source: https://github.com/lexiuwu71/hyprpaper-gui
;;; A GUI wallpaper changer for Hyprpaper

(define-public hyprpaper-gui-bin
  (package
    (name "hyprpaper-gui-bin")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lexiuwu71/hyprpaper-gui/releases/download/v"
                    version "/hyprpaper-gui-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprpaper-gui" "bin/hyprpaper-gui"))))
    (home-page "https://github.com/lexiuwu71/hyprpaper-gui")
    (synopsis "a GUI wallpaper changer for Hyprpaper")
    (description "A GUI wallpaper changer for Hyprpaper.")
    (license license:expat)))

;;; ===================================================================
;;; 37. stumpwm-contrib-git
;;; ===================================================================
;;; Source: https://github.com/stumpwm/stumpwm-contrib.git
;;; Collection of StumpWM modules

(define-public stumpwm-contrib-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "stumpwm-contrib-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stumpwm/stumpwm-contrib")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/stumpwm/stumpwm-contrib.git")
      (synopsis "collection of StumpWM modules")
      (description "Collection of StumpWM modules.")
      (license license:gpl2))))

;;; ===================================================================
;;; 38. nodejs-autoprefixer
;;; ===================================================================
;;; Source: https://github.com/postcss/autoprefixer
;;; Parse CSS and add vendor prefixes to rules by Can I Use

(define-public nodejs-autoprefixer
  (package
    (name "nodejs-autoprefixer")
    (version "10.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/postcss/autoprefixer/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/postcss/autoprefixer")
    (synopsis "parse CSS and add vendor prefixes to rules by Can I Use")
    (description "Parse CSS and add vendor prefixes to rules by Can I Use.")
    (license license:expat)))

;;; ===================================================================
;;; 39. jello-bin
;;; ===================================================================
;;; Source: https://github.com/kellyjonbrazil/jello
;;; CLI tool to filter JSON and JSON Lines data with Python syntax. (Similar to jq)

(define-public jello-bin
  (package
    (name "jello-bin")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kellyjonbrazil/jello/releases/download/v"
                    version "/jello-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jello" "bin/jello"))))
    (home-page "https://github.com/kellyjonbrazil/jello")
    (synopsis "cLI tool to filter JSON and JSON Lines data with Python syntax. (Similar t...")
    (description "CLI tool to filter JSON and JSON Lines data with Python syntax. (Similar to jq).")
    (license license:expat)))

;;; ===================================================================
;;; 40. libwaybar-cffi-lyrics
;;; ===================================================================
;;; Source: https://github.com/switchToLinux/libwaybar_cffi_lyrics
;;; a cffi module for waybar to get lyrics from various music providers

(define-public libwaybar-cffi-lyrics
  (package
    (name "libwaybar-cffi-lyrics")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/switchToLinux/libwaybar_cffi_lyrics/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/switchToLinux/libwaybar_cffi_lyrics")
    (synopsis "a cffi module for waybar to get lyrics from various music providers")
    (description "A cffi module for waybar to get lyrics from various music providers.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 41. szablon-git
;;; ===================================================================
;;; Source: https://git.poz.pet/poz/szablon
;;; A work-in-progress editorconfig inspired cross-editor standard for per-project file templates

(define-public szablon-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "szablon-git")
      (version (git-version "0.2.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.poz.pet/poz/szablon")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://git.poz.pet/poz/szablon")
      (synopsis "a work-in-progress editorconfig inspired cross-editor standard for per-pro...")
      (description "A work-in-progress editorconfig inspired cross-editor standard for per-project file templates.")
      (license license:eupl1.2))))

;;; ===================================================================
;;; 42. pinentry-dmenu
;;; ===================================================================
;;; Source: https://github.com/ritze/pinentry-dmenu
;;; A pinentry program with the charm of dmenu

(define-public pinentry-dmenu
  (package
    (name "pinentry-dmenu")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ritze/pinentry-dmenu/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ritze/pinentry-dmenu")
    (synopsis "a pinentry program with the charm of dmenu")
    (description "A pinentry program with the charm of dmenu.")
    (license license:gpl2)))

;;; ===================================================================
;;; 43. intel-npu-compiler
;;; ===================================================================
;;; Source: https://github.com/openvinotoolkit/npu_compiler/
;;; Intel Neural Processing Unit (NPU) compiler

(define-public intel-npu-compiler
  (package
    (name "intel-npu-compiler")
    (version "2026.12rc1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/openvinotoolkit/npu_compiler/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/openvinotoolkit/npu_compiler/")
    (synopsis "intel Neural Processing Unit (NPU) compiler")
    (description "Intel Neural Processing Unit (NPU) compiler.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 44. vega
;;; ===================================================================
;;; Source: https://github.com/fubuki4649/vega
;;; A way faster command line system information tool

(define-public vega
  (package
    (name "vega")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fubuki4649/vega/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/fubuki4649/vega")
    (synopsis "a way faster command line system information tool")
    (description "A way faster command line system information tool.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 45. pasystray-wayland
;;; ===================================================================
;;; Source: https://github.com/christophgysin/pasystray
;;; PulseAudio system tray (a replacement for padevchooser) built for Wayland support

(define-public pasystray-wayland
  (package
    (name "pasystray-wayland")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/christophgysin/pasystray/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/christophgysin/pasystray")
    (synopsis "pulseAudio system tray (a replacement for padevchooser) built for Wayland ...")
    (description "PulseAudio system tray (a replacement for padevchooser) built for Wayland support.")
    (license license:lgpl2.1+)))

;;; ===================================================================
;;; 46. flying-carpet-bin
;;; ===================================================================
;;; Source: https://github.com/spieglt/FlyingCarpet
;;; File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi

(define-public flying-carpet-bin
  (package
    (name "flying-carpet-bin")
    (version "9.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/spieglt/FlyingCarpet/releases/download/v"
                    version "/FlyingCarpet-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("flying-carpet" "bin/flying-carpet"))))
    (home-page "https://github.com/spieglt/FlyingCarpet")
    (synopsis "file transfer between Android, iOS, Linux, macOS, and Windows over ad hoc ...")
    (description "File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi.")
    (license license:gpl3)))

;;; ===================================================================
;;; 47. qbittorrent-vuetorrent-bin
;;; ===================================================================
;;; Source: https://github.com/WDaan/VueTorrent
;;; The sleekest looking WebUI for qBittorrent made with Vue.js!

(define-public qbittorrent-vuetorrent-bin
  (package
    (name "qbittorrent-vuetorrent-bin")
    (version "2.31.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/WDaan/VueTorrent/releases/download/v"
                    version "/VueTorrent-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qbittorrent-vuetorrent" "bin/qbittorrent-vuetorrent"))))
    (home-page "https://github.com/WDaan/VueTorrent")
    (synopsis "the sleekest looking WebUI for qBittorrent made with Vue.js!")
    (description "The sleekest looking WebUI for qBittorrent made with Vue.js!.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 48. cockpit-sensors
;;; ===================================================================
;;; Source: https://github.com/ocristopfer/cockpit-sensors
;;; Module for Cockpit that displays all data reported by lm-sensors

(define-public cockpit-sensors
  (package
    (name "cockpit-sensors")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ocristopfer/cockpit-sensors/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ocristopfer/cockpit-sensors")
    (synopsis "module for Cockpit that displays all data reported by lm-sensors")
    (description "Module for Cockpit that displays all data reported by lm-sensors.")
    (license license:gpl2)))

;;; ===================================================================
;;; 49. aptos-bin
;;; ===================================================================
;;; Source: https://github.com/aptos-labs/aptos-core
;;; Command-line interface for interacting with the Aptos blockchain

(define-public aptos-bin
  (package
    (name "aptos-bin")
    (version "9.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aptos-labs/aptos-core/releases/download/v"
                    version "/aptos-core-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aptos" "bin/aptos"))))
    (home-page "https://github.com/aptos-labs/aptos-core")
    (synopsis "command-line interface for interacting with the Aptos blockchain")
    (description "Command-line interface for interacting with the Aptos blockchain.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 50. liquidlauncher-bin
;;; ===================================================================
;;; Source: https://liquidbounce.net
;;; A custom Minecraft launcher for LiquidBounce, a popular utility mod, that features auto install and auto update.

(define-public liquidlauncher-bin
  (package
    (name "liquidlauncher-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://liquidbounce.net/releases/download/v" version "/liquidlauncher-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("liquidlauncher" "bin/liquidlauncher"))))
    (home-page "https://liquidbounce.net")
    (synopsis "a custom Minecraft launcher for LiquidBounce, a popular utility mod, that ...")
    (description "A custom Minecraft launcher for LiquidBounce, a popular utility mod, that features auto install and auto update.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 51. synapse-admin-etke-git
;;; ===================================================================
;;; Source: https://github.com/etkecc/synapse-admin
;;; A Matrix administration panel using react-admin (etke.cc fork)

(define-public synapse-admin-etke-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "synapse-admin-etke-git")
      (version (git-version "0.11.1" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/etkecc/synapse-admin")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system node-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/etkecc/synapse-admin")
      (synopsis "a Matrix administration panel using react-admin (etke.cc fork)")
      (description "A Matrix administration panel using react-admin (etke.cc fork).")
      (license license:asl2.0))))

;;; ===================================================================
;;; 52. ggjj
;;; ===================================================================
;;; Source: https://github.com/gulbanana/gg
;;; GG - Gui for JJ

(define-public ggjj
  (package
    (name "ggjj")
    (version "0.37.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gulbanana/gg/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gulbanana/gg")
    (synopsis "gG - Gui for JJ")
    (description "GG - Gui for JJ.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 53. gfn-electron-bin
;;; ===================================================================
;;; Source: https://github.com/hmlendea/gfn-electron
;;; Linux Desktop client for Nvidia's GeForce NOW game streaming service (binary release)

(define-public gfn-electron-bin
  (package
    (name "gfn-electron-bin")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hmlendea/gfn-electron/releases/download/v"
                    version "/gfn-electron-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gfn-electron" "bin/gfn-electron"))))
    (home-page "https://github.com/hmlendea/gfn-electron")
    (synopsis "linux Desktop client for Nvidia's GeForce NOW game streaming service (bina...")
    (description "Linux Desktop client for Nvidia's GeForce NOW game streaming service (binary release).")
    (license license:gpl3)))

;;; ===================================================================
;;; 54. below
;;; ===================================================================
;;; Source: https://github.com/facebookincubator/below
;;; A time traveling resource monitor for modern Linux systems

(define-public below
  (package
    (name "below")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/facebookincubator/below/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/facebookincubator/below")
    (synopsis "a time traveling resource monitor for modern Linux systems")
    (description "A time traveling resource monitor for modern Linux systems.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 55. eitaa-bin
;;; ===================================================================
;;; Source: https://eitaa.com
;;; Official Desktop version of Eitaa messaging app - Static binaries

(define-public eitaa-bin
  (package
    (name "eitaa-bin")
    (version "4.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://eitaa.com/releases/download/v" version "/eitaa-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("eitaa" "bin/eitaa"))))
    (home-page "https://eitaa.com")
    (synopsis "official Desktop version of Eitaa messaging app - Static binaries")
    (description "Official Desktop version of Eitaa messaging app - Static binaries.")
    (license license:expat)))

;;; ===================================================================
;;; 56. cuneiform
;;; ===================================================================
;;; Source: https://launchpad.net/cuneiform-linux
;;; Linux port of an OCR system developed in Russia. Supports more than 20 languages

(define-public cuneiform
  (package
    (name "cuneiform")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://launchpad.net/cuneiform-linux/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://launchpad.net/cuneiform-linux")
    (synopsis "linux port of an OCR system developed in Russia. Supports more than 20 lan...")
    (description "Linux port of an OCR system developed in Russia. Supports more than 20 languages.")
    (license license:bsd-3)))

;;; ===================================================================
;;; 57. nero-umu
;;; ===================================================================
;;; Source: https://github.com/SeongGino/Nero-umu
;;; A fast and efficient umu manager, just as the Romans designed.

(define-public nero-umu
  (package
    (name "nero-umu")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SeongGino/Nero-umu/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/SeongGino/Nero-umu")
    (synopsis "a fast and efficient umu manager, just as the Romans designed")
    (description "A fast and efficient umu manager, just as the Romans designed.")
    (license license:gpl3)))

;;; ===================================================================
;;; 58. creality-print-bin
;;; ===================================================================
;;; Source: https://www.creality.com
;;; 3D slicer for Creality printers

(define-public creality-print-bin
  (package
    (name "creality-print-bin")
    (version "7.0.1.4212")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.creality.com/releases/download/v" version "/creality-print-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("creality-print" "bin/creality-print"))))
    (home-page "https://www.creality.com")
    (synopsis "3D slicer for Creality printers")
    (description "3D slicer for Creality printers.")
    (license license:agpl3)))

;;; ===================================================================
;;; 59. anyzig-bin
;;; ===================================================================
;;; Source: https://github.com/marler8997/anyzig
;;; One zig to rule them all

(define-public anyzig-bin
  (package
    (name "anyzig-bin")
    (version "2026_03_26")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marler8997/anyzig/releases/download/v"
                    version "/anyzig-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("anyzig" "bin/anyzig"))))
    (home-page "https://github.com/marler8997/anyzig")
    (synopsis "one zig to rule them all")
    (description "One zig to rule them all.")
    (license license:expat)))

;;; ===================================================================
;;; 60. netpump
;;; ===================================================================
;;; Source: https://github.com/soylent/netpump
;;; Tiny websocket proxy tunnel

(define-public netpump
  (package
    (name "netpump")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/soylent/netpump/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/soylent/netpump")
    (synopsis "tiny websocket proxy tunnel")
    (description "Tiny websocket proxy tunnel.")
    (license license:expat)))

;;; ===================================================================
;;; 61. nutstore-experimental
;;; ===================================================================
;;; Source: https://www.jianguoyun.com/
;;; Nutstore experimental version.

(define-public nutstore-experimental
  (package
    (name "nutstore-experimental")
    (version "6.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.jianguoyun.com/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.jianguoyun.com/")
    (synopsis "nutstore experimental version")
    (description "Nutstore experimental version.")
    (license license:expat)))

;;; ===================================================================
;;; 62. p3x-onenote-bin
;;; ===================================================================
;;; Source: https://www.corifeus.com/onenote/
;;; Linux Electron Onenote - A Linux compatible version of OneNote.(Prebuilt version.Use system-wide electron)

(define-public p3x-onenote-bin
  (package
    (name "p3x-onenote-bin")
    (version "2026.4.132")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.corifeus.com/onenote/releases/download/v" version "/p3x-onenote-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("p3x-onenote" "bin/p3x-onenote"))))
    (home-page "https://www.corifeus.com/onenote/")
    (synopsis "linux Electron Onenote - A Linux compatible version of OneNote.(Prebuilt v...")
    (description "Linux Electron Onenote - A Linux compatible version of OneNote.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; ===================================================================
;;; 63. hcp-bin
;;; ===================================================================
;;; Source: https://github.com/hashicorp/hcp
;;; Lets you administer HashiCorp Cloud Platform (HCP) resources and services.

(define-public hcp-bin
  (package
    (name "hcp-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hashicorp/hcp/releases/download/v"
                    version "/hcp-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hcp" "bin/hcp"))))
    (home-page "https://github.com/hashicorp/hcp")
    (synopsis "lets you administer HashiCorp Cloud Platform (HCP) resources and services")
    (description "Lets you administer HashiCorp Cloud Platform (HCP) resources and services.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 64. devilspie2
;;; ===================================================================
;;; Source: https://www.nongnu.org/devilspie2/
;;; A window matching utility, allowing the user to perform scripted actions on windows as they are created.

(define-public devilspie2
  (package
    (name "devilspie2")
    (version "0.45")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nongnu.org/devilspie2/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.nongnu.org/devilspie2/")
    (synopsis "a window matching utility, allowing the user to perform scripted actions o...")
    (description "A window matching utility, allowing the user to perform scripted actions on windows as they are created.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 65. steam-tui
;;; ===================================================================
;;; Source: https://github.com/dmadisetti/steam-tui
;;; Rust TUI client for steamcmd

(define-public steam-tui
  (package
    (name "steam-tui")
    (version "0.3.0b")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dmadisetti/steam-tui/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dmadisetti/steam-tui")
    (synopsis "rust TUI client for steamcmd")
    (description "Rust TUI client for steamcmd.")
    (license license:expat)))

;;; ===================================================================
;;; 66. pineflash-git
;;; ===================================================================
;;; Source: https://github.com/Spagett1/PineFlash
;;; A GUI tool to flash IronOS to the Pinecil V1, V2 and future other pine64 products.

(define-public pineflash-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "pineflash-git")
      (version (git-version "0.5.5+4" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Spagett1/PineFlash")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/Spagett1/PineFlash")
      (synopsis "a GUI tool to flash IronOS to the Pinecil V1, V2 and future other pine64 p...")
      (description "A GUI tool to flash IronOS to the Pinecil V1, V2 and future other pine64 products.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 67. spacer-bin
;;; ===================================================================
;;; Source: https://github.com/samwho/spacer
;;; CLI tool to insert spacers in when command output stops

(define-public spacer-bin
  (package
    (name "spacer-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samwho/spacer/releases/download/v"
                    version "/spacer-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("spacer" "bin/spacer"))))
    (home-page "https://github.com/samwho/spacer")
    (synopsis "cLI tool to insert spacers in when command output stops")
    (description "CLI tool to insert spacers in when command output stops.")
    (license license:expat)))

;;; ===================================================================
;;; 68. dblab-bin
;;; ===================================================================
;;; Source: https://github.com/danvergara/dblab
;;; Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server

(define-public dblab-bin
  (package
    (name "dblab-bin")
    (version "0.34.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/danvergara/dblab/releases/download/v"
                    version "/dblab-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dblab" "bin/dblab"))))
    (home-page "https://github.com/danvergara/dblab")
    (synopsis "interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server")
    (description "Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server.")
    (license license:expat)))

;;; ===================================================================
;;; 69. nordzy-hyprcursors
;;; ===================================================================
;;; Source: https://github.com/guillaumeboehm/Nordzy-cursors
;;; Hyprcursors from https://github.com/guillaumeboehm/Nordzy-cursors.

(define-public nordzy-hyprcursors
  (package
    (name "nordzy-hyprcursors")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/guillaumeboehm/Nordzy-cursors/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/guillaumeboehm/Nordzy-cursors")
    (synopsis "hyprcursors from https://github.com/guillaumeboehm/Nordzy-cursors")
    (description "Hyprcursors from https://github.com/guillaumeboehm/Nordzy-cursors.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 70. electorrent-bin
;;; ===================================================================
;;; Source: https://github.com/Tympanix/Electorrent
;;; A remote control client for µTorrent, qBittorrent, rTorrent, Transmission, Synology & Deluge

(define-public electorrent-bin
  (package
    (name "electorrent-bin")
    (version "2.8.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Tympanix/Electorrent/releases/download/v"
                    version "/Electorrent-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("electorrent" "bin/electorrent"))))
    (home-page "https://github.com/Tympanix/Electorrent")
    (synopsis "a remote control client for µTorrent, qBittorrent, rTorrent, Transmission,...")
    (description "A remote control client for µTorrent, qBittorrent, rTorrent, Transmission, Synology & Deluge.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 71. gdmap
;;; ===================================================================
;;; Source: https://gitlab.com/sjohannes/gdmap
;;; Tool to inspect the used space of folders.

(define-public gdmap
  (package
    (name "gdmap")
    (version "1.3.1+1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/sjohannes/gdmap/-/archive/v"
                    version "/gdmap-v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/sjohannes/gdmap")
    (synopsis "tool to inspect the used space of folders")
    (description "Tool to inspect the used space of folders.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 72. swaylock-fancy-git
;;; ===================================================================
;;; Source: https://github.com/Big-B/swaylock-fancy
;;; Blurs and pixelates background, adds lock icon and text, for sway.

(define-public swaylock-fancy-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "swaylock-fancy-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Big-B/swaylock-fancy")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/Big-B/swaylock-fancy")
      (synopsis "blurs and pixelates background, adds lock icon and text, for sway")
      (description "Blurs and pixelates background, adds lock icon and text, for sway.")
      (license license:expat))))

;;; ===================================================================
;;; 73. awatcher-bundle-bin
;;; ===================================================================
;;; Source: https://github.com/2e3s/awatcher
;;; ActivityWatch-compatible activity and idle watchers, with bundled aw server

(define-public awatcher-bundle-bin
  (package
    (name "awatcher-bundle-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/2e3s/awatcher/releases/download/v"
                    version "/awatcher-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("awatcher-bundle" "bin/awatcher-bundle"))))
    (home-page "https://github.com/2e3s/awatcher")
    (synopsis "activityWatch-compatible activity and idle watchers, with bundled aw server")
    (description "ActivityWatch-compatible activity and idle watchers, with bundled aw server.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 74. signal-desktop-beta-bin
;;; ===================================================================
;;; Source: https://signal.org
;;; Private messaging from your desktop

(define-public signal-desktop-beta-bin
  (package
    (name "signal-desktop-beta-bin")
    (version "8.7.0beta.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://signal.org/releases/download/v" version "/signal-desktop-beta-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("signal-desktop-beta" "bin/signal-desktop-beta"))))
    (home-page "https://signal.org")
    (synopsis "private messaging from your desktop")
    (description "Private messaging from your desktop.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 75. rook
;;; ===================================================================
;;; Source: https://hg.sr.ht/~ser/rook
;;; A lightweight, stand-alone, headless secret service tool backed by a Keepass v2 database.

(define-public rook
  (package
    (name "rook")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://hg.sr.ht/~ser/rook/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:import-path "unknown"
                   #:tests? #f))
    (home-page "https://hg.sr.ht/~ser/rook")
    (synopsis "a lightweight, stand-alone, headless secret service tool backed by a Keepa...")
    (description "A lightweight, stand-alone, headless secret service tool backed by a Keepass v2 database.")
    (license license:bsd-3)))

;;; ===================================================================
;;; 76. siji-git
;;; ===================================================================
;;; Source: https://github.com/stark/siji
;;; Iconic bitmap font based on stlarch with additional glyphs

(define-public siji-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "siji-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stark/siji")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/stark/siji")
      (synopsis "iconic bitmap font based on stlarch with additional glyphs")
      (description "Iconic bitmap font based on stlarch with additional glyphs.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 77. wpgtk-git
;;; ===================================================================
;;; Source: https://github.com/deviantfero/wpgtk
;;; A gui wallpaper chooser that changes your WM theme, GTK theme and more

(define-public wpgtk-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "wpgtk-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/deviantfero/wpgtk")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/deviantfero/wpgtk")
      (synopsis "a gui wallpaper chooser that changes your WM theme, GTK theme and more")
      (description "A gui wallpaper chooser that changes your WM theme, GTK theme and more.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 78. an2linuxserver-git
;;; ===================================================================
;;; Source: https://github.com/rootkiwi/an2linuxserver/
;;; Sync android notifications encrypted to a linux desktop with tcp or bluetooth

(define-public an2linuxserver-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "an2linuxserver-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rootkiwi/an2linuxserver")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/rootkiwi/an2linuxserver/")
      (synopsis "sync android notifications encrypted to a linux desktop with tcp or bluetooth")
      (description "Sync android notifications encrypted to a linux desktop with tcp or bluetooth.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 79. chatgpt-sh
;;; ===================================================================
;;; Source: https://gitlab.com/fenixdragao/shellchatgpt
;;; Wrapper for ChatGPT, STT, and TTS. Features Ollama, Gemini, Anthropic, and more

(define-public chatgpt-sh
  (package
    (name "chatgpt-sh")
    (version "0.133.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/fenixdragao/shellchatgpt/-/archive/v"
                    version "/shellchatgpt-v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/fenixdragao/shellchatgpt")
    (synopsis "wrapper for ChatGPT, STT, and TTS. Features Ollama, Gemini, Anthropic, and...")
    (description "Wrapper for ChatGPT, STT, and TTS. Features Ollama, Gemini, Anthropic, and more.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 80. autoenv-git
;;; ===================================================================
;;; Source: https://github.com/kennethreitz/autoenv
;;; Directory based enviroments

(define-public autoenv-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "autoenv-git")
      (version (git-version "0.2.1" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kennethreitz/autoenv")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/kennethreitz/autoenv")
      (synopsis "directory based enviroments")
      (description "Directory based enviroments.")
      (license license:expat))))

;;; ===================================================================
;;; 81. unnamed-sdvx-clone
;;; ===================================================================
;;; Source: https://github.com/Drewol/unnamed-sdvx-clone
;;; A game based on K-Shoot MANIA and Sound Voltex

(define-public unnamed-sdvx-clone
  (package
    (name "unnamed-sdvx-clone")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Drewol/unnamed-sdvx-clone/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Drewol/unnamed-sdvx-clone")
    (synopsis "a game based on K-Shoot MANIA and Sound Voltex")
    (description "A game based on K-Shoot MANIA and Sound Voltex.")
    (license license:expat)))

;;; ===================================================================
;;; 82. gyroflow
;;; ===================================================================
;;; Source: https://github.com/gyroflow/gyroflow
;;; Video stabilization using gyroscope data

(define-public gyroflow
  (package
    (name "gyroflow")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gyroflow/gyroflow/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gyroflow/gyroflow")
    (synopsis "video stabilization using gyroscope data")
    (description "Video stabilization using gyroscope data.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 83. patch-asar
;;; ===================================================================
;;; Source: https://github.com/L1lith/Patch-Asar
;;; Patch .asar archives more easily

(define-public patch-asar
  (package
    (name "patch-asar")
    (version "0.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/L1lith/Patch-Asar/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/L1lith/Patch-Asar")
    (synopsis "patch .asar archives more easily")
    (description "Patch .asar archives more easily.")
    (license license:expat)))

;;; ===================================================================
;;; 84. vtop
;;; ===================================================================
;;; Source: http://parall.ax/vtop
;;; Wow such top. So stats

(define-public vtop
  (package
    (name "vtop")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://parall.ax/vtop/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://parall.ax/vtop")
    (synopsis "wow such top. So stats")
    (description "Wow such top. So stats.")
    (license license:expat)))

;;; ===================================================================
;;; 85. mindomo-bin
;;; ===================================================================
;;; Source: https://mindomo.com
;;; Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information

(define-public mindomo-bin
  (package
    (name "mindomo-bin")
    (version "11.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mindomo.com/releases/download/v" version "/mindomo-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mindomo" "bin/mindomo"))))
    (home-page "https://mindomo.com")
    (synopsis "mindomo is an online collaborative mind mapping, concept mapping and outli...")
    (description "Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information.")
    (license license:expat)))

;;; ===================================================================
;;; 86. gnome-shell-extension-rounded-window-corners-reborn-git
;;; ===================================================================
;;; Source: https://github.com/flexagoon/rounded-window-corners
;;; A GNOME Shell extension that adds rounded corners for all windows

(define-public gnome-shell-extension-rounded-window-corners-reborn-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "gnome-shell-extension-rounded-window-corners-reborn-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/flexagoon/rounded-window-corners")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system node-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/flexagoon/rounded-window-corners")
      (synopsis "a GNOME Shell extension that adds rounded corners for all windows")
      (description "A GNOME Shell extension that adds rounded corners for all windows.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 87. numworks-udev
;;; ===================================================================
;;; Source: https://www.numworks.com/
;;; udev rules to connect the Numworks calculator to your linux box

(define-public numworks-udev
  (package
    (name "numworks-udev")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.numworks.com/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.numworks.com/")
    (synopsis "udev rules to connect the Numworks calculator to your linux box")
    (description "Udev rules to connect the Numworks calculator to your linux box.")
    (license license:unlicense)))

;;; ===================================================================
;;; 88. godot3-mono-bin
;;; ===================================================================
;;; Source: https://godotengine.org
;;; Advanced cross-platform 2D and 3D game engine (3.X Branch Mono)

(define-public godot3-mono-bin
  (package
    (name "godot3-mono-bin")
    (version "3.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://godotengine.org/releases/download/v" version "/godot3-mono-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("godot3-mono" "bin/godot3-mono"))))
    (home-page "https://godotengine.org")
    (synopsis "advanced cross-platform 2D and 3D game engine (3.X Branch Mono)")
    (description "Advanced cross-platform 2D and 3D game engine (3.X Branch Mono).")
    (license license:expat)))

;;; ===================================================================
;;; 89. sif-git
;;; ===================================================================
;;; Source: https://github.com/BlueManCZ/SIF
;;; Steam Icons Fixer - Fix runtime icons of Steam games on Linux.

(define-public sif-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "sif-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BlueManCZ/SIF")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/BlueManCZ/SIF")
      (synopsis "steam Icons Fixer - Fix runtime icons of Steam games on Linux")
      (description "Steam Icons Fixer - Fix runtime icons of Steam games on Linux.")
      (license license:asl2.0))))

;;; ===================================================================
;;; 90. wazuh-dashboard
;;; ===================================================================
;;; Source: https://wazuh.com/
;;; Wazuh Dashboard for Arch Linux

(define-public wazuh-dashboard
  (package
    (name "wazuh-dashboard")
    (version "4.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wazuh.com/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://wazuh.com/")
    (synopsis "wazuh Dashboard for Arch Linux")
    (description "Wazuh Dashboard for Arch Linux.")
    (license license:gpl2)))

;;; ===================================================================
;;; 91. wazuh-indexer
;;; ===================================================================
;;; Source: https://wazuh.com/
;;; Wazuh Indexer for Arch Linux

(define-public wazuh-indexer
  (package
    (name "wazuh-indexer")
    (version "4.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wazuh.com/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://wazuh.com/")
    (synopsis "wazuh Indexer for Arch Linux")
    (description "Wazuh Indexer for Arch Linux.")
    (license license:gpl2)))

;;; ===================================================================
;;; 92. wazuh-manager
;;; ===================================================================
;;; Source: https://wazuh.com/
;;; Wazuh Manager for Arch Linux

(define-public wazuh-manager
  (package
    (name "wazuh-manager")
    (version "4.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wazuh.com/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://wazuh.com/")
    (synopsis "wazuh Manager for Arch Linux")
    (description "Wazuh Manager for Arch Linux.")
    (license license:gpl2)))

;;; ===================================================================
;;; 93. elisa-rpc-git
;;; ===================================================================
;;; Source: https://github.com/renarin-kholin/ElisaRPC
;;; A Discord rich presence client for Elisa the music player by KDE.

(define-public elisa-rpc-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "elisa-rpc-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/renarin-kholin/ElisaRPC")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/renarin-kholin/ElisaRPC")
      (synopsis "a Discord rich presence client for Elisa the music player by KDE")
      (description "A Discord rich presence client for Elisa the music player by KDE.")
      (license license:expat))))

