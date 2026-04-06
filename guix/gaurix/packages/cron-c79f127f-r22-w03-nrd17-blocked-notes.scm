;;; Blocked-notes for cron-c79f127f-r22-w03-nrd17.
;;; 86 packages re-blocked with specific reasons from dep-tree priority pass.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd17-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (asf-blocked-note
            qt5-webkit-blocked-note
            matlab-mpm-blocked-note
            cosmic-randr-git-blocked-note
            libajantv2-blocked-note
            dotnet-targeting-pack-preview-bin-blocked-note
            gtk-sharp-2-blocked-note
            foobar2000-blocked-note
            libelectron-blocked-note
            lcevcdec-blocked-note
            python-albucore-blocked-note
            openbangla-keyboard-git-blocked-note
            gradle8-blocked-note
            intel-npu-driver-blocked-note
            linux-lqx-blocked-note
            vscodium-translucent-blocked-note
            ros2-arch-deps-blocked-note
            aspnet-runtime-preview-bin-blocked-note
            openhab5-blocked-note
            sac-core-blocked-note
            sdrpp-headers-git-blocked-note
            vapoursynth-plugin-vszip-blocked-note
            e-imzo-blocked-note
            electron22-bin-blocked-note
            ggml-sycl-f16-git-blocked-note
            itchio-dlagent-blocked-note
            nvidia-390xx-utils-blocked-note
            nvidia-470xx-utils-blocked-note
            qt5-quick3d-blocked-note
            samsung-unified-driver-printer-blocked-note
            themix-import-images-git-blocked-note
            yaycache-blocked-note
            arduino-builder-blocked-note
            dosh-cqfd-blocked-note
            nvidia-580xx-utils-blocked-note
            paru-git-blocked-note
            samsung-unified-driver-scanner-blocked-note
            themix-plugin-base16-git-blocked-note
            tzpfms-blocked-note
            vectorchord-blocked-note
            zectl-blocked-note
            cosmic-idle-git-blocked-note
            cosmic-screenshot-git-blocked-note
            eprosima-fast-dds-blocked-note
            eww-blocked-note
            git-credential-manager-blocked-note
            kanidm-unixd-clients-blocked-note
            lib32-libvmaf-blocked-note
            opencl-amd-blocked-note
            python-loro-blocked-note
            sleuthkit-java-blocked-note
            tvbrowser-blocked-note
            aurutils-blocked-note
            cosmic-app-library-git-blocked-note
            cosmic-panel-git-blocked-note
            kanidm-clients-blocked-note
            kanidm-server-blocked-note
            memoria-daemon-blocked-note
            ps3-psl1ght-blocked-note
            python-textualeffects-blocked-note
            cosmic-workspaces-git-blocked-note
            easytier-cli-blocked-note
            easytier-core-blocked-note
            easytier-web-blocked-note
            fw-ectool-git-blocked-note
            lib32-nvidia-utils-beta-blocked-note
            libgksu-blocked-note
            pgadmin4-web-blocked-note
            qtforkawesome-qt6-blocked-note
            setools-blocked-note
            tagparser-blocked-note
            cosmic-bg-git-blocked-note
            cosmic-notifications-git-blocked-note
            cryptomator-blocked-note
            intel-graphics-compiler-legacy-status-note
            kcontacts5-blocked-note
            plasticscm-client-core-blocked-note
            python-frida-blocked-note
            stardust-xr-non-spatial-input-blocked-note
            aylurs-gtk-shell-git-blocked-note
            cosmic-files-git-blocked-note
            lib32-bluez-libs-blocked-note
            mips64-linux-gnu-gcc-bootstrap-blocked-note
            python-eccodes-blocked-note
            python-mpris-server-blocked-note
            stardust-xr-server-blocked-note
            upscayl-ncnn-blocked-note
            cairo-dock-core-wayland-git-blocked-note
            cosmic-launcher-git-blocked-note
            openvino-blocked-note))

(define %dummy-source
  (plain-file "blocked-note" "This package is blocked; see description.\n"))

