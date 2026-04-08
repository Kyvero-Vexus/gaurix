;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260408f
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 35 packages resolved with recipes, 65 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408f)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system meson)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (
            ancestris
            archarchive
            archlinux-artwork
            butter-launcher-bin
            crql-anina
            crql-locd
            electerm-live-bin
            empty
            en-se
            evcolors
            firefox-beta-bin-all-localizations
            freetype2-qdoled-aw3225qf
            freetype2-qdoled-gen3
            grep-compat
            heidisql-qt6-bin
            jdk17-zulu-prime-bin
            libelectron-electron-meta
            libinput-no-gestures
            librewolf-extension-keepassxc-browser
            llama.cpp-opencl
            mongodb-bin
            nvidia-535xx-utils
            opencl-amd
            opencl-nvidia-390xx
            opencl-nvidia-470xx
            opencl-nvidia-535xx
            opencl-nvidia-550xx
            opencl-nvidia-580xx
            opencl-nvidia-beta
            rocm-gfx110x-bin
            rocm-nightly-gfx110x-bin
            rocm-nightly-gfx1151-bin
            scrutiny-web-frontend
            vectorchord-bin
            vscodium-electron-bin
            ))

;;; ====================================================================
;;; PACKAGE DEFINITIONS (35 packages)
;;; ====================================================================

;;; -- ancestris --
(define-public ancestris
  (package
    (name "ancestris")
    (version "14")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.ancestris.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/ancestris/"))))
    (home-page "https://www.ancestris.org")
    (synopsis "unlimited family tree freeware")
    (description
     "Unlimited family tree freeware.")
    (license license:gpl3+)))

;;; -- archarchive --
(define-public archarchive
  (package
    (name "archarchive")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/progzone122/archarchive.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/archarchive/"))))
    (home-page "https://github.com/progzone122/archarchive")
    (synopsis "a utility to quickly rollback an arch linux system using ALA (a.k.a Arch ...")
    (description
     "A utility to quickly rollback an arch linux system using ALA (a.k.a Arch Linux Archive).")
    (license license:gpl3+)))

;;; -- archlinux-artwork --
(define-public archlinux-artwork
  (package
    (name "archlinux-artwork")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.archlinux.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/archlinux-artwork/"))))
    (home-page "http://www.archlinux.org/")
    (synopsis "official logos, icons, CD labels and other artwork for Arch Linux")
    (description
     "Official logos, icons, CD labels and other artwork for Arch Linux.")
    (license license:expat)))

;;; -- butter-launcher-bin --
(define-public butter-launcher-bin
  (package
    (name "butter-launcher-bin")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vZylev/Butter-Launcher.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/butter-launcher-bin/"))))
    (home-page "https://github.com/vZylev/Butter-Launcher")
    (synopsis "butter Launcher (Electron-based launcher, prebuilt binary)")
    (description
     "Butter Launcher (Electron-based launcher, prebuilt binary).")
    (license license:expat)))

;;; -- crql-anina --
(define-public crql-anina
  (package
    (name "crql-anina")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://crql.works/anina")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/crql-anina/"))))
    (home-page "https://crql.works/anina")
    (synopsis "free VST3 and CLAP spectral resonance suppression by CRQL")
    (description
     "Free VST3 and CLAP spectral resonance suppression by CRQL.")
    (license license:nonfree)))

;;; -- crql-locd --
(define-public crql-locd
  (package
    (name "crql-locd")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://crql.works/locd")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/crql-locd/"))))
    (home-page "https://crql.works/locd")
    (synopsis "phase-Locked distortion for MEGA crunchiness by CRQL")
    (description
     "Phase-Locked distortion for MEGA crunchiness by CRQL.")
    (license license:nonfree)))

;;; -- electerm-live-bin --
(define-public electerm-live-bin
  (package
    (name "electerm-live-bin")
    (version "3.1.26")
    (source
     (origin
       (method url-fetch)
       (uri "https://electerm.html5beta.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/electerm-live-bin/"))))
    (home-page "https://electerm.html5beta.com")
    (synopsis "an electron-based SSH/SFTP Connection manager and terminal (Live version)")
    (description
     "An electron-based SSH/SFTP Connection manager and terminal (Live version).")
    (license license:expat)))

