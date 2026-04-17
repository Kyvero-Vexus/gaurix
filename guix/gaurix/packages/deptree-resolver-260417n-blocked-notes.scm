;;; Blocked notes for deptree-resolver-260417n
;;; 16 packages remain BLOCKED after exhausting resolution attempts.
;;;
;;; PROPRIETARY (2):
;;;   raidrivecli (#14202) - not in AUR cache, proprietary cloud storage CLI
;;;   xilinx-ise (#14616) - registration-walled 6GB+ installer, Xilinx account required
;;;
;;; SOURCE_UNAVAILABLE (3):
;;;   chatgqt (#14575) - no URL in AUR metadata, GitHub repo returns 404
;;;   void-electron-latest-bin (#14576) - void-editor project fragmented, no stable binary found
;;;   transistor-git (#14539) - GitLab repo (driglu4it/transistor) returns 403
;;;
;;; ARCH_SPECIFIC (2):
;;;   asp (#14587) - Arch Linux build source mgmt tool, depends on pacman infrastructure
;;;   pacwall-git (#14584) - generates wallpaper from pacman dependency graph, no Guix analogue
;;;
;;; MISSING_DEP (5):
;;;   godot-double-mono (#14495) - needs dotnet-sdk (not in Guix)
;;;   watchman (#14593) - needs fbthrift, fizz, wangle, edencommon (Meta C++ stack not in Guix)
;;;   omada-controller (#14599) - needs MongoDB server (not in Guix), complex Java service
;;;   lenovolegionlinux-dkms-git (#14563) - depends on lenovolegionlinux-git (not packaged) + DKMS
;;;   leetmouse-driver-dkms (#14633) - DKMS kernel module, Guix has no DKMS infrastructure
;;;
;;; DEP_CHAIN_TOO_DEEP (3):
;;;   python-gradio (#14579) - 40+ transitive Python deps not in Guix (fastapi, pydantic-v2, etc.)
;;;   python-torchaudio-rocm (#14583) - full PyTorch + ROCm/HIP compiler stack
;;;   electron-builder (#14623) - 200+ Node.js/npm transitive dependencies
;;;
;;; COMPLEX_BUILD (1):
;;;   elmerfem-git (#14617) - 40+ deps total; many MakeDepends not in Guix
;;;     (cli11, ospray, anari-sdk, adios2, liblas, pdal, openvr)
;;;     Attempted: cmake-build-system with available deps; fails on missing specialty libs
