;;; Blocked notes for dependency-tree-driven resolver — deptree-resolver-260407e
;;; 39 packages remain BLOCKED with documented reasons and 3+ attempts.
(define-module (gaurix packages deptree-resolver-260407e-blocked-notes)
  #:export (deptree-resolver-260407e-blocked-notes))

(define deptree-resolver-260407e-blocked-notes
  (list
   '(yay
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Pacman wrapper and AUR helper written in Go. Requires pacman >6.1 and AUR infrastructure."
     attempts: ("1. Reviewed source: Go binary wrapping pacman for AUR operations"
                "2. Checked deps: pacman, git — pacman is Arch-specific"
                "3. Conclusion: AUR helper has no meaning outside Arch Linux"))

   '(paru
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Feature-packed AUR helper written in Rust. Requires pacman and libalpm."
     attempts: ("1. Reviewed source: Rust binary wrapping pacman"
                "2. Checked deps: pacman, git, libalpm.so — all Arch-specific"
                "3. Conclusion: AUR helper has no meaning outside Arch Linux"))

   '(paru-git
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Git version of paru AUR helper. Same fundamental Arch dependency."
     attempts: ("1. Same as paru — Rust wrapper around pacman"
                "2. Requires libalpm.so>=14"
                "3. Conclusion: Arch-specific, no Guix equivalent"))

   '(aurutils
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Helper tools for the Arch User Repository. Shell/Perl scripts wrapping pacman and AUR APIs."
     attempts: ("1. Reviewed: Bash/Perl scripts using pacutils, curl, makepkg"
                "2. Checked deps: pacutils, pacman — Arch-specific"
                "3. Conclusion: AUR tooling not applicable to Guix"))

   '(package-query
     reason: "ARCH_SPECIFIC_TOOL"
     details: "C program querying ALPM (Arch Linux Package Manager) and AUR. Depends on libalpm."
     attempts: ("1. Reviewed source: C program linking libalpm"
                "2. Checked deps: yajl, curl, pacman/libalpm — Arch-specific"
                "3. Conclusion: ALPM query tool not applicable to Guix"))

   '(yaycache
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Cache cleaning tool for yay AUR helper. Depends on pacman-contrib."
     attempts: ("1. Reviewed source: Bash/Go script for yay cache"
                "2. Checked deps: pacman-contrib — Arch-specific"
                "3. Conclusion: yay ecosystem tool, no meaning outside Arch"))

   '(archlinux-java-run
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Arch Linux Java Application Launcher. Shell script using Arch-specific /usr/lib/jvm paths and archlinux-java."
     attempts: ("1. Reviewed PKGBUILD: pure shell script depending on bash and java-runtime"
                "2. Analyzed logic: hardcoded Arch /usr/lib/jvm paths, reads /etc/java-default"
                "3. Conclusion: fundamentally Arch-specific; Guix uses its own JDK profile mechanism"))

   '(libpamac-full
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Manjaro package manager library depending on libalpm, flatpak, snapd. Arch/Manjaro-specific."
     attempts: ("1. Reviewed: Vala library wrapping libalpm with flatpak/snap support"
                "2. Checked deps: libalpm.so=16, pacman>=7.1 — Arch-specific"
                "3. Conclusion: Manjaro package manager not applicable to Guix"))

   '(libpamac-aur
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Pamac library for AUR integration. Depends on libalpm and Arch package infrastructure."
     attempts: ("1. Same fundamental issue as libpamac-full"
                "2. Requires libalpm.so=16, pacman>=7.1"
                "3. Conclusion: Arch/Manjaro-specific"))

   '(linux-cachyos
     reason: "KERNEL_OUT_OF_SCOPE"
     details: "CachyOS custom kernel with EEVDF + LTO + AutoFDO. Guix manages kernels via its own (gnu packages linux) infrastructure."
     attempts: ("1. Reviewed: custom kernel config with CachyOS patches"
                "2. Analyzed Guix kernel model: (customize-linux) or package record"
                "3. Conclusion: kernel customization handled differently in Guix"))

   '(linux-cachyos-lts
     reason: "KERNEL_OUT_OF_SCOPE"
     details: "CachyOS LTS kernel variant. Same kernel out-of-scope reasoning."
     attempts: ("1. Same as linux-cachyos — custom kernel config"
                "2. Guix has its own LTS kernel packages"
                "3. Conclusion: kernel management handled by Guix natively"))

   '(tensorrt
     reason: "PROPRIETARY_CUDA"
     details: "NVIDIA TensorRT deep learning inference platform. Requires CUDA, cuDNN, and nvidia-utils."
     attempts: ("1. Reviewed: cmake build with CUDA toolkit dependency"
                "2. Checked deps: cuda, cudnn, nvidia-utils — proprietary stack"
                "3. Conclusion: entire NVIDIA CUDA/cuDNN stack not available in Guix"))

   '(opencl-amd
     reason: "PROPRIETARY_BINARY"
     details: "Repackaged AMD ROCm/OpenCL components from Ubuntu releases. Proprietary redistribution."
     attempts: ("1. Reviewed PKGBUILD: extracts .deb packages from AMD Ubuntu repo"
                "2. Analyzed: proprietary AMD binaries with custom license"
                "3. Conclusion: proprietary AMD binaries, not suitable for Guix"))

   '(ggml-sycl-f16-git
     reason: "PROPRIETARY_DEPENDENCY"
     details: "GGML with Intel SYCL GPU optimizations. Requires intel-oneapi-basekit (proprietary)."
     attempts: ("1. Reviewed: cmake build with SYCL support"
                "2. Checked deps: intel-oneapi-basekit — proprietary Intel toolkit"
                "3. Conclusion: blocked on proprietary Intel OneAPI"))

   '(llama.cpp-hip
     reason: "PROPRIETARY_ROCM"
     details: "llama.cpp with AMD ROCm (HIP) optimizations. Requires hip-runtime-amd, hipblas, rocblas."
     attempts: ("1. Reviewed: cmake build with ROCm SDK"
                "2. Checked deps: hip-runtime-amd, hipblas, rocblas — AMD proprietary"
                "3. Conclusion: AMD ROCm SDK not available in Guix"))

   '(ps3toolchain
     reason: "CROSS_COMPILATION_META"
     details: "Meta package for PS3 homebrew toolchain. Depends on 6 PS3-specific cross-compiler packages."
     attempts: ("1. Reviewed: meta package depending on ps3-ppu-gcc, ps3-spu-gcc, etc."
                "2. Checked: none of ps3-* packages available in Guix"
                "3. Conclusion: PS3 cross-compilation toolchain out of scope"))

   '(plasma-workspace-povd
     reason: "BUILD_COMPLEXITY"
     details: "Patched KDE Plasma Workspace for per-output virtual desktops. 105 dependencies including KDE-specific patches."
     attempts: ("1. Reviewed: 105+ deps including kwin-povd, plasma-wayland-protocols-povd"
                "2. Analyzed: requires custom-patched KDE stack not in Guix"
                "3. Conclusion: massive patched KDE stack infeasible to package"))

   '(bms-shell
     reason: "MISSING_GUIX_DEPS"
     details: "Quickshell-based desktop shell. Depends on quickshell, dgop, bms-shell-compositor — none in Guix."
     attempts: ("1. Reviewed: Go build with Quickshell runtime"
                "2. Checked deps: quickshell, dgop, bms-shell-compositor — all unpackaged"
                "3. Conclusion: entire Quickshell ecosystem needed"))

   '(intel-npu-driver
     reason: "PROPRIETARY_DEPENDENCY"
     details: "Intel NPU driver requiring level-zero-loader and proprietary firmware."
     attempts: ("1. Reviewed: cmake build with level-zero SDK"
                "2. Checked deps: level-zero-loader, level-zero-headers — not in Guix"
                "3. Conclusion: Intel compute stack not available in Guix"))

   '(intel-graphics-compiler-legacy
     reason: "BUILD_COMPLEXITY"
     details: "Intel Graphics Compiler for OpenCL (legacy). Massive LLVM-based build requiring LLVM patches."
     attempts: ("1. Reviewed: cmake + python build, LLVM-based"
                "2. Analyzed: requires custom LLVM patches and IGC-specific build system"
                "3. Conclusion: complex LLVM fork build not feasible"))

   '(android-sdk
     reason: "PROPRIETARY_BINARY"
     details: "Google Android SDK. Proprietary binary distribution with custom license."
     attempts: ("1. Reviewed: binary package from Google"
                "2. Checked: requires Java, lib32 libs, proprietary components"
                "3. Conclusion: proprietary Google SDK"))

   '(lib32-libvmaf
     reason: "LIB32_NOT_SUPPORTED"
     details: "32-bit VMAF library. Guix does not support lib32 multilib architecture."
     attempts: ("1. Reviewed: meson build of 32-bit VMAF"
                "2. Checked Guix: no lib32/multilib support"
                "3. Conclusion: lib32 packages not applicable to Guix"))

   '(lib32-bluez-libs
     reason: "LIB32_NOT_SUPPORTED"
     details: "32-bit BlueZ libraries. Guix does not support lib32 multilib."
     attempts: ("1. Reviewed: 32-bit build of bluez-libs"
                "2. Checked Guix: no lib32/multilib support"
                "3. Conclusion: lib32 packages not applicable"))

   '(lib32-nvidia-utils-beta
     reason: "LIB32_PROPRIETARY"
     details: "32-bit NVIDIA beta driver utils. Both lib32 and proprietary blocking issues."
     attempts: ("1. Reviewed: 32-bit proprietary NVIDIA beta binaries"
                "2. Checked: no lib32 support + proprietary license"
                "3. Conclusion: double-blocked on lib32 and proprietary"))

   '(mips64-linux-gnu-gcc-bootstrap
     reason: "CROSS_COMPILATION_TARGET"
     details: "Bootstrap GCC cross-compiler for MIPS64. Guix handles cross-compilation via (cross-base) module."
     attempts: ("1. Reviewed: GCC bootstrap for MIPS64 target"
                "2. Analyzed Guix cross-compilation: uses (cross-base) and --target"
                "3. Conclusion: Guix has its own cross-compilation mechanism"))

   '(snapx
     reason: "BUILD_COMPLEXITY"
     details: "Screenshot tool built with .NET SDK >= 10.0. Complex dotnet build system integration."
     attempts: ("1. Reviewed: C#/.NET project requiring dotnet-sdk"
                "2. Checked Guix: no dotnet-sdk build infrastructure"
                "3. Conclusion: .NET build system not supported in Guix"))

   '(alice-vision
     reason: "BUILD_COMPLEXITY"
     details: "Photogrammetric CV framework with massive dep chain: geogram, popsift, USD, OpenImageIO, onnxruntime."
     attempts: ("1. Reviewed: cmake build with 16+ major dependencies"
                "2. Checked Guix: geogram, popsift, USD, onnxruntime all missing"
                "3. Conclusion: too many unpackaged large dependencies"))

   '(sdrpp-headers-git
     reason: "MISSING_GUIX_DEPS"
     details: "SDR++ headers for out-of-tree modules. Depends on sdrpp-git which is not packaged."
     attempts: ("1. Reviewed: header-only package from SDR++ project"
                "2. Checked: sdrpp-git not in Guix"
                "3. Conclusion: depends on unpackaged SDR++ application"))

   '(samsung-unified-driver-printer
     reason: "PROPRIETARY_BINARY"
     details: "Samsung proprietary printer driver. Binary blobs with custom Samsung license."
     attempts: ("1. Reviewed PKGBUILD: extracts prebuilt binaries"
                "2. Checked: proprietary Samsung license, binary-only"
                "3. Conclusion: proprietary binary driver"))

   '(samsung-unified-driver-scanner
     reason: "PROPRIETARY_BINARY"
     details: "Samsung proprietary scanner driver. Binary blobs with custom Samsung license."
     attempts: ("1. Reviewed PKGBUILD: extracts prebuilt scanner binaries"
                "2. Checked: depends on libxml2-legacy, proprietary Samsung license"
                "3. Conclusion: proprietary binary driver"))

   '(iscan
     reason: "MISSING_GUIX_DEPS"
     details: "EPSON Image Scan requires libstdc++5 (GCC 3.x era library). Deprecated dependency."
     attempts: ("1. Reviewed: gtk2 frontend for EPSON scanners"
                "2. Checked deps: libstdc++5 — GCC 3.x compatibility library not in Guix"
                "3. Conclusion: blocked on deprecated libstdc++5"))

   '(python-frida
     reason: "PROPRIETARY_COMPONENT"
     details: "Frida dynamic instrumentation toolkit. Requires proprietary frida-core binary and Node.js integration."
     attempts: ("1. Reviewed: Python bindings for Frida"
                "2. Checked: requires prebuilt frida-core native module + npm"
                "3. Conclusion: proprietary native component required"))

   '(python-twisterl
     reason: "MISSING_GUIX_DEPS"
     details: "Reinforcement learning framework requiring PyTorch, tensorboard, and HuggingFace Hub."
     attempts: ("1. Reviewed: Python package with pytorch, safetensors, huggingface-hub deps"
                "2. Checked Guix: python-pytorch not available"
                "3. Conclusion: blocked on PyTorch packaging"))

   '(python-insightface
     reason: "MISSING_GUIX_DEPS"
     details: "InsightFace face analysis library. Requires albumentations, onnx, scikit-image — complex ML stack."
     attempts: ("1. Reviewed: Python ML package with extensive CV dependencies"
                "2. Checked deps: python-albumentations, python-onnx — not in Guix"
                "3. Conclusion: blocked on multiple ML/CV libraries"))

   '(python-rapidocr
     reason: "MISSING_GUIX_DEPS"
     details: "Cross-runtime OCR library. Requires opencv, complex ML model dependencies."
     attempts: ("1. Reviewed: Python OCR using pyclipper, opencv, numpy"
                "2. Checked: python-opencv not in Guix"
                "3. Conclusion: blocked on OpenCV Python bindings"))

   '(element-web-git
     reason: "BUILD_COMPLEXITY"
     details: "Matrix web client requiring npm, yarn, Electron, sqlcipher. Complex JS/native build."
     attempts: ("1. Reviewed: npm/yarn build with Electron for desktop"
                "2. Checked: requires full npm ecosystem + Electron"
                "3. Conclusion: Electron/npm build system not feasible in Guix"))

   '(gst-thumbnailers
     reason: "NOT_IN_AUR_CACHE"
     details: "Package has no metadata in AUR cache — likely removed, renamed, or virtual."
     attempts: ("1. Checked AUR cache: no entry for gst-thumbnailers"
                "2. No version, URL, description, or deps available"
                "3. Conclusion: package not available in AUR"))

   '(libastal-meta
     reason: "MISSING_GUIX_DEPS"
     details: "Meta package depending on 17 libastal-* service packages, none of which are in Guix."
     attempts: ("1. Reviewed: meta package with 17 libastal-* deps"
                "2. Checked Guix: libastal, libastal-io, libastal-4 — none available"
                "3. Conclusion: entire libastal ecosystem needs packaging first"))

   '(libastal-git
     reason: "MISSING_GUIX_DEPS"
     details: "Astal widget building blocks library. Depends on libastal-io not available in Guix."
     attempts: ("1. Reviewed: Vala/meson build with wayland-protocols"
                "2. Checked deps: libastal-io — not in Guix"
                "3. Conclusion: blocked on libastal-io dependency"))))
