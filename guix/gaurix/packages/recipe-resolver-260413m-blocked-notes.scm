;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413m
;;;
;;; 7 packages blocked:
;;;
;;; 1. codex-app-bin (#4080)
;;;    Reason: NOT_TRULY_BINARY
;;;    The AUR "codex-app-bin" package is misleadingly named. It actually clones
;;;    a git repository and builds from source using Node.js, pnpm, and electron.
;;;    It is not a prebuilt binary. Packaging would require electron packaging
;;;    infrastructure which Guix lacks.
;;;    Approaches tried:
;;;      A1: Treat as binary repack — failed, package builds from source
;;;      A2: Use copy-build-system with prebuilt assets — no prebuilt releases exist
;;;      A3: Build from source — requires Electron/Node.js/pnpm build pipeline
;;;
;;; 2. dolphin-anty-bin (#3735)
;;;    Reason: UNVERSIONED_SOURCE
;;;    The download URL (dolphin-anty-cdn.com/anty-app/dolphin-anty-linux-x86_64-latest.rpm)
;;;    always fetches the latest version with no version pinning. This makes
;;;    reproducible builds impossible. Additionally, the software is proprietary.
;;;    Approaches tried:
;;;      A1: Version-pinned URL — no such URL exists
;;;      A2: GitHub releases — no GitHub releases available
;;;      A3: Archive.org snapshot — not archived
;;;
;;; 3. time-desktop-bin (#3956)
;;;    Reason: UNVERSIONED_SOURCE
;;;    The download URL (downloads.time-messenger.ru/desktop/linux/time-desktop-linux-x64.tar.gz)
;;;    is unversioned and always serves the latest build. No version-specific
;;;    download URLs are available, making reproducible builds impossible.
;;;    Approaches tried:
;;;      A1: Version-pinned URL — no versioned URLs found
;;;      A2: GitHub/GitLab releases — not published on any code hosting
;;;      A3: CDN with version path — no versioned CDN paths available
;;;
;;; 4. elephant-symbols-bin (#3578)
;;;    Reason: AUR_REMOVED
;;;    Package does not exist on AUR. The AUR returns "Invalid branch" when
;;;    queried. The upstream project (github.com/abenz1267/elephant) may have
;;;    changed its distribution method or been removed.
;;;
;;; 5. elephant-runner-bin (#3579)
;;;    Reason: AUR_REMOVED
;;;    Package does not exist on AUR. Same situation as elephant-symbols-bin.
;;;
;;; 6. elephant-menus-bin (#3581)
;;;    Reason: AUR_REMOVED
;;;    Package does not exist on AUR. Same situation as elephant-symbols-bin.
;;;
;;; 7. elephant-desktopapplications-bin (#3583)
;;;    Reason: AUR_REMOVED
;;;    Package does not exist on AUR. Same situation as elephant-symbols-bin.

(define-module (gaurix packages recipe-resolver-260413m-blocked-notes))
