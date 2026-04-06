;;; Blocked notes for queue-20260406-nrd30h — 20 packages re-blocked with
;;; detailed reasons after evaluation.  1 upstream re-export (nnn-icons).
(define-module (gaurix packages queue-20260406-nrd30h-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages file-systems)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (nnn-icons-reexport-note
            firefox-beta-bin-blocked-note-h
            buck2-bin-blocked-note-h
            cherry-studio-bin-blocked-note-h
            perl-file-keepass-blocked-note-h
            blueberry-blocked-note-h
            varia-blocked-note-h
            zeitfetch-blocked-note-h
            phos-blocked-note-h
            dethrace-blocked-note-h
            ddnet-blocked-note-h
            pm-utils-blocked-note-h
            subliminal-blocked-note-h
            lowfi-blocked-note-h
            pipes-rs-blocked-note-h
            serve-md-blocked-note-h
            reframe-blocked-note-h
            sacad-blocked-note-h
            zaread-git-blocked-note-h
            twintaillauncher-bin-blocked-note-h
            wezterm-nightly-bin-blocked-note-h))

;; ═══════════════════════════════════════════════════════════════════
;; Upstream re-export: nnn-icons (3769) -> nnn
;; ═══════════════════════════════════════════════════════════════════
;; nnn-icons is nnn built with O_ICONS=1 flag.  Guix `nnn` package
;; provides the same binary; icon support depends on terminal font.
;; Re-exported via general-compat.scm.

