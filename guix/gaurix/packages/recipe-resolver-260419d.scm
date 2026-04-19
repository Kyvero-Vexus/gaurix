;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419d
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (11 resolved, 11 definitions):
;;;        1.  dockcheck (copy-build-system, v0.7.7, GPL-3.0)
;;;        2.  hyprland-plugin-borders-plus-plus (cmake-build-system, v0.53.3, BSD-3)
;;;        3.  hyprland-plugin-csgo-vulkan-fix (cmake-build-system, v0.53.3, BSD-3)
;;;        4.  hyprland-plugin-hyprbars (cmake-build-system, v0.53.3, BSD-3)
;;;        5.  hyprland-plugin-hyprexpo (cmake-build-system, v0.53.3, BSD-3)
;;;        6.  hyprland-plugin-hyprfocus (cmake-build-system, v0.53.3, BSD-3)
;;;        7.  hyprland-plugin-hyprscrolling (cmake-build-system, v0.53.3, BSD-3)
;;;        8.  hyprland-plugin-hyprtrails (cmake-build-system, v0.53.3, BSD-3)
;;;        9.  hyprland-plugin-hyprwinwrap (cmake-build-system, v0.53.3, BSD-3)
;;;       10.  hyprland-plugin-xtra-dispatchers (cmake-build-system, v0.53.3, BSD-3)
;;;       11.  hyprland-guiutils-git (ALREADY_IN_GUIX: hyprland-guiutils@0.2.1)
;;;
;;; BLOCKED EXHAUSTED (19):
;;;        1.  tutanota-desktop — COMPLEX_BUILD: needs cargo+emscripten+nvm+rust-wasm
;;;        2.  geekbench — PROPRIETARY: custom license
;;;        3.  msodbcsql — PROPRIETARY: Microsoft custom license
;;;        4.  oracle-sqldeveloper — PROPRIETARY: Oracle OTN license
;;;        5.  synology-hyper-backup-explorer — PROPRIETARY: Synology proprietary
;;;        6.  vivado — PROPRIETARY: AMD/Xilinx custom license, ~100GB installer
;;;        7.  brother-hl1118 — PROPRIETARY_DRIVER: Brother commercial license
;;;        8.  brother-dcp1610w — PROPRIETARY_DRIVER + LIB32: needs lib32-glibc
;;;        9.  radar-omega — PROPRIETARY: proprietary AppImage
;;;       10.  mathematica-light — PROPRIETARY: Wolfram license
;;;       11.  lmstudio-beta — PROPRIETARY: EULA license
;;;       12.  arch-checkfw — ARCH_SPECIFIC: depends on pacman/Arch infrastructure
;;;       13.  pacman-systemd-inhibit — ARCH_SPECIFIC: pacman-specific inhibitor
;;;       14.  google-calender-widget — ELECTRON_COMPLEX: needs electron38+yarn+nvm
;;;       15.  visual-paradigm-163 — PROPRIETARY: custom license
;;;       16.  binance — PROPRIETARY: unknown/custom license
;;;       17.  rog-perf-tuner — COMPLEX_BUILD: needs npm/pnpm/qtcreator build chain
;;;       18.  storageexplorer — PROPRIETARY + DOTNET: Microsoft, needs dotnet-runtime
;;;       19.  libbit4opki — PROPRIETARY: unknown license, proprietary middleware
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260419d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages wm)
  #:export (dockcheck
            hyprland-plugin-borders-plus-plus
            hyprland-plugin-csgo-vulkan-fix
            hyprland-plugin-hyprbars
            hyprland-plugin-hyprexpo
            hyprland-plugin-hyprfocus
            hyprland-plugin-hyprscrolling
            hyprland-plugin-hyprtrails
            hyprland-plugin-hyprwinwrap
            hyprland-plugin-xtra-dispatchers))

;;; ===================================================================
;;; 1. dockcheck --- CLI tool to automate Docker image updates
;;; ===================================================================
;;;
;;; Source: https://github.com/mag37/dockcheck
;;; A bash script that checks for Docker container image updates.
;;; Runtime dependency on regctl (regclient) which is not in Guix.

(define-public dockcheck
  (package
    (name "dockcheck")
    (version "0.7.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mag37/dockcheck")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dockcheck.sh" "bin/dockcheck"))))
    (inputs (list bash))
    (home-page "https://github.com/mag37/dockcheck")
    (synopsis "CLI tool to automate Docker image updates")
    (description "Dockcheck is a command-line tool that checks for Docker
container image updates.  It supports selective updates, notifications, and
pruning of unused images.  It requires @code{regctl} from the
@code{regclient} project at runtime.")
    (license license:gpl3)))

;;; ===================================================================
;;; Hyprland Plugins --- shared origin and helper
;;; ===================================================================
;;;
;;; All hyprland-plugin-* packages share the same upstream source:
;;; https://github.com/hyprwm/hyprland-plugins
;;; Each plugin is a subdirectory with its own CMakeLists.txt.
;;; Plugins are version-pinned to match the Hyprland compositor version.

(define hyprland-plugins-version "0.53.3")

(define hyprland-plugins-source
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/hyprwm/hyprland-plugins")
          (commit (string-append "v" hyprland-plugins-version))))
    (file-name (git-file-name "hyprland-plugins" hyprland-plugins-version))
    (sha256
     (base32
      "0000000000000000000000000000000000000000000000000000"))))

