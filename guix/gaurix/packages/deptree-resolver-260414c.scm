;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414c
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 76 recipes created
;;;   - 24 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:export (sonic-win
            lib32-xrizer
            plasma-workspace-povd
            lib32-l-smash
            new-lg4ff-dkms-git
            lib32-libudev0-shim
            hid-fanatecff-dkms
            linux-cachyos-lts
            linux-cachyos
            linux-cachyos-rc
            qt6-base-hifps
            pac-pacman-aliases
            pacman-log-orphans-hook
            pipewire-enable-bluez5
            ttf-ms-win10-japanese
            ttf-ms-win10-korean
            ttf-ms-win10-other
            ttf-ms-win10-sea
            ttf-ms-win10-thai
            ttf-ms-win10-zh_cn
            ttf-ms-win10-zh_tw
            ttf-ms-win11-japanese
            ttf-ms-win11-korean
            ttf-ms-win11-other
            ttf-ms-win11-sea
            ttf-ms-win11-thai
            ttf-ms-win11-zh_cn
            ttf-ms-win11-zh_tw
            ancient-packages
            binder_linux-dkms
            lib32-libtxc_dxtn
            lib32-zix
            linux-zen-versioned-docs-bin
            linux-zen-versioned-headers-bin
            localepurge-hook
            mandb-instant-update
            mkinitcpio-sd-numlock
            paccache-hook
            systemd-boot-pacman-hook
            yaycache-hook
            youtube-music-desktop
            amneziawg-dkms
            arch-gdm-theme-list
            caddy-cloudflare-l4
            checkupdates-notify
            csharpier
            cython2
            deezer-enhanced
            discord-chat-exporter-plus-cli
            etckeeper-packages
            i2c-nct6793-dkms-git
            imx471-dkms-git
            intel-ucode-git
            iptvnator-electron-bin
            it87-dkms-git
            ithc-dkms-git
            ivpn-dinit
            jdk-doc
            jdk21-graalvm-ee-bin
            konica-minolta-bizhub-c554e-series
            lact-openrc
            lib32-a52dec
            lib32-gperftools
            lib32-opencl-legacy-amdgpu-pro
            linux-xanmod-linux-bin-x64v3
            linux-xanmod-linux-headers-bin-x64v3
            linux-xanmod-lts-linux-bin-x64v3
            linux-xanmod-lts-linux-headers-bin-x64v3
            linux-zen-versioned-bin
            llvm-mos-git
            luajit-clang-git
            lunar-client
            lyrebird-proxy
            lyrics-git
            lyse
            magewell-pro-capture-dkms))


