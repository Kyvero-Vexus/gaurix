;;; Blocked notes for cron-c79f127f worker w05.
(define-module (gaurix packages cron-c79f127f-w05-blocked-notes)
  #:export (cron-c79f127f-w05-blocked-notes))

(define-public cron-c79f127f-w05-blocked-notes
  '(("samsung-unified-driver-common"
     "NO_CANONICAL_SOURCE"
     "A1: repo scan (rg define-public/specification->package) found no package definition in guix/gaurix/packages. A2: scripts/fetch-aur-pkgbuild.sh samsung-unified-driver-common failed after cloning an empty AUR git repository (no PKGBUILD/.SRCINFO). A3: source probe (AUR remote refs + manual upstream discovery) did not yield a stable release artifact with verifiable checksum metadata."
     "Unable to identify a reproducible upstream source tarball or maintained distro recipe to derive one."
     "Needs a canonical upstream URL (or maintained package recipe) plus checksum/licensing metadata before Guix packaging.")
    ("gtk-sharp-2"
     "MISSING_MONO_STACK_BUILD_INPUT"
     "A1: repo scan found no existing gtk-sharp-2 package definition in guix/gaurix/packages. A2: scripts/fetch-aur-pkgbuild.sh gtk-sharp-2 succeeded; PKGBUILD requires source tarball plus two patches and makedepends on monodoc. A3: dependency probe (guix package -A '^monodoc$' and local package scan) returned no monodoc package candidate in this channel snapshot."
     "Packaging path depends on mono documentation/tooling inputs and carrying AUR patch set; missing monodoc blocks clean build parity with the recipe."
     "Revisit with dedicated mono stack pass: package/alias monodoc (or patch out docs generation), vendor the two patches with fixed hashes, and run full build validation.")))
