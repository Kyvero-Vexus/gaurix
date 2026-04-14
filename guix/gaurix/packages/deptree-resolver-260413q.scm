;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree priority resolver --- deptree-resolver-260413q
;;; Resolves 100 BLOCKED packages from priority queue:
;;;   - 7 recipes created
;;;   - 93 blocked with specific reason codes
;;;
;;; Recipes (7):
;;;   - chromium-gost (copy, binary .deb, v142.0.7444.176)
;;;   - dvdisaster-speed47-git (gnu, v0.79.10)
;;;   - fallout1-ce-game (cmake, v1.1.0)
;;;   - locale-en_ru (gnu, v0.5.5)
;;;   - localsend-go (go, v1.2.7)
;;;   - xcaddy (go, v0.4.5)
;;;   - xr-passthrough-layer-git (cargo, git)
;;;
;;; Blocked (93):
;;;   sonic-win [INFEASIBLE_BUILD: patched KDE kwin fork, requires full KDE build infra + 55 deps]
;;;   lib32-xrizer [LIB32_UNSUPPORTED]
;;;   plasma-workspace-povd [INFEASIBLE_BUILD: patched KDE workspace, 99 deps]
;;;   lib32-l-smash [LIB32_UNSUPPORTED]
;;;   new-lg4ff-dkms-git [DKMS_KERNEL_MODULE]
;;;   lib32-libudev0-shim [LIB32_UNSUPPORTED]
;;;   hid-fanatecff-dkms [DKMS_KERNEL_MODULE]
;;;   linux-cachyos-lts [CUSTOM_KERNEL: CachyOS LTS kernel variant]
;;;   linux-cachyos [CUSTOM_KERNEL: CachyOS kernel variant]
;;;   linux-cachyos-rc [CUSTOM_KERNEL: CachyOS RC kernel variant]
;;;   qt6-base-hifps [INFEASIBLE_BUILD: patched Qt6 base, 45+ deps]
;;;   anbox-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   gram-editor-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.8.arch1-1-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.8.arch1-1-docs-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.8.arch1-1-headers-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.arch1-1-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.arch1-1-docs-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.arch1-1-headers-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.zen1-1-zen-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.zen1-1-zen-docs-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.zen1-1-zen-headers-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   llama.cpp-aio [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   nvidia-vulkan-dkms [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   openai-codex-autoup-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   opensc-p11-kit-module [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   pac-pacman-aliases [ARCH_SPECIFIC: pacman shell aliases]
;;;   pacman-log-orphans-hook [ARCH_SPECIFIC: pacman hook]
;;;   pipewire-enable-bluez5 [ARCH_SPECIFIC: pacman hook for pipewire]
;;;   projtlauncher [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   python-uharfbuzz [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   shimmy-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   shorinclip-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   subs2srs-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   ttf-ms-win10-japanese [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-korean [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-other [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-sea [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-thai [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-zh_cn [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-zh_tw [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-japanese [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-korean [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-other [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-sea [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-thai [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-zh_cn [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-zh_tw [PROPRIETARY_FONT_LICENSE]
;;;   vdhcoapp [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   vivaldi-ffmpeg-codecs [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   whatsapp-for-linux [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   zettlr [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   ancient-packages [ARCH_SPECIFIC: depends on package-query (pacman tool)]
;;;   binder_linux-dkms [DKMS_KERNEL_MODULE]
;;;   lib32-libtxc_dxtn [LIB32_UNSUPPORTED]
;;;   lib32-zix [LIB32_UNSUPPORTED]
;;;   linux-zen-versioned-docs-bin [LINUX_METAPACKAGE]
;;;   linux-zen-versioned-headers-bin [LINUX_METAPACKAGE]
;;;   localepurge-hook [ARCH_SPECIFIC: pacman hook for localepurge]
;;;   mandb-instant-update [ARCH_SPECIFIC: pacman hook for mandb]
;;;   mkinitcpio-sd-numlock [ARCH_SPECIFIC: mkinitcpio hook]
;;;   paccache-hook [ARCH_SPECIFIC: pacman hook]
;;;   systemd-boot-pacman-hook [ARCH_SPECIFIC: pacman hook for systemd-boot]
;;;   yaycache-hook [ARCH_SPECIFIC: yay/pacman hook]
;;;   youtube-music-desktop [DEP_UNAVAILABLE: depends on qtws-base, not packaged]
;;;   amneziawg-dkms [DKMS_KERNEL_MODULE]
;;;   arch-gdm-theme-list [ARCH_SPECIFIC: Arch Linux GDM theme]
;;;   checkupdates-notify [ARCH_SPECIFIC: depends on pacman-contrib]
;;;   csharpier [DOTNET_UNSUPPORTED: requires dotnet-sdk-10.0]
;;;   cython2 [DEPRECATED: Python 2 is EOL]
;;;   deezer-enhanced [ELECTRON_APP: npm-based Electron app]
;;;   discord-chat-exporter-plus-cli [DOTNET_UNSUPPORTED: requires dotnet-sdk-10.0]
;;;   etckeeper-packages [ARCH_SPECIFIC: depends on pacman]
;;;   i2c-nct6793-dkms-git [DKMS_KERNEL_MODULE]
;;;   imx471-dkms-git [DKMS_KERNEL_MODULE: IMX471 sensor driver via DKMS]
;;;   intel-ucode-git [FIRMWARE_PACKAGE: Intel microcode, custom license, requires iucode-tool processing]
;;;   iptvnator-electron-bin [ELECTRON_APP: depends on electron39]
;;;   it87-dkms-git [DKMS_KERNEL_MODULE: ITE LPC chip driver]
;;;   ithc-dkms-git [DKMS_KERNEL_MODULE: Intel Touch Host Controller driver]
;;;   ivpn-dinit [DEP_UNAVAILABLE: depends on dinit init system, not in Guix]
;;;   jdk-doc [PROPRIETARY_LICENSE: Oracle Java documentation, restricted redistribution]
;;;   jdk21-graalvm-ee-bin [PROPRIETARY_LICENSE: GraalVM Enterprise GFTC license]
;;;   konica-minolta-bizhub-c554e-series [PROPRIETARY_LICENSE: Konica Minolta commercial license]
;;;   lact-openrc [DEP_UNAVAILABLE: OpenRC init system not available in Guix]
;;;   lib32-a52dec [LIB32_UNSUPPORTED]
;;;   lib32-gperftools [LIB32_UNSUPPORTED]
;;;   lib32-opencl-legacy-amdgpu-pro [LIB32_UNSUPPORTED + PROPRIETARY_LICENSE: AMD EULA]
;;;   linux-xanmod-linux-bin-x64v3 [LINUX_KERNEL_BINARY: prebuilt kernel, not suitable for Guix]
;;;   linux-xanmod-linux-headers-bin-x64v3 [LINUX_KERNEL_BINARY: prebuilt kernel headers]
;;;   linux-xanmod-lts-linux-bin-x64v3 [LINUX_KERNEL_BINARY: prebuilt LTS kernel]
;;;   linux-xanmod-lts-linux-headers-bin-x64v3 [LINUX_KERNEL_BINARY: prebuilt LTS kernel headers]
;;;   linux-zen-versioned-bin [LINUX_METAPACKAGE]
;;;   llvm-mos-git [INFEASIBLE_BUILD: entire LLVM fork for 6502, massive cmake build]

(define-module (gaurix packages deptree-resolver-260413q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system cargo)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages golang)
  #:export (
            chromium-gost
            dvdisaster-speed47-git
            fallout1-ce-game
            locale-en-ru
            localsend-go
            xcaddy
            xr-passthrough-layer-git
            ))

;;; -- chromium-gost (#757) --

(define-public chromium-gost
  (package
    (name "chromium-gost")
    (version "142.0.7444.176")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/deemru/Chromium-Gost/releases/download/"
                    version "/chromium-gost-" version "-linux-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (home-page "https://github.com/deemru/Chromium-Gost")
    (synopsis "chromium browser with GOST cryptographic algorithm support")
    (description "Chromium-Gost is a Chromium-based web browser with support
for GOST cryptographic algorithms via the msspi interface for establishing
secure TLS connections.  It provides Russian government-standard crypto
for web browsing.")
    (license license:expat)))

;;; -- dvdisaster-speed47-git (#12692) --

(define-public dvdisaster-speed47-git
  (package
    (name "dvdisaster-speed47-git")
    (version "0.79.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/speed47/dvdisaster")
                    (commit (string-append "v" version ".pl3"))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix=" (assoc-ref outputs "out"))))))))
    (inputs (list gtk+-2))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/speed47/dvdisaster")
    (synopsis "data protection against aging and scratches on CD/DVD media")
    (description "Dvdisaster provides a safety margin against data loss on
CD and DVD media caused by aging or scratches.  It creates error correction
data which can be used to recover unreadable sectors if the disc becomes
damaged.  This is the speed47 fork with continued maintenance.")
    (license license:gpl3+)))

;;; -- fallout1-ce-game (#12753) --

(define-public fallout1-ce-game
  (package
    (name "fallout1-ce-game")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alexbatalov/fallout1-ce/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-desktop-file
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/share/applications"))))))))
    (inputs (list sdl2))
    ;; NOTE: license is custom Sustainable Use License (SUL), non-FOSS
    ;; NOTE: requires original Fallout 1 game data files to run
    (home-page "https://github.com/alexbatalov/fallout1-ce")
    (synopsis "fallout 1 community edition for modern operating systems")
    (description "Fallout 1 Community Edition is a fully working
re-implementation of Fallout 1 that runs natively on modern operating
systems.  It requires the original Fallout 1 game data files (MASTER.DAT
and CRITTER.DAT) to be provided separately.")
    (license (license:non-copyleft
              "https://github.com/alexbatalov/fallout1-ce/blob/main/LICENSE.md"
              "Sustainable Use License (non-FOSS)"))))

;;; -- locale-en_ru (#10385) --

(define-public locale-en-ru
  (package
    (name "locale-en-ru")
    (version "0.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/en-ru/"
                    version "/locale-en_RU-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "--prefix=" #$output)
                   "--disable-rpm"
                   "--disable-html"
                   "--enable-ruble-sign")))
    (native-inputs (list perl))
    (home-page "https://sourceforge.net/projects/en-ru/")
    (synopsis "english language locale for Russia")
    (description "Locale-en_RU provides an English language locale tailored
for Russia, including date/time formatting, currency (ruble), and number
formats following Russian conventions while using the English language.")
    (license license:gpl3+)))

;;; -- localsend-go (#10205) --

(define-public localsend-go
  (package
    (name "localsend-go")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meowrain/localsend-go")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/meowrain/localsend-go"
           #:tests? #f))
    ;; NOTE: Go module dependencies need enumeration for full build
    (home-page "https://github.com/meowrain/localsend-go")
    (synopsis "CLI implementation of LocalSend protocol in Go")
    (description "Localsend-go is a command-line implementation of the
LocalSend protocol written in Go, enabling file sharing between devices
on a local network without requiring an internet connection.")
    (license license:expat)))

;;; -- xcaddy (#10559) --

(define-public xcaddy
  (package
    (name "xcaddy")
    (version "0.4.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/caddyserver/xcaddy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/caddyserver/xcaddy"
           #:unpack-path "github.com/caddyserver/xcaddy"
           #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda* (#:key import-path #:allow-other-keys)
                   (invoke "go" "build" "-v" "-trimpath"
                           "-o" "xcaddy"
                           (string-append import-path "/cmd/xcaddy"))))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "xcaddy" bin)))))))
    ;; NOTE: Go module dependencies need enumeration for full build
    ;; NOTE: xcaddy requires Go at runtime to build Caddy with plugins
    (inputs (list go))
    (home-page "https://github.com/caddyserver/xcaddy")
    (synopsis "build Caddy web server with plugins")
    (description "Xcaddy is a tool that makes it easy to build Caddy web
server with plugins.  It downloads the Caddy source and specified plugins,
then compiles everything together into a single binary using the Go
toolchain.")
    (license license:asl2.0)))

;;; -- xr-passthrough-layer-git (#12741) --

(define-public xr-passthrough-layer-git
  (package
    (name "xr-passthrough-layer-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yshui/xr_passthrough_layer")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    ;; NOTE: Cargo crate inputs need enumeration for full build
    (home-page "https://github.com/yshui/xr_passthrough_layer")
    (synopsis "openXR API layer adding camera passthrough support")
    (description "Xr-passthrough-layer is an OpenXR API layer that adds
camera passthrough support to OpenXR applications.  It enables mixed
reality experiences by compositing the camera feed into the VR view.")
    (license license:expat)))
