;;; recipe-resolver-260423o --- blocked notes
;;;
;;; 15 packages blocked with reasons and exhausted approaches.

;;; 1. ttf-hellvetica
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: NON_FREE_LICENSE: novelty font with
;;;    intentionally bad kerning; A1: license is "free for personal use only"
;;;    which is not a FOSS license; A2: commercial use requires author
;;;    permission; A3: original website (hellveticafont.com) is defunct,
;;;    only available via web.archive.org

;;; 2. ttf-segoe-ui-variable
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: PROPRIETARY: Microsoft Segoe UI Variable
;;;    font; A1: Microsoft font license prohibits redistribution outside
;;;    Microsoft products; A2: no FOSS alternative with identical metrics;
;;;    A3: distribution via Guix would violate Microsoft's font EULA

;;; 3. heynote-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: COMMONS_CLAUSE: developer scratchpad
;;;    (Electron app); A1: license is Commons Clause + MIT which prohibits
;;;    selling the software, not considered FOSS by OSI/FSF; A2: Electron
;;;    runtime dependencies not in Guix; A3: Snap/AppImage packaging adds
;;;    extraction complexity

;;; 4. ttf-fonts-gb-deepin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: UNCLEAR_SOURCE: Deepin Chinese fonts
;;;    (GB18030 compliant); A1: upstream source repository and exact download
;;;    URL unconfirmed from Deepin community packages; A2: license terms
;;;    unverified (claimed GPL+FE but not confirmed); A3: font files may be
;;;    extracted from Deepin OS packages with unclear redistribution rights

;;; 5. dosbox-pure-unleashed-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: NO_STABLE_RELEASE: DOSBox reimagined
;;;    desktop app; A1: only "Preview 5" release available, no stable version;
;;;    A2: release may have breaking changes as project matures; A3: standard
;;;    dosbox/dosbox-staging already available in Guix for DOS emulation

;;; 6. landrop-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: NO_VERSIONED_URL: LAN file transfer
;;;    tool; A1: binary releases use "LANDrop-latest-linux.AppImage" URL
;;;    without version, breaking reproducibility; A2: separate releases repo
;;;    (LANDrop-releases) has no tagged releases; A3: AppImage extraction
;;;    and Qt5 runtime dependencies add complexity

;;; 7. garlmap-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: ELECTRON_COMPLEX: Electron music
;;;    player using mpv backend; A1: AppImage bundles Electron runtime
;;;    (200+ node_modules); A2: requires system mpv installation for audio
;;;    playback; A3: Electron version pinning and sandbox workarounds
;;;    needed for Guix

;;; 8. nuclear-player-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: ELECTRON_COMPLEX: free streaming
;;;    music player; A1: Electron app with 200+ bundled node_modules and
;;;    native addons; A2: AppImage/deb require Electron runtime wrapping;
;;;    A3: audio backend needs system-level PulseAudio/PipeWire integration

;;; 9. openoffice-bin
;;;    BLOCKED: NEEDS_RECIPE_DESIGN: COMPLEX_REPACK: Apache OpenOffice
;;;    productivity suite; A1: distributed as tarball containing RPM files
;;;    requiring multi-step extraction (tar -> rpm2cpio -> cpio); A2: desktop
;;;    integration needs extensive path rewriting; A3: LibreOffice already
;;;    available in Guix as a more maintained alternative

;;; 10. heidisql-qt6-bin
;;;     BLOCKED: NEEDS_RECIPE_DESIGN: MISSING_GUIX_DEPS: database GUI
;;;     manager built with FreePascal/Lazarus; A1: requires libqt6pas
;;;     (Qt6 bindings for FreePascal) not available in Guix; A2: FreePascal
;;;     runtime libraries not fully packaged; A3: DBeaver or other Java-based
;;;     DB tools available as alternatives

;;; 11. technitium-dns-server-bin
;;;     BLOCKED: NEEDS_RECIPE_DESIGN: DOTNET_REQUIRED: open-source DNS
;;;     server; A1: requires ASP.NET Core 9 runtime which is not fully
;;;     bootstrapped in Guix; A2: web admin interface depends on .NET
;;;     Kestrel server; A3: CoreDNS or Knot DNS available as alternatives

;;; 12. yarc-launcher-bin
;;;     BLOCKED: NEEDS_RECIPE_DESIGN: NON_STANDARD_LICENSE: YARG game
;;;     launcher; A1: uses custom "YARG License" which is not an SPDX-
;;;     recognized license; A2: license restricts use of YARG logos but
;;;     otherwise permissive, creating ambiguity; A3: Tauri AppImage adds
;;;     extraction and runtime dependency complexity

;;; 13. python-pdf2doi
;;;     BLOCKED: NEEDS_RECIPE_DESIGN: MISSING_DEPS: Python PDF-to-DOI
;;;     extractor; A1: depends on python-crossref-commons and python-
;;;     scholarly which are not in Guix; A2: scholarly requires browser
;;;     automation (selenium/playwright) for Google Scholar access; A3:
;;;     transitive dependency chain includes 10+ unpackaged Python modules

;;; 14. python-pympress
;;;     BLOCKED: NEEDS_RECIPE_DESIGN: COMPLEX_DEPS: dual-screen PDF
;;;     presenter; A1: requires python-gi (PyGObject) with GTK3, poppler-
;;;     glib, and cairo introspection bindings; A2: GStreamer integration
;;;     for media playback in presentations; A3: python-vlc optional dep
;;;     adds further complexity

;;; 15. python-speechrecognition
;;;     BLOCKED: NEEDS_RECIPE_DESIGN: COMPLEX_NATIVE_DEPS: speech
;;;     recognition library; A1: core functionality requires PocketSphinx
;;;     (offline) or API keys (online engines); A2: microphone input needs
;;;     python-pyaudio which depends on PortAudio C library; A3: FLAC
;;;     encoding requires flac binary; multiple native deps need packaging