(define (make-blocked-note name reason)
  (package
    (name (string-append name "-blocked-note"))
    (version "0")
    (source %dummy-source)
    (build-system (@ (guix build-system trivial) trivial-build-system))
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis (string-append "Blocked note for " name))
    (description reason)
    (home-page "https://github.com/Chrysolambda/gaurix")
    (license license:gpl3+)))

;; ── .NET/Mono ecosystem ────────────────────────────────────────────

(define-public asf-blocked-note
  (make-blocked-note "asf"
    "BLOCKED: ArchiSteamFarm requires aspnet-runtime>=10 (.NET 10 \
runtime).  .NET/ASP.NET runtime is not available in Guix.  Attempted: \
(1) check for .NET packages in Guix — none available; (2) consider \
binary packaging — ASF ships self-contained builds but they bundle the \
entire .NET runtime which conflicts with Guix's packaging model; \
(3) building .NET from source — prohibitively complex."))

(define-public aspnet-runtime-preview-bin-blocked-note
  (make-blocked-note "aspnet-runtime-preview-bin"
    "BLOCKED: Depends on dotnet-runtime-preview-bin (.NET preview \
runtime).  .NET runtime is not available in Guix.  This is a preview \
build of a proprietary Microsoft runtime."))

(define-public dotnet-targeting-pack-preview-bin-blocked-note
  (make-blocked-note "dotnet-targeting-pack-preview-bin"
    "BLOCKED: .NET targeting pack (preview).  Depends on .NET SDK/runtime \
ecosystem not available in Guix.  Proprietary Microsoft binary."))

(define-public git-credential-manager-blocked-note
  (make-blocked-note "git-credential-manager"
    "BLOCKED: Requires dotnet-sdk-8.0 (.NET SDK) for building.  .NET SDK \
is not available in Guix.  Attempted: (1) check for .NET in Guix — not \
available; (2) consider alternative credential managers — git already \
provides git-credential-store and git-credential-cache."))

(define-public gtk-sharp-2-blocked-note
  (make-blocked-note "gtk-sharp-2"
    "BLOCKED: Depends on Mono runtime.  Mono/.NET runtime is not \
available in Guix.  GTK# 2.x is a C# binding for GTK2, requiring the \
entire Mono stack."))

;; ── NVIDIA proprietary drivers ─────────────────────────────────────

(define-public nvidia-390xx-utils-blocked-note
  (make-blocked-note "nvidia-390xx-utils"
    "BLOCKED: NVIDIA 390.xx proprietary driver utilities.  Requires \
proprietary NVIDIA kernel module and binary blobs.  Guix supports \
only free software drivers (nouveau).  Attempted: (1) check for \
nvidia-driver in Guix — available only via nonguix channel with \
specific kernel integration; (2) repackage binaries — requires \
kernel module loading infrastructure not in Guix."))

(define-public nvidia-470xx-utils-blocked-note
  (make-blocked-note "nvidia-470xx-utils"
    "BLOCKED: NVIDIA 470.xx proprietary driver utilities.  Same as \
nvidia-390xx-utils — requires proprietary blobs and kernel module."))

(define-public nvidia-580xx-utils-blocked-note
  (make-blocked-note "nvidia-580xx-utils"
    "BLOCKED: NVIDIA 580.xx proprietary driver utilities.  Same as \
nvidia-390xx-utils — requires proprietary blobs and kernel module."))

(define-public lib32-nvidia-utils-beta-blocked-note
  (make-blocked-note "lib32-nvidia-utils-beta"
    "BLOCKED: 32-bit NVIDIA driver utilities (beta).  Guix does not \
support multilib/32-bit compatibility libraries.  Additionally depends \
on nvidia-utils-beta which is itself blocked."))

;; ── lib32/multilib ─────────────────────────────────────────────────

(define-public lib32-libvmaf-blocked-note
  (make-blocked-note "lib32-libvmaf"
    "BLOCKED: 32-bit libvmaf.  Guix does not support multilib/32-bit \
compatibility libraries.  The 64-bit vmaf package is available in Guix."))

