;;; Queue drain 2026-03-29 daily run (100 entries).
;;; Selected TODO entries prioritized by AUR popularity/votes.
;;; Status: 100 NEEDS_RECIPE_DESIGN stubs with concrete next actions.
(define-module (gaurix packages queue-20260329p100)
  #:use-module (guix packages)
  #:use-module (gnu packages rust-apps)
  #:export (
            yay
            paru
            aur-sync-vote
            brave-bin
            zen-browser-bin
            nvidia-580xx-utils
            opencl-nvidia-580xx
            nvidia-580xx-dkms
            antigravity
            google-chrome
            helium-browser-bin
            ventoy-bin
            octopi
            betterbird-bin
            heroic-games-launcher-bin
            noctalia-shell
            hytale-launcher-bin
            downgrade
            vscodium-bin
            appimagelauncher
            dms-shell-bin
            yay-bin
            spotify
            millennium
            millennium-debug
            qt-sudo
            zoom
            claude-code
            rustdesk-bin
            ttf-ms-fonts
            vesktop-bin
            mullvad-vpn-bin
            mullvad-vpn-daemon-bin
            lib32-nvidia-580xx-utils
            lib32-opencl-nvidia-580xx
            arch-update
            opencode-bin
            openssl-1.1
            winboat-bin
            nvidia-580xx-settings
            libxnvctrl-580xx
            aurvote-utils
            localsend
            aurutils
            onlyoffice-bin
            systemd-liberated-git
            systemd-liberated-libs-git
            systemd-liberated-resolvconf-git
            systemd-liberated-sysvcompat-git
            systemd-liberated-tests-git
            systemd-liberated-ukify-git
            vmware-workstation
            zapzap
            mullvad-browser-bin
            jellyfin-desktop
            vesktop
            electron40-bin
            jetbrains-toolbox
            prefixer
            polychromatic
            freetube-bin
            fresh-editor-bin
            noctalia-qs
            zotero-bin
            ttf-ms-win11-auto
            ttf-ms-win11-auto-japanese
            ttf-ms-win11-auto-korean
            ttf-ms-win11-auto-sea
            ttf-ms-win11-auto-thai
            ttf-ms-win11-auto-zh_cn
            ttf-ms-win11-auto-zh_tw
            ttf-ms-win11-auto-other
            bottles
            proton-pass-bin
            cursor-bin
            faugus-launcher
            android-studio
            minecraft-launcher
            arduino-ide-bin
            rustdesk
            paru-bin
            anytype-bin
            traur
            floorp-bin
            pinta
            informant
            plasmazones-bin
            xnviewmp
            spicetify-cli
            voxtype
            davinci-resolve
            protonup-qt
            freefilesync
            freesmlauncher
            yandex-music
            steamcmd
            slack-desktop
            mangowm
            rider
            mediatek-mt7927-dkms
            ))

;;; ── NEEDS_RECIPE_DESIGN stubs ────────────────────────────────────────

(define-public yay
  ;; AUR yay: Yet another yogurt. Pacman wrapper and AUR helper written in go.; 12.5.7-1; 2537 votes.
  ;; Source: https://github.com/Jguer/yay
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "yay")))

(define-public paru
  ;; AUR paru: Feature packed AUR helper; 2.1.0-2; 1172 votes.
  ;; Source: https://github.com/morganamilo/paru
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "paru")))

(define-public aur-sync-vote
  ;; AUR aur-sync-vote: Syncing votes with the currently installed AUR packages; 0.2.3-1; 58 votes.
  ;; Source: https://github.com/acaibowlz/aur-sync-vote
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "aur-sync-vote")))

(define-public brave-bin
  ;; AUR brave-bin: Web browser that blocks ads and trackers by default (binary release); 1:1.88.136-1; 977 votes.
  ;; Source: https://brave.com
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "brave-bin")))

(define-public zen-browser-bin
  ;; AUR zen-browser-bin: Performance oriented Firefox-based web browser; 1.19.3b-1; 281 votes.
  ;; Source: https://github.com/zen-browser/desktop
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "zen-browser-bin")))

