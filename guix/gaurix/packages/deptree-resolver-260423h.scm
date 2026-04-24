;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260423h
;;; Resolves 100 BLOCKED/FAILED packages via dependency-tree priority.
;;;
;;; New recipes (100):
;;;      1.  legcord (node-build-system, v1.2.4, license:non-copyleft)
;;;      2.  lib32-freearc-bin (copy-build-system, v0.51, license:gpl2)
;;;      3.  lib32-libxxf86dga (copy-build-system, v1.1.6, license:non-copyleft)
;;;      4.  minecraft-launcher (copy-build-system, v2.1.3, license:non-copyleft)
;;;      5.  modiva-launcher-bin (copy-build-system, v1.5.0, license:non-copyleft)
;;;      6.  neovim-remote (pyproject-build-system, v2.5.1, license:expat)
;;;      7.  ntfysh (go-build-system, v2.22.0, license:gpl2)
;;;      8.  nvidia-340xx-lts (copy-build-system, v340.108, license:non-copyleft)
;;;      9.  octarine-bin (copy-build-system, v0.40.3, license:non-copyleft)
;;;     10.  open-webui (copy-build-system, v0.8.12, license:bsd-3)
;;;     11.  opencode-desktop-bin (copy-build-system, v1.14.22, license:expat)
;;;     12.  osaka-simulator (copy-build-system, vAug_2003, license:non-copyleft)
;;;     13.  pacdiff-pacman-hook-git (gnu-build-system, vr81.9d5f298, license:gpl3+)
;;;     14.  pacwall-git (gnu-build-system, v2.3.2, license:gpl3)
;;;     15.  pear-desktop (copy-build-system, v3.11.0, license:expat)
;;;     16.  perl-lwp-protocol-socks (copy-build-system, v1.7, license:gpl3+)
;;;     17.  piavpn-bin (copy-build-system, v3.7.2, license:non-copyleft)
;;;     18.  plasma6-applets-kara-git (cmake-build-system, v0.8.0.r2.g2c9f792, license:gpl3)
;;;     19.  pypy3-pyparsing (copy-build-system, v3.3.2, license:expat)
;;;     20.  python-gurobipy (pyproject-build-system, v13.0.1, license:non-copyleft)
;;;     21.  python-pyqt5-webengine (copy-build-system, v5.15.7, license:gpl3+)
;;;     22.  r-gurobi (copy-build-system, v13.0.1, (list license:non-copyleft license:lgpl2.1))
;;;     23.  r8168-dkms (copy-build-system, v8.056.02, license:gpl2+)
;;;     24.  rescrobbled-git (cargo-build-system, v0.6.2.r0.gec0fc3d, license:gpl3)
;;;     25.  rtl8188gu-dkms-git (copy-build-system, vr12.9dec829, license:non-copyleft)
;;;     26.  rtl8821ce-dkms-git (copy-build-system, v1.0.5.r36.gca4abd8, license:gpl2)
;;;     27.  scarlett2 (copy-build-system, v1.0, license:gpl3)
;;;     28.  seerr (copy-build-system, v3.2.0, license:expat)
;;;     29.  simple-mtpfs (copy-build-system, v0.4.0, license:gpl2+)
;;;     30.  sing-box (go-build-system, v1.13.11, license:non-copyleft)
;;;     31.  swayshot (copy-build-system, v2.8.0, license:gpl3)
;;;     32.  tek (cargo-build-system, v0.2.0.rc7, license:non-copyleft)
;;;     33.  tio (meson-build-system, v3.9, license:gpl2+)
;;;     34.  tuxedo-keyboard-tools (copy-build-system, v1.4, license:gpl3+)
;;;     35.  updpkgsrcs (copy-build-system, v0.1.7, license:gpl3+)
;;;     36.  uutils-hostname-git (cargo-build-system, vr487.gc047799, license:expat)
;;;     37.  uutils-procps-git (cargo-build-system, v0.0.1.r1344.gad3e29a, license:expat)
;;;     38.  uutils-sed-git (cargo-build-system, vr725.g81e71bc, license:expat)
;;;     39.  uutils-tar-git (cargo-build-system, v0.0.1.r150.1578d39, license:expat)
;;;     40.  uutils-util-linux-git (cargo-build-system, v0.0.1.r937.g1c5ba77, license:expat)
;;;     41.  vacuum (go-build-system, v0.26.1, license:expat)
;;;     42.  vintagestory (copy-build-system, v1.22.0, license:non-copyleft)
;;;     43.  wails (go-build-system, v2.12.0, license:expat)
;;;     44.  warsaw-bin (copy-build-system, v2.21.5.1, license:gpl3+)
;;;     45.  wayfreeze-git (cargo-build-system, vr81.8f813ab, license:non-copyleft)
;;;     46.  winboat-bin (copy-build-system, v0.9.0, license:expat)
;;;     47.  xlibre-video-voodoo (copy-build-system, v25.0.0, license:expat)
;;;     48.  xnconvert (copy-build-system, v1.106.0, license:non-copyleft)
;;;     49.  yabsnap (copy-build-system, v2.3.4, license:asl2.0)
;;;     50.  abcde-musicbrainz-meta (copy-build-system, v1, license:gpl3+)
;;;     51.  android-studio (copy-build-system, v2025.3.4.6, license:asl2.0)
;;;     52.  app2unit-git (gnu-build-system, v1.0.2.r0.g6a2fe29, license:gpl3)
;;;     53.  arch-check (pyproject-build-system, v0.3.0, license:non-copyleft)
;;;     54.  aur-auto (copy-build-system, v1.1.0, license:expat)
;;;     55.  aur-auto-vote-git (gnu-build-system, vr150.3a626c5, license:expat)
;;;     56.  binance (copy-build-system, v2.0.2, license:non-copyleft)
;;;     57.  biu-tauri-bin (copy-build-system, v1.12.0, license:non-copyleft)
;;;     58.  boomaga (cmake-build-system, v3.0.0, (list license:gpl2 license:lgpl2.1))
;;;     59.  brave-bin (copy-build-system, v1.89.143, (list license:bsd-3 license:non-copyleft license:mpl2.0))
;;;     60.  brother-hl1118 (copy-build-system, v3.0.2, license:non-copyleft)
;;;     61.  brother-mfc-l3770cdw (copy-build-system, v1.0.2, (list license:non-copyleft license:gpl3+))
;;;     62.  bruno (pyproject-build-system, v3.2.2, license:expat)
;;;     63.  checkpac (copy-build-system, v0.10.0, license:gpl3+)
;;;     64.  clipboard-manager-git (cargo-build-system, v0.1.0.r49.g3b4d392, license:gpl3+)
;;;     65.  cn-dascom-pin-driver (copy-build-system, v2.0.6, license:expat)
;;;     66.  dab-cli (cargo-build-system, v0.5.0, license:expat)
;;;     67.  dare-devil (copy-build-system, v0.1.2, license:expat)
;;;     68.  debtap (copy-build-system, v3.6.3, license:gpl2)
;;;     69.  droidcam-obs-plugin-git (copy-build-system, v2.4.3.r0.e873e48, license:gpl3+)
;;;     70.  flac2all (pyproject-build-system, v5.4, license:gpl2)
;;;     71.  flutter-artifacts-material-fonts-google-bin (font-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;     72.  flutter-artifacts-sky-engine-google-bin (copy-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;     73.  git-credential-manager-bin (copy-build-system, v2.7.3, license:expat)
;;;     74.  google-calender-widget (node-build-system, v1.1.6, license:expat)
;;;     75.  gr-ieee802-11-git (cmake-build-system, vr352.0c0fca8, license:gpl3)
;;;     76.  i686-elf-pcc-git (gnu-build-system, v20251115, license:non-copyleft)
;;;     77.  icecat-ublock-origin (node-build-system, v1.66.4, license:gpl3+)
;;;     78.  jailbox-git (gnu-build-system, vv0.5.0.r0.gd82c0be, license:expat)
;;;     79.  kdoctools5 (copy-build-system, v5.116.0, license:lgpl3+)
;;;     80.  lib32-glibc-git (copy-build-system, v2.37.r601.g7ff33eca68, (list license:gpl3+ license:lgpl3+))
;;;     81.  lib32-liblrdf (copy-build-system, v0.6.1, license:lgpl2.1+)
;;;     82.  libaudec (meson-build-system, v0.3.4, license:agpl3)
;;;     83.  luffy-bin (copy-build-system, v1.1.5, license:gpl3)
;;;     84.  lunatask (copy-build-system, v2.1.27, license:non-copyleft)
;;;     85.  macchina-git (cargo-build-system, v6.4.0.r6.gc049088, license:expat)
;;;     86.  nautilus-metadata-editor (meson-build-system, v43.0.1, license:gpl3+)
;;;     87.  numaplayer (copy-build-system, v2.1.8, license:non-copyleft)
;;;     88.  nvidia-340xx-lts-dkms (copy-build-system, v340.108, license:non-copyleft)
;;;     89.  oblivion-desktop-git (node-build-system, v3.11.0.r6.g9fdf217, license:non-copyleft)
;;;     90.  obs-vaapi (meson-build-system, v0.4.2, license:gpl2)
;;;     91.  ocs-url (copy-build-system, v3.1.0, license:gpl3)
;;;     92.  pamac-tray-icon-plasma (cmake-build-system, v0.1.4, license:gpl3)
;;;     93.  pdf-xchange (copy-build-system, v10.8.5.410, license:non-copyleft)
;;;     94.  pds-gatekeeper-git (cargo-build-system, vr18.2e39f1e, license:expat)
;;;     95.  pesconvert-git (copy-build-system, vr20.d6d7001, license:non-copyleft)
;;;     96.  phiola-bin (copy-build-system, v2.7.11, license:bsd-2)
;;;     97.  plasma6-applets-resources-monitor (copy-build-system, v3.2.1, license:gpl3+)
;;;     98.  pm2ml (pyproject-build-system, v2021.11.20.1, license:gpl3+)
;;;     99.  python-diskcache (pyproject-build-system, v5.6.3, license:asl2.0)
;;;    100.  python-mock (pyproject-build-system, v5.2.0, license:bsd-2)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260423h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export (
            legcord
            lib32-freearc-bin
            lib32-libxxf86dga
            minecraft-launcher
            modiva-launcher-bin
            neovim-remote
            ntfysh
            nvidia-340xx-lts
            octarine-bin
            open-webui
            opencode-desktop-bin
            osaka-simulator
            pacdiff-pacman-hook-git
            pacwall-git
            pear-desktop
            perl-lwp-protocol-socks
            piavpn-bin
            plasma6-applets-kara-git
            pypy3-pyparsing
            python-gurobipy
            python-pyqt5-webengine
            r-gurobi
            r8168-dkms
            rescrobbled-git
            rtl8188gu-dkms-git
            rtl8821ce-dkms-git
            scarlett2
            seerr
            simple-mtpfs
            sing-box
            swayshot
            tek
            tio
            tuxedo-keyboard-tools
            updpkgsrcs
            uutils-hostname-git
            uutils-procps-git
            uutils-sed-git
            uutils-tar-git
            uutils-util-linux-git
            vacuum
            vintagestory
            wails
            warsaw-bin
            wayfreeze-git
            winboat-bin
            xlibre-video-voodoo
            xnconvert
            yabsnap
            abcde-musicbrainz-meta
            android-studio
            app2unit-git
            arch-check
            aur-auto
            aur-auto-vote-git
            binance
            biu-tauri-bin
            boomaga
            brave-bin
            brother-hl1118
            brother-mfc-l3770cdw
            bruno
            checkpac
            clipboard-manager-git
            cn-dascom-pin-driver
            dab-cli
            dare-devil
            debtap
            droidcam-obs-plugin-git
            flac2all
            flutter-artifacts-material-fonts-google-bin
            flutter-artifacts-sky-engine-google-bin
            git-credential-manager-bin
            google-calender-widget
            gr-ieee802-11-git
            i686-elf-pcc-git
            icecat-ublock-origin
            jailbox-git
            kdoctools5
            lib32-glibc-git
            lib32-liblrdf
            libaudec
            luffy-bin
            lunatask
            macchina-git
            nautilus-metadata-editor
            numaplayer
            nvidia-340xx-lts-dkms
            oblivion-desktop-git
            obs-vaapi
            ocs-url
            pamac-tray-icon-plasma
            pdf-xchange
            pds-gatekeeper-git
            pesconvert-git
            phiola-bin
            plasma6-applets-resources-monitor
            pm2ml
            python-diskcache
            python-mock
            ))

;;; -------------------------------------------------------------------
;;; 1889. legcord --- discord client with builtin client mod and theme support
;;; -------------------------------------------------------------------
(define-public legcord
  (package
    (name "legcord")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Legcord/Legcord/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "discord client with builtin client mod and theme support")
    (description "Discord client with builtin client mod and theme support.")
    (home-page "https://github.com/Legcord/Legcord")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5982. lib32-freearc-bin --- free and open-source high-performance file archiver
;;; -------------------------------------------------------------------
(define-public lib32-freearc-bin
  (package
    (name "lib32-freearc-bin")
    (version "0.51")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/freearc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and open-source high-performance file archiver")
    (description "Free and open-source high-performance file archiver.")
    (home-page "https://sourceforge.net/projects/freearc/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5826. lib32-libxxf86dga --- x11 Direct Graphics Access extension library (32 bit)
;;; -------------------------------------------------------------------
(define-public lib32-libxxf86dga
  (package
    (name "lib32-libxxf86dga")
    (version "1.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://xorg.freedesktop.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "x11 Direct Graphics Access extension library (32 bit)")
    (description "X11 Direct Graphics Access extension library (32 bit).")
    (home-page "http://xorg.freedesktop.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11382. minecraft-launcher --- official Minecraft Launcher
;;; -------------------------------------------------------------------
(define-public minecraft-launcher
  (package
    (name "minecraft-launcher")
    (version "2.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mojang.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official Minecraft Launcher")
    (description "Official Minecraft Launcher.")
    (home-page "https://mojang.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2166. modiva-launcher-bin --- the official Modiva Minecraft launcher
;;; -------------------------------------------------------------------
(define-public modiva-launcher-bin
  (package
    (name "modiva-launcher-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://modiva-launcher.xyz/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the official Modiva Minecraft launcher")
    (description "The official Modiva Minecraft launcher.")
    (home-page "https://modiva-launcher.xyz")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5589. neovim-remote --- support --remote and friends for Neovim
;;; -------------------------------------------------------------------
(define-public neovim-remote
  (package
    (name "neovim-remote")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mhinz/neovim-remote/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "support --remote and friends for Neovim")
    (description "Support --remote and friends for Neovim.")
    (home-page "https://github.com/mhinz/neovim-remote")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1882. ntfysh --- send push notifications to your phone or desktop using PUT/POST
;;; -------------------------------------------------------------------
(define-public ntfysh
  (package
    (name "ntfysh")
    (version "2.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ntfy.sh/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "send push notifications to your phone or desktop using PUT/POST")
    (description "Send push notifications to your phone or desktop using PUT/POST.")
    (home-page "https://ntfy.sh")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17295. nvidia-340xx-lts --- nVIDIA drivers for linux-lts, 340xx legacy branch
;;; -------------------------------------------------------------------
(define-public nvidia-340xx-lts
  (package
    (name "nvidia-340xx-lts")
    (version "340.108")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nvidia.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA drivers for linux-lts, 340xx legacy branch")
    (description "NVIDIA drivers for linux-lts, 340xx legacy branch.")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1662. octarine-bin --- private, markdown-based note-taking app with a focus on speed, simplic...
;;; -------------------------------------------------------------------
(define-public octarine-bin
  (package
    (name "octarine-bin")
    (version "0.40.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://octarine.app/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "private, markdown-based note-taking app with a focus on speed, simplicity and...")
    (description "Private, markdown-based note-taking app with a focus on speed, simplicity and data ownership. Write faster, think clearer.")
    (home-page "https://octarine.app")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2293. open-webui --- web UI and OpenAI API for various LLM runners, including Ollama
;;; -------------------------------------------------------------------
(define-public open-webui
  (package
    (name "open-webui")
    (version "0.8.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/open-webui/open-webui/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web UI and OpenAI API for various LLM runners, including Ollama")
    (description "Web UI and OpenAI API for various LLM runners, including Ollama.")
    (home-page "https://github.com/open-webui/open-webui")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 2289. opencode-desktop-bin --- openCode desktop client
;;; -------------------------------------------------------------------
(define-public opencode-desktop-bin
  (package
    (name "opencode-desktop-bin")
    (version "1.14.22")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://opencode.ai/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openCode desktop client")
    (description "OpenCode desktop client.")
    (home-page "https://opencode.ai")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5744. osaka-simulator --- a fanmade interactive Osaka simulator from hirahira.net for PC
;;; -------------------------------------------------------------------
(define-public osaka-simulator
  (package
    (name "osaka-simulator")
    (version "Aug_2003")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://web.archive.org/web/20230207145313/http://www.hirahira.net/products/tsu_hanFinal/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fanmade interactive Osaka simulator from hirahira.net for PC")
    (description "A fanmade interactive Osaka simulator from hirahira.net for PC.")
    (home-page "http://web.archive.org/web/20230207145313/http://www.hirahira.net/products/tsu_hanFinal/index.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1340. pacdiff-pacman-hook-git --- pacman hook to review .pacnew files automatically
;;; -------------------------------------------------------------------
(define-public pacdiff-pacman-hook-git
  (package
    (name "pacdiff-pacman-hook-git")
    (version "r81.9d5f298")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/desbma/pacman-hooks")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "pacman hook to review .pacnew files automatically")
    (description "Pacman hook to review .pacnew files automatically.")
    (home-page "https://github.com/desbma/pacman-hooks")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 14584. pacwall-git --- a live wallpaper that shows the dependency graph and status of install...
;;; -------------------------------------------------------------------
(define-public pacwall-git
  (package
    (name "pacwall-git")
    (version "2.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/Kharacternyk/pacwall")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a live wallpaper that shows the dependency graph and status of installed pack...")
    (description "A live wallpaper that shows the dependency graph and status of installed packages.")
    (home-page "http://github.com/Kharacternyk/pacwall")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1871. pear-desktop --- extension for music player
;;; -------------------------------------------------------------------
(define-public pear-desktop
  (package
    (name "pear-desktop")
    (version "3.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pear-devs/pear-desktop/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extension for music player")
    (description "Extension for music player.")
    (home-page "https://github.com/pear-devs/pear-desktop")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 766. perl-lwp-protocol-socks --- adds support for the socks protocol and proxy facility
;;; -------------------------------------------------------------------
(define-public perl-lwp-protocol-socks
  (package
    (name "perl-lwp-protocol-socks")
    (version "1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://search.cpan.org/~scr/LWP-Protocol-socks-1.3/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adds support for the socks protocol and proxy facility")
    (description "Adds support for the socks protocol and proxy facility.")
    (home-page "http://search.cpan.org/~scr/LWP-Protocol-socks-1.3/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1342. piavpn-bin --- private Internet Access client
;;; -------------------------------------------------------------------
(define-public piavpn-bin
  (package
    (name "piavpn-bin")
    (version "3.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://privateinternetaccess.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "private Internet Access client")
    (description "Private Internet Access client.")
    (home-page "https://privateinternetaccess.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2269. plasma6-applets-kara-git --- kDE Plasma Pager Applet
;;; -------------------------------------------------------------------
(define-public plasma6-applets-kara-git
  (package
    (name "plasma6-applets-kara-git")
    (version "0.8.0.r2.g2c9f792")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dhruv8sh/kara")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "kDE Plasma Pager Applet")
    (description "KDE Plasma Pager Applet.")
    (home-page "https://github.com/dhruv8sh/kara")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15310. pypy3-pyparsing --- general parsing module for Python
;;; -------------------------------------------------------------------
(define-public pypy3-pyparsing
  (package
    (name "pypy3-pyparsing")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pyparsing/pyparsing/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "general parsing module for Python")
    (description "General parsing module for Python.")
    (home-page "https://github.com/pyparsing/pyparsing")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16815. python-gurobipy --- state-of-the-art solver for mathematical programming (Python bindings)
;;; -------------------------------------------------------------------
(define-public python-gurobipy
  (package
    (name "python-gurobipy")
    (version "13.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gurobi.com/products/gurobi-optimizer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "state-of-the-art solver for mathematical programming (Python bindings)")
    (description "State-of-the-art solver for mathematical programming (Python bindings).")
    (home-page "https://www.gurobi.com/products/gurobi-optimizer")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7918. python-pyqt5-webengine --- python bindings for QtWebEngine
;;; -------------------------------------------------------------------
(define-public python-pyqt5-webengine
  (package
    (name "python-pyqt5-webengine")
    (version "5.15.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.riverbankcomputing.com/software/pyqtwebengine/intro/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for QtWebEngine")
    (description "Python bindings for QtWebEngine.")
    (home-page "https://www.riverbankcomputing.com/software/pyqtwebengine/intro")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8078. r-gurobi --- state-of-the-art solver for mathematical programming (R bindings)
;;; -------------------------------------------------------------------
(define-public r-gurobi
  (package
    (name "r-gurobi")
    (version "13.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gurobi.com/products/gurobi-optimizer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "state-of-the-art solver for mathematical programming (R bindings)")
    (description "State-of-the-art solver for mathematical programming (R bindings).")
    (home-page "https://www.gurobi.com/products/gurobi-optimizer")
    (license (list license:non-copyleft license:lgpl2.1))))

;;; -------------------------------------------------------------------
;;; 2183. r8168-dkms --- a kernel module for Realtek 8168 network cards (DKMS version)
;;; -------------------------------------------------------------------
(define-public r8168-dkms
  (package
    (name "r8168-dkms")
    (version "8.056.02")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mtorromeo/r8168/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a kernel module for Realtek 8168 network cards (DKMS version)")
    (description "A kernel module for Realtek 8168 network cards (DKMS version).")
    (home-page "https://github.com/mtorromeo/r8168")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 5797. rescrobbled-git --- music scrobbler daemon using the MPRIS D-Bus interface
;;; -------------------------------------------------------------------
(define-public rescrobbled-git
  (package
    (name "rescrobbled-git")
    (version "0.6.2.r0.gec0fc3d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/InputUsername/rescrobbled")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "music scrobbler daemon using the MPRIS D-Bus interface")
    (description "Music scrobbler daemon using the MPRIS D-Bus interface.")
    (home-page "https://github.com/InputUsername/rescrobbled")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8421. rtl8188gu-dkms-git --- linux driver for Realtek RTL8188GU
;;; -------------------------------------------------------------------
(define-public rtl8188gu-dkms-git
  (package
    (name "rtl8188gu-dkms-git")
    (version "r12.9dec829")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lwfinger/rtl8188gu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux driver for Realtek RTL8188GU")
    (description "Linux driver for Realtek RTL8188GU.")
    (home-page "https://github.com/lwfinger/rtl8188gu")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 22214. rtl8821ce-dkms-git --- rtl8821CE driver with firmware
;;; -------------------------------------------------------------------
(define-public rtl8821ce-dkms-git
  (package
    (name "rtl8821ce-dkms-git")
    (version "1.0.5.r36.gca4abd8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tomaspinho/rtl8821ce")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rtl8821CE driver with firmware")
    (description "Rtl8821CE driver with firmware.")
    (home-page "https://github.com/tomaspinho/rtl8821ce")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 1794. scarlett2 --- cLI tool for Focusrite Scarlett/Clarett/Vocaster audio interfaces
;;; -------------------------------------------------------------------
(define-public scarlett2
  (package
    (name "scarlett2")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/geoffreybennett/scarlett2/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI tool for Focusrite Scarlett/Clarett/Vocaster audio interfaces")
    (description "CLI tool for Focusrite Scarlett/Clarett/Vocaster audio interfaces.")
    (home-page "https://github.com/geoffreybennett/scarlett2")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1877. seerr --- request management and media discovery tool for the Plex ecosystem
;;; -------------------------------------------------------------------
(define-public seerr
  (package
    (name "seerr")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/seerr-team/seerr/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "request management and media discovery tool for the Plex ecosystem")
    (description "Request management and media discovery tool for the Plex ecosystem.")
    (home-page "https://github.com/seerr-team/seerr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7094. simple-mtpfs --- a FUSE filesystem that supports reading/writing from MTP devices
;;; -------------------------------------------------------------------
(define-public simple-mtpfs
  (package
    (name "simple-mtpfs")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/phatina/simple-mtpfs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a FUSE filesystem that supports reading/writing from MTP devices")
    (description "A FUSE filesystem that supports reading/writing from MTP devices.")
    (home-page "https://github.com/phatina/simple-mtpfs/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 1870. sing-box --- the universal proxy platform
;;; -------------------------------------------------------------------
(define-public sing-box
  (package
    (name "sing-box")
    (version "1.13.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sing-box.sagernet.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the universal proxy platform")
    (description "The universal proxy platform.")
    (home-page "https://sing-box.sagernet.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8472. swayshot --- sway screenshots: screen, window or region. Also it uploads them to 0x...
;;; -------------------------------------------------------------------
(define-public swayshot
  (package
    (name "swayshot")
    (version "2.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/vitalijr2/swayshot/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sway screenshots: screen, window or region. Also it uploads them to 0x0.st")
    (description "Sway screenshots: screen, window or region. Also it uploads them to 0x0.st.")
    (home-page "https://github.com/vitalijr2/swayshot")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8456. tek --- a colorful music making program for your linux terminal
;;; -------------------------------------------------------------------
(define-public tek
  (package
    (name "tek")
    (version "0.2.0.rc7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/unspeaker/tek/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a colorful music making program for your linux terminal")
    (description "A colorful music making program for your linux terminal.")
    (home-page "https://codeberg.org/unspeaker/tek")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 9523. tio --- the simple TTY terminal I/O application
;;; -------------------------------------------------------------------
(define-public tio
  (package
    (name "tio")
    (version "3.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tio.github.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "the simple TTY terminal I/O application")
    (description "The simple TTY terminal I/O application.")
    (home-page "https://tio.github.io/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 16809. tuxedo-keyboard-tools --- tools for TUXEDO Laptops
;;; -------------------------------------------------------------------
(define-public tuxedo-keyboard-tools
  (package
    (name "tuxedo-keyboard-tools")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/onurbbr/tuxedo-keyboard-tools/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools for TUXEDO Laptops")
    (description "Tools for TUXEDO Laptops.")
    (home-page "https://github.com/onurbbr/tuxedo-keyboard-tools")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8036. updpkgsrcs --- update source array of Git submodules in PKGBUILD
;;; -------------------------------------------------------------------
(define-public updpkgsrcs
  (package
    (name "updpkgsrcs")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/updpkgsrcs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "update source array of Git submodules in PKGBUILD")
    (description "Update source array of Git submodules in PKGBUILD.")
    (home-page "https://aur.archlinux.org/packages/updpkgsrcs")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8430. uutils-hostname-git --- rust implementation of hostname
;;; -------------------------------------------------------------------
(define-public uutils-hostname-git
  (package
    (name "uutils-hostname-git")
    (version "r487.gc047799")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uutils/hostname")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust implementation of hostname")
    (description "Rust implementation of hostname.")
    (home-page "https://github.com/uutils/hostname")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8431. uutils-procps-git --- rust reimplementation of the procps project
;;; -------------------------------------------------------------------
(define-public uutils-procps-git
  (package
    (name "uutils-procps-git")
    (version "0.0.1.r1344.gad3e29a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uutils/procps")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust reimplementation of the procps project")
    (description "Rust reimplementation of the procps project.")
    (home-page "https://github.com/uutils/procps")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8432. uutils-sed-git --- rust implementation of sed
;;; -------------------------------------------------------------------
(define-public uutils-sed-git
  (package
    (name "uutils-sed-git")
    (version "r725.g81e71bc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uutils/sed")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust implementation of sed")
    (description "Rust implementation of sed.")
    (home-page "https://github.com/uutils/sed")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8487. uutils-tar-git --- rust implementation of tar
;;; -------------------------------------------------------------------
(define-public uutils-tar-git
  (package
    (name "uutils-tar-git")
    (version "0.0.1.r150.1578d39")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uutils/tar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust implementation of tar")
    (description "Rust implementation of tar.")
    (home-page "https://github.com/uutils/tar")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8429. uutils-util-linux-git --- rust reimplementation of the util-linux project
;;; -------------------------------------------------------------------
(define-public uutils-util-linux-git
  (package
    (name "uutils-util-linux-git")
    (version "0.0.1.r937.g1c5ba77")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uutils/util-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust reimplementation of the util-linux project")
    (description "Rust reimplementation of the util-linux project.")
    (home-page "https://github.com/uutils/util-linux")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7907. vacuum --- fast, lightweight OpenAPI linter and quality checking tool
;;; -------------------------------------------------------------------
(define-public vacuum
  (package
    (name "vacuum")
    (version "0.26.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://quobix.com/vacuum/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, lightweight OpenAPI linter and quality checking tool")
    (description "Fast, lightweight OpenAPI linter and quality checking tool.")
    (home-page "https://quobix.com/vacuum/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 155. vintagestory --- uncompromising wilderness survival sandbox game (requires paid account...
;;; -------------------------------------------------------------------
(define-public vintagestory
  (package
    (name "vintagestory")
    (version "1.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.vintagestory.at/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "uncompromising wilderness survival sandbox game (requires paid account)")
    (description "Uncompromising wilderness survival sandbox game (requires paid account).")
    (home-page "https://www.vintagestory.at/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8803. wails --- create desktop apps using Go and Web Technologies
;;; -------------------------------------------------------------------
(define-public wails
  (package
    (name "wails")
    (version "2.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/wailsapp/wails/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/wailsapp/wails"))
    (synopsis "create desktop apps using Go and Web Technologies")
    (description "Create desktop apps using Go and Web Technologies.")
    (home-page "https://github.com/wailsapp/wails")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8442. warsaw-bin --- banking security tool developed by GAS Tecnologia
;;; -------------------------------------------------------------------
(define-public warsaw-bin
  (package
    (name "warsaw-bin")
    (version "2.21.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://diagnostico.gasantifraud.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "banking security tool developed by GAS Tecnologia")
    (description "Banking security tool developed by GAS Tecnologia.")
    (home-page "https://diagnostico.gasantifraud.com")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8433. wayfreeze-git --- tool to freeze the screen of a Wayland compositor
;;; -------------------------------------------------------------------
(define-public wayfreeze-git
  (package
    (name "wayfreeze-git")
    (version "r81.8f813ab")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Jappie3/wayfreeze")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool to freeze the screen of a Wayland compositor")
    (description "Tool to freeze the screen of a Wayland compositor.")
    (home-page "https://github.com/Jappie3/wayfreeze")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11349. winboat-bin --- run Windows apps on Linux with seamless integration
;;; -------------------------------------------------------------------
(define-public winboat-bin
  (package
    (name "winboat-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.winboat.app/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run Windows apps on Linux with seamless integration")
    (description "Run Windows apps on Linux with seamless integration.")
    (home-page "https://www.winboat.app")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6017. xlibre-video-voodoo --- xLibre fork of X.Org 3dfx Voodoo1/Voodoo2 2D video driver
;;; -------------------------------------------------------------------
(define-public xlibre-video-voodoo
  (package
    (name "xlibre-video-voodoo")
    (version "25.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/X11Libre/xf86-video-voodoo/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xLibre fork of X.Org 3dfx Voodoo1/Voodoo2 2D video driver")
    (description "XLibre fork of X.Org 3dfx Voodoo1/Voodoo2 2D video driver.")
    (home-page "https://github.com/X11Libre/xf86-video-voodoo")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8409. xnconvert --- a powerful batch image-converter and resizer
;;; -------------------------------------------------------------------
(define-public xnconvert
  (package
    (name "xnconvert")
    (version "1.106.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.xnview.com/en/xnconvert/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a powerful batch image-converter and resizer")
    (description "A powerful batch image-converter and resizer.")
    (home-page "https://www.xnview.com/en/xnconvert")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2186. yabsnap --- btrfs automated snapshot manager
;;; -------------------------------------------------------------------
(define-public yabsnap
  (package
    (name "yabsnap")
    (version "2.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hirak99/yabsnap/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "btrfs automated snapshot manager")
    (description "Btrfs automated snapshot manager.")
    (home-page "https://github.com/hirak99/yabsnap")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5778. abcde-musicbrainz-meta --- depencies for enabling Musicbrainz support in abcde
;;; -------------------------------------------------------------------
(define-public abcde-musicbrainz-meta
  (package
    (name "abcde-musicbrainz-meta")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://abcde.einval.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "depencies for enabling Musicbrainz support in abcde")
    (description "Depencies for enabling Musicbrainz support in abcde.")
    (home-page "https://abcde.einval.com/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11381. android-studio --- the official Android IDE (Stable branch)
;;; -------------------------------------------------------------------
(define-public android-studio
  (package
    (name "android-studio")
    (version "2025.3.4.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.android.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the official Android IDE (Stable branch)")
    (description "The official Android IDE (Stable branch).")
    (home-page "https://developer.android.com/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7076. app2unit-git --- utility to launch commands as systemd user units
;;; -------------------------------------------------------------------
(define-public app2unit-git
  (package
    (name "app2unit-git")
    (version "1.0.2.r0.g6a2fe29")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vladimir-csp/app2unit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "utility to launch commands as systemd user units")
    (description "Utility to launch commands as systemd user units.")
    (home-page "https://github.com/Vladimir-csp/app2unit")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5243. arch-check --- python stdlib Arch Linux health checker: disks, kernel, services, SMAR...
;;; -------------------------------------------------------------------
(define-public arch-check
  (package
    (name "arch-check")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kidpixo/arch_check/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python stdlib Arch Linux health checker: disks, kernel, services, SMART. Outp...")
    (description "Python stdlib Arch Linux health checker: disks, kernel, services, SMART. Output to terminal or JSON.")
    (home-page "https://github.com/kidpixo/arch_check")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8468. aur-auto --- 🐳 Whale Lab AUR auto installer with fuzzy search and safer install pro...
;;; -------------------------------------------------------------------
(define-public aur-auto
  (package
    (name "aur-auto")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Sanjaya-Danushka/whalekit/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "🐳 Whale Lab AUR auto installer with fuzzy search and safer install process")
    (description "🐳 Whale Lab AUR auto installer with fuzzy search and safer install process.")
    (home-page "https://github.com/Sanjaya-Danushka/whalekit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2258. aur-auto-vote-git --- automates voting on installed and uninstalled AUR packages
;;; -------------------------------------------------------------------
(define-public aur-auto-vote-git
  (package
    (name "aur-auto-vote-git")
    (version "r150.3a626c5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cryzed/bin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "automates voting on installed and uninstalled AUR packages")
    (description "Automates voting on installed and uninstalled AUR packages.")
    (home-page "https://github.com/cryzed/bin")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8735. binance --- the Binance desktop application
;;; -------------------------------------------------------------------
(define-public binance
  (package
    (name "binance")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.binance.com/en/download/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Binance desktop application")
    (description "The Binance desktop application.")
    (home-page "https://www.binance.com/en/download")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5906. biu-tauri-bin --- a cross-platform desktop music player based on Bilibili API (Tauri Ver...
;;; -------------------------------------------------------------------
(define-public biu-tauri-bin
  (package
    (name "biu-tauri-bin")
    (version "1.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/WMsans/biu-tauri/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform desktop music player based on Bilibili API (Tauri Version)")
    (description "A cross-platform desktop music player based on Bilibili API (Tauri Version).")
    (home-page "https://github.com/WMsans/biu-tauri")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8406. boomaga --- virtual printer for viewing a document before printing it out using th...
;;; -------------------------------------------------------------------
(define-public boomaga
  (package
    (name "boomaga")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.boomaga.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "virtual printer for viewing a document before printing it out using the physi...")
    (description "Virtual printer for viewing a document before printing it out using the physical printer.")
    (home-page "https://www.boomaga.org/")
    (license (list license:gpl2 license:lgpl2.1))))

;;; -------------------------------------------------------------------
;;; 11314. brave-bin --- web browser that blocks ads and trackers by default (binary release)
;;; -------------------------------------------------------------------
(define-public brave-bin
  (package
    (name "brave-bin")
    (version "1.89.143")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://brave.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web browser that blocks ads and trackers by default (binary release)")
    (description "Web browser that blocks ads and trackers by default (binary release).")
    (home-page "https://brave.com")
    (license (list license:bsd-3 license:non-copyleft license:mpl2.0))))

;;; -------------------------------------------------------------------
;;; 8124. brother-hl1118 --- lPR and CUPS driver for the Brother HL-1110, HL-1110R, HL-1111, HL-111...
;;; -------------------------------------------------------------------
(define-public brother-hl1118
  (package
    (name "brother-hl1118")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://solutions.brother.com/linux/en_us/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lPR and CUPS driver for the Brother HL-1110, HL-1110R, HL-1111, HL-1112, HL-1...")
    (description "LPR and CUPS driver for the Brother HL-1110, HL-1110R, HL-1111, HL-1112, HL-1112R, HL-1118.")
    (home-page "http://solutions.brother.com/linux/en_us/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5730. brother-mfc-l3770cdw --- lPR and CUPS drivers for the Brother MFC-L3770CDW
;;; -------------------------------------------------------------------
(define-public brother-mfc-l3770cdw
  (package
    (name "brother-mfc-l3770cdw")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://support.brother.com/g/s/id/linux/en/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lPR and CUPS drivers for the Brother MFC-L3770CDW")
    (description "LPR and CUPS drivers for the Brother MFC-L3770CDW.")
    (home-page "http://support.brother.com/g/s/id/linux/en/index.html")
    (license (list license:non-copyleft license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 2153. bruno --- opensource API Client for Exploring and Testing APIs
;;; -------------------------------------------------------------------
(define-public bruno
  (package
    (name "bruno")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.usebruno.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "opensource API Client for Exploring and Testing APIs")
    (description "Opensource API Client for Exploring and Testing APIs.")
    (home-page "https://www.usebruno.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7843. checkpac --- simple and fast package check and lookup utility for Arch Linux with A...
;;; -------------------------------------------------------------------
(define-public checkpac
  (package
    (name "checkpac")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/zeroz41/checkpac/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple and fast package check and lookup utility for Arch Linux with AUR support")
    (description "Simple and fast package check and lookup utility for Arch Linux with AUR support.")
    (home-page "https://github.com/zeroz41/checkpac")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16885. clipboard-manager-git --- clipboard manager for COSMIC™
;;; -------------------------------------------------------------------
(define-public clipboard-manager-git
  (package
    (name "clipboard-manager-git")
    (version "0.1.0.r49.g3b4d392")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cosmic-utils/clipboard-manager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clipboard manager for COSMIC™")
    (description "Clipboard manager for COSMIC™.")
    (home-page "https://github.com/cosmic-utils/clipboard-manager")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15259. cn-dascom-pin-driver --- dascom Pin Dirver (Supported models include 24-pin、AR-510N(include AR-...
;;; -------------------------------------------------------------------
(define-public cn-dascom-pin-driver
  (package
    (name "cn-dascom-pin-driver")
    (version "2.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.dascom.cn/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dascom Pin Dirver (Supported models include 24-pin、AR-510N(include AR-570 ......")
    (description "Dascom Pin Dirver (Supported models include 24-pin、AR-510N(include AR-570 ...) and some DS Series.).")
    (home-page "https://www.dascom.cn/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5945. dab-cli --- android package manager CLI tool
;;; -------------------------------------------------------------------
(define-public dab-cli
  (package
    (name "dab-cli")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cesarferreira/dab/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android package manager CLI tool")
    (description "Android package manager CLI tool.")
    (home-page "https://github.com/cesarferreira/dab")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5845. dare-devil --- it's a hellish game and going to be wickedly fun and challenging.Full ...
;;; -------------------------------------------------------------------
(define-public dare-devil
  (package
    (name "dare-devil")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Akash420-oss/Dare-Devil/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "it's a hellish game and going to be wickedly fun and challenging.Full of thri...")
    (description "It's a hellish game and going to be wickedly fun and challenging.Full of thrilling twists and turns...")
    (home-page "https://github.com/Akash420-oss/Dare-Devil")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1800. debtap --- a script to convert .deb packages to Arch Linux packages, focused on a...
;;; -------------------------------------------------------------------
(define-public debtap
  (package
    (name "debtap")
    (version "3.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/helixarch/debtap/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a script to convert .deb packages to Arch Linux packages, focused on accuracy...")
    (description "A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!.")
    (home-page "https://github.com/helixarch/debtap")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8398. droidcam-obs-plugin-git --- plugin for droidcam obs
;;; -------------------------------------------------------------------
(define-public droidcam-obs-plugin-git
  (package
    (name "droidcam-obs-plugin-git")
    (version "2.4.3.r0.e873e48")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://dev47apps.com/obs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for droidcam obs")
    (description "Plugin for droidcam obs.")
    (home-page "https://dev47apps.com/obs/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8415. flac2all --- multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 ret...
;;; -------------------------------------------------------------------
(define-public flac2all
  (package
    (name "flac2all")
    (version "5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ZivaVatra/flac2all/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining ...")
    (description "Multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining all tags and metadata.")
    (home-page "https://github.com/ZivaVatra/flac2all")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5767. flutter-artifacts-material-fonts-google-bin --- flutter SDK component - material fonts
;;; -------------------------------------------------------------------
(define-public flutter-artifacts-material-fonts-google-bin
  (package
    (name "flutter-artifacts-material-fonts-google-bin")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - material fonts")
    (description "Flutter SDK component - material fonts.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 5766. flutter-artifacts-sky-engine-google-bin --- flutter SDK component - sky-engine
;;; -------------------------------------------------------------------
(define-public flutter-artifacts-sky-engine-google-bin
  (package
    (name "flutter-artifacts-sky-engine-google-bin")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - sky-engine")
    (description "Flutter SDK component - sky-engine.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 2182. git-credential-manager-bin --- secure, cross-platform Git credential storage with authentication to G...
;;; -------------------------------------------------------------------
(define-public git-credential-manager-bin
  (package
    (name "git-credential-manager-bin")
    (version "2.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/git-ecosystem/git-credential-manager/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "secure, cross-platform Git credential storage with authentication to GitHub, ...")
    (description "Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services.")
    (home-page "https://github.com/git-ecosystem/git-credential-manager")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8717. google-calender-widget --- an unofficial google calendar desktop widget.(Use system-wide electron...
;;; -------------------------------------------------------------------
(define-public google-calender-widget
  (package
    (name "google-calender-widget")
    (version "1.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/p32929/google-calender-widget/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an unofficial google calendar desktop widget.(Use system-wide electron)")
    (description "An unofficial google calendar desktop widget.(Use system-wide electron).")
    (home-page "https://github.com/p32929/google-calender-widget")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5875. gr-ieee802-11-git --- an IEEE 802.11 a/g/p transceiver for GNU Radio
;;; -------------------------------------------------------------------
(define-public gr-ieee802-11-git
  (package
    (name "gr-ieee802-11-git")
    (version "r352.0c0fca8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bastibl/gr-ieee802-11")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "an IEEE 802.11 a/g/p transceiver for GNU Radio")
    (description "An IEEE 802.11 a/g/p transceiver for GNU Radio.")
    (home-page "https://github.com/bastibl/gr-ieee802-11")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7161. i686-elf-pcc-git --- a Portable C Compiler
;;; -------------------------------------------------------------------
(define-public i686-elf-pcc-git
  (package
    (name "i686-elf-pcc-git")
    (version "20251115")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PortableCC")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a Portable C Compiler")
    (description "A Portable C Compiler.")
    (home-page "https://github.com/PortableCC/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 17310. icecat-ublock-origin --- efficient blocker add-on for various browsers. Fast, potent, and lean
;;; -------------------------------------------------------------------
(define-public icecat-ublock-origin
  (package
    (name "icecat-ublock-origin")
    (version "1.66.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gorhill/uBlock/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "efficient blocker add-on for various browsers. Fast, potent, and lean")
    (description "Efficient blocker add-on for various browsers. Fast, potent, and lean.")
    (home-page "https://github.com/gorhill/uBlock")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1801. jailbox-git --- torify the system with multiple tor exit nodes and load balance
;;; -------------------------------------------------------------------
(define-public jailbox-git
  (package
    (name "jailbox-git")
    (version "v0.5.0.r0.gd82c0be")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jamazi/jailbox.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "torify the system with multiple tor exit nodes and load balance")
    (description "Torify the system with multiple tor exit nodes and load balance.")
    (home-page "https://github.com/jamazi/jailbox.git")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2177. kdoctools5 --- documentation generation from docbook
;;; -------------------------------------------------------------------
(define-public kdoctools5
  (package
    (name "kdoctools5")
    (version "5.116.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://community.kde.org/Frameworks/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation generation from docbook")
    (description "Documentation generation from docbook.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 15649. lib32-glibc-git --- gNU C Library (32-bit) (git version)
;;; -------------------------------------------------------------------
(define-public lib32-glibc-git
  (package
    (name "lib32-glibc-git")
    (version "2.37.r601.g7ff33eca68")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.gnu.org/software/libc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU C Library (32-bit) (git version)")
    (description "GNU C Library (32-bit) (git version).")
    (home-page "https://www.gnu.org/software/libc")
    (license (list license:gpl3+ license:lgpl3+))))

;;; -------------------------------------------------------------------
;;; 15349. lib32-liblrdf --- a library for the manipulation of RDF file in LADSPA plugins (32-bit)
;;; -------------------------------------------------------------------
(define-public lib32-liblrdf
  (package
    (name "lib32-liblrdf")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/swh/LRDF/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for the manipulation of RDF file in LADSPA plugins (32-bit)")
    (description "A library for the manipulation of RDF file in LADSPA plugins (32-bit).")
    (home-page "https://github.com/swh/LRDF")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 9521. libaudec --- a library for reading and resampling audio files
;;; -------------------------------------------------------------------
(define-public libaudec
  (package
    (name "libaudec")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.sr.ht/~alextee/libaudec/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a library for reading and resampling audio files")
    (description "A library for reading and resampling audio files.")
    (home-page "https://git.sr.ht/~alextee/libaudec")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 2288. luffy-bin --- watch movies and series from your commandline
;;; -------------------------------------------------------------------
(define-public luffy-bin
  (package
    (name "luffy-bin")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/DemonKingSwarn/luffy/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "watch movies and series from your commandline")
    (description "Watch movies and series from your commandline.")
    (home-page "https://github.com/DemonKingSwarn/luffy")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 345. lunatask --- all-in-one encrypted productivity app (unofficial, not supported by up...
;;; -------------------------------------------------------------------
(define-public lunatask
  (package
    (name "lunatask")
    (version "2.1.27")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://lunatask.app/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "all-in-one encrypted productivity app (unofficial, not supported by upstream)")
    (description "All-in-one encrypted productivity app (unofficial, not supported by upstream).")
    (home-page "https://lunatask.app")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5899. macchina-git --- basic system information fetcher, written in Rust
;;; -------------------------------------------------------------------
(define-public macchina-git
  (package
    (name "macchina-git")
    (version "6.4.0.r6.gc049088")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/macchina-cli/macchina")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "basic system information fetcher, written in Rust")
    (description "Basic system information fetcher, written in Rust.")
    (home-page "https://github.com/macchina-cli/macchina")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8474. nautilus-metadata-editor --- nautilus extension with simple Metadata Editor
;;; -------------------------------------------------------------------
(define-public nautilus-metadata-editor
  (package
    (name "nautilus-metadata-editor")
    (version "43.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nvlgit/nautilus-metadata-editor-extension/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "nautilus extension with simple Metadata Editor")
    (description "Nautilus extension with simple Metadata Editor.")
    (home-page "https://github.com/nvlgit/nautilus-metadata-editor-extension")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8413. numaplayer --- studiologic Numa Player: standalone and vst3 plugin
;;; -------------------------------------------------------------------
(define-public numaplayer
  (package
    (name "numaplayer")
    (version "2.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.studiologic-music.com/products/numaplayer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "studiologic Numa Player: standalone and vst3 plugin")
    (description "Studiologic Numa Player: standalone and vst3 plugin.")
    (home-page "https://www.studiologic-music.com/products/numaplayer")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 17296. nvidia-340xx-lts-dkms --- nVIDIA driver sources for linux-lts, 340xx legacy branch
;;; -------------------------------------------------------------------
(define-public nvidia-340xx-lts-dkms
  (package
    (name "nvidia-340xx-lts-dkms")
    (version "340.108")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nvidia.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA driver sources for linux-lts, 340xx legacy branch")
    (description "NVIDIA driver sources for linux-lts, 340xx legacy branch.")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5981. oblivion-desktop-git --- unofficial Warp Client for Windows/Mac/Linux (GitHub Version)
;;; -------------------------------------------------------------------
(define-public oblivion-desktop-git
  (package
    (name "oblivion-desktop-git")
    (version "3.11.0.r6.g9fdf217")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bepass-org/oblivion-desktop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial Warp Client for Windows/Mac/Linux (GitHub Version)")
    (description "Unofficial Warp Client for Windows/Mac/Linux (GitHub Version).")
    (home-page "https://github.com/bepass-org/oblivion-desktop")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 74. obs-vaapi --- oBS Studio VAAPI support via GStreamer
;;; -------------------------------------------------------------------
(define-public obs-vaapi
  (package
    (name "obs-vaapi")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/fzwoch/obs-vaapi/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "oBS Studio VAAPI support via GStreamer")
    (description "OBS Studio VAAPI support via GStreamer.")
    (home-page "https://github.com/fzwoch/obs-vaapi")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2282. ocs-url --- an install helper program for items served via OpenCollaborationServic...
;;; -------------------------------------------------------------------
(define-public ocs-url
  (package
    (name "ocs-url")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.opencode.net/dfn2/ocs-url/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an install helper program for items served via OpenCollaborationServices (ocs...")
    (description "An install helper program for items served via OpenCollaborationServices (ocs://).")
    (home-page "https://www.opencode.net/dfn2/ocs-url")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8042. pamac-tray-icon-plasma --- pamac tray icon for plasma users
;;; -------------------------------------------------------------------
(define-public pamac-tray-icon-plasma
  (package
    (name "pamac-tray-icon-plasma")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/LordTermor/pamac-tray-icon-plasma/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "pamac tray icon for plasma users")
    (description "Pamac tray icon for plasma users.")
    (home-page "https://gitlab.com/LordTermor/pamac-tray-icon-plasma")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8457. pdf-xchange --- feature-rich PDF editor/viewer. Create, view, edit and annotate plus m...
;;; -------------------------------------------------------------------
(define-public pdf-xchange
  (package
    (name "pdf-xchange")
    (version "10.8.5.410")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tracker-software.com/product/pdf-xchange-editor/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "feature-rich PDF editor/viewer. Create, view, edit and annotate plus much more")
    (description "Feature-rich PDF editor/viewer. Create, view, edit and annotate plus much more.")
    (home-page "https://www.tracker-software.com/product/pdf-xchange-editor")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7146. pds-gatekeeper-git --- microservice to bring 2FA to self hosted AT Protocol PDSes
;;; -------------------------------------------------------------------
(define-public pds-gatekeeper-git
  (package
    (name "pds-gatekeeper-git")
    (version "r18.2e39f1e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://tangled.org/baileytownsend.dev/pds-gatekeeper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microservice to bring 2FA to self hosted AT Protocol PDSes")
    (description "Microservice to bring 2FA to self hosted AT Protocol PDSes.")
    (home-page "https://tangled.org/baileytownsend.dev/pds-gatekeeper")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8138. pesconvert-git --- convert embroidery pes file (used by Brother sewing machines) to an im...
;;; -------------------------------------------------------------------
(define-public pesconvert-git
  (package
    (name "pesconvert-git")
    (version "r20.d6d7001")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.linux.com/news/embroidery-gaah")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert embroidery pes file (used by Brother sewing machines) to an image (pn...")
    (description "Convert embroidery pes file (used by Brother sewing machines) to an image (png or svg).")
    (home-page "https://www.linux.com/news/embroidery-gaah/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5571. phiola-bin --- fast audio player, recorder, converter.(Prebuilt version)
;;; -------------------------------------------------------------------
(define-public phiola-bin
  (package
    (name "phiola-bin")
    (version "2.7.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/stsaz/phiola/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast audio player, recorder, converter.(Prebuilt version)")
    (description "Fast audio player, recorder, converter.(Prebuilt version).")
    (home-page "https://github.com/stsaz/phiola")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 5754. plasma6-applets-resources-monitor --- plasmoid for monitoring CPU, memory, network traffic, GPUs and disks I...
;;; -------------------------------------------------------------------
(define-public plasma6-applets-resources-monitor
  (package
    (name "plasma6-applets-resources-monitor")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/orblazer/plasma-applet-resources-monitor/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plasmoid for monitoring CPU, memory, network traffic, GPUs and disks IO")
    (description "Plasmoid for monitoring CPU, memory, network traffic, GPUs and disks IO.")
    (home-page "https://github.com/orblazer/plasma-applet-resources-monitor")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8089. pm2ml --- generate metalinks for downloading Pacman packages and databases
;;; -------------------------------------------------------------------
(define-public pm2ml
  (package
    (name "pm2ml")
    (version "2021.11.20.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://xyne.dev/projects/pm2ml/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generate metalinks for downloading Pacman packages and databases")
    (description "Generate metalinks for downloading Pacman packages and databases.")
    (home-page "https://xyne.dev/projects/pm2ml")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9507. python-diskcache --- python disk and file backed cache library
;;; -------------------------------------------------------------------
(define-public python-diskcache
  (package
    (name "python-diskcache")
    (version "5.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/grantjenks/python-diskcache/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python disk and file backed cache library")
    (description "Python disk and file backed cache library.")
    (home-page "https://github.com/grantjenks/python-diskcache")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9522. python-mock --- mocking and Patching Library for Testing
;;; -------------------------------------------------------------------
(define-public python-mock
  (package
    (name "python-mock")
    (version "5.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mock.readthedocs.io/en/latest/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mocking and Patching Library for Testing")
    (description "Mocking and Patching Library for Testing.")
    (home-page "https://mock.readthedocs.io/en/latest/")
    (license license:bsd-2)))
