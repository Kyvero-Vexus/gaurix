;;; Blocker notes for blocked-tree run cron-c79f127f worker w02.
(define-module (gaurix packages cron-c79f127f-w02-blocked-notes)
  #:export (cron-c79f127f-w02-blocked-notes))

(define cron-c79f127f-w02-blocked-notes
  (list
   (list "nvidia-utils-beta" "BINARY_DRIVER_RECIPE_PENDING"
         "A1: guix show/search found no nvidia-utils-beta or comparable proprietary nvidia-utils package in this checkout."
         "A2: reviewed AUR PKGBUILD: split packaging for nvidia-utils-beta/opencl-nvidia-beta/nvidia-settings-beta with custom extraction, linker symlink generation, udev/sysusers/systemd integration."
         "A3: validated upstream .run payload availability (HTTP 200, 422,873,955 bytes); packaging still requires a dedicated nonfree binary-driver recipe pass not completed in this chunk.")
   (list "yay" "MISSING_CORE_DEPENDENCY"
         "A1: guix show yay and guix show pacman both fail (package not found), and guix search libalpm returns no provider."
         "A2: AUR PKGBUILD requires pacman>6.1 and CGO-enabled Go build path tied to libalpm."
         "A3: upstream source build attempts fail: CGO_ENABLED=1 errors on missing alpm.h; CGO_ENABLED=0 still fails with undefined alpm symbols.")))
