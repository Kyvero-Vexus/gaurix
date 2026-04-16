;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260416a
;;; Resolves 99 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260416a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (expressvpn
            crark
            arch-store
            grml-iso
            monika-after-story-cn
            pactime
            youzone
            arch-store-git
            gog-ftl
            minegrub-theme-update-service
            pacdiff-pacman-hook-git
            clean-chroot-manager
            lib32-khronos-ocl-icd-git
            pacboost
            parui-git
            aurscan-git
            aurutils-git
            pacman-static
            tmpstali
            archlinux-tweak-tool-git
            bcachefs-dkms-git
            pacmanagergui-git
            rua
            waybar-module-pacman-updates-git
            aconfmgr-git
            lib32-libass
            limine-mkinitcpio-hook-git
            steamcommunity302
            yauri
            yup
            cosmic-applet-arch
            insync-dolphin
            whisper-cpp-hip
            yay-sys-tray-git
            auracle-git
            esp-idf
            forticlient
            linux-xanmod-bin
            msvc-wine-git
            pamac-all
            pat-aur-client-firmware-git
            pat-aur-client-flatpak-git
            shelly-bin
            aurto
            blinky
            kega-fusion
            lib32-vulkan-tools
            nsight-graphics
            pamac-classic-fixed
            paru-static
            semantic-diff
            wiso-steuer-2026
            yandex-music-windows
            aurdex
            bauh
            bind-utils-standalone
            bloom-git
            boxflat-git
            deigde
            droidcam
            ecwolf-git
            fcitx5-mozc-with-jp-dict
            fingwit
            greetd-regreet-git
            grub-silent
            harbour-amazfish-git
            hyprsettings-git
            ibus-mozc-with-jp-dict
            katvan
            lazarus-gtk2
            lcarswm
            ldapvi
            lib32-libdxvk
            lib32-vkbasalt-redemp-git
            lib32-xrizer-git
            linux-cjktty-headers
            linux-lts515
            linux-xanmod-edge-headers
            linux-xanmod-headers
            lue-reader-git
            m64py
            metube-git
            mujoco
            muzika-git
            nblood-git
            ollama-vulkan-git
            pandora-launcher-git
            penpot-frontend
            python-curl-cffi-git
            q4wine-git
            qbittorrent-enhanced-ua
            qimgv-qt6-kde-git
            qlog-git
            qmc2
            raze
            rblx-silver-git
            rs-visa
            shelly-git
            smokinguns-git
))

(define-public expressvpn
  (package
    (name "expressvpn")
    (version "5.0.1.11498")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/expressvpn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proprietary VPN client for Linux")
    (description "Proprietary VPN client for Linux.")
    (home-page "https://expressvpn.com")
    (license license:non-copyleft)))

(define-public crark
  (package
    (name "crark")
    (version "5.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/crark.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a command-line utility for RAR 2.x-3.x password cracking, uses Password Cra..")
    (description "A command-line utility for RAR 2.x-3.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors. with CUDA support.")
    (home-page "http://www.crark.net/")
    (license license:non-copyleft)))

(define-public arch-store
  (package
    (name "arch-store")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arch-store.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a graphical app for managing your programs with pacman, AUR, flatpak, and a..")
    (description "A graphical app for managing your programs with pacman, AUR, flatpak, and appimage.")
    (home-page "https://aur.archlinux.org/packages/arch-store")
    (license license:gpl3+)))

(define-public grml-iso
  (package
    (name "grml-iso")
    (version "2025.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grml-iso.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides the grml ISO image for usage by grml-rescueboot")
    (description "Provides the grml ISO image for usage by grml-rescueboot.")
    (home-page "http://wiki.grml.org/doku.php?id=rescueboot")
    (license license:gpl3+)))

(define-public monika-after-story-cn
  (package
    (name "monika-after-story-cn")
    (version "0.12.17.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adogecheems/monika-after-story-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a mod for the free game Doki Doki Literature Club from Team Salvato, which ..")
    (description "A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika, with third-party Chinese language support.")
    (home-page "https://github.com/adogecheems/monika-after-story-linux")
    (license license:non-copyleft)))

(define-public pactime
  (package
    (name "pactime")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gist.github.com/levinion/5f6630a8b6036929d5690f9e3c6fc1b9")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "list pacman packages by install time")
    (description "List pacman packages by install time.")
    (home-page "https://gist.github.com/levinion/5f6630a8b6036929d5690f9e3c6fc1b9")
    (license license:expat)))

