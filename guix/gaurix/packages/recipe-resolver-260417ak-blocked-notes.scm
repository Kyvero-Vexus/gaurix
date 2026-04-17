;;; Blocked notes for recipe-resolver-260417ak
;;;
;;; 4. godot-double-mono — BLOCKED: DOTNET_UNSUPPORTED
;;;     Godot engine with double-precision and C#/Mono support.
;;;     Requires .NET SDK 8.0 for C# scripting, which is not in Guix.
;;;     A1: SCons build works but Mono/.NET SDK blocks C# support
;;;     A2: without Mono = different package (godot-double already exists)
;;;     A3: .NET ecosystem bootstrapping is unsolved in Guix
;;;     Prior attempts: recipe-resolver-260416h, deptree-resolver-260417n,
;;;     recipe-resolver-260417ab, deptree-resolver-260417ac/ad/aj
;;;
;;; 5. pacwall-git — BLOCKED: ARCH_SPECIFIC
;;;     Bash script that queries pacman database to generate dependency
;;;     wallpapers.  Core logic uses pacman -Qi exclusively.
;;;     A1: requires pacman database/API — not in Guix
;;;     A2: rewriting core logic for Guix store queries is a fork
;;;     A3: guix graph provides native dependency visualization
;;;     Prior attempts: recipe-resolver-260417n, recipe-resolver-260417ab,
;;;     deptree-resolver-260417ac/ad/aj
;;;
;;; 6. asp — BLOCKED: ARCH_SPECIFIC + DEPRECATED
;;;     Arch Linux build source tool deprecated Nov 2023 (replaced by pkgctl).
;;;     A1: depends on pacman/devtools — not in Guix
;;;     A2: stripping Arch deps removes all functionality
;;;     A3: tool is EOL, replaced by pkgctl upstream
;;;     Prior attempts: recipe-resolver-260417n, recipe-resolver-260417ab,
;;;     deptree-resolver-260417ac/ad/aj
;;;
;;; 7. odoo18-nightly — BLOCKED: MASSIVE_SCALE
;;;     Massive Python ERP framework (50M+ LoC) with 500+ Python deps.
;;;     A1: Python dep tree (500+) exceeds practical manual packaging
;;;     A2: nightly versioning breaks reproducibility model
;;;     A3: PostgreSQL/wkhtmltopdf/Node.js integration requires complex
;;;         system service design
;;;     Prior attempts: recipe-resolver-260417r, recipe-resolver-260417ab,
;;;     deptree-resolver-260417ac/ad/aj
;;;
;;; 8. dude-bin — BLOCKED: ARCH_SPECIFIC
;;;     Rust binary for managing pacman orphan packages.
;;;     Links against libalpm (pacman library) at build time.
;;;     A1: libalpm not in Guix and Arch-only
;;;     A2: guix gc --delete-generations provides native orphan cleanup
;;;     A3: no portable alternative exists
;;;     Prior attempts: recipe-resolver-260417r, recipe-resolver-260417ab,
;;;     deptree-resolver-260417ac/ad/aj
;;;
;;; 9. arch-shell — BLOCKED: ARCH_SPECIFIC
;;;     Tool for disposable Arch chroot environments using devtools.
;;;     A1: devtools not portable beyond Arch
;;;     A2: guix shell provides equivalent isolated environment functionality
;;;     A3: no upstream interest in portability
;;;     Prior attempts: recipe-resolver-260417r, recipe-resolver-260417ab,
;;;     deptree-resolver-260417ac/ad/aj
;;;
;;; 10. mt76-dkms-git — BLOCKED: DKMS_UNSUPPORTED
;;;     Out-of-tree DKMS kernel module for MediaTek WiFi.
;;;     A1: Guix kernel module model requires building with kernel, not DKMS
;;;     A2: mt76 driver already upstream in Linux kernel since 5.x
;;;     A3: users needing newer mt7925 support should use newer kernel version
;;;     Prior attempts: recipe-resolver-260417u, recipe-resolver-260417ab,
;;;     deptree-resolver-260417ac/ad/aj
;;;
;;; Additional note: gdrcopy (#15131) re-evaluated in this pass.
;;;     Userspace library (libgdrapi) can build without CUDA/kernel module,
;;;     but is non-functional without gdrdrv kernel module + NVIDIA GPU drivers.
;;;     Marking EXHAUSTED: CUDA_KERNEL_MODULE.
;;;     A1: userspace lib builds but is useless without kernel module
;;;     A2: kernel module requires NVIDIA driver sources not in Guix
;;;     A3: HPC/CUDA workloads incompatible with Guix sandbox model
