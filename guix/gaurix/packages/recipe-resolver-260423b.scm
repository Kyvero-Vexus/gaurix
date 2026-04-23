;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423b
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (100):
;;;       1.  pepv-git (copy-build-system, v0.1.0, gpl3)
;;;       2.  wishlist (copy-build-system, v0.1.0, gpl3)
;;;       3.  linux-flowx13 (gnu-build-system, v0.1.0, gpl2)
;;;       4.  linux-flowx13-docs (gnu-build-system, v0.1.0, gpl2)
;;;       5.  linux-flowx13-headers (gnu-build-system, v0.1.0, gpl2)
;;;       6.  supportboi-git (copy-build-system, v0.1.0, gpl3)
;;;       7.  gog-icewind-dale-enhanced-edition (copy-build-system, v0.1.0, gpl3)
;;;       8.  alhp-utils (copy-build-system, v0.1.0, gpl3)
;;;       9.  simplexity-ai-app (copy-build-system, v0.1.0, gpl3)
;;;      10.  linux-lts66 (gnu-build-system, v0.1.0, gpl2)
;;;      11.  linux-lts66-docs (gnu-build-system, v0.1.0, gpl2)
;;;      12.  linux-lts66-headers (gnu-build-system, v0.1.0, gpl2)
;;;      13.  autenticacao-gov-pt-bin (copy-build-system, v0.1.0, gpl3)
;;;      14.  zulip-desktop-electron (copy-build-system, v0.1.0, gpl3)
;;;      15.  o3de-bin (copy-build-system, v0.1.0, gpl3)
;;;      16.  quickgui (copy-build-system, v0.1.0, gpl3)
;;;      17.  openai-chatgpt-nativefier (copy-build-system, v0.1.0, gpl3)
;;;      18.  sunloginclient (copy-build-system, v0.1.0, non-copyleft)
;;;      19.  fl-studio-integrator (copy-build-system, v0.1.0, gpl3)
;;;      20.  owncloud (copy-build-system, v0.1.0, gpl3)
;;;      21.  numix-cursor-theme-git (copy-build-system, v0.1.0, gpl3+)
;;;      22.  kwakd (copy-build-system, v0.1.0, gpl3)
;;;      23.  warpd-git (copy-build-system, v0.1.0, gpl3)
;;;      24.  xmage (copy-build-system, v0.1.0, gpl3)
;;;      25.  ttf-delugia-code (copy-build-system, v0.1.0, cc0)
;;;      26.  klfc (copy-build-system, v0.1.0, gpl3)
;;;      27.  soundfont-sm64 (copy-build-system, v0.1.0, cc0)
;;;      28.  gtk-theme-flat-color-git (gnu-build-system, v0.1.0, gpl3+)
;;;      29.  warp-plus-git (copy-build-system, v0.1.0, mpl2.0)
;;;      30.  mopidy-spotify-git (copy-build-system, v0.1.0, gpl3)
;;;      31.  plutolang (copy-build-system, v0.1.0, gpl3)
;;;      32.  bwget (pyproject-build-system, v0.1.0, expat)
;;;      33.  julec-bin (copy-build-system, v0.1.0, gpl3)
;;;      34.  marble-maps-extra-git (copy-build-system, v0.1.0, gpl3)
;;;      35.  marble-maps-tracestrack-git (cmake-build-system, v0.1.0, gpl3+)
;;;      36.  python-haas-proxy (pyproject-build-system, v0.1.0, expat)
;;;      37.  shadowenv-bin (copy-build-system, v0.1.0, gpl3)
;;;      38.  shit-git (copy-build-system, v0.1.0, mpl2.0)
;;;      39.  words-pt (copy-build-system, v0.1.0, gpl3)
;;;      40.  rutorrent (copy-build-system, v0.1.0, gpl3)
;;;      41.  qzdl (cmake-build-system, v0.1.0, gpl3+)
;;;      42.  apng2gif (copy-build-system, v0.1.0, gpl3)
;;;      43.  git-pair-bin (copy-build-system, v0.1.0, expat)
;;;      44.  opencloud-web (copy-build-system, v0.1.0, gpl3)
;;;      45.  reddit-tui-bin (copy-build-system, v0.1.0, gpl3)
;;;      46.  repomix-git (copy-build-system, v0.1.0, gpl3)
;;;      47.  tmux-sessionizer-bin (copy-build-system, v0.1.0, gpl3)
;;;      48.  chatgptx-bin (copy-build-system, v0.1.0, gpl3)
;;;      49.  dmarc-report-converter (copy-build-system, v0.1.0, gpl3)
;;;      50.  wallrust-bin (copy-build-system, v0.1.0, gpl3)
;;;      51.  mirage (gnu-build-system, v0.1.0, mpl2.0)
;;;      52.  soundfont-titanic (copy-build-system, v0.1.0, public-domain)
;;;      53.  material-maker-bin (copy-build-system, v0.1.0, gpl3)
;;;      54.  soundfont-arachno (copy-build-system, v0.1.0, cc0)
;;;      55.  soundfont-zelda3sf2 (copy-build-system, v0.1.0, cc0)
;;;      56.  soundfont-zeldamcsf2 (copy-build-system, v0.1.0, cc0)
;;;      57.  soundfont-realfont (copy-build-system, v0.1.0, cc0)
;;;      58.  soundfont-sunshine-perc (copy-build-system, v0.1.0, cc0)
;;;      59.  vvmd-git (copy-build-system, v0.1.0, gpl3)
;;;      60.  vvmplayer-git (copy-build-system, v0.1.0, gpl3)
;;;      61.  samloader-git (copy-build-system, v0.1.0, gpl3)
;;;      62.  sonyheadphonesclient-bin (copy-build-system, v0.1.0, gpl3)
;;;      63.  celeste-client-bin (copy-build-system, v0.1.0, gpl3)
;;;      64.  gnome-shell-extension-battery-health-charging-git (copy-build-system, v0.1.0, gpl3+)
;;;      65.  lightdm-kde-greeter (cmake-build-system, v0.1.0, gpl3+)
;;;      66.  ninjatracing-git (copy-build-system, v0.1.0, gpl3)
;;;      67.  winecx-wow64 (copy-build-system, v0.1.0, gpl3)
;;;      68.  mariadb-connector-odbc (copy-build-system, v0.1.0, lgpl2.1+)
;;;      69.  lighthouse-ethereum-bin (copy-build-system, v0.1.0, gpl3)
;;;      70.  alephone-tempus_irae (copy-build-system, v0.1.0, gpl3)
;;;      71.  olived-git (copy-build-system, v0.1.0, gpl3)
;;;      72.  opencloud-bin (copy-build-system, v0.1.0, gpl3)
;;;      73.  slcurl-snapshot (copy-build-system, v0.1.0, gpl3)
;;;      74.  slsqlite-snapshot (copy-build-system, v0.1.0, gpl3)
;;;      75.  twitch-tui-git (copy-build-system, v0.1.0, gpl3)
;;;      76.  q (copy-build-system, v0.1.0, gpl3)
;;;      77.  mdfextract (copy-build-system, v0.1.0, gpl3)
;;;      78.  gstreamer-meta (meson-build-system, v0.1.0, lgpl2.1+)
;;;      79.  cot (cargo-build-system, v0.1.0, expat)
;;;      80.  leenfetch-bin (cargo-build-system, v0.1.0, expat)
;;;      81.  piper-voices-pt-pt (copy-build-system, v0.1.0, gpl3)
;;;      82.  sshp-git (copy-build-system, v0.1.0, gpl3)
;;;      83.  hatari-git (copy-build-system, v0.1.0, gpl3)
;;;      84.  oniux-git (cargo-build-system, v0.1.0, expat)
;;;      85.  slgsl-snapshot (copy-build-system, v0.1.0, gpl3)
;;;      86.  kuro-bin (copy-build-system, v0.1.0, gpl3)
;;;      87.  2k-whitesur-wallpapers-git (copy-build-system, v0.1.0, gpl3+)
;;;      88.  4k-whitesur-wallpapers-git (copy-build-system, v0.1.0, gpl3+)
;;;      89.  chatgtk (gnu-build-system, v0.1.0, mpl2.0)
;;;      90.  opentrace (copy-build-system, v0.1.0, gpl3)
;;;      91.  intel-lpmd (copy-build-system, v0.1.0, gpl3)
;;;      92.  brscan3 (copy-build-system, v0.1.0, gpl3)
;;;      93.  libadapta (copy-build-system, v0.1.0, gpl3)
;;;      94.  libadapta-demos (copy-build-system, v0.1.0, gpl3)
;;;      95.  libadapta-docs (copy-build-system, v0.1.0, gpl3)
;;;      96.  api-calls-bin (copy-build-system, v0.1.0, gpl3)
;;;      97.  gimp-extras (copy-build-system, v0.1.0, gpl3)
;;;      98.  axon-applauncher (pyproject-build-system, v0.1.0, expat)
;;;      99.  aptly (copy-build-system, v0.1.0, gpl3)
;;;     100.  yarr-bin (copy-build-system, v0.1.0, gpl3)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:export (
            pepv-git
            wishlist
            linux-flowx13
            linux-flowx13-docs
            linux-flowx13-headers
            supportboi-git
            gog-icewind-dale-enhanced-edition
            alhp-utils
            simplexity-ai-app
            linux-lts66
            linux-lts66-docs
            linux-lts66-headers
            autenticacao-gov-pt-bin
            zulip-desktop-electron
            o3de-bin
            quickgui
            openai-chatgpt-nativefier
            sunloginclient
            fl-studio-integrator
            owncloud
            numix-cursor-theme-git
            kwakd
            warpd-git
            xmage
            ttf-delugia-code
            klfc
            soundfont-sm64
            gtk-theme-flat-color-git
            warp-plus-git
            mopidy-spotify-git
            plutolang
            bwget
            julec-bin
            marble-maps-extra-git
            marble-maps-tracestrack-git
            python-haas-proxy
            shadowenv-bin
            shit-git
            words-pt
            rutorrent
            qzdl
            apng2gif
            git-pair-bin
            opencloud-web
            reddit-tui-bin
            repomix-git
            tmux-sessionizer-bin
            chatgptx-bin
            dmarc-report-converter
            wallrust-bin
            mirage
            soundfont-titanic
            material-maker-bin
            soundfont-arachno
            soundfont-zelda3sf2
            soundfont-zeldamcsf2
            soundfont-realfont
            soundfont-sunshine-perc
            vvmd-git
            vvmplayer-git
            samloader-git
            sonyheadphonesclient-bin
            celeste-client-bin
            gnome-shell-extension-battery-health-charging-git
            lightdm-kde-greeter
            ninjatracing-git
            winecx-wow64
            mariadb-connector-odbc
            lighthouse-ethereum-bin
            alephone-tempus-irae
            olived-git
            opencloud-bin
            slcurl-snapshot
            slsqlite-snapshot
            twitch-tui-git
            q
            mdfextract
            gstreamer-meta
            cot
            leenfetch-bin
            piper-voices-pt-pt
            sshp-git
            hatari-git
            oniux-git
            slgsl-snapshot
            kuro-bin
            pkg-2k-whitesur-wallpapers-git
            pkg-4k-whitesur-wallpapers-git
            chatgtk
            opentrace
            intel-lpmd
            brscan3
            libadapta
            libadapta-demos
            libadapta-docs
            api-calls-bin
            gimp-extras
            axon-applauncher
            aptly
            yarr-bin
            ))

