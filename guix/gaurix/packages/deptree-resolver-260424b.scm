;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424b
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;; 65 recipes created, 35 remain blocked.
;;;
;;; New recipes (65):
;;;       1.  nvidia-vulkan-utils (#546, gnu-build-system, v595.44.05, custom)
;;;      13.  anttweakbar (#15386, gnu-build-system, v1.16, zlib)
;;;      25.  alhp-keyring (#11554, gnu-build-system, v20250509, GPL-3.0-or-later)
;;;      26.  arcticons-icon-theme (#18539, gnu-build-system, v12.6.0.1, GPL3)
;;;      27.  beaver-notes-bin (#30688, copy-build-system, v4.4.0, MIT)
;;;      28.  bigpemu-bin (#6068, copy-build-system, v1.21, custom:proprietary)
;;;      29.  boscaceoil-blue-bin (#5438, copy-build-system, v3.1.2, MIT)
;;;      30.  chipwhisperer-udev (#17840, gnu-build-system, v6.0.0b, Apache-2.0)
;;;      33.  cpptools-debug-bin (#17382, copy-build-system, v1.29.0, LicenseRef-custom)
;;;      34.  crunchycleaner-bin (#36118, copy-build-system, v2.5.1, GPL-3.0)
;;;      35.  csvi-bin (#3300, copy-build-system, v1.23.2, MIT)
;;;      36.  cull-bin (#1228, copy-build-system, v0.6.1, MIT)
;;;      37.  cura-resources-materials (#8220, gnu-build-system, v5.7.0, AGPL)
;;;      38.  dinfo (#8861, gnu-build-system, v1.2.3.003, GPL 3.0)
;;;      39.  discli (#7644, gnu-build-system, v1, MIT)
;;;      40.  diz-bin (#2541, copy-build-system, v0.2.16, MIT)
;;;      41.  dnscontrol-bin (#7070, copy-build-system, v4.36.1, MIT)
;;;      42.  docker-credential-secretservice-bin (#6663, copy-build-system, v0.9.5, MIT)
;;;      46.  epub2txt (#2354, gnu-build-system, v2.08, GPL-3.0-or-later)
;;;      47.  etcdotica-bin (#1412, copy-build-system, v0.2.0, Apache-2.0, MIT)
;;;      48.  exec-as (#1143, gnu-build-system, v1.2.3, custom:ISC)
;;;      49.  fasttext-langid-models (#10056, gnu-build-system, v0.0.1, cc-by-sa-3.0)
;;;      50.  fcitx5-pinyin-genshin (#7879, gnu-build-system, v20240803, CC-BY-SA-4.0)
;;;      51.  fcitx5-pinyin-honkai3rd (#7883, gnu-build-system, v20240803, CC-BY-SA-4.0)
;;;      52.  fcitx5-pinyin-honkai3rd-rime (#7884, gnu-build-system, v20240803, CC-BY-SA-4.0)
;;;      53.  fcitx5-pinyin-starrail (#7881, gnu-build-system, v20240803, CC-BY-SA-4.0)
;;;      54.  fcitx5-pinyin-starrail-rime (#7882, gnu-build-system, v20240803, CC-BY-SA-4.0)
;;;      55.  fdformat (#2856, gnu-build-system, v2.38.1, GPL2)
;;;      56.  featherwallet-bin (#5124, copy-build-system, v2.8.1, custom)
;;;      57.  ferrishot-bin (#5442, copy-build-system, v0.2.0, Apache, MIT)
;;;      58.  ficsit-cli-bin (#8046, copy-build-system, v0.6.1, GPL3)
;;;      59.  figma-agent-linux-bin (#1246, copy-build-system, v0.4.3, MIT)
;;;      60.  filen-cli-bin (#10144, copy-build-system, v0.0.39, AGPL3)
;;;      61.  firefox-gnome-theme (#10318, gnu-build-system, v149.1, Unlicense)
;;;      62.  firefox-umatrix (#7933, gnu-build-system, v1.4.4, GPL3)
;;;      63.  flat-remix-gtk (#7674, gnu-build-system, v20240730, GPL 3.0)
;;;      64.  flow-control-bin (#6556, copy-build-system, v0.7.2, MIT)
;;;      65.  fmtools (#1109, gnu-build-system, v2.0.7, GPL)
;;;      66.  fondu (#8533, gnu-build-system, v060102, BSD)
;;;      68.  frankenphp-bin (#2556, copy-build-system, v1.12.2, MIT)
;;;      69.  futhark-bin (#1508, copy-build-system, v0.25.37, LicenseRef-ISC)
;;;      71.  gdscript-formatter-bin (#1465, copy-build-system, v0.19.0, MIT)
;;;      72.  gdsdecomp-bin (#6583, copy-build-system, v2.4.0, MIT)
;;;      73.  gdu-bin (#7731, copy-build-system, v5.35.0, MIT)
;;;      74.  gh-aw-bin (#2560, copy-build-system, v0.68.3, MIT)
;;;      75.  ghcup-hs-bin (#6318, copy-build-system, v0.1.50.2, LGPL3)
;;;      76.  git-who-bin (#8232, copy-build-system, v1.3, MIT)
;;;      77.  gitopolis-bin (#3278, copy-build-system, v1.17.0, AGPL-3.0-only)
;;;      78.  gittop-tui-bin (#2563, copy-build-system, v0.3.0, BSD-3-Clause)
;;;      79.  godshell-bin (#2566, copy-build-system, v0.9.7, MIT)
;;;      80.  gofarsi-live-bin (#1408, copy-build-system, v2026.02.22_071121_683c119a6, CC0-1.0)
;;;      81.  golem-bin (#1407, copy-build-system, v0.28.0, GPL-2.0-only)
;;;      82.  gonzo-bin (#2687, copy-build-system, v0.3.2, MIT)
;;;      83.  goreleaser-pro-bin (#5181, copy-build-system, v2.15.4, Copyright Becker Software LTDA)
;;;      84.  gosimac-bin (#8185, copy-build-system, v5.6.1, GPL2)
;;;      85.  grabchars-bin (#2916, copy-build-system, v2.1.0, Apache-2.0)
;;;      87.  grafito-bin (#8911, copy-build-system, v0.16.3, MIT)
;;;      88.  gram-bin (#38505, copy-build-system, v1.2.1, AGPL-3.0-or-later, Apache-2.0)
;;;      89.  gvisor-bin (#4747, copy-build-system, v20260406.0, Apache-2.0)
;;;      90.  happ-desktop (#7665, gnu-build-system, v2.9.0, custom)
;;;      91.  hazkey-zenzai-model (#2937, gnu-build-system, v0.1, CC-BY-SA-4.0)
;;;      97.  hulak-bin (#2568, copy-build-system, v0.2.14, MIT)
;;;      98.  hyperfluent-grub-theme-arch (#1531, gnu-build-system, v1, unknown)
;;;      99.  hyperfluent-grub-theme-endeavouros (#14721, gnu-build-system, v1, unknown)
;;;     100.  hyphen-el (#10254, gnu-build-system, v7.6.6, LGPL)
;;;
;;; BLOCKED (35):
;;;       2.  glfw-wayland-minecraft-cursorfix (#740) -- PATCH_VARIANT: patched GLFW for Minecraft cursor fix on Wayland; Guix has glfw w
;;;       3.  texlive-installer (#8013) -- META_INSTALLER: texlive-installer is a network installer for TeX Live; Guix has 
;;;       4.  electron37-bin (#1286) -- VERSION_PINNED_BINARY: version-pinned Electron binary; Guix has electron in nong
;;;       5.  dotnet-sdk-8.0-bin (#15164) -- RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;       6.  dotnet-runtime-bin (#1270) -- RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;       7.  android-armv7a-eabi-qt6-base (#13966) -- CROSS_COMPILE_UNSUPPORTED: Android cross-compilation toolchain package; requires
;;;       8.  aspnet-runtime-8.0-bin (#15167) -- RUNTIME_BINARY: ASP.NET binary distribution; part of dotnet ecosystem in nonguix
;;;       9.  lib32-libdav1d (#2478) -- MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;      10.  docker-desktop (#140) -- PROPRIETARY_PLATFORM: Docker Desktop is proprietary and requires Docker Engine s
;;;      11.  rar (#1989) -- PROPRIETARY_SOFTWARE: WinRAR/RAR archiver is proprietary shareware; Guix has unr
;;;      12.  ut2004-data-steam (#3517) -- NON_DISTRIBUTABLE: requires purchased Unreal Tournament 2004 game files from Ste
;;;      14.  samsung-unified-driver-printer (#650) -- PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary 
;;;      15.  samsung-unified-driver-scanner (#649) -- PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary 
;;;      16.  lib32-libvmaf (#2366) -- MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;      17.  kemoticons (#5333) -- ALREADY_IN_GUIX: kemoticons is a KDE Frameworks 5 package; check (gnu packages k
;;;      18.  qtforkawesome (#10943) -- DEP_CHAIN: requires qtutilities and c++utilities from same author (Martchus); de
;;;      19.  lib32-nvidia-utils-beta (#2408) -- PROPRIETARY_DRIVER: NVIDIA proprietary driver/utility package; requires NVIDIA k
;;;      20.  qpdf-zopfli (#5464) -- PATCH_VARIANT: qpdf rebuilt with Zopfli compression; Guix has qpdf — could apply
;;;      21.  python-opentelemetry-exporter-otlp-proto-http (#12068) -- DEP_CHAIN: requires python-opentelemetry-sdk, python-opentelemetry-api, python-o
;;;      22.  python-opentelemetry-exporter-otlp-proto-grpc (#12067) -- DEP_CHAIN: requires python-opentelemetry-sdk, python-opentelemetry-api, python-o
;;;      23.  fbthrift (#7961) -- BUILD_SYSTEM_TOO_COMPLEX: Facebook Thrift requires folly, fizz, wangle, fboss, f
;;;      24.  expressvpn (#7068) -- PROPRIETARY_SERVICE: commercial VPN client requiring paid subscription; binary-o
;;;      31.  chkufsd-bin (#1732) -- PROPRIETARY_DRIVER: Paragon UFSD filesystem check tool; proprietary binary
;;;      32.  chromium-gost (#757) -- BUILD_SYSTEM_TOO_COMPLEX: full Chromium build with Russian GOST cryptography pat
;;;      43.  dotnet-targeting-pack-bin (#1268) -- RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;      44.  e2-studio-bin (#13914) -- PROPRIETARY_IDE: Renesas e2 studio is a proprietary Eclipse-based IDE requiring 
;;;      45.  edk2-ovmf-fedora (#8117) -- BINARY_REPACKAGE: Fedora-built OVMF firmware binaries; Guix has native ovmf pack
;;;      67.  foundryvtt (#7717) -- PROPRIETARY_SERVICE: Foundry VTT is a proprietary tabletop RPG platform requirin
;;;      70.  gama-platform-jdk (#8558) -- BUILD_SYSTEM_TOO_COMPLEX: GAMA simulation platform bundled with JDK; large Eclip
;;;      86.  grafana-bin (#10333) -- PROPRIETARY_BUILD: Grafana binary includes AGPL backend + proprietary Enterprise
;;;      92.  hbuilderx-alpha-bin (#7235) -- PROPRIETARY_IDE: HBuilderX is a proprietary DCloud IDE; not redistributable
;;;      93.  hdfview-bin (#5142) -- PROPRIETARY_BUILD: HDFView binary from HDF Group; requires custom build with Jav
;;;      94.  heptabase-bin (#8961) -- PROPRIETARY_SERVICE: Heptabase is a proprietary note-taking SaaS app (Electron);
;;;      95.  httptoolkit-bin (#4732) -- PROPRIETARY_SERVICE: HTTP Toolkit has proprietary pro features; Electron binary 
;;;      96.  hubstaff (#3356) -- PROPRIETARY_SERVICE: Hubstaff is a proprietary time-tracking SaaS client; requir
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260424b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            nvidia-vulkan-utils
            anttweakbar
            alhp-keyring
            arcticons-icon-theme
            beaver-notes-bin
            bigpemu-bin
            boscaceoil-blue-bin
            chipwhisperer-udev
            cpptools-debug-bin
            crunchycleaner-bin
            csvi-bin
            cull-bin
            cura-resources-materials
            dinfo
            discli
            diz-bin
            dnscontrol-bin
            docker-credential-secretservice-bin
            epub2txt
            etcdotica-bin
            exec-as
            fasttext-langid-models
            fcitx5-pinyin-genshin
            fcitx5-pinyin-honkai3rd
            fcitx5-pinyin-honkai3rd-rime
            fcitx5-pinyin-starrail
            fcitx5-pinyin-starrail-rime
            fdformat
            featherwallet-bin
            ferrishot-bin
            ficsit-cli-bin
            figma-agent-linux-bin
            filen-cli-bin
            firefox-gnome-theme
            firefox-umatrix
            flat-remix-gtk
            flow-control-bin
            fmtools
            fondu
            frankenphp-bin
            futhark-bin
            gdscript-formatter-bin
            gdsdecomp-bin
            gdu-bin
            gh-aw-bin
            ghcup-hs-bin
            git-who-bin
            gitopolis-bin
            gittop-tui-bin
            godshell-bin
            gofarsi-live-bin
            golem-bin
            gonzo-bin
            goreleaser-pro-bin
            gosimac-bin
            grabchars-bin
            grafito-bin
            gram-bin
            gvisor-bin
            happ-desktop
            hazkey-zenzai-model
            hulak-bin
            hyperfluent-grub-theme-arch
            hyperfluent-grub-theme-endeavouros
            hyphen-el
            ))

;;; -------------------------------------------------------------------
;;; 1. nvidia-vulkan-utils
;;; -------------------------------------------------------------------
(define-public nvidia-vulkan-utils
  (package
    (name "nvidia-vulkan-utils")
    (version "595.44.05")
    (source (origin
              (method url-fetch)
              (uri "https://developer.nvidia.com/vulkan-driver")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA drivers utilities (vulkan developer branch)")
    (description "NVIDIA drivers utilities (vulkan developer branch).")
    (home-page "https://developer.nvidia.com/vulkan-driver")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 13. anttweakbar
;;; -------------------------------------------------------------------
(define-public anttweakbar
  (package
    (name "anttweakbar")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri "http://anttweakbar.sourceforge.net")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c/C++ lib that allows programmers to quickly add a light and intuitive GUI in")
    (description "C/C++ lib that allows programmers to quickly add a light and intuitive
GUI into graphic apps to interactively tweak their params.")
    (home-page "http://anttweakbar.sourceforge.net")
    (license license:zlib)
    ))

;;; -------------------------------------------------------------------
;;; 25. alhp-keyring
;;; -------------------------------------------------------------------
(define-public alhp-keyring
  (package
    (name "alhp-keyring")
    (version "20250509")
    (source (origin
              (method url-fetch)
              (uri "https://somegit.dev/ALHP/alhp-keyring")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aLHP PGP keyring")
    (description "ALHP PGP keyring.")
    (home-page "https://somegit.dev/ALHP/alhp-keyring")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 26. arcticons-icon-theme
;;; -------------------------------------------------------------------
(define-public arcticons-icon-theme
  (package
    (name "arcticons-icon-theme")
    (version "12.6.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/Arcticons/Arcticons-Linux")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a monotone line-based icon pack for android - freedesktop version")
    (description "A monotone line-based icon pack for android - freedesktop version.")
    (home-page "https://codeberg.org/Arcticons/Arcticons-Linux")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 27. beaver-notes-bin
;;; -------------------------------------------------------------------
(define-public beaver-notes-bin
  (package
    (name "beaver-notes-bin")
    (version "4.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Daniele-rolli/Beaver-Notes/releases/download/v4.4.0/Beaver-Notes-4.4.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("beaver-notes" "bin/beaver-notes"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "your Personal Note-Taking Haven for Privacy and Efficiency (binary release)")
    (description "Your Personal Note-Taking Haven for Privacy and Efficiency (binary
release).")
    (home-page "https://github.com/Daniele-rolli/Beaver-Notes")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 28. bigpemu-bin
;;; -------------------------------------------------------------------
(define-public bigpemu-bin
  (package
    (name "bigpemu-bin")
    (version "1.21")
    (source (origin
              (method url-fetch)
              (uri "https://www.richwhitehouse.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bigpemu" "bin/bigpemu"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the World's Prefurred Large Pussycat Emulator")
    (description "The World's Prefurred Large Pussycat Emulator.")
    (home-page "https://www.richwhitehouse.com")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 29. boscaceoil-blue-bin
;;; -------------------------------------------------------------------
(define-public boscaceoil-blue-bin
  (package
    (name "boscaceoil-blue-bin")
    (version "3.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/YuriSizov/boscaceoil-blue/releases/download/3.1.2-stable/boscaceoil-blue-linux-x86_64.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("boscaceoil-blue" "bin/boscaceoil-blue"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple and beginner-friendly app for making music")
    (description "A simple and beginner-friendly app for making music.")
    (home-page "https://yurisizov.itch.io/boscaceoil-blue")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 30. chipwhisperer-udev
;;; -------------------------------------------------------------------
(define-public chipwhisperer-udev
  (package
    (name "chipwhisperer-udev")
    (version "6.0.0b")
    (source (origin
              (method url-fetch)
              (uri "https://www.newae.com/chipwhisperer")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "chipWhisperer's udev rules")
    (description "ChipWhisperer's udev rules.")
    (home-page "https://www.newae.com/chipwhisperer")
    (license license:asl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 33. cpptools-debug-bin
;;; -------------------------------------------------------------------
(define-public cpptools-debug-bin
  (package
    (name "cpptools-debug-bin")
    (version "1.29.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Microsoft/vscode-cpptools/releases/download/v1.29.0/vscode-cpptools-1.29.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cpptools-debug" "bin/cpptools-debug"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "debug adapter extraced from vscode-cpptools")
    (description "Debug adapter extraced from vscode-cpptools.")
    (home-page "https://github.com/Microsoft/vscode-cpptools")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 34. crunchycleaner-bin
;;; -------------------------------------------------------------------
(define-public crunchycleaner-bin
  (package
    (name "crunchycleaner-bin")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Knuspii/CrunchyCleaner/releases/download/v2.5.1/CrunchyCleaner-2.5.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("crunchycleaner" "bin/crunchycleaner"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "💾🧹 A lightweight, software cache cleanup tool for Windows & Linux")
    (description "💾🧹 A lightweight, software cache cleanup tool for Windows & Linux.")
    (home-page "https://github.com/Knuspii/CrunchyCleaner")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 35. csvi-bin
;;; -------------------------------------------------------------------
(define-public csvi-bin
  (package
    (name "csvi-bin")
    (version "1.23.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hymkor/csvi/releases/download/v1.23.2/csvi-1.23.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("csvi" "bin/csvi"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal CSV Editor")
    (description "Terminal CSV Editor.")
    (home-page "https://github.com/hymkor/csvi")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 36. cull-bin
;;; -------------------------------------------------------------------
(define-public cull-bin
  (package
    (name "cull-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/legostin/cull/releases/download/v0.6.1/cull-0.6.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cull" "bin/cull"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "interactive TUI disk space analyzer")
    (description "Interactive TUI disk space analyzer.")
    (home-page "https://github.com/legostin/cull")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 37. cura-resources-materials
;;; -------------------------------------------------------------------
(define-public cura-resources-materials
  (package
    (name "cura-resources-materials")
    (version "5.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://ultimaker.com/en/products/cura-software")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "missing materials resources for Cura")
    (description "Missing materials resources for Cura.")
    (home-page "https://ultimaker.com/en/products/cura-software")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 38. dinfo
;;; -------------------------------------------------------------------
(define-public dinfo
  (package
    (name "dinfo")
    (version "1.2.3.003")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SCSDC-co/DINFO/archive/refs/tags/v1.2.3.003.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple program that gives you informations about a file/directory, support ")
    (description "A simple program that gives you informations about a file/directory,
support .yaml, .json and html output.")
    (home-page "https://github.com/SCSDC-co/DINFO")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 39. discli
;;; -------------------------------------------------------------------
(define-public discli
  (package
    (name "discli")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Kaneki07/DisCli/archive/refs/tags/v1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "discord TUI client written in Go")
    (description "Discord TUI client written in Go.")
    (home-page "https://github.com/Kaneki07/DisCli")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 40. diz-bin
;;; -------------------------------------------------------------------
(define-public diz-bin
  (package
    (name "diz-bin")
    (version "0.2.16")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/noahra/diz/releases/download/v0.2.16/diz-0.2.16-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("diz" "bin/diz"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "share SSH public keys between machines via a compact passphrase")
    (description "Share SSH public keys between machines via a compact passphrase.")
    (home-page "https://github.com/noahra/diz")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 41. dnscontrol-bin
;;; -------------------------------------------------------------------
(define-public dnscontrol-bin
  (package
    (name "dnscontrol-bin")
    (version "4.36.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/StackExchange/dnscontrol/releases/download/v4.36.1/dnscontrol_4.36.1_linux_amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dnscontrol" "bin/dnscontrol"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "synchronize your DNS to multiple providers from a simple DSL (binary release)")
    (description "Synchronize your DNS to multiple providers from a simple DSL (binary
release).")
    (home-page "https://stackexchange.github.io/dnscontrol/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 42. docker-credential-secretservice-bin
;;; -------------------------------------------------------------------
(define-public docker-credential-secretservice-bin
  (package
    (name "docker-credential-secretservice-bin")
    (version "0.9.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/docker/docker-credential-helpers/releases/download/v0.9.5/docker-credential-helpers-0.9.5-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("docker-credential-secretservice" "bin/docker-credential-secretservice"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "store docker credentials using the D-Bus Secret Service")
    (description "Store docker credentials using the D-Bus Secret Service.")
    (home-page "https://github.com/docker/docker-credential-helpers")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 46. epub2txt
;;; -------------------------------------------------------------------
(define-public epub2txt
  (package
    (name "epub2txt")
    (version "2.08")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kevinboone/epub2txt2/archive/refs/tags/v2.08.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extract text from EPUB documents")
    (description "Extract text from EPUB documents.")
    (home-page "https://github.com/kevinboone/epub2txt2")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 47. etcdotica-bin
;;; -------------------------------------------------------------------
(define-public etcdotica-bin
  (package
    (name "etcdotica-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/senotrusov/etcdotica/releases/download/v0.2.0/etcdotica-0.2.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("etcdotica" "bin/etcdotica"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a lightweight, file-based overlay that synchronizes system configuration with")
    (description "A lightweight, file-based overlay that synchronizes system configuration
with a Git repository.")
    (home-page "https://github.com/senotrusov/etcdotica")
    (license (list license:asl2.0 license:expat))
    ))

;;; -------------------------------------------------------------------
;;; 48. exec-as
;;; -------------------------------------------------------------------
(define-public exec-as
  (package
    (name "exec-as")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/maandree/exec-as")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a command that lets you start another command with any argv[0]")
    (description "A command that lets you start another command with any argv[0].")
    (home-page "https://codeberg.org/maandree/exec-as")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 49. fasttext-langid-models
;;; -------------------------------------------------------------------
(define-public fasttext-langid-models
  (package
    (name "fasttext-langid-models")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://fasttext.cc/docs/en/language-identification.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pre-trained models for language identification for fasttext")
    (description "Pre-trained models for language identification for fasttext.")
    (home-page "https://fasttext.cc/docs/en/language-identification.html")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 50. fcitx5-pinyin-genshin
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-genshin
  (package
    (name "fcitx5-pinyin-genshin")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sihuan/mw2fcitx/archive/refs/tags/v20240803.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "genshin Fcitx 5 Pinyin Dictionary from wiki.biligame.com")
    (description "Genshin Fcitx 5 Pinyin Dictionary from wiki.biligame.com.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)
    ))

;;; -------------------------------------------------------------------
;;; 51. fcitx5-pinyin-honkai3rd
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-honkai3rd
  (package
    (name "fcitx5-pinyin-honkai3rd")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sihuan/mw2fcitx/archive/refs/tags/v20240803.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "honkai3rd Fcitx 5 Pinyin Dictionary from wiki.biligame.com")
    (description "Honkai3rd Fcitx 5 Pinyin Dictionary from wiki.biligame.com.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)
    ))

;;; -------------------------------------------------------------------
;;; 52. fcitx5-pinyin-honkai3rd-rime
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-honkai3rd-rime
  (package
    (name "fcitx5-pinyin-honkai3rd-rime")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sihuan/mw2fcitx/archive/refs/tags/v20240803.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "honkai3rd Fcitx 5 Pinyin Dictionary from wiki.biligame.com")
    (description "Honkai3rd Fcitx 5 Pinyin Dictionary from wiki.biligame.com.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)
    ))

;;; -------------------------------------------------------------------
;;; 53. fcitx5-pinyin-starrail
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-starrail
  (package
    (name "fcitx5-pinyin-starrail")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sihuan/mw2fcitx/archive/refs/tags/v20240803.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "starrail Fcitx 5 Pinyin Dictionary from wiki.biligame.com")
    (description "Starrail Fcitx 5 Pinyin Dictionary from wiki.biligame.com.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)
    ))

;;; -------------------------------------------------------------------
;;; 54. fcitx5-pinyin-starrail-rime
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-starrail-rime
  (package
    (name "fcitx5-pinyin-starrail-rime")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sihuan/mw2fcitx/archive/refs/tags/v20240803.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "starrail Fcitx 5 Pinyin Dictionary from wiki.biligame.com")
    (description "Starrail Fcitx 5 Pinyin Dictionary from wiki.biligame.com.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)
    ))

;;; -------------------------------------------------------------------
;;; 55. fdformat
;;; -------------------------------------------------------------------
(define-public fdformat
  (package
    (name "fdformat")
    (version "2.38.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/karelzak/util-linux/archive/refs/tags/v2.38.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fdformat from util-linux")
    (description "Fdformat from util-linux.")
    (home-page "https://github.com/karelzak/util-linux")
    (license license:gpl2)
    ))

;;; -------------------------------------------------------------------
;;; 56. featherwallet-bin
;;; -------------------------------------------------------------------
(define-public featherwallet-bin
  (package
    (name "featherwallet-bin")
    (version "2.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://featherwallet.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("featherwallet" "bin/featherwallet"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a free, open-source Monero light wallet")
    (description "A free, open-source Monero light wallet.")
    (home-page "https://featherwallet.org")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 57. ferrishot-bin
;;; -------------------------------------------------------------------
(define-public ferrishot-bin
  (package
    (name "ferrishot-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nik-rev/ferrishot/releases/download/v0.2.0/ferrishot-x86_64-unknown-linux-gnu.tar.xz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ferrishot" "bin/ferrishot"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a screenshot tool written in Rust")
    (description "A screenshot tool written in Rust.")
    (home-page "https://github.com/nik-rev/ferrishot")
    (license (list license:asl2.0 license:expat))
    ))

;;; -------------------------------------------------------------------
;;; 58. ficsit-cli-bin
;;; -------------------------------------------------------------------
(define-public ficsit-cli-bin
  (package
    (name "ficsit-cli-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/satisfactorymodding/ficsit-cli/releases/download/v0.6.1/ficsit-cli-0.6.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ficsit-cli" "bin/ficsit-cli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a CLI for managing mods for the game Satisfactory")
    (description "A CLI for managing mods for the game Satisfactory.")
    (home-page "https://github.com/satisfactorymodding/ficsit-cli")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 59. figma-agent-linux-bin
;;; -------------------------------------------------------------------
(define-public figma-agent-linux-bin
  (package
    (name "figma-agent-linux-bin")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://raw.githubusercontent.com/neetly/figma-agent-linux/0.4.3/LICENSE")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("figma-agent-linux" "bin/figma-agent-linux"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a lightweight local service that makes your locally installed fonts available")
    (description "A lightweight local service that makes your locally installed fonts
available on Figma.")
    (home-page "https://github.com/neetly/figma-agent-linux")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 60. filen-cli-bin
;;; -------------------------------------------------------------------
(define-public filen-cli-bin
  (package
    (name "filen-cli-bin")
    (version "0.0.39")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/FilenCloudDienste/filen-cli/releases/download/v0.0.39/filen-cli-0.0.39-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("filen-cli" "bin/filen-cli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Filen CLI provides a set of useful tools for interacting with the cloud")
    (description "The Filen CLI provides a set of useful tools for interacting with the
cloud.")
    (home-page "https://github.com/FilenCloudDienste/filen-cli")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 61. firefox-gnome-theme
;;; -------------------------------------------------------------------
(define-public firefox-gnome-theme
  (package
    (name "firefox-gnome-theme")
    (version "149.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/refs/tags/v149.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GNOME theme for Firefox")
    (description "A GNOME theme for Firefox.")
    (home-page "https://github.com/rafaelmardojai/firefox-gnome-theme")
    (license license:unlicense)
    ))

;;; -------------------------------------------------------------------
;;; 62. firefox-umatrix
;;; -------------------------------------------------------------------
(define-public firefox-umatrix
  (package
    (name "firefox-umatrix")
    (version "1.4.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/gorhill/uMatrix/archive/refs/tags/v1.4.4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "point and click matrix to filter net requests by source, destination and type")
    (description "Point and click matrix to filter net requests by source, destination and
type.")
    (home-page "https://github.com/gorhill/uMatrix")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 63. flat-remix-gtk
;;; -------------------------------------------------------------------
(define-public flat-remix-gtk
  (package
    (name "flat-remix-gtk")
    (version "20240730")
    (source (origin
              (method url-fetch)
              (uri "https://drasite.com/flat-remix-gtk")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flat Remix GTK theme is a pretty simple gtk window theme inspired on material")
    (description "Flat Remix GTK theme is a pretty simple gtk window theme inspired on
material design following a modern design using "flat" colors with high
contrasts and sharp borders.")
    (home-page "https://drasite.com/flat-remix-gtk")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 64. flow-control-bin
;;; -------------------------------------------------------------------
(define-public flow-control-bin
  (package
    (name "flow-control-bin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/neurocyte/flow/releases/download/v0.7.2/flow-0.7.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("flow-control" "bin/flow-control"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a programmer's text editor")
    (description "A programmer's text editor.")
    (home-page "https://github.com/neurocyte/flow")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 65. fmtools
;;; -------------------------------------------------------------------
(define-public fmtools
  (package
    (name "fmtools")
    (version "2.0.7")
    (source (origin
              (method url-fetch)
              (uri "http://benpfaff.org/fmtools/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a pair of simple command-line utilities for v4l2 radio tuner cards")
    (description "A pair of simple command-line utilities for v4l2 radio tuner cards.")
    (home-page "http://benpfaff.org/fmtools/")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 66. fondu
;;; -------------------------------------------------------------------
(define-public fondu
  (package
    (name "fondu")
    (version "060102")
    (source (origin
              (method url-fetch)
              (uri "http://fondu.sourceforge.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mac font conversion utility - debian patches")
    (description "Mac font conversion utility - debian patches.")
    (home-page "http://fondu.sourceforge.net/")
    (license license:bsd-3)
    ))

;;; -------------------------------------------------------------------
;;; 68. frankenphp-bin
;;; -------------------------------------------------------------------
(define-public frankenphp-bin
  (package
    (name "frankenphp-bin")
    (version "1.12.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/php/frankenphp/releases/download/v1.12.2/frankenphp-1.12.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("frankenphp" "bin/frankenphp"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "frankenPHP is a modern application server for PHP built on top of the Caddy w")
    (description "FrankenPHP is a modern application server for PHP built on top of the
Caddy web server.")
    (home-page "https://github.com/php/frankenphp")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 69. futhark-bin
;;; -------------------------------------------------------------------
(define-public futhark-bin
  (package
    (name "futhark-bin")
    (version "0.25.37")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/diku-dk/futhark/releases/download/v0.25.37/futhark-0.25.37-linux-x86_64.tar.xz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("futhark" "bin/futhark"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a data-parallel functional programming language")
    (description "A data-parallel functional programming language.")
    (home-page "https://futhark-lang.org/")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 71. gdscript-formatter-bin
;;; -------------------------------------------------------------------
(define-public gdscript-formatter-bin
  (package
    (name "gdscript-formatter-bin")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/GDQuest/GDScript-formatter/releases/download/0.19.0/gdscript-formatter-0.19.0-linux-x86_64.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gdscript-formatter" "bin/gdscript-formatter"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a fast code formatter for GDScript and Godot 4, written in Rust")
    (description "A fast code formatter for GDScript and Godot 4, written in Rust.")
    (home-page "https://github.com/GDQuest/GDScript-formatter")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 72. gdsdecomp-bin
;;; -------------------------------------------------------------------
(define-public gdsdecomp-bin
  (package
    (name "gdsdecomp-bin")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/GDRETools/gdsdecomp/releases/download/v2.4.0/gdsdecomp-2.4.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gdsdecomp" "bin/gdsdecomp"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "godot reverse engineering tools")
    (description "Godot reverse engineering tools.")
    (home-page "https://github.com/GDRETools/gdsdecomp")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 73. gdu-bin
;;; -------------------------------------------------------------------
(define-public gdu-bin
  (package
    (name "gdu-bin")
    (version "5.35.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Dundee/gdu/releases/download/v5.35.0/gdu-5.35.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gdu" "bin/gdu"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast disk usage analyzer")
    (description "Fast disk usage analyzer.")
    (home-page "https://github.com/Dundee/gdu")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 74. gh-aw-bin
;;; -------------------------------------------------------------------
(define-public gh-aw-bin
  (package
    (name "gh-aw-bin")
    (version "0.68.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/github/gh-aw/releases/download/v0.68.3/gh-aw-0.68.3-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gh-aw" "bin/gh-aw"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "gitHub Agentic Workflows")
    (description "GitHub Agentic Workflows.")
    (home-page "https://github.com/github/gh-aw")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 75. ghcup-hs-bin
;;; -------------------------------------------------------------------
(define-public ghcup-hs-bin
  (package
    (name "ghcup-hs-bin")
    (version "0.1.50.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.haskell.org/ghcup/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ghcup-hs" "bin/ghcup-hs"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an installer for the general purpose language Haskell")
    (description "An installer for the general purpose language Haskell.")
    (home-page "https://www.haskell.org/ghcup/")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 76. git-who-bin
;;; -------------------------------------------------------------------
(define-public git-who-bin
  (package
    (name "git-who-bin")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sinclairtarget/git-who/releases/download/v1.3/git-who-1.3-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-who" "bin/git-who"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "git blame for file trees")
    (description "Git blame for file trees.")
    (home-page "https://github.com/sinclairtarget/git-who")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 77. gitopolis-bin
;;; -------------------------------------------------------------------
(define-public gitopolis-bin
  (package
    (name "gitopolis-bin")
    (version "1.17.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/timabell/gitopolis/releases/download/v1.17.0/gitopolis-1.17.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gitopolis" "bin/gitopolis"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cLI tool to manage multiple git repositories; run commands, clone, and organi")
    (description "CLI tool to manage multiple git repositories; run commands, clone, and
organize repos with tags.")
    (home-page "https://github.com/timabell/gitopolis")
    (license license:agpl3)
    ))

;;; -------------------------------------------------------------------
;;; 78. gittop-tui-bin
;;; -------------------------------------------------------------------
(define-public gittop-tui-bin
  (package
    (name "gittop-tui-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hjr265/gittop/releases/download/v0.3.0/gittop-0.3.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gittop-tui" "bin/gittop-tui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a beautiful terminal UI for visualizing Git repository statistics, inspired b")
    (description "A beautiful terminal UI for visualizing Git repository statistics,
inspired by htop/btop.")
    (home-page "https://github.com/hjr265/gittop")
    (license license:bsd-3)
    ))

;;; -------------------------------------------------------------------
;;; 79. godshell-bin
;;; -------------------------------------------------------------------
(define-public godshell-bin
  (package
    (name "godshell-bin")
    (version "0.9.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Raulgooo/godshell/releases/download/v0.9.7/godshell-0.9.7-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("godshell" "bin/godshell"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Tool to give your LLM access to your Kernel")
    (description "A Tool to give your LLM access to your Kernel.")
    (home-page "https://github.com/Raulgooo/godshell")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 80. gofarsi-live-bin
;;; -------------------------------------------------------------------
(define-public gofarsi-live-bin
  (package
    (name "gofarsi-live-bin")
    (version "2026.02.22_071121_683c119a6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/GoFarsi/book/releases/download/v${_pkgver}/${_deb}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gofarsi-live" "bin/gofarsi-live"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free Persian Go programming language book (Live version)")
    (description "Free Persian Go programming language book (Live version).")
    (home-page "https://github.com/GoFarsi/book")
    (license license:cc0)
    ))

;;; -------------------------------------------------------------------
;;; 81. golem-bin
;;; -------------------------------------------------------------------
(define-public golem-bin
  (package
    (name "golem-bin")
    (version "0.28.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/assapir/golem/releases/download/v0.28.0/golem-0.28.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("golem" "bin/golem"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a clay body, animated by words. Rust AI agent with ReAct loop, pluggable tool")
    (description "A clay body, animated by words. Rust AI agent with ReAct loop, pluggable
tools, and SQLite memory.")
    (home-page "https://github.com/assapir/golem")
    (license license:gpl2)
    ))

;;; -------------------------------------------------------------------
;;; 82. gonzo-bin
;;; -------------------------------------------------------------------
(define-public gonzo-bin
  (package
    (name "gonzo-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/control-theory/gonzo/releases/download/v0.3.2/gonzo-0.3.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gonzo" "bin/gonzo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tUI log analysis tool")
    (description "TUI log analysis tool.")
    (home-page "https://github.com/control-theory/gonzo")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 83. goreleaser-pro-bin
;;; -------------------------------------------------------------------
(define-public goreleaser-pro-bin
  (package
    (name "goreleaser-pro-bin")
    (version "2.15.4")
    (source (origin
              (method url-fetch)
              (uri "https://goreleaser.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("goreleaser-pro" "bin/goreleaser-pro"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "release engineering, simplified")
    (description "Release engineering, simplified.")
    (home-page "https://goreleaser.com")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 84. gosimac-bin
;;; -------------------------------------------------------------------
(define-public gosimac-bin
  (package
    (name "gosimac-bin")
    (version "5.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/1995parham/gosimac/releases/download/v5.6.1/gosimac-5.6.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gosimac" "bin/gosimac"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fetch the wallpaper from Bings, Unsplash")
    (description "Fetch the wallpaper from Bings, Unsplash...")
    (home-page "https://github.com/1995parham/gosimac")
    (license license:gpl2)
    ))

;;; -------------------------------------------------------------------
;;; 85. grabchars-bin
;;; -------------------------------------------------------------------
(define-public grabchars-bin
  (package
    (name "grabchars-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/DanielSmith/grabchars/releases/download/v2.1.0/grabchars-2.1.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("grabchars" "bin/grabchars"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "get keystrokes directly from user - interactive terminal input for shell scri")
    (description "Get keystrokes directly from user - interactive terminal input for shell
scripts.")
    (home-page "https://github.com/DanielSmith/grabchars")
    (license license:asl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 87. grafito-bin
;;; -------------------------------------------------------------------
(define-public grafito-bin
  (package
    (name "grafito-bin")
    (version "0.16.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ralsina/grafito/releases/download/v0.16.3/grafito-0.16.3-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("grafito" "bin/grafito"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a linux logs web frontend")
    (description "A linux logs web frontend.")
    (home-page "https://github.com/ralsina/grafito")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 88. gram-bin
;;; -------------------------------------------------------------------
(define-public gram-bin
  (package
    (name "gram-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/GramEditor/gram")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gram" "bin/gram"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Gram Code Editor")
    (description "The Gram Code Editor.")
    (home-page "https://codeberg.org/GramEditor/gram")
    (license (list license:agpl3+ license:asl2.0 license:gpl3+))
    ))

;;; -------------------------------------------------------------------
;;; 89. gvisor-bin
;;; -------------------------------------------------------------------
(define-public gvisor-bin
  (package
    (name "gvisor-bin")
    (version "20260406.0")
    (source (origin
              (method url-fetch)
              (uri "https://gvisor.dev")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gvisor" "bin/gvisor"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "oCI container sandbox runtime focused on security, efficiency, and ease of us")
    (description "OCI container sandbox runtime focused on security, efficiency, and ease
of use.")
    (home-page "https://gvisor.dev")
    (license license:asl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 90. happ-desktop
;;; -------------------------------------------------------------------
(define-public happ-desktop
  (package
    (name "happ-desktop")
    (version "2.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Happ-proxy/happ-desktop/archive/refs/tags/v2.9.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "happ is a mobile application designed for convenient proxy server management,")
    (description "Happ is a mobile application designed for convenient proxy server
management, powered by the robust Xray core.")
    (home-page "https://github.com/Happ-proxy/happ-desktop")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 91. hazkey-zenzai-model
;;; -------------------------------------------------------------------
(define-public hazkey-zenzai-model
  (package
    (name "hazkey-zenzai-model")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://huggingface.co/Miwa-Keita/zenz-v3.1-small-gguf")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zenzai system model for Hazkey")
    (description "Zenzai system model for Hazkey.")
    (home-page "https://huggingface.co/Miwa-Keita/zenz-v3.1-small-gguf")
    (license license:cc-by-sa4.0)
    ))

;;; -------------------------------------------------------------------
;;; 97. hulak-bin
;;; -------------------------------------------------------------------
(define-public hulak-bin
  (package
    (name "hulak-bin")
    (version "0.2.14")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/xaaha/hulak/releases/download/v0.2.14/hulak-0.2.14-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hulak" "bin/hulak"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight file-based API client for terminal nerds")
    (description "Lightweight file-based API client for terminal nerds.")
    (home-page "https://github.com/xaaha/hulak")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 98. hyperfluent-grub-theme-arch
;;; -------------------------------------------------------------------
(define-public hyperfluent-grub-theme-arch
  (package
    (name "hyperfluent-grub-theme-arch")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Coopydood/HyperFluent-GRUB-Theme/archive/refs/tags/v1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arch hyperfluent grub theme")
    (description "Arch hyperfluent grub theme.")
    (home-page "https://github.com/Coopydood/HyperFluent-GRUB-Theme")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 99. hyperfluent-grub-theme-endeavouros
;;; -------------------------------------------------------------------
(define-public hyperfluent-grub-theme-endeavouros
  (package
    (name "hyperfluent-grub-theme-endeavouros")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Coopydood/HyperFluent-GRUB-Theme/archive/refs/tags/v1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "endeavourOS hyperfluent grub theme")
    (description "EndeavourOS hyperfluent grub theme.")
    (home-page "https://github.com/Coopydood/HyperFluent-GRUB-Theme")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 100. hyphen-el
;;; -------------------------------------------------------------------
(define-public hyphen-el
  (package
    (name "hyphen-el")
    (version "7.6.6")
    (source (origin
              (method url-fetch)
              (uri "https://www.documentfoundation.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "greek hyphenation rules")
    (description "Greek hyphenation rules.")
    (home-page "https://www.documentfoundation.org/")
    (license license:lgpl3+)
    ))
