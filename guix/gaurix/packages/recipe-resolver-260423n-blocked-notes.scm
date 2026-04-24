;;; recipe-resolver-260423n --- blocked notes
;;;
;;; 15 packages blocked with reasons and exhausted approaches.

;;; 1. freetype2-macos-browsers-binary-patcher
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: ARCH_SPECIFIC: shell script with pacman hooks
;;;    that patches Chrome/Vivaldi freetype2 libraries; A1: script depends on
;;;    pacman post-install hooks not available in Guix; A2: patching browser
;;;    binaries is fragile and distro-specific; A3: freetype2 configuration
;;;    is handled differently on Guix System

;;; 2. picoscope7beta
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: PROPRIETARY_DEPS: proprietary measurement
;;;    software; A1: depends on ps7b_libpicoipp and ps7b_libpicocv (proprietary
;;;    Pico Technology libraries not in Guix); A2: closed-source binary needs
;;;    FUSE2 mount; A3: custom license prohibits redistribution

;;; 3. librewolf-extension-synclair-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: BROWSER_EXTENSION: LibreWolf-specific
;;;    browser extension (XPI); A1: Guix does not have a standard mechanism
;;;    for installing browser extensions; A2: depends on librewolf which is
;;;    not in Guix; A3: browser extensions are better managed through the
;;;    browser's own extension system

;;; 4. imessage-exporter
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: PLATFORM_INCOMPATIBLE: requires macOS
;;;    iMessage database (~/Library/Messages/chat.db); A1: core functionality
;;;    requires macOS-specific SQLite database format; A2: Rust/cargo project
;;;    with 100+ crate dependencies; A3: no practical use on Linux without
;;;    macOS iMessage data

;;; 5. hyde-ipc
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: CARGO_DEPS_NEEDED: Rust CLI for Hyprland
;;;    IPC; A1: cargo-build-system requires individual crate packaging (~40
;;;    transitive deps); A2: no pre-built Linux binary releases available;
;;;    A3: Hyprland itself has limited Guix support

;;; 6. gozen-git
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: GODOT_ENGINE_REQUIRED: video editor built
;;;    with Godot 4 game engine; A1: requires Godot Engine SDK not in Guix;
;;;    A2: scons build requires specific Godot template compilation; A3: FFmpeg
;;;    integration needs Godot GDExtension build infrastructure

;;; 7. fastlane
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: RUBY_COMPLEX_DEPS: iOS/Android deployment
;;;    tool; A1: requires 50+ Ruby gem dependencies (most not in Guix);
;;;    A2: depends on ruby-abbrev and ruby-erb and many build/deploy gems;
;;;    A3: primarily for Apple/Google mobile ecosystem, limited Linux utility

;;; 8. cpptools-debug-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: PROPRIETARY_LICENSE: Microsoft VS Code
;;;    C++ debug adapter; A1: LicenseRef-custom prohibits redistribution
;;;    outside VS Code; A2: binary depends on VS Code extension host;
;;;    A3: lldb/gdb provide equivalent debugging functionality on Linux

;;; 9. i2c-ch341-dkms
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: KERNEL_MODULE_DKMS: CH341 USB-I2C kernel
;;;    module; A1: DKMS (Dynamic Kernel Module Support) is not compatible
;;;    with Guix's immutable store model; A2: Guix uses its own kernel module
;;;    packaging via linux-module-build-system; A3: would need adaptation to
;;;    Guix kernel build infrastructure with specific kernel version pinning

;;; 10. groonga
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: COMPLEX_DEPS: fulltext search engine with
;;;    17 dependencies; A1: requires mecab-git, mecab-ipadic (Japanese morphological
;;;    analyzer not in Guix); A2: depends on simdjson, xsimd, blosc2 (not in Guix);
;;;    A3: arrow (Apache Arrow) dependency chain is very large

;;; 11. esearch-electron-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: ELECTRON_COMPLEX: Electron screenshot/OCR
;;;    app; A1: requires system Electron runtime not packaged in Guix;
;;;    A2: native addons need specific node-gyp build environment; A3: depends
;;;    on libxss, at-spi2-core integration specific to system Electron

;;; 12. groundcoverify-git
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: DEP_BLOCKED: Python script for Morrowind
;;;    groundcover; A1: depends on delta-plugin at runtime which is itself
;;;    blocked (Rust/cargo); A2: without delta-plugin the tool is non-functional;
;;;    A3: delta-plugin could be packaged but requires cargo dep enumeration

;;; 13. delta-plugin-git
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: CARGO_DEPS_NEEDED: Rust/cargo Morrowind
;;;    plugin tool; A1: cargo-build-system requires individual crate packaging;
;;;    A2: no pre-built Linux binaries available on GitLab releases;
;;;    A3: guix import crate produces incomplete results for this project

;;; 14. aeon-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: ELECTRON_OLD_VERSION: privacy scanner
;;;    Electron app; A1: requires electron23 (old, EOL version not in Guix);
;;;    A2: depends on openssl-1.1 (deprecated, security risk); A3: EUPL-1.2
;;;    license with proprietary online activation requirement

;;; 15. opencryptoki-git
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: COMPLEX_DEPS: PKCS#11 implementation;
;;;    A1: depends on trousers (TCG Software Stack for TPM) not in Guix;
;;;    A2: requires expect for test suite and build validation; A3: TPM
;;;    integration requires specific hardware and kernel support configuration
