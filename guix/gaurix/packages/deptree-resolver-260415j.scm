;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415j
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415j)
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
  #:use-module (gnu packages)
  #:export (            lib32-gst-plugins-base-libs
            aspnet-runtime-8-0-bin
            aspnet-targeting-pack-8-0-bin
            dotnet-sdk-8-0-bin
            android-armv7a-eabi-qt6-virtualkeyboard
            audirvana-studio
            lenspect
            lib32-srt
            lib32-vmaf
            lib32-x264
            libipuz
            limabean
            limabean-harvest
            linux-steam-integration
            lsplug
            ltspice
            matlab-gcc
            matlab-gcc-fortran
            mealie
            metar
            minecraft-server
            motivewave
            muon-ssh
            ncgopher-git
            needrestart
            neovim-qt-git
            nicol
            odin-git
            opentabletdriver
            opentabletdriver-git
            osgxr
            osmium
            otranscribe
            oxicord-git
            pam-python-git
            pane-fm-git
            peazip
            phantomjs
            phonon-qt6-mpv-git
            picoscope7
            pixelterm-c-bin
            plasma6-applets-fokus
            plasma6-wallpapers-smart-video-wallpaper-reborn-git
            pnana
            procexp
            projectm-presets-classic-git
            projectm-presets-cream-of-the-crop
            proto
            proton-pass
            proton-vpn-qt-app
            pulsecontrol-git
            purple-gowhatsapp-git
            pwmenu-git
            python-exscript
            python-opentelemetry-exporter-zipkin
            python-wassima-git
            quirc-git
            qwhitesurgtkdecorations-qt5
            qwhitesurgtkdecorations-qt6
            rancher-desktop
            rustycat-android
            ryujinx-git
            s-console
            scenarist
            scuisei-git
            sdrpp-tetra-demodulator-git
            seafile-client
            securecopy
            selinux-python
            serproid
            spacecal-for-monado
            sparrow-wallet
            speedynote-bin
            stacher7
            steamfetch-git
            supermario64-sm64ex-git
            superseedr
            swaystatus-git
            sysd-manager-git
            tageditor-cli
            telepresence2
            terabox-bin
            termitype
            thorium-reader-bin
            tidal-hifi-git
            tlclient))

(define-public lib32-gst-plugins-base-libs
  (package
    (name "lib32-gst-plugins-base-libs")
    (version "1.28.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gst-plugins-base-libs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multimedia graph framework (32-bit) - base")
    (description "Multimedia graph framework (32-bit) - base.")
    (home-page "https://gstreamer.freedesktop.org/")
    (license license:lgpl2.1+)))

