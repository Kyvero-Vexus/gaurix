;;; Dependency-tree resolver pass -- deptree-resolver-260408j
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 96 packages resolved with recipes, 4 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:export (elephant-websearch
            envy-tui-bin
            epson-printer-utility
            epub2pdf
            equibop-bin
            esa-snap-bin
            evhz-git
            exodus
            f5vpn
            factor
            factory-cli-bin
            fastbuild
            fcitx5-skin-ori-git
            ffdash-bin
            ffmpeg-audio-thumbnailer
            file2key
            finar-bin
            finar-unstable
            firefox-extension-arch-search
            fish-pure-prompt
            fixvr-git
            flogo
            flyctl-bin
            foobar2000-component-beefweb-bin
            foobar2000-component-openlyrics-bin
            fortune-mod-portal-game
            free42
            frpc-bin
            frps-bin
            fswebcam
            fusee-nano
            gaffer-bin
            geargrafx
            gedit-cut-line
            gedit-dark-variant
            gedit-duplicate-line
            gedit-panel-toggler
            gedit-scroll-past
            gedit-smart-home
            ggc-bin
            ghdl
            git-credential-keepassxc
            git-koji-bin
            gitflow-avh
            gmodpatchtool-bin
            gnome-shell-extension-resource-monitor
            gnome-shell-extension-tophat
            gnome-shell-extension-tray-icons-reloaded
            gnome-ssh-askpass3
            goanime
            goofcord-bin
            goose-desktop-bin
            goto-ssh-bin
            gowall-bin
            goxe
            grepai-bin
            grub-netboot-archlinux
            grub-theme-minegrub-world-selection-git
            h2status
            hachimi-world-bin
            hammer-editor-bin
            hardened-malloc-git
            hd-idle-go
            heynote-bin
            hla-bin
            huaweicloudmeeting-bin
            hydrogen-drumkits
            hyphen-ru
            hyprmon-bin
            inkstitch
            ipatool
            iscan-plugin-perfection-v330
            jfq
            jira-cli
            jitsi-meet-bin
            jubler-bin
            katifetch
            keepass-diff
            kernel-install-for-dracut
            kernel-modules-hook-reflink
            kickassembler
            klit-bin
            klit-unstable
            koboldcpp-cuda-bin
            komga
            koofr-desktop-bin
            kora-icon-theme
            kuva
            kwin-scripts-dynamic-workspaces
            kwprocessor
            kyp-bin
            lazyjournal
            lcarsde-onboard-theme
            leafview-bin
            legacy-launcher-ely.by
            lft))

;;; PACKAGE DEFINITIONS (96 packages)

;;; -- elephant-websearch --
(define-public elephant-websearch
  (package
    (name "elephant-websearch")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-websearch-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-websearch/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "websearch provider for elephant")
    (description "Websearch provider for elephant.")
    (license license:gpl3+)))

;;; -- envy-tui-bin --
(define-public envy-tui-bin
  (package
    (name "envy-tui-bin")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/tassiovirginio/envy-tui/releases/download/v"
         version "/envy-tui-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/envy-tui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tassiovirginio/envy-tui")
    (synopsis "A Terminal User Interface (TUI) manager for EnvyControl - Easy GPU switchin...")
    (description "A Terminal User Interface (TUI) manager for EnvyControl - Easy GPU switching for Nvidia Optimus laptops under Linux.")
    (license license:expat)))

;;; -- epson-printer-utility --
(define-public epson-printer-utility
  (package
    (name "epson-printer-utility")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX/"
         "releases/download/v" version "/epson-printer-utility-" version ".tar.gz"))
       (file-name (string-append "epson-printer-utility-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/epson-printer-utility/"))))
    (home-page "http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX")
    (synopsis "this is a Printer Utility program for Epson. Using this software, you can c...")
    (description "This is a Printer Utility program for Epson. Using this software, you can check ink levels, view error and other status... on EPSON Printers.")
    (license license:expat)))

;;; -- epub2pdf --
(define-public epub2pdf
  (package
    (name "epub2pdf")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://epub2pdf.com/"
         "releases/download/v" version "/epub2pdf-" version ".tar.gz"))
       (file-name (string-append "epub2pdf-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/epub2pdf/"))))
    (home-page "http://epub2pdf.com")
    (synopsis "epub2pdf is a command-line tool that quickly generates PDF files from EPUB ...")
    (description "Epub2pdf is a command-line tool that quickly generates PDF files from EPUB ebooks. It will run on any platform that supports JRE version 6 or later.")
    (license license:gpl3+)))

;;; -- equibop-bin --
(define-public equibop-bin
  (package
    (name "equibop-bin")
    (version "3.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Equicord/Equibop/releases/download/v"
         version "/equibop-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/equibop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Equicord/Equibop")
    (synopsis "A custom Discord desktop app with Equicord pre-installed (binary release)")
    (description "A custom Discord desktop app with Equicord pre-installed (binary release).")
    (license license:gpl3)))

;;; -- esa-snap-bin --
(define-public esa-snap-bin
  (package
    (name "esa-snap-bin")
    (version "12.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://step.esa.int/main//"
         version "/esa-snap-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/esa-snap-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://step.esa.int/main/")
    (synopsis "ESA SNAP Toolbox for Sentinel Satellite data")
    (description "ESA SNAP Toolbox for Sentinel Satellite data.")
    (license license:gpl3+)))

;;; -- evhz-git --
(define-public evhz-git
  (package
    (name "evhz-git")
    (version "r28.2c94d6f")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.sr.ht/~iank/evhz.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/evhz-git/"))))
    (home-page "https://git.sr.ht/~iank/evhz")
    (synopsis "display the current mouse refresh rate")
    (description "Display the current mouse refresh rate.")
    (license license:gpl3+)))

