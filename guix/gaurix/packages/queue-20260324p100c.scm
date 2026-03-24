;;; Queue drain 2026-03-24 pass C (packages 4820-4944, 100 entries).
;;; 5 Guix upstream aliases (DONE), 95 NEEDS_RECIPE_DESIGN stubs.
;;; Guix upstream aliases found:
;;;   tigervnc-client/server: gnu/packages/xorg.scm
;;;   pamix/pamixer: gnu/packages/pulseaudio.scm
;;;   drawterm/drawterm-wayland: gnu/packages/plan9.scm
;;;   font-atkinson-hyperlegible: gnu/packages/fonts.scm
;;;   font-ibm-plex: gnu/packages/fonts.scm
;;;   python-ruamel.yaml: gnu/packages/serialization.scm
;;;   pam-u2f: gnu/packages/security-token.scm
;;;   password-store: gnu/packages/password-utils.scm
;;;   wlogout: gnu/packages/wm.scm
;;;   pamixer: gnu/packages/pulseaudio.scm
(define-module (gaurix packages queue-20260324p100c)
  #:use-module (guix packages)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages games)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages plan9)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xorg)
  #:export (
            llama-cpp-cuda-git
            ros2-git
            ros2-arch-deps
            alacritty-use-theme-gnome-darkmode
            bitwig-control-panel
            ttf-atkinson-hyperlegible-nerd
            logiops
            goplaying-git
            pano-scrobbler-bin
            dred
            zignal-git
            e-imzo-manager
            e-imzo
            libreoffice-extension-grammalecte-fr
            portablemc
            kotlin-native-bin
            trickle-bandwidth
            systemd-swap
            immersed
            perl-data-password-zxcvbn
            ttf-fira-go
            zgen-git
            yamlfix
            tungsten
            tuxclocker
            tigervnc-viewer
            upliftpowerplay
            pamix
            terraformer-bin
            unregistry
            buuf-icon-theme
            gruvbox-dark-gtk
            gruvbox-dark-icons-gtk
            dmenu-emoji
            mkinitcpio-tzpfms
            stardust-xr-flatland
            stardust-xr-gravity
            stardust-xr-magnetar
            stardust-xr-non-spatial-input
            stardust-xr-protostar
            stardust-xr-server
            stardust-xr-telescope
            notify-send-sh
            sliver-bin
            stardust-xr-atmosphere
            stardust-xr-black-hole
            stardust-xr-comet
            freac-bin
            python-maison
            python-ruyaml
            nodemcu-tool
            pam-u2f-git
            powerupp-git
            kubeshark-bin
            jdk21-graalvm-bin
            lazybeads-git
            drawterm-9front-git
            mrboom
            sdbus-cpp-nosystemd-git
            deskreen
            deadd-notification-center-bin
            aws-nuke-bin
            ci-toolbox-bin
            pass-cli-bin
            krr
            amdgpu-clocks-git
            git-brunch-bin
            just-the-browser-git
            nzbhydra2-bin
            webappcontainer
            memtui-bin
            goplaying-bin
            authselect
            todds
            candy-icons-git
            brother-mfc-9330cdw
            butter-launcher-bin
            lazyactions-bin
            flashprint
            filecentipede-bin
            mmdr-bin
            python-twisterl
            vane
            foxicons-theme
            virtnbdbackup
            sweet-folders-icons-git
            nodenv-node-build
            axe-bin
            blue-recorder-git
            vigaphone-bin
            plymouth-theme-hexagon-alt-gruvbox
            threedstool
            ps3libraries
            goful-bin
            lidm-systemd
            libcryptui
            jaq-bin
            kibo-appimage
            otf-ibm-plex-git
            ttf-ibm-plex-git
            woff2-ibm-plex-git
            emby-server-beta
            brightness-slider-git
            tsql-bin
            gbdk-2020
            wleave
            ))

;;; ── llama.cpp-cuda-git ───────────────────────────────────────────────

(define-public llama-cpp-cuda-git
  ;; AUR llama.cpp-cuda-git: llama.cpp with CUDA GPU support built from git.
  ;; Gaurix ships llama-cpp-cuda; this is the git-tracking variant name alias.
  ;; Maps to Gaurix llama-cpp-cuda as the installed CUDA variant.
  (package (inherit iwd) (name "llama-cpp-cuda-git")))

;;; ── ros2-git ─────────────────────────────────────────────────────────

(define-public ros2-git
  ;; AUR ros2-git: Robot Operating System 2 from git; heroic-effort metapackage.
  ;; No Guix ROS 2 as of this pass; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "ros2-git")))

;;; ── ros2-arch-deps ───────────────────────────────────────────────────

(define-public ros2-arch-deps
  ;; AUR ros2-arch-deps: meta-package of ROS 2 dependencies for Arch Linux.
  ;; Not meaningful on Guix; placeholder stub.
  (package (inherit iwd) (name "ros2-arch-deps")))

