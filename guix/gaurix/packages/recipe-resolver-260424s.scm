;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424s
;;; Resolves 100 packages from TODO queue.
;;; 0 packages blocked.
;;;
;;; New recipes (100):
;;;       1.  trackma-git (#17768, gnu-build-system, v0.8.6, GPL3)
;;;       2.  nvim-packer-git (#17769, gnu-build-system, vea0cc3c, MIT)
;;;       3.  landrun-git (#17786, gnu-build-system, vv0.1.11, MIT)
;;;       4.  spotify-tray-git (#17798, gnu-build-system, v1.3.2, GPL3)
;;;       5.  rffmpeg-git (#17975, gnu-build-system, va242218, GPLv3)
;;;       6.  paketkoll (#17977, gnu-build-system, v0.3.14, MPL-2.0)
;;;       7.  karlyriceditor (#17980, gnu-build-system, v4.1.2, GPL-1.0-or-later)
;;;       8.  igop (#17981, gnu-build-system, v0.46.0, Apache-2.0)
;;;       9.  hjson-cli-bin (#17982, copy-build-system, v4.6.0, MIT)
;;;      10.  gotify-tray-bin (#17983, copy-build-system, v0.5.2, GPL-3.0-only)
;;;      11.  ecmerge-bin (#17985, copy-build-system, v2.5.205, custom)
;;;      12.  deepcool-ak620-digital-linux-git (#17986, gnu-build-system, v0585b96, MIT)
;;;      13.  corral-git (#17987, gnu-build-system, v0.8.2, BSD-2-Clause)
;;;      14.  corral (#17988, gnu-build-system, v0.9.2, BSD-2-Clause)
;;;      15.  copybook-bin (#17989, copy-build-system, v1.0.1102, BSD-3-Clause)
;;;      16.  amethyst-player-git (#17990, gnu-build-system, vv2.1.8, MIT)
;;;      17.  cmigemo-git (#17991, gnu-build-system, v1.2, MIT)
;;;      18.  riscv-gnu-toolchain-bin (#17992, copy-build-system, v2026.04.05, GPL2)
;;;      19.  mox (#17993, gnu-build-system, v0.0.15, MIT)
;;;      20.  elfinfo (#17994, gnu-build-system, v1.2.3, BSD)
;;;      21.  yaloco (#17995, gnu-build-system, v1.3.6, MIT)
;;;      22.  easy (#17996, gnu-build-system, v1.5.0, GPL2)
;;;      23.  cargo-mutants (#17997, gnu-build-system, v27.0.0, MIT)
;;;      24.  amethyst-player (#17998, gnu-build-system, v2.1.3, MIT)
;;;      25.  in (#17999, gnu-build-system, v1.7.4, BSD)
;;;      26.  xace (#18000, gnu-build-system, v0.5, GPL-2.0-or-later)
;;;      27.  v-editor-git (#18001, gnu-build-system, v1.1, MIT)
;;;      28.  tikz2pdf-git (#18002, gnu-build-system, v12+c58f831, BSD-3)
;;;      29.  spacemidi (#18003, gnu-build-system, v1.0, GPL-3.0-or-later)
;;;      30.  shef-bin (#18004, copy-build-system, v0.3.3, MIT)
;;;      31.  octave-femoctave (#18005, gnu-build-system, v2.1.8, GPL-3.0-or-later)
;;;      32.  markflowy-bin (#18006, copy-build-system, v0.55.4, AGPL-3.0-only)
;;;      33.  god-build-git (#18008, gnu-build-system, v5cfe849, BSD-3-Clause)
;;;      34.  falsec-bin (#18009, copy-build-system, v0.1.7, MIT)
;;;      35.  falsec (#18010, gnu-build-system, v0.1.7, MIT)
;;;      36.  confz (#18011, gnu-build-system, v2.1.0, MIT)
;;;      37.  canace (#18012, gnu-build-system, v20130224_c135151, GPL-2.0-or-later)
;;;      38.  bmputil-git (#18013, gnu-build-system, v66efc79, MIT OR Apache-2.0)
;;;      39.  axon-applauncher-git (#18014, gnu-build-system, v0, GPL3)
;;;      40.  hunspell-cs (#18015, gnu-build-system, v20210301, custom, GPL2)
;;;      41.  joshuto (#18018, gnu-build-system, v0.9.9, LGPL-3.0-only)
;;;      42.  rustpython-git (#18019, gnu-build-system, v2a26ed009, MIT)
;;;      43.  dnsviz (#18021, gnu-build-system, v0.11.1, GPL-2.0-or-later)
;;;      44.  rustpython (#18022, gnu-build-system, v0.4.0+55, MIT)
;;;      45.  razer-cli (#18023, gnu-build-system, v2.3.0, GPL-3.0-or-later)
;;;      46.  masayloblockly-bin (#18025, copy-build-system, v2.0.0, CC0-1.0, LGPL-2.1-only)
;;;      47.  bluelog-git (#18026, gnu-build-system, v42c9154, GPL-2.0-only)
;;;      48.  b-em (#18027, gnu-build-system, v20251220_7eb9b67, GPL-2.0-or-later)
;;;      49.  ft232r_prog (#18028, gnu-build-system, v1.25, GPL)
;;;      50.  php83-zip (#18029, gnu-build-system, v8.3.30, PHP)
;;;      51.  xmpp-dns-git (#18030, gnu-build-system, v0.4.5, BSD-2-Clause)
;;;      52.  atto (#18031, gnu-build-system, v1.6.0, MIT)
;;;      53.  requestly-git (#18033, gnu-build-system, v26.2.20, AGPL-3.0-only)
;;;      54.  project-zomboid-server (#18034, gnu-build-system, v41.65, custom:PZLicense)
;;;      55.  perl-mason (#18035, gnu-build-system, v2.24, GPL, PerlArtistic)
;;;      56.  libcanlock (#18036, gnu-build-system, v3.3.1, BSD-3-Clause, ICU)
;;;      57.  abs-lang-git (#18037, gnu-build-system, v2.7.1, MIT)
;;;      58.  stackandconquer (#18039, gnu-build-system, v0.11.1, GPL-3.0-or-later)
;;;      59.  opencl-nvidia-tesla (#18040, gnu-build-system, v580.65.06, LicenseRef-custom)
;;;      60.  electron23 (#18041, gnu-build-system, v23.3.13, BSD-3-Clause, MIT)
;;;      61.  capter (#18042, gnu-build-system, v4.0.1, Apache-2.0)
;;;      62.  hasher-priv (#18043, gnu-build-system, v1.6.0.alt1, GPL2)
;;;      63.  coursier-bin (#18044, copy-build-system, v2.1.24, Apache-2.0)
;;;      64.  coursier-native-bin (#18045, copy-build-system, v2.1.4, Apache)
;;;      65.  superproductivity (#18046, gnu-build-system, v18.2.5, MIT)
;;;      66.  sdrconnect (#18047, gnu-build-system, v1.0.8, custom:eula)
;;;      67.  daggerfall-unity-bin (#18048, copy-build-system, v1.1.1, GPL3)
;;;      68.  eparakstitajs3 (#18049, gnu-build-system, v1.9.1, LicenseRef-E-PARAKSTĪTĀJS_3)
;;;      69.  tuptime (#18050, gnu-build-system, v5.2.6, GPL-2.0-only)
;;;      70.  qgnomeplatform-qt6 (#18051, gnu-build-system, v0.9.2, LGPL2.1)
;;;      71.  gocheat-bin (#18054, copy-build-system, v1.1, MIT)
;;;      72.  dulcepan-git (#18055, gnu-build-system, vv1.0.2, GPL-3.0-only)
;;;      73.  rundeck-community (#18057, gnu-build-system, v5.17.0.20251103, Apache)
;;;      74.  alvr-git (#18058, gnu-build-system, v21.0.0_dev10, MIT)
;;;      75.  listen1-desktop-appimage (#18059, copy-build-system, v2.33.0, MIT)
;;;      76.  arqiver (#18061, gnu-build-system, v1.0.1, GPL3)
;;;      77.  purr (#18062, gnu-build-system, v1.3.0, MIT)
;;;      78.  abracadabra (#18065, gnu-build-system, v4.0.1, MIT)
;;;      79.  outlook-for-linux-bin (#18067, copy-build-system, v1.3.13, GPL3)
;;;      80.  afdko (#18068, gnu-build-system, v4.0.3, Apache-2.0)
;;;      81.  wiznote-desktop-bin (#18069, copy-build-system, v0.1.107, LicenseRef-custom)
;;;      82.  torzu-git (#18070, gnu-build-system, vfd908334a, GPL-3.0-or-later)
;;;      83.  pi-hole-ftl (#18071, gnu-build-system, v6.4.1, EUPL-1.2)
;;;      84.  xerox-phaser-3020 (#18074, gnu-build-system, v1.00.25, custom)
;;;      85.  owncast (#18076, gnu-build-system, v0.2.3, MIT)
;;;      86.  qt-dab (#18080, gnu-build-system, v6.9.3, GPL-2.0-only)
;;;      87.  dpitunnel (#18082, gnu-build-system, v1.0.3, GPL-3.0-or-later)
;;;      88.  hyprlux (#18086, gnu-build-system, v0.1.8, MIT)
;;;      89.  google-cloud-cli-lite (#18089, gnu-build-system, v541.0.0, Apache-2.0)
;;;      90.  zfs-prune-snapshots (#18090, gnu-build-system, v1.5.0, MIT)
;;;      91.  golored (#18095, gnu-build-system, v1.0.0, GPL3)
;;;      92.  metals (#18096, gnu-build-system, v1.5.2, Apache-2.0)
;;;      93.  airgeddon (#18097, gnu-build-system, v11.61, GPL-3.0-only)
;;;      94.  zrok-bin (#18099, copy-build-system, v1.1.11, Apache)
;;;      95.  conceal-bin (#18101, copy-build-system, v0.7.0, MIT)
;;;      96.  softethervpn (#18103, gnu-build-system, vv4.44_9807, Apache)
;;;      97.  jlink-systemview (#18104, gnu-build-system, v4.10a, custom)
;;;      98.  nikto-git (#18105, gnu-build-system, v2.1.6.601.7ac0457, GPL)
;;;      99.  mangl (#18106, gnu-build-system, v1.1.5, BSD 2-Clause)
;;;     100.  softethervpn-git (#18107, gnu-build-system, v5.02.5180, Apache)

(define-module (gaurix packages recipe-resolver-260424s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
)


;; Helper for nonfree/custom licenses
(define (nonfree uri)
  (license:license "nonfree" uri
    "This is a nonfree license."))


(define-public trackma-git
  (package
    (name "trackma-git")
    (version "0.8.6")
    (source (origin
              (method url-fetch)
              (uri "https://z411.github.io/trackma/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A lightweight and simple program for updating and using lists on several ...")
    (description "A lightweight and simple program for updating and using lists on several media tracking websites.")
    (home-page "https://z411.github.io/trackma/")
    (license license:gpl3+)))

(define-public nvim-packer-git
  (package
    (name "nvim-packer-git")
    (version "ea0cc3c")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/wbthomason/packer.nvim")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A use-package inspired plugin manager for Neovim")
    (description "A use-package inspired plugin manager for Neovim.")
    (home-page "https://github.com/wbthomason/packer.nvim")
    (license license:expat)))

(define-public landrun-git
  (package
    (name "landrun-git")
    (version "v0.1.11")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Zouuup/landrun")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run any Linux process in a secure, unprivileged sandbox using Landlock LSM")
    (description "Run any Linux process in a secure, unprivileged sandbox using Landlock LSM.")
    (home-page "https://github.com/Zouuup/landrun")
    (license license:expat)))

(define-public spotify-tray-git
  (package
    (name "spotify-tray-git")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/tsmetana/spotify-tray")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tray icon for the Spotify Linux client application")
    (description "Tray icon for the Spotify Linux client application.")
    (home-page "https://github.com/tsmetana/spotify-tray")
    (license license:gpl3+)))

(define-public rffmpeg-git
  (package
    (name "rffmpeg-git")
    (version "a242218")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/joshuaboniface/rffmpeg")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remote SSH FFmpeg wrapper tool")
    (description "Remote SSH FFmpeg wrapper tool.")
    (home-page "https://github.com/joshuaboniface/rffmpeg")
    (license license:gpl3+)))

(define-public paketkoll
  (package
    (name "paketkoll")
    (version "0.3.14")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/VorpalBlade/paketkoll")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast integrity check for files installed by pacman")
    (description "Fast integrity check for files installed by pacman.")
    (home-page "https://github.com/VorpalBlade/paketkoll")
    (license license:mpl2.0)))

(define-public karlyriceditor
  (package
    (name "karlyriceditor")
    (version "4.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/gyunaev/karlyriceditor")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A program which lets you edit and synchronize lyrics with karaoke songs i...")
    (description "A program which lets you edit and synchronize lyrics with karaoke songs in various formats.")
    (home-page "https://github.com/gyunaev/karlyriceditor")
    (license license:gpl1+)))

(define-public igop
  (package
    (name "igop")
    (version "0.46.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/goplus/igop")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Go/Go+ Interpreter")
    (description "The Go/Go+ Interpreter.")
    (home-page "https://github.com/goplus/igop")
    (license license:asl2.0)))

(define-public hjson-cli-bin
  (package
    (name "hjson-cli-bin")
    (version "4.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hjson/hjson-go/releases/download/v" version "/hjson-cli-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hjson-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "hjson in Go")
    (description "Hjson in Go.")
    (home-page "https://github.com/hjson/hjson-go")
    (license license:expat)))

(define-public gotify-tray-bin
  (package
    (name "gotify-tray-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/seird/gotify-tray/releases/download/v" version "/gotify-tray-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gotify-tray-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform desktop client for receiving messages from a Gotify server...")
    (description "Cross-platform desktop client for receiving messages from a Gotify server.(Prebuilt version).")
    (home-page "https://github.com/seird/gotify-tray")
    (license license:gpl3)))

(define-public ecmerge-bin
  (package
    (name "ecmerge-bin")
    (version "2.5.205")
    (source (origin
              (method url-fetch)
              (uri "https://www.elliecomputing.com/en/Products/merge_overview.asp")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ecmerge-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "compares and merges text files, images, binaries and folders visually")
    (description "Compares and merges text files, images, binaries and folders visually.")
    (home-page "https://www.elliecomputing.com/en/Products/merge_overview.asp")
    (license (nonfree "https://www.elliecomputing.com/en/Products/merge_overview.asp"))))

(define-public deepcool-ak620-digital-linux-git
  (package
    (name "deepcool-ak620-digital-linux-git")
    (version "0585b96")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hikyae/deepcool-ak620-digital-linux")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python script to control DeepCool AK620 and AK500S CPU coolers on Linux")
    (description "Python script to control DeepCool AK620 and AK500S CPU coolers on Linux.")
    (home-page "https://github.com/hikyae/deepcool-ak620-digital-linux")
    (license license:expat)))

(define-public corral-git
  (package
    (name "corral-git")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ponylang/corral")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pony dependency manager tool")
    (description "Pony dependency manager tool.")
    (home-page "https://github.com/ponylang/corral")
    (license license:bsd-2)))

(define-public corral
  (package
    (name "corral")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ponylang/corral")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pony dependency manager tool")
    (description "Pony dependency manager tool.")
    (home-page "https://github.com/ponylang/corral")
    (license license:bsd-2)))

(define-public copybook-bin
  (package
    (name "copybook-bin")
    (version "1.0.1102")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/xxNull-lsk/Copybook/releases/download/v" version "/copybook-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/copybook-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "生成拼音、汉字、汉字字帖")
    (description "生成拼音、汉字、汉字字帖.")
    (home-page "https://github.com/xxNull-lsk/Copybook")
    (license license:bsd-3)))

(define-public amethyst-player-git
  (package
    (name "amethyst-player-git")
    (version "v2.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Geoxor/amethyst")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "amethyst is an Electron-based cross-platform audio player with a node-bas...")
    (description "Amethyst is an Electron-based cross-platform audio player with a node-based audio routing system.")
    (home-page "https://github.com/Geoxor/amethyst")
    (license license:expat)))

(define-public cmigemo-git
  (package
    (name "cmigemo-git")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.kaoriya.net/software/cmigemo/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an implementation of Migemo in C")
    (description "An implementation of Migemo in C.")
    (home-page "https://www.kaoriya.net/software/cmigemo/")
    (license license:expat)))

(define-public riscv-gnu-toolchain-bin
  (package
    (name "riscv-gnu-toolchain-bin")
    (version "2026.04.05")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/v" version "/riscv-gnu-toolchain-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/riscv-gnu-toolchain-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "meta-package for a pre-compiled GNU toolchain for riscv32 and riscv64, li...")
    (description "Meta-package for a pre-compiled GNU toolchain for riscv32 and riscv64, linux and ELF.")
    (home-page "https://github.com/riscv-collab/riscv-gnu-toolchain")
    (license license:gpl2+)))

(define-public mox
  (package
    (name "mox")
    (version "0.0.15")
    (source (origin
              (method url-fetch)
              (uri "https://www.xmox.nl/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern full-featured open source secure mail server for low-maintenance s...")
    (description "Modern full-featured open source secure mail server for low-maintenance self-hosted email.")
    (home-page "https://www.xmox.nl/")
    (license license:expat)))

(define-public elfinfo
  (package
    (name "elfinfo")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://elfinfo.roboticoverlords.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "detect which compiler version was used for compiling an ELF file")
    (description "Detect which compiler version was used for compiling an ELF file.")
    (home-page "https://elfinfo.roboticoverlords.org/")
    (license license:bsd-3)))

(define-public yaloco
  (package
    (name "yaloco")
    (version "1.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/xyproto/yaloco")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yet Another Log Colorizer")
    (description "Yet Another Log Colorizer.")
    (home-page "https://github.com/xyproto/yaloco")
    (license license:expat)))

(define-public easy
  (package
    (name "easy")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/xyproto/easy")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nice and ionice as a single utility")
    (description "Nice and ionice as a single utility.")
    (home-page "https://github.com/xyproto/easy")
    (license license:gpl2+)))

(define-public cargo-mutants
  (package
    (name "cargo-mutants")
    (version "27.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sourcefrog/cargo-mutants")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mutation testing for Rust")
    (description "Mutation testing for Rust.")
    (home-page "https://github.com/sourcefrog/cargo-mutants")
    (license license:expat)))

(define-public amethyst-player
  (package
    (name "amethyst-player")
    (version "2.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Geoxor/amethyst")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A cross-platform music player made with Typescript")
    (description "A cross-platform music player made with Typescript.")
    (home-page "https://github.com/Geoxor/amethyst")
    (license license:expat)))

(define-public in
  (package
    (name "in")
    (version "1.7.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/xyproto/in")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create a directory if needed, then run the given command there")
    (description "Create a directory if needed, then run the given command there.")
    (home-page "https://github.com/xyproto/in")
    (license license:bsd-3)))

(define-public xace
  (package
    (name "xace")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri "https://lawrencewoodman.github.io/xAce/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Jupiter Ace emulator for Linux")
    (description "A Jupiter Ace emulator for Linux.")
    (home-page "https://lawrencewoodman.github.io/xAce/")
    (license license:gpl2+)))

(define-public v-editor-git
  (package
    (name "v-editor-git")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/egnrse/v-editor")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple wrapper for your editor")
    (description "Simple wrapper for your editor.")
    (home-page "https://github.com/egnrse/v-editor")
    (license license:expat)))

(define-public tikz2pdf-git
  (package
    (name "tikz2pdf-git")
    (version "12+c58f831")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ablondin/tikz2pdf")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "script to help convert TikZ code to PDF")
    (description "Script to help convert TikZ code to PDF.")
    (home-page "https://github.com/ablondin/tikz2pdf")
    (license license:bsd-3)))

(define-public spacemidi
  (package
    (name "spacemidi")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.com/IGBC/spacemidi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GUI tool for translating space mouse devices into midi controllers")
    (description "GUI tool for translating space mouse devices into midi controllers.")
    (home-page "https://gitlab.com/IGBC/spacemidi")
    (license license:gpl3+)))

(define-public shef-bin
  (package
    (name "shef-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/eduardoagarcia/shef/releases/download/v" version "/shef-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/shef-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A powerful CLI framework for cooking up dynamic shell recipes")
    (description "A powerful CLI framework for cooking up dynamic shell recipes.")
    (home-page "https://github.com/eduardoagarcia/shef")
    (license license:expat)))

(define-public octave-femoctave
  (package
    (name "octave-femoctave")
    (version "2.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/andreasstahel/femoctave")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A simple FEM package for solving scalar problems in one or two space dime...")
    (description "A simple FEM package for solving scalar problems in one or two space dimensions.")
    (home-page "https://github.com/andreasstahel/femoctave")
    (license license:gpl3+)))

(define-public markflowy-bin
  (package
    (name "markflowy-bin")
    (version "0.55.4")
    (source (origin
              (method url-fetch)
              (uri "https://markflowy.vercel.app/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/markflowy-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern markdown editor application, Build fast and efficient workflows.(P...")
    (description "Modern markdown editor application, Build fast and efficient workflows.(Prebuilt version).")
    (home-page "https://markflowy.vercel.app/")
    (license license:agpl3)))

(define-public god-build-git
  (package
    (name "god-build-git")
    (version "5cfe849")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/KoT3isGood/god")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build system which is capable of building different stuff using C")
    (description "Build system which is capable of building different stuff using C.")
    (home-page "https://github.com/KoT3isGood/god")
    (license license:bsd-3)))

(define-public falsec-bin
  (package
    (name "falsec-bin")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/MixusMinimax/falsec/releases/download/v" version "/falsec-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/falsec-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "interpreter and compiler for the FALSE language")
    (description "Interpreter and compiler for the FALSE language.")
    (home-page "https://github.com/MixusMinimax/falsec")
    (license license:expat)))

(define-public falsec
  (package
    (name "falsec")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/MixusMinimax/falsec")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interpreter and compiler for the FALSE language")
    (description "Interpreter and compiler for the FALSE language.")
    (home-page "https://github.com/MixusMinimax/falsec")
    (license license:expat)))

(define-public confz
  (package
    (name "confz")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Zuehlke/ConfZ.git")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pydantic Config Management")
    (description "Pydantic Config Management.")
    (home-page "https://github.com/Zuehlke/ConfZ.git")
    (license license:expat)))

(define-public canace
  (package
    (name "canace")
    (version "20130224_c135151")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/LawrenceWoodman/CanAce")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Jupiter Ace emulator for Linux")
    (description "A Jupiter Ace emulator for Linux.")
    (home-page "https://github.com/LawrenceWoodman/CanAce")
    (license license:gpl2+)))

(define-public bmputil-git
  (package
    (name "bmputil-git")
    (version "66efc79")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/blackmagic-debug/bmputil")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool for managing and flashing Black Magic Probe firmware")
    (description "A tool for managing and flashing Black Magic Probe firmware.")
    (home-page "https://github.com/blackmagic-debug/bmputil")
    (license license:expat)))

(define-public axon-applauncher-git
  (package
    (name "axon-applauncher-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/wojtmic/axon")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hyper-customizable app launcher made in Python (development version)")
    (description "Hyper-customizable app launcher made in Python (development version).")
    (home-page "https://github.com/wojtmic/axon")
    (license license:gpl3+)))

(define-public hunspell-cs
  (package
    (name "hunspell-cs")
    (version "20210301")
    (source (origin
              (method url-fetch)
              (uri "http://www.translatoblog.cz/hunspell/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "czech dictionary for Hunspell")
    (description "Czech dictionary for Hunspell.")
    (home-page "http://www.translatoblog.cz/hunspell/")
    (license (nonfree "http://www.translatoblog.cz/hunspell/"))))

(define-public joshuto
  (package
    (name "joshuto")
    (version "0.9.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kamiyaa/joshuto")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ranger-like terminal file manager written in Rust")
    (description "Ranger-like terminal file manager written in Rust.")
    (home-page "https://github.com/kamiyaa/joshuto")
    (license license:lgpl3+)))

(define-public rustpython-git
  (package
    (name "rustpython-git")
    (version "2a26ed009")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/RustPython/RustPython")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Python3 Interpreter written in Rust")
    (description "A Python3 Interpreter written in Rust.")
    (home-page "https://github.com/RustPython/RustPython")
    (license license:expat)))

(define-public dnsviz
  (package
    (name "dnsviz")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/dnsviz/dnsviz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool suite for analysis and visualization of DNS and DNSSEC")
    (description "Tool suite for analysis and visualization of DNS and DNSSEC.")
    (home-page "https://github.com/dnsviz/dnsviz")
    (license license:gpl2+)))

(define-public rustpython
  (package
    (name "rustpython")
    (version "0.4.0+55")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/RustPython/RustPython")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Python Interpreter written in Rust")
    (description "A Python Interpreter written in Rust.")
    (home-page "https://github.com/RustPython/RustPython")
    (license license:expat)))

(define-public razer-cli
  (package
    (name "razer-cli")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/lolei/razer-cli")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI for configuring Razer devices")
    (description "CLI for configuring Razer devices.")
    (home-page "https://github.com/lolei/razer-cli")
    (license license:gpl3+)))

(define-public masayloblockly-bin
  (package
    (name "masayloblockly-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/agomezgar/masayloBlockly/releases/download/v" version "/masayloblockly-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/masayloblockly-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A humble Blockly based app to control an Arduino based robot as the Masay...")
    (description "A humble Blockly based app to control an Arduino based robot as the Masaylo robot using jpfontaine's work with the marvelous Blocklino.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/agomezgar/masayloBlockly")
    (license license:cc0)))

(define-public bluelog-git
  (package
    (name "bluelog-git")
    (version "42c9154")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/MS3FGX/Bluelog")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A highly configurable Linux Bluetooth scanner with optional web interface")
    (description "A highly configurable Linux Bluetooth scanner with optional web interface.")
    (home-page "https://github.com/MS3FGX/Bluelog")
    (license license:gpl2)))

(define-public b-em
  (package
    (name "b-em")
    (version "20251220_7eb9b67")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/stardot/b-em")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "BBC Micro emulator")
    (description "BBC Micro emulator.")
    (home-page "https://github.com/stardot/b-em")
    (license license:gpl2+)))

(define-public ft232r_prog
  (package
    (name "ft232r_prog")
    (version "1.25")
    (source (origin
              (method url-fetch)
              (uri "http://www.rtr.ca/ft232r/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A command-line interface for reconfiguring the FT232R chip")
    (description "A command-line interface for reconfiguring the FT232R chip.")
    (home-page "http://www.rtr.ca/ft232r/")
    (license license:gpl3+)))

(define-public php83-zip
  (package
    (name "php83-zip")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "http://www.php.net")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zip module for php83")
    (description "Zip module for php83.")
    (home-page "http://www.php.net")
    (license license:php3.01)))

(define-public xmpp-dns-git
  (package
    (name "xmpp-dns-git")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://salsa.debian.org/mdosch/xmpp-dns")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line tool to check XMPP SRV records (development version)")
    (description "Command-line tool to check XMPP SRV records (development version).")
    (home-page "https://salsa.debian.org/mdosch/xmpp-dns")
    (license license:bsd-2)))

(define-public atto
  (package
    (name "atto")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/codesoap/atto")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tiny Nano wallet, focused on ease of use through simplicity")
    (description "A tiny Nano wallet, focused on ease of use through simplicity.")
    (home-page "https://github.com/codesoap/atto")
    (license license:expat)))

(define-public requestly-git
  (package
    (name "requestly-git")
    (version "26.2.20")
    (source (origin
              (method url-fetch)
              (uri "https://requestly.io/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "debug your network request across all platforms and browsers using a sing...")
    (description "Debug your network request across all platforms and browsers using a single app.(Use syetem-wide electron).")
    (home-page "https://requestly.io/")
    (license license:agpl3)))

(define-public project-zomboid-server
  (package
    (name "project-zomboid-server")
    (version "41.65")
    (source (origin
              (method url-fetch)
              (uri "https://projectzomboid.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dedicated server for the game Project Zomboid")
    (description "Dedicated server for the game Project Zomboid.")
    (home-page "https://projectzomboid.com")
    (license (nonfree "https://projectzomboid.com"))))

(define-public perl-mason
  (package
    (name "perl-mason")
    (version "2.24")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/Mason")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful, high-performance templating for the web and beyond (via MetaCPA...")
    (description "Powerful, high-performance templating for the web and beyond (via MetaCPAN distribution).")
    (home-page "https://metacpan.org/release/Mason")
    (license license:gpl3+)))

(define-public libcanlock
  (package
    (name "libcanlock")
    (version "3.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://micha.freeshell.org/libcanlock/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standalone, modern RFC 8315 Netnews Cancel-Lock implementation for Unix")
    (description "Standalone, modern RFC 8315 Netnews Cancel-Lock implementation for Unix.")
    (home-page "https://micha.freeshell.org/libcanlock/")
    (license license:bsd-3)))

(define-public abs-lang-git
  (package
    (name "abs-lang-git")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/abs-lang/abs")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ABS programming language: the joy of shell scripting (build from latest g...")
    (description "ABS programming language: the joy of shell scripting (build from latest git commit).")
    (home-page "https://github.com/abs-lang/abs")
    (license license:expat)))

(define-public stackandconquer
  (package
    (name "stackandconquer")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ElTh0r0/stackandconquer/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A challenging tower conquest board game")
    (description "A challenging tower conquest board game.")
    (home-page "https://github.com/ElTh0r0/stackandconquer/")
    (license license:gpl3+)))

(define-public opencl-nvidia-tesla
  (package
    (name "opencl-nvidia-tesla")
    (version "580.65.06")
    (source (origin
              (method url-fetch)
              (uri "https://www.nvidia.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openCL implemention for NVIDIA (tesla version)")
    (description "OpenCL implemention for NVIDIA (tesla version).")
    (home-page "https://www.nvidia.com/")
    (license (nonfree "https://www.nvidia.com/"))))

(define-public electron23
  (package
    (name "electron23")
    (version "23.3.13")
    (source (origin
              (method url-fetch)
              (uri "https://electronjs.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build cross platform desktop apps with web technologies")
    (description "Build cross platform desktop apps with web technologies.")
    (home-page "https://electronjs.org")
    (license license:bsd-3)))

(define-public capter
  (package
    (name "capter")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/decipher3114/Capter")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-Platform Screen Capture and Annotation Tool")
    (description "Cross-Platform Screen Capture and Annotation Tool.")
    (home-page "https://github.com/decipher3114/Capter")
    (license license:asl2.0)))

(define-public hasher-priv
  (package
    (name "hasher-priv")
    (version "1.6.0.alt1")
    (source (origin
              (method url-fetch)
              (uri "http://www.altlinux.org/hasher")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "altlinux save package build & chroot system ( private part )")
    (description "Altlinux save package build & chroot system ( private part ).")
    (home-page "http://www.altlinux.org/hasher")
    (license license:gpl2+)))

(define-public coursier-bin
  (package
    (name "coursier-bin")
    (version "2.1.24")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/coursier/coursier/releases/download/v" version "/coursier-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/coursier-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "pure Scala Artifact Fetching")
    (description "Pure Scala Artifact Fetching.")
    (home-page "https://github.com/coursier/coursier")
    (license license:asl2.0)))

(define-public coursier-native-bin
  (package
    (name "coursier-native-bin")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri "http://get-coursier.io")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/coursier-native-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "pure Scala Artifact Fetching (native-image edition)")
    (description "Pure Scala Artifact Fetching (native-image edition).")
    (home-page "http://get-coursier.io")
    (license license:asl2.0)))

(define-public superproductivity
  (package
    (name "superproductivity")
    (version "18.2.5")
    (source (origin
              (method url-fetch)
              (uri "https://super-productivity.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced todo list app with timeboxing and time tracking capabilities")
    (description "An advanced todo list app with timeboxing and time tracking capabilities.")
    (home-page "https://super-productivity.com")
    (license license:expat)))

(define-public sdrconnect
  (package
    (name "sdrconnect")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri "http://www.sdrplay.com/sdrconnect/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SDR receiver for SDRplay devices")
    (description "SDR receiver for SDRplay devices.")
    (home-page "http://www.sdrplay.com/sdrconnect/")
    (license (nonfree "http://www.sdrplay.com/sdrconnect/"))))

(define-public daggerfall-unity-bin
  (package
    (name "daggerfall-unity-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.dfworkshop.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/daggerfall-unity-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Elder Scrolls: Daggerfall rebuilt using the unity engine")
    (description "The Elder Scrolls: Daggerfall rebuilt using the unity engine.")
    (home-page "https://www.dfworkshop.net/")
    (license license:gpl3+)))

(define-public eparakstitajs3
  (package
    (name "eparakstitajs3")
    (version "1.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.eparaksts.lv")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "application software to sign and validate documents in EDOC and PDF formats")
    (description "Application software to sign and validate documents in EDOC and PDF formats.")
    (home-page "https://www.eparaksts.lv")
    (license (nonfree "https://www.eparaksts.lv"))))

(define-public tuptime
  (package
    (name "tuptime")
    (version "5.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rfmoz/tuptime")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "historical and statistical system uptime reporting")
    (description "Historical and statistical system uptime reporting.")
    (home-page "https://github.com/rfmoz/tuptime")
    (license license:gpl2)))

(define-public qgnomeplatform-qt6
  (package
    (name "qgnomeplatform-qt6")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/FedoraQt/QGnomePlatform")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qPlatformTheme for a better Qt6 application inclusion in GNOME")
    (description "QPlatformTheme for a better Qt6 application inclusion in GNOME.")
    (home-page "https://github.com/FedoraQt/QGnomePlatform")
    (license license:lgpl2.1)))

(define-public gocheat-bin
  (package
    (name "gocheat-bin")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Achno/gocheat/releases/download/v" version "/gocheat-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gocheat-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tool to create beautiful cheatsheets for your keybinds and aliases")
    (description "A tool to create beautiful cheatsheets for your keybinds and aliases.")
    (home-page "https://github.com/Achno/gocheat")
    (license license:expat)))

(define-public dulcepan-git
  (package
    (name "dulcepan-git")
    (version "v1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/vyivel/dulcepan")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Wayland screenshot tool")
    (description "A Wayland screenshot tool.")
    (home-page "https://codeberg.org/vyivel/dulcepan")
    (license license:gpl3)))

(define-public rundeck-community
  (package
    (name "rundeck-community")
    (version "5.17.0.20251103")
    (source (origin
              (method url-fetch)
              (uri "https://www.rundeck.com/open-source")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rundeck is an open source automation service with a web console, command ...")
    (description "Rundeck is an open source automation service with a web console, command line tools and a WebAPI.")
    (home-page "https://www.rundeck.com/open-source")
    (license license:asl2.0)))

(define-public alvr-git
  (package
    (name "alvr-git")
    (version "21.0.0_dev10")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/alvr-org/ALVR")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental Linux version of ALVR. Stream VR games from your PC to your ...")
    (description "Experimental Linux version of ALVR. Stream VR games from your PC to your headset via Wi-Fi.")
    (home-page "https://github.com/alvr-org/ALVR")
    (license license:expat)))

(define-public listen1-desktop-appimage
  (package
    (name "listen1-desktop-appimage")
    (version "2.33.0")
    (source (origin
              (method url-fetch)
              (uri "https://listen1.github.io/listen1")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/listen1-desktop-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "one for all free music in China")
    (description "One for all free music in China.")
    (home-page "https://listen1.github.io/listen1")
    (license license:expat)))

(define-public arqiver
  (package
    (name "arqiver")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/tsujan/Arqiver")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple Qt archive manager based on libarchive")
    (description "Simple Qt archive manager based on libarchive.")
    (home-page "https://github.com/tsujan/Arqiver")
    (license license:gpl3+)))

(define-public purr
  (package
    (name "purr")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/uncenter/purr")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unoffical CLI for Catppuccin port developers")
    (description "Unoffical CLI for Catppuccin port developers.")
    (home-page "https://github.com/uncenter/purr")
    (license license:expat)))

(define-public abracadabra
  (package
    (name "abracadabra")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/KejPi/AbracaDABra")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "abraca DAB radio: DAB/DAB+ Software Defined Radio (SDR)")
    (description "Abraca DAB radio: DAB/DAB+ Software Defined Radio (SDR).")
    (home-page "https://github.com/KejPi/AbracaDABra")
    (license license:expat)))

(define-public outlook-for-linux-bin
  (package
    (name "outlook-for-linux-bin")
    (version "1.3.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mahmoudbahaa/outlook-for-linux/releases/download/v" version "/outlook-for-linux-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/outlook-for-linux-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unofficial Microsoft Outlook for Linux client (binary version)")
    (description "Unofficial Microsoft Outlook for Linux client (binary version).")
    (home-page "https://github.com/mahmoudbahaa/outlook-for-linux")
    (license license:gpl3+)))

(define-public afdko
  (package
    (name "afdko")
    (version "4.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/adobe-type-tools/afdko")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adobe Font Development Kit for OpenType")
    (description "Adobe Font Development Kit for OpenType.")
    (home-page "https://github.com/adobe-type-tools/afdko")
    (license license:asl2.0)))

(define-public wiznote-desktop-bin
  (package
    (name "wiznote-desktop-bin")
    (version "0.1.107")
    (source (origin
              (method url-fetch)
              (uri "https://www.wiz.cn")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wiznote-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A powerful note-taking tool.(Prebuilt version.Use system-wide electron)")
    (description "A powerful note-taking tool.(Prebuilt version.Use system-wide electron).")
    (home-page "https://www.wiz.cn")
    (license (nonfree "https://www.wiz.cn"))))

(define-public torzu-git
  (package
    (name "torzu-git")
    (version "fd908334a")
    (source (origin
              (method url-fetch)
              (uri "https://notabug.org/litucks/torzu")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "torzu is a fork of yuzu, the world's most popular, open-source, Nintendo ...")
    (description "Torzu is a fork of yuzu, the world's most popular, open-source, Nintendo Switch emulator. It is written in C++ with portability in mind.")
    (home-page "https://notabug.org/litucks/torzu")
    (license license:gpl3+)))

(define-public pi-hole-ftl
  (package
    (name "pi-hole-ftl")
    (version "6.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pi-hole/FTL")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Pi-hole FTL engine")
    (description "The Pi-hole FTL engine.")
    (home-page "https://github.com/pi-hole/FTL")
    (license license:eupl1.2)))

(define-public xerox-phaser-3020
  (package
    (name "xerox-phaser-3020")
    (version "1.00.25")
    (source (origin
              (method url-fetch)
              (uri "https://www.support.xerox.com/support/phaser-3020")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "driver for the Xerox Phaser 3020. Also supports Phaser 3052, 3117, 3140, ...")
    (description "Driver for the Xerox Phaser 3020. Also supports Phaser 3052, 3117, 3140, 3155, 3160, 3200MFP, 3250, 3260, 3300MFP, 3320, 3435, 3600, 6110MFP, WorkCentre 3025, 3210, 3215, 3220, 3225, 3315, 3325, 3550, 4118, PE120, PE220, FaxCentre 2218.")
    (home-page "https://www.support.xerox.com/support/phaser-3020")
    (license (nonfree "https://www.support.xerox.com/support/phaser-3020"))))

(define-public owncast
  (package
    (name "owncast")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://owncast.online/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "self-hosted live video streaming (chat included)")
    (description "Self-hosted live video streaming (chat included).")
    (home-page "https://owncast.online/")
    (license license:expat)))

(define-public qt-dab
  (package
    (name "qt-dab")
    (version "6.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://www.sdr-j.tk/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software DAB decoder for use with various SDR devices (formerly dab-maxi)")
    (description "Software DAB decoder for use with various SDR devices (formerly dab-maxi).")
    (home-page "https://www.sdr-j.tk/")
    (license license:gpl2)))

(define-public dpitunnel
  (package
    (name "dpitunnel")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/txtsd/DPITunnel")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free, simple and serverless solution against censorship for Linux PCs and...")
    (description "Free, simple and serverless solution against censorship for Linux PCs and routers.")
    (home-page "https://github.com/txtsd/DPITunnel")
    (license license:gpl3+)))

(define-public hyprlux
  (package
    (name "hyprlux")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/amadejkastelic/Hyprlux")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hyprland utility that automates vibrance and night light control")
    (description "Hyprland utility that automates vibrance and night light control.")
    (home-page "https://github.com/amadejkastelic/Hyprlux")
    (license license:expat)))

(define-public google-cloud-cli-lite
  (package
    (name "google-cloud-cli-lite")
    (version "541.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/tonymet/gcloud-lite")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A distribution of the gcloud CLI that strips unnecessary dependencies to ...")
    (description "A distribution of the gcloud CLI that strips unnecessary dependencies to reduce the size by > 75%.")
    (home-page "https://github.com/tonymet/gcloud-lite")
    (license license:asl2.0)))

(define-public zfs-prune-snapshots
  (package
    (name "zfs-prune-snapshots")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/bahamas10/zfs-prune-snapshots")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remove snapshots from one or more zpools that match given criteria")
    (description "Remove snapshots from one or more zpools that match given criteria.")
    (home-page "https://github.com/bahamas10/zfs-prune-snapshots")
    (license license:expat)))

(define-public golored
  (package
    (name "golored")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/alexcoder04/golored")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "color shell scripts' output")
    (description "Color shell scripts' output.")
    (home-page "https://github.com/alexcoder04/golored")
    (license license:gpl3+)))

(define-public metals
  (package
    (name "metals")
    (version "1.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://scalameta.org/metals/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "language Server For Scala")
    (description "Language Server For Scala.")
    (home-page "https://scalameta.org/metals/")
    (license license:asl2.0)))

(define-public airgeddon
  (package
    (name "airgeddon")
    (version "11.61")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/v1s1t0r1sh3r3/airgeddon")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-use bash script for Linux systems to audit wireless networks")
    (description "Multi-use bash script for Linux systems to audit wireless networks.")
    (home-page "https://github.com/v1s1t0r1sh3r3/airgeddon")
    (license license:gpl3)))

(define-public zrok-bin
  (package
    (name "zrok-bin")
    (version "1.1.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/openziti/zrok/releases/download/v" version "/zrok-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zrok-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an open source sharing solution built on OpenZiti")
    (description "An open source sharing solution built on OpenZiti.")
    (home-page "https://github.com/openziti/zrok")
    (license license:asl2.0)))

(define-public conceal-bin
  (package
    (name "conceal-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/TD-Sky/conceal/releases/download/v" version "/conceal-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/conceal-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line recycle bin")
    (description "Command line recycle bin.")
    (home-page "https://github.com/TD-Sky/conceal")
    (license license:expat)))

(define-public softethervpn
  (package
    (name "softethervpn")
    (version "v4.44_9807")
    (source (origin
              (method url-fetch)
              (uri "https://www.softether.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-protocol VPN Program from University of Tsukuba")
    (description "Multi-protocol VPN Program from University of Tsukuba.")
    (home-page "https://www.softether.org/")
    (license license:asl2.0)))

(define-public jlink-systemview
  (package
    (name "jlink-systemview")
    (version "4.10a")
    (source (origin
              (method url-fetch)
              (uri "https://www.segger.com/downloads/jlink/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "segger SystemView for Linux")
    (description "Segger SystemView for Linux.")
    (home-page "https://www.segger.com/downloads/jlink/")
    (license (nonfree "https://www.segger.com/downloads/jlink/"))))

(define-public nikto-git
  (package
    (name "nikto-git")
    (version "2.1.6.601.7ac0457")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sullo/nikto")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A web server scanner which performs comprehensive tests against web serve...")
    (description "A web server scanner which performs comprehensive tests against web servers for multiple items.")
    (home-page "https://github.com/sullo/nikto")
    (license license:gpl3+)))

(define-public mangl
  (package
    (name "mangl")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/zigalenarcic/mangl")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical man page viewer")
    (description "Graphical man page viewer.")
    (home-page "https://github.com/zigalenarcic/mangl")
    (license license:bsd-2)))

(define-public softethervpn-git
  (package
    (name "softethervpn-git")
    (version "5.02.5180")
    (source (origin
              (method url-fetch)
              (uri "https://www.softether.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-protocol VPN Program from University of Tsukuba (Developer Edition ...")
    (description "Multi-protocol VPN Program from University of Tsukuba (Developer Edition / git version).")
    (home-page "https://www.softether.org/")
    (license license:asl2.0)))
