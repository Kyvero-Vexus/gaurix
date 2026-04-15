;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414ac
;;; Resolves 100 packages from general queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260414ac)
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
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages compression)
  #:export (linux6-dot-19-dot-10-dot-arch1-1-headers-bin
            linux6-dot-19-dot-10-dot-arch1-1-docs-bin
            linux6-dot-19-dot-10-dot-arch1-1-bin
            xtensa-elf-gcc
            xtensa-elf-binutils
            fcitx5-cn-meta
            cinnamon-mint
            spectacle-no-purpose
            fsp-renesas-bin
            fsp-e2s-bin
            linux6-dot-19-dot-10-dot-zen1-1-zen-headers-bin
            linux6-dot-19-dot-10-dot-zen1-1-zen-docs-bin
            linux6-dot-19-dot-10-dot-zen1-1-zen-bin
            python-atproto-git
            librius-bin
            arrayfire
            dependency-check-cli
            nvenc-git
            unrpyc1
            vgpu-unlock-rs
            simple-kdump
            monado-multilib-git
            cat-git
            wudcompress
            python-autodocsumm
            ilspycmd-git
            crt
            arm-linux-musleabihf-cross-bin
            why2
            tfblib
            stank-bin
            nesfab
            imagefanreloaded-avalonia-bin
            gnome-extensions-cli
            ksm-preload-git
            kirill-bin
            syncterm-git
            core-to-core-latency
            sanctum-git
            gnome-shell-extension-auto-accent-color
            simd-git
            simapi-git
            coremail
            nodejs-ollama
            update-alternatives-git
            mbctl-git
            zrepl-dsh2dsh-bin
            python-gnureadline
            python-ipspot
            fortune-mod-dune
            python-wn
            fwupd-starlabs-git
            fwupd-starlabs-docs-git
            openmodelica-bin
            soco-cli
            hyprdvd
            ttf-monocode
            pinact
            scratchmark
            nextcloud-app-calendar-resource-management
            cronboard
            json-bash-git
            dedupe
            i3gopher
            statusok-bin
            wkeys-git
            pam-pinlock
            make-it-rain
            libcurlpp-git
            qt6-xcb-private-headers-scrollfix
            qt6-base-scrollfix
            got-your-back
            davinci-alac-scripts
            cookie-git
            wowup-cf-beta-bin
            perl-astro-fits-cfitsio
            perl-alien-build-plugin-pkgconfig-ppwrapper
            perl-alien-build-plugin-cleanse-builddir
            cobib-zotero-git
            clice-bin
            espressif-ide-bin
            bobcat-terminal-headless-git
            aarch64-esr-decoder-git
            niiet-openocd-git
            cosmographia-bin
            reel-bin
            perl-data-validate-domain
            stylish-bin
            dezoomify-rs-bin
            campfire-bin
            rash-sh
            cli-modplayer
            ibazel-bin
            tmux-nord-theme
            nap-bin
            cuda-12-dot-5
            leizi-shell-bin
            batticonplus-git
            batticonplus-ayatana-git
            batticonplus-ayatana))

;;; Nonfree license placeholder for proprietary packages.
(define license:nonfree
  ((@@ (guix licenses) license) "nonfree"
    "https://aur.archlinux.org"
    "Nonfree/proprietary license; see upstream for terms."))

;;;
;;; --- 1. linux6.19.10.arch1-1-headers-bin ---
;;; Headers and scripts for building modules for the Linux kernel 6.19.10-arch1-1
;;;

(define-public linux6-dot-19-dot-10-dot-arch1-1-headers-bin
  (package
    (name "linux6.19.10.arch1-1-headers-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "linux6.19.10.arch1-1-headers-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/linux6.19.10.arch1-1-headers-bin/"))))
    (synopsis "headers and scripts for building modules for the Linux kernel 6.19.10-arch1-1")
    (description "Headers and scripts for building modules for the Linux kernel 6.19.10-arch1-1")
    (home-page "https://aur.archlinux.org/packages/linux6.19.10.arch1-1-headers-bin")
    (license license:gpl3+)))
;;;
;;; --- 2. linux6.19.10.arch1-1-docs-bin ---
;;; Documentation for the Linux kernel 6.19.10-arch1-1
;;;

(define-public linux6-dot-19-dot-10-dot-arch1-1-docs-bin
  (package
    (name "linux6.19.10.arch1-1-docs-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "linux6.19.10.arch1-1-docs-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/linux6.19.10.arch1-1-docs-bin/"))))
    (synopsis "documentation for the Linux kernel 6.19.10-arch1-1")
    (description "Documentation for the Linux kernel 6.19.10-arch1-1")
    (home-page "https://aur.archlinux.org/packages/linux6.19.10.arch1-1-docs-bin")
    (license license:gpl3+)))
;;;
;;; --- 3. linux6.19.10.arch1-1-bin ---
;;; The Linux kernel and modules, version 6.19.10-arch1-1
;;;

(define-public linux6-dot-19-dot-10-dot-arch1-1-bin
  (package
    (name "linux6.19.10.arch1-1-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "linux6.19.10.arch1-1-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/linux6.19.10.arch1-1-bin/"))))
    (synopsis "The Linux kernel and modules, version 6.19.10-arch1-1")
    (description "The Linux kernel and modules, version 6.19.10-arch1-1")
    (home-page "https://aur.archlinux.org/packages/linux6.19.10.arch1-1-bin")
    (license license:gpl3+)))
;;;
;;; --- 4. xtensa-elf-gcc ---
;;; The GNU Compiler Collection - cross compiler for Xtensa (bare-metal) target
;;;

(define-public xtensa-elf-gcc
  (package
    (name "xtensa-elf-gcc")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "xtensa-elf-gcc" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "The GNU Compiler Collection - cross compiler for Xtensa (bare-metal) target")
    (description "The GNU Compiler Collection - cross compiler for Xtensa (bare-metal) target")
    (home-page "https://aur.archlinux.org/packages/xtensa-elf-gcc")
    (license license:gpl3+)))
;;;
;;; --- 5. xtensa-elf-binutils ---
;;; A set of programs to assemble and manipulate binary and object files for the Xte
;;;

(define-public xtensa-elf-binutils
  (package
    (name "xtensa-elf-binutils")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "xtensa-elf-binutils" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A set of programs to assemble and manipulate binary and object files for th...")
    (description "A set of programs to assemble and manipulate binary and object files for the Xtensa target")
    (home-page "https://aur.archlinux.org/packages/xtensa-elf-binutils")
    (license license:gpl3+)))
;;;
;;; --- 6. fcitx5-cn-meta ---
;;; Meta package to install fcitx5 and Chinese addons
;;;

(define-public fcitx5-cn-meta
  (package
    (name "fcitx5-cn-meta")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "fcitx5-cn-meta" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "meta package to install fcitx5 and Chinese addons")
    (description "Meta package to install fcitx5 and Chinese addons")
    (home-page "https://aur.archlinux.org/packages/fcitx5-cn-meta")
    (license license:gpl3+)))
;;;
;;; --- 7. cinnamon-mint ---
;;; Linux Mint's Cinnamon for Arch Linux
;;;

(define-public cinnamon-mint
  (package
    (name "cinnamon-mint")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cinnamon-mint" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Linux Mint's Cinnamon for Arch Linux")
    (description "Linux Mint's Cinnamon for Arch Linux")
    (home-page "https://aur.archlinux.org/packages/cinnamon-mint")
    (license license:gpl3+)))
