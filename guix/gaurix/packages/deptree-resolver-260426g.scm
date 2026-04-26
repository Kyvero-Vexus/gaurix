;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426g
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (2):
;;;   1. librewolf-extension-ublock-origin-bin (uBlock Origin for LibreWolf)
;;;   2. vivaldi-autoinject-custom-js-ui (manage custom JS UI mods for Vivaldi)
;;;
;;; Remaining BLOCKED: 98 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260426g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages m4)
  #:export (librewolf-extension-ublock-origin-bin
            vivaldi-autoinject-custom-js-ui))


;;; ---- 1. librewolf-extension-ublock-origin-bin ----
;;; uBlock Origin content blocker for LibreWolf.
;;; Upstream: https://github.com/gorhill/uBlock
;;; The package downloads the signed .xpi from GitHub Releases and installs it
;;; to LibreWolf's system-wide extensions directory so it is available to all
;;; users without manual browser-side installation.
;;; License: GPL-3.0-only

(define-public librewolf-extension-ublock-origin-bin
  (package
    (name "librewolf-extension-ublock-origin-bin")
    (version "1.69.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gorhill/uBlock/releases/download/"
             version "/uBlock0_" version ".firefox.signed.xpi"))
       (sha256
        (base32 "1kvj2kwwiih7yqiirqha7xfvip4vzrgyqr4rjjhaiyi5ibkcsnvq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("uBlock0@raymondhill.net.xpi"
           "lib/librewolf/browser/extensions/uBlock0@raymondhill.net.xpi"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "uBlock0@raymondhill.net.xpi"))))))
    (home-page "https://github.com/gorhill/uBlock")
    (synopsis "Efficient content blocker for LibreWolf")
    (description "UBlock Origin is a wide-spectrum content blocker for
LibreWolf.  It blocks ads, trackers, and malware sites using curated filter
lists.  This package installs the extension system-wide so it is available
to all LibreWolf users on the system.")
    (license license:gpl3)))


;;; ---- 2. vivaldi-autoinject-custom-js-ui ----
;;; Manage custom JavaScript UI mods for the Vivaldi web browser.
;;; Upstream: https://github.com/budlabs/vivaldi-autoinject-custom-js-ui
;;; Build: GNU make + gawk + m4 (bashbud framework generates monolithic script)
;;; License: BSD-2-Clause

(define-public vivaldi-autoinject-custom-js-ui
  (package
    (name "vivaldi-autoinject-custom-js-ui")
    (version "2023.09.05.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/budlabs/vivaldi-autoinject-custom-js-ui")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1crsqwbyjr661zsmga4scz8iba5jjncbrf035lfl745924ir0afm"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key make-flags #:allow-other-keys)
              (apply invoke "make" "install" make-flags))))))
    (native-inputs (list gawk m4))
    (inputs (list bash-minimal))
    (home-page "https://github.com/budlabs/vivaldi-autoinject-custom-js-ui")
    (synopsis "Manage custom JS UI mods for the Vivaldi web browser")
    (description "A command-line tool to manage custom JavaScript UI
modifications for the Vivaldi web browser.  It allows adding, listing, and
removing custom JS files that are injected into Vivaldi's UI layer.")
    (license license:bsd-2)))