;;; -- exodus --
(define-public exodus
  (package
    (name "exodus")
    (version "26.3.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://exodus.com/"
         "releases/download/v" version "/exodus-" version ".tar.gz"))
       (file-name (string-append "exodus-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/exodus/"))))
    (home-page "https://exodus.com")
    (synopsis "send, receive & exchange cryptocurrency with ease on the world's leading De...")
    (description "Send, receive & exchange cryptocurrency with ease on the world's leading Desktop, Mobile and Hardware wallets. Bitcoin wallet.")
    (license license:expat)))

;;; -- f5vpn --
(define-public f5vpn
  (package
    (name "f5vpn")
    (version "7262.0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://support.f5.com/csp/article/K32311645#link_04_05/"
         "releases/download/v" version "/f5vpn-" version ".tar.gz"))
       (file-name (string-append "f5vpn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/f5vpn/"))))
    (home-page "https://support.f5.com/csp/article/K32311645#link_04_05")
    (synopsis "VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-I...")
    (description "VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM.")
    (license license:expat)))

;;; -- factor --
(define-public factor
  (package
    (name "factor")
    (version "0.100")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://factorcode.org/"
         "releases/download/v" version "/factor-" version ".tar.gz"))
       (file-name (string-append "factor-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/factor/"))))
    (home-page "http://factorcode.org")
    (synopsis "A general purpose, dynamically typed, stack-based programming language")
    (description "A general purpose, dynamically typed, stack-based programming language.")
    (license license:bsd-3)))

;;; -- factory-cli-bin --
(define-public factory-cli-bin
  (package
    (name "factory-cli-bin")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://app.factory.ai/"
         version "/factory-cli-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/factory-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://app.factory.ai")
    (synopsis "factory CLI - AI-powered terminal assistant")
    (description "Factory CLI - AI-powered terminal assistant.")
    (license license:expat)))

;;; -- fastbuild --
(define-public fastbuild
  (package
    (name "fastbuild")
    (version "1.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.fastbuild.org/"
         "releases/download/v" version "/fastbuild-" version ".tar.gz"))
       (file-name (string-append "fastbuild-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fastbuild/"))))
    (home-page "https://www.fastbuild.org")
    (synopsis "high-performance build system")
    (description "High-performance build system.")
    (license license:expat)))

;;; -- fcitx5-skin-ori-git --
(define-public fcitx5-skin-ori-git
  (package
    (name "fcitx5-skin-ori-git")
    (version "v0.1.r1.g9acce9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Reverier-Xu/Ori-fcitx5.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fcitx5-skin-ori-git/"))))
    (home-page "https://github.com/Reverier-Xu/Ori-fcitx5")
    (synopsis "A round corner and svg theme for fcitx5")
    (description "A round corner and svg theme for fcitx5.")
    (license license:mpl2.0)))

;;; -- ffdash-bin --
(define-public ffdash-bin
  (package
    (name "ffdash-bin")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/bcherb2/ffdash/releases/download/v"
         version "/ffdash-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ffdash-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bcherb2/ffdash")
    (synopsis "VP9 video encoder with live TUI dashboard and hardware acceleration")
    (description "VP9 video encoder with live TUI dashboard and hardware acceleration.")
    (license license:expat)))

;;; -- ffmpeg-audio-thumbnailer --
(define-public ffmpeg-audio-thumbnailer
  (package
    (name "ffmpeg-audio-thumbnailer")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/saltedcoffii/ffmpeg-audio-thumbnailer/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ffmpeg-audio-thumbnailer-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ffmpeg-audio-thumbnailer/"))))
    (home-page "https://github.com/saltedcoffii/ffmpeg-audio-thumbnailer")
    (synopsis "A minimal audio file thumbnailer for file managers, such as nautilus, dolph...")
    (description "A minimal audio file thumbnailer for file managers, such as nautilus, dolphin, thunar, and nemo.")
    (license license:expat)))

;;; -- file2key --
(define-public file2key
  (package
    (name "file2key")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/maandree/file2key/"
         "releases/download/v" version "/file2key-" version ".tar.gz"))
       (file-name (string-append "file2key-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/file2key/"))))
    (home-page "https://codeberg.org/maandree/file2key")
    (synopsis "A simple command that generates a key from a file and a passphrase")
    (description "A simple command that generates a key from a file and a passphrase.")
    (license license:expat)))

;;; -- finar-bin --
(define-public finar-bin
  (package
    (name "finar-bin")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         version "/finar-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/finar-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openlyst.ink")
    (synopsis "jellyfin frontend client")
    (description "Jellyfin frontend client.")
    (license license:gpl3+)))

;;; -- finar-unstable --
(define-public finar-unstable
  (package
    (name "finar-unstable")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         "releases/download/v" version "/finar-unstable-" version ".tar.gz"))
       (file-name (string-append "finar-unstable-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/finar-unstable/"))))
    (home-page "https://openlyst.ink")
    (synopsis "jellyfin frontend client (unstable build from GitHub)")
    (description "Jellyfin frontend client (unstable build from GitHub).")
    (license license:gpl3+)))

;;; -- firefox-extension-arch-search --
(define-public firefox-extension-arch-search
  (package
    (name "firefox-extension-arch-search")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/noraj/firefox-extension-arch-search/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "firefox-extension-arch-search-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/firefox-extension-arch-search/"))))
    (home-page "https://github.com/noraj/firefox-extension-arch-search")
    (synopsis "A set of Web Extensions that adds ArchLinux (bug tracker, forum, packages, ...")
    (description "A set of Web Extensions that adds ArchLinux (bug tracker, forum, packages, wiki, AUR) as a search engine to the Firefox browser.")
    (license license:expat)))

;;; -- fish-pure-prompt --
(define-public fish-pure-prompt
  (package
    (name "fish-pure-prompt")
    (version "4.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/pure-fish/pure/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "fish-pure-prompt-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fish-pure-prompt/"))))
    (home-page "https://github.com/pure-fish/pure")
    (synopsis "pretty, minimal, and fast prompt for Fish")
    (description "Pretty, minimal, and fast prompt for Fish.")
    (license license:expat)))

;;; -- fixvr-git --
(define-public fixvr-git
  (package
    (name "fixvr-git")
    (version "r1.e85e0d9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MiguVT/fixvr.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fixvr-git/"))))
    (home-page "https://github.com/MiguVT/fixvr")
    (synopsis "udev rule that fixes the Valve Index blank EDID (640×480) bug on Linux")
    (description "Udev rule that fixes the Valve Index blank EDID (640×480) bug on Linux.")
    (license license:expat)))

