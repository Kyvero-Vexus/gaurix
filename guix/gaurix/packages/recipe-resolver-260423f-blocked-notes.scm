;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260423f
;;; 25 packages exhausted after evaluation.

;;; -------------------------------------------------------------------
;;; 1. python-frida-tools — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; depends on python-frida which requires native Frida agent binaries (C/Vala); no pure-Python fallback
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 2. python-frida-bin — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; Frida native agent + Node.js bindings; complex binary + npm hybrid build
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 3. 86box-manager — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; .NET SDK 6.0 required; Guix has no dotnet-sdk or dotnet-runtime; no prebuilt Linux binary on GitHub
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 4. firefox-extension-bitwarden — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires npm + nodejs-lts-krypton build chain; 50+ npm deps not in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 5. capt-src — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires lib32 packages (lib32-libxml2, lib32-glibc, lib32-popt); Guix has no multilib
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 6. firestorm-next-bin — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires lib32 packages (lib32-libidn, lib32-libsndfile, lib32-zlib); Guix has no multilib
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 7. wiliwili-wayland — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; depends on pystring and portable (not in Guix); cmake build with 7+ missing deps
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 8. etcher-ng-bin — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires electron28 + asar; specific Electron version not in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 9. python-jax-rocm — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires ROCm stack (miopen-hip, rccl, rocm-hip-sdk) + bazel build system; neither available in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 10. apk-mitm — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; npm-only distribution; requires npm ecosystem build chain
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 11. distccd-alarm-armv7h — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; ARM cross-compilation distcc toolchain; architecture-specific (armv7h), requires distcc not in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 12. distccd-alarm-armv8 — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; ARM cross-compilation distcc toolchain; architecture-specific (armv8/aarch64), requires distcc not in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 13. tabby — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires electron38 + npm/yarn; complex JS build with 100+ npm deps
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 14. nvidia-340xx-lts — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; kernel module requiring linux-lts-headers + DKMS; Guix kernel module packaging not feasible for legacy NVIDIA
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 15. nvidia-340xx-lts-dkms — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; DKMS kernel module; same as nvidia-340xx-lts plus DKMS framework not in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 16. ghidra-git — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires Gradle + java-environment=21 + python-pip; complex Java/Gradle build not supported in Guix batch
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 17. vrcx-git — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires dotnet-sdk-9.0 + npm + electron; .NET + JS hybrid, no dotnet ecosystem in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 18. qcalc-bin — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires electron41; specific Electron version not in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 19. project-registry — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires npm + gyp (node-gyp native compilation); complex Node.js ecosystem
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 20. ffmpeg-cuda-full — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires CUDA SDK + 60+ deps including amf-headers, avisynthplus, ffnvcodec-headers; massive build scope
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 21. dingtalk-wayland-screenshare-git — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires dingtalk-bin (proprietary) + opencv + libportal + pipewire; complex multimedia stack
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 22. spotify-adblock-git — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires spotify package as runtime dep; spotify not available in Guix
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 23. icecat-ublock-origin — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires npm + python + strip-nondeterminism build chain for Firefox extension
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 24. r-data.table — DEP_RESOLUTION_FAILED
;;; -------------------------------------------------------------------
;;; requires R (r>=3.3.0); R ecosystem packaging requires dedicated CRAN import tooling
;;; Next action: dep resolution failed — requires ecosystem/tooling support.

;;; -------------------------------------------------------------------
;;; 25. firefox-userchromejs — NEEDS_RECIPE_DESIGN
;;; -------------------------------------------------------------------
;;; Firefox binary patching; tightly coupled to Firefox version (150.0a1); requires runtime patching mechanism
;;; Next action: needs recipe design — requires ecosystem/tooling support.

