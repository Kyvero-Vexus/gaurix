;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414l
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 12 recipes created (binary repacks + 1 source build)
;;;   - 18 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (oniri-bin
            3dstool-bin
            ollama-bin
            flutter-bin
            dotnet-sdk-7.0-bin
            uzdoom-bin
            electron19-bin
            zephyr-sdk-bin
            naver-whale-stable
            eidklient-bin
            droidcam-obs-plugin-bin
            xwinwrap))

;;;
;;; --- 1. oniri-bin (copy-build-system, pre-built Go binary) ---
;;; Automatically maximizes the only window of a niri workspace.
;;; Single static binary from GitHub releases.
;;;

(define-public oniri-bin
  (package
    (name "oniri-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Antiz96/oniri/releases/download/v"
                    version "/oniri-" version "-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "oniri-" #$version "-amd64")
                         "bin/oniri"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "automatically maximize the only window of a niri workspace")
    (description "Oniri is a daemon that automatically maximizes the only
window in a niri Wayland compositor workspace.  When multiple windows are
present, normal tiling behavior is restored.")
    (home-page "https://github.com/Antiz96/oniri")
    (license license:gpl3)))

;;;
;;; --- 2. 3dstool-bin (copy-build-system, pre-built binary) ---
;;; All-in-one tool for extracting/creating 3DS ROM files.
;;;

(define-public 3dstool-bin
  (package
    (name "3dstool-bin")
    (version "1.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dnasdw/3dstool/releases/download/v"
                    version "/3dstool_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "3dstool" "bin/3dstool"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool for extracting and creating 3DS ROM files")
    (description "3dstool is an all-in-one tool for extracting and
creating 3DS ROM file formats including CCI, CXI, CFA, ExeFS, RomFS,
and banner files.")
    (home-page "https://github.com/dnasdw/3dstool")
    (license license:expat)))

;;;
;;; --- 3. ollama-bin (copy-build-system, pre-built Go binary) ---
;;; Run large language models locally.
;;;

(define-public ollama-bin
  (package
    (name "ollama-bin")
    (version "0.20.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ollama/ollama/releases/download/v"
                    version "/ollama-linux-amd64.tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "bin/" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "run large language models locally")
    (description "Ollama allows running large language models locally.
It supports models like Llama, Mistral, Gemma, and many others with a
simple command-line interface and an OpenAI-compatible REST API.")
    (home-page "https://github.com/ollama/ollama")
    (license license:expat)))

;;;
;;; --- 4. flutter-bin (copy-build-system, pre-built SDK) ---
;;; Google's UI toolkit for building cross-platform applications.
;;;

(define-public flutter-bin
  (package
    (name "flutter-bin")
    (version "3.29.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://storage.googleapis.com/flutter_infra_release/"
                    "releases/stable/linux/flutter_linux_"
                    version "-stable.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "opt/flutter/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Google's UI toolkit for cross-platform app development")
    (description "Flutter is Google's UI toolkit for building natively
compiled applications for mobile, web, and desktop from a single Dart
codebase.  This package provides the pre-built Flutter SDK.")
    (home-page "https://flutter.dev")
    (license license:bsd-3)))

;;;
;;; --- 5. dotnet-sdk-7.0-bin (copy-build-system, pre-built SDK) ---
;;; Microsoft .NET SDK 7.0 for building and running .NET applications.
;;;

(define-public dotnet-sdk-7.0-bin
  (package
    (name "dotnet-sdk-7.0-bin")
    (version "7.0.410")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/Sdk/"
                    version "/dotnet-sdk-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "opt/dotnet/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Microsoft .NET SDK 7.0 for Linux")
    (description "The .NET SDK 7.0 includes everything needed to build and
run .NET 7.0 applications: the .NET CLI, runtime, and libraries.  Note
that .NET 7.0 has reached end-of-life; consider upgrading to a supported
version.")
    (home-page "https://dotnet.microsoft.com/")
    (license license:expat)))

;;;
;;; --- 6. uzdoom-bin (copy-build-system, AppImage binary) ---
;;; Feature-centric Doom engine port based on GZDoom.
;;;

(define-public uzdoom-bin
  (package
    (name "uzdoom-bin")
    (version "4.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/UZDoom/UZDoom/releases/download/"
                    version "/Linux-UZDoom-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "Linux-UZDoom-" #$version
                                        ".AppImage")
                         "bin/uzdoom"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "feature-centric Doom engine port based on GZDoom")
    (description "UZDoom is a feature-centric source port for all Doom
engine games, based on GZDoom.  It provides an advanced OpenGL renderer,
ZScript scripting, and support for WAD, PK3, and other mod formats.")
    (home-page "https://github.com/UZDoom/UZDoom")
    (license license:gpl3)))

;;;
;;; --- 7. electron19-bin (copy-build-system, pre-built framework) ---
;;; Electron v19 framework for desktop applications (EOL).
;;;

(define-public electron19-bin
  (package
    (name "electron19-bin")
    (version "19.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/electron/electron/releases/download/v"
                    version "/electron-v" version "-linux-x64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "opt/electron19/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "framework for building cross-platform desktop apps (v19)")
    (description "Electron is a framework for building cross-platform
desktop applications with JavaScript, HTML, and CSS.  This provides
the pre-built Electron 19 runtime (Chromium 102, Node.js 16.14.2).
Note: Electron 19 has reached end-of-life.")
    (home-page "https://www.electronjs.org/")
    (license license:expat)))

;;;
;;; --- 8. zephyr-sdk-bin (copy-build-system, pre-built SDK) ---
;;; Zephyr RTOS development SDK with cross-compilation toolchains.
;;;

(define-public zephyr-sdk-bin
  (package
    (name "zephyr-sdk-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zephyrproject-rtos/sdk-ng/"
                    "releases/download/v" version
                    "/zephyr-sdk-" version
                    "_linux-x86_64_minimal.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "opt/zephyr-sdk/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Zephyr RTOS SDK with cross-compilation toolchains")
    (description "The Zephyr SDK provides toolchains and host tools for
developing applications targeting the Zephyr real-time operating system.
It includes cross-compilers for ARM, RISC-V, Xtensa, and other
architectures used in embedded systems.")
    (home-page "https://github.com/zephyrproject-rtos/sdk-ng")
    (license license:asl2.0)))

;;;
;;; --- 9. naver-whale-stable (copy-build-system, .deb binary) ---
;;; Chromium-based web browser from NAVER (Korea).
;;;

(define-public naver-whale-stable
  (package
    (name "naver-whale-stable")
    (version "4.36.368.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://repo.whale.naver.com/stable/deb/pool/main/n/"
                    "naver-whale-stable/naver-whale-stable_"
                    version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "opt/naver-whale/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Chromium-based web browser from NAVER")
    (description "Naver Whale is a Chromium-based web browser developed
by NAVER Corporation.  It features built-in sidebar tools, dual-tab
browsing, translation, and Korea-specific web integrations.")
    (home-page "https://whale.naver.com/")
    (license (license:non-copyleft
              "https://whale.naver.com/en/eula/"
              "Proprietary NAVER Whale EULA"))))

;;;
;;; --- 10. eidklient-bin (copy-build-system, AppImage from tar.gz) ---
;;; Slovak electronic identity card client.
;;;

(define-public eidklient-bin
  (package
    (name "eidklient-bin")
    (version "5.3")
    (source (origin
              (method url-fetch)
              (uri "https://eidas.minv.sk/downloadservice/eidklient/linux/eID_klient_x86_64.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "opt/eidklient/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Slovak electronic identity card (eID) client")
    (description "eID klient is the official Slovak government client
for using the Slovak electronic identity card (eID) for electronic
authentication and digital signatures in government services.")
    (home-page "https://www.slovensko.sk/")
    (license (license:non-copyleft
              "https://eidas.minv.sk/"
              "Proprietary Slovak government software"))))

;;;
;;; --- 11. droidcam-obs-plugin-bin (copy-build-system, binary zip) ---
;;; OBS Studio plugin to use phone camera via DroidCam.
;;;

(define-public droidcam-obs-plugin-bin
  (package
    (name "droidcam-obs-plugin-bin")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dev47apps/droidcam-obs-plugin/"
                    "releases/download/" version
                    "/droidcam_obs_" version "_linux_x86_64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "lib/obs-plugins/droidcam-obs/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "OBS Studio plugin to use a phone camera via DroidCam")
    (description "The DroidCam OBS plugin lets you use your Android or
iOS phone as a camera source in OBS Studio.  It connects over WiFi or
USB and supports HD video with low latency.")
    (home-page "https://github.com/dev47apps/droidcam-obs-plugin")
    (license license:gpl2)))

;;;
;;; --- 12. xwinwrap (gnu-build-system, simple C source) ---
;;; Stick apps to desktop background as animated wallpaper (X11).
;;;

(define-public xwinwrap
  (package
    (name "xwinwrap")
    (version "0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/r00tdaemon/xwinwrap")
                    (commit "ec32e9b72539de7e1553a4f70345166107b431f7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "make")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                             "/bin")))
                     (mkdir-p bin)
                     (install-file "xwinwrap" bin)))))))
    (synopsis "stick applications to desktop background as wallpaper")
    (description "Xwinwrap allows you to stick most applications to your
desktop background, enabling animated wallpapers using tools like mpv
or other video players under X11.")
    (home-page "https://github.com/r00tdaemon/xwinwrap")
    (license license:expat)))