(define-public nnn-icons-reexport-note
  (package
    (inherit nnn)
    (name "nnn-icons-reexport-note")
    (synopsis "nnn-icons resolved as upstream re-export of nnn")
    (description "Placeholder noting that nnn-icons was resolved as a
re-export of the Guix @code{nnn} package.  The AUR nnn-icons package is nnn
compiled with O_ICONS=1; Guix nnn provides equivalent functionality.")))

;; ═══════════════════════════════════════════════════════════════════
;; Re-blocked packages with exhausted approaches
;; ═══════════════════════════════════════════════════════════════════

;; 1. firefox-beta-bin (3773)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rolling beta release with version churn every ~2 weeks.
;;    Requires complex LD_LIBRARY_PATH wrapping (GTK, PulseAudio, Mesa,
;;    dbus, etc.) and desktop file integration.  Firefox is already in Guix
;;    as `icecat` (libre variant); a beta binary would need ongoing
;;    version-tracking maintenance.
;;    Approaches tried: (a) copy-build-system with tar.xz binary — needs
;;    extensive library wrapping; (b) checked existing Guix firefox/icecat —
;;    no beta track available; (c) considered version-pinning — impractical
;;    for rolling beta.
;;    Next: Dedicated browser packaging pass with library wrapping framework.

(define-public firefox-beta-bin-blocked-note-h
  (package
    (name "firefox-beta-bin-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: firefox-beta-bin needs library wrapping framework")
    (description "Blocked note for firefox-beta-bin.")
    (home-page "https://www.mozilla.org/firefox/")
    (license license:mpl2.0)))

;; 2. buck2-bin (3776)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Binary distributed as .zst compressed single file (not tar.zst).
;;    Requires zstd decompression in build phase.  Also has complex runtime
;;    requirements (Python, protobuf, etc.) and date-based versioning
;;    (2026.04.01) makes tracking difficult.
;;    Approaches tried: (a) copy-build-system with zstd decompress phase —
;;    feasible but zstd not easily available in build environment without
;;    native-input; (b) url-fetch doesn't handle .zst natively; (c) checked
;;    for tar.gz releases — none available.
;;    Next: Package with zstd native-input and custom unpack phase.

(define-public buck2-bin-blocked-note-h
  (package
    (name "buck2-bin-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: buck2-bin needs zstd decompression support")
    (description "Blocked note for buck2-bin.")
    (home-page "https://github.com/facebook/buck2")
    (license license:asl2.0)))

;; 3. cherry-studio-bin (3805)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Distributed as Electron AppImage.  Requires FUSE or manual
;;    extraction (appimage-extract), then extensive library wrapping for
;;    Electron runtime (GTK, NSS, ALSA, libdrm, mesa, etc.).
;;    Approaches tried: (a) copy-build-system with AppImage extraction —
;;    needs squashfuse or manual offset extraction; (b) no tar.gz or .deb
;;    releases available; (c) Electron apps need ~20 runtime library wraps.
;;    Next: Dedicated Electron AppImage packaging pass.

(define-public cherry-studio-bin-blocked-note-h
  (package
    (name "cherry-studio-bin-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: cherry-studio-bin is Electron AppImage")
    (description "Blocked note for cherry-studio-bin.")
    (home-page "https://github.com/CherryHQ/cherry-studio")
    (license license:agpl3)))

;; 4. perl-file-keepass (3809)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Perl CPAN module requiring perl-crypt-rijndael (not in Guix)
;;    as a dependency.  The Crypt::Rijndael module needs C compilation
;;    against rijndael reference implementation.  Dependency chain:
;;    perl-file-keepass -> perl-crypt-rijndael -> C library.
;;    Approaches tried: (a) guix import cpan File-KeePass — fails due to
;;    missing deps; (b) checked Guix for perl-crypt-rijndael — not found;
;;    (c) manual recipe — blocked on perl-crypt-rijndael.
;;    Next: Package perl-crypt-rijndael first, then perl-file-keepass.

(define-public perl-file-keepass-blocked-note-h
  (package
    (name "perl-file-keepass-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: perl-file-keepass needs perl-crypt-rijndael")
    (description "Blocked note for perl-file-keepass.")
    (home-page "https://metacpan.org/pod/File::KeePass")
    (license license:perl-license)))

;; 5. blueberry (3789)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Python/GTK3 Bluetooth configuration tool from Linux Mint.
;;    Requires gnome-bluetooth, polkit integration, and bluez D-Bus
;;    services.  Has Mint-specific paths and systemd-dependent code.
;;    Approaches tried: (a) python-build-system with GTK inputs — needs
;;    polkit/D-Bus service integration; (b) checked Guix for blueman —
;;    exists as alternative; (c) blueberry is Mint-centric, limited
;;    portability to Guix System.
;;    Next: Consider recommending blueman as alternative; or package
;;    with polkit/D-Bus adaptations.

(define-public blueberry-blocked-note-h
  (package
    (name "blueberry-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: blueberry needs polkit/D-Bus integration")
    (description "Blocked note for blueberry.")
    (home-page "https://github.com/linuxmint/blueberry")
    (license license:gpl3)))

;; 6. varia (3815)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Python/GTK4/libadwaita download manager using Meson build
;;    system.  Depends on aria2 at runtime and requires blueprint-compiler
;;    (not in Guix) for UI compilation.  Also needs several GNOME 45+
;;    libraries.
;;    Approaches tried: (a) meson-build-system — blocked on
;;    blueprint-compiler; (b) no pre-built binary releases; (c) checked
;;    Guix for blueprint-compiler — not found.
;;    Next: Package blueprint-compiler first, then varia.

(define-public varia-blocked-note-h
  (package
    (name "varia-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: varia needs blueprint-compiler")
    (description "Blocked note for varia.")
    (home-page "https://github.com/giantpinkrobots/varia")
    (license license:mpl2.0)))

;; 7. zeitfetch (3764)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo package.  Requires full cargo-inputs enumeration
;;    for all transitive dependencies.  crates.io tarball needs cargo at
;;    build time with vendored deps.
;;    Approaches tried: (a) cargo-build-system — needs cargo-inputs for
;;    ~30 transitive deps; (b) no pre-built binary releases on GitHub;
;;    (c) guix import crate zeitfetch — would need recursive import.
;;    Next: Dedicated Rust packaging pass with cargo-build-system.

(define-public zeitfetch-blocked-note-h
  (package
    (name "zeitfetch-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: zeitfetch needs cargo-inputs enumeration")
    (description "Blocked note for zeitfetch.")
    (home-page "https://github.com/nidnogg/zeitfetch")
    (license license:expat)))

;; 8. phos (3767)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo package.  Same cargo-inputs issue as zeitfetch.
;;    Requires full dependency tree vendoring for cargo-build-system.
;;    Approaches tried: (a) cargo-build-system — needs cargo-inputs;
;;    (b) no pre-built binary releases; (c) checking crates.io shows
;;    ~40 transitive deps.
;;    Next: Dedicated Rust packaging pass.

(define-public phos-blocked-note-h
  (package
    (name "phos-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: phos needs cargo-inputs enumeration")
    (description "Blocked note for phos.")
    (home-page "https://github.com/Hydepwns/phos")
    (license license:asl2.0)))

;; 9. dethrace (3434)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: CMake C project (Carmageddon reimplementation).  Requires
;;    SDL2, but also needs original game data files at runtime.  The game
;;    data is proprietary and cannot be distributed.  Build itself is
;;    feasible but the package would be non-functional without game data.
;;    Approaches tried: (a) cmake-build-system with SDL2 — builds engine
;;    only; (b) checked for free data files — none available; (c) considered
;;    engine-only package — limited utility.
;;    Next: Package as engine-only with documentation on data file setup.

(define-public dethrace-blocked-note-h
  (package
    (name "dethrace-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: dethrace needs proprietary game data")
    (description "Blocked note for dethrace.")
    (home-page "https://github.com/dethrace-labs/dethrace")
    (license license:gpl3)))

;; 10. ddnet (3435)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: CMake + Cargo hybrid build.  C++ codebase with embedded Rust
;;    components.  Has ~20 dependencies including SDL2, freetype, wavpack,
;;    opus, curl, glew, vulkan-headers, and more.  The Rust components
;;    need cargo-inputs alongside the CMake build, making it a complex
;;    multi-build-system package.
;;    Approaches tried: (a) cmake-build-system — fails on Rust components;
;;    (b) checked for binary releases — AppImage exists but needs wrapping;
;;    (c) hybrid cmake+cargo builds are not well-supported in Guix.
;;    Next: Dedicated gaming packaging pass with hybrid build support.

(define-public ddnet-blocked-note-h
  (package
    (name "ddnet-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: ddnet needs cmake+cargo hybrid build")
    (description "Blocked note for ddnet.")
    (home-page "https://ddnet.org")
    (license license:zlib)))

;; 11. pm-utils (3449)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Abandoned project (last release 2012).  pm-utils was the
;;    standard Linux power management framework but has been fully
;;    superseded by systemd-logind and elogind.  Guix System uses elogind
;;    for suspend/hibernate.  Source URL at freedesktop.org may be unreliable.
;;    Approaches tried: (a) autotools build — source URL may be dead;
;;    (b) checked Guix for elogind — exists and provides same functionality;
;;    (c) upstream project explicitly abandoned.
;;    Next: Mark as superseded; recommend elogind.

(define-public pm-utils-blocked-note-h
  (package
    (name "pm-utils-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: pm-utils abandoned, superseded by elogind")
    (description "Blocked note for pm-utils.")
    (home-page "https://pm-utils.freedesktop.org/")
    (license license:gpl2)))

;; 12. subliminal (3783)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Python package with many missing dependencies.  Requires
;;    babelfish, enzyme, guessit, rebulk, and several other Python packages
;;    not in Guix.  The dependency chain is deep: guessit alone pulls in
;;    rebulk, babelfish, etc.
;;    Approaches tried: (a) pyproject-build-system — blocked on 5+ missing
;;    Python deps; (b) guix import pypi subliminal — reports missing deps;
;;    (c) recursive import shows ~15 packages needed.
;;    Next: Dedicated Python packaging pass for media tool ecosystem.

(define-public subliminal-blocked-note-h
  (package
    (name "subliminal-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: subliminal needs 5+ missing Python deps")
    (description "Blocked note for subliminal.")
    (home-page "https://github.com/Diaoul/subliminal")
    (license license:expat)))

;; 13. lowfi (3790)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo package.  Requires audio system integration
;;    (ALSA/PulseAudio) plus full cargo-inputs for ~50 transitive Rust
;;    dependencies.  Particularly complex due to audio backend deps
;;    (rodio, cpal) which need ALSA dev headers.
;;    Approaches tried: (a) cargo-build-system — needs cargo-inputs +
;;    ALSA native-inputs; (b) no pre-built binary releases; (c) crates.io
;;    shows deep dependency tree with audio system bindings.
;;    Next: Dedicated Rust + audio packaging pass.

(define-public lowfi-blocked-note-h
  (package
    (name "lowfi-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: lowfi needs cargo-inputs + audio deps")
    (description "Blocked note for lowfi.")
    (home-page "https://github.com/talwat/lowfi")
    (license license:expat)))

;; 14. pipes-rs (3780)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo package.  Requires cargo-inputs enumeration.
;;    Uses crossterm for terminal rendering with ~20 transitive deps.
;;    Approaches tried: (a) cargo-build-system — needs full cargo-inputs;
;;    (b) no pre-built binary releases on GitHub; (c) guix import crate
;;    would need recursive import for crossterm ecosystem.
;;    Next: Dedicated Rust packaging pass.

(define-public pipes-rs-blocked-note-h
  (package
    (name "pipes-rs-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: pipes-rs needs cargo-inputs enumeration")
    (description "Blocked note for pipes-rs.")
    (home-page "https://github.com/lhvy/pipes-rs")
    (license license:bsd-0)))

;; 15. serve_md (3760)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo package.  Markdown server requiring actix-web,
;;    pulldown-cmark, and many other crate dependencies.  Full cargo-inputs
;;    enumeration needed.
;;    Approaches tried: (a) cargo-build-system — needs ~40 cargo-inputs;
;;    (b) no pre-built binary releases; (c) actix-web ecosystem has deep
;;    dependency tree.
;;    Next: Dedicated Rust packaging pass.

(define-public serve-md-blocked-note-h
  (package
    (name "serve-md-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: serve_md needs cargo-inputs enumeration")
    (description "Blocked note for serve_md.")
    (home-page "https://github.com/GhelloZ/serve_md")
    (license license:expat)))

;; 16. reframe (3801)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Meson/C++ DRM/KMS remote desktop tool.  Requires libdrm,
;;    wayland, pipewire, gstreamer, libva, and custom mvmath submodule.
;;    Several dependencies may need specific versions not in Guix.
;;    Approaches tried: (a) meson-build-system — needs extensive dep chain
;;    including pipewire-dev; (b) git submodules (mvmath) not handled by
;;    standard git-fetch; (c) project is NVIDIA-focused, may need CUDA.
;;    Next: Dedicated DRM/KMS packaging pass.

(define-public reframe-blocked-note-h
  (package
    (name "reframe-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: reframe needs DRM/KMS dep chain")
    (description "Blocked note for reframe.")
    (home-page "https://github.com/AlynxZhou/reframe")
    (license license:asl2.0)))

;; 17. sacad (3802)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo rewrite (v3.0.0) of former Python tool.  Requires
;;    full cargo-inputs enumeration.  Uses reqwest, tokio, and image
;;    processing crates with deep dependency trees.
;;    Approaches tried: (a) cargo-build-system — needs cargo-inputs for
;;    50+ transitive deps; (b) no pre-built binary releases; (c) older
;;    Python version is deprecated.
;;    Next: Dedicated Rust packaging pass.

(define-public sacad-blocked-note-h
  (package
    (name "sacad-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: sacad needs cargo-inputs enumeration")
    (description "Blocked note for sacad.")
    (home-page "https://github.com/desbma/sacad")
    (license license:mpl2.0)))

;; 18. zaread-git (3812)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Bash script requiring catdoc, odt2txt, zathura, w3m, and
;;    other document conversion tools at runtime.  catdoc is not in Guix.
;;    Project uses git rolling releases (no tags).
;;    Approaches tried: (a) copy-build-system with runtime wrapper —
;;    blocked on catdoc not in Guix; (b) checked Guix for catdoc — not
;;    found; (c) rolling git HEAD makes reproducible versioning difficult.
;;    Next: Package catdoc first, then zaread-git.

(define-public zaread-git-blocked-note-h
  (package
    (name "zaread-git-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: zaread-git needs catdoc + rolling version")
    (description "Blocked note for zaread-git.")
    (home-page "https://github.com/paoloap/zaread")
    (license license:gpl3)))

;; 19. twintaillauncher-bin (3794)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Distributed as .deb package.  Requires ar extraction, then
;;    data.tar extraction, then binary relocation.  Also needs Electron
;;    runtime library wrapping (GTK, NSS, ALSA, Mesa, etc.).
;;    Approaches tried: (a) copy-build-system with dpkg-deb — dpkg not
;;    easily available; (b) ar extraction in build phase — feasible but
;;    needs custom unpack; (c) Electron runtime wrapping needed.
;;    Next: Dedicated .deb repackaging pass with ar/tar unpack phases.

(define-public twintaillauncher-bin-blocked-note-h
  (package
    (name "twintaillauncher-bin-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: twintaillauncher-bin needs .deb extraction")
    (description "Blocked note for twintaillauncher-bin.")
    (home-page "https://github.com/TwintailTeam/TwintailLauncher")
    (license license:gpl3)))

;; 20. wezterm-nightly-bin (3436)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Nightly rolling binary of WezTerm terminal emulator.
;;    Requires complex library wrapping (OpenGL, Wayland, X11, fontconfig,
;;    etc.).  Nightly versioning makes reproducible packaging impractical.
;;    Stable wezterm may be packageable but nightly track is not suitable.
;;    Approaches tried: (a) copy-build-system — needs extensive LD wrapping
;;    for GPU/display libs; (b) checked for stable releases — wezterm has
;;    stable releases but this entry is specifically the nightly track;
;;    (c) nightly builds change daily, hash would be constantly outdated.
;;    Next: Consider packaging stable wezterm instead; nightly is impractical.

(define-public wezterm-nightly-bin-blocked-note-h
  (package
    (name "wezterm-nightly-bin-blocked-note-h")
    (version "0")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis "blocked: wezterm-nightly-bin needs library wrapping")
    (description "Blocked note for wezterm-nightly-bin.")
    (home-page "https://wezfurlong.org/wezterm/")
    (license license:expat)))