(define-public aspnet-runtime-8-0-bin
  (package
    (name "aspnet-runtime-8-0-bin")
    (version "8.0.25.sdk419")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aspnet-runtime-8.0-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the ASP")
    (description "The ASP.NET Core runtime (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public aspnet-targeting-pack-8-0-bin
  (package
    (name "aspnet-targeting-pack-8-0-bin")
    (version "8.0.25.sdk419")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aspnet-targeting-pack-8.0-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the ASP")
    (description "The ASP.NET Core targeting pack (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public dotnet-sdk-8-0-bin
  (package
    (name "dotnet-sdk-8-0-bin")
    (version "8.0.25.sdk419")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotnet-sdk-8.0-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the")
    (description "The .NET Core SDK (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public android-armv7a-eabi-qt6-virtualkeyboard
  (package
    (name "android-armv7a-eabi-qt6-virtualkeyboard")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-armv7a-eabi-qt6-virtualkeyboard.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual keyboard framework (android)")
    (description "Virtual keyboard framework (android).")
    (home-page "https://www.qt.io")
    (license license:gpl3)))

(define-public audirvana-studio
  (package
    (name "audirvana-studio")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/audirvana-studio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "audirvana Studio audio player")
    (description "Audirvana Studio audio player.")
    (home-page "https://audirvana.com/")
    (license license:non-copyleft)))

(define-public lenspect
  (package
    (name "lenspect")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vmkspv/lenspect")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight security threat scanner intended to make malware detection mo")
    (description "Lightweight security threat scanner intended to make malware detection more accessible and efficient.")
    (home-page "https://github.com/vmkspv/lenspect")
    (license license:gpl3+)))

(define-public lib32-srt
  (package
    (name "lib32-srt")
    (version "1.5.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-srt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "secure Reliable Transport library (32-bit)")
    (description "Secure Reliable Transport library (32-bit).")
    (home-page "https://www.srtalliance.org")
    (license license:mpl2.0)))

(define-public lib32-vmaf
  (package
    (name "lib32-vmaf")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Netflix/vmaf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perceptual video quality assessment algorithm based on multi-method fusio")
    (description "Perceptual video quality assessment algorithm based on multi-method fusion (32 bit).")
    (home-page "https://github.com/Netflix/vmaf/")
    (license license:bsd-3)))

(define-public lib32-x264
  (package
    (name "lib32-x264")
    (version "0.165.r3222.b35605a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-x264.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source H264/AVC video encoder (32 bit)")
    (description "Open Source H264/AVC video encoder (32 bit).")
    (home-page "https://www.videolan.org/developers/x264.html")
    (license license:gpl2)))

(define-public libipuz
  (package
    (name "libipuz")
    (version "0.5.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/jrb/libipuz")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for parsing")
    (description "Library for parsing .ipuz puzzle files.")
    (home-page "https://gitlab.gnome.org/jrb/libipuz")
    (license license:lgpl3+)))

(define-public limabean
  (package
    (name "limabean")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tesujimath/limabean")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a new implementation of Beancount using Rust and Clojure and the Lima parser")
    (description "A new implementation of Beancount using Rust and Clojure and the Lima parser.")
    (home-page "https://github.com/tesujimath/limabean")
    (license license:asl2.0)))

(define-public limabean-harvest
  (package
    (name "limabean-harvest")
    (version "0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tesujimath/limabean-harvest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "beancount importer with transaction pairing across accounts")
    (description "Beancount importer with transaction pairing across accounts.")
    (home-page "https://github.com/tesujimath/limabean-harvest")
    (license license:asl2.0)))

(define-public linux-steam-integration
  (package
    (name "linux-steam-integration")
    (version "0.7.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/getsolus/linux-steam-integration")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "helper for enabling better Steam integration on Linux")
    (description "Helper for enabling better Steam integration on Linux.")
    (home-page "https://github.com/getsolus/linux-steam-integration")
    (license license:lgpl2.1+)))

(define-public lsplug
  (package
    (name "lsplug")
    (version "6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~martijnbraam/lsplug")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nicer version of lsusb")
    (description "Nicer version of lsusb.")
    (home-page "https://git.sr.ht/~martijnbraam/lsplug")
    (license license:expat)))

(define-public ltspice
  (package
    (name "ltspice")
    (version "26.0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ltspice.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sPICE simulator, schematic capture and waveform viewer")
    (description "SPICE simulator, schematic capture and waveform viewer.")
    (home-page "https://www.analog.com/en/resources/design-tools-and-calculators/ltspice-simulator.html")
    (license license:non-copyleft)))

(define-public matlab-gcc
  (package
    (name "matlab-gcc")
    (version "R2025b+25.2.0.3177638")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/matlab-gcc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-level language for numerical computation and visualization (GCC)")
    (description "A high-level language for numerical computation and visualization (GCC).")
    (home-page "https://www.mathworks.com/products/matlab.html")
    (license license:non-copyleft)))

(define-public matlab-gcc-fortran
  (package
    (name "matlab-gcc-fortran")
    (version "R2025b+25.2.0.3177638")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/matlab-gcc-fortran.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-level language for numerical computation and visualization (GCC Fo")
    (description "A high-level language for numerical computation and visualization (GCC Fortran).")
    (home-page "https://www.mathworks.com/products/matlab.html")
    (license license:non-copyleft)))

(define-public mealie
  (package
    (name "mealie")
    (version "3.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mealie-recipes/mealie")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a self hosted recipe manager")
    (description "A self hosted recipe manager.")
    (home-page "https://github.com/mealie-recipes/mealie")
    (license license:agpl3)))

(define-public metar
  (package
    (name "metar")
    (version "1.3.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/maandree/metar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "trivial, yet fully fledged, weather report")
    (description "Trivial, yet fully fledged, weather report.")
    (home-page "https://codeberg.org/maandree/metar")
    (license license:non-copyleft)))

(define-public minecraft-server
  (package
    (name "minecraft-server")
    (version "26.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/minecraft-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minecraft server unit files, script, and jar")
    (description "Minecraft server unit files, script, and jar.")
    (home-page "https://minecraft.net/")
    (license license:non-copyleft)))

(define-public motivewave
  (package
    (name "motivewave")
    (version "6.9.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/motivewave.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced trading and charting application")
    (description "Advanced trading and charting application.")
    (home-page "https://www.motivewave.com")
    (license license:non-copyleft)))

(define-public muon-ssh
  (package
    (name "muon-ssh")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/devlinx9/muon-ssh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical SFTP client and terminal emulator (SSH) with helpful utilities")
    (description "Graphical SFTP client and terminal emulator (SSH) with helpful utilities.")
    (home-page "https://github.com/devlinx9/muon-ssh")
    (license license:gpl3)))

(define-public ncgopher-git
  (package
    (name "ncgopher-git")
    (version "v0.8.0.r10.g671b360")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jansc/ncgopher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a gemini and gopher console client")
    (description "A gemini and gopher console client.")
    (home-page "https://github.com/jansc/ncgopher")
    (license license:bsd-3)))

(define-public needrestart
  (package
    (name "needrestart")
    (version "3.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/liske/needrestart")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "restart daemons after library updates")
    (description "Restart daemons after library updates.")
    (home-page "https://github.com/liske/needrestart")
    (license license:gpl2+)))

(define-public neovim-qt-git
  (package
    (name "neovim-qt-git")
    (version "0.2.16.r207.gb4ca557")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/equalsraf/neovim-qt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI for Neovim (git version)")
    (description "GUI for Neovim (git version).")
    (home-page "https://github.com/equalsraf/neovim-qt")
    (license license:isc)))

(define-public nicol
  (package
    (name "nicol")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arnav-kr/nicol")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimal web browser based on Qt")
    (description "A minimal web browser based on Qt.")
    (home-page "https://github.com/arnav-kr/nicol")
    (license license:agpl3)))

(define-public odin-git
  (package
    (name "odin-git")
    (version "r16294.94cc5d9e6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/odin-lang/odin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast, concise, readable, pragmatic and open sourced programming language")
    (description "A fast, concise, readable, pragmatic and open sourced programming language.")
    (home-page "https://github.com/odin-lang/odin")
    (license license:bsd-3)))

(define-public opentabletdriver
  (package
    (name "opentabletdriver")
    (version "0.6.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opentabletdriver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform open source tablet driver")
    (description "A cross-platform open source tablet driver.")
    (home-page "https://opentabletdriver.net")
    (license license:lgpl3+)))

(define-public opentabletdriver-git
  (package
    (name "opentabletdriver-git")
    (version "0.6.6.1.r125.g14fad7a5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opentabletdriver-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform open source tablet driver")
    (description "A cross-platform open source tablet driver.")
    (home-page "https://opentabletdriver.net")
    (license license:lgpl3+)))

(define-public osgxr
  (package
    (name "osgxr")
    (version "0.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amalon/osgXR")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to integrate OpenXR into OpenSceneGraph applications")
    (description "Library to integrate OpenXR into OpenSceneGraph applications.")
    (home-page "https://github.com/amalon/osgXR")
    (license license:lgpl3+)))

(define-public osmium
  (package
    (name "osmium")
    (version "0.0.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osmium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a globally distributed community messaging and voice/video platform")
    (description "A globally distributed community messaging and voice/video platform.")
    (home-page "https://osmium.chat/")
    (license license:non-copyleft)))

(define-public otranscribe
  (package
    (name "otranscribe")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ineslino/otranscribe")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "transcribe any audio or video via OpenAI STT")
    (description "Transcribe any audio or video via OpenAI STT. Supports diarisation and cleaned rendering.")
    (home-page "https://github.com/ineslino/otranscribe")
    (license license:expat)))

(define-public oxicord-git
  (package
    (name "oxicord-git")
    (version "0.1.9.r8.gb65b93b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmobile/oxicord")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vim-native Discord TUI for terminal enthusiasts")
    (description "Vim-native Discord TUI for terminal enthusiasts.")
    (home-page "https://github.com/linuxmobile/oxicord")
    (license license:gpl3)))

(define-public pam-python-git
  (package
    (name "pam-python-git")
    (version "r31.9641aa5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/castlabs/pam-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python for PAM (py3 fork)")
    (description "Python for PAM (py3 fork).")
    (home-page "https://github.com/castlabs/pam-python")
    (license license:non-copyleft)))

(define-public pane-fm-git
  (package
    (name "pane-fm-git")
    (version "0.1.8.r0.g781f00b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jakeb-grant/pane-fm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a themeable file manager built with Tauri and Svelte")
    (description "A themeable file manager built with Tauri and Svelte.")
    (home-page "https://github.com/jakeb-grant/pane-fm")
    (license license:expat)))

(define-public peazip
  (package
    (name "peazip")
    (version "11.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/peazip/PeaZip")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform file and archive manager (Qt6)")
    (description "Cross-platform file and archive manager (Qt6).")
    (home-page "https://github.com/peazip/PeaZip")
    (license license:lgpl3+)))

(define-public phantomjs
  (package
    (name "phantomjs")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/phantomjs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headless WebKit with JavaScript API")
    (description "Headless WebKit with JavaScript API.")
    (home-page "https://www.phantomjs.org/")
    (license license:bsd-3)))

(define-public phonon-qt6-mpv-git
  (package
    (name "phonon-qt6-mpv-git")
    (version "0.1.0.r0.g069aca4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenProgger/phonon-mpv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "phonon MPV backend for Qt6")
    (description "Phonon MPV backend for Qt6.")
    (home-page "https://github.com/OpenProgger/phonon-mpv")
    (license license:lgpl2.1)))

(define-public picoscope7
  (package
    (name "picoscope7")
    (version "7.2.10.8486")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/picoscope7.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "picoScope 7 Test and Measurment Stable")
    (description "PicoScope 7 Test and Measurment Stable.")
    (home-page "https://www.picotech.com/downloads/linux")
    (license license:non-copyleft)))

(define-public pixelterm-c-bin
  (package
    (name "pixelterm-c-bin")
    (version "1.7.23")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zouyonghe/PixelTerm-C")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-performance terminal image/video/book browser written in C, based ")
    (description "A high-performance terminal image/video/book browser written in C, based on the Chafa library.")
    (home-page "https://github.com/zouyonghe/PixelTerm-C")
    (license license:lgpl3+)))

(define-public plasma6-applets-fokus
  (package
    (name "plasma6-applets-fokus")
    (version "2.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/divinae/focus-plasmoid")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple pomodoro KDE plasmoid")
    (description "A simple pomodoro KDE plasmoid.")
    (home-page "https://gitlab.com/divinae/focus-plasmoid")
    (license license:gpl3)))

(define-public plasma6-wallpapers-smart-video-wallpaper-reborn-git
  (package
    (name "plasma6-wallpapers-smart-video-wallpaper-reborn-git")
    (version "2.9.0.r24.g1fd9153")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/luisbocanegra/plasma-smart-video-wallpaper-reborn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "smart KDE Plasma 6 Wallpaper plugin to play videos on your Desktop/Lock S")
    (description "Smart KDE Plasma 6 Wallpaper plugin to play videos on your Desktop/Lock Screen.")
    (home-page "https://github.com/luisbocanegra/plasma-smart-video-wallpaper-reborn")
    (license license:gpl3)))

(define-public pnana
  (package
    (name "pnana")
    (version "0.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Cyxuan0311/pnana")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern terminal text editor built with FTXUI, inspired by Nano, Micro, ")
    (description "A modern terminal text editor built with FTXUI, inspired by Nano, Micro, and Sublime Text.")
    (home-page "https://github.com/Cyxuan0311/pnana")
    (license license:expat)))

(define-public procexp
  (package
    (name "procexp")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wolfc01/procexp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical process explorer for Linux")
    (description "Graphical process explorer for Linux.")
    (home-page "https://github.com/wolfc01/procexp")
    (license license:gpl3)))

(define-public projectm-presets-classic-git
  (package
    (name "projectm-presets-classic-git")
    (version "2.g14a6244.2.gff8edf2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/projectM-visualizer/presets-projectm-classic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "classic preset pack for projectM (git version)")
    (description "Classic preset pack for projectM (git version).")
    (home-page "https://github.com/projectM-visualizer/presets-projectm-classic")
    (license license:lgpl3+)))

(define-public projectm-presets-cream-of-the-crop
  (package
    (name "projectm-presets-cream-of-the-crop")
    (version "2.4e0bf9f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/projectM-visualizer/presets-projectm-classic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "preset pack for projectM - jason fletcher's curated pack (git version)")
    (description "Preset pack for projectM - jason fletcher's curated pack (git version).")
    (home-page "https://github.com/projectM-visualizer/presets-projectm-classic")
    (license license:lgpl3+)))

(define-public proto
  (package
    (name "proto")
    (version "0.56.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/moonrepo/proto")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pluggable multi-language version manager")
    (description "Pluggable multi-language version manager.")
    (home-page "https://github.com/moonrepo/proto")
    (license license:expat)))

(define-public proton-pass
  (package
    (name "proton-pass")
    (version "1.36.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/proton-pass.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source and secure identity manager")
    (description "Open-source and secure identity manager.")
    (home-page "https://proton.me/pass")
    (license license:gpl3+)))

(define-public proton-vpn-qt-app
  (package
    (name "proton-vpn-qt-app")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wheat32/proton-vpn-qt-app")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Qt GUI frontend for the ProtonVPN CLI")
    (description "A Qt GUI frontend for the ProtonVPN CLI.")
    (home-page "https://github.com/wheat32/proton-vpn-qt-app")
    (license license:gpl3)))

(define-public pulsecontrol-git
  (package
    (name "pulsecontrol-git")
    (version "0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/oxayotl/pavucontrol/-/tree/fork")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fork of pavucontrol aiming at better UX")
    (description "A fork of pavucontrol aiming at better UX.")
    (home-page "https://gitlab.freedesktop.org/oxayotl/pavucontrol/-/tree/fork")
    (license license:gpl3+)))

(define-public purple-gowhatsapp-git
  (package
    (name "purple-gowhatsapp-git")
    (version "1.21.0_396_20260216124546")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hoehermann/purple-gowhatsapp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a libpurple/Pidgin plugin for WhatsApp, powered by whatsmeow")
    (description "A libpurple/Pidgin plugin for WhatsApp, powered by whatsmeow.")
    (home-page "https://github.com/hoehermann/purple-gowhatsapp")
    (license license:gpl3)))

(define-public pwmenu-git
  (package
    (name "pwmenu-git")
    (version "0.3.0.r0.g3111309")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/e-tho/pwmenu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "launcher-driven audio manager for Linux")
    (description "Launcher-driven audio manager for Linux.")
    (home-page "https://github.com/e-tho/pwmenu")
    (license license:gpl3+)))

(define-public python-exscript
  (package
    (name "python-exscript")
    (version "2.6.30")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/knipknap/exscript")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Python module making Telnet and SSH easy")
    (description "A Python module making Telnet and SSH easy.")
    (home-page "https://github.com/knipknap/exscript")
    (license license:expat)))

(define-public python-opentelemetry-exporter-zipkin
  (package
    (name "python-opentelemetry-exporter-zipkin")
    (version "1.40.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open-telemetry/opentelemetry-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zipkin Span Exporters for OpenTelemetry")
    (description "Zipkin Span Exporters for OpenTelemetry.")
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

(define-public python-wassima-git
  (package
    (name "python-wassima-git")
    (version "2.0.0.r0.ge45e965")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jawah/wassima")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "say goodbye to certifi")
    (description "Say goodbye to certifi. Embrace your system root CAs — retrieve them with ease and comfort (latest commit).")
    (home-page "https://github.com/jawah/wassima")
    (license license:expat)))

(define-public quirc-git
  (package
    (name "quirc-git")
    (version "1.2.r3.gfd13bfb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dlbeer/quirc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qR decoder library (git version)")
    (description "QR decoder library (git version).")
    (home-page "https://github.com/dlbeer/quirc/")
    (license license:isc)))

(define-public qwhitesurgtkdecorations-qt5
  (package
    (name "qwhitesurgtkdecorations-qt5")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Qt5 decoration plugin implementing WhiteSur-gtk-like client-side decorations")
    (description "Qt5 decoration plugin implementing WhiteSur-gtk-like client-side decorations.")
    (home-page "https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations")
    (license license:lgpl3+)))

(define-public qwhitesurgtkdecorations-qt6
  (package
    (name "qwhitesurgtkdecorations-qt6")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Qt6 decoration plugin implementing WhiteSur-gtk-like client-side decorations")
    (description "Qt6 decoration plugin implementing WhiteSur-gtk-like client-side decorations.")
    (home-page "https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations")
    (license license:lgpl3+)))

(define-public rancher-desktop
  (package
    (name "rancher-desktop")
    (version "1.22.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rancher-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rancher Desktop is an open-source project to bring Kubernetes and contain")
    (description "Rancher Desktop is an open-source project to bring Kubernetes and container management to the desktop.")
    (home-page "https://rancherdesktop.io/")
    (license license:asl2.0)))

(define-public rustycat-android
  (package
    (name "rustycat-android")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cesarferreira/rustycat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a colorful Android logcat viewer with package filtering")
    (description "A colorful Android logcat viewer with package filtering.")
    (home-page "https://github.com/cesarferreira/rustycat")
    (license license:expat)))

(define-public ryujinx-git
  (package
    (name "ryujinx-git")
    (version "r4643.3a593b608")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ryujinx-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental Nintendo Switch Emulator written in C#")
    (description "Experimental Nintendo Switch Emulator written in C#.")
    (home-page "https://ryujinx.app")
    (license license:expat)))

(define-public s-console
  (package
    (name "s-console")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/s-console.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a super fast GTK3/VTE terminal emulator for Arch Linux")
    (description "A super fast GTK3/VTE terminal emulator for Arch Linux.")
    (home-page "https://github.com")
    (license license:gpl3+)))

(define-public scenarist
  (package
    (name "scenarist")
    (version "0.7.2.rc15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scenarist.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screenwriting software to create screenplays which oriented at internatio")
    (description "Screenwriting software to create screenplays which oriented at international standards in the field of film production.")
    (home-page "https://kitscenarist.ru/en/")
    (license license:gpl3)))

(define-public scuisei-git
  (package
    (name "scuisei-git")
    (version "0.1.2.r1.g11d9b46")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yuv420p10le/scuisei-rs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "blazing fast successor for SCXvid-standalone")
    (description "Blazing fast successor for SCXvid-standalone.")
    (home-page "https://github.com/yuv420p10le/scuisei-rs")
    (license license:expat)))

(define-public sdrpp-tetra-demodulator-git
  (package
    (name "sdrpp-tetra-demodulator-git")
    (version "r18.9e3a757")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cropinghigh/sdrpp-tetra-demodulator")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sDR++ module for demodulating TETRA")
    (description "SDR++ module for demodulating TETRA.")
    (home-page "https://github.com/cropinghigh/sdrpp-tetra-demodulator")
    (license license:gpl3+)))

(define-public seafile-client
  (package
    (name "seafile-client")
    (version "9.0.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haiwen/seafile-client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI client for synchronizing your local files with seafile server")
    (description "GUI client for synchronizing your local files with seafile server.")
    (home-page "https://github.com/haiwen/seafile-client")
    (license license:asl2.0)))

(define-public securecopy
  (package
    (name "securecopy")
    (version "9.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hansij66/securecopy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GNU coreutils cp/mv with CRC64 xattr checksum verification, plus crcsum")
    (description "GNU coreutils cp/mv with CRC64 xattr checksum verification, plus crcsum.")
    (home-page "https://github.com/hansij66/securecopy")
    (license license:gpl3+)))

(define-public selinux-python
  (package
    (name "selinux-python")
    (version "3.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SELinuxProject/selinux/wiki")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sELinux python tools and libraries")
    (description "SELinux python tools and libraries.")
    (home-page "https://github.com/SELinuxProject/selinux/wiki")
    (license license:gpl2)))

(define-public serproid
  (package
    (name "serproid")
    (version "2.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/serproid.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pKCS#11 driver for cloud-based digital certificates issued by Serpro")
    (description "PKCS#11 driver for cloud-based digital certificates issued by Serpro.")
    (home-page "https://serproid.serpro.gov.br")
    (license license:non-copyleft)))

(define-public spacecal-for-monado
  (package
    (name "spacecal-for-monado")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/99oblivius/spacecal-for-monado")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vR Tracking Space Calibrator for Monado/WiVRn")
    (description "VR Tracking Space Calibrator for Monado/WiVRn.")
    (home-page "https://github.com/99oblivius/spacecal-for-monado")
    (license license:gpl3)))

