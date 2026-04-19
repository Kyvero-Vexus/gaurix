;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418ai
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (18):
;;;        1.  ryujinx-bin (copy-build-system, v1.3.3, MIT)
;;;        2.  hitech-arch-animation (copy-build-system, v2, MIT)
;;;        3.  ridecost (copy-build-system, v1.1.1, Apache-2.0)
;;;        4.  jre-jetbrains (copy-build-system, v25.0.2, GPL-2.0)
;;;        5.  dssat-csm-os-git (cmake-build-system, v4.8.5.17, custom)
;;;        6.  virt-v2v (gnu-build-system, v2.9.2, GPL-2.0+)
;;;        7.  marcwel-archive (copy-build-system, v3.69.420, beerware)
;;;        8.  gpt4all-chat-git (cmake-build-system, v3.3.0, MIT)
;;;        9.  playonlinux (copy-build-system, v4.4, GPL-3.0+)
;;;       10.  rancher-desktop-bin (copy-build-system, v1.22.0, Apache-2.0)
;;;       11.  duelsplus (copy-build-system, v2.8.4, MIT)
;;;       12.  anytype-bin (copy-build-system, v0.54.11, custom)
;;;       13.  ps7-libps2000 (copy-build-system, v3.0.150, custom)
;;;       14.  ps7-libps2000a (copy-build-system, v2.2.155, custom)
;;;       15.  ps7-libps3000a (copy-build-system, v2.2.157, custom)
;;;       16.  ps7-libps4000a (copy-build-system, v2.2.221, custom)
;;;       17.  ps7-libps6000 (copy-build-system, v2.1.151, custom)
;;;       18.  ps7-libusbtc08 (copy-build-system, v2.0.150, custom)
;;;
;;; BLOCKED EXHAUSTED (12):
;;;       19.  lib32-libxxf86dga -> MULTILIB_UNSUPPORTED: 32-bit build of Xorg lib
;;;       20.  hyprland-workspaces-tui -> CARGO_DEPS_NEEDED: Rust TUI needs cargo crate deps
;;;       21.  wsl-hello-sudo-bin -> PLATFORM_SPECIFIC: WSL-only PAM module
;;;       22.  keyd-openrc -> INIT_SPECIFIC: OpenRC init scripts for keyd
;;;       23.  container2wasm-git -> DEP_MISSING: needs buildah + skopeo (not in Guix)
;;;       24.  deadlock-api-ingest-git -> CARGO_DEPS_NEEDED: Rust packet capture tool
;;;       25.  powershell-editor-services -> DEP_MISSING: needs PowerShell (not in Guix)
;;;       26.  yt6801-dkms -> KERNEL_MODULE: DKMS module incompatible with Guix kernel model
;;;       27.  texlive-installer -> DISTRO_SPECIFIC: Arch pacman compatibility shim
;;;       28.  updpkgsrcs -> DISTRO_SPECIFIC: PKGBUILD source updater
;;;       29.  transgui-git -> DEP_MISSING: needs Lazarus/Free Pascal (not in Guix)
;;;       30.  roxybrowser-bin -> PROPRIETARY: antidetect browser; commercial product
;;;
;;; NOTE: All hashes are placeholders (base32 "0000...").
;;; Run `guix build -L guix <name>` to obtain actual hashes from error output.

(define-module (gaurix packages recipe-resolver-260418ai)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages node)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages wine)
  #:use-module (gnu packages xorg)
  #:export (ryujinx-bin
            hitech-arch-animation
            ridecost
            jre-jetbrains
            dssat-csm-os-git
            virt-v2v
            marcwel-archive
            gpt4all-chat-git
            playonlinux
            rancher-desktop-bin
            duelsplus
            anytype-bin
            ps7-libps2000
            ps7-libps2000a
            ps7-libps3000a
            ps7-libps4000a
            ps7-libps6000
            ps7-libusbtc08))