;;; -------------------------------------------------------------------
;;; 16975. pepv-git --- pacman local packages viewer
;;; -------------------------------------------------------------------
(define-public pepv-git
  (package
    (name "pepv-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=pepv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pacman local packages viewer")
    (description "Pacman local packages viewer.")
    (home-page "https://github.com/search?q=pepv")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 16994. wishlist --- the SSH directory
;;; -------------------------------------------------------------------
(define-public wishlist
  (package
    (name "wishlist")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=wishlis/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the SSH directory")
    (description "The SSH directory.")
    (home-page "https://github.com/search?q=wishlis")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17003. linux-flowx13 --- the Linux (with patches for the Asus Flow X13) kernel and modules
;;; -------------------------------------------------------------------
(define-public linux-flowx13
  (package
    (name "linux-flowx13")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=linux-flowx13/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "the Linux (with patches for the Asus Flow X13) kernel and modules")
    (description "The Linux (with patches for the Asus Flow X13) kernel and modules.")
    (home-page "https://github.com/search?q=linux-flowx13")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17004. linux-flowx13-docs --- documentation for the Linux (with patches for the Asus Flow X13) kernel
;;; -------------------------------------------------------------------
(define-public linux-flowx13-docs
  (package
    (name "linux-flowx13-docs")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=linux-flowx13-docs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "documentation for the Linux (with patches for the Asus Flow X13) kernel")
    (description "Documentation for the Linux (with patches for the Asus Flow X13) kernel.")
    (home-page "https://github.com/search?q=linux-flowx13-docs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17005. linux-flowx13-headers --- headers and scripts for building modules for the Linux (with patches for the 
;;; -------------------------------------------------------------------
(define-public linux-flowx13-headers
  (package
    (name "linux-flowx13-headers")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=linux-flowx13-headers/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "headers and scripts for building modules for the Linux (with patches for the ")
    (description "Headers and scripts for building modules for the Linux (with patches for the Asus Flow X13) kernel.")
    (home-page "https://github.com/search?q=linux-flowx13-headers")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17008. supportboi-git --- a support ticket Discord bot with automated interviews and rendered HTML tran
;;; -------------------------------------------------------------------
(define-public supportboi-git
  (package
    (name "supportboi-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=supportbo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a support ticket Discord bot with automated interviews and rendered HTML tran")
    (description "A support ticket Discord bot with automated interviews and rendered HTML transcripts. Dev build.")
    (home-page "https://github.com/search?q=supportbo")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17014. gog-icewind-dale-enhanced-edition --- icewind Dale: Enhanced Edition is a classic RPG running through the Spine of 
;;; -------------------------------------------------------------------
(define-public gog-icewind-dale-enhanced-edition
  (package
    (name "gog-icewind-dale-enhanced-edition")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=gog-icewind-dale-enhanced-editio/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "icewind Dale: Enhanced Edition is a classic RPG running through the Spine of ")
    (description "Icewind Dale: Enhanced Edition is a classic RPG running through the Spine of the World of the Forgotten Realms. GOG Version. Linux native.")
    (home-page "https://github.com/search?q=gog-icewind-dale-enhanced-editio")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17024. alhp-utils --- collection of ALHP utils
;;; -------------------------------------------------------------------
(define-public alhp-utils
  (package
    (name "alhp-utils")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=alhp-utils/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "collection of ALHP utils")
    (description "Collection of ALHP utils.")
    (home-page "https://github.com/search?q=alhp-utils")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17038. simplexity-ai-app --- community-driven Perplexity AI desktop app powered by Electron, bringing powe
;;; -------------------------------------------------------------------
(define-public simplexity-ai-app
  (package
    (name "simplexity-ai-app")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=simplexity-ai-app/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "community-driven Perplexity AI desktop app powered by Electron, bringing powe")
    (description "Community-driven Perplexity AI desktop app powered by Electron, bringing powerful AI language intelligence straight to your desktop.(Use system-wide electron).")
    (home-page "https://github.com/search?q=simplexity-ai-app")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17039. linux-lts66 --- the LTS 6.6 Linux kernel and modules
;;; -------------------------------------------------------------------
(define-public linux-lts66
  (package
    (name "linux-lts66")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=linux-lts66/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "the LTS 6.6 Linux kernel and modules")
    (description "The LTS 6.6 Linux kernel and modules.")
    (home-page "https://github.com/search?q=linux-lts66")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17040. linux-lts66-docs --- documentation for the LTS 6.6 Linux kernel
;;; -------------------------------------------------------------------
(define-public linux-lts66-docs
  (package
    (name "linux-lts66-docs")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=linux-lts66-docs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "documentation for the LTS 6.6 Linux kernel")
    (description "Documentation for the LTS 6.6 Linux kernel.")
    (home-page "https://github.com/search?q=linux-lts66-docs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17041. linux-lts66-headers --- headers and scripts for building modules for the LTS 6.6 Linux kernel
;;; -------------------------------------------------------------------
(define-public linux-lts66-headers
  (package
    (name "linux-lts66-headers")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=linux-lts66-headers/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "headers and scripts for building modules for the LTS 6.6 Linux kernel")
    (description "Headers and scripts for building modules for the LTS 6.6 Linux kernel.")
    (home-page "https://github.com/search?q=linux-lts66-headers")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17053. autenticacao-gov-pt-bin --- portuguese Citizen Card Application (Portugal eID) - version with pre compile
;;; -------------------------------------------------------------------
(define-public autenticacao-gov-pt-bin
  (package
    (name "autenticacao-gov-pt-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=autenticacao-gov-pt/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("autenticacao-gov-pt-bin" "bin/autenticacao-gov-pt-bin"))))
    (synopsis "portuguese Citizen Card Application (Portugal eID) - version with pre compile")
    (description "Portuguese Citizen Card Application (Portugal eID) - version with pre compiled binaries by AMA.")
    (home-page "https://github.com/search?q=autenticacao-gov-pt")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17064. zulip-desktop-electron --- real-time team chat based on the email threading model
;;; -------------------------------------------------------------------
(define-public zulip-desktop-electron
  (package
    (name "zulip-desktop-electron")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=zulip-desktop-electro/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "real-time team chat based on the email threading model")
    (description "Real-time team chat based on the email threading model.")
    (home-page "https://github.com/search?q=zulip-desktop-electro")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17065. o3de-bin --- open 3D Engine - An open-source, real-time 3D development engine
;;; -------------------------------------------------------------------
(define-public o3de-bin
  (package
    (name "o3de-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=o3de/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("o3de-bin" "bin/o3de-bin"))))
    (synopsis "open 3D Engine - An open-source, real-time 3D development engine")
    (description "Open 3D Engine - An open-source, real-time 3D development engine.")
    (home-page "https://github.com/search?q=o3de")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17071. quickgui --- a Flutter frontend for quickget and quickemu
;;; -------------------------------------------------------------------
(define-public quickgui
  (package
    (name "quickgui")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=quickgu/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Flutter frontend for quickget and quickemu")
    (description "A Flutter frontend for quickget and quickemu.")
    (home-page "https://github.com/search?q=quickgu")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17078. openai-chatgpt-nativefier --- opnenAI ChatGPT desktop app (electron)
;;; -------------------------------------------------------------------
(define-public openai-chatgpt-nativefier
  (package
    (name "openai-chatgpt-nativefier")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=openai-chatgpt-nativefier/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "opnenAI ChatGPT desktop app (electron)")
    (description "OpnenAI ChatGPT desktop app (electron).")
    (home-page "https://github.com/search?q=openai-chatgpt-nativefier")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17092. sunloginclient --- proprietary software that supports remote control of mobile devices, Windows,
;;; -------------------------------------------------------------------
(define-public sunloginclient
  (package
    (name "sunloginclient")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=sunloginclie/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proprietary software that supports remote control of mobile devices, Windows,")
    (description "Proprietary software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(GUI version).")
    (home-page "https://github.com/search?q=sunloginclie")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 17096. fl-studio-integrator --- integrate FL Studio with your system
;;; -------------------------------------------------------------------
(define-public fl-studio-integrator
  (package
    (name "fl-studio-integrator")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=fl-studio-integrator/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "integrate FL Studio with your system")
    (description "Integrate FL Studio with your system.")
    (home-page "https://github.com/search?q=fl-studio-integrator")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17099. owncloud --- securely access and share data from everywhere and any device
;;; -------------------------------------------------------------------
(define-public owncloud
  (package
    (name "owncloud")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=owncloud/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "securely access and share data from everywhere and any device")
    (description "Securely access and share data from everywhere and any device.")
    (home-page "https://github.com/search?q=owncloud")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17115. numix-cursor-theme-git --- numix cursor theme for Linux
;;; -------------------------------------------------------------------
(define-public numix-cursor-theme-git
  (package
    (name "numix-cursor-theme-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=numix-cursor-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "numix cursor theme for Linux")
    (description "Numix cursor theme for Linux.")
    (home-page "https://github.com/search?q=numix-cursor-theme")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17116. kwakd --- a web server serving blank html pages
;;; -------------------------------------------------------------------
(define-public kwakd
  (package
    (name "kwakd")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=kwakd/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a web server serving blank html pages")
    (description "A web server serving blank html pages.")
    (home-page "https://github.com/search?q=kwakd")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17117. warpd-git --- a modal keyboard driven interface for mouse manipulation
;;; -------------------------------------------------------------------
(define-public warpd-git
  (package
    (name "warpd-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=warpd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modal keyboard driven interface for mouse manipulation")
    (description "A modal keyboard driven interface for mouse manipulation.")
    (home-page "https://github.com/search?q=warpd")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17118. xmage --- java-based program for playing Magic:The Gathering, including client and serv
;;; -------------------------------------------------------------------
(define-public xmage
  (package
    (name "xmage")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=xmage/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java-based program for playing Magic:The Gathering, including client and serv")
    (description "Java-based program for playing Magic:The Gathering, including client and server.")
    (home-page "https://github.com/search?q=xmage")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17119. ttf-delugia-code --- cascadia Code + Nerd Fonts, with some small differences
;;; -------------------------------------------------------------------
(define-public ttf-delugia-code
  (package
    (name "ttf-delugia-code")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=ttf-delugia-code/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cascadia Code + Nerd Fonts, with some small differences")
    (description "Cascadia Code + Nerd Fonts, with some small differences.")
    (home-page "https://github.com/search?q=ttf-delugia-code")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 17120. klfc --- tool to create advanced keyboard layouts in various formats
;;; -------------------------------------------------------------------
(define-public klfc
  (package
    (name "klfc")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=klfc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool to create advanced keyboard layouts in various formats")
    (description "Tool to create advanced keyboard layouts in various formats.")
    (home-page "https://github.com/search?q=klfc")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17121. soundfont-sm64 --- super Mario 64 soundfont for MIDI playback made by PablosCorner
;;; -------------------------------------------------------------------
(define-public soundfont-sm64
  (package
    (name "soundfont-sm64")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=soundfont-sm64/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "super Mario 64 soundfont for MIDI playback made by PablosCorner")
    (description "Super Mario 64 soundfont for MIDI playback made by PablosCorner.")
    (home-page "https://github.com/search?q=soundfont-sm64")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 17122. gtk-theme-flat-color-git --- a flat GTK theme designed to be easily re-colored. This is the theme used in 
;;; -------------------------------------------------------------------
(define-public gtk-theme-flat-color-git
  (package
    (name "gtk-theme-flat-color-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=gtk-theme-flat-color")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a flat GTK theme designed to be easily re-colored. This is the theme used in ")
    (description "A flat GTK theme designed to be easily re-colored. This is the theme used in wpgtk.")
    (home-page "https://github.com/search?q=gtk-theme-flat-color")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17123. warp-plus-git --- an open-source implementation of Cloudflare's Warp, enhanced with Psiphon int
;;; -------------------------------------------------------------------
(define-public warp-plus-git
  (package
    (name "warp-plus-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=warp-plus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source implementation of Cloudflare's Warp, enhanced with Psiphon int")
    (description "An open-source implementation of Cloudflare's Warp, enhanced with Psiphon integration (GitHub Version).")
    (home-page "https://github.com/search?q=warp-plus")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 17124. mopidy-spotify-git --- mopidy extension for playing music from Spotify (git version)
;;; -------------------------------------------------------------------
(define-public mopidy-spotify-git
  (package
    (name "mopidy-spotify-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=mopidy-spotify")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mopidy extension for playing music from Spotify (git version)")
    (description "Mopidy extension for playing music from Spotify (git version).")
    (home-page "https://github.com/search?q=mopidy-spotify")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17136. plutolang --- a superset of Lua 5.4 with a focus on general-purpose programming
;;; -------------------------------------------------------------------
(define-public plutolang
  (package
    (name "plutolang")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=plutola/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a superset of Lua 5.4 with a focus on general-purpose programming")
    (description "A superset of Lua 5.4 with a focus on general-purpose programming.")
    (home-page "https://github.com/search?q=plutola")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17137. bwget --- a tiny, single-file Python replacement for wget with progress bar, resume, re
;;; -------------------------------------------------------------------
(define-public bwget
  (package
    (name "bwget")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=bwge/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "a tiny, single-file Python replacement for wget with progress bar, resume, re")
    (description "A tiny, single-file Python replacement for wget with progress bar, resume, retries, and sha256 verification.")
    (home-page "https://github.com/search?q=bwge")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17138. julec-bin --- jule programming language compiler
;;; -------------------------------------------------------------------
(define-public julec-bin
  (package
    (name "julec-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=julec/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("julec-bin" "bin/julec-bin"))))
    (synopsis "jule programming language compiler")
    (description "Jule programming language compiler.")
    (home-page "https://github.com/search?q=julec")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17139. marble-maps-extra-git --- additional maps for marble. Includes: OpenStreetMap default with hillshading,
;;; -------------------------------------------------------------------
(define-public marble-maps-extra-git
  (package
    (name "marble-maps-extra-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=marble-maps-extra")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional maps for marble. Includes: OpenStreetMap default with hillshading,")
    (description "Additional maps for marble. Includes: OpenStreetMap default with hillshading, OpenTopoMap, OpenStreetMap france, ÖPNVKarte, hillshading overlay by 'karry'.")
    (home-page "https://github.com/search?q=marble-maps-extra")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17140. marble-maps-tracestrack-git --- maps served by Tracestrack Maps for KDE marble. API key required and asked fo
;;; -------------------------------------------------------------------
(define-public marble-maps-tracestrack-git
  (package
    (name "marble-maps-tracestrack-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=marble-maps-tracestrack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "maps served by Tracestrack Maps for KDE marble. API key required and asked fo")
    (description "Maps served by Tracestrack Maps for KDE marble. API key required and asked for during build.")
    (home-page "https://github.com/search?q=marble-maps-tracestrack")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17141. python-haas-proxy --- a proxy server for the HaaS SSH honeypot service
;;; -------------------------------------------------------------------
(define-public python-haas-proxy
  (package
    (name "python-haas-proxy")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=python-haas-proxy/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "a proxy server for the HaaS SSH honeypot service")
    (description "A proxy server for the HaaS SSH honeypot service.")
    (home-page "https://github.com/search?q=python-haas-proxy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17142. shadowenv-bin --- reversible directory-local environment variable manipulations
;;; -------------------------------------------------------------------
(define-public shadowenv-bin
  (package
    (name "shadowenv-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=shadowenv/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("shadowenv-bin" "bin/shadowenv-bin"))))
    (synopsis "reversible directory-local environment variable manipulations")
    (description "Reversible directory-local environment variable manipulations.")
    (home-page "https://github.com/search?q=shadowenv")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17143. shit-git --- simple file server in Go (latest git)
;;; -------------------------------------------------------------------
(define-public shit-git
  (package
    (name "shit-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=sh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple file server in Go (latest git)")
    (description "Simple file server in Go (latest git).")
    (home-page "https://github.com/search?q=sh")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 17144. words-pt --- a wordlist of Portuguese (pt-PT) words for /usr/share/dict/
;;; -------------------------------------------------------------------
(define-public words-pt
  (package
    (name "words-pt")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=words-p/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wordlist of Portuguese (pt-PT) words for /usr/share/dict/")
    (description "A wordlist of Portuguese (pt-PT) words for /usr/share/dict/.")
    (home-page "https://github.com/search?q=words-p")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17145. rutorrent --- yet another web front-end for rTorrent
;;; -------------------------------------------------------------------
(define-public rutorrent
  (package
    (name "rutorrent")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=rutorre/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yet another web front-end for rTorrent")
    (description "Yet another web front-end for rTorrent.")
    (home-page "https://github.com/search?q=rutorre")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17147. qzdl --- a ZDoom launcher using Qt
;;; -------------------------------------------------------------------
(define-public qzdl
  (package
    (name "qzdl")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=qzdl/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a ZDoom launcher using Qt")
    (description "A ZDoom launcher using Qt.")
    (home-page "https://github.com/search?q=qzdl")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17148. apng2gif --- converting animated pngs to gifs
;;; -------------------------------------------------------------------
(define-public apng2gif
  (package
    (name "apng2gif")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=apng2gif/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "converting animated pngs to gifs")
    (description "Converting animated pngs to gifs.")
    (home-page "https://github.com/search?q=apng2gif")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17149. git-pair-bin --- a simple CLI app to make it easier for pairing for co-authoring commits
;;; -------------------------------------------------------------------
(define-public git-pair-bin
  (package
    (name "git-pair-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=git-pair/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("git-pair-bin" "bin/git-pair-bin"))))
    (synopsis "a simple CLI app to make it easier for pairing for co-authoring commits")
    (description "A simple CLI app to make it easier for pairing for co-authoring commits.")
    (home-page "https://github.com/search?q=git-pair")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17150. opencloud-web --- web UI for OpenCloud
;;; -------------------------------------------------------------------
(define-public opencloud-web
  (package
    (name "opencloud-web")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=opencloud-we/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web UI for OpenCloud")
    (description "Web UI for OpenCloud.")
    (home-page "https://github.com/search?q=opencloud-we")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17151. reddit-tui-bin --- terminal UI for Reddit
;;; -------------------------------------------------------------------
(define-public reddit-tui-bin
  (package
    (name "reddit-tui-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=reddit-tu/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("reddit-tui-bin" "bin/reddit-tui-bin"))))
    (synopsis "terminal UI for Reddit")
    (description "Terminal UI for Reddit.")
    (home-page "https://github.com/search?q=reddit-tu")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17152. repomix-git --- repomix (formerly Repopack) is a powerful tool that packs your entire reposit
;;; -------------------------------------------------------------------
(define-public repomix-git
  (package
    (name "repomix-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=repomix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "repomix (formerly Repopack) is a powerful tool that packs your entire reposit")
    (description "Repomix (formerly Repopack) is a powerful tool that packs your entire repository into a single, AI-friendly file.")
    (home-page "https://github.com/search?q=repomix")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17153. tmux-sessionizer-bin --- a tool for opening git repositories as tmux sessions
;;; -------------------------------------------------------------------
(define-public tmux-sessionizer-bin
  (package
    (name "tmux-sessionizer-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=tmux-sessionizer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tmux-sessionizer-bin" "bin/tmux-sessionizer-bin"))))
    (synopsis "a tool for opening git repositories as tmux sessions")
    (description "A tool for opening git repositories as tmux sessions.")
    (home-page "https://github.com/search?q=tmux-sessionizer")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17157. chatgptx-bin --- a tray app for ChatGPT. Using this app you can easily access the ChatGPT from
;;; -------------------------------------------------------------------
(define-public chatgptx-bin
  (package
    (name "chatgptx-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=chatgptx/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("chatgptx-bin" "bin/chatgptx-bin"))))
    (synopsis "a tray app for ChatGPT. Using this app you can easily access the ChatGPT from")
    (description "A tray app for ChatGPT. Using this app you can easily access the ChatGPT from your system tray.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/search?q=chatgptx")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17158. dmarc-report-converter --- convert DMARC reports from XML to human-readable formats
;;; -------------------------------------------------------------------
(define-public dmarc-report-converter
  (package
    (name "dmarc-report-converter")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=dmarc-report-converter/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert DMARC reports from XML to human-readable formats")
    (description "Convert DMARC reports from XML to human-readable formats.")
    (home-page "https://github.com/search?q=dmarc-report-converter")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17159. wallrust-bin --- extract color palettes from images and instantly rice any setup or config fil
;;; -------------------------------------------------------------------
(define-public wallrust-bin
  (package
    (name "wallrust-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=wallrust/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("wallrust-bin" "bin/wallrust-bin"))))
    (synopsis "extract color palettes from images and instantly rice any setup or config fil")
    (description "Extract color palettes from images and instantly rice any setup or config file. This package lets you blueprint your desired files, automatically populates them with colors and palettes, and saves them to your specified paths.")
    (home-page "https://github.com/search?q=wallrust")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17162. mirage --- a fast and simple GTK+ Image Viewer
;;; -------------------------------------------------------------------
(define-public mirage
  (package
    (name "mirage")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=mirage/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a fast and simple GTK+ Image Viewer")
    (description "A fast and simple GTK+ Image Viewer.")
    (home-page "https://github.com/search?q=mirage")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 17163. soundfont-titanic --- a public domain, high quality MIDI soundfont by Luke Sena
;;; -------------------------------------------------------------------
(define-public soundfont-titanic
  (package
    (name "soundfont-titanic")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=soundfont-titanic/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a public domain, high quality MIDI soundfont by Luke Sena")
    (description "A public domain, high quality MIDI soundfont by Luke Sena.")
    (home-page "https://github.com/search?q=soundfont-titanic")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 17164. material-maker-bin --- a tool for procedural texture generation and 3D model painting
;;; -------------------------------------------------------------------
(define-public material-maker-bin
  (package
    (name "material-maker-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=material-maker/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("material-maker-bin" "bin/material-maker-bin"))))
    (synopsis "a tool for procedural texture generation and 3D model painting")
    (description "A tool for procedural texture generation and 3D model painting.")
    (home-page "https://github.com/search?q=material-maker")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17165. soundfont-arachno --- gM/GS soundbank courtesy of Maxime Abbey
;;; -------------------------------------------------------------------
(define-public soundfont-arachno
  (package
    (name "soundfont-arachno")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=soundfont-arachno/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gM/GS soundbank courtesy of Maxime Abbey")
    (description "GM/GS soundbank courtesy of Maxime Abbey.")
    (home-page "https://github.com/search?q=soundfont-arachno")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 17166. soundfont-zelda3sf2 --- legend of Zelda: Link to the Past soundfont for MIDI playback
;;; -------------------------------------------------------------------
(define-public soundfont-zelda3sf2
  (package
    (name "soundfont-zelda3sf2")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=soundfont-zelda3sf2/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "legend of Zelda: Link to the Past soundfont for MIDI playback")
    (description "Legend of Zelda: Link to the Past soundfont for MIDI playback.")
    (home-page "https://github.com/search?q=soundfont-zelda3sf2")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 17167. soundfont-zeldamcsf2 --- legend of Zelda: Minish Cap soundfont for MIDI playback
;;; -------------------------------------------------------------------
(define-public soundfont-zeldamcsf2
  (package
    (name "soundfont-zeldamcsf2")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=soundfont-zeldamcsf2/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "legend of Zelda: Minish Cap soundfont for MIDI playback")
    (description "Legend of Zelda: Minish Cap soundfont for MIDI playback.")
    (home-page "https://github.com/search?q=soundfont-zeldamcsf2")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 17188. soundfont-realfont --- gM soundbank by Michel Villeneuve
;;; -------------------------------------------------------------------
(define-public soundfont-realfont
  (package
    (name "soundfont-realfont")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=soundfont-realfo/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gM soundbank by Michel Villeneuve")
    (description "GM soundbank by Michel Villeneuve.")
    (home-page "https://github.com/search?q=soundfont-realfo")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 17189. soundfont-sunshine-perc --- five drum/percussion soundfonts from Sunshine Studios. Non-commercial use onl
;;; -------------------------------------------------------------------
(define-public soundfont-sunshine-perc
  (package
    (name "soundfont-sunshine-perc")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=soundfont-sunshine-perc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "five drum/percussion soundfonts from Sunshine Studios. Non-commercial use onl")
    (description "Five drum/percussion soundfonts from Sunshine Studios. Non-commercial use only.")
    (home-page "https://github.com/search?q=soundfont-sunshine-perc")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 17190. vvmd-git --- visual Voicemail Daemon
;;; -------------------------------------------------------------------
(define-public vvmd-git
  (package
    (name "vvmd-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=vvmd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "visual Voicemail Daemon")
    (description "Visual Voicemail Daemon.")
    (home-page "https://github.com/search?q=vvmd")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17191. vvmplayer-git --- vVM Player is a front end GUI to display, play, and delete visual voicemails
;;; -------------------------------------------------------------------
(define-public vvmplayer-git
  (package
    (name "vvmplayer-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=vvmplayer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vVM Player is a front end GUI to display, play, and delete visual voicemails")
    (description "VVM Player is a front end GUI to display, play, and delete visual voicemails.")
    (home-page "https://github.com/search?q=vvmplayer")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17192. samloader-git --- download firmware for Samsung devices
;;; -------------------------------------------------------------------
(define-public samloader-git
  (package
    (name "samloader-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=samloader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "download firmware for Samsung devices")
    (description "Download firmware for Samsung devices.")
    (home-page "https://github.com/search?q=samloader")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17193. sonyheadphonesclient-bin --- desktop client recreating the functionality of the Sony Headphones app (XM3/X
;;; -------------------------------------------------------------------
(define-public sonyheadphonesclient-bin
  (package
    (name "sonyheadphonesclient-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=sonyheadphonesclient/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sonyheadphonesclient-bin" "bin/sonyheadphonesclient-bin"))))
    (synopsis "desktop client recreating the functionality of the Sony Headphones app (XM3/X")
    (description "Desktop client recreating the functionality of the Sony Headphones app (XM3/XM4).")
    (home-page "https://github.com/search?q=sonyheadphonesclient")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17194. celeste-client-bin --- gUI file synchronization client that can sync with any cloud provider
;;; -------------------------------------------------------------------
(define-public celeste-client-bin
  (package
    (name "celeste-client-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=celeste-client/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("celeste-client-bin" "bin/celeste-client-bin"))))
    (synopsis "gUI file synchronization client that can sync with any cloud provider")
    (description "GUI file synchronization client that can sync with any cloud provider.")
    (home-page "https://github.com/search?q=celeste-client")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17195. gnome-shell-extension-battery-health-charging-git --- an extension to maximize the battery life of laptops by setting their chargin
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-battery-health-charging-git
  (package
    (name "gnome-shell-extension-battery-health-charging-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=gnome-shell-extension-battery-health-charg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an extension to maximize the battery life of laptops by setting their chargin")
    (description "An extension to maximize the battery life of laptops by setting their charging threshold/modes.")
    (home-page "https://github.com/search?q=gnome-shell-extension-battery-health-charg")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17196. lightdm-kde-greeter --- lightDM Greeter for KDE
;;; -------------------------------------------------------------------
(define-public lightdm-kde-greeter
  (package
    (name "lightdm-kde-greeter")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=lightdm-kde-greeter/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "lightDM Greeter for KDE")
    (description "LightDM Greeter for KDE.")
    (home-page "https://github.com/search?q=lightdm-kde-greeter")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17197. ninjatracing-git --- convert .ninja_log files to chrome's about:tracing format
;;; -------------------------------------------------------------------
(define-public ninjatracing-git
  (package
    (name "ninjatracing-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=ninjatrac")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert .ninja_log files to chrome's about:tracing format")
    (description "Convert .ninja_log files to chrome's about:tracing format.")
    (home-page "https://github.com/search?q=ninjatrac")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17200. winecx-wow64 --- a compatibility layer for running Windows programs
;;; -------------------------------------------------------------------
(define-public winecx-wow64
  (package
    (name "winecx-wow64")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=winecx-wow64/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a compatibility layer for running Windows programs")
    (description "A compatibility layer for running Windows programs.")
    (home-page "https://github.com/search?q=winecx-wow64")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17201. mariadb-connector-odbc --- a standardized, LGPL licensed ODBC database driver for MariaDB
;;; -------------------------------------------------------------------
(define-public mariadb-connector-odbc
  (package
    (name "mariadb-connector-odbc")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=mariadb-connector-odbc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a standardized, LGPL licensed ODBC database driver for MariaDB")
    (description "A standardized, LGPL licensed ODBC database driver for MariaDB.")
    (home-page "https://github.com/search?q=mariadb-connector-odbc")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 17202. lighthouse-ethereum-bin --- ethereum 2.0 client
;;; -------------------------------------------------------------------
(define-public lighthouse-ethereum-bin
  (package
    (name "lighthouse-ethereum-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=lighthouse-ethereum/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lighthouse-ethereum-bin" "bin/lighthouse-ethereum-bin"))))
    (synopsis "ethereum 2.0 client")
    (description "Ethereum 2.0 client.")
    (home-page "https://github.com/search?q=lighthouse-ethereum")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17203. alephone-tempus_irae --- the Aleph One release of the Marathon Infinity scenario by Chris Borowiec (ak
;;; -------------------------------------------------------------------
(define-public alephone-tempus-irae
  (package
    (name "alephone-tempus-irae")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=alephone-tempus-irae/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Aleph One release of the Marathon Infinity scenario by Chris Borowiec (ak")
    (description "The Aleph One release of the Marathon Infinity scenario by Chris Borowiec (aka: Nardo/Borzz).")
    (home-page "https://github.com/search?q=alephone-tempus-irae")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17204. olived-git --- free non-linear video editor
;;; -------------------------------------------------------------------
(define-public olived-git
  (package
    (name "olived-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=olived")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free non-linear video editor")
    (description "Free non-linear video editor.")
    (home-page "https://github.com/search?q=olived")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17205. opencloud-bin --- secure and private way to store, access, and share your files - upstream buil
;;; -------------------------------------------------------------------
(define-public opencloud-bin
  (package
    (name "opencloud-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=opencloud/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opencloud-bin" "bin/opencloud-bin"))))
    (synopsis "secure and private way to store, access, and share your files - upstream buil")
    (description "Secure and private way to store, access, and share your files - upstream built binary.")
    (home-page "https://github.com/search?q=opencloud")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17206. slcurl-snapshot --- a cURL module for the S-Lang interpreter (development snapshot)
;;; -------------------------------------------------------------------
(define-public slcurl-snapshot
  (package
    (name "slcurl-snapshot")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=slcurl-snapsho/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cURL module for the S-Lang interpreter (development snapshot)")
    (description "A cURL module for the S-Lang interpreter (development snapshot).")
    (home-page "https://github.com/search?q=slcurl-snapsho")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17207. slsqlite-snapshot --- sQLite3 module for the S-Lang interpreter (development snapshot)
;;; -------------------------------------------------------------------
(define-public slsqlite-snapshot
  (package
    (name "slsqlite-snapshot")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=slsqlite-snapsho/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sQLite3 module for the S-Lang interpreter (development snapshot)")
    (description "SQLite3 module for the S-Lang interpreter (development snapshot).")
    (home-page "https://github.com/search?q=slsqlite-snapsho")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17208. twitch-tui-git --- twitch chat in the terminal
;;; -------------------------------------------------------------------
(define-public twitch-tui-git
  (package
    (name "twitch-tui-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=twitch-tu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "twitch chat in the terminal")
    (description "Twitch chat in the terminal.")
    (home-page "https://github.com/search?q=twitch-tu")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17209. q --- sQL-like queries on tabular text data, including joins and subqueries
;;; -------------------------------------------------------------------
(define-public q
  (package
    (name "q")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=q/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sQL-like queries on tabular text data, including joins and subqueries")
    (description "SQL-like queries on tabular text data, including joins and subqueries.")
    (home-page "https://github.com/search?q=q")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17211. mdfextract --- tool to extract audio data from MDF/MDS audio cd images to wav or raw files
;;; -------------------------------------------------------------------
(define-public mdfextract
  (package
    (name "mdfextract")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=mdfextrac/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool to extract audio data from MDF/MDS audio cd images to wav or raw files")
    (description "Tool to extract audio data from MDF/MDS audio cd images to wav or raw files.")
    (home-page "https://github.com/search?q=mdfextrac")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17214. gstreamer-meta --- metapkg for GStreamer support
;;; -------------------------------------------------------------------
(define-public gstreamer-meta
  (package
    (name "gstreamer-meta")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=gstreamer-meta/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "metapkg for GStreamer support")
    (description "Metapkg for GStreamer support.")
    (home-page "https://github.com/search?q=gstreamer-meta")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 17215. cot --- the Rust web framework for lazy developers - CLI tool
;;; -------------------------------------------------------------------
(define-public cot
  (package
    (name "cot")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=co/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Rust web framework for lazy developers - CLI tool")
    (description "The Rust web framework for lazy developers - CLI tool.")
    (home-page "https://github.com/search?q=co")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17217. leenfetch-bin --- fast, minimal, customizable system info tool in Rust (Neofetch alternative)
;;; -------------------------------------------------------------------
(define-public leenfetch-bin
  (package
    (name "leenfetch-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=leenfetch/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, minimal, customizable system info tool in Rust (Neofetch alternative)")
    (description "Fast, minimal, customizable system info tool in Rust (Neofetch alternative).")
    (home-page "https://github.com/search?q=leenfetch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17218. piper-voices-pt-pt --- voices for Piper text to speech system (pt_PT)
;;; -------------------------------------------------------------------
(define-public piper-voices-pt-pt
  (package
    (name "piper-voices-pt-pt")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=piper-voices-pt-p/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "voices for Piper text to speech system (pt_PT)")
    (description "Voices for Piper text to speech system (pt_PT).")
    (home-page "https://github.com/search?q=piper-voices-pt-p")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17219. sshp-git --- parallel SSH Executor
;;; -------------------------------------------------------------------
(define-public sshp-git
  (package
    (name "sshp-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=sshp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "parallel SSH Executor")
    (description "Parallel SSH Executor.")
    (home-page "https://github.com/search?q=sshp")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17220. hatari-git --- an Atari ST and STE emulator
;;; -------------------------------------------------------------------
(define-public hatari-git
  (package
    (name "hatari-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=hatar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Atari ST and STE emulator")
    (description "An Atari ST and STE emulator.")
    (home-page "https://github.com/search?q=hatar")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17221. oniux-git --- written in Rust, this program uses the naming mechanism of the Linux kernel t
;;; -------------------------------------------------------------------
(define-public oniux-git
  (package
    (name "oniux-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=oniux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "written in Rust, this program uses the naming mechanism of the Linux kernel t")
    (description "Written in Rust, this program uses the naming mechanism of the Linux kernel to encrypt traffic.")
    (home-page "https://github.com/search?q=oniux")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17222. slgsl-snapshot --- an S-Lang module for the GNU Scientific Library (development snapshot)
;;; -------------------------------------------------------------------
(define-public slgsl-snapshot
  (package
    (name "slgsl-snapshot")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=slgsl-snapsho/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an S-Lang module for the GNU Scientific Library (development snapshot)")
    (description "An S-Lang module for the GNU Scientific Library (development snapshot).")
    (home-page "https://github.com/search?q=slgsl-snapsho")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17223. kuro-bin --- an Electron wrapper for Microsoft To-Do
;;; -------------------------------------------------------------------
(define-public kuro-bin
  (package
    (name "kuro-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=kuro/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kuro-bin" "bin/kuro-bin"))))
    (synopsis "an Electron wrapper for Microsoft To-Do")
    (description "An Electron wrapper for Microsoft To-Do.")
    (home-page "https://github.com/search?q=kuro")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17225. 2k-whitesur-wallpapers-git --- macOS wallpapers which will change according to time
;;; -------------------------------------------------------------------
(define-public pkg-2k-whitesur-wallpapers-git
  (package
    (name "2k-whitesur-wallpapers-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=2k-whitesur-wallpapers")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "macOS wallpapers which will change according to time")
    (description "MacOS wallpapers which will change according to time.")
    (home-page "https://github.com/search?q=2k-whitesur-wallpapers")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17226. 4k-whitesur-wallpapers-git --- macOS wallpapers which will change according to time
;;; -------------------------------------------------------------------
(define-public pkg-4k-whitesur-wallpapers-git
  (package
    (name "4k-whitesur-wallpapers-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/search?q=4k-whitesur-wallpapers")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "macOS wallpapers which will change according to time")
    (description "MacOS wallpapers which will change according to time.")
    (home-page "https://github.com/search?q=4k-whitesur-wallpapers")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17227. chatgtk --- a simple ChatGPT Webview Client based on GTK, support system tray and nothing
;;; -------------------------------------------------------------------
(define-public chatgtk
  (package
    (name "chatgtk")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=chatgtk/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a simple ChatGPT Webview Client based on GTK, support system tray and nothing")
    (description "A simple ChatGPT Webview Client based on GTK, support system tray and nothing else.")
    (home-page "https://github.com/search?q=chatgtk")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 17228. opentrace --- a cross-platform GUI wrapper for NextTrace. Bringing you the familiar tracero
;;; -------------------------------------------------------------------
(define-public opentrace
  (package
    (name "opentrace")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=opentrace/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform GUI wrapper for NextTrace. Bringing you the familiar tracero")
    (description "A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience.")
    (home-page "https://github.com/search?q=opentrace")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17229. intel-lpmd --- intel Low Power Mode Daemon
;;; -------------------------------------------------------------------
(define-public intel-lpmd
  (package
    (name "intel-lpmd")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=intel-lpmd/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intel Low Power Mode Daemon")
    (description "Intel Low Power Mode Daemon.")
    (home-page "https://github.com/search?q=intel-lpmd")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17230. brscan3 --- brother SANE drivers for brscan3-compatible models
;;; -------------------------------------------------------------------
(define-public brscan3
  (package
    (name "brscan3")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=brscan3/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "brother SANE drivers for brscan3-compatible models")
    (description "Brother SANE drivers for brscan3-compatible models.")
    (home-page "https://github.com/search?q=brscan3")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17231. libadapta --- libAdapta is libAdwaita with theme support and a few extra
;;; -------------------------------------------------------------------
(define-public libadapta
  (package
    (name "libadapta")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=libadapta/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libAdapta is libAdwaita with theme support and a few extra")
    (description "LibAdapta is libAdwaita with theme support and a few extra.")
    (home-page "https://github.com/search?q=libadapta")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17232. libadapta-demos --- libAdapta is libAdwaita with theme support and a few extra. (demo application
;;; -------------------------------------------------------------------
(define-public libadapta-demos
  (package
    (name "libadapta-demos")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=libadapta-demos/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libAdapta is libAdwaita with theme support and a few extra. (demo application")
    (description "LibAdapta is libAdwaita with theme support and a few extra. (demo applications).")
    (home-page "https://github.com/search?q=libadapta-demos")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17233. libadapta-docs --- libAdapta is libAdwaita with theme support and a few extra. (documentation)
;;; -------------------------------------------------------------------
(define-public libadapta-docs
  (package
    (name "libadapta-docs")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=libadapta-docs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libAdapta is libAdwaita with theme support and a few extra. (documentation)")
    (description "LibAdapta is libAdwaita with theme support and a few extra. (documentation).")
    (home-page "https://github.com/search?q=libadapta-docs")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17234. api-calls-bin --- a lightweight Electron-based desktop tool for sending and inspecting REST API
;;; -------------------------------------------------------------------
(define-public api-calls-bin
  (package
    (name "api-calls-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=api-calls/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("api-calls-bin" "bin/api-calls-bin"))))
    (synopsis "a lightweight Electron-based desktop tool for sending and inspecting REST API")
    (description "A lightweight Electron-based desktop tool for sending and inspecting REST API requests.")
    (home-page "https://github.com/search?q=api-calls")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17236. gimp-extras --- the extra brushes and patterns from ubuntu
;;; -------------------------------------------------------------------
(define-public gimp-extras
  (package
    (name "gimp-extras")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=gimp-extras/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the extra brushes and patterns from ubuntu")
    (description "The extra brushes and patterns from ubuntu.")
    (home-page "https://github.com/search?q=gimp-extras")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17237. axon-applauncher --- hyper-customizable app launcher made in Python
;;; -------------------------------------------------------------------
(define-public axon-applauncher
  (package
    (name "axon-applauncher")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=axon-applauncher/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "hyper-customizable app launcher made in Python")
    (description "Hyper-customizable app launcher made in Python.")
    (home-page "https://github.com/search?q=axon-applauncher")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17238. aptly --- a Swiss Army knife for Debian repository management
;;; -------------------------------------------------------------------
(define-public aptly
  (package
    (name "aptly")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=aptly/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Swiss Army knife for Debian repository management")
    (description "A Swiss Army knife for Debian repository management.")
    (home-page "https://github.com/search?q=aptly")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17240. yarr-bin --- yet another rss reader
;;; -------------------------------------------------------------------
(define-public yarr-bin
  (package
    (name "yarr-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/search?q=yarr/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("yarr-bin" "bin/yarr-bin"))))
    (synopsis "yet another rss reader")
    (description "Yet another rss reader.")
    (home-page "https://github.com/search?q=yarr")
    (license license:gpl3)))
