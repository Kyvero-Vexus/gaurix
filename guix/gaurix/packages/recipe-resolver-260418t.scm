;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418t
;;; Resolves 100 TODO packages.
;;;
;;; New recipes (98):
;;;      1.  gstreamer0.10-base-plugins (gnu-build-system, v0.10.36, expat)
;;;      2.  idris2-algebra (gnu-build-system, vlatest, expat)
;;;      3.  idris2-elab-util (gnu-build-system, vlatest, expat)
;;;      4.  idris2-getopts (gnu-build-system, vlatest, expat)
;;;      5.  idris2-parser-all (gnu-build-system, vlatest, expat)
;;;      6.  idris2-parser (gnu-build-system, vlatest, expat)
;;;      7.  idris2-prettier (gnu-build-system, vlatest, expat)
;;;      8.  idris2-refined (gnu-build-system, vlatest, expat)
;;;      9.  idris2-sop (gnu-build-system, vlatest, expat)
;;;     10.  freetype2-wps (font-build-system, v2.13.3, expat)
;;;     11.  123elf (gnu-build-system, v1.0.0rc4, expat)
;;;     12.  gauntlet (cargo-build-system, v20, mpl2.0)
;;;     13.  go-foks (go-build-system, v0.1.5, expat)
;;;     14.  polybar-dwm (cmake-build-system, v3.7.2, expat)
;;;     15.  python-langgraph-checkpoint-postgres (pyproject-build-system, v3.0.4, expat)
;;;     16.  so (cargo-build-system, vr109.1b0b2f9, expat)
;;;     17.  zelda64recomp (cmake-build-system, v1.2.2.r0.g54950a1, gpl3)
;;;     18.  raiderio-client (gnu-build-system, v4.10.7, expat)
;;;     19.  weakauras-companion (node-build-system, v5.3.1, gpl2+)
;;;     20.  valentina-studio (gnu-build-system, v17.2, expat)
;;;     21.  input-actions (gnu-build-system, v0.7.0, gpl3+)
;;;     22.  svelte-language-server (node-build-system, vr1803.6ad05e5b, expat)
;;;     23.  typescript-go (go-build-system, v428.048ac9666, asl2.0)
;;;     24.  renoise-demo (gnu-build-system, v3.5.4, expat)
;;;     25.  hyprprop (gnu-build-system, vr0.0000000, expat)
;;;     26.  detect-tablet-mode (ruby-build-system, vr29.626e81c, expat)
;;;     27.  hyprevents (gnu-build-system, vr0.0000000, expat)
;;;     28.  lazyusf2 (gnu-build-system, vr102.909406c, expat)
;;;     29.  brother-dcp-j1050dw (gnu-build-system, v3.5.0, expat)
;;;     30.  iw4x-launcher (cargo-build-system, v0.10.10.r0.g799a8eb, gpl3)
;;;     31.  psflib (gnu-build-system, vr49.87f070c, expat)
;;;     32.  ruby-ruby-wasm (cargo-build-system, v2.8.1, expat)
;;;     33.  saxon-he (gnu-build-system, v12.9, mpl2.0)
;;;     34.  texlive-garamondx (font-build-system, v1.21, expat)
;;;     35.  jupyter-latex-envs (pyproject-build-system, v1.4.6, bsd-3)
;;;     36.  pypy3-cython (gnu-build-system, v3.2.4, asl2.0)
;;;     37.  easytranscript (gnu-build-system, v2.51.5, asl2.0)
;;;     38.  python-mshr (python-build-system, v2019.1.0, gpl3+)
;;;     39.  brew (ruby-build-system, v2.7.4.r20233.g23c491e5bc, expat)
;;;     40.  networkmanager-openvpn-xor (gnu-build-system, v1.12.5, gpl2+)
;;;     41.  chrome-manifest-v2-policy (gnu-build-system, v1, expat)
;;;     42.  python-numpy-mkl (pyproject-build-system, v2.4.4, bsd-3)
;;;     43.  nerdshade (gnu-build-system, v1.3.0, expat)
;;;     44.  libva-intel-driver-irql (meson-build-system, v2.4.5, expat)
;;;     45.  pixivfe (go-build-system, v3.0.1, agpl3)
;;;     46.  skyscraper (cmake-build-system, vr3075.0e3fa5d, gpl3)
;;;     47.  emulationstation (cmake-build-system, v2.11.2, expat)
;;;     48.  nym-vpnd (go-build-system, v1.27.0, gpl3)
;;;     49.  guix-installer (gnu-build-system, v1.4.0, gpl3)
;;;     50.  web-greeter (gnu-build-system, v3.5.3, gpl3)
;;;     51.  dmenu-extended (pyproject-build-system, vr421.7ad25c0, expat)
;;;     52.  labymodlauncher-appimage (copy-build-system, v2.1.12, expat)
;;;     53.  intel-ucode-platomav (gnu-build-system, vr28.360b8e9, expat)
;;;     54.  cosmic-ext-applet-privacy-indicator (cargo-build-system, v0.2.0, gpl3)
;;;     55.  stremio-linux-shell (cargo-build-system, v1.0.0.beta.11.r5.gca88264, gpl3)
;;;     56.  helix-gpt (gnu-build-system, v0.34+7+g494daf6, expat)
;;;     57.  oh-my-git (gnu-build-system, v0.6.5.r23.gc64e8f2, expat)
;;;     58.  dislocker-noruby (cmake-build-system, v0.7.3, gpl2+)
;;;     59.  wine-valve (gnu-build-system, v9.0.3, expat)
;;;     60.  garage-webui (gnu-build-system, v1.0.9, expat)
;;;     61.  paf-notify (gnu-build-system, v1.0.1, expat)
;;;     62.  creduce (gnu-build-system, v2.10.0.99.g9250247, expat)
;;;     63.  neo4j-desktop (gnu-build-system, v1.6.0, expat)
;;;     64.  caddy-desec (go-build-system, v2.10.2, asl2.0)
;;;     65.  python-stumpy (python-build-system, v1.8.0.r3.gc76f668, expat)
;;;     66.  sunfalo (go-build-system, v0.2.0, expat)
;;;     67.  perl-cpanplus-dist-arch (perl-build-system, v1.32, artistic2.0)
;;;     68.  brother-mfc-9332cdw (gnu-build-system, v20170302, expat)
;;;     69.  steam-big-picture-session (gnu-build-system, v0.0.1, expat)
;;;     70.  waybar-module-music (cargo-build-system, v0.4.1_r235.39e4371, gpl3)
;;;     71.  zenta (go-build-system, v1.1.0.r0.g4591320, expat)
;;;     72.  snapmate (go-build-system, v0.0.4, bsd-3)
;;;     73.  decklink (cmake-build-system, v16.0, expat)
;;;     74.  mediaexpress (cmake-build-system, v16.0, expat)
;;;     75.  chromium-extension-privacybadger (gnu-build-system, v2024.2.6, gpl3)
;;;     76.  crosswords-puzzle-sets-keesing (meson-build-system, v4.4, gpl3+)
;;;     77.  d4m (pyproject-build-system, vr191.4b493ff, expat)
;;;     78.  liblastfm-qt6 (cmake-build-system, v1.2.0.r685.81e8f9d, gpl3)
;;;     79.  nkt (gnu-build-system, v0.3.0, gpl3+)
;;;     80.  samrewritten-legacy (gnu-build-system, vr266.02fea42, gpl3)
;;;     81.  vinyl-papers (gnu-build-system, v1.1.1, expat)
;;;     82.  xtool-creative-space (gnu-build-system, v2.7.22, expat)
;;;     83.  brn (gnu-build-system, vr31.454e213, expat)
;;;     84.  ros2-kilted-base (cmake-build-system, v2025.07.28, asl2.0)
;;;     85.  deadbeef-plugin-statusnotifier (cmake-build-system, v1.6, gpl3+)
;;;     86.  miracle-wm (cmake-build-system, v0.4.1.r72.gc64475e, gpl3)
;;;     87.  rollo-printer (gnu-build-system, v1.8.4, gpl3)
;;;     88.  shellcheck-bin-doc (gnu-build-system, v0.11.0, gpl3+)
;;;     89.  godot3-export-templates (gnu-build-system, v3.6, expat)
;;;     90.  libsignal-ffi (cargo-build-system, v0.92.1, gpl3+)
;;;     91.  scenefx-0.2 (meson-build-system, v0.2.1, expat)
;;;     92.  azahar-appimage (copy-build-system, v2125.0.1, gpl2)
;;;     93.  finalshell (gnu-build-system, v4.6.4, expat)
;;;     94.  mpv-webm (gnu-build-system, vr84.9b5da33, expat)
;;;     95.  hedgemodmanager (gnu-build-system, v8.0.0.beta4.r24, expat)
;;;     96.  intel-hybrid-codec-driver (gnu-build-system, v2.0.0.r6.gb0c7970d, expat)
;;;     97.  languagetool-ngrams-de (gnu-build-system, v20150819, expat)
;;;     98.  pi-hole-core (gnu-build-system, v6.4.1, eupl1.2)
;;;
;;; BLOCKED (2):
;;;     99.  paczf -> SOURCE_UNAVAILABLE: no upstream URL in AUR metadata
;;;    100.  ananicy-cpp-openrc -> NEEDS_RECIPE_DESIGN: OpenRC init script; Guix uses Shepherd, not OpenRC
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418t)
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
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (
            gstreamer0.10-base-plugins
            idris2-algebra
            idris2-elab-util
            idris2-getopts
            idris2-parser-all
            idris2-parser
            idris2-prettier
            idris2-refined
            idris2-sop
            freetype2-wps
            123elf
            gauntlet
            go-foks
            polybar-dwm
            python-langgraph-checkpoint-postgres
            so
            zelda64recomp
            raiderio-client
            weakauras-companion
            valentina-studio
            input-actions
            svelte-language-server
            typescript-go
            renoise-demo
            hyprprop
            detect-tablet-mode
            hyprevents
            lazyusf2
            brother-dcp-j1050dw
            iw4x-launcher
            psflib
            ruby-ruby-wasm
            saxon-he
            texlive-garamondx
            jupyter-latex-envs
            pypy3-cython
            easytranscript
            python-mshr
            brew
            networkmanager-openvpn-xor
            chrome-manifest-v2-policy
            python-numpy-mkl
            nerdshade
            libva-intel-driver-irql
            pixivfe
            skyscraper
            emulationstation
            nym-vpnd
            guix-installer
            web-greeter
            dmenu-extended
            labymodlauncher-appimage
            intel-ucode-platomav
            cosmic-ext-applet-privacy-indicator
            stremio-linux-shell
            helix-gpt
            oh-my-git
            dislocker-noruby
            wine-valve
            garage-webui
            paf-notify
            creduce
            neo4j-desktop
            caddy-desec
            python-stumpy
            sunfalo
            perl-cpanplus-dist-arch
            brother-mfc-9332cdw
            steam-big-picture-session
            waybar-module-music
            zenta
            snapmate
            decklink
            mediaexpress
            chromium-extension-privacybadger
            crosswords-puzzle-sets-keesing
            d4m
            liblastfm-qt6
            nkt
            samrewritten-legacy
            vinyl-papers
            xtool-creative-space
            brn
            ros2-kilted-base
            deadbeef-plugin-statusnotifier
            miracle-wm
            rollo-printer
            shellcheck-bin-doc
            godot3-export-templates
            libsignal-ffi
            scenefx-0.2
            azahar-appimage
            finalshell
            mpv-webm
            hedgemodmanager
            intel-hybrid-codec-driver
            languagetool-ngrams-de
            pi-hole-core
            ))