;;; -- flogo --
(define-public flogo
  (package
    (name "flogo")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://fdossena.com?p=flogo/index.frag/"
         "releases/download/v" version "/flogo-" version ".tar.gz"))
       (file-name (string-append "flogo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/flogo/"))))
    (home-page "https://fdossena.com?p=flogo/index.frag")
    (synopsis "create and run programs using flow charts")
    (description "Create and run programs using flow charts.")
    (license license:agpl3+)))

;;; -- flyctl-bin --
(define-public flyctl-bin
  (package
    (name "flyctl-bin")
    (version "0.4.30")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/superfly/flyctl/releases/download/v"
         version "/flyctl-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/flyctl-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/superfly/flyctl")
    (synopsis "command line tools for fly.io services")
    (description "Command line tools for fly.io services.")
    (license license:asl2.0)))

;;; -- foobar2000-component-beefweb-bin --
(define-public foobar2000-component-beefweb-bin
  (package
    (name "foobar2000-component-beefweb-bin")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.foobar2000.org/components/view/foo_beefweb/"
         version "/foobar2000-component-beefweb-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/foobar2000-component-beefweb-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.foobar2000.org/components/view/foo_beefweb")
    (synopsis "A web interface/REST API component for foobar2000")
    (description "A web interface/REST API component for foobar2000.")
    (license license:expat)))

;;; -- foobar2000-component-openlyrics-bin --
(define-public foobar2000-component-openlyrics-bin
  (package
    (name "foobar2000-component-openlyrics-bin")
    (version "1.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.github.com/jacquesh/foo_openlyrics/"
         version "/foobar2000-component-openlyrics-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/foobar2000-component-openlyrics-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.github.com/jacquesh/foo_openlyrics")
    (synopsis "FOSS lyrics UI component for foobar2000 (column & default UI)")
    (description "FOSS lyrics UI component for foobar2000 (column & default UI).")
    (license license:expat)))

;;; -- fortune-mod-portal-game --
(define-public fortune-mod-portal-game
  (package
    (name "fortune-mod-portal-game")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/outadoc/portal-fortunes/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "fortune-mod-portal-game-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fortune-mod-portal-game/"))))
    (home-page "https://github.com/outadoc/portal-fortunes")
    (synopsis "portal quotes for the Unix fortune tool")
    (description "Portal quotes for the Unix fortune tool.")
    (license license:expat)))

;;; -- free42 --
(define-public free42
  (package
    (name "free42")
    (version "3.3.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://thomasokken.com/free42//"
         "releases/download/v" version "/free42-" version ".tar.gz"))
       (file-name (string-append "free42-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/free42/"))))
    (home-page "http://thomasokken.com/free42/")
    (synopsis "A complete re-implementation of the HP-42S calculator and the HP-82240 printer")
    (description "A complete re-implementation of the HP-42S calculator and the HP-82240 printer.")
    (license license:gpl2)))

;;; -- frpc-bin --
(define-public frpc-bin
  (package
    (name "frpc-bin")
    (version "0.66.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/fatedier/frp/releases/download/v"
         version "/frpc-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/frpc-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fatedier/frp")
    (synopsis "A fast reverse proxy to help you expose a local server behind a NAT or fire...")
    (description "A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet. (Client).")
    (license license:asl2.0)))

;;; -- frps-bin --
(define-public frps-bin
  (package
    (name "frps-bin")
    (version "0.66.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/fatedier/frp/releases/download/v"
         version "/frps-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/frps-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fatedier/frp")
    (synopsis "A fast reverse proxy to help you expose a local server behind a NAT or fire...")
    (description "A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet. (Server).")
    (license license:asl2.0)))

;;; -- fswebcam --
(define-public fswebcam
  (package
    (name "fswebcam")
    (version "20200725")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.sanslogic.co.uk/fswebcam//"
         "releases/download/v" version "/fswebcam-" version ".tar.gz"))
       (file-name (string-append "fswebcam-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fswebcam/"))))
    (home-page "https://www.sanslogic.co.uk/fswebcam/")
    (synopsis "neat and simple webcam app")
    (description "Neat and simple webcam app.")
    (license license:gpl2+)))

;;; -- fusee-nano --
(define-public fusee-nano
  (package
    (name "fusee-nano")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/DavidBuchanan314/fusee-nano/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "fusee-nano-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fusee-nano/"))))
    (home-page "https://github.com/DavidBuchanan314/fusee-nano")
    (synopsis "A minimalist re-implementation of the Fusée Gelée exploit")
    (description "A minimalist re-implementation of the Fusée Gelée exploit.")
    (license license:expat)))

;;; -- gaffer-bin --
(define-public gaffer-bin
  (package
    (name "gaffer-bin")
    (version "1.4.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gafferhq.org//"
         version "/gaffer-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gaffer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gafferhq.org/")
    (synopsis "gaffer is a VFX application that enables look developers, lighters, and com...")
    (description "Gaffer is a VFX application that enables look developers, lighters, and compositors to easily build, tweak, iterate, and render scenes.")
    (license license:bsd-3)))

