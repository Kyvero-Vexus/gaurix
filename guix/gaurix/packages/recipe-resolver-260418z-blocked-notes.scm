;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418z
;;; 8 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED.
;;;
;;; 31. smpeg0 -> SDL1_LEGACY: SDL 1.x MPEG playback library; source only available
;;;     via icculus.org SVN (likely offline); Debian CVS snapshot from 2003;
;;;     A1: upstream SVN repository at svn.icculus.org may be unreachable;
;;;     A2: sdl12-compat in Guix provides SDL 1.2 API but smpeg0 is unmaintained since 2004;
;;;     A3: no tagged releases or GitHub mirror found
;;; 32. waybar-updates -> ARCH_SPECIFIC_DEPS: Waybar updates module for Arch Linux;
;;;     depends on pacman-contrib (checkupdates) which is Arch Linux-specific;
;;;     A1: core functionality requires pacman package manager not available on Guix System;
;;;     A2: checkupdates script is Arch-specific;
;;;     A3: Guix has its own update mechanism (guix pull)
;;; 33. moomoo -> PROPRIETARY_PLATFORM: Moomoo (Futu) trading platform is proprietary
;;;     commercial software; license listed as "HTML Tidy" in AUR is incorrect;
;;;     A1: proprietary binary-only distribution;
;;;     A2: requires online activation and account;
;;;     A3: no source code available
;;; 34. fbthrift -> COMPLEX_DEPS: Facebook Thrift requires fizz, folly, and mvfst
;;;     (Facebook C++ infrastructure libraries) at exact version-locked releases;
;;;     A1: fizz/folly/mvfst not in Guix, each with 20+ transitive deps;
;;;     A2: version-locked dependencies (all must be same release date);
;;;     A3: CMake build with Facebook-specific build patterns
;;; 35. dopamine -> ELECTRON_NPM_COMPLEX: Electron-based music player requiring
;;;     electron37, nvm, npm, and full Node.js build toolchain;
;;;     A1: needs specific Electron version (37) not in Guix;
;;;     A2: npm build with 200+ node_modules;
;;;     A3: nvm (Node Version Manager) required during build
;;; 36. ytify -> NODE_NPM_COMPLEX: YouTube music player web app requiring
;;;     Node.js and full npm build toolchain;
;;;     A1: Node.js npm ecosystem not well-supported in Guix;
;;;     A2: production build requires npm/yarn with hundreds of dependencies;
;;;     A3: niche web app with minimal community
;;; 37. rofi-games -> CARGO_DEPS_NEEDED: Rust/Cargo rofi plugin requiring
;;;     individual crate enumeration for cargo-build-system;
;;;     A1: uses 'just' build runner not in Guix;
;;;     A2: needs cairo, glib2, sqlite Rust bindings (crate deps);
;;;     A3: rofi plugin architecture requires specific installation paths
;;; 38. hypruler -> CARGO_DEPS_NEEDED: Rust/Cargo screen measurement tool
;;;     requiring individual crate enumeration for cargo-build-system;
;;;     A1: needs fontconfig Rust bindings (crate deps);
;;;     A2: cargo-build-system requires all transitive crates listed individually;
;;;     A3: no pre-built binary releases available