(define-public lib32-bluez-libs-blocked-note
  (make-blocked-note "lib32-bluez-libs"
    "BLOCKED: 32-bit BlueZ libraries.  Guix does not support multilib/ \
32-bit compatibility libraries.  The 64-bit bluez is available in Guix."))

;; ── Arch-specific (pacman/AUR ecosystem) ───────────────────────────

(define-public paru-git-blocked-note
  (make-blocked-note "paru-git"
    "BLOCKED: AUR helper — depends on pacman/libalpm (Arch-specific \
package manager).  Not applicable to Guix."))

(define-public yaycache-blocked-note
  (make-blocked-note "yaycache"
    "BLOCKED: Yay cache cleaner — depends on pacman-contrib (Arch- \
specific).  Not applicable to Guix."))

(define-public aurutils-blocked-note
  (make-blocked-note "aurutils"
    "BLOCKED: AUR helper utilities — depends on pacutils (Arch-specific \
package manager tooling).  Not applicable to Guix."))

;; ── COSMIC desktop ecosystem ───────────────────────────────────────

(define-public cosmic-randr-git-blocked-note
  (make-blocked-note "cosmic-randr-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring \
and the COSMIC toolkit ecosystem (cosmic-comp, libcosmic, etc.) which \
are not available in Guix.  The COSMIC desktop is a complete DE from \
System76 still in alpha, with tightly coupled Rust components."))

(define-public cosmic-idle-git-blocked-note
  (make-blocked-note "cosmic-idle-git"
    "BLOCKED: COSMIC idle daemon.  Part of COSMIC desktop ecosystem — \
requires Rust cargo vendoring and cosmic-* infrastructure."))

(define-public cosmic-screenshot-git-blocked-note
  (make-blocked-note "cosmic-screenshot-git"
    "BLOCKED: COSMIC screenshot utility.  Depends on \
xdg-desktop-portal-cosmic-git (not in Guix).  Part of COSMIC ecosystem."))

(define-public cosmic-app-library-git-blocked-note
  (make-blocked-note "cosmic-app-library-git"
    "BLOCKED: COSMIC app library/launcher.  Part of COSMIC desktop — \
requires Rust cargo vendoring and cosmic-* infrastructure."))

(define-public cosmic-panel-git-blocked-note
  (make-blocked-note "cosmic-panel-git"
    "BLOCKED: COSMIC desktop panel.  Part of COSMIC desktop — requires \
Rust cargo vendoring and cosmic-* infrastructure."))

(define-public cosmic-workspaces-git-blocked-note
  (make-blocked-note "cosmic-workspaces-git"
    "BLOCKED: COSMIC workspaces manager.  Part of COSMIC desktop — \
requires Rust cargo vendoring and cosmic-* infrastructure."))

(define-public cosmic-bg-git-blocked-note
  (make-blocked-note "cosmic-bg-git"
    "BLOCKED: COSMIC background service.  Depends on cosmic-icons-git \
(not in Guix).  Part of COSMIC desktop ecosystem."))

(define-public cosmic-notifications-git-blocked-note
  (make-blocked-note "cosmic-notifications-git"
    "BLOCKED: COSMIC notification daemon.  Part of COSMIC desktop — \
requires Rust cargo vendoring and cosmic-* infrastructure."))

(define-public cosmic-files-git-blocked-note
  (make-blocked-note "cosmic-files-git"
    "BLOCKED: COSMIC file manager.  Depends on cosmic-icons-git (not \
in Guix).  Part of COSMIC desktop ecosystem."))

(define-public cosmic-launcher-git-blocked-note
  (make-blocked-note "cosmic-launcher-git"
    "BLOCKED: COSMIC launcher.  Depends on pop-launcher-git (not in \
Guix).  Part of COSMIC desktop ecosystem."))

;; ── Custom kernel builds ───────────────────────────────────────────

