;;; deptree-resolver-260413h.scm — Dependency-tree priority resolver
;;; Generated: 2026-04-13T14:12:32.559381+00:00
;;; Run ID: deptree-resolver-260413h
;;; Total: 100 packages (22 recipes, 78 blocked)
;;;
;;; Recipes (22):
;;;   hyperfluent-grub-theme-arch
;;;   nautilus-megasync
;;;   ninjarmm-ncplayer
;;;   kernel-install-for-dracut
;;;   bcompare-cinnamon
;;;   bcompare-kde4
;;;   bcompare-kde6
;;;   bcompare-mate
;;;   bcompare-nautilus
;;;   bcompare-thunar
;;;   brogue-ce
;;;   btrfsmaintenance-git
;;;   caido-desktop
;;;   cask
;;;   catppuccin-konsole-colorscheme-frappe-git
;;;   catppuccin-konsole-colorscheme-latte-git
;;;   catppuccin-konsole-colorscheme-macchiato-git
;;;   catppuccin-konsole-colorscheme-mocha-git
;;;   cecil-bin
;;;   certradar-cli-bin
;;;   climp-bin
;;;   cmake-modules-webos-git
;;;
;;; Blocked (78):
;;;   nvidia-utils-beta [NEEDS_RECIPE_DESIGN]
;;;   python-opentelemetry-exporter-otlp-proto-common [NEEDS_RECIPE_DESIGN]
;;;   sonic-win [NEEDS_RECIPE_DESIGN]
;;;   lib32-xrizer [NEEDS_RECIPE_DESIGN]
;;;   plasma-workspace-povd [NEEDS_RECIPE_DESIGN]
;;;   lib32-l-smash [NEEDS_RECIPE_DESIGN]
;;;   new-lg4ff-dkms-git [DKMS_KERNEL_MODULE]
;;;   lib32-libudev0-shim [NEEDS_RECIPE_DESIGN]
;;;   hid-fanatecff-dkms [DKMS_KERNEL_MODULE]
;;;   yabridgectl-wine10-git [NEEDS_RECIPE_DESIGN]
;;;   linux-cachyos-lts [DKMS_KERNEL_MODULE]
;;;   python-opentelemetry-exporter-zipkin-proto-http [NEEDS_RECIPE_DESIGN]
;;;   linux-cachyos [DKMS_KERNEL_MODULE]
;;;   linux-cachyos-rc [DKMS_KERNEL_MODULE]
;;;   qt6-base-hifps [NEEDS_RECIPE_DESIGN]
;;;   anbox-git [SOURCE_UNAVAILABLE]
;;;   chromium-gost [NEEDS_RECIPE_DESIGN]
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
;;;   pac-pacman-aliases [ARCH_SPECIFIC]
;;;   pacman-log-orphans-hook [ARCH_SPECIFIC]
;;;   pipewire-enable-bluez5 [ARCH_SPECIFIC]
;;;   projtlauncher [SOURCE_UNAVAILABLE]
;;;   shimmy-bin [SOURCE_UNAVAILABLE]
;;;   subs2srs-git [SOURCE_UNAVAILABLE]
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
;;;   vivaldi-ffmpeg-codecs [SOURCE_UNAVAILABLE]
;;;   whatsapp-for-linux [SOURCE_UNAVAILABLE]
;;;   zettlr [SOURCE_UNAVAILABLE]
;;;   ancient-packages [ARCH_SPECIFIC]
;;;   binder_linux-dkms [DKMS_KERNEL_MODULE]
;;;   keychron-q3-max-udev [NEEDS_RECIPE_DESIGN]
;;;   lib32-libtxc_dxtn [NEEDS_RECIPE_DESIGN]
;;;   lib32-zix [NEEDS_RECIPE_DESIGN]
;;;   linux-zen-versioned-docs-bin [NEEDS_RECIPE_DESIGN]
;;;   linux-zen-versioned-headers-bin [NEEDS_RECIPE_DESIGN]
;;;   localepurge-hook [ARCH_SPECIFIC]
;;;   mandb-instant-update [ARCH_SPECIFIC]
;;;   mkinitcpio-sd-numlock [NEEDS_RECIPE_DESIGN]
;;;   oopz [NEEDS_RECIPE_DESIGN]
;;;   paccache-hook [ARCH_SPECIFIC]
;;;   systemd-boot-pacman-hook [ARCH_SPECIFIC]
;;;   yaycache-hook [ARCH_SPECIFIC]
;;;   youtube-music-desktop [NEEDS_RECIPE_DESIGN]
;;;   amneziawg-dkms [DKMS_KERNEL_MODULE]
;;;   arch-gdm-theme-list [ARCH_SPECIFIC]
;;;   brother-cups-wrapper-common [NEEDS_RECIPE_DESIGN]
;;;   brother-mfc-l2710dw [NEEDS_RECIPE_DESIGN]
;;;   ccase [NEEDS_RECIPE_DESIGN]
;;;   ccusage [NEEDS_RECIPE_DESIGN]
;;;   checkupdates-notify [ARCH_SPECIFIC]
;;;   claude-agent-acp [NEEDS_RECIPE_DESIGN]
;;;   critique [NEEDS_RECIPE_DESIGN]
;;;   csharpier [NEEDS_RECIPE_DESIGN]
;;;   cutieascii [NEEDS_RECIPE_DESIGN]
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260413h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            hyperfluent-grub-theme-arch
            nautilus-megasync
            ninjarmm-ncplayer
            kernel-install-for-dracut
            bcompare-cinnamon
            bcompare-kde4
            bcompare-kde6
            bcompare-mate
            bcompare-nautilus
            bcompare-thunar
            brogue-ce
            btrfsmaintenance-git
            caido-desktop
            cask
            catppuccin-konsole-colorscheme-frappe-git
            catppuccin-konsole-colorscheme-latte-git
            catppuccin-konsole-colorscheme-macchiato-git
            catppuccin-konsole-colorscheme-mocha-git
            cecil-bin
            certradar-cli-bin
            climp-bin
            cmake-modules-webos-git
            ))