(define-public sparrow-wallet
  (package
    (name "sparrow-wallet")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sparrow-wallet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop Bitcoin Wallet focused on security and privacy")
    (description "Desktop Bitcoin Wallet focused on security and privacy. Free and open source.")
    (home-page "https://sparrowwallet.com/")
    (license license:asl2.0)))

(define-public speedynote-bin
  (package
    (name "speedynote-bin")
    (version "1.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alpha-liu-01/SpeedyNote")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple note app with good performance and PDF import support")
    (description "A simple note app with good performance and PDF import support.")
    (home-page "https://github.com/alpha-liu-01/SpeedyNote")
    (license license:expat)))

(define-public stacher7
  (package
    (name "stacher7")
    (version "7.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stacher7.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stacher - modern video downloader (proprietary Electron app)")
    (description "Stacher - modern video downloader (proprietary Electron app).")
    (home-page "https://stacher.io")
    (license license:non-copyleft)))

(define-public steamfetch-git
  (package
    (name "steamfetch-git")
    (version "0.5.2.3.g3d7b294")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/unhappychoice/steamfetch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "neofetch for Steam - Display your Steam stats in terminal with style")
    (description "neofetch for Steam - Display your Steam stats in terminal with style. (git version).")
    (home-page "https://github.com/unhappychoice/steamfetch")
    (license license:isc)))

