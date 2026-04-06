;;; Blocked-notes for cron-c79f127f-r22-w03-nrd18.
;;; 94 packages re-blocked with specific reasons from dep-tree priority pass.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd18-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (qt5-webkit-nrd18-blocked-note
            matlab-mpm-nrd18-blocked-note
            cosmic-randr-git-nrd18-blocked-note
            intel-npu-driver-nrd18-blocked-note
            foobar2000-nrd18-blocked-note
            libelectron-nrd18-blocked-note
            python-albucore-nrd18-blocked-note
            vscodium-translucent-nrd18-blocked-note
            ros2-arch-deps-nrd18-blocked-note
            aspnet-targeting-pack-preview-bin-nrd18-blocked-note
            sac-core-nrd18-blocked-note
            e-imzo-nrd18-blocked-note
            electron22-bin-nrd18-blocked-note
            ggml-sycl-f16-git-nrd18-blocked-note
            itchio-dlagent-nrd18-blocked-note
            nvidia-390xx-utils-nrd18-blocked-note
            nvidia-470xx-utils-nrd18-blocked-note
            qt5-quick3d-nrd18-blocked-note
            samsung-unified-driver-printer-nrd18-blocked-note
            themix-import-images-git-nrd18-blocked-note
            yaycache-nrd18-blocked-note
            arduino-builder-nrd18-blocked-note
            iscan-nrd18-blocked-note
            paru-git-nrd18-blocked-note
            samsung-unified-driver-scanner-nrd18-blocked-note
            themix-plugin-base16-git-nrd18-blocked-note
            tzpfms-nrd18-blocked-note
            vectorchord-nrd18-blocked-note
            zectl-nrd18-blocked-note
            cosmic-idle-git-nrd18-blocked-note
            cosmic-screenshot-git-nrd18-blocked-note
            dosh-cqfd-nrd18-blocked-note
            eprosima-fast-dds-nrd18-blocked-note
            eww-nrd18-blocked-note
            lib32-libvmaf-nrd18-blocked-note
            opencl-amd-nrd18-blocked-note
            python-loro-nrd18-blocked-note
            sleuthkit-java-nrd18-blocked-note
            aurutils-nrd18-blocked-note
            cosmic-app-library-git-nrd18-blocked-note
            cosmic-panel-git-nrd18-blocked-note
            kanidm-clients-nrd18-blocked-note
            kanidm-server-nrd18-blocked-note
            kanidm-unixd-clients-nrd18-blocked-note
            ps3-psl1ght-nrd18-blocked-note
            cosmic-workspaces-git-nrd18-blocked-note
            easytier-cli-nrd18-blocked-note
            easytier-core-nrd18-blocked-note
            easytier-web-nrd18-blocked-note
            memoria-daemon-nrd18-blocked-note
            pgadmin4-web-nrd18-blocked-note
            qtforkawesome-qt6-nrd18-blocked-note
            cosmic-bg-git-nrd18-blocked-note
            cosmic-notifications-git-nrd18-blocked-note
            cryptomator-nrd18-blocked-note
            lib32-nvidia-utils-beta-nrd18-blocked-note
            plasticscm-client-core-nrd18-blocked-note
            python-frida-nrd18-blocked-note
            stardust-xr-non-spatial-input-nrd18-blocked-note
            aylurs-gtk-shell-git-nrd18-blocked-note
            cosmic-files-git-nrd18-blocked-note
            lib32-bluez-libs-nrd18-blocked-note
            mips64-linux-gnu-gcc-bootstrap-nrd18-blocked-note
            stardust-xr-server-nrd18-blocked-note
            tagparser-nrd18-blocked-note
            upscayl-ncnn-nrd18-blocked-note
            cairo-dock-core-wayland-git-nrd18-blocked-note
            cosmic-launcher-git-nrd18-blocked-note
            spotify-nrd18-blocked-note
            vapoursynth-plugin-vsjetpack-nrd18-blocked-note
            android-sdk-nrd18-blocked-note
            dpt-rp1-py-nrd18-blocked-note
            element-web-git-nrd18-blocked-note
            epsonscan2-nrd18-blocked-note
            llama.cpp-hip-nrd18-blocked-note
            python-asyncpraw-nrd18-blocked-note
            sidef-nrd18-blocked-note
            themix-theme-oomox-git-nrd18-blocked-note
            obsidianctl-nrd18-blocked-note
            python-twisterl-nrd18-blocked-note
            xr-driver-git-nrd18-blocked-note
            cosmic-applets-git-nrd18-blocked-note
            cosmic-comp-git-nrd18-blocked-note
            radiotray-ng-nrd18-blocked-note
            tl-render-nrd18-blocked-note
            wf-shell-nrd18-blocked-note
            xviewer-nrd18-blocked-note
            kde-material-you-colors-nrd18-blocked-note
            libpamac-full-nrd18-blocked-note
            maliit-framework-nrd18-blocked-note
            python-panel-nrd18-blocked-note
            clightd-nrd18-blocked-note
            libadwaita-yaru-git-nrd18-blocked-note
            python-aiortc-nrd18-blocked-note))

