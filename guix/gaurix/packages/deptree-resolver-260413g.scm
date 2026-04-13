;;; deptree-resolver-260413g.scm — Dependency-tree priority resolver
;;; Generated: 2026-04-13T12:30:13.799329+00:00
;;; Run ID: deptree-resolver-260413g
;;; Total: 100 packages (28 recipes, 72 blocked)
;;;
;;; Recipes (28):
;;;   argc
;;;   ascii-image-converter
;;;   bfree-bin
;;;   bfree
;;;   archium-bin
;;;   autosubsync-bin
;;;   briar-desktop-bin
;;;   bash-fuzzy-clock
;;;   arkenfox-user.js
;;;   xone-dongle-firmware
;;;   unreal-tournament-data
;;;   bcpp
;;;   blt
;;;   powerofforreboot-efi
;;;   typing-test
;;;   batctl-tui
;;;   aspire-cli-bin
;;;   chromium-gost
;;;   megit
;;;   bisq-cli
;;;   bisq-daemon
;;;   bisq-desktop
;;;   vibe-kanban-bin
;;;   binkplayer-bin
;;;   plecs-standalone-bin
;;;   davinci-resolve-studio-bin
;;;   ssacli-bin
;;;   breitbandmessung-bin
;;;
;;; Blocked (72):
;;;   anbox-git [SOURCE_UNAVAILABLE]
;;;   linux6.19.8.arch1-1-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.8.arch1-1-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.8.arch1-1-headers-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-headers-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-headers-bin [SOURCE_UNAVAILABLE]
;;;   nvidia-vulkan-dkms [SOURCE_UNAVAILABLE]
;;;   openai-codex-autoup-bin [SOURCE_UNAVAILABLE]
;;;   opensc-p11-kit-module [SOURCE_UNAVAILABLE]
;;;   projtlauncher [SOURCE_UNAVAILABLE]
;;;   shimmy-bin [SOURCE_UNAVAILABLE]
;;;   subs2srs-git [SOURCE_UNAVAILABLE]
;;;   vivaldi-ffmpeg-codecs [SOURCE_UNAVAILABLE]
;;;   whatsapp-for-linux [SOURCE_UNAVAILABLE]
;;;   zettlr [SOURCE_UNAVAILABLE]
;;;   pac-pacman-aliases [ARCH_SPECIFIC]
;;;   pacman-log-orphans-hook [ARCH_SPECIFIC]
;;;   pipewire-enable-bluez5 [ARCH_SPECIFIC]
;;;   systemd-boot-pacman-hook [ARCH_SPECIFIC]
;;;   localepurge-hook [ARCH_SPECIFIC]
;;;   paccache-hook [ARCH_SPECIFIC]
;;;   yaycache-hook [ARCH_SPECIFIC]
;;;   ancient-packages [ARCH_SPECIFIC]
;;;   mandb-instant-update [ARCH_SPECIFIC]
;;;   arch-gdm-theme-list [ARCH_SPECIFIC]
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
;;;   new-lg4ff-dkms-git [DKMS_KERNEL_MODULE]
;;;   amneziawg-dkms [DKMS_KERNEL_MODULE]
;;;   linux-cachyos-lts [DKMS_KERNEL_MODULE]
;;;   linux-cachyos [DKMS_KERNEL_MODULE]
;;;   linux-cachyos-rc [DKMS_KERNEL_MODULE]
;;;   nvidia-utils-beta [NEEDS_RECIPE_DESIGN]
;;;   python-opentelemetry-exporter-otlp-proto-common [NEEDS_RECIPE_DESIGN]
;;;   sonic-win [NEEDS_RECIPE_DESIGN]
;;;   lib32-xrizer [NEEDS_RECIPE_DESIGN]
;;;   plasma-workspace-povd [NEEDS_RECIPE_DESIGN]
;;;   yabridgectl-wine10-git [NEEDS_RECIPE_DESIGN]
;;;   python-opentelemetry-exporter-zipkin-proto-http [NEEDS_RECIPE_DESIGN]
;;;   qt6-base-hifps [NEEDS_RECIPE_DESIGN]
;;;   lib32-libudev0-shim [NEEDS_RECIPE_DESIGN]
;;;   lib32-libtxc_dxtn [NEEDS_RECIPE_DESIGN]
;;;   linux-zen-versioned-docs-bin [NEEDS_RECIPE_DESIGN]
;;;   linux-zen-versioned-headers-bin [NEEDS_RECIPE_DESIGN]
;;;   oopz [NEEDS_RECIPE_DESIGN]
;;;   youtube-music-desktop [NEEDS_RECIPE_DESIGN]
;;;   keychron-q3-max-udev [NEEDS_RECIPE_DESIGN]
;;;   lib32-zix [NEEDS_RECIPE_DESIGN]
;;;   bcompare-cinnamon [NEEDS_RECIPE_DESIGN]
;;;   bcompare-kde4 [NEEDS_RECIPE_DESIGN]
;;;   bcompare-kde6 [NEEDS_RECIPE_DESIGN]
;;;   bcompare-mate [NEEDS_RECIPE_DESIGN]
;;;   bcompare-nautilus [NEEDS_RECIPE_DESIGN]
;;;   bcompare-thunar [NEEDS_RECIPE_DESIGN]
;;;   ninjarmm-ncplayer [NEEDS_RECIPE_DESIGN]
;;;   nautilus-megasync [NEEDS_RECIPE_DESIGN]
;;;

