;;; Blocked notes for recipe-resolver-260424p
;;; 49 packages blocked in this pass.
;;;
;;; 1. libdng-git (#17800)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: requires libtiff-devel headers and custom cmake; git-only source with no stable release tags
;;;    Next: manual evaluation needed
;;;
;;; 2. vinyl-git (#17804)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: KDE Plasma 6 theme pack; requires full KDE/Qt6 theming infrastructure not available in Guix
;;;    Next: manual evaluation needed
;;;
;;; 3. better-control-git (#17810)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Python GTK4/Adwaita application; requires python-pygobject + GTK4 + libadwaita + multiple system services (NetworkManager, bluez, pulseaudio)
;;;    Next: manual evaluation needed
;;;
;;; 4. simplewaita-git (#17813)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: multi-variant theme pack for GTK2/3/4/Kvantum/Plasma; no build system, pure theme file installation across 10+ target directories
;;;    Next: manual evaluation needed
;;;
;;; 5. audacious-plugins-git (#17814)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: requires audacious-git (dev version) + 20+ optional multimedia libraries; complex autotools build with many conditional features
;;;    Next: manual evaluation needed
;;;
;;; 6. opencoarrays (#17820)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: requires specific gfortran version alignment with cmake; Fortran coarray transport layer needs MPI (openmpi/mpich) integration
;;;    Next: manual evaluation needed
;;;
;;; 7. python-pypi2pkgbuild (#17822)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: Arch Linux-specific tool for converting PyPI to PKGBUILDs; depends on pacman/makepkg infrastructure not in Guix
;;;    Next: manual evaluation needed
;;;
;;; 8. envoyproxy (#17824)
;;;    Reason: BUILD_FAILED
;;;    Detail: massive C++ project using Bazel build system; Bazel not in Guix; 1000+ deps; binary is 100MB+
;;;    Next: manual evaluation needed
;;;
;;; 9. esp8266-rtos-sdk (#17825)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: ESP8266 cross-compilation SDK; requires xtensa-lx106-elf toolchain not in Guix
;;;    Next: manual evaluation needed
;;;
;;; 10. ps3netsrv (#17827)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: PS3 network server tool; mbed TLS dependency + custom Makefile; needs detailed build-phase review
;;;    Next: manual evaluation needed
;;;
;;; 11. rpfm-git (#17833)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Rust application with 200+ cargo dependencies; requires KDE frameworks (KF5/KF6) + Qt5/Qt6 bindings
;;;    Next: manual evaluation needed
;;;
;;; 12. mycorrhiza-git (#17834)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Go wiki engine with custom markup parser (mycomarkup); 30+ Go module dependencies not in Guix
;;;    Next: manual evaluation needed
;;;
;;; 13. minikube-git (#17835)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: requires Docker/Podman + kubectl + virtualization drivers; massive Go dep tree (100+ modules)
;;;    Next: manual evaluation needed
;;;
;;; 14. thanos (#17851)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: large Go project for Prometheus HA; 50+ Go module dependencies not in Guix; requires gRPC + protobuf Go bindings
;;;    Next: manual evaluation needed
;;;
;;; 15. realvnc-rvnc-connect (#17860)
;;;    Reason: LICENSE_REVIEW_NEEDED
;;;    Detail: RealVNC commercial product; EULA restricts redistribution; binary-only with license key requirement
;;;    Next: manual evaluation needed
;;;
;;; 16. pacpak-git (#17862)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: Arch Linux-specific flatpak wrapper using pacman syntax; depends on pacman infrastructure not in Guix
;;;    Next: manual evaluation needed
;;;
;;; 17. notmuch-tools-git (#17863)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: collection of shell/Python scripts for notmuch mail; multiple runtime deps (notmuch, python3, bash); needs per-tool packaging
;;;    Next: manual evaluation needed
;;;
;;; 18. nimdow-git (#17864)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Nim tiling WM; requires Nim compiler + nimble package manager + X11 Nim bindings not in Guix
;;;    Next: manual evaluation needed
;;;
;;; 19. erwise (#17867)
;;;    Reason: BUILD_FAILED
;;;    Detail: ancient 1992 web browser requiring Motif/Athena widgets; original source may not compile with modern toolchains
;;;    Next: manual evaluation needed
;;;
;;; 20. texmacs-pure (#17873)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: GNU TeXmacs plugin for Pure language; requires both TeXmacs and Pure interpreter (neither trivially available in this channel)
;;;    Next: manual evaluation needed
;;;
;;; 21. dwl-guile-git (#17878)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: dwl fork with Guile scripting; requires wlroots 0.17+ and custom Guile C bindings; complex build-phase engineering
;;;    Next: manual evaluation needed
;;;
;;; 22. slxfig-snapshot (#17879)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: S-Lang based plotting package; requires S-Lang interpreter + Xfig libraries; niche dependency chain
;;;    Next: manual evaluation needed
;;;
;;; 23. libch343ser-git (#17880)
;;;    Reason: BUILD_FAILED
;;;    Detail: Linux kernel module for USB serial chips; requires kernel headers matching running kernel; out-of-tree module building
;;;    Next: manual evaluation needed
;;;
;;; 24. qtemu-git (#17881)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Qt5 GUI for QEMU; requires full Qt5 dev environment + QEMU; stale upstream (last commit 2020)
;;;    Next: manual evaluation needed
;;;
;;; 25. python-icsv2ledger-git (#17883)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: Python script for CSV to Ledger conversion; needs interactive terminal (curses); setuptools-based but needs python-ledger
;;;    Next: manual evaluation needed
;;;
;;; 26. oqsprovider-git (#17887)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: OpenSSL 3 provider for post-quantum crypto; requires liboqs (Open Quantum Safe) library not in Guix
;;;    Next: manual evaluation needed
;;;
;;; 27. slrn-snapshot-canlock (#17889)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: variant of slrn with cancel-lock support; requires libcanlock not in Guix + slrn patching
;;;    Next: manual evaluation needed
;;;
;;; 28. riverguile-git (#17890)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Guile scripting for River WM; requires river (Zig-based WM) + custom Guile C FFI bindings
;;;    Next: manual evaluation needed
;;;
;;; 29. chromium-extension-arch-search (#17897)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: browser extension (not a system package); web extension packaging not applicable to Guix system packages
;;;    Next: manual evaluation needed
;;;
;;; 30. passmenu-otp-git (#17901)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: shell script extension for pass/passmenu; requires pass + oathtool + dmenu/rofi; simple but needs runtime dep wiring
;;;    Next: manual evaluation needed
;;;
;;; 31. kamilsss655-uv-k5-firmware-custom-git (#17909)
;;;    Reason: BUILD_FAILED
;;;    Detail: custom firmware for UV-K5 radio; requires arm-none-eabi cross-compiler toolchain not in Guix
;;;    Next: manual evaluation needed
;;;
;;; 32. ctwm-bzr (#17910)
;;;    Reason: SOURCE_UNAVAILABLE
;;;    Detail: Bazaar (bzr) VCS source; Bazaar is deprecated and bzr:// protocol sources may not be fetchable
;;;    Next: manual evaluation needed
;;;
;;; 33. libfprint-2-tod1-broadcom-cv3plus (#17912)
;;;    Reason: LICENSE_REVIEW_NEEDED
;;;    Detail: proprietary Broadcom fingerprint driver; binary blob with unclear redistribution terms
;;;    Next: manual evaluation needed
;;;
;;; 34. deadbeef-git (#17914)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: GTK audio player with 30+ optional plugin dependencies; git version requires bleeding-edge GTK3/4
;;;    Next: manual evaluation needed
;;;
;;; 35. fht-share-picker-git (#17915)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Wayland screen picker; requires fht-compositor (custom WM) + wlroots protocols not in Guix
;;;    Next: manual evaluation needed
;;;
;;; 36. fht-compositor (#17916)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: custom Wayland compositor written in Haskell; requires GHC + 50+ Haskell deps + wlroots bindings
;;;    Next: manual evaluation needed
;;;
;;; 37. zfs-linux-git-headers (#17919)
;;;    Reason: BUILD_FAILED
;;;    Detail: ZFS kernel headers for linux-git; requires kernel source tree matching specific git version
;;;    Next: manual evaluation needed
;;;
;;; 38. zfs-linux-rt-headers (#17920)
;;;    Reason: BUILD_FAILED
;;;    Detail: ZFS kernel headers for linux-rt; requires PREEMPT_RT kernel source tree
;;;    Next: manual evaluation needed
;;;
;;; 39. zfs-linux-hardened-headers (#17921)
;;;    Reason: BUILD_FAILED
;;;    Detail: ZFS kernel headers for linux-hardened; requires hardened kernel source tree
;;;    Next: manual evaluation needed
;;;
;;; 40. freetube-electron-git (#17925)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: FreeTube git build requires Node.js 20+ + Electron 28+ + npm build chain; 500+ npm dependencies
;;;    Next: manual evaluation needed
;;;
;;; 41. pulseeffects-legacy (#17927)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: legacy PulseAudio effects (pre-PipeWire); Guix has moved to PipeWire; requires gstreamer + boost + lilv
;;;    Next: manual evaluation needed
;;;
;;; 42. libxfce4ui-devel (#17932)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: XFCE development libraries; requires full XFCE build stack + introspection + vala bindings
;;;    Next: manual evaluation needed
;;;
;;; 43. anyrun-git (#17933)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Rust Wayland launcher; 100+ cargo deps + GTK4-layer-shell + custom Wayland protocols
;;;    Next: manual evaluation needed
;;;
;;; 44. illogical-impulse-ags (#17937)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: pinned version of AGS (Aylur's GTK Shell); requires GJS + GTK4 + custom Wayland protocols
;;;    Next: manual evaluation needed
;;;
;;; 45. redlib-git (#17942)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Reddit frontend in Rust; 150+ cargo deps + hyper/tokio/actix web framework chain
;;;    Next: manual evaluation needed
;;;
;;; 46. eclipse-pydev (#17948)
;;;    Reason: BUILD_FAILED
;;;    Detail: Eclipse IDE plugin; requires Eclipse platform + complex OSGi bundle build system; Java/Maven/Gradle tooling
;;;    Next: manual evaluation needed
;;;
;;; 47. python-pylibssh (#17953)
;;;    Reason: DEP_RESOLUTION_FAILED
;;;    Detail: Python bindings for libssh; requires Cython build + libssh headers; Ansible-specific patches
;;;    Next: manual evaluation needed
;;;
;;; 48. lisp (#17967)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: shell wrapper scripts for Common Lisp; trivial but name collision risk with (gnu packages lisp)
;;;    Next: manual evaluation needed
;;;
;;; 49. electron23-bin (#17970)
;;;    Reason: NEEDS_RECIPE_DESIGN
;;;    Detail: Electron 23 prebuilt; outdated/EOL version; potential security issues with old Chromium base
;;;    Next: manual evaluation needed
;;;
