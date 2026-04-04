;;; Blocked notes for cron-c79f127f round 8 worker w05.
(define-module (gaurix packages cron-c79f127f-r8-w05-blocked-notes)
  #:export (cron-c79f127f-r8-w05-blocked-notes))

(define-public cron-c79f127f-r8-w05-blocked-notes
  '(("libastal-meta"
     "STUB_META_PACKAGE_17_MISSING_DEPS"
     "A1: guix search astal found no matching packages.  libastal-meta is a virtual
meta-package that depends on 17 separate libastal-* library packages (libastal-io,
libastal-apps, libastal-battery, libastal-bluetooth, libastal-cava, libastal-greet,
libastal-hyprland, libastal-mpris, libastal-network, libastal-notifd, libastal-powerprofiles,
libastal-river, libastal-tray, libastal-wireplumber, libastal-auth, libastal-gjs,
libastal-lua).  None of these sub-libraries are packaged in Guix or in this channel."
     "Requires packaging all 17 libastal-* sub-libraries from https://github.com/Aylur/astal
before the meta package can be assembled."
     "Package each libastal-* component individually (meson builds from the monorepo),
then create the meta package as a trivial propagated-inputs wrapper.")

    ("logmein-hamachi"
     "PROPRIETARY_NO_REDISTRIBUTABLE_SOURCE"
     "A1: LogMeIn Hamachi is proprietary software distributed as a binary-only
tarball from https://www.vpn.net/linux.  The download URL requires accepting
a license agreement and may rotate.  No stable versioned archive with a fixed
checksum is available for reproducible packaging."
     "Cannot produce a reproducible Guix origin without a stable download URL
and license compliance analysis."
     "Requires manual binary download, license review, and potentially a
nonguix-style binary repack with a fixed-output derivation pointing to a
mirrored archive.")

    ("aspnet-targeting-pack-bin"
     "MISSING_DOTNET_STACK"
     "A1: AUR aspnet-targeting-pack-bin v10.0.5.sdk201-1 depends on
dotnet-targeting-pack-bin which itself is not in Guix.  The .NET targeting
pack ecosystem requires a complete dotnet SDK/runtime stack.
A2: Guix has no native .NET SDK packages (only legacy DotGNU).
A3: NuGet-based repack is possible but requires the full dotnet-targeting-pack
dependency chain to be useful."
     "The entire .NET targeting pack stack (runtime, SDK, ASP.NET refs) is
missing from Guix.  Packaging just the ASP.NET ref assemblies without the
base targeting pack would be non-functional."
     "Revisit when a dotnet-sdk or dotnet-runtime package is available in Guix
or this channel; then package dotnet-targeting-pack-bin first, followed by
aspnet-targeting-pack-bin as a NuGet repack.")

    ("system76-acpi-dkms"
     "KERNEL_MODULE_DKMS_NOT_SUPPORTED"
     "A1: system76-acpi-dkms is a Linux kernel module that uses DKMS
(Dynamic Kernel Module Support) to compile against the running kernel headers.
A2: Guix does not use DKMS; kernel modules must be built as part of a custom
linux-libre kernel configuration or via the operating-system kernel-loadable-modules
mechanism, which requires a different packaging approach than a simple package definition.
A3: The module source is available at https://github.com/pop-os/system76-acpi-dkms
but requires kernel headers at build time."
     "DKMS-style out-of-tree kernel module packaging is not directly supported
in Guix's package model.  Requires kernel-loadable-module integration."
     "Package as a linux-module-build-system package if that build system is
available, or provide as a kernel-loadable-module definition for use in
operating-system configurations.")))
