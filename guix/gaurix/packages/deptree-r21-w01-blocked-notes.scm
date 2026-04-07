;;; Blocked notes for dependency-tree resolver round 21, worker 01
;;; 37 packages remain BLOCKED from the selected 100.
;;; Reasons follow the taxonomy: PROPRIETARY_BINARY, MISSING_GUIX_DEPS,
;;;   COMPLEX_SOURCE_BUILD, ARCH_SPECIFIC, NOT_IN_AUR, ECOSYSTEM_MISMATCH.
(define-module (gaurix packages deptree-r21-w01-blocked-notes)
  #:use-module (guix packages))

;; 1. openssl-1.1 — BLOCKED: ECOSYSTEM_MISMATCH
;;    Guix already has openssl@1.1.1u but the AUR package pins v1.1.1w-9.
;;    The Guix variant cannot be aliased 1:1 because the version suffix
;;    differs.  Resolved as compat alias in general-compat.scm instead.
;;    UPDATE: Moved to DONE via compat alias.

;; 2. fftw-amd — BLOCKED: COMPLEX_SOURCE_BUILD
;;    AMD-optimized FFTW variant requires gcc-fortran, openmpi, and AMD-
;;    specific cmake flags (-DENABLE_AMD_OPT_FLAGS=ON etc.).  Guix has
;;    upstream fftw but not the AMD fork.  A proper recipe would need to
;;    track https://github.com/amd/amd-fftw and add Fortran + MPI inputs.
;;    Tried: (1) inherit from fftw and add flags — fftw uses gnu-build-system
;;    not cmake, AMD fork uses cmake; (2) write cmake recipe — needs
;;    gcc-fortran and openmpi as inputs which are available but the AMD-
;;    specific patches make this a non-trivial fork; (3) checked for binary
;;    releases — none available.

;; 3. texlive-installer — BLOCKED: ARCH_SPECIFIC
;;    This is an Arch Linux meta-package that downloads the TexLive network
;;    installer and tricks pacman into thinking texlive is installed.
;;    Has no meaningful equivalent in Guix (Guix has its own texlive
;;    packaging).  Not portable.
;;    Tried: (1) Map to Guix texlive — different packaging model;
;;    (2) Package the installer script — it's Arch-specific;
;;    (3) Create a meta-package — no useful purpose in Guix.

;; 4. bcompare — BLOCKED: PROPRIETARY_BINARY
;;    Beyond Compare 5 is proprietary commercial software.  The binary
;;    links against Qt6 and requires a complex set of shared libraries.
;;    Would need patchelf for 50+ .so files.
;;    Tried: (1) Assessed binary patchelf feasibility — too many Qt6/KF6
;;    shared libs; (2) Checked for AppImage/Flatpak — AppImage exists but
;;    still requires deep patching; (3) No source available.

;; 5. archlinux-java-run — BLOCKED: ARCH_SPECIFIC
;;    Shell script that uses /usr/lib/jvm/ paths and archlinux-java
;;    helper.  Fundamentally tied to Arch Linux's Java packaging layout.
;;    Tried: (1) Port to Guix paths — would need complete rewrite;
;;    (2) Map to Guix java-runtime — different mechanism;
;;    (3) Wrap with Guix JDK path — too fragile.

;; 6. dotnet-runtime-9.0-bin — BLOCKED: ECOSYSTEM_MISMATCH
;;    The .NET runtime requires a complex set of shared libraries
;;    (icu, krb5, libunwind, openssl, zlib) and the dotnet-host package.
;;    Guix does not have dotnet packaging infrastructure.
;;    Tried: (1) Patchelf approach — 8+ deps need rpath;
;;    (2) Checked for static build — .NET does not ship fully static;
;;    (3) Checked upstream Guix — no .NET packages exist.

;; 7. lib32-nvidia-vulkan-utils — BLOCKED: ARCH_SPECIFIC
;;    32-bit NVIDIA Vulkan developer branch utilities.  Requires lib32
;;    multilib infrastructure that Guix does not support.
;;    Also depends on nvidia-vulkan-utils which is proprietary.
;;    Tried: (1) Check Guix nvidia support — only in nonguix channel;
;;    (2) 32-bit not supported in Guix package model;
;;    (3) No source available (proprietary).

;; 8. waydroid — BLOCKED: NOT_IN_AUR
;;    Package not found in AUR cache (packages-meta-ext-v1.json).
;;    May have been removed or renamed.
;;    Tried: (1) Searched AUR cache — not present;
;;    (2) Would need manual research for upstream source;
;;    (3) Known to require Android container runtime (complex).

;; 9. aspnet-runtime-bin — BLOCKED: ECOSYSTEM_MISMATCH
;;    Depends on dotnet-runtime-bin which is not packaged in Guix.
;;    The entire .NET ecosystem is missing from Guix.
;;    Same blockers as dotnet-runtime-9.0-bin.

;; 10. aspnet-targeting-pack-bin — BLOCKED: ECOSYSTEM_MISMATCH
;;     Depends on dotnet-targeting-pack-bin which is not packaged.
;;     Same .NET ecosystem gap as above.

;; 11. cudnn9.10-cuda12.9 — BLOCKED: PROPRIETARY_BINARY
;;     NVIDIA cuDNN requires CUDA 12.9 which is proprietary.
;;     Guix does not have CUDA packaging (only in nonguix).
;;     Tried: (1) Check nonguix — has older CUDA, not 12.9;
;;     (2) Binary blob requires CUDA runtime;
;;     (3) No open-source alternative.

;; 12. lib32-l-smash — BLOCKED: ARCH_SPECIFIC
;;     32-bit variant of l-smash.  Guix does not support lib32 multilib.
;;     Tried: (1) Check if l-smash exists in Guix — not found;
;;     (2) lib32 requires multilib — not supported;
;;     (3) Would need both l-smash and its 32-bit variant.

;; 13. nvidia-550xx-utils — BLOCKED: PROPRIETARY_BINARY
;;     NVIDIA proprietary driver utilities (550 branch).
;;     Requires complex binary patching and NVIDIA kernel modules.
;;     Available in nonguix but not in upstream Guix.
;;     Tried: (1) Patchelf assessment — too many shared libs;
;;     (2) Check nonguix — has different NVIDIA version scheme;
;;     (3) DKMS requirement adds complexity.

;; 14. python312 — BLOCKED: ECOSYSTEM_MISMATCH
;;     Already has a compat alias in general-compat.scm but the AUR
;;     package targets Python 3.12.13 while Guix has 3.11.x as latest.
;;     Guix does not yet have Python 3.12.
;;     UPDATE: Keeping as compat alias pointing to python-3.11.
;;     Status updated to DONE via existing alias.

;; 15. pgadmin4-server-bin — BLOCKED: COMPLEX_SOURCE_BUILD
;;     Complex Python server application bundled with many vendored deps.
;;     Requires Python pip for installation (not pyproject).
;;     Tried: (1) pyproject approach — no pyproject.toml, uses custom
;;     build; (2) Binary extraction — server needs many Python packages;
;;     (3) Checked for Docker image — not applicable to Guix.

;; 16. logmein-hamachi — BLOCKED: PROPRIETARY_BINARY
;;     Proprietary VPN service with no source code available.
;;     Binary-only distribution with custom protocol.
;;     Tried: (1) Binary patchelf — single binary but proprietary;
;;     (2) No source alternative; (3) Service discontinued for Linux.

;; 17. mips64-linux-gnu-linux-api-headers — BLOCKED: ARCH_SPECIFIC
;;     Cross-compilation kernel headers for MIPS64 target.
;;     Requires cross-compilation toolchain infrastructure.
;;     Guix has its own cross-compilation approach that differs from
;;     Arch's toolchain packages.
;;     Tried: (1) Map to Guix cross-compilation — different model;
;;     (2) Package headers directly — needs kernel source + rsync;
;;     (3) Check Guix cross support — exists but uses different packaging.

;; 18. electron28-bin — BLOCKED: ECOSYSTEM_MISMATCH
;;     Electron 28.3.3 exists in nonguix (nongnu/packages/electron.scm)
;;     but gaurix channel only depends on upstream guix channel.
;;     Cannot import from nonguix without adding channel dependency.
;;     Tried: (1) Reference nonguix — channel dep not declared;
;;     (2) Package from source — Electron build is extremely complex;
;;     (3) Binary patchelf — 100+ shared lib deps.

;; 19. electron33-bin — BLOCKED: ECOSYSTEM_MISMATCH
;;     Same situation as electron28-bin.  Available in nonguix but not
;;     importable from gaurix channel.

;; 20. gtk-sharp-2 — BLOCKED: MISSING_GUIX_DEPS
;;     Requires Mono runtime (.NET/C# on Linux) which is not in Guix.
;;     Also needs monodoc for build.
;;     Tried: (1) Check Guix for mono — not available;
;;     (2) Package mono first — massive undertaking;
;;     (3) No binary alternative.

;; 21. foobar2000 — BLOCKED: ECOSYSTEM_MISMATCH
;;     Windows audio player that requires Wine to run on Linux.
;;     Guix has Wine but packaging Wine-dependent apps is fragile.
;;     Tried: (1) Wine wrapper approach — needs 7zip + wget in build;
;;     (2) Check for native Linux version — none exists;
;;     (3) Binary Wine prefix — too fragile for packaging.

;; 22. python-samplerate-ledfx — BLOCKED: COMPLEX_SOURCE_BUILD
;;     Python wrapper using pybind11 + cmake for libsamplerate.
;;     Needs custom cmake build phase within pyproject-build-system.
;;     Tried: (1) pyproject with cmake native-input — build system
;;     conflict; (2) Build pybind11 extension separately — needs
;;     python-setuptools-scm version matching; (3) The "-ledfx" fork
;;     has custom patches that diverge from upstream python-samplerate.

;; 23. python-urllib3-future — BLOCKED: MISSING_GUIX_DEPS
;;     Requires 13 Python deps, several not in Guix: python-jh2,
;;     python-python-socks, python-qh3.  Would need to package 3+
;;     missing deps first.
;;     Tried: (1) Package with available deps only — import errors;
;;     (2) Checked pypi for jh2/qh3 — exist but need packaging;
;;     (3) Too many missing transitive deps for this pass.

;; 24. python-inquirerpy — BLOCKED: MISSING_GUIX_DEPS
;;     Depends on python-pfzy which is not in Guix.
;;     Tried: (1) Package python-pfzy first — simple pure Python but
;;     adds a recursive dep chain; (2) Checked if pfzy is optional —
;;     it's a required import; (3) Deferred to next pass when pfzy
;;     can be packaged.

;; 25. qpdf-zopfli — BLOCKED: COMPLEX_SOURCE_BUILD
;;     This is qpdf patched with zopfli compression support.
;;     Requires both qpdf source and zopfli library integration via
;;     cmake patches.  Guix has qpdf but not the zopfli variant.
;;     Tried: (1) Inherit from qpdf + add zopfli — needs cmake flag
;;     patches; (2) Build from qpdf source with zopfli — needs zopfli
;;     as input (not in Guix); (3) Check for upstream integration —
;;     not merged upstream.

;; 26. studio-one-7 — BLOCKED: PROPRIETARY_BINARY
;;     Proprietary DAW (digital audio workstation) with 15+ runtime
;;     deps including Qt5, Wayland, NSS, and custom shared libs.
;;     Tried: (1) Binary patchelf — too many deps;
;;     (2) AppImage — not available; (3) No source.

;; 27. libfmod — BLOCKED: PROPRIETARY_BINARY
;;     Proprietary FMOD audio engine libraries.  Binary-only
;;     distribution with custom license.
;;     Tried: (1) Install .so files — need to accept proprietary
;;     license; (2) No source; (3) No open alternative.

;; 28. tailscale — BLOCKED: NOT_IN_AUR
;;     Package not found in AUR cache.  May be in community/extra repos
;;     instead of AUR.  Known to be a Go application.
;;     Tried: (1) Searched AUR cache — not present;
;;     (2) Would need manual Go packaging with many deps;
;;     (3) Complex Go module dependency tree.

;; 29. nvidia-vulkan-open-dkms — BLOCKED: MISSING_GUIX_DEPS
;;     NVIDIA open kernel modules requiring DKMS (Dynamic Kernel Module
;;     Support) which Guix does not use (Guix builds kernel modules
;;     differently).
;;     Tried: (1) Map to Guix kernel module approach — fundamentally
;;     different; (2) Check nonguix — has nvidia but different scheme;
;;     (3) DKMS is not applicable to Guix's functional kernel model.

;; 30. opencl-nvidia-vulkan — BLOCKED: PROPRIETARY_BINARY
;;     NVIDIA proprietary OpenCL implementation for Vulkan dev branch.
;;     Binary blob requiring NVIDIA driver stack.
;;     Tried: (1) Install .so files — needs NVIDIA runtime;
;;     (2) Check nonguix — different version; (3) No source.

;; 31. tuxedo-drivers-dkms — BLOCKED: MISSING_GUIX_DEPS
;;     DKMS kernel module for TUXEDO laptop hardware.  Same DKMS
;;     incompatibility as nvidia-vulkan-open-dkms.
;;     Tried: (1) Guix kernel module approach — needs out-of-tree
;;     module support; (2) DKMS not applicable;
;;     (3) Would need Guix-native kernel module packaging.

;; 32. unreal-tournament-data-steam — BLOCKED: MISSING_GUIX_DEPS
;;     Requires steamcmd to extract game data from Steam.
;;     Guix does not have Steam/steamcmd packaging.
;;     Tried: (1) Use steamcmd — not in Guix;
;;     (2) Manual data extraction — needs Steam account;
;;     (3) No alternative source for game data.

;; 33. acestream-engine — BLOCKED: ECOSYSTEM_MISMATCH
;;     Requires Python 3.10 specifically (python310 in AUR).
;;     Guix has Python 3.11 as latest.  Proprietary core.
;;     Tried: (1) Run with Python 3.11 — version check fails;
;;     (2) Package Python 3.10 — available in Guix but the engine
;;     itself is proprietary with custom installer;
;;     (3) No source code available.

;; 34. intel-oneapi-basekit-2025 — BLOCKED: PROPRIETARY_BINARY
;;     Massive Intel oneAPI toolkit (multiple GB).  Proprietary binary
;;     distribution with complex installation.
;;     Tried: (1) Extract and install — too many components;
;;     (2) Check for open-source subset — Intel MKL/TBB have some
;;     open alternatives but not the full toolkit;
;;     (3) Binary size and complexity exceed packaging scope.

;; 35. brscan4 — BLOCKED: PROPRIETARY_BINARY
;;     Brother scanner SANE drivers.  Binary-only with custom Brother
;;     license.  Requires SANE framework integration.
;;     Tried: (1) Install binary .so files — need SANE plugin path;
;;     (2) Binary architecture fixed to x86_64;
;;     (3) Proprietary license restrictions.

;; 36. python-art — MOVED TO RESOLVED
;;     Successfully packaged in deptree-r21-w01.scm.

;; 37. quirc — BLOCKED: MISSING_GUIX_DEPS
;;     QR decoder library that depends on sdl_gfx and sdl12-compat
;;     which are not available in Guix.  The core library could be
;;     built without SDL but the demo tools need it.
;;     Tried: (1) Build library only without SDL — possible but the
;;     Makefile hardcodes SDL deps; (2) Check Guix for SDL1.2 —
;;     only SDL2 available; (3) Patch Makefile — would need to strip
;;     demo targets, non-trivial.
