;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407d
;;; Resolves 100 BLOCKED packages from priority queue (pass d).
;;; Generated: 2026-04-07T18:00:00+00:00

(define-module (gaurix packages deptree-resolver-260407d)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages node)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
)

(define-public texlive-installer
  (package
    (name "texlive-installer")
    (version "2026")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.tug.org/texlive/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this packages provides the installer of texlive")
    (description "This packages provides the installer of texlive.  It also tricks Arch into thinking it has its texlive packages installed.")
    (home-page "http://www.tug.org/texlive/")
    (license license:gpl3+)))

(define-public dotnet-sdk-bin
  (package
    (name "dotnet-sdk-bin")
    (version "10.0.5.sdk201")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dotnetcli.azureedge.net/dotnet/Sdk/" version "/dotnet-sdk-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "the")
    (description "The .NET Core SDK (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public dotnet-sdk-9-0-bin
  (package
    (name "dotnet-sdk-9.0-bin")
    (version "9.0.14.sdk312")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dotnetcli.azureedge.net/dotnet/Sdk/" version "/dotnet-sdk-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "the")
    (description "The .NET Core SDK.")
    (home-page "https://dotnet.microsoft.com")
    (license license:expat)))

(define-public qt5-webkit
  (package
    (name "qt5-webkit")
    (version "5.212.0alpha4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qtwebkit/qtwebkit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "classes for a WebKit2 based implementation and a new QML API")
    (description "Classes for a WebKit2 based implementation and a new QML API.")
    (home-page "https://github.com/qtwebkit/qtwebkit")
    (license license:gpl3+)))

(define-public lib32-nvidia-vulkan-utils
  (package
    (name "lib32-nvidia-vulkan-utils")
    (version "595.44.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.nvidia.com/vulkan-driver"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "NVIDIA drivers utilities (32-bit) (vulkan developer branch)")
    (description "NVIDIA drivers utilities (32-bit) (vulkan developer branch).")
    (home-page "https://developer.nvidia.com/vulkan-driver")
    (license (license:non-copyleft "https://developer.nvidia.com/vulkan-driver" "Custom license"))))

(define-public cudnn9-10-cuda12-9
  (package
    (name "cudnn9.10-cuda12.9")
    (version "9.10.2.21")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.nvidia.com/cuDNN"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA CUDA Deep Neural Network library version 9")
    (description "NVIDIA CUDA Deep Neural Network library version 9.10 (Maxwell/Pascal/Volta support).")
    (home-page "https://developer.nvidia.com/cuDNN")
    (license (license:non-copyleft "https://developer.nvidia.com/cuDNN" "Custom license"))))

(define-public python-albumentationsx
  (package
    (name "python-albumentationsx")
    (version "2.0.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/albumentations-team/albumentationsx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast image augmentation library and easy to use wrapper around other libra...")
    (description "Fast image augmentation library and easy to use wrapper around other libraries.")
    (home-page "https://github.com/albumentations-team/albumentationsx")
    (license license:gpl3+)))

