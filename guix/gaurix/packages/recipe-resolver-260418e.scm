;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418e
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (100):
;;;     1.  atlassify-bin (copy-build-system, v3.7.0, MIT)
;;;     2.  hula-bin (copy-build-system, v3.0.9, Apache-2.0)
;;;     3.  taratormusic-bin (copy-build-system, v1.8.4, LicenseRef-unknown)
;;;     4.  tracecompass-bin (copy-build-system, v11.2.0, EPL)
;;;     5.  dxtractor-bin (copy-build-system, v1.0.0, Apache)
;;;     6.  mrpack-install-bin (copy-build-system, v0.21.0.beta, MIT)
;;;     7.  texlab-bin (copy-build-system, v5.25.1, GPL-3.0)
;;;     8.  lutgen-studio-bin (copy-build-system, v0.3.0, MIT)
;;;     9.  overlayed-bin (copy-build-system, v0.6.2, AGPL-3.0)
;;;    10.  wnr-bin (copy-build-system, v1.32.0, MPL-2.0)
;;;    11.  webeep-sync-bin (copy-build-system, v1.0.3, GPL-3.0-only)
;;;    12.  stuffit-bin (copy-build-system, v5.2.0.611, unknown)
;;;    13.  jabref-bin (copy-build-system, v5.15, MIT)
;;;    14.  voicevox-bin (copy-build-system, v0.25.1, LGPL-3.0-only)
;;;    15.  openwebstart-bin (copy-build-system, v1.13.0, GPL2)
;;;    16.  github-actions-bin (copy-build-system, v2.333.1, MIT)
;;;    17.  notesnook-electron-bin (copy-build-system, v3.3.14, GPL-3.0-or-later)
;;;    18.  alist-bin (copy-build-system, v3.59.0, MIT)
;;;    19.  qtvlm-bin (copy-build-system, v5.12.14, unknown)
;;;    20.  alist-desktop-bin (copy-build-system, v3.57.0, AGPL-3.0-only)
;;;    21.  warpgui-bin (copy-build-system, v2.5, GPL-3.0-only)
;;;    22.  trios-bin (copy-build-system, v1.4.1, GPL3)
;;;    23.  open-stage-control-bin (copy-build-system, v1.29.5, GPL3)
;;;    24.  pmcl-bin (copy-build-system, v3.6.dev_24646f9, GPL-3.0)
;;;    25.  deno-canary-bin (copy-build-system, v2.3.7.f7817964, MIT)
;;;    26.  dockle-bin (copy-build-system, v0.4.15, AGPL)
;;;    27.  ape-bin (copy-build-system, v1.10, ISC)
;;;    28.  kram-bin (copy-build-system, v1.7.30, MIT)
;;;    29.  quickenv-bin (copy-build-system, v0.4.4, MIT)
;;;    30.  skm-bin (copy-build-system, v0.8.7, MIT)
;;;    31.  grafana-alloy-bin (copy-build-system, v1.15.1, Apache)
;;;    32.  k3s-bin (copy-build-system, v1.35.3+k3s1, Apache)
;;;    33.  clipse-wayland-bin (copy-build-system, v1.2.1, MIT)
;;;    34.  clipse-x11-bin (copy-build-system, v1.2.1, MIT)
;;;    35.  music-discord-rpc-bin (copy-build-system, v0.6.3, MIT)
;;;    36.  gnome-shell-extension-pano-bin (copy-build-system, v23.alpha5, GPL-2.0)
;;;    37.  grist-desktop-bin (copy-build-system, v0.3.10, Apache)
;;;    38.  oss-browser-bin (copy-build-system, v1.19.0, Apache License 2.0)
;;;    39.  novelwriter-bin (copy-build-system, v2.8.2, GPL-3.0-only)
;;;    40.  algermusicplayer-bin (copy-build-system, v5.1.0, Apache-2.0)
;;;    41.  telegraf-bin (copy-build-system, v1.38.2, MIT)
;;;    42.  moneydance-bin (copy-build-system, v2024.4, LicenseRef-custom)
;;;    43.  wtfutil-bin (copy-build-system, v0.49.1, MPL-2.0)
;;;    44.  simple-live-app-bin (copy-build-system, v1.8.6.10806, GPL3)
;;;    45.  supercronic-bin (copy-build-system, v0.2.44, MIT)
;;;    46.  quiet-desktop-bin (copy-build-system, v6.3.0, GPL-3.0-only)
;;;    47.  yandex-cloud-bin (copy-build-system, v0.187.0, unknown)
;;;    48.  serenity-bin (copy-build-system, v1.1.0beta.3, custom:GPL-3.0-or-later WITH name use or association addition)
;;;    49.  digital-logic-sim-bin (copy-build-system, vv2.1.6, MIT)
;;;    50.  upfile-bin (copy-build-system, v1.1.0, MIT)
;;;    51.  openmv-ide-bin (copy-build-system, v4.7.0, MIT)
;;;    52.  autobrr-bin (copy-build-system, v1.76.0, None)
;;;    53.  refract-bin (copy-build-system, v1.4.2, WTFPL)
;;;    54.  trezor-bridge-bin (copy-build-system, v2.0.30, LGPL3)
;;;    55.  electron36-bin (copy-build-system, v36.9.5, LicenseRef-custom)
;;;    56.  universal-sierra-compiler-bin (copy-build-system, v2.7.0, MIT)
;;;    57.  zat-bin (copy-build-system, v1.8.0, MIT)
;;;    58.  flow-browser-bin (copy-build-system, v0.12.0, GPL-3.0-or-later)
;;;    59.  scarb-bin (copy-build-system, v2.16.1, MIT)
;;;    60.  check-symlinks-bin (copy-build-system, v0.5.3, MIT)
;;;    61.  tattoy-bin (copy-build-system, v0.1.8, MIT)
;;;    62.  scylla-bin (copy-build-system, v6.2.3, AGPL)
;;;    63.  onekeepass-bin (copy-build-system, v0.18.0, GPL-3.0-only)
;;;    64.  taproot-assets-bin (copy-build-system, v0.6.0, MIT)
;;;    65.  insomnia-electron-bin (copy-build-system, v12.4.0, Apache-2.0)
;;;    66.  fx-cast-bin (copy-build-system, v0.3.0, MIT)
;;;    67.  fztea-bin (copy-build-system, v0.6.4, MIT)
;;;    68.  fulcrum-bin (copy-build-system, v2.1.0, GPL3)
;;;    69.  timer-rs-bin (copy-build-system, v0.11.0, GPL)
;;;    70.  gamemaker-beta-bin (copy-build-system, v2024.1400.5.1043, custom)
;;;    71.  jdk17-jetbrains-bin (copy-build-system, v17.0.14b1367.22, GPL2)
;;;    72.  jdk11-jetbrains-bin (copy-build-system, v11.0.16b2043.64, GPL2)
;;;    73.  ddev-bin (copy-build-system, v1.25.1, Apache 2)
;;;    74.  cortex-cpp-bin (copy-build-system, v1.0.14, Apache-2.0)
;;;    75.  rustowl-bin (copy-build-system, v0.3.4, MPL-2.0)
;;;    76.  clash-nyanpasu-bin (copy-build-system, v1.6.1, GPL3)
;;;    77.  easyeda-pro-bin (copy-build-system, v2.2.47.7, LicenseRef-EasyEDA-Proprietary)
;;;    78.  valentina-studio-bin (copy-build-system, v16.5.0, custom)
;;;    79.  gourou-bin (copy-build-system, v0.8.7, LGPL-3.0-only)
;;;    80.  wora-bin (copy-build-system, v0.3.6, MIT)
;;;    81.  gdlauncher-carbon-bin (copy-build-system, v2.0.30, ARR)
;;;    82.  typora-free-bin (copy-build-system, v1.9.3, custom:"Copyright (c) 2015 Abner Lee All Rights Reserved.")
;;;    83.  doomtools-bin (copy-build-system, v2026.03.27.012840705, MIT)
;;;    84.  go-cqhttp-bin (copy-build-system, v1.2.0, AGPL-3.0-only)
;;;    85.  onekey-wallet-bin (copy-build-system, v6.1.0, Apache-2.0)
;;;    86.  aaaaxy-bin (copy-build-system, v1.7.50, Apache-2.0)
;;;    87.  frigoligo-bin (copy-build-system, v2.4.0, MIT)
;;;    88.  bettercrewlink-bin (copy-build-system, v3.1.4, GPL3)
;;;    89.  seashell-bin (copy-build-system, v0.0.2, AGPLv3)
;;;    90.  osmosis-bin (copy-build-system, v0.49.2, LicenseRef-Public-Domain)
;;;    91.  grlx-bin (copy-build-system, v1.0.5, 0BSD)
;;;    92.  mediago-bin (copy-build-system, v3.0.1, MIT)
;;;    93.  simplearchiver-bin (copy-build-system, v2.7.5, ISC)
;;;    94.  tokentool-bin (copy-build-system, v2.2.2, AGPL-3.0-or-later)
;;;    95.  ytdl-sub-bin (copy-build-system, v2026.04.13.post1, GPL3)
;;;    96.  netease-cloud-music-gtk-bin (copy-build-system, v2.5.2, GPL-3.0-only)
;;;    97.  meru-bin (copy-build-system, v3.44.4, MIT)
;;;    98.  project-graph-bin (copy-build-system, v2.11.14, MIT)
;;;    99.  fabric-ai-bin (copy-build-system, v1.4.375, MIT)
;;;   100.  drawio-bin (copy-build-system, v29.6.10, Apache)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages java)
  #:export (
            atlassify-bin
            hula-bin
            taratormusic-bin
            tracecompass-bin
            dxtractor-bin
            mrpack-install-bin
            texlab-bin
            lutgen-studio-bin
            overlayed-bin
            wnr-bin
            webeep-sync-bin
            stuffit-bin
            jabref-bin
            voicevox-bin
            openwebstart-bin
            github-actions-bin
            notesnook-electron-bin
            alist-bin
            qtvlm-bin
            alist-desktop-bin
            warpgui-bin
            trios-bin
            open-stage-control-bin
            pmcl-bin
            deno-canary-bin
            dockle-bin
            ape-bin
            kram-bin
            quickenv-bin
            skm-bin
            grafana-alloy-bin
            k3s-bin
            clipse-wayland-bin
            clipse-x11-bin
            music-discord-rpc-bin
            gnome-shell-extension-pano-bin
            grist-desktop-bin
            oss-browser-bin
            novelwriter-bin
            algermusicplayer-bin
            telegraf-bin
            moneydance-bin
            wtfutil-bin
            simple-live-app-bin
            supercronic-bin
            quiet-desktop-bin
            yandex-cloud-bin
            serenity-bin
            digital-logic-sim-bin
            upfile-bin
            openmv-ide-bin
            autobrr-bin
            refract-bin
            trezor-bridge-bin
            electron36-bin
            universal-sierra-compiler-bin
            zat-bin
            flow-browser-bin
            scarb-bin
            check-symlinks-bin
            tattoy-bin
            scylla-bin
            onekeepass-bin
            taproot-assets-bin
            insomnia-electron-bin
            fx-cast-bin
            fztea-bin
            fulcrum-bin
            timer-rs-bin
            gamemaker-beta-bin
            jdk17-jetbrains-bin
            jdk11-jetbrains-bin
            ddev-bin
            cortex-cpp-bin
            rustowl-bin
            clash-nyanpasu-bin
            easyeda-pro-bin
            valentina-studio-bin
            gourou-bin
            wora-bin
            gdlauncher-carbon-bin
            typora-free-bin
            doomtools-bin
            go-cqhttp-bin
            onekey-wallet-bin
            aaaaxy-bin
            frigoligo-bin
            bettercrewlink-bin
            seashell-bin
            osmosis-bin
            grlx-bin
            mediago-bin
            simplearchiver-bin
            tokentool-bin
            ytdl-sub-bin
            netease-cloud-music-gtk-bin
            meru-bin
            project-graph-bin
            fabric-ai-bin
            drawio-bin
            ))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (prebuilt binaries)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. atlassify-bin --- Atlassian notifications on your menu bar