(define-public nvidia-580xx-utils
  ;; AUR nvidia-580xx-utils: NVIDIA drivers utilities (580xx); 580.142-2; 63 votes.
  ;; Source: http://www.nvidia.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "nvidia-580xx-utils")))

(define-public opencl-nvidia-580xx
  ;; AUR opencl-nvidia-580xx: OpenCL implemention for NVIDIA (580xx); 580.142-2; 63 votes.
  ;; Source: http://www.nvidia.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "opencl-nvidia-580xx")))

(define-public nvidia-580xx-dkms
  ;; AUR nvidia-580xx-dkms: NVIDIA kernel modules - module sources (580xx); 580.142-2; 63 votes.
  ;; Source: http://www.nvidia.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "nvidia-580xx-dkms")))

(define-public antigravity
  ;; AUR antigravity: An agentic development platform from Google, evolving the IDE into the agent-first era.; 1.20.6-2; 58 votes.
  ;; Source: https://antigravity.google/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "antigravity")))

(define-public google-chrome
  ;; AUR google-chrome: The popular web browser by Google (Stable Channel); 146.0.7680.164-1; 2336 votes.
  ;; Source: https://www.google.com/chrome
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "google-chrome")))

(define-public helium-browser-bin
  ;; AUR helium-browser-bin: Private, fast, and honest web browser based on Chromium (Latest/Stable); 0.10.6.1-1; 56 votes.
  ;; Source: https://github.com/imputnet/helium-linux
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "helium-browser-bin")))

(define-public ventoy-bin
  ;; AUR ventoy-bin: A new bootable USB solution; 1.1.10-3; 434 votes.
  ;; Source: http://www.ventoy.net
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ventoy-bin")))

(define-public octopi
  ;; AUR octopi: A powerful Pacman frontend using Qt libs; 0.18.1-1; 1921 votes.
  ;; Source: https://github.com/aarnt/octopi
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "octopi")))

(define-public betterbird-bin
  ;; AUR betterbird-bin: EN-US // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will.; 140.9.0esr-1; 278 votes.
  ;; Source: https://www.betterbird.eu/index.html
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "betterbird-bin")))

(define-public heroic-games-launcher-bin
  ;; AUR heroic-games-launcher-bin: An Open source Launcher for Epic, Amazon and GOG Games; 2.20.1-1; 267 votes.
  ;; Source: https://heroicgameslauncher.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "heroic-games-launcher-bin")))

(define-public noctalia-shell
  ;; AUR noctalia-shell: A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell.; 4.7.1-1; 32 votes.
  ;; Source: https://github.com/noctalia-dev/noctalia-shell
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "noctalia-shell")))

(define-public hytale-launcher-bin
  ;; AUR hytale-launcher-bin: Hytale Launcher (Native Linux, Self-Updating) [2026.03.24-a65f18c]; 2026.03.24-1; 27 votes.
  ;; Source: https://hytale.com
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "hytale-launcher-bin")))

(define-public downgrade
  ;; AUR downgrade: Bash script for downgrading one or more packages to a version in your cache or the A.L.A.; 12.0.1-1; 878 votes.
  ;; Source: https://github.com/archlinux-downgrade/downgrade
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "downgrade")))

(define-public vscodium-bin
  ;; AUR vscodium-bin: Binary releases of VS Code without MS branding/telemetry/licensing.; 1.112.01907-1; 370 votes.
  ;; Source: https://github.com/VSCodium/vscodium
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "vscodium-bin")))

(define-public appimagelauncher
  ;; AUR appimagelauncher: Helper for running and integrating AppImages; 3.0.0_beta_3-1; 134 votes.
  ;; Source: https://github.com/TheAssassin/AppImageLauncher
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "appimagelauncher")))

(define-public dms-shell-bin
  ;; AUR dms-shell-bin: Desktop shell for wayland compositors built with Quickshell & GO; 1.4.4-1; 26 votes.
  ;; Source: https://github.com/AvengeMedia/DankMaterialShell
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "dms-shell-bin")))