(define-public supermario64-sm64ex-git
  (package
    (name "supermario64-sm64ex-git")
    (version "20bb444")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sm64pc/sm64ex")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pC port of Super Mario 64")
    (description "PC port of Super Mario 64.")
    (home-page "https://github.com/sm64pc/sm64ex")
    (license license:gpl3+)))

(define-public superseedr
  (package
    (name "superseedr")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Jagalite/superseedr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a BitTorrent Client in your Terminal")
    (description "A BitTorrent Client in your Terminal.")
    (home-page "https://github.com/Jagalite/superseedr")
    (license license:gpl3+)))

(define-public swaystatus-git
  (package
    (name "swaystatus-git")
    (version "0.14.1.r0.087af6d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jmcantrell/swaystatus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generate a status line for swaybar")
    (description "Generate a status line for swaybar.")
    (home-page "https://github.com/jmcantrell/swaystatus")
    (license license:expat)))

(define-public sysd-manager-git
  (package
    (name "sysd-manager-git")
    (version "2.16.0.r0.gd1f358f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/plrigaux/sysd-manager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a systemd GUI to manage service, timer, socket and other units")
    (description "A systemd GUI to manage service, timer, socket and other units.")
    (home-page "https://github.com/plrigaux/sysd-manager")
    (license license:gpl3+)))

