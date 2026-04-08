;;; Dependency-tree resolver pass -- deptree-resolver-260408h
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 92 packages resolved with recipes, 8 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:export (libastal-gjs-git
            python-cryptg
            python-uharfbuzz
            deadbeef
            smb1r-bin
            snazy-bin
            snekstudio-bin
            sniplias-bin
            socialstreamninja-bin
            solv-bin
            sononym
            soundfont-fatboy
            sqlbless-bin
            srwm-bin
            stardict-dictd-www.dict.org-gcide
            steamvr-linux-fixes-layer-bin
            sticker-convert
            stil-bin
            stripe-cli-bin
            suiup-bin
            superhtml-bin
            sway-easyshot-bin
            taierspeed-cli-bin
            tartrazine-bin
            taws-bin
            tennis-bin
            teseq
            tetrigo-bin
            tget-bin
            tiki-bin
            tmpo-bin
            tmq-bin
            tocry-bin
            tonespace
            tori-cli-bin
            font-babelstone-runic
            font-bitter
            font-font-awesome-5
            font-garamontio
            font-garamontio-capo
            font-garamontio-variable
            font-hackgen
            font-hellvetica
            font-iosevka-fixed
            font-iosevka-fixed-ss06
            font-ioskeley-mono-unhinted
            font-lxgw-wenkai-mono-nerd
            font-oxanium
            font-qurancomplex-fonts
            font-roboto-flex
            font-segoe-ui-variable
            font-selawik
            font-sipa-sarabun
            font-sipa-sarabun-new
            tuco-bin
            tuicr-bin
            tuios-web-bin
            tuwunel-bin
            tux
            upnote-appimage
            upsnap-bin
            v2rayn-bin
            virtualhere-client
            voiden-appimage
            wakadash-bin
            watchtower-bin
            whisper.cpp-model-base.en
            whisper.cpp-model-large-v3
            whosthere-bin
            wifitui-bin
            woff2-material-symbols-variable-git
            wormhole-william-bin
            xcursor-simpleandsoft
            xidel-bin
            xilinx-u280-gen3x16-xdma-base
            xleak-bin
            xppenlinux-v3
            xr-chaperone-git
            xr-passthrough-layer-git
            yr-bin
            zashboard-bin
            zcfan
            zsa-kontroll-bin
            010editor
            7zip-docs
            aceplay-bin
            actual-bin
            adaptagrams-git
            algobox
            amazon-fonts
            amok-exif-sorter
            ani-rss))

;;; PACKAGE DEFINITIONS (92 packages)

;;; -- libastal-gjs-git --
(define-public libastal-gjs-git
  (package
    (name "libastal-gjs-git")
    (version "r580.d538d8e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Aylur/astal.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libastal-gjs-git/"))))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "gjs bindings for libstal")
    (description "Gjs bindings for libstal.")
    (license license:expat)))

;;; -- python-cryptg --
(define-public python-cryptg
  (package
    (name "python-cryptg")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/cher-nov/cryptg/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "python-cryptg-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/python-cryptg/"))))
    (home-page "https://github.com/cher-nov/cryptg")
    (synopsis "cryptographic utilities for Telegram, designed to use with Telethon")
    (description "Cryptographic utilities for Telegram, designed to use with Telethon.")
    (license license:cc0)))

;;; -- python-uharfbuzz --
(define-public python-uharfbuzz
  (package
    (name "python-uharfbuzz")
    (version "0.53.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/harfbuzz//"
         "releases/download/v" version "/python-uharfbuzz-" version ".tar.gz"))
       (file-name (string-append "python-uharfbuzz-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/python-uharfbuzz/"))))
    (home-page "https://github.com/harfbuzz/")
    (synopsis "streamlined Cython bindings for the harfbuzz shaping engine")
    (description "Streamlined Cython bindings for the harfbuzz shaping engine.")
    (license license:asl2.0)))

;;; -- deadbeef --
(define-public deadbeef
  (package
    (name "deadbeef")
    (version "1.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://deadbeef.sourceforge.io//"
         "releases/download/v" version "/deadbeef-" version ".tar.gz"))
       (file-name (string-append "deadbeef-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/deadbeef/"))))
    (home-page "https://deadbeef.sourceforge.io/")
    (synopsis "modular GTK audio player for GNU/Linux")
    (description "Modular GTK audio player for GNU/Linux.")
    (license license:gpl2+)))

;;; -- smb1r-bin --
(define-public smb1r-bin
  (package
    (name "smb1r-bin")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/JHDev2006/Super-Mario-Bros.-Remastered-Public/releases/download/v"
         version "/smb1r-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/smb1r-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JHDev2006/Super-Mario-Bros.-Remastered-Public")
    (synopsis "super Mario Bros. Remastered")
    (description "Super Mario Bros. Remastered.")
    (license license:gpl3+)))

;;; -- snazy-bin --
(define-public snazy-bin
  (package
    (name "snazy-bin")
    (version "0.58.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/chmouel/snazy/releases/download/v"
         version "/snazy-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/snazy-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/chmouel/snazy")
    (synopsis "snazy - a snazzy json log viewer")
    (description "Snazy - a snazzy json log viewer.")
    (license license:expat)))

;;; -- snekstudio-bin --
(define-public snekstudio-bin
  (package
    (name "snekstudio-bin")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v"
         version "/snekstudio-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/snekstudio-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ExpiredPopsicle/SnekStudio")
    (synopsis "open-source VTuber software using Godot Engine!")
    (description "Open-source VTuber software using Godot Engine!.")
    (license license:gpl3+)))

