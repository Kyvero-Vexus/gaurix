;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407m
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages:
;;;   mix of binary packages (AppImage, .deb, tar.gz, single-binary),
;;;   source builds (C/C++, Python, Perl, Rust, CMake), fonts, themes.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260407m)
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
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages image)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages games)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages tls)
  #:export (
            sff
            streamdeck-ui
            zulucrypt
            rankmirrors
            python-vllm
            grass-desktop-node
            python-flash-attention
            tonelib-zoom-bin
            gittyup
            dropbox-cli
            ripcalc
            perl-authen-simple
            intel-media-driver-legacy-bin
            pacman-hook-list-systemd-units
            vcsi
            atproto-pds
            vmware-vmrc
            libwebcam
            v4l2ucp
            glpi-agent
            perl-xml-treepp
            bcc-tools
            python-bcc
            perl-test-compile
            perl-io-capture
            electron6-bin
            jsignpdf
            simutrans-pak192-comic
            perl-http-server-simple-authen
            mermaid-filter
            python-atlassian-api
            wiki-js
            gkrellm-gkfreq
            thunderbird-beta-bin
            replay-sorcery
            kolossus-launcher
            hunspell-hr
            nyrna-bin
            font-work-sans
            font-work-sans-variable
            sway-git-wlroots
            opennebula
            fancontrol-gui
            heaptrack
            trufflehog
            chs
            heroic-gogdl
            xmind
            profile-sync-daemon-librewolf
            code-saturne
            vertex-themes
            alacarte-xfce
            tonelib-jam-bin
            steamrun
            tunescope
            guitarix-vst
            elementary-xfce-icons
            gkleds
            gkrelltop
            gkrellm-themes
            chowbyod-bin
            patchance
            chowcentaur-bin
            nootka
            tuxedo-drivers-dkms
            macintosh-js-bin
            opera-developer
            sslyze
            trelby
            scidb
            tencent-docs-bin
            slang-verilog
            noi-desktop-bin
            jzintv
            kyocera-universal
            intiface-central
            font-sorts-mill-goudy
            go-musicfox-bin
            adminer-editor
            scream
            qt5-styleplugins
            vkd3d-proton-mingw
            pam-ssh
            lenmus
            selinux-refpolicy-arch
            vencord
            chromium-vencord
            firefox-vencord
            firefox-developer-edition-vencord
            librewolf-vencord
            font-udev-gothic
            wofi-power-menu
            slimevr-beta-bin
            terminal-rain-lightning
            syncclipboard-desktop
            wine-discord-ipc-bridge
            vpinball
            qt6-jpegxl-image-plugin
            zls-master-bin
            optimus-manager-qt))

;;;
;;; ── 1. sff ────────────────────────────────────────────────────────
;;; Simple and fast terminal file manager
;;;
(define-public sff
  (package
    (name "sff")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/sylphenix/sff/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/sylphenix/sff")
    (synopsis "Simple and fast terminal file manager")
    (description
     "Simple and fast terminal file manager")
    (license license:bsd-2)))

;;;
;;; ── 2. streamdeck-ui ──────────────────────────────────────────────
;;; A Linux compatible UI for the Elgato Stream Deck
;;;
(define-public streamdeck-ui
  (package
    (name "streamdeck-ui")
    (version "4.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://streamdeck-linux-gui.github.io/streamdeck-linux-gui/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://streamdeck-linux-gui.github.io/streamdeck-linux-gui")
    (synopsis "A Linux compatible UI for the Elgato Stream Deck")
    (description
     "A Linux compatible UI for the Elgato Stream Deck")
    (license license:expat)))

;;;
;;; ── 3. zulucrypt ──────────────────────────────────────────────────
;;; A cli and gui frontend to cryptsetup
;;;
(define-public zulucrypt
  (package
    (name "zulucrypt")
    (version "7.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://mhogomchungu.github.io/zuluCrypt/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://mhogomchungu.github.io/zuluCrypt")
    (synopsis "A cli and gui frontend to cryptsetup")
    (description
     "A cli and gui frontend to cryptsetup")
    (license license:gpl2+)))

;;;
;;; ── 4. rankmirrors ────────────────────────────────────────────────
;;; Read a list of archlinux mirrors from a file and rank them by speed.
;;;
(define-public rankmirrors
  (package
    (name "rankmirrors")
    (version "r2.60f7568")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/whoisYoges/rankmirrors/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/whoisYoges/rankmirrors")
    (synopsis "Read a list of archlinux mirrors from a file and rank them by speed.")
    (description
     "Read a list of archlinux mirrors from a file and rank them by speed.")
    (license license:agpl3+)))