(define-public tageditor-cli
  (package
    (name "tageditor-cli")
    (version "3.9.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/tageditor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tag editor with command-line interface supporting MP4/M4A/AAC (iTunes),")
    (description "A tag editor with command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska (GUI disabled).")
    (home-page "https://github.com/Martchus/tageditor")
    (license license:gpl2+)))

(define-public telepresence2
  (package
    (name "telepresence2")
    (version "2.27.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/telepresenceio/telepresence")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "local development against a remote Kubernetes or OpenShift cluster")
    (description "Local development against a remote Kubernetes or OpenShift cluster.")
    (home-page "https://github.com/telepresenceio/telepresence")
    (license license:asl2.0)))

(define-public terabox-bin
  (package
    (name "terabox-bin")
    (version "1.44.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terabox-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "baidu netdisc international version")
    (description "Baidu netdisc international version.")
    (home-page "https://www.terabox.com/chinese/")
    (license license:non-copyleft)))

(define-public termitype
  (package
    (name "termitype")
    (version "0.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emanuel2718/termitype")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tUI typing game, inspired by a certain typing test you might know")
    (description "TUI typing game, inspired by a certain typing test you might know.")
    (home-page "https://github.com/emanuel2718/termitype")
    (license license:gpl3)))

(define-public thorium-reader-bin
  (package
    (name "thorium-reader-bin")
    (version "3.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/edrlab/thorium-reader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross platform desktop reading app, based on the Readium Desktop toolkit")
    (description "A cross platform desktop reading app, based on the Readium Desktop toolkit.")
    (home-page "https://github.com/edrlab/thorium-reader")
    (license license:bsd-3)))

(define-public tidal-hifi-git
  (package
    (name "tidal-hifi-git")
    (version "6.3.0.Mavy.r0.g7e53406")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mastermindzh/tidal-hifi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the web version of tidal")
    (description "The web version of tidal.com running in electron with hifi support thanks to widevine. If the install fails use nvm to temporarily downgrade npm.")
    (home-page "https://github.com/Mastermindzh/tidal-hifi")
    (license license:non-copyleft)))

(define-public tlclient
  (package
    (name "tlclient")
    (version "4.20.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tlclient.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a remote desktop application")
    (description "A remote desktop application.")
    (home-page "https://www.cendio.com/thinlinc/download")
    (license license:non-copyleft)))