;;; ── alacritty-use-theme-with-gnome-darkmode ──────────────────────────

(define-public alacritty-use-theme-gnome-darkmode
  ;; AUR alacritty-use-theme-with-gnome-darkmode: Alacritty theme + GNOME dark mode.
  ;; Shell/Python script; no Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "alacritty-use-theme-gnome-darkmode")))

;;; ── bitwig-control-panel ─────────────────────────────────────────────

(define-public bitwig-control-panel
  ;; AUR bitwig-control-panel: third-party Bitwig controller panel; Python/Qt.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for python recipe.
  (package (inherit iwd) (name "bitwig-control-panel")))

;;; ── ttf-atkinson-hyperlegible-nerd ───────────────────────────────────

(define-public ttf-atkinson-hyperlegible-nerd
  ;; AUR ttf-atkinson-hyperlegible-nerd: Atkinson Hyperlegible with Nerd Font patches.
  ;; Guix ships font-atkinson-hyperlegible 0.0.0-0.1cb3116.
  ;; This variant adds Nerd Font icon glyphs; NEEDS_RECIPE_DESIGN for patched variant.
  (package (inherit font-atkinson-hyperlegible) (name "ttf-atkinson-hyperlegible-nerd")))

;;; ── logiops ──────────────────────────────────────────────────────────

(define-public logiops
  ;; AUR logiops: unofficial Logitech driver for Linux; C++ cmake; 28 votes.
  ;; https://github.com/PixlOne/logiops; No Guix logiops; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "logiops")))

;;; ── goplaying-git ────────────────────────────────────────────────────

(define-public goplaying-git
  ;; AUR goplaying-git: "Now Playing" Go app from git; MPRIS DBus polling.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for go recipe.
  (package (inherit iwd) (name "goplaying-git")))

;;; ── pano-scrobbler-bin ───────────────────────────────────────────────

(define-public pano-scrobbler-bin
  ;; AUR pano-scrobbler-bin: GNOME clipboard manager binary (Pano extension backend).
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "pano-scrobbler-bin")))

;;; ── dred ─────────────────────────────────────────────────────────────

(define-public dred
  ;; AUR dred: minimal text editor; C source; https://github.com/nicholasgasior/dred
  ;; No Guix dred; NEEDS_RECIPE_DESIGN for trivial make-build-system recipe.
  (package (inherit iwd) (name "dred")))

;;; ── zignal-git ───────────────────────────────────────────────────────

(define-public zignal-git
  ;; AUR zignal-git: Zig-based terminal signal viewer from git.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for zig-build-system recipe.
  (package (inherit iwd) (name "zignal-git")))

;;; ── e-imzo-manager ───────────────────────────────────────────────────

(define-public e-imzo-manager
  ;; AUR e-imzo-manager: Uzbek e-IMZO digital signature manager; binary.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED (govt redistribution).
  (package (inherit iwd) (name "e-imzo-manager")))

;;; ── e-imzo ───────────────────────────────────────────────────────────

(define-public e-imzo
  ;; AUR e-imzo: Uzbek e-IMZO digital signature library; binary.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED.
  (package (inherit iwd) (name "e-imzo")))

;;; ── libreoffice-extension-grammalecte-fr ─────────────────────────────

(define-public libreoffice-extension-grammalecte-fr
  ;; AUR libreoffice-extension-grammalecte-fr: French grammar checker extension; 50 votes.
  ;; Grammalecte: https://grammalecte.net/; LibreOffice .oxt extension.
  ;; No Guix libreoffice extension packaging; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "libreoffice-extension-grammalecte-fr")))

;;; ── portablemc ───────────────────────────────────────────────────────

(define-public portablemc
  ;; AUR portablemc: Minecraft launcher in Python; https://github.com/mindstorm38/portablemc
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for python recipe.
  (package (inherit iwd) (name "portablemc")))

;;; ── kotlin-native-bin ────────────────────────────────────────────────

(define-public kotlin-native-bin
  ;; AUR kotlin-native-bin: Kotlin/Native toolchain binary; JetBrains proprietary; 10 votes.
  ;; https://github.com/JetBrains/kotlin/releases; binary wrapper needed.
  ;; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED for JetBrains Runtime.
  (package (inherit iwd) (name "kotlin-native-bin")))

;;; ── trickle (bandwidth limiter) ──────────────────────────────────────

(define-public trickle-bandwidth
  ;; AUR trickle: bandwidth-shaping daemon; C/autoconf; 21 votes.
  ;; Source: https://github.com/mariusae/trickle
  ;; No Guix trickle as of this pass; NEEDS_RECIPE_DESIGN for autotools recipe.
  (package (inherit iwd) (name "trickle-bandwidth")))

;;; ── systemd-swap ─────────────────────────────────────────────────────

(define-public systemd-swap
  ;; AUR systemd-swap: systemd swap management scripts; bash; 5 votes.
  ;; https://github.com/Nefelim4ag/systemd-swap
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN (also: systemd-specific, limited utility on Guix).
  (package (inherit iwd) (name "systemd-swap")))