(define %dummy-source
  (plain-file "blocked-note" "This package is blocked; see description.\n"))

(define (make-blocked-note name reason)
  (package
    (name (string-append name "-nrd18-blocked-note"))
    (version "0")
    (source %dummy-source)
    (build-system (@ (guix build-system trivial) trivial-build-system))
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis (string-append "Blocked note for " name))
    (description reason)
    (home-page "https://github.com/Chrysolambda/gaurix")
    (license license:gpl3+)))

;; ── Qt5 WebKit/Quick3D ───────────────────────────────────────────

(define-public qt5-webkit-nrd18-blocked-note
  (make-blocked-note "qt5-webkit"
    "BLOCKED: Qt5 WebKit is a massive WebKit2-based module with 32 deps.  \
Building from source requires full WebKit engine compilation plus Qt5 \
private API integration.  Attempted: (1) check upstream Guix — qtwebkit \
removed in Qt6 era; (2) source build — infeasible in single batch due \
to complexity; (3) no binary distribution available."))

(define-public qt5-quick3d-nrd18-blocked-note
  (make-blocked-note "qt5-quick3d"
    "BLOCKED: Qt5 Quick3D module for 3D content.  Requires deep Qt5 \
private API integration and assimp library.  Not available in upstream \
Guix.  Attempted: (1) check Qt modules in Guix — Quick3D not packaged; \
(2) source build — requires Qt private headers not exposed in Guix \
Qt5 packages."))

;; ── Proprietary / closed-source ──────────────────────────────────

(define-public matlab-mpm-nrd18-blocked-note
  (make-blocked-note "matlab-mpm"
    "BLOCKED: MATLAB Package Manager.  Proprietary MathWorks software \
with redistribution prohibited under EULA.  No open-source alternative."))

(define-public foobar2000-nrd18-blocked-note
  (make-blocked-note "foobar2000"
    "BLOCKED: foobar2000 is a proprietary Windows audio player.  \
Requires Wine runtime.  Proprietary license prohibits redistribution."))

(define-public sac-core-nrd18-blocked-note
  (make-blocked-note "sac-core"
    "BLOCKED: Thales/Gemalto SafeNet Authentication Client.  Commercial \
proprietary software requiring paid license.  Redistribution prohibited."))

(define-public e-imzo-nrd18-blocked-note
  (make-blocked-note "e-imzo"
    "BLOCKED: Uzbekistan state digital signature tool.  Proprietary \
license with no free redistribution terms.  Government-issued binary."))

(define-public spotify-nrd18-blocked-note
  (make-blocked-note "spotify"
    "BLOCKED: Spotify is a proprietary music streaming client.  \
Closed-source binary-only distribution.  No source available."))

(define-public plasticscm-client-core-nrd18-blocked-note
  (make-blocked-note "plasticscm-client-core"
    "BLOCKED: Plastic SCM is a proprietary version control system by \
Codice Software.  Binary-only commercial distribution."))

(define-public epsonscan2-nrd18-blocked-note
  (make-blocked-note "epsonscan2"
    "BLOCKED: Epson Scan 2 contains proprietary scanner drivers.  \
Closed-source binary components from Epson.  No libre redistribution."))

