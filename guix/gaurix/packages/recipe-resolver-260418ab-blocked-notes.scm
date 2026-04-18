;;; recipe-resolver-260418ab --- blocked notes
;;;
;;; Packages evaluated and found to be infeasible for Guix packaging.
;;;
;;; 31. komet (#5169)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED: UPSTREAM_404
;;;   Upstream: github.com/nicholasstephan/komet returns 404
;;;   Attempts:
;;;     A1: checked github.com/nicholasstephan/komet — repo deleted or renamed
;;;     A2: searched GitHub for "komet" — multiple unrelated projects, none matching
;;;     A3: checked AUR PKGBUILD source — points to deleted repo
;;;   Verdict: upstream repository no longer exists; cannot package
;;;
;;; 32. dause (#5173)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED: UPSTREAM_404
;;;   Upstream: github.com/nicholasgasior/dause returns 404
;;;   Attempts:
;;;     A1: checked github.com/nicholasgasior/dause — repo deleted
;;;     A2: searched GitHub for "dause" — no matching project found
;;;     A3: checked web archives — no cached copies of source
;;;   Verdict: upstream repository deleted; cannot package
;;;
;;; 33. agave (#5093)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED: DEAD_UPSTREAM
;;;   Upstream: original at gna.org (dead since 2017); agave2 at github.com/jonner/agave2 (archived)
;;;   Attempts:
;;;     A1: checked gna.org — hosting platform permanently shut down
;;;     A2: checked github.com/jonner/agave2 — archived rewrite, no releases, GTK3 port incomplete
;;;     A3: searched for mirrors/forks — no maintained fork found
;;;   Verdict: abandonware with dead hosting; cannot package
;;;
;;; 34. proslenkey (#5187)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM
;;;   Upstream: AUR page blocked by Anubis anti-bot protection; no GitHub/GitLab matches
;;;   Attempts:
;;;     A1: checked AUR page — blocked by Anubis challenge
;;;     A2: searched GitHub for "proslenkey" — no results
;;;     A3: searched web for "proslenkey linux" — no upstream found
;;;   Verdict: cannot determine source repository; cannot package
;;;
;;; 35. linux-firmware-git (#3551)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED: NONFREE_FIRMWARE
;;;   Upstream: gitlab.com/kernel-firmware/linux-firmware
;;;   Attempts:
;;;     A1: verified source — contains non-free proprietary firmware blobs
;;;     A2: checked Guix policy — Guix is a free software distribution, nonfree content excluded
;;;     A3: verified — already available in nonguix channel as linux-firmware
;;;   Verdict: non-free content; belongs in nonguix channel, not Gaurix
;;;
;;; 36. freedownloadmanager-bin (#5029)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY
;;;   Upstream: freedownloadmanager.org
;;;   Attempts:
;;;     A1: checked license — proprietary closed-source since version 5.0
;;;     A2: checked for source availability — none; binary-only .deb packages
;;;     A3: checked old versions — v2.5-3.9.7 were GPL but too outdated to be useful
;;;   Verdict: proprietary software with no source code; cannot package
;;;
;;; 37. pacolog (#5092)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC
;;;   Upstream: gitlab.com/protist/pacolog
;;;   Attempts:
;;;     A1: reviewed source — Bash script that lists recent commits for Arch packages
;;;     A2: checked dependencies — requires pacman and Arch package database
;;;     A3: assessed portability — tool is entirely Arch Linux-specific, no value on Guix
;;;   Verdict: Arch Linux-specific tool; useless on Guix System
;;;
;;; 38. roboclaw-studio-git (#5012)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM
;;;   Upstream: AUR page blocked; claimed source github.com/lazytatzv/motion_studio not verified
;;;   Attempts:
;;;     A1: checked AUR page — blocked by Anubis challenge
;;;     A2: checked github.com/lazytatzv/motion_studio — may not exist or be correct
;;;     A3: searched GitHub for "roboclaw-studio" — no matching repository
;;;   Verdict: cannot verify upstream repository; cannot package