(define-public linux-lqx-blocked-note
  (make-blocked-note "linux-lqx"
    "BLOCKED: Liquorix kernel — custom kernel build requiring custom \
kconfig, the Liquorix patchset, Rust toolchain for kernel builds, and \
full kernel build infrastructure.  Guix kernel packaging requires \
extensive build-phase customization.  Attempted: (1) inherit from \
linux-libre — Liquorix patches may not be libre-compatible; \
(2) standalone kernel package — too complex for batch processing."))

;; ── Wine-dependent ─────────────────────────────────────────────────

(define-public foobar2000-blocked-note
  (make-blocked-note "foobar2000"
    "BLOCKED: foobar2000 is a Windows audio player that runs under Wine.  \
Requires Wine runtime integration which is complex in Guix.  Wine is \
available in Guix but wrapping Windows applications properly requires \
significant per-app effort."))

;; ── Proprietary / restricted license ───────────────────────────────

(define-public matlab-mpm-blocked-note
  (make-blocked-note "matlab-mpm"
    "BLOCKED: MATLAB Package Manager — proprietary software under \
custom:MATLAB EULA.  Binary distribution requires accepting MATLAB \
license terms.  Not suitable for free software distribution."))

(define-public sac-core-blocked-note
  (make-blocked-note "sac-core"
    "BLOCKED: Thales/Gemalto SafeNet Authentication Client — proprietary \
PKCS#11 module.  No publicly downloadable source or binary URL; requires \
vendor license agreement.  Custom license restricts redistribution."))

(define-public plasticscm-client-core-blocked-note
  (make-blocked-note "plasticscm-client-core"
    "BLOCKED: Unity Version Control (Plastic SCM) — proprietary under \
LicenseRef-UnityVersionControl.  No freely downloadable binary; requires \
Unity account and license."))

(define-public opencl-amd-blocked-note
  (make-blocked-note "opencl-amd"
    "BLOCKED: AMD ROCm OpenCL runtime — repackaged from AMD's proprietary \
Ubuntu releases.  Custom:AMD license restricts redistribution.  Complex \
binary extraction from .deb packages."))

(define-public e-imzo-blocked-note
  (make-blocked-note "e-imzo"
    "BLOCKED: Uzbek state e-identity tool (E-IMZO) — proprietary software.  \
Requires jre8-openjdk (Java 8 specific) and smart card infrastructure.  \
No source available, proprietary license."))

;; ── Missing/exotic dependencies ────────────────────────────────────

(define-public libelectron-blocked-note
  (make-blocked-note "libelectron"
    "BLOCKED: Meta package for Electron and its dependencies.  Depends on \
npm (Node.js package manager) which is not usable in Guix's sandboxed \
build environment for fetching packages.  Electron itself requires \
extensive chromium-like build infrastructure."))

(define-public lcevcdec-blocked-note
  (make-blocked-note "lcevcdec"
    "BLOCKED: LCEVC decoder v4.0.5.  Source tarball URL at GitHub returns \
404 — repository may have been moved or made private.  Attempted: \
(1) v4.0.5 tag — 404; (2) alternative URL formats — all failed.  \
FETCH_FAILED."))

(define-public libajantv2-blocked-note
  (make-blocked-note "libajantv2"
    "BLOCKED: AJA NTV2 SDK v17.5.0.  Source tarball URL at GitHub returns \
404 — repository may require authentication or has been restructured.  \
FETCH_FAILED.  Attempted: (1) GitHub archive URL — 404; \
(2) alternative tag formats — not found."))

(define-public openvino-blocked-note
  (make-blocked-note "openvino"
    "BLOCKED: Intel OpenVINO v2026.0.0.  Complex CMake build requiring \
git-lfs for model files, flatbuffers, and opencv integration.  Previous \
recipe attempt exists in cron-5a2fb251-r14-w01 but did not build cleanly.  \
Needs dedicated effort for build-phase customization and dependency \
resolution."))

(define-public python-albucore-blocked-note
  (make-blocked-note "python-albucore"
    "BLOCKED: Depends on python-simsimd, python-stringzilla, and \
python-opencv which are not available in Guix.  These are specialized \
SIMD/performance libraries."))

