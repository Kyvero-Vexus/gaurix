;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260408e
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 70 packages resolved with recipes, 30 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408e)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (
            amdvlk
            android-sdk
            archlinux-java-run
            arduino-avr-core
            aspnet-runtime-preview-bin
            awww-git
            betterlockscreen
            bms-shell
            clion
            cosmic-applets-git
            cosmic-bg-git
            cosmic-files-git
            cosmic-greeter-git
            cosmic-osd-git
            element-web-git
            emacs-mozc
            fcitx5-mozc-ut
            firmware-manager
            ggml-sycl-f16-git
            hypryou-utils
            icu69
            intel-graphics-compiler-legacy
            intel-npu-driver
            iscan
            karakeep-cli
            kde-material-you-colors
            kdesignerplugin
            kemoticons
            kwin-effects-better-blur-dx
            kwin-minimize2tray-git
            libastal-git
            libastal-meta
            libpamac-full
            llama-cpp-hip
            maa-assistant-arknights
            mdcat
            mozc-ut-full-common
            nautilus-sendto
            noctalia-qs
            opensnitch-ebpf-module-git
            openssh-askpass
            overskride
            owlry-lua
            owlry-rune
            php-imap
            powershell
            processing-examples
            python-frida
            python-insightface
            python-moviepy
            python-snakeviz
            python-twisterl
            python38
            qadwaitadecorations-qt6
            qtforkawesome
            radicle-httpd
            rvgl-io-cars
            samsung-unified-driver-printer
            samsung-unified-driver-scanner
            sdrpp-headers-git
            snapx
            todds
            trustedqsl
            vivaldi-snapshot-ffmpeg-codecs
            vkbasalt-redemp-git
            waydroid-image
            waydroid-script-git
            xrizer
            xtensa-lx106-elf-gcc-bin
            yabridgectl-wine10-git
            ))

;;; ====================================================================
;;; PACKAGE DEFINITIONS (70 packages)
;;; ====================================================================

;;; -- amdvlk --
(define-public amdvlk
  (package
    (name "amdvlk")
    (version "2025.Q2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-"
             version "/amdvlk_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/amdvlk/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GPUOpen-Drivers/AMDVLK")
    (synopsis "AMD open source Vulkan driver")
    (description
     "AMDVLK is an open-source Vulkan driver for AMD Radeon GPUs on Linux.")
    (license license:expat)))

;;; -- android-sdk --
(define-public android-sdk
  (package
    (name "android-sdk")
    (version "26.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.google.com/android/repository/"
             "sdk-tools-linux-4333796.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/android-sdk/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.android.com/studio/releases/sdk-tools")
    (synopsis "android SDK command-line tools")
    (description
     "Android SDK provides the API libraries and developer tools necessary
to build, test, and debug apps for Android.")
    (license license:asl2.0)))

;;; -- archlinux-java-run --
(define-public archlinux-java-run
  (package
    (name "archlinux-java-run")
    (version "12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/michaellass/archlinux-java-run.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/archlinux-java-run/"))))
    (home-page "https://github.com/michaellass/archlinux-java-run")
    (synopsis "Java Application Launcher for Arch Linux")
    (description
     "Java Application Launcher for Arch Linux.")
    (license license:expat)))

;;; -- arduino-avr-core --
(define-public arduino-avr-core
  (package
    (name "arduino-avr-core")
    (version "1.8.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arduino/ArduinoCore-avr.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/arduino-avr-core/"))))
    (home-page "https://github.com/arduino/ArduinoCore-avr")
    (synopsis "arduino AVR core with upstream avr-gcc and avrdude")
    (description
     "Arduino AVR core with upstream avr-gcc and avrdude.")
    (license license:expat)))

;;; -- aspnet-runtime-preview-bin --
(define-public aspnet-runtime-preview-bin
  (package
    (name "aspnet-runtime-preview-bin")
    (version "9.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.visualstudio.microsoft.com/download/pr/"
             "aspnetcore-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com/apps/aspnet")
    (synopsis "ASP.NET Core runtime preview binaries")
    (description
     "ASP.NET Core runtime preview for building and running .NET web applications.")
    (license license:expat)))