;;; -- geargrafx --
(define-public geargrafx
  (package
    (name "geargrafx")
    (version "1.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/drhelius/Geargrafx/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "geargrafx-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/geargrafx/"))))
    (home-page "https://github.com/drhelius/Geargrafx")
    (synopsis "PC Engine / TurboGrafx-16 emulator and debugger")
    (description "PC Engine / TurboGrafx-16 emulator and debugger.")
    (license license:gpl3+)))

;;; -- gedit-cut-line --
(define-public gedit-cut-line
  (package
    (name "gedit-cut-line")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/hardpixel/gedit-cut-line/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gedit-cut-line-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gedit-cut-line/"))))
    (home-page "https://github.com/hardpixel/gedit-cut-line")
    (synopsis "gedit 3 plugin to cut lines using Ctrl+X")
    (description "Gedit 3 plugin to cut lines using Ctrl+X.")
    (license license:gpl3+)))

;;; -- gedit-dark-variant --
(define-public gedit-dark-variant
  (package
    (name "gedit-dark-variant")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/hardpixel/gedit-dark-variant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gedit-dark-variant-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gedit-dark-variant/"))))
    (home-page "https://github.com/hardpixel/gedit-dark-variant")
    (synopsis "gedit 3 plugin to enable the theme's dark variant")
    (description "Gedit 3 plugin to enable the theme's dark variant.")
    (license license:gpl3+)))

;;; -- gedit-duplicate-line --
(define-public gedit-duplicate-line
  (package
    (name "gedit-duplicate-line")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/hardpixel/gedit-duplicate-line/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gedit-duplicate-line-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gedit-duplicate-line/"))))
    (home-page "https://github.com/hardpixel/gedit-duplicate-line")
    (synopsis "gedit 3 plugin to duplicate highlighted selections using Ctrl+D")
    (description "Gedit 3 plugin to duplicate highlighted selections using Ctrl+D.")
    (license license:gpl3+)))

;;; -- gedit-panel-toggler --
(define-public gedit-panel-toggler
  (package
    (name "gedit-panel-toggler")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/hardpixel/gedit-panel-toggler/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gedit-panel-toggler-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gedit-panel-toggler/"))))
    (home-page "https://github.com/hardpixel/gedit-panel-toggler")
    (synopsis "gedit 3 plugin to toggle side and bottom panels using buttons in header bar")
    (description "Gedit 3 plugin to toggle side and bottom panels using buttons in header bar.")
    (license license:gpl3+)))

;;; -- gedit-scroll-past --
(define-public gedit-scroll-past
  (package
    (name "gedit-scroll-past")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/hardpixel/gedit-scroll-past/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gedit-scroll-past-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gedit-scroll-past/"))))
    (home-page "https://github.com/hardpixel/gedit-scroll-past")
    (synopsis "gedit 3 plugin to allow scrolling past the end of file")
    (description "Gedit 3 plugin to allow scrolling past the end of file.")
    (license license:gpl3+)))

;;; -- gedit-smart-home --
(define-public gedit-smart-home
  (package
    (name "gedit-smart-home")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/hardpixel/gedit-smart-home/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gedit-smart-home-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gedit-smart-home/"))))
    (home-page "https://github.com/hardpixel/gedit-smart-home")
    (synopsis "gedit 3 plugin to go to the first character instead of the start of the lin...")
    (description "Gedit 3 plugin to go to the first character instead of the start of the line using Home.")
    (license license:gpl3+)))

;;; -- ggc-bin --
(define-public ggc-bin
  (package
    (name "ggc-bin")
    (version "8.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/bmf-san/ggc/releases/download/v"
         version "/ggc-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ggc-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bmf-san/ggc")
    (synopsis "A modern Git CLI tool with both traditional command-line and interactive in...")
    (description "A modern Git CLI tool with both traditional command-line and interactive incremental-search UI.")
    (license license:expat)))

;;; -- ghdl --
(define-public ghdl
  (package
    (name "ghdl")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ghdl/ghdl/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ghdl-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ghdl/"))))
    (home-page "https://github.com/ghdl/ghdl")
    (synopsis "VHDL 2008/93/87 simulator - mcode backend")
    (description "VHDL 2008/93/87 simulator - mcode backend.")
    (license license:gpl2)))

;;; -- git-credential-keepassxc --
(define-public git-credential-keepassxc
  (package
    (name "git-credential-keepassxc")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Frederick888/git-credential-keepassxc/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "git-credential-keepassxc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/git-credential-keepassxc/"))))
    (home-page "https://github.com/Frederick888/git-credential-keepassxc")
    (synopsis "git-credential-keepassxc is a Git credential helper that allows Git (and sh...")
    (description "Git-credential-keepassxc is a Git credential helper that allows Git (and shell scripts) to get/store logins from/to KeePassXC.")
    (license license:gpl3+)))

;;; -- git-koji-bin --
(define-public git-koji-bin
  (package
    (name "git-koji-bin")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/cococonscious/koji/releases/download/v"
         version "/git-koji-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/git-koji-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cococonscious/koji")
    (synopsis "an interactive CLI for creating conventional commits")
    (description "An interactive CLI for creating conventional commits.")
    (license license:expat)))

;;; -- gitflow-avh --
(define-public gitflow-avh
  (package
    (name "gitflow-avh")
    (version "1.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/petervanderdoes/gitflow/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gitflow-avh-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gitflow-avh/"))))
    (home-page "https://github.com/petervanderdoes/gitflow/")
    (synopsis "extend git with Vincent Driessen's branching model. The AVH Edition adds mo...")
    (description "Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality.")
    (license license:expat)))

;;; -- gmodpatchtool-bin --
(define-public gmodpatchtool-bin
  (package
    (name "gmodpatchtool-bin")
    (version "20251102")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/solsticegamestudios/gmodpatchtool/releases/download/v"
         version "/gmodpatchtool-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gmodpatchtool-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/solsticegamestudios/gmodpatchtool")
    (synopsis "🇬🩹🛠 Patches for Garry's Mod. Updates/Improves CEF and Fixes common launch/p...")
    (description "🇬🩹🛠 Patches for Garry's Mod. Updates/Improves CEF and Fixes common launch/performance issues (esp. on Linux/Proton/macOS). Formerly GModCEFCodecFix.")
    (license license:gpl3+)))

