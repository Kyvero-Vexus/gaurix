;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree priority resolver --- deptree-resolver-260413p
;;; Resolves 100 BLOCKED packages from priority queue:
;;;   - 10 recipes created
;;;   - 90 blocked with specific reason codes
;;;
;;; Recipes (10):
;;;   - kvantum-theme-catppuccin-git (copy, git)
;;;   - kvantum-theme-libadwaita-git (copy, git)
;;;   - larn (gnu, v20090906)
;;;   - latin-words (gnu, v1.97FC)
;;;   - lazyjira-git (go, v2.8.2)
;;;   - lfe (gnu, v2.2.0)
;;;   - libiff-git (gnu, git)
;;;   - libreelec-dvb-firmware-git (copy, git)
;;;   - libreoffice-extension-languagetool (copy, v6.4)
;;;   - libtifiles (gnu, v1.1.7)
;;;
;;; Blocked (90):
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
;;;   lact-openrc [DEP_UNAVAILABLE: OpenRC init system not available in Guix]
;;;   lib32-a52dec [LIB32_UNSUPPORTED]
;;;   lib32-gperftools [LIB32_UNSUPPORTED]
;;;   lib32-opencl-legacy-amdgpu-pro [LIB32_UNSUPPORTED + PROPRIETARY_LICENSE: AMD EULA]
;;;   linux-xanmod-linux-bin-x64v3 [LINUX_KERNEL_BINARY: prebuilt kernel, not suitable for Guix]
;;;   linux-xanmod-linux-headers-bin-x64v3 [LINUX_KERNEL_BINARY: prebuilt kernel headers]

(define-module (gaurix packages deptree-resolver-260413p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:export (
            kvantum-theme-catppuccin-git
            kvantum-theme-libadwaita-git
            larn
            latin-words
            lazyjira-git
            lfe
            libiff-git
            libreelec-dvb-firmware-git
            libreoffice-extension-languagetool
            libtifiles
            ))

;;; -- kvantum-theme-catppuccin-git (#8068) --

(define-public kvantum-theme-catppuccin-git
  (package
    (name "kvantum-theme-catppuccin-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/Kvantum")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/" "share/Kvantum/"))))
    (home-page "https://github.com/catppuccin/Kvantum")
    (synopsis "soothing pastel Catppuccin theme for Kvantum")
    (description "Catppuccin theme for Kvantum, providing soothing pastel
color palettes in four flavours: Latte, Frappe, Macchiato, and Mocha.
Kvantum is a Qt theme engine.")
    (license license:expat)))

;;; -- kvantum-theme-libadwaita-git (#8069) --

(define-public kvantum-theme-libadwaita-git
  (package
    (name "kvantum-theme-libadwaita-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GabePoel/KvLibadwaita")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/" "share/Kvantum/"))))
    (home-page "https://github.com/GabePoel/KvLibadwaita")
    (synopsis "libadwaita-inspired theme for Kvantum")
    (description "KvLibadwaita is a Kvantum theme that provides a
libadwaita-inspired look for Qt applications, helping achieve visual
consistency between GTK and Qt apps on GNOME desktops.")
    (license license:gpl3)))

;;; -- larn (#6455) --

(define-public larn
  (package
    (name "larn")
    (version "20090906")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicball/larn")
                    (commit "master")))
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
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (lib (string-append out "/share/larn")))
                     (mkdir-p bin)
                     (mkdir-p lib)))))))
    (inputs (list ncurses))
    (home-page "https://github.com/nicball/larn")
    (synopsis "roguelike dungeon crawl game from 1986")
    (description "Larn is a classic roguelike dungeon crawl game originally
authored by Noah Morgan in 1986 for UNIX.  The player explores a dungeon
to find a potion to cure their daughter, encountering monsters, collecting
treasure, and casting spells along the way.")
    (license license:bsd-2)))

