;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 5 resolved with recipes; 25 re-evaluated with concrete exhaust reasons.
;;;
;;; Recipes (4 new + 1 alias):
;;;   1. krokiet-bin (copy, v11.0.1, Slint-based duplicate finder, MIT)
;;;   2. orca-slicer-bin (copy, v2.3.2, AppImage 3D printer slicer, AGPL-3.0)
;;;   3. dxvk-mingw (#11102): resolved — dxvk-bin already exists in
;;;      deptree-resolver-260408d.scm (v2.7.1); compat alias in general-compat.scm
;;;   4. spacefm-thermitegod (meson, v2.1.0, file manager fork, GPL-3.0)
;;;   5. vicinae-bin (copy, v0.20.12, desktop launcher, GPL-3.0)
;;;
;;; Exhausted (25):
;;;   - backintime (#11671): CLI recipe exists (deptree-resolver-260407e) with
;;;     placeholder hash; Qt6 GUI needs python-pyqt6 (not in Guix)
;;;   - joplin (#11509): npm monorepo with 500+ deps, corepack/yarn/electron
;;;   - plasma6-applets-thermal-monitor-git (#11744): needs full KDE Plasma 6 stack
;;;   - lib32-wivrn-server (#11520): MULTILIB_UNSUPPORTED
;;;   - wivrn-dashboard (#11521): needs KDE6 kirigami + wivrn-server chain
;;;   - gpu-screen-recorder-gtk (#11549): needs gpu-screen-recorder backend
;;;     (GPU kernel module, CUDA/VAAPI/KMS hardware capture)
;;;   - ladybird (#11842): rapidly evolving browser engine, massive dep tree
;;;   - throne (#11621): mixed Qt6/Go/protobuf build, all three ecosystems
;;;   - portproton (#11681): Arch-specific, lib32, downloads at runtime
;;;   - paperless-ngx-venv (#12201): 50+ Python deps, multi-service Django
;;;   - lib32-obs-vkcapture (#11097): MULTILIB_UNSUPPORTED
;;;   - citron (#11666): Switch emulator, massive dep tree (50+ deps)
;;;   - pgadmin4-desktop (#11885): NW.js/Electron hybrid, complex bundling
;;;   - wayvr-git (#11647): Rust + wlroots + OpenXR, many cargo deps
;;;   - obs-studio-liberty (#11893): requires CEF (Chromium Embedded Framework)
;;;   - pyside2 (#11599): shiboken2 + full Qt5 stack + LLVM/Clang
;;;   - firefox-vaapi (#10786): full Firefox rebuild for VA-API patches
;;;   - phonon-qt6-mpv-git (#10968): phonon-qt6 not in Guix
;;;   - scratch3 (#12047): Electron + npm workspace + 500+ deps
;;;   - plasma-login-manager-git (#11631): KDE6 + PAM + systemd
;;;   - xlibre-video-amdgpu (#12058): needs xlibre-xserver chain
;;;   - ossia-score (#11053): requires Clang/LLD as compiler/linker
;;;   - maint (#13388): Arch-specific pacman-based maintenance
;;;   - kanidm (#11836): 300+ Rust crate deps + wasm-pack frontend
;;;   - opencomposite-git (#12056): git submodules (OpenXR-SDK, glm, libunwind)
;;;     + no release tarballs; needs pre-fetched submodule approach
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xfce)
  #:export (
            krokiet-bin
            orca-slicer-bin
            spacefm-thermitegod
            vicinae-bin
            ))

;;;
;;; --- 1. krokiet-bin ---
;;; Desktop duplicate file/image finder with Slint UI (part of czkawka project).
;;; Pre-built x86_64 Linux binary from GitHub releases.
;;; Upstream: https://github.com/qarmin/czkawka
;;;

(define-public krokiet-bin
  (package
    (name "krokiet-bin")
    (version "11.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/qarmin/czkawka/releases/download/"
                    version "/linux_krokiet_x86_64"))
              (sha256
               (base32
                "176apc3whbdhpbr6hyish4zlpy1lgln6qbmfk1zayrni24x4hcqx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("krokiet" "bin/krokiet"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "krokiet")
              (chmod "krokiet" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/krokiet"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname
                                    (search-input-file inputs
                                                       "lib/ld-linux-x86-64.so.2"))
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "duplicate file and image finder with Slint desktop UI")
    (description
     "Krokiet is a desktop application for finding duplicate files, empty
folders, similar images, and other filesystem cleanup tasks.  It is the
Slint-based frontend of the czkawka project, offering a modern native
UI.  This package provides the pre-built binary.")
    (home-page "https://github.com/qarmin/czkawka")
    (license license:expat)))

;;;
;;; --- 2. orca-slicer-bin ---
;;; 3D printer slicer for Bambu, Prusa, Voron, and other FDM printers.
;;; AppImage binary from GitHub releases.
;;; Upstream: https://github.com/OrcaSlicer/OrcaSlicer
;;;

(define-public orca-slicer-bin
  (package
    (name "orca-slicer-bin")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OrcaSlicer/OrcaSlicer/releases/download/"
                    "v" version
                    "/OrcaSlicer_Linux_AppImage_Ubuntu2404_V"
                    version ".AppImage"))
              (sha256
               (base32
                "1n2afc153fl1pxzif65z0921hkhjynmblp37drv43n9pxk73chy6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("OrcaSlicer.AppImage" "bin/orca-slicer"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "OrcaSlicer.AppImage")
              (chmod "OrcaSlicer.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "g-code generator for 3D printers")
    (description
     "OrcaSlicer is a G-code generator (slicer) for FDM 3D printers
including Bambu Lab, Prusa, Voron, VzBot, RatRig, and Creality
machines.  It is forked from BambuStudio and PrusaSlicer, adding
auto-calibration, multi-color printing, and advanced quality presets.
This package provides the pre-built AppImage.")
    (home-page "https://github.com/OrcaSlicer/OrcaSlicer")
    (license license:agpl3)))

;;;
;;; --- 3. dxvk-mingw ---
;;; Resolved: dxvk-bin already exists in deptree-resolver-260408d.scm (v2.7.1).
;;; Compat alias dxvk-mingw → dxvk-bin added in general-compat.scm.
;;;

;;;
;;; --- 4. spacefm-thermitegod ---
;;; Modernized fork of SpaceFM file manager.
;;; Meson source build.
;;; Upstream: https://github.com/thermitegod/spacefm
;;;

(define-public spacefm-thermitegod
  (package
    (name "spacefm-thermitegod")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thermitegod/spacefm/archive/refs/tags/"
                    "v" version ".tar.gz"))
              (sha256
               (base32
                "1adgbyxivi5089s5q875dnqinx4bb9sypbb4qfxhd76gfi41gsyn"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:tests? #f))                     ;no test suite
    (native-inputs
     (list pkg-config))
    (inputs
     (list gtk+-2
           ffmpegthumbnailer
           libbsd
           xxhash))
    (synopsis "multi-panel tabbed file manager (SpaceFM fork)")
    (description
     "SpaceFM (thermitegod fork) is a multi-panel tabbed file manager for
Linux with a built-in virtual filesystem, device manager, and
customizable interface.  This fork modernizes the codebase to C++20
with Meson build system while preserving the original SpaceFM
feature set.")
    (home-page "https://github.com/thermitegod/spacefm")
    (license license:gpl3+)))

;;;
;;; --- 5. vicinae-bin ---
;;; Raycast-style desktop launcher with plugins.
;;; Pre-built tarball from GitHub releases.
;;; Upstream: https://github.com/vicinaehq/vicinae
;;;

(define-public vicinae-bin
  (package
    (name "vicinae-bin")
    (version "0.20.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vicinaehq/vicinae/releases/download/"
                    "v" version "/vicinae-linux-x86_64-v"
                    version ".tar.gz"))
              (sha256
               (base32
                "036cd162fpjwhsvybcchk8gp14l1x7626aq0w97y1hsmaf3m6620"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin/" "bin/")
           ("lib/" "lib/")
           ("share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "focused desktop launcher with plugin support")
    (description
     "Vicinae is a Raycast-style desktop launcher for Linux featuring plugin
support, calculator integration, and Wayland layer-shell positioning.
Built with Qt6 and QML, it provides a fast keyboard-driven interface
for launching applications and running commands.  This package provides
the pre-built binary release.")
    (home-page "https://github.com/vicinaehq/vicinae")
    (license license:gpl3)))
