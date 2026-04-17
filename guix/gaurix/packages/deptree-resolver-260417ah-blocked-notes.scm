;;; Blocked notes for deptree-resolver-260417ah
;;; 42 packages remain BLOCKED after exhaustive evaluation
;;;
;;; raidrivecli (#14202): MISSING_SOURCE: Not in AUR cache; proprietary cloud storage CLI with no public source or binary.  Tried: (1) AUR search -- no PKGBUILD; (2) web search -- no public download; (3) vendor site requires paid license.
;;; godot-double-mono (#14495): COMPLEX_DEPS: Godot double-precision with C#/Mono requires .NET SDK 8.0 not in Guix.  Tried: (1) build from source needs dotnet-sdk-8.0 + nuget; (2) no pre-built binary published; (3) stripping Mono defeats purpose.
;;; chatgqt (#14575): SOURCE_UNAVAILABLE: No upstream repository found; source only in AUR PKGBUILD.  Tried: (1) AUR metadata has no URL field; (2) searched GitHub/GitLab -- no repo; (3) inline PKGBUILD-only package.
;;; void-electron-latest-bin (#14576): COMPLEX_DEPS: Void editor (VS Code fork) needs Electron 34 not in Guix.  Tried: (1) GitHub has no Linux binaries; (2) build from source needs Electron 34; (3) system Electron version mismatch.
;;; python-torchaudio-rocm (#14583): COMPLEX_DEPS: PyTorch audio with ROCm/HIP GPU support requires massive dep chain.  Tried: (1) ROCm ecosystem (100+ packages) not in Guix; (2) rocm-hip-sdk not available; (3) CPU-only variant loses purpose.
;;; pacwall-git (#14584): ARCH_SPECIFIC: Shell script queries pacman database exclusively.  Tried: (1) core logic uses pacman -Qi; (2) rewrite requires complete fork; (3) guix graph provides native alternative.
;;; asp (#14587): ARCH_SPECIFIC: Arch Build System tool replaced by pkgctl Nov 2023.  Tried: (1) requires Arch SVN infrastructure; (2) Guix has own source management; (3) no cross-distro utility.
;;; xilinx-ise (#14616): PROPRIETARY_LICENSE: Registration-walled 6GB+ installer requiring Xilinx EULA.  Tried: (1) no direct download URL; (2) requires account + EULA; (3) depends on legacy Qt4 + gcc49.
;;; odoo18-nightly (#14669): COMPLEX_PACKAGING: Odoo 18 ERP needs 500+ Python deps and PostgreSQL.  Tried: (1) 500+ Python dep tree exceeds practical packaging; (2) nightly versioning breaks reproducibility; (3) PostgreSQL service integration requires system design.
;;; dude-bin (#14699): ARCH_SPECIFIC: Rust binary linking against libalpm (pacman library).  Tried: (1) libalpm not in Guix; (2) guix gc provides native equivalent; (3) no portable alternative.
;;; arch-shell (#14726): ARCH_SPECIFIC: Depends on mkarchroot/devtools for Arch chroots.  Tried: (1) devtools not portable; (2) Guix has own container/profile mechanisms; (3) no upstream portability interest.
;;; deemix-gui-appimage (#14759): LEGAL_ISSUES: Deezer music downloader archived after legal action.  Tried: (1) project taken down; (2) no stable source URL; (3) legal risk for redistribution.
;;; mt76-dkms-git (#14914): DKMS_UNSUPPORTED: Out-of-tree DKMS kernel module; mt76 driver already upstream in Linux.  Tried: (1) DKMS not supported in Guix; (2) mt76 already in kernel; (3) users should use kernel built-in.
;;; fonts-apple (#14971): PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Tried: (1) license prohibits redistribution; (2) no free alternative; (3) cannot include in channel.
;;; libfprint-2-tod1-broadcom (#15005): PROPRIETARY_LICENSE: Dell/Broadcom binary fingerprint driver blobs.  Tried: (1) PPA has .so blobs; (2) no source code; (3) restricted license.
;;; brother-mfc-j5720dw (#15008): PROPRIETARY_LICENSE: Brother proprietary printer driver with i386 binary blobs.  Tried: (1) i386 binaries; (2) requires lib32-glibc; (3) proprietary license.
;;; ntsync-dkms (#15010): DKMS_UNSUPPORTED: ntsync upstream in Linux >= 6.14.  Tried: (1) DKMS not supported; (2) kernel >= 6.14 has it built-in; (3) out-of-tree impossible without DKMS.
;;; code-server-marketplace (#15031): COMPLEX_DEPS: Requires code-server (complex Node.js app) not in Guix.  Tried: (1) depends on code-server; (2) code-server needs deep npm tree; (3) marketplace patch is version-specific.
;;; redact-bin (#15032): PROPRIETARY_LICENSE: Proprietary Electron app with no source and commercial license.  Tried: (1) no source available; (2) custom commercial license; (3) redistribution prohibited.
;;; devkitty-git (#15058): COMPLEX_DEPS: Requires Electron 41 not in Guix.  Tried: (1) GitHub releases macOS-only; (2) build needs npm/pnpm + Electron 41; (3) no Linux binary published.
;;; aiot-ide (#15062): PROPRIETARY_LICENSE: Xiaomi proprietary IoT IDE with no public source.  Tried: (1) requires Chinese account; (2) proprietary license; (3) no direct download URL.
;;; gizmosql-bin (#15122): SOURCE_UNAVAILABLE: Commercial product with no public download.  Tried: (1) gizmodata.com is commercial; (2) no GitHub repo; (3) AUR PKGBUILD uses private source.
;;; gdrcopy (#15131): COMPLEX_DEPS: NVIDIA GPU Direct RDMA requiring proprietary kernel modules.  Tried: (1) NVIDIA kernel modules not in Guix; (2) userspace library useless without gdrdrv; (3) kernel module required for any functionality.
;;; starsector (#15139): PROPRIETARY_LICENSE: Commercial game requiring paid license.  Tried: (1) AUR expects user-provided installer; (2) no free download; (3) license prohibits redistribution.
;;; iriunwebcam-bin (#15158): PROPRIETARY_LICENSE: Proprietary binary needing v4l2loopback DKMS.  Tried: (1) proprietary binary; (2) v4l2loopback needs kernel module; (3) DKMS unsupported.
;;; 115-browser-bin (#15178): PROPRIETARY_LICENSE: Chinese browser with commercial license.  Tried: (1) requires Chinese region access; (2) commercial license; (3) depends on system Chromium libs.
;;; python-gpustat (#15182): COMPLEX_DEPS: Requires NVIDIA pynvml runtime not in Guix.  Tried: (1) nvidia-ml-py not in Guix; (2) pynvml is a hard import, no fallback; (3) useless without NVIDIA driver.
;;; cryptpad (#15184): COMPLEX_PACKAGING: Node.js web app with 100+ npm dependencies.  Tried: (1) npm install in sandbox impossible; (2) bundling unsupported; (3) requires persistent Node.js server.
;;; python-jupyterlab-variableinspector (#15188): COMPLEX_DEPS: No pre-built wheel; requires npm + hatch-jupyter-builder.  Tried: (1) not on PyPI as wheel; (2) build needs npm step; (3) mixed Python/JS pipeline unsupported.
;;; parus (#15189): ARCH_SPECIFIC: TUI for paru (Arch AUR helper).  Tried: (1) depends on paru; (2) depends on skim; (3) no utility outside Arch.
;;; magicq (#15200): PROPRIETARY_LICENSE: ChamSys proprietary lighting control.  Tried: (1) custom license; (2) proprietary binary-only; (3) redistribution terms unclear.
;;; mdatp-bin (#15203): PROPRIETARY_LICENSE: Microsoft Defender ATP.  Tried: (1) MS repos require agreement; (2) commercial license; (3) systemd tight coupling.
;;; python-ipycache-git (#15273): RESOLVED → see deptree-resolver-260417ah.scm (python-ipycache v0.1.4)
;;; amsel_suite-bin (#15316): PROPRIETARY_LICENSE: TTRPG companion with commercial license.  Tried: (1) custom:commercial; (2) proprietary binary; (3) redistribution prohibited.
;;; unofficial-homestuck-collection-bin (#15324): COMPLEX_PACKAGING: Electron app >2GB with bundled Chromium + multimedia.  Tried: (1) AppImage 2GB+ runtime; (2) no lightweight alternative; (3) impractical size.
;;; otf-apple-pingfang (#15346): PROPRIETARY_LICENSE: Apple PingFang font with restricted redistribution.  Tried: (1) apple-restricted-font license; (2) no free redistribution; (3) cannot include.
;;; otf-apple-pingfang-relaxed (#15347): PROPRIETARY_LICENSE: Apple PingFang variant.  Same restrictions as otf-apple-pingfang.
;;; otf-apple-pingfang-ui (#15348): PROPRIETARY_LICENSE: Apple PingFang UI variant.  Same restrictions as otf-apple-pingfang.
;;; plexamp-bin (#15521): PROPRIETARY_LICENSE: Plex proprietary Electron app.  Tried: (1) custom license prohibits redistribution; (2) requires electron38; (3) AppImage needs Electron runtime.
;;; ttf-ms-office365 (#16018): PROPRIETARY_LICENSE: Microsoft Office fonts prohibit redistribution.  Tried: (1) LicenseRef-ms-office-2024; (2) requires MS Office license; (3) cannot include.
;;; python-libipld-git (#18144): COMPLEX_DEPS: Rust/maturin build system.  Tried: (1) maturin not in Guix; (2) Rust compilation via maturin unsupported; (3) no pre-built Linux wheel for Guix.
;;; python-optking (#18433): COMPLEX_DEPS: Not on PyPI; needs qcelemental/qcengine quantum chemistry chain.  Tried: (1) GitHub-only source; (2) qcelemental/qcengine not in Guix; (3) deep dep chain exceeds scope.
;;; python-tensorstore-bin (#18583): COMPLEX_DEPS: Bazel-based C++ build system.  Tried: (1) Bazel not in Guix; (2) C++ compilation via Bazel impractical; (3) pre-built wheel approach blocked by ml_dtypes dep.