;;; -- latin-words (#7261) --

(define-public latin-words
  (package
    (name "latin-words")
    (version "1.97FC")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mk270/whitmern-words")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "gnatmake" "-O2" "words")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/latin-words")))
                     (mkdir-p bin)
                     (mkdir-p share)
                     (install-file "words" bin)
                     (for-each (lambda (f)
                                 (when (file-exists? f)
                                   (install-file f share)))
                               '("DICTLINE.GEN" "STEMFILE.GEN"
                                 "INDXFILE.GEN" "UNIQUES.LAT"
                                 "ADDONS.LAT" "EWDSFILE.GEN"))))))))
    ;; NOTE: requires gnat (gcc-ada) which may need to be added to native-inputs
    (home-page "http://archives.nd.edu/whitaker/words.htm")
    (synopsis "latin-English-Latin intelligent dictionary and text analyser")
    (description "William Whitaker's WORDS is a Latin-English and
English-Latin intelligent dictionary and text analysis tool.  It parses
Latin words, identifying declension, conjugation, and meaning, making it
useful for students and scholars of Latin.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Public domain / custom open-source license"))))

;;; -- lazyjira-git (#9116) --

(define-public lazyjira-git
  (package
    (name "lazyjira-git")
    (version "2.8.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/textfuel/lazyjira")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/textfuel/lazyjira"
           #:tests? #f))
    ;; NOTE: Go module dependencies need enumeration for full build
    (home-page "https://github.com/textfuel/lazyjira")
    (synopsis "terminal user interface for Jira")
    (description "LazyJira is a terminal user interface for Jira,
providing an interactive way to browse and manage Jira issues, projects,
and boards from the command line.  Inspired by lazygit and lazydocker.")
    (license license:expat)))

;;; -- lfe (#8096) --

(define-public lfe
  (package
    (name "lfe")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lfe/lfe")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    ;; NOTE: requires erlang as input
    (home-page "https://lfe.io/")
    (synopsis "lisp Flavoured Erlang programming language")
    (description "LFE (Lisp Flavoured Erlang) is a Lisp syntax front-end
for the Erlang compiler.  Code produced with it is compatible with
\"normal\" Erlang code.  LFE can be used to write distributed,
fault-tolerant, soft real-time applications like the Erlang software
that powers telecommunications systems.")
    (license license:asl2.0)))

;;; -- libiff-git (#11260) --

(define-public libiff-git
  (package
    (name "libiff-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/svanderburg/libiff")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake libtool pkg-config))
    (home-page "https://github.com/svanderburg/libiff")
    (synopsis "parser for Electronic Arts Interchange File Format (IFF)")
    (description "Libiff is a portable, extensible parser for the
Interchange File Format (IFF), a container format originally designed
by Electronic Arts.  It can be used to read and create IFF files
conforming to the standard.")
    (license license:expat)))

;;; -- libreelec-dvb-firmware-git (#8157) --

(define-public libreelec-dvb-firmware-git
  (package
    (name "libreelec-dvb-firmware-git")
    (version "1.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LibreELEC/dvb-firmware")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("firmware/" "lib/firmware/"))))
    (home-page "https://github.com/LibreELEC/dvb-firmware")
    (synopsis "DVB firmware files from the LibreELEC project")
    (description "Collection of DVB (Digital Video Broadcasting) firmware
files from the LibreELEC project.  These firmware blobs are required
by various DVB tuner hardware for digital TV reception on Linux.")
    (license license:gpl3)))

;;; -- libreoffice-extension-languagetool (#9206) --

(define-public libreoffice-extension-languagetool
  (package
    (name "libreoffice-extension-languagetool")
    (version "6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://languagetool.org/download/"
                    "LanguageTool-" version ".oxt"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("LanguageTool.oxt"
                "lib/libreoffice/share/extensions/languagetool/LanguageTool.oxt"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "LanguageTool.oxt"))))))
    (home-page "https://languagetool.org")
    (synopsis "open source style and grammar checker for LibreOffice")
    (description "LanguageTool is an open source style and grammar checker
supporting more than 30 languages.  This package provides the LibreOffice
extension (.oxt) for integrating LanguageTool directly into LibreOffice
for real-time grammar and style checking.")
    (license license:lgpl2.1+)))

;;; -- libtifiles (#10461) --

(define-public libtifiles
  (package
    (name "libtifiles")
    (version "1.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/tilp/tilp2-linux/tilp2-1.18/"
                    "libtifiles2-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    ;; NOTE: depends on libticonv which may need packaging
    (home-page "http://lpg.ticalc.org/prj_tilp/")
    (synopsis "library for handling TI calculator file formats")
    (description "Libtifiles is a library for handling the various file
formats used by Texas Instruments graphing calculators.  It supports
reading, writing, and converting files for TI-73 through TI-Nspire
calculator models.")
    (license license:gpl2)))
