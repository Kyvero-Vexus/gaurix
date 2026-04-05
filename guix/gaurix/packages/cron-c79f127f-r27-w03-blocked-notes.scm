;;; Blocked-notes for cron-c79f127f-r27-w03 queue drain.
(define-module (gaurix packages cron-c79f127f-r27-w03-blocked-notes)
  #:export (cron-c79f127f-r27-w03-blocked-notes))

(define cron-c79f127f-r27-w03-blocked-notes
  '(
    ("feroxbuster" "2.13.1" "NEEDS_RECIPE_DESIGN"
     "Rust/Cargo package with complex dependency tree; cargo-build-system vendoring needed.  Next: vendor Cargo.lock deps, then build with cargo-build-system.")
    ("dupe-krill" "1.5.0" "NEEDS_RECIPE_DESIGN"
     "Rust/Cargo package; requires cargo-build-system with vendored deps.  Next: vendor Cargo.lock deps.")
    ("stl-thumb" "0.5.0" "NEEDS_RECIPE_DESIGN"
     "Rust/Cargo package with OpenGL deps; requires cargo-build-system + mesa inputs.  Next: vendor deps + add mesa to inputs.")
    ("git-credential-keepassxc" "0.14.2" "NEEDS_RECIPE_DESIGN"
     "Rust/Cargo package; requires cargo-build-system with vendored deps.  Next: vendor Cargo.lock.")
    ("typioca" "3.1.0" "NEEDS_RECIPE_DESIGN"
     "Go TUI package; needs go-build-system with module vendoring.  Next: vendor go.sum deps.")
    ("oxidizr-arch" "0.1.1" "NEEDS_RECIPE_DESIGN"
     "Rust CLI; requires cargo-build-system.  Next: vendor Cargo.lock deps.")
    ("mozlz4" "0.1.0" "NEEDS_RECIPE_DESIGN"
     "Rust CLI; requires cargo-build-system with vendored deps.  Next: vendor Cargo.lock.")
    ("classin-bin" "6.0.4.7807" "NEEDS_RECIPE_DESIGN"
     "Proprietary .deb binary with complex desktop integration; needs trivial-build-system unpack + patchelf.  Next: obtain stable download URL.")
    ("zmusic-bin" "1.3.0" "NEEDS_RECIPE_DESIGN"
     "Prebuilt shared library tarball; needs careful lib/include layout with copy-build-system.  Next: map library layout.")
    ("tribler-bin" "8.4.1" "NEEDS_RECIPE_DESIGN"
     "Prebuilt .deb; complex Electron+Python runtime; needs trivial unpack + patchelf.  Next: analyze .deb layout.")
    ("speedynote-bin" "1.1.4" "NEEDS_RECIPE_DESIGN"
     "Electron app tarball; needs desktop file + wrapper script.  Next: extract + patchelf ELF interpreter.")
    ("logseq-desktop-electron-bin" "0.10.14" "NEEDS_RECIPE_DESIGN"
     "Electron desktop app; needs patchelf for ELF interpreter + desktop integration.  Next: extract + patchelf.")
    ("electron22-bin" "22.3.27" "NEEDS_RECIPE_DESIGN"
     "Old Electron binary bundle; needs patchelf + library wrapping.  Next: obtain correct download URL.")
    ("duckstation-preview-bin" "0.1.10965" "NEEDS_RECIPE_DESIGN"
     "AppImage binary; needs FUSE-free extract + patchelf.  Next: extract AppImage + relocate.")
    ("dion-bin" "5.29.1" "NEEDS_RECIPE_DESIGN"
     "Proprietary .deb; needs unpack + patchelf + desktop integration.  Next: obtain stable URL.")
    ("beyondallreason-appimage" "1.2988.0" "NEEDS_RECIPE_DESIGN"
     "Large AppImage game; needs FUSE-free extract + asset management.  Next: extract AppImage.")
    ("suwayomi-server-preview-bin" "2.1.2065" "NEEDS_RECIPE_DESIGN"
     "Java .jar distribution; needs JRE wrapper + service setup.  Next: create java-jar wrapper.")
    ("wine-tkg-staging-wow64-bin" "11.5" "NEEDS_RECIPE_DESIGN"
     "Large Wine binary bundle (~1GB); needs careful prefix layout + patchelf.  Next: map library paths.")
    ("c-client" "2007f" "NEEDS_RECIPE_DESIGN"
     "UW-IMAP toolkit with non-standard Makefile; needs custom build phase.  Next: adapt makefile targets.")
    ("hidviz" "0.2.1" "NEEDS_RECIPE_DESIGN"
     "Qt5/CMake app with protobuf + hidapi deps; complex build graph.  Next: resolve Qt5 + hidapi inputs.")
    ("xfce4-theme-switcher" "0.1" "NEEDS_RECIPE_DESIGN"
     "Python+Xfce integration; needs xfconf bindings.  Next: add python-xfconf to inputs.")
    ("sunflower" "0.5.63" "NEEDS_RECIPE_DESIGN"
     "Python+GTK3 app; needs gobject-introspection runtime deps.  Next: add GI typelibs.")
    ("okular-no-purpose" "25.12.3" "NEEDS_RECIPE_DESIGN"
     "KDE/Qt app with heavy KF6 dep chain; complex cmake build.  Next: inherit from existing okular + remove purpose dep.")
    ("simgear" "2024.1.4" "NEEDS_RECIPE_DESIGN"
     "CMake library with OpenSceneGraph + Boost deps; complex build.  Next: resolve OSG + boost inputs.")
    ("ums" "15.3.0" "NEEDS_RECIPE_DESIGN"
     "Java application bundle with native media libs; complex runtime.  Next: create JRE wrapper.")
    ("sane-break" "0.9.5" "NEEDS_RECIPE_DESIGN"
     "Qt6/CMake app; needs qt6-base + multimedia deps.  Next: add Qt6 inputs.")
    ("intel-graphics-compiler-legacy" "1.0.17537.24" "NEEDS_RECIPE_DESIGN"
     "Large C++ CMake project with LLVM/SPIRV deps; multi-hour build.  Next: resolve LLVM + SPIRV-Tools inputs.")
    ("intel-npu-driver" "1.32.0" "NEEDS_RECIPE_DESIGN"
     "CMake + kernel module; needs level-zero + custom firmware blobs.  Next: split userspace/kernel.")
    ("ndi-sdk" "6.3.1.0" "NEEDS_RECIPE_DESIGN"
     "Proprietary SDK with installer script; needs extract + relocate.  Next: reverse installer layout.")
    ("laptop-mode-tools" "1.74" "NEEDS_RECIPE_DESIGN"
     "Makefile+shell scripts with systemd/udev integration; complex install.  Next: map install targets.")
    ("etherpad-lite" "2.2.7" "NEEDS_RECIPE_DESIGN"
     "Node.js web application; needs npm/node build + service setup.  Next: vendor node_modules.")
    ("vsce" "3.7.2" "NEEDS_RECIPE_DESIGN"
     "Node.js CLI; needs npm build system with vendored deps.  Next: vendor node_modules.")
    ("gnome-shell-extension-resource-monitor" "27" "NEEDS_RECIPE_DESIGN"
     "GNOME Shell extension; needs glib-compile-schemas + extension install layout.  Next: map extension UUID.")
    ("mips64-elf-binutils" "2.45.1" "NEEDS_RECIPE_DESIGN"
     "Cross-compilation binutils; needs --target=mips64-elf configure.  Next: add cross-build configure flags.")
    ("xfce4-dockbarx-plugin" "0.7.2" "NEEDS_RECIPE_DESIGN"
     "Xfce panel plugin; needs xfce4-panel + vala + dockbarx deps.  Next: resolve vala + panel inputs.")
    ("f5vpn" "7262.0.0.2" "SOURCE_UNAVAILABLE"
     "F5 VPN client requires authenticated download from F5 support portal; no public URL.")
    ("stl-thumb-kde" "0.5.0" "NEEDS_RECIPE_DESIGN"
     "KDE/KIO plugin; needs KF6 + stl-thumb deps.  Next: add KIO + stl-thumb inputs.")
    ("ryujinx" "1.0.0" "NEEDS_RECIPE_DESIGN"
     ".NET/C# application; needs dotnet-sdk build + complex runtime.  Next: obtain dotnet-sdk.")
    ("flashrom-starlabs" "1.3.0" "NEEDS_RECIPE_DESIGN"
     "Meson build with custom SPI programmer support; needs pciutils + libftdi1.  Next: add meson inputs.")
    ("droidcam-dkms" "2.1.2" "NEEDS_RECIPE_DESIGN"
     "DKMS kernel module; needs linux-headers + v4l2loopback integration.  Next: obtain droidcam source.")
    ("snes9x" "1.63" "NEEDS_RECIPE_DESIGN"
     "CMake/Autotools hybrid with X11/SDL2/GTK optional frontends.  Next: choose frontend + resolve deps.")
    ("snes9x-gtk" "1.63" "NEEDS_RECIPE_DESIGN"
     "Meson + GTK3 frontend; needs snes9x core + gtkmm deps.  Next: resolve GTK3 + meson inputs.")
    ("snes9x-qt" "1.63" "NEEDS_RECIPE_DESIGN"
     "Qt5/CMake frontend; needs snes9x core + qt5-base deps.  Next: resolve Qt5 inputs.")
    ("hidamari" "3.6" "NEEDS_RECIPE_DESIGN"
     "Python+GTK4+GStreamer app; needs meson build + complex GI deps.  Next: add GStreamer + GTK4 inputs.")
    ("arch-gdm-theme-list" "0.1" "NEEDS_RECIPE_DESIGN"
     "Arch-specific GDM theme; needs GDM theme install layout.  Next: map GDM theme directory.")
    ("vim-bootstrap" "1.21.10" "NEEDS_RECIPE_DESIGN"
     "Python web app + CLI; needs Flask + web dependencies.  Next: add flask to inputs.")
    ("profile-sync-daemon-floorp" "2024.10.18" "NEEDS_RECIPE_DESIGN"
     "profile-sync-daemon plugin; needs PSD integration hooks.  Next: resolve PSD dep.")
    ("nitchrevived" "0.1.7.5" "NEEDS_RECIPE_DESIGN"
     "Nim application; needs nim compiler + nimble build system.  Next: obtain nim toolchain.")
    ("php-imap" "1.0.3" "NEEDS_RECIPE_DESIGN"
     "PHP PECL extension; needs phpize + c-client lib.  Next: add php + c-client inputs.")
    ))
