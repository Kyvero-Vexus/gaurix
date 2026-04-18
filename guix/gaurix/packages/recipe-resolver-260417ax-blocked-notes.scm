;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; recipe-resolver-260417ax blocked notes (2026-04-18)
;;;
;;; 11 packages blocked with exhaustion notes:
;;;
;;; 1. howdoi (TODO 23258)
;;;    MISSING_DEP: Python CLI requires python-keep (not packaged in Guix).
;;;    A1: Package python-keep first — unknown dep chain depth.
;;;    A2: Patch out keep dep — would break personal snippet storage.
;;;    A3: Skip — niche tool, alternatives exist (man, tldr).
;;;
;;; 2. rsvndump (TODO 15801)
;;;    SOURCE_UNAVAILABLE: Download failed from both GitHub and SourceForge.
;;;    Last release v0.6.2 from 2015. Project appears abandoned.
;;;    A1: GitHub archive URL 404.
;;;    A2: SourceForge download times out / fails.
;;;    A3: Needs subversion-dev; limited user base.
;;;
;;; 3. arcticons-icon-theme (TODO 18539)
;;;    SOURCE_UNAVAILABLE: Codeberg URL returns 404.
;;;    Repository namespace may have changed from ArcticonsDesign to another org.
;;;    A1: Codeberg archive 404.
;;;    A2: No GitHub mirror found.
;;;    A3: Search for new namespace — could not resolve during pass.
;;;
;;; 4. nwg-wrapper (TODO 26837)
;;;    SOURCE_UNAVAILABLE: GitHub download failed for all release tags.
;;;    Possible rate limiting or repository restructuring.
;;;    A1: guix download fails.
;;;    A2: curl -L fails for v0.1.4, v0.1.5.
;;;    A3: Retry in next pass with different network conditions.
;;;
;;; 5. openrgb-udev-rules (TODO 20409)
;;;    SOURCE_UNAVAILABLE: GitLab returns 403 on archive downloads (anti-bot).
;;;    Udev rules file embedded in full OpenRGB source tree.
;;;    A1: GitLab 403 on all archive URLs.
;;;    A2: Package full OpenRGB — significant scope (Qt5/libusb/hidapi).
;;;    A3: Vendor single rules file — no upstream tracking.
;;;
;;; 6. chipwhisperer-udev (TODO 17840)
;;;    IMPRACTICAL_SOURCE: Full ChipWhisperer repo is 85MB.
;;;    Only need single 50-newae.rules file.
;;;    A1: Download 85MB for 1 file — wasteful.
;;;    A2: Vendor rules file from commit — no upstream tracking.
;;;    A3: Contribute to upstream Guix chipwhisperer package.
;;;
;;; 7. ubuntu-wallpapers (TODO 18982)
;;;    SOURCE_TOO_LARGE: Launchpad source tarball is 890MB.
;;;    Impractical for channel distribution.
;;;    A1: Full 890MB download — too large.
;;;    A2: Host subset — license varies per image, unclear redistribution.
;;;    A3: Create desktop config snippet to fetch on demand.
;;;
;;; 8. sddm-lain-wired-theme (TODO 16365)
;;;    UNKNOWN_LICENSE: No license file or declaration in repository.
;;;    Cannot distribute without known license.
;;;    A1: Contact upstream for license clarification.
;;;    A2: Cannot package — license unknown.
;;;    A3: Skip.
;;;
;;; 9. multicolor-sddm-theme (TODO 16219)
;;;    NO_RELEASES_GITLAB_403: No tagged releases; GitLab returns 403.
;;;    A1: Pin to commit — 403 blocks archive download.
;;;    A2: Git clone — GitLab may also block.
;;;    A3: Skip — low demand (1 AUR vote).
;;;
;;; 10. flandre-grub-theme-git (TODO 16531)
;;;     UNKNOWN_LICENSE_SELFHOSTED: Hosted on self-hosted Gitea (git.jamjar.ws).
;;;     No license declaration. Artwork may be copyrighted (Touhou character).
;;;     A1: Contact upstream for license — self-hosted, may not respond.
;;;     A2: Cannot distribute copyrighted artwork.
;;;     A3: Skip.
;;;
;;; 11. catppuccin-mocha-grub-theme-git (TODO 30614)
;;;     VARIANT_MISSING: Mocha variant not found in catppuccin/grub repo.
;;;     Source contains only: frappe, latte, macchiato.
;;;     A1: Check if mocha was removed upstream or renamed.
;;;     A2: Use macchiato as closest alternative (dark warm tones).
;;;     A3: File upstream issue requesting mocha variant.