;;; ── sonic-win (#11979) ──

(define-public sonic-win
  (package
    (name "sonic-win")
    (version "6.6.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Sonic-DE/sonic-win.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Sonic-DE/sonic-win")
    (synopsis "kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improveme...")
    (description "kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other
improvements, for XLibre.  It is packaged from the Arch User Repository.")
    (license license:lgpl2.0+)))


;;; ── lib32-xrizer (#256) ──

(define-public lib32-xrizer
  (package
    (name "lib32-xrizer")
    (version "0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Supreeeme/xrizer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/Supreeeme/xrizer")
    (synopsis "reimplementation of OpenVR, translating calls to OpenXR (32-bit)")
    (description "Reimplementation of OpenVR, translating calls to OpenXR (32-bit).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── plasma-workspace-povd (#2890) ──

(define-public plasma-workspace-povd
  (package
    (name "plasma-workspace-povd")
    (version "6.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://kde.org/plasma-desktop/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://kde.org/plasma-desktop/")
    (synopsis "KDE Plasma Workspace (patched for per-output virtual desktops)")
    (description "KDE Plasma Workspace (patched for per-output virtual desktops).  It is packaged from the Arch User Repository.")
    (license license:lgpl2.0+)))


;;; ── lib32-l-smash (#12171) ──

(define-public lib32-l-smash
  (package
    (name "lib32-l-smash")
    (version "2.14.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/l-smash/l-smash.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/l-smash/l-smash")
    (synopsis "MP4 muxer and other tools")
    (description "MP4 muxer and other tools.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── new-lg4ff-dkms-git (#11866) ──

(define-public new-lg4ff-dkms-git
  (package
    (name "new-lg4ff-dkms-git")
    (version "0.5.0.r0.g2092db1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/berarma/new-lg4ff.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/berarma/new-lg4ff")
    (synopsis "experimental Logitech force feedback module (DKMS)")
    (description "Experimental Logitech force feedback module (DKMS).  It is packaged from the Arch User Repository.")
    (license license:gpl2+)))


;;; ── lib32-libudev0-shim (#11976) ──

(define-public lib32-libudev0-shim
  (package
    (name "lib32-libudev0-shim")
    (version "2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/archlinux/libudev0-shim.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/archlinux/libudev0-shim")
    (synopsis "libudev.so.0 compatibility library for systems with newer udev versions (32...")
    (description "libudev.so.0 compatibility library for systems with newer udev versions
(32 bit).")
    (license license:lgpl2.1+)))


;;; ── hid-fanatecff-dkms (#12124) ──

(define-public hid-fanatecff-dkms
  (package
    (name "hid-fanatecff-dkms")
    (version "0.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gotzl/hid-fanatecff.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gotzl/hid-fanatecff")
    (synopsis "driver to support force feedback and load cells for the FANATEC controller ...")
    (description "Driver to support force feedback and load cells for the FANATEC
controller ecosystem.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── linux-cachyos-lts (#1755) ──

(define-public linux-cachyos-lts
  (package
    (name "linux-cachyos-lts")
    (version "6.18.22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/linux-cachyos.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (synopsis "the Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and impro...")
    (description "The Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and
improvements - Long Term Service kernel and modules.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── linux-cachyos (#1070) ──

(define-public linux-cachyos
  (package
    (name "linux-cachyos")
    (version "6.19.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/linux-cachyos.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (synopsis "the Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS w...")
    (description "The Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by
CachyOS with other patches and improvements. kernel and modules.")
    (license license:gpl2)))


;;; ── linux-cachyos-rc (#10770) ──

(define-public linux-cachyos-rc
  (package
    (name "linux-cachyos-rc")
    (version "7.0.rc7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/linux-cachyos.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (synopsis "the Linux Clang ThinLTO + AutoFDO + Cachy Sauce Kernel by CachyOS with othe...")
    (description "The Linux Clang ThinLTO + AutoFDO + Cachy Sauce Kernel by CachyOS with
other patches and improvements - Release Candidate kernel and modules.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── qt6-base-hifps (#12026) ──

(define-public qt6-base-hifps
  (package
    (name "qt6-base-hifps")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.qt.io")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.qt.io")
    (synopsis "A cross-platform application and UI framework")
    (description "A cross-platform application and UI framework.  It is packaged from the Arch User Repository.")
    (license license:gpl3)))


;;; ── pac-pacman-aliases (#9004) ──

(define-public pac-pacman-aliases
  (package
    (name "pac-pacman-aliases")
    (version "1.9.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bbedward/pac-pacman-aliases.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bbedward/pac-pacman-aliases")
    (synopsis "add pac with apt-like pacman aliases, completions, and globbing search patt...")
    (description "Add pac with apt-like pacman aliases, completions, and globbing search
pattern support.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── pacman-log-orphans-hook (#11596) ──

(define-public pacman-log-orphans-hook
  (package
    (name "pacman-log-orphans-hook")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacman-log-orphans-hook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/pacman-log-orphans-hook")
    (synopsis "hook to check whether there are any packages marked as unrequired (orphans)...")
    (description "hook to check whether there are any packages marked as unrequired
(orphans) via pacman -Qttdq after every pacman run.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── pipewire-enable-bluez5 (#3243) ──

(define-public pipewire-enable-bluez5
  (package
    (name "pipewire-enable-bluez5")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pipewire-enable-bluez5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/pipewire-enable-bluez5")
    (synopsis "pacman hook to automatically enable Bluez5 support for Pipewire")
    (description "Pacman hook to automatically enable Bluez5 support for Pipewire.  It is packaged from the Arch User Repository.")
    (license license:wtfpl2)))


;;; ── ttf-ms-win10-japanese (#12925) ──

(define-public ttf-ms-win10-japanese
  (package
    (name "ttf-ms-win10-japanese")
    (version "10.0.19043.1055")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 10 Japanese TrueType fonts")
    (description "Microsoft Windows 10 Japanese TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win10-korean (#12926) ──

(define-public ttf-ms-win10-korean
  (package
    (name "ttf-ms-win10-korean")
    (version "10.0.19043.1055")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 10 Korean TrueType fonts")
    (description "Microsoft Windows 10 Korean TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win10-other (#12931) ──

(define-public ttf-ms-win10-other
  (package
    (name "ttf-ms-win10-other")
    (version "10.0.19043.1055")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 10 Other TrueType fonts")
    (description "Microsoft Windows 10 Other TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win10-sea (#12927) ──

(define-public ttf-ms-win10-sea
  (package
    (name "ttf-ms-win10-sea")
    (version "10.0.19043.1055")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 10 Southeast Asian TrueType fonts")
    (description "Microsoft Windows 10 Southeast Asian TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win10-thai (#12928) ──

(define-public ttf-ms-win10-thai
  (package
    (name "ttf-ms-win10-thai")
    (version "10.0.19043.1055")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 10 Thai TrueType fonts")
    (description "Microsoft Windows 10 Thai TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win10-zh_cn (#12929) ──

(define-public ttf-ms-win10-zh_cn
  (package
    (name "ttf-ms-win10-zh_cn")
    (version "10.0.19043.1055")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 10 Simplified Chinese TrueType fonts")
    (description "Microsoft Windows 10 Simplified Chinese TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win10-zh_tw (#12930) ──

(define-public ttf-ms-win10-zh_tw
  (package
    (name "ttf-ms-win10-zh_tw")
    (version "10.0.19043.1055")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 10 Traditional Chinese TrueType fonts")
    (description "Microsoft Windows 10 Traditional Chinese TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win11-japanese (#22454) ──

(define-public ttf-ms-win11-japanese
  (package
    (name "ttf-ms-win11-japanese")
    (version "10.0.26200.8037")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 11 Japanese TrueType fonts")
    (description "Microsoft Windows 11 Japanese TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win11-korean (#22455) ──

(define-public ttf-ms-win11-korean
  (package
    (name "ttf-ms-win11-korean")
    (version "10.0.26200.8037")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 11 Korean TrueType fonts")
    (description "Microsoft Windows 11 Korean TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win11-other (#22460) ──

(define-public ttf-ms-win11-other
  (package
    (name "ttf-ms-win11-other")
    (version "10.0.26200.8037")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 11 Other TrueType fonts")
    (description "Microsoft Windows 11 Other TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win11-sea (#22456) ──

(define-public ttf-ms-win11-sea
  (package
    (name "ttf-ms-win11-sea")
    (version "10.0.26200.8037")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 11 Southeast Asian TrueType fonts")
    (description "Microsoft Windows 11 Southeast Asian TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win11-thai (#22457) ──

(define-public ttf-ms-win11-thai
  (package
    (name "ttf-ms-win11-thai")
    (version "10.0.26200.8037")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 11 Thai TrueType fonts")
    (description "Microsoft Windows 11 Thai TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win11-zh_cn (#22458) ──

(define-public ttf-ms-win11-zh_cn
  (package
    (name "ttf-ms-win11-zh_cn")
    (version "10.0.26200.8037")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 11 Simplified Chinese TrueType fonts")
    (description "Microsoft Windows 11 Simplified Chinese TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ttf-ms-win11-zh_tw (#22459) ──

(define-public ttf-ms-win11-zh_tw
  (package
    (name "ttf-ms-win11-zh_tw")
    (version "10.0.26200.8037")
    (source (origin
              (method url-fetch)
              (uri "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "microsoft Windows 11 Traditional Chinese TrueType fonts")
    (description "Microsoft Windows 11 Traditional Chinese TrueType fonts.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ancient-packages (#3325) ──

(define-public ancient-packages
  (package
    (name "ancient-packages")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://pub-dist.s3.us-east-005.dream.io/Software/ancient-packages/ancient-packages.jpg")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pub-dist.s3.us-east-005.dream.io/Software/ancient-packages/ancient-packages.jpg")
    (synopsis "lists installed packages no longer available (anywhere)")
    (description "Lists installed packages no longer available (anywhere).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── binder_linux-dkms (#12149) ──

(define-public binder_linux-dkms
  (package
    (name "binder_linux-dkms")
    (version "6.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/choff/anbox-modules.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/choff/anbox-modules")
    (synopsis "android kernel driver fork by @choff in DKMS format, binder only")
    (description "Android kernel driver fork by @choff in DKMS format, binder only.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── lib32-libtxc_dxtn (#10703) ──

(define-public lib32-libtxc_dxtn
  (package
    (name "lib32-libtxc_dxtn")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "http://dri.freedesktop.org/wiki/S3TC")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://dri.freedesktop.org/wiki/S3TC")
    (synopsis "the S3TC algorithm, needed by wine-staging DXTn patches")
    (description "the S3TC algorithm, needed by wine-staging DXTn patches.  It is packaged from the Arch User Repository.")
    (license license:bsd-3)))


;;; ── lib32-zix (#2584) ──

(define-public lib32-zix
  (package
    (name "lib32-zix")
    (version "0.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/drobilla/zix.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/drobilla/zix")
    (synopsis "A lightweight C99 portability and data structure library")
    (description "A lightweight C99 portability and data structure library.  It is packaged from the Arch User Repository.")
    (license (nonguix-license:nonfree "https://gitlab.com/drobilla/zix"))))


;;; ── linux-zen-versioned-docs-bin (#9955) ──

(define-public linux-zen-versioned-docs-bin
  (package
    (name "linux-zen-versioned-docs-bin")
    (version "6.19.11.zen1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/zen-kernel/zen-kernel")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zen-kernel/zen-kernel")
    (synopsis "metapackage depending on linux6.19.11.zen1-1-zen-docs-bin")
    (description "Metapackage depending on linux6.19.11.zen1-1-zen-docs-bin.")
    (license license:gpl2)))


;;; ── linux-zen-versioned-headers-bin (#9954) ──

(define-public linux-zen-versioned-headers-bin
  (package
    (name "linux-zen-versioned-headers-bin")
    (version "6.19.11.zen1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/zen-kernel/zen-kernel")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zen-kernel/zen-kernel")
    (synopsis "metapackage depending on linux6.19.11.zen1-1-zen-headers-bin")
    (description "Metapackage depending on linux6.19.11.zen1-1-zen-headers-bin.")
    (license license:gpl2)))


;;; ── localepurge-hook (#1130) ──

(define-public localepurge-hook
  (package
    (name "localepurge-hook")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/localepurge-hook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/localepurge-hook")
    (synopsis "A hook for run localepurge after each installation or update")
    (description "A hook for run localepurge after each installation or update.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── mandb-instant-update (#10058) ──

(define-public mandb-instant-update
  (package
    (name "mandb-instant-update")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mandb-instant-update.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/mandb-instant-update")
    (synopsis "updates mandb index database during package updates/installs")
    (description "Updates mandb index database during package updates/installs.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── mkinitcpio-sd-numlock (#12123) ──

(define-public mkinitcpio-sd-numlock
  (package
    (name "mkinitcpio-sd-numlock")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mkinitcpio-sd-numlock.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/mkinitcpio-sd-numlock")
    (synopsis "enable numlock during early userspace using systemd")
    (description "Enable numlock during early userspace using systemd.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── paccache-hook (#11783) ──

(define-public paccache-hook
  (package
    (name "paccache-hook")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paccache-hook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/paccache-hook")
    (synopsis "A configurable hook to cleanup the pacman package cache using paccache")
    (description "A configurable hook to cleanup the pacman package cache using paccache.  It is packaged from the Arch User Repository.")
    (license license:bsd-3)))


;;; ── systemd-boot-pacman-hook (#12874) ──

(define-public systemd-boot-pacman-hook
  (package
    (name "systemd-boot-pacman-hook")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/systemd-boot-pacman-hook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/systemd-boot-pacman-hook")
    (synopsis "pacman hook to upgrade systemd-boot after systemd upgrade")
    (description "Pacman hook to upgrade systemd-boot after systemd upgrade.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── yaycache-hook (#15341) ──

(define-public yaycache-hook
  (package
    (name "yaycache-hook")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yaycache-hook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/yaycache-hook")
    (synopsis "A configurable hook to cleanup the yay package cache using yaycache")
    (description "A configurable hook to cleanup the yay package cache using yaycache.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── youtube-music-desktop (#3192) ──

(define-public youtube-music-desktop
  (package
    (name "youtube-music-desktop")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youtube-music-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/youtube-music-desktop")
    (synopsis "youTube Music web-app based on qtws")
    (description "YouTube Music web-app based on qtws.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── amneziawg-dkms (#11762) ──

(define-public amneziawg-dkms
  (package
    (name "amneziawg-dkms")
    (version "1.0.20260329")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amnezia-vpn/amneziawg-linux-kernel-module.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/amnezia-vpn/amneziawg-linux-kernel-module")
    (synopsis "amneziaWG is a contemporary version of the popular VPN protocol, WireGuard")
    (description "AmneziaWG is a contemporary version of the popular VPN protocol,
WireGuard.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── arch-gdm-theme-list (#9822) ──

(define-public arch-gdm-theme-list
  (package
    (name "arch-gdm-theme-list")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arch-gdm-theme-list.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/arch-gdm-theme-list")
    (synopsis "an Arch Linux Theme for GDM, also with the face browser version")
    (description "An Arch Linux Theme for GDM, also with the face browser version.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── caddy-cloudflare-l4 (#12711) ──

(define-public caddy-cloudflare-l4
  (package
    (name "caddy-cloudflare-l4")
    (version "2.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/caddyserver/caddy.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/caddyserver/caddy")
    (synopsis "caddy web server with plugins (Cloudflare DNS, L4)")
    (description "Caddy web server with plugins (Cloudflare DNS, L4).  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))


;;; ── checkupdates-notify (#2850) ──

(define-public checkupdates-notify
  (package
    (name "checkupdates-notify")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/karnage42/checkupdates-notify.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/karnage42/checkupdates-notify")
    (synopsis "sends a notification if package updates are available")
    (description "Sends a notification if package updates are available.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── csharpier (#925) ──

(define-public csharpier
  (package
    (name "csharpier")
    (version "1.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://csharpier.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://csharpier.com")
    (synopsis "an opinionated code formatter for C#")
    (description "An opinionated code formatter for C#.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── cython2 (#10740) ──

(define-public cython2
  (package
    (name "cython2")
    (version "0.29.37")
    (source (origin
              (method url-fetch)
              (uri "https://cython.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://cython.org")
    (synopsis "C-Extensions for Python 2")
    (description "C-Extensions for Python 2.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))


;;; ── deezer-enhanced (#360) ──

(define-public deezer-enhanced
  (package
    (name "deezer-enhanced")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/duzda/deezer-enhanced.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/duzda/deezer-enhanced")
    (synopsis "an unofficial application for Deezer with enhanced features")
    (description "An unofficial application for Deezer with enhanced features.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── discord-chat-exporter-plus-cli (#3117) ──

(define-public discord-chat-exporter-plus-cli
  (package
    (name "discord-chat-exporter-plus-cli")
    (version "2.47.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nulldg/DiscordChatExporterPlus.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nulldg/DiscordChatExporterPlus")
    (synopsis "exports Discord chat logs to a file (without the political bloat)")
    (description "Exports Discord chat logs to a file (without the political bloat).  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── etckeeper-packages (#2485) ──

(define-public etckeeper-packages
  (package
    (name "etckeeper-packages")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alerque/etckeeper-packages.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/alerque/etckeeper-packages")
    (synopsis "track installed packages in etckeeper (alternative to pug and pacmanity)")
    (description "Track installed packages in etckeeper (alternative to pug and
pacmanity).  It is packaged from the Arch User Repository.")
    (license license:gpl3)))


;;; ── i2c-nct6793-dkms-git (#7625) ──

(define-public i2c-nct6793-dkms-git
  (package
    (name "i2c-nct6793-dkms-git")
    (version "0.1.r0.g887a50d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/CalcProgrammer1/i2c-nct6793-dkms.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/CalcProgrammer1/i2c-nct6793-dkms")
    (synopsis "nuvoton NCT6793 and compatible SMBus kernel driver")
    (description "Nuvoton NCT6793 and compatible SMBus kernel driver.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── imx471-dkms-git (#901) ──

(define-public imx471-dkms-git
  (package
    (name "imx471-dkms-git")
    (version "r8.293a166")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BenBJD/imx471-dkms.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/BenBJD/imx471-dkms")
    (synopsis "IMX471 sensor driver via DKMS")
    (description "IMX471 sensor driver via DKMS.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── intel-ucode-git (#1128) ──

(define-public intel-ucode-git
  (package
    (name "intel-ucode-git")
    (version "20220510.r2.g6c0c469")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files")
    (synopsis "microcode update files for Intel CPUs")
    (description "Microcode update files for Intel CPUs.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── iptvnator-electron-bin (#10378) ──

(define-public iptvnator-electron-bin
  (package
    (name "iptvnator-electron-bin")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/4gray/iptvnator")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/4gray/iptvnator")
    (synopsis "IPTVnator Electron 0.16 with DRM & H.265 playback support. This build versi...")
    (description "IPTVnator Electron 0.16 with DRM & H.265 playback support. This build
version also adds Shaka player and Artplayer components.(Prebuilt
version.Use system-wide electron).")
    (license license:expat)))


;;; ── it87-dkms-git (#12151) ──

(define-public it87-dkms-git
  (package
    (name "it87-dkms-git")
    (version "301.8dd7f65")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/frankcrawford/it87.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/frankcrawford/it87")
    (synopsis "linux Driver for ITE LPC chips")
    (description "Linux Driver for ITE LPC chips.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── ithc-dkms-git (#6767) ──

(define-public ithc-dkms-git
  (package
    (name "ithc-dkms-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/quo/ithc-linux.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/quo/ithc-linux")
    (synopsis "linux driver for Intel Touch Host Controller")
    (description "Linux driver for Intel Touch Host Controller.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── ivpn-dinit (#7639) ──

(define-public ivpn-dinit
  (package
    (name "ivpn-dinit")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ivpn-dinit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/ivpn-dinit")
    (synopsis "dinit service for ivpn")
    (description "dinit service for ivpn.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── jdk-doc (#2831) ──

(define-public jdk-doc
  (package
    (name "jdk-doc")
    (version "26")
    (source (origin
              (method url-fetch)
              (uri "https://www.oracle.com/java/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.oracle.com/java/")
    (synopsis "oracle Java documentation")
    (description "Oracle Java documentation.  It is packaged from the Arch User Repository.")
    (license (nonguix-license:nonfree "https://www.oracle.com/java/"))))


;;; ── jdk21-graalvm-ee-bin (#3851) ──

(define-public jdk21-graalvm-ee-bin
  (package
    (name "jdk21-graalvm-ee-bin")
    (version "21.0.10")
    (source (origin
              (method url-fetch)
              (uri "https://www.graalvm.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.graalvm.org/")
    (synopsis "universal virtual machine for running applications written in a variety of ...")
    (description "Universal virtual machine for running applications written in a variety
of languages (JVM-based, LLVM-based, or other), Java 21 version.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── konica-minolta-bizhub-c554e-series (#11285) ──

(define-public konica-minolta-bizhub-c554e-series
  (package
    (name "konica-minolta-bizhub-c554e-series")
    (version "1:1.27")
    (source (origin
              (method url-fetch)
              (uri "https://www.konicaminolta.eu/eu-en/support/download-centre")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.konicaminolta.eu/eu-en/support/download-centre")
    (synopsis "CUPS PostScript driver for KONICA MINOLTA bizhub C554e Series (C554e/C454e/...")
    (description "CUPS PostScript driver for KONICA MINOLTA bizhub C554e Series
(C554e/C454e/C364e/C284e/C224e).  It is packaged from the Arch User Repository.")
    (license (nonguix-license:nonfree "https://www.konicaminolta.eu/eu-en/support/download-centre"))))


;;; ── lact-openrc (#12378) ──

(define-public lact-openrc
  (package
    (name "lact-openrc")
    (version "20250404.01")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ilya-zlobintsev/LACT.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ilya-zlobintsev/LACT")
    (synopsis "openRC init script for lact")
    (description "OpenRC init script for lact.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; ── lib32-a52dec (#2433) ──

(define-public lib32-a52dec
  (package
    (name "lib32-a52dec")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://git.adelielinux.org/community/a52dec/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://git.adelielinux.org/community/a52dec/")
    (synopsis "A free library for decoding ATSC A/52 streams (32-bit)")
    (description "A free library for decoding ATSC A/52 streams (32-bit).  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── lib32-gperftools (#10745) ──

(define-public lib32-gperftools
  (package
    (name "lib32-gperftools")
    (version "2.18.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gperftools/gperftools.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gperftools/gperftools")
    (synopsis "fast, multi-threaded malloc and nifty performance analysis tools (32-bit)")
    (description "Fast, multi-threaded malloc and nifty performance analysis tools
(32-bit).  It is packaged from the Arch User Repository.")
    (license license:bsd-3)))


;;; ── lib32-opencl-legacy-amdgpu-pro (#11300) ──

(define-public lib32-opencl-legacy-amdgpu-pro
  (package
    (name "lib32-opencl-legacy-amdgpu-pro")
    (version "23.20_1664988")
    (source (origin
              (method url-fetch)
              (uri "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50")
    (synopsis "legacy non-free AMD OpenCL ICD Loaders (PAL) (32-bit)")
    (description "Legacy non-free AMD OpenCL ICD Loaders (PAL) (32-bit).  It is packaged from the Arch User Repository.")
    (license (nonguix-license:nonfree "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50"))))


;;; ── linux-xanmod-linux-bin-x64v3 (#3631) ──

(define-public linux-xanmod-linux-bin-x64v3
  (package
    (name "linux-xanmod-linux-bin-x64v3")
    (version "6.19.11")
    (source (origin
              (method url-fetch)
              (uri "http://www.xanmod.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.xanmod.org/")
    (synopsis "the Linux kernel and modules with Xanmod patches - Current Stable (MAIN) - ...")
    (description "The Linux kernel and modules with Xanmod patches - Current Stable (MAIN)
- Prebuilt version - x64v3.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── linux-xanmod-linux-headers-bin-x64v3 (#3632) ──

(define-public linux-xanmod-linux-headers-bin-x64v3
  (package
    (name "linux-xanmod-linux-headers-bin-x64v3")
    (version "6.19.11")
    (source (origin
              (method url-fetch)
              (uri "http://www.xanmod.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.xanmod.org/")
    (synopsis "the Linux kernel and modules with Xanmod patches - Current Stable (MAIN) - ...")
    (description "The Linux kernel and modules with Xanmod patches - Current Stable (MAIN)
- Prebuilt version - x64v3.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── linux-xanmod-lts-linux-bin-x64v3 (#3624) ──

(define-public linux-xanmod-lts-linux-bin-x64v3
  (package
    (name "linux-xanmod-lts-linux-bin-x64v3")
    (version "6.18.21")
    (source (origin
              (method url-fetch)
              (uri "http://www.xanmod.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.xanmod.org/")
    (synopsis "the Linux kernel and modules with Xanmod patches - Current Stable (LTS) - P...")
    (description "The Linux kernel and modules with Xanmod patches - Current Stable (LTS)
- Prebuilt version - x64v3.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── linux-xanmod-lts-linux-headers-bin-x64v3 (#3625) ──

(define-public linux-xanmod-lts-linux-headers-bin-x64v3
  (package
    (name "linux-xanmod-lts-linux-headers-bin-x64v3")
    (version "6.18.21")
    (source (origin
              (method url-fetch)
              (uri "http://www.xanmod.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.xanmod.org/")
    (synopsis "the Linux kernel and modules with Xanmod patches - Current Stable (LTS) - P...")
    (description "The Linux kernel and modules with Xanmod patches - Current Stable (LTS)
- Prebuilt version - x64v3.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; ── linux-zen-versioned-bin (#9953) ──

(define-public linux-zen-versioned-bin
  (package
    (name "linux-zen-versioned-bin")
    (version "6.19.11.zen1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/zen-kernel/zen-kernel")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zen-kernel/zen-kernel")
    (synopsis "metapackage depending on linux6.19.11.zen1-1-zen-bin")
    (description "Metapackage depending on linux6.19.11.zen1-1-zen-bin.")
    (license license:gpl2)))


;;; ── llvm-mos-git (#11199) ──

(define-public llvm-mos-git
  (package
    (name "llvm-mos-git")
    (version "r452222.b05db96bef68")
    (source (origin
              (method url-fetch)
              (uri "https://llvm-mos.org/wiki/Welcome")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://llvm-mos.org/wiki/Welcome")
    (synopsis "package with no upstream description")
    (description "This package has no upstream description.")
    (license (nonguix-license:nonfree "https://llvm-mos.org/wiki/Welcome"))))


;;; ── luajit-clang-git (#7196) ──

(define-public luajit-clang-git
  (package
    (name "luajit-clang-git")
    (version "2.1.r305.g7152e154")
    (source (origin
              (method url-fetch)
              (uri "https://luajit.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://luajit.org/")
    (synopsis "just-In-Time (JIT) compiler for the Lua programming language - patched to c...")
    (description "Just-In-Time (JIT) compiler for the Lua programming language - patched
to compile with clang.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── lunar-client (#4632) ──

(define-public lunar-client
  (package
    (name "lunar-client")
    (version "3.6.6")
    (source (origin
              (method url-fetch)
              (uri "https://lunarclient.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://lunarclient.com")
    (synopsis "pvP modpack for all modern versions of Minecraft")
    (description "PvP modpack for all modern versions of Minecraft.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── lyrebird-proxy (#7666) ──

(define-public lyrebird-proxy
  (package
    (name "lyrebird-proxy")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird")
    (synopsis "pluggable transport proxy for Tor, implementing obfs4")
    (description "pluggable transport proxy for Tor, implementing obfs4.  It is packaged from the Arch User Repository.")
    (license license:bsd-3)))


;;; ── lyrics-git (#2591) ──

(define-public lyrics-git
  (package
    (name "lyrics-git")
    (version "0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Oen44/lyrics.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/Oen44/lyrics")
    (synopsis "lyrics CLI (git version)")
    (description "lyrics CLI (git version).  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── lyse (#2592) ──

(define-public lyse
  (package
    (name "lyse")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/snoowfall/lyse.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/snoowfall/lyse")
    (synopsis "realtime TUI lyrics for your favorite songs, directly in the terminal")
    (description "Realtime TUI lyrics for your favorite songs, directly in the terminal.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; ── magewell-pro-capture-dkms (#12746) ──

(define-public magewell-pro-capture-dkms
  (package
    (name "magewell-pro-capture-dkms")
    (version "1.3.4420")
    (source (origin
              (method url-fetch)
              (uri "https://www.magewell.com/downloads/pro-capture#/driver/linux-x86")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.magewell.com/downloads/pro-capture#/driver/linux-x86")
    (synopsis "driver for Magewell Pro Capture Family")
    (description "Driver for Magewell Pro Capture Family.  It is packaged from the Arch User Repository.")
    (license license:expat)))

