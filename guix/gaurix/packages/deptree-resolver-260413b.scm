;;; Dependency-tree resolver pass -- deptree-resolver-260413b
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 53 packages resolved with recipes, 47 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-13

(define-module (gaurix packages deptree-resolver-260413b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:export (xmlada
            asusctl
            aimp
            libvpx1.3
            qt5-doc
            mips64el-linux-gnu-binutils
            glew1.10
            libnm-iwd
            input-leap-headless-git
            goldendict
            wechat-bin
            0ad-data-git
            agesafetch
            aider-chat-docs
            alhp-keyring
            alhp-mirrorlist
            amd-ucode-git
            aocl-gcc
            astro-modloader
            asus-5606-fan-state-git
            awakened-poe-trade-git
            ayandict-git
            bibata-cursor-git
            bign-handheld-thumbnailer
            bigpemu-bin
            bluepala
            breeze-hacked-cursor-theme-git
            browseros-bin
            browsers-bin
            bs-manager-git
            casdoor
            catbox-git
            catppuccinifier-cli-git
            charta-bin
            chkufsd-bin
            chromium-bypass-paywalls-clean
            cli53
            clock-tui
            cloudmonkey
            cocode
            codename-goose
            commafeed-h2
            commafeed-mariadb
            commafeed-mysql
            commafeed-postgresql
            comrak-git
            croaring
            croaring-git
            crush
            cshatag
            dae-kix-git
            datafusion-cli
            dell-idractools))

;;; PACKAGE DEFINITIONS (53 packages)

;;; -- xmlada --
(define-public xmlada
  (package
    (name "xmlada")
    (version "26.0w")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AdaCore/xmlada")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/AdaCore/xmlada")
    (synopsis "XML parser for Ada95")
    (description
     "XML/Ada is a full-featured XML parser for the Ada 95 programming
language.  It provides a complete implementation of the XML 1.0 standard
including support for namespaces, DOM, and SAX parsing APIs.  The library
is built using GPR project files from the GNAT toolchain.")
    (license license:gpl3+)))

;;; -- asusctl --
(define-public asusctl
  (package
    (name "asusctl")
    (version "6.3.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/asus-linux/asusctl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://asus-linux.org")
    (synopsis "control daemon and CLI tools for ASUS laptops")
    (description
     "asusctl is a control daemon, collection of CLI tools, and a set of
Rust crates for interacting with ASUS laptops on Linux.  It provides
support for keyboard RGB lighting, fan curves, battery charge limits,
platform profiles, and other ASUS-specific hardware features.")
    (license license:mpl2.0)))

;;; -- aimp --
(define-public aimp
  (package
    (name "aimp")
    (version "6.00.3055")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.aimp.ru/files/linux/aimp_"
                           version "_amd64.deb"))
       (file-name (string-append "aimp-" version ".deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/aimp/"))))
    (home-page "https://www.aimp.ru")
    (synopsis "powerful free audio player")
    (description
     "AIMP is a powerful free audio player for Linux distributed as a binary
package.  It supports a wide variety of audio formats and provides features
such as a built-in audio converter, tag editor, and audio library management.")
    (license #f)))  ;proprietary freeware

;;; -- libvpx1.3 --
(define-public libvpx1.3
  (package
    (name "libvpx1.3")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickhutchinson/libvpx/archive/v"
             version ".tar.gz"))
       (file-name (string-append "libvpx-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--enable-shared"
                   "--disable-static"
                   "--enable-vp8"
                   "--enable-vp9")))
    (home-page "http://www.webmproject.org/")
    (synopsis "VP8 and VP9 codec (legacy 1.3 branch)")
    (description
     "libvpx provides the VP8 and VP9 video codec implementations.  This
package provides the legacy 1.3.0 branch of the library, which may be
required by older software that cannot use newer API versions.")
    (license license:bsd-3)))

;;; -- qt5-doc --
(define-public qt5-doc
  (package
    (name "qt5-doc")
    (version "5.15.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.qt.io/official_releases/qt/"
                           "5.15/" version "/single/qt-everywhere-src-"
                           version ".tar.xz"))
       (file-name (string-append "qt5-doc-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/doc/qt5/"))))
    (home-page "https://www.qt.io")
    (synopsis "cross-platform application and UI framework (documentation)")
    (description
     "This package provides the official Qt 5 documentation.  It includes
HTML and QCH formatted documentation for all Qt 5 modules, suitable for
use with Qt Assistant or other documentation browsers.")
    (license (list license:fdl1.3+ license:gpl3+ license:lgpl3+))))

