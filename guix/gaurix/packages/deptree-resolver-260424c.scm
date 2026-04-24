;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424c
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;; 50 recipes created, 50 remain blocked.
;;;
;;; New recipes (50):
;;;      36.  intermodal-bin (#6105, copy-build-system, v0.1.16, custom:CC0)
;;;      37.  invoice-bin (#10089, copy-build-system, v0.1.0, MIT)
;;;      40.  jotit-bin (#6506, copy-build-system, v0.6.0, MIT)
;;;      41.  jsongrep-bin (#3938, copy-build-system, v0.9.0, MIT)
;;;      43.  k0sctl-bin (#6401, copy-build-system, v0.29.0, Apache-2.0)
;;;      44.  kalker-bin (#8230, copy-build-system, v2.2.2, MIT)
;;;      46.  kv-bin (#8244, copy-build-system, v0.5.0, MIT)
;;;      47.  ladybug-bin (#6612, copy-build-system, v0.15.3, MIT)
;;;      48.  languagetool-ngrams-es (#2913, gnu-build-system, v20150915, CCPL)
;;;      49.  lattice-bin (#2579, copy-build-system, v0.1.0, MIT)
;;;      50.  lazydocker-ng-bin (#6490, copy-build-system, v0.28.0, MIT)
;;;      51.  lazyjira-bin (#2580, copy-build-system, v2.10.1, MIT)
;;;      52.  lazysql-bin (#9061, copy-build-system, v0.4.8, MIT)
;;;      53.  lbforth (#7858, gnu-build-system, v20241115, custom:public domain)
;;;      54.  librespeed-cli-bin (#7696, copy-build-system, v1.0.12, LGPL3)
;;;      55.  lnko-bin (#6692, copy-build-system, v0.2.3, GPL-3.0-or-later)
;;;      56.  lzbench-bin (#6668, copy-build-system, v2.2, 0BSD, Apache-2.0)
;;;      57.  makeenv (#6204, gnu-build-system, v1.0.3, custom:ISC)
;;;      59.  mchose-a7-v2-pro-udev (#7622, gnu-build-system, v1.0.0, GPL)
;;;      60.  mchose-ace68-udev (#7934, gnu-build-system, v1.0.0, GPL)
;;;      61.  megit (#2484, gnu-build-system, v0.9.0, EPL2.0)
;;;      63.  mongotimer (#5312, gnu-build-system, v1.2.1, custom:ISC)
;;;      64.  moor-bin (#8624, copy-build-system, v2.12.1, BSD-2-Clause-Views)
;;;      65.  nautilus-megasync (#9392, gnu-build-system, v6.2.0, custom:The Clarified Artistic License)
;;;      68.  nextdns-bin (#6097, copy-build-system, v1.47.2, MIT)
;;;      70.  ninvaders (#3934, gnu-build-system, v0.1.1, GPL)
;;;      71.  nitro-bin (#19085, copy-build-system, v30.0.2, custom:ChilliCreamLicense1.0)
;;;      72.  nvidia-prime-rtd3pm (#5317, gnu-build-system, v1.1, MIT)
;;;      73.  ocr-fonts (#8005, gnu-build-system, v0.3.1, Other)
;;;      74.  openrgb-udev-rules (#20409, gnu-build-system, v0.9, GPL2)
;;;      75.  otf-kopub (#5209, font-build-system, v202204, custom)
;;;      76.  otf-myna (#6599, font-build-system, v1.0.0, OFL-1.1)
;;;      77.  parm-bin (#7886, copy-build-system, v0.1.6, GPL-3.0)
;;;      80.  pocket-id-bin (#7927, copy-build-system, v2.6.2, BSD)
;;;      81.  posy-improved-cursors (#5031, gnu-build-system, v1.6, unknown)
;;;      83.  protonup-rs-bin (#1625, copy-build-system, v0.11.0, Apache)
;;;      85.  reddix-bin (#8554, copy-build-system, v0.2.9, MIT License)
;;;      86.  regina-rexx-doc (#8236, gnu-build-system, v3.9.7, LGPL-2.0-or-later)
;;;      88.  rime-wanxiang-gram-zh-hans (#6441, gnu-build-system, v20260421.010649, CC-BY-4.0)
;;;      89.  rtimelog (#7977, gnu-build-system, v0.3.6, MIT)
;;;      90.  rtimelogger (#7978, gnu-build-system, v0.8.6, MIT)
;;;      91.  rust-docs (#8550, gnu-build-system, v1.95.0, Apache-2.0 OR MIT)
;;;      92.  rust-motd-bin (#8143, copy-build-system, v2.1.2, MIT)
;;;      93.  rusticon-bin (#6698, copy-build-system, v0.2.2, cc-by-nc-nd-4.0)
;;;      94.  sequin-bin (#6700, copy-build-system, v0.3.1, MIT)
;;;      95.  setpgrp (#6193, gnu-build-system, v2.1.2, custom:ISC)
;;;      97.  shiru (#15489, gnu-build-system, v6.5.2, GPL-3.0)
;;;      98.  simple-http-server-bin (#6559, copy-build-system, v0.6.13, MIT)
;;;      99.  smap-bin (#38509, copy-build-system, v0.1.12, GPL3)
;;;     100.  smb1r-bin (#1162, copy-build-system, v1.0.2, GPLv3)
;;;
;;; BLOCKED (50):
;;;       1.  glfw-wayland-minecraft-cursorfix (#740) -- PATCH_VARIANT: patched GLFW for Minecraft cursor fix on Wayland; Guix has glfw w
;;;       2.  texlive-installer (#8013) -- META_INSTALLER: texlive-installer is a network installer; Guix has native texliv
;;;       3.  electron37-bin (#1286) -- VERSION_PINNED_BINARY: version-pinned Electron binary; Guix has electron in nong
;;;       4.  dotnet-sdk-8.0-bin (#15164) -- RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;       5.  dotnet-runtime-bin (#1270) -- RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;       6.  android-armv7a-eabi-qt6-base (#13966) -- CROSS_COMPILE_UNSUPPORTED: Android cross-compilation toolchain package; requires
;;;       7.  aspnet-runtime-8.0-bin (#15167) -- RUNTIME_BINARY: ASP.NET binary distribution; part of dotnet ecosystem in nonguix
;;;       8.  lib32-libdav1d (#2478) -- MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;       9.  docker-desktop (#140) -- PROPRIETARY_PLATFORM: Docker Desktop is proprietary and requires Docker Engine s
;;;      10.  rar (#1989) -- PROPRIETARY_SOFTWARE: WinRAR/RAR archiver is proprietary shareware; Guix has unr
;;;      11.  ut2004-data-steam (#3517) -- NON_DISTRIBUTABLE: requires purchased game files
;;;      12.  samsung-unified-driver-printer (#650) -- PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary 
;;;      13.  samsung-unified-driver-scanner (#649) -- PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary 
;;;      14.  lib32-libvmaf (#2366) -- MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;      15.  kemoticons (#5333) -- ALREADY_IN_GUIX: kemoticons is a KDE Frameworks 5 package; check (gnu packages k
;;;      16.  qtforkawesome (#10943) -- DEP_CHAIN: requires qtutilities and c++utilities from same author (Martchus); de
;;;      17.  lib32-nvidia-utils-beta (#2408) -- MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;      18.  qpdf-zopfli (#3041) -- PATCH_VARIANT: qpdf rebuilt with Zopfli compression; Guix has qpdf
;;;      19.  python-opentelemetry-exporter-otlp-proto-http (#2148) -- DEP_CHAIN: requires python-opentelemetry-sdk, -api, -proto + grpcio chain
;;;      20.  python-opentelemetry-exporter-otlp-proto-grpc (#2149) -- DEP_CHAIN: requires python-opentelemetry-sdk, -api, -proto + grpcio chain
;;;      21.  fbthrift (#7961) -- BUILD_SYSTEM_TOO_COMPLEX: Facebook Thrift requires folly, fizz, wangle, fboss; 2
;;;      22.  expressvpn (#7068) -- PROPRIETARY_SERVICE: commercial VPN client requiring paid subscription; binary-o
;;;      23.  chkufsd-bin (#1732) -- PROPRIETARY_DRIVER: Paragon UFSD filesystem check tool; proprietary binary
;;;      24.  chromium-gost (#757) -- BUILD_SYSTEM_TOO_COMPLEX: full Chromium build with Russian GOST cryptography pat
;;;      25.  dotnet-targeting-pack-bin (#1268) -- RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;      26.  e2-studio-bin (#13914) -- PROPRIETARY_IDE: Renesas e2 studio is proprietary Eclipse-based IDE requiring re
;;;      27.  edk2-ovmf-fedora (#8117) -- BINARY_REPACKAGE: Fedora-built OVMF firmware binaries; Guix has native ovmf pack
;;;      28.  foundryvtt (#7717) -- PROPRIETARY_SERVICE: Foundry VTT is proprietary tabletop RPG platform requiring 
;;;      29.  gama-platform-jdk (#8558) -- BUILD_SYSTEM_TOO_COMPLEX: GAMA simulation platform bundled with JDK; large Eclip
;;;      30.  grafana-bin (#10333) -- PROPRIETARY_BUILD: Grafana binary includes AGPL backend + proprietary Enterprise
;;;      31.  hbuilderx-alpha-bin (#7235) -- PROPRIETARY_IDE: HBuilderX is proprietary DCloud IDE; not redistributable
;;;      32.  hdfview-bin (#5142) -- PROPRIETARY_BUILD: HDFView binary from HDF Group; requires custom build with Jav
;;;      33.  heptabase-bin (#8961) -- PROPRIETARY_SERVICE: Heptabase is proprietary note-taking SaaS app (Electron); r
;;;      34.  httptoolkit-bin (#4732) -- PROPRIETARY_SERVICE: HTTP Toolkit has proprietary pro features; Electron binary
;;;      35.  hubstaff (#3356) -- PROPRIETARY_SERVICE: Hubstaff is proprietary time-tracking SaaS client; requires
;;;      38.  jai (#15430) -- PROPRIETARY_CLOSED_SOURCE: JAI is a proprietary compiler with restricted beta ac
;;;      39.  joplin-bin (#1255) -- ELECTRON_APP_COMPLEX: Joplin is a large Electron app; binary redistribution may 
;;;      42.  justevery-code-bin (#6443) -- PROPRIETARY_SERVICE: JustEvery Code is proprietary AI-powered IDE requiring subs
;;;      45.  krux-installer-bin (#6696) -- ELECTRON_APP_COMPLEX: Krux installer is an Electron app for hardware wallet firm
;;;      58.  max-appimage (#9103) -- PROPRIETARY_SOFTWARE: MAX is proprietary Russian office/OS platform; requires li
;;;      62.  miniconda3 (#6113) -- PROPRIETARY_DISTRIBUTION: Miniconda is proprietary Anaconda distribution; Guix h
;;;      66.  navicat17-premium-en (#7996) -- PROPRIETARY_SOFTWARE: Navicat is proprietary commercial database management tool
;;;      67.  nextcloud-talk-desktop-bin (#6383) -- ELECTRON_APP_COMPLEX: Nextcloud Talk Desktop is Electron app; large binary distr
;;;      69.  ninjarmm-ncplayer (#7498) -- PROPRIETARY_SERVICE: NinjaRMM is proprietary remote monitoring/management SaaS; 
;;;      78.  pgyvisitor (#6522) -- PROPRIETARY_SERVICE: PGY Visitor is proprietary app distribution platform client
;;;      79.  plecs-standalone (#2780) -- PROPRIETARY_SOFTWARE: PLECS is proprietary power electronics simulation tool; re
;;;      82.  pragmatapro-fonts (#7941) -- PROPRIETARY_FONT: Pragmata Pro is proprietary commercial font; requires purchase
;;;      84.  publii (#7863) -- ELECTRON_APP_COMPLEX: Publii is a large Electron static site CMS; complex Node.j
;;;      87.  rider-eap (#8626) -- PROPRIETARY_IDE: JetBrains Rider is proprietary IDE requiring paid license
;;;      96.  shiftfs-lts-dkms (#7943) -- KERNEL_MODULE: DKMS kernel module; requires kernel build infrastructure not avai
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260424c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            intermodal-bin
            invoice-bin
            jotit-bin
            jsongrep-bin
            k0sctl-bin
            kalker-bin
            kv-bin
            ladybug-bin
            languagetool-ngrams-es
            lattice-bin
            lazydocker-ng-bin
            lazyjira-bin
            lazysql-bin
            lbforth
            librespeed-cli-bin
            lnko-bin
            lzbench-bin
            makeenv
            mchose-a7-v2-pro-udev
            mchose-ace68-udev
            megit
            mongotimer
            moor-bin
            nautilus-megasync
            nextdns-bin
            ninvaders
            nitro-bin
            nvidia-prime-rtd3pm
            ocr-fonts
            openrgb-udev-rules
            otf-kopub
            otf-myna
            parm-bin
            pocket-id-bin
            posy-improved-cursors
            protonup-rs-bin
            reddix-bin
            regina-rexx-doc
            rime-wanxiang-gram-zh-hans
            rtimelog
            rtimelogger
            rust-docs
            rust-motd-bin
            rusticon-bin
            sequin-bin
            setpgrp
            shiru
            simple-http-server-bin
            smap-bin
            smb1r-bin
            ))

;;; -------------------------------------------------------------------
;;; 36. intermodal-bin
;;; -------------------------------------------------------------------
(define-public intermodal-bin
  (package
    (name "intermodal-bin")
    (version "0.1.16")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/casey/intermodal/releases/download/v0.1.16/intermodal-0.1.16-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("intermodal" "bin/intermodal"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "user-friendly and featureful CLI BitTorrent metainfo utility, written in Rust")
    (description "User-friendly and featureful CLI BitTorrent metainfo utility, written in
Rust.")
    (home-page "https://github.com/casey/intermodal")
    (license license:cc0)
    ))

;;; -------------------------------------------------------------------
;;; 37. invoice-bin
;;; -------------------------------------------------------------------
(define-public invoice-bin
  (package
    (name "invoice-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/maaslalani/invoice/releases/download/v0.1.0/invoice-0.1.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("invoice" "bin/invoice"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line invoice generator")
    (description "Command line invoice generator.")
    (home-page "https://github.com/maaslalani/invoice")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 40. jotit-bin
;;; -------------------------------------------------------------------
(define-public jotit-bin
  (package
    (name "jotit-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mkaz/jotit/releases/download/v0.6.0/jotit-0.6.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jotit" "bin/jotit"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple command-line tool to jot notes")
    (description "A simple command-line tool to jot notes.")
    (home-page "https://github.com/mkaz/jotit")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 41. jsongrep-bin
;;; -------------------------------------------------------------------
(define-public jsongrep-bin
  (package
    (name "jsongrep-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/micahkepe/jsongrep/releases/download/v0.9.0/jsongrep-0.9.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jsongrep" "bin/jsongrep"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a JSONPath-inspired query language over JSON documents")
    (description "A JSONPath-inspired query language over JSON documents.")
    (home-page "https://github.com/micahkepe/jsongrep")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 43. k0sctl-bin
;;; -------------------------------------------------------------------
(define-public k0sctl-bin
  (package
    (name "k0sctl-bin")
    (version "0.29.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/k0sproject/k0sctl/releases/download/v0.29.0/k0sctl-0.29.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("k0sctl" "bin/k0sctl"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a bootstrapping and management tool for k0s clusters")
    (description "A bootstrapping and management tool for k0s clusters.")
    (home-page "https://github.com/k0sproject/k0sctl")
    (license license:asl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 44. kalker-bin
;;; -------------------------------------------------------------------
(define-public kalker-bin
  (package
    (name "kalker-bin")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://kalker.xyz/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kalker" "bin/kalker"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "kalker/kalk is a calculator with math syntax that supports user-defined varia")
    (description "Kalker/kalk is a calculator with math syntax that supports user-defined
variables and functions, complex numbers, and estimation of derivatives
and integrals.")
    (home-page "https://kalker.xyz/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 46. kv-bin
;;; -------------------------------------------------------------------
(define-public kv-bin
  (package
    (name "kv-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/AmrSaber/kv/releases/download/v0.5.0/kv-0.5.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kv" "bin/kv"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a lightweight, feature-rich command-line key-value store with encryption, TTL")
    (description "A lightweight, feature-rich command-line key-value store with
encryption, TTL, and version control.")
    (home-page "https://github.com/AmrSaber/kv")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 47. ladybug-bin
;;; -------------------------------------------------------------------
(define-public ladybug-bin
  (package
    (name "ladybug-bin")
    (version "0.15.3")
    (source (origin
              (method url-fetch)
              (uri "https://ladybugdb.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ladybug" "bin/ladybug"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "in-process property graph database management system (GDBMS) built for query ")
    (description "In-process property graph database management system (GDBMS) built for
query speed and scalability.")
    (home-page "https://ladybugdb.com")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 48. languagetool-ngrams-es
;;; -------------------------------------------------------------------
(define-public languagetool-ngrams-es
  (package
    (name "languagetool-ngrams-es")
    (version "20150915")
    (source (origin
              (method url-fetch)
              (uri "http://wiki.languagetool.org/finding-errors-using-n-gram-data")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "finding errors using n-gram data, spanish text")
    (description "Finding errors using n-gram data, spanish text.")
    (home-page "http://wiki.languagetool.org/finding-errors-using-n-gram-data")
    (license license:cc-by-sa3.0)
    ))

;;; -------------------------------------------------------------------
;;; 49. lattice-bin
;;; -------------------------------------------------------------------
(define-public lattice-bin
  (package
    (name "lattice-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/floatpane/lattice/releases/download/v0.1.0/lattice-0.1.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lattice" "bin/lattice"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a modular terminal dashboard built with Go and Bubble Tea")
    (description "A modular terminal dashboard built with Go and Bubble Tea.")
    (home-page "https://github.com/floatpane/lattice")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 50. lazydocker-ng-bin
;;; -------------------------------------------------------------------
(define-public lazydocker-ng-bin
  (package
    (name "lazydocker-ng-bin")
    (version "0.28.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/peauc/lazydocker-ng/releases/download/v0.28.0/lazydocker-ng-0.28.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazydocker-ng" "bin/lazydocker-ng"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the continuation of lazydocker the simple terminal UI for docker, written in ")
    (description "The continuation of lazydocker the simple terminal UI for docker,
written in Go.")
    (home-page "https://github.com/peauc/lazydocker-ng/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 51. lazyjira-bin
;;; -------------------------------------------------------------------
(define-public lazyjira-bin
  (package
    (name "lazyjira-bin")
    (version "2.10.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/textfuel/lazyjira/releases/download/v2.10.1/lazyjira-2.10.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazyjira" "bin/lazyjira"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal UI for Jira (prebuilt binary)")
    (description "Terminal UI for Jira (prebuilt binary).")
    (home-page "https://github.com/textfuel/lazyjira")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 52. lazysql-bin
;;; -------------------------------------------------------------------
(define-public lazysql-bin
  (package
    (name "lazysql-bin")
    (version "0.4.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jorgerojas26/lazysql/releases/download/v0.4.8/lazysql-0.4.8-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazysql" "bin/lazysql"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a cross-platform TUI database management tool written in Go")
    (description "A cross-platform TUI database management tool written in Go.")
    (home-page "https://github.com/jorgerojas26/lazysql")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 53. lbforth
;;; -------------------------------------------------------------------
(define-public lbforth
  (package
    (name "lbforth")
    (version "20241115")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/DosWorld/lbforth/archive/refs/tags/v20241115.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimal Forth compiler in C")
    (description "A minimal Forth compiler in C.")
    (home-page "https://github.com/DosWorld/lbforth")
    (license license:public-domain)
    ))

;;; -------------------------------------------------------------------
;;; 54. librespeed-cli-bin
;;; -------------------------------------------------------------------
(define-public librespeed-cli-bin
  (package
    (name "librespeed-cli-bin")
    (version "1.0.12")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/librespeed/speedtest-cli/releases/download/v1.0.12/speedtest-cli-1.0.12-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("librespeed-cli" "bin/librespeed-cli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line interface for LibreSpeed speed test backends. Written in Go")
    (description "Command line interface for LibreSpeed speed test backends. Written in
Go.")
    (home-page "https://github.com/librespeed/speedtest-cli")
    (license license:lgpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 55. lnko-bin
;;; -------------------------------------------------------------------
(define-public lnko-bin
  (package
    (name "lnko-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pgagnidze/lnko/releases/download/v0.2.3/lnko-0.2.3-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lnko" "bin/lnko"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple stow-like dotfile linker")
    (description "Simple stow-like dotfile linker.")
    (home-page "https://github.com/pgagnidze/lnko")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 56. lzbench-bin
;;; -------------------------------------------------------------------
(define-public lzbench-bin
  (package
    (name "lzbench-bin")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/inikep/lzbench/releases/download/v2.2/lzbench-2.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lzbench" "bin/lzbench"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an in-memory benchmark of open-source compressors")
    (description "An in-memory benchmark of open-source compressors.")
    (home-page "https://github.com/inikep/lzbench")
    (license (list license:bsd-0 license:asl2.0 license:bsd-2 license:bsd-3 license:cc0 (license:non-copyleft "file://LICENSE") license:gpl3+ license:gpl2 license:gpl2+ license:lgpl3+ license:public-domain license:expat license:unlicense license:zlib))
    ))

;;; -------------------------------------------------------------------
;;; 57. makeenv
;;; -------------------------------------------------------------------
(define-public makeenv
  (package
    (name "makeenv")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/maandree/makeenv/archive/v1.0.3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run make(1) with environment loaded from .makeenv")
    (description "Run make(1) with environment loaded from .makeenv.")
    (home-page "https://codeberg.org/maandree/makeenv")
    (license license:isc)
    ))

;;; -------------------------------------------------------------------
;;; 59. mchose-a7-v2-pro-udev
;;; -------------------------------------------------------------------
(define-public mchose-a7-v2-pro-udev
  (package
    (name "mchose-a7-v2-pro-udev")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/mchose-a7-v2-pro-udev")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rule for the Mchose A7 V2 Pro Gaming Mouse")
    (description "Udev rule for the Mchose A7 V2 Pro Gaming Mouse.")
    (home-page "https://aur.archlinux.org/packages/mchose-a7-v2-pro-udev")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 60. mchose-ace68-udev
;;; -------------------------------------------------------------------
(define-public mchose-ace68-udev
  (package
    (name "mchose-ace68-udev")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/mchose-ace68-udev")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rule for the Mchose Ace68 keyboard")
    (description "Udev rule for the Mchose Ace68 keyboard.")
    (home-page "https://aur.archlinux.org/packages/mchose-ace68-udev")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 61. megit
;;; -------------------------------------------------------------------
(define-public megit
  (package
    (name "megit")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/eclipsesource/megit/archive/refs/tags/v0.9.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Git GUI repository manager based on EGit Eclipse plugin")
    (description "A Git GUI repository manager based on EGit Eclipse plugin.")
    (home-page "https://github.com/eclipsesource/megit")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 63. mongotimer
;;; -------------------------------------------------------------------
(define-public mongotimer
  (package
    (name "mongotimer")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/maandree/mongotimer/archive/v1.2.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a humongous timer or stopwatch for the terminal")
    (description "A humongous timer or stopwatch for the terminal.")
    (home-page "https://codeberg.org/maandree/mongotimer")
    (license license:isc)
    ))

;;; -------------------------------------------------------------------
;;; 64. moor-bin
;;; -------------------------------------------------------------------
(define-public moor-bin
  (package
    (name "moor-bin")
    (version "2.12.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/walles/moor/releases/download/v2.12.1/moor-2.12.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("moor" "bin/moor"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a pager designed to just do the right thing without any configuration")
    (description "A pager designed to just do the right thing without any configuration.")
    (home-page "https://github.com/walles/moor")
    (license license:bsd-3)
    ))

;;; -------------------------------------------------------------------
;;; 65. nautilus-megasync
;;; -------------------------------------------------------------------
(define-public nautilus-megasync
  (package
    (name "nautilus-megasync")
    (version "6.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://mega.io/desktop#downloadapps")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "upload your files to your Mega account from nautilus")
    (description "Upload your files to your Mega account from nautilus.")
    (home-page "https://mega.io/desktop#downloadapps")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 68. nextdns-bin
;;; -------------------------------------------------------------------
(define-public nextdns-bin
  (package
    (name "nextdns-bin")
    (version "1.47.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nextdns/nextdns/releases/download/v1.47.2/nextdns-1.47.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nextdns" "bin/nextdns"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "nextDNS DNS/53 to DoH Proxy")
    (description "NextDNS DNS/53 to DoH Proxy.")
    (home-page "https://github.com/nextdns/nextdns")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 70. ninvaders
;;; -------------------------------------------------------------------
(define-public ninvaders
  (package
    (name "ninvaders")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "http://downloads.sourceforge.net/sourceforge/ninvaders/ninvaders-0.1.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ncurses based space invaders clone")
    (description "Ncurses based space invaders clone.")
    (home-page "http://ninvaders.sourceforge.net/")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 71. nitro-bin
;;; -------------------------------------------------------------------
(define-public nitro-bin
  (package
    (name "nitro-bin")
    (version "30.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://chillicream.com/products/nitro/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nitro" "bin/nitro"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an incredible, beautiful, and feature-rich GraphQL IDE")
    (description "An incredible, beautiful, and feature-rich GraphQL IDE.")
    (home-page "https://chillicream.com/products/nitro/")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 72. nvidia-prime-rtd3pm
;;; -------------------------------------------------------------------
(define-public nvidia-prime-rtd3pm
  (package
    (name "nvidia-prime-rtd3pm")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://us.download.nvidia.com/XFree86/Linux-x86_64/550.67/README/dynamicpowermanagement.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "configure your discrete NVIDIA GPU to power down when not in use")
    (description "Configure your discrete NVIDIA GPU to power down when not in use.")
    (home-page "https://us.download.nvidia.com/XFree86/Linux-x86_64/550.67/README/dynamicpowermanagement.html")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 73. ocr-fonts
;;; -------------------------------------------------------------------
(define-public ocr-fonts
  (package
    (name "ocr-fonts")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://tsukurimashou.org/ocr.php.en")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free versions of OCR-A and OCR-B fonts")
    (description "Free versions of OCR-A and OCR-B fonts.")
    (home-page "https://tsukurimashou.org/ocr.php.en")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 74. openrgb-udev-rules
;;; -------------------------------------------------------------------
(define-public openrgb-udev-rules
  (package
    (name "openrgb-udev-rules")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri "https://openrgb.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "uDEV rules for OpenRGB Flatpak and Appimage")
    (description "UDEV rules for OpenRGB Flatpak and Appimage.")
    (home-page "https://openrgb.org")
    (license license:gpl2)
    ))

;;; -------------------------------------------------------------------
;;; 75. otf-kopub
;;; -------------------------------------------------------------------
(define-public otf-kopub
  (package
    (name "otf-kopub")
    (version "202204")
    (source (origin
              (method url-fetch)
              (uri "https://www.kopus.org/biz-electronic-font2-2/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list))
    (synopsis "koPub OpenType Korean fonts")
    (description "KoPub OpenType Korean fonts.")
    (home-page "https://www.kopus.org/biz-electronic-font2-2/")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 76. otf-myna
;;; -------------------------------------------------------------------
(define-public otf-myna
  (package
    (name "otf-myna")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sayyadirfanali/Myna/archive/refs/tags/v1.0.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list))
    (synopsis "monospace typeface designed for symbol-rich programming")
    (description "Monospace typeface designed for symbol-rich programming.")
    (home-page "https://github.com/sayyadirfanali/Myna")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 77. parm-bin
;;; -------------------------------------------------------------------
(define-public parm-bin
  (package
    (name "parm-bin")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/yhoundz/parm/releases/download/v0.1.6/parm-0.1.6-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("parm" "bin/parm"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross platform package installer and lifecycle manager using GitHub Releases")
    (description "Cross platform package installer and lifecycle manager using GitHub
Releases.")
    (home-page "https://github.com/yhoundz/parm")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 80. pocket-id-bin
;;; -------------------------------------------------------------------
(define-public pocket-id-bin
  (package
    (name "pocket-id-bin")
    (version "2.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pocket-id/pocket-id/releases/download/v2.6.2/pocket-id-2.6.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pocket-id" "bin/pocket-id"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple and easy-to-use OIDC provider (Pre-compiled binary)")
    (description "A simple and easy-to-use OIDC provider (Pre-compiled binary).")
    (home-page "https://github.com/pocket-id/pocket-id")
    (license license:bsd-3)
    ))

;;; -------------------------------------------------------------------
;;; 81. posy-improved-cursors
;;; -------------------------------------------------------------------
(define-public posy-improved-cursors
  (package
    (name "posy-improved-cursors")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/simtrami/posy-improved-cursor-linux/archive/refs/tags/1.6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "posy's improved cursors by Michiel de Boer, available as cursor themes")
    (description "Posy's improved cursors by Michiel de Boer, available as cursor themes.")
    (home-page "https://github.com/simtrami/posy-improved-cursor-linux")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 83. protonup-rs-bin
;;; -------------------------------------------------------------------
(define-public protonup-rs-bin
  (package
    (name "protonup-rs-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/auyer/Protonup-rs/releases/download/v0.11.0/protonup-rs-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("protonup-rs" "bin/protonup-rs"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cLI program to automate the installation and update of Proton-GE")
    (description "CLI program to automate the installation and update of Proton-GE.")
    (home-page "https://github.com/auyer/Protonup-rs")
    (license license:asl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 85. reddix-bin
;;; -------------------------------------------------------------------
(define-public reddix-bin
  (package
    (name "reddix-bin")
    (version "0.2.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ck-zhang/reddix/releases/download/v0.2.9/reddix-0.2.9-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("reddix" "bin/reddix"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "reddit, refined for the terminal")
    (description "Reddit, refined for the terminal.")
    (home-page "https://github.com/ck-zhang/reddix")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 86. regina-rexx-doc
;;; -------------------------------------------------------------------
(define-public regina-rexx-doc
  (package
    (name "regina-rexx-doc")
    (version "3.9.7")
    (source (origin
              (method url-fetch)
              (uri "https://regina-rexx.sourceforge.io/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for Regina REXX and RegUtil (both in PDF), and some demo script")
    (description "Documentation for Regina REXX and RegUtil (both in PDF), and some demo
scripts.")
    (home-page "https://regina-rexx.sourceforge.io/")
    (license license:gpl2+)
    ))

;;; -------------------------------------------------------------------
;;; 88. rime-wanxiang-gram-zh-hans
;;; -------------------------------------------------------------------
(define-public rime-wanxiang-gram-zh-hans
  (package
    (name "rime-wanxiang-gram-zh-hans")
    (version "20260421.010649")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/amzxyz/RIME-LMDG/archive/refs/tags/v20260421.010649.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "万象词库中文语法模型")
    (description "万象词库中文语法模型.")
    (home-page "https://github.com/amzxyz/RIME-LMDG")
    (license license:cc-by4.0)
    ))

;;; -------------------------------------------------------------------
;;; 89. rtimelog
;;; -------------------------------------------------------------------
(define-public rtimelog
  (package
    (name "rtimelog")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/umpire274/rtimelog/archive/refs/tags/v0.3.6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust program to track working hours and calculate surplus using SQLite")
    (description "Rust program to track working hours and calculate surplus using SQLite.")
    (home-page "https://github.com/umpire274/rtimelog")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 90. rtimelogger
;;; -------------------------------------------------------------------
(define-public rtimelogger
  (package
    (name "rtimelogger")
    (version "0.8.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/umpire274/rtimelogger/archive/refs/tags/v0.8.6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust program to track working hours and calculate surplus using SQLite")
    (description "Rust program to track working hours and calculate surplus using SQLite.")
    (home-page "https://github.com/umpire274/rtimelogger")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 91. rust-docs
;;; -------------------------------------------------------------------
(define-public rust-docs
  (package
    (name "rust-docs")
    (version "1.95.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.rust-lang.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust documentations")
    (description "Rust documentations.")
    (home-page "https://www.rust-lang.org/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 92. rust-motd-bin
;;; -------------------------------------------------------------------
(define-public rust-motd-bin
  (package
    (name "rust-motd-bin")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rust-motd/rust-motd/releases/download/v2.1.2/rust-motd-2.1.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rust-motd" "bin/rust-motd"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "beautiful, useful MOTD generation with zero runtime dependencies")
    (description "Beautiful, useful MOTD generation with zero runtime dependencies.")
    (home-page "https://github.com/rust-motd/rust-motd")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 93. rusticon-bin
;;; -------------------------------------------------------------------
(define-public rusticon-bin
  (package
    (name "rusticon-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ronilan/rusticon/releases/download/v0.2.2/rusticon-0.2.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rusticon" "bin/rusticon"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a mouse driven SVG favicon editor for your terminal")
    (description "A mouse driven SVG favicon editor for your terminal.")
    (home-page "https://github.com/ronilan/rusticon")
    (license license:cc-by4.0)
    ))

;;; -------------------------------------------------------------------
;;; 94. sequin-bin
;;; -------------------------------------------------------------------
(define-public sequin-bin
  (package
    (name "sequin-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://charm.sh/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sequin" "bin/sequin"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "human-readable ANSI sequences")
    (description "Human-readable ANSI sequences.")
    (home-page "https://charm.sh/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 95. setpgrp
;;; -------------------------------------------------------------------
(define-public setpgrp
  (package
    (name "setpgrp")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/maandree/setpgrp/archive/v2.1.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "commands providing access to the setpgrp and getpgrp system calls")
    (description "Commands providing access to the setpgrp and getpgrp system calls.")
    (home-page "https://codeberg.org/maandree/setpgrp")
    (license license:isc)
    ))

;;; -------------------------------------------------------------------
;;; 97. shiru
;;; -------------------------------------------------------------------
(define-public shiru
  (package
    (name "shiru")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/RockinChaos/Shiru/archive/refs/tags/v6.5.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a personal anime library manager for watching and tracking your collection in")
    (description "A personal anime library manager for watching and tracking your
collection in real time. Lightweight, powerful, and paws-itively fast.
No waiting required!.")
    (home-page "https://github.com/RockinChaos/Shiru")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 98. simple-http-server-bin
;;; -------------------------------------------------------------------
(define-public simple-http-server-bin
  (package
    (name "simple-http-server-bin")
    (version "0.6.13")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/TheWaWaR/simple-http-server/releases/download/v0.6.13/simple-http-server-0.6.13-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("simple-http-server" "bin/simple-http-server"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple http server in Rust")
    (description "Simple http server in Rust.")
    (home-page "https://github.com/TheWaWaR/simple-http-server")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 99. smap-bin
;;; -------------------------------------------------------------------
(define-public smap-bin
  (package
    (name "smap-bin")
    (version "0.1.12")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/s0md3v/Smap/releases/download/v0.1.12/Smap-0.1.12-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("smap" "bin/smap"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a drop-in replacement for Nmap powered by shodan.io")
    (description "A drop-in replacement for Nmap powered by shodan.io.")
    (home-page "https://github.com/s0md3v/Smap")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 100. smb1r-bin
;;; -------------------------------------------------------------------
(define-public smb1r-bin
  (package
    (name "smb1r-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/JHDev2006/Super-Mario-Bros.-Remastered-Public/releases/download/v1.0.2/Super-Mario-Bros.-Remastered-Public-1.0.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("smb1r" "bin/smb1r"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "super Mario Bros. Remastered")
    (description "Super Mario Bros. Remastered.")
    (home-page "https://github.com/JHDev2006/Super-Mario-Bros.-Remastered-Public")
    (license license:gpl3+)
    ))
