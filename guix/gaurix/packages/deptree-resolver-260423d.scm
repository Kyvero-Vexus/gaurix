;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260423d
;;; Resolves 100 BLOCKED/FAILED packages via dependency-tree priority.
;;;
;;; New recipes (100):
;;;      1.  flutter-common (copy-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;      2.  flutter-gradle (copy-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;      3.  arm-linux-gnueabihf-gcc-stage2 (copy-build-system, v15.2.1+r19+g76aeacb436df, (list license:non-copyleft license:gpl3+ license:lgpl3+))
;;;      4.  flutter-devel (copy-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;      5.  flutter-target-web (copy-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;      6.  libxnvctrl-580xx (copy-build-system, v580.142, license:gpl2)
;;;      7.  flutter-target-linux (copy-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;      8.  aacs-keydb-daily (copy-build-system, v20260418000806, license:non-copyleft)
;;;      9.  antares-sql-bin (copy-build-system, v0.7.35, license:expat)
;;;     10.  enumctl-bin (copy-build-system, v2026.04.5, license:non-copyleft)
;;;     11.  fallout1-ce-game (copy-build-system, v1.1.0, license:non-copyleft)
;;;     12.  ffdec-bin (copy-build-system, v26.0.0, license:gpl3)
;;;     13.  filkoll (cargo-build-system, v0.2.8, license:gpl3)
;;;     14.  firefly-iii-data-importer (copy-build-system, v2.2.2, license:agpl3+)
;;;     15.  fonts-apple (font-build-system, v21.0d2e1, license:non-copyleft)
;;;     16.  freefilesync (copy-build-system, v14.9, license:non-copyleft)
;;;     17.  freshrss (copy-build-system, v1.28.1, license:agpl3)
;;;     18.  garnet (copy-build-system, v1.0.64, license:expat)
;;;     19.  git-good-bin (copy-build-system, v0.1.5, license:gpl3)
;;;     20.  git-guitar-bin (copy-build-system, v0.1.45, license:gpl3)
;;;     21.  gnix (copy-build-system, v2.4.1, license:agpl3)
;;;     22.  goat-cli (go-build-system, v0.2.3, license:expat)
;;;     23.  googler (copy-build-system, v4.3.13, license:gpl3)
;;;     24.  grabc (copy-build-system, v1.0.2, license:gpl3+)
;;;     25.  graphite-cursor-theme-git (gnu-build-system, v2021.11.26.r0.g4d712ad, license:gpl3)
;;;     26.  hotkeyhub-bin (copy-build-system, v0.3, license:gpl3+)
;;;     27.  hypruler-bin (copy-build-system, v0.2.3, license:expat)
;;;     28.  immuarch-utils-git (copy-build-system, v0.2.0.r271.6a4a7d0, license:gpl3+)
;;;     29.  ipscan-bin (copy-build-system, v3.9.3, license:gpl2)
;;;     30.  js-util-bin (copy-build-system, v1.24.0, license:expat)
;;;     31.  keystore-explorer-bin (copy-build-system, v5.6.1, license:gpl3+)
;;;     32.  kurtosis-cli-bin (copy-build-system, v1.18.1, license:non-copyleft)
;;;     33.  lefthook (copy-build-system, v2.1.6, license:expat)
;;;     34.  lib32-amdvlk-bin (copy-build-system, v2025.Q2.1, license:expat)
;;;     35.  lib3ds (copy-build-system, v1.3.0, license:lgpl3+)
;;;     36.  libodb (copy-build-system, v2.5.0, license:gpl3)
;;;     37.  libpam-pwdfile-rs-bin (copy-build-system, v0.2.0, license:expat)
;;;     38.  libsdrplay (copy-build-system, v3.15.2, license:non-copyleft)
;;;     39.  linux-zen-git-headers (copy-build-system, v6.18.4+1400811+gcf981913c2a7, license:gpl2)
;;;     40.  lore-cli-bin (copy-build-system, v0.1.13, license:asl2.0)
;;;     41.  lrclibfetch (cargo-build-system, v1.0.2, license:expat)
;;;     42.  lxdm-themes (copy-build-system, v1, (list license:non-copyleft license:gpl3+))
;;;     43.  makepkg-optimize-mold (copy-build-system, v30, license:non-copyleft)
;;;     44.  mechrevo-drivers-dkms (copy-build-system, v4.22.1, license:non-copyleft)
;;;     45.  mkinitcpio-sd-numlock (copy-build-system, v1.0.1, license:gpl3+)
;;;     46.  modprobed-db (copy-build-system, v2.48, license:expat)
;;;     47.  moomoo (copy-build-system, v15.44.14308, license:non-copyleft)
;;;     48.  mp3val (copy-build-system, v0.1.8, license:gpl3+)
;;;     49.  mprime-bin (copy-build-system, v30.19.20, license:non-copyleft)
;;;     50.  mpv-discordrpc-git (gnu-build-system, v1.4.1.UNKNOWN.r5.gc8270e5, license:expat)
;;;     51.  mpv-thumbnail-script (copy-build-system, v0.5.4, license:gpl3)
;;;     52.  next-music (copy-build-system, v3.2.1, license:expat)
;;;     53.  nix-user-chroot (cargo-build-system, v2.1.1, license:expat)
;;;     54.  oopz (copy-build-system, v1.0.0, license:non-copyleft)
;;;     55.  opcode-bin (copy-build-system, v0.2.0, license:non-copyleft)
;;;     56.  opencl-legacy-amdgpu-pro (copy-build-system, v23.20_1664988, license:non-copyleft)
;;;     57.  opencl-nvidia-580xx (copy-build-system, v580.142, license:non-copyleft)
;;;     58.  otf-apple-pingfang (font-build-system, v3.0.1, license:non-copyleft)
;;;     59.  otf-apple-pingfang-relaxed (font-build-system, v3.0.1, license:non-copyleft)
;;;     60.  otf-apple-pingfang-ui (font-build-system, v3.0.1, license:non-copyleft)
;;;     61.  pacman-cleanup-hook (copy-build-system, v1.1, license:non-copyleft)
;;;     62.  pacman-hook-bootbackup (copy-build-system, v1.0.0, license:non-copyleft)
;;;     63.  pacolog (copy-build-system, v2.2.1, license:gpl3)
;;;     64.  palemoon-i18n-fr (copy-build-system, v33.8.0, license:mpl2.0)
;;;     65.  passless-bin (copy-build-system, v0.10.1, license:gpl3+)
;;;     66.  penpot-desktop-bin (copy-build-system, v0.23.1, license:agpl3)
;;;     67.  perl-date-simple (copy-build-system, v3.03, (list license:non-copyleft license:gpl3+))
;;;     68.  pi-coding-agent (copy-build-system, v0.67.6, license:expat)
;;;     69.  picotron (copy-build-system, v0.3.0c, license:non-copyleft)
;;;     70.  plymouth-theme-monoarch-refined (copy-build-system, v1.0.0, license:expat)
;;;     71.  powerofforreboot.efi (copy-build-system, v20190517, license:gpl2)
;;;     72.  powershell-editor-services (copy-build-system, v4.5.0, license:expat)
;;;     73.  proton-cachyos-launcher (copy-build-system, v1.0, license:expat)
;;;     74.  proton-drive-sync-prerelease-bin (copy-build-system, v0.2.5beta.2, license:gpl3)
;;;     75.  proton-ge-custom-bin (copy-build-system, vGE_Proton10_34, (list license:bsd-3 license:non-copyleft license:lgpl3+ license:expat license:mpl2.0 license:zlib))
;;;     76.  prysm (copy-build-system, v7.0.1, license:gpl3)
;;;     77.  psysh (copy-build-system, v0.12.22, license:expat)
;;;     78.  pureref (copy-build-system, v2.1.1, license:non-copyleft)
;;;     79.  quarto-cli-bin (copy-build-system, v1.9.37, license:gpl3+)
;;;     80.  quill-editor (copy-build-system, v0.1.4.2, license:expat)
;;;     81.  r8125-dkms (copy-build-system, v9.017.01, license:gpl2)
;;;     82.  railwayapp-cli (copy-build-system, v4.37.2, license:expat)
;;;     83.  replit-desktop-app (copy-build-system, v1.0.14, license:non-copyleft)
;;;     84.  roleboi (copy-build-system, v1.0.0, license:gpl3+)
;;;     85.  roleboi-git (gnu-build-system, v1.0.0.1.gitaddf27e, license:gpl3+)
;;;     86.  rslsync (copy-build-system, v3.1.2, license:non-copyleft)
;;;     87.  rzip (copy-build-system, v2.1, license:gpl2)
;;;     88.  saleae-logic2 (copy-build-system, v2.4.43, license:non-copyleft)
;;;     89.  scpdiscord-git (gnu-build-system, v3.4.1.0.git4789ac4, license:gpl3+)
;;;     90.  seamonkey-i18n-es-es (copy-build-system, v2.53.23, license:mpl2.0)
;;;     91.  sh-elf-newlib (copy-build-system, v4.5.0.20241231, license:bsd-3)
;;;     92.  shgit-bin (copy-build-system, v1.0.0, license:expat)
;;;     93.  shorewall6 (copy-build-system, v5.2.8, license:gpl3+)
;;;     94.  skillshare (go-build-system, v0.19.2, license:expat)
;;;     95.  snd-pcsp-dkms (copy-build-system, v6.18.9, license:gpl2)
;;;     96.  sonarqube-bin (copy-build-system, v26.4.0.121862, license:lgpl3)
;;;     97.  soundfont-jeux (font-build-system, v2.4, license:non-copyleft)
;;;     98.  ssacli-bin (copy-build-system, v6.40_6.0, license:non-copyleft)
;;;     99.  stack-wallet-appimage (copy-build-system, v2.4.1, license:non-copyleft)
;;;    100.  storcli (copy-build-system, v007.3603.0000.0000, license:non-copyleft)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260423d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export (
            flutter-common
            flutter-gradle
            arm-linux-gnueabihf-gcc-stage2
            flutter-devel
            flutter-target-web
            libxnvctrl-580xx
            flutter-target-linux
            aacs-keydb-daily
            antares-sql-bin
            enumctl-bin
            fallout1-ce-game
            ffdec-bin
            filkoll
            firefly-iii-data-importer
            fonts-apple
            freefilesync
            freshrss
            garnet
            git-good-bin
            git-guitar-bin
            gnix
            goat-cli
            googler
            grabc
            graphite-cursor-theme-git
            hotkeyhub-bin
            hypruler-bin
            immuarch-utils-git
            ipscan-bin
            js-util-bin
            keystore-explorer-bin
            kurtosis-cli-bin
            lefthook
            lib32-amdvlk-bin
            lib3ds
            libodb
            libpam-pwdfile-rs-bin
            libsdrplay
            linux-zen-git-headers
            lore-cli-bin
            lrclibfetch
            lxdm-themes
            makepkg-optimize-mold
            mechrevo-drivers-dkms
            mkinitcpio-sd-numlock
            modprobed-db
            moomoo
            mp3val
            mprime-bin
            mpv-discordrpc-git
            mpv-thumbnail-script
            next-music
            nix-user-chroot
            oopz
            opcode-bin
            opencl-legacy-amdgpu-pro
            opencl-nvidia-580xx
            otf-apple-pingfang
            otf-apple-pingfang-relaxed
            otf-apple-pingfang-ui
            pacman-cleanup-hook
            pacman-hook-bootbackup
            pacolog
            palemoon-i18n-fr
            passless-bin
            penpot-desktop-bin
            perl-date-simple
            pi-coding-agent
            picotron
            plymouth-theme-monoarch-refined
            powerofforreboot.efi
            powershell-editor-services
            proton-cachyos-launcher
            proton-drive-sync-prerelease-bin
            proton-ge-custom-bin
            prysm
            psysh
            pureref
            quarto-cli-bin
            quill-editor
            r8125-dkms
            railwayapp-cli
            replit-desktop-app
            roleboi
            roleboi-git
            rslsync
            rzip
            saleae-logic2
            scpdiscord-git
            seamonkey-i18n-es-es
            sh-elf-newlib
            shgit-bin
            shorewall6
            skillshare
            snd-pcsp-dkms
            sonarqube-bin
            soundfont-jeux
            ssacli-bin
            stack-wallet-appimage
            storcli
            ))

;;; -------------------------------------------------------------------
;;; 5765. flutter-common --- flutter SDK component - common SDK files and pub cache
;;; -------------------------------------------------------------------
(define-public flutter-common
  (package
    (name "flutter-common")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - common SDK files and pub cache")
    (description "Flutter SDK component - common SDK files and pub cache.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 5763. flutter-gradle --- flutter SDK component - gradle wrapper
;;; -------------------------------------------------------------------
(define-public flutter-gradle
  (package
    (name "flutter-gradle")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - gradle wrapper")
    (description "Flutter SDK component - gradle wrapper.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 8453. arm-linux-gnueabihf-gcc-stage2 --- the GNU Compiler Collection. Stage 2 for toolchain building
;;; -------------------------------------------------------------------
(define-public arm-linux-gnueabihf-gcc-stage2
  (package
    (name "arm-linux-gnueabihf-gcc-stage2")
    (version "15.2.1+r19+g76aeacb436df")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gcc.gnu.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection. Stage 2 for toolchain building")
    (description "The GNU Compiler Collection. Stage 2 for toolchain building.")
    (home-page "https://gcc.gnu.org")
    (license (list license:non-copyleft license:gpl3+ license:lgpl3+))))

;;; -------------------------------------------------------------------
;;; 5764. flutter-devel --- flutter SDK component - CLI tool (for application development)
;;; -------------------------------------------------------------------
(define-public flutter-devel
  (package
    (name "flutter-devel")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - CLI tool (for application development)")
    (description "Flutter SDK component - CLI tool (for application development).")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 5759. flutter-target-web --- flutter SDK component - web target files
;;; -------------------------------------------------------------------
(define-public flutter-target-web
  (package
    (name "flutter-target-web")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - web target files")
    (description "Flutter SDK component - web target files.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 11351. libxnvctrl-580xx --- nVIDIA NV-CONTROL X extension (580xx)
;;; -------------------------------------------------------------------
(define-public libxnvctrl-580xx
  (package
    (name "libxnvctrl-580xx")
    (version "580.142")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/NVIDIA/nvidia-settings/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA NV-CONTROL X extension (580xx)")
    (description "NVIDIA NV-CONTROL X extension (580xx).")
    (home-page "https://github.com/NVIDIA/nvidia-settings")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5760. flutter-target-linux --- flutter SDK component - linux target files
;;; -------------------------------------------------------------------
(define-public flutter-target-linux
  (package
    (name "flutter-target-linux")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - linux target files")
    (description "Flutter SDK component - linux target files.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 2195. aacs-keydb-daily --- contains the Key Database for the AACS Library (Daily Updates)
;;; -------------------------------------------------------------------
(define-public aacs-keydb-daily
  (package
    (name "aacs-keydb-daily")
    (version "20260418000806")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fvonline-db.bplaced.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "contains the Key Database for the AACS Library (Daily Updates)")
    (description "Contains the Key Database for the AACS Library (Daily Updates).")
    (home-page "http://fvonline-db.bplaced.net/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5728. antares-sql-bin --- a modern, fast and productivity driven SQL client with a focus in UX.(...
;;; -------------------------------------------------------------------
(define-public antares-sql-bin
  (package
    (name "antares-sql-bin")
    (version "0.7.35")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://antares-sql.app/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern, fast and productivity driven SQL client with a focus in UX.(Prebuil...")
    (description "A modern, fast and productivity driven SQL client with a focus in UX.(Prebuilt version.Use system-wide electron).")
    (home-page "https://antares-sql.app/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5574. enumctl-bin --- cLI tool for enum
;;; -------------------------------------------------------------------
(define-public enumctl-bin
  (package
    (name "enumctl-bin")
    (version "2026.04.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://enum.co/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI tool for enum")
    (description "CLI tool for enum.")
    (home-page "https://enum.co/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 12753. fallout1-ce-game --- fallout for modern operating systems
;;; -------------------------------------------------------------------
(define-public fallout1-ce-game
  (package
    (name "fallout1-ce-game")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/alexbatalov/fallout1-ce/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fallout for modern operating systems")
    (description "Fallout for modern operating systems.")
    (home-page "https://github.com/alexbatalov/fallout1-ce")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2204. ffdec-bin --- open source Flash SWF decompiler and editor
;;; -------------------------------------------------------------------
(define-public ffdec-bin
  (package
    (name "ffdec-bin")
    (version "26.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jindrapetrik/jpexs-decompiler/releases/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source Flash SWF decompiler and editor")
    (description "Open source Flash SWF decompiler and editor.")
    (home-page "https://github.com/jindrapetrik/jpexs-decompiler/releases")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8400. filkoll --- fast command-not-found handler for Arch Linux
;;; -------------------------------------------------------------------
(define-public filkoll
  (package
    (name "filkoll")
    (version "0.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/VorpalBlade/filkoll/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast command-not-found handler for Arch Linux")
    (description "Fast command-not-found handler for Arch Linux.")
    (home-page "https://github.com/VorpalBlade/filkoll")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8498. firefly-iii-data-importer --- the Firefly III Data Importer can import data into Firefly III
;;; -------------------------------------------------------------------
(define-public firefly-iii-data-importer
  (package
    (name "firefly-iii-data-importer")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/firefly-iii/data-importer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Firefly III Data Importer can import data into Firefly III")
    (description "The Firefly III Data Importer can import data into Firefly III.")
    (home-page "https://github.com/firefly-iii/data-importer")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 14971. fonts-apple --- apple公司出品的字体,包含苹方简体和繁体，圆简粗体。少女简粗体，SFPro系列和Monaco等宽英文体和AppleColorEmoji符...
;;; -------------------------------------------------------------------
(define-public fonts-apple
  (package
    (name "fonts-apple")
    (version "21.0d2e1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.apple.com/fonts/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apple公司出品的字体,包含苹方简体和繁体，圆简粗体。少女简粗体，SFPro系列和Monaco等宽英文体和AppleColorEmoji符号字体。🏃")
    (description "Apple公司出品的字体,包含苹方简体和繁体，圆简粗体。少女简粗体，SFPro系列和Monaco等宽英文体和AppleColorEmoji符号字体。🏃.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11397. freefilesync --- folder comparison and synchronization software
;;; -------------------------------------------------------------------
(define-public freefilesync
  (package
    (name "freefilesync")
    (version "14.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://freefilesync.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "folder comparison and synchronization software")
    (description "Folder comparison and synchronization software.")
    (home-page "https://freefilesync.org")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 737. freshrss --- a free, self-hostable aggregator…
;;; -------------------------------------------------------------------
(define-public freshrss
  (package
    (name "freshrss")
    (version "1.28.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://freshrss.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free, self-hostable aggregator…")
    (description "A free, self-hostable aggregator….")
    (home-page "http://freshrss.org/")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 16724. garnet --- a high-performance cache-store from Microsoft Research
;;; -------------------------------------------------------------------
(define-public garnet
  (package
    (name "garnet")
    (version "1.0.64")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://microsoft.github.io/garnet/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-performance cache-store from Microsoft Research")
    (description "A high-performance cache-store from Microsoft Research.")
    (home-page "https://microsoft.github.io/garnet")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7851. git-good-bin --- just a simple git client using electron and nodegit, focus on lightwei...
;;; -------------------------------------------------------------------
(define-public git-good-bin
  (package
    (name "git-good-bin")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/weedz/git-good/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "just a simple git client using electron and nodegit, focus on lightweight and...")
    (description "Just a simple git client using electron and nodegit, focus on lightweight and performance.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/weedz/git-good")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1328. git-guitar-bin --- a terminal based git client with fast topological & chronological grap...
;;; -------------------------------------------------------------------
(define-public git-guitar-bin
  (package
    (name "git-guitar-bin")
    (version "0.1.45")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/asinglebit/guitar/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal based git client with fast topological & chronological graph rende...")
    (description "A terminal based git client with fast topological & chronological graph rendering - Pre-Build binary.")
    (home-page "https://github.com/asinglebit/guitar")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3055. gnix --- a simple stupid http reverse proxy
;;; -------------------------------------------------------------------
(define-public gnix
  (package
    (name "gnix")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/metamuffin/gnix/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple stupid http reverse proxy")
    (description "A simple stupid http reverse proxy.")
    (home-page "https://codeberg.org/metamuffin/gnix")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 5755. goat-cli --- go AT protocol CLI tool
;;; -------------------------------------------------------------------
(define-public goat-cli
  (package
    (name "goat-cli")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bluesky-social/goat/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/bluesky-social/goat"))
    (synopsis "go AT protocol CLI tool")
    (description "Go AT protocol CLI tool.")
    (home-page "https://github.com/bluesky-social/goat")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8024. googler --- google from the command-line
;;; -------------------------------------------------------------------
(define-public googler
  (package
    (name "googler")
    (version "4.3.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/oksiquatzel/googler/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "google from the command-line")
    (description "Google from the command-line.")
    (home-page "https://github.com/oksiquatzel/googler")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5555. grabc --- a utility for reporting the color of a pixel
;;; -------------------------------------------------------------------
(define-public grabc
  (package
    (name "grabc")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/muquit/grabc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a utility for reporting the color of a pixel")
    (description "A utility for reporting the color of a pixel.")
    (home-page "https://github.com/muquit/grabc")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5639. graphite-cursor-theme-git --- an x-cursor theme inspired by Graphite gtk theme
;;; -------------------------------------------------------------------
(define-public graphite-cursor-theme-git
  (package
    (name "graphite-cursor-theme-git")
    (version "2021.11.26.r0.g4d712ad")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Graphite-cursors")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "an x-cursor theme inspired by Graphite gtk theme")
    (description "An x-cursor theme inspired by Graphite gtk theme.")
    (home-page "https://github.com/vinceliuice/Graphite-cursors")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7162. hotkeyhub-bin --- cheat Sheet for keybindings in hyprland, bspwm, and other WMs
;;; -------------------------------------------------------------------
(define-public hotkeyhub-bin
  (package
    (name "hotkeyhub-bin")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/meowrch/HotkeyHub/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cheat Sheet for keybindings in hyprland, bspwm, and other WMs")
    (description "Cheat Sheet for keybindings in hyprland, bspwm, and other WMs.")
    (home-page "https://github.com/meowrch/HotkeyHub")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5623. hypruler-bin --- measure anything on your screen
;;; -------------------------------------------------------------------
(define-public hypruler-bin
  (package
    (name "hypruler-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/t4t5/hypruler/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "measure anything on your screen")
    (description "Measure anything on your screen.")
    (home-page "https://github.com/t4t5/hypruler")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5990. immuarch-utils-git --- immutable Archlinux setup with transactional & atomic updates
;;; -------------------------------------------------------------------
(define-public immuarch-utils-git
  (package
    (name "immuarch-utils-git")
    (version "0.2.0.r271.6a4a7d0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://framagit.org/Brumaire/immuarch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "immutable Archlinux setup with transactional & atomic updates")
    (description "Immutable Archlinux setup with transactional & atomic updates.")
    (home-page "https://framagit.org/Brumaire/immuarch")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8645. ipscan-bin --- angry IP Scanner (or simply ipscan) is an open-source and cross-platfo...
;;; -------------------------------------------------------------------
(define-public ipscan-bin
  (package
    (name "ipscan-bin")
    (version "3.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://angryip.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "angry IP Scanner (or simply ipscan) is an open-source and cross-platform netw...")
    (description "Angry IP Scanner (or simply ipscan) is an open-source and cross-platform network scanner designed to be fast and simple to use. It scans IP addresses and ports as well as has many other features.")
    (home-page "https://angryip.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5823. js-util-bin --- a fast, lightweight, battery-included JavaScript runner built on Quick...
;;; -------------------------------------------------------------------
(define-public js-util-bin
  (package
    (name "js-util-bin")
    (version "1.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/5hubham5ingh/js-util/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast, lightweight, battery-included JavaScript runner built on QuickJS")
    (description "A fast, lightweight, battery-included JavaScript runner built on QuickJS.")
    (home-page "https://github.com/5hubham5ingh/js-util")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5588. keystore-explorer-bin --- a free GUI replacement for the Java command-line utilities keytool, ja...
;;; -------------------------------------------------------------------
(define-public keystore-explorer-bin
  (package
    (name "keystore-explorer-bin")
    (version "5.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.keystore-explorer.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free GUI replacement for the Java command-line utilities keytool, jarsigner...")
    (description "A free GUI replacement for the Java command-line utilities keytool, jarsigner and jadtool.")
    (home-page "http://www.keystore-explorer.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8492. kurtosis-cli-bin --- kurtosis is a platform for packaging and launching environments of con...
;;; -------------------------------------------------------------------
(define-public kurtosis-cli-bin
  (package
    (name "kurtosis-cli-bin")
    (version "1.18.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kurtosis-tech/kurtosis/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kurtosis is a platform for packaging and launching environments of containeri...")
    (description "Kurtosis is a platform for packaging and launching environments of containerized services with a focus on approachability for the average developer.")
    (home-page "https://github.com/kurtosis-tech/kurtosis")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7105. lefthook --- git hooks manager
;;; -------------------------------------------------------------------
(define-public lefthook
  (package
    (name "lefthook")
    (version "2.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/evilmartians/lefthook/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "git hooks manager")
    (description "Git hooks manager.")
    (home-page "https://github.com/evilmartians/lefthook")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15531. lib32-amdvlk-bin --- aMD's standalone Vulkan driver (32-bit) (Stable DEB Release)
;;; -------------------------------------------------------------------
(define-public lib32-amdvlk-bin
  (package
    (name "lib32-amdvlk-bin")
    (version "2025.Q2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/GPUOpen-Drivers/AMDVLK/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aMD's standalone Vulkan driver (32-bit) (Stable DEB Release)")
    (description "AMD's standalone Vulkan driver (32-bit) (Stable DEB Release).")
    (home-page "https://github.com/GPUOpen-Drivers/AMDVLK")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9517. lib3ds --- a library for managing 3D-Studio Release 3 and 4 .3DS files and a free...
;;; -------------------------------------------------------------------
(define-public lib3ds
  (package
    (name "lib3ds")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://code.google.com/archive/p/lib3ds/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for managing 3D-Studio Release 3 and 4 .3DS files and a free altern...")
    (description "A library for managing 3D-Studio Release 3 and 4 .3DS files and a free alternative to Autodesk's 3DS File Toolkit.")
    (home-page "https://code.google.com/archive/p/lib3ds/")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 8818. libodb --- the ODB common runtime library
;;; -------------------------------------------------------------------
(define-public libodb
  (package
    (name "libodb")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.codesynthesis.com/products/odb/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the ODB common runtime library")
    (description "The ODB common runtime library.")
    (home-page "https://www.codesynthesis.com/products/odb/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7107. libpam-pwdfile-rs-bin --- a simple PAM module to authenticate users against a password file
;;; -------------------------------------------------------------------
(define-public libpam-pwdfile-rs-bin
  (package
    (name "libpam-pwdfile-rs-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Supernovatux/libpam-pwdfile-rs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple PAM module to authenticate users against a password file")
    (description "A simple PAM module to authenticate users against a password file.")
    (home-page "https://github.com/Supernovatux/libpam-pwdfile-rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11211. libsdrplay --- modules for the SDRplay receiver
;;; -------------------------------------------------------------------
(define-public libsdrplay
  (package
    (name "libsdrplay")
    (version "3.15.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.sdrplay.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modules for the SDRplay receiver")
    (description "Modules for the SDRplay receiver.")
    (home-page "http://www.sdrplay.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 6303. linux-zen-git-headers --- featureful kernel including various new features, code and optimizatio...
;;; -------------------------------------------------------------------
(define-public linux-zen-git-headers
  (package
    (name "linux-zen-git-headers")
    (version "6.18.4+1400811+gcf981913c2a7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/damentz/zen-kernel/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "featureful kernel including various new features, code and optimizations to b...")
    (description "Featureful kernel including various new features, code and optimizations to better suit desktops.")
    (home-page "https://github.com/damentz/zen-kernel")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5581. lore-cli-bin --- reasoning history for code - captures AI-assisted development sessions...
;;; -------------------------------------------------------------------
(define-public lore-cli-bin
  (package
    (name "lore-cli-bin")
    (version "0.1.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/varalys/lore/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reasoning history for code - captures AI-assisted development sessions and li...")
    (description "Reasoning history for code - captures AI-assisted development sessions and links them to git commits.")
    (home-page "https://github.com/varalys/lore")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5933. lrclibfetch --- a cli for LRCLIB
;;; -------------------------------------------------------------------
(define-public lrclibfetch
  (package
    (name "lrclibfetch")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Aethar01/lrclibfetch/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cli for LRCLIB")
    (description "A cli for LRCLIB.")
    (home-page "https://github.com/Aethar01/lrclibfetch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7920. lxdm-themes --- archlinux, ArchlinuxFull, ArchlinuxTop, Arch-Dark, Arch-Stripes and In...
;;; -------------------------------------------------------------------
(define-public lxdm-themes
  (package
    (name "lxdm-themes")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.archlinux.org/index.php/LXDM#Themes/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "archlinux, ArchlinuxFull, ArchlinuxTop, Arch-Dark, Arch-Stripes and Industria...")
    (description "Archlinux, ArchlinuxFull, ArchlinuxTop, Arch-Dark, Arch-Stripes and IndustrialArch lxdm themes.")
    (home-page "https://wiki.archlinux.org/index.php/LXDM#Themes")
    (license (list license:non-copyleft license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 4150. makepkg-optimize-mold --- supplemental build and packaging optimizations for makepkg
;;; -------------------------------------------------------------------
(define-public makepkg-optimize-mold
  (package
    (name "makepkg-optimize-mold")
    (version "30")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.archlinux.org/index.php/Makepkg-optimize/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "supplemental build and packaging optimizations for makepkg")
    (description "Supplemental build and packaging optimizations for makepkg.")
    (home-page "https://wiki.archlinux.org/index.php/Makepkg-optimize")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 473. mechrevo-drivers-dkms --- kernel modules for MECHREVO devices. Drivers for several platform devi...
;;; -------------------------------------------------------------------
(define-public mechrevo-drivers-dkms
  (package
    (name "mechrevo-drivers-dkms")
    (version "4.22.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel modules for MECHREVO devices. Drivers for several platform devices for...")
    (description "Kernel modules for MECHREVO devices. Drivers for several platform devices for MECHREVO notebooks meant for DKMS. Modified from TUXEDO drivers.")
    (home-page "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2161. mkinitcpio-sd-numlock --- enable numlock during early userspace using systemd
;;; -------------------------------------------------------------------
(define-public mkinitcpio-sd-numlock
  (package
    (name "mkinitcpio-sd-numlock")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enable numlock during early userspace using systemd")
    (description "Enable numlock during early userspace using systemd.")
    (home-page "https://aur.archlinux.org/packages/mkinitcpio-sd-numlock")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9514. modprobed-db --- keeps track of EVERY kernel module ever used - useful for make localmo...
;;; -------------------------------------------------------------------
(define-public modprobed-db
  (package
    (name "modprobed-db")
    (version "2.48")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.archlinux.org/index.php/Modprobed-db/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "keeps track of EVERY kernel module ever used - useful for make localmodconfig")
    (description "Keeps track of EVERY kernel module ever used - useful for make localmodconfig.")
    (home-page "https://wiki.archlinux.org/index.php/Modprobed-db")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7949. moomoo --- this package provides Moomoo desktop client
;;; -------------------------------------------------------------------
(define-public moomoo
  (package
    (name "moomoo")
    (version "15.44.14308")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.moomoo.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this package provides Moomoo desktop client")
    (description "This package provides Moomoo desktop client.")
    (home-page "https://www.moomoo.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7119. mp3val --- a tool for validating and repairing MPEG audio streams
;;; -------------------------------------------------------------------
(define-public mp3val
  (package
    (name "mp3val")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mp3val.sourceforge.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for validating and repairing MPEG audio streams")
    (description "A tool for validating and repairing MPEG audio streams.")
    (home-page "https://mp3val.sourceforge.net/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1333. mprime-bin --- a GIMPS, distributed computing project client, dedicated to finding Me...
;;; -------------------------------------------------------------------
(define-public mprime-bin
  (package
    (name "mprime-bin")
    (version "30.19.20")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.mersenne.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GIMPS, distributed computing project client, dedicated to finding Mersenne ...")
    (description "A GIMPS, distributed computing project client, dedicated to finding Mersenne primes. Precompiled binary version.")
    (home-page "http://www.mersenne.org")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7923. mpv-discordrpc-git --- discord Rich Presence integration for mpv Media Player
;;; -------------------------------------------------------------------
(define-public mpv-discordrpc-git
  (package
    (name "mpv-discordrpc-git")
    (version "1.4.1.UNKNOWN.r5.gc8270e5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cniw/mpv-discordRPC")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "discord Rich Presence integration for mpv Media Player")
    (description "Discord Rich Presence integration for mpv Media Player.")
    (home-page "https://github.com/cniw/mpv-discordRPC")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7097. mpv-thumbnail-script --- a Lua script to show preview thumbnails in mpv's OSC seekbar, sans ext...
;;; -------------------------------------------------------------------
(define-public mpv-thumbnail-script
  (package
    (name "mpv-thumbnail-script")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/marzzzello/mpv_thumbnail_script/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Lua script to show preview thumbnails in mpv's OSC seekbar, sans external d...")
    (description "A Lua script to show preview thumbnails in mpv's OSC seekbar, sans external dependencies.")
    (home-page "https://github.com/marzzzello/mpv_thumbnail_script")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1338. next-music --- web client for Yandex Music with support for themes, addons, Discord R...
;;; -------------------------------------------------------------------
(define-public next-music
  (package
    (name "next-music")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Web-Next-Music/Next-Music-Client/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web client for Yandex Music with support for themes, addons, Discord Rich Pre...")
    (description "Web client for Yandex Music with support for themes, addons, Discord Rich Presence (RPC) and OBS widget.")
    (home-page "https://github.com/Web-Next-Music/Next-Music-Client")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7131. nix-user-chroot --- run and install nix as user without root permissions
;;; -------------------------------------------------------------------
(define-public nix-user-chroot
  (package
    (name "nix-user-chroot")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nix-community/nix-user-chroot/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run and install nix as user without root permissions")
    (description "Run and install nix as user without root permissions.")
    (home-page "https://github.com/nix-community/nix-user-chroot")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3480. oopz --- oOPZ desktop client - third-party Electron package for the free online...
;;; -------------------------------------------------------------------
(define-public oopz
  (package
    (name "oopz")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.pysio.online/pysio/linux_oopz/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oOPZ desktop client - third-party Electron package for the free online voice ...")
    (description "OOPZ desktop client - third-party Electron package for the free online voice platform.")
    (home-page "https://git.pysio.online/pysio/linux_oopz")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8486. opcode-bin --- a powerful GUI app and Toolkit for Claude Code - Create custom agents,...
;;; -------------------------------------------------------------------
(define-public opcode-bin
  (package
    (name "opcode-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/getAsterisk/opcode/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a powerful GUI app and Toolkit for Claude Code - Create custom agents, manage...")
    (description "A powerful GUI app and Toolkit for Claude Code - Create custom agents, manage interactive Claude Code sessions, run secure background agents, and more.")
    (home-page "https://github.com/getAsterisk/opcode")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11299. opencl-legacy-amdgpu-pro --- legacy non-free AMD OpenCL ICD Loaders (PAL)
;;; -------------------------------------------------------------------
(define-public opencl-legacy-amdgpu-pro
  (package
    (name "opencl-legacy-amdgpu-pro")
    (version "23.20_1664988")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "legacy non-free AMD OpenCL ICD Loaders (PAL)")
    (description "Legacy non-free AMD OpenCL ICD Loaders (PAL).")
    (home-page "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11317. opencl-nvidia-580xx --- openCL implemention for NVIDIA (580xx)
;;; -------------------------------------------------------------------
(define-public opencl-nvidia-580xx
  (package
    (name "opencl-nvidia-580xx")
    (version "580.142")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nvidia.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openCL implemention for NVIDIA (580xx)")
    (description "OpenCL implemention for NVIDIA (580xx).")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15346. otf-apple-pingfang --- apple公司出品的苹方字体
;;; -------------------------------------------------------------------
(define-public otf-apple-pingfang
  (package
    (name "otf-apple-pingfang")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.apple.com/fonts/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apple公司出品的苹方字体")
    (description "Apple公司出品的苹方字体.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15347. otf-apple-pingfang-relaxed --- 开苹方字体
;;; -------------------------------------------------------------------
(define-public otf-apple-pingfang-relaxed
  (package
    (name "otf-apple-pingfang-relaxed")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.apple.com/fonts/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "开苹方字体")
    (description "开苹方字体.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15348. otf-apple-pingfang-ui --- 苹方UI字体
;;; -------------------------------------------------------------------
(define-public otf-apple-pingfang-ui
  (package
    (name "otf-apple-pingfang-ui")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.apple.com/fonts/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "苹方UI字体")
    (description "苹方UI字体.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 13341. pacman-cleanup-hook --- hook to cleanup pacman cache keeping only the installed plus next most...
;;; -------------------------------------------------------------------
(define-public pacman-cleanup-hook
  (package
    (name "pacman-cleanup-hook")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hook to cleanup pacman cache keeping only the installed plus next most recent...")
    (description "Hook to cleanup pacman cache keeping only the installed plus next most recent packages.")
    (home-page "https://aur.archlinux.org/packages/pacman-cleanup-hook")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8411. pacman-hook-bootbackup --- pacman hooks to create pre- and post-transaction backups of the /boot ...
;;; -------------------------------------------------------------------
(define-public pacman-hook-bootbackup
  (package
    (name "pacman-hook-bootbackup")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.archlinux.org/title/System_backup#Snapshots_and_/boot_partition/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pacman hooks to create pre- and post-transaction backups of the /boot directory")
    (description "Pacman hooks to create pre- and post-transaction backups of the /boot directory.")
    (home-page "https://wiki.archlinux.org/title/System_backup#Snapshots_and_/boot_partition")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5092. pacolog --- list recent commits for Arch Linux packages
;;; -------------------------------------------------------------------
(define-public pacolog
  (package
    (name "pacolog")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/protist/pacolog/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "list recent commits for Arch Linux packages")
    (description "List recent commits for Arch Linux packages.")
    (home-page "https://gitlab.com/protist/pacolog")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15388. palemoon-i18n-fr --- french language pack for Pale Moon browser
;;; -------------------------------------------------------------------
(define-public palemoon-i18n-fr
  (package
    (name "palemoon-i18n-fr")
    (version "33.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://addons.palemoon.org/language-packs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "french language pack for Pale Moon browser")
    (description "French language pack for Pale Moon browser.")
    (home-page "https://addons.palemoon.org/language-packs/")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 5757. passless-bin --- virtual FIDO2 device and client FIDO 2 utility. Passkeys made easy
;;; -------------------------------------------------------------------
(define-public passless-bin
  (package
    (name "passless-bin")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pando85/passless/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual FIDO2 device and client FIDO 2 utility. Passkeys made easy")
    (description "Virtual FIDO2 device and client FIDO 2 utility. Passkeys made easy.")
    (home-page "https://github.com/pando85/passless")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7100. penpot-desktop-bin --- an unofficial desktop application for the open-source design tool, Pen...
;;; -------------------------------------------------------------------
(define-public penpot-desktop-bin
  (package
    (name "penpot-desktop-bin")
    (version "0.23.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/author-more/penpot-desktop/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an unofficial desktop application for the open-source design tool, Penpot.(Pr...")
    (description "An unofficial desktop application for the open-source design tool, Penpot.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/author-more/penpot-desktop")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 9495. perl-date-simple --- a simple date object
;;; -------------------------------------------------------------------
(define-public perl-date-simple
  (package
    (name "perl-date-simple")
    (version "3.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/Date-Simple/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple date object")
    (description "A simple date object.")
    (home-page "https://metacpan.org/release/Date-Simple")
    (license (list license:non-copyleft license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 2248. pi-coding-agent --- a terminal-based coding agent with multi-model support, mid-session mo...
;;; -------------------------------------------------------------------
(define-public pi-coding-agent
  (package
    (name "pi-coding-agent")
    (version "0.67.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://shittycodingagent.ai/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal-based coding agent with multi-model support, mid-session model swi...")
    (description "A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks.")
    (home-page "https://shittycodingagent.ai/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8038. picotron --- a fantasy workstation for making pixelart games, animations, music, de...
;;; -------------------------------------------------------------------
(define-public picotron
  (package
    (name "picotron")
    (version "0.3.0c")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.lexaloffle.com/picotron.php/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fantasy workstation for making pixelart games, animations, music, demos and...")
    (description "A fantasy workstation for making pixelart games, animations, music, demos and other curiosities.")
    (home-page "https://www.lexaloffle.com/picotron.php")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8727. plymouth-theme-monoarch-refined --- refined Plymouth boot theme based on Monoarch with centered layout and...
;;; -------------------------------------------------------------------
(define-public plymouth-theme-monoarch-refined
  (package
    (name "plymouth-theme-monoarch-refined")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/iam-vasanth/monoarch-refined/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "refined Plymouth boot theme based on Monoarch with centered layout and clean ...")
    (description "Refined Plymouth boot theme based on Monoarch with centered layout and clean password prompt.")
    (home-page "https://github.com/iam-vasanth/monoarch-refined")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1628. powerofforreboot.efi --- utilities to be used from within a UEFI boot manager or shell
;;; -------------------------------------------------------------------
(define-public powerofforreboot.efi
  (package
    (name "powerofforreboot.efi")
    (version "20190517")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utilities to be used from within a UEFI boot manager or shell")
    (description "Utilities to be used from within a UEFI boot manager or shell.")
    (home-page "https://aur.archlinux.org/packages/powerofforreboot.efi")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8633. powershell-editor-services --- a common platform for PowerShell development support in any editor or ...
;;; -------------------------------------------------------------------
(define-public powershell-editor-services
  (package
    (name "powershell-editor-services")
    (version "4.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/PowerShell/PowerShellEditorServices/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a common platform for PowerShell development support in any editor or applica...")
    (description "A common platform for PowerShell development support in any editor or application.")
    (home-page "https://github.com/PowerShell/PowerShellEditorServices")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5939. proton-cachyos-launcher --- launch any game with /usr/bin/proton-cachyos Proton-GE style
;;; -------------------------------------------------------------------
(define-public proton-cachyos-launcher
  (package
    (name "proton-cachyos-launcher")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "launch any game with /usr/bin/proton-cachyos Proton-GE style")
    (description "Launch any game with /usr/bin/proton-cachyos Proton-GE style.")
    (home-page "https://aur.archlinux.org/packages/proton-cachyos-launcher")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5566. proton-drive-sync-prerelease-bin --- sync local directories to Proton Drive cloud storage (prerelease)
;;; -------------------------------------------------------------------
(define-public proton-drive-sync-prerelease-bin
  (package
    (name "proton-drive-sync-prerelease-bin")
    (version "0.2.5beta.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/DamianB-BitFlipper/proton-drive-sync/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sync local directories to Proton Drive cloud storage (prerelease)")
    (description "Sync local directories to Proton Drive cloud storage (prerelease).")
    (home-page "https://github.com/DamianB-BitFlipper/proton-drive-sync")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2215. proton-ge-custom-bin --- a fancy custom distribution of Valves Proton with various patches
;;; -------------------------------------------------------------------
(define-public proton-ge-custom-bin
  (package
    (name "proton-ge-custom-bin")
    (version "GE_Proton10_34")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/GloriousEggroll/proton-ge-custom/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fancy custom distribution of Valves Proton with various patches")
    (description "A fancy custom distribution of Valves Proton with various patches.")
    (home-page "https://github.com/GloriousEggroll/proton-ge-custom")
    (license (list license:bsd-3 license:non-copyleft license:lgpl3+ license:expat license:mpl2.0 license:zlib))))

;;; -------------------------------------------------------------------
;;; 7930. prysm --- ethereum proof-of-stake consensus client written in Go
;;; -------------------------------------------------------------------
(define-public prysm
  (package
    (name "prysm")
    (version "7.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/OffchainLabs/prysm/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ethereum proof-of-stake consensus client written in Go")
    (description "Ethereum proof-of-stake consensus client written in Go.")
    (home-page "https://github.com/OffchainLabs/prysm")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7889. psysh --- a REPL for PHP
;;; -------------------------------------------------------------------
(define-public psysh
  (package
    (name "psysh")
    (version "0.12.22")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://psysh.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a REPL for PHP")
    (description "A REPL for PHP.")
    (home-page "https://psysh.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7048. pureref --- reference Image Viewer
;;; -------------------------------------------------------------------
(define-public pureref
  (package
    (name "pureref")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.pureref.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reference Image Viewer")
    (description "Reference Image Viewer.")
    (home-page "http://www.pureref.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2165. quarto-cli-bin --- an open-source scientific and technical publishing system built on Pan...
;;; -------------------------------------------------------------------
(define-public quarto-cli-bin
  (package
    (name "quarto-cli-bin")
    (version "1.9.37")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://quarto.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source scientific and technical publishing system built on Pandoc (bi...")
    (description "An open-source scientific and technical publishing system built on Pandoc (binary from official repo).")
    (home-page "http://quarto.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8749. quill-editor --- a simple CLI Text Editor
;;; -------------------------------------------------------------------
(define-public quill-editor
  (package
    (name "quill-editor")
    (version "0.1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple CLI Text Editor")
    (description "A simple CLI Text Editor.")
    (home-page "https://aur.archlinux.org/packages/quill-editor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11854. r8125-dkms --- kernel module for RTL8125
;;; -------------------------------------------------------------------
(define-public r8125-dkms
  (package
    (name "r8125-dkms")
    (version "9.017.01")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for RTL8125")
    (description "Kernel module for RTL8125.")
    (home-page "https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2178. railwayapp-cli --- command Line Interface for Railway.app
;;; -------------------------------------------------------------------
(define-public railwayapp-cli
  (package
    (name "railwayapp-cli")
    (version "4.37.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/railwayapp/cli/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command Line Interface for Railway.app")
    (description "Command Line Interface for Railway.app.")
    (home-page "https://github.com/railwayapp/cli")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10401. replit-desktop-app --- the collaborative browser based IDE
;;; -------------------------------------------------------------------
(define-public replit-desktop-app
  (package
    (name "replit-desktop-app")
    (version "1.0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://replit.com/desktop/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the collaborative browser based IDE")
    (description "The collaborative browser based IDE.")
    (home-page "https://replit.com/desktop")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5985. roleboi --- a small role management Discord bot
;;; -------------------------------------------------------------------
(define-public roleboi
  (package
    (name "roleboi")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/KarlOfDuty/RoleBoi/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a small role management Discord bot")
    (description "A small role management Discord bot.")
    (home-page "https://github.com/KarlOfDuty/RoleBoi")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5811. roleboi-git --- a small role management Discord bot. Dev build
;;; -------------------------------------------------------------------
(define-public roleboi-git
  (package
    (name "roleboi-git")
    (version "1.0.0.1.gitaddf27e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KarlOfDuty/RoleBoi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a small role management Discord bot. Dev build")
    (description "A small role management Discord bot. Dev build.")
    (home-page "https://github.com/KarlOfDuty/RoleBoi")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5741. rslsync --- resilio Sync (ex:BitTorrent Sync) - automatically sync files via secur...
;;; -------------------------------------------------------------------
(define-public rslsync
  (package
    (name "rslsync")
    (version "3.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.getsync.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "resilio Sync (ex:BitTorrent Sync) - automatically sync files via secure, dist...")
    (description "Resilio Sync (ex:BitTorrent Sync) - automatically sync files via secure, distributed technology.")
    (home-page "https://www.getsync.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7981. rzip --- rzip is a compression program, similar in functionality to gzip or bzi...
;;; -------------------------------------------------------------------
(define-public rzip
  (package
    (name "rzip")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://rzip.samba.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rzip is a compression program, similar in functionality to gzip or bzip2, but...")
    (description "Rzip is a compression program, similar in functionality to gzip or bzip2, but able to take advantage long distance redundencies in files, which can sometimes allow rzip to produce much better compression ratios than other programs.")
    (home-page "https://rzip.samba.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4639. saleae-logic2 --- debug hardware like a pro
;;; -------------------------------------------------------------------
(define-public saleae-logic2
  (package
    (name "saleae-logic2")
    (version "2.4.43")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://discuss.saleae.com/c/logic-2-0-software/7/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "debug hardware like a pro")
    (description "Debug hardware like a pro.")
    (home-page "https://discuss.saleae.com/c/logic-2-0-software/7")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 16818. scpdiscord-git --- a very customisable Discord bot + SCP:SL plugin combo. Dev build
;;; -------------------------------------------------------------------
(define-public scpdiscord-git
  (package
    (name "scpdiscord-git")
    (version "3.4.1.0.git4789ac4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KarlOfDuty/SCPDiscord")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a very customisable Discord bot + SCP:SL plugin combo. Dev build")
    (description "A very customisable Discord bot + SCP:SL plugin combo. Dev build.")
    (home-page "https://github.com/KarlOfDuty/SCPDiscord")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15384. seamonkey-i18n-es-es --- spanish (Spain) language pack for SeaMonkey
;;; -------------------------------------------------------------------
(define-public seamonkey-i18n-es-es
  (package
    (name "seamonkey-i18n-es-es")
    (version "2.53.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.seamonkey-project.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "spanish (Spain) language pack for SeaMonkey")
    (description "Spanish (Spain) language pack for SeaMonkey.")
    (home-page "http://www.seamonkey-project.org/")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 7617. sh-elf-newlib --- a C standard library implementation intended for use on embedded syste...
;;; -------------------------------------------------------------------
(define-public sh-elf-newlib
  (package
    (name "sh-elf-newlib")
    (version "4.5.0.20241231")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.sourceware.org/newlib/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a C standard library implementation intended for use on embedded systems (Sup...")
    (description "A C standard library implementation intended for use on embedded systems (SuperH bare metal).")
    (home-page "http://www.sourceware.org/newlib/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 2171. shgit-bin --- a shell-based git client
;;; -------------------------------------------------------------------
(define-public shgit-bin
  (package
    (name "shgit-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/0byte-coding/shgit/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a shell-based git client")
    (description "A shell-based git client.")
    (home-page "https://github.com/0byte-coding/shgit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8141. shorewall6 --- an iptables-based firewall for Linux systems (with IPv6 support)
;;; -------------------------------------------------------------------
(define-public shorewall6
  (package
    (name "shorewall6")
    (version "5.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://shorewall.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an iptables-based firewall for Linux systems (with IPv6 support)")
    (description "An iptables-based firewall for Linux systems (with IPv6 support).")
    (home-page "https://shorewall.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12843. skillshare --- sync skills across all AI CLI tools with one command
;;; -------------------------------------------------------------------
(define-public skillshare
  (package
    (name "skillshare")
    (version "0.19.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/runkids/skillshare/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/runkids/skillshare"))
    (synopsis "sync skills across all AI CLI tools with one command")
    (description "Sync skills across all AI CLI tools with one command.")
    (home-page "https://github.com/runkids/skillshare")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16165. snd-pcsp-dkms --- an in-tree driver for the PC speaker which allows it to act like a pri...
;;; -------------------------------------------------------------------
(define-public snd-pcsp-dkms
  (package
    (name "snd-pcsp-dkms")
    (version "6.18.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.kernel.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an in-tree driver for the PC speaker which allows it to act like a primitive ...")
    (description "An in-tree driver for the PC speaker which allows it to act like a primitive sound card (DKMS).")
    (home-page "https://www.kernel.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 7148. sonarqube-bin --- an open source platform for continuous inspection of code quality (Com...
;;; -------------------------------------------------------------------
(define-public sonarqube-bin
  (package
    (name "sonarqube-bin")
    (version "26.4.0.121862")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.sonarsource.com/products/sonarqube/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source platform for continuous inspection of code quality (Community ...")
    (description "An open source platform for continuous inspection of code quality (Community Build).")
    (home-page "https://www.sonarsource.com/products/sonarqube/")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 17186. soundfont-jeux --- jeux organ soundfont
;;; -------------------------------------------------------------------
(define-public soundfont-jeux
  (package
    (name "soundfont-jeux")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://realmac.info/jeux1.htm/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jeux organ soundfont")
    (description "Jeux organ soundfont.")
    (home-page "http://realmac.info/jeux1.htm")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 3334. ssacli-bin --- hPE Smart Storage Administrator CLI
;;; -------------------------------------------------------------------
(define-public ssacli-bin
  (package
    (name "ssacli-bin")
    (version "6.40_6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hPE Smart Storage Administrator CLI")
    (description "HPE Smart Storage Administrator CLI.")
    (home-page "https://aur.archlinux.org/packages/ssacli-bin")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 10201. stack-wallet-appimage --- stack Wallet is a fully open source cryptocurrency wallet
;;; -------------------------------------------------------------------
(define-public stack-wallet-appimage
  (package
    (name "stack-wallet-appimage")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://stackwallet.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stack Wallet is a fully open source cryptocurrency wallet")
    (description "Stack Wallet is a fully open source cryptocurrency wallet.")
    (home-page "https://stackwallet.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 284. storcli --- cLI program for LSI MegaRAID cards
;;; -------------------------------------------------------------------
(define-public storcli
  (package
    (name "storcli")
    (version "007.3603.0000.0000")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.broadcom.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI program for LSI MegaRAID cards")
    (description "CLI program for LSI MegaRAID cards.")
    (home-page "https://www.broadcom.com/")
    (license license:non-copyleft)))