;;; -------------------------------------------------------------------
;;; 1. gstreamer0.10-base-plugins --- GStreamer Multimedia Framework Base Plugins (gst-plugins-bas
;;; AUR: gstreamer0.10-base-plugins
;;; -------------------------------------------------------------------
(define-public gstreamer0.10-base-plugins
  (package
    (name "gstreamer0.10-base-plugins")
    (version "0.10.36")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://gstreamer.freedesktop.org")
                    (commit "v0.10.36")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://gstreamer.freedesktop.org/")
    (synopsis "GStreamer Multimedia Framework Base Plugins (gst-plugins-base)")
    (description "GStreamer Multimedia Framework Base Plugins (gst-plugins-base).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. idris2-algebra --- Lawful algebraic structures in Idris2
;;; AUR: idris2-algebra-git
;;; -------------------------------------------------------------------
(define-public idris2-algebra
  (package
    (name "idris2-algebra")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefan-hoeck/idris2-algebra")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stefan-hoeck/idris2-algebra")
    (synopsis "lawful algebraic structures in Idris2")
    (description "Lawful algebraic structures in Idris2.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. idris2-elab-util --- Utilities for elaborator reflection in Idris2
;;; AUR: idris2-elab-util-git
;;; -------------------------------------------------------------------
(define-public idris2-elab-util
  (package
    (name "idris2-elab-util")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefan-hoeck/idris2-elab-util")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stefan-hoeck/idris2-elab-util")
    (synopsis "utilities for elaborator reflection in Idris2")
    (description "Utilities for elaborator reflection in Idris2.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. idris2-getopts --- Processing command line options in Idris2
;;; AUR: idris2-getopts-git
;;; -------------------------------------------------------------------
(define-public idris2-getopts
  (package
    (name "idris2-getopts")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/idris-community/idris2-getopts")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/idris-community/idris2-getopts")
    (synopsis "processing command line options in Idris2")
    (description "Processing command line options in Idris2.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. idris2-parser-all --- Various total parsers for Idris2
;;; AUR: idris2-parser-all-git
;;; -------------------------------------------------------------------
(define-public idris2-parser-all
  (package
    (name "idris2-parser-all")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefan-hoeck/idris2-parser")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stefan-hoeck/idris2-parser")
    (synopsis "various total parsers for Idris2")
    (description "Various total parsers for Idris2.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. idris2-parser --- Total lexer and parser for Idris2
;;; AUR: idris2-parser-git
;;; -------------------------------------------------------------------
(define-public idris2-parser
  (package
    (name "idris2-parser")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefan-hoeck/idris2-parser")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stefan-hoeck/idris2-parser")
    (synopsis "total lexer and parser for Idris2")
    (description "Total lexer and parser for Idris2.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. idris2-prettier --- Bernarnt style pretty-printer for Idris2
;;; AUR: idris2-prettier-git
;;; -------------------------------------------------------------------
(define-public idris2-prettier
  (package
    (name "idris2-prettier")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Z-snails/prettier")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Z-snails/prettier")
    (synopsis "bernarnt style pretty-printer for Idris2")
    (description "Bernarnt style pretty-printer for Idris2.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. idris2-refined --- Refinedment types for Idris2
;;; AUR: idris2-refined-git
;;; -------------------------------------------------------------------
(define-public idris2-refined
  (package
    (name "idris2-refined")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefan-hoeck/idris2-refined")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stefan-hoeck/idris2-refined")
    (synopsis "refinedment types for Idris2")
    (description "Refinedment types for Idris2.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. idris2-sop --- Generic representation of data types as sums of products
;;; AUR: idris2-sop-git
;;; -------------------------------------------------------------------
(define-public idris2-sop
  (package
    (name "idris2-sop")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefan-hoeck/idris2-sop")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stefan-hoeck/idris2-sop")
    (synopsis "generic representation of data types as sums of products")
    (description "Generic representation of data types as sums of products.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. freetype2-wps --- Font rasterization library, fix fakebold render issue for Ki
;;; AUR: freetype2-wps
;;; -------------------------------------------------------------------
(define-public freetype2-wps
  (package
    (name "freetype2-wps")
    (version "2.13.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.freetype.org")
                    (commit "v2.13.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://www.freetype.org/")
    (synopsis "font rasterization library, fix fakebold render issue for Kingsoft Office ")
    (description "Font rasterization library, fix fakebold render issue for Kingsoft Office (WPS Office) when freetype2>2.13.0.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. 123elf --- Native port of Lotus 1-2-3 to Linux.
;;; AUR: 123elf
;;; -------------------------------------------------------------------
(define-public 123elf
  (package
    (name "123elf")
    (version "1.0.0rc4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/taviso/123elf")
                    (commit "v1.0.0rc4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/taviso/123elf")
    (synopsis "native port of Lotus 1-2-3 to Linux")
    (description "Native port of Lotus 1-2-3 to Linux.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. gauntlet --- Raycast-inspired open-source cross-platform application laun
;;; AUR: gauntlet-git
;;; -------------------------------------------------------------------
(define-public gauntlet
  (package
    (name "gauntlet")
    (version "20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/project-gauntlet/gauntlet")
                    (commit "v20")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/project-gauntlet/gauntlet")
    (synopsis "raycast-inspired open-source cross-platform application launcher with Reac")
    (description "Raycast-inspired open-source cross-platform application launcher with React-based plugins.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 13. go-foks --- CLI for Federated Open Key Service
;;; AUR: go-foks
;;; -------------------------------------------------------------------
(define-public go-foks
  (package
    (name "go-foks")
    (version "0.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://foks.pub")
                    (commit "v0.1.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (home-page "https://foks.pub")
    (synopsis "CLI for Federated Open Key Service")
    (description "CLI for Federated Open Key Service.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. polybar-dwm --- polybar fork with a dwm module
;;; AUR: polybar-dwm-git
;;; -------------------------------------------------------------------
(define-public polybar-dwm
  (package
    (name "polybar-dwm")
    (version "3.7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sipragtel/polybar-dwm")
                    (commit "v3.7.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sipragtel/polybar-dwm")
    (synopsis "polybar fork with a dwm module")
    (description "polybar fork with a dwm module.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. python-langgraph-checkpoint-postgres --- Library with a Postgres implementation of LangGraph checkpoi
;;; AUR: python-langgraph-checkpoint-postgres
;;; -------------------------------------------------------------------
(define-public python-langgraph-checkpoint-postgres
  (package
    (name "python-langgraph-checkpoint-postgres")
    (version "3.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-postgres")
                    (commit "v3.0.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-postgres")
    (synopsis "library with a Postgres implementation of LangGraph checkpoint saver")
    (description "Library with a Postgres implementation of LangGraph checkpoint saver.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. so --- A terminal interface for StackOverflow
;;; AUR: so-git
;;; -------------------------------------------------------------------
(define-public so
  (package
    (name "so")
    (version "r109.1b0b2f9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/samtay/so")
                    (commit "vr109.1b0b2f9")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/samtay/so")
    (synopsis "a terminal interface for StackOverflow")
    (description "A terminal interface for StackOverflow.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. zelda64recomp --- A port of The Legend of Zelda Majora's Mask made possible by
;;; AUR: zelda64recomp-git
;;; -------------------------------------------------------------------
(define-public zelda64recomp
  (package
    (name "zelda64recomp")
    (version "1.2.2.r0.g54950a1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zelda64Recomp/Zelda64Recomp")
                    (commit "v1.2.2.r0.g54950a1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Zelda64Recomp/Zelda64Recomp")
    (synopsis "a port of The Legend of Zelda Majora's Mask made possible by static recomp")
    (description "A port of The Legend of Zelda Majora's Mask made possible by static recompilation (git).")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. raiderio-client --- raider.io desktop client for Linux
;;; AUR: raiderio-client
;;; -------------------------------------------------------------------
(define-public raiderio-client
  (package
    (name "raiderio-client")
    (version "4.10.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://raider.io")
                    (commit "v4.10.7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://raider.io/")
    (synopsis "raider.io desktop client for Linux")
    (description "raider.io desktop client for Linux.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. weakauras-companion --- Provide the missing link between Wago.io and World of Warcra
;;; AUR: weakauras-companion
;;; -------------------------------------------------------------------
(define-public weakauras-companion
  (package
    (name "weakauras-companion")
    (version "5.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://weakauras.wtf")
                    (commit "v5.3.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (home-page "https://weakauras.wtf/")
    (synopsis "provide the missing link between Wago.io and World of Warcraft.(Use system")
    (description "Provide the missing link between Wago.io and World of Warcraft.(Use system-wide electron).")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 20. valentina-studio --- Create, administer, query and explore DuckDB, ValentinaDB, M
;;; AUR: valentina-studio
;;; -------------------------------------------------------------------
(define-public valentina-studio
  (package
    (name "valentina-studio")
    (version "17.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://www.valentina-db.com")
                    (commit "v17.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.valentina-db.com")
    (synopsis "create, administer, query and explore DuckDB, ValentinaDB, MongoDB, MySQL,")
    (description "Create, administer, query and explore DuckDB, ValentinaDB, MongoDB, MySQL, MariaDB, PostgreSQL, MS SQL Server & SQLite databases for FREE.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. input-actions --- Mouse and touchpad gestures for Plasma 6 Wayland (deprecated
;;; AUR: input-actions
;;; -------------------------------------------------------------------
(define-public input-actions
  (package
    (name "input-actions")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/taj-ny/InputActions")
                    (commit "v0.7.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/taj-ny/InputActions")
    (synopsis "mouse and touchpad gestures for Plasma 6 Wayland (deprecated package)")
    (description "Mouse and touchpad gestures for Plasma 6 Wayland (deprecated package).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. svelte-language-server --- Svelte Language Server, git master build
;;; AUR: svelte-language-server-git
;;; -------------------------------------------------------------------
(define-public svelte-language-server
  (package
    (name "svelte-language-server")
    (version "r1803.6ad05e5b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sveltejs/language-tools")
                    (commit "vr1803.6ad05e5b")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (home-page "https://github.com/sveltejs/language-tools")
    (synopsis "svelte Language Server, git master build")
    (description "Svelte Language Server, git master build.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. typescript-go --- Staging repo for development of native port of TypeScript
;;; AUR: typescript-go-git
;;; -------------------------------------------------------------------
(define-public typescript-go
  (package
    (name "typescript-go")
    (version "428.048ac9666")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/microsoft/typescript-go")
                    (commit "v428.048ac9666")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (home-page "https://github.com/microsoft/typescript-go")
    (synopsis "staging repo for development of native port of TypeScript")
    (description "Staging repo for development of native port of TypeScript.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 24. renoise-demo --- A music composition program
;;; AUR: renoise-demo
;;; -------------------------------------------------------------------
(define-public renoise-demo
  (package
    (name "renoise-demo")
    (version "3.5.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.renoise.com")
                    (commit "v3.5.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.renoise.com")
    (synopsis "a music composition program")
    (description "A music composition program.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. hyprprop --- xprop for Hyprland
;;; AUR: hyprprop-git
;;; -------------------------------------------------------------------
(define-public hyprprop
  (package
    (name "hyprprop")
    (version "r0.0000000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vilari-mickopf/hyprprop")
                    (commit "vr0.0000000")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vilari-mickopf/hyprprop")
    (synopsis "xprop for Hyprland")
    (description "xprop for Hyprland.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. detect-tablet-mode --- Detects both normal & tablet mode, executing custom scripts/
;;; AUR: detect-tablet-mode-git
;;; -------------------------------------------------------------------
(define-public detect-tablet-mode
  (package
    (name "detect-tablet-mode")
    (version "r29.626e81c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alesya-h/linux_detect_tablet_mode")
                    (commit "vr29.626e81c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (home-page "https://github.com/alesya-h/linux_detect_tablet_mode")
    (synopsis "detects both normal & tablet mode, executing custom scripts/commands for e")
    (description "Detects both normal & tablet mode, executing custom scripts/commands for each mode. See the github page for instructions.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. hyprevents --- Invoke shell functions in response to Hyprland socket2 event
;;; AUR: hyprevents-git
;;; -------------------------------------------------------------------
(define-public hyprevents
  (package
    (name "hyprevents")
    (version "r0.0000000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vilari-mickopf/hyprevents")
                    (commit "vr0.0000000")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vilari-mickopf/hyprevents")
    (synopsis "invoke shell functions in response to Hyprland socket2 events")
    (description "Invoke shell functions in response to Hyprland socket2 events.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. lazyusf2 --- Library for decoding Nintendo 64 Sound Format files using Mu
;;; AUR: lazyusf2-git
;;; -------------------------------------------------------------------
(define-public lazyusf2
  (package
    (name "lazyusf2")
    (version "r102.909406c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://bitbucket.org/losnoco/lazyusf2")
                    (commit "vr102.909406c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://bitbucket.org/losnoco/lazyusf2")
    (synopsis "library for decoding Nintendo 64 Sound Format files using Mupen64plus")
    (description "Library for decoding Nintendo 64 Sound Format files using Mupen64plus.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. brother-dcp-j1050dw --- LPR driver and CUPS wrapper for Brother DCP-J1050DW
;;; AUR: brother-dcp-j1050dw
;;; -------------------------------------------------------------------
(define-public brother-dcp-j1050dw
  (package
    (name "brother-dcp-j1050dw")
    (version "3.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://support.brother.com/g/b/producttop.aspx?c=fr&lang=fr&prod=dcpj1050dw_eu_as")
                    (commit "v3.5.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://support.brother.com/g/b/producttop.aspx?c=fr&lang=fr&prod=dcpj1050dw_eu_as")
    (synopsis "LPR driver and CUPS wrapper for Brother DCP-J1050DW")
    (description "LPR driver and CUPS wrapper for Brother DCP-J1050DW.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. iw4x-launcher --- iw4x updater & launcher
;;; AUR: iw4x-launcher-git
;;; -------------------------------------------------------------------
(define-public iw4x-launcher
  (package
    (name "iw4x-launcher")
    (version "0.10.10.r0.g799a8eb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iw4x/launcher")
                    (commit "v0.10.10.r0.g799a8eb")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/iw4x/launcher")
    (synopsis "iw4x updater & launcher")
    (description "iw4x updater & launcher.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 31. psflib --- A small C library for reading Portable Sound Format files
;;; AUR: psflib-git
;;; -------------------------------------------------------------------
(define-public psflib
  (package
    (name "psflib")
    (version "r49.87f070c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://bitbucket.org/losnoco/psflib")
                    (commit "vr49.87f070c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://bitbucket.org/losnoco/psflib")
    (synopsis "a small C library for reading Portable Sound Format files")
    (description "A small C library for reading Portable Sound Format files.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 32. ruby-ruby-wasm --- Ruby to WebAssembly toolkit.
;;; AUR: ruby-ruby_wasm
;;; -------------------------------------------------------------------
(define-public ruby-ruby-wasm
  (package
    (name "ruby-ruby-wasm")
    (version "2.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://rubygems.org/gems/ruby_wasm")
                    (commit "v2.8.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (home-page "https://rubygems.org/gems/ruby_wasm")
    (synopsis "ruby to WebAssembly toolkit")
    (description "Ruby to WebAssembly toolkit.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 33. saxon-he --- XSLT 3.0, XQuery 3.1, and XPath 3.1 processor for Java - Hom
;;; AUR: saxon-he
;;; -------------------------------------------------------------------
(define-public saxon-he
  (package
    (name "saxon-he")
    (version "12.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Saxonica/Saxon-HE")
                    (commit "v12.9")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Saxonica/Saxon-HE")
    (synopsis "XSLT 3.0, XQuery 3.1, and XPath 3.1 processor for Java - Home Edition")
    (description "XSLT 3.0, XQuery 3.1, and XPath 3.1 processor for Java - Home Edition.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 34. texlive-garamondx --- URW Garamond No8 Adobe Type1 fonts from CTAN (for texlive)
;;; AUR: texlive-garamondx
;;; -------------------------------------------------------------------
(define-public texlive-garamondx
  (package
    (name "texlive-garamondx")
    (version "1.21")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://www.ctan.org/tex-archive/fonts/garamondx")
                    (commit "v1.21")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "http://www.ctan.org/tex-archive/fonts/garamondx")
    (synopsis "URW Garamond No8 Adobe Type1 fonts from CTAN (for texlive)")
    (description "URW Garamond No8 Adobe Type1 fonts from CTAN (for texlive).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 35. jupyter-latex-envs --- Jupyter notebook extension which supports (some) LaTeX envir
;;; AUR: jupyter_latex_envs
;;; -------------------------------------------------------------------
(define-public jupyter-latex-envs
  (package
    (name "jupyter-latex-envs")
    (version "1.4.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jfbercher/jupyter_latex_envs")
                    (commit "v1.4.6")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/jfbercher/jupyter_latex_envs")
    (synopsis "jupyter notebook extension which supports (some) LaTeX environments within")
    (description "Jupyter notebook extension which supports (some) LaTeX environments within markdown cells.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 36. pypy3-cython --- C-Extensions for PyPy
;;; AUR: pypy3-cython
;;; -------------------------------------------------------------------
(define-public pypy3-cython
  (package
    (name "pypy3-cython")
    (version "3.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://cython.org")
                    (commit "v3.2.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://cython.org")
    (synopsis "c-Extensions for PyPy")
    (description "C-Extensions for PyPy.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 37. easytranscript --- Easy to use transcription-software with a variety of feature
;;; AUR: easytranscript
;;; -------------------------------------------------------------------
(define-public easytranscript
  (package
    (name "easytranscript")
    (version "2.51.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://e-werkzeug.eu/index.php/en/products/easytranscript")
                    (commit "v2.51.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://e-werkzeug.eu/index.php/en/products/easytranscript")
    (synopsis "easy to use transcription-software with a variety of features")
    (description "Easy to use transcription-software with a variety of features.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 38. python-mshr --- Mesh generation component of FEniCS (python interface)
;;; AUR: python-mshr
;;; -------------------------------------------------------------------
(define-public python-mshr
  (package
    (name "python-mshr")
    (version "2019.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/m/mshr/mshr-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (home-page "https://bitbucket.org/fenics-project/mshr")
    (synopsis "mesh generation component of FEniCS (python interface)")
    (description "Mesh generation component of FEniCS (python interface).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 39. brew --- The missing package manager for macOS (or Linux)
;;; AUR: brew-git
;;; -------------------------------------------------------------------
(define-public brew
  (package
    (name "brew")
    (version "2.7.4.r20233.g23c491e5bc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Homebrew/brew")
                    (commit "v2.7.4.r20233.g23c491e5bc")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (home-page "https://github.com/Homebrew/brew")
    (synopsis "the missing package manager for macOS (or Linux)")
    (description "The missing package manager for macOS (or Linux).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. networkmanager-openvpn-xor --- NetworkManager VPN plugin for Standard and XOR Patched OpenV
;;; AUR: networkmanager-openvpn-xor
;;; -------------------------------------------------------------------
(define-public networkmanager-openvpn-xor
  (package
    (name "networkmanager-openvpn-xor")
    (version "1.12.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://networkmanager.dev/docs/vpn")
                    (commit "v1.12.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://networkmanager.dev/docs/vpn/")
    (synopsis "networkManager VPN plugin for Standard and XOR Patched OpenVPN")
    (description "NetworkManager VPN plugin for Standard and XOR Patched OpenVPN.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 41. chrome-manifest-v2-policy --- Google Chrome Policy to keep manifest v2 extensions enabled
;;; AUR: chrome-manifest-v2-policy
;;; -------------------------------------------------------------------
(define-public chrome-manifest-v2-policy
  (package
    (name "chrome-manifest-v2-policy")
    (version "1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uBlockOrigin/uBlock-issues/discussions/2977#discussioncomment-9521603")
                    (commit "v1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/uBlockOrigin/uBlock-issues/discussions/2977#discussioncomment-9521603")
    (synopsis "google Chrome Policy to keep manifest v2 extensions enabled")
    (description "Google Chrome Policy to keep manifest v2 extensions enabled.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 42. python-numpy-mkl --- Scientific tools for Python, compiled with Intel MKL
;;; AUR: python-numpy-mkl
;;; -------------------------------------------------------------------
(define-public python-numpy-mkl
  (package
    (name "python-numpy-mkl")
    (version "2.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/n/numpy-mkl/numpy-mkl-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (home-page "https://numpy.org")
    (synopsis "scientific tools for Python, compiled with Intel MKL")
    (description "Scientific tools for Python, compiled with Intel MKL.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 43. nerdshade --- hyprsunset client to smoothly transition color temperature d
;;; AUR: nerdshade
;;; -------------------------------------------------------------------
(define-public nerdshade
  (package
    (name "nerdshade")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sstark/nerdshade")
                    (commit "v1.3.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sstark/nerdshade")
    (synopsis "hyprsunset client to smoothly transition color temperature during sunrise/")
    (description "hyprsunset client to smoothly transition color temperature during sunrise/sunset.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 44. libva-intel-driver-irql --- VA-API implementation for Intel G45 and HD Graphics family (
;;; AUR: libva-intel-driver-irql
;;; -------------------------------------------------------------------
(define-public libva-intel-driver-irql
  (package
    (name "libva-intel-driver-irql")
    (version "2.4.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/irql-notlessorequal/intel-vaapi-driver")
                    (commit "v2.4.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/irql-notlessorequal/intel-vaapi-driver")
    (synopsis "VA-API implementation for Intel G45 and HD Graphics family (IRQL fork)")
    (description "VA-API implementation for Intel G45 and HD Graphics family (IRQL fork).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 45. pixivfe --- An open source alternative frontend for Pixiv
;;; AUR: pixivfe
;;; -------------------------------------------------------------------
(define-public pixivfe
  (package
    (name "pixivfe")
    (version "3.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/PixivFE/PixivFE")
                    (commit "v3.0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (home-page "https://codeberg.org/PixivFE/PixivFE")
    (synopsis "an open source alternative frontend for Pixiv")
    (description "An open source alternative frontend for Pixiv.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 46. skyscraper --- Powerful and versatile game scraper written in C++. Gemba's 
;;; AUR: skyscraper-git
;;; -------------------------------------------------------------------
(define-public skyscraper
  (package
    (name "skyscraper")
    (version "r3075.0e3fa5d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Gemba/skyscraper")
                    (commit "vr3075.0e3fa5d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Gemba/skyscraper")
    (synopsis "powerful and versatile game scraper written in C++. Gemba's fork")
    (description "Powerful and versatile game scraper written in C++. Gemba's fork.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 47. emulationstation --- Emulation Station is a flexible emulator front-end supportin
;;; AUR: emulationstation
;;; -------------------------------------------------------------------
(define-public emulationstation
  (package
    (name "emulationstation")
    (version "2.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RetroPie/EmulationStation")
                    (commit "v2.11.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/RetroPie/EmulationStation")
    (synopsis "emulation Station is a flexible emulator front-end supporting keyboardless")
    (description "Emulation Station is a flexible emulator front-end supporting keyboardless navigation and custom system themes.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 48. nym-vpnd --- NymVPN daemon as a systemd service
;;; AUR: nym-vpnd
;;; -------------------------------------------------------------------
(define-public nym-vpnd
  (package
    (name "nym-vpnd")
    (version "1.27.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nymtech/nym-vpn-client")
                    (commit "v1.27.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (home-page "https://github.com/nymtech/nym-vpn-client")
    (synopsis "nymVPN daemon as a systemd service")
    (description "NymVPN daemon as a systemd service.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 49. guix-installer --- A command line installer for Guix
;;; AUR: guix-installer
;;; -------------------------------------------------------------------
(define-public guix-installer
  (package
    (name "guix-installer")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.gnu.org/software/guix")
                    (commit "v1.4.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.gnu.org/software/guix/")
    (synopsis "a command line installer for Guix")
    (description "A command line installer for Guix.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 50. web-greeter --- A modern, visually appealing greeter for LightDM
;;; AUR: web-greeter
;;; -------------------------------------------------------------------
(define-public web-greeter
  (package
    (name "web-greeter")
    (version "3.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JezerM/web-greeter")
                    (commit "v3.5.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JezerM/web-greeter")
    (synopsis "a modern, visually appealing greeter for LightDM")
    (description "A modern, visually appealing greeter for LightDM.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 51. dmenu-extended --- An extension to dmenu for quickly opening files and folders 
;;; AUR: dmenu-extended-git
;;; -------------------------------------------------------------------
(define-public dmenu-extended
  (package
    (name "dmenu-extended")
    (version "r421.7ad25c0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/markjones112358/dmenu-extended")
                    (commit "vr421.7ad25c0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/markjones112358/dmenu-extended")
    (synopsis "an extension to dmenu for quickly opening files and folders and run programs")
    (description "An extension to dmenu for quickly opening files and folders and run programs.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 52. labymodlauncher-appimage --- A launcher for LabyMod, a Minecraft client that adds a bunch
;;; AUR: labymodlauncher-appimage
;;; -------------------------------------------------------------------
(define-public labymodlauncher-appimage
  (package
    (name "labymodlauncher-appimage")
    (version "2.1.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.labymod.net")
                    (commit "v2.1.12")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("labymodlauncher" "bin/labymodlauncher"))))
    (home-page "https://www.labymod.net")
    (synopsis "a launcher for LabyMod, a Minecraft client that adds a bunch of useful fea")
    (description "A launcher for LabyMod, a Minecraft client that adds a bunch of useful features.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 53. intel-ucode-platomav --- Microcode update files for Intel CPUs
;;; AUR: intel-ucode-platomav-git
;;; -------------------------------------------------------------------
(define-public intel-ucode-platomav
  (package
    (name "intel-ucode-platomav")
    (version "r28.360b8e9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/platomav/CPUMicrocodes")
                    (commit "vr28.360b8e9")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/platomav/CPUMicrocodes")
    (synopsis "microcode update files for Intel CPUs")
    (description "Microcode update files for Intel CPUs.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 54. cosmic-ext-applet-privacy-indicator --- Privacy indicator for the COSMIC Desktop
;;; AUR: cosmic-ext-applet-privacy-indicator
;;; -------------------------------------------------------------------
(define-public cosmic-ext-applet-privacy-indicator
  (package
    (name "cosmic-ext-applet-privacy-indicator")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/D-Brox/cosmic-ext-applet-privacy-indicator")
                    (commit "v0.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/D-Brox/cosmic-ext-applet-privacy-indicator")
    (synopsis "privacy indicator for the COSMIC Desktop")
    (description "Privacy indicator for the COSMIC Desktop.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 55. stremio-linux-shell --- A native Linux client for Stremio
;;; AUR: stremio-linux-shell-git
;;; -------------------------------------------------------------------
(define-public stremio-linux-shell
  (package
    (name "stremio-linux-shell")
    (version "1.0.0.beta.11.r5.gca88264")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Stremio/stremio-linux-shell")
                    (commit "v1.0.0.beta.11.r5.gca88264")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/Stremio/stremio-linux-shell")
    (synopsis "a native Linux client for Stremio")
    (description "A native Linux client for Stremio.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 56. helix-gpt --- Code assistant language server for Helix with support among 
;;; AUR: helix-gpt-git
;;; -------------------------------------------------------------------
(define-public helix-gpt
  (package
    (name "helix-gpt")
    (version "0.34+7+g494daf6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leona/helix-gpt")
                    (commit "v0.34+7+g494daf6")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/leona/helix-gpt")
    (synopsis "code assistant language server for Helix with support among many LLMs")
    (description "Code assistant language server for Helix with support among many LLMs.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 57. oh-my-git --- An interactive Git learning game!
;;; AUR: oh-my-git-git
;;; -------------------------------------------------------------------
(define-public oh-my-git
  (package
    (name "oh-my-git")
    (version "0.6.5.r23.gc64e8f2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://ohmygit.org")
                    (commit "v0.6.5.r23.gc64e8f2")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://ohmygit.org/")
    (synopsis "an interactive Git learning game!")
    (description "An interactive Git learning game!.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 58. dislocker-noruby --- Read/write BitLocker-encrypted volumes (no ruby bindings/dep
;;; AUR: dislocker-noruby
;;; -------------------------------------------------------------------
(define-public dislocker-noruby
  (package
    (name "dislocker-noruby")
    (version "0.7.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aorimn/dislocker")
                    (commit "v0.7.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Aorimn/dislocker")
    (synopsis "read/write BitLocker-encrypted volumes (no ruby bindings/dependency)")
    (description "Read/write BitLocker-encrypted volumes (no ruby bindings/dependency).")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 59. wine-valve --- A compatibility layer for running Windows programs (Valve ve
;;; AUR: wine-valve
;;; -------------------------------------------------------------------
(define-public wine-valve
  (package
    (name "wine-valve")
    (version "9.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ValveSoftware/wine")
                    (commit "v9.0.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ValveSoftware/wine.git")
    (synopsis "a compatibility layer for running Windows programs (Valve version)")
    (description "A compatibility layer for running Windows programs (Valve version).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 60. garage-webui --- Garage去中心化的存储服务的前端UI界面。
;;; AUR: garage-webui
;;; -------------------------------------------------------------------
(define-public garage-webui
  (package
    (name "garage-webui")
    (version "1.0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/khairul169/garage-webui")
                    (commit "v1.0.9")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/khairul169/garage-webui")
    (synopsis "garage去中心化的存储服务的前端UI界面。")
    (description "Garage去中心化的存储服务的前端UI界面。.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 61. paf-notify --- Notifies about pacman, AUR, and flatpak updates
;;; AUR: paf-notify
;;; -------------------------------------------------------------------
(define-public paf-notify
  (package
    (name "paf-notify")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JakubCzarnota/paf-notify")
                    (commit "v1.0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JakubCzarnota/paf-notify")
    (synopsis "notifies about pacman, AUR, and flatpak updates")
    (description "Notifies about pacman, AUR, and flatpak updates.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 62. creduce --- A C program reducer.
;;; AUR: creduce-git
;;; -------------------------------------------------------------------
(define-public creduce
  (package
    (name "creduce")
    (version "2.10.0.99.g9250247")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/csmith-project/creduce")
                    (commit "v2.10.0.99.g9250247")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/csmith-project/creduce")
    (synopsis "a C program reducer")
    (description "A C program reducer.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 63. neo4j-desktop --- GUI for managing local and remote Neo4j Graph databases
;;; AUR: neo4j-desktop
;;; -------------------------------------------------------------------
(define-public neo4j-desktop
  (package
    (name "neo4j-desktop")
    (version "1.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://neo4j.org")
                    (commit "v1.6.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://neo4j.org/")
    (synopsis "GUI for managing local and remote Neo4j Graph databases")
    (description "GUI for managing local and remote Neo4j Graph databases.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 64. caddy-desec --- Caddy web server
;;; AUR: caddy-desec
;;; -------------------------------------------------------------------
(define-public caddy-desec
  (package
    (name "caddy-desec")
    (version "2.10.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/caddyserver/caddy")
                    (commit "v2.10.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (home-page "https://github.com/caddyserver/caddy")
    (synopsis "caddy web server")
    (description "Caddy web server.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 65. python-stumpy --- powerful and scalable library that computes the matrix profi
;;; AUR: python-stumpy-git
;;; -------------------------------------------------------------------
(define-public python-stumpy
  (package
    (name "python-stumpy")
    (version "1.8.0.r3.gc76f668")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TDAmeritrade/stumpy")
                    (commit "v1.8.0.r3.gc76f668")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (home-page "https://github.com/TDAmeritrade/stumpy")
    (synopsis "powerful and scalable library that computes the matrix profile")
    (description "powerful and scalable library that computes the matrix profile.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 66. sunfalo --- Automatic screen color temperature daemon for Hyprland using
;;; AUR: sunfalo
;;; -------------------------------------------------------------------
(define-public sunfalo
  (package
    (name "sunfalo")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/tomkoid/sunfalo")
                    (commit "v0.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (home-page "https://codeberg.org/tomkoid/sunfalo")
    (synopsis "automatic screen color temperature daemon for Hyprland using hyprsunset")
    (description "Automatic screen color temperature daemon for Hyprland using hyprsunset.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 67. perl-cpanplus-dist-arch --- CPANPLUS backend for building Archlinux pacman packages
;;; AUR: perl-cpanplus-dist-arch
;;; -------------------------------------------------------------------
(define-public perl-cpanplus-dist-arch
  (package
    (name "perl-cpanplus-dist-arch")
    (version "1.32")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://metacpan.org/release/CPANPLUS-Dist-Arch")
                    (commit "v1.32")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/CPANPLUS-Dist-Arch")
    (synopsis "CPANPLUS backend for building Archlinux pacman packages")
    (description "CPANPLUS backend for building Archlinux pacman packages.")
    (license license:artistic2.0)))

;;; -------------------------------------------------------------------
;;; 68. brother-mfc-9332cdw --- LPR and CUPS drivers for Brother MFC-9332CDW
;;; AUR: brother-mfc-9332cdw
;;; -------------------------------------------------------------------
(define-public brother-mfc-9332cdw
  (package
    (name "brother-mfc-9332cdw")
    (version "20170302")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://support.brother.com/g/b/downloadlist.aspx?c=de&lang=de&prod=mfc9332cdw_eu&os=128&flang=English")
                    (commit "v20170302")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://support.brother.com/g/b/downloadlist.aspx?c=de&lang=de&prod=mfc9332cdw_eu&os=128&flang=English")
    (synopsis "LPR and CUPS drivers for Brother MFC-9332CDW")
    (description "LPR and CUPS drivers for Brother MFC-9332CDW.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 69. steam-big-picture-session --- A gamescope session for Steam Big Picture mode straight from
;;; AUR: steam-big-picture-session
;;; -------------------------------------------------------------------
(define-public steam-big-picture-session
  (package
    (name "steam-big-picture-session")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aethar01/steam-big-picture-session")
                    (commit "v0.0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Aethar01/steam-big-picture-session")
    (synopsis "a gamescope session for Steam Big Picture mode straight from the display m")
    (description "A gamescope session for Steam Big Picture mode straight from the display manager.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 70. waybar-module-music --- A Waybar module to show & control the current MPRIS media pl
;;; AUR: waybar-module-music-git
;;; -------------------------------------------------------------------
(define-public waybar-module-music
  (package
    (name "waybar-module-music")
    (version "0.4.1_r235.39e4371")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Andeskjerf/waybar-module-music")
                    (commit "v0.4.1_r235.39e4371")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/Andeskjerf/waybar-module-music")
    (synopsis "a Waybar module to show & control the current MPRIS media players state")
    (description "A Waybar module to show & control the current MPRIS media players state.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 71. zenta --- Mindfulness for terminal users (development version)
;;; AUR: zenta-git
;;; -------------------------------------------------------------------
(define-public zenta
  (package
    (name "zenta")
    (version "1.1.0.r0.g4591320")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/e6a5/zenta")
                    (commit "v1.1.0.r0.g4591320")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (home-page "https://github.com/e6a5/zenta")
    (synopsis "mindfulness for terminal users (development version)")
    (description "Mindfulness for terminal users (development version).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 72. snapmate --- Timeshift snapshot utility to create snapshots before upgrad
;;; AUR: snapmate
;;; -------------------------------------------------------------------
(define-public snapmate
  (package
    (name "snapmate")
    (version "0.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/flopana/snapmate")
                    (commit "v0.0.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (home-page "https://github.com/flopana/snapmate")
    (synopsis "timeshift snapshot utility to create snapshots before upgrade with useful ")
    (description "Timeshift snapshot utility to create snapshots before upgrade with useful comments.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 73. decklink --- Drivers for Blackmagic Design DeckLink, Intensity or Multibr
;;; AUR: decklink
;;; -------------------------------------------------------------------
(define-public decklink
  (package
    (name "decklink")
    (version "16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.blackmagicdesign.com/support/family/capture-and-playback")
                    (commit "v16.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.blackmagicdesign.com/support/family/capture-and-playback")
    (synopsis "drivers for Blackmagic Design DeckLink, Intensity or Multibridge video edi")
    (description "Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 74. mediaexpress --- Drivers for Blackmagic Design DeckLink, Intensity or Multibr
;;; AUR: mediaexpress
;;; -------------------------------------------------------------------
(define-public mediaexpress
  (package
    (name "mediaexpress")
    (version "16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.blackmagicdesign.com/support/family/capture-and-playback")
                    (commit "v16.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.blackmagicdesign.com/support/family/capture-and-playback")
    (synopsis "drivers for Blackmagic Design DeckLink, Intensity or Multibridge video edi")
    (description "Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 75. chromium-extension-privacybadger --- Block third party tracking in your browser
;;; AUR: chromium-extension-privacybadger
;;; -------------------------------------------------------------------
(define-public chromium-extension-privacybadger
  (package
    (name "chromium-extension-privacybadger")
    (version "2024.2.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://privacybadger.org")
                    (commit "v2024.2.6")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://privacybadger.org/")
    (synopsis "block third party tracking in your browser")
    (description "Block third party tracking in your browser.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 76. crosswords-puzzle-sets-keesing --- Dutch and Flemish puzzles from Keesing.com for the app Cross
;;; AUR: crosswords-puzzle-sets-keesing
;;; -------------------------------------------------------------------
(define-public crosswords-puzzle-sets-keesing
  (package
    (name "crosswords-puzzle-sets-keesing")
    (version "4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/philip.goto/puzzle-sets-keesing")
                    (commit "v4.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.gnome.org/philip.goto/puzzle-sets-keesing")
    (synopsis "dutch and Flemish puzzles from Keesing.com for the app Crosswords")
    (description "Dutch and Flemish puzzles from Keesing.com for the app Crosswords.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 77. d4m --- Project Diva MegaMix+ mod manager
;;; AUR: d4m-git
;;; -------------------------------------------------------------------
(define-public d4m
  (package
    (name "d4m")
    (version "r191.4b493ff")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brod8362/d4m")
                    (commit "vr191.4b493ff")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/brod8362/d4m")
    (synopsis "project Diva MegaMix+ mod manager")
    (description "Project Diva MegaMix+ mod manager.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 78. liblastfm-qt6 --- A Qt C++ library for the Last.fm webservices (Qt6 port)
;;; AUR: liblastfm-qt6-git
;;; -------------------------------------------------------------------
(define-public liblastfm-qt6
  (package
    (name "liblastfm-qt6")
    (version "1.2.0.r685.81e8f9d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mazhoon/liblastfm")
                    (commit "v1.2.0.r685.81e8f9d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Mazhoon/liblastfm/")
    (synopsis "a Qt C++ library for the Last.fm webservices (Qt6 port)")
    (description "A Qt C++ library for the Last.fm webservices (Qt6 port).")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 79. nkt --- command line tool for helping you track and build your notes
;;; AUR: nkt
;;; -------------------------------------------------------------------
(define-public nkt
  (package
    (name "nkt")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~fjebaker/nkt")
                    (commit "v0.3.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://git.sr.ht/~fjebaker/nkt")
    (synopsis "command line tool for helping you track and build your notes, todo lists, ")
    (description "command line tool for helping you track and build your notes, todo lists, habits, and more.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 80. samrewritten-legacy --- Steam Achievement Manager (legacy version compatible with no
;;; AUR: samrewritten-legacy-git
;;; -------------------------------------------------------------------
(define-public samrewritten-legacy
  (package
    (name "samrewritten-legacy")
    (version "r266.02fea42")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PaulCombal/SamRewritten-legacy")
                    (commit "vr266.02fea42")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/PaulCombal/SamRewritten-legacy")
    (synopsis "steam Achievement Manager (legacy version compatible with non-Snap Steam)")
    (description "Steam Achievement Manager (legacy version compatible with non-Snap Steam).")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 81. vinyl-papers --- Paper selection utility for Vinyl
;;; AUR: vinyl-papers
;;; -------------------------------------------------------------------
(define-public vinyl-papers
  (package
    (name "vinyl-papers")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://tvoygit.ru/vi_is_lonely/vinyl")
                    (commit "v1.1.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://tvoygit.ru/vi_is_lonely/vinyl")
    (synopsis "paper selection utility for Vinyl")
    (description "Paper selection utility for Vinyl.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 82. xtool-creative-space --- The Strongest Yet Easiest Laser Software
;;; AUR: xtool-creative-space
;;; -------------------------------------------------------------------
(define-public xtool-creative-space
  (package
    (name "xtool-creative-space")
    (version "2.7.22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.xtool.com/pages/software")
                    (commit "v2.7.22")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.xtool.com/pages/software")
    (synopsis "the Strongest Yet Easiest Laser Software")
    (description "The Strongest Yet Easiest Laser Software.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 83. brn --- Text editor based bulk rename utility.
;;; AUR: brn-git
;;; -------------------------------------------------------------------
(define-public brn
  (package
    (name "brn")
    (version "r31.454e213")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nimaipatel/brn")
                    (commit "vr31.454e213")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nimaipatel/brn/")
    (synopsis "text editor based bulk rename utility")
    (description "Text editor based bulk rename utility.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 84. ros2-kilted-base --- A set of software libraries and tools for building robot app
;;; AUR: ros2-kilted-base
;;; -------------------------------------------------------------------
(define-public ros2-kilted-base
  (package
    (name "ros2-kilted-base")
    (version "2025.07.28")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://index.ros.org/p/ros_base/#kilted")
                    (commit "v2025.07.28")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://index.ros.org/p/ros_base/#kilted")
    (synopsis "a set of software libraries and tools for building robot applications (Kil")
    (description "A set of software libraries and tools for building robot applications (Kilted Kaiju, base variant).")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 85. deadbeef-plugin-statusnotifier --- plugin for DeaDBeeF that replaces its default tray icon with
;;; AUR: deadbeef-plugin-statusnotifier
;;; -------------------------------------------------------------------
(define-public deadbeef-plugin-statusnotifier
  (package
    (name "deadbeef-plugin-statusnotifier")
    (version "1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vovochka404/deadbeef-statusnotifier-plugin")
                    (commit "v1.6")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vovochka404/deadbeef-statusnotifier-plugin")
    (synopsis "plugin for DeaDBeeF that replaces its default tray icon with one that supp")
    (description "plugin for DeaDBeeF that replaces its default tray icon with one that supports the StatusNotifierIitem protocol.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 86. miracle-wm --- Wayland tiling window manager built on Mir
;;; AUR: miracle-wm-git
;;; -------------------------------------------------------------------
(define-public miracle-wm
  (package
    (name "miracle-wm")
    (version "0.4.1.r72.gc64475e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/miracle-wm-org/miracle-wm")
                    (commit "v0.4.1.r72.gc64475e")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/miracle-wm-org/miracle-wm")
    (synopsis "wayland tiling window manager built on Mir")
    (description "Wayland tiling window manager built on Mir.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 87. rollo-printer --- Rollo Thermal Printer Driver for Linux
;;; AUR: rollo-printer
;;; -------------------------------------------------------------------
(define-public rollo-printer
  (package
    (name "rollo-printer")
    (version "1.8.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.rollo.com/driver-linux")
                    (commit "v1.8.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.rollo.com/driver-linux/")
    (synopsis "rollo Thermal Printer Driver for Linux")
    (description "Rollo Thermal Printer Driver for Linux.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 88. shellcheck-bin-doc --- Man pages for shellcheck-bin
;;; AUR: shellcheck-bin-doc
;;; -------------------------------------------------------------------
(define-public shellcheck-bin-doc
  (package
    (name "shellcheck-bin-doc")
    (version "0.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://shellcheck.net")
                    (commit "v0.11.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://shellcheck.net")
    (synopsis "man pages for shellcheck-bin")
    (description "Man pages for shellcheck-bin.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 89. godot3-export-templates --- Godot export templates for version 3
;;; AUR: godot3-export-templates
;;; -------------------------------------------------------------------
(define-public godot3-export-templates
  (package
    (name "godot3-export-templates")
    (version "3.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://godotengine.org")
                    (commit "v3.6")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://godotengine.org/")
    (synopsis "godot export templates for version 3")
    (description "Godot export templates for version 3.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 90. libsignal-ffi --- Library for the Signal Protocol (ffi component)
;;; AUR: libsignal-ffi
;;; -------------------------------------------------------------------
(define-public libsignal-ffi
  (package
    (name "libsignal-ffi")
    (version "0.92.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/signalapp/libsignal/tree/main/rust/bridge/ffi")
                    (commit "v0.92.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/signalapp/libsignal/tree/main/rust/bridge/ffi")
    (synopsis "library for the Signal Protocol (ffi component)")
    (description "Library for the Signal Protocol (ffi component).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 91. scenefx-0.2 --- A drop-in replacement for the wlroots scene API that allows 
;;; AUR: scenefx-0.2
;;; -------------------------------------------------------------------
(define-public scenefx-0.2
  (package
    (name "scenefx-0.2")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wlrfx/scenefx")
                    (commit "v0.2.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/wlrfx/scenefx")
    (synopsis "a drop-in replacement for the wlroots scene API that allows wayland compos")
    (description "A drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 92. azahar-appimage --- Azahar is an open-source 3DS emulator project based on Citra
;;; AUR: azahar-appimage
;;; -------------------------------------------------------------------
(define-public azahar-appimage
  (package
    (name "azahar-appimage")
    (version "2125.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://azahar-emu.org")
                    (commit "v2125.0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("azahar" "bin/azahar"))))
    (home-page "https://azahar-emu.org")
    (synopsis "azahar is an open-source 3DS emulator project based on Citra. (already com")
    (description "Azahar is an open-source 3DS emulator project based on Citra. (already compiled).")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 93. finalshell --- FinalShell是一体化的的服务器、网络管理软件，不仅是ssh客户端，还是功能强大的开发、运维工具，充分满足开发、运
;;; AUR: finalshell
;;; -------------------------------------------------------------------
(define-public finalshell
  (package
    (name "finalshell")
    (version "4.6.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.hostbuf.com")
                    (commit "v4.6.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.hostbuf.com/")
    (synopsis "finalShell是一体化的的服务器、网络管理软件，不仅是ssh客户端，还是功能强大的开发、运维工具，充分满足开发、运维需求。")
    (description "FinalShell是一体化的的服务器、网络管理软件，不仅是ssh客户端，还是功能强大的开发、运维工具，充分满足开发、运维需求。.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 94. mpv-webm --- Simple WebM maker for mpv
;;; AUR: mpv-webm-git
;;; -------------------------------------------------------------------
(define-public mpv-webm
  (package
    (name "mpv-webm")
    (version "r84.9b5da33")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ekisu/mpv-webm")
                    (commit "vr84.9b5da33")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ekisu/mpv-webm")
    (synopsis "simple WebM maker for mpv")
    (description "Simple WebM maker for mpv.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 95. hedgemodmanager --- (UNOFFICIAL PACKAGE) A mod manager for Hedgehog Engine games
;;; AUR: hedgemodmanager-git
;;; -------------------------------------------------------------------
(define-public hedgemodmanager
  (package
    (name "hedgemodmanager")
    (version "8.0.0.beta4.r24")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hedge-dev/HedgeModManager")
                    (commit "v8.0.0.beta4.r24")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/hedge-dev/HedgeModManager")
    (synopsis "(UNOFFICIAL PACKAGE) A mod manager for Hedgehog Engine games on PC")
    (description "(UNOFFICIAL PACKAGE) A mod manager for Hedgehog Engine games on PC.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 96. intel-hybrid-codec-driver --- Libva support for partially hardware accelerated encode and 
;;; AUR: intel-hybrid-codec-driver-git
;;; -------------------------------------------------------------------
(define-public intel-hybrid-codec-driver
  (package
    (name "intel-hybrid-codec-driver")
    (version "2.0.0.r6.gb0c7970d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kcning/intel-hybrid-driver")
                    (commit "v2.0.0.r6.gb0c7970d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kcning/intel-hybrid-driver")
    (synopsis "libva support for partially hardware accelerated encode and decode on Hasw")
    (description "Libva support for partially hardware accelerated encode and decode on Haswell and newer.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 97. languagetool-ngrams-de --- Finding errors using n-gram data, german text
;;; AUR: languagetool-ngrams-de
;;; -------------------------------------------------------------------
(define-public languagetool-ngrams-de
  (package
    (name "languagetool-ngrams-de")
    (version "20150819")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://wiki.languagetool.org/finding-errors-using-n-gram-data")
                    (commit "v20150819")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://wiki.languagetool.org/finding-errors-using-n-gram-data")
    (synopsis "finding errors using n-gram data, german text")
    (description "Finding errors using n-gram data, german text.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 98. pi-hole-core --- The Pi-hole is an advertising-aware DNS/Web server. Arch ada
;;; AUR: pi-hole-core
;;; -------------------------------------------------------------------
(define-public pi-hole-core
  (package
    (name "pi-hole-core")
    (version "6.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pi-hole/pi-hole")
                    (commit "v6.4.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pi-hole/pi-hole")
    (synopsis "the Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for la")
    (description "The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.")
    (license license:eupl1.2)))