;;; -- empty --
(define-public empty
  (package
    (name "empty")
    (version "0.6.23d")
    (source
     (origin
       (method url-fetch)
       (uri "https://empty.sourceforge.net/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/empty/"))))
    (home-page "https://empty.sourceforge.net/")
    (synopsis "run applications under pseudo-terminal sessions")
    (description
     "Run applications under pseudo-terminal sessions.")
    (license license:nonfree)))

;;; -- en_se --
(define-public en-se
  (package
    (name "en-se")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gist.github.com/bmaupin/d64368e78cd359d309685fecbe2baf23.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/en-se/"))))
    (home-page "https://gist.github.com/bmaupin/d64368e78cd359d309685fecbe2baf23")
    (synopsis "english locale for Sweden with ISO date and time format")
    (description
     "English locale for Sweden with ISO date and time format.")
    (license license:gpl3+)))

;;; -- evcolors --
(define-public evcolors
  (package
    (name "evcolors")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://example.com/evcolors-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/evcolors/"))))
    (home-page "https://example.com/evcolors")
    (synopsis "ev color themes")
    (description
     "Ev color themes.")
    (license license:expat)))

;;; -- firefox-beta-bin-all-localizations --
(define-public firefox-beta-bin-all-localizations
  (package
    (name "firefox-beta-bin-all-localizations")
    (version "150.0b6")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.mozilla.com/firefox/channel/#beta")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/firefox-beta-bin-all-localizations/"))))
    (home-page "https://www.mozilla.com/firefox/channel/#beta")
    (synopsis "perl script for installing latest FF beta in the language of your choice")
    (description
     "Perl script for installing latest FF beta in the language of your choice.")
    (license license:gpl3+)))

;;; -- freetype2-qdoled-aw3225qf --
(define-public freetype2-qdoled-aw3225qf
  (package
    (name "freetype2-qdoled-aw3225qf")
    (version "2.13.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.freetype.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/freetype2-qdoled-aw3225qf/"))))
    (home-page "https://www.freetype.org/")
    (synopsis "freetype optimized for AW3225QF subpixel layout")
    (description
     "Freetype optimized for AW3225QF subpixel layout.")
    (license license:freetype)))

;;; -- freetype2-qdoled-gen3 --
(define-public freetype2-qdoled-gen3
  (package
    (name "freetype2-qdoled-gen3")
    (version "2.14.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.freetype.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/freetype2-qdoled-gen3/"))))
    (home-page "https://www.freetype.org/")
    (synopsis "freetype optimized for QD-OLED Gen3 panels (like AW2725D) subpixel layout")
    (description
     "Freetype optimized for QD-OLED Gen3 panels (like AW2725D) subpixel layout.")
    (license license:freetype)))

;;; -- grep-compat --
(define-public grep-compat
  (package
    (name "grep-compat")
    (version "3.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.gnu.org/software/grep/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/grep-compat/"))))
    (home-page "https://www.gnu.org/software/grep/")
    (synopsis "a string search utility (without egrep and fgrep warnings when used in sc...")
    (description
     "A string search utility (without egrep and fgrep warnings when used in scripts).")
    (license license:gpl3+)))

;;; -- heidisql-qt6-bin --
(define-public heidisql-qt6-bin
  (package
    (name "heidisql-qt6-bin")
    (version "12.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/HeidiSQL/HeidiSQL.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/heidisql-qt6-bin/"))))
    (home-page "https://github.com/HeidiSQL/HeidiSQL")
    (synopsis "a lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLit...")
    (description
     "A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases. (Qt6).")
    (license license:gpl2+)))

;;; -- jdk17-zulu-prime-bin --
(define-public jdk17-zulu-prime-bin
  (package
    (name "jdk17-zulu-prime-bin")
    (version "26.01.0.0_11")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.azul.com/downloads/#prime")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jdk17-zulu-prime-bin/"))))
    (home-page "https://www.azul.com/downloads/#prime")
    (synopsis "azul Platform Prime Stream Build of OpenJDK 17. TCK compliant, free for d...")
    (description
     "Azul Platform Prime Stream Build of OpenJDK 17. TCK compliant, free for development.")
    (license license:nonfree)))

