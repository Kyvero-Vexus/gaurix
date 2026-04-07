;;; Blocked-notes for auto-deptree-260406 packaging pass.
;;; 98 packages re-blocked with specific reasons from dependency-tree-driven resolution.

(define-module (gaurix packages auto-deptree-260406-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            asf-blocked-note
            qt5-webkit-blocked-note
            openvino-blocked-note
            matlab-mpm-blocked-note
            cosmic-randr-git-blocked-note
            foobar2000-blocked-note
            libelectron-blocked-note
            python-albucore-blocked-note
            openbangla-keyboard-git-blocked-note
            intel-npu-driver-blocked-note
            linux-lqx-blocked-note
            vscodium-translucent-blocked-note
            ros2-arch-deps-blocked-note
            aspnet-targeting-pack-preview-bin-blocked-note
            sac-core-blocked-note
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
            iscan-blocked-note
            nvidia-580xx-utils-blocked-note
            paru-git-blocked-note
            samsung-unified-driver-scanner-blocked-note
            themix-plugin-base16-git-blocked-note
            tzpfms-blocked-note
            vectorchord-blocked-note
            zectl-blocked-note
            cosmic-idle-git-blocked-note
            cosmic-screenshot-git-blocked-note
            dosh-cqfd-blocked-note
            eprosima-fast-dds-blocked-note
            eww-blocked-note
            lib32-libvmaf-blocked-note
            opencl-amd-blocked-note
            python-loro-blocked-note
            sleuthkit-java-blocked-note
            aurutils-blocked-note
            cosmic-app-library-git-blocked-note
            cosmic-panel-git-blocked-note
            kanidm-clients-blocked-note
            kanidm-server-blocked-note
            kanidm-unixd-clients-blocked-note
            ps3-psl1ght-blocked-note
            cosmic-workspaces-git-blocked-note
            easytier-cli-blocked-note
            easytier-core-blocked-note
            easytier-web-blocked-note
            memoria-daemon-blocked-note
            pgadmin4-web-blocked-note
            qtforkawesome-qt6-blocked-note
            cosmic-bg-git-blocked-note
            cosmic-notifications-git-blocked-note
            cryptomator-blocked-note
            lib32-nvidia-utils-beta-blocked-note
            plasticscm-client-core-blocked-note
            python-frida-blocked-note
            stardust-xr-non-spatial-input-blocked-note
            aylurs-gtk-shell-git-blocked-note
            cosmic-files-git-blocked-note
            lib32-bluez-libs-blocked-note
            mips64-linux-gnu-gcc-bootstrap-blocked-note
            stardust-xr-server-blocked-note
            tagparser-blocked-note
            upscayl-ncnn-blocked-note
            cairo-dock-core-wayland-git-blocked-note
            cosmic-launcher-git-blocked-note
            spotify-blocked-note
            vapoursynth-plugin-vsjetpack-blocked-note
            android-sdk-blocked-note
            dpt-rp1-py-blocked-note
            element-web-git-blocked-note
            epsonscan2-blocked-note
            llama-cpp-hip-blocked-note
            python-asyncpraw-blocked-note
            sidef-blocked-note
            themix-theme-oomox-git-blocked-note
            credentialsd-blocked-note
            obsidianctl-blocked-note
            python-twisterl-blocked-note
            xr-driver-git-blocked-note
            xrizer-git-blocked-note
            cosmic-applets-git-blocked-note
            cosmic-comp-git-blocked-note
            tl-render-blocked-note
            wf-shell-blocked-note
            kde-material-you-colors-blocked-note
            libpamac-full-blocked-note
            maliit-framework-blocked-note
            python-panel-blocked-note
            clightd-blocked-note
            libadwaita-yaru-git-blocked-note
            ))

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

;; ── ARCH_SPECIFIC (5 packages) ────────────────────────────────

(define-public yaycache-blocked-note
  (make-blocked-note "yaycache"
    "BLOCKED: Yay cache cleaner — depends on pacman-contrib (Arch-specific).  Not \
applicable to Guix."))

(define-public paru-git-blocked-note
  (make-blocked-note "paru-git"
    "BLOCKED: AUR helper — depends on pacman/libalpm (Arch-specific package \
manager).  Not applicable to Guix."))

