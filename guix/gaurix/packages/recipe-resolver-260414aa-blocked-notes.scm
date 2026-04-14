;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414aa
;;; 9 packages blocked with reason codes, 1 already in Guix
;;;

(define-module (gaurix packages recipe-resolver-260414aa-blocked-notes))

;;; --- UPSTREAM_MISSING (1 package) ---
;;; nanofetch v1.0.0
;;;   Upstream repository https://github.com/tinyopsec/nanofetch returns 404.
;;;   Source only available as files embedded in AUR snapshot.
;;;   Attempts: (A1) checked GitHub URL - 404; (A2) searched for mirrors/forks - none found;
;;;   (A3) checked AUR PKGBUILD - source files are inline, no external download.
;;;   Next: re-check if upstream publishes source in future.
;;;

;;; --- DEP_RESOLUTION_FAILED (2 packages) ---
;;; obexftp v0.24.2
;;;   OBEX file transfer tool; requires openobex which is not packaged in Guix.
;;;   openobex is an old/unmaintained library (last release ~2016).
;;;   Attempts: (A1) checked Guix for openobex - not found; (A2) assessed openobex
;;;   packaging feasibility - possible but low priority given unmaintained status;
;;;   (A3) checked for alternative OBEX implementations - none suitable.
;;;   Next: package openobex first, then revisit.
;;;
;;; calculix-ccx v2.23
;;;   CalculiX FEA solver; requires SPOOLES sparse matrix library not in Guix.
;;;   SPOOLES is a niche numerical library from NIST (last release 2.2, year ~2000).
;;;   Attempts: (A1) checked Guix for spooles - not found; (A2) assessed spooles
;;;   packaging - old Fortran/C code with custom Makefiles, feasible but niche;
;;;   (A3) checked for alternative sparse solvers - MUMPS/PETSc possible but
;;;   different API, would require upstream patches.
;;;   Next: package spooles first, then revisit.
;;;

;;; --- BUILD_SYSTEM_UNSUPPORTED (2 packages) ---
;;; cdesktopenv v2.5.3
;;;   Common Desktop Environment uses ancient imake build system.
;;;   Massive X11/Motif codebase with non-standard build infrastructure.
;;;   Attempts: (A1) assessed imake compat - Guix has imake but CDE build is highly
;;;   custom; (A2) checked for cmake/meson port - none exists; (A3) checked Debian
;;;   packaging - uses extensive patches and custom build scripts.
;;;   Next: would require major porting effort; low priority.
;;;
;;; shock-alarm v0.4.4
;;;   Flutter/Dart app for controlling OpenShock devices.
;;;   Flutter SDK is not packaged in Guix and is extremely difficult to package
;;;   (proprietary Dart SDK components, complex toolchain).
;;;   Attempts: (A1) checked Guix for flutter/dart - not found; (A2) checked for
;;;   pre-built Linux binary - none available; (A3) assessed alternative frameworks
;;;   - no non-Flutter build option exists.
;;;   Next: blocked until Flutter is available in Guix.
;;;

;;; --- COMPLEX_BUILD (2 packages) ---
;;; haveno v1.2.3
;;;   Decentralized P2P exchange built on Monero and Tor.
;;;   Java/Gradle build with massive Maven dependency tree.
;;;   Attempts: (A1) assessed Gradle build in Guix - Java/Gradle builds are notoriously
;;;   difficult due to Maven dependency resolution in sandboxed environments;
;;;   (A2) checked for pre-built jar - available but requires JDK 21 + complex runtime;
;;;   (A3) checked other Guix Java packages - few use Gradle, most use ant-build-system.
;;;   Next: manual review required; possibly use pre-built jar with copy-build-system.
;;;
;;; deepfilternet-demos-git v0.5.6
;;;   Rust workspace with ML speech enhancement models.
;;;   Complex cargo workspace + requires ML model weight files at runtime.
;;;   Attempts: (A1) assessed workspace structure - multiple crates, demo is one member;
;;;   (A2) checked model distribution - 40MB+ model files downloaded at runtime;
;;;   (A3) assessed cargo workspace extraction - possible but needs careful Cargo.toml
;;;   patching to build only the demo binary.
;;;   Next: manual review required; assess model file bundling strategy.
;;;

;;; --- LICENSE_REVIEW_NEEDED (2 packages) ---
;;; bombsquad v1.7.59
;;;   Arcade-style party game; prebuilt binary only.
;;;   Engine source (ballistica) has no clear open-source license (NOASSERTION).
;;;   Attempts: (A1) checked GitHub repo license - null/NOASSERTION; (A2) checked
;;;   upstream website - no license terms found; (A3) checked AUR PKGBUILD - marked
;;;   as unknown license.
;;;   Next: cannot package without clear license; contact upstream.
;;;
;;; muzak v2.4.0
;;;   Rust CLI for playing bells; no license declared in repository.
;;;   GitHub shows null license, no LICENSE file, no SPDX identifier in Cargo.toml.
;;;   Also has git-pinned dependencies (rodio fork, custom musicxml lib).
;;;   Attempts: (A1) checked repo for any license - none found; (A2) checked
;;;   Cargo.toml license field - empty; (A3) assessed without license - cannot
;;;   distribute or package.
;;;   Next: cannot package without license; contact upstream.
;;;

;;; --- ALREADY_IN_GUIX (1 package) ---
;;; ruby2.7 v2.7.8
;;;   Ruby 2.7.8 is already available in Guix as `ruby@2.7.8`.
;;;   Command: guix show ruby@2.7.8 confirms availability.
;;;   Mark as DONE in todo_general_packages.org.
;;;
