;;; Blocked notes for deptree-resolver-260417aj
;;; 30 packages could not be resolved
;;;
;;; raidrivecli (#14202): MISSING_SOURCE: Not in AUR cache; no upstream source.  Re-confirmed in 260417aj pass
;;; redact-bin (#15032): PROPRIETARY_LICENSE: No source code available.  Re-confirmed in 260417aj pass
;;; ttf-ms-office365 (#16018): PROPRIETARY_LICENSE: Microsoft Office 365 font license prohibits redistribution.  Tried: (1) check EULA -- only licensed for Office 365 subscribers; (2) binary font extract -- license violation; (3) open alternative -- Liberation/Croscore fonts exist
;;; fonts-apple (#14971): PROPRIETARY_LICENSE: Apple license forbids redistribution.  Re-confirmed in 260417aj pass
;;; otf-apple-pingfang (#15346): PROPRIETARY_LICENSE: Apple restricted font license explicitly forbids redistribution.  Tried: (1) check Apple EULA -- redistribution prohibited; (2) check for open-source alternatives -- Noto CJK exists; (3) installer-only approach -- license still blocks
;;; otf-apple-pingfang-relaxed (#15347): PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Same as otf-apple-pingfang
;;; otf-apple-pingfang-ui (#15348): PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Same as otf-apple-pingfang
;;; chatgqt (#14575): MISSING_SOURCE: No upstream repository.  Re-confirmed in 260417aj pass
;;; code-server-marketplace (#15031): COMPLEX_PACKAGING: Needs code-server not in Guix.  Re-confirmed in 260417aj pass
;;; libfprint-2-tod1-broadcom (#15005): PROPRIETARY_LICENSE: Proprietary binary blob.  Re-confirmed in 260417aj pass
;;; ntsync-dkms (#15010): DKMS_UNSUPPORTED: Out-of-tree DKMS module; upstream in Linux >= 6.14.  Re-confirmed in 260417aj pass
;;; odoo18-nightly (#14669): COMPLEX_PACKAGING: 500+ Python deps.  Re-confirmed in 260417aj pass
;;; arch-shell (#14726): ARCH_SPECIFIC: Requires mkarchroot from devtools.  Re-confirmed in 260417aj pass
;;; dude-bin (#14699): ARCH_SPECIFIC: Links against libalpm (pacman).  Re-confirmed in 260417aj pass
;;; mt76-dkms-git (#14914): DKMS_UNSUPPORTED: Out-of-tree DKMS kernel module.  Re-confirmed in 260417aj pass
;;; parus (#15189): ARCH_SPECIFIC: TUI frontend for paru (AUR helper).  Tried: (1) check deps -- requires paru binary; (2) package paru -- it's an Arch-specific AUR helper; (3) adapt for Guix -- entire purpose is paru/AUR interaction
;;; pacwall-git (#14584): ARCH_SPECIFIC: Core logic uses pacman database.  Re-confirmed in 260417aj pass
;;; iriunwebcam-bin (#15158): DKMS_UNSUPPORTED: Depends on v4l2loopback-dkms (out-of-tree kernel module).  Tried: (1) package without v4l2loopback -- binary crashes without kernel module; (2) check for v4l2loopback in Guix -- not available; (3) static build -- not feasible, needs kernel integration
;;; starsector (#15139): PROPRIETARY: Commercial game requiring purchase and manual download from fractalsoftworks.com.  Tried: (1) check for direct download URL -- requires login/purchase; (2) binary packaging -- no redistributable archive; (3) Java wrapper only -- still needs proprietary game files
;;; asp (#14587): ARCH_SPECIFIC: Requires devtools and Arch SVN.  Re-confirmed in 260417aj pass
;;; deemix-gui-appimage (#14759): LEGAL_ISSUES: Facilitates copyright infringement.  Re-confirmed in 260417aj pass
;;; gdrcopy (#15131): COMPLEX_DEPS: Requires NVIDIA CUDA toolkit + nvidia-open-dkms, neither available in Guix.  Tried: (1) source build -- needs cuda SDK headers; (2) binary -- no prebuilt .deb/tarball; (3) stub build without CUDA -- not functional
;;; brother-mfc-j5720dw (#15008): PROPRIETARY_LICENSE: i386 binary blobs.  Re-confirmed in 260417aj pass
;;; devkitty-git (#15058): COMPLEX_DEPS: macOS-only binaries, no Linux builds.  Re-confirmed in 260417aj pass
;;; xilinx-ise (#14616): PROPRIETARY_LICENSE: Requires manual download and EULA.  Re-confirmed in 260417aj pass
;;; python-gpustat (#15182): COMPLEX_DEPS: Depends on nvidia-utils and python-nvidia-ml-py (NVIDIA driver stack).  Tried: (1) package without nvidia -- core functionality broken; (2) check for nvidia-ml-py in Guix -- not available; (3) mock nvidia bindings -- defeats purpose
;;; python-torchaudio-rocm (#14583): COMPLEX_DEPS: ROCm ecosystem not available in Guix.  Re-confirmed in 260417aj pass
;;; void-electron-latest-bin (#14576): COMPLEX_DEPS: No Linux binaries published.  Re-confirmed in 260417aj pass
;;; godot-double-mono (#14495): COMPLEX_DEPS: Godot engine with Mono/.NET; massive build deps.  Re-confirmed in 260417aj pass
;;; aiot-ide (#15062): PROPRIETARY_LICENSE: Requires manual download from Chinese portal.  Re-confirmed in 260417aj pass