(define-public dotnet-targeting-pack-preview-bin
  (package
    (name "dotnet-targeting-pack-preview-bin")
    (version "11.0.0.sdk100+preview.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dotnetcli.azureedge.net/dotnet/Sdk/" version "/dotnet-sdk-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "the")
    (description "The .NET Core targeting pack (preview, binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public mips64-linux-gnu-linux-api-headers
  (package
    (name "mips64-linux-gnu-linux-api-headers")
    (version "6.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.kernel.org"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel headers sanitized for use in userspace (MIPS64 target, for the tool...")
    (description "Kernel headers sanitized for use in userspace (MIPS64 target, for the toolchain with GNU C library and multilib ABI).")
    (home-page "https://www.kernel.org")
    (license license:gpl2)))

(define-public nvidia-550xx-utils
  (package
    (name "nvidia-550xx-utils")
    (version "550.163.01")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nvidia.com/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "NVIDIA drivers utilities, 550 branch")
    (description "NVIDIA drivers utilities, 550 branch.")
    (home-page "http://www.nvidia.com/")
    (license (license:non-copyleft "http://www.nvidia.com/" "Custom license"))))

(define-public openrc
  (package
    (name "openrc")
    (version "0.63")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenRC/openrc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dependency based init system that works with sysvinit and systemd or on it...")
    (description "Dependency based init system that works with sysvinit and systemd or on its own.")
    (home-page "https://github.com/OpenRC/openrc")
    (license license:bsd-3)))

(define-public foobar2000
  (package
    (name "foobar2000")
    (version "2.25.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.foobar2000.org"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced freeware audio player (uses Wine)")
    (description "An advanced freeware audio player (uses Wine).")
    (home-page "https://www.foobar2000.org")
    (license (license:non-copyleft "https://www.foobar2000.org" "Custom license"))))

(define-public studio-one-7
  (package
    (name "studio-one-7")
    (version "7.2.3.108761")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.presonus.com/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "digital audio workstation for music production, remixing and live performance")
    (description "Digital audio workstation for music production, remixing and live performance.")
    (home-page "https://www.presonus.com/")
    (license (license:non-copyleft "https://www.presonus.com/" "Custom license"))))

(define-public mingw-w64-headers-msvcrt
  (package
    (name "mingw-w64-headers-msvcrt")
    (version "13.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://mingw-w64.sourceforge.net"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MinGW-w64 headers for Windows (with MSVCRT as default C runtime library)")
    (description "MinGW-w64 headers for Windows (with MSVCRT as default C runtime library).")
    (home-page "http://mingw-w64.sourceforge.net")
    (license (license:non-copyleft "http://mingw-w64.sourceforge.net" "Custom license"))))

(define-public windsurf-next
  (package
    (name "windsurf-next")
    (version "1.9600.1032_next.8940206081")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://windsurf.com"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "windsurf-next - Next version of the Windsurf editor")
    (description "Windsurf-next - Next version of the Windsurf editor.")
    (home-page "https://windsurf.com")
    (license (license:non-copyleft "https://windsurf.com" "Custom license"))))

(define-public aspnet-runtime-9-0-bin
  (package
    (name "aspnet-runtime-9.0-bin")
    (version "9.0.14.sdk312")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dotnetcli.azureedge.net/dotnet/Sdk/" version "/dotnet-sdk-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "the ASP")
    (description "The ASP.NET Core runtime.")
    (home-page "https://dotnet.microsoft.com")
    (license license:expat)))

(define-public cryptomator-bin
  (package
    (name "cryptomator-bin")
    (version "1.19.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cryptomator.org/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "multiplatform transparent client-side encryption of your files in the cloud")
    (description "Multiplatform transparent client-side encryption of your files in the cloud.")
    (home-page "https://cryptomator.org/")
    (license license:gpl3+)))

(define-public intel-oneapi-basekit-2025
  (package
    (name "intel-oneapi-basekit-2025")
    (version "2025.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://software.intel.com/content/www/us/en/develop/tools/oneapi.html"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Intel oneAPI Base Toolkit for Linux")
    (description "Intel oneAPI Base Toolkit for Linux.")
    (home-page "https://software.intel.com/content/www/us/en/develop/tools/oneapi.html")
    (license license:expat)))

(define-public mongosh-bin
  (package
    (name "mongosh-bin")
    (version "2.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mongodb-js/mongosh/releases/download/v" version "/mongosh-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "an interactive shell to connect with MongoDB with syntax highlighting, aut...")
    (description "An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.")
    (home-page "https://github.com/mongodb-js/mongosh.git")
    (license license:asl2.0)))

(define-public nvidia-vulkan-open-dkms
  (package
    (name "nvidia-vulkan-open-dkms")
    (version "595.44.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.nvidia.com/vulkan-driver"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "NVIDIA open kernel modules - module sources (vulkan developer branch)")
    (description "NVIDIA open kernel modules - module sources (vulkan developer branch).")
    (home-page "https://developer.nvidia.com/vulkan-driver")
    (license license:expat)))

(define-public opencl-nvidia-vulkan
  (package
    (name "opencl-nvidia-vulkan")
    (version "595.44.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.nvidia.com/vulkan-driver"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "OpenCL implemention for NVIDIA (vulkan developer branch)")
    (description "OpenCL implemention for NVIDIA (vulkan developer branch).")
    (home-page "https://developer.nvidia.com/vulkan-driver")
    (license (license:non-copyleft "https://developer.nvidia.com/vulkan-driver" "Custom license"))))

(define-public unreal-tournament-data-steam
  (package
    (name "unreal-tournament-data-steam")
    (version "436")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://store.steampowered.com/app/13240/Unreal_Tournament_GOTY/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unreal Tournament 99 (GOTY) data from Steam")
    (description "Unreal Tournament 99 (GOTY) data from Steam.")
    (home-page "https://store.steampowered.com/app/13240/Unreal_Tournament_GOTY/")
    (license (license:non-copyleft "https://store.steampowered.com/app/13240/Unreal_Tournament_GOTY/" "Custom license"))))

(define-public acestream-engine
  (package
    (name "acestream-engine")
    (version "3.2.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://acestream.org"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ace Stream engine")
    (description "Ace Stream engine.")
    (home-page "https://acestream.org")
    (license (license:non-copyleft "https://acestream.org" "Custom license"))))

(define-public dotnet-host-preview-bin
  (package
    (name "dotnet-host-preview-bin")
    (version "11.0.0.sdk100+preview.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dotnetcli.azureedge.net/dotnet/Sdk/" version "/dotnet-sdk-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "a generic driver for the")
    (description "A generic driver for the .NET Core Command Line Interface (preview, binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public libstdc-plus-plus5-bin
  (package
    (name "libstdc++5-bin")
    (version "3.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://packages.debian.org/bullseye/libstdc++5"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "the GNU Standard C++ Library v3")
    (description "The GNU Standard C++ Library v3.")
    (home-page "https://packages.debian.org/bullseye/libstdc++5")
    (license license:gpl3+)))

(define-public sac-core
  (package
    (name "sac-core")
    (version "10.9.4723")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "thales/Gemalto SafeNet Authentication Client for eToken 5110/5300 & IDPrim...")
    (description "Thales/Gemalto SafeNet Authentication Client for eToken 5110/5300 & IDPrime (core PKCS#11 modules).")
    (home-page "https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management")
    (license (license:non-copyleft "https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management" "Custom license"))))

(define-public e-imzo
  (package
    (name "e-imzo")
    (version "5.00")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://e-imzo.soliq.uz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "uzbek state web identity proving & key signing (E-IMZO)")
    (description "Uzbek state web identity proving & key signing (E-IMZO).")
    (home-page "https://e-imzo.soliq.uz")
    (license (license:non-copyleft "https://e-imzo.soliq.uz" "Custom license"))))

(define-public gtk-sharp-2
  (package
    (name "gtk-sharp-2")
    (version "2.12.45")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.mono-project.com/docs/gui/gtksharp/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK2 bindings for C#")
    (description "GTK2 bindings for C#.")
    (home-page "https://www.mono-project.com/docs/gui/gtksharp/")
    (license license:gpl3+)))

(define-public llama-cpp-vulkan-bin
  (package
    (name "llama.cpp-vulkan-bin")
    (version "b7376")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ggerganov/llama.cpp/releases/download/v" version "/llama.cpp-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "LLM inference in C/C++ (with Vulkan GPU optimizations) (precompiled Linux ...")
    (description "LLM inference in C/C++ (with Vulkan GPU optimizations) (precompiled Linux binaries).")
    (home-page "https://github.com/ggerganov/llama.cpp")
    (license license:expat)))

(define-public nvidia-390xx-utils
  (package
    (name "nvidia-390xx-utils")
    (version "390.157")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nvidia.com/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "NVIDIA drivers utilities")
    (description "NVIDIA drivers utilities.")
    (home-page "https://www.nvidia.com/")
    (license (license:non-copyleft "https://www.nvidia.com/" "Custom license"))))

(define-public nvidia-470xx-utils
  (package
    (name "nvidia-470xx-utils")
    (version "470.256.02-8.01")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nvidia.com/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "NVIDIA drivers utilities")
    (description "NVIDIA drivers utilities.")
    (home-page "http://www.nvidia.com/")
    (license (license:non-copyleft "http://www.nvidia.com/" "Custom license"))))

(define-public pgadmin4-desktop-bin
  (package
    (name "pgadmin4-desktop-bin")
    (version "9.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.pgadmin.org/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "the desktop user interface for pgAdmin")
    (description "The desktop user interface for pgAdmin.  pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.")
    (home-page "https://www.pgadmin.org/")
    (license license:x11)))

(define-public samsung-unified-driver-printer
  (package
    (name "samsung-unified-driver-printer")
    (version "1.00.39")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.samsung.com"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Samsung Unified Linux Driver for printers")
    (description "Samsung Unified Linux Driver for printers.")
    (home-page "http://www.samsung.com")
    (license (license:non-copyleft "http://www.samsung.com" "Custom license"))))

(define-public crystal-nightly
  (package
    (name "crystal-nightly")
    (version "20260312")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://crystal-lang.org"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Crystal Programming Language, nightly binaries")
    (description "The Crystal Programming Language, nightly binaries.")
    (home-page "http://crystal-lang.org")
    (license license:asl2.0)))

(define-public discord-arch-electron
  (package
    (name "discord_arch_electron")
    (version "0.0.131")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://discord.com"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "discord using system provided electron for increased security and performance")
    (description "Discord using system provided electron for increased security and performance.")
    (home-page "https://discord.com")
    (license (license:non-copyleft "https://discord.com" "Custom license"))))

(define-public samsung-unified-driver-scanner
  (package
    (name "samsung-unified-driver-scanner")
    (version "1.00.39")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.samsung.com"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Samsung Unified Linux Driver for scanners")
    (description "Samsung Unified Linux Driver for scanners.")
    (home-page "http://www.samsung.com")
    (license (license:non-copyleft "http://www.samsung.com" "Custom license"))))

(define-public vectorchord
  (package
    (name "vectorchord")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tensorchord/VectorChord")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scalable, fast, and disk-friendly vector search in Postgres, successor to ...")
    (description "Scalable, fast, and disk-friendly vector search in Postgres, successor to pgvecto.rs.")
    (home-page "https://github.com/tensorchord/VectorChord")
    (license license:gpl3+)))

(define-public xorg-font-utils
  (package
    (name "xorg-font-utils")
    (version "7.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://xorg.freedesktop.org/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "transitional package depending on xorg font utilities")
    (description "Transitional package depending on xorg font utilities.")
    (home-page "http://xorg.freedesktop.org/")
    (license license:gpl3+)))

(define-public zectl
  (package
    (name "zectl")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://github.com/johnramsden/zectl"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ZFS Boot Environment manager")
    (description "ZFS Boot Environment manager.")
    (home-page "http://github.com/johnramsden/zectl")
    (license license:expat)))

(define-public lib32-libvmaf
  (package
    (name "lib32-libvmaf")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Netflix/vmaf/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "perceptual video quality assessment algorithm based on multi-method fusion...")
    (description "Perceptual video quality assessment algorithm based on multi-method fusion - library (32 bit).")
    (home-page "https://github.com/Netflix/vmaf/")
    (license license:bsd-3)))

(define-public opencl-amd
  (package
    (name "opencl-amd")
    (version "7.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.amd.com"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenC...")
    (description "ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack.")
    (home-page "http://www.amd.com")
    (license (license:non-copyleft "http://www.amd.com" "Custom license"))))

(define-public sleuthkit-java
  (package
    (name "sleuthkit-java")
    (version "4.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.sleuthkit.org/sleuthkit"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java bindings for The Sleuth Kit")
    (description "Java bindings for The Sleuth Kit.")
    (home-page "http://www.sleuthkit.org/sleuthkit")
    (license license:expat)))

(define-public heidisql-qt6-bin
  (package
    (name "heidisql-qt6-bin")
    (version "12.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/HeidiSQL/HeidiSQL/releases/download/v" version "/HeidiSQL-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "a lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite...")
    (description "A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases.  (Qt6).")
    (home-page "https://github.com/HeidiSQL/HeidiSQL")
    (license license:gpl2+)))

(define-public kpimtextedit5
  (package
    (name "kpimtextedit5")
    (version "23.08.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://kontact.kde.org"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a textedit with PIM-specific features")
    (description "A textedit with PIM-specific features.")
    (home-page "https://kontact.kde.org")
    (license license:gpl3+)))

(define-public memoria-daemon
  (package
    (name "memoria-daemon")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Bumblebee-3/memoria")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "memoria clipboard daemon (systemd user service)")
    (description "Memoria clipboard daemon (systemd user service).")
    (home-page "https://github.com/Bumblebee-3/memoria")
    (license license:expat)))

(define-public ps3-psl1ght
  (package
    (name "ps3-psl1ght")
    (version "20241020")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ps3dev"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PSL1GHT lightweight PS3 GameOS SDK")
    (description "PSL1GHT lightweight PS3 GameOS SDK.")
    (home-page "https://github.com/ps3dev")
    (license license:expat)))

(define-public python-holoviews
  (package
    (name "python-holoviews")
    (version "1.22.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://holoviews.org"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "with Holoviews, your data visualizes itself")
    (description "With Holoviews, your data visualizes itself.")
    (home-page "https://holoviews.org")
    (license license:bsd-3)))

(define-public lib32-nvidia-utils-beta
  (package
    (name "lib32-nvidia-utils-beta")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nvidia.com/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "NVIDIA drivers utilities (32-bit, beta version)")
    (description "NVIDIA drivers utilities (32-bit, beta version).")
    (home-page "https://www.nvidia.com/")
    (license (license:non-copyleft "https://www.nvidia.com/" "Custom license"))))

(define-public pgadmin4-web
  (package
    (name "pgadmin4-web")
    (version "9.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.pgadmin.org/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the web interface for pgAdmin, hosted under Apache HTTPD")
    (description "The web interface for pgAdmin, hosted under Apache HTTPD.  pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.")
    (home-page "https://www.pgadmin.org/")
    (license license:x11)))

(define-public qtforkawesome-qt6
  (package
    (name "qtforkawesome-qt6")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/qtforkawesome")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library that bundles ForkAwesome for use within Qt applications (using Qt 6)")
    (description "Library that bundles ForkAwesome for use within Qt applications (using Qt 6).")
    (home-page "https://github.com/Martchus/qtforkawesome")
    (license license:gpl2+)))

(define-public plasticscm-client-core
  (package
    (name "plasticscm-client-core")
    (version "11.0.16.9546")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.plasticscm.com/plastic-for-linux"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unity Version Control (formerly Plastic SCM) originally developed by Códic...")
    (description "Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Command line utilities).")
    (home-page "https://www.plasticscm.com/plastic-for-linux")
    (license license:expat)))

(define-public rocm-gfx120x-bin
  (package
    (name "rocm-gfx120x-bin")
    (version "7.12.0pre")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.amd.com"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "ROCm Core SDK and TheRock Build System - RDNA4")
    (description "ROCm Core SDK and TheRock Build System - RDNA4.")
    (home-page "http://www.amd.com")
    (license (license:non-copyleft "http://www.amd.com" "Custom license"))))

(define-public lib32-bluez-libs
  (package
    (name "lib32-bluez-libs")
    (version "5.79")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.bluez.org/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/" #:include-regexp ("\\.")))))
    (synopsis "deprecated libraries for the bluetooth protocol stack (32-bit)")
    (description "Deprecated libraries for the bluetooth protocol stack (32-bit).")
    (home-page "http://www.bluez.org/")
    (license license:lgpl2.1)))

(define-public python-google-generativeai
  (package
    (name "python-google-generativeai")
    (version "0.8.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google-gemini/generative-ai-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Google AI Python SDK for the Gemini API")
    (description "Google AI Python SDK for the Gemini API.")
    (home-page "https://github.com/google-gemini/generative-ai-python")
    (license license:asl2.0)))

(define-public vapoursynth-plugin-vsjetpack
  (package
    (name "vapoursynth-plugin-vsjetpack")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Jaded-Encoding-Thaumaturgy/vs-jetpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: vsjetpack")
    (description "Plugin for Vapoursynth: vsjetpack.")
    (home-page "https://github.com/Jaded-Encoding-Thaumaturgy/vs-jetpack")
    (license license:expat)))

(define-public android-sdk
  (package
    (name "android-sdk")
    (version "26.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.android.com/studio/releases/sdk-tools.html"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Google Android SDK")
    (description "Google Android SDK.")
    (home-page "https://developer.android.com/studio/releases/sdk-tools.html")
    (license (license:non-copyleft "https://developer.android.com/studio/releases/sdk-tools.html" "Custom license"))))

(define-public tl-render
  (package
    (name "tl-render")
    (version "0.16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grizzlypeak3d/tlRender")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tlRender is an open source library for building playback and review applic...")
    (description "tlRender is an open source library for building playback and review applications for visual effects, film, and animation.")
    (home-page "https://github.com/grizzlypeak3d/tlRender")
    (license license:bsd-3)))

(define-public kwin-povd
  (package
    (name "kwin-povd")
    (version "6.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://kde.org/plasma-desktop/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an easy to use, but flexible, Wayland compositor (patched for per-output v...")
    (description "An easy to use, but flexible, Wayland compositor (patched for per-output virtual desktops).")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:gpl3+)))

(define-public abacusai-bin
  (package
    (name "abacusai-bin")
    (version "1.106.21004")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/abacusai/deepagent-releases/releases/download/v" version "/deepagent-releases-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "a powerful desktop AI assistant with agentic browsing, listening, coding C...")
    (description "A powerful desktop AI assistant with agentic browsing, listening, coding CLI and editor.")
    (home-page "https://github.com/abacusai/deepagent-releases")
    (license (license:non-copyleft "https://github.com/abacusai/deepagent-releases" "Custom license"))))

(define-public adguardvpn-cli-bin
  (package
    (name "adguardvpn-cli-bin")
    (version "1.6.24")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://adguard-vpn.com/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "fast, flexible and reliable VPN solution for command-line enthusiasts")
    (description "Fast, flexible and reliable VPN solution for command-line enthusiasts.")
    (home-page "https://adguard-vpn.com/")
    (license license:expat)))

(define-public aeroshell-kwin-components-git
  (package
    (name "aeroshell-kwin-components-git")
    (version "6.6.3_36.r002e505")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aeroshell-desktop/aeroshell-kwin-components")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kWin effects, scripts, and other plugins for AeroShell-based desktops")
    (description "KWin effects, scripts, and other plugins for AeroShell-based desktops.")
    (home-page "https://github.com/aeroshell-desktop/aeroshell-kwin-components")
    (license license:agpl3+)))

(define-public aeroshell-workspace-git
  (package
    (name "aeroshell-workspace-git")
    (version "6.6.1_14.r2dff129")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aeroshell-desktop/aeroshell-workspace")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "various components required by AeroShell-based desktops")
    (description "Various components required by AeroShell-based desktops.")
    (home-page "https://github.com/aeroshell-desktop/aeroshell-workspace")
    (license license:agpl3+)))

(define-public aerothemeplasma-desktop-x11-git
  (package
    (name "aerothemeplasma-desktop-x11-git")
    (version "6.6.1_662.ra70f432")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aeroshell-desktop/aerothemeplasma")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "X11 session for AeroThemePlasma")
    (description "X11 session for AeroThemePlasma.")
    (home-page "https://github.com/aeroshell-desktop/aerothemeplasma")
    (license license:agpl3+)))

(define-public afx-bin
  (package
    (name "afx-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/babarot/afx/releases/download/v" version "/afx-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "an alternative, fast package manager for plugins and executable commands")
    (description "An alternative, fast package manager for plugins and executable commands.")
    (home-page "https://github.com/babarot/afx")
    (license license:expat)))

(define-public agent-sync-bin
  (package
    (name "agent-sync-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/GowayLee/agent-sync/releases/download/v" version "/agent-sync-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "a command-line tool that synchronizes multiple AI agent documentation files")
    (description "A command-line tool that synchronizes multiple AI agent documentation files.")
    (home-page "https://github.com/GowayLee/agent-sync")
    (license license:gpl3+)))

(define-public aggregate
  (package
    (name "aggregate")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ftp.isc.org/isc/aggregate/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool for aggregating CIDR IPv4 networks")
    (description "Tool for aggregating CIDR IPv4 networks.")
    (home-page "https://ftp.isc.org/isc/aggregate/")
    (license license:expat)))

(define-public ahab-bin
  (package
    (name "ahab-bin")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lance0/ahab/releases/download/v" version "/ahab-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "a Docker cleanup TUI - hunt down and harpoon unused Docker resources")
    (description "A Docker cleanup TUI - hunt down and harpoon unused Docker resources.")
    (home-page "https://github.com/lance0/ahab")
    (license license:expat)))

(define-public aic-bin
  (package
    (name "aic-bin")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/arimxyer/aic/releases/download/v" version "/aic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "CLI to fetch the latest changelogs for AI coding assistants")
    (description "CLI to fetch the latest changelogs for AI coding assistants.")
    (home-page "https://github.com/arimxyer/aic")
    (license license:expat)))

(define-public aider-chat-venv
  (package
    (name "aider-chat-venv")
    (version "0.83.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aider-AI/aider")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI pair programming in your terminal (installed with uv)")
    (description "AI pair programming in your terminal (installed with uv).")
    (home-page "https://github.com/Aider-AI/aider")
    (license license:asl2.0)))

(define-public airwindows-consolidated-bin
  (package
    (name "airwindows-consolidated-bin")
    (version "2026.04.01.7d6b9f3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.airwindows.com/consolidated/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "the entirety of the Airwindows collection as LV2, VST3, and CLAP")
    (description "The entirety of the Airwindows collection as LV2, VST3, and CLAP.")
    (home-page "https://www.airwindows.com/consolidated/")
    (license license:gpl3+)))

(define-public ali-instance-cli-bin
  (package
    (name "ali-instance-cli-bin")
    (version "1.2.0.81")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.alibabacloud.com/help/en/ecs/user-guide/connect-to-an-instance-by-using-ali-instance-cli/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "Alibaba Cloud Session Manager CLI for connecting to ECS instances without ...")
    (description "Alibaba Cloud Session Manager CLI for connecting to ECS instances without opening inbound ports or managing SSH keys.")
    (home-page "https://www.alibabacloud.com/help/en/ecs/user-guide/connect-to-an-instance-by-using-ali-instance-cli/")
    (license (license:non-copyleft "https://www.alibabacloud.com/help/en/ecs/user-guide/connect-to-an-instance-by-using-ali-instance-cli/" "Custom license"))))

(define-public amalgo-bin
  (package
    (name "amalgo-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Broderick-Westrope/amalgo/releases/download/v" version "/amalgo-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "CLI tool for creating single-file snapshots of multiple (code) files")
    (description "CLI tool for creating single-file snapshots of multiple (code) files.")
    (home-page "https://github.com/Broderick-Westrope/amalgo")
    (license license:gpl3+)))

(define-public ambit-bin
  (package
    (name "ambit-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/plamorg/ambit/releases/download/v" version "/ambit-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "dotfile manager written in Rust")
    (description "Dotfile manager written in Rust.")
    (home-page "https://github.com/plamorg/ambit")
    (license license:gpl3+)))

(define-public amd-vulkan-prefixes
  (package
    (name "amd-vulkan-prefixes")
    (version "3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/AndrewShark/amd-vulkan-prefixes")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "select needed vulkan implementation with vk_radv, vk_amdvlk or vk_pro prefix")
    (description "Select needed vulkan implementation with vk_radv, vk_amdvlk or vk_pro prefix.")
    (home-page "https://gitlab.com/AndrewShark/amd-vulkan-prefixes")
    (license license:gpl3+)))

(define-public amdctl
  (package
    (name "amdctl")
    (version "0.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kevinlekiller/amdctl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool for changing voltages and clock speeds for AMD processors")
    (description "Tool for changing voltages and clock speeds for AMD processors.")
    (home-page "https://github.com/kevinlekiller/amdctl")
    (license license:gpl3+)))

(define-public ansisvg-bin
  (package
    (name "ansisvg-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/wader/ansisvg/releases/download/v" version "/ansisvg-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "convert ANSI to SVG")
    (description "Convert ANSI to SVG.")
    (home-page "https://github.com/wader/ansisvg")
    (license license:expat)))

(define-public apipost-bin
  (package
    (name "apipost-bin")
    (version "8.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.apipost.cn/"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "apipost = Postman + Swagger + Mock + Jmeter")
    (description "Apipost = Postman + Swagger + Mock + Jmeter.")
    (home-page "https://www.apipost.cn/")
    (license (license:non-copyleft "https://www.apipost.cn/" "Custom license"))))

(define-public apple-cursor
  (package
    (name "apple_cursor")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ful1e5/apple_cursor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp ("\\.")))))
    (synopsis "opensource macOS cursors")
    (description "Opensource macOS cursors.")
    (home-page "https://github.com/ful1e5/apple_cursor")
    (license license:gpl3+)))

(define-public arad-fonts
  (package
    (name "arad-fonts")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MohamadDarvishi/Arad")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "arad - A multilingual, open-source font with 8 weights and 4 dot styles, s...")
    (description "Arad - A multilingual, open-source font with 8 weights and 4 dot styles, supporting Farsi, Arabic, Kurdish, Turkish, Urdu, and Mazerouni languages.")
    (home-page "https://github.com/MohamadDarvishi/Arad")
    (license license:expat)))

(define-public arattai-bin
  (package
    (name "arattai-bin")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.arattai.in"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "arattai - Secure messaging with your friends & family")
    (description "Arattai - Secure messaging with your friends & family.")
    (home-page "https://www.arattai.in")
    (license license:expat)))

(define-public argo-bin
  (package
    (name "argo-bin")
    (version "4.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/argoproj/argo-workflows/releases/download/v" version "/argo-workflows-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "Argo Workflows: Get stuff done with Kubernetes")
    (description "Argo Workflows: Get stuff done with Kubernetes.")
    (home-page "https://github.com/argoproj/argo-workflows")
    (license license:asl2.0)))

(define-public art-standalone
  (package
    (name "art_standalone")
    (version "r213.35696d99")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/android_translation_layer/art_standalone")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a standalone version of Dalvik with Art built in")
    (description "A standalone version of Dalvik with Art built in.")
    (home-page "https://gitlab.com/android_translation_layer/art_standalone")
    (license license:asl2.0)))

(define-public artisan-roaster-scope
  (package
    (name "artisan-roaster-scope")
    (version "3.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/artisan-roaster-scope/artisan")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "artisan is a software that helps coffee roasters record, analyze, and cont...")
    (description "Artisan is a software that helps coffee roasters record, analyze, and control roast profiles.")
    (home-page "https://github.com/artisan-roaster-scope/artisan")
    (license license:gpl3+)))