(define-public aurutils-blocked-note
  (make-blocked-note "aurutils"
    "BLOCKED: AUR helper utilities — depends on pacutils (Arch-specific package \
manager tooling).  Not applicable to Guix."))

(define-public obsidianctl-blocked-note
  (make-blocked-note "obsidianctl"
    "BLOCKED: ObsidianOS A/B partition manager is specific to ObsidianOS Linux \
distribution.  Not applicable to Guix."))

(define-public libpamac-full-blocked-note
  (make-blocked-note "libpamac-full"
    "BLOCKED: Pamac package manager library depends on libalpm, flatpak snapd-glib, \
and Arch-specific infrastructure."))

;; ── COMPLEX_BUILD (8 packages) ────────────────────────────────

(define-public qt5-webkit-blocked-note
  (make-blocked-note "qt5-webkit"
    "BLOCKED: Qt5 WebKit requires building the entire WebKit engine from source with \
30+ dependencies.  Extremely complex build, multiple hours \
compilation, and significant patching needed."))

(define-public openvino-blocked-note
  (make-blocked-note "openvino"
    "BLOCKED: Intel OpenVINO v2026.0.0 requires git-lfs for model files, \
flatbuffers, opencv integration, and complex CMake build.  Previous \
attempts failed due to build system complexity."))

(define-public linux-lqx-blocked-note
  (make-blocked-note "linux-lqx"
    "BLOCKED: Liquorix kernel requires custom kconfig, Liquorix patchset, and full \
kernel build infrastructure.  Kernel builds in Guix use different \
tooling."))

(define-public vscodium-translucent-blocked-note
  (make-blocked-note "vscodium-translucent"
    "BLOCKED: VSCodium with translucent patch requires building from source with \
nvm, rustup, gulp, git-lfs, and the entire Chromium/Electron stack."))

(define-public cryptomator-blocked-note
  (make-blocked-note "cryptomator"
    "BLOCKED: Cryptomator requires Maven build system with specific JDK toolchain.  \
Maven is not well supported in Guix."))

(define-public element-web-git-blocked-note
  (make-blocked-note "element-web-git"
    "BLOCKED: Element Web requires npm, yarn, Python, Rust, Tcl, and Electron for \
building.  Complex web application build."))

(define-public xr-driver-git-blocked-note
  (make-blocked-note "xr-driver-git"
    "BLOCKED: XR Linux Driver requires CMake build with hidapi, libevdev, and \
systemd-libs integration.  Niche XR hardware driver."))

(define-public libadwaita-yaru-git-blocked-note
  (make-blocked-note "libadwaita-yaru-git"
    "BLOCKED: Libadwaita with Ubuntu Yaru patches requires specific patched build \
from Ubuntu source with sassc and vala."))

;; ── EOL_SOFTWARE (1 packages) ─────────────────────────────────

(define-public electron22-bin-blocked-note
  (make-blocked-note "electron22-bin"
    "BLOCKED: Electron 22 is end-of-life.  Packaging old Electron versions provides \
limited value and has known security issues."))

;; ── FETCH_FAILED (1 packages) ─────────────────────────────────

(define-public cairo-dock-core-wayland-git-blocked-note
  (make-blocked-note "cairo-dock-core-wayland-git"
    "BLOCKED: Source tarball URL returns 404.  The 3.5.99-rc2 tag may not exist on \
GitHub."))

;; ── MISSING_DEPENDENCY (40 packages) ───────────────────────────

(define-public asf-blocked-note
  (make-blocked-note "asf"
    "BLOCKED: ArchiSteamFarm requires aspnet-runtime (.NET runtime) which is not \
available in Guix.  .NET ecosystem is not supported."))

(define-public libelectron-blocked-note
  (make-blocked-note "libelectron"
    "BLOCKED: Meta package for Electron.  Depends on npm which is not usable in Guix \
sandboxed build environment."))

(define-public python-albucore-blocked-note
  (make-blocked-note "python-albucore"
    "BLOCKED: Depends on python-simsimd, python-stringzilla, and python-opencv which \
are not available in Guix."))

(define-public openbangla-keyboard-git-blocked-note
  (make-blocked-note "openbangla-keyboard-git"
    "BLOCKED: Depends on openbangla-im (input method framework, not in Guix).  \
Requires both CMake + Rust builds."))

