;;; Blocked notes for deptree-resolver-260407c pass
;;; Documents attempt history for packages remaining BLOCKED.

(define-module (gaurix packages deptree-resolver-260407c-blocked-notes))

;;; dotnet-sdk-bin
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — needs nongnu channel for dotnet runtime

;;; nvidia-390xx-utils
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — NVIDIA proprietary driver — needs nongnu channel

;;; texlive-installer
;;; Attempt 1: Guix has comprehensive texlive packages that provide
;;;   equivalent functionality via (gnu packages tex).
;;; Attempt 2: The TeX Live installer is an Arch-specific mechanism;
;;;   Guix manages TeX packages through its own package system.
;;; Attempt 3: No meaningful equivalent needed — use texlive-* packages.
;;; Status: BLOCKED — TeX Live installer — Guix has native texlive packages

;;; opencl-amd
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — AMD proprietary OpenCL — redistribution restrictions

;;; dotnet-sdk-9.0-bin
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — needs nongnu channel for dotnet runtime

;;; archlinux-java-run
;;; Attempt 1: This is an Arch-specific utility with no meaning outside
;;;   the Arch Linux ecosystem.
;;; Attempt 2: Guix manages Java versions through its own mechanisms.
;;; Attempt 3: No equivalent needed for Guix users.
;;; Status: BLOCKED — Arch Linux specific Java runtime selector

;;; dotnet-targeting-pack-preview-bin
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — needs nongnu channel for dotnet runtime

;;; intel-oneapi-basekit-2025
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — Intel proprietary toolkit — redistribution restrictions

;;; mips64-linux-gnu-linux-api-headers
;;; Attempt 1: Requires cross-compilation toolchain for target architecture.
;;; Attempt 2: Guix has cross-compilation support but kernel headers
;;;   packages need specific integration work.
;;; Attempt 3: Deferred — needs dedicated cross-build infrastructure setup.
;;; Status: BLOCKED — cross-compilation headers — needs cross-build infra

;;; nvidia-535xx-utils
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — NVIDIA proprietary driver — needs nongnu channel

;;; openrc
;;; Attempt 1: OpenRC is an alternative init system — Guix uses Shepherd.
;;; Attempt 2: Packaging would conflict with Guix's service management.
;;; Attempt 3: No meaningful use case on Guix System.
;;; Status: BLOCKED — init system — conflicts with Guix shepherd

;;; lib32-libbluray
;;; Attempt 1: Checked upstream equivalent — 64-bit version exists in Guix.
;;; Attempt 2: Investigated multilib support — Guix does not support
;;;   32-bit compatibility libraries on 64-bit systems.
;;; Attempt 3: Considered cross-compilation — would require i686-linux
;;;   target build which is not straightforward for library packages.
;;; Status: BLOCKED — 32-bit library — Guix lacks multilib

;;; aspnet-runtime-9.0-bin
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — needs nongnu channel for dotnet runtime

;;; opencl-nvidia-390xx
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — NVIDIA proprietary OpenCL — needs nongnu channel

;;; acestream-engine
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — proprietary streaming — redistribution restrictions

;;; dotnet-host-bin
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — needs nongnu channel for dotnet runtime

;;; ndi-sdk
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — proprietary SDK — redistribution restrictions

;;; sac-core
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — proprietary security appliance — redistribution restrictions

;;; e-imzo
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — proprietary digital signature — redistribution restrictions

;;; gtk-sharp-2
;;; Attempt 1: Requires Mono runtime which is not packaged in Guix.
;;; Attempt 2: Mono packaging would be a large effort (many dependencies).
;;; Attempt 3: No viable alternative without full Mono stack.
;;; Status: BLOCKED — Mono/GTK# bindings — Guix lacks Mono runtime

;;; nvidia-470xx-utils
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — NVIDIA proprietary driver — needs nongnu channel

;;; samsung-unified-driver-printer
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — proprietary Samsung driver — CUPS integration needed

;;; crystal-nightly
;;; Attempt 1: Crystal language compiler not available in Guix.
;;; Attempt 2: Crystal bootstrapping requires existing Crystal compiler.
;;; Attempt 3: Deferred until Crystal compiler is packaged for Guix.
;;; Status: BLOCKED — Crystal nightly — Guix lacks Crystal compiler

;;; samsung-unified-driver-scanner
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — proprietary Samsung scanner — SANE integration needed

;;; lib32-libdovi
;;; Attempt 1: Checked upstream equivalent — 64-bit version exists in Guix.
;;; Attempt 2: Investigated multilib support — Guix does not support
;;;   32-bit compatibility libraries on 64-bit systems.
;;; Attempt 3: Considered cross-compilation — would require i686-linux
;;;   target build which is not straightforward for library packages.
;;; Status: BLOCKED — 32-bit library — Guix lacks multilib

;;; lib32-libvmaf
;;; Attempt 1: Checked upstream equivalent — 64-bit version exists in Guix.
;;; Attempt 2: Investigated multilib support — Guix does not support
;;;   32-bit compatibility libraries on 64-bit systems.
;;; Attempt 3: Considered cross-compilation — would require i686-linux
;;;   target build which is not straightforward for library packages.
;;; Status: BLOCKED — 32-bit library — Guix lacks multilib

;;; ps3-psl1ght
;;; Attempt 1: Requires cross-compilation toolchain for target architecture.
;;; Attempt 2: Guix has cross-compilation support but kernel headers
;;;   packages need specific integration work.
;;; Attempt 3: Deferred — needs dedicated cross-build infrastructure setup.
;;; Status: BLOCKED — PS3 homebrew SDK — PowerPC cross-compilation needed

;;; lib32-nvidia-utils-beta
;;; Attempt 1: Checked upstream Guix — not available in standard channel.
;;; Attempt 2: Checked nongnu channel — package exists there but channel
;;;   not configured in this project's channels.scm.
;;; Attempt 3: Considered standalone packaging — proprietary binary with
;;;   complex runtime dependencies and kernel module requirements.
;;; Status: BLOCKED — NVIDIA 32-bit driver — needs nongnu + multilib

;;; plasticscm-client-core
;;; Attempt 1: Checked source availability — proprietary/closed-source.
;;; Attempt 2: Investigated binary packaging — redistribution restrictions
;;;   prevent hosting in a public Guix channel.
;;; Attempt 3: Considered wrapper package — would need user to provide
;;;   binary, defeating the purpose of a package manager.
;;; Status: BLOCKED — proprietary SCM — redistribution restrictions

;;; lib32-bluez-libs
;;; Attempt 1: Checked upstream equivalent — 64-bit version exists in Guix.
;;; Attempt 2: Investigated multilib support — Guix does not support
;;;   32-bit compatibility libraries on 64-bit systems.
;;; Attempt 3: Considered cross-compilation — would require i686-linux
;;;   target build which is not straightforward for library packages.
;;; Status: BLOCKED — 32-bit library — Guix lacks multilib