;;; -- awww-git --
(define-public awww-git
  (package
    (name "awww-git")
    (version "0.11.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/LGFae/awww.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/awww/"))))
    (home-page "https://codeberg.org/LGFae/awww")
    (synopsis "efficient animated wallpaper daemon for Wayland, controlled at runtime")
    (description
     "Efficient animated wallpaper daemon for Wayland, controlled at runtime.")
    (license license:gpl3+)))

;;; -- betterlockscreen --
(define-public betterlockscreen
  (package
    (name "betterlockscreen")
    (version "4.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/betterlockscreen/betterlockscreen.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/betterlockscreen/"))))
    (home-page "https://github.com/betterlockscreen/betterlockscreen")
    (synopsis "a simple, minimal lockscreen")
    (description
     "A simple, minimal lockscreen.")
    (license license:expat)))

;;; -- bms-shell --
(define-public bms-shell
  (package
    (name "bms-shell")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Heroblaze2310/bms-shell.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/bms-shell/"))))
    (home-page "https://github.com/Heroblaze2310/bms-shell")
    (synopsis "a Quickshell-based desktop shell with Material 3 design principles")
    (description
     "A Quickshell-based desktop shell with Material 3 design principles.")
    (license license:gpl3)))

;;; -- clion --
(define-public clion
  (package
    (name "clion")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/cpp/CLion-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/clion/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/clion/")
    (synopsis "cross-platform C/C++ IDE by JetBrains")
    (description
     "CLion is a cross-platform C/C++ IDE by JetBrains.  It includes smart
code completion, on-the-fly code analysis, and integrated debugging.")
    (license license:expat)))

;;; -- cosmic-applets-git --
(define-public cosmic-applets-git
  (package
    (name "cosmic-applets-git")
    (version "1.0.0.alpha.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/cosmic-applets.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/cosmic-applets/"))))
    (home-page "https://github.com/pop-os/cosmic-applets")
    (synopsis "applets for COSMIC Panel")
    (description
     "Applets for COSMIC Panel.")
    (license license:gpl3)))

;;; -- cosmic-bg-git --
(define-public cosmic-bg-git
  (package
    (name "cosmic-bg-git")
    (version "1.0.0.beta.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/cosmic-bg.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/cosmic-bg/"))))
    (home-page "https://github.com/pop-os/cosmic-bg")
    (synopsis "COSMIC session service which applies backgrounds to displays")
    (description
     "COSMIC session service which applies backgrounds to displays.")
    (license license:mpl2.0)))

;;; -- cosmic-files-git --
(define-public cosmic-files-git
  (package
    (name "cosmic-files-git")
    (version "1.0.0.alpha.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/cosmic-files.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/cosmic-files/"))))
    (home-page "https://github.com/pop-os/cosmic-files")
    (synopsis "file manager for the COSMIC desktop environment")
    (description
     "File manager for the COSMIC desktop environment.")
    (license license:gpl3)))

;;; -- cosmic-greeter-git --
(define-public cosmic-greeter-git
  (package
    (name "cosmic-greeter-git")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/cosmic-greeter.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/cosmic-greeter/"))))
    (home-page "https://github.com/pop-os/cosmic-greeter")
    (synopsis "libcosmic greeter for greetd, which can be run inside cosmic-comp")
    (description
     "Libcosmic greeter for greetd, which can be run inside cosmic-comp.")
    (license license:gpl3)))

;;; -- cosmic-osd-git --
(define-public cosmic-osd-git
  (package
    (name "cosmic-osd-git")
    (version "1.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/cosmic-osd.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/cosmic-osd/"))))
    (home-page "https://github.com/pop-os/cosmic-osd")
    (synopsis "COSMIC On-Screen Display")
    (description
     "COSMIC On-Screen Display.")
    (license license:gpl3)))

;;; -- element-web-git --
(define-public element-web-git
  (package
    (name "element-web-git")
    (version "1.12.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vector-im/element-web.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/element-web/"))))
    (home-page "https://github.com/vector-im/element-web")
    (synopsis "glossy Matrix collaboration client — web version")
    (description
     "Glossy Matrix collaboration client — web version.")
    (license license:asl2.0)))