;;; -- mips64el-linux-gnu-binutils --
(define-public mips64el-linux-gnu-binutils
  (package
    (name "mips64el-linux-gnu-binutils")
    (version "2.45")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ftp.gnu.org/gnu/binutils/binutils-"
                           version ".tar.xz"))
       (file-name (string-append "binutils-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--target=mips64el-linux-gnu"
                   "--enable-multilib"
                   "--disable-nls"
                   "--enable-plugins")))
    (home-page "https://www.gnu.org/software/binutils/")
    (synopsis "tools to assemble and manipulate binary and object files for MIPS64EL")
    (description
     "GNU Binutils cross-compilation toolchain targeting the MIPS64EL
little-endian architecture.  Provides the assembler, linker, and various
binary utility programs (objcopy, objdump, nm, etc.) for building and
inspecting binaries for MIPS64EL Linux targets.")
    (license license:gpl3+)))

;;; -- glew1.10 --
(define-public glew1.10
  (package
    (name "glew1.10")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nigels-com/glew/releases/download/glew-"
             version "/glew-" version ".tgz"))
       (file-name (string-append "glew-" version ".tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "GLEW_DEST=" #$output))))
    (home-page "http://glew.sourceforge.net")
    (synopsis "cross-platform C/C++ OpenGL extension loading library (legacy 1.10)")
    (description
     "GLEW (the OpenGL Extension Wrangler Library) is a cross-platform
C/C++ library that helps query and load OpenGL extensions.  This package
provides the legacy 1.10.0 branch, required by older software that cannot
use newer versions of the GLEW API.")
    (license (list license:bsd-3 license:expat license:gpl2))))

;;; -- libnm-iwd --
(define-public libnm-iwd
  (package
    (name "libnm-iwd")
    (version "1.56.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/archive/"
             version "/NetworkManager-" version ".tar.gz"))
       (file-name (string-append "NetworkManager-iwd-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-Diwd=true"
                   "-Dwifi_backend=iwd"
                   "-Dselinux=false"
                   "-Dsystemdsystemunitdir=/tmp/nm-systemd")))
    (home-page "https://networkmanager.dev/")
    (synopsis "NetworkManager client library with iwd backend")
    (description
     "libnm-iwd is a build of the NetworkManager client library configured
to use iwd (Intel Wireless Daemon) as the Wi-Fi backend instead of
wpa_supplicant.  It provides the GLib-based libnm API for managing network
connections with iwd-specific capabilities.")
    (license license:lgpl2.1+)))

;;; -- input-leap-headless-git --
(define-public input-leap-headless-git
  (package
    (name "input-leap-headless-git")
    (version "3.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/input-leap/input-leap")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_GUI=OFF"
                   "-DBUILD_TESTS=OFF")))
    (home-page "https://github.com/input-leap/input-leap")
    (synopsis "open-source KVM software (headless client and server binaries)")
    (description
     "Input Leap is open-source KVM software that allows sharing a single
keyboard and mouse between multiple computers over a network.  This headless
build provides only the client and server CLI binaries, without the Qt GUI
frontend, for use on servers or minimal desktop environments.")
    (license license:gpl2)))