;;; -- gnome-shell-extension-resource-monitor --
(define-public gnome-shell-extension-resource-monitor
  (package
    (name "gnome-shell-extension-resource-monitor")
    (version "27")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/0ry0n/Resource_Monitor/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gnome-shell-extension-resource-monitor-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gnome-shell-extension-resource-monitor/"))))
    (home-page "https://github.com/0ry0n/Resource_Monitor/")
    (synopsis "monitor the use of system resources like cpu, ram, disk, network and displa...")
    (description "Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar.")
    (license license:gpl3+)))

;;; -- gnome-shell-extension-tophat --
(define-public gnome-shell-extension-tophat
  (package
    (name "gnome-shell-extension-tophat")
    (version "23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/fflewddur/tophat/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gnome-shell-extension-tophat-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gnome-shell-extension-tophat/"))))
    (home-page "https://github.com/fflewddur/tophat")
    (synopsis "view CPU, memory, disk, and network activity in the GNOME top bar (v45 fork)")
    (description "View CPU, memory, disk, and network activity in the GNOME top bar (v45 fork).")
    (license license:gpl3+)))

;;; -- gnome-shell-extension-tray-icons-reloaded --
(define-public gnome-shell-extension-tray-icons-reloaded
  (package
    (name "gnome-shell-extension-tray-icons-reloaded")
    (version "33")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/MartinPL/Tray-Icons-Reloaded/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "gnome-shell-extension-tray-icons-reloaded-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gnome-shell-extension-tray-icons-reloaded/"))))
    (home-page "https://github.com/MartinPL/Tray-Icons-Reloaded")
    (synopsis "GNOME Shell extension which bring back Tray Icons to top panel, with additi...")
    (description "GNOME Shell extension which bring back Tray Icons to top panel, with additional features.")
    (license license:gpl3+)))

;;; -- gnome-ssh-askpass3 --
(define-public gnome-ssh-askpass3
  (package
    (name "gnome-ssh-askpass3")
    (version "8.6p1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.openssh.com/portable.html/"
         "releases/download/v" version "/gnome-ssh-askpass3-" version ".tar.gz"))
       (file-name (string-append "gnome-ssh-askpass3-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gnome-ssh-askpass3/"))))
    (home-page "https://www.openssh.com/portable.html")
    (synopsis "A GTK3 passphrase requester for ssh-add")
    (description "A GTK3 passphrase requester for ssh-add.")
    (license license:expat)))

;;; -- goanime --
(define-public goanime
  (package
    (name "goanime")
    (version "1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/alvarorichard/GoAnime/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "goanime-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goanime/"))))
    (home-page "https://github.com/alvarorichard/GoAnime")
    (synopsis "A command-line tool to browse, play, and download anime")
    (description "A command-line tool to browse, play, and download anime.")
    (license license:expat)))

;;; -- goofcord-bin --
(define-public goofcord-bin
  (package
    (name "goofcord-bin")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Milkshiift/GoofCord/releases/download/v"
         version "/goofcord-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goofcord-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Milkshiift/GoofCord")
    (synopsis "take control of your Discord experience with GoofCord – the highly configur...")
    (description "Take control of your Discord experience with GoofCord – the highly configurable and privacy first discord client.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; -- goose-desktop-bin --
(define-public goose-desktop-bin
  (package
    (name "goose-desktop-bin")
    (version "1.29.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/block/goose/releases/download/v"
         version "/goose-desktop-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goose-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/block/goose")
    (synopsis "goose Desktop (prebuilt .deb repack) — an open source, extensible AI agent ...")
    (description "Goose Desktop (prebuilt .deb repack) — an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM.")
    (license license:asl2.0)))

;;; -- goto-ssh-bin --
(define-public goto-ssh-bin
  (package
    (name "goto-ssh-bin")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/grafviktor/goto/releases/download/v"
         version "/goto-ssh-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goto-ssh-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/grafviktor/goto")
    (synopsis "A simple terminal SSH manager that provides you with an easy access to the ...")
    (description "A simple terminal SSH manager that provides you with an easy access to the list of your favorite SSH servers.")
    (license license:expat)))

;;; -- gowall-bin --
(define-public gowall-bin
  (package
    (name "gowall-bin")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Achno/gowall/releases/download/v"
         version "/gowall-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gowall-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Achno/gowall")
    (synopsis "A tool to convert a Wallpaper's color scheme - palette")
    (description "A tool to convert a Wallpaper's color scheme - palette.")
    (license license:expat)))

;;; -- goxe --
(define-public goxe
  (package
    (name "goxe")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/DumbNoxx/Goxe/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "goxe-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goxe/"))))
    (home-page "https://github.com/DumbNoxx/Goxe")
    (synopsis "is a log reduction tool that normalizes, filters, and aggregates repeated m...")
    (description "Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage.")
    (license license:asl2.0)))

;;; -- grepai-bin --
(define-public grepai-bin
  (package
    (name "grepai-bin")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/yoanbernabeu/grepai/releases/download/v"
         version "/grepai-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/grepai-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/yoanbernabeu/grepai")
    (synopsis "privacy-first CLI tool for semantic code search using vector embeddings")
    (description "Privacy-first CLI tool for semantic code search using vector embeddings.")
    (license license:expat)))

;;; -- grub-netboot-archlinux --
(define-public grub-netboot-archlinux
  (package
    (name "grub-netboot-archlinux")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://archlinux.org/releng/netboot//"
         "releases/download/v" version "/grub-netboot-archlinux-" version ".tar.gz"))
       (file-name (string-append "grub-netboot-archlinux-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/grub-netboot-archlinux/"))))
    (home-page "https://archlinux.org/releng/netboot/")
    (synopsis "adds archlinux netboot entry to grub-mkconfig for easy boot")
    (description "Adds archlinux netboot entry to grub-mkconfig for easy boot.")
    (license license:gpl3+)))

;;; -- grub-theme-minegrub-world-selection-git --
(define-public grub-theme-minegrub-world-selection-git
  (package
    (name "grub-theme-minegrub-world-selection-git")
    (version "r104.3e0f8ff")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Lxtharia/minegrub-world-sel-theme.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/grub-theme-minegrub-world-selection-git/"))))
    (home-page "https://github.com/Lxtharia/minegrub-world-sel-theme")
    (synopsis "A grub theme in the style of the Minecraft singleplayer (sp) world selectio...")
    (description "A grub theme in the style of the Minecraft singleplayer (sp) world selection screen!.")
    (license license:expat)))