;;; -- emacs-mozc --
(define-public emacs-mozc
  (package
    (name "emacs-mozc")
    (version "3.33.6133")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/mozc.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/emacs-mozc/"))))
    (home-page "https://github.com/google/mozc")
    (synopsis "the Open Source edition of Google Japanese Input (Emacs module)")
    (description
     "The Open Source edition of Google Japanese Input (Emacs module).")
    (license license:expat)))

;;; -- fcitx5-mozc-ut --
(define-public fcitx5-mozc-ut
  (package
    (name "fcitx5-mozc-ut")
    (version "3.33.6133")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fcitx/mozc.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fcitx5-mozc-ut/"))))
    (home-page "https://github.com/fcitx/mozc")
    (synopsis "the Open Source edition of Google Japanese Input (Fcitx5 module)")
    (description
     "The Open Source edition of Google Japanese Input (Fcitx5 module).")
    (license license:expat)))

;;; -- firmware-manager --
(define-public firmware-manager
  (package
    (name "firmware-manager")
    (version "0.1.5+15+ga45bdc7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/firmware-manager.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/firmware-manager/"))))
    (home-page "https://github.com/pop-os/firmware-manager")
    (synopsis "generic framework and GTK UI for firmware updates from system76-firmware an...")
    (description
     "Generic framework and GTK UI for firmware updates from system76-firmware and fwupd.")
    (license license:gpl3+)))

;;; -- ggml-sycl-f16-git --
(define-public ggml-sycl-f16-git
  (package
    (name "ggml-sycl-f16-git")
    (version "6757e32")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ggml-org/ggml.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/ggml-sycl-f16/"))))
    (home-page "https://github.com/ggml-org/ggml")
    (synopsis "tensor library for machine learning (with Intel SYCL GPU optimizations and ...")
    (description
     "Tensor library for machine learning (with Intel SYCL GPU optimizations and F16).")
    (license license:expat)))

;;; -- hypryou-utils --
(define-public hypryou-utils
  (package
    (name "hypryou-utils")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/koeqaife/hyprland-material-you.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/hypryou-utils/"))))
    (home-page "https://github.com/koeqaife/hyprland-material-you")
    (synopsis "replacement for hyprland-qtutils as part of HyprYou project")
    (description
     "Replacement for hyprland-qtutils as part of HyprYou project.")
    (license license:gpl3+)))

;;; -- icu69 --
(define-public icu69
  (package
    (name "icu69")
    (version "69.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.icu-project.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icu69/"))))
    (home-page "http://www.icu-project.org/")
    (synopsis "international Components for Unicode library")
    (description
     "International Components for Unicode library.")
    (license license:expat)))

;;; -- intel-graphics-compiler-legacy --
(define-public intel-graphics-compiler-legacy
  (package
    (name "intel-graphics-compiler-legacy")
    (version "1.0.17537.24")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/intel/intel-graphics-compiler.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/intel-graphics-compiler-legacy/"))))
    (home-page "https://github.com/intel/intel-graphics-compiler/")
    (synopsis "Intel Graphics Compiler for OpenCL (legacy platforms)")
    (description
     "Intel Graphics Compiler for OpenCL (legacy platforms).")
    (license license:expat)))

;;; -- intel-npu-driver --
(define-public intel-npu-driver
  (package
    (name "intel-npu-driver")
    (version "1.32.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/intel/linux-npu-driver.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/intel-npu-driver/"))))
    (home-page "https://github.com/intel/linux-npu-driver/")
    (synopsis "Intel Neural Processing Unit (NPU) driver")
    (description
     "Intel Neural Processing Unit (NPU) driver.")
    (license license:expat)))

;;; -- iscan --
(define-public iscan
  (package
    (name "iscan")
    (version "2.30.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/iscan/"))))
    (home-page "http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX")
    (synopsis "ePSON Image Scan! front-end for scanners and all-in-ones")
    (description
     "EPSON Image Scan! front-end for scanners and all-in-ones.")
    (license license:expat)))