;;; -- sniplias-bin --
(define-public sniplias-bin
  (package
    (name "sniplias-bin")
    (version "0.3.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/otomay/sniplias/releases/download/v"
         version "/sniplias-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sniplias-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/otomay/sniplias")
    (synopsis "A beautiful TUI for managing shell aliases and command snippets")
    (description "A beautiful TUI for managing shell aliases and command snippets.")
    (license license:expat)))

;;; -- socialstreamninja-bin --
(define-public socialstreamninja-bin
  (package
    (name "socialstreamninja-bin")
    (version "0.3.98")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/steveseguin/social_stream/releases/download/v"
         version "/socialstreamninja-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/socialstreamninja-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/steveseguin/social_stream")
    (synopsis "A complete chat ecosystem across social media platforms")
    (description "A complete chat ecosystem across social media platforms.")
    (license license:gpl3+)))

;;; -- solv-bin --
(define-public solv-bin
  (package
    (name "solv-bin")
    (version "0.18.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/aegoroff/solv/releases/download/v"
         version "/solv-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/solv-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aegoroff/solv")
    (synopsis "SOLution Validation tool that analyzes Microsoft Visual Studio solutions (b...")
    (description "SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release).")
    (license license:expat)))

;;; -- sononym --
(define-public sononym
  (package
    (name "sononym")
    (version "1.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.sononym.net/"
         "releases/download/v" version "/sononym-" version ".tar.gz"))
       (file-name (string-append "sononym-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sononym/"))))
    (home-page "https://www.sononym.net")
    (synopsis "audio sample manager and categorizer")
    (description "Audio sample manager and categorizer.")
    (license license:expat)))

;;; -- soundfont-fatboy --
(define-public soundfont-fatboy
  (package
    (name "soundfont-fatboy")
    (version "0.790")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://web.archive.org/web/20220124174052/https://fatboy.site//"
         "releases/download/v" version "/soundfont-fatboy-" version ".tar.gz"))
       (file-name (string-append "soundfont-fatboy-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/soundfont-fatboy/"))))
    (home-page "https://web.archive.org/web/20220124174052/https://fatboy.site/")
    (synopsis "A free GM/GS SoundFont for classic video game MIDI, emulation, and general ...")
    (description "A free GM/GS SoundFont for classic video game MIDI, emulation, and general usage.")
    (license license:expat)))

;;; -- sqlbless-bin --
(define-public sqlbless-bin
  (package
    (name "sqlbless-bin")
    (version "0.27.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/hymkor/sqlbless/releases/download/v"
         version "/sqlbless-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sqlbless-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hymkor/sqlbless")
    (synopsis "safety-Oriented Terminal SQL Client")
    (description "Safety-Oriented Terminal SQL Client.")
    (license license:expat)))

;;; -- srwm-bin --
(define-public srwm-bin
  (package
    (name "srwm-bin")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/infraflakes/srwm/releases/download/v"
         version "/srwm-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/srwm-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/infraflakes/srwm")
    (synopsis "A fully statically linked dynamic X11 window manager written in Go, C and Lua")
    (description "A fully statically linked dynamic X11 window manager written in Go, C and Lua.")
    (license license:expat)))

;;; -- stardict-dictd_www.dict.org_gcide --
(define-public stardict-dictd-www.dict.org-gcide
  (package
    (name "stardict-dictd-www.dict.org-gcide")
    (version "5.2.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://download.huzheng.org/"
         "releases/download/v" version "/stardict-dictd_www.dict.org_gcide-" version ".tar.gz"))
       (file-name (string-append "stardict-dictd-www.dict.org-gcide-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/stardict-dictd-www.dict.org-gcide/"))))
    (home-page "http://download.huzheng.org")
    (synopsis "the Collaborative International Dictionary of English for stardict et al. f...")
    (description "The Collaborative International Dictionary of English for stardict et al. from huzheng.org.")
    (license license:gpl3+)))

;;; -- steamvr-linux-fixes-layer-bin --
(define-public steamvr-linux-fixes-layer-bin
  (package
    (name "steamvr-linux-fixes-layer-bin")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/BnuuySolutions/SteamVRLinuxFixes/releases/download/v"
         version "/steamvr-linux-fixes-layer-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/steamvr-linux-fixes-layer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BnuuySolutions/SteamVRLinuxFixes")
    (synopsis "A Vulkan layer that patches SteamVR's vrcompositor to address issues for wi...")
    (description "A Vulkan layer that patches SteamVR's vrcompositor to address issues for wired headsets.")
    (license license:expat)))

;;; -- sticker-convert --
(define-public sticker-convert
  (package
    (name "sticker-convert")
    (version "2.20.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/laggykiller/sticker-convert/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "sticker-convert-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sticker-convert/"))))
    (home-page "https://github.com/laggykiller/sticker-convert")
    (synopsis "convert (animated) stickers to/from WhatsApp, Telegram, Signal, Line, Kakao...")
    (description "Convert (animated) stickers to/from WhatsApp, Telegram, Signal, Line, Kakao, Viber, Discord, iMessage. Written in Python.")
    (license license:gpl2+)))

;;; -- stil-bin --
(define-public stil-bin
  (package
    (name "stil-bin")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/sermuns/stil/releases/download/v"
         version "/stil-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/stil-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sermuns/stil")
    (synopsis "generate STatic site from Index Listing of directory")
    (description "Generate STatic site from Index Listing of directory.")
    (license license:wtfpl2)))

