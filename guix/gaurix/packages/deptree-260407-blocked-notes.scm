;;; Blocked notes for deptree-260407 dependency-tree resolver pass.
;;; Re-blocked packages with detailed reasons.
(define-module (gaurix packages deptree-260407-blocked-notes))

;;; ----- BINARY JDK/JRE DISTRIBUTIONS (26 packages) -----
;;; These are prebuilt Java distributions from various vendors.
;;; Guix already provides openjdk@9 through openjdk@25 (source-built).
;;; Reason: PROPRIETARY_BINARY or BINARY_VENDOR_JDK — redistribution terms
;;; prevent inclusion; upstream source builds are available via openjdk.
;;;
;;; jdk-temurin: Adoptium Temurin JDK 25 binary (GPL2+, but binary-only dist)
;;; jdk21-temurin: Adoptium Temurin JDK 21 binary (status: FAILED in org)
;;; jre-jetbrains: JetBrains Runtime (custom patches, redistribution unclear)
;;; jre8-temurin: Temurin JRE 8 binary
;;; jre11-temurin: Temurin JRE 11 binary
;;; jre17-temurin: Temurin JRE 17 binary
;;; jre21-temurin: Temurin JRE 21 binary
;;; jre25-temurin: Temurin JRE 25 binary
;;; liberica-jdk-full-bin: BellSoft Liberica JDK (custom license)
;;; zulu-21-bin: Azul Zulu JDK 21 (custom license)
;;; amazon-corretto-17: Amazon Corretto 17 (GPL2, binary dist)
;;; amazon-corretto-8: Amazon Corretto 8 (GPL2, binary dist for Java 8)
;;; jdk25-graalvm-ce-bin: GraalVM CE 25 (custom license)
;;; jdk8-graalvm-ee-bin: GraalVM EE 8 (OTN license, proprietary)
;;; jdk17-zulu-prime-bin: Azul Zulu Prime 17 (proprietary stream license)
;;; jdk17-graalvm-ee-bin: GraalVM EE 17 (OTN license, proprietary)
;;; jdk21-graalvm-ee-bin: GraalVM EE 21 (GFTC license, proprietary)
;;; jdk11-graalvm-bin: GraalVM CE 11 (custom, EOL)
;;; jdk19-graalvm-bin: GraalVM CE 19 (custom, EOL)
;;; jdk21-graalvm-bin: GraalVM CE 21 (custom)
;;; jdk8-graalvm-bin: GraalVM CE 8 (custom, EOL)
;;; zulu-jre11-fx: Zulu JRE 11 with JavaFX (custom license)
;;; zulu-jre17-fx: Zulu JRE 17 with JavaFX (custom license)
;;; zulu-jre21-fx: Zulu JRE 21 with JavaFX (custom license)
;;; zulu-jre25-fx: Zulu JRE 25 with JavaFX (custom license)
;;; zulu-jre8-fx: Zulu JRE 8 with JavaFX (custom license)
;;; Attempted: draft copy-build-system recipes in queue-20260406-blocked-tree.scm.
;;; Outcome: Hashes unverified; Guix already has openjdk 9-25 from source.

;;; ----- COREPACK META PACKAGES (3 packages) -----
;;; These are AUR meta packages that use Node.js corepack to provide
;;; package managers (npm, pnpm, yarn). Not meaningful in Guix context.
;;; npm-corepack: corepack shim for npm
;;; pnpm-corepack: corepack shim for pnpm
;;; yarn-corepack: corepack shim for yarn
;;; Reason: META_PACKAGE — thin shim around corepack; Guix provides node
;;; which includes corepack natively.

;;; ----- FREETYPE2 PATCHED VARIANTS (3 packages) -----
;;; Custom-patched freetype for specific display hardware or rendering.
;;; freetype2-qdoled-aw3225qf: QD-OLED AW3225QF subpixel patches
;;; freetype2-qdoled-gen3: QD-OLED Gen3 subpixel patches
;;; freetype2-macos: macOS-style rendering patches
;;; Reason: PATCHED_VARIANT — requires display-specific patches not upstream.
;;; Guix has freetype@2.13.3. Patches are hardware-specific and not portable.