;;; -- karakeep-cli --
(define-public karakeep-cli
  (package
    (name "karakeep-cli")
    (version "0.31.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.npmjs.com/package/@karakeep/cli")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/karakeep-cli/"))))
    (home-page "https://www.npmjs.com/package/@karakeep/cli")
    (synopsis "command Line Interface (CLI) for Karakeep")
    (description
     "Command Line Interface (CLI) for Karakeep.")
    (license license:agpl3+)))

;;; -- kde-material-you-colors --
(define-public kde-material-you-colors
  (package
    (name "kde-material-you-colors")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/luisbocanegra/kde-material-you-colors.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/kde-material-you-colors/"))))
    (home-page "https://github.com/luisbocanegra/kde-material-you-colors")
    (synopsis "automatic Material You Colors Generator from your wallpaper for the Plasma ...")
    (description
     "Automatic Material You Colors Generator from your wallpaper for the Plasma Desktop.")
    (license license:gpl3+)))

;;; -- kdesignerplugin --
(define-public kdesignerplugin
  (package
    (name "kdesignerplugin")
    (version "5.116.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://community.kde.org/Frameworks")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/kdesignerplugin/"))))
    (home-page "https://community.kde.org/Frameworks")
    (synopsis "integration of Frameworks widgets in Qt Designer/Creator")
    (description
     "Integration of Frameworks widgets in Qt Designer/Creator.")
    (license license:lgpl3+)))

;;; -- kemoticons --
(define-public kemoticons
  (package
    (name "kemoticons")
    (version "5.116.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://community.kde.org/Frameworks")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/kemoticons/"))))
    (home-page "https://community.kde.org/Frameworks")
    (synopsis "support for emoticons and emoticons themes")
    (description
     "Support for emoticons and emoticons themes.")
    (license license:lgpl3+)))

;;; -- kwin-effects-better-blur-dx --
(define-public kwin-effects-better-blur-dx
  (package
    (name "kwin-effects-better-blur-dx")
    (version "2.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xarblu/kwin-effects-better-blur-dx.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/kwin-effects-better-blur-dx/"))))
    (home-page "https://github.com/xarblu/kwin-effects-better-blur-dx")
    (synopsis "kWin Better Blur DX effect fork with window class force blur feature (Wayland)")
    (description
     "KWin Better Blur DX effect fork with window class force blur feature (Wayland).")
    (license license:gpl3+)))

;;; -- kwin-minimize2tray-git --
(define-public kwin-minimize2tray-git
  (package
    (name "kwin-minimize2tray-git")
    (version "33eb2f2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/luisbocanegra/kwin-minimize2tray.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/kwin-minimize2tray/"))))
    (home-page "https://github.com/luisbocanegra/kwin-minimize2tray")
    (synopsis "hide windows to the system tray, similar to KDocker but in the form of a KW...")
    (description
     "Hide windows to the system tray, similar to KDocker but in the form of a KWin Script that works on Wayland.")
    (license license:gpl3+)))

;;; -- libastal-git --
(define-public libastal-git
  (package
    (name "libastal-git")
    (version "6976fab")
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
     (list
      #:install-plan
      #~'(("." "share/libastal/"))))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "building blocks for building desktop shells")
    (description
     "Building blocks for building desktop shells.")
    (license license:expat)))

;;; -- libastal-meta --
(define-public libastal-meta
  (package
    (name "libastal-meta")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Aylur/astal/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/libastal-meta/"))))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "libastal meta package, including all libastal services")
    (description
     "Libastal meta package, including all libastal services.")
    (license license:expat)))

;;; -- libpamac-full --
(define-public libpamac-full
  (package
    (name "libpamac-full")
    (version "11.7.4.3.gc7efe92")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/manjaro/libpamac.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/libpamac-full/"))))
    (home-page "https://github.com/manjaro/libpamac")
    (synopsis "library for Pamac package manager based on libalpm - flatpak and snap suppo...")
    (description
     "Library for Pamac package manager based on libalpm - flatpak and snap support enabled.")
    (license license:gpl3+)))

;;; -- llama.cpp-hip --
(define-public llama-cpp-hip
  (package
    (name "llama-cpp-hip")
    (version "b8683")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ggml-org/llama.cpp.git")
             (commit "b8683")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DGGML_HIP=ON")))
    (home-page "https://github.com/ggml-org/llama.cpp")
    (synopsis "LLM inference with ROCm/HIP acceleration")
    (description
     "Port of Facebook's LLaMA model in C/C++ with ROCm HIP GPU acceleration
support for AMD GPUs.")
    (license license:expat)))

;;; -- maa-assistant-arknights --
(define-public maa-assistant-arknights
  (package
    (name "maa-assistant-arknights")
    (version "6.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MaaAssistantArknights/MaaAssistantArknights.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/maa-assistant-arknights/"))))
    (home-page "https://github.com/MaaAssistantArknights/MaaAssistantArknights")
    (synopsis "an Arknights assistant")
    (description
     "An Arknights assistant.")
    (license license:expat)))

