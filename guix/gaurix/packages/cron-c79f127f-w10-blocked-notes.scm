;;; Blocker notes for blocked-tree run cron-c79f127f worker w10.
(define-module (gaurix packages cron-c79f127f-w10-blocked-notes)
  #:export (cron-c79f127f-w10-blocked-notes))

(define cron-c79f127f-w10-blocked-notes
  (list
   (list "waydroid" "MISSING_DEPENDENCY_CHAIN"
         "A1: guix show/search/package -A probes confirm no waydroid package in the current Guix channel set."
         "A2: AUR PKGBUILD inspection shows required dependencies include python-gbinder and dbus-python (plus lxc/nftables/dnsmasq/python-gobject/gtk3)."
         "A3: guix import pypi gbinder produced a python-gbinder candidate, but upstream setup.py requires pkg-config for libgbinder and guix show libgbinder reports package not found, leaving the dependency chain incomplete.")
   (list "brscan4" "BINARY_RPM_REPACKAGE_PENDING"
         "A1: guix show/search/package -A probes found no existing brscan4/Brother SANE backend package in this checkout."
         "A2: AUR PKGBUILD analysis confirms architecture-specific vendor RPM repackaging plus custom hwdb generation and SANE symlink adjustments."
         "A3: upstream vendor payload probe succeeded (https://download.brother.com/.../brscan4-0.4.11-1.x86_64.rpm returns HTTP 200), but a Guix recipe still needs rpm extraction tooling and udev/hwdb integration work.")))