(define-public youzone
  (package
    (name "youzone")
    (version "8.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youzone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "友空间，更懂企业的一体化数智办公平台。Youzone, an integrated digital office platform that bett..")
    (description "友空间，更懂企业的一体化数智办公平台。Youzone, an integrated digital office platform that better understands enterprises.")
    (home-page "https://ec.diwork.com/index.html")
    (license license:non-copyleft)))

(define-public arch-store-git
  (package
    (name "arch-store-git")
    (version "2.0.2.26.g224ca52")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Samuobe/Arch-Store")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a graphical app for managing your programs with pacman, AUR, flatpak, and a..")
    (description "A graphical app for managing your programs with pacman, AUR, flatpak, and appimage.")
    (home-page "https://github.com/Samuobe/Arch-Store")
    (license license:gpl3+)))

(define-public gog-ftl
  (package
    (name "gog-ftl")
    (version "1:1.6.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gog-ftl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "spaceship simulation roguelike-like (GOG version). Take your ship and crew ..")
    (description "Spaceship simulation roguelike-like (GOG version). Take your ship and crew through a randomly generated galaxy filled with glory and bitter defeat.")
    (home-page "https://www.gog.com/game/faster_than_light")
    (license license:non-copyleft)))

(define-public minegrub-theme-update-service
  (package
    (name "minegrub-theme-update-service")
    (version "3.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Lxtharia/minegrub-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a systemd service that automatically updates the minegrub theme")
    (description "A systemd service that automatically updates the minegrub theme.")
    (home-page "https://github.com/Lxtharia/minegrub-theme")
    (license license:expat)))

(define-public pacdiff-pacman-hook-git
  (package
    (name "pacdiff-pacman-hook-git")
    (version "r81.9d5f298")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/desbma/pacman-hooks")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pacman hook to review .pacnew files automatically")
    (description "Pacman hook to review .pacnew files automatically.")
    (home-page "https://github.com/desbma/pacman-hooks")
    (license license:gpl3+)))

(define-public clean-chroot-manager
  (package
    (name "clean-chroot-manager")
    (version "3.01")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/graysky2/clean-chroot-manager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wrapper for managing clean chroot builds with local repo therein")
    (description "Wrapper for managing clean chroot builds with local repo therein.")
    (home-page "https://github.com/graysky2/clean-chroot-manager")
    (license license:expat)))

(define-public lib32-khronos-ocl-icd-git
  (package
    (name "lib32-khronos-ocl-icd-git")
    (version "2024.10.24.1.g9228024")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-khronos-ocl-icd-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "khronos Group OpenCL installable client driver (ICD) loader. (GIT Version) ..")
    (description "Khronos Group OpenCL installable client driver (ICD) loader. (GIT Version) (32-bits).")
    (home-page "http://www.khronos.org/registry/cl")
    (license license:asl2.0)))

(define-public pacboost
  (package
    (name "pacboost")
    (version "2.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/compiledkernel-idk/pacboost")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high-performance package manager frontend for Arch Linux with integrated AU..")
    (description "High-performance package manager frontend for Arch Linux with integrated AUR support.")
    (home-page "https://github.com/compiledkernel-idk/pacboost")
    (license license:gpl3+)))

(define-public parui-git
  (package
    (name "parui-git")
    (version "1.0.11.r0.63af503")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vonr/parui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple TUI frontend for paru or yay")
    (description "Simple TUI frontend for paru or yay.")
    (home-page "https://github.com/Vonr/parui")
    (license license:expat)))

(define-public aurscan-git
  (package
    (name "aurscan-git")
    (version "r1.fe967983")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/MayESchaefer/aurscan")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automatically scan AUR packages with ClamAV before building them with Paru")
    (description "Automatically scan AUR packages with ClamAV before building them with Paru.")
    (home-page "https://gitlab.com/MayESchaefer/aurscan")
    (license license:gpl3+)))

(define-public aurutils-git
  (package
    (name "aurutils-git")
    (version "20.5.3.r29.g5a07ad64")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AladW/aurutils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "helper tools for the arch user repository")
    (description "Helper tools for the arch user repository.")
    (home-page "https://github.com/AladW/aurutils")
    (license license:isc)))

(define-public pacman-static
  (package
    (name "pacman-static")
    (version "7.1.0.r9.g54d9411")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacman-static.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "statically-compiled pacman (to fix or install systems without libc)")
    (description "Statically-compiled pacman (to fix or install systems without libc).")
    (home-page "https://www.archlinux.org/pacman/")
    (license license:gpl2+)))

(define-public tmpstali
  (package
    (name "tmpstali")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TheOddCell/tmpstali")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "part of the tmplinux suite. Temporary Stali")
    (description "Part of the tmplinux suite. Temporary Stali.")
    (home-page "https://github.com/TheOddCell/tmpstali")
    (license license:expat)))

(define-public archlinux-tweak-tool-git
  (package
    (name "archlinux-tweak-tool-git")
    (version "r1190.bcba8d7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/erikdubois/archlinux-tweak-tool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arch Linux Tweak Tool or ATT")
    (description "Arch Linux Tweak Tool or ATT.")
    (home-page "https://github.com/erikdubois/archlinux-tweak-tool")
    (license license:gpl3+)))