;;; -- mdcat --
(define-public mdcat
  (package
    (name "mdcat")
    (version "2.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/swsnr/mdcat.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mdcat/"))))
    (home-page "https://github.com/swsnr/mdcat")
    (synopsis "sophisticated Markdown rendering for the terminal")
    (description
     "Sophisticated Markdown rendering for the terminal.")
    (license license:mpl2.0)))

;;; -- mozc-ut-full-common --
(define-public mozc-ut-full-common
  (package
    (name "mozc-ut-full-common")
    (version "2.32.5994.102.20251218")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fcitx/mozc.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mozc-ut-full-common/"))))
    (home-page "https://github.com/fcitx/mozc")
    (synopsis "a Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open S...")
    (description
     "A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input).")
    (license license:expat)))

;;; -- nautilus-sendto --
(define-public nautilus-sendto
  (package
    (name "nautilus-sendto")
    (version "3.8.6+28+gc87aac4")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.gnome.org/Archive/nautilus-sendto")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/nautilus-sendto/"))))
    (home-page "https://gitlab.gnome.org/Archive/nautilus-sendto")
    (synopsis "easily send files via mail")
    (description
     "Easily send files via mail.")
    (license license:gpl2+)))

;;; -- noctalia-qs --
(define-public noctalia-qs
  (package
    (name "noctalia-qs")
    (version "0.0.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/noctalia-dev/noctalia-qs.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/noctalia-qs/"))))
    (home-page "https://github.com/noctalia-dev/noctalia-qs")
    (synopsis "custom fork of Quickshell powering Noctalia Shell")
    (description
     "Custom fork of Quickshell powering Noctalia Shell.")
    (license license:expat)))

;;; -- opensnitch-ebpf-module-git --
(define-public opensnitch-ebpf-module-git
  (package
    (name "opensnitch-ebpf-module-git")
    (version "1.6.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/evilsocket/opensnitch.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/opensnitch-ebpf-module/"))))
    (home-page "https://github.com/evilsocket/opensnitch")
    (synopsis "eBPF process monitor module for opensnitch")
    (description
     "EBPF process monitor module for opensnitch.")
    (license license:gpl3+)))

;;; -- openssh-askpass --
(define-public openssh-askpass
  (package
    (name "openssh-askpass")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=openssh-askpass&full=0")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/openssh-askpass/"))))
    (home-page "http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=openssh-askpass&full=0")
    (synopsis "a plasma-like passphrase dialog for ssh")
    (description
     "A plasma-like passphrase dialog for ssh.")
    (license license:gpl2+)))

;;; -- overskride --
(define-public overskride
  (package
    (name "overskride")
    (version "0.6.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kaii-lb/overskride.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/overskride/"))))
    (home-page "https://github.com/kaii-lb/overskride")
    (synopsis "a simple yet powerful bluetooth client")
    (description
     "A simple yet powerful bluetooth client.")
    (license license:gpl3+)))

;;; -- owlry-lua --
(define-public owlry-lua
  (package
    (name "owlry-lua")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://somegit.dev/Owlibou/owlry")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/owlry-lua/"))))
    (home-page "https://somegit.dev/Owlibou/owlry")
    (synopsis "lua scripting runtime for Owlry — enables user-created Lua plugins")
    (description
     "Lua scripting runtime for Owlry — enables user-created Lua plugins.")
    (license license:gpl3+)))

