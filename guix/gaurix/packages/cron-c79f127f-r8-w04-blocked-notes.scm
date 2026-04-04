;;; Blocker notes for blocked-tree run cron-c79f127f worker w04 (round 8).
(define-module (gaurix packages cron-c79f127f-r8-w04-blocked-notes)
  #:export (cron-c79f127f-r8-w04-blocked-notes))

(define cron-c79f127f-r8-w04-blocked-notes
  (list
   (list "mozc-ut-full-common" "COMPLEX_BUILD_SYSTEM"
         "A1: guix show mozc and guix search mozc return no results; no upstream Guix package exists."
         "A2: AUR PKGBUILD requires Bazel build system with patched BUILD.bazel, custom dictionary data merging, and fcitx5 integration patches."
         "A3: Bazel is not packaged in Guix; the build involves 100+ third-party deps fetched at build time (googleapis, abseil, icu, protobuf pinned versions), custom dictionary UT data from multiple sources, and heavy patching of Bazel workspace files. Cannot be replicated without a Bazel bootstrap effort.")))
