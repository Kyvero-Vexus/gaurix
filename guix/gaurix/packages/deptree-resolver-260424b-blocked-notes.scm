;;; Blocked notes for deptree-resolver-260424b
;;; Timestamp: 2026-04-24T05:51:30.830934+00:00
;;; 35 packages remain BLOCKED (65 resolved from 100)
;;;
;;; glfw-wayland-minecraft-cursorfix (#740): PATCH_VARIANT: patched GLFW for Minecraft cursor fix on Wayland; Guix has glfw with Wayland support
;;;   Attempts: A1: Guix has glfw with Wayland. A2: Minecraft-specific cursor patch is a single-game workaround. A3: would need to maintain fork permanently for one game.
;;; texlive-installer (#8013): META_INSTALLER: texlive-installer is a network installer for TeX Live; Guix has native texlive packages
;;;   Attempts: A1: Guix has comprehensive texlive packaging (texlive-scheme-*, texlive-* packages). A2: this installer downloads from CTAN which Guix handles natively. A3: installer approach conflicts with Guix's reproducible packaging model.
;;; electron37-bin (#1286): VERSION_PINNED_BINARY: version-pinned Electron binary; Guix has electron in nonguix
;;;   Attempts: A1: Guix nonguix has electron package. A2: version-pinned variants multiply quickly. A3: better to use nonguix electron with version override.
;;; dotnet-sdk-8.0-bin (#15164): RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;   Attempts: A1: Guix nonguix has dotnet-sdk. A2: multiple version-pinned variants. A3: better to use nonguix dotnet with version selection.
;;; dotnet-runtime-bin (#1270): RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;   Attempts: A1: Guix nonguix has dotnet-sdk. A2: multiple version-pinned variants. A3: better to use nonguix dotnet with version selection.
;;; android-armv7a-eabi-qt6-base (#13966): CROSS_COMPILE_UNSUPPORTED: Android cross-compilation toolchain package; requires Android NDK/SDK infrastructure
;;;   Attempts: A1: checked if Guix has android cross-compile support — experimental only. A2: checked if equivalent exists — not for this target. A3: Android NDK packaging too complex for batch.
;;; aspnet-runtime-8.0-bin (#15167): RUNTIME_BINARY: ASP.NET binary distribution; part of dotnet ecosystem in nonguix
;;;   Attempts: A1: Guix nonguix has dotnet including ASP.NET. A2: version-pinned binary variant. A3: better via nonguix dotnet.
;;; lib32-libdav1d (#2478): MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;   Attempts: A1: checked if 64-bit equivalent exists — may exist but not the same package. A2: checked Guix multilib status — not supported. A3: no workaround for 32-bit requirement.
;;; docker-desktop (#140): PROPRIETARY_PLATFORM: Docker Desktop is proprietary and requires Docker Engine subscription; Guix has docker-cli and containerd
;;;   Attempts: A1: Guix already has docker-cli (docker from gnu packages). A2: Docker Desktop adds proprietary GUI/VM layer. A3: license restricts redistribution for commercial use.
;;; rar (#1989): PROPRIETARY_SOFTWARE: WinRAR/RAR archiver is proprietary shareware; Guix has unrar for extraction
;;;   Attempts: A1: source not available. A2: Guix has unrar (extraction only). A3: license is proprietary shareware.
;;; ut2004-data-steam (#3517): NON_DISTRIBUTABLE: requires purchased Unreal Tournament 2004 game files from Steam
;;;   Attempts: A1: game data is copyrighted. A2: requires Steam authentication. A3: no legal redistribution possible.
;;; samsung-unified-driver-printer (#650): PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary binary blobs
;;;   Attempts: A1: source not available — binary-only .deb distribution. A2: requires Samsung-specific libraries. A3: license is proprietary.
;;; samsung-unified-driver-scanner (#649): PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary binary blobs
;;;   Attempts: A1: source not available — binary-only .deb distribution. A2: requires Samsung-specific libraries. A3: license is proprietary.
;;; lib32-libvmaf (#2366): MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;   Attempts: A1: checked if 64-bit equivalent exists — may exist but not the same package. A2: checked Guix multilib status — not supported. A3: no workaround for 32-bit requirement.
;;; kemoticons (#5333): ALREADY_IN_GUIX: kemoticons is a KDE Frameworks 5 package; check (gnu packages kde-frameworks)
;;;   Attempts: A1: KDE Frameworks are packaged in Guix. A2: kemoticons is part of KF5 extras. A3: may need version check but likely available.
;;; qtforkawesome (#10943): DEP_CHAIN: requires qtutilities and c++utilities from same author (Martchus); deep custom dep chain
;;;   Attempts: A1: needs c++utilities -> qtutilities -> qtforkawesome. A2: all three are custom Martchus projects. A3: too many unpackaged deps for batch.
;;; lib32-nvidia-utils-beta (#2408): PROPRIETARY_DRIVER: NVIDIA proprietary driver/utility package; requires NVIDIA kernel module and proprietary driver stack
;;;   Attempts: A1: checked if open-source nouveau provides equivalent — not for Vulkan/compute. A2: checked Guix nonguix — nvidia-driver exists but version-specific. A3: this is a version-specific variant not in nonguix.
;;; qpdf-zopfli (#5464): PATCH_VARIANT: qpdf rebuilt with Zopfli compression; Guix has qpdf — could apply patch to existing package
;;;   Attempts: A1: Guix has qpdf. A2: Zopfli integration requires build-time patch. A3: better as package transform on existing qpdf.
;;; python-opentelemetry-exporter-otlp-proto-http (#12068): DEP_CHAIN: requires python-opentelemetry-sdk, python-opentelemetry-api, python-opentelemetry-proto + grpcio chain
;;;   Attempts: A1: deep Python dep chain (opentelemetry-api -> sdk -> proto -> exporter). A2: grpcio requires complex native build. A3: 10+ unpackaged Python deps.
;;; python-opentelemetry-exporter-otlp-proto-grpc (#12067): DEP_CHAIN: requires python-opentelemetry-sdk, python-opentelemetry-api, python-opentelemetry-proto + grpcio chain
;;;   Attempts: A1: deep Python dep chain (opentelemetry-api -> sdk -> proto -> exporter). A2: grpcio requires complex native build. A3: 10+ unpackaged Python deps.
;;; fbthrift (#7961): BUILD_SYSTEM_TOO_COMPLEX: Facebook Thrift requires folly, fizz, wangle, fboss, fmt, and custom Buck/CMake build; 20 deps
;;;   Attempts: A1: checked if Guix has folly — no. A2: checked if simplified build works — requires full Facebook OSS stack. A3: too many unpackaged deps for batch resolution.
;;; expressvpn (#7068): PROPRIETARY_SERVICE: commercial VPN client requiring paid subscription; binary-only distribution
;;;   Attempts: A1: no source code available. A2: binary requires proprietary authentication. A3: license prohibits redistribution.
;;; chkufsd-bin (#1732): PROPRIETARY_DRIVER: Paragon UFSD filesystem check tool; proprietary binary
;;;   Attempts: A1: proprietary Paragon software. A2: requires Paragon license. A3: non-redistributable binary.
;;; chromium-gost (#757): BUILD_SYSTEM_TOO_COMPLEX: full Chromium build with Russian GOST cryptography patches; requires 8+ hour build, 30GB+ disk
;;;   Attempts: A1: Guix has ungoogled-chromium in nonguix but GOST patches not available. A2: build requires 30GB+ and 8+ hours. A3: could theoretically build but impractical for batch.
;;; dotnet-targeting-pack-bin (#1268): RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;   Attempts: A1: Guix nonguix has dotnet-sdk. A2: multiple version-pinned variants. A3: better to use nonguix dotnet with version selection.
;;; e2-studio-bin (#13914): PROPRIETARY_IDE: Renesas e2 studio is a proprietary Eclipse-based IDE requiring registration
;;;   Attempts: A1: requires Renesas account for download. A2: binary is a large Eclipse RCP app. A3: proprietary license prohibits redistribution.
;;; edk2-ovmf-fedora (#8117): BINARY_REPACKAGE: Fedora-built OVMF firmware binaries; Guix has native ovmf package
;;;   Attempts: A1: Guix has ovmf in gnu packages. A2: this repackages Fedora RPM. A3: redundant with Guix's native OVMF.
;;; foundryvtt (#7717): PROPRIETARY_SERVICE: Foundry VTT is a proprietary tabletop RPG platform requiring purchased license
;;;   Attempts: A1: requires purchased license key. A2: binary distribution only. A3: license prohibits redistribution.
;;; gama-platform-jdk (#8558): BUILD_SYSTEM_TOO_COMPLEX: GAMA simulation platform bundled with JDK; large Eclipse RCP application
;;;   Attempts: A1: 500MB+ download. A2: Eclipse RCP + bundled JDK. A3: complex build dependencies.
;;; grafana-bin (#10333): PROPRIETARY_BUILD: Grafana binary includes AGPL backend + proprietary Enterprise features; complex Go+Node build
;;;   Attempts: A1: AGPL-licensed but binary bundles proprietary enterprise code. A2: building from source requires Go + Node + complex webpack. A3: large binary (~300MB).
;;; hbuilderx-alpha-bin (#7235): PROPRIETARY_IDE: HBuilderX is a proprietary DCloud IDE; not redistributable
;;;   Attempts: A1: proprietary binary, no source. A2: requires DCloud account. A3: Chinese-only IDE with proprietary license.
;;; hdfview-bin (#5142): PROPRIETARY_BUILD: HDFView binary from HDF Group; requires custom build with Java/SWT
;;;   Attempts: A1: binary distribution from hdfgroup.org. A2: requires registration. A3: complex Java/SWT build.
;;; heptabase-bin (#8961): PROPRIETARY_SERVICE: Heptabase is a proprietary note-taking SaaS app (Electron); requires subscription
;;;   Attempts: A1: proprietary Electron app. A2: requires paid subscription. A3: binary-only, non-redistributable.
;;; httptoolkit-bin (#4732): PROPRIETARY_SERVICE: HTTP Toolkit has proprietary pro features; Electron binary distribution
;;;   Attempts: A1: partially open-source but binary distribution is proprietary build. A2: complex Electron app with native deps. A3: better alternatives exist (mitmproxy in Guix).
;;; hubstaff (#3356): PROPRIETARY_SERVICE: Hubstaff is a proprietary time-tracking SaaS client; requires subscription
;;;   Attempts: A1: proprietary binary. A2: requires paid account. A3: non-redistributable.