(define-module (gaurix packages deptree-resolver-260413g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages tcl)
  #:export (
            argc
            ascii-image-converter
            bfree-bin
            bfree
            archium-bin
            autosubsync-bin
            briar-desktop-bin
            bash-fuzzy-clock
            arkenfox-user.js
            xone-dongle-firmware
            unreal-tournament-data
            bcpp
            blt
            powerofforreboot-efi
            typing-test
            batctl-tui
            aspire-cli-bin
            chromium-gost
            megit
            bisq-cli
            bisq-daemon
            bisq-desktop
            vibe-kanban-bin
            binkplayer-bin
            plecs-standalone-bin
            davinci-resolve-studio-bin
            ssacli-bin
            breitbandmessung-bin
            ))

;;; ── argc ────────────────────────────────────────────────────────────
;;; Elegant command-line argument parser (Rust binary from GitHub release)
;;; AUR: argc  →  Guix: argc
;;; Upstream: https://github.com/sigoden/argc
;;;
(define-public argc
  (package
    (name "argc")
    (version "1.23.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sigoden/argc/releases/download/v"
             version "/argc-v" version "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("argc" "bin/argc"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sigoden/argc")
    (synopsis "elegant command-line argument parser")
    (description "Argc is a command-line argument parser for Bash scripts.
It allows you to define argument parsing logic using comment annotations
and generates completions for various shells.")
    (license license:asl2.0)))

;;; ── ascii-image-converter ───────────────────────────────────────────
;;; Convert images into ASCII art (Go binary from GitHub release)
;;; AUR: ascii-image-converter  →  Guix: ascii-image-converter
;;; Upstream: https://github.com/TheZoraiz/ascii-image-converter
;;;
(define-public ascii-image-converter
  (package
    (name "ascii-image-converter")
    (version "1.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TheZoraiz/ascii-image-converter/releases/download/v"
             version "/ascii-image-converter_Linux_amd64_64bit.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ascii-image-converter" "bin/ascii-image-converter"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TheZoraiz/ascii-image-converter")
    (synopsis "convert images into ASCII art on the terminal")
    (description "Ascii-image-converter converts images into ASCII art and
prints them to the console.  It supports multiple image formats, custom
character sets, colored output, and braille art mode.")
    (license license:asl2.0)))

;;; ── bfree-bin ───────────────────────────────────────────────────────
;;; A better free, human by default (prebuilt Rust binary)
;;; AUR: bfree-bin  →  Guix: bfree-bin
;;; Upstream: https://github.com/glexposito/bfree
;;;
(define-public bfree-bin
  (package
    (name "bfree-bin")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/glexposito/bfree/releases/download/v"
             version "/bfree"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bfree" "bin/bfree"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/glexposito/bfree")
    (synopsis "memory statistics tool for humans")
    (description "Bfree is a human-readable memory information tool that
displays system memory usage in a clear, intuitive format.  It is a modern
replacement for the traditional @command{free} command.")
    (license license:expat)))

;;; ── bfree ───────────────────────────────────────────────────────────
;;; A better free, human by default (from source)
;;; AUR: bfree  →  Guix: bfree
;;; Upstream: https://github.com/glexposito/bfree
;;;
(define-public bfree
  (package
    (name "bfree")
    (version "0.1.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/glexposito/bfree")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/glexposito/bfree")
    (synopsis "memory statistics tool for humans")
    (description "Bfree is a human-readable memory information tool that
displays system memory usage in a clear, intuitive format.  It is a modern
replacement for the traditional @command{free} command.")
    (license license:expat)))

;;; ── archium-bin ─────────────────────────────────────────────────────
;;; Wrapper for AUR helpers (prebuilt binary)
;;; AUR: archium-bin  →  Guix: archium-bin
;;; Upstream: https://github.com/keircn/archium
;;;
(define-public archium-bin
  (package
    (name "archium-bin")
    (version "1.10.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/keircn/archium/releases/download/"
             version "/archium-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("archium" "bin/archium"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/keircn/archium")
    (synopsis "wrapper for AUR helpers")
    (description "Archium is a wrapper for AUR helpers such as yay and paru,
providing a unified interface for package management operations.")
    (license license:expat)))

;;; ── autosubsync-bin ─────────────────────────────────────────────────
;;; Automatic subtitle synchronization tool (AppImage)
;;; AUR: autosubsync-bin  →  Guix: autosubsync-bin
;;; Upstream: https://github.com/denizsafak/AutoSubSync
;;;
(define-public autosubsync-bin
  (package
    (name "autosubsync-bin")
    (version "6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/denizsafak/AutoSubSync/releases/download/v"
             version "/AutoSubSync-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("AutoSubSync.AppImage" "bin/autosubsync"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/denizsafak/AutoSubSync")
    (synopsis "automatic subtitle synchronization tool")
    (description "AutoSubSync automatically synchronizes subtitle files to
match the audio track of a video file using speech recognition and audio
fingerprinting techniques.")
    (license license:gpl3+)))

;;; ── briar-desktop-bin ───────────────────────────────────────────────
;;; Secure messaging for the next generation (desktop beta)
;;; AUR: briar-desktop-bin  →  Guix: briar-desktop-bin
;;; Upstream: https://code.briarproject.org/briar/briar-desktop
;;;
(define-public briar-desktop-bin
  (package
    (name "briar-desktop-bin")
    (version "0.6.5-beta")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://desktop.briarproject.org/jars/linux/"
             version "/briar-desktop-linux-" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("briar-desktop.jar" "share/java/briar-desktop.jar"))))
    (home-page "https://code.briarproject.org/briar/briar-desktop")
    (synopsis "secure peer-to-peer messaging desktop client")
    (description "Briar Desktop is a beta desktop client for the Briar
secure messaging system.  Briar synchronizes messages via Tor, Wi-Fi,
and Bluetooth, enabling communication even when the internet is down.")
    (license license:gpl3+)))

;;; ── bash-fuzzy-clock ────────────────────────────────────────────────
;;; Display time in natural language
;;; AUR: bash-fuzzy-clock-git  →  Guix: bash-fuzzy-clock
;;; Upstream: https://github.com/coreymwamba/bash-fuzzy-clock
;;;
(define-public bash-fuzzy-clock
  (package
    (name "bash-fuzzy-clock")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/coreymwamba/bash-fuzzy-clock")
             (commit "e66578e7f1b3fbc66ebef35be2cc3c2c2f3f6d6f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fuzzy_clock.sh" "bin/fuzzy-clock"))))
    (inputs (list bash))
    (home-page "https://github.com/coreymwamba/bash-fuzzy-clock")
    (synopsis "display time in natural language")
    (description "Bash Fuzzy Clock is a script that displays the current
time in natural language (e.g., @samp{quarter past three}).  It supports
six languages including English, French, German, Spanish, Italian, and
Portuguese.")
    (license license:gpl3+)))

;;; ── arkenfox-user.js ────────────────────────────────────────────────
;;; Firefox privacy user.js template
;;; AUR: arkenfox-user.js-git  →  Guix: arkenfox-user.js
;;; Upstream: https://github.com/arkenfox/user.js
;;;
(define-public arkenfox-user.js
  (package
    (name "arkenfox-user.js")
    (version "128.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arkenfox/user.js")
             (commit "f906f7f5a485aa24fee88b086470d3b37baee696")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("user.js" "share/arkenfox/user.js")
               ("updater.sh" "bin/arkenfox-updater")
               ("prefsCleaner.sh" "bin/arkenfox-prefs-cleaner"))))
    (inputs (list bash))
    (home-page "https://github.com/arkenfox/user.js")
    (synopsis "Firefox privacy, security and anti-tracking user.js template")
    (description "Arkenfox user.js is a comprehensive Firefox @file{user.js}
template for configuring and hardening Firefox privacy, security, and
anti-tracking settings.  Includes updater and preferences cleaner scripts.")
    (license license:expat)))