(define-public bcachefs-dkms-git
  (package
    (name "bcachefs-dkms-git")
    (version "1:1.37.2.r0.g82c7fba")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/koverstreet/bcachefs-tools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bcachefs out-of-tree module (Git version)")
    (description "Bcachefs out-of-tree module (Git version).")
    (home-page "https://github.com/koverstreet/bcachefs-tools")
    (license license:gpl2+)))

(define-public pacmanagergui-git
  (package
    (name "pacmanagergui-git")
    (version "r63.7f8f05e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alcalino-git/pacmanager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple GUI wrapper for the pacman package manager")
    (description "Simple GUI wrapper for the pacman package manager.")
    (home-page "https://github.com/alcalino-git/pacmanager")
    (license license:expat)))

(define-public rua
  (package
    (name "rua")
    (version "0.19.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vn971/rua")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aUR helper in Rust providing control, review, patch application and safe bu..")
    (description "AUR helper in Rust providing control, review, patch application and safe build options.")
    (home-page "https://github.com/vn971/rua")
    (license license:gpl3+)))

(define-public waybar-module-pacman-updates-git
  (package
    (name "waybar-module-pacman-updates-git")
    (version "0.2.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/coffebar/waybar-module-pacman-updates")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "waybar module for Arch to show system updates available")
    (description "Waybar module for Arch to show system updates available.")
    (home-page "https://github.com/coffebar/waybar-module-pacman-updates")
    (license license:gpl3+)))

(define-public aconfmgr-git
  (package
    (name "aconfmgr-git")
    (version "r634.ca09eea")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CyberShadow/aconfmgr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a configuration manager for Arch Linux")
    (description "A configuration manager for Arch Linux.")
    (home-page "https://github.com/CyberShadow/aconfmgr")
    (license license:expat)))

(define-public lib32-libass
  (package
    (name "lib32-libass")
    (version "0.17.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libass/libass")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a portable library for SSA/ASS subtitles rendering (32 bit)")
    (description "A portable library for SSA/ASS subtitles rendering (32 bit).")
    (home-page "https://github.com/libass/libass/")
    (license license:bsd-3)))

(define-public limine-mkinitcpio-hook-git
  (package
    (name "limine-mkinitcpio-hook-git")
    (version "r602.d9b54ee")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Zesko/limine-entry-tool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "install kernels for the Limine bootloader")
    (description "Install kernels for the Limine bootloader.")
    (home-page "https://gitlab.com/Zesko/limine-entry-tool")
    (license license:gpl3+)))

(define-public steamcommunity302
  (package
    (name "steamcommunity302")
    (version "14.0.02")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/steamcommunity302.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "羽翼城制作的Steam、Github等反代加速工具,使用s302命令启动")
    (description "羽翼城制作的Steam、Github等反代加速工具,使用s302命令启动.")
    (home-page "https://www.dogfight360.com/blog/18682/")
    (license license:non-copyleft)))

(define-public yauri
  (package
    (name "yauri")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/PieyIsAPie/yauri")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yauri, the gayest aur helper ever, all fitting into 1 file")
    (description "Yauri, the gayest aur helper ever, all fitting into 1 file.")
    (home-page "https://gitlab.com/PieyIsAPie/yauri")
    (license license:gpl3+)))

(define-public yup
  (package
    (name "yup")
    (version "1.1.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ericm/yup")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arch Linux AUR Helper with ncurses functionality and better searching and s..")
    (description "Arch Linux AUR Helper with ncurses functionality and better searching and sorting.")
    (home-page "https://github.com/ericm/yup")
    (license license:gpl3+)))

(define-public cosmic-applet-arch
  (package
    (name "cosmic-applet-arch")
    (version "1.0.0.beta.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nick42d/cosmic-applet-arch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cOSMIC applet to display Arch Linux package status")
    (description "COSMIC applet to display Arch Linux package status.")
    (home-page "https://github.com/nick42d/cosmic-applet-arch")
    (license license:gpl3+)))

(define-public insync-dolphin
  (package
    (name "insync-dolphin")
    (version "1:r29.de53666")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/felagund/dolphin-insync-plugin-plasma-6")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "insync context menus and overlay icons for Dolphin - Plasma 6")
    (description "Insync context menus and overlay icons for Dolphin - Plasma 6.")
    (home-page "https://github.com/felagund/dolphin-insync-plugin-plasma-6")
    (license license:gpl2+)))