(define-public yay-bin
  ;; AUR yay-bin: Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled.; 12.5.7-1; 354 votes.
  ;; Source: https://github.com/Jguer/yay
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "yay-bin")))

(define-public spotify
  ;; AUR spotify: A proprietary music streaming service; 1:1.2.84.476-1; 253 votes.
  ;; Source: https://www.spotify.com
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "spotify")))

(define-public millennium
  ;; AUR millennium: Open-source modding framework for creating and managing Steam Client themes and plugins; 3.0.0_beta.16-1; 21 votes.
  ;; Source: https://github.com/SteamClientHomebrew/Millennium
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "millennium")))

(define-public millennium-debug
  ;; AUR millennium-debug: Debug symbols for Millennium; 3.0.0_beta.16-1; 21 votes.
  ;; Source: https://github.com/SteamClientHomebrew/Millennium
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "millennium-debug")))

(define-public qt-sudo
  ;; AUR qt-sudo: A clone of LXQt sudo tool, without LXQt libs; 2.3.0-1; 512 votes.
  ;; Source: https://github.com/aarnt/qt-sudo.git
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "qt-sudo")))

(define-public zoom
  ;; AUR zoom: Video Conferencing and Web Conferencing Service; 6.7.5-1; 723 votes.
  ;; Source: https://zoom.us/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "zoom")))

(define-public claude-code
  ;; AUR claude-code: An agentic coding tool that lives in your terminal; 2.1.81-1; 41 votes.
  ;; Source: https://github.com/anthropics/claude-code
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "claude-code")))

(define-public rustdesk-bin
  ;; AUR rustdesk-bin: Yet another remote desktop software, written in Rust. Works out of the box, no configuration required.; 1.4.6-1; 148 votes.
  ;; Source: https://github.com/rustdesk/rustdesk
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "rustdesk-bin")))

(define-public ttf-ms-fonts
  ;; AUR ttf-ms-fonts: Core TTF Fonts from Microsoft; 2.0-12; 2170 votes.
  ;; Source: http://corefonts.sourceforge.net
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-fonts")))

(define-public vesktop-bin
  ;; AUR vesktop-bin: A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed.(Prebuilt version.Use system-wide electron); 1.6.5-1; 142 votes.
  ;; Source: https://github.com/Vencord/Vesktop
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "vesktop-bin")))

(define-public mullvad-vpn-bin
  ;; AUR mullvad-vpn-bin: The Mullvad VPN client app for desktop (desktop application); 2026.1-1; 160 votes.
  ;; Source: https://www.mullvad.net
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "mullvad-vpn-bin")))

(define-public mullvad-vpn-daemon-bin
  ;; AUR mullvad-vpn-daemon-bin: The Mullvad VPN client app for desktop (daemon and CLI); 2026.1-1; 160 votes.
  ;; Source: https://www.mullvad.net
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "mullvad-vpn-daemon-bin")))

(define-public lib32-nvidia-580xx-utils
  ;; AUR lib32-nvidia-580xx-utils: NVIDIA drivers utilities (32-bit) (580xx); 580.142-1; 25 votes.
  ;; Source: http://www.nvidia.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "lib32-nvidia-580xx-utils")))

(define-public lib32-opencl-nvidia-580xx
  ;; AUR lib32-opencl-nvidia-580xx: OpenCL implemention for NVIDIA (32-bit) (580xx); 580.142-1; 25 votes.
  ;; Source: http://www.nvidia.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "lib32-opencl-nvidia-580xx")))

(define-public arch-update
  ;; AUR arch-update: An interactive update notifier & applier that assists you with important pre / post update tasks; 3.18.1-1; 44 votes.
  ;; Source: https://github.com/Antiz96/arch-update
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "arch-update")))

(define-public opencode-bin
  ;; AUR opencode-bin: The AI coding agent built for the terminal.; 1.3.2-1; 37 votes.
  ;; Source: https://github.com/anomalyco/opencode
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "opencode-bin")))

(define-public openssl-1.1
  ;; AUR openssl-1.1: The Open Source toolkit for Secure Sockets Layer and Transport Layer Security; 1.1.1.w-9; 13 votes.
  ;; Source: https://www.openssl.org
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "openssl-1.1")))

