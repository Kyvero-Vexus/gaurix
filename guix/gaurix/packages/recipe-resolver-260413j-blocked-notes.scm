;;; Blocked notes for recipe-resolver-260413j
;;; 48 packages blocked with specific reason codes

(define-module (gaurix packages recipe-resolver-260413j-blocked-notes))

;;; ── 1. archie ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Arch-specific package manager; requires pacman/libalpm; A1: bash wrapper around pacman — no Guix equivalent; A2: rewrite for Guix — out of scope

;;; ── 2. alacritty-graphics ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Alacritty fork with Sixel/graphics support; Rust/Cargo with 100+ crate deps; A1: cargo-build-system needs full crate enumeration; A2: pre-built binary — no official Linux binary releases

;;; ── 3. dupeguru-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Git version of dupeguru (already packaged as dupeguru); Python/Qt with custom C hash extensions; A1: same as dupeguru recipe — but git HEAD may diverge; A2: use existing dupeguru package

;;; ── 4. audirvana-studio ──────────────────────────────────────────────────────
;;; BLOCKED: SOURCE_UNAVAILABLE
;;; Proprietary audio player; no public download URL — requires account purchase from audirvana.com; A1: package binary — no Linux binary available; A2: request trial — requires payment info

;;; ── 5. lib32-libudev0-shim ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; 32-bit libudev0 compatibility shim; Guix does not natively support multilib/32-bit builds; A1: cross-compile — complex libudev API compat; A2: skip — limited use case on 64-bit systems

;;; ── 6. syncthingtray-qt6 ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Qt6/KDE tray app for Syncthing; complex CMake build with Qt6, KF6, Boost, c++utilities, qtutilities, qtforkawesome deps not in Guix; A1: cmake-build-system — missing 4+ custom library deps

;;; ── 7. pacfetch ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Arch-specific neofetch-style pacman stats wrapper; requires pacman binary and libalpm; A1: bash script — tightly coupled to pacman; no Guix equivalent

;;; ── 8. xdg-desktop-portal-luminous ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; wlroots xdg-desktop-portal backend; Rust/Cargo with pipewire, wayland, dbus deps; A1: cargo-build-system needs crate enumeration; A2: pre-built binary — none available

;;; ── 9. xone-dongle-firmware ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Xbox Wireless Controller Adapter firmware blob; requires kernel module xone-dkms for loading; A1: copy firmware files — needs linux-module-build-system for xone driver; A2: firmware-only package — still needs kernel module to use

;;; ── 10. nvidia-utils-beta ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; NVIDIA beta driver utilities; complex proprietary driver package with kernel module integration, OpenGL/Vulkan ICDs, and systemd service files; A1: extract userspace utils — still needs matching kernel module version

;;; ── 11. naps2 ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; .NET 8.0 application (NAPS2 scanner); requires dotnet-sdk and GTK3 bindings for .NET; A1: dotnet-build-system not mature in Guix; A2: Flatpak binary — out of scope

;;; ── 12. onlyoffice ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; OnlyOffice Desktop Editors; massive C++/Qt application with custom build system; A1: binary .deb repack — 500MB+ with complex library deps (Qt5, ICU, Chromium Embedded); A2: source build — requires 8GB+ build, custom toolchain

;;; ── 13. opentabletdriver ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; .NET 6.0 application; requires dotnet-runtime, libevdev, GTK3 .NET bindings; A1: dotnet-build-system — not mature in Guix; A2: pre-built binary — needs .NET runtime

;;; ── 14. qt6-base-hifps ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Qt6 fork with high-FPS patches; requires full Qt6 source build (~2h) with custom patches; A1: inherit qt6-base and apply patches — qt6 in Guix may not match upstream version

;;; ── 15. qt6-xcb-private-headers-hifps ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Private headers for qt6-base-hifps; depends on qt6-base-hifps which is not yet packaged; A1: package after qt6-base-hifps

;;; ── 16. vortex-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Nexus Mods mod manager; Electron app with native Node.js modules and Wine integration; A1: node-build-system — 500+ npm deps, native gyp modules; A2: AppImage — none for Linux natively

;;; ── 17. nbtexplorer ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Minecraft NBT editor; .NET/Mono WinForms application; A1: mono-build — requires Mono runtime + WinForms; A2: dotnet-build — not mature in Guix

;;; ── 18. somewm-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; AwesomeWM ported to Wayland; complex C build with wlroots, Lua, xcb, libinput deps; A1: gnu-build-system — needs full wlroots 0.18+ build chain; A2: cmake — custom build scaffolding

;;; ── 19. linux-wallpaperengine-git ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Steam Wallpaper Engine for Linux; requires Steam Workshop API and proprietary wallpaper assets; A1: cmake-build-system — needs libsteam_api.so (proprietary); A2: standalone mode — limited without Steam

;;; ── 20. python-uharfbuzz ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Cython bindings for harfbuzz shaping engine; requires harfbuzz C library + Cython build with complex meson/setuptools integration; A1: pyproject-build-system — needs cython compilation against harfbuzz headers

;;; ── 21. bs-manager-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Beat Saber mod manager; Electron app with native Node.js modules; A1: node-build-system — 300+ npm deps; A2: AppImage — none available

;;; ── 22. ytm-player-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; YouTube Music TUI client; Rust/Cargo with mpv, yt-dlp integration; A1: cargo-build-system — 60+ crate deps; A2: pre-built binary — none available

;;; ── 23. scratch3 ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Scratch 3.0 desktop app; Electron with complex npm workspace and 500+ deps; A1: node-build-system — massive dep tree; A2: AppImage repack — needs Electron runtime

;;; ── 24. vrcx ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; VRChat friendship manager; .NET/Electron hybrid app; A1: dotnet-build-system — not in Guix; A2: Electron binary — needs .NET runtime

