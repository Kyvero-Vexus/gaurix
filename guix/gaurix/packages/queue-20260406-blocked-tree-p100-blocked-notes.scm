;;; Blocked notes for queue-20260406-blocked-tree-p100.
;;; 80 packages re-blocked with detailed reasons (19 recipes + 1 compat alias = 100).
(define-module (gaurix packages queue-20260406-blocked-tree-p100-blocked-notes)
  #:use-module (guix packages)
  #:export (blocked-notes))

(define blocked-notes
  '(
    ;; ── PROPRIETARY / CUSTOM LICENSE ──
    ("matlab-mpm" "PROPRIETARY_LICENSE" "MATLAB Package Manager requires custom MATLAB EULA; redistribution prohibited without MathWorks agreement")
    ("foobar2000" "PROPRIETARY_LICENSE" "foobar2000 is a proprietary audio player (custom license); Linux version requires Wine; no free redistribution terms")
    ("sac-core" "PROPRIETARY_LICENSE" "Thales/Gemalto SafeNet Authentication Client is commercial software; requires paid license; redistribution prohibited")
    ("e-imzo" "PROPRIETARY_LICENSE" "E-IMZO is a proprietary Uzbekistan state identity/signing tool; no free redistribution terms")
    ("nvidia-390xx-utils" "PROPRIETARY_DRIVER" "NVIDIA 390xx legacy driver utilities; proprietary blob; redistribution requires NVIDIA agreement")
    ("nvidia-470xx-utils" "PROPRIETARY_DRIVER" "NVIDIA 470xx legacy driver utilities; proprietary blob; redistribution requires NVIDIA agreement")
    ("samsung-unified-driver-printer" "PROPRIETARY_LICENSE" "Samsung unified printer driver uses custom Samsung license; redistribution unclear; requires Samsung proprietary binaries")
    ("samsung-unified-driver-scanner" "PROPRIETARY_LICENSE" "Samsung unified scanner driver uses custom Samsung license; redistribution unclear; requires Samsung proprietary binaries")
    ("opencl-amd" "PROPRIETARY_LICENSE" "AMD ROCm OpenCL runtime; repackaged from Ubuntu releases; custom AMD redistribution terms apply")
    ("lib32-nvidia-utils-beta" "PROPRIETARY_DRIVER" "NVIDIA 32-bit beta utilities; proprietary driver blob; also requires lib32 multilib unsupported in Guix")
    ("plasticscm-client-core" "PROPRIETARY_LICENSE" "Unity Version Control (formerly Plastic SCM) is proprietary commercial software; LicenseRef-UnityVersionControl")
    ("spotify" "PROPRIETARY_LICENSE" "Spotify client is proprietary; custom license prohibits redistribution and reverse engineering")
    ("android-sdk" "PROPRIETARY_LICENSE" "Google Android SDK uses custom license terms; requires acceptance of Android SDK License Agreement")
    ("iscan" "PROPRIETARY_LICENSE" "Epson Image Scan! uses mixed custom AVASYSPL + GPL license; proprietary components cannot be freely redistributed")
    ("python-frida" "PROPRIETARY_LICENSE" "Frida uses wxWindows Library License for Python bindings; frida-core native component has complex build requiring proprietary SDK elements")
    ("electron22-bin" "PROPRIETARY_BINARY" "Electron 22 is EOL (end-of-life); security vulnerabilities unpatched; Chromium-based binary with complex licensing")

    ;; ── ARCH-SPECIFIC / NOT MEANINGFUL FOR GUIX ──
    ("ros2-arch-deps" "ARCH_META_PACKAGE" "Arch-specific meta-package listing ROS2 build dependencies for pacman; not meaningful for Guix which has different dep resolution")
    ("aurutils" "ARCH_SPECIFIC" "AUR helper tools for Arch Linux pacman ecosystem; depends on pacutils, makepkg; no use outside Arch")
    ("yaycache" "ARCH_SPECIFIC" "Yay/pacman cache cleaning tool; depends on pacman-contrib; Arch package manager specific")
    ("paru-git" "ARCH_SPECIFIC" "AUR helper written in Rust; depends on pacman, libalpm; Arch Linux package manager specific")
    ("itchio-dlagent" "ARCH_SPECIFIC" "makepkg download agent for itch.io; depends on makepkg infrastructure; Arch-specific")
    ("obsidianctl" "OS_SPECIFIC" "ObsidianOS A/B partition manager; designed specifically for ObsidianOS; requires specific partition layout")
    ("dosh-cqfd" "ARCH_SPECIFIC" "cqfd wrapper for dosh; depends on dosh (Docker-based build tool) and bash-completion; niche Docker workflow tool")
    ("libelectron" "ARCH_META_PACKAGE" "Meta-package for Electron dependencies; Arch-specific dependency grouping; not meaningful for Guix")

    ;; ── LIB32 / MULTILIB UNSUPPORTED ──
    ("lib32-libvmaf" "LIB32_UNSUPPORTED" "32-bit VMAF library; Guix does not support lib32 multilib architecture for x86_64")
    ("lib32-bluez-libs" "LIB32_UNSUPPORTED" "32-bit BlueZ libraries; Guix does not support lib32 multilib; deprecated upstream")

    ;; ── COMPLEX BUILD / INFEASIBLE ──
    ("qt5-webkit" "COMPLEX_BUILD" "QtWebKit 5.212 requires massive WebKit build with extensive Qt5 patching; 30+ deps; webkit2gtk equivalent exists but is Qt-incompatible; attempted: cmake build, simplified deps — build system too complex for single pass")
    ("gcc13" "DUPLICATE_UPSTREAM" "Guix already provides gcc-13 via (gnu packages gcc); AUR version is Arch-specific with Arch patching; use upstream gcc-13 instead")
    ("vscodium-translucent" "COMPLEX_BUILD" "VSCodium with translucent patch requires full Electron/Chromium build infrastructure; 21 deps; patching electron for translucency not feasible in Guix context")
    ("mips64-linux-gnu-gcc-bootstrap" "CROSS_COMPILER_INFEASIBLE" "MIPS64 cross-compilation bootstrap GCC; requires binutils-mips64, linux-api-headers-mips64, glibc-mips64; entire cross-toolchain not available in Guix")
    ("qt5-quick3d" "COMPLEX_BUILD" "Qt5 Quick3D module requires Qt5 build infrastructure, assimp, and extensive Qt private API access; 3 deps but deep Qt integration needed")

    ;; ── COSMIC DESKTOP (Rust ecosystem not available) ──
    ("cosmic-randr-git" "MISSING_DEPENDENCY" "COSMIC desktop Rust ecosystem (libcosmic, cosmic-config, cosmic-text) not available in Guix; all cosmic-* packages blocked on shared Rust crate infrastructure")
    ("cosmic-idle-git" "MISSING_DEPENDENCY" "COSMIC idle daemon; needs libcosmic Rust crate ecosystem; blocked on cosmic Rust infrastructure")
    ("cosmic-screenshot-git" "MISSING_DEPENDENCY" "COSMIC screenshot tool; needs libcosmic + xdg-desktop-portal Rust bindings; blocked on cosmic Rust infrastructure")
    ("cosmic-app-library-git" "MISSING_DEPENDENCY" "COSMIC app library; needs libcosmic Rust crate ecosystem; blocked on cosmic Rust infrastructure")
    ("cosmic-panel-git" "MISSING_DEPENDENCY" "COSMIC panel; needs libcosmic + cosmic-panel-config Rust crates; blocked on cosmic Rust infrastructure")
    ("cosmic-workspaces-git" "MISSING_DEPENDENCY" "COSMIC workspaces; needs libcosmic + smithay Rust crates; blocked on cosmic Rust infrastructure")
    ("cosmic-bg-git" "MISSING_DEPENDENCY" "COSMIC background service; needs libcosmic Rust crate ecosystem; blocked on cosmic Rust infrastructure")
    ("cosmic-notifications-git" "MISSING_DEPENDENCY" "COSMIC notifications daemon; needs libcosmic Rust crate ecosystem; blocked on cosmic Rust infrastructure")
    ("cosmic-files-git" "MISSING_DEPENDENCY" "COSMIC file manager; needs libcosmic Rust crate ecosystem; blocked on cosmic Rust infrastructure")
    ("cosmic-launcher-git" "MISSING_DEPENDENCY" "COSMIC launcher; needs libcosmic + pop-launcher Rust crates; blocked on cosmic Rust infrastructure")

    ;; ── RUST BUILD (cargo crate ecosystem not available) ──
    ("kanidm-clients" "MISSING_DEPENDENCY" "Kanidm identity management client; large Rust project needing 200+ crates; kanidm-proto, webauthn-rs not in Guix")
    ("kanidm-server" "MISSING_DEPENDENCY" "Kanidm identity management server; large Rust project; same dep chain as kanidm-clients plus LDAP/RADIUS crates")
    ("kanidm-unixd-clients" "MISSING_DEPENDENCY" "Kanidm Unix PAM/NSS client; depends on kanidm-proto Rust crate; blocked on kanidm Rust ecosystem")
    ("easytier-cli" "MISSING_DEPENDENCY" "EasyTier VPN CLI; Rust project needing wireguard-rs, tokio ecosystem, tun-tap crates not in Guix")
    ("easytier-core" "MISSING_DEPENDENCY" "EasyTier VPN core; Rust project with same dep chain as easytier-cli; needs full async Rust networking stack")
    ("easytier-web" "MISSING_DEPENDENCY" "EasyTier VPN web UI; Rust project with same dep chain; needs axum web framework crates")
    ("eww" "MISSING_DEPENDENCY" "Elkowar's Wacky Widgets; Rust + GTK3; needs gtk-layer-shell, libdbusmenu Rust bindings, 100+ crates not packaged")
    ("memoria-daemon" "MISSING_DEPENDENCY" "Memoria clipboard daemon; Rust + cmake; needs tokio, rusqlite, wl-clipboard-rs crates not in Guix")
    ("vectorchord" "MISSING_DEPENDENCY" "PostgreSQL vector search extension; Rust + Cargo + clang; needs pgrx (PostgreSQL Rust extension framework) not in Guix")
    ("stardust-xr-non-spatial-input" "MISSING_DEPENDENCY" "Stardust XR input module; Rust/Smithay experimental; needs stardust-xr-server-interface crate not in Guix")
    ("stardust-xr-server" "MISSING_DEPENDENCY" "Stardust XR display server; Rust/Smithay; needs stereokit, flatland crates; experimental project")
    ("aylurs-gtk-shell-git" "MISSING_DEPENDENCY" "AGS (Aylur's Gtk Shell); TypeScript/GJS widget system; needs astal, gjs TypeScript infrastructure not available in Guix")

    ;; ── MISSING DEPENDENCIES (specific libs/tools) ──
    ("intel-npu-driver" "MISSING_DEPENDENCY" "Intel NPU driver needs specific kernel support (intel_vpu module), level-zero-loader, and intel-compute-runtime; none in Guix; 11 deps")
    ("ggml-sycl-f16-git" "MISSING_DEPENDENCY" "GGML with Intel SYCL; requires Intel oneAPI/SYCL compiler (icpx) and oneMKL; proprietary Intel toolchain not in Guix")
    ("llama.cpp-hip" "MISSING_DEPENDENCY" "llama.cpp with AMD ROCm/HIP; needs ROCm stack (hip-runtime-amd, rocblas, hipblas); ROCm not available in Guix")
    ("ps3-psl1ght" "MISSING_DEPENDENCY" "PS3 homebrew SDK; needs ps3-toolchain (ppu-gcc, spu-gcc cross compilers); entire PS3 toolchain not in Guix")
    ("eprosima-fast-dds" "MISSING_DEPENDENCY" "eProsima Fast-DDS needs foonathan_memory allocator library and eprosima-fast-cdr; neither in Guix")
    ("tagparser" "MISSING_DEPENDENCY" "Tag parser C++ library needs c++utilities (Martchus utility library); not in Guix; attempted: direct cmake — blocked on c++utilities")
    ("qtforkawesome-qt6" "MISSING_DEPENDENCY" "QtForkAwesome needs qtutilities-qt6 (Martchus Qt utilities); not in Guix; depends on tagparser chain")
    ("sleuthkit-java" "MISSING_DEPENDENCY" "The Sleuth Kit Java bindings; sleuthkit base package not in Guix; needs JNI build with ant/ivy")
    ("python-albucore" "MISSING_DEPENDENCY" "Albucore needs python-simsimd and python-stringzilla; neither in Guix; both are C-extension packages needing separate packaging")
    ("python-loro" "MISSING_DEPENDENCY" "Loro Python bindings; needs python-maturin (Rust/Python bridge build tool); requires Rust compilation of loro-core")
    ("python-asyncpraw" "MISSING_DEPENDENCY" "AsyncPRAW needs python-asyncprawcore; not in Guix; also needs prawcore async variant")
("dpt-rp1-py" "MISSING_DEPENDENCY" "Sony DPT-RP1 manager needs python-httpsig; not in Guix; also needs specific device USB access")
    ("tzpfms" "MISSING_DEPENDENCY" "TPM-based ZFS encryption keys; depends on zfs-utils (ZFS not in Guix due to licensing); also needs tpm2-tss")
    ("zectl" "MISSING_DEPENDENCY" "ZFS Boot Environment manager; depends on ZFS; ZFS is not in Guix due to CDDL/GPL license incompatibility")
    ("arduino-builder" "MISSING_DEPENDENCY" "Arduino sketch compiler; needs arduino-ctags and Arduino core toolchain; not in Guix; Go build also needed")
    ("cryptomator" "MISSING_DEPENDENCY" "Cryptomator needs Maven build system and JavaFX (OpenJFX); Maven not in Guix; Java build would need 50+ Maven artifacts")
    ("pgadmin4-web" "MISSING_DEPENDENCY" "pgAdmin4 web interface; complex Python + Node.js app needing Flask, SQLAlchemy, webpack, 100+ Python/JS deps")
    ("kcontacts5" "MISSING_DEPENDENCY" "KDE Frameworks 5 Contacts library; needs KF5 CMake infrastructure (extra-cmake-modules for KF5 series); Guix has KF6 (kcontacts 6.x)")
    ("cairo-dock-core-wayland-git" "MISSING_DEPENDENCY" "Cairo-Dock wayland; needs cairo-dock-plug-ins infrastructure, libgldi, and wayland-specific patches; complex GTK3/wayland integration")

    ;; ── COMPLEX / NICHE ──
    ("sidef" "MISSING_DEPENDENCY" "Sidef programming language; needs 11 Perl math modules (perl-math-gmpq, perl-math-gmpz, perl-math-mpfr, perl-math-mpc, etc.); most not in Guix")
    ("themix-import-images-git" "MISSING_DEPENDENCY" "Themix image import plugin; needs themix-gui (oomox) base which is not in Guix; plugin cannot work standalone")
    ("themix-plugin-base16-git" "MISSING_DEPENDENCY" "Themix Base16 plugin; needs themix-gui (oomox) base; cannot work standalone")
    ("themix-theme-oomox-git" "MISSING_DEPENDENCY" "Themix/Oomox GTK theme generator; needs themix-gui and sassc/inkscape toolchain for theme compilation; not in Guix")
    ("element-web-git" "COMPLEX_BUILD" "Element Web from git; needs Node.js/Yarn/Webpack build infrastructure; 500+ npm dependencies; matrix-js-sdk offline build not feasible")
    ("epsonscan2" "MISSING_DEPENDENCY" "Epson Scan 2; needs libsane + Epson-specific scanner backends; complex proprietary/GPL mixed build")
    ("upscayl-ncnn" "MISSING_DEPENDENCY" "Upscayl NCNN upscaler; needs ncnn (Tencent neural network inference); ncnn not in Guix; also needs Vulkan compute shaders")
    ("setools" "MISSING_DEPENDENCY" "SELinux policy analysis tools; needs libselinux, libsepol, checkpolicy; SELinux infrastructure not in Guix")
    ))