(define-public winboat-bin
  ;; AUR winboat-bin: Run Windows apps on Linux with seamless integration; 0.9.0-1; 27 votes.
  ;; Source: https://www.winboat.app
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "winboat-bin")))

(define-public nvidia-580xx-settings
  ;; AUR nvidia-580xx-settings: Tool for configuring the NVIDIA graphics driver (580xx); 580.142-1; 20 votes.
  ;; Source: https://github.com/NVIDIA/nvidia-settings
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "nvidia-580xx-settings")))

(define-public libxnvctrl-580xx
  ;; AUR libxnvctrl-580xx: NVIDIA NV-CONTROL X extension (580xx); 580.142-1; 20 votes.
  ;; Source: https://github.com/NVIDIA/nvidia-settings
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "libxnvctrl-580xx")))

(define-public aurvote-utils
  ;; AUR aurvote-utils: A set of utilities for managing AUR votes; 1.2.0-1; 61 votes.
  ;; Source: https://github.com/gwuen/aurvote-utils
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "aurvote-utils")))

(define-public localsend
  ;; AUR localsend: An open source cross-platform alternative to AirDrop; 1.17.0-3; 40 votes.
  ;; Source: https://github.com/localsend/localsend
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "localsend")))

(define-public aurutils
  ;; AUR aurutils: helper tools for the arch user repository; 20.5.8-1; 298 votes.
  ;; Source: https://github.com/AladW/aurutils
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "aurutils")))

(define-public onlyoffice-bin
  ;; AUR onlyoffice-bin: An office suite that combines text, spreadsheet and presentation editors; 9.3.1-1; 287 votes.
  ;; Source: https://www.onlyoffice.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "onlyoffice-bin")))

(define-public systemd-liberated-git
  ;; AUR systemd-liberated-git: system and service manager — liberated fork (no surveillance, git version); 261.r87283-1; 6 votes.
  ;; Source: https://github.com/Jeffrey-Sardina/systemd
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "systemd-liberated-git")))

(define-public systemd-liberated-libs-git
  ;; AUR systemd-liberated-libs-git: systemd client libraries — liberated fork (git version); 261.r87283-1; 6 votes.
  ;; Source: https://github.com/Jeffrey-Sardina/systemd
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "systemd-liberated-libs-git")))

(define-public systemd-liberated-resolvconf-git
  ;; AUR systemd-liberated-resolvconf-git: systemd resolvconf replacement — liberated fork (git version); 261.r87283-1; 6 votes.
  ;; Source: https://github.com/Jeffrey-Sardina/systemd
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "systemd-liberated-resolvconf-git")))

(define-public systemd-liberated-sysvcompat-git
  ;; AUR systemd-liberated-sysvcompat-git: sysvinit compat for systemd — liberated fork (git version); 261.r87283-1; 6 votes.
  ;; Source: https://github.com/Jeffrey-Sardina/systemd
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "systemd-liberated-sysvcompat-git")))

(define-public systemd-liberated-tests-git
  ;; AUR systemd-liberated-tests-git: systemd tests — liberated fork (git version); 261.r87283-1; 6 votes.
  ;; Source: https://github.com/Jeffrey-Sardina/systemd
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "systemd-liberated-tests-git")))

(define-public systemd-liberated-ukify-git
  ;; AUR systemd-liberated-ukify-git: Combine kernel and initrd into a signed UKI — liberated fork (git version); 261.r87283-1; 6 votes.
  ;; Source: https://github.com/Jeffrey-Sardina/systemd
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "systemd-liberated-ukify-git")))

(define-public vmware-workstation
  ;; AUR vmware-workstation: The industry standard for running multiple operating systems as virtual machines on a single Linux PC.; 25H2u1-1; 241 votes.
  ;; Source: https://www.vmware.com/products/workstation-for-linux.html
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "vmware-workstation")))

(define-public zapzap
  ;; AUR zapzap: WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine; 6.3.4.1-1; 64 votes.
  ;; Source: https://github.com/rafatosta/zapzap
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "zapzap")))