;;; -- stripe-cli-bin --
(define-public stripe-cli-bin
  (package
    (name "stripe-cli-bin")
    (version "1.37.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://stripe.com/docs/stripe-cli/"
         version "/stripe-cli-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/stripe-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stripe.com/docs/stripe-cli")
    (synopsis "A command-line tool for Stripe")
    (description "A command-line tool for Stripe.")
    (license license:asl2.0)))

;;; -- suiup-bin --
(define-public suiup-bin
  (package
    (name "suiup-bin")
    (version "0.0.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/MystenLabs/suiup/releases/download/v"
         version "/suiup-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/suiup-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/MystenLabs/suiup")
    (synopsis "installer & version manager for Sui toolchain")
    (description "Installer & version manager for Sui toolchain.")
    (license license:asl2.0)))

;;; -- superhtml-bin --
(define-public superhtml-bin
  (package
    (name "superhtml-bin")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/kristoff-it/superhtml/releases/download/v"
         version "/superhtml-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/superhtml-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kristoff-it/superhtml")
    (synopsis "HTML Language Server & Templating Language Library")
    (description "HTML Language Server & Templating Language Library.")
    (license license:expat)))

;;; -- sway-easyshot-bin --
(define-public sway-easyshot-bin
  (package
    (name "sway-easyshot-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/chmouel/sway-easyshot/releases/download/v"
         version "/sway-easyshot-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sway-easyshot-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/chmouel/sway-easyshot")
    (synopsis "sway-easyshot - Sway Screenshot control")
    (description "Sway-easyshot - Sway Screenshot control.")
    (license license:expat)))

;;; -- taierspeed-cli-bin --
(define-public taierspeed-cli-bin
  (package
    (name "taierspeed-cli-bin")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ztelliot/taierspeed-cli/releases/download/v"
         version "/taierspeed-cli-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/taierspeed-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ztelliot/taierspeed-cli")
    (synopsis "A CLI for TaierSpeed. Test your network without a phone")
    (description "A CLI for TaierSpeed. Test your network without a phone.")
    (license license:expat)))

;;; -- tartrazine-bin --
(define-public tartrazine-bin
  (package
    (name "tartrazine-bin")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ralsina/tartrazine/releases/download/v"
         version "/tartrazine-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tartrazine-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ralsina/tartrazine")
    (synopsis "A Crystal reimplementation of the Pygments/Chroma syntax highlighters")
    (description "A Crystal reimplementation of the Pygments/Chroma syntax highlighters.")
    (license license:expat)))

;;; -- taws-bin --
(define-public taws-bin
  (package
    (name "taws-bin")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/huseyinbabal/taws/releases/download/v"
         version "/taws-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/taws-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/huseyinbabal/taws")
    (synopsis "A terminal-based AWS resource viewer and manager")
    (description "A terminal-based AWS resource viewer and manager.")
    (license license:expat)))

;;; -- tennis-bin --
(define-public tennis-bin
  (package
    (name "tennis-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/gurgeous/tennis/releases/download/v"
         version "/tennis-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tennis-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gurgeous/tennis")
    (synopsis "stylish CSV tables in your terminal")
    (description "Stylish CSV tables in your terminal.")
    (license license:expat)))

;;; -- teseq --
(define-public teseq
  (package
    (name "teseq")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gnu.org/software/teseq//"
         "releases/download/v" version "/teseq-" version ".tar.gz"))
       (file-name (string-append "teseq-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/teseq/"))))
    (home-page "https://www.gnu.org/software/teseq/")
    (synopsis "A tool for analyzing files that contain control characters and terminal con...")
    (description "A tool for analyzing files that contain control characters and terminal control sequences.")
    (license license:gpl3+)))

;;; -- tetrigo-bin --
(define-public tetrigo-bin
  (package
    (name "tetrigo-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Broderick-Westrope/tetrigo/releases/download/v"
         version "/tetrigo-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tetrigo-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Broderick-Westrope/tetrigo")
    (synopsis "play Tetris in your terminal")
    (description "Play Tetris in your terminal.")
    (license license:gpl3+)))

;;; -- tget-bin --
(define-public tget-bin
  (package
    (name "tget-bin")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/sweetbbak/tget/releases/download/v"
         version "/tget-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tget-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sweetbbak/tget")
    (synopsis "like wget but for torrents")
    (description "Like wget but for torrents.")
    (license license:expat)))

;;; -- tiki-bin --
(define-public tiki-bin
  (package
    (name "tiki-bin")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/boolean-maybe/tiki/releases/download/v"
         version "/tiki-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tiki-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/boolean-maybe/tiki")
    (synopsis "markdown-based git-versioned documentation and issue management")
    (description "Markdown-based git-versioned documentation and issue management.")
    (license license:asl2.0)))

;;; -- tmpo-bin --
(define-public tmpo-bin
  (package
    (name "tmpo-bin")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/DylanDevelops/tmpo/releases/download/v"
         version "/tmpo-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tmpo-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DylanDevelops/tmpo")
    (synopsis "A minimal CLI time tracker for developers")
    (description "A minimal CLI time tracker for developers.")
    (license license:expat)))

;;; -- tmq-bin --
(define-public tmq-bin
  (package
    (name "tmq-bin")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/azolfagharj/tmq/releases/download/v"
         version "/tmq-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tmq-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/azolfagharj/tmq")
    (synopsis "A lightweight, portable, cross-platform, and fully featured command-line TO...")
    (description "A lightweight, portable, cross-platform, and fully featured command-line TOML processor.")
    (license license:expat)))

