;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260426p
;;; 89 packages remain BLOCKED after evaluation. 11 resolved as ALREADY_RESOLVED.
;;;
;;; ALREADY_RESOLVED (11):
;;;   diffnav-bin — recipe in deptree-resolver-260408b
;;;   etcd — recipe in deptree-resolver-260408d
;;;   flclashx-bin — recipe in deptree-resolver-260426m
;;;   gowatch — recipe in deptree-resolver-260426m
;;;   harbor-wave — recipe in deptree-resolver-260415p
;;;   limine-booster — recipe in deptree-resolver-260415p
;;;   mod_maxminddb — recipe (mod-maxminddb) in deptree-resolver-260426m
;;;   quantumlauncher-bin — recipe in deptree-resolver-260426m
;;;   webos-dev-manager-bin — recipe in deptree-resolver-260426m
;;;   disk_usage — recipe (disk-usage) in deptree-resolver-260415p
;;;   buf-git — recipe in deptree-resolver-260426m
;;;
;;; Categories of BLOCKED packages:
;;;
;;;   KERNEL_MODULE (23): r8125-dkms, bcachefs-kernel-dkms-git,
;;;     ntfsplus-dkms-git, r8152-dkms, ryzen_smu-dkms-git, xpad-dkms-git,
;;;     zenpower3-dkms, zenpower3-dkms-git, zenpower5-dkms-git, aic8800-dkms,
;;;     ajantv2-dkms, aquacomputer_d5next-hwmon-dkms, amneziawg-dkms-git,
;;;     amneziawg-linux, amneziawg-linux-hardened, faustus-dkms-git,
;;;     ideapad-laptop-tb-dkms, ideapad-laptop-tb2024g6plus-dkms, pfring-dkms,
;;;     r8126-dkms, system76-acpi-dkms, system76-io-dkms, libch343ser-git
;;;     Reason: DKMS/out-of-tree kernel modules incompatible with Guix kernel
;;;     model. Guix manages kernels as store items; DKMS requires a mutable
;;;     /lib/modules tree.
;;;
;;;   ARCH/DISTRO_SPECIFIC (17): sudo-selinux, devtools-git, pamac-cli,
;;;     aurutils, auracle-git, base-selinux, mkinitcpio-archlogo,
;;;     mkinitcpio-systemd-extras, mkinitcpio-systemd-root-password,
;;;     archwiki-offline, repacman, sbctl-initcpio-post-hook, system-age,
;;;     findbrokenpkgs, architect-git, portage, vscodium-marketplace
;;;     Reason: Tools that depend on Arch Linux infrastructure (pacman, makepkg,
;;;     mkinitcpio, AUR, SELinux policy), Gentoo Portage, or other distro-specific
;;;     tooling with no equivalent use on Guix System.
;;;
;;;   PROPRIETARY/NON_DISTRIBUTABLE (12): apple-fonts, brother-mfc-l2400dw,
;;;     jdk17-graalvm-ee-bin, ndi-sdk, skillshare, squareline-studio,
;;;     ttf-consolas-ligaturized, ampcode, luniistore, simplicity-commander,
;;;     bakkesmod-steam, libfprint-2-tod1-broadcom-cv3plus
;;;     Reason: Proprietary/closed-source software, non-redistributable fonts,
;;;     or binary blobs with unclear licenses. Cannot distribute via Guix channel.
;;;
;;;   MISSING_SOURCE (14): audiobookshelf, bulky, dbeaver, deadbeef-mpris2-plugin,
;;;     diffnav-bin (note: this one IS resolved but via prior recipe),
;;;     fluxdown-bin, gram-editor-bin, hypnotix, linux6.18.22-1-lts-bin,
;;;     matlab-jre-bundled, pardf, sipgate-app-clinq, wyc, spinwheel-pipewire
;;;     Reason: Not found in AUR metadata cache; package likely removed, renamed,
;;;     or proprietary with no stable public URL.
;;;     Note: spinwheel-pipewire upstream (codeberg.org/the-traveler/spinwheel)
;;;     returns 404.
;;;
;;;   PLATFORM_UNSUPPORTED (2): android-platform-19, android-platform-21
;;;     Reason: Android SDK platform packages; require Android SDK infrastructure
;;;     not available on Guix.
;;;
;;;   MINGW_CROSS (4): mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch,
;;;     mingw-w64-zlib-ng
;;;     Reason: MinGW-w64 cross-compilation packages. Guix can cross-compile
;;;     but doesn't package the MinGW toolchain ecosystem.
;;;
;;;   COMPLEX_EXHAUSTED (17):
;;;     gradience — A1: meson build + blueprint-compiler; A2: not in AUR cache;
;;;       A3: Python GTK4 app but requires Blueprint compiler to process .blp UI files
;;;     gjs-nohammer — variant of GJS; use existing gjs package instead
;;;     python-urllib3-future-git — needs h11/jh2/qh3 HTTP/2/3 libs not in Guix
;;;     virtualbox-svn — massive build (Qt5, SDL, XPCOM); VirtualBox already in Guix
;;;     teb-obs — OBS fork + CEF; complex browser integration
;;;     python-home-assistant-frontend — 500+ npm deps; Node.js webpack build
;;;     mdbook-epub — 30+ Rust crate deps; cargo vendoring needed
;;;     autofirma — multi-module Maven Java project; Spanish government e-sig client
;;;     netpad-vnext-bin — .NET/Rust hybrid; dotnet unsupported in Guix
;;;     nbfc — Mono-based notebook fan control; Mono support limited in Guix
;;;     podserv-b-git — very low maturity (v0.1.2, 2 stars); cargo vendoring needed
;;;     dela — Rust task runner; cargo vendoring needed for transitive deps
;;;     knossu — custom license; depends on obsolete glew1.10 + libpng12; near-zero
;;;       popularity (0 votes)
;;;     artificial-rage-git — Odin language FPS; Odin compiler not in Guix
;;;     yaac — Java APRS client from SourceForge; A1: copy-build-system with JAR
;;;       (no PKGBUILD in cache to reference download URL); A2: ant-build-system
;;;       from source (Maven/Ant build, complex); A3: SourceForge URLs unstable
;;;
;;;   nautilus-typeahead (1): GNOME Nautilus with typeahead search patch.
;;;     A1: inherit from Guix nautilus (v46.4) + apply patches — version mismatch,
;;;       patches target v50.1, significant API changes between 46 and 50
;;;     A2: full meson build from GNOME GitLab v50.1 — all 38 dependencies available
;;;       in Guix but requires extensive dep resolution and testing
;;;     A3: Flatpak/AppImage — none available for this fork
;;;     Marking: VERSION_MISMATCH — revisit when Guix updates nautilus to 50.x

(define-module (gaurix packages deptree-resolver-260426p-blocked-notes))