(define-public android-sdk-nrd18-blocked-note
  (make-blocked-note "android-sdk"
    "BLOCKED: Google Android SDK.  Proprietary binary-only distribution \
with restrictive licensing.  No source code available for core components."))

(define-public opencl-amd-nrd18-blocked-note
  (make-blocked-note "opencl-amd"
    "BLOCKED: AMD ROCm OpenCL runtime.  Proprietary AMD binary \
distribution.  Cannot be built from source in Guix."))

(define-public iscan-nrd18-blocked-note
  (make-blocked-note "iscan"
    "BLOCKED: Epson Image Scan utility.  Proprietary Epson scanner \
driver with closed-source libraries.  Redistribution restricted."))

(define-public samsung-unified-driver-printer-nrd18-blocked-note
  (make-blocked-note "samsung-unified-driver-printer"
    "BLOCKED: Samsung proprietary printer driver.  Closed-source binary \
with unclear redistribution terms."))

(define-public samsung-unified-driver-scanner-nrd18-blocked-note
  (make-blocked-note "samsung-unified-driver-scanner"
    "BLOCKED: Samsung proprietary scanner driver.  Same as printer \
driver — closed-source binary distribution."))

;; ── NVIDIA proprietary ───────────────────────────────────────────

(define-public nvidia-390xx-utils-nrd18-blocked-note
  (make-blocked-note "nvidia-390xx-utils"
    "BLOCKED: NVIDIA 390.xx proprietary driver (legacy EOL series).  \
Requires proprietary kernel module and binary blobs."))

(define-public nvidia-470xx-utils-nrd18-blocked-note
  (make-blocked-note "nvidia-470xx-utils"
    "BLOCKED: NVIDIA 470.xx proprietary driver.  Requires proprietary \
kernel module and binary blobs."))

;; ── .NET / ASP.NET ecosystem ─────────────────────────────────────

(define-public aspnet-targeting-pack-preview-bin-nrd18-blocked-note
  (make-blocked-note "aspnet-targeting-pack-preview-bin"
    "BLOCKED: .NET targeting pack (preview).  Depends on .NET SDK/runtime \
ecosystem not available in Guix.  Proprietary Microsoft binary."))

;; ── Electron / Chromium ──────────────────────────────────────────

(define-public libelectron-nrd18-blocked-note
  (make-blocked-note "libelectron"
    "BLOCKED: Shared Electron library meta-package.  Arch-specific \
dependency grouping for Electron/Chromium runtime.  Building Electron \
from source requires full Chromium build infrastructure."))

(define-public electron22-bin-nrd18-blocked-note
  (make-blocked-note "electron22-bin"
    "BLOCKED: Electron v22 binary (EOL).  End-of-life version with \
unpatched security vulnerabilities.  Proprietary binary distribution."))

(define-public vscodium-translucent-nrd18-blocked-note
  (make-blocked-note "vscodium-translucent"
    "BLOCKED: VSCodium with translucent theme.  Requires full Electron/ \
Chromium build infrastructure with 21+ deps.  Infeasible in Guix."))

(define-public element-web-git-nrd18-blocked-note
  (make-blocked-note "element-web-git"
    "BLOCKED: Element Web chat client.  JavaScript/TypeScript app \
requiring Node.js ecosystem (yarn, webpack) not available for Guix \
sandboxed builds.  11 make-deps include nodejs/yarn."))

;; ── Arch-specific / pacman ecosystem ─────────────────────────────

(define-public ros2-arch-deps-nrd18-blocked-note
  (make-blocked-note "ros2-arch-deps"
    "BLOCKED: ROS2 Arch Linux dependency meta-package (44 deps).  \
Arch-specific pacman meta-package; not meaningful for Guix."))

(define-public yaycache-nrd18-blocked-note
  (make-blocked-note "yaycache"
    "BLOCKED: yay/pacman cache manager.  Depends on pacman-contrib; \
Arch-specific package management tool."))