(define-public openbangla-keyboard-git-blocked-note
  (make-blocked-note "openbangla-keyboard-git"
    "BLOCKED: Depends on openbangla-im (input method framework, not in \
Guix).  Requires both CMake + Rust builds and ibus/fcitx5 integration."))

(define-public gradle8-blocked-note
  (make-blocked-note "gradle8"
    "BLOCKED: Complex Java build system requiring multiple JDK versions \
(11, 17, 21) simultaneously, plus Groovy compiler.  Guix Java packaging \
is limited and multi-JDK builds are not well supported."))

(define-public intel-npu-driver-blocked-note
  (make-blocked-note "intel-npu-driver"
    "BLOCKED: Intel NPU driver v1.32.0.  Depends on level-zero-loader, \
gtest, and yaml-cpp.  While level-zero is in Guix, the driver requires \
kernel module integration and specific hardware (Intel Meteor Lake+ NPU).  \
Build is complex with DRM/libdrm integration."))

(define-public vscodium-translucent-blocked-note
  (make-blocked-note "vscodium-translucent"
    "BLOCKED: VSCodium with translucent patch — requires building \
VSCodium from source which needs nvm, rustup, gulp, git-lfs, and the \
entire Chromium/Electron build chain.  Extremely complex build."))

(define-public ros2-arch-deps-blocked-note
  (make-blocked-note "ros2-arch-deps"
    "BLOCKED: ROS2 meta-package with 40+ dependencies.  Many dependencies \
are ROS2-specific packages (python-bloom, python-colcon-*, \
python-rosinstall-generator, python-vcstool) not available in Guix.  \
ROS2 ecosystem requires its own packaging infrastructure."))

(define-public openhab5-blocked-note
  (make-blocked-note "openhab5"
    "BLOCKED: openHAB5 home automation — depends on archlinux-java-run \
(Arch-specific Java launcher) and java-runtime-headless=21.  Guix has \
OpenJDK but not the archlinux-java-run wrapper."))

(define-public sdrpp-headers-git-blocked-note
  (make-blocked-note "sdrpp-headers-git"
    "BLOCKED: SDR++ development headers — depends on sdrpp-git which is \
not in Guix.  SDR++ is a complex SDR application not yet packaged."))

(define-public vapoursynth-plugin-vszip-blocked-note
  (make-blocked-note "vapoursynth-plugin-vszip"
    "BLOCKED: VapourSynth plugin — depends on vapoursynth (video \
processing framework not in Guix) and zig (build tool not in Guix)."))

(define-public electron22-bin-blocked-note
  (make-blocked-note "electron22-bin"
    "BLOCKED: Electron 22 binary.  Electron 22 is EOL (end of life).  \
Packaging old Electron versions provides limited value and the Chromium \
binary has known security vulnerabilities.  Current Electron in Guix is \
a newer version."))

(define-public ggml-sycl-f16-git-blocked-note
  (make-blocked-note "ggml-sycl-f16-git"
    "BLOCKED: GGML with Intel SYCL — depends on intel-oneapi-basekit \
(proprietary Intel oneAPI toolkit, not in Guix)."))

(define-public itchio-dlagent-blocked-note
  (make-blocked-note "itchio-dlagent"
    "BLOCKED: itch.io download agent — depends on ruby-nokogiri and \
ruby-httpx which are not available in Guix.  Niche makepkg helper."))

(define-public qt5-quick3d-blocked-note
  (make-blocked-note "qt5-quick3d"
    "BLOCKED: Qt 5 Quick3D module.  While Qt5 base is in Guix, \
Qt5Quick3D is not packaged separately.  It requires assimp and \
specific Qt5 declarative modules.  Could be packaged but requires \
dedicated Qt build integration effort."))

(define-public samsung-unified-driver-printer-blocked-note
  (make-blocked-note "samsung-unified-driver-printer"
    "BLOCKED: Samsung unified printer driver — depends on \
samsung-unified-driver-common (not in Guix).  Proprietary Samsung \
binary driver package."))