(define-public mullvad-browser-bin
  ;; AUR mullvad-browser-bin: Privacy-focused web browser developed by Mullvad VPN and the Tor Project; 15.0.7-1; 72 votes.
  ;; Source: https://mullvad.net/en/browser
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "mullvad-browser-bin")))

(define-public jellyfin-desktop
  ;; AUR jellyfin-desktop: Jellyfin Desktop Client; 2.0.0-2; 106 votes.
  ;; Source: https://github.com/jellyfin/jellyfin-desktop
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "jellyfin-desktop")))

(define-public vesktop
  ;; AUR vesktop: A standalone Electron-based Discord app with Vencord & improved Linux support; 1.6.5-1; 81 votes.
  ;; Source: https://github.com/Vencord/Vesktop
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "vesktop")))

(define-public electron40-bin
  ;; AUR electron40-bin: Build cross platform desktop apps with web technologies — prebuilt; 40.8.3-1; 7 votes.
  ;; Source: https://electronjs.org
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "electron40-bin")))

(define-public jetbrains-toolbox
  ;; AUR jetbrains-toolbox: Manage all your JetBrains Projects and Tools; 3.4.0.77112-1; 198 votes.
  ;; Source: https://www.jetbrains.com/toolbox/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "jetbrains-toolbox")))

(define-public prefixer
  ;; AUR prefixer: Modern Proton Prefix management tool; 1.4.1-2; 11 votes.
  ;; Source: https://github.com/wojtmic/prefixer
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "prefixer")))

(define-public polychromatic
  ;; AUR polychromatic: RGB lighting management front-end application for OpenRazer; 0.9.6-1; 61 votes.
  ;; Source: https://github.com/polychromatic/polychromatic
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "polychromatic")))

(define-public freetube-bin
  ;; AUR freetube-bin: An open source desktop YouTube player built with privacy in mind.; 0.23.15-1; 222 votes.
  ;; Source: https://github.com/FreeTubeApp/FreeTube
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "freetube-bin")))

(define-public fresh-editor-bin
  ;; AUR fresh-editor-bin: A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins; 0.2.18-1; 11 votes.
  ;; Source: https://sinelaw.github.io/fresh/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "fresh-editor-bin")))

(define-public noctalia-qs
  ;; AUR noctalia-qs: Custom fork of Quickshell powering Noctalia Shell; 0.0.10-1; 7 votes.
  ;; Source: https://github.com/noctalia-dev/noctalia-qs
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "noctalia-qs")))

(define-public zotero-bin
  ;; AUR zotero-bin: Zotero Standalone. Is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources.; 8.0.4-1; 450 votes.
  ;; Source: https://www.zotero.org/download
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "zotero-bin")))