;;;
;;; ── 5. python-vllm ────────────────────────────────────────────────
;;; high-throughput and memory-efficient inference and serving engine for LLMs
;;;
(define-public python-vllm
  (package
    (name "python-vllm")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "vllm" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/vllm-project/vllm")
    (synopsis "high-throughput and memory-efficient inference and serving engine for LLMs")
    (description
     "high-throughput and memory-efficient inference and serving engine for
LLMs
")
    (license license:asl2.0)))

;;;
;;; ── 6. grass-desktop-node ─────────────────────────────────────────
;;; The Grass Desktop Node is a lightweight standalone application that is designed 
;;;
(define-public grass-desktop-node
  (package
    (name "grass-desktop-node")
    (version "6.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://app.getgrass.io/dashboard/store/item/desktop/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://app.getgrass.io/dashboard/store/item/desktop")
    (synopsis "The Grass Desktop Node is a lightweight standalone application that is designed ")
    (description
     "The Grass Desktop Node is a lightweight standalone application that is
designed to run on any desktop. Users of the desktop node are awarded
priority network traffic and are able to earn additional rewards for
occasional access to the user's bandwidth.
")
    (license license:nonfree)))

;;;
;;; ── 7. python-flash-attention ─────────────────────────────────────
;;; Fast and memory-efficient exact attention
;;;
(define-public python-flash-attention
  (package
    (name "python-flash-attention")
    (version "2.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "flash-attention" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Dao-AILab/flash-attention")
    (synopsis "Fast and memory-efficient exact attention")
    (description
     "Fast and memory-efficient exact attention")
    (license license:bsd-3)))

;;;
;;; ── 8. tonelib-zoom-bin ───────────────────────────────────────────
;;; ToneLib Zoom – change and save all the settings in your Zoom(r) guitar pedal
;;;
(define-public tonelib-zoom-bin
  (package
    (name "tonelib-zoom-bin")
    (version "4.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://tonelib.net/download/linux/ToneLib-Tonelibzoom-amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/tonelib-zoom-bin"))
            (chmod (string-append bin "/tonelib-zoom-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tonelib.net/zoom-quick-start")
    (synopsis "ToneLib Zoom – change and save all the settings in your Zoom(r) guitar pedal")
    (description
     "ToneLib Zoom – change and save all the settings in your Zoom(r) guitar
pedal
")
    (license license:nonfree)))

;;;
;;; ── 9. gittyup ────────────────────────────────────────────────────
;;; Graphical Git client (GitAhead fork)
;;;
(define-public gittyup
  (package
    (name "gittyup")
    (version "1.3.0.r435.gfa59b663")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Murmele/Gittyup.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Murmele/Gittyup")
    (synopsis "Graphical Git client (GitAhead fork)")
    (description
     "Graphical Git client (GitAhead fork)")
    (license license:expat)))

;;;
;;; ── 10. dropbox-cli ───────────────────────────────────────────────
;;; Command line interface for Dropbox
;;;
(define-public dropbox-cli
  (package
    (name "dropbox-cli")
    (version "2024.04.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.dropbox.com/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.dropbox.com")
    (synopsis "Command line interface for Dropbox")
    (description
     "Command line interface for Dropbox")
    (license license:gpl3+)))

;;;
;;; ── 11. ripcalc ───────────────────────────────────────────────────
;;; ripcalc, an IP network address tool
;;;
(define-public ripcalc
  (package
    (name "ripcalc")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/edneville/ripcalc/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/edneville/ripcalc")
    (synopsis "ripcalc, an IP network address tool")
    (description
     "ripcalc, an IP network address tool")
    (license license:gpl3+)))

;;;
;;; ── 12. perl-authen-simple ────────────────────────────────────────
;;; Authen-Simple for Perl
;;;
(define-public perl-authen-simple
  (package
    (name "perl-authen-simple")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/PLACEHOLDER/Authen-Simple-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://metacpan.org/release/Authen-Simple")
    (synopsis "Authen-Simple for Perl")
    (description
     "Authen-Simple for Perl")
    (license license:gpl3+)))

;;;
;;; ── 13. intel-media-driver-legacy-bin ─────────────────────────────
;;; Intel Media Driver for VAAPI (legacy platforms, pre-compiled binaries)
;;;
(define-public intel-media-driver-legacy-bin
  (package
    (name "intel-media-driver-legacy-bin")
    (version "24.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/intel/vpl-gpu-rt/releases/download/v"
             version "/vpl-gpu-rt-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/intel-media-driver-legacy-bin"))
            (chmod (string-append bin "/intel-media-driver-legacy-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/intel/vpl-gpu-rt")
    (synopsis "Intel Media Driver for VAAPI (legacy platforms, pre-compiled binaries)")
    (description
     "Intel Media Driver for VAAPI (legacy platforms, pre-compiled binaries)")
    (license license:expat)))

;;;
;;; ── 14. pacman-hook-list-systemd-units ────────────────────────────
;;; Prints new systemd units on package installation or upgrade.
;;;
(define-public pacman-hook-list-systemd-units
  (package
    (name "pacman-hook-list-systemd-units")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/pacman-hook-list-systemd-units")
    (synopsis "Prints new systemd units on package installation or upgrade.")
    (description
     "Prints new systemd units on package installation or upgrade.")
    (license license:unlicense)))

;;;
;;; ── 15. vcsi ──────────────────────────────────────────────────────
;;; Create video contact sheets, thumbnails
;;;
(define-public vcsi
  (package
    (name "vcsi")
    (version "7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/amietn/vcsi.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/amietn/vcsi")
    (synopsis "Create video contact sheets, thumbnails")
    (description
     "Create video contact sheets, thumbnails")
    (license license:expat)))

;;;
;;; ── 16. atproto-pds ───────────────────────────────────────────────
;;; AT Protocol PDS (Personal Data Server)
;;;
(define-public atproto-pds
  (package
    (name "atproto-pds")
    (version "0.4.208")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bluesky-social/pds/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bluesky-social/pds")
    (synopsis "AT Protocol PDS (Personal Data Server)")
    (description
     "AT Protocol PDS (Personal Data Server)")
    (license license:asl2.0)))

;;;
;;; ── 17. vmware-vmrc ───────────────────────────────────────────────
;;; VMware Remote Console
;;;
(define-public vmware-vmrc
  (package
    (name "vmware-vmrc")
    (version "12.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.vmware.com/go/download-vmrc/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.vmware.com/go/download-vmrc")
    (synopsis "VMware Remote Console")
    (description
     "VMware Remote Console")
    (license license:nonfree)))

;;;
;;; ── 18. libwebcam ─────────────────────────────────────────────────
;;; A library that is designed to simplify the development of webcam applications
;;;
(define-public libwebcam
  (package
    (name "libwebcam")
    (version "0.2.5.r2.g0233106")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "http://sourceforge.net/projects/libwebcam.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://sourceforge.net/projects/libwebcam")
    (synopsis "A library that is designed to simplify the development of webcam applications")
    (description
     "A library that is designed to simplify the development of webcam
applications
")
    (license license:gpl3+)))

;;;
;;; ── 19. v4l2ucp ───────────────────────────────────────────────────
;;; A universal control panel for Video for Linux Two (V4L2) devices
;;;
(define-public v4l2ucp
  (package
    (name "v4l2ucp")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://v4l2ucp.sourceforge.net/files/v4l2ucp-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://v4l2ucp.sourceforge.net")
    (synopsis "A universal control panel for Video for Linux Two (V4L2) devices")
    (description
     "A universal control panel for Video for Linux Two (V4L2) devices")
    (license license:gpl2+)))

;;;
;;; ── 20. glpi-agent ────────────────────────────────────────────────
;;; GLPI Agent
;;;
(define-public glpi-agent
  (package
    (name "glpi-agent")
    (version "1.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.glpi-project.org/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.glpi-project.org")
    (synopsis "GLPI Agent")
    (description
     "GLPI Agent")
    (license license:gpl2+)))

;;;
;;; ── 21. perl-xml-treepp ───────────────────────────────────────────
;;; Perl/CPAN Module XML::TreePP: Pure Perl implementation for parsing/writing XML d
;;;
(define-public perl-xml-treepp
  (package
    (name "perl-xml-treepp")
    (version "0.43")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/PLACEHOLDER/Xml-Treepp-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://metacpan.org/release/XML-TreePP")
    (synopsis "Perl/CPAN Module XML::TreePP: Pure Perl implementation for parsing/writing XML d")
    (description
     "Perl/CPAN Module XML::TreePP: Pure Perl implementation for
parsing/writing XML documents
")
    (license license:gpl3+)))

;;;
;;; ── 22. bcc-tools ─────────────────────────────────────────────────
;;; BPF Compiler Collection - Tools - latest git code
;;;
(define-public bcc-tools
  (package
    (name "bcc-tools")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/iovisor/bcc.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/iovisor/bcc")
    (synopsis "BPF Compiler Collection - Tools - latest git code")
    (description
     "BPF Compiler Collection - Tools - latest git code")
    (license license:asl2.0)))

;;;
;;; ── 23. python-bcc ────────────────────────────────────────────────
;;; BPF Compiler Collection - Python 3 bindings - latest git code
;;;
(define-public python-bcc
  (package
    (name "python-bcc")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/iovisor/bcc.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/iovisor/bcc")
    (synopsis "BPF Compiler Collection - Python 3 bindings - latest git code")
    (description
     "BPF Compiler Collection - Python 3 bindings - latest git code")
    (license license:asl2.0)))

;;;
;;; ── 24. perl-test-compile ─────────────────────────────────────────
;;; Check whether Perl files compile correctly.
;;;
(define-public perl-test-compile
  (package
    (name "perl-test-compile")
    (version "3.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/PLACEHOLDER/Test-Compile-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://metacpan.org/release/Test-Compile")
    (synopsis "Check whether Perl files compile correctly.")
    (description
     "Check whether Perl files compile correctly.")
    (license license:artistic2.0)))

;;;
;;; ── 25. perl-io-capture ───────────────────────────────────────────
;;; Abstract Base Class to build modules to capture output.
;;;
(define-public perl-io-capture
  (package
    (name "perl-io-capture")
    (version "0.05")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/PLACEHOLDER/Io-Capture-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://metacpan.org/release/IO-Capture")
    (synopsis "Abstract Base Class to build modules to capture output.")
    (description
     "Abstract Base Class to build modules to capture output.")
    (license license:gpl3+)))

;;;
;;; ── 26. electron6-bin ─────────────────────────────────────────────
;;; Build cross platform desktop apps with web technologies - version 6 - binary ver
;;;
(define-public electron6-bin
  (package
    (name "electron6-bin")
    (version "6.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://electronjs.org/releases/download/v"
             version "/electron6-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/electron6-bin"))
            (chmod (string-append bin "/electron6-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://electronjs.org")
    (synopsis "Build cross platform desktop apps with web technologies - version 6 - binary ver")
    (description
     "Build cross platform desktop apps with web technologies - version 6 -
binary version
")
    (license license:expat)))

;;;
;;; ── 27. jsignpdf ──────────────────────────────────────────────────
;;; Digitally sign PDF files with X.509 certificates in GUI and CLI.
;;;
(define-public jsignpdf
  (package
    (name "jsignpdf")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://jsignpdf.sourceforge.net/files/jsignpdf-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://jsignpdf.sourceforge.net")
    (synopsis "Digitally sign PDF files with X.509 certificates in GUI and CLI.")
    (description
     "Digitally sign PDF files with X.509 certificates in GUI and CLI.")
    (license license:asl2.0)))

;;;
;;; ── 28. simutrans-pak192-comic ────────────────────────────────────
;;; High resolution graphics set for Simutrans, with a comic style
;;;
(define-public simutrans-pak192-comic
  (package
    (name "simutrans-pak192-comic")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.simutrans.com/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.simutrans.com")
    (synopsis "High resolution graphics set for Simutrans, with a comic style")
    (description
     "High resolution graphics set for Simutrans, with a comic style")
    (license license:nonfree)))

;;;
;;; ── 29. perl-http-server-simple-authen ────────────────────────────
;;; Authentication plugin for HTTP::Server::Simple
;;;
(define-public perl-http-server-simple-authen
  (package
    (name "perl-http-server-simple-authen")
    (version "0.04")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/PLACEHOLDER/Http-Server-Simple-Authen-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://search.cpan.org/~miyagawa/HTTP-Server-Simple-Authen-0.04")
    (synopsis "Authentication plugin for HTTP::Server::Simple")
    (description
     "Authentication plugin for HTTP::Server::Simple")
    (license license:nonfree)))

;;;
;;; ── 30. mermaid-filter ────────────────────────────────────────────
;;; pandoc filter that adds support for mermaid syntax diagrams in markdown
;;;
(define-public mermaid-filter
  (package
    (name "mermaid-filter")
    (version "1.4.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.npmjs.com/package/mermaid-filter/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/mermaid-filter")
    (synopsis "pandoc filter that adds support for mermaid syntax diagrams in markdown")
    (description
     "pandoc filter that adds support for mermaid syntax diagrams in
markdown
")
    (license license:gpl3+)))

;;;
;;; ── 31. python-atlassian-api ──────────────────────────────────────
;;; Python Atlassian REST API Wrapper
;;;
(define-public python-atlassian-api
  (package
    (name "python-atlassian-api")
    (version "3.41.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "atlassian-api" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/atlassian-api/atlassian-python-api")
    (synopsis "Python Atlassian REST API Wrapper")
    (description
     "Python Atlassian REST API Wrapper")
    (license license:asl2.0)))

;;;
;;; ── 32. wiki-js ───────────────────────────────────────────────────
;;; Wiki.js | A modern, lightweight and powerful wiki app built on Node.js
;;;
(define-public wiki-js
  (package
    (name "wiki-js")
    (version "2.5.308")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Requarks/wiki/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Requarks/wiki")
    (synopsis "Wiki.js | A modern, lightweight and powerful wiki app built on Node.js")
    (description
     "Wiki.js | A modern, lightweight and powerful wiki app built on Node.js")
    (license license:agpl3+)))

;;;
;;; ── 33. gkrellm-gkfreq ────────────────────────────────────────────
;;; A plugin for gkrellm2 which displays the current CPU frequency
;;;
(define-public gkrellm-gkfreq
  (package
    (name "gkrellm-gkfreq")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/carcass82/gkrellm-gkfreq/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/carcass82/gkrellm-gkfreq")
    (synopsis "A plugin for gkrellm2 which displays the current CPU frequency")
    (description
     "A plugin for gkrellm2 which displays the current CPU frequency")
    (license license:gpl3+)))

;;;
;;; ── 34. thunderbird-beta-bin ──────────────────────────────────────
;;; Standalone Mail/News reader - Bleeding edge binary version
;;;
(define-public thunderbird-beta-bin
  (package
    (name "thunderbird-beta-bin")
    (version "150.0b3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.mozilla.org/thunderbird/releases/download/v"
             version "/thunderbird-beta-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/thunderbird-beta-bin"))
            (chmod (string-append bin "/thunderbird-beta-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mozilla.org/thunderbird")
    (synopsis "Standalone Mail/News reader - Bleeding edge binary version")
    (description
     "Standalone Mail/News reader - Bleeding edge binary version")
    (license license:gpl3+)))

;;;
;;; ── 35. replay-sorcery ────────────────────────────────────────────
;;; Open-source, instant-replay solution for Linux
;;;
(define-public replay-sorcery
  (package
    (name "replay-sorcery")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/matanui159/ReplaySorcery/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/matanui159/ReplaySorcery")
    (synopsis "Open-source, instant-replay solution for Linux")
    (description
     "Open-source, instant-replay solution for Linux")
    (license license:gpl3+)))

;;;
;;; ── 36. kolossus-launcher ─────────────────────────────────────────
;;; Kolossus Launcher, to download the latest version of the IFSCL.
;;;
(define-public kolossus-launcher
  (package
    (name "kolossus-launcher")
    (version "200_7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://en.codelyoko.fr/ifscl/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://en.codelyoko.fr/ifscl")
    (synopsis "Kolossus Launcher, to download the latest version of the IFSCL.")
    (description
     "Kolossus Launcher, to download the latest version of the IFSCL.")
    (license license:nonfree)))

;;;
;;; ── 37. hunspell-hr ───────────────────────────────────────────────
;;; Croatian dictionary for Hunspell
;;;
(define-public hunspell-hr
  (package
    (name "hunspell-hr")
    (version "2.1.20251229")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/krunose/hunspell-hr/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/krunose/hunspell-hr")
    (synopsis "Croatian dictionary for Hunspell")
    (description
     "Croatian dictionary for Hunspell")
    (license license:nonfree)))

;;;
;;; ── 38. nyrna-bin ─────────────────────────────────────────────────
;;; Suspend games and applications at any time and resume whenever you wish
;;;
(define-public nyrna-bin
  (package
    (name "nyrna-bin")
    (version "2.27.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Merrit/nyrna/releases/download/v"
             version "/nyrna-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/nyrna-bin"))
            (chmod (string-append bin "/nyrna-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Merrit/nyrna")
    (synopsis "Suspend games and applications at any time and resume whenever you wish")
    (description
     "Suspend games and applications at any time and resume whenever you
wish
")
    (license license:gpl3+)))

;;;
;;; ── 39. font-work-sans ────────────────────────────────────────────
;;; Typeface based loosely on early Grotesques with extensive OpenType features
;;;
(define-public font-work-sans
  (package
    (name "font-work-sans")
    (version "2.010")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://weiweihuanghuang.github.io/Work-Sans/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:phases #~(modify-phases %standard-phases)))
    (home-page "http://weiweihuanghuang.github.io/Work-Sans")
    (synopsis "Typeface based loosely on early Grotesques with extensive OpenType features")
    (description
     "Typeface based loosely on early Grotesques with extensive OpenType
features
")
    (license license:nonfree)))

;;;
;;; ── 40. font-work-sans-variable ───────────────────────────────────
;;; Typeface based loosely on early Grotesques with extensive OpenType features
;;;
(define-public font-work-sans-variable
  (package
    (name "font-work-sans-variable")
    (version "2.010")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://weiweihuanghuang.github.io/Work-Sans/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:phases #~(modify-phases %standard-phases)))
    (home-page "http://weiweihuanghuang.github.io/Work-Sans")
    (synopsis "Typeface based loosely on early Grotesques with extensive OpenType features")
    (description
     "Typeface based loosely on early Grotesques with extensive OpenType
features
")
    (license license:nonfree)))

;;;
;;; ── 41. sway-git-wlroots ──────────────────────────────────────────
;;; sway with wlroots statically linked
;;;
(define-public sway-git-wlroots
  (package
    (name "sway-git-wlroots")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://swaywm.org.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://swaywm.org")
    (synopsis "sway with wlroots statically linked")
    (description
     "sway with wlroots statically linked")
    (license license:nonfree)))

;;;
;;; ── 42. opennebula ────────────────────────────────────────────────
;;; Virtual management infrastructure as a service (IaaS) toolkit for cloud computin
;;;
(define-public opennebula
  (package
    (name "opennebula")
    (version "5.10.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://opennebula.org/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://opennebula.org")
    (synopsis "Virtual management infrastructure as a service (IaaS) toolkit for cloud computin")
    (description
     "Virtual management infrastructure as a service (IaaS) toolkit for
cloud computing (NOTE: Read the PKGBUILD!)
")
    (license license:asl2.0)))

;;;
;;; ── 43. fancontrol-gui ────────────────────────────────────────────
;;; GUI for fancontrol and the fancontrol systemd service
;;;
(define-public fancontrol-gui
  (package
    (name "fancontrol-gui")
    (version "0.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Maldela/Fancontrol-GUI/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Maldela/Fancontrol-GUI")
    (synopsis "GUI for fancontrol and the fancontrol systemd service")
    (description
     "GUI for fancontrol and the fancontrol systemd service")
    (license license:gpl2+)))

;;;
;;; ── 44. heaptrack ─────────────────────────────────────────────────
;;; A heap memory profiler
;;;
(define-public heaptrack
  (package
    (name "heaptrack")
    (version "1543.c8ed4c5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://apps.kde.org/heaptrack.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://apps.kde.org/heaptrack")
    (synopsis "A heap memory profiler")
    (description
     "A heap memory profiler")
    (license license:nonfree)))

;;;
;;; ── 45. trufflehog ────────────────────────────────────────────────
;;; Tool for finding secrets like private keys and credentials.
;;;
(define-public trufflehog
  (package
    (name "trufflehog")
    (version "3.94.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/trufflesecurity/trufflehog/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/trufflesecurity/trufflehog")
    (synopsis "Tool for finding secrets like private keys and credentials.")
    (description
     "Tool for finding secrets like private keys and credentials.")
    (license license:agpl3+)))

;;;
;;; ── 46. chs ───────────────────────────────────────────────────────
;;; Play chess against the Stockfish engine in your terminal.
;;;
(define-public chs
  (package
    (name "chs")
    (version "3.0.0.r3.gf9c7b1b")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nickzuber/chs.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nickzuber/chs")
    (synopsis "Play chess against the Stockfish engine in your terminal.")
    (description
     "Play chess against the Stockfish engine in your terminal.")
    (license license:expat)))

;;;
;;; ── 47. heroic-gogdl ──────────────────────────────────────────────
;;; GOG Downloading module for Heroic Games Launcher
;;;
(define-public heroic-gogdl
  (package
    (name "heroic-gogdl")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Heroic-Games-Launcher/heroic-gogdl/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Heroic-Games-Launcher/heroic-gogdl")
    (synopsis "GOG Downloading module for Heroic Games Launcher")
    (description
     "GOG Downloading module for Heroic Games Launcher")
    (license license:gpl3)))

;;;
;;; ── 48. xmind ─────────────────────────────────────────────────────
;;; Brainstorming and Mind Mapping Software
;;;
(define-public xmind
  (package
    (name "xmind")
    (version "26.02.02052.202601211830")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.xmind.net/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.xmind.net")
    (synopsis "Brainstorming and Mind Mapping Software")
    (description
     "Brainstorming and Mind Mapping Software")
    (license license:nonfree)))

;;;
;;; ── 49. profile-sync-daemon-librewolf ─────────────────────────────
;;; LibreWolf browser support for profile-sync-daemon
;;;
(define-public profile-sync-daemon-librewolf
  (package
    (name "profile-sync-daemon-librewolf")
    (version "2022.11.29")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/profile-sync-daemon-librewolf")
    (synopsis "LibreWolf browser support for profile-sync-daemon")
    (description
     "LibreWolf browser support for profile-sync-daemon")
    (license license:gpl3+)))

;;;
;;; ── 50. code-saturne ──────────────────────────────────────────────
;;; An open source CFD software which solves the Navier-Stokes equations under diffe
;;;
(define-public code-saturne
  (package
    (name "code-saturne")
    (version "9.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://code-saturne.org/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://code-saturne.org")
    (synopsis "An open source CFD software which solves the Navier-Stokes equations under diffe")
    (description
     "An open source CFD software which solves the Navier-Stokes equations
under different circumstances.
")
    (license license:gpl3+)))

;;;
;;; ── 51. vertex-themes ─────────────────────────────────────────────
;;; Vertex Gtk2, Gtk3, Metacity, Xfwm, Cinnamon and GNOME Shell themes (GNOME 3.22 v
;;;
(define-public vertex-themes
  (package
    (name "vertex-themes")
    (version "20170128")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://horst3180.deviantart.com/art/Vertex-Theme-470663601/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://horst3180.deviantart.com/art/Vertex-Theme-470663601")
    (synopsis "Vertex Gtk2, Gtk3, Metacity, Xfwm, Cinnamon and GNOME Shell themes (GNOME 3.22 v")
    (description
     "Vertex Gtk2, Gtk3, Metacity, Xfwm, Cinnamon and GNOME Shell themes
(GNOME 3.22 version)
")
    (license license:gpl3+)))

;;;
;;; ── 52. alacarte-xfce ─────────────────────────────────────────────
;;; Menu editor for Xfce
;;;
(define-public alacarte-xfce
  (package
    (name "alacarte-xfce")
    (version "3.42.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.gnome.org/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.gnome.org")
    (synopsis "Menu editor for Xfce")
    (description
     "Menu editor for Xfce")
    (license license:lgpl2.1)))

;;;
;;; ── 53. tonelib-jam-bin ───────────────────────────────────────────
;;; ToneLib Jam – the learning and practice software for guitar players
;;;
(define-public tonelib-jam-bin
  (package
    (name "tonelib-jam-bin")
    (version "4.8.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://tonelib.net/download/linux/ToneLib-Tonelibjam-amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/tonelib-jam-bin"))
            (chmod (string-append bin "/tonelib-jam-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tonelib.net/jam-overview")
    (synopsis "ToneLib Jam – the learning and practice software for guitar players")
    (description
     "ToneLib Jam – the learning and practice software for guitar players")
    (license license:nonfree)))

;;;
;;; ── 54. steamrun ──────────────────────────────────────────────────
;;; A simple script for executing programs in the Steam Runtime
;;;
(define-public steamrun
  (package
    (name "steamrun")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/doraskayo/steamrun/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/doraskayo/steamrun")
    (synopsis "A simple script for executing programs in the Steam Runtime")
    (description
     "A simple script for executing programs in the Steam Runtime")
    (license license:expat)))

;;;
;;; ── 55. tunescope ─────────────────────────────────────────────────
;;; An oscilloscope style guitar tuner
;;;
(define-public tunescope
  (package
    (name "tunescope")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/darrellenns/tunescope.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/darrellenns/tunescope")
    (synopsis "An oscilloscope style guitar tuner")
    (description
     "An oscilloscope style guitar tuner")
    (license license:gpl3+)))

;;;
;;; ── 56. guitarix-vst ──────────────────────────────────────────────
;;; A versatile (guitar) amplifier VST3 plugin
;;;
(define-public guitarix-vst
  (package
    (name "guitarix-vst")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/brummer10/guitarix.vst/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/brummer10/guitarix.vst")
    (synopsis "A versatile (guitar) amplifier VST3 plugin")
    (description
     "A versatile (guitar) amplifier VST3 plugin")
    (license license:gpl3+)))

;;;
;;; ── 57. elementary-xfce-icons ─────────────────────────────────────
;;; Elementary icon theme with improved Xfce support (Git version)
;;;
(define-public elementary-xfce-icons
  (package
    (name "elementary-xfce-icons")
    (version "0.20.1.17.g3f283396")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/shimmerproject/elementary-xfce.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/shimmerproject/elementary-xfce")
    (synopsis "Elementary icon theme with improved Xfce support (Git version)")
    (description
     "Elementary icon theme with improved Xfce support (Git version)")
    (license license:gpl3+)))

;;;
;;; ── 58. gkleds ────────────────────────────────────────────────────
;;; Gkrellm plugin to monitor the CapsLock, NumLock, and ScrollLock keys
;;;
(define-public gkleds
  (package
    (name "gkleds")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://web.archive.org/web/20190209043134/http://freshmeat.sourceforge.net/projects/gkleds/files/gkleds-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://web.archive.org/web/20190209043134/http://freshmeat.sourceforge.net/projects/gkleds")
    (synopsis "Gkrellm plugin to monitor the CapsLock, NumLock, and ScrollLock keys")
    (description
     "Gkrellm plugin to monitor the CapsLock, NumLock, and ScrollLock keys")
    (license license:gpl3+)))

;;;
;;; ── 59. gkrelltop ─────────────────────────────────────────────────
;;; Displays the top-x cpu hogging tasks
;;;
(define-public gkrelltop
  (package
    (name "gkrelltop")
    (version "2.2.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://sourceforge.net/projects/gkrelltop/files/gkrelltop-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://sourceforge.net/projects/gkrelltop")
    (synopsis "Displays the top-x cpu hogging tasks")
    (description
     "Displays the top-x cpu hogging tasks")
    (license license:gpl3+)))

;;;
;;; ── 60. gkrellm-themes ────────────────────────────────────────────
;;; Themes from muhri.net for GKrellM
;;;
(define-public gkrellm-themes
  (package
    (name "gkrellm-themes")
    (version "20030109")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.muhri.net/gkrellm/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.muhri.net/gkrellm")
    (synopsis "Themes from muhri.net for GKrellM")
    (description
     "Themes from muhri.net for GKrellM")
    (license license:gpl3+)))

;;;
;;; ── 61. chowbyod-bin ──────────────────────────────────────────────
;;; Build-your-own guitar distortion!
;;;
(define-public chowbyod-bin
  (package
    (name "chowbyod-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://chowdsp.com/releases/download/v"
             version "/chowbyod-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/chowbyod-bin"))
            (chmod (string-append bin "/chowbyod-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://chowdsp.com")
    (synopsis "Build-your-own guitar distortion!")
    (description
     "Build-your-own guitar distortion!")
    (license license:gpl3+)))

;;;
;;; ── 62. patchance ─────────────────────────────────────────────────
;;; A modern graphical patchbay for JACK
;;;
(define-public patchance
  (package
    (name "patchance")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Houston4444/Patchance/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Houston4444/Patchance")
    (synopsis "A modern graphical patchbay for JACK")
    (description
     "A modern graphical patchbay for JACK")
    (license license:gpl2)))

;;;
;;; ── 63. chowcentaur-bin ───────────────────────────────────────────
;;; Digital emulation of the Klon Centaur guitar pedal using RNNs, Wave Digital Filt
;;;
(define-public chowcentaur-bin
  (package
    (name "chowcentaur-bin")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://chowdsp.com/releases/download/v"
             version "/chowcentaur-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/chowcentaur-bin"))
            (chmod (string-append bin "/chowcentaur-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://chowdsp.com")
    (synopsis "Digital emulation of the Klon Centaur guitar pedal using RNNs, Wave Digital Filt")
    (description
     "Digital emulation of the Klon Centaur guitar pedal using RNNs, Wave
Digital Filters, and more
")
    (license license:bsd-3)))

;;;
;;; ── 64. nootka ────────────────────────────────────────────────────
;;; Tool for learning classical score notation (git)
;;;
(define-public nootka
  (package
    (name "nootka")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "http://nootka.sourceforge.net.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://nootka.sourceforge.net")
    (synopsis "Tool for learning classical score notation (git)")
    (description
     "Tool for learning classical score notation (git)")
    (license license:gpl3+)))

;;;
;;; ── 65. tuxedo-drivers-dkms ───────────────────────────────────────
;;; TUXEDO Computers kernel module drivers. Compatibility check disabled - works whe
;;;
(define-public tuxedo-drivers-dkms
  (package
    (name "tuxedo-drivers-dkms")
    (version "4.21.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/kronerm/tuxedo-drivers-nocompatcheck/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/kronerm/tuxedo-drivers-nocompatcheck")
    (synopsis "TUXEDO Computers kernel module drivers. Compatibility check disabled - works whe")
    (description
     "TUXEDO Computers kernel module drivers. Compatibility check disabled -
works when using identical models from other brands, example being
TUXEDO Pulse 14 Gen 4 and Schenker Via 14 Pro (M24)
")
    (license license:gpl2+)))

;;;
;;; ── 66. macintosh-js-bin ──────────────────────────────────────────
;;; A virtual Apple Macintosh with System 8, running in Electron
;;;
(define-public macintosh-js-bin
  (package
    (name "macintosh-js-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/felixrieseberg/macintosh.js/releases/download/v"
             version "/macintosh.js-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/macintosh-js-bin"))
            (chmod (string-append bin "/macintosh-js-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/felixrieseberg/macintosh.js")
    (synopsis "A virtual Apple Macintosh with System 8, running in Electron")
    (description
     "A virtual Apple Macintosh with System 8, running in Electron")
    (license license:gpl2+)))

;;;
;;; ── 67. opera-developer ───────────────────────────────────────────
;;; Fast, secure, easy-to-use web browser Opera is a fast, secure, and user-friendly
;;;
(define-public opera-developer
  (package
    (name "opera-developer")
    (version "129.0.5818.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.opera.com/computer/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.opera.com/computer")
    (synopsis "Fast, secure, easy-to-use web browser Opera is a fast, secure, and user-friendly")
    (description
     "Fast, secure, easy-to-use web browser Opera is a fast, secure, and
user-friendly web browser. It includes a built-in ad blocker, Video
pop-out, and free VPN.(Developer Stream)
")
    (license license:nonfree)))

;;;
;;; ── 68. sslyze ────────────────────────────────────────────────────
;;; Fast and full-featured SSL scanner.
;;;
(define-public sslyze
  (package
    (name "sslyze")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nabla-c0d3/sslyze/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nabla-c0d3/sslyze")
    (synopsis "Fast and full-featured SSL scanner.")
    (description
     "Fast and full-featured SSL scanner.")
    (license license:agpl3)))

;;;
;;; ── 69. trelby ────────────────────────────────────────────────────
;;; The free, multiplatform, feature-rich screenwriting program!
;;;
(define-public trelby
  (package
    (name "trelby")
    (version "2.4.16.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/trelby/trelby/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/trelby/trelby")
    (synopsis "The free, multiplatform, feature-rich screenwriting program!")
    (description
     "The free, multiplatform, feature-rich screenwriting program!")
    (license license:gpl2+)))

;;;
;;; ── 70. scidb ─────────────────────────────────────────────────────
;;; Chess database browser: chess, chess960, etc engines; import Chessbase, PGN, Sci
;;;
(define-public scidb
  (package
    (name "scidb")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://sourceforge.net/projects/scidb.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://sourceforge.net/projects/scidb")
    (synopsis "Chess database browser: chess, chess960, etc engines; import Chessbase, PGN, Sci")
    (description
     "Chess database browser: chess, chess960, etc engines; import
Chessbase, PGN, Scid; CQL
")
    (license license:gpl2+)))

;;;
;;; ── 71. tencent-docs-bin ──────────────────────────────────────────
;;; 腾讯文档 Tencent Docs - 让协作更高效，创作更轻松
;;;
(define-public tencent-docs-bin
  (package
    (name "tencent-docs-bin")
    (version "3.10.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://docs.qq.com/home/releases/download/v"
             version "/tencent-docs-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/tencent-docs-bin"))
            (chmod (string-append bin "/tencent-docs-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.qq.com/home")
    (synopsis "腾讯文档 Tencent Docs - 让协作更高效，创作更轻松")
    (description
     "腾讯文档 Tencent Docs - 让协作更高效，创作更轻松")
    (license license:nonfree)))

;;;
;;; ── 72. slang-verilog ─────────────────────────────────────────────
;;; SystemVerilog Language Services
;;;
(define-public slang-verilog
  (package
    (name "slang-verilog")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/MikePopoloski/slang/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/MikePopoloski/slang")
    (synopsis "SystemVerilog Language Services")
    (description
     "SystemVerilog Language Services")
    (license license:expat)))

;;;
;;; ── 73. noi-desktop-bin ───────────────────────────────────────────
;;; Power Your World with AI - Explore, Extend, Empower.(Prebuilt version)
;;;
(define-public noi-desktop-bin
  (package
    (name "noi-desktop-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://noi.nofwl.com/releases/download/v"
             version "/noi-desktop-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/noi-desktop-bin"))
            (chmod (string-append bin "/noi-desktop-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://noi.nofwl.com")
    (synopsis "Power Your World with AI - Explore, Extend, Empower.(Prebuilt version)")
    (description
     "Power Your World with AI - Explore, Extend, Empower.(Prebuilt version)")
    (license license:nonfree)))

;;;
;;; ── 74. jzintv ────────────────────────────────────────────────────
;;; Intellivision Emulator
;;;
(define-public jzintv
  (package
    (name "jzintv")
    (version "20200712")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://spatula-city.org/~im14u2c/intv/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://spatula-city.org/~im14u2c/intv")
    (synopsis "Intellivision Emulator")
    (description
     "Intellivision Emulator")
    (license license:gpl3+)))

;;;
;;; ── 75. kyocera-universal ─────────────────────────────────────────
;;; Kyocera Printing Package for many Kyocera printers (stripped of kdialog9).
;;;
(define-public kyocera-universal
  (package
    (name "kyocera-universal")
    (version "9.4.20240521")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.kyocera.com/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.kyocera.com")
    (synopsis "Kyocera Printing Package for many Kyocera printers (stripped of kdialog9).")
    (description
     "Kyocera Printing Package for many Kyocera printers (stripped of
kdialog9).
")
    (license license:nonfree)))

;;;
;;; ── 76. intiface-central ──────────────────────────────────────────
;;; Intiface Central (Buttplug Frontend) Application for Desktop and Mobile
;;;
(define-public intiface-central
  (package
    (name "intiface-central")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://intiface.com/central/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://intiface.com/central")
    (synopsis "Intiface Central (Buttplug Frontend) Application for Desktop and Mobile")
    (description
     "Intiface Central (Buttplug Frontend) Application for Desktop and
Mobile
")
    (license license:gpl3)))

;;;
;;; ── 77. font-sorts-mill-goudy ─────────────────────────────────────
;;; A ‘revival’ of Goudy Oldstyle and Italic
;;;
(define-public font-sorts-mill-goudy
  (package
    (name "font-sorts-mill-goudy")
    (version "20160215")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://theleagueofmoveabletype.com/sorts-mill-goudy/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:phases #~(modify-phases %standard-phases)))
    (home-page "http://theleagueofmoveabletype.com/sorts-mill-goudy")
    (synopsis "A ‘revival’ of Goudy Oldstyle and Italic")
    (description
     "A ‘revival’ of Goudy Oldstyle and Italic")
    (license license:silofl1.1)))

;;;
;;; ── 78. go-musicfox-bin ───────────────────────────────────────────
;;; Command-line Netease Cloud Music written in Go. (Precompiled version)
;;;
(define-public go-musicfox-bin
  (package
    (name "go-musicfox-bin")
    (version "4.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/go-musicfox/go-musicfox/releases/download/v"
             version "/go-musicfox-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/go-musicfox-bin"))
            (chmod (string-append bin "/go-musicfox-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/go-musicfox/go-musicfox")
    (synopsis "Command-line Netease Cloud Music written in Go. (Precompiled version)")
    (description
     "Command-line Netease Cloud Music written in Go. (Precompiled version)")
    (license license:expat)))

;;;
;;; ── 79. adminer-editor ────────────────────────────────────────────
;;; Database data editing tool written in PHP
;;;
(define-public adminer-editor
  (package
    (name "adminer-editor")
    (version "5.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.adminer.org/en/editor/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.adminer.org/en/editor")
    (synopsis "Database data editing tool written in PHP")
    (description
     "Database data editing tool written in PHP")
    (license license:asl2.0)))

;;;
;;; ── 80. scream ────────────────────────────────────────────────────
;;; A Scream audio receiver using Pulseaudio, ALSA, JACK or stdout as audio output
;;;
(define-public scream
  (package
    (name "scream")
    (version "4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/duncanthrax/scream/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/duncanthrax/scream")
    (synopsis "A Scream audio receiver using Pulseaudio, ALSA, JACK or stdout as audio output")
    (description
     "A Scream audio receiver using Pulseaudio, ALSA, JACK or stdout as
audio output
")
    (license license:ms-pl)))

;;;
;;; ── 81. qt5-styleplugins ──────────────────────────────────────────
;;; Additional style plugins for Qt5
;;;
(define-public qt5-styleplugins
  (package
    (name "qt5-styleplugins")
    (version "5.0.0.20170311")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/qt/qtstyleplugins/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/qt/qtstyleplugins")
    (synopsis "Additional style plugins for Qt5")
    (description
     "Additional style plugins for Qt5")
    (license license:lgpl2.1)))

;;;
;;; ── 82. vkd3d-proton-mingw ────────────────────────────────────────
;;; Fork of VKD3D. Development branches for Protons Direct3D 12 implementation
;;;
(define-public vkd3d-proton-mingw
  (package
    (name "vkd3d-proton-mingw")
    (version "3.0.r0.g6d97b022")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/HansKristian-Work/vkd3d-proton.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/HansKristian-Work/vkd3d-proton")
    (synopsis "Fork of VKD3D. Development branches for Protons Direct3D 12 implementation")
    (description
     "Fork of VKD3D. Development branches for Protons Direct3D 12
implementation
")
    (license license:lgpl2.1)))

;;;
;;; ── 83. pam-ssh ───────────────────────────────────────────────────
;;; PAM module providing single sign-on behavior for SSH.
;;;
(define-public pam-ssh
  (package
    (name "pam-ssh")
    (version "2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://pam-ssh.sourceforge.net/files/pam-ssh-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://pam-ssh.sourceforge.net")
    (synopsis "PAM module providing single sign-on behavior for SSH.")
    (description
     "PAM module providing single sign-on behavior for SSH.")
    (license license:nonfree)))

;;;
;;; ── 84. lenmus ────────────────────────────────────────────────────
;;; A free program for learning music
;;;
(define-public lenmus
  (package
    (name "lenmus")
    (version "6.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.lenmus.org/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.lenmus.org")
    (synopsis "A free program for learning music")
    (description
     "A free program for learning music")
    (license license:gpl3+)))

;;;
;;; ── 85. selinux-refpolicy-arch ────────────────────────────────────
;;; Modular SELinux reference policy including headers and docs with Arch Linux patc
;;;
(define-public selinux-refpolicy-arch
  (package
    (name "selinux-refpolicy-arch")
    (version "20250923")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SELinuxProject/refpolicy/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/SELinuxProject/refpolicy/wiki")
    (synopsis "Modular SELinux reference policy including headers and docs with Arch Linux patc")
    (description
     "Modular SELinux reference policy including headers and docs with Arch
Linux patches
")
    (license license:gpl2+)))

;;;
;;; ── 86. vencord ───────────────────────────────────────────────────
;;; The cutest Discord client mod (replaces Vesktop's built-in Vencord)
;;;
(define-public vencord
  (package
    (name "vencord")
    (version "1.14.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vencord.dev/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://vencord.dev")
    (synopsis "The cutest Discord client mod (replaces Vesktop's built-in Vencord)")
    (description
     "The cutest Discord client mod (replaces Vesktop's built-in Vencord)")
    (license license:gpl3+)))

;;;
;;; ── 87. chromium-vencord ──────────────────────────────────────────
;;; The cutest Discord client mod (unpacked webextension)
;;;
(define-public chromium-vencord
  (package
    (name "chromium-vencord")
    (version "1.14.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vencord.dev/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://vencord.dev")
    (synopsis "The cutest Discord client mod (unpacked webextension)")
    (description
     "The cutest Discord client mod (unpacked webextension)")
    (license license:gpl3+)))

;;;
;;; ── 88. firefox-vencord ───────────────────────────────────────────
;;; The cutest Discord client mod
;;;
(define-public firefox-vencord
  (package
    (name "firefox-vencord")
    (version "1.14.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vencord.dev/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://vencord.dev")
    (synopsis "The cutest Discord client mod")
    (description
     "The cutest Discord client mod")
    (license license:gpl3+)))

;;;
;;; ── 89. firefox-developer-edition-vencord ─────────────────────────
;;; The cutest Discord client mod
;;;
(define-public firefox-developer-edition-vencord
  (package
    (name "firefox-developer-edition-vencord")
    (version "1.14.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vencord.dev/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://vencord.dev")
    (synopsis "The cutest Discord client mod")
    (description
     "The cutest Discord client mod")
    (license license:gpl3+)))

;;;
;;; ── 90. librewolf-vencord ─────────────────────────────────────────
;;; The cutest Discord client mod
;;;
(define-public librewolf-vencord
  (package
    (name "librewolf-vencord")
    (version "1.14.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vencord.dev/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://vencord.dev")
    (synopsis "The cutest Discord client mod")
    (description
     "The cutest Discord client mod")
    (license license:gpl3+)))

;;;
;;; ── 91. font-udev-gothic ──────────────────────────────────────────
;;; A composite font of BIZ UD Gothic and JetBrains Mono
;;;
(define-public font-udev-gothic
  (package
    (name "font-udev-gothic")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/yuru7/udev-gothic/releases/download/v"
             version "/udev-gothic-v" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:phases #~(modify-phases %standard-phases)))
    (home-page "https://github.com/yuru7/udev-gothic")
    (synopsis "A composite font of BIZ UD Gothic and JetBrains Mono")
    (description
     "A composite font of BIZ UD Gothic and JetBrains Mono")
    (license license:silofl1.1)))

;;;
;;; ── 92. wofi-power-menu ───────────────────────────────────────────
;;; Highly configurable power menu using the wofi launcher power-menu
;;;
(define-public wofi-power-menu
  (package
    (name "wofi-power-menu")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/szaffarano/wofi-power-menu/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/szaffarano/wofi-power-menu")
    (synopsis "Highly configurable power menu using the wofi launcher power-menu")
    (description
     "Highly configurable power menu using the wofi launcher power-menu")
    (license license:expat)))

;;;
;;; ── 93. slimevr-beta-bin ──────────────────────────────────────────
;;; SlimeVR FBT software beta version
;;;
(define-public slimevr-beta-bin
  (package
    (name "slimevr-beta-bin")
    (version "19.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v"
             version "/SlimeVR-Server-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/slimevr-beta-bin"))
            (chmod (string-append bin "/slimevr-beta-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SlimeVR/SlimeVR-Server")
    (synopsis "SlimeVR FBT software beta version")
    (description
     "SlimeVR FBT software beta version")
    (license license:nonfree)))

;;;
;;; ── 94. terminal-rain-lightning ───────────────────────────────────
;;; A terminal rain and lightning animation written in C using ncurses
;;;
(define-public terminal-rain-lightning
  (package
    (name "terminal-rain-lightning")
    (version "aaba4ff")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Kutaygb/terminal-rain-lightning-c.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Kutaygb/terminal-rain-lightning-c")
    (synopsis "A terminal rain and lightning animation written in C using ncurses")
    (description
     "A terminal rain and lightning animation written in C using ncurses")
    (license license:expat)))

;;;
;;; ── 95. syncclipboard-desktop ─────────────────────────────────────
;;; Cross-Platform Cipboard Syncing Solution (Desktop)
;;;
(define-public syncclipboard-desktop
  (package
    (name "syncclipboard-desktop")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Jeric-X/SyncClipboard/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Jeric-X/SyncClipboard")
    (synopsis "Cross-Platform Cipboard Syncing Solution (Desktop)")
    (description
     "Cross-Platform Cipboard Syncing Solution (Desktop)")
    (license license:expat)))

;;;
;;; ── 96. wine-discord-ipc-bridge ───────────────────────────────────
;;; wine-discord-ipc-bridge package
;;;
(define-public wine-discord-ipc-bridge
  (package
    (name "wine-discord-ipc-bridge")
    (version "0.0.2.1.g2584e36")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/0e4ef622/wine-discord-ipc-bridge.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/0e4ef622/wine-discord-ipc-bridge")
    (synopsis "wine-discord-ipc-bridge package")
    (description
     "wine-discord-ipc-bridge package")
    (license license:expat)))

;;;
;;; ── 97. vpinball ──────────────────────────────────────────────────
;;; An open source pinball table editor and simulator - BGFX standalone version buil
;;;
(define-public vpinball
  (package
    (name "vpinball")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vpinball/vpinball.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/vpinball/vpinball")
    (synopsis "An open source pinball table editor and simulator - BGFX standalone version buil")
    (description
     "An open source pinball table editor and simulator - BGFX standalone
version built with dependencies as defined by the developers
")
    (license license:gpl3+)))

;;;
;;; ── 98. qt6-jpegxl-image-plugin ───────────────────────────────────
;;; Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images
;;;
(define-public qt6-jpegxl-image-plugin
  (package
    (name "qt6-jpegxl-image-plugin")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/novomesk/qt-jpegxl-image-plugin/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/novomesk/qt-jpegxl-image-plugin")
    (synopsis "Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images")
    (description
     "Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL
images
")
    (license license:gpl3)))

;;;
;;; ── 99. zls-master-bin ────────────────────────────────────────────
;;; A language server for Zig
;;;
(define-public zls-master-bin
  (package
    (name "zls-master-bin")
    (version "0.16.0dev.63+60cff3d6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://zigtools.org/zls/releases/download/v"
             version "/zls-master-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/zls-master-bin"))
            (chmod (string-append bin "/zls-master-bin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zigtools.org/zls")
    (synopsis "A language server for Zig")
    (description
     "A language server for Zig")
    (license license:expat)))

;;;
;;; ── 100. optimus-manager-qt ───────────────────────────────────────
;;; A Qt interface for Optimus Manager that allows to configure and switch GPUs on O
;;;
(define-public optimus-manager-qt
  (package
    (name "optimus-manager-qt")
    (version "1.6.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Shatur/optimus-manager-qt/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Shatur/optimus-manager-qt")
    (synopsis "A Qt interface for Optimus Manager that allows to configure and switch GPUs on O")
    (description
     "A Qt interface for Optimus Manager that allows to configure and switch
GPUs on Optimus laptops using the tray menu
")
    (license license:gpl3+)))