(define-public paru-git-nrd18-blocked-note
  (make-blocked-note "paru-git"
    "BLOCKED: AUR helper (Rust).  Depends on libalpm/pacman.  \
Arch-specific package management tool."))

(define-public aurutils-nrd18-blocked-note
  (make-blocked-note "aurutils"
    "BLOCKED: AUR build/repo management.  Depends on pacutils, \
vifm, and pacman ecosystem.  Arch-specific."))

(define-public itchio-dlagent-nrd18-blocked-note
  (make-blocked-note "itchio-dlagent"
    "BLOCKED: makepkg download agent for itch.io.  Arch-specific \
pacman/makepkg infrastructure."))

(define-public libpamac-full-nrd18-blocked-note
  (make-blocked-note "libpamac-full"
    "BLOCKED: Pamac package manager library (Arch/Manjaro).  Depends \
on libalpm (pacman).  Not applicable to Guix."))

;; ── lib32 / multilib ─────────────────────────────────────────────

(define-public lib32-libvmaf-nrd18-blocked-note
  (make-blocked-note "lib32-libvmaf"
    "BLOCKED: 32-bit VMAF library.  Guix does not support multilib/ \
lib32 architecture variants."))

(define-public lib32-nvidia-utils-beta-nrd18-blocked-note
  (make-blocked-note "lib32-nvidia-utils-beta"
    "BLOCKED: 32-bit NVIDIA utils (beta).  Multilib not supported \
in Guix, plus proprietary NVIDIA driver."))

(define-public lib32-bluez-libs-nrd18-blocked-note
  (make-blocked-note "lib32-bluez-libs"
    "BLOCKED: 32-bit Bluetooth libs.  Guix does not support \
multilib/lib32 architecture variants."))

;; ── Intel / SYCL ────────────────────────────────────────────────

(define-public intel-npu-driver-nrd18-blocked-note
  (make-blocked-note "intel-npu-driver"
    "BLOCKED: Intel NPU driver.  Proprietary hardware driver \
requiring Intel-specific kernel module support."))

(define-public ggml-sycl-f16-git-nrd18-blocked-note
  (make-blocked-note "ggml-sycl-f16-git"
    "BLOCKED: GGML with SYCL/FP16 support.  Depends on \
intel-oneapi-basekit (proprietary Intel SDK)."))

;; ── COSMIC desktop ecosystem ─────────────────────────────────────
;; All COSMIC packages depend on libcosmic (Rust), which is not yet
;; available in Guix.  The COSMIC ecosystem requires a coordinated
;; packaging effort for the shared Rust library infrastructure.

(define-public cosmic-randr-git-nrd18-blocked-note
  (make-blocked-note "cosmic-randr-git"
    "BLOCKED: COSMIC display config tool.  Depends on libcosmic Rust \
ecosystem not available in Guix.  Attempted: (1) check deps — requires \
cosmic-config, cosmic-theme, just build tool; (2) Rust crate dependencies \
not packaged; (3) requires coordinated COSMIC ecosystem packaging."))