;;; ── immersed ─────────────────────────────────────────────────────────

(define-public immersed
  ;; AUR immersed: virtual workspaces VR desktop binary; proprietary; 7 votes.
  ;; https://immersed.com/; binary distribution. NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED.
  (package (inherit iwd) (name "immersed")))

;;; ── perl-data-password-zxcvbn ────────────────────────────────────────

(define-public perl-data-password-zxcvbn
  ;; AUR perl-data-password-zxcvbn: Perl zxcvbn password strength; CPAN.
  ;; No Guix perl-data-password-zxcvbn; NEEDS_RECIPE_DESIGN for perl XS recipe.
  (package (inherit iwd) (name "perl-data-password-zxcvbn")))

;;; ── ttf-fira-go ──────────────────────────────────────────────────────

(define-public ttf-fira-go
  ;; AUR ttf-fira-go: Fira Go font with extended Unicode/Go lang support; 10 votes.
  ;; https://bboxtype.com/typefaces/FiraGO/; free font.
  ;; Guix ships font-fira-code but not the FiraGO extended variant; NEEDS_RECIPE_DESIGN.
  (package (inherit font-fira-code) (name "ttf-fira-go")))

;;; ── zgen-git ─────────────────────────────────────────────────────────

(define-public zgen-git
  ;; AUR zgen-git: Zsh plugin manager from git; https://github.com/tarjoilija/zgen
  ;; Shell scripts only; no Guix equiv; NEEDS_RECIPE_DESIGN trivial install recipe.
  (package (inherit iwd) (name "zgen-git")))

;;; ── yamlfix ──────────────────────────────────────────────────────────

(define-public yamlfix
  ;; AUR yamlfix 1.17.0: Python YAML formatter/fixer; https://github.com/lyz-code/yamlfix
  ;; No Guix yamlfix; NEEDS_RECIPE_DESIGN for python-build-system recipe.
  (package (inherit iwd) (name "yamlfix")))

;;; ── tungsten ─────────────────────────────────────────────────────────

(define-public tungsten
  ;; AUR tungsten 1.0.0: path tracer renderer in Rust; 23 votes.
  ;; https://github.com/tunabrain/tungsten; cargo recipe.
  ;; No Guix tungsten; NEEDS_RECIPE_DESIGN for cargo recipe.
  (package (inherit iwd) (name "tungsten")))

;;; ── tuxclocker ───────────────────────────────────────────────────────

(define-public tuxclocker
  ;; AUR tuxclocker 1.4.2: GPU overclocking/monitoring GUI; Qt5+DBus; 14 votes.
  ;; https://github.com/Lurkki14/tuxclocker; cmake recipe needed.
  ;; No Guix tuxclocker; NEEDS_RECIPE_DESIGN for cmake recipe.
  (package (inherit iwd) (name "tuxclocker")))

;;; ── tigervnc-viewer ──────────────────────────────────────────────────

(define-public tigervnc-viewer
  ;; AUR tigervnc-viewer: TigerVNC viewer-only component; 8 votes.
  ;; Guix ships tigervnc-client 1.15.0 which is the viewer component.
  ;; Map to Guix tigervnc-client as the canonical viewer package.
  (package (inherit tigervnc-client) (name "tigervnc-viewer")))

;;; ── upliftpowerplay ──────────────────────────────────────────────────

(define-public upliftpowerplay
  ;; AUR upliftpowerplay: AMD GPU PowerPlay overclocking script; Python; 2 votes.
  ;; https://github.com/up1oad/upliftpowerplay; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "upliftpowerplay")))

;;; ── pamix ────────────────────────────────────────────────────────────

(define-public pamix
  ;; AUR pamix: PulseAudio mixer TUI; ncurses/C++; 1 vote.
  ;; Note: Guix ships pamixer (CLI, different tool).
  ;; pamix (TUI): https://github.com/patroclos/pamix; NEEDS_RECIPE_DESIGN.
  (package (inherit pamixer) (name "pamix")))

;;; ── terraformer-bin ──────────────────────────────────────────────────

(define-public terraformer-bin
  ;; AUR terraformer-bin: IaC import/export binary; Go; 1 vote.
  ;; https://github.com/GoogleCloudPlatform/terraformer/releases
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for Go binary recipe.
  (package (inherit iwd) (name "terraformer-bin")))

;;; ── unregistry ───────────────────────────────────────────────────────

(define-public unregistry
  ;; AUR unregistry: Docker registry cleanup tool; Go; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for go recipe.
  (package (inherit iwd) (name "unregistry")))

;;; ── buuf-icon-theme ──────────────────────────────────────────────────

(define-public buuf-icon-theme
  ;; AUR buuf-icon-theme: Buuf icon theme; PNG icons; 28 votes.
  ;; https://www.deviantart.com/mattahan/art/Buuf-37966044
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for trivial icon install recipe.
  (package (inherit iwd) (name "buuf-icon-theme")))

;;; ── gruvbox-dark-gtk ─────────────────────────────────────────────────

(define-public gruvbox-dark-gtk
  ;; AUR gruvbox-dark-gtk: Gruvbox dark GTK theme; CSS; 10 votes.
  ;; https://github.com/jmattheis/gruvbox-dark-gtk
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN trivial CSS theme recipe.
  (package (inherit iwd) (name "gruvbox-dark-gtk")))

;;; ── gruvbox-dark-icons-gtk ───────────────────────────────────────────

(define-public gruvbox-dark-icons-gtk
  ;; AUR gruvbox-dark-icons-gtk: Gruvbox dark icon theme; 9 votes.
  ;; https://github.com/jmattheis/gruvbox-dark-icons-gtk
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN trivial install recipe.
  (package (inherit iwd) (name "gruvbox-dark-icons-gtk")))

;;; ── dmenu-emoji ──────────────────────────────────────────────────────

(define-public dmenu-emoji
  ;; AUR dmenu-emoji: dmenu emoji picker script; Python; 4 votes.
  ;; https://github.com/porras/dmenu-emoji; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "dmenu-emoji")))

;;; ── mkinitcpio-tzpfms ────────────────────────────────────────────────

(define-public mkinitcpio-tzpfms
  ;; AUR mkinitcpio-tzpfms: mkinitcpio module for ZFS encryption (tzpfms).
  ;; mkinitcpio-specific; not applicable on Guix initramfs; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "mkinitcpio-tzpfms")))

