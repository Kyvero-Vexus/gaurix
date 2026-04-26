;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426e
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (3):
;;;   1. python-uhid (pure Python Linux UHID kernel interface wrapper)
;;;   2. fido2-hid-bridge (FIDO2 HID-to-PCSC bridge for NFC/smartcard authenticators)
;;;   3. sommelier (ChromeOS Wayland/X11 nested compositor)
;;;
;;; Remaining BLOCKED: 97 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260426e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:export (python-uhid
            fido2-hid-bridge
            sommelier))


;;; ---- 1. python-uhid ----
;;; Pure-Python wrapper for the Linux UHID kernel interface.
;;; Upstream: https://github.com/FFY00/python-uhid
;;; PyPI: https://pypi.org/project/uhid/
;;; Build: pyproject (setuptools backend)
;;; License: MIT
;;; Required as dependency for fido2-hid-bridge.

(define-public python-uhid
  (package
    (name "python-uhid")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "uhid" version))
       (sha256
        (base32 "1awsyp0cs1rrqzaff6liy4z1pg0zr0d0vhxj3xi37gqdi64j8y1w"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need /dev/uhid access
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/FFY00/python-uhid")
    (synopsis "Python wrapper for the Linux UHID kernel interface")
    (description "Python-uhid provides a Pythonic interface to the Linux UHID
(User-space HID) kernel subsystem.  It allows creating virtual HID devices
from user space, which is useful for testing, bridging, and emulating HID
hardware.")
    (license license:expat)))


;;; ---- 2. fido2-hid-bridge ----
;;; Bridges FIDO2 CTAP2.1 commands from virtual USB-HID to PC/SC
;;; authenticators (NFC/smartcard).  Enables Firefox/Chrome to use
;;; non-USB FIDO2 authenticators.
;;; Upstream: https://github.com/BryanJacobs/fido2-hid-bridge
;;; Build: pyproject (poetry-core backend)
;;; License: MIT
;;; Resolves AUR fido2-hid-bridge.

(define-public fido2-hid-bridge
  (let ((commit "52d0911054e74f22c4e9e726e8bc24a72cda178d")
        (revision "0"))
    (package
      (name "fido2-hid-bridge")
      (version (string-append "0.1.0-" revision "." (string-take commit 7)))
      (source
       (origin
         (method url-fetch)
         (uri (string-append
               "https://github.com/BryanJacobs/fido2-hid-bridge/archive/"
               commit ".tar.gz"))
         (file-name (string-append name "-" version ".tar.gz"))
         (sha256
          (base32 "0fz1rz51jspbqi4ibwfx3yv2cwxpmv5nx69dnwx04sqbrrbnfl53"))))
      (build-system pyproject-build-system)
      (arguments
       (list #:tests? #f))  ;; no test suite; runtime needs /dev/uhid
      (native-inputs (list python-poetry-core))
      (propagated-inputs (list python-uhid python-fido2 python-pyscard))
      (home-page "https://github.com/BryanJacobs/fido2-hid-bridge")
      (synopsis "FIDO2 HID-to-PCSC bridge for NFC and smartcard authenticators")
      (description "Fido2-hid-bridge creates a virtual USB-HID FIDO2 device on
Linux that forwards CTAP2.1 commands to a PC/SC authenticator.  This allows
applications like Firefox and Chrome that only support USB-HID to use NFC
authenticators or smartcards for WebAuthn and FIDO2.")
      (license license:expat))))


;;; ---- 3. sommelier ----
;;; Nested Wayland compositor from ChromeOS that provides X11 forwarding
;;; via Xwayland.  Useful for running X11 applications under a Wayland
;;; compositor in a sandboxed or virtualized environment.
;;; Upstream: https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/vm_tools/sommelier
;;; Build: meson
;;; License: BSD-3-Clause (ChromiumOS)
;;; Resolves AUR sommelier-git.

(define-public sommelier
  (package
    (name "sommelier")
    (version "0.0.1-5b0b986")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://chromium.googlesource.com/chromiumos/platform2"
             "/+archive/5b0b98611e1960460b9aa35b92549fe6b1039d7f"
             "/vm_tools/sommelier.tar.gz"))
       (sha256
        (base32 "0qccpf7dikgimqxfyg9p49hkmggwwdcykz52skxfz908slqlv4gg"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list (string-append "-Dxwayland_path="
                             (search-input-file %build-inputs
                                                "bin/Xwayland"))
              "-Dxwayland_gl_driver_path=/run/current-system/profile/lib"
              "-Dwith_tests=false"
              "-Dtracing=false"
              "-Dgamepad=false"
              "-Dquirks=false")
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              ;; googlesource +archive tarballs have no wrapper directory.
              ;; The default unpack phase gets confused and chdirs into the
              ;; first subdirectory it finds.  Extract into a fresh directory
              ;; and chdir there instead.
              (mkdir "source")
              (with-directory-excursion "source"
                (invoke "tar" "xzf" source))
              (chdir "source"))))))
    (native-inputs
     (list pkg-config
           python
           python-jinja2
           wayland))  ;; for wayland-scanner
    (inputs
     (list libdrm
           mesa  ;; provides gbm
           pixman
           wayland
           libxcb
           libxkbcommon
           xorg-server-xwayland))
    (home-page
     "https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/vm_tools/sommelier")
    (synopsis "Nested Wayland compositor with X11 forwarding via Xwayland")
    (description "Sommelier is a nested Wayland compositor from ChromeOS that
delegates compositing to a host Wayland compositor.  It provides X11
application support through an integrated Xwayland instance, making it useful
for running legacy X11 applications in a Wayland environment with window
management integration.")
    (license license:bsd-3)))
