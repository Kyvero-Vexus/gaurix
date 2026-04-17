;;; deptree-resolver-260417z — blocked notes
;;;
;;; 5 packages resolved with new recipes
;;; 21 packages remain BLOCKED (with exhaustive approach history)
;;;
;;; ARCH_SPECIFIC (4 packages):
;;;   arch-shell (#14726): Tool for disposable Arch chroot environments using devtools.  Tried: (1) check deps -- requires mkarchroot from devtools; (2) adapt for Guix containers -- would need complete rewrite; (3) package as reference script -- nonfunctional without Arch infrastructure
;;;   asp (#14587): Arch Build System tool for managing PKGBUILDs from SVN/git.  Tried: (1) check deps -- requires devtools and Arch SVN infrastructure; (2) package the shell script alone -- depends on makepkg and pacman internals; (3) check for generic equivalent -- no portable version exists
;;;   dude-bin (#14699): Rust binary for managing pacman orphan packages.  Tried: (1) check source -- directly links against libalpm (pacman library); (2) build from source without pacman -- compilation fails without libalpm headers; (3) use pre-built binary -- still requires libalpm.so at runtime
;;;   pacwall-git (#14584): Bash script that queries pacman database to generate dependency wallpapers.  Tried: (1) check source -- core logic uses pacman -Qi calls throughout; (2) adapt for Guix -- would need complete rewrite replacing pacman with guix commands; (3) package as-is with pacman runtime dep -- pacman not available in Guix
;;;
;;; COMPLEX_DEPS (4 packages):
;;;   devkitty-git (#15058): Developer tool requiring Electron 41.  Tried: (1) check GitHub releases -- macOS-only binaries, no Linux builds; (2) build from source -- requires npm + pnpm + nvm + electron 41; (3) AppImage -- none available for this project
;;;   godot-double-mono (#14495): Godot engine with double-precision and Mono/.NET support.  Tried: (1) pre-built binary -- official releases do NOT include double-precision builds; (2) build from source -- requires dotnet-sdk-8.0 and nuget, .NET not in Guix; (3) package standard godot-mono binary -- available but wrong package (not double-precision)
;;;   python-torchaudio-rocm (#14583): PyTorch audio with ROCm/HIP GPU support.  Tried: (1) check ROCm in Guix -- ROCm ecosystem not available; (2) package ROCm first -- 20+ packages (hip, rocblas, miopen, etc.), massive effort; (3) CPU-only build -- defeats the purpose of the -rocm variant
;;;   void-electron-latest-bin (#14576): Void editor (VS Code fork) on latest Electron.  Tried: (1) check GitHub releases -- NO Linux binaries published (macOS/Windows only); (2) build from source -- requires Electron 34 build stack not in Guix; (3) AppImage -- none published for this project
;;;
;;; COMPLEX_PACKAGING (2 packages):
;;;   code-server-marketplace (#15031): Python script + JSON patch to enable VS Code marketplace in code-server.  Tried: (1) package as trivial-build-system with patch.py + patch.json -- tightly coupled to code-server product.json internal structure; (2) create standalone marketplace switcher -- requires code-server package first; (3) package as config overlay -- Guix service would be more appropriate but out of batch scope
;;;   odoo18-nightly (#14669): Massive Python ERP framework (100k+ LOC) with PostgreSQL integration.  Tried: (1) pip install odoo -- 500+ Python dependencies, most not in Guix; (2) package from official .deb -- contains embedded Python venv, not idiomatic; (3) pyproject-build-system -- would require packaging 50+ missing Python deps first
;;;
;;; DKMS_UNSUPPORTED (2 packages):
;;;   mt76-dkms-git (#14914): Out-of-tree DKMS kernel module for MediaTek WiFi.  Tried: (1) mt76 driver is upstream in Linux kernel already; (2) DKMS version provides newer features but Guix uses custom kernel builds; (3) package as linux-module -- requires kernel source tree integration not feasible in batch
;;;   ntsync-dkms (#15010): Out-of-tree DKMS kernel module for NT sync primitives.  Tried: (1) ntsync is upstream in Linux >= 6.14, no DKMS needed; (2) Guix uses custom kernel configs, not DKMS; (3) already packaged ntsync-common (udev rules) and ntsync-header in prior pass -- kernel module is included in-tree for Linux >= 6.14
;;;
;;; LEGAL_ISSUES (1 packages):
;;;   deemix-gui-appimage (#14759): Deezer music downloading tool that facilitates copyright infringement.  Tried: (1) check license -- GPL3 source but purpose is circumventing DRM; (2) check legal status -- tool designed to download copyrighted content without authorization; (3) decided against packaging due to legal liability for channel maintainers
;;;
;;; MISSING_SOURCE (2 packages):
;;;   chatgqt (#14575): No upstream repository; source bundled only in AUR git.  Tried: (1) search for upstream git repo -- none exists, author publishes only via AUR; (2) extract from AUR tarball -- no stable URL for Guix origin; (3) recreate from scratch -- single-file PyQt6 WebEngine app but no redistributable source
;;;   raidrivecli (#14202): Not in AUR cache; no upstream source.  Tried: (1) AUR search -- no PKGBUILD found; (2) web search for raidrivecli linux -- product is Windows/macOS only cloud drive client; (3) checked GitHub/GitLab -- no repo exists
;;;
;;; PROPRIETARY_LICENSE (6 packages):
;;;   aiot-ide (#15062): Xiaomi proprietary IoT development IDE with no source.  Tried: (1) check iot.mi.com for direct download -- requires Chinese phone auth; (2) check for mirrors -- none found; (3) check license -- custom Xiaomi proprietary, no redistribution rights
;;;   brother-mfc-j5720dw (#15008): Brother proprietary printer driver with i386 binary blobs.  Tried: (1) download Brother .deb packages -- available but contain i386 binaries requiring lib32-glibc; (2) check for source-available driver -- Brother provides only binary blobs; (3) package wrapper scripts only -- useless without the proprietary binary filter
;;;   fonts-apple (#14971): Apple restricted font license forbids redistribution.  Tried: (1) check license terms -- explicitly prohibits redistribution outside Apple products; (2) look for open-source alternatives -- none are drop-in replacements with same name; (3) check if fonts are bundled with macOS SDK -- still restricted
;;;   libfprint-2-tod1-broadcom (#15005): Dell/Broadcom proprietary binary fingerprint driver blob.  Tried: (1) check Launchpad PPA for .so files -- available but custom proprietary license; (2) check for open-source alternative -- libfprint supports many readers but not this Broadcom model; (3) binary repackaging -- requires libfprint-tod (modified libfprint2) not in Guix
;;;   redact-bin (#15032): Proprietary Electron app with no source code available.  Tried: (1) check redact.dev for download -- AppImage available but custom restrictive license; (2) check for open-source alternative -- no equivalent exists; (3) binary repackaging -- license explicitly prohibits redistribution
;;;   xilinx-ise (#14616): Xilinx proprietary FPGA tools requiring manual download and EULA acceptance.  Tried: (1) check for direct download URL -- requires Xilinx account login; (2) check for open-source FPGA toolchain alternatives -- exist but not ISE-compatible; (3) binary packaging -- download requires interactive EULA, cannot automate
;;;
;;; NEW RECIPES (5 packages):
;;;   jdk-lts (#15004): New Guix recipe created
;;;   jdk-lts-doc (#15003): New Guix recipe created
;;;   jre-lts (#15002): New Guix recipe created
;;;   resource-hacker (#14969): New Guix recipe created
;;;   watchman (#14593): New Guix recipe created
;;;