(define-public intel-npu-driver-blocked-note
  (make-blocked-note "intel-npu-driver"
    "BLOCKED: Intel NPU driver depends on level-zero-loader and requires kernel \
module support not available in Guix."))

(define-public ros2-arch-deps-blocked-note
  (make-blocked-note "ros2-arch-deps"
    "BLOCKED: ROS2 meta-package with 40+ dependencies.  Many are ROS2-specific \
packages not available in Guix."))

(define-public aspnet-targeting-pack-preview-bin-blocked-note
  (make-blocked-note "aspnet-targeting-pack-preview-bin"
    "BLOCKED: ASP.NET targeting pack (preview) depends on \
dotnet-targeting-pack-preview-bin.  .NET ecosystem is not available in \
Guix."))

(define-public ggml-sycl-f16-git-blocked-note
  (make-blocked-note "ggml-sycl-f16-git"
    "BLOCKED: GGML with Intel SYCL depends on intel-oneapi-basekit (proprietary \
Intel oneAPI toolkit, not in Guix)."))

(define-public itchio-dlagent-blocked-note
  (make-blocked-note "itchio-dlagent"
    "BLOCKED: itch.io download agent depends on ruby-nokogiri and ruby-httpx which \
are not in Guix."))

(define-public qt5-quick3d-blocked-note
  (make-blocked-note "qt5-quick3d"
    "BLOCKED: Qt5 Quick3D module is not packaged separately in Guix.  Requires \
assimp integration with Qt5 build infrastructure."))

(define-public themix-import-images-git-blocked-note
  (make-blocked-note "themix-import-images-git"
    "BLOCKED: Themix image import plugin depends on themix-gui which is not in Guix \
upstream."))

(define-public arduino-builder-blocked-note
  (make-blocked-note "arduino-builder"
    "BLOCKED: Arduino sketch compiler depends on arduino-ctags (not in Guix).  Part \
of Arduino ecosystem."))

(define-public iscan-blocked-note
  (make-blocked-note "iscan"
    "BLOCKED: EPSON Image Scan depends on libstdc++5 (ancient C++ library, not in \
Guix) and proprietary scanner plugins."))

(define-public themix-plugin-base16-git-blocked-note
  (make-blocked-note "themix-plugin-base16-git"
    "BLOCKED: Themix Base16 plugin depends on themix-gui and python-pystache (not in \
Guix)."))

(define-public tzpfms-blocked-note
  (make-blocked-note "tzpfms"
    "BLOCKED: TPM-based encryption for ZFS depends on zfs-utils.  ZFS is not in Guix \
(CDDL/GPL license incompatibility)."))

(define-public zectl-blocked-note
  (make-blocked-note "zectl"
    "BLOCKED: ZFS Boot Environment manager depends on zfs.  ZFS is not in Guix \
(license incompatibility)."))

(define-public dosh-cqfd-blocked-note
  (make-blocked-note "dosh-cqfd"
    "BLOCKED: Docker shell wrapper depends on dosh (not in Guix).  Docker \
integration tool."))

(define-public eprosima-fast-dds-blocked-note
  (make-blocked-note "eprosima-fast-dds"
    "BLOCKED: eProsima Fast-DDS depends on foonathan_memory and eprosima-fast-cdr \
(not in Guix)."))

(define-public sleuthkit-java-blocked-note
  (make-blocked-note "sleuthkit-java"
    "BLOCKED: Java bindings for Sleuth Kit depend on java-openjfx (JavaFX, not in \
Guix)."))

(define-public ps3-psl1ght-blocked-note
  (make-blocked-note "ps3-psl1ght"
    "BLOCKED: PS3 homebrew SDK depends on entire PS3 cross-compilation toolchain \
(ps3-env, ps3-ppu-*, ps3-spu-*) not in Guix."))

(define-public pgadmin4-web-blocked-note
  (make-blocked-note "pgadmin4-web"
    "BLOCKED: pgAdmin4 web interface depends on pgadmin4-server and mod_wsgi (not in \
Guix)."))

(define-public qtforkawesome-qt6-blocked-note
  (make-blocked-note "qtforkawesome-qt6"
    "BLOCKED: Qt ForkAwesome library depends on qtutilities-qt6 (not in Guix).  Part \
of Martchus Qt ecosystem."))

(define-public python-frida-blocked-note
  (make-blocked-note "python-frida"
    "BLOCKED: Python Frida bindings require nodejs/npm at runtime and download \
binary agents during build."))