;;; ── hyperfluent-grub-theme-arch (#12184) ──
;;; GRUB theme with Arch Linux branding; simple file install

(define-public hyperfluent-grub-theme-arch
  (package
    (name "hyperfluent-grub-theme-arch")
    (version "1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Coopydood/HyperFluent-GRUB-Theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("arch" "share/grub/themes/hyperfluent-arch/"))))
    (home-page "https://github.com/Coopydood/HyperFluent-GRUB-Theme")
    (synopsis "HyperFluent GRUB theme with Arch Linux branding")
    (description "A modern, clean GRUB bootloader theme with Arch Linux
branding.  Part of the HyperFluent GRUB theme collection.")
    (license license:expat)))

;;; ── nautilus-megasync (#9392) ──
;;; Nautilus extension for MEGA cloud sync; file manager integration

(define-public nautilus-megasync
  (package
    (name "nautilus-megasync")
    (version "6.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://mega.nz/linux/repo/Arch_Extra/x86_64/"
                    "nautilus-megasync-" version "-1-x86_64.pkg.tar.zst"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "tar" "xf" (assoc-ref inputs "source")
                           "--use-compress-program=unzstd"))))))
    (native-inputs (list (@ (gnu packages compression) zstd)))
    (home-page "https://mega.io/desktop#downloadapps")
    (synopsis "MEGA cloud storage extension for Nautilus file manager")
    (description "Nautilus file manager extension that integrates MEGA cloud
storage.  Allows uploading files to your MEGA account directly from the
Nautilus context menu.")
    (license license:clarified-artistic)))

;;; ── ninjarmm-ncplayer (#7498) ──
;;; NinjaOne remote access binary

(define-public ninjarmm-ncplayer
  (package
    (name "ninjarmm-ncplayer")
    (version "12.35.8100")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://app.ninjarmm.com/agent/installer/"
                    version "/ninjarmm-ncplayer-" version "-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/ninjarmm/"))))
    (home-page "https://www.ninjaone.com")
    (synopsis "NinjaOne remote access client for Linux endpoints")
    (description "Remote access client for NinjaOne (formerly NinjaRMM).
Enables single-click remote control of Linux endpoints from the NinjaOne
management console.")
    (license license:expat)))