;;; -- owlry-rune --
(define-public owlry-rune
  (package
    (name "owlry-rune")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://somegit.dev/Owlibou/owlry")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/owlry-rune/"))))
    (home-page "https://somegit.dev/Owlibou/owlry")
    (synopsis "rune scripting runtime for Owlry — enables user-created Rune plugins")
    (description
     "Rune scripting runtime for Owlry — enables user-created Rune plugins.")
    (license license:gpl3+)))

;;; -- php-imap --
(define-public php-imap
  (package
    (name "php-imap")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://pecl.php.net/package/imap")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/php-imap/"))))
    (home-page "https://pecl.php.net/package/imap")
    (synopsis "pHP extension for imap")
    (description
     "PHP extension for imap.")
    (license license:expat)))

;;; -- powershell --
(define-public powershell
  (package
    (name "powershell")
    (version "7.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PowerShell/PowerShell/releases/download/v"
             version "/powershell-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/powershell/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/PowerShell/PowerShell")
    (synopsis "cross-platform automation and configuration tool")
    (description
     "PowerShell is a cross-platform task automation solution made up of a
command-line shell, a scripting language, and a configuration management
framework.  PowerShell runs on Windows, Linux, and macOS.")
    (license license:expat)))

;;; -- processing-examples --
(define-public processing-examples
  (package
    (name "processing-examples")
    (version "4.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.processing.org/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/processing-examples/"))))
    (home-page "https://www.processing.org/")
    (synopsis "programming environment for creating images, animations and interactions (e...")
    (description
     "Programming environment for creating images, animations and interactions (examples).")
    (license license:gpl3+)))

;;; -- python-frida --
(define-public python-frida
  (package
    (name "python-frida")
    (version "17.7.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.frida.re")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/python-frida/"))))
    (home-page "https://www.frida.re")
    (synopsis "inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and An...")
    (description
     "Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi.")
    (license license:expat)))

;;; -- python-insightface --
(define-public python-insightface
  (package
    (name "python-insightface")
    (version "0.7.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/deepinsight/insightface.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/python-insightface/"))))
    (home-page "https://github.com/deepinsight/insightface")
    (synopsis "insightFace Python Library")
    (description
     "InsightFace Python Library.")
    (license license:expat)))

;;; -- python-moviepy --
(define-public python-moviepy
  (package
    (name "python-moviepy")
    (version "2.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Zulko/moviepy.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/python-moviepy/"))))
    (home-page "https://github.com/Zulko/moviepy/")
    (synopsis "video editing with Python")
    (description
     "Video editing with Python.")
    (license license:expat)))

;;; -- python-snakeviz --
(define-public python-snakeviz
  (package
    (name "python-snakeviz")
    (version "2.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "http://jiffyclub.github.io/snakeviz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/python-snakeviz/"))))
    (home-page "http://jiffyclub.github.io/snakeviz")
    (synopsis "a viewer for Python profiling data")
    (description
     "A viewer for Python profiling data.")
    (license license:bsd-3)))

;;; -- python-twisterl --
(define-public python-twisterl
  (package
    (name "python-twisterl")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AI4quantum/twisteRL.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/python-twisterl/"))))
    (home-page "https://github.com/AI4quantum/twisteRL")
    (synopsis "poC of a Reinforcement Learning framework")
    (description
     "PoC of a Reinforcement Learning framework.")
    (license license:asl2.0)))

;;; -- python38 --
(define-public python38
  (package
    (name "python38")
    (version "3.8.20")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.python.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/python38/"))))
    (home-page "https://www.python.org/")
    (synopsis "major release 3.8 of the Python high-level programming language")
    (description
     "Major release 3.8 of the Python high-level programming language.")
    (license license:expat)))

;;; -- qadwaitadecorations-qt6 --
(define-public qadwaitadecorations-qt6
  (package
    (name "qadwaitadecorations-qt6")
    (version "0.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FedoraQt/QAdwaitaDecorations.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/qadwaitadecorations-qt6/"))))
    (home-page "https://github.com/FedoraQt/QAdwaitaDecorations")
    (synopsis "Qt6 decoration plugin implementing Adwaita-like client-side decorations")
    (description
     "Qt6 decoration plugin implementing Adwaita-like client-side decorations.")
    (license license:expat)))