(define-public whisper-cpp-hip
  (package
    (name "whisper.cpp-hip")
    (version "1.8.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/whisper.cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "port of OpenAI's Whisper model in C/C++ (using system llama.cpp-hip)")
    (description "Port of OpenAI's Whisper model in C/C++ (using system llama.cpp-hip).")
    (home-page "https://github.com/ggerganov/whisper.cpp")
    (license license:expat)))

(define-public yay-sys-tray-git
  (package
    (name "yay-sys-tray-git")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skint007/yay-sys-tray")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arch Linux system tray update checker using yay")
    (description "Arch Linux system tray update checker using yay.")
    (home-page "https://github.com/skint007/yay-sys-tray")
    (license license:expat)))

(define-public auracle-git
  (package
    (name "auracle-git")
    (version "r427.33f9097")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/falconindy/auracle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flexible client for the AUR")
    (description "A flexible client for the AUR.")
    (home-page "https://github.com/falconindy/auracle")
    (license license:expat)))

(define-public esp-idf
  (package
    (name "esp-idf")
    (version "6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/espressif/esp-idf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "espressif IoT Development Framework. Official development framework for ESP32")
    (description "Espressif IoT Development Framework. Official development framework for ESP32.")
    (home-page "https://github.com/espressif/esp-idf")
    (license license:asl2.0)))

(define-public forticlient
  (package
    (name "forticlient")
    (version "7.4.6.1867")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/forticlient.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fortinet VPN client ZTNA edition")
    (description "Fortinet VPN client ZTNA edition.")
    (home-page "https://www.forticlient.com")
    (license license:non-copyleft)))

(define-public linux-xanmod-bin
  (package
    (name "linux-xanmod-bin")
    (version "6.19.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-xanmod-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "the Linux kernel, modules and headers with Xanmod patches - Prebuilt version")
    (description "The Linux kernel, modules and headers with Xanmod patches - Prebuilt version.")
    (home-page "http://www.xanmod.org/")
    (license license:gpl2+)))

(define-public msvc-wine-git
  (package
    (name "msvc-wine-git")
    (version "18.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mstorsjo/msvc-wine")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mSVC compiler with CMake toolchains. Compiler work in Wine64")
    (description "MSVC compiler with CMake toolchains. Compiler work in Wine64.")
    (home-page "https://github.com/mstorsjo/msvc-wine")
    (license license:non-copyleft)))

(define-public pamac-all
  (package
    (name "pamac-all")
    (version "11.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/manjaro/pamac")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GUI frontend for libalpm (everything in one package - snap, flatpak, appi..")
    (description "A GUI frontend for libalpm (everything in one package - snap, flatpak, appindicator, aur, appstream).")
    (home-page "https://github.com/manjaro/pamac")
    (license license:gpl3+)))

(define-public pat-aur-client-firmware-git
  (package
    (name "pat-aur-client-firmware-git")
    (version "r542.9b72a20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/patlefort/pat-aur")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware updates support for pat-aur")
    (description "Firmware updates support for pat-aur.")
    (home-page "https://gitlab.com/patlefort/pat-aur")
    (license license:gpl3+)))

(define-public pat-aur-client-flatpak-git
  (package
    (name "pat-aur-client-flatpak-git")
    (version "r542.9b72a20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/patlefort/pat-aur")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flatpak updates support for pat-aur")
    (description "Flatpak updates support for pat-aur.")
    (home-page "https://gitlab.com/patlefort/pat-aur")
    (license license:gpl3+)))

(define-public shelly-bin
  (package
    (name "shelly-bin")
    (version "2.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZoeyErinBauer/Shelly-ALPM")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "shelly: A Modern Arch Package Manager (prebuilt binary)")
    (description "Shelly: A Modern Arch Package Manager (prebuilt binary).")
    (home-page "https://github.com/ZoeyErinBauer/Shelly-ALPM")
    (license license:gpl3+)))

(define-public aurto
  (package
    (name "aurto")
    (version "0.14.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexheretic/aurto")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an AUR tool for managing an auto-updating local 'aurto' package repository ..")
    (description "An AUR tool for managing an auto-updating local 'aurto' package repository using aurutils.")
    (home-page "https://github.com/alexheretic/aurto")
    (license license:expat)))

(define-public blinky
  (package
    (name "blinky")
    (version "0.23.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cherti/blinky")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aUR-helper with minimal hassle")
    (description "AUR-helper with minimal hassle.")
    (home-page "https://github.com/cherti/blinky")
    (license license:gpl3+)))

(define-public kega-fusion
  (package
    (name "kega-fusion")
    (version "3.63")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kega-fusion.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an emulator of classic Sega consoles, including SMS/GG, Genesis/Megadrive a..")
    (description "An emulator of classic Sega consoles, including SMS/GG, Genesis/Megadrive and add-ons.")
    (home-page "http://www.carpeludum.com/kega-fusion")
    (license license:non-copyleft)))

(define-public lib32-vulkan-tools
  (package
    (name "lib32-vulkan-tools")
    (version "1.4.341.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-vulkan-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vulkan Utilities and Tools (32-bit)")
    (description "Vulkan Utilities and Tools (32-bit).")
    (home-page "https://www.khronos.org/vulkan/")
    (license license:asl2.0)))

(define-public nsight-graphics
  (package
    (name "nsight-graphics")
    (version "2026.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nsight-graphics.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standalone application for the debugging and profiling of graphics applicat..")
    (description "Standalone application for the debugging and profiling of graphics applications.")
    (home-page "https://developer.nvidia.com/nsight-graphics")
    (license license:non-copyleft)))

(define-public pamac-classic-fixed
  (package
    (name "pamac-classic-fixed")
    (version "7.3.0.r764.g76e060f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/boussou/pamac-classic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Gtk3 frontend for libalpm - classic version - AUR not working")
    (description "A Gtk3 frontend for libalpm - classic version - AUR not working.")
    (home-page "https://github.com/boussou/pamac-classic")
    (license license:gpl3+)))

(define-public paru-static
  (package
    (name "paru-static")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Morganamilo/paru")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "feature packed AUR helper")
    (description "Feature packed AUR helper.")
    (home-page "https://github.com/Morganamilo/paru")
    (license license:gpl3+)))

(define-public semantic-diff
  (package
    (name "semantic-diff")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tkenaz/semantic_diff")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI-powered semantic analysis of git commits. Goes beyond git diff to show i..")
    (description "AI-powered semantic analysis of git commits. Goes beyond git diff to show intent, impact, risk, and review questions.")
    (home-page "https://github.com/tkenaz/semantic_diff")
    (license license:expat)))

(define-public wiso-steuer-2026
  (package
    (name "wiso-steuer-2026")
    (version "33.5.3220")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wiso-steuer-2026.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "file your German tax return for the tax year 2025")
    (description "File your German tax return for the tax year 2025.")
    (home-page "https://www.buhl.de/produkte/wiso-steuer")
    (license license:non-copyleft)))

