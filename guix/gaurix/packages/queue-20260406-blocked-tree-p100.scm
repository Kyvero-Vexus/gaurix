;;; Dep-tree priority 100 resolution pass — 2026-04-06 (blocked-tree-p100)
;;; Selected from blocked-dependency-tree priority queue (blocked_dep_count ASC,
;;; reverse_dep_count DESC, total_dep_count ASC, name ASC).
;;; 19 recipes: 6 binary, 5 cmake/C, 4 Python, 2 meson, 1 copy-headers, 1 gnu.
(define-module (gaurix packages queue-20260406-blocked-tree-p100)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages libftdi)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (dotnet-targeting-pack-preview-bin
            aspnet-runtime-preview-bin
            gradle8-bin
            openhab5
            tvbrowser
            git-credential-manager-bin
            lcevcdec
            libajantv2
            sdrpp-headers-git
            fw-ectool-git
            lovr
            vapoursynth-plugin-vszip
            oversteer
            python-textualeffects
            python-mpris-server
            python-audible
            python-eccodes
            libgksu
            gtk-sharp-2))


;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — prebuilt binaries via copy-build-system
;; ═══════════════════════════════════════════════════════════════════

;; dotnet-targeting-pack-preview-bin: .NET targeting pack (preview)
(define-public dotnet-targeting-pack-preview-bin
  (package
    (name "dotnet-targeting-pack-preview-bin")
    (version "11.0.0-preview.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/Runtime/"
             version "/dotnet-targeting-pack-" version "-linux-x64.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("packs" "lib/dotnet/packs")
               ("." "lib/dotnet/" #:include-regexp (".*\\.dll$" ".*\\.json$")))))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis "targeting pack for .NET 11 preview")
    (description "The .NET targeting pack provides reference assemblies for
building applications that target .NET 11 preview.  This is a binary
redistribution of the official Microsoft package.")
    (license license:expat)))

;; aspnet-runtime-preview-bin: ASP.NET Core runtime (preview)
(define-public aspnet-runtime-preview-bin
  (package
    (name "aspnet-runtime-preview-bin")
    (version "11.0.0-preview.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
             version "/aspnetcore-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("shared" "lib/dotnet/shared")
               ("." "lib/dotnet/" #:include-regexp (".*\\.dll$" ".*\\.json$")))))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis "ASP.NET Core runtime for .NET 11 preview")
    (description "The ASP.NET Core runtime provides the libraries and server
components required to run ASP.NET Core web applications on .NET 11 preview.
This is a binary redistribution of the official Microsoft package.")
    (license license:expat)))

;; gradle8-bin: Gradle 8 binary distribution
(define-public gradle8-bin
  (package
    (name "gradle8-bin")
    (version "8.14.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://services.gradle.org/distributions/gradle-"
             version "-bin.zip"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin" "share/gradle/bin")
               ("lib" "share/gradle/lib")
               ("init.d" "share/gradle/init.d"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (gradle (string-append out "/share/gradle/bin/gradle")))
                     (mkdir-p bin)
                     (symlink gradle (string-append bin "/gradle"))))))))
    (native-inputs (list unzip))
    (inputs (list bash-minimal))
    (home-page "https://gradle.org/")
    (synopsis "powerful build system for the JVM")
    (description "Gradle is an open-source build automation tool focused on
flexibility and performance.  Gradle build scripts are written using Groovy or
Kotlin DSL.  This package provides the Gradle 8.x binary distribution.")
    (license license:asl2.0)))

;; openhab5: openHAB home automation platform
(define-public openhab5
  (package
    (name "openhab5")
    (version "5.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/openhab/openhab-distro/releases/download/"
             version "/openhab-" version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openhab/"))))
    (inputs (list `(,icedtea "jdk")))
    (home-page "https://www.openhab.org/")
    (synopsis "open-source home automation platform")
    (description "openHAB is a vendor and technology agnostic open-source
automation software for the home.  It integrates different smart home systems
and technologies into a single solution.")
    (license license:epl1.0)))

;; tvbrowser: Java-based TV guide
(define-public tvbrowser
  (package
    (name "tvbrowser")
    (version "4.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.sourceforge.net/tvbrowser/tvbrowser_"
             version "_bin.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tvbrowser/"))))
    (inputs (list `(,icedtea "jdk")))
    (home-page "https://www.tvbrowser.org/")
    (synopsis "extensible Java-based TV guide application")
    (description "TV-Browser is a free, Java-based TV guide which can be
extended with many plugins.  It downloads TV listings from various sources
and presents them in a configurable interface.")
    (license license:gpl3+)))

;; git-credential-manager-bin: Git credential helper (.NET binary)
(define-public git-credential-manager-bin
  (package
    (name "git-credential-manager-bin")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/git-ecosystem/git-credential-manager"
             "/releases/download/v" version
             "/gcm-linux_amd64." version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-credential-manager" "bin/git-credential-manager"))))
    (home-page "https://github.com/git-ecosystem/git-credential-manager")
    (synopsis "secure cross-platform Git credential storage")
    (description "Git Credential Manager (GCM) is a secure, cross-platform Git
credential helper built on .NET.  It provides authenticated access to Git
repositories hosted on GitHub, Azure DevOps, Bitbucket, and GitLab.")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; C/C++ libraries — cmake-build-system
;; ═══════════════════════════════════════════════════════════════════

;; lcevcdec: Low Complexity Enhancement Video Codec Decoder
(define-public lcevcdec
  (package
    (name "lcevcdec")
    (version "4.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/v-novaltd/LCEVCdec")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash — run `guix hash -rx <checkout>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite
    (native-inputs (list pkg-config))
    (home-page "https://github.com/v-novaltd/LCEVCdec")
    (synopsis "low complexity enhancement video codec decoder")
    (description "LCEVCdec is a decoder library implementing MPEG-5 Part 2 LCEVC
(Low Complexity Enhancement Video Coding).  LCEVC is an enhancement layer that
can improve the quality of any base codec (H.264, HEVC, AV1, etc.).")
    (license (license:non-copyleft
              "https://github.com/v-novaltd/LCEVCdec/blob/main/LICENSE"
              "BSD-3-Clause-Clear"))))

;; libajantv2: AJA NTV2 SDK for professional video I/O
(define-public libajantv2
  (package
    (name "libajantv2")
    (version "17.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aja-video/libajantv2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash — run `guix hash -rx <checkout>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite in upstream
    (native-inputs (list pkg-config))
    (inputs (list eudev))
    (home-page "https://github.com/aja-video/libajantv2")
    (synopsis "AJA NTV2 SDK for professional video I/O devices")
    (description "libajantv2 is an open-source SDK for discovering,
interrogating, and controlling NTV2-compatible professional video I/O devices
from AJA Video Systems.  It provides low-level hardware access for video
capture and playout applications.")
    (license license:expat)))

;; sdrpp-headers-git: SDR++ headers for out-of-tree modules
(define-public sdrpp-headers-git
  (package
    (name "sdrpp-headers-git")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AlexandreRouma/SDRPlusPlus")
             (commit "c89763a9")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash — run `guix hash -rx <checkout>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("core/src" "include/sdrpp/core")
               ("decoder_modules" "include/sdrpp/decoder_modules"
                #:include-regexp (".*\\.h$"))
               ("source_modules" "include/sdrpp/source_modules"
                #:include-regexp (".*\\.h$")))))
    (home-page "https://github.com/AlexandreRouma/SDRPlusPlus")
    (synopsis "SDR++ development headers for out-of-tree modules")
    (description "This package provides the C++ header files from SDR++
(SDRPlusPlus), an open-source software-defined radio application.  These
headers are needed to build out-of-tree SDR++ modules and plugins.")
    (license license:gpl3+)))

;; fw-ectool-git: ectool for Framework laptops
(define-public fw-ectool-git
  (package
    (name "fw-ectool-git")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.howett.net/DHowett/ectool")
             (commit "0ac6155")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash — run `guix hash -rx <checkout>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite
    (inputs (list libftdi libusb))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.howett.net/DHowett/ectool")
    (synopsis "embedded controller tool for Framework laptops")
    (description "ectool is a command-line utility for communicating with the
embedded controller (EC) on Framework laptops.  It allows reading sensor data,
controlling fan speeds, adjusting charge limits, and other EC operations.")
    (license license:bsd-3)))

;; lovr: Lua Virtual Reality Framework
(define-public lovr
  (package
    (name "lovr")
    (version "0.18.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bjornbytes/lovr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash — run `guix hash -rx <checkout>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DLOVR_SYSTEM_GLFW=ON"
                   "-DLOVR_SYSTEM_LUA=ON"
                   "-DLOVR_SYSTEM_OPENXR=ON")))
    (inputs (list glfw luajit openxr mesa libx11))
    (native-inputs (list pkg-config glslang))
    (home-page "https://lovr.org/")
    (synopsis "Lua framework for creating VR experiences")
    (description "LOVR is an open-source framework for rapidly building
immersive 3D and VR experiences.  It uses Lua scripting and provides a simple
API for rendering, physics, audio, and input in virtual reality.")
    (license license:expat)))

;; vapoursynth-plugin-vszip: VapourSynth zip plugin
(define-public vapoursynth-plugin-vszip
  (package
    (name "vapoursynth-plugin-vszip")
    (version "0.0.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dnjulek/vapoursynth-zip")
             (commit (string-append "r" "13"))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash — run `guix hash -rx <checkout>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list vapoursynth))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/dnjulek/vapoursynth-zip")
    (synopsis "VapourSynth plugin for zip-compressed video")
    (description "vszip is a VapourSynth plugin that provides support for
reading and processing zip-compressed video frame data within VapourSynth
filter graphs.")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; Python packages — pyproject-build-system
;; ═══════════════════════════════════════════════════════════════════

;; python-textualeffects: Visual effects for Textual TUI framework
(define-public python-textualeffects
  (package
    (name "python-textualeffects")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ggozad/textualeffects/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ; no test suite
    (propagated-inputs
     (list python-terminaltexteffects))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ggozad/textualeffects")
    (synopsis "visual effects for Textual TUI applications")
    (description "TextualEffects provides visual terminal effects for the
Textual framework.  It wraps TerminalTextEffects to add animated text effects
to Textual-based terminal user interface applications.")
    (license license:expat)))

;; python-mpris-server: MPRIS D-Bus media player server
(define-public python-mpris-server
  (package
    (name "python-mpris-server")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/alexdelorenzo/mpris_server/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ; no test suite
    (propagated-inputs
     (list python-emoji
           python-pydbus
           python-pygobject
           python-strenum
           python-unidecode))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/alexdelorenzo/mpris_server")
    (synopsis "integrate MPRIS media player support into Python applications")
    (description "mpris_server is a Python library for implementing the MPRIS
D-Bus interface for media players.  It allows Python applications to expose
media playback controls and metadata through the standard MPRIS protocol.")
    (license license:agpl3+)))

;; python-audible: Python interface for Audible API
(define-public python-audible
  (package
    (name "python-audible")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mkb79/audible/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-beautifulsoup4
           python-httpx
           python-pbkdf2
           python-pillow
           python-pyaes
           python-rsa))
    ;; Note: python-questionary is not in Guix; optional dep omitted
    (native-inputs (list python-poetry-core python-wheel))
    (home-page "https://github.com/mkb79/audible")
    (synopsis "Python interface for the Audible API")
    (description "Audible is an async/sync Python library for interacting with
the internal Audible API.  It supports authentication, library management, and
audiobook metadata retrieval.")
    (license license:agpl3+)))

;; python-eccodes: Python bindings for ecCodes GRIB/BUFR library
(define-public python-eccodes
  (package
    (name "python-eccodes")
    (version "2.46.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ecmwf/eccodes-python/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'build 'set-eccodes-path
                 (lambda* (#:key inputs #:allow-other-keys)
                   (setenv "ECCODES_DIR"
                           (search-input-file inputs "lib")))))))
    (propagated-inputs
     (list eccodes
           python-attrs
           python-cffi
           python-numpy))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ecmwf/eccodes-python")
    (synopsis "Python bindings for the ecCodes GRIB/BUFR library")
    (description "eccodes-python provides Python bindings for the ECMWF
ecCodes library, which handles GRIB and BUFR weather data formats.  It enables
reading, writing, and manipulating meteorological data in Python.")
    (license license:asl2.0)))


;; ═══════════════════════════════════════════════════════════════════
;; Meson / GNU builds
;; ═══════════════════════════════════════════════════════════════════

;; oversteer: GUI for configuring Logitech racing wheels
(define-public oversteer
  (package
    (name "oversteer")
    (version "0.8.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/berarma/oversteer")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash — run `guix hash -rx <checkout>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t
           #:tests? #f))
    (inputs
     (list python
           python-pygobject
           python-pycairo
           python-evdev
           python-matplotlib
           python-pyudev
           python-pyxdg
           python-scipy
           appstream-glib
           gtk+
           gettext-minimal))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/berarma/oversteer")
    (synopsis "graphical configuration tool for Logitech racing wheels")
    (description "Oversteer is a GTK application for configuring Logitech
racing wheels on Linux.  It provides a graphical interface for adjusting force
feedback strength, rotation range, pedal calibration, and LED settings.")
    (license license:gpl3+)))

;; libgksu: gksu authorization library
(define-public libgksu
  (package
    (name "libgksu")
    (version "2.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://people.debian.org/~kov/gksu/libgksu-"
             version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list gtk+ glib))
    (native-inputs (list pkg-config))
    (home-page "https://www.nongnu.org/gksu/")
    (synopsis "library for granting administrative privileges")
    (description "libgksu is a library that provides a GTK-based interface for
granting administrative (root) privileges to graphical applications.  It
supports both su and sudo backends for privilege escalation.")
    (license license:lgpl2.0+)))

;; gtk-sharp-2: GTK2 bindings for C# / Mono
(define-public gtk-sharp-2
  (package
    (name "gtk-sharp-2")
    (version "2.12.45")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.mono-project.com/sources/gtk-sharp212/"
             "gtk-sharp-" version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download <url>` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list mono gtk+-2 glib))
    (native-inputs (list pkg-config))
    (home-page "https://www.mono-project.com/docs/gui/gtksharp/")
    (synopsis "GTK2 bindings for the C# programming language")
    (description "Gtk# is a set of .NET bindings for the GTK+ 2.x toolkit
and other libraries commonly used on Linux.  It enables C# and other
CLR-compatible languages to create GTK+ graphical applications.")
    (license license:lgpl2.1+)))
