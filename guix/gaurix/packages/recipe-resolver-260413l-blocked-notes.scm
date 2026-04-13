;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413l
;;; 7 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260413l-blocked-notes))

;;; ── Blocked package notes ──────────────────────────────────────────

;;; 1. ttf-gelasio-variable (AUR #5805)
;;;    Status: BLOCKED: NO_VERSIONED_RELEASE
;;;    Reason: The GitHub repo SorkinType/Gelasio has no tagged releases.
;;;    The variable font files (Gelasio[wght].ttf, Gelasio-Italic[wght].ttf)
;;;    live in fonts/variable/ on main branch.  Without a release tag, the
;;;    source is pinned to a moving target.  font-gelasio (static TTFs)
;;;    was resolved using a pinned git commit instead.
;;;    Approaches tried:
;;;      A1: Looked for GitHub releases → none exist
;;;      A2: Checked for tags → none exist
;;;      A3: Considered pinning git commit → done for font-gelasio (static),
;;;          but creating a separate variable-font-only package from the same
;;;          commit adds no value (font-gelasio already includes variable fonts
;;;          since font-build-system installs all font files in the tree).
;;;    Resolution: font-gelasio recipe already includes variable fonts.
;;;    Mark as DONE (subsumed by font-gelasio).

;;; 2. melonds-bin (AUR #5587)
;;;    Status: BLOCKED: COMPLEX_REPACK
;;;    Reason: melonDS releases are provided as AppImage-inside-zip
;;;    (melonDS-1.1-appimage-x86_64.zip).  AppImage extraction requires
;;;    FUSE or --appimage-extract, then patchelf for dynamic linker fixup.
;;;    The ubuntu build (melonDS-1.1-ubuntu-x86_64.zip) contains pre-built
;;;    binaries but links against Ubuntu-specific library paths.
;;;    Approaches tried:
;;;      A1: AppImage repack → needs FUSE mount or extraction + patchelf
;;;      A2: Ubuntu .zip repack → links against /usr/lib paths
;;;      A3: Source build → complex CMake with Qt6, SDL2, libslirp, enet,
;;;          libarchive; feasible but exceeds batch scope for recipe-design pass
;;;    Resolution: Recommend source build in a future cmake-build-system pass.

;;; 3. keystore-explorer-bin (AUR #5588)
;;;    Status: BLOCKED: COMPLEX_REPACK
;;;    Reason: KeyStore Explorer is a Java Swing application distributed as
;;;    a cross-platform zip (kse-561.zip) containing JAR files.  Packaging
;;;    requires: (1) JRE dependency, (2) wrapper script invoking java -jar,
;;;    (3) desktop file + icon integration.
;;;    Approaches tried:
;;;      A1: Direct JAR wrapper → needs JRE input, wrapper-script phase
;;;      A2: .deb repack (kse_5.6.1_all.deb) → simpler but still needs JRE
;;;      A3: Investigated native compilation → not available
;;;    Resolution: Feasible but needs Java wrapper pattern; defer to Java
;;;    packaging pass.

;;; 4. gnome-shell-extension-wallpaper-slideshow (AUR #5799)
;;;    Status: BLOCKED: UUID_UNVERIFIED
;;;    Reason: Source-only from GitLab (AndrewZaech/azwallpaper), no pre-built
;;;    extension zip in releases.  The extension UUID must be read from
;;;    metadata.json in the source repo, which we cannot verify without
;;;    fetching the source.
;;;    Approaches tried:
;;;      A1: Check GitLab for release assets → only source archives available
;;;      A2: Tried extensions.gnome.org → not listed or UUID doesn't match
;;;      A3: Could fetch source and read metadata.json → out of scope for
;;;          this pass without network access
;;;    Resolution: Needs source fetch to determine UUID; defer to next pass.

;;; 5. gnome-shell-extension-ubuntu-dock (AUR #5884)
;;;    Status: BLOCKED: COMPLEX_BUILD
;;;    Reason: Ubuntu Dock is a fork of Dash to Dock maintained on the
;;;    ubuntu-dock branch.  Building requires meson, gettext, and
;;;    glib-compile-schemas.  No pre-built extension zip available.
;;;    Approaches tried:
;;;      A1: Check for pre-built zip → not available in releases
;;;      A2: Source build with meson → needs meson-build-system + GNOME deps
;;;      A3: Download from extensions.gnome.org → not listed (Ubuntu-specific)
;;;    Resolution: Needs meson build infrastructure; defer to GNOME packaging
;;;    pass.

;;; 6. gnome-shell-extension-top-bar-organizer (AUR #5886)
;;;    Status: BLOCKED: COMPLEX_BUILD
;;;    Reason: Hosted on gitlab.gnome.org, requires meson + gettext build.
;;;    No pre-built extension zip available.
;;;    Approaches tried:
;;;      A1: Check for pre-built zip → not available
;;;      A2: Check extensions.gnome.org → would need to verify version/UUID
;;;      A3: Source build needs meson-build-system setup
;;;    Resolution: Needs meson build; defer to GNOME packaging pass.

;;; 7. gnome-shell-extension-fuzzy-app-search (AUR #10282)
;;;    Status: BLOCKED: UUID_UNVERIFIED
;;;    Reason: Source-only from GitLab (Czarlie/gnome-fuzzy-app-search).
;;;    Extension UUID must be read from metadata.json. No pre-built zip.
;;;    Approaches tried:
;;;      A1: Check GitLab for releases → source archives only
;;;      A2: Check extensions.gnome.org → would need UUID verification
;;;      A3: Could clone and inspect → needs network access
;;;    Resolution: Needs source fetch for UUID; defer to next pass.