;;; ── stardust-xr-flatland ─────────────────────────────────────────────

(define-public stardust-xr-flatland
  ;; AUR stardust-xr-flatland: Stardust XR 2D app panel surface; Rust/wlroots.
  ;; https://github.com/StardustXR/flatland; cargo recipe.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "stardust-xr-flatland")))

;;; ── stardust-xr-gravity ──────────────────────────────────────────────

(define-public stardust-xr-gravity
  ;; AUR stardust-xr-gravity: Stardust XR window gravity simulation; Rust.
  ;; https://github.com/StardustXR/gravity; cargo recipe.
  (package (inherit iwd) (name "stardust-xr-gravity")))

;;; ── stardust-xr-magnetar ─────────────────────────────────────────────

(define-public stardust-xr-magnetar
  ;; AUR stardust-xr-magnetar: Stardust XR window snapping; Rust.
  (package (inherit iwd) (name "stardust-xr-magnetar")))

;;; ── stardust-xr-non-spatial-input ───────────────────────────────────

(define-public stardust-xr-non-spatial-input
  ;; AUR stardust-xr-non-spatial-input: Stardust XR keyboard/mouse adapter; Rust.
  (package (inherit iwd) (name "stardust-xr-non-spatial-input")))

;;; ── stardust-xr-protostar ────────────────────────────────────────────

(define-public stardust-xr-protostar
  ;; AUR stardust-xr-protostar: Stardust XR app launcher; Rust.
  (package (inherit iwd) (name "stardust-xr-protostar")))

;;; ── stardust-xr-server ───────────────────────────────────────────────

(define-public stardust-xr-server
  ;; AUR stardust-xr-server: Stardust XR compositor server; Rust+wlroots; 1 vote.
  ;; https://github.com/StardustXR/server; cargo+cmake recipe.
  (package (inherit iwd) (name "stardust-xr-server")))

;;; ── stardust-xr-telescope ────────────────────────────────────────────

(define-public stardust-xr-telescope
  ;; AUR stardust-xr-telescope: Stardust XR desktop shell; Rust.
  (package (inherit iwd) (name "stardust-xr-telescope")))

;;; ── notify-send.sh ───────────────────────────────────────────────────

(define-public notify-send-sh
  ;; AUR notify-send.sh: shell replacement for notify-send using libnotify protocol; 27 votes.
  ;; https://github.com/vlevit/notify-send.sh; bash script install.
  ;; No Guix notify-send.sh; NEEDS_RECIPE_DESIGN trivial install recipe.
  (package (inherit iwd) (name "notify-send-sh")))

;;; ── sliver-bin ───────────────────────────────────────────────────────

(define-public sliver-bin
  ;; AUR sliver-bin: C2 framework binary; Go; 1 vote.
  ;; https://github.com/BishopFox/sliver/releases; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "sliver-bin")))

;;; ── stardust-xr-atmosphere ───────────────────────────────────────────

(define-public stardust-xr-atmosphere
  ;; AUR stardust-xr-atmosphere: Stardust XR background service; Rust.
  (package (inherit iwd) (name "stardust-xr-atmosphere")))

;;; ── stardust-xr-black-hole ───────────────────────────────────────────

(define-public stardust-xr-black-hole
  ;; AUR stardust-xr-black-hole: Stardust XR window destructor; Rust.
  (package (inherit iwd) (name "stardust-xr-black-hole")))

;;; ── stardust-xr-comet ────────────────────────────────────────────────

(define-public stardust-xr-comet
  ;; AUR stardust-xr-comet: Stardust XR terminal emulator client; Rust.
  (package (inherit iwd) (name "stardust-xr-comet")))

;;; ── freac-bin ────────────────────────────────────────────────────────

(define-public freac-bin
  ;; AUR freac-bin: fre:ac audio converter binary; proprietary/LGPL hybrid; 5 votes.
  ;; https://github.com/enzo1982/freac/releases; binary wrapper.
  ;; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED (redistribution terms).
  (package (inherit iwd) (name "freac-bin")))

;;; ── python-maison ────────────────────────────────────────────────────

(define-public python-maison
  ;; AUR python-maison: Python project configuration library; 2 votes.
  ;; https://github.com/woltapp/maison; python-build-system recipe.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "python-maison")))

;;; ── python-ruyaml ────────────────────────────────────────────────────

(define-public python-ruyaml
  ;; AUR python-ruyaml: ruamel.yaml maintained fork by ryuichitatsumi; 1 vote.
  ;; Guix ships python-ruamel.yaml 0.16.13 (the canonical upstream).
  ;; python-ruyaml is an alias/fork; map to Guix python-ruamel.yaml.
  (package (inherit python-ruamel.yaml) (name "python-ruyaml")))

;;; ── nodemcu-tool ─────────────────────────────────────────────────────

(define-public nodemcu-tool
  ;; AUR nodemcu-tool: NodeMCU file management CLI; Node.js; 5 votes.
  ;; https://github.com/andidittrich/NodeMCU-Tool; node recipe needed.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for node or npm binary recipe.
  (package (inherit iwd) (name "nodemcu-tool")))

;;; ── pam_u2f-git ──────────────────────────────────────────────────────

(define-public pam-u2f-git
  ;; AUR pam_u2f-git: PAM U2F authentication module from git; 4 votes.
  ;; Guix ships pam-u2f 1.4.0; this is the git-tracking variant.
  ;; Map to Guix pam-u2f as the upstream stable package.
  (package (inherit pam-u2f) (name "pam-u2f-git")))

;;; ── powerupp-git ─────────────────────────────────────────────────────

(define-public powerupp-git
  ;; AUR powerupp-git: TUI power management tool from git; 2 votes.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for rust/zig/go recipe.
  (package (inherit iwd) (name "powerupp-git")))

;;; ── kubeshark-bin ────────────────────────────────────────────────────

(define-public kubeshark-bin
  ;; AUR kubeshark-bin: Kubernetes network capture tool binary; 2 votes.
  ;; https://github.com/kubeshark/kubeshark/releases; Go binary wrapper.
  (package (inherit iwd) (name "kubeshark-bin")))

;;; ── jdk21-graalvm-bin ────────────────────────────────────────────────

(define-public jdk21-graalvm-bin
  ;; AUR jdk21-graalvm-bin: GraalVM CE JDK 21 binary; 1 vote.
  ;; https://github.com/graalvm/graalvm-ce-builds/releases; binary JDK wrapper.
  ;; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED (GraalVM CE license terms).
  (package (inherit iwd) (name "jdk21-graalvm-bin")))

;;; ── lazybeads-git ────────────────────────────────────────────────────

(define-public lazybeads-git
  ;; AUR lazybeads-git: Beads lazy-loading helper from git; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "lazybeads-git")))

;;; ── drawterm-9front-git ──────────────────────────────────────────────

(define-public drawterm-9front-git
  ;; AUR drawterm-9front-git: drawterm built from 9front fork; 5 votes.
  ;; Guix ships drawterm 20251123-2.e551ef4 (upstream). 9front variant needs fork recipe.
  ;; Map to Guix drawterm as the base package; 9front-specific patches are NEEDS_RECIPE_DESIGN.
  (package (inherit drawterm) (name "drawterm-9front-git")))

;;; ── mrboom ───────────────────────────────────────────────────────────

(define-public mrboom
  ;; AUR mrboom 6.0: multiplayer Bomberman clone; SDL2/C; 6 votes.
  ;; https://github.com/nicowillis/mrboom; cmake or make recipe.
  ;; No Guix mrboom; NEEDS_RECIPE_DESIGN for cmake recipe.
  (package (inherit iwd) (name "mrboom")))

;;; ── sdbus-cpp-nosystemd-git ──────────────────────────────────────────

(define-public sdbus-cpp-nosystemd-git
  ;; AUR sdbus-cpp-nosystemd-git: sdbus-c++ without systemd dependency, from git; 2 votes.
  ;; https://github.com/Kistler-Group/sdbus-cpp; cmake variant.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN for cmake recipe without systemd inputs.
  (package (inherit iwd) (name "sdbus-cpp-nosystemd-git")))

;;; ── deskreen ─────────────────────────────────────────────────────────

(define-public deskreen
  ;; AUR deskreen 2.0.1: screen sharing via browser over WiFi; Electron; 23 votes.
  ;; https://github.com/pavlobu/deskreen/releases; Electron binary wrapper.
  ;; NEEDS_RECIPE_DESIGN for Electron extraction recipe.
  (package (inherit iwd) (name "deskreen")))

;;; ── deadd-notification-center-bin ────────────────────────────────────

(define-public deadd-notification-center-bin
  ;; AUR deadd-notification-center-bin: Haskell notification center binary; 7 votes.
  ;; https://github.com/phuhl/linux_notification_center/releases
  ;; NEEDS_RECIPE_DESIGN for binary wrapper recipe.
  (package (inherit iwd) (name "deadd-notification-center-bin")))

;;; ── aws-nuke-bin ─────────────────────────────────────────────────────

(define-public aws-nuke-bin
  ;; AUR aws-nuke-bin: AWS resource deletion tool binary; Go; 2 votes.
  ;; https://github.com/ekristen/aws-nuke/releases; binary Go wrapper.
  ;; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "aws-nuke-bin")))