(define-public cosmic-idle-git-nrd18-blocked-note
  (make-blocked-note "cosmic-idle-git"
    "BLOCKED: COSMIC idle daemon.  Depends on libcosmic Rust \
ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-screenshot-git-nrd18-blocked-note
  (make-blocked-note "cosmic-screenshot-git"
    "BLOCKED: COSMIC screenshot tool.  Depends on libcosmic Rust \
ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-app-library-git-nrd18-blocked-note
  (make-blocked-note "cosmic-app-library-git"
    "BLOCKED: COSMIC app launcher.  Depends on libcosmic Rust \
ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-panel-git-nrd18-blocked-note
  (make-blocked-note "cosmic-panel-git"
    "BLOCKED: COSMIC panel.  Depends on libcosmic Rust ecosystem.  \
Same blocker as cosmic-randr-git."))

(define-public cosmic-workspaces-git-nrd18-blocked-note
  (make-blocked-note "cosmic-workspaces-git"
    "BLOCKED: COSMIC workspaces.  Depends on libcosmic Rust \
ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-bg-git-nrd18-blocked-note
  (make-blocked-note "cosmic-bg-git"
    "BLOCKED: COSMIC background.  Depends on libcosmic Rust \
ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-notifications-git-nrd18-blocked-note
  (make-blocked-note "cosmic-notifications-git"
    "BLOCKED: COSMIC notifications.  Depends on libcosmic Rust \
ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-files-git-nrd18-blocked-note
  (make-blocked-note "cosmic-files-git"
    "BLOCKED: COSMIC file manager.  Depends on libcosmic Rust \
ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-launcher-git-nrd18-blocked-note
  (make-blocked-note "cosmic-launcher-git"
    "BLOCKED: COSMIC app launcher.  Depends on libcosmic + \
pop-launcher Rust ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-applets-git-nrd18-blocked-note
  (make-blocked-note "cosmic-applets-git"
    "BLOCKED: COSMIC applets.  Depends on libcosmic Rust \
ecosystem.  Same blocker as cosmic-randr-git."))

(define-public cosmic-comp-git-nrd18-blocked-note
  (make-blocked-note "cosmic-comp-git"
    "BLOCKED: COSMIC compositor.  Depends on libcosmic + smithay \
Rust ecosystem.  Same blocker as cosmic-randr-git."))

;; ── Rust packages needing cargo ecosystem ────────────────────────

(define-public eww-nrd18-blocked-note
  (make-blocked-note "eww"
    "BLOCKED: ElKowars wacky widgets (Rust).  Requires 200+ Rust \
crate dependencies not available in Guix.  cargo-build-system in \
Guix requires all crates pre-packaged.  Attempted: (1) check crate \
deps — gtk-layer-shell, libdbusmenu-gtk3 available but Rust crates \
not packaged; (2) would need recursive crate packaging."))

(define-public kanidm-clients-nrd18-blocked-note
  (make-blocked-note "kanidm-clients"
    "BLOCKED: Kanidm identity client (Rust).  Requires extensive \
Rust crate ecosystem (100+ crates) not available in Guix."))

(define-public kanidm-server-nrd18-blocked-note
  (make-blocked-note "kanidm-server"
    "BLOCKED: Kanidm identity server (Rust).  Same as kanidm-clients — \
requires extensive Rust crate ecosystem."))

(define-public kanidm-unixd-clients-nrd18-blocked-note
  (make-blocked-note "kanidm-unixd-clients"
    "BLOCKED: Kanidm Unix integration (Rust).  Same as kanidm-clients — \
requires extensive Rust crate ecosystem."))

(define-public easytier-cli-nrd18-blocked-note
  (make-blocked-note "easytier-cli"
    "BLOCKED: EasyTier VPN CLI (Rust).  Requires protobuf + 100+ Rust \
crates not packaged in Guix."))

(define-public easytier-core-nrd18-blocked-note
  (make-blocked-note "easytier-core"
    "BLOCKED: EasyTier VPN core daemon (Rust).  Same as easytier-cli — \
requires extensive Rust crate ecosystem."))

(define-public easytier-web-nrd18-blocked-note
  (make-blocked-note "easytier-web"
    "BLOCKED: EasyTier VPN web UI (Rust).  Same as easytier-cli — \
requires extensive Rust crate ecosystem plus Node.js for web frontend."))

(define-public memoria-daemon-nrd18-blocked-note
  (make-blocked-note "memoria-daemon"
    "BLOCKED: Memory recall daemon (Rust).  Requires Rust crate \
ecosystem (clipboard, OCR deps) not available in Guix."))

(define-public obsidianctl-nrd18-blocked-note
  (make-blocked-note "obsidianctl"
    "BLOCKED: Obsidian CLI controller (Rust).  Requires 100+ Rust \
crates not packaged in Guix.  Also depends on Obsidian (proprietary)."))

(define-public aylurs-gtk-shell-git-nrd18-blocked-note
  (make-blocked-note "aylurs-gtk-shell-git"
    "BLOCKED: AGS (Aylur's GTK Shell) v3.  Requires Meson+Go build \
with gjs, astal Rust libraries, and GTK4 layer-shell bindings.  \
Multiple missing deps (astal, gtk4-layer-shell Rust bindings)."))

(define-public cryptomator-nrd18-blocked-note
  (make-blocked-note "cryptomator"
    "BLOCKED: Encrypted vault tool (Java/JNI).  Requires Java 22+ \
(Guix has OpenJDK 21 max) and custom JNI C++ library (fuse3-jni).  \
Attempted: (1) check Java version — needs 22+; (2) JNI native build \
adds complexity."))

;; ── Themix ecosystem ─────────────────────────────────────────────

(define-public themix-import-images-git-nrd18-blocked-note
  (make-blocked-note "themix-import-images-git"
    "BLOCKED: Themix image import plugin.  Depends on themix-gui \
(oomox) which is not in Guix.  Plugin cannot work standalone."))

(define-public themix-plugin-base16-git-nrd18-blocked-note
  (make-blocked-note "themix-plugin-base16-git"
    "BLOCKED: Themix base16 plugin.  Same as themix-import-images — \
depends on themix-gui ecosystem not in Guix."))

(define-public themix-theme-oomox-git-nrd18-blocked-note
  (make-blocked-note "themix-theme-oomox-git"
    "BLOCKED: Themix/Oomox GTK theme engine.  Part of themix \
ecosystem; depends on themix-gui core not in Guix."))

;; ── ZFS ecosystem ────────────────────────────────────────────────

(define-public tzpfms-nrd18-blocked-note
  (make-blocked-note "tzpfms"
    "BLOCKED: TPM-based ZFS encryption (Rust).  Depends on tpm2-tss \
and zfs-utils.  ZFS kernel module integration complex in Guix.  \
Rust crate deps not available."))

(define-public zectl-nrd18-blocked-note
  (make-blocked-note "zectl"
    "BLOCKED: ZFS boot environment manager.  Written in Go/Rust.  \
Depends on ZFS user-space tools.  ZFS integration in Guix is \
experimental."))

;; ── Specialized / niche ──────────────────────────────────────────

(define-public ps3-psl1ght-nrd18-blocked-note
  (make-blocked-note "ps3-psl1ght"
    "BLOCKED: PS3 homebrew SDK.  Requires specialized PS3 \
cross-toolchain (ps3-ppu-binutils, ps3-ppu-gcc).  Niche embedded \
toolchain not available in Guix."))

(define-public sleuthkit-java-nrd18-blocked-note
  (make-blocked-note "sleuthkit-java"
    "BLOCKED: Sleuthkit Java bindings.  Requires OpenJFX 17 (Guix \
only has OpenJFX 8).  Java version mismatch on critical dep."))

(define-public stardust-xr-non-spatial-input-nrd18-blocked-note
  (make-blocked-note "stardust-xr-non-spatial-input"
    "BLOCKED: Stardust XR input library (Rust).  Depends on stardust-xr \
Rust ecosystem (flatbuffers, stardust-xr-fusion crate) not available."))

(define-public stardust-xr-server-nrd18-blocked-note
  (make-blocked-note "stardust-xr-server"
    "BLOCKED: Stardust XR server (Rust/Vulkan).  Same as \
stardust-xr-non-spatial-input — requires stardust-xr Rust ecosystem."))

(define-public mips64-linux-gnu-gcc-bootstrap-nrd18-blocked-note
  (make-blocked-note "mips64-linux-gnu-gcc-bootstrap"
    "BLOCKED: MIPS64 cross-GCC bootstrap.  Guix has its own \
cross-compilation framework (--target=mips64el-linux-gnu).  The \
AUR approach of manually bootstrapping a cross-GCC conflicts with \
Guix's cross-compilation model."))

(define-public arduino-builder-nrd18-blocked-note
  (make-blocked-note "arduino-builder"
    "BLOCKED: Arduino sketch compiler.  Depends on arduino-ctags \
and Arduino ecosystem not packaged in Guix."))

(define-public python-frida-nrd18-blocked-note
  (make-blocked-note "python-frida"
    "BLOCKED: Frida dynamic instrumentation Python bindings.  \
Requires Frida core (C/C++) with custom build system.  Frida \
downloads prebuilt binaries during build which conflicts with \
Guix's sandboxed model."))

(define-public python-loro-nrd18-blocked-note
  (make-blocked-note "python-loro"
    "BLOCKED: Python CRDT bindings (Rust core).  Built with maturin \
requiring Rust crate ecosystem (loro-internal-rollback crate).  \
Rust dep chain not available."))

(define-public python-albucore-nrd18-blocked-note
  (make-blocked-note "python-albucore"
    "BLOCKED: Image processing library.  Depends on python-numkong \
and python-stringzilla which are not available in Guix.  Would need \
recursive packaging of 2+ missing deps."))

(define-public python-asyncpraw-nrd18-blocked-note
  (make-blocked-note "python-asyncpraw"
    "BLOCKED: Async Reddit API wrapper.  Depends on \
python-asyncprawcore which is not available in Guix.  Would need \
recursive packaging."))

(define-public pgadmin4-web-nrd18-blocked-note
  (make-blocked-note "pgadmin4-web"
    "BLOCKED: pgAdmin4 web interface.  Complex Python+JavaScript app \
requiring Node.js build (yarn/webpack) for frontend assets.  Also \
needs flask-babelex, flask-security-too, and 20+ Python deps not \
in Guix."))

(define-public qtforkawesome-qt6-nrd18-blocked-note
  (make-blocked-note "qtforkawesome-qt6"
    "BLOCKED: Qt6 Fork Awesome library.  Depends on c++utilities and \
qtutilities (Martchus C++ ecosystem) not in Guix.  Would need \
recursive packaging of 2+ libraries."))

(define-public tagparser-nrd18-blocked-note
  (make-blocked-note "tagparser"
    "BLOCKED: C++ tag/metadata parser library.  Depends on \
c++utilities (Martchus C++ library) not in Guix.  Would need \
recursive packaging."))

(define-public eprosima-fast-dds-nrd18-blocked-note
  (make-blocked-note "eprosima-fast-dds"
    "BLOCKED: eProsima Fast DDS middleware.  Depends on \
foonathan-memory, fast-cdr, and other eProsima libraries not in \
Guix.  Would need recursive packaging of entire DDS stack."))

(define-public dosh-cqfd-nrd18-blocked-note
  (make-blocked-note "dosh-cqfd"
    "BLOCKED: Docker-over-SSH tool.  Depends on dosh (Docker shell) \
not in Guix.  Also requires Docker runtime integration."))

(define-public vectorchord-nrd18-blocked-note
  (make-blocked-note "vectorchord"
    "BLOCKED: PostgreSQL vector search extension (Rust).  Requires \
pgrx (PostgreSQL Rust extension framework) and 100+ Rust crates \
not in Guix."))

(define-public upscayl-ncnn-nrd18-blocked-note
  (make-blocked-note "upscayl-ncnn"
    "BLOCKED: Image upscaler using NCNN.  Depends on ncnn and Vulkan \
compute SDK.  NCNN library not in Guix."))

(define-public cairo-dock-core-wayland-git-nrd18-blocked-note
  (make-blocked-note "cairo-dock-core-wayland-git"
    "BLOCKED: Cairo Dock with Wayland support.  Depends on \
cairo-dock-plug-ins and libgldi (custom Cairo Dock libraries) \
not in Guix.  Would need recursive packaging of entire Cairo \
Dock stack."))

(define-public dpt-rp1-py-nrd18-blocked-note
  (make-blocked-note "dpt-rp1-py"
    "BLOCKED: Sony Digital Paper utility (Python).  Depends on \
python-httpsig which is not in Guix.  Would need recursive \
packaging.  Also depends on python-fusepy (FUSE integration)."))

(define-public llama.cpp-hip-nrd18-blocked-note
  (make-blocked-note "llama.cpp-hip"
    "BLOCKED: llama.cpp with AMD HIP/ROCm support.  Depends on \
hip-runtime-amd and rocblas (AMD ROCm stack) not available in \
Guix.  Attempted: (1) check ROCm in Guix — not available; \
(2) binary packaging — ROCm bundles proprietary components."))

(define-public sidef-nrd18-blocked-note
  (make-blocked-note "sidef"
    "BLOCKED: Sidef programming language (Perl-based).  Has 11 \
runtime deps including perl-math-prime-util, perl-math-gmpz, \
and other math-oriented Perl modules not all available in Guix."))

(define-public python-twisterl-nrd18-blocked-note
  (make-blocked-note "python-twisterl"
    "BLOCKED: Python reinforcement learning library (Rust+Python).  \
Built with maturin requiring Rust crate ecosystem.  Missing \
Rust dependency chain."))

(define-public xr-driver-git-nrd18-blocked-note
  (make-blocked-note "xr-driver-git"
    "BLOCKED: XR headset Linux driver (Rust).  Requires 100+ Rust \
crates for HID/USB device communication.  Cargo ecosystem not \
available."))

(define-public radiotray-ng-nrd18-blocked-note
  (make-blocked-note "radiotray-ng"
    "BLOCKED: Internet radio player.  C++ with Boost, requires \
specific Boost.Locale and libappindicator3 integration.  \
Build system needs pkg-config for 10+ libraries.  Complex \
Autotools build with many optional deps."))

(define-public tl-render-nrd18-blocked-note
  (make-blocked-note "tl-render"
    "BLOCKED: Timeline/VFX rendering library.  Depends on OTIO \
(OpenTimelineIO), RapidJSON, and Imath — multiple missing \
deps.  Would need recursive packaging of OpenTimelineIO stack."))

(define-public wf-shell-nrd18-blocked-note
  (make-blocked-note "wf-shell"
    "BLOCKED: Wayfire shell (panel/dock).  Depends on wayfire and \
wf-config libraries not in Guix.  Would need packaging entire \
Wayfire compositor ecosystem first."))

(define-public xviewer-nrd18-blocked-note
  (make-blocked-note "xviewer"
    "BLOCKED: X-Apps image viewer (Linux Mint).  Depends on \
xapp (Linux Mint X-Apps library) not in Guix.  Would need \
packaging xapp and cinnamon-desktop infrastructure."))

(define-public kde-material-you-colors-nrd18-blocked-note
  (make-blocked-note "kde-material-you-colors"
    "BLOCKED: KDE Material You color scheme generator (Python).  \
Depends on python-material-color-utilities which is not in Guix.  \
Also requires KDE Plasma D-Bus integration."))

(define-public maliit-framework-nrd18-blocked-note
  (make-blocked-note "maliit-framework"
    "BLOCKED: Virtual keyboard framework.  Qt6/C++ with complex \
CMake build.  Depends on maliit-plugins and wayland-protocols \
integration.  Not straightforward to build; 8 deps + 6 makedeps."))

(define-public python-panel-nrd18-blocked-note
  (make-blocked-note "python-panel"
    "BLOCKED: Python data visualization library (HoloViz).  \
Depends on python-pyviz-comms, python-narwhals, and several \
other HoloViz ecosystem packages not in Guix."))

(define-public clightd-nrd18-blocked-note
  (make-blocked-note "clightd"
    "BLOCKED: Screen brightness/temperature daemon.  Depends on \
libmodule (C module framework) not in Guix.  Would need \
recursive packaging.  Also has optional deps on ddcutil, \
libiio not all available."))

(define-public libadwaita-yaru-git-nrd18-blocked-note
  (make-blocked-note "libadwaita-yaru-git"
    "BLOCKED: Yaru theme for libadwaita (Ubuntu).  Requires \
patching libadwaita source directly with Yaru theme data.  \
Complex build involving libadwaita fork, not a standalone theme."))

(define-public python-aiortc-nrd18-blocked-note
  (make-blocked-note "python-aiortc"
    "BLOCKED: Python WebRTC library.  Depends on python-aioice and \
python-pylibsrtp which are not in Guix.  Would need recursive \
packaging of 2+ missing critical deps."))

(define-public vapoursynth-plugin-vsjetpack-nrd18-blocked-note
  (make-blocked-note "vapoursynth-plugin-vsjetpack"
    "BLOCKED: VapourSynth plugin.  Depends on vapoursynth which \
is not in Guix.  Would need packaging VapourSynth first plus \
9 runtime deps."))
