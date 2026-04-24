;;; Blocked notes for deptree-resolver-260424c
;;; Timestamp: 2026-04-24T07:12:56.538746+00:00
;;; 50 packages remain BLOCKED (50 resolved from 100)
;;;
;;; glfw-wayland-minecraft-cursorfix (#740): PATCH_VARIANT: patched GLFW for Minecraft cursor fix on Wayland; Guix has glfw with Wayland support
;;;   Attempts: A1: Guix has glfw with Wayland. A2: single-game workaround. A3: permanent fork maintenance burden.
;;; texlive-installer (#8013): META_INSTALLER: texlive-installer is a network installer; Guix has native texlive packages
;;;   Attempts: A1: Guix has comprehensive texlive packaging. A2: installer downloads from CTAN. A3: conflicts with reproducible packaging.
;;; electron37-bin (#1286): VERSION_PINNED_BINARY: version-pinned Electron binary; Guix has electron in nonguix
;;;   Attempts: A1: nonguix has electron. A2: version-pinned variants multiply. A3: better to use nonguix electron with version override.
;;; dotnet-sdk-8.0-bin (#15164): RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;   Attempts: A1: nonguix has dotnet-sdk. A2: multiple version-pinned variants. A3: better via nonguix dotnet.
;;; dotnet-runtime-bin (#1270): RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;   Attempts: A1: nonguix has dotnet-sdk. A2: multiple version-pinned variants. A3: better via nonguix dotnet.
;;; android-armv7a-eabi-qt6-base (#13966): CROSS_COMPILE_UNSUPPORTED: Android cross-compilation toolchain package; requires Android NDK/SDK infrastructure
;;;   Attempts: A1: checked if Guix has android cross-compile support — experimental only. A2: checked if equivalent exists — not for this target. A3: Android NDK packaging too complex for batch.
;;; aspnet-runtime-8.0-bin (#15167): RUNTIME_BINARY: ASP.NET binary distribution; part of dotnet ecosystem in nonguix
;;;   Attempts: A1: nonguix has dotnet including ASP.NET. A2: version-pinned binary variant. A3: better via nonguix dotnet.
;;; lib32-libdav1d (#2478): MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;   Attempts: A1: checked if 64-bit equivalent exists. A2: checked Guix multilib status — not supported. A3: no workaround for 32-bit requirement.
;;; docker-desktop (#140): PROPRIETARY_PLATFORM: Docker Desktop is proprietary and requires Docker Engine subscription; Guix has docker-cli and containerd
;;;   Attempts: A1: Guix already has docker-cli. A2: Docker Desktop adds proprietary GUI/VM layer. A3: license restricts redistribution for commercial use.
;;; rar (#1989): PROPRIETARY_SOFTWARE: WinRAR/RAR archiver is proprietary shareware; Guix has unrar for extraction
;;;   Attempts: A1: source not available. A2: Guix has unrar (extraction only). A3: license is proprietary shareware.
;;; ut2004-data-steam (#3517): NON_DISTRIBUTABLE: requires purchased game files
;;;   Attempts: A1: game data is copyrighted. A2: requires Steam authentication. A3: no legal redistribution possible.
;;; samsung-unified-driver-printer (#650): PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary binary blobs
;;;   Attempts: A1: source not available — binary-only. A2: requires Samsung-specific libraries. A3: license is proprietary.
;;; samsung-unified-driver-scanner (#649): PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary binary blobs
;;;   Attempts: A1: source not available — binary-only. A2: requires Samsung-specific libraries. A3: license is proprietary.
;;; lib32-libvmaf (#2366): MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;   Attempts: A1: checked if 64-bit equivalent exists. A2: checked Guix multilib status — not supported. A3: no workaround for 32-bit requirement.
;;; kemoticons (#5333): ALREADY_IN_GUIX: kemoticons is a KDE Frameworks 5 package; check (gnu packages kde-frameworks)
;;;   Attempts: A1: KDE Frameworks are packaged in Guix. A2: kemoticons is part of KF5 extras. A3: likely available.
;;; qtforkawesome (#10943): DEP_CHAIN: requires qtutilities and c++utilities from same author (Martchus); deep custom dep chain
;;;   Attempts: A1: needs c++utilities -> qtutilities -> qtforkawesome. A2: all custom Martchus projects. A3: too many unpackaged deps.
;;; lib32-nvidia-utils-beta (#2408): MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support
;;;   Attempts: A1: checked if 64-bit equivalent exists. A2: checked Guix multilib status — not supported. A3: no workaround for 32-bit requirement.
;;; qpdf-zopfli (#3041): PATCH_VARIANT: qpdf rebuilt with Zopfli compression; Guix has qpdf
;;;   Attempts: A1: Guix has qpdf. A2: Zopfli integration requires build-time patch. A3: better as package transform.
;;; python-opentelemetry-exporter-otlp-proto-http (#2148): DEP_CHAIN: requires python-opentelemetry-sdk, -api, -proto + grpcio chain
;;;   Attempts: A1: deep Python dep chain. A2: grpcio requires complex native build. A3: 10+ unpackaged Python deps.
;;; python-opentelemetry-exporter-otlp-proto-grpc (#2149): DEP_CHAIN: requires python-opentelemetry-sdk, -api, -proto + grpcio chain
;;;   Attempts: A1: deep Python dep chain. A2: grpcio requires complex native build. A3: 10+ unpackaged Python deps.
;;; fbthrift (#7961): BUILD_SYSTEM_TOO_COMPLEX: Facebook Thrift requires folly, fizz, wangle, fboss; 20+ deps
;;;   Attempts: A1: checked if Guix has folly — no. A2: requires full Facebook OSS stack. A3: too many unpackaged deps for batch.
;;; expressvpn (#7068): PROPRIETARY_SERVICE: commercial VPN client requiring paid subscription; binary-only distribution
;;;   Attempts: A1: no source code available. A2: binary requires proprietary authentication. A3: license prohibits redistribution.
;;; chkufsd-bin (#1732): PROPRIETARY_DRIVER: Paragon UFSD filesystem check tool; proprietary binary
;;;   Attempts: A1: proprietary Paragon software. A2: requires Paragon license. A3: non-redistributable.
;;; chromium-gost (#757): BUILD_SYSTEM_TOO_COMPLEX: full Chromium build with Russian GOST cryptography patches; 8+ hour build, 30GB+ disk
;;;   Attempts: A1: Guix has ungoogled-chromium in nonguix but GOST patches not available. A2: 30GB+ build. A3: impractical for batch.
;;; dotnet-targeting-pack-bin (#1268): RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix
;;;   Attempts: A1: nonguix has dotnet-sdk. A2: multiple version-pinned variants. A3: better via nonguix dotnet.
;;; e2-studio-bin (#13914): PROPRIETARY_IDE: Renesas e2 studio is proprietary Eclipse-based IDE requiring registration
;;;   Attempts: A1: requires Renesas account. A2: large Eclipse RCP app. A3: proprietary license prohibits redistribution.
;;; edk2-ovmf-fedora (#8117): BINARY_REPACKAGE: Fedora-built OVMF firmware binaries; Guix has native ovmf package
;;;   Attempts: A1: Guix has ovmf in gnu packages. A2: this repackages Fedora RPM. A3: redundant with Guix's native OVMF.
;;; foundryvtt (#7717): PROPRIETARY_SERVICE: Foundry VTT is proprietary tabletop RPG platform requiring purchased license
;;;   Attempts: A1: requires purchased license key. A2: binary distribution only. A3: license prohibits redistribution.
;;; gama-platform-jdk (#8558): BUILD_SYSTEM_TOO_COMPLEX: GAMA simulation platform bundled with JDK; large Eclipse RCP application
;;;   Attempts: A1: 500MB+ download. A2: Eclipse RCP + bundled JDK. A3: complex build dependencies.
;;; grafana-bin (#10333): PROPRIETARY_BUILD: Grafana binary includes AGPL backend + proprietary Enterprise features
;;;   Attempts: A1: AGPL-licensed but binary bundles proprietary enterprise code. A2: complex Go+Node build. A3: large binary (~300MB).
;;; hbuilderx-alpha-bin (#7235): PROPRIETARY_IDE: HBuilderX is proprietary DCloud IDE; not redistributable
;;;   Attempts: A1: proprietary binary, no source. A2: requires DCloud account. A3: proprietary license.
;;; hdfview-bin (#5142): PROPRIETARY_BUILD: HDFView binary from HDF Group; requires custom build with Java/SWT
;;;   Attempts: A1: binary distribution from hdfgroup.org. A2: requires registration. A3: complex Java/SWT build.
;;; heptabase-bin (#8961): PROPRIETARY_SERVICE: Heptabase is proprietary note-taking SaaS app (Electron); requires subscription
;;;   Attempts: A1: proprietary Electron app. A2: requires paid subscription. A3: binary-only, non-redistributable.
;;; httptoolkit-bin (#4732): PROPRIETARY_SERVICE: HTTP Toolkit has proprietary pro features; Electron binary
;;;   Attempts: A1: binary distribution is proprietary build. A2: complex Electron app. A3: mitmproxy in Guix is better alternative.
;;; hubstaff (#3356): PROPRIETARY_SERVICE: Hubstaff is proprietary time-tracking SaaS client; requires subscription
;;;   Attempts: A1: proprietary binary. A2: requires paid account. A3: non-redistributable.
;;; jai (#15430): PROPRIETARY_CLOSED_SOURCE: JAI is a proprietary compiler with restricted beta access
;;;   Attempts: A1: closed beta, no public source. A2: requires approval from Jonathan Blow. A3: non-redistributable.
;;; joplin-bin (#1255): ELECTRON_APP_COMPLEX: Joplin is a large Electron app; binary redistribution may conflict with AGPL
;;;   Attempts: A1: 200MB+ Electron binary. A2: AGPL requires source distribution. A3: complex Node/Electron build from source.
;;; justevery-code-bin (#6443): PROPRIETARY_SERVICE: JustEvery Code is proprietary AI-powered IDE requiring subscription
;;;   Attempts: A1: proprietary binary. A2: requires account. A3: non-redistributable commercial product.
;;; krux-installer-bin (#6696): ELECTRON_APP_COMPLEX: Krux installer is an Electron app for hardware wallet firmware
;;;   Attempts: A1: Electron binary distribution. A2: specialized hardware wallet tool. A3: better installed via upstream installer.
;;; max-appimage (#9103): PROPRIETARY_SOFTWARE: MAX is proprietary Russian office/OS platform; requires license
;;;   Attempts: A1: proprietary binary AppImage. A2: requires Russian MAX license. A3: non-redistributable.
;;; miniconda3 (#6113): PROPRIETARY_DISTRIBUTION: Miniconda is proprietary Anaconda distribution; Guix has conda-compatible tools
;;;   Attempts: A1: Anaconda ToS restricts large-scale redistribution. A2: proprietary binary installer. A3: Guix has python + pip natively.
;;; navicat17-premium-en (#7996): PROPRIETARY_SOFTWARE: Navicat is proprietary commercial database management tool; requires paid license
;;;   Attempts: A1: proprietary binary. A2: requires purchased license. A3: non-redistributable.
;;; nextcloud-talk-desktop-bin (#6383): ELECTRON_APP_COMPLEX: Nextcloud Talk Desktop is Electron app; large binary distribution
;;;   Attempts: A1: Electron binary. A2: complex Node.js build. A3: better to use web version or flatpak.
;;; ninjarmm-ncplayer (#7498): PROPRIETARY_SERVICE: NinjaRMM is proprietary remote monitoring/management SaaS; requires paid subscription
;;;   Attempts: A1: proprietary binary. A2: requires NinjaRMM account. A3: non-redistributable.
;;; pgyvisitor (#6522): PROPRIETARY_SERVICE: PGY Visitor is proprietary app distribution platform client
;;;   Attempts: A1: proprietary Chinese app platform. A2: requires account. A3: non-redistributable.
;;; plecs-standalone (#2780): PROPRIETARY_SOFTWARE: PLECS is proprietary power electronics simulation tool; requires paid license
;;;   Attempts: A1: proprietary binary. A2: requires purchased license. A3: non-redistributable.
;;; pragmatapro-fonts (#7941): PROPRIETARY_FONT: Pragmata Pro is proprietary commercial font; requires purchased license
;;;   Attempts: A1: proprietary font. A2: requires purchased license. A3: non-redistributable.
;;; publii (#7863): ELECTRON_APP_COMPLEX: Publii is a large Electron static site CMS; complex Node.js build
;;;   Attempts: A1: Electron app with native Node modules. A2: complex webpack build. A3: large binary distribution.
;;; rider-eap (#8626): PROPRIETARY_IDE: JetBrains Rider is proprietary IDE requiring paid license
;;;   Attempts: A1: proprietary binary from JetBrains. A2: requires license. A3: non-redistributable.
;;; shiftfs-lts-dkms (#7943): KERNEL_MODULE: DKMS kernel module; requires kernel build infrastructure not available in Guix batch
;;;   Attempts: A1: Guix has limited DKMS support. A2: kernel modules need matching kernel headers. A3: better as system service/module.
