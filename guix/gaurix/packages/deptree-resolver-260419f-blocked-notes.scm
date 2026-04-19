;;; Notes for deptree-resolver-260419f
;;; Timestamp: 2026-04-19T08:46:37.636398Z
;;; 1 packages moved to FAILED status
;;; 0 packages resolved
;;;
;;; === FAILED packages (all approaches exhausted) ===
;;; simple-live-app (#17007): FLUTTER_SDK_REQUIRED: Flutter/Dart SDK not available in Guix. 5 approaches exhausted: (1) Source build requires Flutter 3.38+ and Dart SDK — neither packaged in Guix; (2) No upstream releases — README explicitly states no release packages provided, GitHub releases page empty; (3) GitHub Actions CI artifacts exist (linux build ~37MB from 2026-01-23) but are ephemeral (90-day expiry), require authentication, and are not stable source URLs; (4) Flatpak CI workflow exists but last run failed (2025-04-10); (5) AUR simple-live-app-bin v1.8.6 exists but itself depends on non-existent upstream release binaries. No viable packaging path until Flutter SDK is available in Guix or upstream publishes stable Linux release binaries.
