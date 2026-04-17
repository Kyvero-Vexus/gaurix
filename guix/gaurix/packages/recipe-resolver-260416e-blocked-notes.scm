;;; Blocked notes for recipe-resolver-260416e
;;;
;;; 3 packages BLOCKED out of 30 attempted:
;;;
;;; 26. kitty-bitmap (5576)
;;;   BLOCKED: COMPLEX_BUILD
;;;   kitty-bitmap is a patched variant of the kitty terminal emulator
;;;   that adds bitmap font rendering support.  The build requires:
;;;   - Custom Go toolchain for kittens (Go plugins)
;;;   - Python build system with custom C extensions
;;;   - Wayland/X11 protocol libraries
;;;   - Dozens of upstream-specific patches for bitmap font support
;;;   - Upstream (kovidgoyal) is actively hostile to distro packaging
;;;   Approaches tried:
;;;     A1: Full source build — requires enumerating 20+ Go module deps,
;;;         wayland-protocols, dozens of Python/C deps, custom build phases
;;;     A2: Binary release — kitty does not publish prebuilt binaries on
;;;         GitHub for the bitmap variant
;;;     A3: Use standard kitty from Guix — covers base functionality;
;;;         bitmap font support is a niche requirement
;;;
;;; 27. asus-5606-fan-state (5570)
;;;   BLOCKED: CARGO_DEPS_NEEDED
;;;   Rust/Cargo project (github.com/ThatOneCalculator/asus-5606-fan-state).
;;;   cargo-build-system in Guix requires individually packaging each crate
;;;   dependency as a separate Guix package.
;;;   Approaches tried:
;;;     A1: cargo-build-system — needs enumeration of all transitive crate
;;;         deps (estimated 30-50 crates); not feasible in batch scope
;;;     A2: No binary releases published on GitHub
;;;     A3: Hardware-specific (ZenBook S 16 UM5606/Vivobook M5606 only),
;;;         very small user base limits packaging priority
;;;
;;; 28. bigedit (5567)
;;;   BLOCKED: CARGO_DEPS_NEEDED
;;;   Rust/Cargo project (github.com/jopdorp/bigedit).
;;;   Large file editor using journaling and FUSE for efficient editing.
;;;   Approaches tried:
;;;     A1: cargo-build-system — needs enumeration of all transitive crate
;;;         deps (~50+ crates including fuse3-sys, tokio, etc.); not feasible
;;;         in batch scope
;;;     A2: No binary releases published on GitHub
;;;     A3: Depends on fuse3 kernel module support — FUSE integration adds
;;;         runtime complexity beyond just the Rust build