(define-public aylurs-gtk-shell-git-blocked-note
  (make-blocked-note "aylurs-gtk-shell-git"
    "BLOCKED: AGS depends on libastal, libastal-4, gtk4-layer-shell, and npm.  \
Multiple unavailable deps."))

(define-public mips64-linux-gnu-gcc-bootstrap-blocked-note
  (make-blocked-note "mips64-linux-gnu-gcc-bootstrap"
    "BLOCKED: MIPS64 cross-compiler bootstrap depends on mips64-linux-gnu-binutils \
and linux-api-headers.  Complete cross-compilation toolchain not in \
Guix."))

(define-public tagparser-blocked-note
  (make-blocked-note "tagparser"
    "BLOCKED: Tag parser library depends on c++utilities (not in Guix).  Part of \
Martchus ecosystem."))

(define-public upscayl-ncnn-blocked-note
  (make-blocked-note "upscayl-ncnn"
    "BLOCKED: Upscayl NCNN depends on ncnn (Tencent neural network framework, not in \
Guix).  Requires Vulkan shaders."))

(define-public vapoursynth-plugin-vsjetpack-blocked-note
  (make-blocked-note "vapoursynth-plugin-vsjetpack"
    "BLOCKED: VapourSynth plugin depends on vapoursynth framework which is not in \
Guix."))

(define-public dpt-rp1-py-blocked-note
  (make-blocked-note "dpt-rp1-py"
    "BLOCKED: Sony DPT-RP1 manager depends on python-httpsig, python-pbkdf2, \
python-anytree, python-fusepy (not in Guix)."))

(define-public epsonscan2-blocked-note
  (make-blocked-note "epsonscan2"
    "BLOCKED: Epson scanner utility depends on qt5-singlecoreapplication (not \
available as separate package in Guix)."))

(define-public llama-cpp-hip-blocked-note
  (make-blocked-note "llama.cpp-hip"
    "BLOCKED: llama.cpp with AMD ROCm depends on hip-runtime-amd, hipblas, rocblas, \
rocm-hip-sdk (AMD ROCm stack, not in Guix)."))

(define-public python-asyncpraw-blocked-note
  (make-blocked-note "python-asyncpraw"
    "BLOCKED: Asynchronous Python Reddit API wrapper depends on python-asyncprawcore \
which is not in Guix."))

(define-public sidef-blocked-note
  (make-blocked-note "sidef"
    "BLOCKED: Sidef programming language depends on multiple Perl math modules \
(Math::GmpQ, Math::GmpZ, Math::MPFR, Math::MPC) not in Guix."))

(define-public themix-theme-oomox-git-blocked-note
  (make-blocked-note "themix-theme-oomox-git"
    "BLOCKED: Themix Oomox theme plugin depends on themix-gui which is not in Guix \
upstream."))

(define-public tl-render-blocked-note
  (make-blocked-note "tl-render"
    "BLOCKED: tlRender depends on feather-tk, minizip-ng, opentimelineio, \
opencolorio, openimageio (not in Guix)."))

(define-public wf-shell-blocked-note
  (make-blocked-note "wf-shell"
    "BLOCKED: Wayfire shell panel depends on wayfire compositor which is not in \
Guix."))

(define-public kde-material-you-colors-blocked-note
  (make-blocked-note "kde-material-you-colors"
    "BLOCKED: Material You colors for KDE depends on python-materialyoucolor, \
python-pywal16, plasma5support (not in Guix)."))

(define-public maliit-framework-blocked-note
  (make-blocked-note "maliit-framework"
    "BLOCKED: Maliit input method framework depends on systemd-libs for dbus \
activation.  Guix uses elogind instead of systemd."))

(define-public python-panel-blocked-note
  (make-blocked-note "python-panel"
    "BLOCKED: Panel (HoloViz) depends on python-bokeh, python-pyviz_comms, and npm \
for building.  Multiple missing Python deps."))

(define-public clightd-blocked-note
  (make-blocked-note "clightd"
    "BLOCKED: Clightd bus interface depends on libmodule (not in Guix) for its \
module/plugin system."))

;; ── NEEDS_CARGO_VENDORING (27 packages) ────────────────────────