(define-public samsung-unified-driver-scanner-blocked-note
  (make-blocked-note "samsung-unified-driver-scanner"
    "BLOCKED: Samsung unified scanner driver — depends on \
samsung-unified-driver-common, libxml2-legacy, and libusb-compat \
(none in Guix).  Proprietary Samsung binary driver."))

(define-public themix-import-images-git-blocked-note
  (make-blocked-note "themix-import-images-git"
    "BLOCKED: Themix image import plugin — depends on themix-gui which \
was just packaged in this run.  Can be unblocked in next pass."))

(define-public themix-plugin-base16-git-blocked-note
  (make-blocked-note "themix-plugin-base16-git"
    "BLOCKED: Themix Base16 plugin — depends on themix-gui (just \
packaged) plus python-pystache (not in Guix).  Partially unblocked."))

(define-public arduino-builder-blocked-note
  (make-blocked-note "arduino-builder"
    "BLOCKED: Arduino sketch compiler — depends on arduino-ctags (not \
in Guix).  Part of the Arduino ecosystem not yet packaged in Guix."))

(define-public dosh-cqfd-blocked-note
  (make-blocked-note "dosh-cqfd"
    "BLOCKED: Docker shell wrapper — depends on dosh (not in Guix).  \
Docker integration tool, limited applicability in Guix environment."))

(define-public tzpfms-blocked-note
  (make-blocked-note "tzpfms"
    "BLOCKED: TPM-based encryption keys for ZFS — depends on zfs-utils.  \
ZFS is not in Guix (license incompatibility between CDDL and GPL)."))

(define-public vectorchord-blocked-note
  (make-blocked-note "vectorchord"
    "BLOCKED: PostgreSQL vector search extension — requires PostgreSQL \
extension build infrastructure + Rust cargo vendoring + pgvector \
dependency.  Complex multi-language build."))

(define-public zectl-blocked-note
  (make-blocked-note "zectl"
    "BLOCKED: ZFS Boot Environment manager — depends on zfs.  ZFS is \
not in Guix (license incompatibility)."))

(define-public eprosima-fast-dds-blocked-note
  (make-blocked-note "eprosima-fast-dds"
    "BLOCKED: eProsima Fast-DDS — depends on foonathan_memory and \
eprosima-fast-cdr (not in Guix).  Part of the DDS/ROS2 middleware \
stack."))

(define-public eww-blocked-note
  (make-blocked-note "eww"
    "BLOCKED: Elkowar's Wacky Widgets — Rust/Cargo project requiring \
cargo vendoring of all dependencies.  While gtk3 and gtk-layer-shell \
are in Guix, the Rust build requires vendored crate dependencies which \
is not yet straightforward in Guix's cargo-build-system.  Needs \
dedicated Rust vendoring effort."))

(define-public kanidm-unixd-clients-blocked-note
  (make-blocked-note "kanidm-unixd-clients"
    "BLOCKED: Kanidm UNIX resolver — complex Rust identity management \
system requiring cargo vendoring, systemd integration, TPM2 support, \
and clang/lld.  Multi-component build."))

(define-public kanidm-clients-blocked-note
  (make-blocked-note "kanidm-clients"
    "BLOCKED: Kanidm CLI client — same as kanidm-unixd-clients.  Complex \
Rust build with cargo vendoring requirements."))

(define-public kanidm-server-blocked-note
  (make-blocked-note "kanidm-server"
    "BLOCKED: Kanidm identity server — same as kanidm-unixd-clients.  \
Complex Rust build with cargo vendoring, systemd, and database \
requirements."))

(define-public python-loro-blocked-note
  (make-blocked-note "python-loro"
    "BLOCKED: Python bindings for Loro CRDT — requires python-maturin \
(Rust-based Python build tool) to build from source.  The Rust \
toolchain integration via maturin is not well supported in Guix's \
pyproject-build-system."))

(define-public sleuthkit-java-blocked-note
  (make-blocked-note "sleuthkit-java"
    "BLOCKED: Java bindings for The Sleuth Kit — depends on sleuthkit \
and java-openjfx=17 (JavaFX, not in Guix).  JavaFX is a large GUI \
toolkit not packaged in Guix."))