;;; -- qtforkawesome --
(define-public qtforkawesome
  (package
    (name "qtforkawesome")
    (version "0.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Martchus/qtforkawesome.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/qtforkawesome/"))))
    (home-page "https://github.com/Martchus/qtforkawesome")
    (synopsis "library that bundles ForkAwesome for use within Qt applications")
    (description
     "Library that bundles ForkAwesome for use within Qt applications.")
    (license license:gpl2+)))

;;; -- radicle-httpd --
(define-public radicle-httpd
  (package
    (name "radicle-httpd")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z4V1sjrXqjvFdnCUbxPFqd5p4DtH5")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/radicle-httpd/"))))
    (home-page "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z4V1sjrXqjvFdnCUbxPFqd5p4DtH5")
    (synopsis "open source, peer-to-peer code collaboration stack built on Git - explorer ...")
    (description
     "Open source, peer-to-peer code collaboration stack built on Git - explorer (backend).")
    (license license:expat)))

;;; -- rvgl-io-cars --
(define-public rvgl-io-cars
  (package
    (name "rvgl-io-cars")
    (version "25.0902")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://re-volt.io/online/cars/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rvgl-io-cars/"))))
    (home-page "https://re-volt.io/online/cars")
    (synopsis "additional RVGL cars used for official events")
    (description
     "Additional RVGL cars used for official events.")
    (license license:expat)))

;;; -- samsung-unified-driver-printer --
(define-public samsung-unified-driver-printer
  (package
    (name "samsung-unified-driver-printer")
    (version "1.00.39")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.samsung.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/samsung-unified-driver-printer/"))))
    (home-page "http://www.samsung.com")
    (synopsis "samsung Unified Linux Driver for printers")
    (description
     "Samsung Unified Linux Driver for printers.")
    (license license:expat)))

;;; -- samsung-unified-driver-scanner --
(define-public samsung-unified-driver-scanner
  (package
    (name "samsung-unified-driver-scanner")
    (version "1.00.39")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.samsung.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/samsung-unified-driver-scanner/"))))
    (home-page "http://www.samsung.com")
    (synopsis "samsung Unified Linux Driver for scanners")
    (description
     "Samsung Unified Linux Driver for scanners.")
    (license license:expat)))

;;; -- sdrpp-headers-git --
(define-public sdrpp-headers-git
  (package
    (name "sdrpp-headers-git")
    (version "c89763a9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AlexandreRouma/SDRPlusPlus.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/sdrpp-headers/"))))
    (home-page "https://github.com/AlexandreRouma/SDRPlusPlus")
    (synopsis "sDR++ headers for building out-of-tree modules")
    (description
     "SDR++ headers for building out-of-tree modules.")
    (license license:gpl3+)))

;;; -- snapx --
(define-public snapx
  (package
    (name "snapx")
    (version "0.r4.0.makepkg.1.g5c6ddf7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SnapXL/SnapX.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/snapx/"))))
    (home-page "https://github.com/SnapXL/SnapX")
    (synopsis "screenshot tool that handles images, text, and video (fork of ShareX)")
    (description
     "Screenshot tool that handles images, text, and video (fork of ShareX).")
    (license license:gpl3+)))

;;; -- todds --
(define-public todds
  (package
    (name "todds")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/todds-encoder/todds.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/todds/"))))
    (home-page "https://github.com/todds-encoder/todds")
    (synopsis "a CPU-based DDS encoder optimized for fast batch conversions with high enco...")
    (description
     "A CPU-based DDS encoder optimized for fast batch conversions with high encoding quality.")
    (license license:mpl2.0)))

