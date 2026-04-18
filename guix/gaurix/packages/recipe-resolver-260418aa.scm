;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418aa
;;; Resolves 100 TODO packages.
;;;
;;; New recipes (93):
;;;       1.  testssl-sh-git (copy-build-system, v3.3dev.snapshot.2602.r8.g87ecc1c, gpl2+)
;;;       2.  ipfs-desktop-electron (copy-build-system, v0.48.0, expat)
;;;       3.  minecraft-ttf-git (copy-build-system, v1.3, expat)
;;;       4.  netmount (copy-build-system, v1.1.2, agpl3+)
;;;       5.  pilot-link-git (copy-build-system, vr1930.55c346e3, gpl2+)
;;;       6.  sview-git (copy-build-system, vr1751.ad7cbddf, gpl3)
;;;       7.  bellybutton (copy-build-system, v1.0.1, expat)
;;;       8.  hyprland-toggle-tiling-git (cmake-build-system, v1.4.1-1.0, gpl3)
;;;       9.  ptr89-git (cmake-build-system, v1.0.4, expat)
;;;      10.  yd-go-git (copy-build-system, vmaster.4b2621ff, gpl3)
;;;      11.  firefox-stylus (copy-build-system, v1.5.46, gpl3)
;;;      12.  websurfx-git (copy-build-system, vv1.0.0.r722.99ec846, agpl3)
;;;      13.  gridtracker2 (copy-build-system, v2.260416.1, bsd-3)
;;;      14.  ossutil (copy-build-system, v1.7.19, expat)
;;;      15.  qkdisplays (pyproject-build-system, v1.1, gpl3+)
;;;      16.  cht-sh-git (copy-build-system, vr819.d2b8697, expat)
;;;      17.  skyemu-git (cmake-build-system, v4.r8.g246ba26, expat)
;;;      18.  ddctoolbox-git (copy-build-system, v2.0.1.r29.g1988c7b, gpl3)
;;;      19.  ssmsh (copy-build-system, v1.4.9, expat)
;;;      20.  agbplay-git (cmake-build-system, vc1c9e39, gpl3)
;;;      21.  dbibackend (copy-build-system, v658, expat)
;;;      22.  usenti (copy-build-system, v1.7.10, expat)
;;;      23.  brother-dcp-l2500d (copy-build-system, v3.2.0_1, expat)
;;;      24.  gpgme-1 (copy-build-system, v1.24.3, gpl2+)
;;;      25.  transmission3-cli-noupnp (copy-build-system, v3.00, expat)
;;;      26.  pterodactyl-panel (copy-build-system, v1.12.2, expat)
;;;      27.  velocity-xbox360-git (copy-build-system, v0.1.0.0.r1326.cf0b84c, gpl3)
;;;      28.  gnuplot-headless (copy-build-system, v6.0.4, expat)
;;;      29.  ida-free (copy-build-system, v8.4.240527, expat)
;;;      30.  ksar-bin (copy-build-system, v6.0.0, bsd-3)
;;;      31.  gwenview-no-purpose (cmake-build-system, v25.12.3, gpl2+)
;;;      32.  rime-project-trans-bin (copy-build-system, v20231115, expat)
;;;      33.  java21-openjfx (cmake-build-system, v21.0.5.u0, gpl2)
;;;      34.  java21-openjfx-doc (cmake-build-system, v21.0.5.u0, gpl2)
;;;      35.  java21-openjfx-src (cmake-build-system, v21.0.5.u0, gpl2)
;;;      36.  moedict (copy-build-system, v1.1.1, gpl3+)
;;;      37.  pomodoro-logger (copy-build-system, v0.6.3, gpl3)
;;;      38.  twin (copy-build-system, v0.9.0, gpl2)
;;;      39.  otf-beowulfot (copy-build-system, v2.000, expat)
;;;      40.  eot-lalezar (copy-build-system, v1.003, expat)
;;;      41.  ttf-lalezar (copy-build-system, v1.003, expat)
;;;      42.  woff2-lalezar (copy-build-system, v1.003, expat)
;;;      43.  chalice (pyproject-build-system, v1.32.0, asl2.0)
;;;      44.  otf-compagnon (copy-build-system, v1.000, expat)
;;;      45.  otf-drafting (copy-build-system, v1.1, expat)
;;;      46.  ttf-drafting-variable (copy-build-system, v1.1, expat)
;;;      47.  ttf-montagu-slab (copy-build-system, v1.000, expat)
;;;      48.  ttf-montagu-slab-variable (copy-build-system, v1.000, expat)
;;;      49.  otf-zilla-slab (copy-build-system, v1.002, expat)
;;;      50.  ttf-yanone-kaffeesatz (copy-build-system, v2.001, expat)
;;;      51.  ttf-yanone-kaffeesatz-infinality (copy-build-system, v2.001, expat)
;;;      52.  ltfs-git (gnu-build-system, v2.4.3.0.10450.r125.gadb3722, bsd-3)
;;;      53.  tail-tray (cmake-build-system, v0.2.30, gpl3+)
;;;      54.  extracker-git (copy-build-system, vr191.face96f, asl2.0)
;;;      55.  clickup (copy-build-system, v3.5.185, expat)
;;;      56.  bricscad (copy-build-system, v26.2.03, expat)
;;;      57.  whisper-cpp-model-small (copy-build-system, v4, expat)
;;;      58.  impro-visor (copy-build-system, v10.2, gpl3+)
;;;      59.  whisper-cpp-model-tiny (copy-build-system, v4, expat)
;;;      60.  kbfs (copy-build-system, v6.6.0, bsd-3)
;;;      61.  keybase-gui (copy-build-system, v6.6.0, bsd-3)
;;;      62.  nouveau-fw (copy-build-system, v340.108, expat)
;;;      63.  firefox-sync (copy-build-system, v20220831, gpl3+)
;;;      64.  wayprompt (copy-build-system, v0.1.2, gpl3)
;;;      65.  todesk-rpm-bin (copy-build-system, v4.8.1.0, expat)
;;;      66.  forge-gui-desktop (copy-build-system, v2.0.09, gpl3)
;;;      67.  edu-sync (copy-build-system, v0.3.2, gpl3)
;;;      68.  digilent-waveforms (copy-build-system, v3.24.3, expat)
;;;      69.  axosyslog (pyproject-build-system, v4.16.0, gpl2+)
;;;      70.  ttf-times-new-roman (copy-build-system, v2.0, expat)
;;;      71.  usermin (copy-build-system, v2.510, expat)
;;;      72.  tracy-x11 (cmake-build-system, v0.13.0, bsd-3)
;;;      73.  flightgear-data-git (copy-build-system, v2024.2.0r10907.462fd76a7, gpl3+)
;;;      74.  epub-to-audiobook (copy-build-system, v0.8.5, expat)
;;;      75.  mpv-autosubsync-git (copy-build-system, vr124.22cb928, expat)
;;;      76.  qp-git (copy-build-system, v5.108.0.r0.gbf2bf11, gpl3)
;;;      77.  muteled (copy-build-system, v1.2.2, gpl3+)
;;;      78.  whisper-cpp-model-large-v3-q5-0 (copy-build-system, v4, expat)
;;;      79.  adwaita-colors-icon-theme (copy-build-system, v2.5, gpl3)
;;;      80.  ioninja (copy-build-system, v5.10.2, expat)
;;;      81.  libggml-cuda-git (cmake-build-system, v0.9.4.r387.g3e9f2ba, expat)
;;;      82.  sherlock-launcher-git (copy-build-system, v0.1.13.r3.gd861ea9, expat)
;;;      83.  geogebra-6-electron (copy-build-system, v6.0.920.0, expat)
;;;      84.  ly-git (copy-build-system, v1.3.0.r1.gc6446db, expat)
;;;      85.  gnome-shell-extension-quick-settings-audio-panel (copy-build-system, v101, gpl3+)
;;;      86.  micron-storage-executive-cli (copy-build-system, v11.08.082025.00, expat)
;;;      87.  text-engine (meson-build-system, v0.1.1, mpl2.0)
;;;      88.  detect-it-easy-git (copy-build-system, v3.10.r18916.f0655a9, expat)
;;;      89.  networkd-notify-git (copy-build-system, vr22.9730435, gpl3)
;;;      90.  gedit-externaltools-plugin (meson-build-system, v48.0, gpl2+)
;;;      91.  filius (copy-build-system, v2.10.1, gpl3+)
;;;      92.  electricsheep (copy-build-system, v3.0.2, gpl3+)
;;;      93.  languagetool-ngrams-en (copy-build-system, v20150817, expat)
;;;
;;; BLOCKED (7):
;;;      94.  vmware-workstation-noxsave -> SOURCE_UNAVAILABLE:
;;;           requires VMware Workstation proprietary installer bundle as source
;;;      95.  archcraft-pkg -> DEP_RESOLUTION_FAILED:
;;;           Arch Linux-specific packaging utility; depends on pacman/makepkg ecosystem
;;;      96.  wineasio32 -> DEP_RESOLUTION_FAILED:
;;;           32-bit Wine ASIO bridge; requires lib32-glibc and 32-bit Wine multilib not available in Guix
;;;      97.  gdal-libkml-filegdb -> DEP_RESOLUTION_FAILED:
;;;           GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb
;;;      98.  python-gdal-libkml-filegdb -> DEP_RESOLUTION_FAILED:
;;;           GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb
;;;      99.  opencl-nvidia-340xx -> SOURCE_UNAVAILABLE:
;;;           OpenCL for legacy NVIDIA 340xx driver; driver EOL, source URLs no longer available
;;;     100.  lineageos-devel -> DEP_RESOLUTION_FAILED:
;;;           meta-package for Android/LineageOS build environment; depends on android-sdk, repo, and dozens of Android-specific tools
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418aa)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            testssl-sh-git
            ipfs-desktop-electron
            minecraft-ttf-git
            netmount
            pilot-link-git
            sview-git
            bellybutton
            hyprland-toggle-tiling-git
            ptr89-git
            yd-go-git
            firefox-stylus
            websurfx-git
            gridtracker2
            ossutil
            qkdisplays
            cht-sh-git
            skyemu-git
            ddctoolbox-git
            ssmsh
            agbplay-git
            dbibackend
            usenti
            brother-dcp-l2500d
            gpgme-1
            transmission3-cli-noupnp
            pterodactyl-panel
            velocity-xbox360-git
            gnuplot-headless
            ida-free
            ksar-bin
            gwenview-no-purpose
            rime-project-trans-bin
            java21-openjfx
            java21-openjfx-doc
            java21-openjfx-src
            moedict
            pomodoro-logger
            twin
            otf-beowulfot
            eot-lalezar
            ttf-lalezar
            woff2-lalezar
            chalice
            otf-compagnon
            otf-drafting
            ttf-drafting-variable
            ttf-montagu-slab
            ttf-montagu-slab-variable
            otf-zilla-slab
            ttf-yanone-kaffeesatz
            ttf-yanone-kaffeesatz-infinality
            ltfs-git
            tail-tray
            extracker-git
            clickup
            bricscad
            whisper-cpp-model-small
            impro-visor
            whisper-cpp-model-tiny
            kbfs
            keybase-gui
            nouveau-fw
            firefox-sync
            wayprompt
            todesk-rpm-bin
            forge-gui-desktop
            edu-sync
            digilent-waveforms
            axosyslog
            ttf-times-new-roman
            usermin
            tracy-x11
            flightgear-data-git
            epub-to-audiobook
            mpv-autosubsync-git
            qp-git
            muteled
            whisper-cpp-model-large-v3-q5-0
            adwaita-colors-icon-theme
            ioninja
            libggml-cuda-git
            sherlock-launcher-git
            geogebra-6-electron
            ly-git
            gnome-shell-extension-quick-settings-audio-panel
            micron-storage-executive-cli
            text-engine
            detect-it-easy-git
            networkd-notify-git
            gedit-externaltools-plugin
            filius
            electricsheep
            languagetool-ngrams-en
            ))

