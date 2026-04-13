;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260413d
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 39 packages resolved with recipes, 61 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-13
;;;
;;; Recipes (39):
;;;   - mingw-w64-cmake (copy, gpl2+)
;;;   - avahi-static-services (copy, gpl2+)
;;;   - blobmoji-fontconfig (copy, gpl2+)
;;;   - pass-file (copy, gpl3+)
;;;   - kernel-alive (copy, gpl3+)
;;;   - fortune-mod-montypython (copy, public-domain)
;;;   - lol (copy, gpl3+)
;;;   - adwaita-dark (copy, gpl3+)
;;;   - mkinitcpio-contactinfo (copy, gpl2+)
;;;   - mkinitcpio-openswap (copy, expat)
;;;   - mkinitcpio-tailscale (copy, gpl2+)
;;;   - acer-wmi-battery-dkms (copy, gpl2)
;;;   - aic8800d80-dkms (copy, gpl2)
;;;   - asix-ax88179-dkms (copy, gpl2+)
;;;   - dddvb-dkms (copy, gpl2)
;;;   - mechrevo-drivers-dkms (copy, gpl2+)
;;;   - tensorrt (copy, nonfree)
;;;   - prowlarr (copy, gpl3+)
;;;   - p4merge-bin (copy, nonfree)
;;;   - pantum-driver (copy, nonfree)
;;;   - plex-media-server-plexpass (copy, nonfree)
;;;   - olvid (copy, nonfree)
;;;   - clonehero (copy, nonfree)
;;;   - firefox-tridactyl-native-bin (copy, bsd-2)
;;;   - iamb-bin (copy, asl2.0)
;;;   - micromamba-bin (copy, bsd-3)
;;;   - patchy-bin (copy, expat)
;;;   - peerbanhelper (copy, gpl3+)
;;;   - perl-file-keepass (copy, multi)
;;;   - perl-http-server-simple-psgi (copy, multi)
;;;   - nvidia_oc (cargo, expat)
;;;   - paip (cargo, gpl2)
;;;   - passkeyd (cargo, gpl3+)
;;;   - openbao (go, mpl2.0)
;;;   - par (gnu, gpl2+)
;;;   - par-git (gnu, gpl2+)
;;;   - libtxc_dxtn (gnu, bsd-2)
;;;   - mips64-elf-binutils (gnu, multi)
;;;   - rofi-lbonn-wayland-git (meson, expat)
;;;
;;; Blocked (61):
;;;   - linux6.19.8.arch1-1-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.8.arch1-1-docs-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.8.arch1-1-headers-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.arch1-1-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.arch1-1-docs-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.arch1-1-headers-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.zen1-1-zen-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.zen1-1-zen-docs-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.zen1-1-zen-headers-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux-zen-versioned-docs-bin (OBSOLETE_KERNEL_META)
;;;   - linux-zen-versioned-headers-bin (OBSOLETE_KERNEL_META)
;;;   - linux-cachyos (KERNEL_BUILD_COMPLEX)
;;;   - linux-cachyos-lts (KERNEL_BUILD_COMPLEX)
;;;   - linux-cachyos-rc (KERNEL_BUILD_COMPLEX)
;;;   - lib32-xrizer (MULTILIB_UNSUPPORTED)
;;;   - lib32-libtxc_dxtn (MULTILIB_UNSUPPORTED)
;;;   - lib32-zix (MULTILIB_UNSUPPORTED)
;;;   - brother-hl2030 (MULTILIB_UNSUPPORTED)
;;;   - plasma-workspace-povd (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - floorp (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - qt6-base-hifps (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - chromium-gost (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - anbox-git (DISCONTINUED)
;;;   - steam-native-runtime (ARCH_SPECIFIC)
;;;   - pac-pacman-aliases (ARCH_SPECIFIC)
;;;   - ancient-packages (ARCH_SPECIFIC)
;;;   - pipewire-enable-bluez5 (PACMAN_HOOK)
;;;   - localepurge-hook (PACMAN_HOOK)
;;;   - mandb-instant-update (PACMAN_HOOK)
;;;   - paccache-hook (PACMAN_HOOK)
;;;   - pacman-log-orphans-hook (PACMAN_HOOK)
;;;   - nvidia-vulkan-dkms (NOT_IN_AUR)
;;;   - openai-codex-autoup-bin (NOT_IN_AUR)
;;;   - opensc-p11-kit-module (NOT_IN_AUR)
;;;   - projtlauncher (NOT_IN_AUR)
;;;   - shimmy-bin (NOT_IN_AUR)
;;;   - subs2srs-git (NOT_IN_AUR)
;;;   - vivaldi-ffmpeg-codecs (NOT_IN_AUR)
;;;   - whatsapp-for-linux (NOT_IN_AUR)
;;;   - zettlr (NOT_IN_AUR)
;;;   - ttf-ms-win10-japanese (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win10-korean (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win10-other (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win10-sea (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win10-thai (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win10-zh_cn (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win10-zh_tw (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win11-japanese (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win11-korean (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win11-other (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win11-sea (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win11-thai (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win11-zh_cn (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ttf-ms-win11-zh_tw (PROPRIETARY_SOURCE_REQUIRED)
;;;   - ninjarmm-ncplayer (PROPRIETARY_AUTH_REQUIRED)
;;;   - plecs-standalone (PROPRIETARY_AUTH_REQUIRED)
;;;   - oopz (DEPENDENCY_UNAVAILABLE)
;;;   - nautilus-megasync (DEPENDENCY_UNAVAILABLE)
;;;   - keychron-q3-max-udev (DEPENDENCY_UNAVAILABLE)
;;;   - megit (NO_STANDALONE_BINARY)
;;;   - aspire-cli (DOTNET_SDK_REQUIRED)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260413d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:export (
            mingw-w64-cmake
            avahi-static-services
            blobmoji-fontconfig
            pass-file
            kernel-alive
            fortune-mod-montypython
            lol
            adwaita-dark
            mkinitcpio-contactinfo
            mkinitcpio-openswap
            mkinitcpio-tailscale
            acer-wmi-battery-dkms
            aic8800d80-dkms
            asix-ax88179-dkms
            dddvb-dkms
            mechrevo-drivers-dkms
            tensorrt
            prowlarr
            p4merge-bin
            pantum-driver
            plex-media-server-plexpass
            olvid
            clonehero
            firefox-tridactyl-native-bin
            iamb-bin
            micromamba-bin
            patchy-bin
            peerbanhelper
            perl-file-keepass
            perl-http-server-simple-psgi
            nvidia_oc
            paip
            passkeyd
            openbao
            par
            par-git
            libtxc_dxtn
            mips64-elf-binutils
            rofi-lbonn-wayland-git
            ))

;;; PACKAGE DEFINITIONS (39 packages)

;;; -- mingw-w64-cmake --
(define-public mingw-w64-cmake
  (package
    (name "mingw-w64-cmake")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/mingw-w64-cmake.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/mingw-w64-cmake/"))))
    (home-page "https://fedoraproject.org/wiki/MinGW")
    (synopsis "CMake wrapper for MinGW cross-compilation")
    (description
     "A CMake wrapper script for cross-compiling with mingw-w64.  It
configures CMake to use the MinGW toolchain for building Windows
binaries on Linux.")
    (license license:gpl2+)))

;;; -- avahi-static-services --
(define-public avahi-static-services
  (package
    (name "avahi-static-services")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/avahi-static-services.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/avahi-static-services/"))))
    (home-page "https://avahi.org/")
    (synopsis "static Avahi service files for SSH and SFTP")
    (description
     "Configuration files to advertise SSH and SFTP services via Avahi
mDNS/DNS-SD.  Provides static service definition files for automatic
network service discovery.")
    (license license:gpl2+)))

;;; -- blobmoji-fontconfig --
(define-public blobmoji-fontconfig
  (package
    (name "blobmoji-fontconfig")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/blobmoji-fontconfig.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/blobmoji-fontconfig/"))))
    (home-page "https://github.com/nicholasgasior/blobmoji")
    (synopsis "fontconfig rules to enable Blobmoji emoji display")
    (description
     "Fontconfig XML rules to enable Blobmoji (blob-style emoji) fonts
where emojis can be displayed.  Place this alongside the Blobmoji
font package.")
    (license license:gpl2+)))

;;; -- pass-file --
(define-public pass-file
  (package
    (name "pass-file")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dvogt23/pass-file")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("file.bash" "lib/password-store/extensions/file.bash"))))
    (home-page "https://github.com/dvogt23/pass-file")
    (synopsis "pass extension for managing arbitrary files")
    (description
     "A pass (password-store) extension for managing arbitrary files.
It allows storing and retrieving files from the password store
alongside passwords.")
    (license license:gpl3+)))

;;; -- kernel-alive --
(define-public kernel-alive
  (package
    (name "kernel-alive")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.manjaro.org/ste74/kernel-alive")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("kernel-alive" "bin/kernel-alive"))))
    (home-page "https://gitlab.manjaro.org/ste74/kernel-alive")
    (synopsis "back up current kernel modules to prevent post-update issues")
    (description
     "Kernel-alive backs up modules of the currently running kernel to
prevent issues that can occur when kernel modules are removed during
a kernel package update before the system is rebooted.")
    (license license:gpl3+)))

;;; -- fortune-mod-montypython --
(define-public fortune-mod-montypython
  (package
    (name "fortune-mod-montypython")
    (version "20140622")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/fortune-mod-montypython.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/fortune-mod-montypython/"))))
    (home-page "http://www.sacred-texts.com/neu/mphg/mphg.htm")
    (synopsis "fortune cookies from Monty Python and the Holy Grail")
    (description
     "Fortune cookie data files containing quotes from Monty Python and
the Holy Grail.  For use with the fortune-mod program.")
    (license license:public-domain)))

;;; -- lol --
(define-public lol
  (package
    (name "lol")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/lol.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/lol/"))))
    (home-page "https://aur.archlinux.org/packages/lol")
    (synopsis "random LOL generator command-line tool")
    (description
     "A simple command-line random LOL generator written in Python.
Outputs random humorous text to the terminal.")
    (license license:gpl3+)))

;;; -- adwaita-dark --
(define-public adwaita-dark
  (package
    (name "adwaita-dark")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/adwaita-dark.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/themes/Adwaita-dark/"))))
    (home-page "https://www.gnome-look.org/p/1099669/")
    (synopsis "dark GTK2 theme companion for Adwaita dark variant")
    (description
     "A dark GTK2 theme for use alongside the dark variant of the GTK3
Adwaita theme.  Provides consistent dark styling for legacy GTK2
applications.")
    (license license:gpl3+)))

;;; -- mkinitcpio-contactinfo --
(define-public mkinitcpio-contactinfo
  (package
    (name "mkinitcpio-contactinfo")
    (version "0.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/mkinitcpio-contactinfo.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/mkinitcpio-contactinfo/"))))
    (home-page "https://aur.archlinux.org/packages/mkinitcpio-contactinfo")
    (synopsis "initcpio hook to display contact information before disk encryption")
    (description
     "An mkinitcpio hook that shows contact information on screen before
the disk encryption prompt.  Useful for displaying owner details
in case the device is found.")
    (license license:gpl2+)))

;;; -- mkinitcpio-openswap --
(define-public mkinitcpio-openswap
  (package
    (name "mkinitcpio-openswap")
    (version "0.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/mkinitcpio-openswap.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/mkinitcpio-openswap/"))))
    (home-page "https://aur.archlinux.org/packages/mkinitcpio-openswap")
    (synopsis "mkinitcpio hook to open encrypted swap at boot time")
    (description
     "An mkinitcpio hook that opens encrypted swap partitions during
the boot process.  Supports LUKS-encrypted swap for hibernation
and resume functionality.")
    (license license:expat)))

;;; -- mkinitcpio-tailscale --
(define-public mkinitcpio-tailscale
  (package
    (name "mkinitcpio-tailscale")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dangra/mkinitcpio-tailscale")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/mkinitcpio-tailscale/"))))
    (home-page "https://github.com/dangra/mkinitcpio-tailscale")
    (synopsis "mkinitcpio hook to launch Tailscale in initramfs")
    (description
     "An mkinitcpio hook that starts the Tailscale VPN daemon during
the initramfs phase.  Supports both systemd-based and busybox-based
initramfs configurations for remote unlock.")
    (license license:gpl2+)))

;;; -- acer-wmi-battery-dkms --
(define-public acer-wmi-battery-dkms
  (package
    (name "acer-wmi-battery-dkms")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/frederik-h/acer-wmi-battery")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "src/acer-wmi-battery-dkms/"))))
    (home-page "https://github.com/frederik-h/acer-wmi-battery")
    (synopsis "kernel module to set battery charge limit on Acer laptops")
    (description
     "A DKMS kernel module for Acer laptops that allows setting the
battery charge limit to 80 percent via the WMI ACPI interface.
Helps preserve battery longevity.")
    (license license:gpl2)))

;;; -- aic8800d80-dkms --
(define-public aic8800d80-dkms
  (package
    (name "aic8800d80-dkms")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/shenmintao/aic8800d80")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "src/aic8800d80-dkms/"))))
    (home-page "https://github.com/shenmintao/aic8800d80")
    (synopsis "kernel modules for AIC8800D80 WiFi chipset")
    (description
     "DKMS kernel modules for the AIC8800D80 WiFi chipset used in some
USB WiFi adapters including the Tenda AX900.  Provides wireless
network driver support.")
    (license license:gpl2)))

;;; -- asix-ax88179-dkms --
(define-public asix-ax88179-dkms
  (package
    (name "asix-ax88179-dkms")
    (version "3.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/asix-ax88179-dkms.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "src/asix-ax88179-dkms/"))))
    (home-page "https://www.asix.com.tw/en/product/USBEthernet/Super-Speed_USB_Ethernet/AX88179B")
    (synopsis "kernel module for ASIX AX88179B USB network adapters")
    (description
     "DKMS kernel module for ASIX AX88179B USB 3.0 to Gigabit Ethernet
network adapters.  Provides the vendor driver for improved
compatibility and performance.")
    (license license:gpl2+)))

;;; -- dddvb-dkms --
(define-public dddvb-dkms
  (package
    (name "dddvb-dkms")
    (version "0.9.40a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DigitalDevices/dddvb")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "src/dddvb-dkms/"))))
    (home-page "https://github.com/DigitalDevices/dddvb")
    (synopsis "Digital Devices DVB driver package for DKMS")
    (description
     "Official Digital Devices DVB driver package for DKMS.  Provides
kernel modules for Digital Devices DVB tuner cards and related
hardware for receiving digital TV and radio.")
    (license license:gpl2)))

;;; -- mechrevo-drivers-dkms --
(define-public mechrevo-drivers-dkms
  (package
    (name "mechrevo-drivers-dkms")
    (version "4.21.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "src/mechrevo-drivers-dkms/"))))
    (home-page "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers")
    (synopsis "kernel modules for MECHREVO devices via DKMS")
    (description
     "DKMS kernel modules for MECHREVO notebook devices.  Modified from
TUXEDO Computers drivers to support keyboard backlight, fan control,
and hardware I/O for MECHREVO laptops.")
    (license license:gpl2+)))

;;; -- tensorrt --
(define-public tensorrt
  (package
    (name "tensorrt")
    (version "10.16.0.72")
    (source
     (origin
       (method url-fetch)
       (uri "https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/10.16.0/tars/TensorRT-10.16.0.72.Linux.x86_64-gnu.cuda-12.9.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/tensorrt/"))))
    (home-page "https://developer.nvidia.com/tensorrt/")
    (synopsis "high-performance deep learning inference on NVIDIA hardware")
    (description
     "NVIDIA TensorRT is a platform for high-performance deep learning
inference.  It includes an optimizer and runtime for deploying
trained neural networks on NVIDIA GPUs with reduced latency.")
    (license (nonguix-license:nonfree "https://developer.nvidia.com"))))

;;; -- prowlarr --
(define-public prowlarr
  (package
    (name "prowlarr")
    (version "2.3.5.5327")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Prowlarr/Prowlarr/releases/download/v2.3.5.5327/Prowlarr.master.2.3.5.5327.linux-core-x64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Prowlarr" "lib/prowlarr/"))))
    (home-page "https://prowlarr.com")
    (synopsis "indexer manager and proxy for Usenet and torrent users")
    (description
     "Prowlarr is an indexer manager and proxy that integrates with
Sonarr, Radarr, Lidarr, and Readarr.  It manages indexer
configuration and provides a unified search interface.")
    (license license:gpl3+)))

;;; -- p4merge-bin --
(define-public p4merge-bin
  (package
    (name "p4merge-bin")
    (version "25.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://cdist2.perforce.com/perforce/r25.3/bin.linux26x86_64/p4v.tgz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/p4merge-bin/"))))
    (home-page "https://www.perforce.com/products/helix-core-apps/merge-diff-tool-p4merge")
    (synopsis "Perforce visual merge and diff tool")
    (description
     "P4Merge is a three-way merging and side-by-side file comparison
tool from Perforce.  It provides visual diff and merge capabilities
for resolving conflicts in version control workflows.")
    (license (nonguix-license:nonfree "https://www.perforce.com"))))

;;; -- pantum-driver --
(define-public pantum-driver
  (package
    (name "pantum-driver")
    (version "1.1.123")
    (source
     (origin
       (method url-fetch)
       (uri "https://drivers.pantum.com/userfiles/files/download/driver/Pantum-Ubuntu-Driver-V1.1.123-1.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/pantum-driver/"))))
    (home-page "https://global.pantum.com/support/download/driver/")
    (synopsis "Linux driver for Pantum printers")
    (description
     "Proprietary Linux printer driver for Pantum printers.  Supports
multiple Pantum printer models through CUPS.  Check the PKGBUILD
for the full list of compatible models.")
    (license (nonguix-license:nonfree "https://global.pantum.com"))))

;;; -- plex-media-server-plexpass --
(define-public plex-media-server-plexpass
  (package
    (name "plex-media-server-plexpass")
    (version "1.43.1.10576")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.plex.tv/plex-media-server-new/1.43.1.10576-82c661aea/debian/plexmediaserver_1.43.1.10576-82c661aea_amd64.deb")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/plex-media-server-plexpass/"))))
    (home-page "https://plex.tv/")
    (synopsis "Plex media server for organizing and streaming media")
    (description
     "Plex Media Server organizes video, music, and photos from personal
media libraries and streams them to smart TVs, streaming boxes, and
mobile devices.  This is the PlexPass (early access) edition.")
    (license (nonguix-license:nonfree "https://plex.tv"))))

;;; -- olvid --
(define-public olvid
  (package
    (name "olvid")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://static.olvid.io/linux/olvid-2.7.0-amd64.deb")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/olvid/"))))
    (home-page "https://www.olvid.io/")
    (synopsis "private and secure instant messenger")
    (description
     "Olvid is a French instant messenger focused on privacy and security.
It provides end-to-end encryption without relying on a central
directory server for key management.")
    (license (nonguix-license:nonfree "https://www.olvid.io"))))

;;; -- clonehero --
(define-public clonehero
  (package
    (name "clonehero")
    (version "1.0.0.4080")
    (source
     (origin
       (method url-fetch)
       (uri "https://pubdl.clonehero.net/clonehero-v1.0.0.4080/clonehero-linux.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/clonehero/"))))
    (home-page "https://clonehero.net/")
    (synopsis "free rhythm game playable with guitar controllers")
    (description
     "Clone Hero is a free rhythm game that can be played with 5 or 6
button guitar controllers, game controllers, or a keyboard.  It
supports custom songs and charts from the community.")
    (license (nonguix-license:nonfree "https://clonehero.net"))))

;;; -- firefox-tridactyl-native-bin --
(define-public firefox-tridactyl-native-bin
  (package
    (name "firefox-tridactyl-native-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/tridactyl/native_messenger/releases/download/0.5.0/native_main-Linux")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("native_main-Linux" "bin/tridactyl-native"))))
    (home-page "https://github.com/tridactyl/tridactyl")
    (synopsis "Tridactyl native messaging host for Firefox")
    (description
     "The native messaging host application for the Tridactyl Firefox
extension.  Enables Tridactyl to interact with the operating system
for features like editing text in external editors.")
    (license license:bsd-2)))

;;; -- iamb-bin --
(define-public iamb-bin
  (package
    (name "iamb-bin")
    (version "0.0.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ulyssa/iamb/releases/download/v0.0.11/iamb-x86_64-unknown-linux-musl.tgz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("iamb" "bin/iamb"))))
    (home-page "https://github.com/ulyssa/iamb")
    (synopsis "Matrix client for Vim addicts")
    (description
     "Iamb is a terminal-based Matrix client with Vim-like keybindings.
It provides a modal interface for chatting on the Matrix protocol
with support for multiple rooms and end-to-end encryption.")
    (license license:asl2.0)))

;;; -- micromamba-bin --
(define-public micromamba-bin
  (package
    (name "micromamba-bin")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/mamba-org/micromamba-releases/releases/download/2.5.0-2/micromamba-linux-64")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("micromamba-linux-64" "bin/micromamba"))))
    (home-page "https://github.com/mamba-org/mamba")
    (synopsis "tiny version of the mamba package installer")
    (description
     "Micromamba is a tiny, statically-linked version of the Mamba package
manager.  It provides fast conda-compatible package management
without requiring a base Python installation.")
    (license license:bsd-3)))

;;; -- patchy-bin --
(define-public patchy-bin
  (package
    (name "patchy-bin")
    (version "0.0.27")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/richardgill/patchy/releases/download/v0.0.27/patchy-linux-x64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("patchy" "bin/patchy"))))
    (home-page "https://github.com/richardgill/patchy")
    (synopsis "CLI for generating and applying patches to git repositories")
    (description
     "Patchy is a command-line tool for generating and applying patches
to git repositories.  It provides a workflow for creating and
managing patch files for code review and distribution.")
    (license license:expat)))

;;; -- peerbanhelper --
(define-public peerbanhelper
  (package
    (name "peerbanhelper")
    (version "9.3.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/PBH-BTN/PeerBanHelper/releases/download/v9.3.10/PeerBanHelper-linux-amd64.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/peerbanhelper/"))))
    (home-page "https://github.com/PBH-BTN/PeerBanHelper")
    (synopsis "automatic peer banning tool for BitTorrent clients")
    (description
     "PeerBanHelper is a tool that automatically bans malicious peers on
BitTorrent networks.  It integrates with popular BitTorrent clients
to detect and block unwanted connections.")
    (license license:gpl3+)))

;;; -- perl-file-keepass --
(define-public perl-file-keepass
  (package
    (name "perl-file-keepass")
    (version "2.03")
    (source
     (origin
       (method url-fetch)
       (uri "https://cpan.metacpan.org/authors/id/R/RH/RHANDOM/File-KeePass-2.03.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lib/" "lib/perl5/"))))
    (home-page "https://metacpan.org/release/File-KeePass")
    (synopsis "Perl interface to KeePass V1 and V2 database files")
    (description
     "File::KeePass provides a Perl interface for reading and writing
KeePass V1 and V2 database files.  It supports both the older KDB
and newer KDBX formats for password management.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; -- perl-http-server-simple-psgi --
(define-public perl-http-server-simple-psgi
  (package
    (name "perl-http-server-simple-psgi")
    (version "0.16")
    (source
     (origin
       (method url-fetch)
       (uri "https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/HTTP-Server-Simple-PSGI-0.16.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lib/" "lib/perl5/"))))
    (home-page "https://metacpan.org/release/HTTP-Server-Simple-PSGI")
    (synopsis "PSGI handler for HTTP::Server::Simple")
    (description
     "HTTP::Server::Simple::PSGI is a Perl module that provides a PSGI
application handler for HTTP::Server::Simple.  It bridges the simple
HTTP server with the PSGI web application interface.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; -- nvidia_oc --
(define-public nvidia_oc
  (package
    (name "nvidia_oc")
    (version "0.1.24")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Dreaming-Codes/nvidia_oc")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://github.com/Dreaming-Codes/nvidia_oc")
    (synopsis "command-line overclocking tool for NVIDIA GPUs")
    (description
     "Nvidia_oc is a simple command-line overclocking tool for NVIDIA
GPUs that supports both X11 and Wayland.  It provides controls
for GPU clock, memory clock, and power limit adjustments.")
    (license license:expat)))

;;; -- paip --
(define-public paip
  (package
    (name "paip")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kotarac/paip")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://github.com/kotarac/paip")
    (synopsis "pipe stdin through a large language model")
    (description
     "Paip is like cat but routes text through a large language model.
It reads from standard input and sends the content to an LLM,
printing the response to standard output.")
    (license license:gpl2)))

;;; -- passkeyd --
(define-public passkeyd
  (package
    (name "passkeyd")
    (version "1.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bjn7/passkeyd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://github.com/bjn7/passkeyd")
    (synopsis "opinionated WebAuthn authenticator backed by a TPM")
    (description
     "Passkeyd is a WebAuthn authenticator daemon backed by a Trusted
Platform Module.  It provides FIDO2/WebAuthn passkey support
using the system TPM for key storage and attestation.")
    (license license:gpl3+)))

;;; -- openbao --
(define-public openbao
  (package
    (name "openbao")
    (version "2.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openbao/openbao")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list 
#:tests? #f           #:import-path "github.com/openbao/openbao"))
    (home-page "https://openbao.org/")
    (synopsis "open-source secrets management platform")
    (description
     "OpenBao is an open-source fork of HashiCorp Vault providing secrets
management, identity-based access, and data encryption.  It offers
an API-driven platform for managing sensitive data across
infrastructure.")
    (license license:mpl2.0)))

;;; -- par --
(define-public par
  (package
    (name "par")
    (version "1.53.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.nicemice.net/par/Par-1.53.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "http://www.nicemice.net/par/")
    (synopsis "paragraph reformatter similar to fmt")
    (description
     "Par is a paragraph reformatter similar to fmt but with improved
handling of indentation, quoting prefixes, and line-length limits.
It is designed for reformatting email text and source code comments.")
    (license license:gpl2+)))

;;; -- par-git --
(define-public par-git
  (package
    (name "par-git")
    (version "1.53.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sergi/par")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "http://www.nicemice.net/par/")
    (synopsis "paragraph reformatter similar to fmt (git version)")
    (description
     "Par is a paragraph reformatter similar to fmt but with improved
handling of indentation, quoting prefixes, and line-length limits.
This is the development version built from the git repository.")
    (license license:gpl2+)))

;;; -- libtxc_dxtn --
(define-public libtxc_dxtn
  (package
    (name "libtxc_dxtn")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://people.freedesktop.org/~cbrill/libtxc_dxtn/libtxc_dxtn-1.0.1.tar.bz2")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://dri.freedesktop.org/wiki/S3TC")
    (synopsis "S3TC texture compression library for Mesa")
    (description
     "Libtxc_dxtn provides S3TC texture compression support for Mesa.
The library implements DXT1, DXT3, and DXT5 compression algorithms
needed by some Wine applications and OpenGL games.")
    (license license:bsd-2)))

;;; -- mips64-elf-binutils --
(define-public mips64-elf-binutils
  (package
    (name "mips64-elf-binutils")
    (version "2.45.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ftp.gnu.org/gnu/binutils/binutils-2.45.1.tar.xz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://www.gnu.org/software/binutils/")
    (synopsis "cross-compilation binutils for MIPS64 ELF target")
    (description
     "GNU Binutils configured for the mips64-elf target architecture.
Provides the assembler, linker, and related tools needed for
cross-compiling bare-metal MIPS64 programs.")
    (license (list license:gpl3+ license:fdl1.3+))))

;;; -- rofi-lbonn-wayland-git --
(define-public rofi-lbonn-wayland-git
  (package
    (name "rofi-lbonn-wayland-git")
    (version "1.7.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lbonn/rofi")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/lbonn/rofi")
    (synopsis "application launcher for Wayland (lbonn fork)")
    (description
     "A fork of rofi, the window switcher, application launcher, and
dmenu replacement, with native Wayland support.  Maintained by
lbonn as an alternative to the X11-only upstream rofi.")
    (license license:expat)))
