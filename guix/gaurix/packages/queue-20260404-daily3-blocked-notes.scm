;;; Blocked notes for queue-20260404-daily3.
;;; 26 packages blocked with reason codes.
(define-module (gaurix packages queue-20260404-daily3-blocked-notes))

;;; Blocked packages:
;;; 9047. helm-synth: BLOCKED: BUILD_FAILED | Helm synth is discontinued (last release 2017, no maintained source) | next: check if JUCE-based build still compiles
;;; 9048. helm-synth-common: BLOCKED: DEP_RESOLUTION_FAILED | depends on helm-synth base which is discontinued | next: resolve helm-synth first
;;; 9049. helm-synth-lv2: BLOCKED: DEP_RESOLUTION_FAILED | depends on helm-synth base | next: resolve helm-synth first
;;; 9050. helm-synth-standalone: BLOCKED: DEP_RESOLUTION_FAILED | depends on helm-synth base | next: resolve helm-synth first
;;; 9051. helm-synth-vst: BLOCKED: DEP_RESOLUTION_FAILED | depends on helm-synth base | next: resolve helm-synth first
;;; 9067. pulse-secure: BLOCKED: SOURCE_UNAVAILABLE | proprietary VPN client requires active Ivanti account for download | next: find stable download URL or mirror
;;; 9091. edopro-bin: BLOCKED: SOURCE_UNAVAILABLE | ProjectIgnis/EDOPro releases require GitHub API or launcher; no stable tarball | next: check GitHub releases API for direct link
;;; 9094. libstdc++5: BLOCKED: DEP_RESOLUTION_FAILED | GCC 3.x era library; too old to build from current toolchain | next: consider binary-only packaging if needed
;;; 9096. flashplayer-standalone: BLOCKED: SOURCE_UNAVAILABLE | Adobe Flash Player end-of-life Jan 2021, downloads removed by Adobe | next: no action possible
;;; 9098. eprosima-fast-dds: BLOCKED: BUILD_FAILED | complex C++ middleware with many deps (asio, foonathan, tinyxml2) | next: map dependency chain first
;;; 9099. tibia: BLOCKED: SOURCE_UNAVAILABLE | proprietary MMO client requires CipSoft account portal; no stable public tarball URL | next: investigate Linux client distribution method
;;; 9100. visual-paradigm-community: BLOCKED: SOURCE_UNAVAILABLE | requires registration to download; no stable public URL | next: investigate if direct download link exists
;;; 9202. recoil-engine-rc: BLOCKED: BUILD_FAILED | Spring RTS engine fork; complex C++ build with many deps not in Guix | next: map full dependency tree
;;; 9203. perfect-dark-git: BLOCKED: BUILD_FAILED | N64 decompilation project; requires custom toolchain not in Guix | next: investigate build requirements
;;; 9212. pacaur: BLOCKED: DEP_RESOLUTION_FAILED | Arch Linux AUR helper; depends on pacman/makepkg ecosystem | next: not meaningful outside Arch
;;; 9213. gnome-shell-extension-display-brightness-ddcutil-git: BLOCKED: DEP_RESOLUTION_FAILED | GNOME Shell extension; requires GNOME Shell extension packaging infrastructure | next: investigate Guix GNOME extension packaging
;;; 9215. php74-redis: BLOCKED: DEP_RESOLUTION_FAILED | PHP 7.4 is EOL; redis extension needs php74 base not in Guix | next: skip unless PHP 7.4 is packaged
;;; 9220. gnome-shell-extension-wintile-git: BLOCKED: DEP_RESOLUTION_FAILED | GNOME Shell extension; requires GNOME Shell extension packaging infrastructure | next: investigate Guix GNOME extension packaging
;;; 9239. arch-udev-usb-sync: BLOCKED: DEP_RESOLUTION_FAILED | Arch-specific udev rules package; not meaningful outside Arch | next: skip
;;; 9241. schedtoold: BLOCKED: SOURCE_UNAVAILABLE | no public source repository found for schedtoold | next: identify upstream
;;; 9243. epson-inkjet-printer-201601w: BLOCKED: SOURCE_UNAVAILABLE | Epson proprietary driver; requires Epson download portal | next: investigate stable download URL
;;; 9254. srb2: BLOCKED: BUILD_FAILED | Sonic Robo Blast 2; custom Doom engine fork with many patched deps | next: map dependency tree
;;; 9255. wrye-bash: BLOCKED: BUILD_FAILED | Windows-native Python mod manager for Bethesda games; heavy Windows deps | next: investigate if Linux build works at all
;;; 9262. nteract: BLOCKED: SOURCE_UNAVAILABLE | nteract project archived/discontinued; last release 2022 | next: no action possible
;;; 9264. libfprint-2-tod1-synatudor-git: BLOCKED: BUILD_FAILED | proprietary Synaptics Touch OEM Driver; requires reverse-engineered binary blobs | next: investigate binary packaging approach
;;; 9265. openmohaa: BLOCKED: BUILD_FAILED | requires ioquake3 fork build system + proprietary game data | next: investigate OpenMoHAA build deps