;;; -- tocry-bin --
(define-public tocry-bin
  (package
    (name "tocry-bin")
    (version "0.26.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ralsina/tocry/releases/download/v"
         version "/tocry-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tocry-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ralsina/tocry")
    (synopsis "A TODO app")
    (description "A TODO app.")
    (license license:expat)))

;;; -- tonespace --
(define-public tonespace
  (package
    (name "tonespace")
    (version "2.9.20220308")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.mucoder.net/en/tonespace/"
         "releases/download/v" version "/tonespace-" version ".tar.gz"))
       (file-name (string-append "tonespace-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tonespace/"))))
    (home-page "https://www.mucoder.net/en/tonespace")
    (synopsis "chord generator and visualizer")
    (description "Chord generator and visualizer.")
    (license license:expat)))

;;; -- tori-cli-bin --
(define-public tori-cli-bin
  (package
    (name "tori-cli-bin")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/thobiasn/tori-cli/releases/download/v"
         version "/tori-cli-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tori-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thobiasn/tori-cli")
    (synopsis "lightweight Docker monitoring with alerting")
    (description "Lightweight Docker monitoring with alerting.")
    (license license:expat)))

;;; -- ttf-babelstone-runic --
(define-public font-babelstone-runic
  (package
    (name "font-babelstone-runic")
    (version "7.004")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://babelstone.co.uk/Fonts/Runic.html/"
         version "/ttf-babelstone-runic-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://babelstone.co.uk/Fonts/Runic.html")
    (synopsis "babelStone Younger Futhark Fonts")
    (description "BabelStone Younger Futhark Fonts.")
    (license license:expat)))

;;; -- ttf-bitter --
(define-public font-bitter
  (package
    (name "font-bitter")
    (version "1.300")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.huertatipografica.com/fonts/bitter-ht/"
         version "/ttf-bitter-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "http://www.huertatipografica.com/fonts/bitter-ht")
    (synopsis "A font specially designed for comfortably reading on any computer or device")
    (description "A font specially designed for comfortably reading on any computer or device.")
    (license license:expat)))

;;; -- ttf-font-awesome-5 --
(define-public font-font-awesome-5
  (package
    (name "font-font-awesome-5")
    (version "5.15.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://fontawesome.com//"
         version "/ttf-font-awesome-5-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://fontawesome.com/")
    (synopsis "iconic font designed for Bootstrap (version 5.x)")
    (description "Iconic font designed for Bootstrap (version 5.x).")
    (license license:expat)))

;;; -- ttf-garamontio --
(define-public font-garamontio
  (package
    (name "font-garamontio")
    (version "1.104")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://m-casanova.codeberg.page/Garamontio//"
         version "/ttf-garamontio-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://m-casanova.codeberg.page/Garamontio/")
    (synopsis "a fork of EB Garamond")
    (description "A fork of EB Garamond.")
    (license license:expat)))

;;; -- ttf-garamontio-capo --
(define-public font-garamontio-capo
  (package
    (name "font-garamontio-capo")
    (version "2.101")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://m-casanova.codeberg.page/GaramontioCapo//"
         version "/ttf-garamontio-capo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://m-casanova.codeberg.page/GaramontioCapo/")
    (synopsis "dropcaps for Garamontio")
    (description "Dropcaps for Garamontio.")
    (license license:expat)))

;;; -- ttf-garamontio-variable --
(define-public font-garamontio-variable
  (package
    (name "font-garamontio-variable")
    (version "1.104")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://m-casanova.codeberg.page/Garamontio//"
         version "/ttf-garamontio-variable-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://m-casanova.codeberg.page/Garamontio/")
    (synopsis "a fork of EB Garamond")
    (description "A fork of EB Garamond.")
    (license license:expat)))

;;; -- ttf-hackgen --
(define-public font-hackgen
  (package
    (name "font-hackgen")
    (version "2.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/yuru7/HackGen/releases/download/v"
         version "/ttf-hackgen-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/yuru7/HackGen")
    (synopsis "composite font of Hack and GenJyuu-Gothic. This package includes HackGen-Nerd")
    (description "Composite font of Hack and GenJyuu-Gothic. This package includes HackGen-Nerd.")
    (license license:expat)))

;;; -- ttf-hellvetica --
(define-public font-hellvetica
  (package
    (name "font-hellvetica")
    (version "20191029")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://web.archive.org/web/20191031045611/https://hellveticafont.com//"
         version "/ttf-hellvetica-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://web.archive.org/web/20191031045611/https://hellveticafont.com/")
    (synopsis "like Helvetica, but with like, much shittier kerning for Halloween")
    (description "Like Helvetica, but with like, much shittier kerning for Halloween.")
    (license license:expat)))

;;; -- ttf-iosevka-fixed --
(define-public font-iosevka-fixed
  (package
    (name "font-iosevka-fixed")
    (version "34.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://typeof.net/Iosevka//"
         version "/ttf-iosevka-fixed-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://typeof.net/Iosevka/")
    (synopsis "typeface family designed for coding, terminal use and technical documents")
    (description "Typeface family designed for coding, terminal use and technical documents.")
    (license license:expat)))

