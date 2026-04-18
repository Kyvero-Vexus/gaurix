;;; Notes for deptree-resolver-260418ag
;;; 17 packages moved to FAILED status
;;; 0 packages remain BLOCKED
;;;
;;; === FAILED packages ===
;;; python2-gimp (#23210): PYTHON2_EOL: depends on python2 which is EOL; GIMP 3.x uses Python 3
;;; ttf-hanazono (#43366): LICENSE_UNCLEAR: Hanazono Mincho font; unclear redistribution terms, needs manual license verification before packaging
;;; android-platform-23 (#22944): PROPRIETARY: Android SDK platform binary; proprietary Google blobs, not redistributable under free software terms
;;; android-ndk (#18077): PROPRIETARY: Android NDK binary distribution; proprietary Google toolchain, not suitable for Guix
;;; armv7l-binutils (#44481): CROSS_COMPILE_UNSUPPORTED: Arch-style cross-binutils; Guix handles cross-compilation via --target=armv7l-linux-gnueabihf
;;; python2-dbus (#37854): PYTHON2_EOL: Python 2 bindings for D-Bus; use python-dbus (Python 3) instead
;;; mingw-w64-spirv-tools (#42666): CROSS_COMPILE_UNSUPPORTED: MinGW-w64 cross-compiled SPIRV-Tools; Guix cross-compilation uses --target, not separate packages
;;; selinux-python (#23198): INCOMPATIBLE: SELinux Python utilities; Guix uses a different security model, SELinux integration is not applicable
;;; arm-linux-gnueabihf-binutils (#23347): CROSS_COMPILE_UNSUPPORTED: Arch-style cross-binutils; Guix handles cross-compilation via --target=arm-linux-gnueabihf
;;; boost-python2-libs (#37224): PYTHON2_EOL: Boost.Python for Python 2; Python 2 is EOL, use python-boost for Python 3
;;; quartus-free-quartus (#23279): PROPRIETARY: Intel Quartus Prime FPGA design suite; proprietary binary, non-redistributable license
;;; darling-cli-devenv-gui-common-git (#22161): INFEASIBLE: Darling macOS compat layer; 41+ deps including proprietary Apple frameworks, not viable for Guix
;;; darling-iosurface-git (#22171): INFEASIBLE: Darling IOSurface framework; depends on full Darling ecosystem with Apple-specific frameworks
;;; php56-cli (#21929): OBSOLETE_SECURITY: PHP 5.6 is EOL since Dec 2018; critical security vulnerabilities unpatched
;;; electron30 (#19247): OBSOLETE_SECURITY: Electron 30.x is EOL; apps should use current Electron release
;;; electron29 (#20370): OBSOLETE_SECURITY: Electron 29.x is EOL; apps should use current Electron release
;;; electron25 (#32692): OBSOLETE_SECURITY: Electron 25.x is EOL and no longer receives security patches; apps should migrate to current Electron
