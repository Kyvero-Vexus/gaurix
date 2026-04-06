(define-module (gaurix packages cron-c79f127f-r25-w03-blocked-notes))
;;; Blocked-notes for round-25, cron-c79f127f worker w03.
;;; 6 packages re-blocked from NEEDS_RECIPE_DESIGN with specific reason codes.
;;;
;;; 6059. xlibre-input-vmmouse
;;;   Status: BLOCKED: NO_GUIX_COUNTERPART
;;;   Detail: xf86-input-vmmouse is not packaged in upstream Guix.  The XLibre
;;;   fork at https://github.com/X11Libre/xf86-input-vmmouse has no release
;;;   tags, so no stable source tarball is available.  Attempts to download
;;;   archives with tags 25.0.0, v25.0.0, and xf86-input-vmmouse-25.0.0 all
;;;   returned 404.
;;;   Approaches tried:
;;;     1) Inherit from Guix xf86-input-vmmouse → package does not exist
;;;     2) Download source from GitHub tags → no tags found
;;;     3) Archive from default branch → unstable, no version pinning
;;;
;;; 6061. xlibre-video-intel
;;;   Status: BLOCKED: NO_GUIX_COUNTERPART
;;;   Detail: xf86-video-intel is not packaged in upstream Guix.  The XLibre
;;;   fork at https://github.com/X11Libre/xf86-video-intel has no downloadable
;;;   release tags.  Attempted tag names 25.0.0, v25.0.0, and
;;;   xf86-video-intel-25.0.0 all failed.  This driver also uses meson and
;;;   requires extensive X server development headers.
;;;   Approaches tried:
;;;     1) Inherit from Guix xf86-video-intel → package does not exist
;;;     2) Download source from GitHub tags → no tags found
;;;     3) Build from git-fetch → need commit hash and full dependency set
;;;
;;; 6062. xlibre-video-qxl
;;;   Status: BLOCKED: NO_GUIX_COUNTERPART
;;;   Detail: xf86-video-qxl is not packaged in upstream Guix.  The XLibre
;;;   fork at https://github.com/X11Libre/xf86-video-qxl has no release tags.
;;;   This driver requires the spice library and libxfont2.
;;;   Approaches tried:
;;;     1) Inherit from Guix xf86-video-qxl → package does not exist
;;;     2) Download source from GitHub tags → no tags found
;;;     3) Build from git-fetch → need commit hash, spice dep not trivial
;;;
;;; 6042. mozc-ut-full-common
;;;   Status: BLOCKED: COMPLEX_BUILD_SYSTEM
;;;   Detail: Google Mozc uses the Bazel build system which is not well
;;;   supported in Guix.  The UT (user dictionary) variant requires additional
;;;   dictionary merging steps.  Building Mozc requires: Bazel or GYP, Qt5,
;;;   protobuf, and custom build scripts.  The AUR PKGBUILD is ~300 lines of
;;;   patching and custom build orchestration.
;;;   Approaches tried:
;;;     1) Direct build with gnu-build-system → Mozc uses Bazel, not autotools
;;;     2) Use cmake-build-system → Mozc does not use CMake
;;;     3) Evaluate porting Bazel build to Guix → Bazel itself is unpackaged
;;;
;;; 6040. ffmpeg-amd-full
;;;   Status: BLOCKED: COMPLEX_VARIANT
;;;   Detail: This is a full FFmpeg build with AMD hardware encoding support
;;;   (AMF, VAAPI) and 50+ library dependencies.  While Guix has FFmpeg, this
;;;   variant requires amf-headers, ffnvcodec-headers, frei0r-plugins, and
;;;   many other libraries not available or configured differently in Guix.
;;;   Creating this variant would essentially require rebuilding the entire
;;;   FFmpeg packaging with AMD-specific flags.
;;;   Approaches tried:
;;;     1) Inherit from Guix ffmpeg with extra flags → too many missing deps
;;;     2) Evaluate subset of AMD features → still needs amf-headers
;;;     3) Check if upstream Guix ffmpeg already has VAAPI → partial support
;;;        exists but AMF (AMD Advanced Media Framework) is proprietary
;;;
;;; 6039. dim-screen
;;;   Status: BLOCKED: CARGO_DEPS_MISSING
;;;   Detail: dim-screen is a Rust application using cargo-build-system.
;;;   Packaging Rust applications in Guix requires vendoring all crate
;;;   dependencies with their hashes.  The dim project depends on multiple
;;;   crates (wayland-client, calloop, etc.) that are not yet packaged in
;;;   Guix.  A full dependency tree analysis is needed.
;;;   Approaches tried:
;;;     1) Use cargo-build-system → requires vendored crate dependency list
;;;     2) Check if deps exist in Guix → wayland-client crate not available
;;;     3) Build as binary package → no pre-built binaries published