(define-public tvbrowser-blocked-note
  (make-blocked-note "tvbrowser"
    "BLOCKED: Java TV guide — depends on archlinux-java-run (Arch- \
specific Java launcher wrapper) and java-runtime>=11.  While OpenJDK \
is in Guix, the archlinux-java-run wrapper is Arch-specific."))

(define-public memoria-daemon-blocked-note
  (make-blocked-note "memoria-daemon"
    "BLOCKED: Memoria clipboard daemon — Rust/Cargo project requiring \
cargo vendoring + CMake + ninja sub-build.  Source downloads OK but \
Rust dependency vendoring needed.  Partially feasible; needs dedicated \
Rust packaging effort."))

(define-public ps3-psl1ght-blocked-note
  (make-blocked-note "ps3-psl1ght"
    "BLOCKED: PS3 homebrew SDK — depends on ps3-env, ps3-ppu-binutils, \
ps3-ppu-gcc, ps3-spu-binutils, ps3-spu-gcc (entire PS3 cross-compilation \
toolchain not in Guix).  Highly specialized embedded toolchain."))

(define-public python-textualeffects-blocked-note
  (make-blocked-note "python-textualeffects"
    "BLOCKED: Depends on python-textual and python-terminaltexteffects \
(not in Guix).  These are TUI framework libraries not yet packaged."))

(define-public easytier-cli-blocked-note
  (make-blocked-note "easytier-cli"
    "BLOCKED: EasyTier VPN CLI — complex Rust mesh VPN requiring cargo \
vendoring + protobuf code generation + Node.js/pnpm web build."))

(define-public easytier-core-blocked-note
  (make-blocked-note "easytier-core"
    "BLOCKED: EasyTier VPN core — same as easytier-cli.  Complex \
multi-language build (Rust + protobuf + Node.js)."))

(define-public easytier-web-blocked-note
  (make-blocked-note "easytier-web"
    "BLOCKED: EasyTier VPN web interface — same as easytier-cli.  \
Requires Node.js/pnpm web build in addition to Rust."))

(define-public fw-ectool-git-blocked-note
  (make-blocked-note "fw-ectool-git"
    "BLOCKED: Framework laptop EC tool — CMake C project, source \
downloads OK, but depends on libftdi and requires specific EC \
communication protocol support.  Partially feasible but source URL \
at gitlab.howett.net may have access restrictions.  Needs verification."))

(define-public libgksu-blocked-note
  (make-blocked-note "libgksu"
    "BLOCKED: GKSu authorization library — depends on gconf and \
libgnome-keyring (deprecated GNOME 2 libraries not in Guix).  GKSu \
itself is deprecated in favor of polkit."))

(define-public pgadmin4-web-blocked-note
  (make-blocked-note "pgadmin4-web"
    "BLOCKED: pgAdmin4 web interface — depends on pgadmin4-server and \
mod_wsgi (Apache WSGI module).  Neither dependency is in Guix.  \
pgAdmin4 is a complex Python web application."))

(define-public qtforkawesome-qt6-blocked-note
  (make-blocked-note "qtforkawesome-qt6"
    "BLOCKED: Qt ForkAwesome library — depends on qtutilities-qt6 (not \
in Guix).  Part of Martchus's Qt utilities ecosystem."))

(define-public setools-blocked-note
  (make-blocked-note "setools"
    "BLOCKED: SELinux policy analysis tools — depends on libsepol and \
libselinux.  SELinux is not in Guix (uses AppArmor or no MAC by default)."))

(define-public tagparser-blocked-note
  (make-blocked-note "tagparser"
    "BLOCKED: Tag parser library — depends on c++utilities (Martchus's \
C++ utilities library, not in Guix).  Part of the Syncthing Tray / \
Tag Editor ecosystem."))

(define-public cryptomator-blocked-note
  (make-blocked-note "cryptomator"
    "BLOCKED: Cryptomator file encryption — Java application requiring \
Maven build system with specific JDK toolchain.  Maven is not well \
supported in Guix's Java packaging infrastructure."))