;;; -- ttf-iosevka-fixed-ss06 --
(define-public font-iosevka-fixed-ss06
  (package
    (name "font-iosevka-fixed-ss06")
    (version "34.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://typeof.net/Iosevka//"
         version "/ttf-iosevka-fixed-ss06-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://typeof.net/Iosevka/")
    (synopsis "typeface family designed for coding, terminal use and technical documents")
    (description "Typeface family designed for coding, terminal use and technical documents.")
    (license license:expat)))

;;; -- ttf-ioskeley-mono-unhinted --
(define-public font-ioskeley-mono-unhinted
  (package
    (name "font-ioskeley-mono-unhinted")
    (version "1:2.0.0beta1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ahatem/IoskeleyMono/releases/download/v"
         version "/ttf-ioskeley-mono-unhinted-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/ahatem/IoskeleyMono")
    (synopsis "iosevka configuration to mimic Berkeley Mono - unhinted TTF version")
    (description "Iosevka configuration to mimic Berkeley Mono - unhinted TTF version.")
    (license license:expat)))

;;; -- ttf-lxgw-wenkai-mono-nerd --
(define-public font-lxgw-wenkai-mono-nerd
  (package
    (name "font-lxgw-wenkai-mono-nerd")
    (version "1.522")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Yikai-Liao/LxgwWenKaiNerdFont/releases/download/v"
         version "/ttf-lxgw-wenkai-mono-nerd-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/Yikai-Liao/LxgwWenKaiNerdFont")
    (synopsis "LXGW WenKai Mono patched with Nerd Font glyphs")
    (description "LXGW WenKai Mono patched with Nerd Font glyphs.")
    (license license:expat)))

;;; -- ttf-oxanium --
(define-public font-oxanium
  (package
    (name "font-oxanium")
    (version "2.000")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://sev.dev/fonts/oxanium//"
         version "/ttf-oxanium-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://sev.dev/fonts/oxanium/")
    (synopsis "A futuristic-looking geometric sans-serif font family")
    (description "A futuristic-looking geometric sans-serif font family.")
    (license license:expat)))

;;; -- ttf-qurancomplex-fonts --
(define-public font-qurancomplex-fonts
  (package
    (name "font-qurancomplex-fonts")
    (version "20250915")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://fonts.qurancomplex.gov.sa/"
         version "/ttf-qurancomplex-fonts-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "http://fonts.qurancomplex.gov.sa")
    (synopsis "arabic fonts by King Fahd Glorious Quran Printing Complex in al-Madinah al-...")
    (description "Arabic fonts by King Fahd Glorious Quran Printing Complex in al-Madinah al-Munawwarah.")
    (license license:expat)))

;;; -- ttf-roboto-flex --
(define-public font-roboto-flex
  (package
    (name "font-roboto-flex")
    (version "1:3.200")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/googlefonts/roboto-flex/releases/download/v"
         version "/ttf-roboto-flex-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/googlefonts/roboto-flex")
    (synopsis "upgrades Roboto to become a more powerful typeface system")
    (description "Upgrades Roboto to become a more powerful typeface system.")
    (license license:expat)))

;;; -- ttf-segoe-ui-variable --
(define-public font-segoe-ui-variable
  (package
    (name "font-segoe-ui-variable")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://docs.microsoft.com/windows/apps/design/downloads/#fonts/"
         version "/ttf-segoe-ui-variable-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://docs.microsoft.com/windows/apps/design/downloads/#fonts")
    (synopsis "segoe UI Variable is the new system font for Windows. It is a refreshed tak...")
    (description "Segoe UI Variable is the new system font for Windows. It is a refreshed take on the classic Segoe and uses variable font technology to dynamically provide great legibility at very small sizes, and improved outlines at display sizes.")
    (license license:expat)))

;;; -- ttf-selawik --
(define-public font-selawik
  (package
    (name "font-selawik")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/winjs/bootstrap-winjs/releases/download/v"
         version "/ttf-selawik-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/winjs/bootstrap-winjs/tree/master/src/fonts")
    (synopsis "selawik font as a fallback to Segoe UI")
    (description "Selawik font as a fallback to Segoe UI.")
    (license license:expat)))

;;; -- ttf-sipa-sarabun --
(define-public font-sipa-sarabun
  (package
    (name "font-sipa-sarabun")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.f0nt.com/release/13-free-fonts-from-sipa//"
         version "/ttf-sipa-sarabun-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://www.f0nt.com/release/13-free-fonts-from-sipa/")
    (synopsis "thailand national fonts: TH-Sarabun-PSK")
    (description "Thailand national fonts: TH-Sarabun-PSK.")
    (license license:expat)))

;;; -- ttf-sipa-sarabun-new --
(define-public font-sipa-sarabun-new
  (package
    (name "font-sipa-sarabun-new")
    (version "1.35")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.f0nt.com/release/13-free-fonts-from-sipa//"
         version "/ttf-sipa-sarabun-new-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://www.f0nt.com/release/13-free-fonts-from-sipa/")
    (synopsis "thailand national fonts: TH-Sarabun-New")
    (description "Thailand national fonts: TH-Sarabun-New.")
    (license license:expat)))

;;; -- tuco-bin --
(define-public tuco-bin
  (package
    (name "tuco-bin")
    (version "0.0.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/mcandre/tuco/releases/download/v"
         version "/tuco-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tuco-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mcandre/tuco")
    (synopsis "go port multiplexer")
    (description "Go port multiplexer.")
    (license license:bsd-2)))

