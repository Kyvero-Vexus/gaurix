;;; Blocked notes for deptree-resolver-260418d
;;; 48 packages remain BLOCKED after evaluation
;;;
;;; 18 marked ALREADY_IN_GUIX:
;;;   lib32-lv2 (#15370): ALREADY_IN_GUIX: lv2 (Guix builds for any arch including i686-linux)
;;;   lib32-libbs2b (#15356): ALREADY_IN_GUIX: libbs2b (Guix builds for any arch including i686-linux)
;;;   lib32-libmpeg2 (#15353): ALREADY_IN_GUIX: libmpeg2 (Guix builds for any arch including i686-linux)
;;;   lib32-wildmidi (#15355): ALREADY_IN_GUIX: wildmidi (Guix builds for any arch including i686-linux)
;;;   lib32-libgme (#15354): ALREADY_IN_GUIX: libgme (Guix builds for any arch including i686-linux)
;;;   lib32-rav1e (#15357): ALREADY_IN_GUIX: rav1e (Guix builds for any arch including i686-linux)
;;;   lib32-raptor (#15350): ALREADY_IN_GUIX: raptor2 (Guix builds for any arch including i686-linux)
;;;   libretro-easyrpg-player (#15291): ALREADY_IN_GUIX: libretro-easyrpg in gnu/packages/easyrpg.scm
;;;   godot-double-mono (#14495): ALREADY_IN_GUIX: godot-mono 4.6 in nongnu/packages/game-development.scm
;;;   nautilus-typeahead (#22050): ALREADY_IN_GUIX: nautilus 46.4 in gnu/packages/gnome.scm (typeahead is a minor patch)
;;;   scribus-svn (#21904): ALREADY_IN_GUIX: scribus 1.6.4 in gnu/packages/scribus.scm (stable release)
;;;   lib32-sratom (#15376): ALREADY_IN_GUIX: sratom (Guix builds for any arch including i686-linux)
;;;   lib32-lilv (#15375): ALREADY_IN_GUIX: lilv (Guix builds for any arch including i686-linux)
;;;   lib32-ffmpeg (#15362): ALREADY_IN_GUIX: ffmpeg (Guix builds for any arch including i686-linux)
;;;   lib32-gst-plugins-bad-libs (#15320): ALREADY_IN_GUIX: gst-plugins-bad (Guix builds for any arch including i686-linux)
;;;   lib32-gst-libav (#15318): ALREADY_IN_GUIX: gst-libav (Guix builds for any arch including i686-linux)
;;;   lib32-gst-plugins-ugly (#15321): ALREADY_IN_GUIX: gst-plugins-ugly (Guix builds for any arch including i686-linux)
;;;   lib32-gst-plugins-bad (#15319): ALREADY_IN_GUIX: gst-plugins-bad (Guix builds for any arch including i686-linux)
;;;
;;; 2 resolved under existing recipes:
;;;   claudes-c-compiler-doc (#15405): ALREADY_PACKAGED_PRIOR: included in claudes-c-compiler recipe
;;;   claudes-c-compiler-src (#15406): ALREADY_PACKAGED_PRIOR: included in claudes-c-compiler recipe
;;;
;;; 48 packages remain BLOCKED:
;;;   iup (#15267): COMPLEX_DEPS: needs libcd (not in Guix), openmotif, PUC-Rio custom build system
;;;   sope (#15367): MISSING_DEP: requires gnustep-base (not in Guix), gcc-objc
;;;   ttf-ms-office365 (#16018): PROPRIETARY: Microsoft Office fonts EULA prohibits redistribution
;;;   fonts-apple (#14971): PROPRIETARY: Apple restricted font license prohibits redistribution
;;;   lib32-amdvlk-bin (#15531): PROPRIETARY: AMD Vulkan driver binary, base amdvlk not in Guix
;;;   otf-apple-pingfang (#15346): PROPRIETARY: Apple restricted font license prohibits redistribution
;;;   otf-apple-pingfang-relaxed (#15347): PROPRIETARY: Apple restricted font license prohibits redistribution
;;;   otf-apple-pingfang-ui (#15348): PROPRIETARY: Apple restricted font license prohibits redistribution
;;;   palemoon-i18n-fr (#15388): MISSING_DEP: requires Pale Moon browser (not in Guix)
;;;   seamonkey-i18n-es-es (#15384): MISSING_DEP: requires SeaMonkey browser (not in Guix)
;;;   code-server-marketplace (#15031): MISSING_DEP: requires code-server (not in Guix)
;;;   libfprint-2-tod1-broadcom (#15005): PROPRIETARY: proprietary Broadcom fingerprint sensor driver
;;;   ntsync-dkms (#15010): DKMS_UNSUPPORTED: Linux kernel module (NT sync primitives), Guix lacks DKMS
;;;   odoo18-nightly (#14669): COMPLEX_DEPS: massive Python ERP with 100+ Python deps + PostgreSQL
;;;   8192eu-dkms-git (#15373): DKMS_UNSUPPORTED: Linux kernel module (Realtek 8192eu WiFi), Guix lacks DKMS/linux-module-build-system
;;;   arch-shell (#14726): ARCH_SPECIFIC: creates Arch Linux chroot environments using devtools/pacman
;;;   dude-bin (#14699): ARCH_SPECIFIC: duplicate file finder depending on pacman
;;;   mt76-dkms-git (#14914): DKMS_UNSUPPORTED: Linux kernel module (MediaTek mt76 WiFi), Guix lacks DKMS
;;;   parus (#15189): ARCH_SPECIFIC: TUI frontend for paru AUR helper
;;;   gksu (#21534): MISSING_DEP: requires libgksu (not in Guix), unmaintained since 2012
;;;   pacwall-git (#14584): ARCH_SPECIFIC: visualizes pacman package dependency graph
;;;   pypy3-pyparsing (#15310): MISSING_DEP: requires PyPy3 interpreter (not in Guix)
;;;   rtl8821ce-dkms-git (#22214): DKMS_UNSUPPORTED: Linux kernel module (Realtek 8821CE WiFi), Guix lacks DKMS
;;;   cn-dascom-pin-driver (#15259): MISSING_SOURCE: Dascom printer driver downloads behind vendor portal
;;;   selinux-refpolicy-arch-git (#15487): ARCH_SPECIFIC: SELinux reference policy customized for Arch Linux
;;;   starsector (#15139): PROPRIETARY: commercial game from Fractal Softworks, no free source
;;;   asp (#14587): ARCH_SPECIFIC: Arch Build System tool, depends on pacman infrastructure
;;;   deezer (#21712): MISSING_DEP: requires Electron 39 (not in Guix), proprietary music service
;;;   ec-su_axb35-dkms-git (#15411): DKMS_UNSUPPORTED: Linux kernel module (Sixunited AXB35 EC), Guix lacks DKMS
;;;   fnq-monitor (#15258): MISSING_DEP: requires acpi_call kernel module (not in Guix)
;;;   olauncher (#15269): MISSING_SOURCE: custom license, binary distribution from opaque build
;;;   gdrcopy (#15131): MISSING_DEP: requires NVIDIA CUDA SDK (not in Guix)
;;;   devkitty-git (#15058): MISSING_DEP: requires Electron 41 (not in Guix)
;;;   xilinx-ise (#14616): PROPRIETARY: Xilinx ISE Design Suite, proprietary FPGA tools
;;;   pamac-all (#22052): ARCH_SPECIFIC: Manjaro package manager depending on libalpm/pacman
;;;   gpufetch-nocuda-git (#15425): MISSING_DEP: requires hsa-rocr/ROCm runtime (not in Guix)
;;;   trilinos-git (#15305): COMPLEX_DEPS: massive numerical library (100+ deps including MPI, netcdf, HDF5)
;;;   python-torchaudio-rocm (#14583): COMPLEX_DEPS: requires entire ROCm GPU compute stack (100+ packages)
;;;   aiot-ide (#15062): PROPRIETARY: Xiaomi AIoT IDE, proprietary IoT development environment
;;;   vitis (#15278): PROPRIETARY: AMD/Xilinx Vitis, proprietary FPGA design suite
;;;   cdesktopenv (#22627): COMPLEX_DEPS: CDE desktop needs ksh, motif, rpcsvc-proto + 30 X11/system deps
;;;   ladybird-git (#22620): COMPLEX_DEPS: full web browser needing custom LibWeb/LibJS engine + 40 deps
;;;   lib32-liblrdf (#15349): MISSING_DEP: liblrdf base package not in Guix
;;;   sogo (#15366): MISSING_DEP: requires sope (blocked) + gnustep-base (not in Guix)
;;;   lua-iup (#15266): COMPLEX_DEPS: depends on iup (blocked due to libcd/openmotif)
;;;   lua51-iup (#15265): COMPLEX_DEPS: depends on iup (blocked due to libcd/openmotif)
;;;   lua52-iup (#15264): COMPLEX_DEPS: depends on iup (blocked due to libcd/openmotif)
;;;   lua53-iup (#15263): COMPLEX_DEPS: depends on iup (blocked due to libcd/openmotif)
