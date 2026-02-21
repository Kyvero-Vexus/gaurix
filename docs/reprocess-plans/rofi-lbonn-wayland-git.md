# Reprocess plan: rofi-lbonn-wayland-git

## Upstream/source strategy
AUR git: https://aur.archlinux.org/rofi-lbonn-wayland-git.git (rev 755645e42b5c71098cbb3eaea823bbacdc36ba99). Canonical upstream determined from PKGBUILD source URL fields; prioritize upstream VCS/tarball over Arch repack artifacts.

## Dependency graph strategy (Guix/native/propagated inputs)
Start from PKGBUILD depends/makedepends; map to Guix `inputs` and `native-inputs`; keep runtime wrappers in `propagated-inputs` only when binaries/scripts require PATH-visible tools at runtime. Prefer existing Guix packages to minimize closure drift.

## Build-system approach and phase customizations
Use appropriate Guix build-system based on upstream (gnu/cmake/meson/qt/electron-build helpers). Add custom phases for patch-shebangs, FHS path rewrite, desktop/icon install, wrapper generation, and disabling networked/update checks during build/tests.

## Reproducibility concerns and mitigation
Pin source revision/checksum, remove embedded timestamps, force deterministic archiving, avoid host probes, set HOME/TMPDIR and stable locales, and patch self-updater codepaths out of installed outputs.

## Legal/distribution notes
Package allowed even if nonfree when lawful to redistribute. Record license metadata exactly; if upstream terms forbid redistribution of binaries/sources, keep package FAILED with explicit legal constraint.

## Test/build verification strategy
Run `guix lint -L guix <pkg>` and `guix build -L guix <pkg>` (or nearest Guix-equivalent package name when renaming is needed). For GUI/network-heavy apps, run smoke check with `--check` where feasible and verify wrapped executables resolve libs.

## Fallback strategy if blocked
If full packaging is blocked, try (1) mapping to existing Guix package/equivalent, (2) split plugin/subcomponent packaging, (3) binary-wrapper package with explicit legal note and patchelf/wrap-program hardening, else retain FAILED with concrete blocker evidence (AUR commit + failing step).