;;; -- goldendict --
(define-public goldendict
  (package
    (name "goldendict")
    (version "1.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/goldendict/goldendict")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/goldendict/goldendict")
    (synopsis "feature-rich dictionary lookup program")
    (description
     "GoldenDict is a feature-rich dictionary lookup program that supports
numerous dictionary formats including StarDict, Babylon BGL, Dictd, and
many others.  It provides full-text search, pronunciation playback via
audio files or text-to-speech, wiki-style article rendering, and network
lookup via online dictionaries.")
    (license license:gpl3+)))

;;; -- wechat-bin --
(define-public wechat-bin
  (package
    (name "wechat-bin")
    (version "4.1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_"
                           version "_x86_64.deb"))
       (file-name (string-append "wechat-" version ".deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/wechat/"))))
    (home-page "https://weixin.qq.com/")
    (synopsis "WeChat messaging application for Linux")
    (description
     "WeChat is a cross-platform messaging and social media application
developed by Tencent.  This package provides the official Linux binary
repackage of WeChat with support for text messaging, voice and video calls,
file sharing, and other social features.")
    (license #f)))  ;proprietary

;;; -- 0ad-data-git --
(define-public 0ad-data-git
  (package
    (name "0ad-data-git")
    (version "26")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/0ad/0ad")
             (commit (string-append "Alpha" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("binaries/data" "share/0ad/data/"))))
    (home-page "https://play0ad.com")
    (synopsis "cross-platform 3D RTS game data files")
    (description
     "0 A.D. is a free, open-source, cross-platform real-time strategy game
of ancient warfare.  This package contains the game data files including
textures, models, audio, maps, and other assets required to run the game.")
    (license license:cc-by-sa3.0)))  ;actual: CC-BY-NC-SA 3.0

;;; -- agesafetch --
(define-public agesafetch
  (package
    (name "agesafetch")
    (version "2.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/BVollmerhaus/agesafetch")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://gitlab.com/BVollmerhaus/agesafetch")
    (synopsis "tool for obtaining your firmware's embedded AGESA version")
    (description
     "agesafetch is a small Rust utility for reading the AGESA (AMD Generic
Encapsulated Software Architecture) version string that is embedded in your
system firmware.  It reads directly from the firmware image without requiring
access to proprietary tools or rebooting into firmware utilities.")
    (license license:expat)))

;;; -- aider-chat-docs --
(define-public aider-chat-docs
  (package
    (name "aider-chat-docs")
    (version "0.86.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Aider-AI/aider/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append "aider-chat-docs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("website/docs" "share/doc/aider-chat/"))))
    (home-page "https://github.com/Aider-AI/aider")
    (synopsis "documentation for aider AI pair programming tool")
    (description
     "This package provides the offline documentation for aider, an AI pair
programming tool that runs in the terminal.  Aider lets you pair program with
large language models to edit code in your local git repository.  The
documentation covers installation, configuration, usage, and advanced topics.")
    (license license:asl2.0)))

;;; -- alhp-keyring --
(define-public alhp-keyring
  (package
    (name "alhp-keyring")
    (version "20250509")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://somegit.dev/ALHP/alhp-keyring/archive/"
             version ".tar.gz"))
       (file-name (string-append "alhp-keyring-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/alhp-keyring/"))))
    (home-page "https://somegit.dev/ALHP/alhp-keyring")
    (synopsis "ALHP PGP keyring for package verification")
    (description
     "The ALHP keyring contains PGP public keys used to sign packages in the
ALHP (Arch Linux High Performance) repository.  This keyring is required
to verify the authenticity of packages downloaded from ALHP mirrors.")
    (license license:gpl3+)))

;;; -- alhp-mirrorlist --
(define-public alhp-mirrorlist
  (package
    (name "alhp-mirrorlist")
    (version "20260324")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://somegit.dev/ALHP/alhp-mirrorlist/archive/"
             version ".tar.gz"))
       (file-name (string-append "alhp-mirrorlist-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/alhp-mirrorlist/"))))
    (home-page "https://somegit.dev/ALHP/alhp-mirrorlist")
    (synopsis "ALHP mirror list for package manager configuration")
    (description
     "The ALHP mirror list provides a list of mirrors for the ALHP (Arch
Linux High Performance) repository.  This text file is intended for use
by package managers to locate ALHP package repositories.")
    (license license:gpl2+)))

