;;; Blocked notes for recipe-resolver-260417n
;;; 6 packages remain BLOCKED after evaluation.
;;; POOL DEPLETED: All 14 NEEDS_RECIPE_DESIGN items in queue have been
;;; processed. 8 resolved with recipes, 6 exhausted.

;;; 9. transistor-git — ANDROID_APP
;;; Package: Internet radio player
;;; Source: https://github.com/y20k/transistor (ARCHIVED Feb 2025)
;;; A1: Build from Android/Kotlin source — this is an Android app, not a
;;;     desktop Linux application; requires Android SDK/Gradle toolchain
;;; A2: Check for desktop Linux version — none exists; the project targets
;;;     only Android devices with F-Droid/Play Store distribution
;;; A3: Find alternative Linux radio app — alternatives exist in Guix
;;;     (shortwave, goodvibes) but this specific app is Android-only
;;; Verdict: EXHAUSTED — Android app with no desktop Linux variant

;;; 10. godot-double-mono — DOTNET_UNSUPPORTED
;;; Package: Godot game engine double-precision build with C# support
;;; Source: https://github.com/godotengine/godot
;;; A1: Build with SCons (python-scons) — SCons available but Mono/.NET SDK
;;;     required for C# scripting support is not bootstrapped in Guix
;;; A2: Build without Mono (Godot double-precision only, no C#) — this
;;;     would be godot-double, not godot-double-mono; different package
;;; A3: Use prebuilt Mono from upstream — Mono runtime is a complex
;;;     bootstrapping chain (.NET → Mono → managed assemblies); not
;;;     feasible as a simple binary drop-in
;;; Verdict: EXHAUSTED — Mono/.NET ecosystem not available in Guix

;;; 11. asp — ARCH_SPECIFIC + DEPRECATED
;;; Package: Arch Linux build source file management tool
;;; Source: https://github.com/archlinux/asp (archived Nov 2023)
;;; A1: Package as-is — depends on pacman, devtools, and Arch Build System
;;;     infrastructure; none of these are in Guix or portable
;;; A2: Strip Arch dependencies — removes all functionality; asp is purely
;;;     a wrapper around Arch-specific SVN/Git repos
;;; A3: Use alternative — deprecated by Arch in favor of pkgctl; no
;;;     equivalent concept on Guix (Guix uses channels, not PKGBUILDs)
;;; Verdict: EXHAUSTED — Arch-specific deprecated tool, no Guix equivalent

;;; 12. pacwall-git — ARCH_SPECIFIC
;;; Package: Live wallpaper showing package dependency graph
;;; Source: https://github.com/Kharacternyk/pacwall v2.3.2
;;; A1: Package as-is — explicitly pacman-only; README states "dependency
;;;     graph of installed with pacman packages"; no multi-backend support
;;; A2: Fork and adapt for Guix — would require rewriting the C code to
;;;     query Guix store instead of pacman; substantial effort for niche tool
;;; A3: Use alternative visualization — `guix graph` provides dependency
;;;     graphing natively; no wallpaper integration but covers the core need
;;; Verdict: EXHAUSTED — pacman-only tool, not portable to Guix

;;; 13. gridmonger-git — NIM_UNSUPPORTED
;;; Package: Old-school cRPG mapping companion
;;; Source: https://github.com/johnnovak/gridmonger v1.2.0
;;; A1: Build from source with Nim — Nim compiler v2.0+ not available in
;;;     Guix; packaging Nim itself is a significant bootstrapping task
;;; A2: Use prebuilt Linux binary — no Linux binary releases exist; only
;;;     Windows and macOS builds are published
;;; A3: Package Nim compiler first — Nim bootstrap requires a C compiler +
;;;     specific Nim version chain; complex multi-stage bootstrap beyond
;;;     scope of recipe design pass
;;; Verdict: EXHAUSTED — requires Nim toolchain not in Guix, no binaries

;;; 14. ccdciel — FPC_UNSUPPORTED
;;; Package: CCD capture software for amateur astronomy
;;; Source: https://github.com/pchev/ccdciel v0.9.93
;;; A1: Build from source with Free Pascal — FPC (Free Pascal Compiler) and
;;;     Lazarus IDE not available in Guix; FPC bootstrap requires existing
;;;     FPC binary (chicken-and-egg problem)
;;; A2: Use prebuilt Linux binary — no prebuilt binaries published on GitHub
;;;     releases; upstream only provides source
;;; A3: Cross-compile or use FPC binary bootstrap — FPC provides
;;;     pre-compiled bootstrapping binaries, but integrating into Guix's
;;;     reproducible build model is a major infrastructure task
;;; Verdict: EXHAUSTED — requires FPC/Lazarus not in Guix, no binaries
