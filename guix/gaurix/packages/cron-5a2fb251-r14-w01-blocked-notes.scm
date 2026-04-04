;;; Blocker notes for cron-5a2fb251-r14 worker w01.
(define-module (gaurix packages cron-5a2fb251-r14-w01-blocked-notes)
  #:export (cron-5a2fb251-r14-w01-blocked-notes))

(define cron-5a2fb251-r14-w01-blocked-notes
  (list
   ;; 4 packages resolved (ddccontrol-db-git, fooyin, web-eid-native, zerotier-one)
   ;; 6 packages BLOCKED:

   '(waydroid
     reason: "MISSING_GUIX_DEPS"
     details: "Requires python-gbinder (Python bindings for libgbinder, not in Guix),
dbus-python with GLib mainloop integration, kernel binder driver support,
and Android system images. python-gbinder is a C extension binding that would
need libgbinder packaged first. Also needs kernel binder module."
     attempts: ("1. Checked upstream Guix — not available"
                "2. Examined pyproject.toml and Python imports — identified gbinder as critical dep"
                "3. Searched Guix for gbinder/binder packages — none found"))

   '(linux-lqx
     reason: "KERNEL_PACKAGING_COMPLEX"
     details: "Packaging a custom kernel in Guix requires defining a linux-libre-style
package with custom kconfig, the Liquorix patchset, and all the kernel
build infrastructure. This is a multi-day effort requiring deep Guix
kernel packaging knowledge."
     attempts: ("1. Reviewed Guix linux-libre packaging — extremely complex infrastructure"
                "2. Checked Liquorix patches — large patchset on top of mainline kernel"
                "3. Considered binary kernel packaging — impractical for kernel"))

   '(stardust-xr-solar-sailer
     reason: "MISSING_RUST_CRATES"
     details: "Rust project with git dependencies (stardust-xr-fusion from StardustXR/core,
stardust-xr-molecules from StardustXR/molecules, libmonado-rs). Guix cargo-build-system
requires all crate dependencies to be individually packaged. Git dependencies make
this even harder as they bypass crates.io."
     attempts: ("1. Checked Cargo.toml — has git dependencies not on crates.io"
                "2. Searched Guix for stardust-xr crates — none available"
                "3. Considered vendoring approach — still needs all transitive deps"))

   '(openvino
     reason: "MASSIVE_SUBMODULE_DEPS"
     details: "OpenVINO is a massive CMake project with 20+ git submodules (oneDNN,
protobuf, ONNX, FlatBuffers, etc.). Source tarball lacks submodules.
No pre-built Linux binaries on GitHub releases. Storage CDN uses JS rendering
making it hard to access pre-built archives programmatically."
     attempts: ("1. Checked GitHub releases — no binary downloads"
                "2. Checked storage.openvinotoolkit.org — JS-rendered, can't easily scrape"
                "3. Checked source tarball — missing all git submodules"))

   '(archlinux-java-run
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Shell script that hardcodes Arch Linux JVM paths (/usr/lib/jvm/) and
depends on java-runtime-common (Arch Linux JVM management). Guix uses
a completely different approach to JVM management via profiles and
JAVA_HOME. The script is fundamentally incompatible."
     attempts: ("1. Read the script source — hardcodes /usr/lib/jvm/ paths"
                "2. Checked for java-runtime-common in Guix — not available"
                "3. Considered patching paths — too many Arch-specific assumptions"))

   '(yay
     reason: "ARCH_SPECIFIC_TOOL"
     details: "AUR helper written in Go that depends on pacman, makepkg, and the
entire Arch Linux package management ecosystem. These tools do not
exist in Guix and are meaningless outside Arch Linux."
     attempts: ("1. Confirmed pacman not in Guix"
                "2. Checked if Go build is self-contained — it is not, needs pacman at runtime"
                "3. Confirmed this is fundamentally Arch-specific"))))