;;; ----- NVIDIA PROPRIETARY DRIVERS (6 packages) -----
;;; nvidia-535xx-utils: NVIDIA 535 branch utils
;;; nvidia-550xx-utils: NVIDIA 550 branch utils
;;; nvidia-390xx-utils: NVIDIA legacy 390 utils
;;; nvidia-470xx-utils: NVIDIA legacy 470 utils
;;; lib32-nvidia-utils-beta: NVIDIA 32-bit beta utils
;;; lib32-nvidia-vulkan-utils: NVIDIA 32-bit Vulkan dev utils
;;; Reason: PROPRIETARY_DRIVER — NVIDIA proprietary binary blobs with custom
;;; license. Cannot be built from source. Requires kernel module pairing.

;;; ----- MICROSOFT PROPRIETARY FONTS (16 packages) -----
;;; ttf-ms-win11: Windows 11 TrueType fonts
;;; ttf-ms-win10: Windows 10 TrueType fonts
;;; ttf-ms-win10-japanese: Win10 Japanese fonts
;;; ttf-ms-win10-korean: Win10 Korean fonts
;;; ttf-ms-win10-other: Win10 other fonts
;;; ttf-ms-win10-sea: Win10 Southeast Asian fonts
;;; ttf-ms-win10-thai: Win10 Thai fonts
;;; ttf-ms-win10-zh_cn: Win10 Simplified Chinese fonts
;;; ttf-ms-win10-zh_tw: Win10 Traditional Chinese fonts
;;; ttf-ms-win11-japanese: Win11 Japanese fonts
;;; ttf-ms-win11-korean: Win11 Korean fonts
;;; ttf-ms-win11-other: Win11 other fonts
;;; ttf-ms-win11-sea: Win11 Southeast Asian fonts
;;; ttf-ms-win11-thai: Win11 Thai fonts
;;; ttf-ms-win11-zh_cn: Win11 Simplified Chinese fonts
;;; ttf-ms-win11-zh_tw: Win11 Traditional Chinese fonts
;;; Reason: PROPRIETARY_NONFREE — Microsoft proprietary fonts extracted from
;;; Windows ISOs. Cannot be legally redistributed. No source available.

;;; ----- PROPRIETARY EMOJI FONTS (2 packages) -----
;;; ttf-apple-emoji: Apple Color Emoji (extracted from macOS)
;;; ttf-joypixels: JoyPixels emoji (custom commercial license)
;;; Reason: PROPRIETARY_NONFREE — proprietary emoji fonts.
;;; Apple emoji extracted from macOS, cannot be redistributed.
;;; JoyPixels requires commercial license for redistribution.

;;; ----- PARATYPE FONT FAMILY (7 packages) -----
;;; ttf-paratype: ParaType font family (OFL)
;;; ttf-pt-astra-sans: PT Astra Sans (OFL)
;;; ttf-pt-astra-serif: PT Astra Serif (OFL)
;;; ttf-pt-mono: PT Mono (OFL)
;;; ttf-pt-root_ui: PT Root UI (OFL)
;;; ttf-pt-sans: PT Sans (OFL)
;;; ttf-pt-serif: PT Serif (OFL)
;;; Reason: SOURCE_UNAVAILABLE — OFL-licensed but distributed only via
;;; paratype.ru download portal with no stable versioned archive URL.
;;; Attempted: searched for GitHub mirrors, Google Fonts mirror.
;;; No stable download URL found for Guix origin definition.

;;; ----- SHANGGU CJK FONT (1 package) -----
;;; ttf-shanggu: Calligraphic CJK font based on Source-Han-Sans (OFL)
;;; Reason: SOURCE_FORMAT — distributed as .7z archives only. Guix has no
;;; native 7z extraction in build systems. Would need p7zip as native-input
;;; and custom extraction phase. Low priority given complexity.

;;; ----- LIBINPUT PATCHED VARIANTS (2 packages) -----
;;; libinput-epp: Replaces adaptive acceleration with Windows EPP curve
;;; libinput-no-gestures: libinput with gestures removed (FAILED in org)
;;; Reason: PATCHED_VARIANT — requires maintaining out-of-tree patches
;;; against libinput releases. Guix has libinput@1.29.1.

