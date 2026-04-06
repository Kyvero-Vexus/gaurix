;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #12 — blocked notes.
;;; 23 packages re-blocked with concrete reasons and attempt details.
;;; 7 recipes created, 8 compat aliases added to general-compat.scm.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd12-blocked-notes))

(define %blocked-notes
  (list
   '(samsung-unified-driver-common
     reason: "PROPRIETARY_DELETED"
     details: "Proprietary Samsung printer driver.  AUR repository is empty/deleted.
No source code available — only binary distribution under Samsung EULA.
Cannot redistribute or build from source."
     attempts: ("1. Checked AUR git repo — empty, package likely deleted"
                "2. Checked upstream samsung.com — no Linux driver source available"
                "3. Searched Guix for any Samsung printer driver — none exist"))

   '(pgadmin4-server
     reason: "COMPLEX_BUILD_INFEASIBLE"
     details: "pgAdmin 4 is a complex web application requiring Python venv,
Node.js yarn/corepack bundling, and custom Arch build-functions.sh.
The build process downloads npm packages during build (network access),
uses Python venv (incompatible with Guix), and bundles a full
JavaScript frontend with Sphinx documentation."
     attempts: ("1. Reviewed PKGBUILD — uses Python venv + yarn corepack (Guix-incompatible)"
                "2. Checked Guix for pgadmin — not available"
                "3. Build requires network access for npm/yarn — incompatible with Guix sandbox"))

   '(ttf-ms-win11-auto
     reason: "NONFREE_LICENSE"
     details: "Microsoft Windows 11 fonts extracted from evaluation ISO.  Subject to
Microsoft EULA which prohibits redistribution outside Windows.  Build
process requires FUSE-mounting an ISO via httpdirfs — cannot work in
Guix sandbox.  All 7 regional variants share this blocker."
     attempts: ("1. Reviewed PKGBUILD — downloads from MS eval ISO via httpdirfs+FUSE"
                "2. License is proprietary Microsoft EULA — redistribution prohibited"
                "3. No legitimate way to distribute these fonts in a free channel"))

   '(ttf-ms-win11-auto-zh_tw
     reason: "NONFREE_LICENSE"
     details: "Regional variant of ttf-ms-win11-auto.  Same blocker: Microsoft EULA."
     attempts: ("see ttf-ms-win11-auto"))

   '(ttf-ms-win11-auto-zh_cn
     reason: "NONFREE_LICENSE"
     details: "Regional variant of ttf-ms-win11-auto.  Same blocker: Microsoft EULA."
     attempts: ("see ttf-ms-win11-auto"))

   '(ttf-ms-win11-auto-thai
     reason: "NONFREE_LICENSE"
     details: "Regional variant of ttf-ms-win11-auto.  Same blocker: Microsoft EULA."
     attempts: ("see ttf-ms-win11-auto"))

   '(ttf-ms-win11-auto-sea
     reason: "NONFREE_LICENSE"
     details: "Regional variant of ttf-ms-win11-auto.  Same blocker: Microsoft EULA."
     attempts: ("see ttf-ms-win11-auto"))

   '(ttf-ms-win11-auto-other
     reason: "NONFREE_LICENSE"
     details: "Regional variant of ttf-ms-win11-auto.  Same blocker: Microsoft EULA."
     attempts: ("see ttf-ms-win11-auto"))

   '(ttf-ms-win11-auto-korean
     reason: "NONFREE_LICENSE"
     details: "Regional variant of ttf-ms-win11-auto.  Same blocker: Microsoft EULA."
     attempts: ("see ttf-ms-win11-auto"))

   '(ttf-ms-win11-auto-japanese
     reason: "NONFREE_LICENSE"
     details: "Regional variant of ttf-ms-win11-auto.  Same blocker: Microsoft EULA."
     attempts: ("see ttf-ms-win11-auto"))

   '(dms-shell-bin
     reason: "MISSING_DEPS_ECOSYSTEM"
     details: "DankMaterialShell is a binary-only package that depends on quickshell
and dgop, neither of which exist in Guix.  Source build would require
packaging the entire quickshell (Qt6/QML framework) and dgop ecosystems."
     attempts: ("1. Reviewed PKGBUILD — binary package depending on quickshell + dgop"
                "2. Checked Guix for quickshell — not available"
                "3. Checked Guix for dgop — not available; would need full Go dep tree"))

   '(arch-update
     reason: "ARCH_SPECIFIC"
     details: "Arch Update is a system update notifier/manager specifically for
Arch Linux.  It depends on pacman, pacman-contrib, and
archlinux-contrib — all Arch-only tools with no Guix equivalents.
Completely non-functional outside Arch Linux."
     attempts: ("1. Reviewed PKGBUILD — wraps pacman, checkupdates, paccache"
                "2. All core deps are Arch-specific (pacman ecosystem)"
                "3. Tool concept (OS update notifier) not portable to Guix"))

   '(winboat-bin
     reason: "BINARY_ONLY_NO_SOURCE"
     details: "Winboat is distributed only as a prebuilt .deb binary.  The GitHub
repository does not contain buildable source code.  The binary has
complex shared library dependencies (freerdp, GTK, NSS, ALSA) that
would need patchelf wrapping."
     attempts: ("1. Reviewed PKGBUILD — downloads .deb, extracts binary"
                "2. Checked GitHub repo — no source code for building"
                "3. Binary-only distribution not suitable for Guix packaging"))

   '(paru-bin
     reason: "ARCH_SPECIFIC"
     details: "Paru is an AUR helper for Arch Linux.  It depends on pacman and