(define-public ttf-ms-win11-auto
  ;; AUR ttf-ms-win11-auto: Microsoft Windows 11 TrueType fonts; 10.0.26100.1742-4; 112 votes.
  ;; Source: https://www.microsoft.com/typography/fonts/product.aspx?PID=164
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-win11-auto")))

(define-public ttf-ms-win11-auto-japanese
  ;; AUR ttf-ms-win11-auto-japanese: Microsoft Windows 11 Japanese TrueType fonts; 10.0.26100.1742-4; 112 votes.
  ;; Source: https://www.microsoft.com/typography/fonts/product.aspx?PID=164
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-win11-auto-japanese")))

(define-public ttf-ms-win11-auto-korean
  ;; AUR ttf-ms-win11-auto-korean: Microsoft Windows 11 Korean TrueType fonts; 10.0.26100.1742-4; 112 votes.
  ;; Source: https://www.microsoft.com/typography/fonts/product.aspx?PID=164
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-win11-auto-korean")))

(define-public ttf-ms-win11-auto-sea
  ;; AUR ttf-ms-win11-auto-sea: Microsoft Windows 11 Southeast Asian TrueType fonts; 10.0.26100.1742-4; 112 votes.
  ;; Source: https://www.microsoft.com/typography/fonts/product.aspx?PID=164
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-win11-auto-sea")))

(define-public ttf-ms-win11-auto-thai
  ;; AUR ttf-ms-win11-auto-thai: Microsoft Windows 11 Thai TrueType fonts; 10.0.26100.1742-4; 112 votes.
  ;; Source: https://www.microsoft.com/typography/fonts/product.aspx?PID=164
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-win11-auto-thai")))

(define-public ttf-ms-win11-auto-zh_cn
  ;; AUR ttf-ms-win11-auto-zh_cn: Microsoft Windows 11 Simplified Chinese TrueType fonts; 10.0.26100.1742-4; 112 votes.
  ;; Source: https://www.microsoft.com/typography/fonts/product.aspx?PID=164
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-win11-auto-zh_cn")))

(define-public ttf-ms-win11-auto-zh_tw
  ;; AUR ttf-ms-win11-auto-zh_tw: Microsoft Windows 11 Traditional Chinese TrueType fonts; 10.0.26100.1742-4; 112 votes.
  ;; Source: https://www.microsoft.com/typography/fonts/product.aspx?PID=164
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-win11-auto-zh_tw")))

(define-public ttf-ms-win11-auto-other
  ;; AUR ttf-ms-win11-auto-other: Microsoft Windows 11 Other TrueType fonts; 10.0.26100.1742-4; 112 votes.
  ;; Source: https://www.microsoft.com/typography/fonts/product.aspx?PID=164
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "ttf-ms-win11-auto-other")))

(define-public bottles
  ;; AUR bottles: Easily manage wine and proton prefix; 2:63.0-1; 180 votes.
  ;; Source: https://github.com/bottlesdevs/Bottles
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "bottles")))

(define-public proton-pass-bin
  ;; AUR proton-pass-bin: Open-source password manager for effortless protection. Securely store, share and auto-login your accounts with Proton Pass, using end-to-end encryption trusted by millions.; 1.35.0-1; 39 votes.
  ;; Source: https://proton.me/pass
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "proton-pass-bin")))

(define-public cursor-bin
  ;; AUR cursor-bin: AI-first coding environment; 2.6.21-1; 75 votes.
  ;; Source: https://www.cursor.com
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "cursor-bin")))

(define-public faugus-launcher
  ;; AUR faugus-launcher: A simple and lightweight app for running Windows games using UMU-Launcher; 1.16.6-1; 22 votes.
  ;; Source: https://github.com/Faugus/faugus-launcher
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "faugus-launcher")))

(define-public android-studio
  ;; AUR android-studio: The official Android IDE (Stable branch); 2025.3.2.6-1; 1120 votes.
  ;; Source: https://developer.android.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "android-studio")))

(define-public minecraft-launcher
  ;; AUR minecraft-launcher: Official Minecraft Launcher; 1:2.1.3-3; 1132 votes.
  ;; Source: https://mojang.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "minecraft-launcher")))

(define-public arduino-ide-bin
  ;; AUR arduino-ide-bin: Arduino prototyping platform IDE, rewrite based on the Theia IDE framework.; 2.3.8-1; 51 votes.
  ;; Source: https://github.com/arduino/arduino-ide
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "arduino-ide-bin")))

(define-public rustdesk
  ;; AUR rustdesk: Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!; 1.4.6-1; 59 votes.
  ;; Source: https://rustdesk.com/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "rustdesk")))

(define-public paru-bin
  ;; AUR paru-bin: Feature packed AUR helper; 2.1.0-1; 330 votes.
  ;; Source: https://github.com/morganamilo/paru
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "paru-bin")))

(define-public anytype-bin
  ;; AUR anytype-bin: Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users.; 0.54.9-1; 45 votes.
  ;; Source: https://anytype.io/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "anytype-bin")))

(define-public traur
  ;; AUR traur: Trust scoring for AUR packages; 0.4.1-1; 8 votes.
  ;; Source: https://github.com/Sohimaster/traur
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "traur")))

(define-public floorp-bin
  ;; AUR floorp-bin: Firefox-based web browser focused on performance and customizability; 12.11.0-1; 66 votes.
  ;; Source: https://github.com/Floorp-Projects/Floorp
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "floorp-bin")))