;;;
;;; --- 8. spectacle-no-purpose ---
;;; KDE screenshot capture utility, without the dependency on purpose. This disables
;;;

(define-public spectacle-no-purpose
  (package
    (name "spectacle-no-purpose")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "spectacle-no-purpose" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "KDE screenshot capture utility, without the dependency on purpose. This dis...")
    (description "KDE screenshot capture utility, without the dependency on purpose. This disables the share menu")
    (home-page "https://aur.archlinux.org/packages/spectacle-no-purpose")
    (license license:gpl3+)))
;;;
;;; --- 9. fsp-renesas-bin ---
;;; Flexible Software Package (FSP) for Renesas RA MCU Family - Renesas Smart Config
;;;

(define-public fsp-renesas-bin
  (package
    (name "fsp-renesas-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "fsp-renesas-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/fsp-renesas-bin/"))))
    (synopsis "flexible Software Package (FSP) for Renesas RA MCU Family - Renesas Smart C...")
    (description "Flexible Software Package (FSP) for Renesas RA MCU Family - Renesas Smart Configurator")
    (home-page "https://aur.archlinux.org/packages/fsp-renesas-bin")
    (license license:nonfree)))
;;;
;;; --- 10. fsp-e2s-bin ---
;;; Flexible Software Package (FSP) for Renesas RA MCU Family - Renesas e² studio
;;;

(define-public fsp-e2s-bin
  (package
    (name "fsp-e2s-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "fsp-e2s-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/fsp-e2s-bin/"))))
    (synopsis "flexible Software Package (FSP) for Renesas RA MCU Family - Renesas e² studio")
    (description "Flexible Software Package (FSP) for Renesas RA MCU Family - Renesas e² studio")
    (home-page "https://aur.archlinux.org/packages/fsp-e2s-bin")
    (license license:gpl3+)))
;;;
;;; --- 11. linux6.19.10.zen1-1-zen-headers-bin ---
;;; Headers and scripts for building modules for the Linux ZEN kernel 6.19.10-zen1-1
;;;

(define-public linux6-dot-19-dot-10-dot-zen1-1-zen-headers-bin
  (package
    (name "linux6.19.10.zen1-1-zen-headers-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "linux6.19.10.zen1-1-zen-headers-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/linux6.19.10.zen1-1-zen-headers-bin/"))))
    (synopsis "headers and scripts for building modules for the Linux ZEN kernel 6.19.10-z...")
    (description "Headers and scripts for building modules for the Linux ZEN kernel 6.19.10-zen1-1-zen")
    (home-page "https://aur.archlinux.org/packages/linux6.19.10.zen1-1-zen-headers-bin")
    (license license:gpl3+)))
;;;
;;; --- 12. linux6.19.10.zen1-1-zen-docs-bin ---
;;; Documentation for the Linux ZEN kernel 6.19.10-zen1-1-zen
;;;

(define-public linux6-dot-19-dot-10-dot-zen1-1-zen-docs-bin
  (package
    (name "linux6.19.10.zen1-1-zen-docs-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "linux6.19.10.zen1-1-zen-docs-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/linux6.19.10.zen1-1-zen-docs-bin/"))))
    (synopsis "documentation for the Linux ZEN kernel 6.19.10-zen1-1-zen")
    (description "Documentation for the Linux ZEN kernel 6.19.10-zen1-1-zen")
    (home-page "https://aur.archlinux.org/packages/linux6.19.10.zen1-1-zen-docs-bin")
    (license license:gpl3+)))
;;;
;;; --- 13. linux6.19.10.zen1-1-zen-bin ---
;;; The Linux ZEN kernel and modules, version 6.19.10-zen1-1-zen
;;;

(define-public linux6-dot-19-dot-10-dot-zen1-1-zen-bin
  (package
    (name "linux6.19.10.zen1-1-zen-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "linux6.19.10.zen1-1-zen-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/linux6.19.10.zen1-1-zen-bin/"))))
    (synopsis "The Linux ZEN kernel and modules, version 6.19.10-zen1-1-zen")
    (description "The Linux ZEN kernel and modules, version 6.19.10-zen1-1-zen")
    (home-page "https://aur.archlinux.org/packages/linux6.19.10.zen1-1-zen-bin")
    (license license:gpl3+)))
;;;
;;; --- 14. python-atproto-git ---
;;; The AT Protocol (Bluesky) SDK for Python (development version)
;;;

(define-public python-atproto-git
  (package
    (name "python-atproto-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-atproto-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "The AT Protocol (Bluesky) SDK for Python (development version)")
    (description "The AT Protocol (Bluesky) SDK for Python (development version)")
    (home-page "https://aur.archlinux.org/packages/python-atproto-git")
    (license license:gpl3+)))
;;;
;;; --- 15. librius-bin ---
;;; A fast, minimalist CLI to manage your personal book collection
;;;

(define-public librius-bin
  (package
    (name "librius-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "librius-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/librius-bin/"))))
    (synopsis "A fast, minimalist CLI to manage your personal book collection")
    (description "A fast, minimalist CLI to manage your personal book collection")
    (home-page "https://aur.archlinux.org/packages/librius-bin")
    (license license:gpl3+)))
;;;
;;; --- 16. arrayfire ---
;;; High performance software library for parallel computing with an easy-to-use API
;;;

(define-public arrayfire
  (package
    (name "arrayfire")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "arrayfire" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "high performance software library for parallel computing with an easy-to-us...")
    (description "High performance software library for parallel computing with an easy-to-use API")
    (home-page "https://aur.archlinux.org/packages/arrayfire")
    (license license:gpl3+)))
;;;
;;; --- 17. dependency-check-cli ---
;;; Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to 
;;;

(define-public dependency-check-cli
  (package
    (name "dependency-check-cli")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "dependency-check-cli" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Dependency-Check is a Software Composition Analysis (SCA) tool that attempt...")
    (description "Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependenc")
    (home-page "https://aur.archlinux.org/packages/dependency-check-cli")
    (license license:gpl3+)))
;;;
;;; --- 18. nvenc-git ---
;;; NVIDIA Video Codec based command line encoder (git)
;;;

(define-public nvenc-git
  (package
    (name "nvenc-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "nvenc-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "NVIDIA Video Codec based command line encoder (git)")
    (description "NVIDIA Video Codec based command line encoder (git)")
    (home-page "https://aur.archlinux.org/packages/nvenc-git")
    (license license:nonfree)))
;;;
;;; --- 19. unrpyc1 ---
;;; A ren'py script decompiler
;;;

(define-public unrpyc1
  (package
    (name "unrpyc1")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "unrpyc1" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A ren'py script decompiler")
    (description "A ren'py script decompiler")
    (home-page "https://aur.archlinux.org/packages/unrpyc1")
    (license license:gpl3+)))
;;;
;;; --- 20. vgpu_unlock-rs ---
;;; Unlock vGPU functionality for consumer grade GPUs
;;;

(define-public vgpu-unlock-rs
  (package
    (name "vgpu_unlock-rs")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "vgpu_unlock-rs" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "unlock vGPU functionality for consumer grade GPUs")
    (description "Unlock vGPU functionality for consumer grade GPUs")
    (home-page "https://aur.archlinux.org/packages/vgpu_unlock-rs")
    (license license:nonfree)))
;;;
;;; --- 21. simple-kdump ---
;;; A very simple kdump setup for Archlinux
;;;

(define-public simple-kdump
  (package
    (name "simple-kdump")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "simple-kdump" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A very simple kdump setup for Archlinux")
    (description "A very simple kdump setup for Archlinux")
    (home-page "https://aur.archlinux.org/packages/simple-kdump")
    (license license:gpl3+)))
;;;
;;; --- 22. monado-multilib-git ---
;;; The open source OpenXR runtime. (32 bit support)
;;;

(define-public monado-multilib-git
  (package
    (name "monado-multilib-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "monado-multilib-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "The open source OpenXR runtime. (32 bit support)")
    (description "The open source OpenXR runtime. (32 bit support)")
    (home-page "https://aur.archlinux.org/packages/monado-multilib-git")
    (license license:gpl3+)))
;;;
;;; --- 23. cat-git ---
;;; An open-source highly customizable shell made in C#.
;;;

(define-public cat-git
  (package
    (name "cat-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cat-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "An open-source highly customizable shell made in C#")
    (description "An open-source highly customizable shell made in C#.")
    (home-page "https://aur.archlinux.org/packages/cat-git")
    (license license:gpl3+)))
;;;
;;; --- 24. wudcompress ---
;;; Wii U image (WUD) compression tool
;;;

(define-public wudcompress
  (package
    (name "wudcompress")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "wudcompress" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Wii U image (WUD) compression tool")
    (description "Wii U image (WUD) compression tool")
    (home-page "https://aur.archlinux.org/packages/wudcompress")
    (license license:gpl3+)))
;;;
;;; --- 25. python-autodocsumm ---
;;; Extending your autodoc API docs with a summary
;;;

(define-public python-autodocsumm
  (package
    (name "python-autodocsumm")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-autodocsumm" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "extending your autodoc API docs with a summary")
    (description "Extending your autodoc API docs with a summary")
    (home-page "https://aur.archlinux.org/packages/python-autodocsumm")
    (license license:gpl3+)))
;;;
;;; --- 26. ilspycmd-git ---
;;; .NET Decompiler with support for PDB generation, ReadyToRun, Metadata (&more) - 
;;;

(define-public ilspycmd-git
  (package
    (name "ilspycmd-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ilspycmd-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis ".NET Decompiler with support for PDB generation, ReadyToRun, Metadata (&mor...")
    (description ".NET Decompiler with support for PDB generation, ReadyToRun, Metadata (&more) - cross-platform! (git version)")
    (home-page "https://aur.archlinux.org/packages/ilspycmd-git")
    (license license:gpl3+)))
;;;
;;; --- 27. crt ---
;;; CLI tool to check Certificate Transparency logs of a domain name
;;;

(define-public crt
  (package
    (name "crt")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "crt" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI tool to check Certificate Transparency logs of a domain name")
    (description "CLI tool to check Certificate Transparency logs of a domain name")
    (home-page "https://aur.archlinux.org/packages/crt")
    (license license:gpl3+)))
;;;
;;; --- 28. arm-linux-musleabihf-cross-bin ---
;;; Static, binary released musl-based cross-compilation toolchain provided by musl.
;;;

(define-public arm-linux-musleabihf-cross-bin
  (package
    (name "arm-linux-musleabihf-cross-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "arm-linux-musleabihf-cross-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/arm-linux-musleabihf-cross-bin/"))))
    (synopsis "static, binary released musl-based cross-compilation toolchain provided by ...")
    (description "Static, binary released musl-based cross-compilation toolchain provided by musl.cc")
    (home-page "https://aur.archlinux.org/packages/arm-linux-musleabihf-cross-bin")
    (license license:gpl3+)))
;;;
;;; --- 29. why2 ---
;;; Lightweight, fast and secure chat application powered by WHY2 encryption.
;;;

(define-public why2
  (package
    (name "why2")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "why2" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight, fast and secure chat application powered by WHY2 encryption")
    (description "Lightweight, fast and secure chat application powered by WHY2 encryption.")
    (home-page "https://aur.archlinux.org/packages/why2")
    (license license:gpl3+)))
;;;
;;; --- 30. tfblib ---
;;; Low-level graphics library for drawing to the framebuffer
;;;

(define-public tfblib
  (package
    (name "tfblib")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "tfblib" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "low-level graphics library for drawing to the framebuffer")
    (description "Low-level graphics library for drawing to the framebuffer")
    (home-page "https://aur.archlinux.org/packages/tfblib")
    (license license:gpl3+)))
;;;
;;; --- 31. stank-bin ---
;;; Analyzers for determining whether files smell like rotten POSIX shell scripts, o
;;;

(define-public stank-bin
  (package
    (name "stank-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "stank-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/stank-bin/"))))
    (synopsis "analyzers for determining whether files smell like rotten POSIX shell scrip...")
    (description "Analyzers for determining whether files smell like rotten POSIX shell scripts, or faintly rosy like Ruby and Python scripts")
    (home-page "https://aur.archlinux.org/packages/stank-bin")
    (license license:gpl3+)))
;;;
;;; --- 32. nesfab ---
;;; Programming language for creating NES games
;;;

(define-public nesfab
  (package
    (name "nesfab")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "nesfab" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "programming language for creating NES games")
    (description "Programming language for creating NES games")
    (home-page "https://aur.archlinux.org/packages/nesfab")
    (license license:gpl3+)))
;;;
;;; --- 33. imagefanreloaded-avalonia-bin ---
;;; ImageFan Reloaded is a light-weight image viewer, supporting multi-core processi
;;;

(define-public imagefanreloaded-avalonia-bin
  (package
    (name "imagefanreloaded-avalonia-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "imagefanreloaded-avalonia-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/imagefanreloaded-avalonia-bin/"))))
    (synopsis "ImageFan Reloaded is a light-weight image viewer, supporting multi-core pro...")
    (description "ImageFan Reloaded is a light-weight image viewer, supporting multi-core processing.(Prebuilt version)")
    (home-page "https://aur.archlinux.org/packages/imagefanreloaded-avalonia-bin")
    (license license:gpl3+)))
;;;
;;; --- 34. gnome-extensions-cli ---
;;; Command line tool to manage your GNOME Shell extensions
;;;

(define-public gnome-extensions-cli
  (package
    (name "gnome-extensions-cli")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gnome-extensions-cli" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "command line tool to manage your GNOME Shell extensions")
    (description "Command line tool to manage your GNOME Shell extensions")
    (home-page "https://aur.archlinux.org/packages/gnome-extensions-cli")
    (license license:gpl3+)))
;;;
;;; --- 35. ksm_preload-git ---
;;; Library which allows legacy applications to use Kernel Same-page Merging
;;;

(define-public ksm-preload-git
  (package
    (name "ksm_preload-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ksm_preload-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "library which allows legacy applications to use Kernel Same-page Merging")
    (description "Library which allows legacy applications to use Kernel Same-page Merging")
    (home-page "https://aur.archlinux.org/packages/ksm_preload-git")
    (license license:gpl3+)))
;;;
;;; --- 36. kirill-bin ---
;;; A JSON document integrity checker
;;;

(define-public kirill-bin
  (package
    (name "kirill-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "kirill-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/kirill-bin/"))))
    (synopsis "A JSON document integrity checker")
    (description "A JSON document integrity checker")
    (home-page "https://aur.archlinux.org/packages/kirill-bin")
    (license license:gpl3+)))
;;;
;;; --- 37. syncterm-git ---
;;; A BBS terminal program, supporting ANSI music and IBM charset.
;;;

(define-public syncterm-git
  (package
    (name "syncterm-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "syncterm-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A BBS terminal program, supporting ANSI music and IBM charset")
    (description "A BBS terminal program, supporting ANSI music and IBM charset.")
    (home-page "https://aur.archlinux.org/packages/syncterm-git")
    (license license:gpl3+)))
;;;
;;; --- 38. core-to-core-latency ---
;;; Measure cross-CPU message send latency
;;;

(define-public core-to-core-latency
  (package
    (name "core-to-core-latency")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "core-to-core-latency" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "measure cross-CPU message send latency")
    (description "Measure cross-CPU message send latency")
    (home-page "https://aur.archlinux.org/packages/core-to-core-latency")
    (license license:gpl3+)))
;;;
;;; --- 39. sanctum-git ---
;;; Sanctum is a small, reviewable, capable, pq-secure and fully privilege separated
;;;

(define-public sanctum-git
  (package
    (name "sanctum-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "sanctum-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "sanctum is a small, reviewable, capable, pq-secure and fully privilege sepa...")
    (description "Sanctum is a small, reviewable, capable, pq-secure and fully privilege separated VPN daemon for OpenBSD, Linux and MacOS.")
    (home-page "https://aur.archlinux.org/packages/sanctum-git")
    (license license:gpl3+)))
;;;
;;; --- 40. gnome-shell-extension-auto-accent-color ---
;;; GNOME extension to automatically change the desktop accent colour based on the u
;;;

(define-public gnome-shell-extension-auto-accent-color
  (package
    (name "gnome-shell-extension-auto-accent-color")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gnome-shell-extension-auto-accent-color" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "GNOME extension to automatically change the desktop accent colour based on ...")
    (description "GNOME extension to automatically change the desktop accent colour based on the user's wallpaper.")
    (home-page "https://aur.archlinux.org/packages/gnome-shell-extension-auto-accent-color")
    (license license:gpl3+)))
;;;
;;; --- 41. simd-git ---
;;; Dashboards and Telemetry Monitoring for Racing Sims
;;;

(define-public simd-git
  (package
    (name "simd-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "simd-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "dashboards and Telemetry Monitoring for Racing Sims")
    (description "Dashboards and Telemetry Monitoring for Racing Sims")
    (home-page "https://aur.archlinux.org/packages/simd-git")
    (license license:gpl3+)))
;;;
;;; --- 42. simapi-git ---
;;; Dashboards and Telemetry Monitoring for Racing Sims
;;;

(define-public simapi-git
  (package
    (name "simapi-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "simapi-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "dashboards and Telemetry Monitoring for Racing Sims")
    (description "Dashboards and Telemetry Monitoring for Racing Sims")
    (home-page "https://aur.archlinux.org/packages/simapi-git")
    (license license:gpl3+)))
;;;
;;; --- 43. coremail ---
;;; Coremail 邮箱客户端 安全省心，轻松连通世界
;;;

(define-public coremail
  (package
    (name "coremail")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "coremail" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Coremail 邮箱客户端 安全省心，轻松连通世界")
    (description "Coremail 邮箱客户端 安全省心，轻松连通世界")
    (home-page "https://aur.archlinux.org/packages/coremail")
    (license license:nonfree)))
;;;
;;; --- 44. nodejs-ollama ---
;;; Ollama JavaScript library
;;;

(define-public nodejs-ollama
  (package
    (name "nodejs-ollama")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "nodejs-ollama" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Ollama JavaScript library")
    (description "Ollama JavaScript library")
    (home-page "https://aur.archlinux.org/packages/nodejs-ollama")
    (license license:gpl3+)))
;;;
;;; --- 45. update-alternatives-git ---
;;; A simple update-alternatives replacement written in Rust
;;;

(define-public update-alternatives-git
  (package
    (name "update-alternatives-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "update-alternatives-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A simple update-alternatives replacement written in Rust")
    (description "A simple update-alternatives replacement written in Rust")
    (home-page "https://aur.archlinux.org/packages/update-alternatives-git")
    (license license:gpl3+)))
;;;
;;; --- 46. mbctl-git ---
;;; Another container orchestration system. Man8S use yggdrasil as VPN networking, u
;;;

(define-public mbctl-git
  (package
    (name "mbctl-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "mbctl-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "another container orchestration system. Man8S use yggdrasil as VPN networki...")
    (description "Another container orchestration system. Man8S use yggdrasil as VPN networking, use containerd to maintain containers and images, and use a new kind of config ma")
    (home-page "https://aur.archlinux.org/packages/mbctl-git")
    (license license:gpl3+)))
;;;
;;; --- 47. zrepl-dsh2dsh-bin ---
;;; One-stop ZFS backup & replication solution
;;;

(define-public zrepl-dsh2dsh-bin
  (package
    (name "zrepl-dsh2dsh-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "zrepl-dsh2dsh-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/zrepl-dsh2dsh-bin/"))))
    (synopsis "one-stop ZFS backup & replication solution")
    (description "One-stop ZFS backup & replication solution")
    (home-page "https://aur.archlinux.org/packages/zrepl-dsh2dsh-bin")
    (license license:gpl3+)))
;;;
;;; --- 48. python-gnureadline ---
;;; The standard Python readline extension statically linked against the GNU readlin
;;;

(define-public python-gnureadline
  (package
    (name "python-gnureadline")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-gnureadline" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "The standard Python readline extension statically linked against the GNU re...")
    (description "The standard Python readline extension statically linked against the GNU readline library.")
    (home-page "https://aur.archlinux.org/packages/python-gnureadline")
    (license license:gpl3+)))
;;;
;;; --- 49. python-ipspot ---
;;; A Python Tool to Fetch the System's IP Address
;;;

(define-public python-ipspot
  (package
    (name "python-ipspot")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-ipspot" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A Python Tool to Fetch the System's IP Address")
    (description "A Python Tool to Fetch the System's IP Address")
    (home-page "https://aur.archlinux.org/packages/python-ipspot")
    (license license:gpl3+)))
;;;
;;; --- 50. fortune-mod-dune ---
;;; Quotes from Frank Herbert's 'Dune' series
;;;

(define-public fortune-mod-dune
  (package
    (name "fortune-mod-dune")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "fortune-mod-dune" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "quotes from Frank Herbert's 'Dune' series")
    (description "Quotes from Frank Herbert's 'Dune' series")
    (home-page "https://aur.archlinux.org/packages/fortune-mod-dune")
    (license license:gpl3+)))
;;;
;;; --- 51. python-wn ---
;;; Wordnet interface library
;;;

(define-public python-wn
  (package
    (name "python-wn")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-wn" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "wordnet interface library")
    (description "Wordnet interface library")
    (home-page "https://aur.archlinux.org/packages/python-wn")
    (license license:gpl3+)))
;;;
;;; --- 52. fwupd-starlabs-git ---
;;; Simple daemon to allow session software to update firmware (StarLabs version)
;;;

(define-public fwupd-starlabs-git
  (package
    (name "fwupd-starlabs-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "fwupd-starlabs-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple daemon to allow session software to update firmware (StarLabs version)")
    (description "Simple daemon to allow session software to update firmware (StarLabs version)")
    (home-page "https://aur.archlinux.org/packages/fwupd-starlabs-git")
    (license license:gpl3+)))
;;;
;;; --- 53. fwupd-starlabs-docs-git ---
;;; Simple daemon to allow session software to update firmware - documentation
;;;

(define-public fwupd-starlabs-docs-git
  (package
    (name "fwupd-starlabs-docs-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "fwupd-starlabs-docs-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple daemon to allow session software to update firmware - documentation")
    (description "Simple daemon to allow session software to update firmware - documentation")
    (home-page "https://aur.archlinux.org/packages/fwupd-starlabs-docs-git")
    (license license:gpl3+)))
;;;
;;; --- 54. openmodelica-bin ---
;;; A complete Modelica modeling and simulation environment (from Debian binaries)
;;;

(define-public openmodelica-bin
  (package
    (name "openmodelica-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "openmodelica-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/openmodelica-bin/"))))
    (synopsis "A complete Modelica modeling and simulation environment (from Debian binaries)")
    (description "A complete Modelica modeling and simulation environment (from Debian binaries)")
    (home-page "https://aur.archlinux.org/packages/openmodelica-bin")
    (license license:gpl3+)))
;;;
;;; --- 55. soco-cli ---
;;; Command Line Interface to Control Sonos Sound Systems
;;;

(define-public soco-cli
  (package
    (name "soco-cli")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "soco-cli" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "command Line Interface to Control Sonos Sound Systems")
    (description "Command Line Interface to Control Sonos Sound Systems")
    (home-page "https://aur.archlinux.org/packages/soco-cli")
    (license license:gpl3+)))
;;;
;;; --- 56. hyprdvd ---
;;; Bouncy DVD-like terminal
;;;

(define-public hyprdvd
  (package
    (name "hyprdvd")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "hyprdvd" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "bouncy DVD-like terminal")
    (description "Bouncy DVD-like terminal")
    (home-page "https://aur.archlinux.org/packages/hyprdvd")
    (license license:gpl3+)))
;;;
;;; --- 57. ttf-monocode ---
;;; A font derived from a customized version of Iosevka
;;;

(define-public ttf-monocode
  (package
    (name "ttf-monocode")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ttf-monocode" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/fonts/truetype/"
                         #:include-regexp (".*\\.(ttf|otf)$")))))
    (synopsis "A font derived from a customized version of Iosevka")
    (description "A font derived from a customized version of Iosevka")
    (home-page "https://aur.archlinux.org/packages/ttf-monocode")
    (license license:gpl3+)))
;;;
;;; --- 58. pinact ---
;;; CLI to pin GitHub Actions and Reusable Workflows to full hashes
;;;

(define-public pinact
  (package
    (name "pinact")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "pinact" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI to pin GitHub Actions and Reusable Workflows to full hashes")
    (description "CLI to pin GitHub Actions and Reusable Workflows to full hashes")
    (home-page "https://aur.archlinux.org/packages/pinact")
    (license license:gpl3+)))
;;;
;;; --- 59. scratchmark ---
;;; Organized markdown editor
;;;

(define-public scratchmark
  (package
    (name "scratchmark")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "scratchmark" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "organized markdown editor")
    (description "Organized markdown editor")
    (home-page "https://aur.archlinux.org/packages/scratchmark")
    (license license:gpl3+)))
;;;
;;; --- 60. nextcloud-app-calendar_resource_management ---
;;; Resource manager for nextcloud calendar app
;;;

(define-public nextcloud-app-calendar-resource-management
  (package
    (name "nextcloud-app-calendar_resource_management")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "nextcloud-app-calendar_resource_management" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "resource manager for nextcloud calendar app")
    (description "Resource manager for nextcloud calendar app")
    (home-page "https://aur.archlinux.org/packages/nextcloud-app-calendar_resource_management")
    (license license:gpl3+)))
;;;
;;; --- 61. cronboard ---
;;; A terminal-based dashboard for managing cron jobs
;;;

(define-public cronboard
  (package
    (name "cronboard")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cronboard" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A terminal-based dashboard for managing cron jobs")
    (description "A terminal-based dashboard for managing cron jobs")
    (home-page "https://aur.archlinux.org/packages/cronboard")
    (license license:gpl3+)))
;;;
;;; --- 62. json-bash-git ---
;;; Command-line tool and bash library that creates JSON (latest git commit)
;;;

(define-public json-bash-git
  (package
    (name "json-bash-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "json-bash-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "command-line tool and bash library that creates JSON (latest git commit)")
    (description "Command-line tool and bash library that creates JSON (latest git commit)")
    (home-page "https://aur.archlinux.org/packages/json-bash-git")
    (license license:gpl3+)))
;;;
;;; --- 63. dedupe ---
;;; Earn back file space by hardlinking unchanging duplicate files
;;;

(define-public dedupe
  (package
    (name "dedupe")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "dedupe" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "earn back file space by hardlinking unchanging duplicate files")
    (description "Earn back file space by hardlinking unchanging duplicate files")
    (home-page "https://aur.archlinux.org/packages/dedupe")
    (license license:gpl3+)))
;;;
;;; --- 64. i3gopher ---
;;; i3/sway helper rodent - focus the last focused window (per workspace)
;;;

(define-public i3gopher
  (package
    (name "i3gopher")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "i3gopher" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "i3/sway helper rodent - focus the last focused window (per workspace)")
    (description "i3/sway helper rodent - focus the last focused window (per workspace)")
    (home-page "https://aur.archlinux.org/packages/i3gopher")
    (license license:gpl3+)))
;;;
;;; --- 65. statusok-bin ---
;;; Monitor your Website and APIs from your Computer. Get Notified through Slack, E-
;;;

(define-public statusok-bin
  (package
    (name "statusok-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "statusok-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/statusok-bin/"))))
    (synopsis "monitor your Website and APIs from your Computer. Get Notified through Slac...")
    (description "Monitor your Website and APIs from your Computer. Get Notified through Slack, E-mail when your server is down or response time is more than expected")
    (home-page "https://aur.archlinux.org/packages/statusok-bin")
    (license license:gpl3+)))
;;;
;;; --- 66. wkeys-git ---
;;; An on-screen keyboard for wayland desktop and a corresponding Cosmic applet writ
;;;

(define-public wkeys-git
  (package
    (name "wkeys-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "wkeys-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "An on-screen keyboard for wayland desktop and a corresponding Cosmic applet...")
    (description "An on-screen keyboard for wayland desktop and a corresponding Cosmic applet written by rust.")
    (home-page "https://aur.archlinux.org/packages/wkeys-git")
    (license license:gpl3+)))
;;;
;;; --- 67. pam_pinlock ---
;;; Secure, feature-rich PIN-based PAM module for Linux
;;;

(define-public pam-pinlock
  (package
    (name "pam_pinlock")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "pam_pinlock" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "secure, feature-rich PIN-based PAM module for Linux")
    (description "Secure, feature-rich PIN-based PAM module for Linux")
    (home-page "https://aur.archlinux.org/packages/pam_pinlock")
    (license license:gpl3+)))
;;;
;;; --- 68. make-it-rain ---
;;; Make it rain like it's 1999
;;;

(define-public make-it-rain
  (package
    (name "make-it-rain")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "make-it-rain" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "make it rain like it's 1999")
    (description "Make it rain like it's 1999")
    (home-page "https://aur.archlinux.org/packages/make-it-rain")
    (license license:gpl3+)))
;;;
;;; --- 69. libcurlpp-git ---
;;; cURLpp is a C++ wrapper for libcURL (git version)
;;;

(define-public libcurlpp-git
  (package
    (name "libcurlpp-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "libcurlpp-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "cURLpp is a C++ wrapper for libcURL (git version)")
    (description "cURLpp is a C++ wrapper for libcURL (git version)")
    (home-page "https://aur.archlinux.org/packages/libcurlpp-git")
    (license license:gpl3+)))
;;;
;;; --- 70. qt6-xcb-private-headers-scrollfix ---
;;; Private headers for Qt6 Xcb
;;;

(define-public qt6-xcb-private-headers-scrollfix
  (package
    (name "qt6-xcb-private-headers-scrollfix")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "qt6-xcb-private-headers-scrollfix" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "private headers for Qt6 Xcb")
    (description "Private headers for Qt6 Xcb")
    (home-page "https://aur.archlinux.org/packages/qt6-xcb-private-headers-scrollfix")
    (license license:gpl3+)))
;;;
;;; --- 71. qt6-base-scrollfix ---
;;; A cross-platform application and UI framework
;;;

(define-public qt6-base-scrollfix
  (package
    (name "qt6-base-scrollfix")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "qt6-base-scrollfix" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A cross-platform application and UI framework")
    (description "A cross-platform application and UI framework")
    (home-page "https://aur.archlinux.org/packages/qt6-base-scrollfix")
    (license license:gpl3+)))
;;;
;;; --- 72. got-your-back ---
;;; A command line tool for backing up Gmail messages. Known as GYB.
;;;

(define-public got-your-back
  (package
    (name "got-your-back")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "got-your-back" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A command line tool for backing up Gmail messages. Known as GYB")
    (description "A command line tool for backing up Gmail messages. Known as GYB.")
    (home-page "https://aur.archlinux.org/packages/got-your-back")
    (license license:gpl3+)))
;;;
;;; --- 73. davinci-alac-scripts ---
;;; Davinci Scripts to convert your footage audio to ALAC (crouch)
;;;

(define-public davinci-alac-scripts
  (package
    (name "davinci-alac-scripts")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "davinci-alac-scripts" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Davinci Scripts to convert your footage audio to ALAC (crouch)")
    (description "Davinci Scripts to convert your footage audio to ALAC (crouch)")
    (home-page "https://aur.archlinux.org/packages/davinci-alac-scripts")
    (license license:gpl3+)))
;;;
;;; --- 74. cookie-git ---
;;; Simple music player TUI
;;;

(define-public cookie-git
  (package
    (name "cookie-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cookie-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple music player TUI")
    (description "Simple music player TUI")
    (home-page "https://aur.archlinux.org/packages/cookie-git")
    (license license:gpl3+)))
;;;
;;; --- 75. wowup-cf-beta-bin ---
;;; WowUp the World of Warcraft addon updater (with CurseForge support) - Beta versi
;;;

(define-public wowup-cf-beta-bin
  (package
    (name "wowup-cf-beta-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "wowup-cf-beta-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/wowup-cf-beta-bin/"))))
    (synopsis "wowUp the World of Warcraft addon updater (with CurseForge support) - Beta ...")
    (description "WowUp the World of Warcraft addon updater (with CurseForge support) - Beta version")
    (home-page "https://aur.archlinux.org/packages/wowup-cf-beta-bin")
    (license license:gpl3+)))
;;;
;;; --- 76. perl-astro-fits-cfitsio ---
;;; Perl extension for using the cfitsio library
;;;

(define-public perl-astro-fits-cfitsio
  (package
    (name "perl-astro-fits-cfitsio")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "perl-astro-fits-cfitsio" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Perl extension for using the cfitsio library")
    (description "Perl extension for using the cfitsio library")
    (home-page "https://aur.archlinux.org/packages/perl-astro-fits-cfitsio")
    (license license:gpl3+)))
;;;
;;; --- 77. perl-alien-build-plugin-pkgconfig-ppwrapper ---
;;; Alien::Build plugin to ensure the pure perl PkgConfig is not run by the MSYS per
;;;

(define-public perl-alien-build-plugin-pkgconfig-ppwrapper
  (package
    (name "perl-alien-build-plugin-pkgconfig-ppwrapper")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "perl-alien-build-plugin-pkgconfig-ppwrapper" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "alien::Build plugin to ensure the pure perl PkgConfig is not run by the MSY...")
    (description "Alien::Build plugin to ensure the pure perl PkgConfig is not run by the MSYS perl")
    (home-page "https://aur.archlinux.org/packages/perl-alien-build-plugin-pkgconfig-ppwrapper")
    (license license:gpl3+)))
;;;
;;; --- 78. perl-alien-build-plugin-cleanse-builddir ---
;;; Alien::Build plugin to cleanse the build dir after the build phase
;;;

(define-public perl-alien-build-plugin-cleanse-builddir
  (package
    (name "perl-alien-build-plugin-cleanse-builddir")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "perl-alien-build-plugin-cleanse-builddir" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "alien::Build plugin to cleanse the build dir after the build phase")
    (description "Alien::Build plugin to cleanse the build dir after the build phase")
    (home-page "https://aur.archlinux.org/packages/perl-alien-build-plugin-cleanse-builddir")
    (license license:gpl3+)))
;;;
;;; --- 79. cobib-zotero-git ---
;;; Zotero importer plugin for coBib
;;;

(define-public cobib-zotero-git
  (package
    (name "cobib-zotero-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cobib-zotero-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "zotero importer plugin for coBib")
    (description "Zotero importer plugin for coBib")
    (home-page "https://aur.archlinux.org/packages/cobib-zotero-git")
    (license license:gpl3+)))
;;;
;;; --- 80. clice-bin ---
;;; A next-generation C++ language server for modern C++, focused on high performanc
;;;

(define-public clice-bin
  (package
    (name "clice-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "clice-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/clice-bin/"))))
    (synopsis "A next-generation C++ language server for modern C++, focused on high perfo...")
    (description "A next-generation C++ language server for modern C++, focused on high performance and deep code intelligence.")
    (home-page "https://aur.archlinux.org/packages/clice-bin")
    (license license:gpl3+)))
;;;
;;; --- 81. espressif-ide-bin ---
;;; Eclipse-based IDE for ESP-IDF development
;;;

(define-public espressif-ide-bin
  (package
    (name "espressif-ide-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "espressif-ide-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/espressif-ide-bin/"))))
    (synopsis "Eclipse-based IDE for ESP-IDF development")
    (description "Eclipse-based IDE for ESP-IDF development")
    (home-page "https://aur.archlinux.org/packages/espressif-ide-bin")
    (license license:nonfree)))
;;;
;;; --- 82. bobcat-terminal-headless-git ---
;;; A powerful yet user-friendy cross-platform terminal emulator (headless version)
;;;

(define-public bobcat-terminal-headless-git
  (package
    (name "bobcat-terminal-headless-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "bobcat-terminal-headless-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A powerful yet user-friendy cross-platform terminal emulator (headless vers...")
    (description "A powerful yet user-friendy cross-platform terminal emulator (headless version)")
    (home-page "https://aur.archlinux.org/packages/bobcat-terminal-headless-git")
    (license license:gpl3+)))
;;;
;;; --- 83. aarch64-esr-decoder-git ---
;;; A small utility for decoding aarch64 ESR register values.
;;;

(define-public aarch64-esr-decoder-git
  (package
    (name "aarch64-esr-decoder-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "aarch64-esr-decoder-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A small utility for decoding aarch64 ESR register values")
    (description "A small utility for decoding aarch64 ESR register values.")
    (home-page "https://aur.archlinux.org/packages/aarch64-esr-decoder-git")
    (license license:gpl3+)))
;;;
;;; --- 84. niiet-openocd-git ---
;;; Provides on-chip programming and debugging support, also for NIIET MCUs
;;;

(define-public niiet-openocd-git
  (package
    (name "niiet-openocd-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "niiet-openocd-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "provides on-chip programming and debugging support, also for NIIET MCUs")
    (description "Provides on-chip programming and debugging support, also for NIIET MCUs")
    (home-page "https://aur.archlinux.org/packages/niiet-openocd-git")
    (license license:gpl3+)))
;;;
;;; --- 85. cosmographia-bin ---
;;; Cosmographia is a visualization program rendering the solar system and its bodie
;;;

(define-public cosmographia-bin
  (package
    (name "cosmographia-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cosmographia-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/cosmographia-bin/"))))
    (synopsis "cosmographia is a visualization program rendering the solar system and its ...")
    (description "Cosmographia is a visualization program rendering the solar system and its bodies in 3D to create a freely navigable map of the solar system")
    (home-page "https://aur.archlinux.org/packages/cosmographia-bin")
    (license license:nonfree)))
;;;
;;; --- 86. reel-bin ---
;;; A modern GTK frontend for Plex and other media servers
;;;

(define-public reel-bin
  (package
    (name "reel-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "reel-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/reel-bin/"))))
    (synopsis "A modern GTK frontend for Plex and other media servers")
    (description "A modern GTK frontend for Plex and other media servers")
    (home-page "https://aur.archlinux.org/packages/reel-bin")
    (license license:gpl3+)))
;;;
;;; --- 87. perl-data-validate-domain ---
;;; Domain and host name validation
;;;

(define-public perl-data-validate-domain
  (package
    (name "perl-data-validate-domain")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "perl-data-validate-domain" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "domain and host name validation")
    (description "Domain and host name validation")
    (home-page "https://aur.archlinux.org/packages/perl-data-validate-domain")
    (license license:gpl3+)))
;;;
;;; --- 88. stylish-bin ---
;;; Simple and intuitive lscolors configuration. Put that glam in your term
;;;

(define-public stylish-bin
  (package
    (name "stylish-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "stylish-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/stylish-bin/"))))
    (synopsis "simple and intuitive lscolors configuration. Put that glam in your term")
    (description "Simple and intuitive lscolors configuration. Put that glam in your term")
    (home-page "https://aur.archlinux.org/packages/stylish-bin")
    (license license:gpl3+)))
;;;
;;; --- 89. dezoomify-rs-bin ---
;;; Download zoomable images from online viewers (Rust implementation)
;;;

(define-public dezoomify-rs-bin
  (package
    (name "dezoomify-rs-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "dezoomify-rs-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/dezoomify-rs-bin/"))))
    (synopsis "download zoomable images from online viewers (Rust implementation)")
    (description "Download zoomable images from online viewers (Rust implementation)")
    (home-page "https://aur.archlinux.org/packages/dezoomify-rs-bin")
    (license license:gpl3+)))
;;;
;;; --- 90. campfire-bin ---
;;; Cozy up with your logs
;;;

(define-public campfire-bin
  (package
    (name "campfire-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "campfire-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/campfire-bin/"))))
    (synopsis "cozy up with your logs")
    (description "Cozy up with your logs")
    (home-page "https://aur.archlinux.org/packages/campfire-bin")
    (license license:gpl3+)))
;;;
;;; --- 91. rash-sh ---
;;; rash, the rat ass shell, is a rudimentary shell written in C
;;;

(define-public rash-sh
  (package
    (name "rash-sh")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "rash-sh" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "rash, the rat ass shell, is a rudimentary shell written in C")
    (description "rash, the rat ass shell, is a rudimentary shell written in C")
    (home-page "https://aur.archlinux.org/packages/rash-sh")
    (license license:gpl3+)))
;;;
;;; --- 92. cli-modplayer ---
;;; A terminal-based Module player (.mod, .xm, .it, .s3m) with real-time visualizati
;;;

(define-public cli-modplayer
  (package
    (name "cli-modplayer")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cli-modplayer" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A terminal-based Module player (.mod, .xm, .it, .s3m) with real-time visual...")
    (description "A terminal-based Module player (.mod, .xm, .it, .s3m) with real-time visualization")
    (home-page "https://aur.archlinux.org/packages/cli-modplayer")
    (license license:gpl3+)))
;;;
;;; --- 93. ibazel-bin ---
;;; Tool for building Bazel targets when source files change.
;;;

(define-public ibazel-bin
  (package
    (name "ibazel-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ibazel-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/ibazel-bin/"))))
    (synopsis "tool for building Bazel targets when source files change")
    (description "Tool for building Bazel targets when source files change.")
    (home-page "https://aur.archlinux.org/packages/ibazel-bin")
    (license license:gpl3+)))
;;;
;;; --- 94. tmux-nord-theme ---
;;; An arctic, north-bluish clean and elegant tmux color theme.
;;;

(define-public tmux-nord-theme
  (package
    (name "tmux-nord-theme")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "tmux-nord-theme" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "An arctic, north-bluish clean and elegant tmux color theme")
    (description "An arctic, north-bluish clean and elegant tmux color theme.")
    (home-page "https://aur.archlinux.org/packages/tmux-nord-theme")
    (license license:gpl3+)))
;;;
;;; --- 95. nap-bin ---
;;; Code snippet manager for your terminal
;;;

(define-public nap-bin
  (package
    (name "nap-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "nap-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/nap-bin/"))))
    (synopsis "code snippet manager for your terminal")
    (description "Code snippet manager for your terminal")
    (home-page "https://aur.archlinux.org/packages/nap-bin")
    (license license:gpl3+)))
;;;
;;; --- 96. cuda-12.5 ---
;;; NVIDIA's GPU programming toolkit
;;;

(define-public cuda-12-dot-5
  (package
    (name "cuda-12.5")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cuda-12.5" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "NVIDIA's GPU programming toolkit")
    (description "NVIDIA's GPU programming toolkit")
    (home-page "https://aur.archlinux.org/packages/cuda-12.5")
    (license license:nonfree)))
;;;
;;; --- 97. leizi-shell-bin ---
;;; Modern POSIX-compatible shell with ZSH-style arrays and Powerlevel10k-inspired p
;;;

(define-public leizi-shell-bin
  (package
    (name "leizi-shell-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "leizi-shell-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/leizi-shell-bin/"))))
    (synopsis "modern POSIX-compatible shell with ZSH-style arrays and Powerlevel10k-inspi...")
    (description "Modern POSIX-compatible shell with ZSH-style arrays and Powerlevel10k-inspired prompts")
    (home-page "https://aur.archlinux.org/packages/leizi-shell-bin")
    (license license:gpl3+)))
;;;
;;; --- 98. batticonplus-git ---
;;; Lightweight battery icon for the system tray and notifier, git version (based on
;;;

(define-public batticonplus-git
  (package
    (name "batticonplus-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "batticonplus-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight battery icon for the system tray and notifier, git version (bas...")
    (description "Lightweight battery icon for the system tray and notifier, git version (based on cbatticon)")
    (home-page "https://aur.archlinux.org/packages/batticonplus-git")
    (license license:gpl3+)))
;;;
;;; --- 99. batticonplus-ayatana-git ---
;;; Lightweight battery icon for the system tray and notifier, wayland git version (
;;;

(define-public batticonplus-ayatana-git
  (package
    (name "batticonplus-ayatana-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "batticonplus-ayatana-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight battery icon for the system tray and notifier, wayland git vers...")
    (description "Lightweight battery icon for the system tray and notifier, wayland git version (based on cbatticon)")
    (home-page "https://aur.archlinux.org/packages/batticonplus-ayatana-git")
    (license license:gpl3+)))
;;;
;;; --- 100. batticonplus-ayatana ---
;;; Lightweight battery icon for the system tray and notifier, wayland version (base
;;;

(define-public batticonplus-ayatana
  (package
    (name "batticonplus-ayatana")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "batticonplus-ayatana" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight battery icon for the system tray and notifier, wayland version ...")
    (description "Lightweight battery icon for the system tray and notifier, wayland version (based on cbatticon)")
    (home-page "https://aur.archlinux.org/packages/batticonplus-ayatana")
    (license license:gpl3+)))