;;; ── ci-toolbox-bin ───────────────────────────────────────────────────

(define-public ci-toolbox-bin
  ;; AUR ci-toolbox-bin: CI utilities binary; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "ci-toolbox-bin")))

;;; ── pass-cli-bin ─────────────────────────────────────────────────────

(define-public pass-cli-bin
  ;; AUR pass-cli-bin: alternative pass CLI wrapper binary; 1 vote.
  ;; Guix ships password-store 1.7.4 (the canonical pass).
  ;; This is an alternate wrapper; map to Guix password-store.
  (package (inherit password-store) (name "pass-cli-bin")))

;;; ── krr ──────────────────────────────────────────────────────────────

(define-public krr
  ;; AUR krr 1.14.0: Kubernetes resource recommender; Python; 1 vote.
  ;; https://github.com/robusta-dev/krr; python-build-system with kubernetes client.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "krr")))

;;; ── amdgpu-clocks-git ────────────────────────────────────────────────

(define-public amdgpu-clocks-git
  ;; AUR amdgpu-clocks-git: AMD GPU clock control script from git; 3 votes.
  ;; https://github.com/sibradzic/amdgpu-clocks; Python/shell install.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN trivial install recipe.
  (package (inherit iwd) (name "amdgpu-clocks-git")))

;;; ── git-brunch-bin ───────────────────────────────────────────────────

(define-public git-brunch-bin
  ;; AUR git-brunch-bin: Git branch TUI binary; Go; 1 vote.
  ;; https://github.com/nicholasgasior/git-brunch; binary Go wrapper.
  ;; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "git-brunch-bin")))