;;; -- h2status --
(define-public h2status
  (package
    (name "h2status")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/neoden/h2status/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "h2status-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/h2status/"))))
    (home-page "https://github.com/neoden/h2status")
    (synopsis "lightweight status bar for sway/i3")
    (description "Lightweight status bar for sway/i3.")
    (license license:expat)))

;;; -- hachimi-world-bin --
(define-public hachimi-world-bin
  (package
    (name "hachimi-world-bin")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://hachimi.world//"
         version "/hachimi-world-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hachimi-world-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://hachimi.world/")
    (synopsis "A community-driven open-source meme culture music community, bin version")
    (description "A community-driven open-source meme culture music community, bin version.")
    (license license:agpl3+)))

;;; -- hammer-editor-bin --
(define-public hammer-editor-bin
  (package
    (name "hammer-editor-bin")
    (version "2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Wavesonics/hammer-editor/releases/download/v"
         version "/hammer-editor-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hammer-editor-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Wavesonics/hammer-editor")
    (synopsis "A simple tool for building stories (binary release)")
    (description "A simple tool for building stories (binary release).")
    (license license:expat)))

;;; -- hardened-malloc-git --
(define-public hardened-malloc-git
  (package
    (name "hardened-malloc-git")
    (version "13+r728+g4fe9018b6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/GrapheneOS/hardened_malloc.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hardened-malloc-git/"))))
    (home-page "https://github.com/GrapheneOS/hardened_malloc")
    (synopsis "hardened allocator designed for modern systems")
    (description "Hardened allocator designed for modern systems.")
    (license license:expat)))

;;; -- hd-idle-go --
(define-public hd-idle-go
  (package
    (name "hd-idle-go")
    (version "1.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/adelolmo/hd-idle/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "hd-idle-go-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hd-idle-go/"))))
    (home-page "https://github.com/adelolmo/hd-idle")
    (synopsis "hard Disk Idle Spin-Down Utility - enhanced reimplementation of hd-idle")
    (description "Hard Disk Idle Spin-Down Utility - enhanced reimplementation of hd-idle.")
    (license license:gpl3+)))

;;; -- heynote-bin --
(define-public heynote-bin
  (package
    (name "heynote-bin")
    (version "2.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/heyman/heynote/releases/download/v"
         version "/heynote-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/heynote-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/heyman/heynote")
    (synopsis "A dedicated scratchpad for developers")
    (description "A dedicated scratchpad for developers.")
    (license license:expat)))

;;; -- hla-bin --
(define-public hla-bin
  (package
    (name "hla-bin")
    (version "2.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.plantation-productions.com/Webster/HighLevelAsm/"
         version "/hla-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hla-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.plantation-productions.com/Webster/HighLevelAsm")
    (synopsis "the High-Level Assembler for the 80x86 CPU")
    (description "The High-Level Assembler for the 80x86 CPU.")
    (license license:expat)))

;;; -- huaweicloudmeeting-bin --
(define-public huaweicloudmeeting-bin
  (package
    (name "huaweicloudmeeting-bin")
    (version "9.12.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.huaweicloud.com/product/meeting/"
         version "/huaweicloudmeeting-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/huaweicloudmeeting-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.huaweicloud.com/product/meeting")
    (synopsis "huaWei Cloud Meeting.Prebuilt version.Use system-wide electron.\"云端\"协同的会议解决方...")
    (description "HuaWei Cloud Meeting.Prebuilt version.Use system-wide electron.\"云端\"协同的会议解决方案，全平台接入，全球覆盖，提供高清、稳定、安全、高效的极简会议体验.")
    (license license:expat)))

;;; -- hydrogen-drumkits --
(define-public hydrogen-drumkits
  (package
    (name "hydrogen-drumkits")
    (version "20220929")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://sourceforge.net/projects/hydrogen//"
         "releases/download/v" version "/hydrogen-drumkits-" version ".tar.gz"))
       (file-name (string-append "hydrogen-drumkits-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hydrogen-drumkits/"))))
    (home-page "https://sourceforge.net/projects/hydrogen/")
    (synopsis "hydrogen drum kits")
    (description "Hydrogen drum kits.")
    (license license:gpl2+)))

;;; -- hyphen-ru --
(define-public hyphen-ru
  (package
    (name "hyphen-ru")
    (version "20210727")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/LibreOffice/dictionaries/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "hyphen-ru-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hyphen-ru/"))))
    (home-page "https://github.com/LibreOffice/dictionaries/tree/master/ru_RU")
    (synopsis "russian hyphenation rules")
    (description "Russian hyphenation rules.")
    (license license:expat)))

;;; -- hyprmon-bin --
(define-public hyprmon-bin
  (package
    (name "hyprmon-bin")
    (version "0.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/erans/hyprmon/releases/download/v"
         version "/hyprmon-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hyprmon-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/erans/hyprmon")
    (synopsis "A multi-monitor profile manager for Hyprland")
    (description "A multi-monitor profile manager for Hyprland.")
    (license license:asl2.0)))

;;; -- inkstitch --
(define-public inkstitch
  (package
    (name "inkstitch")
    (version "3.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://inkstitch.org//"
         "releases/download/v" version "/inkstitch-" version ".tar.gz"))
       (file-name (string-append "inkstitch-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/inkstitch/"))))
    (home-page "https://inkstitch.org/")
    (synopsis "an open source machine embroidery design platform based on Inkscape")
    (description "An open source machine embroidery design platform based on Inkscape.")
    (license license:gpl3+)))

;;; -- ipatool --
(define-public ipatool
  (package
    (name "ipatool")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/majd/ipatool/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ipatool-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ipatool/"))))
    (home-page "https://github.com/majd/ipatool")
    (synopsis "command-line tool that allows searching and downloading app packages (known...")
    (description "Command-line tool that allows searching and downloading app packages (known as ipa files) from the iOS App Store.")
    (license license:expat)))

