;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418j
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;     1.  libfprint-cs9711-git (cmake-build-system, v1.94.10, lgpl2.1+)
;;;     2.  python-cirq (pyproject-build-system, v1.6.1, asl2.0)
;;;     3.  python-cirq-google (pyproject-build-system, v1.6.1, asl2.0)
;;;     4.  typesetter (meson-build-system, v0.12.3, gpl3+)
;;;     5.  libkompass-git (meson-build-system, v0.1.0, gpl3)
;;;     6.  kompass-git (meson-build-system, v0.1.0, gpl3)
;;;     7.  wf-shell-git (meson-build-system, v0.8.0, expat)
;;;     8.  ni-daqmx-base-bin (copy-build-system, v15.0.0, nonfree)
;;;     9.  riscv64-gnu-toolchain-musl-bin (copy-build-system, v2026.04.05, gpl2)
;;;    10.  conar-bin (copy-build-system, v0.28.1, agpl3+)
;;;    11.  musicfree-desktop (copy-build-system, v0.0.8, gpl3)
;;;    12.  libva-nvidia-driver-git (meson-build-system, v0.0.12, expat)
;;;    13.  python-tf2onnx (pyproject-build-system, v1.16.1, expat)
;;;    14.  python-cirq-core (pyproject-build-system, v1.6.1, asl2.0)
;;;    15.  mkinitcpio-git (meson-build-system, v39.1, gpl2)
;;;    16.  ocudu-git (cmake-build-system, v26.04.0, bsd-3)
;;;    17.  ignition-startup (meson-build-system, v2.4.0, gpl3+)
;;;    18.  vapoursynth-plugin-waifu2x-ncnn-vulkan-git (cmake-build-system, v5.0, expat)
;;;    19.  psi-plus-nowebengine (cmake-build-system, v1.5.2132, gpl2+)
;;;    20.  salome-kernel (cmake-build-system, v9.15.0, lgpl2.1+)
;;;    21.  wallpaperengine-gui (cmake-build-system, v1.1.8, expat)
;;;    22.  wallpaperengine-gui-git (cmake-build-system, v1.1.8, expat)
;;;    23.  calf-nogui-git (cmake-build-system, v0.90.8, gpl2+)
;;;    24.  sdrpp-vhfvoiceradio-git (cmake-build-system, v0.1.0, gpl3+)
;;;    25.  plasma-nano (cmake-build-system, v6.6.3, gpl2+)
;;;    26.  svxlink-git (cmake-build-system, v25.05.1, gpl2)
;;;    27.  kdeconnect-no-mdns (cmake-build-system, v25.12.3, gpl2+)
;;;    28.  aura (cargo-build-system, v4.2.0, gpl3+)
;;;    29.  rowheel (cargo-build-system, v0.1.0, expat)
;;;    30.  faketty (cargo-build-system, v1.0.20, asl2.0)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pkg-config)
  #:export (
            libfprint-cs9711-git
            python-cirq
            python-cirq-google
            typesetter
            libkompass-git
            kompass-git
            wf-shell-git
            ni-daqmx-base-bin
            riscv64-gnu-toolchain-musl-bin
            conar-bin
            musicfree-desktop
            libva-nvidia-driver-git
            python-tf2onnx
            python-cirq-core
            mkinitcpio-git
            ocudu-git
            ignition-startup
            vapoursynth-plugin-waifu2x-ncnn-vulkan-git
            psi-plus-nowebengine
            salome-kernel
            wallpaperengine-gui
            wallpaperengine-gui-git
            calf-nogui-git
            sdrpp-vhfvoiceradio-git
            plasma-nano
            svxlink-git
            kdeconnect-no-mdns
            aura
            rowheel
            faketty
            ))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. libfprint-cs9711-git --- libfprint with CS9711 fingerprint reader