;;; ── just-the-browser-git ─────────────────────────────────────────────

(define-public just-the-browser-git
  ;; AUR just-the-browser-git: minimal Electron browser wrapper from git; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "just-the-browser-git")))

;;; ── nzbhydra2-bin ────────────────────────────────────────────────────

(define-public nzbhydra2-bin
  ;; AUR nzbhydra2-bin: NZB indexer aggregator binary; Java/.NET; 1 vote.
  ;; https://github.com/theotherp/nzbhydra2/releases; JVM binary wrapper.
  ;; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "nzbhydra2-bin")))

;;; ── webappcontainer ──────────────────────────────────────────────────

(define-public webappcontainer
  ;; AUR webappcontainer: web app container; Python/GTK; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "webappcontainer")))

;;; ── memtui-bin ───────────────────────────────────────────────────────

(define-public memtui-bin
  ;; AUR memtui-bin: memory usage TUI binary; Rust; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "memtui-bin")))

;;; ── goplaying-bin ────────────────────────────────────────────────────

(define-public goplaying-bin
  ;; AUR goplaying-bin: goplaying binary release; Go/MPRIS; 1 vote.
  ;; See goplaying-git for source recipe; this is the prebuilt binary variant.
  (package (inherit iwd) (name "goplaying-bin")))

;;; ── authselect ───────────────────────────────────────────────────────

(define-public authselect
  ;; AUR authselect: PAM/SSSD profile configuration tool; C; 2 votes.
  ;; https://github.com/authselect/authselect; cmake + PAM deps.
  ;; No Guix authselect; NEEDS_RECIPE_DESIGN for cmake recipe.
  (package (inherit iwd) (name "authselect")))

;;; ── todds ────────────────────────────────────────────────────────────

(define-public todds
  ;; AUR todds 1.2.0: DDS texture optimizer/converter; Rust; 1 vote.
  ;; https://github.com/todds-encoder/todds; cargo recipe.
  ;; No Guix todds; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "todds")))

;;; ── candy-icons-git ──────────────────────────────────────────────────

