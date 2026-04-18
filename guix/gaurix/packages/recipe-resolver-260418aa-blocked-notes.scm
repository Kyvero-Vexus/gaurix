;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418aa
;;; 7 packages marked BLOCKED.
;;;
;;; 94. vmware-workstation-noxsave -> SOURCE_UNAVAILABLE: requires VMware Workstation proprietary installer bundle as source;
;;;     A1: SOURCE_UNAVAILABLE — requires VMware Workstation proprietary installer bundle as source;
;;;     A2: package requires components not available in Guix;
;;;     A3: manual recipe design needed with platform-specific consideration
;;; 95. archcraft-pkg -> DEP_RESOLUTION_FAILED: Arch Linux-specific packaging utility; depends on pacman/makepkg ecosystem;
;;;     A1: DEP_RESOLUTION_FAILED — Arch Linux-specific packaging utility; depends on pacman/makepkg ecosystem;
;;;     A2: package requires components not available in Guix;
;;;     A3: manual recipe design needed with platform-specific consideration
;;; 96. wineasio32 -> DEP_RESOLUTION_FAILED: 32-bit Wine ASIO bridge; requires lib32-glibc and 32-bit Wine multilib not available in Guix;
;;;     A1: DEP_RESOLUTION_FAILED — 32-bit Wine ASIO bridge; requires lib32-glibc and 32-bit Wine multilib not available in Guix;
;;;     A2: package requires components not available in Guix;
;;;     A3: manual recipe design needed with platform-specific consideration
;;; 97. gdal-libkml-filegdb -> DEP_RESOLUTION_FAILED: GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb;
;;;     A1: DEP_RESOLUTION_FAILED — GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb;
;;;     A2: package requires components not available in Guix;
;;;     A3: manual recipe design needed with platform-specific consideration
;;; 98. python-gdal-libkml-filegdb -> DEP_RESOLUTION_FAILED: GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb;
;;;     A1: DEP_RESOLUTION_FAILED — GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb;
;;;     A2: package requires components not available in Guix;
;;;     A3: manual recipe design needed with platform-specific consideration
;;; 99. opencl-nvidia-340xx -> SOURCE_UNAVAILABLE: OpenCL for legacy NVIDIA 340xx driver; driver EOL, source URLs no longer available;
;;;     A1: SOURCE_UNAVAILABLE — OpenCL for legacy NVIDIA 340xx driver; driver EOL, source URLs no longer available;
;;;     A2: package requires components not available in Guix;
;;;     A3: manual recipe design needed with platform-specific consideration
;;; 100. lineageos-devel -> DEP_RESOLUTION_FAILED: meta-package for Android/LineageOS build environment; depends on android-sdk, repo, and dozens of Android-specific tools;
;;;     A1: DEP_RESOLUTION_FAILED — meta-package for Android/LineageOS build environment; depends on android-sdk, repo, and dozens of Android-specific tools;
;;;     A2: package requires components not available in Guix;
;;;     A3: manual recipe design needed with platform-specific consideration