;;; -- iscan-plugin-perfection-v330 --
(define-public iscan-plugin-perfection-v330
  (package
    (name "iscan-plugin-perfection-v330")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX/"
         "releases/download/v" version "/iscan-plugin-perfection-v330-" version ".tar.gz"))
       (file-name (string-append "iscan-plugin-perfection-v330-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/iscan-plugin-perfection-v330/"))))
    (home-page "https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX")
    (synopsis "EPSON Image Scan! plugin for Epson scanners GT-F730, GT-S630, Perfection V3...")
    (description "EPSON Image Scan! plugin for Epson scanners GT-F730, GT-S630, Perfection V33, Perfection V330 Photo.")
    (license license:expat)))

;;; -- jfq --
(define-public jfq
  (package
    (name "jfq")
    (version "1.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/blgm/jfq/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "jfq-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/jfq/"))))
    (home-page "https://github.com/blgm/jfq")
    (synopsis "JSONata on the command line")
    (description "JSONata on the command line.")
    (license license:expat)))

;;; -- jira-cli --
(define-public jira-cli
  (package
    (name "jira-cli")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ankitpokhrel/jira-cli/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "jira-cli-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/jira-cli/"))))
    (home-page "https://github.com/ankitpokhrel/jira-cli")
    (synopsis "feature-rich interactive Jira command line")
    (description "Feature-rich interactive Jira command line.")
    (license license:expat)))

;;; -- jitsi-meet-bin --
(define-public jitsi-meet-bin
  (package
    (name "jitsi-meet-bin")
    (version "1.0.9139")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://jitsi.org/jitsi-meet//"
         version "/jitsi-meet-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/jitsi-meet-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jitsi.org/jitsi-meet/")
    (synopsis "jitsi Meet Web binary")
    (description "Jitsi Meet Web binary.")
    (license license:asl2.0)))

;;; -- jubler-bin --
(define-public jubler-bin
  (package
    (name "jubler-bin")
    (version "9.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.jubler.org/index.html/"
         version "/jubler-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/jubler-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jubler.org/index.html")
    (synopsis "A tool to edit text-based subtitles")
    (description "A tool to edit text-based subtitles.")
    (license license:gpl2+)))

;;; -- katifetch --
(define-public katifetch
  (package
    (name "katifetch")
    (version "13.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ximimoments/katifetch/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "katifetch-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/katifetch/"))))
    (home-page "https://github.com/ximimoments/katifetch")
    (synopsis "cross-platform system information fetch tool with ASCII art")
    (description "Cross-platform system information fetch tool with ASCII art.")
    (license license:expat)))

;;; -- keepass-diff --
(define-public keepass-diff
  (package
    (name "keepass-diff")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Narigo/keepass-diff/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "keepass-diff-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/keepass-diff/"))))
    (home-page "https://github.com/Narigo/keepass-diff")
    (synopsis "tool to find diff between KeePass (*.kdbx) files")
    (description "Tool to find diff between KeePass (*.kdbx) files.")
    (license license:expat)))

;;; -- kernel-install-for-dracut --
(define-public kernel-install-for-dracut
  (package
    (name "kernel-install-for-dracut")
    (version "1.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/dalto.8/kernel-install-for-dracut/"
         "releases/download/v" version "/kernel-install-for-dracut-" version ".tar.gz"))
       (file-name (string-append "kernel-install-for-dracut-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kernel-install-for-dracut/"))))
    (home-page "https://gitlab.com/dalto.8/kernel-install-for-dracut")
    (synopsis "enables systemd-boot automation using kernel-install with dracut")
    (description "Enables systemd-boot automation using kernel-install with dracut.")
    (license license:gpl2+)))

;;; -- kernel-modules-hook-reflink --
(define-public kernel-modules-hook-reflink
  (package
    (name "kernel-modules-hook-reflink")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/lideming/kernel-modules-hook/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "kernel-modules-hook-reflink-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kernel-modules-hook-reflink/"))))
    (home-page "https://github.com/lideming/kernel-modules-hook")
    (synopsis "keeps your system fully functional after a kernel upgrade (forked version u...")
    (description "Keeps your system fully functional after a kernel upgrade (forked version using `cp --reflink`, maybe better for btrfs).")
    (license license:unlicense)))

;;; -- kickassembler --
(define-public kickassembler
  (package
    (name "kickassembler")
    (version "5.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.theweb.dk/KickAssembler/Main.html/"
         "releases/download/v" version "/kickassembler-" version ".tar.gz"))
       (file-name (string-append "kickassembler-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kickassembler/"))))
    (home-page "http://www.theweb.dk/KickAssembler/Main.html")
    (synopsis "an advanced MOS 65xx assembler combined with a Java Script like script lang...")
    (description "An advanced MOS 65xx assembler combined with a Java Script like script language.")
    (license license:expat)))

;;; -- klit-bin --
(define-public klit-bin
  (package
    (name "klit-bin")
    (version "9.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         version "/klit-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/klit-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openlyst.ink")
    (synopsis "E926 API client")
    (description "E926 API client.")
    (license license:gpl3+)))

;;; -- klit-unstable --
(define-public klit-unstable
  (package
    (name "klit-unstable")
    (version "10.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         "releases/download/v" version "/klit-unstable-" version ".tar.gz"))
       (file-name (string-append "klit-unstable-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/klit-unstable/"))))
    (home-page "https://openlyst.ink")
    (synopsis "E926 API client (unstable build from GitHub)")
    (description "E926 API client (unstable build from GitHub).")
    (license license:gpl3+)))

;;; -- koboldcpp-cuda-bin --
(define-public koboldcpp-cuda-bin
  (package
    (name "koboldcpp-cuda-bin")
    (version "1.110")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/LostRuins/koboldcpp/releases/download/v"
         version "/koboldcpp-cuda-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/koboldcpp-cuda-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LostRuins/koboldcpp")
    (synopsis "A simple one-file way to run various GGML and GGUF models with KoboldAI's U...")
    (description "A simple one-file way to run various GGML and GGUF models with KoboldAI's UI, CUDA version.")
    (license license:agpl3+)))