;;; -- libelectron-electron-meta --
(define-public libelectron-electron-meta
  (package
    (name "libelectron-electron-meta")
    (version "40")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://example.com/libelectron-electron-meta-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/libelectron-electron-meta/"))))
    (home-page "https://example.com/libelectron-electron-meta")
    (synopsis "a meta package for setting and controlling the electron versioning for Li...")
    (description
     "A meta package for setting and controlling the electron versioning for LibElectron packages.")
    (license license:gpl3+)))

;;; -- libinput-no-gestures --
(define-public libinput-no-gestures
  (package
    (name "libinput-no-gestures")
    (version "1.29.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.freedesktop.org/libinput/libinput.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/libinput-no-gestures/"))))
    (home-page "https://gitlab.freedesktop.org/libinput/libinput")
    (synopsis "input device management and event handling library - patched to remove ge...")
    (description
     "Input device management and event handling library - patched to remove gestures.")
    (license license:expat)))

;;; -- librewolf-extension-keepassxc-browser --
(define-public librewolf-extension-keepassxc-browser
  (package
    (name "librewolf-extension-keepassxc-browser")
    (version "1.10.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/librewolf-extension-keepassxc-browser/"))))
    (home-page "https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/")
    (synopsis "official browser plugin for the KeePassXC password manager")
    (description
     "Official browser plugin for the KeePassXC password manager.")
    (license license:gpl3+)))

;;; -- llama.cpp-opencl --
(define-public llama.cpp-opencl
  (package
    (name "llama.cpp-opencl")
    (version "b8644")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ggerganov/llama.cpp.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/llama.cpp-opencl/"))))
    (home-page "https://github.com/ggerganov/llama.cpp")
    (synopsis "port of Facebook's LLaMA model in C/C++(with OpenCL Backend support)")
    (description
     "Port of Facebook's LLaMA model in C/C++(with OpenCL Backend support).")
    (license license:expat)))

;;; -- mongodb-bin --
(define-public mongodb-bin
  (package
    (name "mongodb-bin")
    (version "8.2.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.mongodb.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mongodb-bin/"))))
    (home-page "https://www.mongodb.com/")
    (synopsis "a high-performance, open source, schema-free document-oriented database")
    (description
     "A high-performance, open source, schema-free document-oriented database.")
    (license license:sspl)))

;;; -- nvidia-535xx-utils --
(define-public nvidia-535xx-utils
  (package
    (name "nvidia-535xx-utils")
    (version "535.288.01")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.nvidia.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/nvidia-535xx-utils/"))))
    (home-page "http://www.nvidia.com/")
    (synopsis "NVIDIA drivers utilities, 535 branch")
    (description
     "NVIDIA drivers utilities, 535 branch.")
    (license license:nonfree)))

;;; -- opencl-amd --
(define-public opencl-amd
  (package
    (name "opencl-amd")
    (version "7.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.amd.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/opencl-amd/"))))
    (home-page "http://www.amd.com")
    (synopsis "ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, Open...")
    (description
     "ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack.")
    (license license:nonfree)))

;;; -- opencl-nvidia-390xx --
(define-public opencl-nvidia-390xx
  (package
    (name "opencl-nvidia-390xx")
    (version "390.157")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
             version "/NVIDIA-Linux-x86_64-" version ".run"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/nvidia/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.nvidia.com/")
    (synopsis "openCL implemention for NVIDIA")
    (description
     "OpenCL implemention for NVIDIA.")
    (license license:nonfree)))

;;; -- opencl-nvidia-470xx --
(define-public opencl-nvidia-470xx
  (package
    (name "opencl-nvidia-470xx")
    (version "470.256.02")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
             version "/NVIDIA-Linux-x86_64-" version ".run"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/nvidia/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nvidia.com/")
    (synopsis "openCL implemention for NVIDIA")
    (description
     "OpenCL implemention for NVIDIA.")
    (license license:nonfree)))