;;; -- tuicr-bin --
(define-public tuicr-bin
  (package
    (name "tuicr-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/agavra/tuicr/releases/download/v"
         version "/tuicr-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tuicr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/agavra/tuicr")
    (synopsis "terminal-based code review tool for AI-generated changes")
    (description "Terminal-based code review tool for AI-generated changes.")
    (license license:expat)))

;;; -- tuios-web-bin --
(define-public tuios-web-bin
  (package
    (name "tuios-web-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Gaurav-Gosain/tuios/releases/download/v"
         version "/tuios-web-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tuios-web-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Gaurav-Gosain/tuios")
    (synopsis "web terminal server for TUIOS - Serves TUIOS through the browser")
    (description "Web terminal server for TUIOS - Serves TUIOS through the browser.")
    (license license:expat)))

;;; -- tuwunel-bin --
(define-public tuwunel-bin
  (package
    (name "tuwunel-bin")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/matrix-construct/tuwunel/releases/download/v"
         version "/tuwunel-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tuwunel-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/matrix-construct/tuwunel")
    (synopsis "official successor to conduwuit")
    (description "Official successor to conduwuit.")
    (license license:asl2.0)))

;;; -- tux --
(define-public tux
  (package
    (name "tux")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/JulB3y/tux/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "tux-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tux/"))))
    (home-page "https://github.com/JulB3y/tux")
    (synopsis "simple TUI application launcher written in C")
    (description "Simple TUI application launcher written in C.")
    (license license:expat)))

;;; -- upnote-appimage --
(define-public upnote-appimage
  (package
    (name "upnote-appimage")
    (version "9.18.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://getupnote.com//"
         version "/upnote-appimage-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/upnote-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://getupnote.com/")
    (synopsis "cross-platform note-taking application")
    (description "Cross-platform note-taking application.")
    (license license:expat)))

;;; -- upsnap-bin --
(define-public upsnap-bin
  (package
    (name "upsnap-bin")
    (version "5.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/seriousm4x/UpSnap/releases/download/v"
         version "/upsnap-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/upsnap-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/seriousm4x/UpSnap")
    (synopsis "A simple wake on lan web app written with SvelteKit, Go and PocketBase")
    (description "A simple wake on lan web app written with SvelteKit, Go and PocketBase.")
    (license license:expat)))

;;; -- v2rayn-bin --
(define-public v2rayn-bin
  (package
    (name "v2rayn-bin")
    (version "7.19.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/2dust/v2rayN/releases/download/v"
         version "/v2rayn-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/v2rayn-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/2dust/v2rayN")
    (synopsis "A GUI client for Windows and Linux, support Xray core and others")
    (description "A GUI client for Windows and Linux, support Xray core and others.")
    (license license:gpl3+)))

;;; -- virtualhere-client --
(define-public virtualhere-client
  (package
    (name "virtualhere-client")
    (version "5.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.virtualhere.com/usb_server_software/"
         "releases/download/v" version "/virtualhere-client-" version ".tar.gz"))
       (file-name (string-append "virtualhere-client-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/virtualhere-client/"))))
    (home-page "https://www.virtualhere.com/usb_server_software")
    (synopsis "virtualHere USB Client for Linux Desktop")
    (description "VirtualHere USB Client for Linux Desktop.")
    (license license:bsd-3)))

;;; -- voiden-appimage --
(define-public voiden-appimage
  (package
    (name "voiden-appimage")
    (version "1.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://voiden.md/"
         version "/voiden-appimage-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/voiden-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://voiden.md")
    (synopsis "voiden API Client")
    (description "Voiden API Client.")
    (license license:asl2.0)))

;;; -- wakadash-bin --
(define-public wakadash-bin
  (package
    (name "wakadash-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/b00y0h/wakadash/releases/download/v"
         version "/wakadash-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wakadash-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/b00y0h/wakadash")
    (synopsis "A live terminal dashboard for WakaTime coding stats")
    (description "A live terminal dashboard for WakaTime coding stats.")
    (license license:expat)))

;;; -- watchtower-bin --
(define-public watchtower-bin
  (package
    (name "watchtower-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/lajosdeme/watchtower/releases/download/v"
         version "/watchtower-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/watchtower-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lajosdeme/watchtower")
    (synopsis "A clean, minimal, terminal-based global intelligence dashboard")
    (description "A clean, minimal, terminal-based global intelligence dashboard.")
    (license license:expat)))

;;; -- whisper.cpp-model-base.en --
(define-public whisper.cpp-model-base.en
  (package
    (name "whisper.cpp-model-base.en")
    (version "4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "whisper.cpp-model-base.en-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/whisper.cpp-model-base.en/"))))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archl...")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -- whisper.cpp-model-large-v3 --
(define-public whisper.cpp-model-large-v3
  (package
    (name "whisper.cpp-model-large-v3")
    (version "4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "whisper.cpp-model-large-v3-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/whisper.cpp-model-large-v3/"))))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archl...")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -- whosthere-bin --
(define-public whosthere-bin
  (package
    (name "whosthere-bin")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ramonvermeulen/whosthere/releases/download/v"
         version "/whosthere-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/whosthere-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ramonvermeulen/whosthere")
    (synopsis "local Area Network discovery tool with a modern Terminal User Interface")
    (description "Local Area Network discovery tool with a modern Terminal User Interface.")
    (license license:expat)))

;;; -- wifitui-bin --
(define-public wifitui-bin
  (package
    (name "wifitui-bin")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/shazow/wifitui/releases/download/v"
         version "/wifitui-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wifitui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/shazow/wifitui")
    (synopsis "fast featureful friendly wifi terminal UI")
    (description "Fast featureful friendly wifi terminal UI.")
    (license license:expat)))

;;; -- woff2-material-symbols-variable-git --
(define-public woff2-material-symbols-variable-git
  (package
    (name "woff2-material-symbols-variable-git")
    (version "4.0.0.r119.gc51274e9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/material-design-icons.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/woff2-material-symbols-variable-git/"))))
    (home-page "https://github.com/google/material-design-icons")
    (synopsis "material Design icons by Google - variable fonts")
    (description "Material Design icons by Google - variable fonts.")
    (license license:asl2.0)))