;;; ── 25. opencomposite-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; OpenVR to OpenXR translation layer; C++ with complex cmake build, requires OpenXR SDK, Vulkan, X11/Wayland interop; A1: cmake-build-system — needs openxr-sdk (not in Guix main)

;;; ── 26. xlibre-video-amdgpu ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; XLibre fork of xf86-video-amdgpu; requires X server SDK and custom XLibre patches; A1: gnu-build-system with xorg-server headers — fork maintenance unclear

;;; ── 27. pmt-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Terminal UI package manager for Arch Linux; Go binary tightly coupled to pacman/libalpm; A1: go-build-system — depends on libalpm Go bindings; no Guix equivalent

;;; ── 28. nct6687d-dkms-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Nuvoton NCT6687-R hwmon kernel module; requires linux-module-build-system with kernel headers; A1: DKMS module — Guix kernel module packaging requires matching kernel version

;;; ── 29. solar2d-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Solar2D game engine (formerly Corona SDK); massive C++/Lua codebase with custom build, OpenAL, Vulkan, WebKit deps; A1: cmake-build-system — 100+ source files, custom toolchain

;;; ── 30. python-opentelemetry-opencensus-shim ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; OpenCensus shim for OpenTelemetry; depends on python-opentelemetry-api, python-opencensus — neither in Guix; A1: pyproject-build-system — blocked by missing opentelemetry-api/sdk chain

;;; ── 31. python-opentelemetry-opentracing-shim ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; OpenTracing shim for OpenTelemetry; depends on python-opentelemetry-api, python-opentracing — missing dep chain; A1: pyproject — blocked by opentelemetry-api

;;; ── 32. python-opentelemetry-exporter-otlp ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; OpenTelemetry OTLP exporter meta-package; depends on python-opentelemetry-exporter-otlp-proto-{grpc,http} — full dep chain missing; A1: pyproject — blocked by opentelemetry-sdk

;;; ── 33. python-opentelemetry-exporter-otlp-proto-common ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; OTLP protobuf encoding for OpenTelemetry; depends on opentelemetry-sdk, opentelemetry-proto — missing; A1: pyproject — blocked by SDK chain

;;; ── 34. python-opentelemetry-exporter-otlp-proto-grpc ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; OTLP gRPC exporter; depends on grpcio, opentelemetry-sdk, opentelemetry-proto — grpcio has complex C++ build; A1: pyproject — blocked by grpcio + SDK

;;; ── 35. python-opentelemetry-exporter-otlp-proto-http ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; OTLP HTTP exporter; depends on opentelemetry-sdk, opentelemetry-proto, googleapis-common-protos; A1: pyproject — blocked by SDK chain

;;; ── 36. python-opentelemetry-exporter-prometheus ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Prometheus exporter for OpenTelemetry; depends on opentelemetry-sdk, prometheus-client — SDK missing; A1: pyproject — blocked by opentelemetry-sdk

;;; ── 37. python-opentelemetry-exporter-zipkin ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Zipkin exporter meta-package for OpenTelemetry; depends on zipkin-json and zipkin-proto-http sub-packages; A1: pyproject — blocked by SDK chain

;;; ── 38. python-opentelemetry-exporter-zipkin-json ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Zipkin JSON exporter; depends on opentelemetry-sdk, py-zipkin — SDK missing; A1: pyproject — blocked by opentelemetry-sdk

;;; ── 39. python-opentelemetry-exporter-zipkin-proto-http ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Zipkin protobuf HTTP exporter; depends on opentelemetry-sdk, protobuf — SDK missing; A1: pyproject — blocked by opentelemetry-sdk

;;; ── 40. python-opentelemetry-propagator-b3 ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; B3 propagator for OpenTelemetry; depends on opentelemetry-api — not in Guix; A1: pyproject — blocked by opentelemetry-api

;;; ── 41. python-opentelemetry-propagator-jaeger ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Jaeger propagator for OpenTelemetry; depends on opentelemetry-api — not in Guix; A1: pyproject — blocked by opentelemetry-api

;;; ── 42. python-opentelemetry-proto ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; OpenTelemetry protobuf definitions; depends on protobuf>=3.19, opentelemetry-api — API not in Guix; A1: pyproject — blocked by opentelemetry-api

;;; ── 43. python-curl-cffi-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Python FFI binding for curl-impersonate; requires curl-impersonate (C library fork not in Guix) and cffi build; A1: pyproject — blocked by curl-impersonate; A2: use system curl — loses browser impersonation feature

;;; ── 44. bruno ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Opensource API client; Electron app with complex npm workspace; A1: node-build-system — 400+ npm deps with native modules; A2: AppImage repack — large runtime

;;; ── 45. spotify-adblock ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Spotify adblocker shared library; Rust/Cargo LD_PRELOAD library; A1: cargo-build-system — needs crate enumeration; A2: also requires Spotify client binary to function

;;; ── 46. graphite-editor-git ──────────────────────────────────────────────────────
;;; BLOCKED: NEEDS_RECIPE_DESIGN
;;; Node-based raster/vector editor; Rust/WASM + TypeScript frontend; A1: cargo-build-system + wasm — complex multi-target build; A2: pre-built — web-only, no desktop binary

;;; ── 47. plasma6-applets-eventcalendar ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; KDE Plasma 6 calendar plasmoid; requires KF6/Plasma6 framework (plasma-framework, kirigami2, etc.); A1: cmake-build-system — Plasma 6 packaging infrastructure not in Guix

;;; ── 48. inputactions-kwin ──────────────────────────────────────────────────────
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; KDE Plasma 6 gesture plugin; requires KF6/KWin development headers and Plasma 6 plugin API; A1: cmake-build-system — blocked by missing Plasma 6 in Guix