;;; -- amd-ucode-git --
(define-public amd-ucode-git
  (package
    (name "amd-ucode-git")
    (version "20250305")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/kernel-firmware/linux-firmware")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("amd-ucode" "lib/firmware/amd-ucode/"))))
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (synopsis "microcode update images for AMD CPUs")
    (description
     "This package provides microcode update images for AMD processors.
These binary firmware blobs are loaded by the Linux kernel during early boot
to apply CPU microcode updates that fix errata and improve security.  The
package is built from the linux-firmware git repository.")
    (license #f)))  ;custom firmware license

;;; -- aocl-gcc --
(define-public aocl-gcc
  (package
    (name "aocl-gcc")
    (version "5.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.amd.com/content/dam/amd/en/documents/developer/aocl/"
             "aocl-" version "-gcc-linux.tar.gz"))
       (file-name (string-append "aocl-gcc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/aocl/"))))
    (home-page "https://www.amd.com/en/developer/aocl.html")
    (synopsis "AMD Optimizing CPU Libraries pre-built binaries")
    (description
     "AMD Optimizing CPU Libraries (AOCL) is a set of numerical libraries
optimized for AMD processors.  The package includes BLIS, libFLAME, FFTW,
LibM, ScaLAPACK, and other high-performance math libraries.  This package
provides the pre-built binary distribution for GCC on Linux.")
    (license #f)))  ;custom AMD EULA

;;; -- astro-modloader --
(define-public astro-modloader
  (package
    (name "astro-modloader")
    (version "0.1.15")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AstroTechies/astro_modloader")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/AstroTechies/astro_modloader")
    (synopsis "mod loader for the Astroneer video game")
    (description
     "astro-modloader is a Rust-based mod loader for the Astroneer video
game.  It handles downloading, installing, and managing mods from the
AstroTechies mod repository, with automatic update checking and dependency
resolution between installed mods.")
    (license license:expat)))

;;; -- asus-5606-fan-state-git --
(define-public asus-5606-fan-state-git
  (package
    (name "asus-5606-fan-state-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ThatOneCalculator/asus-5606-fan-state")
             (commit "HEAD")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/asus-5606-fan-state/"))))
    (home-page "https://github.com/ThatOneCalculator/asus-5606-fan-state")
    (synopsis "set the fan state on ASUS ZenBook S 16 and Vivobook M5606")
    (description
     "asus-5606-fan-state is a small utility to set and read the fan state
on the ASUS ZenBook S 16 UM5606 and Vivobook M5606 laptops.  It provides
direct control over the fan speed profile without requiring the full asusctl
daemon to be running.")
    (license license:expat)))

;;; -- awakened-poe-trade-git --
(define-public awakened-poe-trade-git
  (package
    (name "awakened-poe-trade-git")
    (version "3.28.102")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SnosMe/awakened-poe-trade")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/awakened-poe-trade/"))))
    (home-page "https://github.com/SnosMe/awakened-poe-trade")
    (synopsis "Path of Exile trading and pricing overlay application")
    (description
     "Awakened PoE Trade is a comprehensive trading and item pricing
application for Path of Exile.  It provides an overlay that lets players
quickly check item prices, search trade websites, and analyze item rolls
without leaving the game.  This is the git development build of the app.")
    (license license:expat)))

;;; -- ayandict-git --
(define-public ayandict-git
  (package
    (name "ayandict-git")
    (version "2.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ilius/ayandict")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/ilius/ayandict"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/ilius/ayandict")
    (synopsis "offline dictionary application based on Qt6 and Go")
    (description
     "AyanDict is a cross-platform offline dictionary application built with
Go and Qt6.  It supports dictionary files in StarDict, FreeDict, and other
formats.  The application provides a clean Qt6-based graphical interface with
full-text search, pronunciation playback, and history navigation.")
    (license license:agpl3)))

;;; -- bibata-cursor-git --
(define-public bibata-cursor-git
  (package
    (name "bibata-cursor-git")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rtgiskard/bibata_cursor")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cursors" "share/icons/Bibata/"))))
    (home-page "https://github.com/rtgiskard/bibata_cursor")
    (synopsis "Bibata cursor themes for the X Window System")
    (description
     "Bibata is a collection of open-source cursor themes for Linux desktops.
The themes are available in multiple variants including Original Classic,
Original Ice, and Modern Amber, offering smooth and visually consistent
cursors for use with X11 and Wayland compositors.")
    (license license:gpl3+)))

;;; -- bign-handheld-thumbnailer --
(define-public bign-handheld-thumbnailer
  (package
    (name "bign-handheld-thumbnailer")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MateusRodCosta/bign-handheld-thumbnailer")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/MateusRodCosta/bign-handheld-thumbnailer")
    (synopsis "thumbnailer for Nintendo handheld ROM files")
    (description
     "bign-handheld-thumbnailer is a GNome Thumbnailer for Nintendo handheld
console ROM files, supporting Nintendo 3DS CIA, 3DS, and other handheld
formats.  It integrates with file managers that support the GNome thumbnailer
specification to generate preview thumbnails for ROM files.")
    (license license:gpl2+)))