;;; -------------------------------------------------------------------
;;; 1. ryujinx-bin --- Nintendo Switch emulator
;;; Experimental Nintendo Switch emulator written in C#.
;;; -------------------------------------------------------------------
(define-public ryujinx-bin
  (package
    (name "ryujinx-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Ryujinx/release-channel-master/releases/download/"
                    version "/ryujinx-" version "-linux_x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/ryujinx/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/ryujinx/Ryujinx")
                              (string-append out "/bin/ryujinx"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ryujinx.app")
    (synopsis "experimental nintendo switch emulator written in c#")
    (description "Ryujinx is an open-source Nintendo Switch emulator written
in C#.  It aims to provide high accuracy and performance for running Switch
games and homebrew applications on desktop computers.  It supports a wide
range of Switch titles with features including shader caching, resolution
scaling, and controller support.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. hitech-arch-animation --- Plymouth boot animation theme
;;; Hi-Tech boot animation theme for Plymouth with 148 frames.
;;; -------------------------------------------------------------------
(define-public hitech-arch-animation
  (package
    (name "hitech-arch-animation")
    (version "2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xDeFc0nx/HiTech-arch-animation")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth/themes/hitech-arch-animation/"))))
    (home-page "https://github.com/xDeFc0nx/HiTech-arch-animation")
    (synopsis "hi-tech plymouth boot theme with 148 frames animation")
    (description "HiTech Arch Animation is a Plymouth boot splash theme
featuring a 148-frame hi-tech animation.  It provides a visually appealing
boot experience with a futuristic design.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. ridecost --- Mileage-based ride cost CLI tool
;;; Command-line tool for calculating mileage-based ride costs.
;;; -------------------------------------------------------------------
(define-public ridecost
  (package
    (name "ridecost")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/ride-cost/ride-cost-cli/-/archive/v"
                    version "/ride-cost-cli-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ridecost/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (jar (string-append out "/share/ridecost/ridecost.jar"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p (string-append out "/bin"))
                     (with-output-to-file (string-append out "/bin/ridecost")
                       (lambda ()
                         (display (string-append "#!/bin/sh\nexec "
                                                 java " -jar " jar
                                                 " \"$@\"\n"))))
                     (chmod (string-append out "/bin/ridecost") #o755)))))))
    (inputs (list openjdk17))
    (home-page "https://gitlab.com/ride-cost/ride-cost-cli")
    (synopsis "mileage-based ride cost command-line tool")
    (description "Ridecost is a command-line tool for calculating ride costs
based on mileage.  It supports multiple vehicle types and fuel costs,
providing quick estimates for travel expenses.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. jre-jetbrains --- JetBrains Runtime (OpenJDK fork)
;;; OpenJDK Java runtime with JetBrains fixes and enhancements.
;;; -------------------------------------------------------------------
(define-public jre-jetbrains
  (package
    (name "jre-jetbrains")
    (version "25.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cache-redirector.jetbrains.com/intellij-jbr/"
                    "jbr_jcef-" version "-linux-x64-b329.111.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/jre-jetbrains/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-bin-links
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (jre (string-append out "/opt/jre-jetbrains"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append jre "/bin/java")
                              (string-append bin "/java-jetbrains"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis "openjdk java runtime with jetbrains fixes and enhancements")
    (description "JetBrains Runtime is an OpenJDK fork with fixes and
enhancements for running JetBrains IDEs.  It includes improved font
rendering, HiDPI support, performance optimizations, and bundled JCEF
(Java Chromium Embedded Framework) for embedded browser functionality
in JetBrains products.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5. dssat-csm-os-git --- Crop system simulation model
;;; Decision Support System for Agrotechnology Transfer (DSSAT).
;;; -------------------------------------------------------------------
(define-public dssat-csm-os-git
  (package
    (name "dssat-csm-os-git")
    (version "4.8.5.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DSSAT/dssat-csm-os")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list gfortran cmake))
    (inputs (list netcdf-fortran libjpeg-turbo))
    (home-page "https://github.com/DSSAT/dssat-csm-os")
    (synopsis "crop system model for agrotechnology transfer")
    (description "DSSAT-CSM (Cropping System Model) is a process-based
agricultural simulation model that simulates growth, development, and yield
of crops over time as a function of weather, soil, and management conditions.
It supports decision-making for crop management, breeding, and climate
impact assessment.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Custom academic license"))))

;;; -------------------------------------------------------------------
;;; 6. virt-v2v --- Convert VM guests to KVM
;;; Tool for converting virtual machines from various hypervisors to KVM.
;;; -------------------------------------------------------------------
(define-public virt-v2v
  (package
    (name "virt-v2v")
    (version "2.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.libguestfs.org/virt-v2v/"
                    (version-major+minor version)
                    "-stable/virt-v2v-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list ocaml ocaml-findlib perl pkg-config))
    (inputs (list libguestfs))
    (home-page "https://libguestfs.org/virt-v2v.1.html")
    (synopsis "convert a virtual machine to run on kvm")
    (description "Virt-v2v converts virtual machines from foreign
hypervisors to run on KVM.  It can read Linux and Windows guests running
on VMware, Xen, Hyper-V, and other hypervisors, and convert them to run
on KVM managed by libvirt, OpenStack, oVirt, or Red Hat Virtualization.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 7. marcwel-archive --- Archiving tool (Node.js)
;;; Node.js archiving tool.
;;; -------------------------------------------------------------------
(define-public marcwel-archive
  (package
    (name "marcwel-archive")
    (version "3.69.420")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ShortWare/marcwel-archive")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/marcwel-archive/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (node (search-input-file inputs "bin/node"))
                          (script (string-append out
                                   "/share/marcwel-archive/index.js")))
                     (mkdir-p (string-append out "/bin"))
                     (with-output-to-file
                         (string-append out "/bin/marcwel-archive")
                       (lambda ()
                         (display (string-append "#!/bin/sh\nexec "
                                                 node " " script
                                                 " \"$@\"\n"))))
                     (chmod (string-append out "/bin/marcwel-archive")
                            #o755)))))))
    (inputs (list node))
    (home-page "https://github.com/ShortWare/marcwel-archive")
    (synopsis "archiving tool built with node.js")
    (description "Marcwel Archive is an archiving utility built with
Node.js.  It provides file archiving and extraction functionality through
a command-line interface.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Beerware license"))))

;;; -------------------------------------------------------------------
;;; 8. gpt4all-chat-git --- Local AI chat application
;;; Cross-platform Qt-based GUI for running local large language models.
;;; -------------------------------------------------------------------
(define-public gpt4all-chat-git
  (package
    (name "gpt4all-chat-git")
    (version "3.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nomic-ai/gpt4all")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list cmake pkg-config))
    (inputs (list qtbase
                  qtdeclarative
                  qtsvg
                  qtwayland
                  vulkan-loader
                  python))
    (home-page "https://github.com/nomic-ai/gpt4all")
    (synopsis "cross-platform qt gui for running local language models")
    (description "GPT4All is a cross-platform desktop application for running
large language models locally.  It provides a chat interface powered by Qt6
and supports downloading and running various open-source LLMs including
LLaMA, Falcon, and MPT models entirely on consumer hardware without
requiring internet access or API keys.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. playonlinux --- GUI for managing Windows programs under Linux
;;; Graphical tool for installing and running Windows programs using Wine.
;;; -------------------------------------------------------------------
(define-public playonlinux
  (package
    (name "playonlinux")
    (version "4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PlayOnLinux/POL-POM-4")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("python" "share/playonlinux/python/")
               ("bash"   "share/playonlinux/bash/")
               ("lib"    "share/playonlinux/lib/")
               ("plugins" "share/playonlinux/plugins/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (python (search-input-file inputs "bin/python3")))
                     (mkdir-p (string-append out "/bin"))
                     (with-output-to-file
                         (string-append out "/bin/playonlinux")
                       (lambda ()
                         (display (string-append
                                   "#!/bin/sh\nexec " python " "
                                   out "/share/playonlinux/python/mainwindow.py"
                                   " \"$@\"\n"))))
                     (chmod (string-append out "/bin/playonlinux")
                            #o755)))))))
    (inputs (list wine
                  python
                  python-wxpython
                  imagemagick
                  xterm
                  cabextract
                  unzip
                  wget
                  p7zip
                  perl
                  gnupg))
    (home-page "https://www.playonlinux.com/")
    (synopsis "graphical tool for managing windows programs using wine")
    (description "PlayOnLinux is a graphical frontend for Wine that
simplifies the installation and management of Windows programs on Linux.
It provides automated installation scripts for popular Windows applications
and games, with per-application Wine prefix management and version
selection.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. rancher-desktop-bin --- Kubernetes and container management
;;; Desktop application for Kubernetes and container management.
;;; -------------------------------------------------------------------
(define-public rancher-desktop-bin
  (package
    (name "rancher-desktop-bin")
    (version "1.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rancher-sandbox/rancher-desktop/"
                    "releases/download/v" version
                    "/rancher-desktop-" version ".x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("squashfs-root/usr" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "app.AppImage")
                   (chmod "app.AppImage" #o755)
                   (invoke "./app.AppImage" "--appimage-extract"))))))
    (inputs (list qemu))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rancherdesktop.io/")
    (synopsis "kubernetes and container management on the desktop")
    (description "Rancher Desktop is an open-source desktop application for
Kubernetes and container management.  It provides a local Kubernetes cluster
and container runtime (containerd or dockerd) on the desktop, with a
graphical interface for managing containers, images, and cluster settings.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 11. duelsplus --- Minecraft Hypixel Duels proxy
;;; Lightweight custom Minecraft proxy for Hypixel Duels.
;;; -------------------------------------------------------------------
(define-public duelsplus
  (package
    (name "duelsplus")
    (version "2.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DuelsPlus/DuelsPlus/releases/download/v"
                    version "/DuelsPlus-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("squashfs-root/usr" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "app.AppImage")
                   (chmod "app.AppImage" #o755)
                   (invoke "./app.AppImage" "--appimage-extract"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://duelsplus.com")
    (synopsis "lightweight minecraft proxy for hypixel duels")
    (description "DuelsPlus is a lightweight, custom Minecraft proxy designed
to enhance the experience on Hypixel Duels.  It provides statistics
tracking, game analysis, and quality-of-life improvements for competitive
Minecraft PvP.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. anytype-bin --- Local-first knowledge management
;;; Operating environment for structured knowledge management.
;;; -------------------------------------------------------------------
(define-public anytype-bin
  (package
    (name "anytype-bin")
    (version "0.54.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anyproto/anytype-ts/releases/download/v"
                    version "/Anytype-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("squashfs-root/usr" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "app.AppImage")
                   (chmod "app.AppImage" #o755)
                   (invoke "./app.AppImage" "--appimage-extract"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://anytype.io/")
    (synopsis "local-first structured knowledge management application")
    (description "Anytype is a local-first application for structured
knowledge management.  It provides a flexible workspace with blocks,
objects, and relations for organizing notes, tasks, projects, and
databases.  All data is stored locally and optionally synced peer-to-peer
using an encrypted protocol.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Any Source Available License 1.0"))))

;;; -------------------------------------------------------------------
;;; 13. ps7-libps2000 --- PicoScope 2000 series driver library
;;; Driver library for Pico Technology PicoScope 2000 series oscilloscopes.
;;; -------------------------------------------------------------------
(define-public ps7-libps2000
  (package
    (name "ps7-libps2000")
    (version "3.0.150")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://labs.picotech.com/picoscope7/debian/pool/main/"
                    "libp/libps2000/libps2000_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (inputs (list libusb))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.picotech.com/downloads/linux")
    (synopsis "driver library for picoscope 2000 series oscilloscopes")
    (description "This package provides the shared library for
communicating with Pico Technology PicoScope 2000 series USB oscilloscopes.
It is required by PicoScope 7 and other applications that interface with
the 2000 series hardware.")
    (license (license:non-copyleft
              "https://www.picotech.com/software-licence"
              "Pico Technology custom license"))))

;;; -------------------------------------------------------------------
;;; 14. ps7-libps2000a --- PicoScope 2000A series driver library
;;; Driver library for Pico Technology PicoScope 2000A series oscilloscopes.
;;; -------------------------------------------------------------------
(define-public ps7-libps2000a
  (package
    (name "ps7-libps2000a")
    (version "2.2.155")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://labs.picotech.com/picoscope7/debian/pool/main/"
                    "libp/libps2000a/libps2000a_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (inputs (list libusb))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.picotech.com/downloads/linux")
    (synopsis "driver library for picoscope 2000a series oscilloscopes")
    (description "This package provides the shared library for
communicating with Pico Technology PicoScope 2000A series USB oscilloscopes.
It is required by PicoScope 7 and other applications that interface with
the 2000A series hardware.")
    (license (license:non-copyleft
              "https://www.picotech.com/software-licence"
              "Pico Technology custom license"))))

;;; -------------------------------------------------------------------
;;; 15. ps7-libps3000a --- PicoScope 3000A series driver library
;;; Driver library for Pico Technology PicoScope 3000A series oscilloscopes.
;;; -------------------------------------------------------------------
(define-public ps7-libps3000a
  (package
    (name "ps7-libps3000a")
    (version "2.2.157")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://labs.picotech.com/picoscope7/debian/pool/main/"
                    "libp/libps3000a/libps3000a_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (inputs (list libusb))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.picotech.com/downloads/linux")
    (synopsis "driver library for picoscope 3000a series oscilloscopes")
    (description "This package provides the shared library for
communicating with Pico Technology PicoScope 3000A series USB oscilloscopes.
It is required by PicoScope 7 and other applications that interface with
the 3000A series hardware.")
    (license (license:non-copyleft
              "https://www.picotech.com/software-licence"
              "Pico Technology custom license"))))

;;; -------------------------------------------------------------------
;;; 16. ps7-libps4000a --- PicoScope 4000A series driver library
;;; Driver library for Pico Technology PicoScope 4000A series oscilloscopes.
;;; -------------------------------------------------------------------
(define-public ps7-libps4000a
  (package
    (name "ps7-libps4000a")
    (version "2.2.221")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://labs.picotech.com/picoscope7/debian/pool/main/"
                    "libp/libps4000a/libps4000a_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (inputs (list libusb))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.picotech.com/downloads/linux")
    (synopsis "driver library for picoscope 4000a series oscilloscopes")
    (description "This package provides the shared library for
communicating with Pico Technology PicoScope 4000A series USB oscilloscopes.
It is required by PicoScope 7 and other applications that interface with
the 4000A series hardware.")
    (license (license:non-copyleft
              "https://www.picotech.com/software-licence"
              "Pico Technology custom license"))))

;;; -------------------------------------------------------------------
;;; 17. ps7-libps6000 --- PicoScope 6000 series driver library
;;; Driver library for Pico Technology PicoScope 6000 series oscilloscopes.
;;; -------------------------------------------------------------------
(define-public ps7-libps6000
  (package
    (name "ps7-libps6000")
    (version "2.1.151")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://labs.picotech.com/picoscope7/debian/pool/main/"
                    "libp/libps6000/libps6000_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (inputs (list libusb))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.picotech.com/downloads/linux")
    (synopsis "driver library for picoscope 6000 series oscilloscopes")
    (description "This package provides the shared library for
communicating with Pico Technology PicoScope 6000 series USB oscilloscopes.
It is required by PicoScope 7 and other applications that interface with
the 6000 series hardware.")
    (license (license:non-copyleft
              "https://www.picotech.com/software-licence"
              "Pico Technology custom license"))))

;;; -------------------------------------------------------------------
;;; 18. ps7-libusbtc08 --- PicoLog TC-08 driver library
;;; Driver library for Pico Technology PicoLog TC-08 data logger.
;;; -------------------------------------------------------------------
(define-public ps7-libusbtc08
  (package
    (name "ps7-libusbtc08")
    (version "2.0.150")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://labs.picotech.com/picoscope7/debian/pool/main/"
                    "libp/libusbtc08/libusbtc08_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (inputs (list libusb))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.picotech.com/downloads/linux")
    (synopsis "driver library for picolog tc-08 thermocouple data logger")
    (description "This package provides the shared library for
communicating with the Pico Technology PicoLog TC-08 USB thermocouple
data logger.  It is required by PicoScope 7 and other applications that
interface with the TC-08 hardware for temperature measurement.")
    (license (license:non-copyleft
              "https://www.picotech.com/software-licence"
              "Pico Technology custom license"))))
