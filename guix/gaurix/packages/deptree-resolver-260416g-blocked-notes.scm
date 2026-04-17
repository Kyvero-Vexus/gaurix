;;; Blocked notes for deptree-resolver-260416g
;;;
;;; sh-elf-newlib (#7617): CROSS_COMPILE_UNSUPPORTED
;;;   SuperH embedded newlib; requires sh-elf cross-compiler toolchain.
;;;   Circular bootstrap: sh-elf-gcc makedepends sh-elf-newlib and vice versa.
;;;   A1: Guix cross-base.scm supports adding targets but needs binutils+gcc+newlib multi-pkg effort.
;;;   A2: Embedded SH target audience extremely small.
;;;   A3: Recommend using Guix native cross-compilation system instead.
;;;   Status: EXHAUSTED
;;;
;;; sh-elf-gcc (#7648): CROSS_COMPILE_UNSUPPORTED
;;;   GCC cross-compiler for SuperH bare-metal.
;;;   Circular bootstrap with sh-elf-newlib.
;;;   A1: niche embedded target, very few users.
;;;   A2: Guix has native cross-compilation via --target=sh-elf.
;;;   A3: Beyond batch scope — requires Guix cross-base.scm modifications.
;;;   Status: EXHAUSTED
;;;
;;; raidrivecli (#14202): MISSING_SOURCE + PROPRIETARY
;;;   Not found in AUR metadata cache (likely removed/renamed).
;;;   Proprietary cloud storage CLI, not freely redistributable.
;;;   A1: no source in AUR cache.
;;;   A2: proprietary license prohibits redistribution.
;;;   A3: no open-source alternative available under same name.
;;;   Status: EXHAUSTED
