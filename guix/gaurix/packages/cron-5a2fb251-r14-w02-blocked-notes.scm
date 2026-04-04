;;; Blocked notes for r14-w02 worker batch.
;;; 4 packages blocked, 1 already resolved (wolfssl-all).

(define-module (gaurix packages cron-5a2fb251-r14-w02-blocked-notes))

(define blocked-packages
  (list
   (list "paru" "ARCH_SPECIFIC_TOOL"
         "A1: guix show paru -> package not found; no upstream equivalent."
         "A2: AUR PKGBUILD requires pacman>=6.1 and libalpm.so>=14 as hard build/runtime deps."
         "A3: pacman/libalpm are Arch Linux package manager internals; not available in Guix and not portable.")
   (list "nvidia-utils-beta" "PROPRIETARY_DRIVER_COMPLEX"
         "A1: guix show/search found no nvidia driver/utils packages; upstream Guix only has nouveau."
         "A2: AUR PKGBUILD extracts from monolithic 404MB NVIDIA-Linux-x86_64-595.58.03.run; requires custom extraction of 100+ shared libs, OpenGL/Vulkan/EGL/VDPAU stacks, and kernel module compilation."
         "A3: Previous worker (cron-c79f127f-w02) also blocked on same package; requires dedicated nonfree binary-driver recipe infrastructure (like nonguix channel).")
   (list "wl-mpris-idle-inhibit" "CARGO_GIT_DEPS"
         "A1: No binary releases available on GitHub; source-only."
         "A2: Cargo.toml specifies 3 git dependencies (wayland-rs, mpris-rs) not published on crates.io; guix cargo-build-system requires crates.io sources."
         "A3: 59 crate dependencies total with git-pinned wayland protocol crates; would require manual crate packaging of unpublished git repos first.")
   (list "systemd-suspend-modules" "SYSTEMD_SPECIFIC"
         "A1: AUR PKGBUILD installs a single bash script to /usr/lib/systemd/system-sleep/; Guix uses Shepherd, not systemd."
         "A2: The script hooks into systemd's suspend/resume lifecycle via system-sleep directory convention; no Shepherd equivalent exists."
         "A3: Could theoretically rewrite as a Shepherd service but would be a different program entirely, not a port of the AUR package.")))