;;; ── kernel-install-for-dracut (#12117) ──
;;; Shell scripts for systemd-boot + dracut automation

(define-public kernel-install-for-dracut
  (package
    (name "kernel-install-for-dracut")
    (version "1.14.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/dalto.8/kernel-install-for-dracut")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kernel-install-for-dracut" "bin/kernel-install-for-dracut"))))
    (home-page "https://gitlab.com/dalto.8/kernel-install-for-dracut")
    (synopsis "systemd-boot automation using kernel-install with dracut")
    (description "Enables systemd-boot automation using kernel-install with
dracut.  Provides scripts for automatic kernel image and initramfs management
when installing or removing kernels.")
    (license license:gpl2)))

;;; ── bcompare-cinnamon (#1980) ──
;;; Beyond Compare 5 service menus for Cinnamon desktop

(define-public bcompare-cinnamon
  (package
    (name "bcompare-cinnamon")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.scootersoftware.com/files/bcompare-"
                    version ".x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nemo/actions/" #:include-regexp ("bcompare.*\\.nemo_action$")))))
    (home-page "https://www.scootersoftware.com")
    (synopsis "Cinnamon/Nemo service menus for Beyond Compare 5")
    (description "Cinnamon desktop environment service menus that add Beyond
Compare 5 file comparison options to the Nemo file manager context menu.")
    (license license:expat)))

;;; ── bcompare-kde4 (#1977) ──
;;; Beyond Compare 5 service menus for KDE 4

(define-public bcompare-kde4
  (package
    (name "bcompare-kde4")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.scootersoftware.com/files/bcompare-"
                    version ".x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kde4/services/ServiceMenus/"
                #:include-regexp ("bcompare.*\\.desktop$")))))
    (home-page "https://www.scootersoftware.com")
    (synopsis "KDE 4 service menus for Beyond Compare 5")
    (description "KDE 4 service menus that add Beyond Compare 5 file
comparison options to the Dolphin file manager context menu.")
    (license license:expat)))

;;; ── bcompare-kde6 (#1975) ──
;;; Beyond Compare 5 service menus for KDE Plasma 6

(define-public bcompare-kde6
  (package
    (name "bcompare-kde6")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.scootersoftware.com/files/bcompare-"
                    version ".x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kio/servicemenus/"
                #:include-regexp ("bcompare.*\\.desktop$")))))
    (home-page "https://www.scootersoftware.com")
    (synopsis "KDE Plasma 6 service menus for Beyond Compare 5")
    (description "KDE Plasma 6 service menus that add Beyond Compare 5 file
comparison options to the Dolphin file manager context menu.")
    (license license:expat)))

;;; ── bcompare-mate (#1981) ──
;;; Beyond Compare 5 service menus for MATE desktop

(define-public bcompare-mate
  (package
    (name "bcompare-mate")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.scootersoftware.com/files/bcompare-"
                    version ".x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/caja/extensions/"
                #:include-regexp ("bcompare.*\\.py$")))))
    (home-page "https://www.scootersoftware.com")
    (synopsis "MATE/Caja service menus for Beyond Compare 5")
    (description "MATE desktop environment service menus that add Beyond
Compare 5 file comparison options to the Caja file manager context menu.")
    (license license:expat)))

;;; ── bcompare-nautilus (#1978) ──
;;; Beyond Compare 5 service menus for GNOME/Nautilus

(define-public bcompare-nautilus
  (package
    (name "bcompare-nautilus")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.scootersoftware.com/files/bcompare-"
                    version ".x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/nautilus/extensions-4/"
                #:include-regexp ("bcompare.*\\.py$")))))
    (home-page "https://www.scootersoftware.com")
    (synopsis "GNOME/Nautilus extension for Beyond Compare 5")
    (description "GNOME Nautilus file manager extension that adds Beyond
Compare 5 file comparison options to the right-click context menu.")
    (license license:expat)))

;;; ── bcompare-thunar (#1979) ──
;;; Beyond Compare 5 service menus for Xfce/Thunar

(define-public bcompare-thunar
  (package
    (name "bcompare-thunar")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.scootersoftware.com/files/bcompare-"
                    version ".x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/thunarx-3/"
                #:include-regexp ("bcompare.*\\.py$")))))
    (home-page "https://www.scootersoftware.com")
    (synopsis "Xfce/Thunar custom actions for Beyond Compare 5")
    (description "Xfce Thunar file manager custom actions that add Beyond
Compare 5 file comparison options to the right-click context menu.")
    (license license:expat)))

;;; ── brogue-ce (#1077) ──
;;; Brogue Community Edition roguelike game; uses make with SDL2

(define-public brogue-ce
  (package
    (name "brogue-ce")
    (version "1.15.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tmewett/BrogueCE")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tmewett/BrogueCE")
    (synopsis "Brogue Community Edition roguelike dungeon crawler")
    (description "Brogue Community Edition is a community-maintained fork of
Brogue, a 26-level dungeon crawl roguelike game.  Features include procedural
dungeon generation, tactical combat, and a minimalist interface.")
    (license license:agpl3)))

;;; ── btrfsmaintenance-git (#2953) ──
;;; Btrfs maintenance shell scripts; simple file install from git

(define-public btrfsmaintenance-git
  (package
    (name "btrfsmaintenance-git")
    (version "0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kdave/btrfsmaintenance")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("btrfs-balance.sh" "bin/btrfs-balance")
                ("btrfs-defrag.sh" "bin/btrfs-defrag")
                ("btrfs-scrub.sh" "bin/btrfs-scrub")
                ("btrfs-trim.sh" "bin/btrfs-trim")
                ("btrfsmaintenance-functions" "share/btrfsmaintenance/btrfsmaintenance-functions")
                ("sysconfig.btrfsmaintenance" "etc/default/btrfsmaintenance"))))
    (home-page "https://github.com/kdave/btrfsmaintenance")
    (synopsis "scripts for btrfs filesystem maintenance tasks")
    (description "Collection of shell scripts for automated btrfs filesystem
maintenance.  Includes scripts for balance, defrag, scrub, and trim
operations, suitable for cron or systemd timer scheduling.")
    (license license:gpl2+)))

;;; ── caido-desktop (#11189) ──
;;; Caido web security auditing toolkit; proprietary binary

(define-public caido-desktop
  (package
    (name "caido-desktop")
    (version "0.55.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://caido.download/releases/v" version
                    "/caido-desktop-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("caido-desktop" "bin/caido-desktop"))))
    (home-page "https://caido.io/")
    (synopsis "lightweight web security auditing toolkit")
    (description "Caido is a lightweight web security auditing toolkit
designed for penetration testers and security researchers.  Provides HTTP
proxy, request repeater, and automated testing capabilities.")
    (license license:expat)))

;;; ── cask (#10070) ──
;;; Emacs project management tool; Elisp + Python scripts

(define-public cask
  (package
    (name "cask")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cask/cask")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/cask" "bin/cask")
                ("cask.el" "share/emacs/site-lisp/cask/cask.el")
                ("cask-bootstrap.el" "share/emacs/site-lisp/cask/cask-bootstrap.el")
                ("package-build" "share/emacs/site-lisp/cask/package-build/"))))
    (home-page "https://github.com/cask/cask")
    (synopsis "project management tool for Emacs Lisp")
    (description "Cask is a project management tool for Emacs that helps
manage dependencies for Emacs Lisp projects.  Similar to Bundler for Ruby
or Cargo for Rust, it provides reproducible development environments for
Emacs packages.")
    (license license:gpl3+)))

;;; ── catppuccin-konsole-colorscheme-frappe-git (#9217) ──
;;; Catppuccin Frappe color scheme for Konsole terminal

(define-public catppuccin-konsole-colorscheme-frappe-git
  (package
    (name "catppuccin-konsole-colorscheme-frappe-git")
    (version "r30.3b64040")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/konsole")
                    (commit "3b64040")))
              (file-name (git-file-name "catppuccin-konsole" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Catppuccin-Frappe.colorscheme"
                "share/konsole/Catppuccin-Frappe.colorscheme"))))
    (home-page "https://github.com/catppuccin/konsole")
    (synopsis "Catppuccin Frappe color scheme for Konsole")
    (description "Soothing pastel Catppuccin Frappe color scheme for the KDE
Konsole terminal emulator.  Part of the Catppuccin theme project.")
    (license license:expat)))

;;; ── catppuccin-konsole-colorscheme-latte-git (#9216) ──
;;; Catppuccin Latte color scheme for Konsole terminal

(define-public catppuccin-konsole-colorscheme-latte-git
  (package
    (name "catppuccin-konsole-colorscheme-latte-git")
    (version "r30.3b64040")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/konsole")
                    (commit "3b64040")))
              (file-name (git-file-name "catppuccin-konsole" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Catppuccin-Latte.colorscheme"
                "share/konsole/Catppuccin-Latte.colorscheme"))))
    (home-page "https://github.com/catppuccin/konsole")
    (synopsis "Catppuccin Latte color scheme for Konsole")
    (description "Soothing pastel Catppuccin Latte color scheme for the KDE
Konsole terminal emulator.  Part of the Catppuccin theme project.")
    (license license:expat)))

;;; ── catppuccin-konsole-colorscheme-macchiato-git (#9218) ──
;;; Catppuccin Macchiato color scheme for Konsole terminal

(define-public catppuccin-konsole-colorscheme-macchiato-git
  (package
    (name "catppuccin-konsole-colorscheme-macchiato-git")
    (version "r30.3b64040")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/konsole")
                    (commit "3b64040")))
              (file-name (git-file-name "catppuccin-konsole" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Catppuccin-Macchiato.colorscheme"
                "share/konsole/Catppuccin-Macchiato.colorscheme"))))
    (home-page "https://github.com/catppuccin/konsole")
    (synopsis "Catppuccin Macchiato color scheme for Konsole")
    (description "Soothing pastel Catppuccin Macchiato color scheme for the
KDE Konsole terminal emulator.  Part of the Catppuccin theme project.")
    (license license:expat)))

;;; ── catppuccin-konsole-colorscheme-mocha-git (#9219) ──
;;; Catppuccin Mocha color scheme for Konsole terminal

(define-public catppuccin-konsole-colorscheme-mocha-git
  (package
    (name "catppuccin-konsole-colorscheme-mocha-git")
    (version "r30.3b64040")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/konsole")
                    (commit "3b64040")))
              (file-name (git-file-name "catppuccin-konsole" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Catppuccin-Mocha.colorscheme"
                "share/konsole/Catppuccin-Mocha.colorscheme"))))
    (home-page "https://github.com/catppuccin/konsole")
    (synopsis "Catppuccin Mocha color scheme for Konsole")
    (description "Soothing pastel Catppuccin Mocha color scheme for the KDE
Konsole terminal emulator.  Part of the Catppuccin theme project.")
    (license license:expat)))

;;; ── cecil-bin (#10297) ──
;;; Cecil static site generator; PHP-based binary (phar)

(define-public cecil-bin
  (package
    (name "cecil-bin")
    (version "8.88.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Cecilapp/Cecil/releases/download/"
                    version "/cecil.phar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cecil.phar" "bin/cecil"))))
    (home-page "https://cecil.app/")
    (synopsis "PHP-based static site generator")
    (description "Cecil is a static site generator written in PHP.  Transforms
Markdown content into a fast, secure static website.  Distributed as a
standalone phar archive.")
    (license license:expat)))

;;; ── certradar-cli-bin (#1427) ──
;;; Certificate transparency search CLI; prebuilt binary

(define-public certradar-cli-bin
  (package
    (name "certradar-cli-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FlerAlex/certradar-cli/releases/download/v"
                    version "/certradar-cli-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("certradar-cli-linux-amd64" "bin/certradar-cli"))))
    (home-page "https://github.com/FlerAlex/certradar-cli")
    (synopsis "certificate transparency search and SSL/TLS analysis CLI")
    (description "CertRadar CLI is a tool for searching certificate
transparency logs and analyzing SSL/TLS certificate security.  Helps identify
certificates issued for specific domains and detect potential misuse.")
    (license license:expat)))

;;; ── climp-bin (#1424) ──
;;; CLI media player; prebuilt binary

(define-public climp-bin
  (package
    (name "climp-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/olivier-w/climp/releases/download/v"
                    version "/climp-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("climp" "bin/climp"))))
    (home-page "https://github.com/olivier-w/climp")
    (synopsis "command-line media player for audio files")
    (description "Climp is a lightweight command-line media player for audio
files.  Provides a simple terminal interface for playing music without a
graphical environment.")
    (license license:asl2.0)))

;;; ── cmake-modules-webos-git (#1065) ──
;;; CMake modules for Open webOS; simple module file install

(define-public cmake-modules-webos-git
  (package
    (name "cmake-modules-webos-git")
    (version "20260210")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openwebos/cmake-modules-webos")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/openwebos/cmake-modules-webos")
    (synopsis "CMake modules for building Open webOS components")
    (description "CMake module files needed to build Open webOS components.
Provides Find modules and utility macros for the Open webOS build system.")
    (license license:asl2.0)))
