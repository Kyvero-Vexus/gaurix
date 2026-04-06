;;; Worker w03 batch (r13): blocked package notes.
;;; These packages could not be resolved in this pass.
(define-module (gaurix packages cron-c79f127f-r13-w03-blocked-notes))

;;; ─── Still BLOCKED packages ─────────────────────────────────────────────────

;;; asf (ArchiSteamFarm) - BLOCKED: DEP_RESOLUTION_FAILED
;;;   Version: 6.3.4.2
;;;   URL: https://github.com/JustArchiNET/ArchiSteamFarm
;;;   Reason: Requires .NET SDK >= 10 for source build and aspnet-runtime >= 10.
;;;     The .NET ecosystem (dotnet-sdk, msbuild, NuGet restore) is not available
;;;     in upstream Guix.  Building .NET applications from source requires a
;;;     self-hosting dotnet SDK, NuGet package restoration, and a complex
;;;     multi-stage build process that is not yet supported.
;;;   Approaches tried:
;;;     1. Source build with dotnet-sdk: Not feasible - dotnet-sdk not in Guix.
;;;     2. Binary repackage: ASF distributes generic Linux binaries, but they
;;;        require the aspnet-runtime and a full .NET shared framework at
;;;        specific paths (/usr/share/dotnet).  The runtime dependency chain
;;;        (dotnet-runtime -> aspnet-runtime -> host libraries) is too complex
;;;        for a simple binary repack without a working dotnet-runtime package.
;;;     3. Compat alias: No equivalent Steam farming tool exists in Guix.
;;;   Next steps: Package dotnet-sdk and dotnet-runtime first, then revisit.

;;; nvidia-535xx-utils - BLOCKED: PROPRIETARY_DRIVER_COMPLEXITY
;;;   Version: 535.288.01
;;;   URL: http://www.nvidia.com/
;;;   Reason: NVIDIA proprietary driver utilities require:
;;;     1. Downloading the 400MB+ .run self-extracting installer
;;;     2. Extracting and relocating ~200 shared libraries, firmware blobs,
;;;        and utility binaries to correct FHS paths
;;;     3. Kernel module compilation (nvidia.ko, nvidia-modeset.ko, etc.)
;;;        against the running kernel headers
;;;     4. Complex library interposition (libGL, libEGL, libGLX, libvulkan)
;;;        that conflicts with mesa
;;;     5. udev rules, systemd services, and X11 configuration
;;;   Approaches tried:
;;;     1. Binary repackage of .run file: Too complex - requires kernel headers,
;;;        module signing, and deep system integration not available in Guix
;;;        build sandbox.
;;;     2. Compat alias to nouveau: Not equivalent - nouveau is the open-source
;;;        driver; nvidia-535xx-utils is the proprietary userspace.
;;;     3. Minimal library extraction: Would require patchelf on ~50 libraries,
;;;        correct RPATH setup, and would still lack kernel modules.
;;;   Next steps: Consider nonguix-style approach or Guix System service
;;;     integration.  This is a system-level package, not a user-space one.
