;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424n
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; New recipes (12):
;;;      1.  svxlink-sounds-en-us-heather-16k (copy-build-system, v25.05, gpl2)
;;;      2.  mii-emu (gnu-build-system, v1.97, expat)
;;;      3.  ffqueue-git (gnu-build-system, v1.7.69, gpl3+)
;;;      4.  looking-glass-rc (cmake-build-system, vB7, gpl2+)
;;;      5.  looking-glass-rc-host (cmake-build-system, vB7, gpl2+)
;;;      6.  obs-plugin-looking-glass-rc (cmake-build-system, vB7, gpl2+)
;;;      7.  chromium-material-icons-for-github-bin (copy-build-system, v1.14.0, expat)
;;;      8.  freetype2-macos-browsers-binary-patcher (copy-build-system, v3, gpl3+)
;;;      9.  simulide (gnu-build-system, v1.1.0, agpl3+)
;;;     10.  swiftshader-git (cmake-build-system, v0.0.0, asl2.0)
;;;     11.  verinice-bin (copy-build-system, v1.28.0, asl2.0)
;;;     12.  python-pocketsphinx (pyproject-build-system, v5.0.4, bsd-3)
;;;
;;; BLOCKED (18):
;;;      1.  atari++ (6758) -- CUSTOM_LICENSE: custom:TPL not recognized FOSS license
;;;      2.  zswap-cli-git (6981) -- SYSTEMD_DEPENDENCY: requires sdbus-cpp + systemd
;;;      3.  evcxr_jupyter (10227) -- CARGO_VENDORING: Rust project, needs crate enumeration
;;;      4.  basalt-monado-git (15080) -- COMPLEX_DEPS: VR SLAM; Pangolin, TBB, custom OpenCV
;;;      5.  ambertools (15094) -- BUILD_SYSTEM_TOO_COMPLEX: massive Fortran/C++ sim suite
;;;      6.  rog-control-center-nosystemd (15107) -- CARGO_VENDORING + ASUS_SPECIFIC
;;;      7.  asusctl-nosystemd-dinit (15109) -- INIT_SYSTEM_INCOMPATIBLE: dinit not in Guix
;;;      8.  asusctl-nosystemd (15110) -- CARGO_VENDORING + ASUS_SPECIFIC
;;;      9.  mullvad-vpn-dinit (15201) -- INIT_SYSTEM_INCOMPATIBLE: dinit not in Guix
;;;     10.  revezone (15223) -- ELECTRON_UNSUPPORTED: depends on electron25 (EOL)
;;;     11.  aeternum (15224) -- CARGO_VENDORING + MISSING_DEP: upscayl-ncnn not in Guix
;;;     12.  sail (15226) -- GO_MODULE_VENDORING + ABANDONED: cdr/sail archived
;;;     13.  ollama-dinit (15236) -- INIT_SYSTEM_INCOMPATIBLE: dinit not in Guix
;;;     14.  auto-cpufreq-dinit (15219) -- INIT_SYSTEM_INCOMPATIBLE: dinit not in Guix
;;;     15.  imessage-exporter (17376) -- CARGO_VENDORING + PLATFORM_SPECIFIC: needs macOS data
;;;     16.  hyde-ipc (17377) -- CARGO_VENDORING: Rust IPC for Hyprland
;;;     17.  faenza-cupertino-icon-theme (21477) -- MISSING_DEP: faenza-icon-theme not in Guix
;;;     18.  faba-mono-icons-git (21538) -- MISSING_DEP: faba-icon-theme not in Guix
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260424n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            svxlink-sounds-en-us-heather-16k
            mii-emu
            ffqueue-git
            looking-glass-rc
            looking-glass-rc-host
            obs-plugin-looking-glass-rc
            chromium-material-icons-for-github-bin
            freetype2-macos-browsers-binary-patcher
            simulide
            swiftshader-git
            verinice-bin
            python-pocketsphinx
            ))

;;; ===================================================================
;;; 1. svxlink-sounds-en-us-heather-16k
;;; ===================================================================
;;; Source: https://github.com/sm0svx/svxlink-sounds-en_US-heather
;;; English language voice pack for SvxLink Server

