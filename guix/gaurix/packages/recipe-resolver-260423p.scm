;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423p
;;; Resolves 100 packages (93 recipes, 7 blocked).
;;;
;;; New recipes (93):
;;;       1.  windigo (go-build-system, v0.2.1, MIT)
;;;       2.  todoist-wrapper-bin (copy-build-system, v4.20260423032425, GPL-3.0-only)
;;;       3.  specter-desktop-appimage (copy-build-system, v2.1.7, MIT)
;;;       4.  sixteen-bin (copy-build-system, v0.8.0, MIT)
;;;       5.  markterm-bin (copy-build-system, v0.6.3, MIT)
;;;       6.  hace-bin (copy-build-system, v0.8.2, MIT)
;;;       7.  git-ignore (cargo-build-system, v1.3.1, GPL3)
;;;       8.  apollo-neo-env-manager-dev (gnu-build-system, v10.0.0rc1.r4, custom)
;;;       9.  libretro-mame2003-git (gnu-build-system, v1103.4be24e3, custom:MAME License)
;;;      10.  gradle-language-server (gnu-build-system, v3.16.4, MIT)
;;;      11.  winarcadia-bin (copy-build-system, v34.41, unknown)
;;;      12.  swiftfetch (cargo-build-system, v1.3.0, MIT)
;;;      13.  runpodctl-git (go-build-system, v1.14.4.r13.gb508558, GPL-3.0)
;;;      14.  lfs-dal-git (cargo-build-system, v0.1.3.r0.g7518ad2, MIT)
;;;      15.  jd-gui-duo-bin (copy-build-system, v2.0.109, GPL-3.0)
;;;      16.  java-debug (gnu-build-system, v0.53.1, EPL-1.0)
;;;      17.  contextpilot (cargo-build-system, v0.9.2, MIT)
;;;      18.  spacetimedb-cli-bin (copy-build-system, v2.0.5, custom:BSL)
;;;      19.  kwin-tile-gaps-git (gnu-build-system, vr267.a14a500, unknown)
;;;      20.  katachi (node-build-system, v0.1.2, MIT)
;;;      21.  dict-freedict-ita-eng-bin (copy-build-system, v0.2, GPL)
;;;      22.  dict-freedict-eng-ita-bin (copy-build-system, v0.1.2, GPL)
;;;      23.  remindr-bin (copy-build-system, v2.2.5, GPL-3.0-only)
;;;      24.  ostui (gnu-build-system, v1.0.4, GPLv3)
;;;      25.  legume (gnu-build-system, v1.6.1, MIT)
;;;      26.  lbb (go-build-system, v0.10.4, GPLv3)
;;;      27.  tui-sudoku (gnu-build-system, v1.0.0, GPL-2.0-or-later)
;;;      28.  ripdrag-git (cargo-build-system, v0.3.2.r3.c2e08a6, GPL3)
;;;      30.  sasquatch-git (gnu-build-system, vr60.bd864a1, GPL2)
;;;      32.  postier-bin (copy-build-system, v2.1.2, GPL)
;;;      33.  luajit-tiktoken-bin (copy-build-system, v0.2.1, MIT)
;;;      34.  homie-bin (copy-build-system, v0.2.1, MIT)
;;;      36.  typhoon-bin (copy-build-system, v1.7.2, GPL-3.0-or-later)
;;;      37.  aur-talk-git (gnu-build-system, vr11.ad39887, custom:ISC)
;;;      38.  cloudflared-bin (copy-build-system, v2026.3.0, Apache-2.0)
;;;      40.  setserial (gnu-build-system, v2.17, GPL)
;;;      41.  xplayer-plparser (meson-build-system, v1.0.3, GPL)
;;;      42.  hy3 (cmake-build-system, v0.54.2.1, GPL3)
;;;      43.  prismlauncher-themes-git (gnu-build-system, v2025.06.06_1749223820.r2.g3b87732, custom)
;;;      44.  melt-bin (copy-build-system, v0.6.2, MIT)
;;;      45.  rnr-bin (copy-build-system, v0.5.1, MIT)
;;;      47.  html2md (go-build-system, v1.6.0, MIT)
;;;      48.  soapui (gnu-build-system, v5.9.1, EUPL-1.1)
;;;      49.  yt-x (gnu-build-system, v0.4.5, GPL)
;;;      50.  zsh-eza-git (gnu-build-system, vr111.d6b0278, MIT)
;;;      51.  filezilla-server-bin (copy-build-system, v1.12.1, AGPL3)
;;;      52.  pbget (pyproject-build-system, v2021.12, GPL)
;;;      53.  jprofiler (gnu-build-system, v16.0, custom)
;;;      54.  sudo-rs-git (cargo-build-system, vr1148.d4abd98, Apache 2.0,, MIT)
;;;      55.  tlm (go-build-system, v1.2, Apache-2.0)
;;;      56.  zsh-autocomplete-git (gnu-build-system, vr814.762afac, MIT)
;;;      57.  zsh-defer-git (gnu-build-system, vr39.1c75faf, GPL-3.0-or-later)
;;;      58.  cockpit-file-sharing (gnu-build-system, v4.3.2, GPL-3.0-only)
;;;      59.  ltfs (gnu-build-system, v2.4.7.1, BSD)
;;;      60.  freenginx-src (gnu-build-system, v1.30.0, custom)
;;;      61.  sieve-app-bin (copy-build-system, v0.6.1, AGPL3)
;;;      62.  deepcool-digital-linux-git (cargo-build-system, vr48.d80f346, GPLv3)
;;;      63.  shadps4-pre-release-bin (copy-build-system, v20260419.90b75ea, GPL-2.0-only)
;;;      64.  netcalc (gnu-build-system, v2.1.7, BSD-3-Clause)
;;;      65.  redot-mono-bin (copy-build-system, v26.1_stable, MIT)
;;;      66.  redot-git (gnu-build-system, v26.2.r77413.7ff80936be, MIT)
;;;      68.  sgf-render (cargo-build-system, v3.2.2, MIT)
;;;      69.  sddm-sugar-dark (gnu-build-system, v1.2, GPL3)
;;;      70.  pipes-rs-git (cargo-build-system, vv1.6.1.r9.gf139336, custom:Blue Oak Model)
;;;      71.  newsboat-og (gnu-build-system, v2.13.2, MIT)
;;;      72.  dumber (go-build-system, v3.0.0.3, BSD-3-Clause)
;;;      73.  linux_logo (gnu-build-system, v6.01, GPL2)
;;;      74.  dyna-git (cargo-build-system, v0.1.1.r13.g96545ad, MIT)
;;;      75.  vpinball (cmake-build-system, v10.8.1_3155_8054cc2, GPL-3.0-or-later, LicenseRef-MAME)
;;;      76.  sparkle-electron-git (node-build-system, v1.26.2.r1, GPL3)
;;;      77.  openkj (cmake-build-system, v2.0.8, GPL3)
;;;      78.  nodejs-fanyi (node-build-system, v10.0.0, MIT)
;;;      79.  node-fanyi (node-build-system, v10.0.0, MIT)
;;;      80.  libzedmd-git (cmake-build-system, vr292.1547728, GPL-3.0-or-later)
;;;      81.  kubectl-ai-bin (copy-build-system, v0.0.31, Apache-2.0)
;;;      82.  kernel-headers-trigger (gnu-build-system, v1.0, GPL3)
;;;      83.  taskopen (gnu-build-system, v2.0.3, GPL-2.0-or-later)
;;;      84.  tageditor (cmake-build-system, v3.9.9, GPL-2.0-or-later)
;;;      85.  asusctl-git (cargo-build-system, v6.0.11.r10.g5ab9642, MPL2)
;;;      86.  scamper (gnu-build-system, v20260420, GPL-2.0-or-later)
;;;      87.  scitopdf (gnu-build-system, v0.7.2, GPL3)
;;;      88.  meowsql (gnu-build-system, v0.4.18, GPL2)
;;;      89.  boxtron-git (gnu-build-system, v0.5.4.r26.gb3eb8c1, GPL-2.0-or-later)
;;;      90.  vlc-protocol (gnu-build-system, v1.3.6, GPL-3.0-or-later)
;;;      91.  ttyc (go-build-system, v0.4, GPL3)
;;;      92.  python-scalene (pyproject-build-system, v2.2.1, BSD-2-Clause)
;;;      93.  justdd (gnu-build-system, v0.1.4, GPL3)
;;;      94.  glyph-bin (copy-build-system, v1.0.11, MIT)
;;;      95.  firefox-extension-singlefile-bin (copy-build-system, v1.22.81, MIT)
;;;      96.  exdupe-bin (copy-build-system, v3.0.1, GPL-2.0-or-later)
;;;      97.  monitorix (gnu-build-system, v3.16.0, GPL2)
;;;      98.  umlet (gnu-build-system, v15.1, GPL)
;;;     100.  virtualfish (pyproject-build-system, v2.5.9, MIT)
;;;
;;; BLOCKED (7):
;;;      29.  openfortivpn-webview-qt -- DEP_RESOLUTION_FAILED: requires Qt5WebEngine + openfortivpn integration; complex
;;;      31.  etlegacy32-mod -- DEP_RESOLUTION_FAILED: requires 32-bit ET:Legacy client and Wolfenstein: Enemy T
;;;      35.  vscodium-electron -- DEP_RESOLUTION_FAILED: requires building VSCodium from source with system Electr
;;;      39.  clash-for-windows-chinese -- SOURCE_UNAVAILABLE: original Clash for Windows project deleted; Chinese fork sta
;;;      46.  factorio-space-age-experimental -- LICENSE_REVIEW_NEEDED: requires purchased game license from factorio.com; binary
;;;      67.  bakkesmod-steam -- DEP_RESOLUTION_FAILED: Windows-only mod (Rocket League via Steam/Proton); no Lin
;;;      99.  lib32-opencl-nvidia-390xx -- DEP_RESOLUTION_FAILED: requires 32-bit NVIDIA 390xx driver infrastructure not in
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            windigo
            todoist-wrapper-bin
            specter-desktop-appimage
            sixteen-bin
            markterm-bin
            hace-bin
            git-ignore
            apollo-neo-env-manager-dev
            libretro-mame2003-git
            gradle-language-server
            winarcadia-bin
            swiftfetch
            runpodctl-git
            lfs-dal-git
            jd-gui-duo-bin
            java-debug
            contextpilot
            spacetimedb-cli-bin
            kwin-tile-gaps-git
            katachi
            dict-freedict-ita-eng-bin
            dict-freedict-eng-ita-bin
            remindr-bin
            ostui
            legume
            lbb
            tui-sudoku
            ripdrag-git
            sasquatch-git
            postier-bin
            luajit-tiktoken-bin
            homie-bin
            typhoon-bin
            aur-talk-git
            cloudflared-bin
            setserial
            xplayer-plparser
            hy3
            prismlauncher-themes-git
            melt-bin
            rnr-bin
            html2md
            soapui
            yt-x
            zsh-eza-git
            filezilla-server-bin
            pbget
            jprofiler
            sudo-rs-git
            tlm
            zsh-autocomplete-git
            zsh-defer-git
            cockpit-file-sharing
            ltfs
            freenginx-src
            sieve-app-bin
            deepcool-digital-linux-git
            shadps4-pre-release-bin
            netcalc
            redot-mono-bin
            redot-git
            sgf-render
            sddm-sugar-dark
            pipes-rs-git
            newsboat-og
            dumber
            linux-logo
            dyna-git
            vpinball
            sparkle-electron-git
            openkj
            nodejs-fanyi
            node-fanyi
            libzedmd-git
            kubectl-ai-bin
            kernel-headers-trigger
            taskopen
            tageditor
            asusctl-git
            scamper
            scitopdf
            meowsql
            boxtron-git
            vlc-protocol
            ttyc
            python-scalene
            justdd
            glyph-bin
            firefox-extension-singlefile-bin
            exdupe-bin
            monitorix
            umlet
            virtualfish
            ))