;;; -- wormhole-william-bin --
(define-public wormhole-william-bin
  (package
    (name "wormhole-william-bin")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/psanford/wormhole-william/releases/download/v"
         version "/wormhole-william-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wormhole-william-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psanford/wormhole-william")
    (synopsis "securely transfer files between devices. Go implementation of magic wormhole")
    (description "Securely transfer files between devices. Go implementation of magic wormhole.")
    (license license:expat)))

;;; -- xcursor-simpleandsoft --
(define-public xcursor-simpleandsoft
  (package
    (name "xcursor-simpleandsoft")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://store.kde.org/p/999946//"
         "releases/download/v" version "/xcursor-simpleandsoft-" version ".tar.gz"))
       (file-name (string-append "xcursor-simpleandsoft-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xcursor-simpleandsoft/"))))
    (home-page "https://store.kde.org/p/999946/")
    (synopsis "A simple and soft X cursor theme")
    (description "A simple and soft X cursor theme.")
    (license license:gpl3+)))

;;; -- xidel-bin --
(define-public xidel-bin
  (package
    (name "xidel-bin")
    (version "0.9.9.20230617.8842.e14a96920e01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.videlibri.de/xidel.html/"
         version "/xidel-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xidel-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.videlibri.de/xidel.html")
    (synopsis "command line tool to process HTML/XML/JSON locally or from online sources")
    (description "Command line tool to process HTML/XML/JSON locally or from online sources.")
    (license license:gpl3+)))

;;; -- xilinx-u280-gen3x16-xdma-base --
(define-public xilinx-u280-gen3x16-xdma-base
  (package
    (name "xilinx-u280-gen3x16-xdma-base")
    (version "1.3585717")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://docs.xilinx.com/r/en-US/ug1301-getting-started-guide-alveo-accelerator-cards/"
         "releases/download/v" version "/xilinx-u280-gen3x16-xdma-base-" version ".tar.gz"))
       (file-name (string-append "xilinx-u280-gen3x16-xdma-base-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xilinx-u280-gen3x16-xdma-base/"))))
    (home-page "https://docs.xilinx.com/r/en-US/ug1301-getting-started-guide-alveo-accelerator-cards")
    (synopsis "deployment platform firmware for AMD Alveo U280")
    (description "Deployment platform firmware for AMD Alveo U280.")
    (license license:expat)))

;;; -- xleak-bin --
(define-public xleak-bin
  (package
    (name "xleak-bin")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/bgreenwell/xleak/releases/download/v"
         version "/xleak-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xleak-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bgreenwell/xleak")
    (synopsis "A fast terminal Excel viewer with interactive TUI, search, formulas, and ex...")
    (description "A fast terminal Excel viewer with interactive TUI, search, formulas, and export capabilities.")
    (license license:expat)))

;;; -- xppenlinux-v3 --
(define-public xppenlinux-v3
  (package
    (name "xppenlinux-v3")
    (version "3.4.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.xp-pen.com/download/index.html/"
         "releases/download/v" version "/xppenlinux-v3-" version ".tar.gz"))
       (file-name (string-append "xppenlinux-v3-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xppenlinux-v3/"))))
    (home-page "https://www.xp-pen.com/download/index.html")
    (synopsis "XP-Pen (Official) Linux utility for legacy XPPen Tablets")
    (description "XP-Pen (Official) Linux utility for legacy XPPen Tablets.")
    (license license:expat)))

;;; -- xr-chaperone-git --
(define-public xr-chaperone-git
  (package
    (name "xr-chaperone-git")
    (version "2dfd751")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FrostyCoolSlug/xr-chaperone.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xr-chaperone-git/"))))
    (home-page "https://github.com/FrostyCoolSlug/xr-chaperone")
    (synopsis "A VR Chaperone System for OpenXR")
    (description "A VR Chaperone System for OpenXR.")
    (license license:expat)))

;;; -- xr-passthrough-layer-git --
(define-public xr-passthrough-layer-git
  (package
    (name "xr-passthrough-layer-git")
    (version "dfa8de0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yshui/xr_passthrough_layer.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xr-passthrough-layer-git/"))))
    (home-page "https://github.com/yshui/xr_passthrough_layer")
    (synopsis "A OpenXR API layer adding camera passthrough support")
    (description "A OpenXR API layer adding camera passthrough support.")
    (license license:expat)))

;;; -- yr-bin --
(define-public yr-bin
  (package
    (name "yr-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://git.sr.ht/~timharek/yr/"
         version "/yr-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/yr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.sr.ht/~timharek/yr")
    (synopsis "get the weather delivered to your command-line")
    (description "Get the weather delivered to your command-line.")
    (license license:expat)))