(define-public yandex-music-windows
  (package
    (name "yandex-music-windows")
    (version "5.63.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cucumber-sp/yandex-music-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yandex Music - Personal recommendations, selections for any occasion and ne..")
    (description "Yandex Music - Personal recommendations, selections for any occasion and new music.")
    (home-page "https://github.com/cucumber-sp/yandex-music-linux")
    (license license:unlicense)))

(define-public aurdex
  (package
    (name "aurdex")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/envolution/aurdex")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal interface for browsing AUR package metadata with GIT and comment v..")
    (description "Terminal interface for browsing AUR package metadata with GIT and comment views.")
    (home-page "https://github.com/envolution/aurdex")
    (license license:asl2.0)))

(define-public bauh
  (package
    (name "bauh")
    (version "0.10.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinifmor/bauh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical interface for managing your applications (AppImage, Flatpak, Snap..")
    (description "Graphical interface for managing your applications (AppImage, Flatpak, Snap, Arch/AUR, Web).")
    (home-page "https://github.com/vinifmor/bauh")
    (license license:zlib)))

(define-public bind-utils-standalone
  (package
    (name "bind-utils-standalone")
    (version "9.20.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bind-utils-standalone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dNS client utilities from BIND: dig, host, nslookup, nsupdate, delv, mdig")
    (description "DNS client utilities from BIND: dig, host, nslookup, nsupdate, delv, mdig.")
    (home-page "https://www.isc.org/software/bind/")
    (license license:mpl2.0)))

(define-public bloom-git
  (package
    (name "bloom-git")
    (version "r1964.7aff716d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/navnavnav/Bloom")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bloom AVR debugger - A debug interface for embedded systems development on ..")
    (description "Bloom AVR debugger - A debug interface for embedded systems development on Linux.")
    (home-page "https://github.com/navnavnav/Bloom")
    (license license:lgpl3+)))

(define-public boxflat-git
  (package
    (name "boxflat-git")
    (version "1.0.0.r0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Lawstorant/boxflat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adjust your Moza Racing gear settings")
    (description "Adjust your Moza Racing gear settings.")
    (home-page "https://github.com/Lawstorant/boxflat")
    (license license:gpl3+)))

(define-public deigde
  (package
    (name "deigde")
    (version "1.31")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deigde.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "drag[en]gine IGDE (Editor)")
    (description "Drag[en]gine IGDE (Editor).")
    (home-page "https://dragondreams.ch/index.php/dragengine")
    (license license:expat)))

(define-public droidcam
  (package
    (name "droidcam")
    (version "1:2.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dev47apps/droidcam-linux-client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to turn your phone/tablet into a wireless/usb webcam")
    (description "A tool to turn your phone/tablet into a wireless/usb webcam.")
    (home-page "https://github.com/dev47apps/droidcam-linux-client")
    (license license:gpl2+)))