;;; -------------------------------------------------------------------
;;; 1. windigo
;;; -------------------------------------------------------------------
(define-public windigo
  (package
    (name "windigo")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/marzeq/windigo/archive/refs/tags/v0.2.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight Go-based daemon for Linux that controls fan speeds based on senso")
    (description "Lightweight Go-based daemon for Linux that controls fan speeds based on
sensor input.")
    (home-page "https://github.com/marzeq/windigo")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 2. todoist-wrapper-bin
;;; -------------------------------------------------------------------
(define-public todoist-wrapper-bin
  (package
    (name "todoist-wrapper-bin")
    (version "4.20260423032425")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/conjfrnk/todoist-wrapper/releases/download/v4.20260423032425/todoist-wrapper-4.20260423032425-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("todoist-wrapper" "bin/todoist-wrapper"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "electron Wrapper for Todoist on Linux.(Prebuilt version.Use system-wide elect")
    (description "Electron Wrapper for Todoist on Linux.(Prebuilt version.Use system-wide
electron).")
    (home-page "https://github.com/conjfrnk/todoist-wrapper")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 3. specter-desktop-appimage
;;; -------------------------------------------------------------------
(define-public specter-desktop-appimage
  (package
    (name "specter-desktop-appimage")
    (version "2.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/cryptoadvance/specter-desktop/archive/refs/tags/v2.1.7.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("specter-desktop" "bin/specter-desktop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a desktop GUI for Bitcoin Core optimised to work with hardware wallets")
    (description "A desktop GUI for Bitcoin Core optimised to work with hardware wallets.")
    (home-page "https://github.com/cryptoadvance/specter-desktop")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 4. sixteen-bin
;;; -------------------------------------------------------------------
(define-public sixteen-bin
  (package
    (name "sixteen-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ralsina/sixteen/releases/download/v0.8.0/sixteen-0.8.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sixteen" "bin/sixteen"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a base16 theme browser")
    (description "A base16 theme browser.")
    (home-page "https://github.com/ralsina/sixteen")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 5. markterm-bin
;;; -------------------------------------------------------------------
(define-public markterm-bin
  (package
    (name "markterm-bin")
    (version "0.6.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ralsina/markterm/releases/download/v0.6.3/markterm-0.6.3-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("markterm" "bin/markterm"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a terminal markdown renderer")
    (description "A terminal markdown renderer.")
    (home-page "https://github.com/ralsina/markterm")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 6. hace-bin
;;; -------------------------------------------------------------------
(define-public hace-bin
  (package
    (name "hace-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ralsina/hace/releases/download/v0.8.2/hace-0.8.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hace" "bin/hace"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a task-launching app (think make)")
    (description "A task-launching app (think make).")
    (home-page "https://github.com/ralsina/hace")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 7. git-ignore
;;; -------------------------------------------------------------------
(define-public git-ignore
  (package
    (name "git-ignore")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sondr3/git-ignore/archive/refs/tags/v1.3.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quickly and easily list and fetch .gitignore templates from gitignore.io")
    (description "Quickly and easily list and fetch .gitignore templates from
gitignore.io.")
    (home-page "https://github.com/sondr3/git-ignore")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 8. apollo-neo-env-manager-dev
;;; -------------------------------------------------------------------
(define-public apollo-neo-env-manager-dev
  (package
    (name "apollo-neo-env-manager-dev")
    (version "10.0.0rc1.r4")
    (source (origin
              (method url-fetch)
              (uri "https://apollo.baidu.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apollo Environment Manager")
    (description "Apollo Environment Manager.")
    (home-page "https://apollo.baidu.com/")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 9. libretro-mame2003-git
;;; -------------------------------------------------------------------
(define-public libretro-mame2003-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "libretro-mame2003-git")
      (version (git-version "1103.4be24e3" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/libretro/mame2003-libretro")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "libretro implementation of late 2003 version of MAME (0.78) (Arcade)")
      (description "Libretro implementation of late 2003 version of MAME (0.78) (Arcade).")
      (home-page "https://github.com/libretro/mame2003-libretro")
      (license (license:non-copyleft "file://LICENSE"))
    )))

;;; -------------------------------------------------------------------
;;; 10. gradle-language-server
;;; -------------------------------------------------------------------
(define-public gradle-language-server
  (package
    (name "gradle-language-server")
    (version "3.16.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/microsoft/vscode-gradle/archive/refs/tags/v3.16.4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft's Gradle language server")
    (description "Microsoft's Gradle language server.")
    (home-page "https://github.com/microsoft/vscode-gradle")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 11. winarcadia-bin
;;; -------------------------------------------------------------------
(define-public winarcadia-bin
  (package
    (name "winarcadia-bin")
    (version "34.41")
    (source (origin
              (method url-fetch)
              (uri "https://amigan.1emu.net/releases")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("winarcadia" "bin/winarcadia"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "emulator/Debugger of various Signetics 2650 game consoles")
    (description "Emulator/Debugger of various Signetics 2650 game consoles.")
    (home-page "https://amigan.1emu.net/releases")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 12. swiftfetch
;;; -------------------------------------------------------------------
(define-public swiftfetch
  (package
    (name "swiftfetch")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Ly-sec/swiftfetch/archive/refs/tags/v1.3.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast and efficient fetch utility written in Rust")
    (description "A fast and efficient fetch utility written in Rust.")
    (home-page "https://github.com/Ly-sec/swiftfetch")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 13. runpodctl-git
;;; -------------------------------------------------------------------
(define-public runpodctl-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "runpodctl-git")
      (version (git-version "1.14.4.r13.gb508558" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/runpod/runpodctl")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:tests? #f))
      (synopsis "cLI tool to automate / manage GPU pods for runpod.io")
      (description "CLI tool to automate / manage GPU pods for runpod.io.")
      (home-page "https://github.com/runpod/runpodctl")
      (license license:gpl3)
    )))

;;; -------------------------------------------------------------------
;;; 14. lfs-dal-git
;;; -------------------------------------------------------------------
(define-public lfs-dal-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "lfs-dal-git")
      (version (git-version "0.1.3.r0.g7518ad2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/regen100/lfs-dal")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (synopsis "a custom transfer agent for Git LFS powered by OpenDAL")
      (description "A custom transfer agent for Git LFS powered by OpenDAL.")
      (home-page "https://github.com/regen100/lfs-dal")
      (license license:expat)
    )))

;;; -------------------------------------------------------------------
;;; 15. jd-gui-duo-bin
;;; -------------------------------------------------------------------
(define-public jd-gui-duo-bin
  (package
    (name "jd-gui-duo-bin")
    (version "2.0.109")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nbauma109/jd-gui-duo/releases/download/v2.0.109/jd-gui-duo-2.0.109-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jd-gui-duo" "bin/jd-gui-duo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "binary release of jd-gui-duo, a 2-in-1 JAVA decompiler based on JD-CORE v0 an")
    (description "Binary release of jd-gui-duo, a 2-in-1 JAVA decompiler based on JD-CORE
v0 and v1.")
    (home-page "https://github.com/nbauma109/jd-gui-duo")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 16. java-debug
;;; -------------------------------------------------------------------
(define-public java-debug
  (package
    (name "java-debug")
    (version "0.53.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/microsoft/java-debug/archive/refs/tags/v0.53.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the debug server implementation for Java")
    (description "The debug server implementation for Java.")
    (home-page "https://github.com/microsoft/java-debug")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 17. contextpilot
;;; -------------------------------------------------------------------
(define-public contextpilot
  (package
    (name "contextpilot")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/krshrimali/context-pilot-rs/archive/refs/tags/v0.9.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "analyze Git blame information, infer code context, and index your codebase fo")
    (description "Analyze Git blame information, infer code context, and index your
codebase for deep, fine-grained search and navigation.")
    (home-page "https://github.com/krshrimali/context-pilot-rs")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 18. spacetimedb-cli-bin
;;; -------------------------------------------------------------------
(define-public spacetimedb-cli-bin
  (package
    (name "spacetimedb-cli-bin")
    (version "2.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/clockworklabs/SpacetimeDB/releases/download/v2.0.5/SpacetimeDB-2.0.5-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("spacetimedb-cli" "bin/spacetimedb-cli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a relational database and a server combined into one (bin version)")
    (description "A relational database and a server combined into one (bin version).")
    (home-page "https://github.com/clockworklabs/SpacetimeDB")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 19. kwin-tile-gaps-git
;;; -------------------------------------------------------------------
(define-public kwin-tile-gaps-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "kwin-tile-gaps-git")
      (version (git-version "r267.a14a500" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/ccatterina/tile-gaps")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "kWin script to add space around windows touching a screen edge or other windo")
      (description "KWin script to add space around windows touching a screen edge or other
window.")
      (home-page "https://github.com/ccatterina/tile-gaps")
      (license (license:non-copyleft "file://LICENSE"))
    )))

;;; -------------------------------------------------------------------
;;; 20. katachi
;;; -------------------------------------------------------------------
(define-public katachi
  (package
    (name "katachi")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/LMNYX/katachi/archive/refs/tags/v0.1.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a(nother) font browser for Linux")
    (description "A(nother) font browser for Linux.")
    (home-page "https://github.com/LMNYX/katachi")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 21. dict-freedict-ita-eng-bin
;;; -------------------------------------------------------------------
(define-public dict-freedict-ita-eng-bin
  (package
    (name "dict-freedict-ita-eng-bin")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri "https://freedict.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dict-freedict-ita-eng" "bin/dict-freedict-ita-eng"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "italian -> English dictionary for dictd")
    (description "Italian -> English dictionary for dictd.")
    (home-page "https://freedict.org")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 22. dict-freedict-eng-ita-bin
;;; -------------------------------------------------------------------
(define-public dict-freedict-eng-ita-bin
  (package
    (name "dict-freedict-eng-ita-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://freedict.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dict-freedict-eng-ita" "bin/dict-freedict-eng-ita"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "english -> Italian dictionary for dictd")
    (description "English -> Italian dictionary for dictd.")
    (home-page "https://freedict.org")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 23. remindr-bin
;;; -------------------------------------------------------------------
(define-public remindr-bin
  (package
    (name "remindr-bin")
    (version "2.2.5")
    (source (origin
              (method url-fetch)
              (uri "https://mrdavidrios.github.io/remindr")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("remindr" "bin/remindr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "keep track of what you need to get done.(Prebuilt version.Use system-wide ele")
    (description "Keep track of what you need to get done.(Prebuilt version.Use
system-wide electron).")
    (home-page "https://mrdavidrios.github.io/remindr")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 24. ostui
;;; -------------------------------------------------------------------
(define-public ostui
  (package
    (name "ostui")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://git.sr.ht/~ser/ostui")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal client for OpenSubsonic servers (stmps fork)")
    (description "A terminal client for OpenSubsonic servers (stmps fork).")
    (home-page "https://git.sr.ht/~ser/ostui")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 25. legume
;;; -------------------------------------------------------------------
(define-public legume
  (package
    (name "legume")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://hg.sr.ht/~ser/legume")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimalist, distributed, database-free issue tracker using traditional TODO")
    (description "A minimalist, distributed, database-free issue tracker using traditional
TODO/FIXME code comments.")
    (home-page "https://hg.sr.ht/~ser/legume")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 26. lbb
;;; -------------------------------------------------------------------
(define-public lbb
  (package
    (name "lbb")
    (version "0.10.4")
    (source (origin
              (method url-fetch)
              (uri "https://git.sr.ht/~ser/lbb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a CLI address book application for CardDAV servers and vcard (e.g. vdirsyncer")
    (description "A CLI address book application for CardDAV servers and vcard (e.g.
vdirsyncer) directries. (qcard fork).")
    (home-page "https://git.sr.ht/~ser/lbb")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 27. tui-sudoku
;;; -------------------------------------------------------------------
(define-public tui-sudoku
  (package
    (name "tui-sudoku")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.com/christosangel/tui-sudoku")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a configurable terminal interface sudoku game, written in Bash, with quite a ")
    (description "A configurable terminal interface sudoku game, written in Bash, with
quite a few features.")
    (home-page "https://gitlab.com/christosangel/tui-sudoku")
    (license license:gpl2+)
    ))

;;; -------------------------------------------------------------------
;;; 28. ripdrag-git
;;; -------------------------------------------------------------------
(define-public ripdrag-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "ripdrag-git")
      (version (git-version "0.3.2.r3.c2e08a6" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/nik012003/ripdrag")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (synopsis "drag and drop files to and from the terminal")
      (description "Drag and drop files to and from the terminal.")
      (home-page "https://github.com/nik012003/ripdrag")
      (license license:gpl3)
    )))

;;; -------------------------------------------------------------------
;;; 30. sasquatch-git
;;; -------------------------------------------------------------------
(define-public sasquatch-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "sasquatch-git")
      (version (git-version "r60.bd864a1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/devttys0/sasquatch")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "patched unsquashfs utility with support for vendor-specific SquashFS implemen")
      (description "Patched unsquashfs utility with support for vendor-specific SquashFS
implementations.")
      (home-page "https://github.com/devttys0/sasquatch")
      (license license:gpl2)
    )))

;;; -------------------------------------------------------------------
;;; 32. postier-bin
;;; -------------------------------------------------------------------
(define-public postier-bin
  (package
    (name "postier-bin")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/results-may-vary-org/postier/releases/download/v2.1.2/postier-2.1.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("postier" "bin/postier"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "aPI client without bloat")
    (description "API client without bloat.")
    (home-page "https://github.com/results-may-vary-org/postier")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 33. luajit-tiktoken-bin
;;; -------------------------------------------------------------------
(define-public luajit-tiktoken-bin
  (package
    (name "luajit-tiktoken-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/gptlang/lua-tiktoken/releases/download/v0.2.1/lua-tiktoken-0.2.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("luajit-tiktoken" "bin/luajit-tiktoken"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "binding of rust tiktoken to lua")
    (description "Binding of rust tiktoken to lua.")
    (home-page "https://github.com/gptlang/lua-tiktoken")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 34. homie-bin
;;; -------------------------------------------------------------------
(define-public homie-bin
  (package
    (name "homie-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hannahfluch/homie/releases/download/v0.2.1/homie-0.2.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("homie" "bin/homie"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an interactive coding buddy")
    (description "An interactive coding buddy.")
    (home-page "https://github.com/hannahfluch/homie")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 36. typhoon-bin
;;; -------------------------------------------------------------------
(define-public typhoon-bin
  (package
    (name "typhoon-bin")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/archisman-panigrahi/typhoon/releases/download/v1.7.2/typhoon-1.7.2-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("typhoon" "bin/typhoon"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a stylish weather app based on Stormcloud")
    (description "A stylish weather app based on Stormcloud.")
    (home-page "https://github.com/archisman-panigrahi/typhoon")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 37. aur-talk-git
;;; -------------------------------------------------------------------
(define-public aur-talk-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "aur-talk-git")
      (version (git-version "r11.ad39887" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/GermainZ/aur-talk")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "a script to fetch and display AUR package comments")
      (description "A script to fetch and display AUR package comments.")
      (home-page "https://github.com/GermainZ/aur-talk")
      (license (license:non-copyleft "file://LICENSE"))
    )))

;;; -------------------------------------------------------------------
;;; 38. cloudflared-bin
;;; -------------------------------------------------------------------
(define-public cloudflared-bin
  (package
    (name "cloudflared-bin")
    (version "2026.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/cloudflare/cloudflared/releases/download/v2026.3.0/cloudflared-2026.3.0-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cloudflared" "bin/cloudflared"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cloudflare Tunnel client (formerly Argo Tunnel)")
    (description "Cloudflare Tunnel client (formerly Argo Tunnel).")
    (home-page "https://github.com/cloudflare/cloudflared")
    (license license:asl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 40. setserial
;;; -------------------------------------------------------------------
(define-public setserial
  (package
    (name "setserial")
    (version "2.17")
    (source (origin
              (method url-fetch)
              (uri "http://setserial.sourceforge.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allows to change various attributes of a serial device")
    (description "Allows to change various attributes of a serial device.")
    (home-page "http://setserial.sourceforge.net/")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 41. xplayer-plparser
;;; -------------------------------------------------------------------
(define-public xplayer-plparser
  (package
    (name "xplayer-plparser")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/linuxmint/xplayer-plparser/archive/refs/tags/v1.0.3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "playlist parser for xplayer. X-Apps Project")
    (description "Playlist parser for xplayer. X-Apps Project.")
    (home-page "https://github.com/linuxmint/xplayer-plparser")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 42. hy3
;;; -------------------------------------------------------------------
(define-public hy3
  (package
    (name "hy3")
    (version "0.54.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/outfoxxed/hy3/archive/refs/tags/v0.54.2.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hyprland plugin for i3 like tiling")
    (description "Hyprland plugin for i3 like tiling.")
    (home-page "https://github.com/outfoxxed/hy3")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 43. prismlauncher-themes-git
;;; -------------------------------------------------------------------
(define-public prismlauncher-themes-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "prismlauncher-themes-git")
      (version (git-version "2025.06.06_1749223820.r2.g3b87732" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/PrismLauncher/Themes")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "prismLauncher themes from their official github")
      (description "PrismLauncher themes from their official github.")
      (home-page "https://github.com/PrismLauncher/Themes")
      (license (license:non-copyleft "file://LICENSE"))
    )))

;;; -------------------------------------------------------------------
;;; 44. melt-bin
;;; -------------------------------------------------------------------
(define-public melt-bin
  (package
    (name "melt-bin")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://charm.sh/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("melt" "bin/melt"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "backup and restore Ed25519 SSH keys with seed words")
    (description "Backup and restore Ed25519 SSH keys with seed words.")
    (home-page "https://charm.sh/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 45. rnr-bin
;;; -------------------------------------------------------------------
(define-public rnr-bin
  (package
    (name "rnr-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ismaelgv/rnr/releases/download/v0.5.1/rnr-0.5.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rnr" "bin/rnr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a CLI tool to rename files and directories that supports regex. Compiled bina")
    (description "A CLI tool to rename files and directories that supports regex. Compiled
binary.")
    (home-page "https://github.com/ismaelgv/rnr")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 47. html2md
;;; -------------------------------------------------------------------
(define-public html2md
  (package
    (name "html2md")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/suntong/html2md/archive/refs/tags/v1.6.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hTML to Markdown converter")
    (description "HTML to Markdown converter.")
    (home-page "https://github.com/suntong/html2md")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 48. soapui
;;; -------------------------------------------------------------------
(define-public soapui
  (package
    (name "soapui")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "http://www.soapui.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and open source cross-platform functional testing solution for APIs and ")
    (description "Free and open source cross-platform functional testing solution for APIs
and web services.")
    (home-page "http://www.soapui.org/")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 49. yt-x
;;; -------------------------------------------------------------------
(define-public yt-x
  (package
    (name "yt-x")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Benexl/yt-x/archive/refs/tags/v0.4.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "browse youtube from your terminal")
    (description "Browse youtube from your terminal.")
    (home-page "https://github.com/Benexl/yt-x")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 50. zsh-eza-git
;;; -------------------------------------------------------------------
(define-public zsh-eza-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "zsh-eza-git")
      (version (git-version "r111.d6b0278" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/z-shell/zsh-eza")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "zsh plugin to replace command gnu/ls with eza-community/eza")
      (description "Zsh plugin to replace command gnu/ls with eza-community/eza.")
      (home-page "https://github.com/z-shell/zsh-eza")
      (license license:expat)
    )))

;;; -------------------------------------------------------------------
;;; 51. filezilla-server-bin
;;; -------------------------------------------------------------------
(define-public filezilla-server-bin
  (package
    (name "filezilla-server-bin")
    (version "1.12.1")
    (source (origin
              (method url-fetch)
              (uri "https://filezilla-project.org/download.php?type=server")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("filezilla-server" "bin/filezilla-server"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple FTP, FTPS or SFTP server")
    (description "A simple FTP, FTPS or SFTP server.")
    (home-page "https://filezilla-project.org/download.php?type=server")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 52. pbget
;;; -------------------------------------------------------------------
(define-public pbget
  (package
    (name "pbget")
    (version "2021.12")
    (source (origin
              (method url-fetch)
              (uri "https://xyne.dev/projects/pbget")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makep")
    (description "Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for
makepkg.")
    (home-page "https://xyne.dev/projects/pbget")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 53. jprofiler
;;; -------------------------------------------------------------------
(define-public jprofiler
  (package
    (name "jprofiler")
    (version "16.0")
    (source (origin
              (method url-fetch)
              (uri "http://jprofiler.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Award-Winning All-in-One Java Profiler")
    (description "The Award-Winning All-in-One Java Profiler.")
    (home-page "http://jprofiler.com")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 54. sudo-rs-git
;;; -------------------------------------------------------------------
(define-public sudo-rs-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "sudo-rs-git")
      (version (git-version "r1148.d4abd98" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/memorysafety/sudo-rs")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (synopsis "a memory safe implementation of sudo and su")
      (description "A memory safe implementation of sudo and su.")
      (home-page "https://github.com/memorysafety/sudo-rs")
      (license (list license:asl2.0 license:expat))
    )))

;;; -------------------------------------------------------------------
;;; 55. tlm
;;; -------------------------------------------------------------------
(define-public tlm
  (package
    (name "tlm")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/yusufcanb/tlm/archive/refs/tags/v1.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "local CLI Copilot, powered by Ollama")
    (description "Local CLI Copilot, powered by Ollama.")
    (home-page "https://github.com/yusufcanb/tlm")
    (license license:asl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 56. zsh-autocomplete-git
;;; -------------------------------------------------------------------
(define-public zsh-autocomplete-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "zsh-autocomplete-git")
      (version (git-version "r814.762afac" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/marlonrichert/zsh-autocomplete")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "iDE-style type-ahead completion for Zsh")
      (description "IDE-style type-ahead completion for Zsh.")
      (home-page "https://github.com/marlonrichert/zsh-autocomplete")
      (license license:expat)
    )))

;;; -------------------------------------------------------------------
;;; 57. zsh-defer-git
;;; -------------------------------------------------------------------
(define-public zsh-defer-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "zsh-defer-git")
      (version (git-version "r39.1c75faf" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/romkatv/zsh-defer")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "deferred execution of Zsh commands")
      (description "Deferred execution of Zsh commands.")
      (home-page "https://github.com/romkatv/zsh-defer")
      (license license:gpl3+)
    )))

;;; -------------------------------------------------------------------
;;; 58. cockpit-file-sharing
;;; -------------------------------------------------------------------
(define-public cockpit-file-sharing
  (package
    (name "cockpit-file-sharing")
    (version "4.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/45Drives/cockpit-file-sharing/archive/refs/tags/v4.3.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Cockpit plugin to easily manage samba and NFS file sharing")
    (description "A Cockpit plugin to easily manage samba and NFS file sharing.")
    (home-page "https://github.com/45Drives/cockpit-file-sharing")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 59. ltfs
;;; -------------------------------------------------------------------
(define-public ltfs
  (package
    (name "ltfs")
    (version "2.4.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/LinearTapeFileSystem/ltfs/archive/refs/tags/v2.4.7.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linear Tape File System")
    (description "Linear Tape File System.")
    (home-page "https://github.com/LinearTapeFileSystem/ltfs")
    (license license:bsd-3)
    ))

;;; -------------------------------------------------------------------
;;; 60. freenginx-src
;;; -------------------------------------------------------------------
(define-public freenginx-src
  (package
    (name "freenginx-src")
    (version "1.30.0")
    (source (origin
              (method url-fetch)
              (uri "https://freenginx.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "source code of freenginx 1.30.0, useful for building modules")
    (description "Source code of freenginx 1.30.0, useful for building modules.")
    (home-page "https://freenginx.org")
    (license (license:non-copyleft "file://LICENSE"))
    ))

;;; -------------------------------------------------------------------
;;; 61. sieve-app-bin
;;; -------------------------------------------------------------------
(define-public sieve-app-bin
  (package
    (name "sieve-app-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/thsmi/sieve/releases/download/v0.6.1/sieve-0.6.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sieve-app" "bin/sieve-app"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sieve script editor app version")
    (description "Sieve script editor app version.")
    (home-page "https://github.com/thsmi/sieve/")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 62. deepcool-digital-linux-git
;;; -------------------------------------------------------------------
(define-public deepcool-digital-linux-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "deepcool-digital-linux-git")
      (version (git-version "r48.d80f346" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Nortank12/deepcool-digital-linux")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (synopsis "linux version for the DeepCool Digital Windows software")
      (description "Linux version for the DeepCool Digital Windows software.")
      (home-page "https://github.com/Nortank12/deepcool-digital-linux")
      (license license:gpl3+)
    )))

;;; -------------------------------------------------------------------
;;; 63. shadps4-pre-release-bin
;;; -------------------------------------------------------------------
(define-public shadps4-pre-release-bin
  (package
    (name "shadps4-pre-release-bin")
    (version "20260419.90b75ea")
    (source (origin
              (method url-fetch)
              (uri "https://shadps4.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("shadps4-pre-release" "bin/shadps4-pre-release"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sony PlayStation 4 emulator (Pre-release version - SDL)")
    (description "Sony PlayStation 4 emulator (Pre-release version - SDL).")
    (home-page "https://shadps4.net/")
    (license license:gpl2)
    ))

;;; -------------------------------------------------------------------
;;; 64. netcalc
;;; -------------------------------------------------------------------
(define-public netcalc
  (package
    (name "netcalc")
    (version "2.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/troglobit/netcalc/archive/refs/tags/v2.1.7.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iP network calculator - Simplified clone of sipcalc with ipcalc looks")
    (description "IP network calculator - Simplified clone of sipcalc with ipcalc looks.")
    (home-page "https://github.com/troglobit/netcalc")
    (license license:bsd-3)
    ))

;;; -------------------------------------------------------------------
;;; 65. redot-mono-bin
;;; -------------------------------------------------------------------
(define-public redot-mono-bin
  (package
    (name "redot-mono-bin")
    (version "26.1_stable")
    (source (origin
              (method url-fetch)
              (uri "https://www.redotengine.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("redot-mono" "bin/redot-mono"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a multi-platform 2D and 3D game engine")
    (description "A multi-platform 2D and 3D game engine.")
    (home-page "https://www.redotengine.org/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 66. redot-git
;;; -------------------------------------------------------------------
(define-public redot-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "redot-git")
      (version (git-version "26.2.r77413.7ff80936be" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Redot-Engine/redot-engine")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "multi-platform 2D and 3D game engine with a feature-rich editor")
      (description "Multi-platform 2D and 3D game engine with a feature-rich editor.")
      (home-page "https://github.com/Redot-Engine/redot-engine")
      (license license:expat)
    )))

;;; -------------------------------------------------------------------
;;; 68. sgf-render
;;; -------------------------------------------------------------------
(define-public sgf-render
  (package
    (name "sgf-render")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/julianandrews/sgf-render/archive/refs/tags/v3.2.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sgf Rendering CLI written in Rust")
    (description "Sgf Rendering CLI written in Rust.")
    (home-page "https://github.com/julianandrews/sgf-render/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 69. sddm-sugar-dark
;;; -------------------------------------------------------------------
(define-public sddm-sugar-dark
  (package
    (name "sddm-sugar-dark")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/MarianArlt/sddm-sugar-dark/archive/refs/tags/v1.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the sweetest dark theme around for SDDM, the Simple Desktop Display Manager")
    (description "The sweetest dark theme around for SDDM, the Simple Desktop Display
Manager.")
    (home-page "https://github.com/MarianArlt/sddm-sugar-dark")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 70. pipes-rs-git
;;; -------------------------------------------------------------------
(define-public pipes-rs-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "pipes-rs-git")
      (version (git-version "v1.6.1.r9.gf139336" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/lhvy/pipes-rs")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (synopsis "an over-engineered rewrite of pipes.sh in Rust")
      (description "An over-engineered rewrite of pipes.sh in Rust.")
      (home-page "https://github.com/lhvy/pipes-rs")
      (license (license:non-copyleft "file://LICENSE"))
    )))

;;; -------------------------------------------------------------------
;;; 71. newsboat-og
;;; -------------------------------------------------------------------
(define-public newsboat-og
  (package
    (name "newsboat-og")
    (version "2.13.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/andreasbaumann/newsboat-og/archive/refs/tags/v2.13.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an RSS/Atom feed reader for text terminals (old gen)")
    (description "An RSS/Atom feed reader for text terminals (old gen).")
    (home-page "https://github.com/andreasbaumann/newsboat-og")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 72. dumber
;;; -------------------------------------------------------------------
(define-public dumber
  (package
    (name "dumber")
    (version "3.0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/MichelBoucey/dumber/archive/refs/tags/v3.0.0.3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "(un)numbering Mardown sections and add/remove tables of content")
    (description "(un)numbering Mardown sections and add/remove tables of content.")
    (home-page "https://github.com/MichelBoucey/dumber")
    (license license:bsd-3)
    ))

;;; -------------------------------------------------------------------
;;; 73. linux_logo
;;; -------------------------------------------------------------------
(define-public linux-logo
  (package
    (name "linux_logo")
    (version "6.01")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/deater/linux_logo/archive/refs/tags/v6.01.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "text-based logo and system information program")
    (description "Text-based logo and system information program.")
    (home-page "https://github.com/deater/linux_logo")
    (license license:gpl2)
    ))

;;; -------------------------------------------------------------------
;;; 74. dyna-git
;;; -------------------------------------------------------------------
(define-public dyna-git
  (package
    (name "dyna-git")
    (version "0.1.1.r13.g96545ad")
    (source (origin
              (method url-fetch)
              (uri "https://git.sr.ht/~grtcdr/dyna")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert a colorscheme from one terminal emulator to another")
    (description "Convert a colorscheme from one terminal emulator to another.")
    (home-page "https://git.sr.ht/~grtcdr/dyna")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 75. vpinball
;;; -------------------------------------------------------------------
(define-public vpinball
  (package
    (name "vpinball")
    (version "10.8.1_3155_8054cc2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/vpinball/vpinball/archive/refs/tags/v10.8.1_3155_8054cc2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source pinball table editor and simulator - BGFX standalone (binary) ")
    (description "An open source pinball table editor and simulator - BGFX standalone
(binary) version.")
    (home-page "https://github.com/vpinball/vpinball")
    (license (list license:gpl3+ (license:non-copyleft "file://LICENSE")))
    ))

;;; -------------------------------------------------------------------
;;; 76. sparkle-electron-git
;;; -------------------------------------------------------------------
(define-public sparkle-electron-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "sparkle-electron-git")
      (version (git-version "1.26.2.r1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/xishang0128/sparkle")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system node-build-system)
      (arguments (list #:tests? #f))
      (synopsis "another Mihomo GUI")
      (description "Another Mihomo GUI.")
      (home-page "https://github.com/xishang0128/sparkle")
      (license license:gpl3)
    )))

;;; -------------------------------------------------------------------
;;; 77. openkj
;;; -------------------------------------------------------------------
(define-public openkj
  (package
    (name "openkj")
    (version "2.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://openkj.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open KJ - Cross-platform open source karaoke hosting software")
    (description "Open KJ - Cross-platform open source karaoke hosting software.")
    (home-page "https://openkj.org/")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 78. nodejs-fanyi
;;; -------------------------------------------------------------------
(define-public nodejs-fanyi
  (package
    (name "nodejs-fanyi")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/afc163/fanyi#readme/archive/refs/tags/v10.0.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 🇨🇳 and 🇺🇸🇬🇧 translator in your command line, powered by iciba and deepseek")
    (description "A 🇨🇳 and 🇺🇸🇬🇧 translator in your command line, powered by iciba and
deepseek.")
    (home-page "https://github.com/afc163/fanyi#readme")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 79. node-fanyi
;;; -------------------------------------------------------------------
(define-public node-fanyi
  (package
    (name "node-fanyi")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/afc163/fanyi#readme/archive/refs/tags/v10.0.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a CN and EN translator in your command line, powered by iciba and deepseek")
    (description "A CN and EN translator in your command line, powered by iciba and
deepseek.")
    (home-page "https://github.com/afc163/fanyi#readme")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 80. libzedmd-git
;;; -------------------------------------------------------------------
(define-public libzedmd-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "libzedmd-git")
      (version (git-version "r292.1547728" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/PPUC/libzedmd")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (synopsis "zeDMD communication library")
      (description "ZeDMD communication library.")
      (home-page "https://github.com/PPUC/libzedmd")
      (license license:gpl3+)
    )))

;;; -------------------------------------------------------------------
;;; 81. kubectl-ai-bin
;;; -------------------------------------------------------------------
(define-public kubectl-ai-bin
  (package
    (name "kubectl-ai-bin")
    (version "0.0.31")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/GoogleCloudPlatform/kubectl-ai/releases/download/v0.0.31/kubectl-ai-0.0.31-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kubectl-ai" "bin/kubectl-ai"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "aI powered Kubernetes Assistant")
    (description "AI powered Kubernetes Assistant.")
    (home-page "https://github.com/GoogleCloudPlatform/kubectl-ai")
    (license license:asl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 82. kernel-headers-trigger
;;; -------------------------------------------------------------------
(define-public kernel-headers-trigger
  (package
    (name "kernel-headers-trigger")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/kernel-headers-trigger")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "trigger tool for those who build Linux kernel header files from source file")
    (description "Trigger tool for those who build Linux kernel header files from source
file.")
    (home-page "None")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 83. taskopen
;;; -------------------------------------------------------------------
(define-public taskopen
  (package
    (name "taskopen")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/jschlatow/taskopen/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "script for taking notes and open urls with taskwarrior")
    (description "Script for taking notes and open urls with taskwarrior.")
    (home-page "https://codeberg.org/jschlatow/taskopen/")
    (license license:gpl2+)
    ))

;;; -------------------------------------------------------------------
;;; 84. tageditor
;;; -------------------------------------------------------------------
(define-public tageditor
  (package
    (name "tageditor")
    (version "3.9.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Martchus/tageditor/archive/refs/tags/v3.9.9.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (i")
    (description "A tag editor with Qt GUI and command-line interface supporting
MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska.")
    (home-page "https://github.com/Martchus/tageditor")
    (license license:gpl2+)
    ))

;;; -------------------------------------------------------------------
;;; 85. asusctl-git
;;; -------------------------------------------------------------------
(define-public asusctl-git
  (package
    (name "asusctl-git")
    (version "6.0.11.r10.g5ab9642")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.com/asus-linux/asusctl")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "asus laptop control utilities")
    (description "Asus laptop control utilities.")
    (home-page "https://gitlab.com/asus-linux/asusctl")
    (license license:mpl2.0)
    ))

;;; -------------------------------------------------------------------
;;; 86. scamper
;;; -------------------------------------------------------------------
(define-public scamper
  (package
    (name "scamper")
    (version "20260420")
    (source (origin
              (method url-fetch)
              (uri "https://www.caida.org/catalog/software/scamper/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool that actively probes the Internet in order to analyze topology and per")
    (description "A tool that actively probes the Internet in order to analyze topology
and performance.")
    (home-page "https://www.caida.org/catalog/software/scamper/")
    (license license:gpl2+)
    ))

;;; -------------------------------------------------------------------
;;; 87. scitopdf
;;; -------------------------------------------------------------------
(define-public scitopdf
  (package
    (name "scitopdf")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/dougy147/scitopdf.git/archive/refs/tags/v0.7.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "script to quickly fetch scientific papers from Sci-Hub or Libgen")
    (description "Script to quickly fetch scientific papers from Sci-Hub or Libgen.")
    (home-page "https://github.com/dougy147/scitopdf.git")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 88. meowsql
;;; -------------------------------------------------------------------
(define-public meowsql
  (package
    (name "meowsql")
    (version "0.4.18")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ragnar-lodbrok/meow-sql/archive/refs/tags/v0.4.18.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an attempt to port a very useful GUI database client HeidiSQL to C++/Qt (curr")
    (description "An attempt to port a very useful GUI database client HeidiSQL to C++/Qt
(currently alpha).")
    (home-page "https://github.com/ragnar-lodbrok/meow-sql")
    (license license:gpl2)
    ))

;;; -------------------------------------------------------------------
;;; 89. boxtron-git
;;; -------------------------------------------------------------------
(define-public boxtron-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "boxtron-git")
      (version (git-version "0.5.4.r26.gb3eb8c1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/dreamer/boxtron")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (synopsis "compatibility tool to run DOS games on Steam through native Linux DOSBox")
      (description "Compatibility tool to run DOS games on Steam through native Linux
DOSBox.")
      (home-page "https://github.com/dreamer/boxtron")
      (license license:gpl2+)
    )))

;;; -------------------------------------------------------------------
;;; 90. vlc-protocol
;;; -------------------------------------------------------------------
(define-public vlc-protocol
  (package
    (name "vlc-protocol")
    (version "1.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/northsea4/vlc-protocol/archive/refs/tags/v1.3.6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vLC Protocol Handler - - Support vlc:// protocol links")
    (description "VLC Protocol Handler - - Support vlc:// protocol links.")
    (home-page "https://github.com/northsea4/vlc-protocol")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 91. ttyc
;;; -------------------------------------------------------------------
(define-public ttyc
  (package
    (name "ttyc")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Depau/ttyc/archive/refs/tags/v0.4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ttyd protocol client")
    (description "Ttyd protocol client.")
    (home-page "https://github.com/Depau/ttyc")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 92. python-scalene
;;; -------------------------------------------------------------------
(define-public python-scalene
  (package
    (name "python-scalene")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/plasma-umass/scalene/archive/refs/tags/v2.2.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-resolution, low-overhead CPU, GPU, and memory profiler for Python with")
    (description "A high-resolution, low-overhead CPU, GPU, and memory profiler for Python
with AI-powered optimization suggestions.")
    (home-page "https://github.com/plasma-umass/scalene")
    (license license:bsd-2)
    ))

;;; -------------------------------------------------------------------
;;; 93. justdd
;;; -------------------------------------------------------------------
(define-public justdd
  (package
    (name "justdd")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/xxanqw/justdd/archive/refs/tags/v0.1.4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "justDD - Simple graphical USB image writer for Linux and Windows ISOs")
    (description "JustDD - Simple graphical USB image writer for Linux and Windows ISOs.")
    (home-page "https://github.com/xxanqw/justdd")
    (license license:gpl3)
    ))

;;; -------------------------------------------------------------------
;;; 94. glyph-bin
;;; -------------------------------------------------------------------
(define-public glyph-bin
  (package
    (name "glyph-bin")
    (version "1.0.11")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/seatedro/glyph/releases/download/v1.0.11/glyph-1.0.11-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("glyph" "bin/glyph"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert images/video to ASCII art (formerly asciigen)")
    (description "Convert images/video to ASCII art (formerly asciigen).")
    (home-page "https://github.com/seatedro/glyph")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 95. firefox-extension-singlefile-bin
;;; -------------------------------------------------------------------
(define-public firefox-extension-singlefile-bin
  (package
    (name "firefox-extension-singlefile-bin")
    (version "1.22.81")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/addon/single-file/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("firefox-extension-singlefile" "bin/firefox-extension-singlefile"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "save an entire web page—including images and styling - as a single HTML file")
    (description "Save an entire web page—including images and styling - as a single HTML
file.")
    (home-page "https://addons.mozilla.org/addon/single-file/")
    (license license:expat)
    ))

;;; -------------------------------------------------------------------
;;; 96. exdupe-bin
;;; -------------------------------------------------------------------
(define-public exdupe-bin
  (package
    (name "exdupe-bin")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rrrlasse/exdupe/releases/download/v3.0.1/exdupe-3.0.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("exdupe" "bin/exdupe"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast file archiver that supports data deduplication and differential backups")
    (description "Fast file archiver that supports data deduplication and differential
backups.")
    (home-page "https://github.com/rrrlasse/exdupe")
    (license license:gpl2+)
    ))

;;; -------------------------------------------------------------------
;;; 97. monitorix
;;; -------------------------------------------------------------------
(define-public monitorix
  (package
    (name "monitorix")
    (version "3.16.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.monitorix.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight system monitoring tool that uses rrd databases")
    (description "A lightweight system monitoring tool that uses rrd databases.")
    (home-page "https://www.monitorix.org")
    (license license:gpl2)
    ))

;;; -------------------------------------------------------------------
;;; 98. umlet
;;; -------------------------------------------------------------------
(define-public umlet
  (package
    (name "umlet")
    (version "15.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.umlet.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free UML Tool for Fast UML Diagrams (stand-alone version)")
    (description "Free UML Tool for Fast UML Diagrams (stand-alone version).")
    (home-page "https://www.umlet.com")
    (license license:gpl3+)
    ))

;;; -------------------------------------------------------------------
;;; 100. virtualfish
;;; -------------------------------------------------------------------
(define-public virtualfish
  (package
    (name "virtualfish")
    (version "2.5.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/justinmayer/virtualfish/archive/refs/tags/v2.5.9.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fish shell tool for managing Python virtual environments")
    (description "Fish shell tool for managing Python virtual environments.")
    (home-page "https://github.com/justinmayer/virtualfish")
    (license license:expat)
    ))
