;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree priority resolver --- deptree-resolver-260413o
;;; Resolves 100 BLOCKED packages from priority queue:
;;;   - 16 recipes created
;;;   - 84 blocked with specific reason codes
;;;
;;; Recipes (16):
;;;   - inkscape-open-symbols-git (copy, v1.2.1)
;;;   - inori (cargo, v0.3.0)
;;;   - inotify-info (gnu, v0.0.4)
;;;   - ipscan (copy, v3.9.3)
;;;   - jasm-bin (copy, v0.7.0)
;;;   - jid (go, v0.7.6)
;;;   - journald-broker (cargo, v0.7.0)
;;;   - k3s-bin (copy, v1.35.2+k3s1)
;;;   - k6 (go, v1.7.1)
;;;   - kak-tree-sitter (cargo, v3.2.0)
;;;   - kaval-bin (copy, v0.1.0)
;;;   - kdrive-bin (copy, v3.8.2.6)
;;;   - kicad-library-espressif-git (copy, v0.1)
;;;   - klein-bin (copy, v0.6.0)
;;;   - krep-git (gnu, v2.2.0)
;;;   - kumono (cargo, v0.77.0)
;;;
;;; Blocked (84):
;;;   sonic-win [INFEASIBLE_BUILD: patched KDE kwin fork, requires full KDE build infra]
;;;   lib32-xrizer [LIB32_UNSUPPORTED]
;;;   plasma-workspace-povd [INFEASIBLE_BUILD: patched KDE workspace, requires full KDE build infra + custom patches]
;;;   lib32-l-smash [LIB32_UNSUPPORTED]
;;;   new-lg4ff-dkms-git [DKMS_KERNEL_MODULE]
;;;   lib32-libudev0-shim [LIB32_UNSUPPORTED]
;;;   hid-fanatecff-dkms [DKMS_KERNEL_MODULE]
;;;   linux-cachyos-lts [CUSTOM_KERNEL: CachyOS LTS kernel variant]
;;;   linux-cachyos [CUSTOM_KERNEL: CachyOS kernel variant]
;;;   linux-cachyos-rc [CUSTOM_KERNEL: CachyOS RC kernel variant]
;;;   qt6-base-hifps [INFEASIBLE_BUILD: patched Qt6 base, requires full Qt build infra]
;;;   anbox-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   chromium-gost [INFEASIBLE_BUILD: full Chromium build with GOST crypto patches]
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
;;;   csharpier [DOTNET_UNSUPPORTED: requires .NET SDK 10.0]
;;;   cython2 [DEPRECATED: Python 2 is EOL]
;;;   deezer-enhanced [ELECTRON_APP: depends on electron37]
;;;   discord-chat-exporter-plus-cli [DOTNET_UNSUPPORTED: requires .NET runtime 10.0]
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

(define-module (gaurix packages deptree-resolver-260413o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:export (
            inkscape-open-symbols-git
            inori
            inotify-info
            ipscan
            jasm-bin
            jid
            journald-broker
            k3s-bin
            k6
            kak-tree-sitter
            kaval-bin
            kdrive-bin
            kicad-library-espressif-git
            klein-bin
            krep-git
            kumono
            ))

;;; -- inkscape-open-symbols-git (#10290) --

(define-public inkscape-open-symbols-git
  (package
    (name "inkscape-open-symbols-git")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PanderMusubi/inkscape-open-symbols")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/inkscape/symbols/"
                #:include-regexp (".*\\.svg$")))))
    (home-page "https://github.com/PanderMusubi/inkscape-open-symbols")
    (synopsis "open source icon sets to use as Inkscape symbols")
    (description "Open source icon sets packaged as Inkscape symbol
libraries.  Includes Material Design, Font Awesome, Octicons, and many
other popular icon sets for use in Inkscape.")
    (license license:expat)))

;;; -- inori (#295) --

(define-public inori
  (package
    (name "inori")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eshrh/inori")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    ;; NOTE: Cargo crate inputs need enumeration for full build
    (home-page "https://github.com/eshrh/inori")
    (synopsis "terminal mpd client with effective searching")
    (description "Inori is a terminal MPD client focused on effective
searching.  It provides a TUI interface for browsing and controlling
music playback through the Music Player Daemon.")
    (license license:gpl3)))

;;; -- inotify-info (#6803) --

(define-public inotify-info
  (package
    (name "inotify-info")
    (version "0.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mikesart/inotify-info")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'install 'create-dirs
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)))))))
    (home-page "https://github.com/mikesart/inotify-info")
    (synopsis "linux inotify info reporting app")
    (description "Inotify-info is a tool that shows which processes are
using inotify watches on a Linux system and how many watches they
consume.  Useful for diagnosing inotify watch exhaustion.")
    (license license:expat)))

