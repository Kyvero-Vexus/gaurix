;;; Blocked notes for unresolved packages in worker w06.
(define-module (gaurix packages queue-20260402blocked-c79f127f-w06-blocked-notes)
  #:export (queue-20260402blocked-c79f127f-w06-blocked-notes))

(define-public queue-20260402blocked-c79f127f-w06-blocked-notes
  (list
   (list "foobar2000" "BLOCKED"
         (list "A1" "guix show/search: foobar2000 not found in upstream Guix")
         (list "A2" "AUR PKGBUILD uses proprietary Windows installer executables and wraps with Wine")
         (list "A3" "Downloaded upstream foobar2000-x64 installer; file reports PE32+ Windows executable")
         (list "blocker" "Needs a policy-compliant proprietary binary plus Wine wrapper recipe"))
   (list "libelectron" "BLOCKED"
         (list "A1" "guix show/search: libelectron not found in upstream Guix")
         (list "A2" "AUR PKGBUILD runs npm install --legacy-peer-deps and links to external libelectronmeta")
         (list "A3" "Upstream source tarball has no lockfile; npm ci fails and reproducible vendoring is missing")
         (list "blocker" "No deterministic dependency lock plus external runtime assumptions"))
   (list "mozc" "BLOCKED"
         (list "A1" "guix show/search: mozc not found in upstream Guix")
         (list "A2" "AUR PKGBUILD requires Bazel toolchain with many pinned git and archive sources")
         (list "A3" "PKGBUILD currently references 32 remote source artifacts including a Bazel binary")
         (list "blocker" "Bazel dependency graph and vendoring plan not yet translated to Guix"))
   (list "paru" "BLOCKED"
         (list "A1" "guix show/search: paru not found in upstream Guix")
         (list "A2" "AUR PKGBUILD requires pacman and libalpm.so>=14 at build and runtime")
         (list "A3" "guix search shows no Arch pacman/libalpm stack package to satisfy paru")
         (list "blocker" "Missing libalpm/pacman dependency stack in Guix"))
   (list "lib32-blas" "BLOCKED"
         (list "A1" "guix show/search: lib32-blas not found in upstream Guix")
         (list "A2" "AUR package is split from lib32-lapack and expects x86_64 multilib /usr/lib32 layout")
         (list "A3" "guix build --system=i686-linux -n openblas works, but no Arch-style lib32 compat package")
         (list "blocker" "Needs dedicated multilib compatibility recipe design for lib32 ABI layout"))))