libalpm (Arch's package management library).  These have no Guix
equivalents.  Tool is completely non-functional outside Arch."
     attempts: ("1. Reviewed PKGBUILD — Rust binary wrapping pacman/libalpm"
                "2. Source available but depends on libalpm (Arch-only)"
                "3. AUR helpers are fundamentally Arch-specific"))

   '(mediatek-mt7927-dkms
     reason: "DKMS_KERNEL_MODULE"
     details: "MediaTek MT7927 WiFi driver as a DKMS kernel module.  DKMS is an
Arch/Debian concept not applicable to Guix.  Additionally requires
downloading proprietary ASUS firmware ZIP.  Would need
linux-module-build-system with specific kernel version pinning."
     attempts: ("1. Reviewed PKGBUILD — DKMS module + proprietary firmware download"
                "2. DKMS incompatible with Guix kernel module approach"
                "3. Proprietary firmware required — cannot distribute in free channel"))

   '(archivebox
     reason: "COMPLEX_BUILD_MISSING_DEPS"
     details: "ArchiveBox is a self-hosted web archiving tool requiring chromium
(not in Guix), Python 3.11 venv, Node.js, and many AUR-specific
dependencies (postlight-parser, readability-extractor, single-file-cli).
Build uses pip install with network access — incompatible with Guix."
     attempts: ("1. Reviewed PKGBUILD — uses pip install in venv (needs network)"
                "2. Checked Guix for chromium — not available"
                "3. Multiple missing deps + network build = infeasible"))

   '(dingtalk-bin
     reason: "PROPRIETARY_BINARY"
     details: "DingTalk is a proprietary Chinese messaging/collaboration app by
Alibaba.  Distributed only as a prebuilt .deb binary with custom
proprietary license.  No source code available."
     attempts: ("1. Reviewed PKGBUILD — downloads .deb from Alibaba CDN"
                "2. License is proprietary Alibaba EULA"
                "3. No source code available for building"))

   '(mkinitcpio-tailscale
     reason: "ARCH_SPECIFIC"
     details: "mkinitcpio hooks for Tailscale VPN in early boot.  mkinitcpio is
Arch Linux's initramfs generation tool.  Guix uses its own initrd
system (gnu/system/linux-initrd.scm).  These hooks are meaningless
outside the Arch mkinitcpio framework."
     attempts: ("1. Reviewed PKGBUILD — installs mkinitcpio hook scripts"
                "2. mkinitcpio is Arch-specific (Guix has its own initrd)"
                "3. Concept not portable — would need a Guix service instead"))

   '(discord-chat-exporter-plus-cli
     reason: "DOTNET_VERSION_MISSING"
     details: "Discord Chat Exporter Plus is a .NET 10.0 application.  Guix only
has dotnet-sdk 8.x.  Building requires dotnet-sdk-10.0 which is not
yet packaged in Guix.  The .NET build system in Guix is also not
well-established for complex projects."
     attempts: ("1. Reviewed PKGBUILD — requires dotnet-sdk-10.0"
                "2. Checked Guix for dotnet-sdk — only 8.x available"
                "3. .NET build system support in Guix is limited"))

   '(codename-goose
     reason: "COMPLEX_RUST_CARGO_DEPS"
     details: "Goose is a large Rust AI agent project by Block.  The cargo build
requires hundreds of crate dependencies that would all need to be
packaged or vendored.  Additionally needs CUDA (optional), protobuf,
libxcb, and cmake as build deps.  The scale of cargo dependency
resolution makes this infeasible for batch processing."
     attempts: ("1. Reviewed PKGBUILD — large Rust project with many crate deps"
                "2. Cargo dep vendoring for 100+ crates too complex for batch"
                "3. Would need cargo-build-system with extensive #:cargo-inputs"))

   '(bcachefs-dkms-git
     reason: "DKMS_DELETED"
     details: "bcachefs DKMS kernel module package.  AUR repository is empty/deleted.
DKMS is incompatible with Guix kernel module building.  bcachefs is
already in mainline Linux kernel since 6.7, so a separate DKMS module
is unnecessary on modern kernels."
     attempts: ("1. Checked AUR git repo — empty, package deleted"
                "2. DKMS incompatible with Guix linux-module-build-system"
                "3. bcachefs in mainline kernel — separate module unnecessary"))

   '(bgb
     reason: "PROPRIETARY_WINDOWS_BINARY"
     details: "BGB is a proprietary Windows-only Game Boy emulator.  No source code.
The AUR package runs the Windows binary through Wine.  No license
declared (proprietary).  Cannot redistribute or build from source."
     attempts: ("1. Reviewed PKGBUILD — downloads Windows .zip, runs via Wine"
                "2. No source code available — proprietary software"
                "3. Wine wrapping of proprietary binaries not suitable for Guix"))

   '(sdkman-bin
     reason: "NETWORK_BUILD_INCOMPATIBLE"
     details: "SDKMAN is a shell-based SDK manager that downloads JDK/Gradle/etc
from sdkman.io during installation and use.  The build process itself
uses curl to fetch from the API.  Fundamentally incompatible with
Guix's reproducible, sandboxed build model."
     attempts: ("1. Reviewed PKGBUILD — uses curl to sdkman.io API during package()"
                "2. Tool concept (online SDK manager) incompatible with Guix model"
                "3. Guix already provides JDK/Gradle/etc as native packages"))))