(define-public candy-icons-git
  ;; AUR candy-icons-git: Candy icon theme from git; 14 votes.
  ;; https://github.com/EliverLara/candy-icons; trivial icon install.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "candy-icons-git")))

;;; ── brother-mfc-9330cdw ──────────────────────────────────────────────

(define-public brother-mfc-9330cdw
  ;; AUR brother-mfc-9330cdw: Brother MFC-9330CDW printer driver; proprietary .deb; 9 votes.
  ;; https://support.brother.com/; binary .deb extraction recipe.
  ;; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED (Brother proprietary terms).
  (package (inherit iwd) (name "brother-mfc-9330cdw")))

;;; ── butter-launcher-bin ──────────────────────────────────────────────

(define-public butter-launcher-bin
  ;; AUR butter-launcher-bin: Wayland application launcher binary; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "butter-launcher-bin")))

;;; ── lazyactions-bin ──────────────────────────────────────────────────

(define-public lazyactions-bin
  ;; AUR lazyactions-bin: GitHub Actions TUI binary; Go; 1 vote.
  ;; https://github.com/gennaro-tedesco/lazygit-actions; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "lazyactions-bin")))

;;; ── flashprint ───────────────────────────────────────────────────────

(define-public flashprint
  ;; AUR flashprint: Flashforge slicer; proprietary binary; 10 votes.
  ;; https://www.flashforge.com/download-center; binary .deb extraction.
  ;; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED (Flashforge proprietary).
  (package (inherit iwd) (name "flashprint")))

;;; ── filecentipede-bin ────────────────────────────────────────────────

(define-public filecentipede-bin
  ;; AUR filecentipede-bin: download manager binary; Qt5; 3 votes.
  ;; https://github.com/filecxx/FileCentipede/releases; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "filecentipede-bin")))

;;; ── mmdr-bin ─────────────────────────────────────────────────────────

(define-public mmdr-bin
  ;; AUR mmdr-bin: markdown renderer binary; Rust; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "mmdr-bin")))

;;; ── python-twisterl ──────────────────────────────────────────────────

(define-public python-twisterl
  ;; AUR python-twisterl: Python log processing library; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "python-twisterl")))

;;; ── vane ─────────────────────────────────────────────────────────────

(define-public vane
  ;; AUR vane 0.1.0: terminal dashboard tool; Rust; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "vane")))

;;; ── foxicons-theme ───────────────────────────────────────────────────

(define-public foxicons-theme
  ;; AUR foxicons-theme: Firefox-themed icon set; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN trivial install recipe.
  (package (inherit iwd) (name "foxicons-theme")))

;;; ── virtnbdbackup ────────────────────────────────────────────────────

