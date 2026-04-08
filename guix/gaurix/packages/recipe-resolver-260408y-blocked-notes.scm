;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408y
;;; 4 packages re-evaluated with concrete blocking reasons,
;;; plus 2 packages omitted from recipe module.

(define-module (gaurix packages recipe-resolver-260408y-blocked-notes))

;;; pexip-infinity-connect-bin
;;; AUR: pexip-infinity-connect-bin
;;; URL: https://www.pexip.com/hubfs/dev-assets/infinity-connect-download-files/
;;; Status: BLOCKED — PROPRIETARY_DEPRECATED
;;; Pexip Infinity Connect is a proprietary video conferencing desktop client.
;;; Pexip officially ended support for the Connect desktop app as of November 1,
;;; 2025.  The software is proprietary (commercial license) and deprecated.
;;; Approaches tried:
;;;   A1: locate download URL — found .deb at dl.pexip.com but proprietary
;;;   A2: assess license — commercial proprietary, cannot redistribute
;;;   A3: check alternatives — Pexip recommends WebRTC browser-based access

;;; time-desktop-bin
;;; AUR: time-desktop-bin
;;; URL: unknown
;;; Status: BLOCKED — UPSTREAM_NOT_FOUND
;;; Extensive searching across AUR, GitHub, and the web found no downloadable
;;; package matching "time-desktop-bin".  The AUR PKGBUILD references a
;;; _baseurl variable but the actual upstream download location could not
;;; be verified as available.
;;; Approaches tried:
;;;   A1: search GitHub for "time-desktop" — no matching project found
;;;   A2: search AUR PKGBUILD for source URL — URL pattern uses unknown baseurl
;;;   A3: web search for "time desktop linux" — no matching application found

;;; qfinderpro-bin
;;; AUR: qfinderpro-bin
;;; URL: https://www.qnap.com/en/utilities
;;; Status: BLOCKED — PROPRIETARY_DYNAMIC_URL
;;; QNAP QFinder Pro is a proprietary NAS discovery and management tool.
;;; The download URL is dynamically generated via QNAP's website and cannot
;;; be reliably templated for a Guix recipe.  The software is proprietary.
;;; Approaches tried:
;;;   A1: find direct download URL — QNAP uses dynamic/session-based URLs
;;;   A2: assess license — proprietary commercial software
;;;   A3: check for open-source alternatives — no FOSS equivalent found

;;; kemulatornnmod-bin
;;; AUR: kemulatornnmod-bin
;;; URL: https://github.com/shinovon/KEmulator
;;; Status: BLOCKED — NO_LICENSE
;;; KEmulator nnmod is a J2ME mobile phone emulator.  The GitHub repository
;;; has no LICENSE file and no license declaration in the source code.
;;; Without a clear license, the software cannot be redistributed.
;;; Approaches tried:
;;;   A1: check GitHub repo for license — no LICENSE file, no license in README
;;;   A2: check release page — no license information provided
;;;   A3: assess as JVM wrapper — still requires license for redistribution

;;; naviterm-bin
;;; AUR: naviterm-bin
;;; URL: https://gitlab.com/detoxify92/naviterm
;;; Status: BLOCKED — NO_LICENSE
;;; Naviterm is a terminal file navigator from GitLab.  No license file or
;;; license declaration was found in the repository.  Cannot package without
;;; a clear license.
;;; Approaches tried:
;;;   A1: check GitLab repo for license — no LICENSE file found
;;;   A2: check release assets — no license information provided
;;;   A3: contact upstream — not feasible in batch processing

;;; codex-app-bin
;;; AUR: codex-app-bin
;;; URL: https://github.com/Haleclipse/CodexDesktop-Rebuild
;;; Status: BLOCKED — NO_LICENSE
;;; Codex Desktop App is an unofficial rebuild of OpenAI's Codex GUI.
;;; The repository has no LICENSE file and the software is an unofficial
;;; derivative of OpenAI's product, making redistribution rights unclear.
;;; Approaches tried:
;;;   A1: check GitHub repo — no LICENSE file, unofficial rebuild
;;;   A2: check OpenAI codex CLI (official) — that's Apache-2.0 but different app
;;;   A3: assess redistribution — unclear rights for unofficial derivative