(define-public assh-bin
  (package
    (name "assh-bin")
    (version "2.17.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/moul/assh/releases/download/v" version "/assh-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "make your ssh client smarter")
    (description "make your ssh client smarter.")
    (home-page "https://github.com/moul/assh")
    (license license:expat)))

(define-public atl-gui-git
  (package
    (name "atl-gui-git")
    (version "0.1.0.r36.193e85e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/os-guy/atl-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a sleek, modern GTK4 graphical user interface for Android Translation Laye...")
    (description "A sleek, modern GTK4 graphical user interface for Android Translation Layer (Git Version).")
    (home-page "https://github.com/os-guy/atl-gui")
    (license license:gpl3+)))

(define-public audacity4-alpha
  (package
    (name "audacity4-alpha")
    (version "4.0.0_alpha2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/audacity/audacity")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "audacity 4")
    (description "Audacity 4.0.0 Alpha 2 (AppImage).")
    (home-page "https://github.com/audacity/audacity")
    (license license:gpl3+)))

(define-public audiobookconverter-bin
  (package
    (name "audiobookconverter-bin")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/yermak/AudioBookConverter/releases/download/v" version "/AudioBookConverter-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "improved AudioBookConverter based on freeipodsoftware release (mp3 to m4b ...")
    (description "Improved AudioBookConverter based on freeipodsoftware release (mp3 to m4b converter).")
    (home-page "https://github.com/yermak/AudioBookConverter")
    (license license:gpl2)))