(define-public cosmic-randr-git-blocked-note
  (make-blocked-note "cosmic-randr-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public vectorchord-blocked-note
  (make-blocked-note "vectorchord"
    "BLOCKED: PostgreSQL vector search extension requires Rust cargo vendoring and \
PostgreSQL extension infrastructure."))

(define-public cosmic-idle-git-blocked-note
  (make-blocked-note "cosmic-idle-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public cosmic-screenshot-git-blocked-note
  (make-blocked-note "cosmic-screenshot-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public eww-blocked-note
  (make-blocked-note "eww"
    "BLOCKED: Elkowar Wacky Widgets is a Rust/Cargo project requiring cargo \
vendoring of all dependencies."))

(define-public python-loro-blocked-note
  (make-blocked-note "python-loro"
    "BLOCKED: Python Loro CRDT bindings require python-maturin (Rust-based Python \
build tool) for Rust compilation."))

(define-public cosmic-app-library-git-blocked-note
  (make-blocked-note "cosmic-app-library-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public cosmic-panel-git-blocked-note
  (make-blocked-note "cosmic-panel-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public kanidm-clients-blocked-note
  (make-blocked-note "kanidm-clients"
    "BLOCKED: Kanidm CLI client is a complex Rust identity management system \
requiring cargo vendoring, systemd, TPM2, and clang/lld."))

(define-public kanidm-server-blocked-note
  (make-blocked-note "kanidm-server"
    "BLOCKED: Kanidm identity server requires cargo vendoring, systemd, and database \
integration."))

(define-public kanidm-unixd-clients-blocked-note
  (make-blocked-note "kanidm-unixd-clients"
    "BLOCKED: Kanidm UNIX resolver requires cargo vendoring, systemd integration, \
and TPM2 support."))

(define-public cosmic-workspaces-git-blocked-note
  (make-blocked-note "cosmic-workspaces-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public easytier-cli-blocked-note
  (make-blocked-note "easytier-cli"
    "BLOCKED: EasyTier VPN CLI requires cargo vendoring + protobuf code generation + \
Node.js/pnpm web build."))

(define-public easytier-core-blocked-note
  (make-blocked-note "easytier-core"
    "BLOCKED: EasyTier VPN core requires cargo vendoring + protobuf + Node.js \
multi-language build."))

(define-public easytier-web-blocked-note
  (make-blocked-note "easytier-web"
    "BLOCKED: EasyTier VPN web interface requires cargo vendoring + Node.js/pnpm \
build."))

(define-public memoria-daemon-blocked-note
  (make-blocked-note "memoria-daemon"
    "BLOCKED: Memoria clipboard daemon is a Rust/Cargo project requiring cargo \
vendoring + CMake + ninja sub-build."))

(define-public cosmic-bg-git-blocked-note
  (make-blocked-note "cosmic-bg-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public cosmic-notifications-git-blocked-note
  (make-blocked-note "cosmic-notifications-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public stardust-xr-non-spatial-input-blocked-note
  (make-blocked-note "stardust-xr-non-spatial-input"
    "BLOCKED: Stardust XR input tool requires Rust cargo vendoring.  Niche XR \
ecosystem."))

(define-public cosmic-files-git-blocked-note
  (make-blocked-note "cosmic-files-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public stardust-xr-server-blocked-note
  (make-blocked-note "stardust-xr-server"
    "BLOCKED: Stardust XR display server requires Rust cargo vendoring.  Niche XR \
ecosystem."))

(define-public cosmic-launcher-git-blocked-note
  (make-blocked-note "cosmic-launcher-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public credentialsd-blocked-note
  (make-blocked-note "credentialsd"
    "BLOCKED: Linux credential manager portal requires Rust cargo vendoring + Meson \
+ GTK4 + libnfc/pcsclite."))

(define-public python-twisterl-blocked-note
  (make-blocked-note "python-twisterl"
    "BLOCKED: Reinforcement learning framework requires python-maturin for Rust \
extension building."))

(define-public xrizer-git-blocked-note
  (make-blocked-note "xrizer-git"
    "BLOCKED: OpenVR to OpenXR translation layer requires Rust cargo vendoring + \
32-bit Rust libs + CMake."))

(define-public cosmic-applets-git-blocked-note
  (make-blocked-note "cosmic-applets-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

(define-public cosmic-comp-git-blocked-note
  (make-blocked-note "cosmic-comp-git"
    "BLOCKED: COSMIC desktop component.  Requires Rust cargo vendoring and the \
COSMIC toolkit ecosystem (libcosmic, cosmic-comp, etc.) which is not \
available in Guix.  Part of System76 COSMIC DE."))

;; ── PROPRIETARY (13 packages) ──────────────────────────────────

(define-public matlab-mpm-blocked-note
  (make-blocked-note "matlab-mpm"
    "BLOCKED: MATLAB Package Manager is proprietary software under custom:MATLAB \
EULA.  Binary distribution requires accepting MATLAB license terms."))

(define-public foobar2000-blocked-note
  (make-blocked-note "foobar2000"
    "BLOCKED: foobar2000 is a Windows audio player that runs under Wine.  \
Proprietary with custom license.  Wine integration is complex in Guix."))

(define-public sac-core-blocked-note
  (make-blocked-note "sac-core"
    "BLOCKED: Thales/Gemalto SafeNet Authentication Client is proprietary with no \
publicly downloadable source.  Requires vendor license."))

(define-public e-imzo-blocked-note
  (make-blocked-note "e-imzo"
    "BLOCKED: Uzbek state e-identity tool (E-IMZO) is proprietary.  No source code \
available."))

(define-public nvidia-390xx-utils-blocked-note
  (make-blocked-note "nvidia-390xx-utils"
    "BLOCKED: NVIDIA proprietary driver utilities.  Requires proprietary kernel \
module and binary blobs.  Guix supports only free software drivers."))

(define-public nvidia-470xx-utils-blocked-note
  (make-blocked-note "nvidia-470xx-utils"
    "BLOCKED: NVIDIA proprietary driver utilities.  Requires proprietary kernel \
module and binary blobs.  Guix supports only free software drivers."))

(define-public samsung-unified-driver-printer-blocked-note
  (make-blocked-note "samsung-unified-driver-printer"
    "BLOCKED: Samsung unified printer driver — proprietary Samsung binary.  Depends \
on samsung-unified-driver-common (not in Guix)."))

(define-public nvidia-580xx-utils-blocked-note
  (make-blocked-note "nvidia-580xx-utils"
    "BLOCKED: NVIDIA proprietary driver utilities.  Requires proprietary kernel \
module and binary blobs.  Guix supports only free software drivers."))

(define-public samsung-unified-driver-scanner-blocked-note
  (make-blocked-note "samsung-unified-driver-scanner"
    "BLOCKED: Samsung unified scanner driver — proprietary Samsung binary.  Depends \
on samsung-unified-driver-common (not in Guix)."))

(define-public opencl-amd-blocked-note
  (make-blocked-note "opencl-amd"
    "BLOCKED: AMD ROCm OpenCL runtime is repackaged from AMD proprietary Ubuntu \
releases.  Custom:AMD license restricts redistribution."))

(define-public plasticscm-client-core-blocked-note
  (make-blocked-note "plasticscm-client-core"
    "BLOCKED: Unity Version Control (Plastic SCM) is proprietary under \
LicenseRef-UnityVersionControl.  No freely downloadable binary."))

(define-public spotify-blocked-note
  (make-blocked-note "spotify"
    "BLOCKED: Spotify is proprietary music streaming software.  Binary-only \
distribution with custom license."))

(define-public android-sdk-blocked-note
  (make-blocked-note "android-sdk"
    "BLOCKED: Google Android SDK is proprietary under custom license.  Requires \
lib32-gcc-libs (multilib) and Java environment."))

;; ── UNSUPPORTED_ARCH (3 packages) ─────────────────────────────

(define-public lib32-libvmaf-blocked-note
  (make-blocked-note "lib32-libvmaf"
    "BLOCKED: Guix does not support multilib/32-bit compatibility libraries.  The \
64-bit equivalent is available in Guix."))

(define-public lib32-nvidia-utils-beta-blocked-note
  (make-blocked-note "lib32-nvidia-utils-beta"
    "BLOCKED: Guix does not support multilib/32-bit compatibility libraries.  The \
64-bit equivalent is available in Guix."))

(define-public lib32-bluez-libs-blocked-note
  (make-blocked-note "lib32-bluez-libs"
    "BLOCKED: Guix does not support multilib/32-bit compatibility libraries.  The \
64-bit equivalent is available in Guix."))