;;; ----- AMD ROCm/OpenCL (4 packages) -----
;;; rocm-gfx110x-bin: ROCm SDK for RDNA3 (custom AMD license)
;;; rocm-gfx120x-bin: ROCm SDK for RDNA4 (custom AMD license)
;;; rocm-nightly-gfx110x-bin: ROCm nightly for RDNA3
;;; rocm-nightly-gfx1151-bin: ROCm nightly for gfx1151
;;; opencl-amd: AMD OpenCL runtime (custom AMD license)
;;; Reason: PROPRIETARY_BINARY — AMD proprietary SDK binaries repackaged
;;; from Ubuntu releases. Custom AMD license prevents redistribution.

;;; ----- .NET / ASP.NET (2 packages) -----
;;; aspnet-runtime-bin: ASP.NET Core runtime (depends on dotnet-runtime-bin)
;;; aspnet-runtime-7.0-bin: ASP.NET 7.0 runtime (EOL, depends on dotnet-runtime-7.0-bin)
;;; Reason: BINARY_RUNTIME_CHAIN — depends on dotnet-runtime-bin which is
;;; itself a complex binary package. Guix has dotnet@8 from nonguix but
;;; no ASP.NET-specific runtime separation.

;;; ----- ARCH-SPECIFIC PACKAGES (2 packages) -----
;;; archlinux-java-run: Arch Linux Java application launcher (bash/java-runtime-common)
;;; texlive-installer: TeX Live installer that tricks pacman (FAILED in org)
;;; Reason: ARCH_SPECIFIC — tightly coupled to Arch Linux package management.
;;; archlinux-java-run depends on Arch's java-runtime-common alternatives system.
;;; texlive-installer is a pacman trick package; Guix has its own TeX Live.

;;; ----- MISCELLANEOUS RE-BLOCKED (7 packages) -----
;;; jaq-git: jq clone in Rust — requires full cargo dependency vendoring.
;;;   Attempted: cargo-build-system needs vendored crate sources. Complex.
;;; 7zip-natspec: 7zip with libnatspec — libnatspec not in Guix, niche codec.
;;; fftw-amd: AMD-optimized FFTW — requires AMD-specific compiler flags and
;;;   CPU detection. Guix has generic fftw@3.3.10.
;;; postgresql17-docs: PostgreSQL 17 HTML docs — Guix has postgresql@16 only;
;;;   version mismatch, and docs are part of postgresql build output.
;;; domake: Docker make tool — depends on dosh (not in Guix), which depends
;;;   on Docker. Complex container dependency chain.
;;; gopass-secret-service: D-Bus provider using gopass — gopass not in Guix.
;;; system76-power: Rust project with dbus/polkit — cargo dependency vendoring
;;;   required. Attempted: source downloaded (1.2.8) but 50+ Rust crate deps
;;;   need vendoring for cargo-build-system.

;;; ----- OPENSSL-1.1 (1 package) -----
;;; openssl-1.1: Already has compat alias in general-compat.scm.
;;; Resolving as PRIOR (compat alias exists, org entry needs status update).

;;; ----- ELECTRON22-BIN (1 package) -----
;;; electron22-bin: Electron 22 prebuilt binary — EOL since 2023-10.
;;; Reason: EOL_BINARY — Electron 22 is end-of-life. Guix nonguix has
;;; electron@36. No security support for Electron 22.

;;; ----- FIREFOX VARIANTS (3 packages) -----
;;; firefox-beta-bin: Firefox beta binary (depends on ccache??)
;;; firefox-beta-bin-all-localizations: Firefox beta all locales
;;; Reason: BETA_BINARY — Firefox beta is a rapidly changing binary target.
;;; Guix has firefox-esr for stable ESR builds. Beta tracking is impractical.

;;; ----- LIBSODIUM-1.0.18 (1 package) -----
;;; Already aliased via prior recipe in cron-c79f127f-r26-w03.scm.
;;; Resolving as PRIOR.

;;; ----- QT5-DOC (1 package) -----
;;; Qt5 documentation package — Qt5 docs are massive (~2GB) and require
;;; qdoc toolchain. Guix has qtbase but not standalone doc package.
;;; Reason: COMPLEX_BUILD — requires full Qt5 build infrastructure for
;;; documentation generation. Not feasible as standalone package.