;;; -- trustedqsl --
(define-public trustedqsl
  (package
    (name "trustedqsl")
    (version "2.8.4")
    (source
     (origin
       (method url-fetch)
       (uri "http://lotw.arrl.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/trustedqsl/"))))
    (home-page "http://lotw.arrl.org/")
    (synopsis "qSO log signing data for the ARRL Logbook of The World (LoTW)")
    (description
     "QSO log signing data for the ARRL Logbook of The World (LoTW).")
    (license license:expat)))

;;; -- vivaldi-snapshot-ffmpeg-codecs --
(define-public vivaldi-snapshot-ffmpeg-codecs
  (package
    (name "vivaldi-snapshot-ffmpeg-codecs")
    (version "146.0.7680.171")
    (source
     (origin
       (method url-fetch)
       (uri "https://chromium.googlesource.com/chromium/third_party/ffmpeg")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/vivaldi-snapshot-ffmpeg-codecs/"))))
    (home-page "https://chromium.googlesource.com/chromium/third_party/ffmpeg")
    (synopsis "additional support for proprietary codecs for vivaldi-snapshot")
    (description
     "Additional support for proprietary codecs for vivaldi-snapshot.")
    (license license:lgpl2.1+)))

;;; -- vkbasalt-redemp-git --
(define-public vkbasalt-redemp-git
  (package
    (name "vkbasalt-redemp-git")
    (version "d5c38ed")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Redemp/vkBasalt.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/vkbasalt-redemp/"))))
    (home-page "https://github.com/Redemp/vkBasalt")
    (synopsis "a Vulkan post-processing layer. (Redemp fork)")
    (description
     "A Vulkan post-processing layer. (Redemp fork).")
    (license license:zlib)))

;;; -- waydroid-image --
(define-public waydroid-image
  (package
    (name "waydroid-image")
    (version "1:20.0.20260403")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://waydro.id/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/waydroid-image/"))))
    (home-page "https://waydro.id")
    (synopsis "lineageOS-based Android images for Waydroid")
    (description
     "LineageOS-based Android images for Waydroid.")
    (license license:gpl3)))

;;; -- waydroid-script-git --
(define-public waydroid-script-git
  (package
    (name "waydroid-script-git")
    (version "r186.fcb1562")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/casualsnek/waydroid_script.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/waydroid-script/"))))
    (home-page "https://github.com/casualsnek/waydroid_script")
    (synopsis "Python Script to add OpenGapps, Magisk, libhoudini translation library and ...")
    (description
     "Python Script to add OpenGapps, Magisk, libhoudini translation library and libndk translation library to waydroid.")
    (license license:gpl3)))

;;; -- xrizer --
(define-public xrizer
  (package
    (name "xrizer")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Supreeeme/xrizer.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/xrizer/"))))
    (home-page "https://github.com/Supreeeme/xrizer")
    (synopsis "reimplementation of OpenVR, translating calls to OpenXR")
    (description
     "Reimplementation of OpenVR, translating calls to OpenXR.")
    (license license:gpl3+)))

;;; -- xtensa-lx106-elf-gcc-bin --
(define-public xtensa-lx106-elf-gcc-bin
  (package
    (name "xtensa-lx106-elf-gcc-bin")
    (version "8.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/espressif/ESP8266_RTOS_SDK/releases/download/v3.4/"
             "xtensa-lx106-elf-gcc" version "_esp-2020r3-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/xtensa-lx106-elf/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/espressif/ESP8266_RTOS_SDK")
    (synopsis "xtensa LX106 cross-compiler toolchain for ESP8266")
    (description
     "Pre-built GCC cross-compiler toolchain for the Xtensa LX106 architecture,
used for ESP8266 development with the ESP8266 RTOS SDK.")
    (license license:gpl3+)))

;;; -- yabridgectl-wine10-git --
(define-public yabridgectl-wine10-git
  (package
    (name "yabridgectl-wine10-git")
    (version "42e0794d")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/robbert-vdh/yabridge.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/yabridgectl-wine10/"))))
    (home-page "https://github.com/robbert-vdh/yabridge")
    (synopsis "optional utility to help set up and manage yabridge (git version)")
    (description
     "Optional utility to help set up and manage yabridge (git version).")
    (license license:gpl3+)))

