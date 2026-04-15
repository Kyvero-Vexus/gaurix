;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- deptree-resolver-260414u
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260414u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system node)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (nvidia-sync
            easytax-ag-2024
            pacman-cleanup-hook
            r8125-dkms
            bcachefs-kernel-dkms-git
            ntfsplus-dkms-git
            r8152-dkms
            ryzen-smu-dkms-git
            xpad-dkms-git
            zenpower3-dkms
            zenpower3-dkms-git
            zenpower5-dkms-git
            aic8800-dkms
            ajantv2-dkms
            droidcam-dkms-git
            kernelsu-dkms
            linux-apfs-rw-dkms-git
            mkinitcpio-wifi
            msi-psu-dkms
            nifskope-git
            r8127-dkms
            rtw88-dkms-git
            rtw89-dkms-git
            ttf-ms-win11-fod-auto-paneuropean
            ttf-ms-win11-fod-auto-sinh
            ttf-ms-win11-fod-auto-syrc
            ttf-ms-win11-fod-auto-taml
            ttf-ms-win11-fod-auto-telu
            ttf-ms-win11-fod-auto-thai
            ttf-vista-fonts
            unifi
            v4l2loopback-dkms-git
            vintagestory-server
            vrk-mpollux-digisign-client
            vrms-arch
            wreckfest2-wine-steam
            xone-dkms
            xone-dkms-git
            zfs-dkms-staging-compat-git
            ankama-launcher
            antiafk-rbx-sober
            apifox-appimage
            arch-upgrader-git
            archforge-git
            archium
            aurvote-utils-git
            banyanapp
            brother-lpr-drivers-laser
            connect-tunnel
            cowtotext
            css-inline
            deepfilternet-demos-git
            dela-git
            dell-command-configure
            discord-rpc-wine-git
            doublecmd-admin
            drawio-live-bin
            easy-switcher-git
            encfsui
            evcxr-jupyter
            fcitx5-sitelen-pona
            ffvship
            flexo
            foobard-git
            franz
            freesmlauncher-bin
            gj-git
            gksu
            gnome-shell-extension-quick-settings-tweaks-git
            gui-for-singbox
            guiless-bing-search
            gummibbs
            haveno))

