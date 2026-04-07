;;; Blocked notes for deptree-resolver-260407b pass
;;; Documents attempt history for packages remaining BLOCKED.

(define-module (gaurix packages deptree-resolver-260407b-blocked-notes))

;;; qt5-webkit
;;; Attempt 1: Source build with cmake-build-system — requires full WebKit
;;;   engine build with ICU, GStreamer, woff2, hyphen, plus Ruby for code
;;;   generation.  Build takes hours and needs extensive phase customization.
;;; Attempt 2: Checked Guix upstream — qtwebkit exists but is very old
;;;   (5.212.0-alpha2) and not maintained.  AUR version is also alpha.
;;; Attempt 3: Considered binary packaging — no prebuilt binaries available.
;;; Status: BLOCKED — requires dedicated WebKit build effort.

;;; cosmic-randr-git
;;; Attempt 1: cargo-build-system — needs full Rust/Cargo vendored deps.
;;;   No Cargo.lock in release, git checkout needed.
;;; Attempt 2: Checked upstream releases — only git tags, no tarballs with
;;;   vendored dependencies.
;;; Attempt 3: Considered using Guix cargo importer — would need recursive
;;;   import of many Wayland-related Rust crates not in Guix.
;;; Status: BLOCKED — needs Rust crate dependency tree resolution.

;;; mdcat
;;; Attempt 1: cargo-build-system — Rust project with many dependencies.
;;; Attempt 2: guix import crate mdcat — generates definition but many
;;;   transitive Rust crates are missing from Guix.
;;; Attempt 3: Binary packaging — no prebuilt binaries on GitHub releases.
;;; Status: BLOCKED — needs extensive Rust crate packaging.

;;; system76-acpi-dkms
;;; Attempt 1: Source build — this is a DKMS kernel module that requires
;;;   kernel headers and a running kernel to compile against.
;;; Attempt 2: Considered packaging as kernel module using Guix's
;;;   linux-module-build-system — needs specific kernel version match.
;;; Attempt 3: Checked if module is upstream in Linux kernel — system76_acpi
;;;   driver exists in mainline but System76 fork adds additional features.
;;; Status: BLOCKED — DKMS modules need kernel-specific build infrastructure.

;;; arduino-avr-core
;;; Attempt 1: Needs AVR cross-compilation toolchain (avr-gcc, avr-libc,
;;;   avrdude).  Guix has some AVR support but the Arduino core files
;;;   require specific integration with the Arduino IDE build system.
;;; Attempt 2: Considered copy-build-system for the core files — but they
;;;   need to be compiled with specific avr-gcc flags.
;;; Attempt 3: Checked Guix arduino packages — no existing Arduino core
;;;   package to inherit from.
;;; Status: BLOCKED — needs AVR toolchain and Arduino build integration.

;;; foobar2000
;;; Attempt 1: This is a Windows application that requires Wine to run.
;;;   The AUR PKGBUILD downloads a Windows .exe and creates a wrapper.
;;; Attempt 2: Considered copy-build-system with Wine wrapper — needs
;;;   Wine as runtime dependency and careful .desktop file creation.
;;; Attempt 3: Wine integration in Guix is limited; would need custom
;;;   phases for registry setup and font configuration.
;;; Status: BLOCKED — Wine application packaging needs dedicated effort.

;;; pacaur
;;; Attempt 1: This is an Arch Linux AUR helper that depends on pacman,
;;;   auracle, and expac — none of which exist in Guix.
;;; Attempt 2: The tool is Arch-specific by design and cannot function
;;;   outside of an Arch Linux environment.
;;; Attempt 3: No alternative implementation or portable version exists.
;;; Status: BLOCKED — Arch-specific tool, cannot be meaningfully ported.

;;; trizen
;;; Attempt 1: Perl-based AUR helper requiring pacman, pacutils, and
;;;   Arch-specific infrastructure.
;;; Attempt 2: Like pacaur, fundamentally Arch-specific.
;;; Attempt 3: No portable alternative exists.
;;; Status: BLOCKED — Arch-specific tool, cannot be meaningfully ported.

;;; cosmic-comp-git
;;; Attempt 1: Rust/Cargo compositor with many system dependencies
;;;   (libinput, libseat, libxcb, mesa, pixman, wayland).
;;; Attempt 2: Would need vendored Cargo dependencies and extensive
;;;   Smithay/Wayland crate packaging.
;;; Attempt 3: No prebuilt binaries available.
;;; Status: BLOCKED — complex Rust Wayland compositor build.

;;; clang-libs-minimal-git
;;; Attempt 1: Building LLVM/Clang from git trunk requires extensive
;;;   cmake configuration and takes hours to build.
;;; Attempt 2: Guix has LLVM/Clang packages but not trunk/git versions.
;;; Attempt 3: Considered inheriting from Guix's clang and updating
;;;   source — but git trunk is fundamentally different from releases.
;;; Status: BLOCKED — LLVM trunk build is too complex for batch resolution.

;;; vscodium-translucent
;;; Attempt 1: This is a modified VSCodium build with translucency patches.
;;;   Building Electron apps from source requires Node.js, Rust, and
;;;   extensive build tooling.
;;; Attempt 2: Considered binary repackaging of VSCodium releases with
;;;   patches — but translucency patches need to be applied during build.
;;; Attempt 3: Checked if upstream provides patched binaries — no
;;;   prebuilt translucent binaries available.
;;; Status: BLOCKED — Electron app from-source build too complex.

;;; scala3
;;; Attempt 1: Scala 3 (Dotty) uses SBT build system which is not
;;;   supported in Guix.  Would need bootstrapping from pre-built JARs.
;;; Attempt 2: Checked guix import — no Scala/SBT importer available.
;;; Attempt 3: Considered copy-build-system with prebuilt JARs from
;;;   Maven Central — feasible but complex dependency resolution needed.
;;; Status: BLOCKED — SBT build system not in Guix, needs JVM bootstrap.

;;; libastal-meta
;;; Attempt 1: Meta package depending on ~10 libastal-* sub-packages,
;;;   none of which are in Guix.
;;; Attempt 2: Would need to package each libastal service individually
;;;   (libastal, libastal-4, libastal-apps, libastal-auth, etc.)
;;; Attempt 3: Checked source — all are Meson-based C/Vala libraries but
;;;   need GObject introspection and specific Wayland protocols.
;;; Status: BLOCKED — needs entire libastal ecosystem packaged first.

;;; openbangla-keyboard-git
;;; Attempt 1: CMake + Rust hybrid build needing IBus or Fcitx5 backends.
;;; Attempt 2: Has complex dependency on openbangla-im which is not in Guix.
;;; Attempt 3: Build system interaction between CMake and Cargo is non-trivial.
;;; Status: BLOCKED — hybrid CMake/Rust build with input method framework deps.

;;; qtutilities-qt6
;;; Attempt 1: cmake-build-system C++ library — depends on c++utilities
;;;   which is not in Guix.
;;; Attempt 2: Would need to first package c++utilities.
;;; Attempt 3: Checked Guix — neither c++utilities nor qtutilities exist.
;;; Status: BLOCKED — missing dependency c++utilities.

;;; dbeaver
;;; Attempt 1: Not in AUR cache (likely in community/extra repos instead).
;;;   DBeaver is a complex Java/Eclipse RCP application.
;;; Attempt 2: Checked for binary distribution — DBeaver provides .deb
;;;   packages but they are large (100+ MB) with complex dependencies.
;;; Attempt 3: Eclipse RCP build system is not supported in Guix.
;;; Status: BLOCKED — complex Eclipse RCP Java application, not in AUR.