(define-public svxlink-sounds-en-us-heather-16k
  (package
    (name "svxlink-sounds-en-us-heather-16k")
    (version "25.05")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sm0svx/svxlink-sounds-en_US-heather")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/svxlink/sounds/en_US/heather/16k/"
                #:include-regexp (".*\\.wav$" ".*\\.raw$")))))
    (home-page "https://github.com/sm0svx/svxlink-sounds-en_US-heather")
    (synopsis "english language voice pack for SvxLink server")
    (description "English (US) language pack for SvxLink Server using the
Heather voice from Acapela Box.  Provides 16kHz audio files for all SvxLink
voice announcements and modules.")
    (license license:gpl2)))

;;; ===================================================================
;;; 2. mii-emu
;;; ===================================================================
;;; Source: https://github.com/buserror/mii_emu
;;; Apple //e emulator for Linux

(define-public mii-emu
  (package
    (name "mii-emu")
    (version "1.97")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/buserror/mii_emu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list alsa-lib mesa glu libx11 pixman))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/buserror/mii_emu")
    (synopsis "Apple //e emulator for Linux")
    (description "MII is an Apple //e emulator for Linux.  It emulates the
Apple IIe enhanced with 128KB RAM, 80-column card, double hi-res graphics,
and Mockingboard sound.  Supports disk images in various formats.")
    (license license:expat)))

;;; ===================================================================
;;; 3. ffqueue-git
;;; ===================================================================
;;; Source: https://github.com/bsoftware/FFQueue (upstream)
;;; FFmpeg graphical front-end