(define-public nvidia-sync
  (package
    (name "nvidia-sync")
    (version "0.64.24")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-sync.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA Sync is a desktop app that connects your computer to your DGX Spar")
    (description "NVIDIA Sync is a desktop app that connects your computer to your DGX Spark over the local network. It gives you a single interface to manage SSH access and launch development tools on your DGX Spark.")
    (home-page "https://build.nvidia.com/spark/connect-to-your-spark/sync")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public easytax-ag-2024
  (package
    (name "easytax-ag-2024")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/easytax-ag-2024.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aargau tax declaration software")
    (description "Aargau tax declaration software.")
    (home-page "https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public pacman-cleanup-hook
  (package
    (name "pacman-cleanup-hook")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacman-cleanup-hook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hook to cleanup pacman cache keeping only the installed plus next most re")
    (description "hook to cleanup pacman cache keeping only the installed plus next most recent packages.")
    (home-page "https://aur.archlinux.org/packages/pacman-cleanup-hook")
    (license license:expat)))

(define-public r8125-dkms
  (package
    (name "r8125-dkms")
    (version "9.017.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r8125-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for RTL8125")
    (description "Kernel module for RTL8125.")
    (home-page "https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software")
    (license license:gpl2)))

(define-public bcachefs-kernel-dkms-git
  (package
    (name "bcachefs-kernel-dkms-git")
    (version "20260302131047.6ebab1b41eda")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/koverstreet/bcachefs")
                    (commit "v20260302131047.6ebab1b41eda"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bcachefs DKMS module from upstream bcachefs kernel sources")
    (description "Bcachefs DKMS module from upstream bcachefs kernel sources.")
    (home-page "https://github.com/koverstreet/bcachefs")
    (license license:gpl2)))

(define-public ntfsplus-dkms-git
  (package
    (name "ntfsplus-dkms-git")
    (version "2026.02.07+e6e7478")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/namjaejeon/linux-ntfs")
                    (commit "v2026.02.07+e6e7478"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DKMS module for ntfs (with aliases)")
    (description "DKMS module for ntfs (with aliases).")
    (home-page "https://github.com/namjaejeon/linux-ntfs")
    (license license:gpl2)))

(define-public r8152-dkms
  (package
    (name "r8152-dkms")
    (version "2.21.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r8152-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a kernel module for Realtek RTL8152/RTL8153/RTL8154/RTL8156 Based USB Eth")
    (description "A kernel module for Realtek RTL8152/RTL8153/RTL8154/RTL8156 Based USB Ethernet Adapters.")
    (home-page "http://www.realtek.com")
    (license license:gpl2)))

(define-public ryzen-smu-dkms-git
  (package
    (name "ryzen-smu-dkms-git")
    (version "181.9f9569f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amkillam/ryzen_smu")
                    (commit "v181.9f9569f"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Linux kernel driver that exposes access to the SMU (System Management U")
    (description "A Linux kernel driver that exposes access to the SMU (System Management Unit) for certain AMD Ryzen Processors.")
    (home-page "https://github.com/amkillam/ryzen_smu")
    (license license:gpl2)))

(define-public xpad-dkms-git
  (package
    (name "xpad-dkms-git")
    (version "r127.9caad15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paroj/xpad")
                    (commit "vr127.9caad15"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "driver for the Xbox/ Xbox 360/ Xbox 360 Wireless/ Xbox One Controllers")
    (description "Driver for the Xbox/ Xbox 360/ Xbox 360 Wireless/ Xbox One Controllers.")
    (home-page "https://github.com/paroj/xpad")
    (license license:gpl2+)))

(define-public zenpower3-dkms
  (package
    (name "zenpower3-dkms")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AliEmreSenel/zenpower3")
                    (commit "v0.2.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Linux kernel driver for reading sensors for AMD Zen family CPUs")
    (description "Linux kernel driver for reading sensors for AMD Zen family CPUs.")
    (home-page "https://github.com/AliEmreSenel/zenpower3")
    (license license:gpl2)))

(define-public zenpower3-dkms-git
  (package
    (name "zenpower3-dkms-git")
    (version "r73.dc4f1e2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AliEmreSenel/zenpower3")
                    (commit "vr73.dc4f1e2"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Linux kernel driver for reading temperature, voltage(SVI2), current(SVI")
    (description "A Linux kernel driver for reading temperature, voltage(SVI2), current(SVI2) and power(SVI2) for AMD Zen family CPUs, now with Zen 3 support'.")
    (home-page "https://github.com/AliEmreSenel/zenpower3")
    (license license:gpl2)))

(define-public zenpower5-dkms-git
  (package
    (name "zenpower5-dkms-git")
    (version "0.5.0.r3.g66871d8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mattkeenan/zenpower5")
                    (commit "v0.5.0.r3.g66871d8"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Linux kernel driver for AMD Zen CPU monitoring (Zen 1-5): temperature, vo")
    (description "Linux kernel driver for AMD Zen CPU monitoring (Zen 1-5): temperature, voltage, current, and power via SVI2/RAPL. Multi-file architecture with Zen 5 (Strix Halo) support.")
    (home-page "https://github.com/mattkeenan/zenpower5")
    (license license:gpl2)))

(define-public aic8800-dkms
  (package
    (name "aic8800-dkms")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aic8800-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel modules for BrosTrend AX300 WiFi 6")
    (description "Kernel modules for BrosTrend AX300 WiFi 6.")
    (home-page "https://linux.brostrend.com/troubleshooting/source-code/")
    (license license:gpl2)))

(define-public ajantv2-dkms
  (package
    (name "ajantv2-dkms")
    (version "17.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aja-video/libajantv2")
                    (commit "v17.5.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source device driver for discovering, interrogating and controlling ")
    (description "Open-source device driver for discovering, interrogating and controlling NTV2 professional video I/O devices from AJA Video Systems, Inc.")
    (home-page "https://github.com/aja-video/libajantv2")
    (license license:expat)))

(define-public droidcam-dkms-git
  (package
    (name "droidcam-dkms-git")
    (version "v2.1.2.r149.add5733")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/droidcam-dkms-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for using your android device as a wireless/usb webcam (DKMS)")
    (description "A tool for using your android device as a wireless/usb webcam (DKMS).")
    (home-page "https://www.dev47apps.com/droidcam/linux/")
    (license license:gpl2)))

(define-public kernelsu-dkms
  (package
    (name "kernelsu-dkms")
    (version "3.1.0+80+g489cb029")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/supechicken/KernelSU")
                    (commit "v3.1.0+80+g489cb029"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Kernel based root solution for Android")
    (description "A Kernel based root solution for Android. DKMS module for Container-based solutions such as Waydroid.")
    (home-page "https://github.com/supechicken/KernelSU")
    (license license:gpl2)))

(define-public linux-apfs-rw-dkms-git
  (package
    (name "linux-apfs-rw-dkms-git")
    (version "0.3.14.r0.g7d8dc88")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linux-apfs/linux-apfs-rw")
                    (commit "v0.3.14.r0.g7d8dc88"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental APFS kernel module with Write support (DKMS)")
    (description "Experimental APFS kernel module with Write support (DKMS).")
    (home-page "https://github.com/linux-apfs/linux-apfs-rw")
    (license license:gpl2)))

(define-public mkinitcpio-wifi
  (package
    (name "mkinitcpio-wifi")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mkinitcpio-wifi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mkinitcpio hook to enable wifi remote access")
    (description "mkinitcpio hook to enable wifi remote access.")
    (home-page "https://aur.archlinux.org/packages/mkinitcpio-wifi/")
    (license license:gpl3+)))

(define-public msi-psu-dkms
  (package
    (name "msi-psu-dkms")
    (version "1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JackDoan/msi-psu")
                    (commit "v1"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mSIPSU Kernel Module (DKMS)")
    (description "MSIPSU Kernel Module (DKMS).")
    (home-page "https://github.com/JackDoan/msi-psu")
    (license license:gpl2)))

(define-public nifskope-git
  (package
    (name "nifskope-git")
    (version "1.1.3.864.g30954e7f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nifskope-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility for opening and editing the NetImmerse (NIF) file format")
    (description "Utility for opening and editing the NetImmerse (NIF) file format.")
    (home-page "http://niftools.org")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public r8127-dkms
  (package
    (name "r8127-dkms")
    (version "11.016.00")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r8127-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for Realtek 10GB Ethernet NICs")
    (description "Kernel module for Realtek 10GB Ethernet NICs.")
    (home-page "https://www.realtek.com/Download/List?cate_id=584")
    (license license:gpl2)))

(define-public rtw88-dkms-git
  (package
    (name "rtw88-dkms-git")
    (version "r675.52072d8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lwfinger/rtw88")
                    (commit "vr675.52072d8"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "drivers for Realtek 802")
    (description "Drivers for Realtek 802.11n/802.11ac wireless chips.")
    (home-page "https://github.com/lwfinger/rtw88")
    (license license:gpl2)))

(define-public rtw89-dkms-git
  (package
    (name "rtw89-dkms-git")
    (version "r1673.84a2572")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/morrownr/rtw89")
                    (commit "vr1673.84a2572"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "drivers for Realtek Wi-Fi 6/6E and Wi-Fi 7 adapters")
    (description "Drivers for Realtek Wi-Fi 6/6E and Wi-Fi 7 adapters.")
    (home-page "https://github.com/morrownr/rtw89")
    (license license:gpl2)))

(define-public ttf-ms-win11-fod-auto-paneuropean
  (package
    (name "ttf-ms-win11-fod-auto-paneuropean")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-fod-auto-paneuropean.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 11 TrueType FOD fonts (paneuropean)")
    (description "Microsoft Windows 11 TrueType FOD fonts (paneuropean).")
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public ttf-ms-win11-fod-auto-sinh
  (package
    (name "ttf-ms-win11-fod-auto-sinh")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-fod-auto-sinh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 11 TrueType FOD fonts (sinh)")
    (description "Microsoft Windows 11 TrueType FOD fonts (sinh).")
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public ttf-ms-win11-fod-auto-syrc
  (package
    (name "ttf-ms-win11-fod-auto-syrc")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-fod-auto-syrc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 11 TrueType FOD fonts (syrc)")
    (description "Microsoft Windows 11 TrueType FOD fonts (syrc).")
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public ttf-ms-win11-fod-auto-taml
  (package
    (name "ttf-ms-win11-fod-auto-taml")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-fod-auto-taml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 11 TrueType FOD fonts (taml)")
    (description "Microsoft Windows 11 TrueType FOD fonts (taml).")
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public ttf-ms-win11-fod-auto-telu
  (package
    (name "ttf-ms-win11-fod-auto-telu")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-fod-auto-telu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 11 TrueType FOD fonts (telu)")
    (description "Microsoft Windows 11 TrueType FOD fonts (telu).")
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public ttf-ms-win11-fod-auto-thai
  (package
    (name "ttf-ms-win11-fod-auto-thai")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-fod-auto-thai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 11 TrueType FOD fonts (thai)")
    (description "Microsoft Windows 11 TrueType FOD fonts (thai).")
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public ttf-vista-fonts
  (package
    (name "ttf-vista-fonts")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-vista-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Vista and Office 2007 True Type Fonts")
    (description "Microsoft Vista and Office 2007 True Type Fonts.")
    (home-page "https://docs.microsoft.com/en-us/typography/fonts/font-faq")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public unifi
  (package
    (name "unifi")
    (version "10.1.89")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unifi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "centralized management system for Ubiquiti UniFi AP")
    (description "Centralized management system for Ubiquiti UniFi AP.")
    (home-page "https://unifi-network.ui.com")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public v4l2loopback-dkms-git
  (package
    (name "v4l2loopback-dkms-git")
    (version "0.12.5.r232.g2fa9d6d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/umlaeute/v4l2loopback")
                    (commit "v0.12.5.r232.g2fa9d6d"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "v4l2-loopback device")
    (description "v4l2-loopback device.")
    (home-page "https://github.com/umlaeute/v4l2loopback")
    (license license:gpl2)))

(define-public vintagestory-server
  (package
    (name "vintagestory-server")
    (version "1.21.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vintagestory-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an in-development indie sandbox game about innovation and exploration--se")
    (description "An in-development indie sandbox game about innovation and exploration--server package.")
    (home-page "https://www.vintagestory.at/")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public vrk-mpollux-digisign-client
  (package
    (name "vrk-mpollux-digisign-client")
    (version "4.4.0_9019")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vrk-mpollux-digisign-client.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "client program for Finnish chip ID cards")
    (description "Client program for Finnish chip ID cards.")
    (home-page "https://dvv.fi/linux-versiot")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public vrms-arch
  (package
    (name "vrms-arch")
    (version "0.1.0.r25.g802c767")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/orospakr/vrms-arch")
                    (commit "v0.1.0.r25.g802c767"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vrms for ArchLinux")
    (description "vrms for ArchLinux.")
    (home-page "https://github.com/orospakr/vrms-arch")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public wreckfest2-wine-steam
  (package
    (name "wreckfest2-wine-steam")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wreckfest2-wine-steam.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wreckfest 2 using WINE/Proton (umu-launcher) with data via Steam")
    (description "Wreckfest 2 using WINE/Proton (umu-launcher) with data via Steam.")
    (home-page "https://store.steampowered.com/app/1203190/Wreckfest_2/")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public xone-dkms
  (package
    (name "xone-dkms")
    (version "0.5.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dlundqvist/xone")
                    (commit "v0.5.8"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern Linux driver for Xbox One and Xbox Series X|S controllers")
    (description "Modern Linux driver for Xbox One and Xbox Series X|S controllers.")
    (home-page "https://github.com/dlundqvist/xone")
    (license license:gpl2+)))

(define-public xone-dkms-git
  (package
    (name "xone-dkms-git")
    (version "0.5.8.r0.gf2aa9fe")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dlundqvist/xone")
                    (commit "v0.5.8.r0.gf2aa9fe"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern Linux driver for Xbox One and Xbox Series X|S controllers")
    (description "Modern Linux driver for Xbox One and Xbox Series X|S controllers.")
    (home-page "https://github.com/dlundqvist/xone")
    (license license:gpl2+)))

(define-public zfs-dkms-staging-compat-git
  (package
    (name "zfs-dkms-staging-compat-git")
    (version "2.3.5.r0.gab38521f31")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zfs-dkms-staging-compat-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel modules for the Zettabyte File System (release staging branch) wit")
    (description "Kernel modules for the Zettabyte File System (release staging branch) with compatibility patches for latest stable kernel.")
    (home-page "https://zfsonlinux.org/")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public ankama-launcher
  (package
    (name "ankama-launcher")
    (version "3.14.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ankama-launcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a multi-game portal for all Ankama games")
    (description "A multi-game portal for all Ankama games.")
    (home-page "https://www.ankama.com/en/launcher")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public antiafk-rbx-sober
  (package
    (name "antiafk-rbx-sober")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Agzes/AntiAFK-RBX-Sober")
                    (commit "v0.2.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the best program for AntiAFK for Sober (roblox)")
    (description "The best program for AntiAFK for Sober (roblox). Or just Sober Anti-AFK.")
    (home-page "https://github.com/Agzes/AntiAFK-RBX-Sober")
    (license license:expat)))

(define-public apifox-appimage
  (package
    (name "apifox-appimage")
    (version "2.8.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apifox-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apifox - API documentation, debugging, mocking, and testing tool (AppImag")
    (description "Apifox - API documentation, debugging, mocking, and testing tool (AppImage in Zip) API 文档、API 调试、API Mock、API 自动化测试.")
    (home-page "https://apifox.com")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public arch-upgrader-git
  (package
    (name "arch-upgrader-git")
    (version "1.1.0.r1.g737dfec")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Drazape/arch-upgrader")
                    (commit "v1.1.0.r1.g737dfec"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "update Arch: pacman & flatpak, rank mirrors, send notification on update ")
    (description "Update Arch: pacman & flatpak, rank mirrors, send notification on update and failure.")
    (home-page "https://github.com/Drazape/arch-upgrader")
    (license license:expat)))

(define-public archforge-git
  (package
    (name "archforge-git")
    (version "0.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Scqxd/archforge")
                    (commit "v0.2.2"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI-powered TUI for PKGBUILD generation and AUR management")
    (description "AI-powered TUI for PKGBUILD generation and AUR management.")
    (home-page "https://github.com/Scqxd/archforge")
    (license license:expat)))

(define-public archium
  (package
    (name "archium")
    (version "1.10.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/keircn/archium")
                    (commit "v1.10.4"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast & Easy Package Management for Arch Linux")
    (description "Fast & Easy Package Management for Arch Linux.")
    (home-page "https://github.com/keircn/archium")
    (license license:gpl3+)))

(define-public aurvote-utils-git
  (package
    (name "aurvote-utils-git")
    (version "1.1.0.r7.g3e82548")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gwuen/aurvote-utils")
                    (commit "v1.1.0.r7.g3e82548"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of utilities for managing AUR votes")
    (description "A set of utilities for managing AUR votes.")
    (home-page "https://github.com/gwuen/aurvote-utils")
    (license license:expat)))

(define-public banyanapp
  (package
    (name "banyanapp")
    (version "3.28.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/banyanapp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zero trust secure access for modern enterprise")
    (description "Zero trust secure access for modern enterprise.")
    (home-page "https://www.banyansecurity.io/")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public brother-lpr-drivers-laser
  (package
    (name "brother-lpr-drivers-laser")
    (version "2.0.1_3_0ubuntu5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-lpr-drivers-laser.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lPR drivers for DCP-7010 DCP-7020 DCP-7025 DCP-8060 DCP-8065DN FAX-2820 F")
    (description "LPR drivers for DCP-7010 DCP-7020 DCP-7025 DCP-8060 DCP-8065DN FAX-2820 FAX-2920 HL-2030 HL-2040 HL-2070N HL-5240 HL-5250DN HL-5270DN HL-5280DW MFC-7220 MFC-7225N MFC-7420 MFC-7820N MFC-8460N MFC-8660DN MFC-8860DN MFC-8870DW.")
    (home-page "http://solutions.brother.com/linux/en_us/index.html")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public connect-tunnel
  (package
    (name "connect-tunnel")
    (version "12.50.00221")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/connect-tunnel.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sonicWALL Connect Tunnel VPN Client")
    (description "SonicWALL Connect Tunnel VPN Client.")
    (home-page "https://www.sonicwall.com/products/remote-access/vpn-clients/")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public cowtotext
  (package
    (name "cowtotext")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MeIsGaming/cow-to-text")
                    (commit "v1.0.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "real-time audio transcription and translation tool using Whisper and Argo")
    (description "Real-time audio transcription and translation tool using Whisper and Argos Translate.")
    (home-page "https://github.com/MeIsGaming/cow-to-text")
    (license license:expat)))

(define-public css-inline
  (package
    (name "css-inline")
    (version "0.20.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Stranger6667/css-inline")
                    (commit "v0.20.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high-performance library for inlining CSS into HTML 'style' attributes")
    (description "High-performance library for inlining CSS into HTML 'style' attributes.")
    (home-page "https://github.com/Stranger6667/css-inline")
    (license license:expat)))

(define-public deepfilternet-demos-git
  (package
    (name "deepfilternet-demos-git")
    (version "v0.5.6.r89.gd375b2d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Rikorose/DeepFilterNet")
                    (commit "vv0.5.6.r89.gd375b2d"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz)")
    (description "A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using Deep Filtering (Git version) - demo application.")
    (home-page "https://github.com/Rikorose/DeepFilterNet")
    (license license:asl2.0)))

(define-public dela-git
  (package
    (name "dela-git")
    (version "r218.90fc83b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aleyan/dela")
                    (commit "vr218.90fc83b"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a task runner that delegates the work to other tools")
    (description "A task runner that delegates the work to other tools.")
    (home-page "https://github.com/aleyan/dela")
    (license license:expat)))

(define-public dell-command-configure
  (package
    (name "dell-command-configure")
    (version "5.1.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dell-command-configure.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "configure various BIOS features on Dell laptops")
    (description "Configure various BIOS features on Dell laptops.")
    (home-page "https://www.dell.com/support/kbdoc/000178000/dell-command-configure")
    (license (license:non-copyleft "file://LICENSE"))))


(define-public discord-rpc-wine-git
  (package
    (name "discord-rpc-wine-git")
    (version "1.0.0.r2.ge432eb6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mellowagain/rpc-wine")
                    (commit "v1.0.0.r2.ge432eb6"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "discord-rpc implementation for Wine allowing Wine games to interact with ")
    (description "discord-rpc implementation for Wine allowing Wine games to interact with native Discord.")
    (home-page "https://github.com/mellowagain/rpc-wine")
    (license license:expat)))

(define-public doublecmd-admin
  (package
    (name "doublecmd-admin")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/doublecmd-admin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run Double Commander as root")
    (description "Run Double Commander as root.")
    (home-page "http://doublecmd.sourceforge.net/")
    (license license:gpl3)))

(define-public drawio-live-bin
  (package
    (name "drawio-live-bin")
    (version "29.6.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/drawio-live-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "diagram drawing application desktop built on web technology (Live version)")
    (description "Diagram drawing application desktop built on web technology (Live version).")
    (home-page "https://www.drawio.com")
    (license license:asl2.0)))

(define-public easy-switcher-git
  (package
    (name "easy-switcher-git")
    (version "0.4.r32.gb1af840")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/freemind001/preview")
                    (commit "v0.4.r32.gb1af840"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "keyboard layout switcher for Linux (git version)")
    (description "Keyboard layout switcher for Linux (git version).")
    (home-page "https://github.com/freemind001/preview")
    (license license:gpl2)))

(define-public encfsui
  (package
    (name "encfsui")
    (version "1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bulletmark/encfsui")
                    (commit "v1.6"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "encrypted filesystem encfs GUI wrapper")
    (description "Encrypted filesystem encfs GUI wrapper.")
    (home-page "https://github.com/bulletmark/encfsui")
    (license license:gpl3)))

(define-public evcxr-jupyter
  (package
    (name "evcxr-jupyter")
    (version "0.21.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google/evcxr/tree/main/evcxr_jupyter")
                    (commit "v0.21.1"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Jupyter Kernel for the Rust programming language")
    (description "A Jupyter Kernel for the Rust programming language.")
    (home-page "https://github.com/google/evcxr/tree/main/evcxr_jupyter")
    (license license:asl2.0)))

(define-public fcitx5-sitelen-pona
  (package
    (name "fcitx5-sitelen-pona")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Toastberries/fcitx5-sitelen-pona")
                    (commit "v1.1.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fcitx5 table for translating latin characters into toki pona's sitelen po")
    (description "fcitx5 table for translating latin characters into toki pona's sitelen pona glyphs.")
    (home-page "https://github.com/Toastberries/fcitx5-sitelen-pona")
    (license license:expat)))

(define-public ffvship
  (package
    (name "ffvship")
    (version "4.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/Line-fr/Vship")
                    (commit "v4.1.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI tool for computing the metric difference between two videos")
    (description "CLI tool for computing the metric difference between two videos.")
    (home-page "https://codeberg.org/Line-fr/Vship")
    (license license:expat)))

(define-public flexo
  (package
    (name "flexo")
    (version "1.6.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nroi/flexo")
                    (commit "v1.6.10"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a central pacman cache")
    (description "A central pacman cache.")
    (home-page "https://github.com/nroi/flexo")
    (license license:expat)))

(define-public foobard-git
  (package
    (name "foobard-git")
    (version "0.r5.e57d8ad")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~dropbear/foobard")
                    (commit "v0.r5.e57d8ad"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "client for controlling Foobar2000 through MPRIS (media controller)")
    (description "Client for controlling Foobar2000 through MPRIS (media controller).")
    (home-page "https://git.sr.ht/~dropbear/foobard")
    (license license:bsd-3)))

(define-public franz
  (package
    (name "franz")
    (version "5.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meetfranz/franz")
                    (commit "v5.11.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "messaging app for WhatsApp, Slack, Telegram, Gmail, Hangouts and many man")
    (description "Messaging app for WhatsApp, Slack, Telegram, Gmail, Hangouts and many many more.")
    (home-page "https://github.com/meetfranz/franz")
    (license license:asl2.0)))

(define-public freesmlauncher-bin
  (package
    (name "freesmlauncher-bin")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freesmlauncher-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minecraft launcher with offline accounts support (binary release)")
    (description "Minecraft launcher with offline accounts support (binary release).")
    (home-page "https://freesmlauncher.org/")
    (license license:gpl3+)))

(define-public gj-git
  (package
    (name "gj-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/efekrskl/gj")
                    (commit "v0.2.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gj is a dead simple journaling CLI")
    (description "gj is a dead simple journaling CLI. Type your thoughts into the terminal — they get logged to Notion, one page per day. No clutter, no fuss.")
    (home-page "https://github.com/efekrskl/gj")
    (license license:expat)))

(define-public gksu
  (package
    (name "gksu")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gksu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a graphical frontend for su")
    (description "A graphical frontend for su.")
    (home-page "http://www.nongnu.org/gksu/index.html")
    (license license:gpl3+)))

(define-public gnome-shell-extension-quick-settings-tweaks-git
  (package
    (name "gnome-shell-extension-quick-settings-tweaks-git")
    (version "2.2.stable.r7.g8e03bb6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qwreey75/quick-settings-tweaks")
                    (commit "v2.2.stable.r7.g8e03bb6"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GNOME extension which allows you to customize the new Quick Settings Pa")
    (description "A GNOME extension which allows you to customize the new Quick Settings Panel to your liking.")
    (home-page "https://github.com/qwreey75/quick-settings-tweaks")
    (license license:lgpl3+)))

(define-public gui-for-singbox
  (package
    (name "gui-for-singbox")
    (version "1.20.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GUI-for-Cores/GUI.for.SingBox")
                    (commit "v1.20.0"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI for SingBox")
    (description "GUI for SingBox.")
    (home-page "https://github.com/GUI-for-Cores/GUI.for.SingBox")
    (license license:gpl3)))

(define-public guiless-bing-search
  (package
    (name "guiless-bing-search")
    (version "r15.20260404.56c849e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wszqkzqk/GUILessBingSearch")
                    (commit "vr15.20260404.56c849e"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for accessing Bing search results in GUI-less environments")
    (description "A tool for accessing Bing search results in GUI-less environments.")
    (home-page "https://github.com/wszqkzqk/GUILessBingSearch")
    (license license:gpl3+)))

(define-public gummibbs
  (package
    (name "gummibbs")
    (version "r306.7922ae8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lucas-mior/gummibbs")
                    (commit "vr306.7922ae8"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "btrfs snapshot scripts with systemd-boot integration")
    (description "Btrfs snapshot scripts with systemd-boot integration.")
    (home-page "https://github.com/lucas-mior/gummibbs")
    (license license:agpl3)))

(define-public haveno
  (package
    (name "haveno")
    (version "1.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haveno-dex/haveno")
                    (commit "v1.2.3"))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "decentralised P2P exchange built on Monero and Tor")
    (description "Decentralised P2P exchange built on Monero and Tor.")
    (home-page "https://github.com/haveno-dex/haveno")
    (license license:agpl3+)))