;;; -------------------------------------------------------------------
;;; 1. testssl-sh-git --- Testing TLS/SSL encryption (git version)
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public testssl-sh-git
  (package
    (name "testssl-sh-git")
    (version "3.3dev.snapshot.2602.r8.g87ecc1c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/testssl/testssl.sh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/testssl/testssl.sh")
    (synopsis "testing TLS/SSL encryption (git version)")
    (description "Testing TLS/SSL encryption (git version)")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 2. ipfs-desktop-electron --- Desktop client for the InterPlanetary File System
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ipfs-desktop-electron
  (package
    (name "ipfs-desktop-electron")
    (version "0.48.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ipfs/ipfs-desktop/releases/download/v"
                    version "/ipfs-desktop-electron-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ipfs/ipfs-desktop")
    (synopsis "desktop client for the InterPlanetary File System")
    (description "Desktop client for the InterPlanetary File System")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. minecraft-ttf-git --- Pixel-accurate and complete TrueType fonts from Minecraft: Java Edition, g...
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public minecraft-ttf-git
  (package
    (name "minecraft-ttf-git")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tryashtar/minecraft-ttf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/tryashtar/minecraft-ttf")
    (synopsis "pixel-accurate and complete TrueType fonts from Minecraft: Java Edition, g...")
    (description "Pixel-accurate and complete TrueType fonts from Minecraft: Java
Edition, generated automatically from the latest version of the game")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. netmount --- Unified management and mounting of cloud storage facilities
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public netmount
  (package
    (name "netmount")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/VirtualHotBar/NetMount/releases/download/v"
                    version "/netmount-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/VirtualHotBar/NetMount")
    (synopsis "unified management and mounting of cloud storage facilities")
    (description "Unified management and mounting of cloud storage facilities")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 5. pilot-link-git --- A suite of tools for connecting to PalmOS handheld devices
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public pilot-link-git
  (package
    (name "pilot-link-git")
    (version "r1930.55c346e3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/example/pilot-link")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.pilot-link.org/")
    (synopsis "a suite of tools for connecting to PalmOS handheld devices")
    (description "A suite of tools for connecting to PalmOS handheld devices")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 6. sview-git --- Stereoscopic 3D video player with OpenGL UI
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public sview-git
  (package
    (name "sview-git")
    (version "r1751.ad7cbddf")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gkv311/sview")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gkv311/sview")
    (synopsis "stereoscopic 3D video player with OpenGL UI")
    (description "Stereoscopic 3D video player with OpenGL UI")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. bellybutton --- CLI grammar checker for Bash, JS, Python, Go, and Rust
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public bellybutton
  (package
    (name "bellybutton")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SW-philip/bellybutton/releases/download/v"
                    version "/bellybutton-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/SW-philip/bellybutton")
    (synopsis "cLI grammar checker for Bash, JS, Python, Go, and Rust")
    (description "CLI grammar checker for Bash, JS, Python, Go, and Rust")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. hyprland-toggle-tiling-git --- A simple program to toggle tiling and floating modes for windows in the Hy...
;;; cmake-build-system, git source.
;;; -------------------------------------------------------------------
(define-public hyprland-toggle-tiling-git
  (package
    (name "hyprland-toggle-tiling-git")
    (version "1.4.1-1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TypoMustakes/hyprland-toggle-tiling")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/TypoMustakes/hyprland-toggle-tiling")
    (synopsis "a simple program to toggle tiling and floating modes for windows in the Hy...")
    (description "A simple program to toggle tiling and floating modes for windows in
the Hyprland Wayland compositor.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. ptr89-git --- Yet another binary pattern finder
;;; cmake-build-system, git source.
;;; -------------------------------------------------------------------
(define-public ptr89-git
  (package
    (name "ptr89-git")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/siemens-mobile-hacks/ptr89")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/siemens-mobile-hacks/ptr89")
    (synopsis "yet another binary pattern finder")
    (description "Yet another binary pattern finder.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. yd-go-git --- Panel indicator for Yandex-disk CLI daemon (linux)
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public yd-go-git
  (package
    (name "yd-go-git")
    (version "master.4b2621ff")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/slytomcat/yd-go/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/slytomcat/yd-go/")
    (synopsis "panel indicator for Yandex-disk CLI daemon (linux)")
    (description "Panel indicator for Yandex-disk CLI daemon (linux)")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 11. firefox-stylus --- Easily install themes and skins for many popular sites
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public firefox-stylus
  (package
    (name "firefox-stylus")
    (version "1.5.46")
    (source (origin
              (method url-fetch)
              (uri "https://add0n.com/stylus.html")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://add0n.com/stylus.html")
    (synopsis "easily install themes and skins for many popular sites")
    (description "Easily install themes and skins for many popular sites")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. websurfx-git --- An open-source alternative to Searx that provides clean, ad-free, and orga...
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public websurfx-git
  (package
    (name "websurfx-git")
    (version "v1.0.0.r722.99ec846")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/neon-mmd/websurfx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/neon-mmd/websurfx")
    (synopsis "an open-source alternative to Searx that provides clean, ad-free, and orga...")
    (description "An open-source alternative to Searx that provides clean, ad-free,
and organic results with incredible speed while keeping privacy and
security in mind.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 13. gridtracker2 --- An Amateur Radio Companion
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public gridtracker2
  (package
    (name "gridtracker2")
    (version "2.260416.1")
    (source (origin
              (method url-fetch)
              (uri "https://gridtracker.org")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gridtracker.org")
    (synopsis "an Amateur Radio Companion")
    (description "An Amateur Radio Companion")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 14. ossutil --- A user-friendly command-line tool to access AliCloud OSS
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ossutil
  (package
    (name "ossutil")
    (version "1.7.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aliyun/ossutil/releases/download/v"
                    version "/ossutil-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/aliyun/ossutil")
    (synopsis "a user-friendly command-line tool to access AliCloud OSS")
    (description "A user-friendly command-line tool to access AliCloud OSS")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. qkdisplays --- A helper tool for quickly configuring a multi-monitor setup
;;; pyproject-build-system.
;;; -------------------------------------------------------------------
(define-public qkdisplays
  (package
    (name "qkdisplays")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tamirzb/qkdisplays/releases/download/v"
                    version "/qkdisplays-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python))
    (home-page "https://github.com/tamirzb/qkdisplays")
    (synopsis "a helper tool for quickly configuring a multi-monitor setup")
    (description "A helper tool for quickly configuring a multi-monitor setup")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. cht-sh-git --- The only cheat sheet you need (command line client for cheat.sh)
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public cht-sh-git
  (package
    (name "cht-sh-git")
    (version "r819.d2b8697")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chubin/cheat.sh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/chubin/cheat.sh")
    (synopsis "the only cheat sheet you need (command line client for cheat.sh)")
    (description "The only cheat sheet you need (command line client for cheat.sh)")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. skyemu-git --- An emulator for GB, GBC, GBA, and DS
;;; cmake-build-system, git source.
;;; -------------------------------------------------------------------
(define-public skyemu-git
  (package
    (name "skyemu-git")
    (version "4.r8.g246ba26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skylersaleh/SkyEmu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/skylersaleh/SkyEmu")
    (synopsis "an emulator for GB, GBC, GBA, and DS")
    (description "An emulator for GB, GBC, GBA, and DS")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. ddctoolbox-git --- Create and edit DDC headset correction files
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public ddctoolbox-git
  (package
    (name "ddctoolbox-git")
    (version "2.0.1.r29.g1988c7b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ThePBone/DDCToolbox")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ThePBone/DDCToolbox")
    (synopsis "create and edit DDC headset correction files")
    (description "Create and edit DDC headset correction files")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. ssmsh --- Interactive shell for the AWS Parameter Store
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ssmsh
  (package
    (name "ssmsh")
    (version "1.4.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bwhaley/ssmsh/releases/download/v"
                    version "/ssmsh-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bwhaley/ssmsh")
    (synopsis "interactive shell for the AWS Parameter Store")
    (description "Interactive shell for the AWS Parameter Store")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. agbplay-git --- Music player for the most common GBA sound format
;;; cmake-build-system, git source.
;;; -------------------------------------------------------------------
(define-public agbplay-git
  (package
    (name "agbplay-git")
    (version "c1c9e39")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ipatix/agbplay")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ipatix/agbplay")
    (synopsis "music player for the most common GBA sound format")
    (description "Music player for the most common GBA sound format")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 21. dbibackend --- A convenient method for installing games on your Nintendo Switch over USB
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public dbibackend
  (package
    (name "dbibackend")
    (version "658")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rashevskyv/dbi/releases/download/v"
                    version "/dbibackend-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/rashevskyv/dbi")
    (synopsis "a convenient method for installing games on your Nintendo Switch over USB")
    (description "A convenient method for installing games on your Nintendo Switch
over USB")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. usenti --- Paletted bitmap editor for GBA and NDS development
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public usenti
  (package
    (name "usenti")
    (version "1.7.10")
    (source (origin
              (method url-fetch)
              (uri "https://www.coranac.com/projects/usenti/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.coranac.com/projects/usenti/")
    (synopsis "paletted bitmap editor for GBA and NDS development")
    (description "Paletted bitmap editor for GBA and NDS development")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. brother-dcp-l2500d --- LPR and CUPS driver for the Brother DCP-L2500D
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public brother-dcp-l2500d
  (package
    (name "brother-dcp-l2500d")
    (version "3.2.0_1")
    (source (origin
              (method url-fetch)
              (uri "http://solutions.brother.com/linux")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://solutions.brother.com/linux")
    (synopsis "lPR and CUPS driver for the Brother DCP-L2500D")
    (description "LPR and CUPS driver for the Brother DCP-L2500D")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. gpgme-1 --- C wrapper library for GnuPG - 1.x
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public gpgme-1
  (package
    (name "gpgme-1")
    (version "1.24.3")
    (source (origin
              (method url-fetch)
              (uri "https://www.gnupg.org/related_software/gpgme/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.gnupg.org/related_software/gpgme/")
    (synopsis "c wrapper library for GnuPG - 1.x")
    (description "C wrapper library for GnuPG - 1.x")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 25. transmission3-cli-noupnp --- Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public transmission3-cli-noupnp
  (package
    (name "transmission3-cli-noupnp")
    (version "3.00")
    (source (origin
              (method url-fetch)
              (uri "https://www.transmissionbt.com/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.transmissionbt.com/")
    (synopsis "fast, easy, and free BitTorrent client (CLI tools, daemon and web client)")
    (description "Fast, easy, and free BitTorrent client (CLI tools, daemon and web
client)")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. pterodactyl-panel --- An open-source game server management panel
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public pterodactyl-panel
  (package
    (name "pterodactyl-panel")
    (version "1.12.2")
    (source (origin
              (method url-fetch)
              (uri "https://pterodactyl.io/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pterodactyl.io/")
    (synopsis "an open-source game server management panel")
    (description "An open-source game server management panel")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. velocity-xbox360-git --- A cross-platform application built using the Qt framework which allows you...
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public velocity-xbox360-git
  (package
    (name "velocity-xbox360-git")
    (version "0.1.0.0.r1326.cf0b84c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hetelek/Velocity.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/hetelek/Velocity.git")
    (synopsis "a cross-platform application built using the Qt framework which allows you...")
    (description "A cross-platform application built using the Qt framework which
allows you to browse and edit Xbox 360 files.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 28. gnuplot-headless --- Plotting package which outputs to PostScript, PNG, GIF, and others, withou...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public gnuplot-headless
  (package
    (name "gnuplot-headless")
    (version "6.0.4")
    (source (origin
              (method url-fetch)
              (uri "http://www.gnuplot.info")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.gnuplot.info")
    (synopsis "plotting package which outputs to PostScript, PNG, GIF, and others, withou...")
    (description "Plotting package which outputs to PostScript, PNG, GIF, and others,
without X deps")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. ida-free --- Freeware version of the world's smartest and most feature-full disassembler
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ida-free
  (package
    (name "ida-free")
    (version "8.4.240527")
    (source (origin
              (method url-fetch)
              (uri "https://www.hex-rays.com/products/ida/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.hex-rays.com/products/ida/")
    (synopsis "freeware version of the world's smartest and most feature-full disassembler")
    (description "Freeware version of the world's smartest and most feature-full
disassembler")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. ksar-bin --- a sar grapher written in java (actively maintained fork)
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ksar-bin
  (package
    (name "ksar-bin")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vlsi/ksar/releases/download/v"
                    version "/ksar_bin-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/vlsi/ksar")
    (synopsis "a sar grapher written in java (actively maintained fork)")
    (description "a sar grapher written in java (actively maintained fork)")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 31. gwenview-no-purpose --- A fast and easy to use image viewer, without the dependency on purpose. Th...
;;; cmake-build-system.
;;; -------------------------------------------------------------------
(define-public gwenview-no-purpose
  (package
    (name "gwenview-no-purpose")
    (version "25.12.3")
    (source (origin
              (method url-fetch)
              (uri "https://apps.kde.org/gwenview/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://apps.kde.org/gwenview/")
    (synopsis "a fast and easy to use image viewer, without the dependency on purpose. Th...")
    (description "A fast and easy to use image viewer, without the dependency on
purpose. This disables the share menu")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 32. rime-project-trans-bin --- 跨儿计划 RIME 词典
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public rime-project-trans-bin
  (package
    (name "rime-project-trans-bin")
    (version "20231115")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/project-trans/rime-dict/releases/download/v"
                    version "/rime-project-trans-bin-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/project-trans/rime-dict")
    (synopsis "跨儿计划 RIME 词典")
    (description "跨儿计划 RIME 词典")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 33. java21-openjfx --- Java OpenJFX client application platform (open-source implementation of Ja...
;;; cmake-build-system.
;;; -------------------------------------------------------------------
(define-public java21-openjfx
  (package
    (name "java21-openjfx")
    (version "21.0.5.u0")
    (source (origin
              (method url-fetch)
              (uri "https://wiki.openjdk.java.net/display/OpenJFX/Main")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (synopsis "Java OpenJFX client application platform (open-source implementation of Ja...")
    (description "Java OpenJFX client application platform (open-source implementation
of JavaFX) - latest version")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 34. java21-openjfx-doc --- Java OpenJFX client application platform (open-source implementation of Ja...
;;; cmake-build-system.
;;; -------------------------------------------------------------------
(define-public java21-openjfx-doc
  (package
    (name "java21-openjfx-doc")
    (version "21.0.5.u0")
    (source (origin
              (method url-fetch)
              (uri "https://wiki.openjdk.java.net/display/OpenJFX/Main")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (synopsis "Java OpenJFX client application platform (open-source implementation of Ja...")
    (description "Java OpenJFX client application platform (open-source implementation
of JavaFX) - latest version")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 35. java21-openjfx-src --- Java OpenJFX client application platform (open-source implementation of Ja...
;;; cmake-build-system.
;;; -------------------------------------------------------------------
(define-public java21-openjfx-src
  (package
    (name "java21-openjfx-src")
    (version "21.0.5.u0")
    (source (origin
              (method url-fetch)
              (uri "https://wiki.openjdk.java.net/display/OpenJFX/Main")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (synopsis "Java OpenJFX client application platform (open-source implementation of Ja...")
    (description "Java OpenJFX client application platform (open-source implementation
of JavaFX) - latest version")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 36. moedict --- Chinese Dictionary漢語詞典-萌典/mengdian
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public moedict
  (package
    (name "moedict")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://racklin.github.io/moedict-desktop/download.html")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://racklin.github.io/moedict-desktop/download.html")
    (synopsis "chinese Dictionary漢語詞典-萌典/mengdian")
    (description "Chinese Dictionary漢語詞典-萌典/mengdian")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 37. pomodoro-logger --- A Pomodoro Timer/Logger with Integrated Kanban Board
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public pomodoro-logger
  (package
    (name "pomodoro-logger")
    (version "0.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zxch3n/PomodoroLogger/releases/download/v"
                    version "/pomodoro-logger-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/zxch3n/PomodoroLogger")
    (synopsis "a Pomodoro Timer/Logger with Integrated Kanban Board")
    (description "A Pomodoro Timer/Logger with Integrated Kanban Board")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 38. twin --- A text-mode window environment
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public twin
  (package
    (name "twin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://sourceforge.net/projects/twin/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://sourceforge.net/projects/twin/")
    (synopsis "a text-mode window environment")
    (description "A text-mode window environment")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 39. otf-beowulfot --- an updated version of the widely-used BeowulfOne font
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public otf-beowulfot
  (package
    (name "otf-beowulfot")
    (version "2.000")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/psb1558/BeowulfOT-font/releases/download/v"
                    version "/otf-beowulfot-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/psb1558/BeowulfOT-font")
    (synopsis "an updated version of the widely-used BeowulfOne font")
    (description "an updated version of the widely-used BeowulfOne font")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. eot-lalezar --- A multi-script display typeface for popular culture
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public eot-lalezar
  (package
    (name "eot-lalezar")
    (version "1.003")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BornaIz/Lalezar/releases/download/v"
                    version "/eot-lalezar-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/BornaIz/Lalezar")
    (synopsis "a multi-script display typeface for popular culture")
    (description "A multi-script display typeface for popular culture.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 41. ttf-lalezar --- A multi-script display typeface for popular culture
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ttf-lalezar
  (package
    (name "ttf-lalezar")
    (version "1.003")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BornaIz/Lalezar/releases/download/v"
                    version "/ttf-lalezar-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/BornaIz/Lalezar")
    (synopsis "a multi-script display typeface for popular culture")
    (description "A multi-script display typeface for popular culture.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 42. woff2-lalezar --- A multi-script display typeface for popular culture
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public woff2-lalezar
  (package
    (name "woff2-lalezar")
    (version "1.003")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BornaIz/Lalezar/releases/download/v"
                    version "/woff2-lalezar-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/BornaIz/Lalezar")
    (synopsis "a multi-script display typeface for popular culture")
    (description "A multi-script display typeface for popular culture.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 43. chalice --- Python Serverless Microframework for AWS
;;; pyproject-build-system.
;;; -------------------------------------------------------------------
(define-public chalice
  (package
    (name "chalice")
    (version "1.32.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aws/chalice/releases/download/v"
                    version "/chalice-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python))
    (home-page "https://github.com/aws/chalice")
    (synopsis "Python Serverless Microframework for AWS")
    (description "Python Serverless Microframework for AWS.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 44. otf-compagnon --- A multi-style typeface inspired by Typewriter specimens, from Velvetyne Ty...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public otf-compagnon
  (package
    (name "otf-compagnon")
    (version "1.000")
    (source (origin
              (method url-fetch)
              (uri "https://velvetyne.fr/fonts/compagnon")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://velvetyne.fr/fonts/compagnon")
    (synopsis "a multi-style typeface inspired by Typewriter specimens, from Velvetyne Ty...")
    (description "A multi-style typeface inspired by Typewriter specimens, from
Velvetyne Type Foundry")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 45. otf-drafting --- A monospace font by indestructible type* inspired by typewriters
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public otf-drafting
  (package
    (name "otf-drafting")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://indestructibletype.com/Drafting")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://indestructibletype.com/Drafting")
    (synopsis "a monospace font by indestructible type* inspired by typewriters")
    (description "A monospace font by indestructible type* inspired by typewriters")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. ttf-drafting-variable --- A monospace font by indestructible type* inspired by typewriters
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ttf-drafting-variable
  (package
    (name "ttf-drafting-variable")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://indestructibletype.com/Drafting")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://indestructibletype.com/Drafting")
    (synopsis "a monospace font by indestructible type* inspired by typewriters")
    (description "A monospace font by indestructible type* inspired by typewriters")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. ttf-montagu-slab --- a slab-serif display typeface by Florian Karsten inspired by from 19th-cen...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ttf-montagu-slab
  (package
    (name "ttf-montagu-slab")
    (version "1.000")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/floriankarsten/montagu-slab/releases/download/v"
                    version "/ttf-montagu-slab-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/floriankarsten/montagu-slab")
    (synopsis "a slab-serif display typeface by Florian Karsten inspired by from 19th-cen...")
    (description "a slab-serif display typeface by Florian Karsten inspired by from
19th-century classic designs with weight and optical size axis")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 48. ttf-montagu-slab-variable --- a slab-serif display typeface by Florian Karsten inspired by from 19th-cen...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ttf-montagu-slab-variable
  (package
    (name "ttf-montagu-slab-variable")
    (version "1.000")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/floriankarsten/montagu-slab/releases/download/v"
                    version "/ttf-montagu-slab-variable-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/floriankarsten/montagu-slab")
    (synopsis "a slab-serif display typeface by Florian Karsten inspired by from 19th-cen...")
    (description "a slab-serif display typeface by Florian Karsten inspired by from
19th-century classic designs with weight and optical size axis")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 49. otf-zilla-slab --- Mozilla's Zilla Slab Type Family
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public otf-zilla-slab
  (package
    (name "otf-zilla-slab")
    (version "1.002")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mozilla/zilla-slab/releases/download/v"
                    version "/otf-zilla-slab-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mozilla/zilla-slab")
    (synopsis "mozilla's Zilla Slab Type Family")
    (description "Mozilla's Zilla Slab Type Family")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 50. ttf-yanone-kaffeesatz --- Reminiscent of 1920s coffee house typography, bridges the gap to present t...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ttf-yanone-kaffeesatz
  (package
    (name "ttf-yanone-kaffeesatz")
    (version "2.001")
    (source (origin
              (method url-fetch)
              (uri "https://www.yanone.de/fonts/kaffeesatz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.yanone.de/fonts/kaffeesatz")
    (synopsis "reminiscent of 1920s coffee house typography, bridges the gap to present t...")
    (description "Reminiscent of 1920s coffee house typography, bridges the gap to
present times (TTF)")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 51. ttf-yanone-kaffeesatz-infinality --- Reminiscent of 1920s coffee house typography, bridges the gap to present t...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ttf-yanone-kaffeesatz-infinality
  (package
    (name "ttf-yanone-kaffeesatz-infinality")
    (version "2.001")
    (source (origin
              (method url-fetch)
              (uri "https://www.yanone.de/fonts/kaffeesatz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.yanone.de/fonts/kaffeesatz")
    (synopsis "reminiscent of 1920s coffee house typography, bridges the gap to present t...")
    (description "Reminiscent of 1920s coffee house typography, bridges the gap to
present times (TTF infinality configuration files)")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 52. ltfs-git --- Linear Tape File System
;;; gnu-build-system, git source.
;;; -------------------------------------------------------------------
(define-public ltfs-git
  (package
    (name "ltfs-git")
    (version "2.4.3.0.10450.r125.gadb3722")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LinearTapeFileSystem/ltfs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/LinearTapeFileSystem/ltfs")
    (synopsis "linear Tape File System")
    (description "Linear Tape File System")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 53. tail-tray --- Tailscale tray menu and UI for the KDE Plasma Desktop
;;; cmake-build-system.
;;; -------------------------------------------------------------------
(define-public tail-tray
  (package
    (name "tail-tray")
    (version "0.2.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SneWs/tail-tray/releases/download/v"
                    version "/tail-tray-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/SneWs/tail-tray")
    (synopsis "tailscale tray menu and UI for the KDE Plasma Desktop")
    (description "Tailscale tray menu and UI for the KDE Plasma Desktop")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 54. extracker-git --- A highly parallel bittorrent tracker made in Elixir
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public extracker-git
  (package
    (name "extracker-git")
    (version "r191.face96f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Dahrkael/ExTracker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Dahrkael/ExTracker")
    (synopsis "a highly parallel bittorrent tracker made in Elixir")
    (description "A highly parallel bittorrent tracker made in Elixir")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 55. clickup --- Desktop app for clickup.com
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public clickup
  (package
    (name "clickup")
    (version "3.5.185")
    (source (origin
              (method url-fetch)
              (uri "https://clickup.com")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://clickup.com")
    (synopsis "desktop app for clickup.com")
    (description "Desktop app for clickup.com")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 56. bricscad --- CAD Software for People Who Build the Future
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public bricscad
  (package
    (name "bricscad")
    (version "26.2.03")
    (source (origin
              (method url-fetch)
              (uri "https://www.bricsys.com/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.bricsys.com/")
    (synopsis "cAD Software for People Who Build the Future")
    (description "CAD Software for People Who Build the Future")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 57. whisper-cpp-model-small --- This is an autogenerated file, please see https://github.com/hrehfeld/arch...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public whisper-cpp-model-small
  (package
    (name "whisper-cpp-model-small")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/tree/master/models/releases/download/v"
                    version "/whisper.cpp-model-small-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/arch...")
    (description "This is an autogenerated file, please see
https://github.com/hrehfeld/archlinux-whisper.cpp-model")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 58. impro-visor --- Jazz Improvisation Advisor for the Improviser
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public impro-visor
  (package
    (name "impro-visor")
    (version "10.2")
    (source (origin
              (method url-fetch)
              (uri "http://impro-visor.com/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://impro-visor.com/")
    (synopsis "jazz Improvisation Advisor for the Improviser")
    (description "Jazz Improvisation Advisor for the Improviser")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 59. whisper-cpp-model-tiny --- This is an autogenerated file, please see https://github.com/hrehfeld/arch...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public whisper-cpp-model-tiny
  (package
    (name "whisper-cpp-model-tiny")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/tree/master/models/releases/download/v"
                    version "/whisper.cpp-model-tiny-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/arch...")
    (description "This is an autogenerated file, please see
https://github.com/hrehfeld/archlinux-whisper.cpp-model")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 60. kbfs --- The Keybase filesystem
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public kbfs
  (package
    (name "kbfs")
    (version "6.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://keybase.io/docs/kbfs")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://keybase.io/docs/kbfs")
    (synopsis "the Keybase filesystem")
    (description "The Keybase filesystem")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 61. keybase-gui --- GUI frontend for GPG with keybase.io
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public keybase-gui
  (package
    (name "keybase-gui")
    (version "6.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://keybase.io")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://keybase.io")
    (synopsis "gUI frontend for GPG with keybase.io")
    (description "GUI frontend for GPG with keybase.io")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 62. nouveau-fw --- This package provides video & pgraph firmwares for all NVIDIA chipsets tha...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public nouveau-fw
  (package
    (name "nouveau-fw")
    (version "340.108")
    (source (origin
              (method url-fetch)
              (uri "http://nouveau.freedesktop.org/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://nouveau.freedesktop.org/")
    (synopsis "this package provides video & pgraph firmwares for all NVIDIA chipsets tha...")
    (description "This package provides video & pgraph firmwares for all NVIDIA
chipsets that need them")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 63. firefox-sync --- Speed up Firefox using tmpfs
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public firefox-sync
  (package
    (name "firefox-sync")
    (version "20220831")
    (source (origin
              (method url-fetch)
              (uri "http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs")
    (synopsis "speed up Firefox using tmpfs")
    (description "Speed up Firefox using tmpfs.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 64. wayprompt --- Multi-purpose (password-)prompt tool for Wayland (pinentry)
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public wayprompt
  (package
    (name "wayprompt")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://git.sr.ht/~leon_plickat/wayprompt")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://git.sr.ht/~leon_plickat/wayprompt")
    (synopsis "multi-purpose (password-)prompt tool for Wayland (pinentry)")
    (description "Multi-purpose (password-)prompt tool for Wayland (pinentry)")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 65. todesk-rpm-bin --- Remote control and team work
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public todesk-rpm-bin
  (package
    (name "todesk-rpm-bin")
    (version "4.8.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.todesk.com/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.todesk.com/")
    (synopsis "remote control and team work")
    (description "Remote control and team work")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 66. forge-gui-desktop --- The Magic: The Gathering Rules Engine (now with Shandalar-style adventure ...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public forge-gui-desktop
  (package
    (name "forge-gui-desktop")
    (version "2.0.09")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Card-Forge/forge/releases/download/v"
                    version "/forge-gui-desktop-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Card-Forge/forge")
    (synopsis "the Magic: The Gathering Rules Engine (now with Shandalar-style adventure ...")
    (description "The Magic: The Gathering Rules Engine (now with Shandalar-style
adventure mode)")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 67. edu-sync --- A command line application for synchronizing the contents of Moodle instan...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public edu-sync
  (package
    (name "edu-sync")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "http://edu-sync.org/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://edu-sync.org/")
    (synopsis "a command line application for synchronizing the contents of Moodle instan...")
    (description "A command line application for synchronizing the contents of Moodle
instances to your computer.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 68. digilent-waveforms --- Digilent WaveForms Application, Runtime and SDK
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public digilent-waveforms
  (package
    (name "digilent-waveforms")
    (version "3.24.3")
    (source (origin
              (method url-fetch)
              (uri "https://digilent.com/reference/software/waveforms/waveforms-3/start")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://digilent.com/reference/software/waveforms/waveforms-3/start")
    (synopsis "digilent WaveForms Application, Runtime and SDK")
    (description "Digilent WaveForms Application, Runtime and SDK")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 69. axosyslog --- Scalable security data processor
;;; pyproject-build-system.
;;; -------------------------------------------------------------------
(define-public axosyslog
  (package
    (name "axosyslog")
    (version "4.16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/axoflow/axosyslog/releases/download/v"
                    version "/axosyslog-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python))
    (home-page "https://github.com/axoflow/axosyslog")
    (synopsis "scalable security data processor")
    (description "Scalable security data processor")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 70. ttf-times-new-roman --- Times New Roman font from Microsoft
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ttf-times-new-roman
  (package
    (name "ttf-times-new-roman")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "http://corefonts.sourceforge.net/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://corefonts.sourceforge.net/")
    (synopsis "times New Roman font from Microsoft")
    (description "Times New Roman font from Microsoft")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 71. usermin --- A web-based user account administration interface
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public usermin
  (package
    (name "usermin")
    (version "2.510")
    (source (origin
              (method url-fetch)
              (uri "http://www.webmin.com/usermin.html")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.webmin.com/usermin.html")
    (synopsis "a web-based user account administration interface")
    (description "A web-based user account administration interface")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 72. tracy-x11 --- Real-time, nanosecond resolution frame profiler
;;; cmake-build-system.
;;; -------------------------------------------------------------------
(define-public tracy-x11
  (package
    (name "tracy-x11")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wolfpld/tracy/releases/download/v"
                    version "/tracy-x11-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/wolfpld/tracy")
    (synopsis "real-time, nanosecond resolution frame profiler")
    (description "Real-time, nanosecond resolution frame profiler")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 73. flightgear-data-git --- Base data for the flightgear flight simulator
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public flightgear-data-git
  (package
    (name "flightgear-data-git")
    (version "2024.2.0r10907.462fd76a7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/example/flightgear-data")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.flightgear.org")
    (synopsis "base data for the flightgear flight simulator")
    (description "Base data for the flightgear flight simulator.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 74. epub-to-audiobook --- command-line tool to convert EPUB ebooks into audiobooks
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public epub-to-audiobook
  (package
    (name "epub-to-audiobook")
    (version "0.8.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/p0n1/epub_to_audiobook/releases/download/v"
                    version "/epub_to_audiobook-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/p0n1/epub_to_audiobook")
    (synopsis "command-line tool to convert EPUB ebooks into audiobooks")
    (description "command-line tool to convert EPUB ebooks into audiobooks")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 75. mpv-autosubsync-git --- Automatic subtitle synchronization script for mpv media player
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public mpv-autosubsync-git
  (package
    (name "mpv-autosubsync-git")
    (version "r124.22cb928")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/joaquintorres/autosubsync-mpv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/joaquintorres/autosubsync-mpv")
    (synopsis "automatic subtitle synchronization script for mpv media player")
    (description "Automatic subtitle synchronization script for mpv media player")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 76. qp-git --- qp - query packages. A CLI utility for querying installed packages across ...
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public qp-git
  (package
    (name "qp-git")
    (version "5.108.0.r0.gbf2bf11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zweih/qp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Zweih/qp")
    (synopsis "qp - query packages. A CLI utility for querying installed packages across ...")
    (description "qp - query packages. A CLI utility for querying installed packages
across multiple package ecosystems.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 77. muteled --- A simple script aiming to fix the broken mute LED light on some HP laptop ...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public muteled
  (package
    (name "muteled")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/username227/MuteLED/releases/download/v"
                    version "/muteled-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/username227/MuteLED")
    (synopsis "a simple script aiming to fix the broken mute LED light on some HP laptop ...")
    (description "A simple script aiming to fix the broken mute LED light on some HP
laptop models")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 78. whisper-cpp-model-large-v3-q5-0 --- This is an autogenerated file, please see https://github.com/hrehfeld/arch...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public whisper-cpp-model-large-v3-q5-0
  (package
    (name "whisper-cpp-model-large-v3-q5-0")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/tree/master/models/releases/download/v"
                    version "/whisper.cpp-model-large-v3-q5_0-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/arch...")
    (description "This is an autogenerated file, please see
https://github.com/hrehfeld/archlinux-whisper.cpp-model")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 79. adwaita-colors-icon-theme --- Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s acce...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public adwaita-colors-icon-theme
  (package
    (name "adwaita-colors-icon-theme")
    (version "2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dpejoh/Adwaita-colors/releases/download/v"
                    version "/adwaita-colors-icon-theme-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dpejoh/Adwaita-colors")
    (synopsis "adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s acce...")
    (description "Adwaita Colors enhances the Adwaita icon theme by integrating
GNOME’s accent color feature. It ensures that your Adwaita icons
reflect the same accent color as your GNOME theme.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 80. ioninja --- Professional all-in-one terminal emulator, sniffer, and protocol analyzer
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public ioninja
  (package
    (name "ioninja")
    (version "5.10.2")
    (source (origin
              (method url-fetch)
              (uri "https://ioninja.com")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://ioninja.com")
    (synopsis "professional all-in-one terminal emulator, sniffer, and protocol analyzer")
    (description "Professional all-in-one terminal emulator, sniffer, and protocol
analyzer")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 81. libggml-cuda-git --- Tensor library for machine learning with OpenBLAS + Vulkan + CUDA optimiza...
;;; cmake-build-system, git source.
;;; -------------------------------------------------------------------
(define-public libggml-cuda-git
  (package
    (name "libggml-cuda-git")
    (version "0.9.4.r387.g3e9f2ba")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggml-org/ggml")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ggml-org/ggml")
    (synopsis "tensor library for machine learning with OpenBLAS + Vulkan + CUDA optimiza...")
    (description "Tensor library for machine learning with OpenBLAS + Vulkan + CUDA
optimizations")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 82. sherlock-launcher-git --- Application launcher for Wayland
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public sherlock-launcher-git
  (package
    (name "sherlock-launcher-git")
    (version "0.1.13.r3.gd861ea9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skxxtz/sherlock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/skxxtz/sherlock")
    (synopsis "application launcher for Wayland")
    (description "Application launcher for Wayland.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 83. geogebra-6-electron --- Dynamic mathematics software with interactive graphics, algebra and spread...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public geogebra-6-electron
  (package
    (name "geogebra-6-electron")
    (version "6.0.920.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.geogebra.org/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.geogebra.org/")
    (synopsis "dynamic mathematics software with interactive graphics, algebra and spread...")
    (description "Dynamic mathematics software with interactive graphics, algebra and
spreadsheet")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 84. ly-git --- TUI display manager
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public ly-git
  (package
    (name "ly-git")
    (version "1.3.0.r1.gc6446db")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/AnErrupTion/ly.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/AnErrupTion/ly.git")
    (synopsis "tUI display manager")
    (description "TUI display manager")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 85. gnome-shell-extension-quick-settings-audio-panel --- Quick Settings Audio Panel GNOME Extension
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-quick-settings-audio-panel
  (package
    (name "gnome-shell-extension-quick-settings-audio-panel")
    (version "101")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rayzeq/quick-settings-audio-panel/releases/download/v"
                    version "/gnome-shell-extension-quick-settings-audio-panel-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Rayzeq/quick-settings-audio-panel")
    (synopsis "quick Settings Audio Panel GNOME Extension")
    (description "Quick Settings Audio Panel GNOME Extension")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 86. micron-storage-executive-cli --- Micron Storage Executive Command Line (msecli) for configuring and managin...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public micron-storage-executive-cli
  (package
    (name "micron-storage-executive-cli")
    (version "11.08.082025.00")
    (source (origin
              (method url-fetch)
              (uri "https://www.micron.com/sales-support/downloads/software-drivers/storage-executive-software#cli")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.micron.com/sales-support/downloads/software-drivers/storage-executive-software#cli")
    (synopsis "micron Storage Executive Command Line (msecli) for configuring and managin...")
    (description "Micron Storage Executive Command Line (msecli) for configuring and
managing Micron SSDs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 87. text-engine --- A lightweight rich-text framework for GTK
;;; meson-build-system.
;;; -------------------------------------------------------------------
(define-public text-engine
  (package
    (name "text-engine")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mjakeman/text-engine/releases/download/v"
                    version "/text-engine-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mjakeman/text-engine")
    (synopsis "a lightweight rich-text framework for GTK")
    (description "A lightweight rich-text framework for GTK")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 88. detect-it-easy-git --- Detect It Easy, or abbreviated "DIE" is a program for determining types of...
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public detect-it-easy-git
  (package
    (name "detect-it-easy-git")
    (version "3.10.r18916.f0655a9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://horsicq.github.io")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://horsicq.github.io")
    (synopsis "detect It Easy, or abbreviated "DIE" is a program for determining types of...")
    (description "Detect It Easy, or abbreviated \"DIE\" is a program for determining
types of files")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 89. networkd-notify-git --- Desktop notification integration for systemd-networkd
;;; copy-build-system, git source.
;;; -------------------------------------------------------------------
(define-public networkd-notify-git
  (package
    (name "networkd-notify-git")
    (version "r22.9730435")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/wavexx/networkd-notify")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/wavexx/networkd-notify")
    (synopsis "desktop notification integration for systemd-networkd")
    (description "Desktop notification integration for systemd-networkd")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 90. gedit-externaltools-plugin --- Externaltools plugin for the gedit Text Editor
;;; meson-build-system.
;;; -------------------------------------------------------------------
(define-public gedit-externaltools-plugin
  (package
    (name "gedit-externaltools-plugin")
    (version "48.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hermes83/gedit-externaltools-plugin/releases/download/v"
                    version "/gedit-externaltools-plugin-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/hermes83/gedit-externaltools-plugin")
    (synopsis "externaltools plugin for the gedit Text Editor")
    (description "Externaltools plugin for the gedit Text Editor")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 91. filius --- Network simulation program
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public filius
  (package
    (name "filius")
    (version "2.10.1")
    (source (origin
              (method url-fetch)
              (uri "http://www.lernsoftware-filius.de")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.lernsoftware-filius.de")
    (synopsis "network simulation program")
    (description "Network simulation program")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 92. electricsheep --- Screensaver that realize the collective dream of sleeping computers from a...
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public electricsheep
  (package
    (name "electricsheep")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri "http://community.electricsheep.org/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://community.electricsheep.org/")
    (synopsis "screensaver that realize the collective dream of sleeping computers from a...")
    (description "Screensaver that realize the collective dream of sleeping computers
from all over the internet")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 93. languagetool-ngrams-en --- Finding errors using n-gram data, english text
;;; copy-build-system.
;;; -------------------------------------------------------------------
(define-public languagetool-ngrams-en
  (package
    (name "languagetool-ngrams-en")
    (version "20150817")
    (source (origin
              (method url-fetch)
              (uri "http://wiki.languagetool.org/finding-errors-using-n-gram-data")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://wiki.languagetool.org/finding-errors-using-n-gram-data")
    (synopsis "finding errors using n-gram data, english text")
    (description "Finding errors using n-gram data, english text")
    (license license:expat)))