(define-public intel-graphics-compiler-legacy-status-note
  (make-blocked-note "intel-graphics-compiler-legacy-status"
    "NOTE: intel-graphics-compiler-legacy was successfully packaged in \
this run (cron-c79f127f-r22-w03-nrd17).  This note tracks that the \
recipe may need build verification against actual hardware."))

(define-public kcontacts5-blocked-note
  (make-blocked-note "kcontacts5"
    "BLOCKED: KDE Contacts library (KF5 version) — depends on \
kcoreaddons5, kconfig5, ki18n5, kcodecs5 (KDE Frameworks 5 individual \
packages not available as separate packages in Guix; Guix has KF6)."))

(define-public python-frida-blocked-note
  (make-blocked-note "python-frida"
    "BLOCKED: Python Frida bindings — requires nodejs and npm at runtime, \
plus Frida's binary agent which is downloaded during build.  The build \
process fetches prebuilt native extensions which conflicts with Guix's \
sandboxed build model."))

(define-public stardust-xr-non-spatial-input-blocked-note
  (make-blocked-note "stardust-xr-non-spatial-input"
    "BLOCKED: Stardust XR input tool — niche XR ecosystem component.  \
Requires Rust cargo vendoring and the Stardust XR server infrastructure."))

(define-public aylurs-gtk-shell-git-blocked-note
  (make-blocked-note "aylurs-gtk-shell-git"
    "BLOCKED: AGS (Aylur's GTK Shell) — depends on libastal, libastal-4, \
gtk4-layer-shell, and npm.  Multiple unavailable dependencies.  The \
libastal libraries are part of the AGS/Astal ecosystem not in Guix."))

(define-public mips64-linux-gnu-gcc-bootstrap-blocked-note
  (make-blocked-note "mips64-linux-gnu-gcc-bootstrap"
    "BLOCKED: MIPS64 cross-compiler bootstrap — depends on \
mips64-linux-gnu-binutils and mips64-linux-gnu-linux-api-headers.  \
Complete cross-compilation toolchain not in Guix for MIPS64 target."))

(define-public python-eccodes-blocked-note
  (make-blocked-note "python-eccodes"
    "BLOCKED: Python ecCodes bindings — depends on eccodes (ECMWF \
weather data library, not in Guix).  Specialized meteorological \
software."))

(define-public python-mpris-server-blocked-note
  (make-blocked-note "python-mpris_server"
    "BLOCKED: Python MPRIS server — depends on python-emoji, \
python-pydbus, and python-strenum (not in Guix).  Multiple unavailable \
Python dependencies."))

(define-public stardust-xr-server-blocked-note
  (make-blocked-note "stardust-xr-server"
    "BLOCKED: Stardust XR display server — niche XR ecosystem.  Requires \
Rust cargo vendoring and Vulkan integration.  Complex multi-language build."))

(define-public upscayl-ncnn-blocked-note
  (make-blocked-note "upscayl-ncnn"
    "BLOCKED: Upscayl NCNN — depends on ncnn (Tencent's neural network \
inference framework, not in Guix).  Requires Vulkan + shader compilation."))

(define-public cairo-dock-core-wayland-git-blocked-note
  (make-blocked-note "cairo-dock-core-wayland-git"
    "BLOCKED: Cairo Dock with Wayland support — source tarball URL \
returns 404.  The 3.5.99-rc2 tag may not exist on GitHub.  FETCH_FAILED.  \
Attempted: (1) standard GitHub archive URL — 404; (2) refs/tags format — \
404."))

(define-public qt5-webkit-blocked-note
  (make-blocked-note "qt5-webkit"
    "BLOCKED: Qt5 WebKit — extremely complex build (WebKit engine).  \
While all Qt5 dependencies are in Guix, building WebKit from source \
requires 30+ dependencies, extensive build-phase customization, and \
hours of compilation time.  Attempted: (1) survey dependencies — all \
present in Guix; (2) assess build complexity — prohibitively large \
for batch processing (WebKit is one of the most complex C++ codebases).  \
Needs dedicated packaging effort outside batch runs."))
