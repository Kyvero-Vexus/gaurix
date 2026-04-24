;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424w
;;; Resolves 81 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (5): dropbox, electron23-bin, realvnc-rvnc-connect,
;;;   n8n, heroku-cli
;;; AUR repo deleted: 3 (dotnet-runtime-5.0-bin, dotnet-runtime-6.0-bin,
;;;   llvm40-libs) — updated to SOURCE_UNAVAILABLE
;;; Remaining BLOCKED: 73 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424w)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system node)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages node)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xml)
  #:export (dropbox
            electron23-bin
            realvnc-rvnc-connect
            n8n
            heroku-cli))


;;; ---- 1. dropbox ----
;;; AUR #2254 -- Proprietary cloud file synchronization client.
;;; Source: Binary tarball from Dropbox CDN.
;;; License: Proprietary (custom)
;;; Hash verified via guix download.

(define-public dropbox
  (package
    (name "dropbox")
    (version "248.4.3576")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://edge.dropboxstatic.com/dbx-releng/client/"
             "dropbox-lnx.x86_64-" version ".tar.gz"))
       (sha256
        (base32 "0id5kzs3na8pclnxb6fyc4g1907mri8z37cl6hf5rk9qgrr2da1z"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "opt/dropbox"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/opt/dropbox/dropbox")
                         (string-append bin "/dropbox"))))))))
    (home-page "https://www.dropbox.com")
    (synopsis "Cloud file synchronization client")
    (description
     "Dropbox is a proprietary cloud-based file synchronization and storage
service.  It allows users to bring photos, documents, and videos anywhere
and share them easily.  This package installs the pre-built Linux client.")
    (license #f)))


;;; ---- 2. electron23-bin ----
;;; AUR #17970 -- Pre-built Electron 23 runtime (EOL).
;;; Source: GitHub release binary.
;;; License: MIT
;;; Hash verified via guix download.

(define-public electron23-bin
  (package
    (name "electron23-bin")
    (version "23.3.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/electron/electron/releases/download/"
             "v" version "/electron-v" version "-linux-x64.zip"))
       (sha256
        (base32 "0h7lw88kc8w4i91z2pqkkavccb1h4cjdjsjg9yv79amcpg1v36ig"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/electron23"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/lib/electron23/electron")
                         (string-append bin "/electron23"))))))))
    (native-inputs (list unzip))
    (inputs
     (list alsa-lib
           at-spi2-core
           cairo
           cups
           dbus
           expat
           fontconfig
           freetype
           glib
           gtk+
           libdrm
           libx11
           libxcb
           libxcomposite
           libxdamage
           libxext
           libxfixes
           libxkbcommon
           libxrandr
           mesa
           nspr
           nss
           pango))
    (home-page "https://electronjs.org")
    (synopsis "pre-built Electron 23 runtime for cross-platform desktop apps")
    (description
     "Electron is a framework for building cross-platform desktop applications
with JavaScript, HTML, and CSS.  This package provides the pre-built Electron
23 runtime binaries.  Note that Electron 23 has reached end-of-life; this
package is provided for legacy application compatibility.")
    (license license:expat)))


;;; ---- 3. realvnc-rvnc-connect ----
;;; AUR #17860 -- Proprietary VNC remote desktop software by RealVNC.
;;; Source: Binary .deb from RealVNC.
;;; License: Proprietary
;;; Hash verified via guix download.

(define-public realvnc-rvnc-connect
  (package
    (name "realvnc-rvnc-connect")
    (version "8.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.realvnc.com/download/file/realvnc-connect/"
             "RealVNC-Connect-" version "-Linux-x64.deb"))
       (sha256
        (base32 "1jh8syy4hc1704kc8lhbckgz3rxsxx4vzk4yk11vqaza3iwybkjw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr" "."))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (inputs
     (list at-spi2-core
           cairo
           fontconfig
           glib
           gtk+
           libx11
           libxext
           libxtst
           pango))
    (home-page "https://www.realvnc.com/en/connect/")
    (synopsis "VNC remote desktop software by RealVNC")
    (description
     "RealVNC Connect provides remote access software for desktop and mobile
platforms.  This package installs the pre-built Linux client and server
components from RealVNC's official distribution.")
    (license #f)))


;;; ---- 4. n8n ----
;;; AUR #17807 -- Workflow automation tool.
;;; Source: npm registry tarball.
;;; License: Sustainable Use License (custom)
;;; Hash verified via guix download.

(define-public n8n
  (package
    (name "n8n")
    (version "2.17.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://registry.npmjs.org/n8n/-/n8n-"
             version ".tgz"))
       (sha256
        (base32 "0qj662f3m0vq0dbgnmih9xy6pxq34z4z894p3dblm0vbflfvvhyx"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (inputs (list node-lts))
    (home-page "https://n8n.io")
    (synopsis "workflow automation tool for connecting services")
    (description
     "n8n is a free and source-available fair-code licensed workflow
automation tool.  It allows users to easily automate tasks across
different services with a visual node-based editor.")
    (license #f)))


;;; ---- 5. heroku-cli ----
;;; AUR #17796 -- CLI to manage Heroku apps and services.
;;; Source: GitHub release tarball.
;;; License: ISC
;;; Hash verified via guix download.

(define-public heroku-cli
  (package
    (name "heroku-cli")
    (version "11.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/heroku/cli/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0d8fvi4g7c126ymfkcgwmmwfgs8y0181al6arba8a8pnnkl75fgw"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (inputs (list node-lts))
    (home-page "https://devcenter.heroku.com/articles/heroku-cli")
    (synopsis "CLI to manage Heroku apps and services")
    (description
     "The Heroku CLI is used to manage Heroku apps directly from the
terminal.  It provides commands for creating, deploying, scaling, and
managing applications on the Heroku cloud platform.")
    (license license:isc)))