(define-public ecwolf-git
  (package
    (name "ecwolf-git")
    (version "1.3.3.r365.g0fc332d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ecwolf-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced source port of \"Wolfenstein 3D\" and \"Spear of Destiny\" based on Wo..")
    (description "Advanced source port of \"Wolfenstein 3D\" and \"Spear of Destiny\" based on Wolf4SDL (development version).")
    (home-page "http://maniacsvault.net/ecwolf")
    (license license:non-copyleft)))

(define-public fcitx5-mozc-with-jp-dict
  (package
    (name "fcitx5-mozc-with-jp-dict")
    (version "3.33.6089.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fcitx/mozc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fcitx5 Module for Mozc(the Open Source Edition of Google Japanese Input) wi..")
    (description "Fcitx5 Module for Mozc(the Open Source Edition of Google Japanese Input) with SudachiDict and MeCab UniDic Neologd and MeCab IpaDic Neologd.")
    (home-page "https://github.com/fcitx/mozc")
    (license license:asl2.0)))

(define-public fingwit
  (package
    (name "fingwit")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xapp-project/fingwit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fingerprint Configuration Tool")
    (description "Fingerprint Configuration Tool.")
    (home-page "https://github.com/xapp-project/fingwit")
    (license license:gpl3+)))

(define-public greetd-regreet-git
  (package
    (name "greetd-regreet-git")
    (version "0.3.0.r9.e30b3f7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rharish101/ReGreet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clean and customizable greeter for greetd")
    (description "Clean and customizable greeter for greetd.")
    (home-page "https://github.com/rharish101/ReGreet")
    (license license:gpl3+)))

(define-public grub-silent
  (package
    (name "grub-silent")
    (version "2.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub-silent.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU GRand Unified Bootloader (2) [without welcome and kernel messages]")
    (description "GNU GRand Unified Bootloader (2) [without welcome and kernel messages].")
    (home-page "https://www.gnu.org/software/grub/")
    (license license:gpl3+)))

(define-public harbour-amazfish-git
  (package
    (name "harbour-amazfish-git")
    (version "r2014.b37db67")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/piggz/harbour-amazfish")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "companion application for Huami Devices and the Pinetime Infinitime")
    (description "Companion application for Huami Devices and the Pinetime Infinitime.")
    (home-page "https://github.com/piggz/harbour-amazfish")
    (license license:gpl3+)))

(define-public hyprsettings-git
  (package
    (name "hyprsettings-git")
    (version "0.9.3.r11.g3214256")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/acropolis914/hyprsettings")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "configurator for Hyprland (alpha, development version, git snapshot)")
    (description "Configurator for Hyprland (alpha, development version, git snapshot).")
    (home-page "https://github.com/acropolis914/hyprsettings")
    (license license:gpl3+)))

(define-public ibus-mozc-with-jp-dict
  (package
    (name "ibus-mozc-with-jp-dict")
    (version "3.33.6089.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fcitx/mozc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ibus engine module for Mozc(the Open Source Edition of Google Japanese Inpu..")
    (description "Ibus engine module for Mozc(the Open Source Edition of Google Japanese Input) with SudachiDict and MeCab UniDic Neologd and MeCab IpaDic Neologd.")
    (home-page "https://github.com/fcitx/mozc")
    (license license:asl2.0)))

(define-public katvan
  (package
    (name "katvan")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/katvan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a bare-bones editor for Typst files, with a bias for RTL editing")
    (description "A bare-bones editor for Typst files, with a bias for RTL editing.")
    (home-page "https://katvan.app")
    (license license:gpl3+)))

