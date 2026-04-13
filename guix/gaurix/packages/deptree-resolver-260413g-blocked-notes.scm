;;; deptree-resolver-260413g-blocked-notes.scm
;;; Generated: 2026-04-13T12:30:13.799329+00:00
;;; Blocked packages: 72

(define-module (gaurix packages deptree-resolver-260413g-blocked-notes))

;;; [SOURCE_UNAVAILABLE] anbox-git (#58)
;;;   Package removed from AUR; project discontinued; A1: clone archived repo — no maintained source; A2: use Waydroid instead; A3: check GitHub archive — only stale 2021 code remains

;;; [SOURCE_UNAVAILABLE] linux6.19.8.arch1-1-bin (#7510)
;;;   Obsolete versioned kernel binary; removed from AUR; no download source available

;;; [SOURCE_UNAVAILABLE] linux6.19.8.arch1-1-docs-bin (#7512)
;;;   Obsolete versioned kernel docs binary; removed from AUR

;;; [SOURCE_UNAVAILABLE] linux6.19.8.arch1-1-headers-bin (#7511)
;;;   Obsolete versioned kernel headers binary; removed from AUR

;;; [SOURCE_UNAVAILABLE] linux6.19.9.arch1-1-bin (#9670)
;;;   Obsolete versioned kernel binary; removed from AUR

;;; [SOURCE_UNAVAILABLE] linux6.19.9.arch1-1-docs-bin (#9672)
;;;   Obsolete versioned kernel docs binary; removed from AUR

;;; [SOURCE_UNAVAILABLE] linux6.19.9.arch1-1-headers-bin (#9671)
;;;   Obsolete versioned kernel headers binary; removed from AUR

;;; [SOURCE_UNAVAILABLE] linux6.19.9.zen1-1-zen-bin (#9956)
;;;   Obsolete versioned zen kernel binary; removed from AUR

;;; [SOURCE_UNAVAILABLE] linux6.19.9.zen1-1-zen-docs-bin (#9958)
;;;   Obsolete versioned zen kernel docs binary; removed from AUR

;;; [SOURCE_UNAVAILABLE] linux6.19.9.zen1-1-zen-headers-bin (#9957)
;;;   Obsolete versioned zen kernel headers binary; removed from AUR

;;; [SOURCE_UNAVAILABLE] nvidia-vulkan-dkms (#548)
;;;   Removed from AUR; NVIDIA Vulkan beta driver now merged into main nvidia-dkms; no separate package source

;;; [SOURCE_UNAVAILABLE] openai-codex-autoup-bin (#1578)
;;;   Removed from AUR; OpenAI Codex auto-updater binary; product discontinued

;;; [SOURCE_UNAVAILABLE] opensc-p11-kit-module (#7333)
;;;   Removed from AUR; OpenSC PKCS#11 module for p11-kit; functionality merged into opensc package

;;; [SOURCE_UNAVAILABLE] projtlauncher (#6759)
;;;   Removed from AUR; no upstream source found; project appears abandoned

;;; [SOURCE_UNAVAILABLE] shimmy-bin (#7482)
;;;   Removed from AUR; no upstream source or binary download available

;;; [SOURCE_UNAVAILABLE] subs2srs-git (#2878)
;;;   Removed from AUR; .NET/WinForms app for Anki flashcard generation; A1: source repo unavailable; A2: Windows-only application

;;; [SOURCE_UNAVAILABLE] vivaldi-ffmpeg-codecs (#24)
;;;   Removed from AUR; Vivaldi-specific ffmpeg codec build; A1: functionality now bundled with vivaldi-stable; A2: chromium-codecs-ffmpeg-extra provides same; A3: build from chromium source — too complex

;;; [SOURCE_UNAVAILABLE] whatsapp-for-linux (#46)
;;;   Removed from AUR; WhatsApp web wrapper using WebKitGTK; A1: GitHub repo may still exist but AUR package gone; A2: use browser-based WhatsApp Web; A3: Flatpak available but out of scope

;;; [SOURCE_UNAVAILABLE] zettlr (#38)
;;;   Removed from AUR; Electron-based Markdown editor; A1: build from GitHub source — Electron + npm + 800 deps; A2: use AppImage — not in AUR; A3: Flatpak available but out of scope

;;; [ARCH_SPECIFIC] pac-pacman-aliases (#9004)
;;;   Shell aliases for pacman commands; tightly coupled to pacman CLI; A1: adapt for Guix — aliases reference pacman internals; A2: create Guix-native equivalent — different CLI; A3: ship as-is — non-functional without pacman

;;; [ARCH_SPECIFIC] pacman-log-orphans-hook (#11596)
;;;   Pacman hook to log orphan packages; uses alpm hooks API; A1: port to Guix profile hook — different hook mechanism; A2: cron job alternative — loses pacman integration; A3: ship script only — non-functional without pacman

;;; [ARCH_SPECIFIC] pipewire-enable-bluez5 (#3243)
;;;   Pacman hook to auto-enable PipeWire Bluez5; A1: Guix service config handles this natively; A2: shell script — already handled by Guix PipeWire service; A3: no-op on Guix

;;; [ARCH_SPECIFIC] systemd-boot-pacman-hook (#1584)
;;;   Pacman hook for systemd-boot updates; A1: Guix bootloader config handles this; A2: manual script — Guix reconfigure already updates bootloader; A3: no equivalent needed

;;; [ARCH_SPECIFIC] localepurge-hook (#1130)
;;;   Pacman hook for locale cleanup; depends on localepurge + alpm hooks; A1: Guix handles locale at system level; A2: guix gc already handles cleanup; A3: no-op on Guix

;;; [ARCH_SPECIFIC] paccache-hook (#11783)
;;;   Pacman hook for package cache cleanup; depends on pacman-contrib; A1: guix gc equivalent — different mechanism; A2: cron-based cleanup — loses hook integration; A3: non-functional without pacman

;;; [ARCH_SPECIFIC] yaycache-hook (#15341)
;;;   Hook for yay AUR helper cache cleanup; depends on yaycache + pacman; A1: no AUR helper concept in Guix; A2: channel-level caching different; A3: non-functional

;;; [ARCH_SPECIFIC] ancient-packages (#3325)
;;;   Lists packages no longer in repos; depends on package-query/pacman; A1: guix refresh provides similar function; A2: rewrite for Guix — different package DB; A3: non-functional without pacman

;;; [ARCH_SPECIFIC] mandb-instant-update (#10058)
;;;   Pacman hook for man-db updates; A1: Guix profile hook handles man-db; A2: post-install script — Guix handles via profile; A3: no-op on Guix

;;; [ARCH_SPECIFIC] arch-gdm-theme-list (#9822)
;;;   Arch Linux branded GDM theme; ships Arch-specific logos and branding; A1: rebrand for Guix — loses purpose; A2: generic GDM theme — already available; A3: Arch-only branding

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-japanese (#12925)
;;;   Microsoft Windows 10 Japanese fonts; requires Windows ISO extraction + MS license acceptance; A1: extract from ISO — license prohibits redistribution; A2: use Noto CJK fonts instead; A3: user-provided ISO extraction script

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-korean (#12926)
;;;   Microsoft Windows 10 Korean fonts; requires Windows ISO + license; same restrictions as Japanese variant

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-other (#12931)
;;;   Microsoft Windows 10 misc fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-sea (#12927)
;;;   Microsoft Windows 10 SEA fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-thai (#12928)
;;;   Microsoft Windows 10 Thai fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-zh_cn (#12929)
;;;   Microsoft Windows 10 Simplified Chinese fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-zh_tw (#12930)
;;;   Microsoft Windows 10 Traditional Chinese fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-japanese (#22454)
;;;   Microsoft Windows 11 Japanese fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-korean (#22455)
;;;   Microsoft Windows 11 Korean fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-other (#22460)
;;;   Microsoft Windows 11 misc fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-sea (#22456)
;;;   Microsoft Windows 11 SEA fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-thai (#22457)
;;;   Microsoft Windows 11 Thai fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-zh_cn (#22458)
;;;   Microsoft Windows 11 Simplified Chinese fonts; requires Windows ISO + license

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-zh_tw (#22459)
;;;   Microsoft Windows 11 Traditional Chinese fonts; requires Windows ISO + license

;;; [DKMS_KERNEL_MODULE] new-lg4ff-dkms-git (#11866)
;;;   Logitech force feedback kernel module; requires linux-module-build-system with matching kernel headers; A1: DKMS package — Guix linux-module needs specific kernel pairing; A2: build out-of-tree — complex kernel version matching; A3: upstream merge request pending

;;; [DKMS_KERNEL_MODULE] amneziawg-dkms (#11762)
;;;   AmneziaWG VPN kernel module; requires DKMS + kernel headers; A1: linux-module-build-system — needs kernel version matching; A2: userspace alternative (amneziawg-go) — different package; A3: wait for kernel mainline merge

;;; [DKMS_KERNEL_MODULE] linux-cachyos-lts (#1755)
;;;   CachyOS LTS kernel with BORE scheduler; full kernel build with custom patches; A1: linux-libre fork — patches not trivially portable; A2: binary kernel — architecture mismatch with Guix initrd; A3: kernel config extraction — CachyOS-specific toolchain

;;; [DKMS_KERNEL_MODULE] linux-cachyos (#1070)
;;;   CachyOS kernel with EEVDF+LTO+AutoFDO; full kernel build with Rust support; A1: custom kernel recipe — requires Rust toolchain in kernel build; A2: binary import — initrd incompatible; A3: patch-only approach — CachyOS patches too divergent

;;; [DKMS_KERNEL_MODULE] linux-cachyos-rc (#10770)
;;;   CachyOS RC kernel; bleeding-edge with BORE+LTO; same issues as linux-cachyos plus unstable API

;;; [NEEDS_RECIPE_DESIGN] nvidia-utils-beta (#12012)
;;;   NVIDIA beta driver utilities; proprietary driver with kernel module integration, OpenGL/Vulkan ICDs, systemd services; A1: extract userspace utils from .run installer — needs matching kernel module; A2: use nonguix nvidia-driver — beta version not in nonguix; A3: binary repack — complex library path patching

;;; [NEEDS_RECIPE_DESIGN] python-opentelemetry-exporter-otlp-proto-common (#12066)
;;;   OpenTelemetry OTLP protobuf encoding; depends on full opentelemetry-sdk/api/proto chain not in Guix; A1: pyproject-build-system — blocked by 5+ missing deps; A2: package entire otel chain — 15+ packages needed; A3: vendor deps — API compatibility issues

;;; [NEEDS_RECIPE_DESIGN] sonic-win (#11979)
;;;   KWin fork with X11 ports; full KDE Plasma/KF6 dependency chain; A1: cmake-build-system — needs 50+ KDE/Qt deps; A2: inherit kwin and patch — Guix kwin version mismatch; A3: binary — no standalone binary available

;;; [NEEDS_RECIPE_DESIGN] lib32-xrizer (#256)
;;;   32-bit OpenVR-to-OpenXR translation; requires multilib Rust build; A1: cross-compile — Guix lacks lib32 Rust toolchain; A2: 64-bit only — breaks 32-bit VR apps; A3: Guix multilib support incomplete

;;; [NEEDS_RECIPE_DESIGN] plasma-workspace-povd (#2890)
;;;   KDE Plasma Workspace fork for per-output virtual desktops; massive dep chain (100+ packages); A1: cmake-build-system — needs full Plasma 6 stack; A2: patch existing plasma-workspace — version sync issues; A3: binary — none available

;;; [NEEDS_RECIPE_DESIGN] yabridgectl-wine10-git (#11948)
;;;   Yabridge controller for Wine 10; Rust/Meson with Wine, Boost, ASIO deps; A1: cargo+meson hybrid build — complex multi-stage; A2: binary from yabridge releases — wine10-specific not released; A3: build yabridge chain first — 3+ packages

;;; [NEEDS_RECIPE_DESIGN] python-opentelemetry-exporter-zipkin-proto-http (#12072)
;;;   Zipkin protobuf HTTP exporter; depends on opentelemetry-sdk chain; A1: pyproject — blocked by SDK chain (same as otlp-proto-common); A2: vendor deps; A3: package otel chain first

;;; [NEEDS_RECIPE_DESIGN] qt6-base-hifps (#12026)
;;;   Qt6 fork with high-FPS patches; requires full Qt6 source build (~2h); A1: inherit qt6-base + patches — qt6 version must match; A2: binary — no prebuilt available; A3: patch extraction — hifps patches may not apply cleanly

;;; [NEEDS_RECIPE_DESIGN] lib32-libudev0-shim (#11976)
;;;   32-bit libudev0 compatibility shim; Guix lacks multilib/32-bit support; A1: cross-compile for i686 — complex ABI compat; A2: skip — limited 64-bit use case; A3: docker/container approach — out of scope

;;; [NEEDS_RECIPE_DESIGN] lib32-libtxc_dxtn (#10703)
;;;   32-bit S3TC texture compression; requires lib32-mesa; A1: cross-compile — needs 32-bit mesa; A2: mesa now includes S3TC — may be obsolete; A3: Guix multilib incomplete

;;; [NEEDS_RECIPE_DESIGN] linux-zen-versioned-docs-bin (#9955)
;;;   Metapackage for versioned zen kernel docs; depends on specific kernel version binary not available; A1: create matching kernel package — full kernel build; A2: skip — metapackage with circular dep; A3: provide generic zen docs

;;; [NEEDS_RECIPE_DESIGN] linux-zen-versioned-headers-bin (#9954)
;;;   Metapackage for versioned zen kernel headers; depends on specific kernel version binary; A1: create matching kernel — full build; A2: skip — metapackage; A3: provide generic zen headers

;;; [NEEDS_RECIPE_DESIGN] oopz (#3480)
;;;   OOPZ desktop client; Electron wrapper requiring electron39 (not in Guix); A1: package electron39 first — massive undertaking (Chromium-based); A2: use system electron — version mismatch; A3: AppImage — none available

;;; [NEEDS_RECIPE_DESIGN] youtube-music-desktop (#3192)
;;;   YouTube Music web-app wrapper; depends on qtws-base (Qt Web Shell, not in Guix); A1: package qtws-base first — Qt5 WebEngine wrapper; A2: use electron alternative — different project; A3: browser bookmark — not a package

;;; [NEEDS_RECIPE_DESIGN] keychron-q3-max-udev (#6765)
;;;   Udev rule for Keychron Q3 Max; depends on keychron-link-udev (not in Guix/AUR chain unclear); A1: standalone udev rule — need device IDs from keychron-link-udev; A2: combine into single package; A3: extract udev rules from keychron docs

;;; [NEEDS_RECIPE_DESIGN] lib32-zix (#2584)
;;;   32-bit zix C library; meson build but Guix lacks multilib; A1: cross-compile for i686 — meson cross-file needed; A2: 64-bit only — breaks lib32 dependents; A3: Guix multilib support incomplete

;;; [NEEDS_RECIPE_DESIGN] bcompare-cinnamon (#1980)
;;;   Cinnamon service menus for Beyond Compare; depends on bcompare (proprietary, not packaged); A1: package bcompare first — proprietary license; A2: standalone menu files — non-functional without bcompare; A3: skip — proprietary dep chain

;;; [NEEDS_RECIPE_DESIGN] bcompare-kde4 (#1977)
;;;   KDE4 service menus for Beyond Compare; depends on bcompare (proprietary); same as bcompare-cinnamon

;;; [NEEDS_RECIPE_DESIGN] bcompare-kde6 (#1975)
;;;   KDE6 service menus for Beyond Compare; depends on bcompare (proprietary)

;;; [NEEDS_RECIPE_DESIGN] bcompare-mate (#1981)
;;;   MATE service menus for Beyond Compare; depends on bcompare (proprietary)

;;; [NEEDS_RECIPE_DESIGN] bcompare-nautilus (#1978)
;;;   GNOME/Nautilus service menus for Beyond Compare; depends on bcompare (proprietary)

;;; [NEEDS_RECIPE_DESIGN] bcompare-thunar (#1979)
;;;   Xfce/Thunar service menus for Beyond Compare; depends on bcompare (proprietary)

;;; [NEEDS_RECIPE_DESIGN] ninjarmm-ncplayer (#7498)
;;;   NinjaRMM remote access agent; proprietary binary with custom protocol; A1: binary repack — needs account/license; A2: extract from installer — no public URL; A3: proprietary ecosystem

;;; [NEEDS_RECIPE_DESIGN] nautilus-megasync (#9392)
;;;   MEGA Cloud nautilus extension; proprietary binary; A1: package megasync first — proprietary; A2: standalone extension — needs megasync SDK; A3: use rclone instead