;;; -- komga --
(define-public komga
  (package
    (name "komga")
    (version "1.24.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://komga.org/"
         "releases/download/v" version "/komga-" version ".tar.gz"))
       (file-name (string-append "komga-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/komga/"))))
    (home-page "https://komga.org")
    (synopsis "media server for comics/mangas/BDs with API and OPDS support")
    (description "Media server for comics/mangas/BDs with API and OPDS support.")
    (license license:expat)))

;;; -- koofr-desktop-bin --
(define-public koofr-desktop-bin
  (package
    (name "koofr-desktop-bin")
    (version "41a82e7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://koofr.eu//"
         version "/koofr-desktop-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/koofr-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://koofr.eu/")
    (synopsis "koofr Desktop Client - Cloud storage client")
    (description "Koofr Desktop Client - Cloud storage client.")
    (license license:expat)))

;;; -- kora-icon-theme --
(define-public kora-icon-theme
  (package
    (name "kora-icon-theme")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/bikass/kora/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "kora-icon-theme-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kora-icon-theme/"))))
    (home-page "https://github.com/bikass/kora")
    (synopsis "SVG icon theme suitable for every desktop environment (dark and light versi...")
    (description "SVG icon theme suitable for every desktop environment (dark and light versions, HiDPI support).")
    (license license:gpl3+)))

;;; -- kuva --
(define-public kuva
  (package
    (name "kuva")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Psy-Fer/kuva/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "kuva-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kuva/"))))
    (home-page "https://github.com/Psy-Fer/kuva")
    (synopsis "scientific plotting library in Rust with various backends")
    (description "Scientific plotting library in Rust with various backends.")
    (license license:expat)))

;;; -- kwin-scripts-dynamic-workspaces --
(define-public kwin-scripts-dynamic-workspaces
  (package
    (name "kwin-scripts-dynamic-workspaces")
    (version "3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/maurges/dynamic_workspaces/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "kwin-scripts-dynamic-workspaces-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kwin-scripts-dynamic-workspaces/"))))
    (home-page "https://github.com/maurges/dynamic_workspaces")
    (synopsis "A kwin script that creates and deletes desktops as you move windows on the ...")
    (description "A kwin script that creates and deletes desktops as you move windows on the last one.")
    (license license:bsd-3)))

;;; -- kwprocessor --
(define-public kwprocessor
  (package
    (name "kwprocessor")
    (version "1.00")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://hashcat.net/wiki/doku.php?id=kwprocessor/"
         "releases/download/v" version "/kwprocessor-" version ".tar.gz"))
       (file-name (string-append "kwprocessor-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kwprocessor/"))))
    (home-page "https://hashcat.net/wiki/doku.php?id=kwprocessor")
    (synopsis "advanced keyboard-walk generator with configureable basechars, keymap and r...")
    (description "Advanced keyboard-walk generator with configureable basechars, keymap and routes.")
    (license license:expat)))

;;; -- kyp-bin --
(define-public kyp-bin
  (package
    (name "kyp-bin")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/stickpro/kyp/releases/download/v"
         version "/kyp-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kyp-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/stickpro/kyp")
    (synopsis "local-first terminal password manager with TOTP support (binary release)")
    (description "Local-first terminal password manager with TOTP support (binary release).")
    (license license:expat)))

;;; -- lazyjournal --
(define-public lazyjournal
  (package
    (name "lazyjournal")
    (version "0.8.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Lifailon/lazyjournal/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "lazyjournal-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lazyjournal/"))))
    (home-page "https://github.com/Lifailon/lazyjournal")
    (synopsis "TUI for journalctl, file system logs, as well Docker and Podman containers ...")
    (description "TUI for journalctl, file system logs, as well Docker and Podman containers for quick viewing and filtering with fuzzy find and regex support.")
    (license license:expat)))

;;; -- lcarsde-onboard-theme --
(define-public lcarsde-onboard-theme
  (package
    (name "lcarsde-onboard-theme")
    (version "23.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://lcarsde.github.io/"
         "releases/download/v" version "/lcarsde-onboard-theme-" version ".tar.gz"))
       (file-name (string-append "lcarsde-onboard-theme-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lcarsde-onboard-theme/"))))
    (home-page "https://lcarsde.github.io")
    (synopsis "LCARS like theme for onboard for LCARSDE")
    (description "LCARS like theme for onboard for LCARSDE.")
    (license license:expat)))

;;; -- leafview-bin --
(define-public leafview-bin
  (package
    (name "leafview-bin")
    (version "4.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/sprout2000/leafview/releases/download/v"
         version "/leafview-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/leafview-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sprout2000/leafview")
    (synopsis "A minimalist image viewer based on Leaflet.js and Electron.(Prebuilt versio...")
    (description "A minimalist image viewer based on Leaflet.js and Electron.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; -- legacy-launcher-ely.by --
(define-public legacy-launcher-ely.by
  (package
    (name "legacy-launcher-ely.by")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://llaun.ch//"
         "releases/download/v" version "/legacy-launcher-ely.by-" version ".tar.gz"))
       (file-name (string-append "legacy-launcher-ely.by-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/legacy-launcher-ely.by/"))))
    (home-page "https://llaun.ch/")
    (synopsis "legacy launcher version from ely.by")
    (description "Legacy launcher version from ely.by.")
    (license license:gpl3+)))

;;; -- lft --
(define-public lft
  (package
    (name "lft")
    (version "3.91")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://pwhois.org/lft//"
         "releases/download/v" version "/lft-" version ".tar.gz"))
       (file-name (string-append "lft-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lft/"))))
    (home-page "http://pwhois.org/lft/")
    (synopsis "A layer four traceroute implementing numerous other features")
    (description "A layer four traceroute implementing numerous other features.")
    (license license:expat)))