(define-public lazarus-gtk2
  (package
    (name "lazarus-gtk2")
    (version "4.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lazarus-gtk2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "delphi-like IDE for FreePascal GTK2 version")
    (description "Delphi-like IDE for FreePascal GTK2 version.")
    (home-page "http://www.lazarus.freepascal.org/")
    (license license:gpl2+)))

(define-public lcarswm
  (package
    (name "lcarswm")
    (version "23.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lcarswm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lCARS Window Manager for lcarsde")
    (description "LCARS Window Manager for lcarsde.")
    (home-page "https://lcarsde.github.io")
    (license license:gpl2+)))

(define-public ldapvi
  (package
    (name "ldapvi")
    (version "1.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ldapvi/ldapvi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive LDAP client for Unix terminals")
    (description "Interactive LDAP client for Unix terminals.")
    (home-page "https://github.com/ldapvi/ldapvi")
    (license license:gpl2+)))

(define-public lib32-libdxvk
  (package
    (name "lib32-libdxvk")
    (version "2.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/doitsujin/dxvk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vulkan-based implementation of D3D8, 9, 10 and 11 for Linux (32-bit)")
    (description "Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux (32-bit).")
    (home-page "https://github.com/doitsujin/dxvk")
    (license license:zlib)))

(define-public lib32-vkbasalt-redemp-git
  (package
    (name "lib32-vkbasalt-redemp-git")
    (version "r470.d5c38ed")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Redemp/vkBasalt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Vulkan post-processing layer. (Redemp fork) (32-bit)")
    (description "A Vulkan post-processing layer. (Redemp fork) (32-bit).")
    (home-page "https://github.com/Redemp/vkBasalt")
    (license license:zlib)))

(define-public lib32-xrizer-git
  (package
    (name "lib32-xrizer-git")
    (version "0.3.r34.gbb7e2e5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Supreeeme/xrizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reimplementation of OpenVR, translating calls to OpenXR (32-bit)")
    (description "Reimplementation of OpenVR, translating calls to OpenXR (32-bit).")
    (home-page "https://github.com/Supreeeme/xrizer")
    (license license:gpl3+)))

(define-public linux-cjktty-headers
  (package
    (name "linux-cjktty-headers")
    (version "6.19.12.arch1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/archlinux/linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the Linux (with cjktty-patches..")
    (description "Headers and scripts for building modules for the Linux (with cjktty-patches) kernel.")
    (home-page "https://github.com/archlinux/linux")
    (license license:gpl2+)))

(define-public linux-lts515
  (package
    (name "linux-lts515")
    (version "5.15.202")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-lts515.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the LTS Linux 5.15.x kernel and modules")
    (description "The LTS Linux 5.15.x kernel and modules.")
    (home-page "https://www.kernel.org/")
    (license license:gpl2+)))

(define-public linux-xanmod-edge-headers
  (package
    (name "linux-xanmod-edge-headers")
    (version "7.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-xanmod-edge-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the Linux Xanmod - Rolling Rel..")
    (description "Headers and scripts for building modules for the Linux Xanmod - Rolling Release [EDGE] kernel.")
    (home-page "http://www.xanmod.org/")
    (license license:gpl2+)))

(define-public linux-xanmod-headers
  (package
    (name "linux-xanmod-headers")
    (version "6.19.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-xanmod-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the Linux Xanmod - Stable Main..")
    (description "Headers and scripts for building modules for the Linux Xanmod - Stable Mainline [MAIN] kernel.")
    (home-page "http://www.xanmod.org/")
    (license license:gpl2+)))

(define-public lue-reader-git
  (package
    (name "lue-reader-git")
    (version "v0.3.1.r0.g99e95f5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/superstarryeyes/lue")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal eBook Reader with Text-to-Speech")
    (description "Terminal eBook Reader with Text-to-Speech.")
    (home-page "https://github.com/superstarryeyes/lue")
    (license license:gpl3+)))

(define-public m64py
  (package
    (name "m64py")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mupen64plus/mupen64plus-ui-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Qt5 front-end (GUI) for Mupen64Plus, a cross-platform plugin-based Ninten..")
    (description "A Qt5 front-end (GUI) for Mupen64Plus, a cross-platform plugin-based Nintendo 64 emulator.")
    (home-page "https://github.com/mupen64plus/mupen64plus-ui-python")
    (license license:gpl3+)))

(define-public metube-git
  (package
    (name "metube-git")
    (version "r668.483575d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexta69/metube")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "self-hosted YouTube downloader (web UI for youtube-dl / yt-dlp)")
    (description "Self-hosted YouTube downloader (web UI for youtube-dl / yt-dlp).")
    (home-page "https://github.com/alexta69/metube")
    (license license:agpl3+)))

(define-public mujoco
  (package
    (name "mujoco")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mujoco.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-Joint dynamics with Contact. A general purpose physics simulator")
    (description "Multi-Joint dynamics with Contact. A general purpose physics simulator.")
    (home-page "https://www.mujoco.org")
    (license license:asl2.0)))

(define-public muzika-git
  (package
    (name "muzika-git")
    (version "r1262.daca260")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vixalien/muzika")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gTK4/Adwaita Elegant Youtube Music streaming app")
    (description "GTK4/Adwaita Elegant Youtube Music streaming app.")
    (home-page "https://github.com/vixalien/muzika")
    (license license:gpl3+)))

(define-public nblood-git
  (package
    (name "nblood-git")
    (version "r14041.6c3f8e754")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nblood-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "blood port based on EDuke32 (git version)")
    (description "Blood port based on EDuke32 (git version).")
    (home-page "http://nukeykt.retrohost.net/")
    (license license:non-copyleft)))