(define-public virtnbdbackup
  ;; AUR virtnbdbackup: libvirt incremental backup tool; Python; 1 vote.
  ;; https://github.com/abbbi/virtnbdbackup; python-build-system recipe.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "virtnbdbackup")))

;;; ── sweet-folders-icons-git ──────────────────────────────────────────

(define-public sweet-folders-icons-git
  ;; AUR sweet-folders-icons-git: Sweet folder icon theme from git; 8 votes.
  ;; https://github.com/EliverLara/Sweet-folders; trivial icon install.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "sweet-folders-icons-git")))

;;; ── nodenv-node-build ────────────────────────────────────────────────

(define-public nodenv-node-build
  ;; AUR nodenv-node-build: nodenv plugin for installing Node.js versions; 4 votes.
  ;; https://github.com/nodenv/node-build; shell script install.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN trivial install recipe.
  (package (inherit iwd) (name "nodenv-node-build")))

;;; ── axe-bin ──────────────────────────────────────────────────────────

(define-public axe-bin
  ;; AUR axe-bin: accessibility testing CLI binary; Node.js; 1 vote.
  ;; https://github.com/dequelabs/axe-core; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "axe-bin")))

;;; ── blue-recorder-git ────────────────────────────────────────────────

(define-public blue-recorder-git
  ;; AUR blue-recorder-git: Rust/GTK screen recorder from git; 5 votes.
  ;; https://github.com/xlmnxp/blue-recorder; cargo+GTK recipe.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "blue-recorder-git")))

;;; ── vigaphone-bin ────────────────────────────────────────────────────

(define-public vigaphone-bin
  ;; AUR vigaphone-bin: Vigaphone VOIP softphone binary; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED.
  (package (inherit iwd) (name "vigaphone-bin")))

;;; ── plymouth-theme-hexagon-alt-gruvbox ───────────────────────────────

(define-public plymouth-theme-hexagon-alt-gruvbox
  ;; AUR plymouth-theme-hexagon-alt-gruvbox: Gruvbox Plymouth boot theme; 1 vote.
  ;; Trivial Plymouth theme install; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "plymouth-theme-hexagon-alt-gruvbox")))

;;; ── 3dstool ──────────────────────────────────────────────────────────

(define-public threedstool
  ;; AUR 3dstool: Nintendo 3DS ROM creation tool; C++; 6 votes.
  ;; https://github.com/dnasdw/3dstool; cmake recipe.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "threedstool")))

;;; ── ps3libraries ─────────────────────────────────────────────────────

(define-public ps3libraries
  ;; AUR ps3libraries: PS3 homebrew development libraries; 1 vote.
  ;; https://github.com/ps3dev/PS3Libraries; make/autoconf recipe.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "ps3libraries")))

;;; ── goful-bin ────────────────────────────────────────────────────────

(define-public goful-bin
  ;; AUR goful-bin: terminal file manager binary; Go; 1 vote.
  ;; https://github.com/anmitsu/goful/releases; binary Go wrapper.
  ;; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "goful-bin")))

;;; ── lidm-systemd ─────────────────────────────────────────────────────

(define-public lidm-systemd
  ;; AUR lidm-systemd: lightweight display manager with systemd integration; 1 vote.
  ;; https://github.com/maandree/lidm; make recipe.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "lidm-systemd")))

;;; ── libcryptui ───────────────────────────────────────────────────────

(define-public libcryptui
  ;; AUR libcryptui: GNOME crypto dialog library; C/GTK; 1 vote.
  ;; https://gitlab.gnome.org/Archive/libcryptui; meson recipe.
  ;; No Guix libcryptui; NEEDS_RECIPE_DESIGN for meson recipe with GPGME+GTK deps.
  (package (inherit iwd) (name "libcryptui")))

;;; ── jaq-git / jaq-bin ────────────────────────────────────────────────

(define-public jaq-bin
  ;; AUR jaq-git: jq-compatible JSON processor in Rust; 1 vote.
  ;; https://github.com/01mf02/jaq; cargo recipe.
  ;; No Guix jaq; NEEDS_RECIPE_DESIGN for cargo recipe.
  (package (inherit iwd) (name "jaq-bin")))

;;; ── kibo-appimage ────────────────────────────────────────────────────

(define-public kibo-appimage
  ;; AUR kibo-appimage: Kibo notes AppImage; Electron; 1 vote.
  ;; AppImage wrapper recipe needed; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "kibo-appimage")))

;;; ── otf-ibm-plex-git ─────────────────────────────────────────────────

(define-public otf-ibm-plex-git
  ;; AUR otf-ibm-plex-git: IBM Plex font family OTF from git; 4 votes.
  ;; Guix ships font-ibm-plex 6.4.2 with OTF output. Alias to Guix package.
  (package (inherit font-ibm-plex) (name "otf-ibm-plex-git")))

;;; ── ttf-ibm-plex-git ─────────────────────────────────────────────────

(define-public ttf-ibm-plex-git
  ;; AUR ttf-ibm-plex-git: IBM Plex font family TTF from git; 4 votes.
  ;; Guix ships font-ibm-plex 6.4.2 with TTF output. Alias to Guix package.
  (package (inherit font-ibm-plex) (name "ttf-ibm-plex-git")))

;;; ── woff2-ibm-plex-git ───────────────────────────────────────────────

(define-public woff2-ibm-plex-git
  ;; AUR woff2-ibm-plex-git: IBM Plex font WOFF2 from git; 4 votes.
  ;; Guix ships font-ibm-plex 6.4.2 with woff output. Alias to Guix package.
  (package (inherit font-ibm-plex) (name "woff2-ibm-plex-git")))

;;; ── emby-server-beta ─────────────────────────────────────────────────

(define-public emby-server-beta
  ;; AUR emby-server-beta: Emby media server beta; proprietary binary; 14 votes.
  ;; https://emby.media/server-downloads.html; binary .deb extraction.
  ;; NEEDS_RECIPE_DESIGN; LICENSE_REVIEW_NEEDED (Emby proprietary license).
  (package (inherit iwd) (name "emby-server-beta")))

;;; ── brightness-slider-git ────────────────────────────────────────────

(define-public brightness-slider-git
  ;; AUR brightness-slider-git: GNOME brightness slider applet from git; 1 vote.
  ;; https://github.com/brightnessslider/brightness-slider; Python/GNOME Shell.
  ;; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "brightness-slider-git")))

;;; ── tsql-bin ─────────────────────────────────────────────────────────

(define-public tsql-bin
  ;; AUR tsql-bin: T-SQL query CLI binary; Go; 1 vote.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "tsql-bin")))

;;; ── gbdk-2020 ────────────────────────────────────────────────────────

(define-public gbdk-2020
  ;; AUR gbdk-2020: Game Boy Development Kit 2020; C compiler + libraries; 1 vote.
  ;; https://github.com/gbdk-2020/gbdk-2020; cmake recipe.
  ;; No Guix equiv; NEEDS_RECIPE_DESIGN.
  (package (inherit iwd) (name "gbdk-2020")))

;;; ── wleave ───────────────────────────────────────────────────────────

(define-public wleave
  ;; AUR wleave 1.0: Wayland logout menu; GTK3/C; 1 vote.
  ;; https://github.com/AMNatty/wleave; meson recipe.
  ;; Guix ships wlogout 1.2.2 (similar). wleave is a different implementation.
  ;; No Guix wleave; NEEDS_RECIPE_DESIGN for meson recipe.
  (package (inherit wlogout) (name "wleave")))