(define hyprland-plugins-home-page
  "https://github.com/hyprwm/hyprland-plugins")

(define (make-hyprland-plugin subdir synopsis description)
  "Create a Hyprland plugin package from SUBDIR of the hyprland-plugins repo.
SYNOPSIS is the one-line summary, DESCRIPTION is the full description."
  (package
    (name (string-append "hyprland-plugin-" subdir))
    (version hyprland-plugins-version)
    (source hyprland-plugins-source)
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'chdir
                 (lambda _
                   (chdir #$subdir))))))
    (native-inputs (list pkg-config))
    (inputs (list hyprland))
    (home-page hyprland-plugins-home-page)
    (synopsis synopsis)
    (description description)
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 2. hyprland-plugin-borders-plus-plus
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-borders-plus-plus
  (make-hyprland-plugin
   "borders-plus-plus"
   "Hyprland plugin adding additional window borders"
   "A Hyprland plugin that adds one or two additional borders to windows,
allowing for more complex visual styling.  The plugin is version-pinned to
match the installed Hyprland compositor version."))

;;; -------------------------------------------------------------------
;;; 3. hyprland-plugin-csgo-vulkan-fix
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-csgo-vulkan-fix
  (make-hyprland-plugin
   "csgo-vulkan-fix"
   "Hyprland plugin fixing CS:GO custom resolutions with Vulkan"
   "A Hyprland plugin that fixes custom resolutions on Counter-Strike: Global
Offensive when using the Vulkan renderer.  The plugin is version-pinned to
match the installed Hyprland compositor version."))

;;; -------------------------------------------------------------------
;;; 4. hyprland-plugin-hyprbars
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-hyprbars
  (make-hyprland-plugin
   "hyprbars"
   "Hyprland plugin adding title bars to windows"
   "A Hyprland plugin that adds simple, configurable title bars to windows.
Title bars can display window titles and provide close, maximize, and minimize
buttons.  The plugin is version-pinned to match the installed Hyprland
compositor version."))

;;; -------------------------------------------------------------------
;;; 5. hyprland-plugin-hyprexpo
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-hyprexpo
  (make-hyprland-plugin
   "hyprexpo"
   "Hyprland plugin providing expo-like workspace overview"
   "A Hyprland plugin that adds an expo-like workspace overview, allowing users
to see all workspaces at a glance and switch between them.  The plugin is
version-pinned to match the installed Hyprland compositor version."))

;;; -------------------------------------------------------------------
;;; 6. hyprland-plugin-hyprfocus
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-hyprfocus
  (make-hyprland-plugin
   "hyprfocus"
   "Hyprland plugin adding flash-focus visual feedback"
   "A Hyprland plugin that provides a flash-focus effect, briefly highlighting
the newly focused window to make it easier to track focus changes.  The plugin
is version-pinned to match the installed Hyprland compositor version."))

;;; -------------------------------------------------------------------
;;; 7. hyprland-plugin-hyprscrolling
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-hyprscrolling
  (make-hyprland-plugin
   "hyprscrolling"
   "Hyprland plugin adding a scrolling window layout"
   "A Hyprland plugin that adds a scrolling layout mode, where windows are
arranged in a horizontally scrollable strip rather than the default tiling
layout.  The plugin is version-pinned to match the installed Hyprland
compositor version."))

;;; -------------------------------------------------------------------
;;; 8. hyprland-plugin-hyprtrails
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-hyprtrails
  (make-hyprland-plugin
   "hyprtrails"
   "Hyprland plugin adding smooth trails behind moving windows"
   "A Hyprland plugin that adds smooth visual trails behind windows as they are
moved or resized, creating an eye-catching animation effect.  The plugin is
version-pinned to match the installed Hyprland compositor version."))

;;; -------------------------------------------------------------------
;;; 9. hyprland-plugin-hyprwinwrap
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-hyprwinwrap
  (make-hyprland-plugin
   "hyprwinwrap"
   "Hyprland plugin allowing apps as wallpapers"
   "A Hyprland clone of xwinwrap that allows you to render any application as a
desktop wallpaper.  This can be used for animated wallpapers, video backgrounds,
or interactive desktop widgets.  The plugin is version-pinned to match the
installed Hyprland compositor version."))

;;; -------------------------------------------------------------------
;;; 10. hyprland-plugin-xtra-dispatchers
;;; -------------------------------------------------------------------
(define-public hyprland-plugin-xtra-dispatchers
  (make-hyprland-plugin
   "xtra-dispatchers"
   "Hyprland plugin adding additional dispatchers"
   "A Hyprland plugin that adds some additional window dispatchers beyond the
built-in set.  Dispatchers are commands that can be bound to keys or executed
via @code{hyprctl dispatch}.  The plugin is version-pinned to match the
installed Hyprland compositor version."))

;;; -------------------------------------------------------------------
;;; 11. hyprland-guiutils-git --- ALREADY_IN_GUIX
;;; -------------------------------------------------------------------
;;; hyprland-guiutils is already packaged in Guix at version 0.2.1.
;;; See (gnu packages cpp) module.  The AUR "-git" variant (v0.1.0)
;;; is older than the Guix package.  Compat alias added to general-compat.scm.