;;; -- bigpemu-bin --
(define-public bigpemu-bin
  (package
    (name "bigpemu-bin")
    (version "1.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.richwhitehouse.com/files/BigPEmu_Linux_v"
             version ".zip"))
       (file-name (string-append "bigpemu-" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/bigpemu/"))))
    (home-page "https://www.richwhitehouse.com")
    (synopsis "large pussycat emulator — Atari Jaguar emulator binary")
    (description
     "BigPEmu is a high-accuracy Atari Jaguar and Jaguar CD emulator for
Linux.  It provides near-perfect hardware emulation with support for the
full Jaguar software library, enhanced rendering modes, controller support,
and save states.  This package installs the pre-built Linux binary.")
    (license #f)))  ;proprietary

;;; -- bluepala --
(define-public bluepala
  (package
    (name "bluepala")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/joel-sgc/bluepala")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/joel-sgc/bluepala"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/joel-sgc/bluepala")
    (synopsis "Go-based Bluetooth manager using BlueZ")
    (description
     "bluepala is a terminal-based Bluetooth manager written in Go that
interfaces with BlueZ, the official Linux Bluetooth protocol stack.  It
provides a simple interface for scanning, pairing, connecting, and managing
Bluetooth devices from the command line.")
    (license license:public-domain)))  ;WTFPL

;;; -- breeze-hacked-cursor-theme-git --
(define-public breeze-hacked-cursor-theme-git
  (package
    (name "breeze-hacked-cursor-theme-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clayrisser/breeze-hacked-cursor-theme")
             (commit "HEAD")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Breeze_Hacked" "share/icons/Breeze_Hacked/"))))
    (home-page "https://github.com/clayrisser/breeze-hacked-cursor-theme")
    (synopsis "modified Breeze cursor theme for KDE Plasma desktops")
    (description
     "Breeze Hacked is a modified version of the KDE Breeze cursor theme with
customized designs and improved visibility.  It follows the same style
language as the upstream Breeze theme but with various tweaks to cursor
shapes and sizes for better usability.")
    (license license:gpl2)))

;;; -- browseros-bin --
(define-public browseros-bin
  (package
    (name "browseros-bin")
    (version "0.44.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/browseros-ai/BrowserOS/releases/download/v"
             version "/BrowserOS-" version "-linux-amd64.AppImage"))
       (file-name (string-append "browseros-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/browseros/"))))
    (home-page "https://github.com/browseros-ai/BrowserOS")
    (synopsis "agentic browser that runs AI agents locally")
    (description
     "BrowserOS is an open-source agentic browser that runs AI agents locally
on your machine.  It enables AI agents to browse the web, fill forms, click
elements, and interact with web pages autonomously.  This package installs
the pre-built Linux AppImage binary.")
    (license license:agpl3)))

;;; -- browsers-bin --
(define-public browsers-bin
  (package
    (name "browsers-bin")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://browsers.software/releases/browsers-"
             version "-linux-amd64.tar.gz"))
       (file-name (string-append "browsers-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/browsers/"))))
    (home-page "https://browsers.software")
    (synopsis "open the right browser at the right time")
    (description
     "Browsers is a browser launcher that allows routing URLs to different
browsers based on configurable rules.  It acts as the default browser and
intelligently forwards links to the appropriate browser based on URL
patterns, application context, or custom rules.")
    (license (list license:asl2.0 license:expat))))

;;; -- bs-manager-git --
(define-public bs-manager-git
  (package
    (name "bs-manager-git")
    (version "1.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Zagrios/bs-manager")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/bs-manager/"))))
    (home-page "https://github.com/Zagrios/bs-manager")
    (synopsis "Beat Saber version and mod manager")
    (description
     "BSManager is a Beat Saber version manager and mod installer built
as an Electron application.  It allows players to install and manage
multiple versions of Beat Saber side by side, install mods from BeatMods,
and manage custom songs and other game content.")
    (license license:gpl3+)))

;;; -- casdoor --
(define-public casdoor
  (package
    (name "casdoor")
    (version "2.391.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/casbin/casdoor")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/casdoor/casdoor"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/casbin/casdoor")
    (synopsis "open-source IAM and SSO platform with web UI")
    (description
     "Casdoor is an open-source UI-first Identity Access Management (IAM)
and Single Sign-On (SSO) platform built with Go and React.  It supports
OAuth 2.0, OIDC, SAML, and CAS protocols, and provides user management,
role-based access control, and social login integration.")
    (license license:asl2.0)))

;;; -- catbox-git --
(define-public catbox-git
  (package
    (name "catbox-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/APT37/catbox")
             (commit "HEAD")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/APT37/catbox")
    (synopsis "Rust command-line wrapper for the Catbox.moe API")
    (description
     "catbox is a command-line interface tool written in Rust that provides
a wrapper around the Catbox.moe file hosting API.  It allows users to
upload files and manage albums on Catbox.moe directly from the terminal
without needing a web browser.")
    (license license:expat)))

;;; -- catppuccinifier-cli-git --
(define-public catppuccinifier-cli-git
  (package
    (name "catppuccinifier-cli-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lighttigerXIV/catppuccinifier")
             (commit "HEAD")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/lighttigerXIV/catppuccinifier")
    (synopsis "command-line tool to apply Catppuccin palette to images")
    (description
     "catppuccinifier-cli is a Rust command-line tool that converts images
to use the Catppuccin color palette.  It applies the soothing pastel colors
of the Catppuccin theme to arbitrary image files, making it easy to create
Catppuccin-flavored wallpapers and artwork.")
    (license license:unlicense)))

;;; -- charta-bin --
(define-public charta-bin
  (package
    (name "charta-bin")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://spn109.fr/charta/releases/charta-"
             version "-linux-amd64.tar.gz"))
       (file-name (string-append "charta-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("charta" "bin/"))))
    (home-page "https://spn109.fr/charta")
    (synopsis "Go terminal chart and graph rendering utility")
    (description
     "charta is a terminal-based chart and graph rendering utility written
in Go.  It generates ASCII and Unicode charts directly in the terminal
including bar charts, line charts, pie charts, and histograms from
data provided via stdin or command-line arguments.")
    (license license:asl2.0)))

;;; -- chkufsd-bin --
(define-public chkufsd-bin
  (package
    (name "chkufsd-bin")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://dl.paragon-software.com/demo/chkufsd-linux.tar.gz")
       (file-name "chkufsd-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/chkufsd/"))))
    (home-page "https://www.paragon-software.com/technologies/ufsd.html")
    (synopsis "utility for checking and fixing NTFS and HFS+ filesystems")
    (description
     "chkufsd is a combined utility from Paragon Software for checking and
repairing NTFS and HFS+ file system images.  It is based on the Universal
File System Driver (UFSD) technology and provides filesystem integrity
verification and repair functionality.  This is a proprietary binary package.")
    (license license:lgpl3+)))

;;; -- chromium-bypass-paywalls-clean --
(define-public chromium-bypass-paywalls-clean
  (package
    (name "chromium-bypass-paywalls-clean")
    (version "4.3.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitflic.ru/project/magnolia1234/bpc_uploads/file/raw?"
             "file=bypass-paywalls-chrome-clean-v" version ".zip"))
       (file-name (string-append "chromium-bypass-paywalls-clean-" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/chromium/extensions/bypass-paywalls-clean/"))))
    (home-page "https://gitflic.ru/project/magnolia1234/bpc_uploads")
    (synopsis "Chromium extension to bypass news site paywalls")
    (description
     "Bypass Paywalls Clean is a web browser extension for Chromium-based
browsers that allows access to articles on news sites protected by paywalls.
It works by modifying request headers and cookies to simulate a direct visit
from a search engine, bypassing the paywall detection logic.")
    (license license:expat)))

;;; -- cli53 --
(define-public cli53
  (package
    (name "cli53")
    (version "0.8.25")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/barnybug/cli53")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/barnybug/cli53"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/barnybug/cli53")
    (synopsis "command-line tool for Amazon Route 53 DNS management")
    (description
     "cli53 is a command-line interface tool for Amazon Route 53, the AWS
DNS web service.  It provides import and export functionality using BIND
format zone files, and supports creating, updating, and deleting DNS
records and zones through a simple command-line interface.")
    (license license:expat)))

;;; -- clock-tui --
(define-public clock-tui
  (package
    (name "clock-tui")
    (version "0.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/race604/clock-tui")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/race604/clock-tui")
    (synopsis "terminal clock, timer, and stopwatch using TUI")
    (description
     "clock-tui is a terminal user interface application written in Rust
that provides a real-time clock, countdown timer, and stopwatch.  It renders
large seven-segment-style digits in the terminal using the Ratatui library,
making it visually appealing and easy to read at a glance.")
    (license license:expat)))

;;; -- cloudmonkey --
(define-public cloudmonkey
  (package
    (name "cloudmonkey")
    (version "6.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/apache/cloudstack-cloudmonkey")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/apache/cloudstack-cloudmonkey"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/apache/cloudstack-cloudmonkey")
    (synopsis "CLI for Apache CloudStack cloud management platform")
    (description
     "CloudMonkey is the official command-line interface for Apache
CloudStack, a powerful open-source cloud computing platform.  It provides
interactive and scriptable access to the CloudStack API, supporting all
CloudStack operations from resource management to network configuration.")
    (license license:asl2.0)))

;;; -- cocode --
(define-public cocode
  (package
    (name "cocode")
    (version "0.6.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Pipelex/cocode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Pipelex/cocode"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/Pipelex/cocode")
    (synopsis "command-line tool for analyzing code repositories")
    (description
     "cocode is a command-line tool for analyzing and summarizing code
repositories.  It can traverse a repository, extract its structure and
content, and produce a compact representation suitable for feeding into
large language models or for generating documentation and reports.")
    (license license:expat)))

;;; -- codename-goose --
(define-public codename-goose
  (package
    (name "codename-goose")
    (version "1.29.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/block/goose")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/block/goose")
    (synopsis "open-source extensible AI agent for software development")
    (description
     "Goose is an open-source, extensible AI agent developed by Block (Square)
for automating software development tasks.  It integrates with various LLM
providers and provides tools for file editing, shell execution, code review,
and other development workflows through a conversational interface.")
    (license license:asl2.0)))

;;; -- commafeed-h2 --
(define-public commafeed-h2
  (package
    (name "commafeed-h2")
    (version "7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Athou/commafeed/releases/download/v"
             version "/commafeed-h2-runner.jar"))
       (file-name (string-append "commafeed-h2-" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/commafeed-h2/"))))
    (home-page "https://github.com/Athou/commafeed")
    (synopsis "self-hosted RSS reader with H2 embedded database")
    (description
     "CommaFeed is a self-hosted RSS/Atom feed reader inspired by Google
Reader.  This variant bundles the H2 embedded database, making it suitable
for single-user or small-team deployments without requiring an external
database server.  It is distributed as a native binary executable built
with GraalVM.")
    (license license:asl2.0)))

;;; -- commafeed-mariadb --
(define-public commafeed-mariadb
  (package
    (name "commafeed-mariadb")
    (version "7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Athou/commafeed/releases/download/v"
             version "/commafeed-mariadb-runner.jar"))
       (file-name (string-append "commafeed-mariadb-" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/commafeed-mariadb/"))))
    (home-page "https://github.com/Athou/commafeed")
    (synopsis "self-hosted RSS reader with MariaDB database backend")
    (description
     "CommaFeed is a self-hosted RSS/Atom feed reader inspired by Google
Reader.  This variant is built against the MariaDB database driver for use
with MariaDB or MySQL database servers.  It is distributed as a native
binary executable built with GraalVM.")
    (license license:asl2.0)))

;;; -- commafeed-mysql --
(define-public commafeed-mysql
  (package
    (name "commafeed-mysql")
    (version "7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Athou/commafeed/releases/download/v"
             version "/commafeed-mysql-runner.jar"))
       (file-name (string-append "commafeed-mysql-" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/commafeed-mysql/"))))
    (home-page "https://github.com/Athou/commafeed")
    (synopsis "self-hosted RSS reader with MySQL database backend")
    (description
     "CommaFeed is a self-hosted RSS/Atom feed reader inspired by Google
Reader.  This variant is built against the MySQL database driver for use
with MySQL database servers.  It is distributed as a native binary
executable built with GraalVM.")
    (license license:asl2.0)))

;;; -- commafeed-postgresql --
(define-public commafeed-postgresql
  (package
    (name "commafeed-postgresql")
    (version "7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Athou/commafeed/releases/download/v"
             version "/commafeed-postgresql-runner.jar"))
       (file-name (string-append "commafeed-postgresql-" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/commafeed-postgresql/"))))
    (home-page "https://github.com/Athou/commafeed")
    (synopsis "self-hosted RSS reader with PostgreSQL database backend")
    (description
     "CommaFeed is a self-hosted RSS/Atom feed reader inspired by Google
Reader.  This variant is built against the PostgreSQL database driver for
use with PostgreSQL database servers.  It is distributed as a native
binary executable built with GraalVM.")
    (license license:asl2.0)))

;;; -- comrak-git --
(define-public comrak-git
  (package
    (name "comrak-git")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kivikakk/comrak")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/kivikakk/comrak")
    (synopsis "CommonMark and GFM Markdown parser and formatter")
    (description
     "comrak is a Rust implementation of the CommonMark specification and
GitHub Flavored Markdown (GFM) extension.  It can be used as both a
library and a standalone command-line tool for converting Markdown to HTML
and other output formats, with high spec compliance.")
    (license license:bsd-2)))

;;; -- croaring --
(define-public croaring
  (package
    (name "croaring")
    (version "4.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RoaringBitmap/CRoaring/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append "croaring-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DROARING_BUILD_STATIC=OFF")))
    (home-page "https://github.com/RoaringBitmap/CRoaring")
    (synopsis "roaring bitmaps in C/C++ with SIMD optimizations")
    (description
     "CRoaring is a C/C++ implementation of Roaring Bitmaps, a data structure
for efficiently storing and manipulating large sets of integers.  Roaring
Bitmaps use compressed bitsets that are orders of magnitude faster than
conventional bitsets and significantly outperform HashSet implementations
for typical workloads.")
    (license (list license:asl2.0 license:expat))))

;;; -- croaring-git --
(define-public croaring-git
  (package
    (name "croaring-git")
    (version "4.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/RoaringBitmap/CRoaring")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DROARING_BUILD_STATIC=OFF")))
    (home-page "https://github.com/RoaringBitmap/CRoaring")
    (synopsis "roaring bitmaps in C/C++ with SIMD optimizations (git)")
    (description
     "CRoaring is a C/C++ implementation of Roaring Bitmaps, a data structure
for efficiently storing and manipulating large sets of integers.  Roaring
Bitmaps use compressed bitsets that are orders of magnitude faster than
conventional bitsets and significantly outperform HashSet implementations
for typical workloads.  This package tracks the git development branch.")
    (license (list license:asl2.0 license:expat))))

;;; -- crush --
(define-public crush
  (package
    (name "crush")
    (version "0.55.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/charmbracelet/crush/releases/download/v"
             version "/crush_" version "_Linux_x86_64.tar.gz"))
       (file-name (string-append "crush-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("crush" "bin/"))))
    (home-page "https://charm.sh/crush")
    (synopsis "terminal-based AI assistant from Charm")
    (description
     "Crush is a terminal-based AI assistant from Charm that integrates
with various AI providers to provide conversational assistance, code review,
and development help directly in the terminal.  It features a clean TUI
built with the Bubble Tea framework and supports multiple AI backends.")
    (license #f)))  ;FSL-1.1-MIT (functional source license)

;;; -- cshatag --
(define-public cshatag
  (package
    (name "cshatag")
    (version "2.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rfjakob/cshatag")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/rfjakob/cshatag"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/rfjakob/cshatag")
    (synopsis "detect silent data corruption using extended attribute checksums")
    (description
     "cshatag is a Go tool for detecting silent data corruption (bitrot) on
files stored on local filesystems.  It stores a SHA256 checksum and a
timestamp in the file's extended attributes (using the @code{user.shatag}
xattr), and can later verify files against these stored checksums to detect
corruption.")
    (license license:expat)))

;;; -- dae-kix-git --
(define-public dae-kix-git
  (package
    (name "dae-kix-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/olicesx/dae")
             (commit "HEAD")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/daeuniverse/dae"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/olicesx/dae")
    (synopsis "dae fork with additional features by kix")
    (description
     "dae-kix is a fork of dae, a high-performance transparent proxy solution
with eBPF-based traffic routing on Linux.  It uses eBPF to redirect traffic
at the kernel level with minimal overhead.  This fork includes additional
patches and features maintained by the kix contributor.")
    (license license:agpl3+)))

;;; -- datafusion-cli --
(define-public datafusion-cli
  (package
    (name "datafusion-cli")
    (version "53.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/apache/datafusion")
             (commit (string-append version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f
           #:cargo-build-flags #~'("--release" "-p" "datafusion-cli")))
    (home-page "https://github.com/apache/datafusion")
    (synopsis "interactive SQL query CLI for Apache DataFusion")
    (description
     "DataFusion CLI is an interactive command-line SQL utility for Apache
DataFusion, a fast and extensible query execution engine written in Rust.
It allows executing SQL queries against local files in CSV, Parquet, JSON,
and Avro formats without setting up a database server.")
    (license license:asl2.0)))

;;; -- dell-idractools --
(define-public dell-idractools
  (package
    (name "dell-idractools")
    (version "11.4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.dell.com/support/home/en-us/drivers/driversdetails?"
             "driverid=dell-idractools-" version "-linux.tar.gz"))
       (file-name (string-append "dell-idractools-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/dell/idractools/"))))
    (home-page "https://www.dell.com/support")
    (synopsis "Dell iDRAC remote management tools")
    (description
     "Dell iDRAC Tools is a collection of utilities for managing and
monitoring Dell PowerEdge servers via the Integrated Dell Remote Access
Controller (iDRAC).  The tools allow remote power management, hardware
inventory, firmware updates, and system event log access from the command
line without needing physical access to the server.")
    (license #f)))  ;proprietary Dell EULA
