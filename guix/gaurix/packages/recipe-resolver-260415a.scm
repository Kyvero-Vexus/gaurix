;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415a
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 17 resolved with recipes; 13 exhausted (see blocked-notes).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            nb
            xmousepasteblock-git
            threedstool
            katifetch
            zps
            lief
            mstflint
            cctag
            tuxclocker
            godot-cpp
            jdk25-graalvm-bin
            somo
            wl-gammarelay-rs
            transgender
            wormhole-rs
            wallchemy-bin
            apriltag
            ))

;;; EUPL-1.2 license definition (not yet in upstream Guix).
(define license:eupl1.2
  ((@@ (guix licenses) license) "EUPL-1.2"
    "https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12"
    "European Union Public License 1.2"))

;;;
;;; --- 1. nb ---
;;; Command-line and local web plain text note-taking, bookmarking,
;;; archiving, and knowledge base application.
;;;

(define-public nb
  (package
    (name "nb")
    (version "7.25.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xwmx/nb")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nb" "bin/nb")
               ("bin/bookmark" "bin/bookmark"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-program
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (wrap-program (string-append out "/bin/nb")
                       `("PATH" prefix
                         ,(map (lambda (p)
                                 (string-append (assoc-ref inputs p) "/bin"))
                               '("bash" "git"))))))))))
    (inputs (list bash git))
    (synopsis "command-line and local web note-taking, bookmarking, and archiving")
    (description "Nb is a command-line and local web plain text note-taking,
bookmarking, archiving, and knowledge base application with wiki-style
linking, tagging, filtering, search, Git-backed versioning and syncing,
Pandoc-backed conversion, and more, in a single portable script.")
    (home-page "https://xwmx.github.io/nb/")
    (license license:agpl3+)))

;;;
;;; --- 2. xmousepasteblock-git ---
;;; Disable middle-click paste in X11.
;;;

(define-public xmousepasteblock-git
  (package
    (name "xmousepasteblock-git")
    (version "1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/milaq/XMousePasteBlock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libx11 libxi libev))
    (synopsis "disable middle mouse button paste in X11")
    (description "XMousePasteBlock disables the middle mouse button
paste functionality in X11.  It intercepts middle-click events
via XInput2 and blocks the paste action.")
    (home-page "https://github.com/milaq/XMousePasteBlock")
    (license license:gpl2)))

;;;
;;; --- 3. threedstool (3dstool) ---
;;; Tool for extracting/creating 3DS ROM filesystem.
;;;

(define-public threedstool
  (package
    (name "threedstool")
    (version "1.2.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dnasdw/3dstool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list curl openssl zlib))
    (synopsis "tool for extracting and creating 3DS ROM filesystems")
    (description "3dstool is a tool for extracting and creating
Nintendo 3DS ROM filesystem images (CCI, CXI, CFA, ExeFS, RomFS).")
    (home-page "https://github.com/dnasdw/3dstool")
    (license license:expat)))

;;;
;;; --- 4. katifetch ---
;;; Lightweight system information fetch tool written in Bash.
;;;

(define-public katifetch
  (package
    (name "katifetch")
    (version "13.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ximimoments/katifetch")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("katifetch" "bin/katifetch"))))
    (inputs (list bash))
    (synopsis "lightweight system information fetch tool in bash")
    (description "Katifetch is a lightweight system information fetch tool
written in Bash that displays system info in the terminal.")
    (home-page "https://github.com/ximimoments/katifetch")
    (license license:expat)))

;;;
;;; --- 5. zps ---
;;; Small utility for listing and reaping zombie processes on Linux.
;;;

(define-public zps
  (package
    (name "zps")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/orhun/zps")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "small utility for listing and reaping zombie processes on Linux")
    (description "Zps is a small utility for listing and reaping zombie
processes on Linux.  It can detect, list, and optionally kill zombie
processes.")
    (home-page "https://github.com/orhun/zps")
    (license license:gpl3)))

;;;
;;; --- 6. lief ---
;;; Library to instrument executable formats (ELF, PE, MachO).
;;;

(define-public lief
  (package
    (name "lief")
    (version "0.17.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lief-project/LIEF")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DLIEF_PYTHON_API=OFF"
                   "-DBUILD_SHARED_LIBS=ON")))
    (synopsis "library to instrument executable formats")
    (description "LIEF is a cross-platform library to parse, modify, and
abstract ELF, PE, and Mach-O executable formats.  It provides both a C++
and a C API for binary analysis and instrumentation.")
    (home-page "https://lief-project.github.io/")
    (license license:asl2.0)))

;;;
;;; --- 7. mstflint ---
;;; Mellanox firmware burning and diagnostics tools.
;;;

(define-public mstflint
  (package
    (name "mstflint")
    (version "4.35.0-1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mellanox/mstflint")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list openssl libxml2 curl zlib))
    (synopsis "mellanox firmware burning and diagnostics tools")
    (description "Mstflint is a set of firmware burning, diagnostics, and
debug tools for Mellanox/NVIDIA ConnectX network adapters.  It includes
tools for flashing firmware, querying device info, and performing
hardware diagnostics.")
    (home-page "https://github.com/Mellanox/mstflint")
    (license license:gpl2)))

;;;
;;; --- 8. cctag ---
;;; Detection of CCTag markers in images.
;;;

(define-public cctag
  (package
    (name "cctag")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alicevision/CCTag")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCCTAG_WITH_CUDA=OFF")))
    (inputs (list boost eigen openblas))
    (native-inputs (list pkg-config))
    (synopsis "detection of CCTag fiducial markers in images")
    (description "CCTag is a C++ library for detecting CCTag circular
fiducial markers in images.  It is designed for robust detection under
challenging conditions including motion blur and occlusion.")
    (home-page "https://github.com/alicevision/CCTag")
    (license license:mpl2.0)))

;;;
;;; --- 9. tuxclocker ---
;;; Qt5 GPU monitoring and overclocking tool.
;;;

(define-public tuxclocker
  (package
    (name "tuxclocker")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Lurkki14/tuxclocker")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-Ddaemon=true"
                   "-Dgui=true"
                   "-Dplugins=amd")))
    (inputs (list boost qtbase-5 libdrm))
    (native-inputs (list pkg-config))
    (synopsis "Qt5 GPU monitoring and overclocking tool for Linux")
    (description "TuxClocker is a hardware monitoring and overclocking tool
for Linux.  It provides a Qt5 GUI and a daemon for controlling GPU
parameters such as clock speeds, fan curves, and power limits.  Supports
AMD GPUs via libdrm.")
    (home-page "https://github.com/Lurkki14/tuxclocker")
    (license license:gpl3+)))

;;;
;;; --- 10. godot-cpp ---
;;; C++ bindings for the Godot game engine GDExtension API.
;;;

(define-public godot-cpp
  (package
    (name "godot-cpp")
    (version "4.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/godotengine/godot-cpp")
                    (commit (string-append "godot-" version "-stable"))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DGODOT_GDEXTENSION_DIR=gdextension")))
    (synopsis "C++ bindings for the Godot game engine GDExtension API")
    (description "Godot-cpp provides C++ bindings for the Godot game
engine's GDExtension API, enabling developers to write high-performance
native extensions for Godot 4.x using C++.")
    (home-page "https://github.com/godotengine/godot-cpp")
    (license license:expat)))

;;;
;;; --- 11. jdk25-graalvm-bin ---
;;; GraalVM Community Edition JDK 25 (prebuilt binary).
;;;

(define-public jdk25-graalvm-bin
  (package
    (name "jdk25-graalvm-bin")
    (version "25.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/graalvm/graalvm-ce-builds"
                    "/releases/download/jdk-" version
                    "/graalvm-community-jdk-" version
                    "_linux-x64_bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/graalvm-jdk-25/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-bin-symlinks
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (jdk (string-append out "/share/graalvm-jdk-25"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (for-each
                      (lambda (prog)
                        (let ((target (string-append jdk "/bin/" prog)))
                          (when (file-exists? target)
                            (symlink target (string-append bin "/" prog)))))
                      '("java" "javac" "javadoc" "javap" "jar"
                        "jlink" "jmod" "jpackage" "native-image"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GraalVM Community Edition JDK 25 (prebuilt binary)")
    (description "GraalVM Community Edition is a high-performance JDK
distribution with ahead-of-time compilation via Native Image, polyglot
interoperability, and optimized performance for JVM languages.")
    (home-page "https://www.graalvm.org/")
    (license license:gpl2)))

;;;
;;; --- 12. somo ---
;;; Modern alternative to netstat/ss written in Rust.
;;;

(define-public somo
  (package
    (name "somo")
    (version "1.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/theopfr/somo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "modern alternative to netstat and ss written in Rust")
    (description "Somo is a terminal-based network socket monitor
written in Rust.  It provides a modern, colorful, and interactive
alternative to netstat and ss for inspecting network connections.")
    (home-page "https://github.com/theopfr/somo")
    (license license:expat)))

;;;
;;; --- 13. wl-gammarelay-rs ---
;;; Wayland display brightness/temperature adjustment daemon.
;;;

(define-public wl-gammarelay-rs
  (package
    (name "wl-gammarelay-rs")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MaxVerevkin/wl-gammarelay-rs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "Wayland display brightness and color temperature daemon")
    (description "Wl-gammarelay-rs is a daemon for adjusting display
brightness and color temperature on Wayland compositors via D-Bus.
It is controlled via busctl or custom scripts, and is commonly used
with status bars like Waybar.")
    (home-page "https://github.com/MaxVerevkin/wl-gammarelay-rs")
    (license license:gpl3)))

;;;
;;; --- 14. transgender ---
;;; Terminal file explorer written in Rust.
;;;

(define-public transgender
  (package
    (name "transgender")
    (version "1.5.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Sberm/Transgender.rs")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "terminal file explorer written in Rust")
    (description "Transgender is a fast, minimal terminal file explorer
written in Rust.  It provides keyboard-driven file navigation with
a clean terminal UI.")
    (home-page "https://github.com/Sberm/Transgender.rs")
    (license license:bsd-2)))

;;;
;;; --- 15. wormhole-rs ---
;;; Rust implementation of Magic Wormhole file transfer protocol.
;;;

(define-public wormhole-rs
  (package
    (name "wormhole-rs")
    (version "0.7.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/magic-wormhole/magic-wormhole.rs")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "Rust implementation of the Magic Wormhole file transfer protocol")
    (description "Wormhole-rs is a Rust implementation of the Magic Wormhole
protocol for secure file and message transfer between computers.  It is
compatible with the Python magic-wormhole client.")
    (home-page "https://github.com/magic-wormhole/magic-wormhole.rs")
    (license license:eupl1.2)))

;;;
;;; --- 16. wallchemy-bin ---
;;; Wallpaper manager and downloader (prebuilt Go binary).
;;;

(define-public wallchemy-bin
  (package
    (name "wallchemy-bin")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/davenicholson-xyz/wallchemy"
                    "/releases/download/v" version
                    "/wallchemy-linux-amd64-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wallchemy" "bin/wallchemy"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "wallpaper manager and downloader for Linux")
    (description "Wallchemy is a CLI tool for managing and downloading
wallpapers from various online sources.  It supports multiple
wallpaper providers and can set wallpapers on various Linux desktop
environments.")
    (home-page "https://github.com/davenicholson-xyz/wallchemy")
    (license license:expat)))

;;;
;;; --- 17. apriltag ---
;;; Visual fiducial detection library.
;;; (Dependency for python-apriltag; packaged to unblock #4671.)
;;;

(define-public apriltag
  (package
    (name "apriltag")
    (version "3.4.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AprilRobotics/apriltag")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DBUILD_PYTHON_WRAPPER=OFF")))
    (synopsis "visual fiducial marker detection library")
    (description "AprilTag is a visual fiducial system useful for a wide
variety of tasks including augmented reality, robotics, and camera
calibration.  It detects specially designed 2D barcodes (tags) in images
and computes their precise 3D position, orientation, and identity.")
    (home-page "https://april.eecs.umich.edu/software/apriltag")
    (license license:bsd-2)))