(define-public pinta
  ;; AUR pinta: Drawing/editing program modeled after Paint.NET. It's goal is to provide a simplified alternative to GIMP for casual users; 3.1.1-2; 40 votes.
  ;; Source: https://pinta-project.com
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "pinta")))

(define-public informant
  ;; AUR informant: An Arch Linux News reader and pacman hook; 0.6.0-1; 131 votes.
  ;; Source: https://github.com/bradford-smith94/informant
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "informant")))

(define-public plasmazones-bin
  ;; AUR plasmazones-bin: Window tiling and autotiling for KDE Plasma (binary); 2.3.16-1; 5 votes.
  ;; Source: https://github.com/fuddlesworth/PlasmaZones
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "plasmazones-bin")))

(define-public xnviewmp
  ;; AUR xnviewmp: An efficient multimedia viewer, browser and converter.; 1.10.5-1; 327 votes.
  ;; Source: https://www.xnview.com/en/xnviewmp/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "xnviewmp")))

(define-public spicetify-cli
  ;; AUR spicetify-cli: Command-line tool to customize Spotify client; 2.42.14-1; 86 votes.
  ;; Source: https://github.com/spicetify/cli
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "spicetify-cli")))

(define-public voxtype
  ;; AUR voxtype: Push-to-talk voice-to-text for Linux (optimized for Wayland, works on X11); 0.6.4-2; 11 votes.
  ;; Source: https://voxtype.io
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "voxtype")))

(define-public davinci-resolve
  ;; AUR davinci-resolve: Professional A/V post-production software suite from Blackmagic Design; 20.3.2-1; 178 votes.
  ;; Source: https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "davinci-resolve")))

(define-public protonup-qt
  ;; AUR protonup-qt: Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris; 2.15.0-1; 105 votes.
  ;; Source: https://davidotek.github.io/protonup-qt
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "protonup-qt")))

(define-public freefilesync
  ;; AUR freefilesync: Folder comparison and synchronization software; 14.8-3; 12 votes.
  ;; Source: https://freefilesync.org
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "freefilesync")))

(define-public freesmlauncher
  ;; AUR freesmlauncher: Minecraft launcher with offline accounts support; 2.1.1-1; 7 votes.
  ;; Source: https://freesmlauncher.org/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "freesmlauncher")))

(define-public yandex-music
  ;; AUR yandex-music: Official Yandex Music App for Linux; 5.92.1-1; 13 votes.
  ;; Source: https://music.yandex.ru/download/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "yandex-music")))

(define-public steamcmd
  ;; AUR steamcmd: Steam Command Line Tools; latest-6; 150 votes.
  ;; Source: http://developer.valvesoftware.com/wiki/SteamCMD
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "steamcmd")))

(define-public slack-desktop
  ;; AUR slack-desktop: Slack Desktop (Beta) for Linux; 4.47.69-1; 632 votes.
  ;; Source: https://slack.com/downloads
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "slack-desktop")))

(define-public mangowm
  ;; AUR mangowm: A Wayland compositor with smooth animation; 0.12.7-2; 7 votes.
  ;; Source: https://github.com/DreamMaoMao/mangowc
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "mangowm")))

(define-public rider
  ;; AUR rider: A cross-platform .NET IDE by JetBrains.; 1:2025.3.3-1; 107 votes.
  ;; Source: https://www.jetbrains.com/rider/
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "rider")))

(define-public mediatek-mt7927-dkms
  ;; AUR mediatek-mt7927-dkms: DKMS Bluetooth (MT6639) and WiFi (MT7925e/MT7902) modules for MediaTek MT7927 Filogic 380; 2.7-1; 5 votes.
  ;; Source: https://github.com/jetm/mediatek-mt7927-dkms
  ;; NEEDS_RECIPE_DESIGN: recipe drafting started with placeholder stub in this pass.
  ;; Next: pick build system, pin source artifact/revision, compute sha256, replace stub with real package.
  (package (inherit zoxide) (name "mediatek-mt7927-dkms")))