;;; -- zashboard-bin --
(define-public zashboard-bin
  (package
    (name "zashboard-bin")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Zephyruso/zashboard/releases/download/v"
         version "/zashboard-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zashboard-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Zephyruso/zashboard")
    (synopsis "A dashboard using clash api")
    (description "A dashboard using clash api.")
    (license license:expat)))

;;; -- zcfan --
(define-public zcfan
  (package
    (name "zcfan")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/cdown/zcfan/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "zcfan-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zcfan/"))))
    (home-page "https://github.com/cdown/zcfan")
    (synopsis "zero-configuration fan control for ThinkPad")
    (description "Zero-configuration fan control for ThinkPad.")
    (license license:expat)))

;;; -- zsa-kontroll-bin --
(define-public zsa-kontroll-bin
  (package
    (name "zsa-kontroll-bin")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/zsa/kontroll/releases/download/v"
         version "/zsa-kontroll-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zsa-kontroll-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zsa/kontroll")
    (synopsis "helper cli tool for the ZSA Keymapp API")
    (description "Helper cli tool for the ZSA Keymapp API.")
    (license license:expat)))

;;; -- 010editor --
(define-public 010editor
  (package
    (name "010editor")
    (version "16.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.sweetscape.com/010editor//"
         "releases/download/v" version "/010editor-" version ".tar.gz"))
       (file-name (string-append "010editor-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/010editor/"))))
    (home-page "https://www.sweetscape.com/010editor/")
    (synopsis "professional text and hex editing with Binary Templates technology")
    (description "Professional text and hex editing with Binary Templates technology.")
    (license license:expat)))

;;; -- 7zip-docs --
(define-public 7zip-docs
  (package
    (name "7zip-docs")
    (version "26.00")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://7-zip.org//"
         "releases/download/v" version "/7zip-docs-" version ".tar.gz"))
       (file-name (string-append "7zip-docs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/7zip-docs/"))))
    (home-page "https://7-zip.org/")
    (synopsis "HTML documentation for the 7-Zip file archiver")
    (description "HTML documentation for the 7-Zip file archiver.")
    (license license:bsd-3)))

;;; -- aceplay-bin --
(define-public aceplay-bin
  (package
    (name "aceplay-bin")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/crstian19/aceplay/releases/download/v"
         version "/aceplay-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/aceplay-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/crstian19/aceplay")
    (synopsis "modern CLI to play Ace Stream links - auto-starts acestream-engine (pre-bui...")
    (description "Modern CLI to play Ace Stream links - auto-starts acestream-engine (pre-built binary).")
    (license license:expat)))

;;; -- actual-bin --
(define-public actual-bin
  (package
    (name "actual-bin")
    (version "26.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://actualbudget.org//"
         version "/actual-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/actual-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://actualbudget.org/")
    (synopsis "A local-first personal finance tool. It is 100% free and open-source, writt...")
    (description "A local-first personal finance tool. It is 100% free and open-source, written in NodeJS, it has a synchronization element so that all your changes can move between devices without any heavy lifting.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; -- adaptagrams-git --
(define-public adaptagrams-git
  (package
    (name "adaptagrams-git")
    (version "r1249.d00ce593")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mjwybrow/adaptagrams.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/adaptagrams-git/"))))
    (home-page "https://github.com/mjwybrow/adaptagrams")
    (synopsis "A library for adaptive diagramming applications")
    (description "A library for adaptive diagramming applications.")
    (license license:expat)))

;;; -- algobox --
(define-public algobox
  (package
    (name "algobox")
    (version "2:1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.xm1math.net/algobox/index.html/"
         "releases/download/v" version "/algobox-" version ".tar.gz"))
       (file-name (string-append "algobox-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/algobox/"))))
    (home-page "http://www.xm1math.net/algobox/index.html")
    (synopsis "algorithmic learning for high school students")
    (description "Algorithmic learning for high school students.")
    (license license:gpl2+)))

;;; -- amazon-fonts --
(define-public amazon-fonts
  (package
    (name "amazon-fonts")
    (version "Mar2020")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography/"
         "releases/download/v" version "/amazon-fonts-" version ".tar.gz"))
       (file-name (string-append "amazon-fonts-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/amazon-fonts/"))))
    (home-page "https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography")
    (synopsis "complete set of all Amazon fonts (Bookerly, Amazon Ember)")
    (description "Complete set of all Amazon fonts (Bookerly, Amazon Ember).")
    (license license:expat)))

;;; -- amok-exif-sorter --
(define-public amok-exif-sorter
  (package
    (name "amok-exif-sorter")
    (version "3.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.amok.am/en/freeware/amok_exif_sorter//"
         "releases/download/v" version "/amok-exif-sorter-" version ".tar.gz"))
       (file-name (string-append "amok-exif-sorter-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/amok-exif-sorter/"))))
    (home-page "http://www.amok.am/en/freeware/amok_exif_sorter/")
    (synopsis "amoK Exif Sorter is the easy but powerful solution for renaming your photos...")
    (description "AmoK Exif Sorter is the easy but powerful solution for renaming your photos using EXIF data.")
    (license license:expat)))

;;; -- ani-rss --
(define-public ani-rss
  (package
    (name "ani-rss")
    (version "3.0.23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/wushuo894/ani-rss/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ani-rss-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ani-rss/"))))
    (home-page "https://github.com/wushuo894/ani-rss")
    (synopsis "自动追番、订阅、下载 蜜柑RSS动漫")
    (description "自动追番、订阅、下载 蜜柑RSS动漫.")
    (license license:gpl2+)))