;;; -------------------------------------------------------------------
(define-public atlassify-bin
  (package
    (name "atlassify-bin")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "atlassify-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/atlassify-bin"))))
    (home-page "https://atlassify.io/")
    (synopsis "Atlassian notifications on your menu bar")
    (description "Atlassian notifications on your menu bar.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. hula-bin --- 🍀A desktop instant messaging app built on Tauri+Vue3 (not ju
;;; -------------------------------------------------------------------
(define-public hula-bin
  (package
    (name "hula-bin")
    (version "3.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "hula-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hula-bin"))))
    (home-page "https://hulaspark.com/")
    (synopsis "🍀A desktop instant messaging app built on Tauri+Vue3 (not just instant mess")
    (description "A desktop instant messaging app built on Tauri+Vue3 (not just
instant messaging)(Prebuilt version)一个基于 Tauri、Vite 5、Vue 3 和
TypeScript 构建的即时通讯系统.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. taratormusic-bin --- a music player application with playlist support and Discord
;;; -------------------------------------------------------------------
(define-public taratormusic-bin
  (package
    (name "taratormusic-bin")
    (version "1.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Victiniiiii/TaratorMusic/releases/download/v"
                    version "/taratormusic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/taratormusic-bin"))))
    (home-page "https://github.com/Victiniiiii/TaratorMusic")
    (synopsis "a music player application with playlist support and Discord integration")
    (description "A music player application with playlist support and Discord
integration.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 4. tracecompass-bin --- Eclipse Trace Compass is an open source application to solve
;;; -------------------------------------------------------------------
(define-public tracecompass-bin
  (package
    (name "tracecompass-bin")
    (version "11.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tracecompass-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tracecompass-bin"))))
    (home-page "https://eclipse.dev/tracecompass/")
    (synopsis "Eclipse Trace Compass is an open source application to solve performance an")
    (description "Eclipse Trace Compass is an open source application to solve
performance and reliability issues by reading and analyzing traces
and logs of a system.")
    (license license:epl1.0)))

;;; -------------------------------------------------------------------
;;; 5. dxtractor-bin --- collect DXVK Cache files from your system
;;; -------------------------------------------------------------------
(define-public dxtractor-bin
  (package
    (name "dxtractor-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NastyGamer/DXVKache/releases/download/v"
                    version "/dxtractor-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dxtractor-bin"))))
    (home-page "https://github.com/NastyGamer/DXVKache")
    (synopsis "collect DXVK Cache files from your system")
    (description "Collect DXVK Cache files from your system.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. mrpack-install-bin --- Modrinth Modpack server deployment
;;; -------------------------------------------------------------------
(define-public mrpack-install-bin
  (package
    (name "mrpack-install-bin")
    (version "0.21.0.beta")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nothub/mrpack-install/releases/download/v"
                    version "/mrpack-install-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mrpack-install-bin"))))
    (home-page "https://github.com/nothub/mrpack-install")
    (synopsis "Modrinth Modpack server deployment")
    (description "Modrinth Modpack server deployment.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. texlab-bin --- a cross-platform implementation of the Language Server Proto
;;; -------------------------------------------------------------------
(define-public texlab-bin
  (package
    (name "texlab-bin")
    (version "5.25.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/latex-lsp/texlab/releases/download/v"
                    version "/texlab-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/texlab-bin"))))
    (home-page "https://github.com/latex-lsp/texlab")
    (synopsis "a cross-platform implementation of the Language Server Protocol for LaTeX")
    (description "A cross-platform implementation of the Language Server Protocol for
LaTeX.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. lutgen-studio-bin --- Offical GUI for Lutgen, the best way to apply popular colors
;;; -------------------------------------------------------------------
(define-public lutgen-studio-bin
  (package
    (name "lutgen-studio-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ozwaldorf/lutgen-rs/releases/download/v"
                    version "/lutgen-studio-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lutgen-studio-bin"))))
    (home-page "https://github.com/ozwaldorf/lutgen-rs")
    (synopsis "Offical GUI for Lutgen, the best way to apply popular colorschemes to any i")
    (description "Offical GUI for Lutgen, the best way to apply popular colorschemes
to any image or wallpaper!")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. overlayed-bin --- a modern, open-source, and free voice chat overlay for Disco
;;; -------------------------------------------------------------------
(define-public overlayed-bin
  (package
    (name "overlayed-bin")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "overlayed-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/overlayed-bin"))))
    (home-page "https://overlayed.dev")
    (synopsis "a modern, open-source, and free voice chat overlay for Discord (bin version)")
    (description "A modern, open-source, and free voice chat overlay for Discord (bin
version).")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 10. wnr-bin --- Work/Rest Timer. Stricter. Prettier. More features
;;; -------------------------------------------------------------------
(define-public wnr-bin
  (package
    (name "wnr-bin")
    (version "1.32.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wnr-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wnr-bin"))))
    (home-page "https://getwnr.com/")
    (synopsis "Work/Rest Timer. Stricter. Prettier. More features")
    (description "Work/Rest Timer. Stricter. Prettier. More features.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 11. webeep-sync-bin --- Keep all your WeBeep files synced on your computer!
;;; -------------------------------------------------------------------
(define-public webeep-sync-bin
  (package
    (name "webeep-sync-bin")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/toto04/webeep-sync/releases/download/v"
                    version "/webeep-sync-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/webeep-sync-bin"))))
    (home-page "https://github.com/toto04/webeep-sync")
    (synopsis "Keep all your WeBeep files synced on your computer!")
    (description "Keep all your WeBeep files synced on your computer!")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. stuffit-bin --- Decompress .SIT archives for System 7 era Macintoshes, by Al