(define-public auth0-bin
  (package
    (name "auth0-bin")
    (version "1.26.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/auth0/auth0-cli/releases/download/v" version "/auth0-cli-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "auth0 is the command line to supercharge your development workflow")
    (description "auth0 is the command line to supercharge your development workflow.")
    (home-page "https://github.com/auth0/auth0-cli")
    (license license:expat)))

(define-public authelia-bin
  (package
    (name "authelia-bin")
    (version "4.39.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/authelia/authelia/releases/download/v" version "/authelia-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "the Cloud ready multi-factor authentication portal for your Apps")
    (description "The Cloud ready multi-factor authentication portal for your Apps.  Pre-compiled.")
    (home-page "https://github.com/authelia/authelia")
    (license license:asl2.0)))

(define-public auto-mcs-bin
  (package
    (name "auto-mcs-bin")
    (version "2.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/macarooni-man/auto-mcs/releases/download/v" version "/auto-mcs-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "cross-platform Minecraft server manager")
    (description "Cross-platform Minecraft server manager.")
    (home-page "https://github.com/macarooni-man/auto-mcs")
    (license license:gpl3+)))

(define-public aws-nuke-bin
  (package
    (name "aws-nuke-bin")
    (version "3.64.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ekristen/aws-nuke/releases/download/v" version "/aws-nuke-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "nuke a whole AWS account and delete all its resources")
    (description "Nuke a whole AWS account and delete all its resources.")
    (home-page "https://github.com/ekristen/aws-nuke")
    (license license:expat)))

(define-public azd-cli
  (package
    (name "azd-cli")
    (version "1.23.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Azure/azure-dev")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a developer CLI for working with Azure resources to build and deploy AI ap...")
    (description "A developer CLI for working with Azure resources to build and deploy AI applications.")
    (home-page "https://github.com/Azure/azure-dev")
    (license license:expat)))

(define-public bab-bin
  (package
    (name "bab-bin")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bab-sh/bab/releases/download/v" version "/bab-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.")))))
    (synopsis "task runner for defining project commands in YAML")
    (description "Task runner for defining project commands in YAML.")
    (home-page "https://github.com/bab-sh/bab")
    (license license:expat)))