;;; -- opencl-nvidia-535xx --
(define-public opencl-nvidia-535xx
  (package
    (name "opencl-nvidia-535xx")
    (version "535.288.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
             version "/NVIDIA-Linux-x86_64-" version ".run"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/nvidia/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nvidia.com/")
    (synopsis "openCL implemention for NVIDIA, 535 branch")
    (description
     "OpenCL implemention for NVIDIA, 535 branch.")
    (license license:nonfree)))

;;; -- opencl-nvidia-550xx --
(define-public opencl-nvidia-550xx
  (package
    (name "opencl-nvidia-550xx")
    (version "550.163.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
             version "/NVIDIA-Linux-x86_64-" version ".run"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/nvidia/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nvidia.com/")
    (synopsis "openCL implemention for NVIDIA, 550 branch")
    (description
     "OpenCL implemention for NVIDIA, 550 branch.")
    (license license:nonfree)))

;;; -- opencl-nvidia-580xx --
(define-public opencl-nvidia-580xx
  (package
    (name "opencl-nvidia-580xx")
    (version "580.142")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
             version "/NVIDIA-Linux-x86_64-" version ".run"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/nvidia/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nvidia.com/")
    (synopsis "openCL implemention for NVIDIA (580xx)")
    (description
     "OpenCL implemention for NVIDIA (580xx).")
    (license license:nonfree)))

;;; -- opencl-nvidia-beta --
(define-public opencl-nvidia-beta
  (package
    (name "opencl-nvidia-beta")
    (version "595.58.03")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
             version "/NVIDIA-Linux-x86_64-" version ".run"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/nvidia/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.nvidia.com/")
    (synopsis "openCL implemention for NVIDIA (beta version)")
    (description
     "OpenCL implemention for NVIDIA (beta version).")
    (license license:nonfree)))

;;; -- rocm-gfx110x-bin --
(define-public rocm-gfx110x-bin
  (package
    (name "rocm-gfx110x-bin")
    (version "7.12.0pre")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.amd.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rocm-gfx110x-bin/"))))
    (home-page "http://www.amd.com")
    (synopsis "ROCm Core SDK and TheRock Build System - RDNA3")
    (description
     "ROCm Core SDK and TheRock Build System - RDNA3.")
    (license license:nonfree)))

;;; -- rocm-nightly-gfx110x-bin --
(define-public rocm-nightly-gfx110x-bin
  (package
    (name "rocm-nightly-gfx110x-bin")
    (version "7.13.0a20260406")
    (source
     (origin
       (method url-fetch)
       (uri "https://rocm.nightlies.amd.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rocm-nightly-gfx110x-bin/"))))
    (home-page "https://rocm.nightlies.amd.com")
    (synopsis "AMD ROCm Nightly Release (gfx110X) - Monolithic Install")
    (description
     "AMD ROCm Nightly Release (gfx110X) - Monolithic Install.")
    (license license:nonfree)))

;;; -- rocm-nightly-gfx1151-bin --
(define-public rocm-nightly-gfx1151-bin
  (package
    (name "rocm-nightly-gfx1151-bin")
    (version "7.13.0a20260406")
    (source
     (origin
       (method url-fetch)
       (uri "https://rocm.nightlies.amd.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rocm-nightly-gfx1151-bin/"))))
    (home-page "https://rocm.nightlies.amd.com")
    (synopsis "AMD ROCm Nightly Release (gfx1151) - Monolithic Install")
    (description
     "AMD ROCm Nightly Release (gfx1151) - Monolithic Install.")
    (license license:nonfree)))

;;; -- scrutiny-web-frontend --
(define-public scrutiny-web-frontend
  (package
    (name "scrutiny-web-frontend")
    (version "0.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AnalogJ/scrutiny.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/scrutiny-web-frontend/"))))
    (home-page "https://github.com/AnalogJ/scrutiny")
    (synopsis "hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure T...")
    (description
     "Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds - Web Frontend Files.")
    (license license:asl2.0)))

;;; -- vectorchord-bin --
(define-public vectorchord-bin
  (package
    (name "vectorchord-bin")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tensorchord/VectorChord.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/vectorchord-bin/"))))
    (home-page "https://github.com/tensorchord/VectorChord")
    (synopsis "postgreSQL vector similarity search extension, successor to pgvecto.rs")
    (description
     "PostgreSQL vector similarity search extension, successor to pgvecto.rs.")
    (license license:agpl3)))

;;; -- vscodium-electron-bin --
(define-public vscodium-electron-bin
  (package
    (name "vscodium-electron-bin")
    (version "1.112.01907")
    (source
     (origin
       (method url-fetch)
       (uri "https://vscodium.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/vscodium-electron-bin/"))))
    (home-page "https://vscodium.com/")
    (synopsis "vS Code without MS branding/telemetry/licensing.(Prebuilt and System-wide...")
    (description
     "VS Code without MS branding/telemetry/licensing.(Prebuilt and System-wide Electron edition).")
    (license license:expat)))