;;; -------------------------------------------------------------------
(define-public stuffit-bin
  (package
    (name "stuffit-bin")
    (version "5.2.0.611")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "stuffit-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stuffit-bin"))))
    (home-page "http://www.aladdinsys.com")
    (synopsis "Decompress .SIT archives for System 7 era Macintoshes, by Aladdin Systems, ")
    (description "Decompress .SIT archives for System 7 era Macintoshes, by Aladdin
Systems, Inc., from 2001.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 13. jabref-bin --- gUI frontend for BibTeX, written in Java; bin version which 
;;; -------------------------------------------------------------------
(define-public jabref-bin
  (package
    (name "jabref-bin")
    (version "5.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "jabref-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jabref-bin"))))
    (home-page "https://www.jabref.org/")
    (synopsis "gUI frontend for BibTeX, written in Java; bin version which bundles the Jav")
    (description "GUI frontend for BibTeX, written in Java; bin version which bundles
the Java runtime.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. voicevox-bin --- a text-to-speech software
;;; -------------------------------------------------------------------
(define-public voicevox-bin
  (package
    (name "voicevox-bin")
    (version "0.25.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/VOICEVOX/voicevox/releases/download/v"
                    version "/voicevox-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/voicevox-bin"))))
    (home-page "https://github.com/VOICEVOX/voicevox")
    (synopsis "a text-to-speech software")
    (description "A text-to-speech software.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 15. openwebstart-bin --- an open source reimplementation of the Java Web Start techno
;;; -------------------------------------------------------------------
(define-public openwebstart-bin
  (package
    (name "openwebstart-bin")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "openwebstart-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openwebstart-bin"))))
    (home-page "https://openwebstart.com/")
    (synopsis "an open source reimplementation of the Java Web Start technology")
    (description "An open source reimplementation of the Java Web Start technology.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 16. github-actions-bin --- GitHub Actions self-hosted runner tools
;;; -------------------------------------------------------------------
(define-public github-actions-bin
  (package
    (name "github-actions-bin")
    (version "2.333.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/actions/runner/releases/download/v"
                    version "/github-actions-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/github-actions-bin"))))
    (home-page "https://github.com/actions/runner")
    (synopsis "GitHub Actions self-hosted runner tools")
    (description "GitHub Actions self-hosted runner tools.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. notesnook-electron-bin --- a fully open source & end-to-end encrypted note taking alter
;;; -------------------------------------------------------------------
(define-public notesnook-electron-bin
  (package
    (name "notesnook-electron-bin")
    (version "3.3.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "notesnook-electron-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/notesnook-electron-bin"))))
    (home-page "https://notesnook.com/")
    (synopsis "a fully open source & end-to-end encrypted note taking alternative to Evern")
    (description "A fully open source & end-to-end encrypted note taking alternative
to Evernote.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 18. alist-bin --- another file list program that supports multiple storage
;;; -------------------------------------------------------------------
(define-public alist-bin
  (package
    (name "alist-bin")
    (version "3.59.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AlistGo/alist/releases/download/v"
                    version "/alist-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/alist-bin"))))
    (home-page "https://github.com/AlistGo/alist")
    (synopsis "another file list program that supports multiple storage")
    (description "Another file list program that supports multiple storage.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. qtvlm-bin --- Navigation and Weather Routing software
;;; -------------------------------------------------------------------
(define-public qtvlm-bin
  (package
    (name "qtvlm-bin")
    (version "5.12.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "qtvlm-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/qtvlm-bin"))))
    (home-page "https://www.meltemus.com/index.php/")
    (synopsis "Navigation and Weather Routing software")
    (description "Navigation and Weather Routing software.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 20. alist-desktop-bin --- file list program that supports multiple storage
;;; -------------------------------------------------------------------
(define-public alist-desktop-bin
  (package
    (name "alist-desktop-bin")
    (version "3.57.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AlistGo/desktop-release/releases/download/v"
                    version "/alist-desktop-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/alist-desktop-bin"))))
    (home-page "https://github.com/AlistGo/desktop-release")
    (synopsis "file list program that supports multiple storage")
    (description "File list program that supports multiple storage.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 21. warpgui-bin --- gUI for Cloudflare ™ WARP
;;; -------------------------------------------------------------------
(define-public warpgui-bin
  (package
    (name "warpgui-bin")
    (version "2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AKotov-dev/warpgui/releases/download/v"
                    version "/warpgui-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/warpgui-bin"))))
    (home-page "https://github.com/AKotov-dev/warpgui")
    (synopsis "gUI for Cloudflare ™ WARP")
    (description "GUI for Cloudflare ™ WARP.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. trios-bin --- Starsector mod manager & toolkit
;;; -------------------------------------------------------------------
(define-public trios-bin
  (package
    (name "trios-bin")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wispborne/TriOS/releases/download/v"
                    version "/trios-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/trios-bin"))))
    (home-page "https://github.com/wispborne/TriOS")
    (synopsis "Starsector mod manager & toolkit")
    (description "Starsector mod manager & toolkit.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. open-stage-control-bin --- a libre desktop OSC bi-directional control surface applicati
;;; -------------------------------------------------------------------
(define-public open-stage-control-bin
  (package
    (name "open-stage-control-bin")
    (version "1.29.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "open-stage-control-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/open-stage-control-bin"))))
    (home-page "http://openstagecontrol.ammd.net/")
    (synopsis "a libre desktop OSC bi-directional control surface application")
    (description "A libre desktop OSC bi-directional control surface application.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 24. pmcl-bin --- Play! Minecraft Launcher: A free Minecraft JE Launcher
;;; -------------------------------------------------------------------
(define-public pmcl-bin
  (package
    (name "pmcl-bin")
    (version "3.6.dev-24646f9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "pmcl-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pmcl-bin"))))
    (home-page "https://pmcl.fun")
    (synopsis "Play! Minecraft Launcher: A free Minecraft JE Launcher")
    (description "Play! Minecraft Launcher: A free Minecraft JE Launcher.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 25. deno-canary-bin --- a secure runtime for JavaScript and TypeScript, Canary build
;;; -------------------------------------------------------------------
(define-public deno-canary-bin
  (package
    (name "deno-canary-bin")
    (version "2.3.7.f7817964")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "deno-canary-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/deno-canary-bin"))))
    (home-page "https://dl.deno.land/")
    (synopsis "a secure runtime for JavaScript and TypeScript, Canary build")
    (description "A secure runtime for JavaScript and TypeScript, Canary build.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. dockle-bin --- container Image Linter for Security, Helping build the Best-
;;; -------------------------------------------------------------------
(define-public dockle-bin
  (package
    (name "dockle-bin")
    (version "0.4.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/goodwithtech/dockle/releases/download/v"
                    version "/dockle-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dockle-bin"))))
    (home-page "https://github.com/goodwithtech/dockle")
    (synopsis "container Image Linter for Security, Helping build the Best-Practice Docker")
    (description "Container Image Linter for Security, Helping build the Best-Practice
Docker Image, Easy to start.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 27. ape-bin --- actually portable executable loader
;;; -------------------------------------------------------------------
(define-public ape-bin
  (package
    (name "ape-bin")
    (version "1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ape-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ape-bin"))))
    (home-page "https://justine.lol/cosmopolitan/index.html")
    (synopsis "actually portable executable loader")
    (description "actually portable executable loader.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 28. kram-bin --- Encode/decode/info to KTX/KTX2/DDS files with LDR/HDR and BC
;;; -------------------------------------------------------------------
(define-public kram-bin
  (package
    (name "kram-bin")
    (version "1.7.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alecazam/kram/releases/download/v"
                    version "/kram-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kram-bin"))))
    (home-page "https://github.com/alecazam/kram")
    (synopsis "Encode/decode/info to KTX/KTX2/DDS files with LDR/HDR and BC/ASTC/ETC2")
    (description "Encode/decode/info to KTX/KTX2/DDS files with LDR/HDR and
BC/ASTC/ETC2.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. quickenv-bin --- an unintrusive environment manager
;;; -------------------------------------------------------------------
(define-public quickenv-bin
  (package
    (name "quickenv-bin")
    (version "0.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/untitaker/quickenv/releases/download/v"
                    version "/quickenv-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/quickenv-bin"))))
    (home-page "https://github.com/untitaker/quickenv")
    (synopsis "an unintrusive environment manager")
    (description "An unintrusive environment manager.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. skm-bin --- a simple and powerful SSH keys manager
;;; -------------------------------------------------------------------
(define-public skm-bin
  (package
    (name "skm-bin")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "skm-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/skm-bin"))))
    (home-page "https://timothyye.github.io/skm")
    (synopsis "a simple and powerful SSH keys manager")
    (description "A simple and powerful SSH keys manager.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 31. grafana-alloy-bin --- OpenTelemetry Collector distribution with programmable pipel
;;; -------------------------------------------------------------------
(define-public grafana-alloy-bin
  (package
    (name "grafana-alloy-bin")
    (version "1.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/grafana/alloy/releases/download/v"
                    version "/grafana-alloy-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/grafana-alloy-bin"))))
    (home-page "https://github.com/grafana/alloy")
    (synopsis "OpenTelemetry Collector distribution with programmable pipelines")
    (description "OpenTelemetry Collector distribution with programmable pipelines.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 32. k3s-bin --- lightweight Kubernetes
;;; -------------------------------------------------------------------
(define-public k3s-bin
  (package
    (name "k3s-bin")
    (version "1.35.3+k3s1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "k3s-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/k3s-bin"))))
    (home-page "https://k3s.io")
    (synopsis "lightweight Kubernetes")
    (description "Lightweight Kubernetes.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 33. clipse-wayland-bin --- a configurable TUI clipboard manager for Unix (Wayland backe
;;; -------------------------------------------------------------------
(define-public clipse-wayland-bin
  (package
    (name "clipse-wayland-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/savedra1/clipse/releases/download/v"
                    version "/clipse-wayland-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/clipse-wayland-bin"))))
    (home-page "https://github.com/savedra1/clipse")
    (synopsis "a configurable TUI clipboard manager for Unix (Wayland backend)")
    (description "A configurable TUI clipboard manager for Unix (Wayland backend).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 34. clipse-x11-bin --- a configurable TUI clipboard manager for Unix (X11 backend)
;;; -------------------------------------------------------------------
(define-public clipse-x11-bin
  (package
    (name "clipse-x11-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/savedra1/clipse/releases/download/v"
                    version "/clipse-x11-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/clipse-x11-bin"))))
    (home-page "https://github.com/savedra1/clipse")
    (synopsis "a configurable TUI clipboard manager for Unix (X11 backend)")
    (description "A configurable TUI clipboard manager for Unix (X11 backend).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 35. music-discord-rpc-bin --- cross-platform Discord rich presence for music with album co
;;; -------------------------------------------------------------------
(define-public music-discord-rpc-bin
  (package
    (name "music-discord-rpc-bin")
    (version "0.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/patryk-ku/music-discord-rpc/releases/download/v"
                    version "/music-discord-rpc-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/music-discord-rpc-bin"))))
    (home-page "https://github.com/patryk-ku/music-discord-rpc")
    (synopsis "cross-platform Discord rich presence for music with album cover and progres")
    (description "Cross-platform Discord rich presence for music with album cover and
progress bar support.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. gnome-shell-extension-pano-bin --- Next-gen Clipboard Manager for Gnome Shell
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-pano-bin
  (package
    (name "gnome-shell-extension-pano-bin")
    (version "23.alpha5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oae/gnome-shell-pano/releases/download/v"
                    version "/gnome-shell-extension-pano-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell-extension-pano-bin"))))
    (home-page "https://github.com/oae/gnome-shell-pano")
    (synopsis "Next-gen Clipboard Manager for Gnome Shell")
    (description "Next-gen Clipboard Manager for Gnome Shell.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 37. grist-desktop-bin --- desktop Grist, packaged with Electron. Grist is a modern rel
;;; -------------------------------------------------------------------
(define-public grist-desktop-bin
  (package
    (name "grist-desktop-bin")
    (version "0.3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gristlabs/grist-desktop/releases/download/v"
                    version "/grist-desktop-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/grist-desktop-bin"))))
    (home-page "https://github.com/gristlabs/grist-desktop")
    (synopsis "desktop Grist, packaged with Electron. Grist is a modern relational spreads")
    (description "Desktop Grist, packaged with Electron. Grist is a modern relational
spreadsheet. It combines the flexibility of a spreadsheet with the
robustness of a database.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 38. oss-browser-bin --- ossbrowser是阿里云官方提供的OSS图形化管理工具，提供类似Windows资源管理器的功能
;;; -------------------------------------------------------------------
(define-public oss-browser-bin
  (package
    (name "oss-browser-bin")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aliyun/oss-browser/releases/download/v"
                    version "/oss-browser-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/oss-browser-bin"))))
    (home-page "https://github.com/aliyun/oss-browser")
    (synopsis "ossbrowser是阿里云官方提供的OSS图形化管理工具，提供类似Windows资源管理器的功能")
    (description "ossbrowser是阿里云官方提供的OSS图形化管理工具，提供类似Windows资源管理器的功能.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 39. novelwriter-bin --- a markdown-like document editor for writing novels
;;; -------------------------------------------------------------------
(define-public novelwriter-bin
  (package
    (name "novelwriter-bin")
    (version "2.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "novelwriter-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/novelwriter-bin"))))
    (home-page "https://novelwriter.io/")
    (synopsis "a markdown-like document editor for writing novels")
    (description "A markdown-like document editor for writing novels.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 40. algermusicplayer-bin --- an music player based on Electron, TypeScript, and Vue 3.(Pr
;;; -------------------------------------------------------------------
(define-public algermusicplayer-bin
  (package
    (name "algermusicplayer-bin")
    (version "5.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "algermusicplayer-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/algermusicplayer-bin"))))
    (home-page "http://mc.alger.fun/")
    (synopsis "an music player based on Electron, TypeScript, and Vue 3.(Prebuilt version")
    (description "An music player based on Electron, TypeScript, and Vue 3.(Prebuilt
version.Use system-wide electron)支持网易云音乐.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 41. telegraf-bin --- an open source agent for collecting metrics and data on the 
;;; -------------------------------------------------------------------
(define-public telegraf-bin
  (package
    (name "telegraf-bin")
    (version "1.38.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/influxdata/telegraf/releases/download/v"
                    version "/telegraf-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/telegraf-bin"))))
    (home-page "https://github.com/influxdata/telegraf")
    (synopsis "an open source agent for collecting metrics and data on the system; Binary ")
    (description "An open source agent for collecting metrics and data on the system;
Binary release.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 42. moneydance-bin --- an easy to use and full-featured personal finance app that d
;;; -------------------------------------------------------------------
(define-public moneydance-bin
  (package
    (name "moneydance-bin")
    (version "2024.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "moneydance-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/moneydance-bin"))))
    (home-page "https://infinitekind.com/moneydance")
    (synopsis "an easy to use and full-featured personal finance app that doesn't compromi")
    (description "An easy to use and full-featured personal finance app that doesn't
compromise your privacy.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 43. wtfutil-bin --- personal information dashboard for your terminal
;;; -------------------------------------------------------------------
(define-public wtfutil-bin
  (package
    (name "wtfutil-bin")
    (version "0.49.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wtfutil-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wtfutil-bin"))))
    (home-page "https://wtfutil.com")
    (synopsis "personal information dashboard for your terminal")
    (description "Personal information dashboard for your terminal.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 44. simple-live-app-bin --- 简简单单的看直播
;;; -------------------------------------------------------------------
(define-public simple-live-app-bin
  (package
    (name "simple-live-app-bin")
    (version "1.8.6.10806")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xiaoyaocz/dart_simple_live/releases/download/v"
                    version "/simple-live-app-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/simple-live-app-bin"))))
    (home-page "https://github.com/xiaoyaocz/dart_simple_live")
    (synopsis "简简单单的看直播")
    (description "Simple Live App is 简简单单的看直播.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 45. supercronic-bin --- a crontab-compatible job runner, designed specifically to ru
;;; -------------------------------------------------------------------
(define-public supercronic-bin
  (package
    (name "supercronic-bin")
    (version "0.2.44")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aptible/supercronic/releases/download/v"
                    version "/supercronic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/supercronic-bin"))))
    (home-page "https://github.com/aptible/supercronic")
    (synopsis "a crontab-compatible job runner, designed specifically to run in containers")
    (description "A crontab-compatible job runner, designed specifically to run in
containers (Pre-compiled version).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. quiet-desktop-bin --- a private, p2p alternative to Slack and Discord built on Tor
;;; -------------------------------------------------------------------
(define-public quiet-desktop-bin
  (package
    (name "quiet-desktop-bin")
    (version "6.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TryQuiet/quiet/releases/download/v"
                    version "/quiet-desktop-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/quiet-desktop-bin"))))
    (home-page "https://github.com/TryQuiet/quiet")
    (synopsis "a private, p2p alternative to Slack and Discord built on Tor & IPFS")
    (description "A private, p2p alternative to Slack and Discord built on Tor & IPFS.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 47. yandex-cloud-bin --- Yandex.Cloud CLI
;;; -------------------------------------------------------------------
(define-public yandex-cloud-bin
  (package
    (name "yandex-cloud-bin")
    (version "0.187.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "yandex-cloud-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/yandex-cloud-bin"))))
    (home-page "https://cloud.yandex.ru/docs/cli/")
    (synopsis "Yandex.Cloud CLI")
    (description "Yandex Cloud is yandex.cloud cli.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 48. serenity-bin --- the configuration generator for sing-box
;;; -------------------------------------------------------------------
(define-public serenity-bin
  (package
    (name "serenity-bin")
    (version "1.1.0beta.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SagerNet/serenity/releases/download/v"
                    version "/serenity-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/serenity-bin"))))
    (home-page "https://github.com/SagerNet/serenity")
    (synopsis "the configuration generator for sing-box")
    (description "The configuration generator for sing-box.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 49. digital-logic-sim-bin --- the logic simulation used and developed by Sebastian Lague
;;; -------------------------------------------------------------------
(define-public digital-logic-sim-bin
  (package
    (name "digital-logic-sim-bin")
    (version "v2.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SebLague/Digital-Logic-Sim/releases/download/v"
                    version "/digital-logic-sim-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/digital-logic-sim-bin"))))
    (home-page "https://github.com/SebLague/Digital-Logic-Sim")
    (synopsis "the logic simulation used and developed by Sebastian Lague")
    (description "The logic simulation used and developed by Sebastian Lague.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 50. upfile-bin --- a CLI tool to manage and sync shared configuration files acr
;;; -------------------------------------------------------------------
(define-public upfile-bin
  (package
    (name "upfile-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/skewb1k/upfile/releases/download/v"
                    version "/upfile-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/upfile-bin"))))
    (home-page "https://github.com/skewb1k/upfile")
    (synopsis "a CLI tool to manage and sync shared configuration files across projects")
    (description "A CLI tool to manage and sync shared configuration files across
projects.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 51. openmv-ide-bin --- QtCreator based OpenMV IDE
;;; -------------------------------------------------------------------
(define-public openmv-ide-bin
  (package
    (name "openmv-ide-bin")
    (version "4.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/openmv/openmv-ide/releases/download/v"
                    version "/openmv-ide-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openmv-ide-bin"))))
    (home-page "https://github.com/openmv/openmv-ide")
    (synopsis "QtCreator based OpenMV IDE")
    (description "QtCreator based OpenMV IDE.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 52. autobrr-bin --- a modern download automation tool for torrents
;;; -------------------------------------------------------------------
(define-public autobrr-bin
  (package
    (name "autobrr-bin")
    (version "1.76.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/autobrr/autobrr/releases/download/v"
                    version "/autobrr-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/autobrr-bin"))))
    (home-page "https://github.com/autobrr/autobrr")
    (synopsis "a modern download automation tool for torrents")
    (description "A modern download automation tool for torrents.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 53. refract-bin --- Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources
;;; -------------------------------------------------------------------
(define-public refract-bin
  (package
    (name "refract-bin")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Blobfolio/refract/releases/download/v"
                    version "/refract-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/refract-bin"))))
    (home-page "https://github.com/Blobfolio/refract")
    (synopsis "Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources")
    (description "Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources.")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 54. trezor-bridge-bin --- communication daemon for TREZOR
;;; -------------------------------------------------------------------
(define-public trezor-bridge-bin
  (package
    (name "trezor-bridge-bin")
    (version "2.0.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "trezor-bridge-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/trezor-bridge-bin"))))
    (home-page "https://trezor.io/")
    (synopsis "communication daemon for TREZOR")
    (description "Communication daemon for TREZOR.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 55. electron36-bin --- build cross platform desktop apps with web technologies — pr
;;; -------------------------------------------------------------------
(define-public electron36-bin
  (package
    (name "electron36-bin")
    (version "36.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "electron36-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/electron36-bin"))))
    (home-page "https://electronjs.org")
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description "Build cross platform desktop apps with web technologies — prebuilt.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 56. universal-sierra-compiler-bin --- compiler for any ever-existing Sierra version to CASM
;;; -------------------------------------------------------------------
(define-public universal-sierra-compiler-bin
  (package
    (name "universal-sierra-compiler-bin")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/software-mansion/universal-sierra-compiler/releases/download/v"
                    version "/universal-sierra-compiler-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/universal-sierra-compiler-bin"))))
    (home-page "https://github.com/software-mansion/universal-sierra-compiler")
    (synopsis "compiler for any ever-existing Sierra version to CASM")
    (description "Compiler for any ever-existing Sierra version to CASM.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 57. zat-bin --- Syntax highlighting cat like utility
;;; -------------------------------------------------------------------
(define-public zat-bin
  (package
    (name "zat-bin")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neurocyte/zat/releases/download/v"
                    version "/zat-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zat-bin"))))
    (home-page "https://github.com/neurocyte/zat")
    (synopsis "Syntax highlighting cat like utility")
    (description "Syntax highlighting cat like utility.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 58. flow-browser-bin --- modern tabbed web browser with Chrome extension support
;;; -------------------------------------------------------------------
(define-public flow-browser-bin
  (package
    (name "flow-browser-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MultiboxLabs/flow-browser/releases/download/v"
                    version "/flow-browser-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/flow-browser-bin"))))
    (home-page "https://github.com/MultiboxLabs/flow-browser")
    (synopsis "modern tabbed web browser with Chrome extension support")
    (description "Modern tabbed web browser with Chrome extension support.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 59. scarb-bin --- the Cairo package manager
;;; -------------------------------------------------------------------
(define-public scarb-bin
  (package
    (name "scarb-bin")
    (version "2.16.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "scarb-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/scarb-bin"))))
    (home-page "https://docs.swmansion.com/scarb")
    (synopsis "the Cairo package manager")
    (description "The Cairo package manager.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 60. check-symlinks-bin --- check for broken symlinks
;;; -------------------------------------------------------------------
(define-public check-symlinks-bin
  (package
    (name "check-symlinks-bin")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jmelahman/check-symlinks/releases/download/v"
                    version "/check-symlinks-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/check-symlinks-bin"))))
    (home-page "https://github.com/jmelahman/check-symlinks")
    (synopsis "check for broken symlinks")
    (description "Check for broken symlinks.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 61. tattoy-bin --- Text-based terminal compositor
;;; -------------------------------------------------------------------
(define-public tattoy-bin
  (package
    (name "tattoy-bin")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tattoy-org/tattoy/releases/download/v"
                    version "/tattoy-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tattoy-bin"))))
    (home-page "https://github.com/tattoy-org/tattoy")
    (synopsis "Text-based terminal compositor")
    (description "Text-based terminal compositor.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 62. scylla-bin --- the real-time big data database that is API-compatible with 
;;; -------------------------------------------------------------------
(define-public scylla-bin
  (package
    (name "scylla-bin")
    (version "6.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "scylla-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/scylla-bin"))))
    (home-page "http://www.scylladb.com/")
    (synopsis "the real-time big data database that is API-compatible with Apache Cassandr")
    (description "The real-time big data database that is API-compatible with Apache
Cassandra and Amazon DynamoDB.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 63. onekeepass-bin --- a secure password manager for macOS,Linux and Windows platfo
;;; -------------------------------------------------------------------
(define-public onekeepass-bin
  (package
    (name "onekeepass-bin")
    (version "0.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OneKeePass/desktop/releases/download/v"
                    version "/onekeepass-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/onekeepass-bin"))))
    (home-page "https://github.com/OneKeePass/desktop")
    (synopsis "a secure password manager for macOS,Linux and Windows platforms")
    (description "A secure password manager for macOS,Linux and Windows platforms.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 64. taproot-assets-bin --- a layer 1 daemon, for the Taproot Assets Protocol specificat
;;; -------------------------------------------------------------------
(define-public taproot-assets-bin
  (package
    (name "taproot-assets-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lightninglabs/taproot-assets/releases/download/v"
                    version "/taproot-assets-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/taproot-assets-bin"))))
    (home-page "https://github.com/lightninglabs/taproot-assets")
    (synopsis "a layer 1 daemon, for the Taproot Assets Protocol specification, written in")
    (description "A layer 1 daemon, for the Taproot Assets Protocol specification,
written in Go (golang).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 65. insomnia-electron-bin --- cross-platform HTTP and GraphQL Client
;;; -------------------------------------------------------------------
(define-public insomnia-electron-bin
  (package
    (name "insomnia-electron-bin")
    (version "12.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Kong/insomnia/releases/download/v"
                    version "/insomnia-electron-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/insomnia-electron-bin"))))
    (home-page "https://github.com/Kong/insomnia")
    (synopsis "cross-platform HTTP and GraphQL Client")
    (description "Cross-platform HTTP and GraphQL Client.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 66. fx-cast-bin --- Implementation of the Google Cast Chrome Sender SDK within F
;;; -------------------------------------------------------------------
(define-public fx-cast-bin
  (package
    (name "fx-cast-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "fx_cast-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fx-cast-bin"))))
    (home-page "https://hensm.github.io/fx_cast/")
    (synopsis "Implementation of the Google Cast Chrome Sender SDK within Firefox")
    (description "Implementation of the Google Cast Chrome Sender SDK within Firefox.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 67. fztea-bin --- TUI to interact with your flipper zero
;;; -------------------------------------------------------------------
(define-public fztea-bin
  (package
    (name "fztea-bin")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "fztea-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fztea-bin"))))
    (home-page "https://jon4hz.io")
    (synopsis "TUI to interact with your flipper zero")
    (description "TUI to interact with your flipper zero.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 68. fulcrum-bin --- a fast & nimble SPV server for Bitcoin Cash - binary version
;;; -------------------------------------------------------------------
(define-public fulcrum-bin
  (package
    (name "fulcrum-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cculianu/Fulcrum/releases/download/v"
                    version "/fulcrum-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fulcrum-bin"))))
    (home-page "https://github.com/cculianu/Fulcrum")
    (synopsis "a fast & nimble SPV server for Bitcoin Cash - binary version")
    (description "A fast & nimble SPV server for Bitcoin Cash - binary version.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 69. timer-rs-bin --- timer application
;;; -------------------------------------------------------------------
(define-public timer-rs-bin
  (package
    (name "timer-rs-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pando85/timer/releases/download/v"
                    version "/timer-rs-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/timer-rs-bin"))))
    (home-page "https://github.com/pando85/timer")
    (synopsis "timer application")
    (description "Timer Rs is timer application.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 70. gamemaker-beta-bin --- Make a game with GameMaker, the best free video game engine.
;;; -------------------------------------------------------------------
(define-public gamemaker-beta-bin
  (package
    (name "gamemaker-beta-bin")
    (version "2024.1400.5.1043")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gamemaker-beta-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gamemaker-beta-bin"))))
    (home-page "https://gamemaker.io")
    (synopsis "Make a game with GameMaker, the best free video game engine. Perfect for be")
    (description "Make a game with GameMaker, the best free video game engine. Perfect
for beginners and professionals.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 71. jdk17-jetbrains-bin --- OpenJDK development kit with some fixes and enhancements by 
;;; -------------------------------------------------------------------
(define-public jdk17-jetbrains-bin
  (package
    (name "jdk17-jetbrains-bin")
    (version "17.0.14b1367.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JetBrains/JetBrainsRuntime/releases/download/v"
                    version "/jdk17-jetbrains-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jdk17-jetbrains-bin"))))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime/releases")
    (synopsis "OpenJDK development kit with some fixes and enhancements by JetBrains")
    (description "OpenJDK development kit with some fixes and enhancements by
JetBrains.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 72. jdk11-jetbrains-bin --- OpenJDK development kit with some fixes and enhancements by 
;;; -------------------------------------------------------------------
(define-public jdk11-jetbrains-bin
  (package
    (name "jdk11-jetbrains-bin")
    (version "11.0.16b2043.64")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JetBrains/JetBrainsRuntime/releases/download/v"
                    version "/jdk11-jetbrains-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jdk11-jetbrains-bin"))))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime/releases")
    (synopsis "OpenJDK development kit with some fixes and enhancements by JetBrains")
    (description "OpenJDK development kit with some fixes and enhancements by
JetBrains.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 73. ddev-bin --- DDEV: a local web development environment
;;; -------------------------------------------------------------------
(define-public ddev-bin
  (package
    (name "ddev-bin")
    (version "1.25.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ddev/ddev/releases/download/v"
                    version "/ddev-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ddev-bin"))))
    (home-page "https://github.com/ddev/ddev")
    (synopsis "DDEV: a local web development environment")
    (description "DDEV: a local web development environment.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 74. cortex-cpp-bin --- local AI API Platform
;;; -------------------------------------------------------------------
(define-public cortex-cpp-bin
  (package
    (name "cortex-cpp-bin")
    (version "1.0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/menloresearch/cortex.cpp/releases/download/v"
                    version "/cortex.cpp-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cortex-cpp-bin"))))
    (home-page "https://github.com/menloresearch/cortex.cpp")
    (synopsis "local AI API Platform")
    (description "Local AI API Platform.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 75. rustowl-bin --- Visualize Ownership and Lifetimes in Rust
;;; -------------------------------------------------------------------
(define-public rustowl-bin
  (package
    (name "rustowl-bin")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cordx56/rustowl/releases/download/v"
                    version "/rustowl-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rustowl-bin"))))
    (home-page "https://github.com/cordx56/rustowl")
    (synopsis "Visualize Ownership and Lifetimes in Rust")
    (description "Visualize Ownership and Lifetimes in Rust.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 76. clash-nyanpasu-bin --- a Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​
;;; -------------------------------------------------------------------
(define-public clash-nyanpasu-bin
  (package
    (name "clash-nyanpasu-bin")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/v"
                    version "/clash-nyanpasu-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/clash-nyanpasu-bin"))))
    (home-page "https://github.com/LibNyanpasu/clash-nyanpasu")
    (synopsis "a Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​")
    (description "A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 77. easyeda-pro-bin --- EasyEDA Professional Edition
;;; -------------------------------------------------------------------
(define-public easyeda-pro-bin
  (package
    (name "easyeda-pro-bin")
    (version "2.2.47.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "easyeda-pro-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/easyeda-pro-bin"))))
    (home-page "https://pro.easyeda.com/")
    (synopsis "EasyEDA Professional Edition")
    (description "EasyEDA Professional Edition.")
    (license (license:non-copyleft "file://LICENSE" "Proprietary"))))

;;; -------------------------------------------------------------------
;;; 78. valentina-studio-bin --- Create, administer, query and explore Valentina DB, MySQL, M
;;; -------------------------------------------------------------------
(define-public valentina-studio-bin
  (package
    (name "valentina-studio-bin")
    (version "16.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "valentina-studio-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/valentina-studio-bin"))))
    (home-page "http://www.valentina-db.com")
    (synopsis "Create, administer, query and explore Valentina DB, MySQL, MariaDB, Postgre")
    (description "Create, administer, query and explore Valentina DB, MySQL, MariaDB,
PostgreSQL and SQLite databases for FREE.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 79. gourou-bin --- download and decrypt adobe encrypted (acsm) pdf and epub fil
;;; -------------------------------------------------------------------
(define-public gourou-bin
  (package
    (name "gourou-bin")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gourou-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gourou-bin"))))
    (home-page "https://forge.soutade.fr/soutade/libgourou")
    (synopsis "download and decrypt adobe encrypted (acsm) pdf and epub files")
    (description "Download and decrypt adobe encrypted (acsm) pdf and epub files.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 80. wora-bin --- 🎧 A beautiful player for audiophiles
;;; -------------------------------------------------------------------
(define-public wora-bin
  (package
    (name "wora-bin")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wora-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wora-bin"))))
    (home-page "https://wora.app/")
    (synopsis "🎧 A beautiful player for audiophiles")
    (description "A beautiful player for audiophiles.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 81. gdlauncher-carbon-bin --- GDLauncher Carbon is the new version of the simple, yet powe
;;; -------------------------------------------------------------------
(define-public gdlauncher-carbon-bin
  (package
    (name "gdlauncher-carbon-bin")
    (version "2.0.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gdlauncher-carbon-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gdlauncher-carbon-bin"))))
    (home-page "https://gdlauncher.com")
    (synopsis "GDLauncher Carbon is the new version of the simple, yet powerful Minecraft ")
    (description "GDLauncher Carbon is the new version of the simple, yet powerful
Minecraft custom launcher with a strong focus on the user
experience.")
    (license (license:non-copyleft "file://LICENSE" "All rights reserved"))))

;;; -------------------------------------------------------------------
;;; 82. typora-free-bin --- a minimal markdown editor and reader(free version)
;;; -------------------------------------------------------------------
(define-public typora-free-bin
  (package
    (name "typora-free-bin")
    (version "1.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "typora-free-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/typora-free-bin"))))
    (home-page "https://typora.io/")
    (synopsis "a minimal markdown editor and reader(free version)")
    (description "A minimal markdown editor and reader(free version).")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 83. doomtools-bin --- set of command-line utilities for building projects or for o
;;; -------------------------------------------------------------------
(define-public doomtools-bin
  (package
    (name "doomtools-bin")
    (version "2026.03.27.012840705")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "doomtools-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/doomtools-bin"))))
    (home-page "https://mtrop.github.io/DoomTools/")
    (synopsis "set of command-line utilities for building projects or for other things rel")
    (description "Set of command-line utilities for building projects or for other
things related to Doom Engine games.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 84. go-cqhttp-bin --- Lightweight, native cross-platform implementation of cqhttp 
;;; -------------------------------------------------------------------
(define-public go-cqhttp-bin
  (package
    (name "go-cqhttp-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Mrs4s/go-cqhttp/releases/download/v"
                    version "/go-cqhttp-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/go-cqhttp-bin"))))
    (home-page "https://github.com/Mrs4s/go-cqhttp/releases")
    (synopsis "Lightweight, native cross-platform implementation of cqhttp in Golang")
    (description "Lightweight, native cross-platform implementation of cqhttp in
Golang.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 85. onekey-wallet-bin --- Secure, open source and community driven crypto wallet runs 
;;; -------------------------------------------------------------------
(define-public onekey-wallet-bin
  (package
    (name "onekey-wallet-bin")
    (version "6.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "onekey-wallet-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/onekey-wallet-bin"))))
    (home-page "https://onekey.so/")
    (synopsis "Secure, open source and community driven crypto wallet runs on all platform")
    (description "Secure, open source and community driven crypto wallet runs on all
platforms and trusted by millions.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 86. aaaaxy-bin --- a nonlinear puzzle platformer taking place in impossible spa
;;; -------------------------------------------------------------------
(define-public aaaaxy-bin
  (package
    (name "aaaaxy-bin")
    (version "1.7.50")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "aaaaxy-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/aaaaxy-bin"))))
    (home-page "https://divverent.github.io/aaaaxy/")
    (synopsis "a nonlinear puzzle platformer taking place in impossible spaces")
    (description "A nonlinear puzzle platformer taking place in impossible spaces.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 87. frigoligo-bin --- an universal wallabag client made with Flutter
;;; -------------------------------------------------------------------
(define-public frigoligo-bin
  (package
    (name "frigoligo-bin")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/casimir/frigoligo/releases/download/v"
                    version "/frigoligo-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/frigoligo-bin"))))
    (home-page "https://github.com/casimir/frigoligo")
    (synopsis "an universal wallabag client made with Flutter")
    (description "An universal wallabag client made with Flutter.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 88. bettercrewlink-bin --- Free, open, Among Us Proximity Chat
;;; -------------------------------------------------------------------
(define-public bettercrewlink-bin
  (package
    (name "bettercrewlink-bin")
    (version "3.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OhMyGuus/BetterCrewLink/releases/download/v"
                    version "/bettercrewlink-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bettercrewlink-bin"))))
    (home-page "https://github.com/OhMyGuus/BetterCrewLink")
    (synopsis "Free, open, Among Us Proximity Chat")
    (description "Free, open, Among Us Proximity Chat.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 89. seashell-bin --- SSH server with virtual hosts and username-based routing
;;; -------------------------------------------------------------------
(define-public seashell-bin
  (package
    (name "seashell-bin")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "seashell-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/seashell-bin"))))
    (home-page "https://gitea.elara.ws/Elara6331/seashell")
    (synopsis "SSH server with virtual hosts and username-based routing")
    (description "SSH server with virtual hosts and username-based routing.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 90. osmosis-bin --- command line Java application for processing OSM data
;;; -------------------------------------------------------------------
(define-public osmosis-bin
  (package
    (name "osmosis-bin")
    (version "0.49.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "osmosis-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/osmosis-bin"))))
    (home-page "http://wiki.openstreetmap.org/wiki/Osmosis")
    (synopsis "command line Java application for processing OSM data")
    (description "Command line Java application for processing OSM data.")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 91. grlx-bin --- grlx
;;; -------------------------------------------------------------------
(define-public grlx-bin
  (package
    (name "grlx-bin")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gogrlx/grlx/releases/download/v"
                    version "/grlx-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/grlx-bin"))))
    (home-page "https://github.com/gogrlx/grlx")
    (synopsis "grlx")
    (description "grlx is a prebuilt binary package.")
    (license license:bsd-0)))

;;; -------------------------------------------------------------------
;;; 92. mediago-bin --- video online extraction tool streaming media download, video
;;; -------------------------------------------------------------------
(define-public mediago-bin
  (package
    (name "mediago-bin")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "mediago-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mediago-bin"))))
    (home-page "https://downloader.caorushizi.cn/")
    (synopsis "video online extraction tool streaming media download, video download,m3u8 ")
    (description "Video online extraction tool streaming media download, video
download,m3u8 download,Bilibili video
download.视频在线提取工具,流媒体下载,视频下载,m3u8下载,B站视频下载.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 93. simplearchiver-bin --- an alternative to tar
;;; -------------------------------------------------------------------
(define-public simplearchiver-bin
  (package
    (name "simplearchiver-bin")
    (version "2.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Stephen-Seo/simplearchiver/releases/download/v"
                    version "/simplearchiver-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/simplearchiver-bin"))))
    (home-page "https://github.com/Stephen-Seo/simplearchiver")
    (synopsis "an alternative to tar")
    (description "An alternative to tar.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 94. tokentool-bin --- a Token creation tool to create png images suitable for Virt
;;; -------------------------------------------------------------------
(define-public tokentool-bin
  (package
    (name "tokentool-bin")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tokentool-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tokentool-bin"))))
    (home-page "http://rptools.net")
    (synopsis "a Token creation tool to create png images suitable for Virtual Table Tops")
    (description "A Token creation tool to create png images suitable for Virtual
Table Tops.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 95. ytdl-sub-bin --- automate downloading and metadata generation with yt-dlp
;;; -------------------------------------------------------------------
(define-public ytdl-sub-bin
  (package
    (name "ytdl-sub-bin")
    (version "2026.04.13.post1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jmbannon/ytdl-sub/releases/download/v"
                    version "/ytdl-sub-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ytdl-sub-bin"))))
    (home-page "https://github.com/jmbannon/ytdl-sub")
    (synopsis "automate downloading and metadata generation with yt-dlp")
    (description "Automate downloading and metadata generation with yt-dlp.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 96. netease-cloud-music-gtk-bin --- NetEase Cloud Music Player Based on Rust + GTK in Linux Plat
;;; -------------------------------------------------------------------
(define-public netease-cloud-music-gtk-bin
  (package
    (name "netease-cloud-music-gtk-bin")
    (version "2.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gmg137/netease-cloud-music-gtk/releases/download/v"
                    version "/netease-cloud-music-gtk-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/netease-cloud-music-gtk-bin"))))
    (home-page "https://github.com/gmg137/netease-cloud-music-gtk")
    (synopsis "NetEase Cloud Music Player Based on Rust + GTK in Linux Platform.(Prebuilt ")
    (description "NetEase Cloud Music Player Based on Rust + GTK in Linux
Platform.(Prebuilt version)Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 97. meru-bin --- 📮 Nifty Gmail desktop app.(previously Gmail Desktop)
;;; -------------------------------------------------------------------
(define-public meru-bin
  (package
    (name "meru-bin")
    (version "3.44.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zoidsh/meru/releases/download/v"
                    version "/meru-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/meru-bin"))))
    (home-page "https://github.com/zoidsh/meru")
    (synopsis "📮 Nifty Gmail desktop app.(previously Gmail Desktop)")
    (description "Nifty Gmail desktop app.(previously Gmail Desktop).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 98. project-graph-bin --- a simple tool to create topology diagrams
;;; -------------------------------------------------------------------
(define-public project-graph-bin
  (package
    (name "project-graph-bin")
    (version "2.11.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LiRenTech/project-graph/releases/download/v"
                    version "/project-graph-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/project-graph-bin"))))
    (home-page "https://github.com/LiRenTech/project-graph")
    (synopsis "a simple tool to create topology diagrams")
    (description "A simple tool to create topology diagrams.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 99. fabric-ai-bin --- open-source framework for augmenting humans using AI
;;; -------------------------------------------------------------------
(define-public fabric-ai-bin
  (package
    (name "fabric-ai-bin")
    (version "1.4.375")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/danielmiessler/fabric/releases/download/v"
                    version "/fabric-ai-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fabric-ai-bin"))))
    (home-page "https://github.com/danielmiessler/fabric")
    (synopsis "open-source framework for augmenting humans using AI")
    (description "open-source framework for augmenting humans using AI.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 100. drawio-bin --- Diagram drawing application built on web technology
;;; -------------------------------------------------------------------
(define-public drawio-bin
  (package
    (name "drawio-bin")
    (version "29.6.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jgraph/drawio/releases/download/v"
                    version "/drawio-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/drawio-bin"))))
    (home-page "https://github.com/jgraph/drawio")
    (synopsis "Diagram drawing application built on web technology")
    (description "Diagram drawing application built on web technology.")
    (license license:asl2.0)))