(define-public ffqueue-git
  (package
    (name "ffqueue-git")
    (version "1.7.69")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bsoftware/FFQueue")
                    (commit "548736a")))
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
                   (invoke "make" "-f" "Makefile")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (install-file "ffqueue" bin)))))))
    (inputs (list ffmpeg wxwidgets zlib))
    (native-inputs (list pkg-config))
    (home-page "https://ffqueue.bruchhaus.dk/")
    (synopsis "graphical user interface for FFmpeg")
    (description "FFQueue is a graphical front-end for FFmpeg with comprehensive
support for basic and advanced encoding, filtering, and media manipulation
tasks.  It provides a job queue system for batch processing of multimedia
files.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 4. looking-glass-rc
;;; ===================================================================
;;; Source: https://looking-glass.io/
;;; Client application for LookingGlass IVSHMEM

(define-public looking-glass-rc
  (package
    (name "looking-glass-rc")
    (version "B7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gnif/LookingGlass")
                    (commit version)
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-client
                 (lambda _ (chdir "client"))))))
    (inputs (list fontconfig
                  libpipewire
                  pulseaudio
                  libsamplerate
                  libxi
                  libxpresent
                  libxscrnsaver
                  libx11
                  mesa
                  sdl2
                  sdl2-ttf
                  wayland))
    (native-inputs (list pkg-config))
    (home-page "https://looking-glass.io/")
    (synopsis "client for accessing LookingGlass IVSHMEM device")
    (description "Looking Glass is a client application for accessing the
LookingGlass IVSHMEM (Inter-VM Shared Memory) device of a virtual machine.
It allows near-native performance display of a Windows guest VM's screen on
a Linux host without the overhead of network-based solutions.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 5. looking-glass-rc-host
;;; ===================================================================
;;; Source: https://looking-glass.io/
;;; Host application for pushing frames to IVSHMEM

(define-public looking-glass-rc-host
  (package
    (name "looking-glass-rc-host")
    (version "B7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gnif/LookingGlass")
                    (commit version)
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-host
                 (lambda _ (chdir "host"))))))
    (inputs (list glib
                  libpipewire
                  libxcb
                  zlib
                  zstd))
    (native-inputs (list pkg-config))
    (home-page "https://looking-glass.io/")
    (synopsis "Linux host for pushing frames to LookingGlass IVSHMEM")
    (description "Looking Glass Host captures frames from the Linux display
server and pushes them to the LookingGlass IVSHMEM (Inter-VM Shared Memory)
device.  This allows another machine or VM to display the frames with minimal
latency via the Looking Glass client.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 6. obs-plugin-looking-glass-rc
;;; ===================================================================
;;; Source: https://looking-glass.io/
;;; OBS Studio plugin for Looking Glass

(define-public obs-plugin-looking-glass-rc
  (package
    (name "obs-plugin-looking-glass-rc")
    (version "B7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gnif/LookingGlass")
                    (commit version)
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-obs
                 (lambda _ (chdir "obs"))))))
    (inputs (list obs))
    (native-inputs (list pkg-config))
    (home-page "https://looking-glass.io/")
    (synopsis "OBS Studio plugin for Looking Glass")
    (description "Plugin for OBS Studio to stream directly from Looking Glass
without having to render on the screen first.  Allows capturing a VM's display
output for streaming or recording with minimal overhead.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 7. chromium-material-icons-for-github-bin
;;; ===================================================================
;;; Source: https://github.com/nickelca/material-icons-browser-extension
;;; Browser extension for material file icons on GitHub

(define-public chromium-material-icons-for-github-bin
  (package
    (name "chromium-material-icons-for-github-bin")
    (version "1.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickelca/material-icons-browser-extension")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/chromium-material-icons-for-github/"))))
    (home-page "https://github.com/nickelca/material-icons-browser-extension")
    (synopsis "material file icons for GitHub in the browser")
    (description "Browser extension that enhances file browsers of version
control systems like GitHub, GitLab, and Bitbucket with Material Design file
type icons, making it easier to distinguish file types at a glance.")
    (license license:expat)))

;;; ===================================================================
;;; 8. freetype2-macos-browsers-binary-patcher
;;; ===================================================================
;;; Source: AUR
;;; Script to patch freetype2 in browsers for macOS-style rendering

(define-public freetype2-macos-browsers-binary-patcher
  (package
    (name "freetype2-macos-browsers-binary-patcher")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/freetype2-macos-browsers-binary-patcher/"
                #:include-regexp (".*\\.sh$" "README.*")))))
    (home-page "https://www.freetype.org/")
    (synopsis "patch freetype2 in browsers for macOS-like font rendering")
    (description "Shell script that patches the freetype2 library bundled
in Chrome and Vivaldi browsers to use a similar filtering configuration as
macOS, producing smoother font rendering on Linux.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 9. simulide
;;; ===================================================================
;;; Source: https://github.com/Arcachofo/SimuliDE-1
;;; Real-time electronic circuit simulator

(define-public simulide
  (package
    (name "simulide")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Arcachofo/SimuliDE-1")
                    (commit (string-append "v" version "-SR2"))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "qmake"
                           (string-append "PREFIX=" (assoc-ref outputs "out"))
                           "SimulIDE.pro")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/simulide")))
                     (mkdir-p bin)
                     (mkdir-p share)
                     (when (file-exists? "build/release/simulide")
                       (install-file "build/release/simulide" bin))
                     (when (file-exists? "resources")
                       (copy-recursively "resources" share))))))))
    (inputs (list qtbase-5
                  qtmultimedia-5
                  qtserialport-5
                  qtsvg-5))
    (native-inputs (list pkg-config qttools-5))
    (home-page "https://github.com/Arcachofo/SimuliDE-1")
    (synopsis "real-time electronic circuit simulator")
    (description "SimulIDE is a real-time electronic circuit simulator with
support for PIC, AVR, and Arduino microcontrollers.  It features a schematic
editor, component library, and integrated debugger for embedded firmware
development and testing.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 10. swiftshader-git
;;; ===================================================================
;;; Source: https://swiftshader.googlesource.com/SwiftShader
;;; CPU-based Vulkan implementation

(define-public swiftshader-git
  (package
    (name "swiftshader-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://swiftshader.googlesource.com/SwiftShader")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DSWIFTSHADER_BUILD_TESTS=OFF"
                   "-DSWIFTSHADER_BUILD_BENCHMARKS=OFF"
                   (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs (list libxcb
                  wayland
                  zlib))
    (native-inputs (list pkg-config python-wrapper))
    (home-page "https://swiftshader.googlesource.com/SwiftShader")
    (synopsis "high-performance CPU-based Vulkan implementation")
    (description "SwiftShader is a high-performance CPU-based implementation
of the Vulkan 1.3 graphics API by Google.  It provides software rendering
for environments without GPU hardware, useful for testing, CI/CD pipelines,
and virtual machines without GPU passthrough.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 11. verinice-bin
;;; ===================================================================
;;; Source: https://github.com/SerNet/verinice
;;; Open source GRC (Governance, Risk, Compliance) software

(define-public verinice-bin
  (package
    (name "verinice-bin")
    (version "1.28.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SerNet/verinice/releases/download/"
                    version "/verinice-" version "-linux.gtk.x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/verinice/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/verinice")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/verinice")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/verinice \"$@\"~%"
                                 share)))
                     (chmod (string-append bin "/verinice") #o755)))))))
    (inputs (list (list openjdk17 "jdk")))
    (home-page "https://github.com/SerNet/verinice")
    (synopsis "open-source GRC (governance, risk, compliance) software")
    (description "Verinice is an open-source tool for information security
management and governance, risk, and compliance (GRC).  It supports ISO 27001,
BSI IT-Grundschutz, and other compliance frameworks with asset management,
risk assessment, and audit documentation capabilities.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 12. python-pocketsphinx
;;; ===================================================================
;;; Source: https://github.com/cmusphinx/pocketsphinx
;;; Small speech recognizer

(define-public python-pocketsphinx
  (package
    (name "python-pocketsphinx")
    (version "5.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cmusphinx/pocketsphinx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list gstreamer gst-plugins-base))
    (native-inputs (list cmake
                         python-cython
                         python-scikit-build-core
                         ninja))
    (home-page "https://cmusphinx.github.io")
    (synopsis "lightweight speech recognition engine")
    (description "PocketSphinx is a lightweight speech recognition engine
specifically tuned for handheld and mobile devices, though it works on
desktop systems as well.  It provides Python bindings for real-time continuous
speech recognition with low CPU and memory requirements.")
    (license license:bsd-3)))