(define-public ollama-vulkan-git
  (package
    (name "ollama-vulkan-git")
    (version "0.15.1.rc0.r0.gf3b476c59280")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ollama/ollama")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create, run and share large language models (LLMs) with Vulkan")
    (description "Create, run and share large language models (LLMs) with Vulkan.")
    (home-page "https://github.com/ollama/ollama")
    (license license:expat)))

(define-public pandora-launcher-git
  (package
    (name "pandora-launcher-git")
    (version "2.6.0.r0.g0fdf646")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pandora-launcher-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern Minecraft launcher that balances ease-of-use with powerful instanc..")
    (description "A modern Minecraft launcher that balances ease-of-use with powerful instance management features.")
    (home-page "http://pandora.moulberry.com/")
    (license license:expat)))

(define-public penpot-frontend
  (package
    (name "penpot-frontend")
    (version "2.14.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/penpot-frontend.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the open-source design tool for design and code collaboration")
    (description "The open-source design tool for design and code collaboration.")
    (home-page "https://penpot.app")
    (license license:mpl2.0)))

(define-public python-curl-cffi-git
  (package
    (name "python-curl-cffi-git")
    (version "0.15.0b3.r7.g91170ff")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lexiforest/curl_cffi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python FFI binding for curl-impersonate (git version)")
    (description "Python FFI binding for curl-impersonate (git version).")
    (home-page "https://github.com/lexiforest/curl_cffi")
    (license license:expat)))

(define-public q4wine-git
  (package
    (name "q4wine-git")
    (version "1.4.1.15.gf506d89")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brezerk/q4wine")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Qt GUI for Wine. (GIT Version)")
    (description "A Qt GUI for Wine. (GIT Version).")
    (home-page "https://github.com/brezerk/q4wine")
    (license license:gpl3+)))

(define-public qbittorrent-enhanced-ua
  (package
    (name "qbittorrent-enhanced-ua")
    (version "5.1.3.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced BitTorrent client programmed in C++, based on Qt toolkit and li..")
    (description "An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar (Enhanced Edition with original user-agent).")
    (home-page "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (license license:gpl2+)))

(define-public qimgv-qt6-kde-git
  (package
    (name "qimgv-qt6-kde-git")
    (version "v1.0.3.alpha.r153.ga8e335b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/easymodo/qimgv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt6 image viewer. Fast, configurable, easy to use. Supports video playback")
    (description "Qt6 image viewer. Fast, configurable, easy to use. Supports video playback.")
    (home-page "https://github.com/easymodo/qimgv")
    (license license:gpl3+)))

(define-public qlog-git
  (package
    (name "qlog-git")
    (version "0.45.0.r0.g6f90e01")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/foldynl/QLog")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "amateur radio logbook software")
    (description "Amateur radio logbook software.")
    (home-page "https://github.com/foldynl/QLog")
    (license license:gpl3+)))

(define-public qmc2
  (package
    (name "qmc2")
    (version "0.243")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qmc2/qmc2-mame-fe")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt based UNIX MAME frontend supporting SDLMAME")
    (description "Qt based UNIX MAME frontend supporting SDLMAME.")
    (home-page "https://github.com/qmc2/qmc2-mame-fe")
    (license license:gpl2+)))

(define-public raze
  (package
    (name "raze")
    (version "1.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZDoom/Raze")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build engine port backed by GZDoom tech")
    (description "Build engine port backed by GZDoom tech.")
    (home-page "https://github.com/ZDoom/Raze")
    (license license:non-copyleft)))

(define-public rblx-silver-git
  (package
    (name "rblx-silver-git")
    (version "0.0.1.r")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wookhq/silverr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a bootstrapper for Sober")
    (description "A bootstrapper for Sober.")
    (home-page "https://github.com/Wookhq/silverr")
    (license license:expat)))

(define-public rs-visa
  (package
    (name "rs-visa")
    (version "5.12.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rs-visa.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rohde & Schwarz VISA library for Linux")
    (description "Rohde & Schwarz VISA library for Linux.")
    (home-page "https://www.rohde-schwarz.com/us/driver-pages/remote-control/3-visa-and-tools_231388.html")
    (license license:non-copyleft)))

(define-public shelly-git
  (package
    (name "shelly-git")
    (version "2.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZoeyErinBauer/Shelly-ALPM")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "shelly: A Modern Arch Package Manager (git version)")
    (description "Shelly: A Modern Arch Package Manager (git version).")
    (home-page "https://github.com/ZoeyErinBauer/Shelly-ALPM")
    (license license:gpl3+)))

(define-public smokinguns-git
  (package
    (name "smokinguns-git")
    (version "1.1.r859.gf5d9ecf2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/smokinguns-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a semi-realistic simulation of the old west great atmosphere built on id Te..")
    (description "A semi-realistic simulation of the old west great atmosphere built on id Tech 3.")
    (home-page "https://www.smokin-guns.org")
    (license license:gpl2+)))
