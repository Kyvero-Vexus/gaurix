;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424a
;;; Resolves 2 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (1):
;;;      1.  openfortivpn-webview-qt (cmake-build-system, v1.3.0, license:expat)
;;;
;;; Compat aliases (1):
;;;      1.  vscodium-electron -> vscodium (nongnu)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260424a)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages qt)
  #:use-module (nongnu packages editors)
  #:export (openfortivpn-webview-qt
            vscodium-electron))

;;; -- openfortivpn-webview-qt --
;;; Qt6 application for SAML single sign-on with openfortivpn.
;;; Previously BLOCKED as MISSING_DEP (Qt WebEngine), but Guix has qtwebengine 6.9.3.
;;; Source: https://github.com/gm-vm/openfortivpn-webview
;;; Build: cmake, requires Qt6 Core/Gui/Widgets/WebEngineWidgets

(define-public openfortivpn-webview-qt
  (package
    (name "openfortivpn-webview-qt")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gm-vm/openfortivpn-webview")
                    (commit (string-append "v" version "-qt"))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_PREFIX_PATH="
                                  #$(this-package-input "qtbase")
                                  ";" #$(this-package-input "qtwebengine")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-qt
                 (lambda _
                   (chdir "openfortivpn-webview-qt")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "openfortivpn-webview" bin)))))))
    (inputs (list qtbase qtwebengine))
    (synopsis "SAML single sign-on helper for openfortivpn (Qt version)")
    (description "Application to perform the SAML single sign-on and retrieve
the SVPNCOOKIE needed by openfortivpn.  This is the Qt version using
Qt6 WebEngine for the embedded browser.")
    (home-page "https://github.com/gm-vm/openfortivpn-webview")
    (license license:expat)))

;;; -- vscodium-electron --
;;; Compat alias: Guix's vscodium already uses system Electron.
;;; The AUR vscodium-electron package builds VSCodium with system Electron
;;; rather than bundled; Guix's vscodium package does this by default.

(define-public vscodium-electron
  (package
    (inherit vscodium)
    (name "vscodium-electron")))