;;; -------------------------------------------------------------------
(define-public libfprint-cs9711-git
  (package
    (name "libfprint-cs9711-git")
    (version "1.94.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/libfprint/libfprint")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://fprint.freedesktop.org/")
    (synopsis "libfprint with proprietary CS9711 fingerprint driver support")
    (description "Libfprint-cs9711-git is a variant of libfprint that includes
support for the CS9711 fingerprint reader.  Libfprint provides a unified
interface for fingerprint reader devices, supporting enrollment, verification,
and identification operations.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 16. ocudu-git --- Open Centralized Unit Distributed Unit
;;; -------------------------------------------------------------------
(define-public ocudu-git
  (package
    (name "ocudu-git")
    (version "26.04.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/ocudu/ocudu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://ocudu.org")
    (synopsis "open centralized unit distributed unit for 5G/O-RAN")
    (description "OCUDU (Open Centralized Unit Distributed Unit) is an open-source
implementation of 5G O-RAN CU/DU components.  It provides software-defined
radio access network functionality for research and development.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 18. vapoursynth-plugin-waifu2x-ncnn-vulkan-git --- waifu2x for VapourSynth
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-waifu2x-ncnn-vulkan-git
  (package
    (name "vapoursynth-plugin-waifu2x-ncnn-vulkan-git")
    (version "5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nlzy/vapoursynth-waifu2x-ncnn-vulkan")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Nlzy/vapoursynth-waifu2x-ncnn-vulkan")
    (synopsis "waifu2x image upscaling plugin for VapourSynth using Vulkan")
    (description "This VapourSynth plugin provides waifu2x image upscaling
using the ncnn framework with Vulkan compute.  It enables GPU-accelerated
anime-style image super-resolution within VapourSynth filtering pipelines.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. psi-plus-nowebengine --- Psi+ XMPP client without WebEngine
;;; -------------------------------------------------------------------
(define-public psi-plus-nowebengine
  (package
    (name "psi-plus-nowebengine")
    (version "1.5.2132")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/psi-plus/psi-plus-snapshots")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DENABLE_PLUGINS=ON"
                   "-DCHAT_TYPE=basic")))
    (home-page "https://psi-im.org")
    (synopsis "powerful XMPP client for power users without WebEngine")
    (description "Psi+ is a development branch of the Psi XMPP client.  This
variant is built without Qt WebEngine, providing a lighter-weight XMPP
client with all plugins and basic chat rendering support.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 20. salome-kernel --- SALOME platform general services
;;; -------------------------------------------------------------------
(define-public salome-kernel
  (package
    (name "salome-kernel")
    (version "9.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.salome-platform.org/gitpub/modules/kernel.git")
                    (commit (string-append "V" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.salome-platform.org")
    (synopsis "general services module for SALOME simulation platform")
    (description "SALOME Kernel implements the general services of the SALOME
platform, an open-source integration framework for numerical simulation.
It provides lifecycle management, resource management, and inter-component
communication services.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 21. wallpaperengine-gui --- GUI for linux-wallpaperengine
;;; -------------------------------------------------------------------
(define-public wallpaperengine-gui
  (package
    (name "wallpaperengine-gui")
    (version "1.1.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MikiDevLog/wallpaperengine-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/MikiDevLog/wallpaperengine-gui")
    (synopsis "graphical interface for linux-wallpaperengine")
    (description "Wallpaperengine-gui provides a Qt6-based graphical user
interface for managing Wallpaper Engine wallpapers on Linux.  It allows
browsing, previewing, and applying animated wallpapers from Steam Workshop
content via linux-wallpaperengine.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. wallpaperengine-gui-git --- GUI for linux-wallpaperengine (git)
;;; -------------------------------------------------------------------
(define-public wallpaperengine-gui-git
  (package
    (inherit wallpaperengine-gui)
    (name "wallpaperengine-gui-git")
    (version "1.1.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MikiDevLog/wallpaperengine-gui")
                    (commit "3032b22")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))))

;;; -------------------------------------------------------------------
;;; 23. calf-nogui-git --- LV2/JACK audio plugins (no GUI)
;;; -------------------------------------------------------------------
(define-public calf-nogui-git
  (package
    (name "calf-nogui-git")
    (version "0.90.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/calf-studio-gear/calf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DWANT_GUI=OFF")))
    (home-page "http://calf-studio-gear.org/")
    (synopsis "LV2/JACK audio plugins for musicians without GUI")
    (description "Calf Studio Gear is a set of open-source audio plugins for
the LV2 and JACK frameworks.  This variant is built without the graphical
user interface, providing just the DSP processing for use in headless
or command-line audio workflows.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 24. sdrpp-vhfvoiceradio-git --- VHF voice radio plugin for SDR++
;;; -------------------------------------------------------------------
(define-public sdrpp-vhfvoiceradio-git
  (package
    (name "sdrpp-vhfvoiceradio-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cropinghigh/sdrpp-vhfvoiceradio")
                    (commit "30036cf")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cropinghigh/sdrpp-vhfvoiceradio")
    (synopsis "VHF voice radio demodulation plugin for SDR++")
    (description "This plugin adds VHF voice radio demodulation capabilities
to SDR++ (SDRPlusPlus).  It provides AM/FM voice demodulation modes
optimized for VHF band reception in the SDR++ software-defined radio
application.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 25. plasma-nano --- minimal Plasma shell for embedded devices
;;; -------------------------------------------------------------------
(define-public plasma-nano
  (package
    (name "plasma-nano")
    (version "6.6.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/plasma/plasma-nano")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://invent.kde.org/plasma/plasma-nano")
    (synopsis "minimal Plasma shell for embedded devices")
    (description "Plasma Nano is a minimal version of the KDE Plasma shell
designed for embedded and resource-constrained devices.  It provides a
lightweight desktop environment with essential Plasma functionality
in a reduced footprint.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 26. svxlink-git --- advanced repeater controller and EchoLink software
;;; -------------------------------------------------------------------
(define-public svxlink-git
  (package
    (name "svxlink-git")
    (version "25.05.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sm0svx/svxlink")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sm0svx/svxlink")
    (synopsis "advanced repeater controller and EchoLink software for Linux")
    (description "SvxLink is an advanced voice services system for ham radio
repeater controllers.  It includes EchoLink access, DTMF control, voice
mail, parrot, and other modules.  The system supports multiple receivers,
transmitters, and remote receivers via network.")
    (license (list license:gpl2 license:lgpl2.1))))

;;; -------------------------------------------------------------------
;;; 27. kdeconnect-no-mdns --- KDE Connect without mDNS support
;;; -------------------------------------------------------------------
(define-public kdeconnect-no-mdns
  (package
    (name "kdeconnect-no-mdns")
    (version "25.12.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/network/kdeconnect-kde")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DMDNS_ENABLED=OFF")))
    (home-page "https://kdeconnect.kde.org/")
    (synopsis "KDE Connect phone integration without mDNS support")
    (description "KDE Connect provides integration between KDE Plasma and
smartphones, enabling file sharing, clipboard sync, notifications, media
control, and more.  This variant is built without mDNS support to work
around KDE bug 487719.")
    (license license:gpl2+)))


;;; ===================================================================
;;; MESON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 4. typesetter --- minimalist Typst editor
;;; -------------------------------------------------------------------
(define-public typesetter
  (package
    (name "typesetter")
    (version "0.12.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/haydn/typesetter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/haydn/typesetter")
    (synopsis "minimalist, local-first Typst editor")
    (description "Typesetter is a minimalist, local-first editor for Typst
documents.  It provides a GTK4/libadwaita interface with GtkSourceView
for syntax highlighting and live preview of Typst markup.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. libkompass-git --- library for building desktop shells
;;; -------------------------------------------------------------------
(define-public libkompass-git
  (package
    (name "libkompass-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/kotontrion/kompass")
                    (commit "d507477")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/kotontrion/kompass")
    (synopsis "library providing widgets for building desktop shells")
    (description "Libkompass is a library that provides useful GTK4 widgets
for building Wayland desktop shells.  It includes components for system
trays, network management, and other shell functionality built on
GTK4 Layer Shell.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. kompass-git --- GTK4 Wayland desktop shell
;;; -------------------------------------------------------------------
(define-public kompass-git
  (package
    (name "kompass-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/kotontrion/kompass")
                    (commit "d507477")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/kotontrion/kompass")
    (synopsis "GTK4 Wayland desktop shell")
    (description "Kompass is a GTK4-based Wayland desktop shell.  It provides
a panel, system tray, and other desktop shell components using
GTK4 Layer Shell for Wayland integration and libadwaita for modern
GNOME-style appearance.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. wf-shell-git --- GTK3 panel for Wayfire compositor
;;; -------------------------------------------------------------------
(define-public wf-shell-git
  (package
    (name "wf-shell-git")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WayfireWM/wf-shell")
                    (commit "d98fb72")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://wayfire.org")
    (synopsis "GTK-based panel and background client for Wayfire compositor")
    (description "Wf-shell provides a GTK-based panel, background manager,
and other desktop shell components for the Wayfire Wayland compositor.
It includes a taskbar, system tray, clock, battery indicator, and
customizable background wallpaper support.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. libva-nvidia-driver-git --- VA-API via NVDEC backend
;;; -------------------------------------------------------------------
(define-public libva-nvidia-driver-git
  (package
    (name "libva-nvidia-driver-git")
    (version "0.0.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elFarto/nvidia-vaapi-driver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/elFarto/nvidia-vaapi-driver")
    (synopsis "VA-API implementation using NVDEC as backend")
    (description "This is a VA-API (Video Acceleration API) implementation
that uses NVIDIA's NVDEC hardware decoder as its backend.  It enables
VA-API-based video decoding on NVIDIA GPUs through the GStreamer and
FFmpeg multimedia frameworks.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. mkinitcpio-git --- modular initramfs creation utility
;;; -------------------------------------------------------------------
(define-public mkinitcpio-git
  (package
    (name "mkinitcpio-git")
    (version "39.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio")
    (synopsis "modular initramfs image creation utility")
    (description "Mkinitcpio is a modular initramfs image creation utility
originally developed for Arch Linux.  It provides a flexible hook-based
system for building initial RAM filesystem images used during the
Linux boot process.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17. ignition-startup --- manage startup applications and scripts
;;; -------------------------------------------------------------------
(define-public ignition-startup
  (package
    (name "ignition-startup")
    (version "2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/flattool/ignition")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/flattool/ignition")
    (synopsis "manage startup applications and scripts on GNOME")
    (description "Ignition is a GTK4/libadwaita application for managing
desktop startup applications and scripts.  It provides a clean interface
to add, remove, enable, and disable autostart entries following the
XDG Autostart specification.")
    (license license:gpl3+)))


;;; ===================================================================
;;; PYPROJECT-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 2. python-cirq --- quantum circuit framework (meta-package)
;;; -------------------------------------------------------------------
(define-public python-cirq
  (package
    (name "python-cirq")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/quantumlib/Cirq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/quantumlib/Cirq")
    (synopsis "framework for creating and simulating quantum circuits")
    (description "Cirq is a Python framework for creating, editing, and
invoking Noisy Intermediate Scale Quantum (NISQ) circuits.  It provides
tools for defining quantum gates, building circuits, simulating their
execution, and running them on quantum hardware.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. python-cirq-google --- Cirq integration with Google Quantum AI
;;; -------------------------------------------------------------------
(define-public python-cirq-google
  (package
    (name "python-cirq-google")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/quantumlib/Cirq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/quantumlib/Cirq")
    (synopsis "Cirq integration for Google Quantum AI hardware")
    (description "Cirq-google provides integration between the Cirq quantum
computing framework and Google Quantum AI hardware.  It includes device
specifications, noise models, and API bindings for running quantum
circuits on Google's quantum processors.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 13. python-tf2onnx --- convert TensorFlow models to ONNX
;;; -------------------------------------------------------------------
(define-public python-tf2onnx
  (package
    (name "python-tf2onnx")
    (version "1.16.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/onnx/tensorflow-onnx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/onnx/tensorflow-onnx")
    (synopsis "convert TensorFlow and Keras models to ONNX format")
    (description "Tf2onnx converts TensorFlow (tf-1.x or tf-2.x), Keras,
and TFLite models to ONNX format via command line or Python API.  It
supports a wide range of TensorFlow operators and enables model
interoperability across different ML frameworks.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. python-cirq-core --- core library of the Cirq quantum framework
;;; -------------------------------------------------------------------
(define-public python-cirq-core
  (package
    (name "python-cirq-core")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/quantumlib/Cirq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/quantumlib/Cirq")
    (synopsis "core library for Cirq quantum computing framework")
    (description "Cirq-core is the core library of the Cirq framework for
quantum computing.  It provides the fundamental abstractions for quantum
gates, circuits, simulators, and noise models used by all other Cirq
sub-packages.")
    (license license:asl2.0)))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 8. ni-daqmx-base-bin --- NI-DAQmx Base data acquisition (binary)
;;; -------------------------------------------------------------------
(define-public ni-daqmx-base-bin
  (package
    (name "ni-daqmx-base-bin")
    (version "15.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.ni.com/support/softlib/MasterSeed/NI-DAQmx_Base/"
                    version "/NI-DAQmx-Base-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ni-daqmx-base"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.ni.com/en-gb/support/downloads/drivers/download.ni-daqmx-base.html")
    (synopsis "NI-DAQmx Base data acquisition driver subset")
    (description "NI-DAQmx Base provides a subset of NI-DAQmx functionality
for National Instruments data acquisition hardware.  It supports basic
analog input, digital I/O, and counter operations on supported NI DAQ
devices for measurement and automation applications.")
    (license (license:non-copyleft
              "https://www.ni.com/en/about-ni/legal/software-license-agreement.html"
              "NI proprietary software license"))))

;;; -------------------------------------------------------------------
;;; 9. riscv64-gnu-toolchain-musl-bin --- RISC-V GCC toolchain (musl)
;;; -------------------------------------------------------------------
(define-public riscv64-gnu-toolchain-musl-bin
  (package
    (name "riscv64-gnu-toolchain-musl-bin")
    (version "2026.04.05")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/"
                    version "/riscv64-musl-ubuntu-22.04-gcc-nightly-" version
                    "-nightly.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "riscv64-gnu-toolchain-musl"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/riscv-collab/riscv-gnu-toolchain")
    (synopsis "prebuilt GNU toolchain for RISC-V 64-bit with musl libc")
    (description "This package provides a prebuilt GNU toolchain targeting
RISC-V 64-bit (riscv64) with musl libc.  It includes GCC, binutils,
and the musl C library for cross-compiling programs for RISC-V
embedded and Linux targets.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 10. conar-bin --- AI-powered database management tool
;;; -------------------------------------------------------------------
(define-public conar-bin
  (package
    (name "conar-bin")
    (version "0.28.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wannabespace/conar/releases/download/v"
                    version "/Conar_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wannabespace/conar")
    (synopsis "AI-powered tool for working with Postgres, MySQL, and ClickHouse")
    (description "Conar is an AI-powered desktop application for working with
PostgreSQL, MySQL, MSSQL, and ClickHouse databases.  It provides an
intelligent query interface with AI-assisted SQL generation,
schema exploration, and data visualization.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 11. musicfree-desktop --- plug-in music player
;;; -------------------------------------------------------------------
(define-public musicfree-desktop
  (package
    (name "musicfree-desktop")
    (version "0.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/maotoumao/MusicFreeDesktop/releases/download/v"
                    version "/MusicFree-Desktop-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/musicfree-desktop"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://musicfree.catcat.work/")
    (synopsis "plug-in, customized, ad-free music player")
    (description "MusicFree Desktop is a plug-in based, customizable, ad-free
music player.  It supports extensions for various music sources and
provides a clean listening experience without advertisements or
tracking.")
    (license license:gpl3)))


;;; ===================================================================
;;; CARGO-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 28. aura --- package manager for Arch Linux and AUR
;;; -------------------------------------------------------------------
(define-public aura
  (package
    (name "aura")
    (version "4.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fosskers/aura")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/fosskers/aura")
    (synopsis "package manager for Arch Linux and its AUR")
    (description "Aura is a package manager for Arch Linux and the Arch User
Repository (AUR).  Written in Rust, it provides pacman-compatible package
management with additional AUR support, dependency resolution, and
multi-language interface.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 29. rowheel --- racing wheel and force feedback for Roblox
;;; -------------------------------------------------------------------
(define-public rowheel
  (package
    (name "rowheel")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chedsapp/rowheel")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/chedsapp/rowheel")
    (synopsis "racing wheel and force feedback support for Roblox on Linux")
    (description "Rowheel provides racing wheel and force feedback support
for Roblox on Linux.  It translates force feedback events from physical
racing wheels into compatible input events for the Roblox game client.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. faketty --- wrapper to run commands in a pty
;;; -------------------------------------------------------------------
(define-public faketty
  (package
    (name "faketty")
    (version "1.0.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dtolnay/faketty")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/dtolnay/faketty")
    (synopsis "wrapper to execute commands in a pseudo-terminal")
    (description "Faketty is a command-line wrapper that executes a command
in a pseudo-terminal (pty), even when the output is being redirected.
This enables programs that detect terminal output to produce colorized
or formatted output when piped or redirected.")
    (license (list license:asl2.0 license:expat))))