;;; ── xone-dongle-firmware ────────────────────────────────────────────
;;; Xbox Wireless Controller Adapter firmware
;;; AUR: xone-dongle-firmware  →  Guix: xone-dongle-firmware
;;; Upstream: https://support.xbox.com/
;;;
(define-public xone-dongle-firmware
  (package
    (name "xone-dongle-firmware")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/03/2ea9591b-5e23-4b0e-82ed-2d16e4b849e0_96078d7e1af90c57d80500e93b4b17adb757e92c.cab")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firmware/"))))
    (home-page "https://support.xbox.com/en-US/help/hardware-network/browse")
    (synopsis "Xbox Wireless Controller Adapter firmware blobs")
    (description "Firmware files for the Xbox Wireless Controller Adapter
dongles, extracted from Microsoft Windows Update cabinet files.  Required
for use with the xone kernel driver.")
    (license (license:non-copyleft
              "https://www.microsoft.com/en-us/legal/terms-of-use"
              "Microsoft Terms of Use"))))

;;; ── unreal-tournament-data ──────────────────────────────────────────
;;; Unreal Tournament 99 (GOTY) data from Archive.org
;;; AUR: unreal-tournament-data-archiveorg  →  Guix: unreal-tournament-data
;;; Upstream: https://archive.org/details/ut-goty
;;;
(define-public unreal-tournament-data
  (package
    (name "unreal-tournament-data")
    (version "436")
    (source
     (origin
       (method url-fetch)
       (uri "https://archive.org/download/ut-goty/UT_GOTY_CD1.iso")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/games/unreal-tournament/"))))
    ;; native-inputs: p7zip (for ISO extraction)
    (home-page "https://archive.org/details/ut-goty")
    (synopsis "Unreal Tournament 99 GOTY game data files")
    (description "Game data files for Unreal Tournament 99 Game of the Year
edition, extracted from the Archive.org ISO image.  Requires a compatible
game engine binary to play.")
    (license (license:non-copyleft
              "https://archive.org/details/ut-goty"
              "Epic Games / GT Interactive EULA"))))

;;; ── bcpp ────────────────────────────────────────────────────────────
;;; C/C++ source code beautifier
;;; AUR: bcpp  →  Guix: bcpp
;;; Upstream: https://invisible-island.net/bcpp/bcpp.html
;;;
(define-public bcpp
  (package
    (name "bcpp")
    (version "20240917")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://invisible-island.net/archives/bcpp/bcpp-"
             version ".tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://invisible-island.net/bcpp/bcpp.html")
    (synopsis "C/C++ source code indenter and beautifier")
    (description "Bcpp is a utility for indenting and reformatting C and
C++ source code.  It can adjust indentation levels, brace styles, and
other formatting aspects of source files.")
    (license (license:non-copyleft
              "https://invisible-island.net/bcpp/bcpp.html"
              "bcpp license (MIT-like)"))))

;;; ── blt ─────────────────────────────────────────────────────────────
;;; Extension to Tcl/Tk with new commands and widgets
;;; AUR: blt  →  Guix: blt
;;; Upstream: http://blt.sourceforge.net
;;;
(define-public blt
  (package
    (name "blt")
    (version "2.4z")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/blt/BLT/BLT%20"
             version "/BLT" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list tcl tk))
    (home-page "http://blt.sourceforge.net")
    (synopsis "extension library for Tcl/Tk")
    (description "BLT is an extension to the Tcl and Tk scripting language
that adds new commands and widgets.  It includes graph, barchart, stripchart,
tabset, tree, treeview, and other widgets.")
    (license (license:non-copyleft
              "http://blt.sourceforge.net"
              "BLT license (BSD-like)"))))

;;; ── powerofforreboot-efi ────────────────────────────────────────────
;;; UEFI power-off and reboot utilities
;;; AUR: powerofforreboot.efi  →  Guix: powerofforreboot-efi
;;; Upstream: N/A (simple EFI utilities)
;;;
(define-public powerofforreboot-efi
  (package
    (name "powerofforreboot-efi")
    (version "20190517")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powerofforreboot.efi.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    ;; native-inputs: gnu-efi (for EFI compilation)
    (home-page "https://aur.archlinux.org/packages/powerofforreboot.efi")
    (synopsis "UEFI power-off and reboot utilities")
    (description "Simple EFI applications for power-off and reboot that can
be used from within a UEFI boot manager or shell environment.")
    (license license:gpl2)))

;;; ── typing-test ────────────────────────────────────────────────────
;;; Simple terminal typing test (Rust)
;;; AUR: typing_test  →  Guix: typing-test
;;; Upstream: https://github.com/owenhar/rust_typing_test
;;;
(define-public typing-test
  (package
    (name "typing-test")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/owenhar/rust_typing_test")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/owenhar/rust_typing_test")
    (synopsis "simple typing speed test for the terminal")
    (description "A terminal-based typing speed test written in Rust.
Measures words per minute and accuracy with randomly generated text
prompts.")
    (license license:expat)))

;;; ── batctl-tui ──────────────────────────────────────────────────────
;;; TUI tool for managing battery charge thresholds
;;; AUR: batctl-tui  →  Guix: batctl-tui
;;; Upstream: https://github.com/Ooooze/batctl
;;;
(define-public batctl-tui
  (package
    (name "batctl-tui")
    (version "2026.3.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ooooze/batctl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Ooooze/batctl"
           #:tests? #f))
    (home-page "https://github.com/Ooooze/batctl")
    (synopsis "TUI and CLI tool for managing battery charge thresholds")
    (description "Batctl is a terminal user interface and command-line tool
for managing battery charge thresholds on Linux laptops.  It allows setting
charge start and stop thresholds to extend battery lifespan.")
    (license license:expat)))

;;; ── aspire-cli-bin ──────────────────────────────────────────────────
;;; .NET Aspire CLI tooling (prebuilt binary)
;;; AUR: aspire-cli  →  Guix: aspire-cli-bin
;;; Upstream: https://github.com/dotnet/aspire
;;;
(define-public aspire-cli-bin
  (package
    (name "aspire-cli-bin")
    (version "13.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ci.dot.net/public/aspire/"
             version "-preview.1.26166.8"
             "/aspire-cli-linux-x64-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aspire" "bin/aspire"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dotnet/aspire")
    (synopsis ".NET Aspire CLI for building observable cloud applications")
    (description "Aspire CLI provides tools, templates, and packages for
building observable, production-ready, distributed .NET applications.  This
is the prebuilt binary release.")
    (license license:expat)))

;;; ── chromium-gost ───────────────────────────────────────────────────
;;; Chromium with GOST cryptography support
;;; AUR: chromium-gost  →  Guix: chromium-gost
;;; Upstream: https://github.com/nickel-browser/nickel
;;;
(define-public chromium-gost
  (package
    (name "chromium-gost")
    (version "142.0.7444.176")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickel-browser/nickel/releases/download/"
             version "/nickel-linux-x64-" version ".deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/chromium-gost/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/deemru/Chromium-Gost")
    (synopsis "Chromium browser with GOST cryptography support")
    (description "Chromium-Gost is a Chromium-based web browser with support
for Russian GOST cryptographic algorithms and digital signatures.  It enables
access to Russian government portals that require GOST TLS.")
    (license license:expat)))

;;; ── megit ───────────────────────────────────────────────────────────
;;; Git GUI based on EGit Eclipse plugin
;;; AUR: megit  →  Guix: megit
;;; Upstream: https://github.com/nickel-browser/nickel
;;;
(define-public megit
  (package
    (name "megit")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nickel-browser/nickel")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/megit/"))))
    (home-page "https://github.com/eclipsesource/megit")
    (synopsis "Git GUI repository manager based on EGit")
    (description "Megit is a graphical Git repository manager based on the
EGit Eclipse plugin.  It provides a standalone interface for common Git
operations including staging, committing, branching, and merging.")
    (license license:epl2.0)))

;;; ── bisq-desktop ───────────────────────────────────────────────────
;;; Decentralized Bitcoin exchange (desktop client)
;;; AUR: bisq-desktop  →  Guix: bisq-desktop
;;; Upstream: https://bisq.network
;;;
(define-public bisq-desktop
  (package
    (name "bisq-desktop")
    (version "1.9.22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bisq-network/bisq/releases/download/v"
             version "/Bisq-64bit-" version ".deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bisq/"))))
    (home-page "https://bisq.network")
    (synopsis "decentralized Bitcoin exchange desktop application")
    (description "Bisq is a decentralized peer-to-peer Bitcoin exchange
that allows users to trade national currencies for Bitcoin without
intermediaries.  It uses Tor for privacy and multi-signature escrow for
security.")
    (license license:agpl3+)))

;;; ── bisq-cli ───────────────────────────────────────────────────────
;;; Decentralized Bitcoin exchange (CLI)
;;; AUR: bisq-cli  →  Guix: bisq-cli
;;; Upstream: https://bisq.network
;;;
(define-public bisq-cli
  (package
    (inherit bisq-desktop)
    (name "bisq-cli")
    (synopsis "decentralized Bitcoin exchange CLI client")
    (description "Bisq CLI is the command-line interface for the Bisq
decentralized Bitcoin exchange network.  It provides programmatic access
to trading, wallet, and network operations.")))

;;; ── bisq-daemon ────────────────────────────────────────────────────
;;; Decentralized Bitcoin exchange (daemon)
;;; AUR: bisq-daemon  →  Guix: bisq-daemon
;;; Upstream: https://bisq.network
;;;
(define-public bisq-daemon
  (package
    (inherit bisq-desktop)
    (name "bisq-daemon")
    (synopsis "decentralized Bitcoin exchange daemon")
    (description "Bisq daemon is the headless service for the Bisq
decentralized Bitcoin exchange network.  It runs the trading engine
without a GUI, suitable for server deployments and automation.")))

;;; ── vibe-kanban-bin ─────────────────────────────────────────────────
;;; AI-powered Kanban board (binary)
;;; AUR: vibe-kanban-bin  →  Guix: vibe-kanban-bin
;;; Upstream: https://vibekanban.com
;;;
(define-public vibe-kanban-bin
  (package
    (name "vibe-kanban-bin")
    (version "0.1.41")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vibekanban.com/releases/vibe-kanban-"
             version "-linux-x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vibe-kanban/"))))
    ;; native-inputs: unzip (for .zip extraction)
    (supported-systems '("x86_64-linux"))
    (home-page "https://vibekanban.com")
    (synopsis "AI-powered Kanban board application")
    (description "Vibe Kanban is an AI-powered Kanban board application for
project management and task tracking with intelligent suggestions and
automation features.")
    (license (license:non-copyleft
              "https://vibekanban.com"
              "Proprietary"))))

;;; ── binkplayer-bin ──────────────────────────────────────────────────
;;; Bink Video Player (binary)
;;; AUR: binkplayer-bin  →  Guix: binkplayer-bin
;;; Upstream: http://www.radgametools.com/bnkmain.htm
;;;
(define-public binkplayer-bin
  (package
    (name "binkplayer-bin")
    (version "2025.05")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.radgametools.com/bnkmain.htm")
    (synopsis "Bink Video format player")
    (description "Bink Player is the official player for the Bink Video
format, widely used in video games for cutscenes and cinematics.  This
is the prebuilt Linux binary from RAD Game Tools.")
    (license (license:non-copyleft
              "http://www.radgametools.com/bnkmain.htm"
              "RAD Game Tools License"))))

;;; ── plecs-standalone-bin ────────────────────────────────────────────
;;; Circuit simulation tool from Plexim (proprietary, trial)
;;; AUR: plecs-standalone  →  Guix: plecs-standalone-bin
;;; Upstream: https://www.plexim.com/products/plecs
;;;
(define-public plecs-standalone-bin
  (package
    (name "plecs-standalone-bin")
    (version "5.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.plexim.com/sites/default/files/"
             "plecs_standalone_" version "_linux64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/plecs/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.plexim.com/products/plecs")
    (synopsis "circuit simulation tool from Plexim")
    (description "PLECS Standalone is a circuit simulation tool for power
electronics and electrical drives.  It provides a graphical environment
for modeling, simulating, and analyzing power electronic circuits.
Note: requires a license from Plexim (30-day free trial available).")
    (license (license:non-copyleft
              "https://www.plexim.com/legal"
              "Plexim PLECS License"))))

;;; ── davinci-resolve-studio-bin ──────────────────────────────────────
;;; Professional A/V post-production suite (Studio edition)
;;; AUR: davinci-resolve-studio  →  Guix: davinci-resolve-studio-bin
;;; Upstream: https://www.blackmagicdesign.com/
;;;
(define-public davinci-resolve-studio-bin
  (package
    (name "davinci-resolve-studio-bin")
    (version "20.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://swr.cloud.blackmagicdesign.com/DaVinciResolve/v"
             version "/DaVinci_Resolve_Studio_" version "_Linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/davinci-resolve-studio/"))))
    ;; native-inputs: unzip (for .zip extraction)
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.blackmagicdesign.com/products/davinciresolve")
    (synopsis "professional video editing and color grading suite (studio)")
    (description "DaVinci Resolve Studio is a professional video editing,
color correction, visual effects, and audio post-production suite from
Blackmagic Design.  This is the Studio (paid) edition with additional
features over the free version.")
    (license (license:non-copyleft
              "https://www.blackmagicdesign.com/eula"
              "Blackmagic Design EULA"))))

;;; ── ssacli-bin ──────────────────────────────────────────────────────
;;; HPE Smart Storage Administrator CLI
;;; AUR: ssacli-bin  →  Guix: ssacli-bin
;;; Upstream: HPE Support
;;;
(define-public ssacli-bin
  (package
    (name "ssacli-bin")
    (version "6.40.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.linux.hpe.com/SDR/repo/mcp/pool/"
             "non-free/ssacli-" version "-1.x86_64.rpm"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/ssacli/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.hpe.com/us/en/servers/smart-array.html")
    (synopsis "HPE Smart Storage Administrator CLI")
    (description "SSACLI is the HPE Smart Storage Administrator Command
Line Interface for managing HPE Smart Array controllers and storage
devices from the command line.")
    (license (license:non-copyleft
              "https://www.hpe.com/us/en/software/licensing.html"
              "HPE License"))))

;;; ── breitbandmessung-bin ────────────────────────────────────────────
;;; German broadband measurement desktop app
;;; AUR: breitbandmessung-bin  →  Guix: breitbandmessung-bin
;;; Upstream: https://breitbandmessung.de/desktop-app
;;;
(define-public breitbandmessung-bin
  (package
    (name "breitbandmessung-bin")
    (version "3.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.breitbandmessung.de/bbm/Breitbandmessung-"
             version "-linux.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/breitbandmessung/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://breitbandmessung.de/desktop-app")
    (synopsis "German broadband speed measurement app")
    (description "Breitbandmessung Desktop-App is the official German Federal
Network Agency (Bundesnetzagentur) broadband speed measurement tool.  It
performs standardized speed tests for documenting internet connection
performance.")
    (license (license:non-copyleft
              "https://breitbandmessung.de"
              "zafaco GmbH proprietary license"))))
