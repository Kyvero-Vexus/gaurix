;;; deptree-resolver-260417y — blocked notes
;;;
;;; 13 packages resolved with new recipes
;;; 28 packages already resolved in prior passes (marked DONE)
;;; 26 packages remain BLOCKED
;;;
;;; ARCH_SPECIFIC (4 packages):
;;;   arch-shell (#14726): Creates disposable Arch chroot environments; requires pacman and devtools
;;;   asp (#14587): Arch Build System tool; depends on devtools and Arch SVN infrastructure
;;;   dude-bin (#14699): Pacman orphan package manager; requires pacman at runtime
;;;   pacwall-git (#14584): Generates wallpaper from pacman dependency graph; requires pacman at runtime
;;;
;;; COMPLEX_DEPS (5 packages):
;;;   devkitty-git (#15058): Electron-based developer tool requiring full Chromium/Electron build stack
;;;   godot-double-mono (#14495): Requires Mono/.NET runtime, SCons build, and extensive C# SDK integration
;;;   python-torchaudio-rocm (#14583): Requires ROCm/HIP ecosystem (AMD GPU compute) which is not available in Guix
;;;   void-electron-latest-bin (#14576): Requires system Electron 34 package with specific ABI version matching
;;;   watchman (#14593): Requires version-matched Facebook infrastructure libraries (folly, fbthrift, fb303, edencommon, fizz, mvfst)
;;;
;;; COMPLEX_PACKAGING (2 packages):
;;;   code-server-marketplace (#15031): Patches code-server to use Microsoft VS Code marketplace; tight coupling with code-server internals
;;;   odoo18-nightly (#14669): Massive Python ERP/web framework (100k+ LOC) with PostgreSQL and wkhtmltopdf integration
;;;
;;; DKMS_UNSUPPORTED (2 packages):
;;;   mt76-dkms-git (#14914): Out-of-tree DKMS kernel module for MediaTek WiFi; Guix uses custom kernel configurations
;;;   ntsync-dkms (#15010): Out-of-tree kernel module via DKMS; Guix uses custom kernel configurations instead
;;;
;;; LEGAL_ISSUES (1 packages):
;;;   deemix-gui-appimage (#14759): Deezer music downloading tool; facilitates copyright infringement of streaming content
;;;
;;; MISSING_SOURCE (2 packages):
;;;   chatgqt (#14575): No upstream repository; source tarball bundled in AUR git only
;;;   raidrivecli (#14202): Not found in AUR metadata cache; no upstream source URL available
;;;
;;; PLATFORM_SPECIFIC (1 packages):
;;;   resource-hacker (#14969): Windows-only freeware application (PE resource editor); requires Wine
;;;
;;; PROPRIETARY_LICENSE (9 packages):
;;;   aiot-ide (#15062): Xiaomi proprietary IoT development IDE; no source available
;;;   brother-mfc-j5720dw (#15008): Brother proprietary printer driver with restricted binary blobs
;;;   fonts-apple (#14971): Apple restricted font license; cannot redistribute
;;;   jdk-lts (#15004): Oracle proprietary Java Development Kit license
;;;   jdk-lts-doc (#15003): Oracle proprietary Java documentation license
;;;   jre-lts (#15002): Oracle proprietary Java Runtime Environment license
;;;   libfprint-2-tod1-broadcom (#15005): Dell/Broadcom proprietary binary fingerprint driver blob
;;;   redact-bin (#15032): Custom proprietary license; Electron app with no source code
;;;   xilinx-ise (#14616): Xilinx proprietary FPGA design tools; requires manual download and EULA acceptance
;;;
;;; ALREADY_RESOLVED (28 packages, marked DONE):
;;;   ampache (#14986): Recipe already exists in recipe-resolver-260417x.scm
;;;   arsenal (#15073): Recipe already exists in recipe-resolver-260417x.scm
;;;   bloop (#15029): Recipe already exists in recipe-resolver-260417x.scm
;;;   cobra-cli (#15020): Recipe already exists in recipe-resolver-260417x.scm
;;;   etterna (#15018): Recipe already exists in recipe-resolver-260417x.scm
;;;   findent (#15057): Recipe already exists in recipe-resolver-260417x.scm
;;;   kitty-shell-integration-git (#14995): Recipe already exists in recipe-resolver-260417x.scm
;;;   kitty-terminfo-git (#14994): Recipe already exists in recipe-resolver-260417x.scm
;;;   libfprint-1 (#15048): Recipe already exists in recipe-resolver-260417x.scm
;;;   license (#14985): Recipe already exists in recipe-resolver-260417x.scm
;;;   miniupnpd-nft-git (#15044): Recipe already exists in recipe-resolver-260417x.scm
;;;   mp3gain (#14977): Recipe already exists in recipe-resolver-260417x.scm
;;;   mystmd (#15022): Recipe already exists in recipe-resolver-260417x.scm
;;;   nagstamon-git (#15049): Recipe already exists in recipe-resolver-260417x.scm
;;;   otb-unifont (#15065): Recipe already exists in recipe-resolver-260417x.scm
;;;   otf-raleway (#15001): Recipe already exists in recipe-resolver-260417x.scm
;;;   pacman-contrib-git (#14972): Recipe already exists in recipe-resolver-260417x.scm
;;;   pianobooster (#15023): Recipe already exists in recipe-resolver-260417x.scm
;;;   pithos (#15007): Recipe already exists in recipe-resolver-260417x.scm
;;;   portainer-bin (#15015): Recipe already exists in recipe-resolver-260417x.scm
;;;   psf-unifont (#15030): Recipe already exists in recipe-resolver-260417x.scm
;;;   python-rocket-fft-git (#15021): Recipe already exists in recipe-resolver-260417x.scm
;;;   simgrid (#15024): Recipe already exists in recipe-resolver-260417x.scm
;;;   textadept-gtk3 (#15028): Recipe already exists in recipe-resolver-260417x.scm
;;;   ttf-raleway-variable (#14999): Recipe already exists in recipe-resolver-260417x.scm
;;;   vulkan-caps-viewer-wayland (#14989): Recipe already exists in recipe-resolver-260417x.scm
;;;   vulkan-caps-viewer-x11 (#14988): Recipe already exists in recipe-resolver-260417x.scm
;;;   wofi-vim (#15039): Recipe already exists in recipe-resolver-260417x.scm
;;;