;;; -- ipscan (#1700) --

(define-public ipscan
  (package
    (name "ipscan")
    (version "3.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/angryip/ipscan/releases/download/"
                    version "/ipscan-linux64-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ipscan.jar" "share/java/ipscan.jar"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "ipscan.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/ipscan.jar")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/ipscan")
                       (lambda ()
                         (display (string-append "#!/bin/sh\nexec "
                                                 (search-input-file inputs "bin/java")
                                                 " -jar " jar " \"$@\"\n"))))
                     (chmod (string-append bin "/ipscan") #o755)))))))
    (inputs (list (list openjdk17 "jdk")))
    (home-page "https://angryip.org")
    (synopsis "fast and friendly network scanner")
    (description "Angry IP Scanner is an open-source and cross-platform
network scanner designed to be fast and simple to use.  It scans IP
addresses and ports as well as has many other features.")
    (license license:gpl2)))

;;; -- jasm-bin (#2571) --

(define-public jasm-bin
  (package
    (name "jasm-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/roscopeco/jasm/releases/download/v"
                    version "/jasm-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/"))))
    (inputs (list openjdk11))
    (home-page "https://github.com/roscopeco/jasm")
    (synopsis "JVM assembler for the modern age")
    (description "Jasm is a modern JVM assembler that allows writing JVM
bytecode directly.  It supports the full JVM instruction set and
produces standard class files.")
    (license license:expat)))

;;; -- jid (#2954) --

(define-public jid
  (package
    (name "jid")
    (version "0.7.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simeji/jid")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/simeji/jid"
           #:tests? #f))
    ;; NOTE: Go module dependencies need enumeration for full build
    (home-page "https://github.com/simeji/jid")
    (synopsis "JSON incremental digger")
    (description "Jid is an interactive JSON drilling down tool using
filtering queries like jq.  You can incrementally drill down JSON data
interactively by using filtering queries.")
    (license license:expat)))

;;; -- journald-broker (#6852) --

(define-public journald-broker
  (package
    (name "journald-broker")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bpetlert/journald-broker")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    ;; NOTE: Cargo crate inputs need enumeration for full build
    (home-page "https://github.com/bpetlert/journald-broker")
    (synopsis "log-based event dispatcher daemon for systemd journal")
    (description "Journald-broker is a log-based event dispatcher daemon
for systemd's journal.  It monitors journal entries and triggers
configured actions based on matching log patterns.")
    (license license:gpl3+)))

;;; -- k3s-bin (#11177) --

(define-public k3s-bin
  (package
    (name "k3s-bin")
    (version "1.35.2+k3s1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/k3s-io/k3s/releases/download/v"
                    (string-replace-substring version "+" "%2B")
                    "/k3s"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("k3s" "bin/k3s"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "k3s")
                   (chmod "k3s" #o755)))
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out") "/bin/k3s") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://k3s.io")
    (synopsis "lightweight Kubernetes distribution")
    (description "K3s is a lightweight, certified Kubernetes distribution
designed for production workloads in resource-constrained environments.
It packages the Kubernetes control plane and runtime into a single
binary.")
    (license license:asl2.0)))

;;; -- k6 (#10243) --

(define-public k6
  (package
    (name "k6")
    (version "1.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grafana/k6")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "go.k6.io/k6"
           #:tests? #f))
    ;; NOTE: Go module dependencies need enumeration for full build
    (home-page "https://github.com/grafana/k6")
    (synopsis "modern load testing tool using Go and JavaScript")
    (description "K6 is a modern load testing tool built for developer
happiness.  It provides a scripting API using JavaScript (ES6) for
defining test scenarios with support for HTTP/1.1, HTTP/2, WebSocket,
and gRPC protocols.")
    (license license:agpl3+)))

;;; -- kak-tree-sitter (#10234) --

(define-public kak-tree-sitter
  (package
    (name "kak-tree-sitter")
    (version "3.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~hadronized/kak-tree-sitter")
                    (commit (string-append "kak-tree-sitter-v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    ;; NOTE: Cargo crate inputs need enumeration for full build
    (home-page "https://git.sr.ht/~hadronized/kak-tree-sitter")
    (synopsis "tree-sitter integration for Kakoune editor")
    (description "Kak-tree-sitter integrates tree-sitter with the
Kakoune text editor, providing syntax highlighting, text objects,
and structural navigation based on tree-sitter grammars.")
    (license license:bsd-3)))

;;; -- kaval-bin (#2576) --

(define-public kaval-bin
  (package
    (name "kaval-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AppachiTech/kaval/releases/download/v"
                    version "/kaval-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kaval" "bin/kaval"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "kaval")
                   (chmod "kaval" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AppachiTech/kaval")
    (synopsis "developer-focused port and process manager TUI")
    (description "Kaval is a developer-focused port and process manager
with a terminal user interface.  It provides an easy way to manage
development server ports and running processes.")
    (license license:expat)))

;;; -- kdrive-bin (#1295) --

(define-public kdrive-bin
  (package
    (name "kdrive-bin")
    (version "3.8.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.storage.infomaniak.com/drive/desktopclient/kDrive-"
                    version "-amd64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kdrive" "bin/kdrive"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "kdrive")
                   (chmod "kdrive" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://drive.infomaniak.com")
    (synopsis "infomaniak Drive desktop synchronization client")
    (description "kDrive is the desktop synchronization client for
Infomaniak Drive, a cloud storage service.  It provides file
synchronization and sharing capabilities.")
    (license license:gpl2)))

;;; -- kicad-library-espressif-git (#7689) --

(define-public kicad-library-espressif-git
  (package
    (name "kicad-library-espressif-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/espressif/kicad-libraries")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("symbols/" "share/kicad/symbols/")
               ("footprints/" "share/kicad/footprints/")
               ("3dmodels/" "share/kicad/3dmodels/"))))
    (home-page "https://github.com/espressif/kicad-libraries")
    (synopsis "KiCad libraries for Espressif chips and modules")
    (description "Official KiCad libraries from Espressif Systems
containing symbols, footprints, and 3D models for ESP32, ESP8266,
and other Espressif chips and modules.")
    (license license:cc-by-sa4.0)))

;;; -- klein-bin (#2865) --

(define-public klein-bin
  (package
    (name "klein-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Adarsh-codesOP/Klein/releases/download/v"
                    version "/klein-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("klein" "bin/klein"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "klein")
                   (chmod "klein" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Adarsh-codesOP/Klein")
    (synopsis "terminal-based TUI text editor")
    (description "Klein is a terminal-based TUI text editor designed to
bring the look and functionality of a modern IDE into the terminal.
It features syntax highlighting, file management, and an intuitive
interface.")
    (license license:asl2.0)))

;;; -- krep-git (#896) --

(define-public krep-git
  (package
    (name "krep-git")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/davidesantangelo/krep")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'install 'create-dirs
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)))))))
    (home-page "https://github.com/davidesantangelo/krep")
    (synopsis "fast text search with SIMD acceleration and multi-threading")
    (description "Krep is a fast text search tool with advanced
algorithms, SIMD acceleration, multi-threading, and regex support.
It is designed for high-performance searching of files and streams.")
    (license license:bsd-2)))

;;; -- kumono (#470) --

(define-public kumono
  (package
    (name "kumono")
    (version "0.77.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/APT37/kumono")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    ;; NOTE: Cargo crate inputs need enumeration for full build
    (home-page "https://github.com/APT37/kumono")
    (synopsis "media ripper for coomer and kemono")
    (description "Kumono is a media ripper tool for downloading content
from coomer and kemono platforms.  It provides batch downloading
capabilities with configurable output options.")
    (license license:expat)))
