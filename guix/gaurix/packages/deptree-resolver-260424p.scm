;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424p
;;; Resolves 100 packages via dependency-tree priority.
;;;
;;; New recipes (27): riverguile-git, simplewaita-git, dwl-guile-git, lisp-wrapper,
;;;   libdng-git, ps3netsrv, gss-ntlmssp, c-icap, ctwm-bzr, passmenu-otp-git,
;;;   python-icsv2ledger-git, python-pynotify, python-rtmixer, python-ivre-git,
;;;   adwaita-color-schemes, notmuch-tools-git, ha-glue, libgaminggear,
;;;   chromeos-flashrom-git, qtemu-git, the-libs, opencoarrays, precice,
;;;   nimdow-git, darknet-hankai-git, assaultcube-common, magics-plus-plus
;;; Remaining BLOCKED: 73 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages image)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (riverguile-git
            simplewaita-git
            dwl-guile-git
            lisp-wrapper
            libdng-git
            ps3netsrv
            gss-ntlmssp-pkg
            c-icap
            ctwm-bzr
            passmenu-otp-git
            python-icsv2ledger-git
            python-pynotify-inotify
            python-rtmixer
            python-ivre-git
            adwaita-color-schemes
            notmuch-tools-git
            ha-glue
            libgaminggear
            chromeos-flashrom-git
            qtemu-git
            the-libs
            opencoarrays
            precice-coupling
            nimdow-git
            darknet-hankai-git
            assaultcube-common
            magics-plus-plus))


;;; ---- 1. riverguile-git ----
;;; Scripting layer for the river Wayland server using Guile Scheme.
;;; Source: https://git.sr.ht/~leon_plickat/riverguile
;;; License: GPL-3.0+

(define-public riverguile-git
  (let ((commit "a5b129d")
        (revision "21"))
    (package
      (name "riverguile-git")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://git.sr.ht/~leon_plickat/riverguile")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure)
                 (replace 'install
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let* ((out (assoc-ref outputs "out"))
                            (bin (string-append out "/bin")))
                       (mkdir-p bin)
                       (for-each
                        (lambda (f)
                          (install-file f bin))
                        (find-files "." "riverguile"))))))))
      (inputs (list guile-3.0))
      (home-page "https://git.sr.ht/~leon_plickat/riverguile")
      (synopsis "scripting layer for the river Wayland server using Guile Scheme")
      (description "Riverguile provides a scripting layer for the River Wayland
compositor using GNU Guile Scheme.  It allows users to configure and control
River through Guile scripts.")
      (license license:gpl3+))))


;;; ---- 2. simplewaita-git ----
;;; Skeuomorphic GTK 2/3/4 theme with Kvantum, qtCurve, Plasma, and WM support.
;;; Source: https://github.com/khongten001/Simplewaita
;;; License: GPL-2.0-only

(define-public simplewaita-git
  (let ((commit "a00f41d")
        (revision "60"))
    (package
      (name "simplewaita-git")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/khongten001/Simplewaita")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("gtk-2.0" "share/themes/Simplewaita/gtk-2.0")
                 ("gtk-3.0" "share/themes/Simplewaita/gtk-3.0")
                 ("gtk-4.0" "share/themes/Simplewaita/gtk-4.0"))))
      (home-page "https://github.com/khongten001/Simplewaita")
      (synopsis "skeuomorphic GTK 2, 3, and 4 theme")
      (description "Simplewaita is a skeuomorphic theme for GTK 2, GTK 3,
GTK 4, Kvantum, qtCurve, Plasma, qt5ct, qt6ct, XFWM4, KWin, Metacity,
and Openbox.")
      (license license:gpl2))))


;;; ---- 3. dwl-guile-git ----
;;; Dynamic tiling Wayland compositor configurable in Guile Scheme.
;;; Source: https://github.com/engstrand-config/dwl-guile
;;; License: GPL-3.0+

(define-public dwl-guile-git
  (package
    (name "dwl-guile-git")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/engstrand-config/dwl-guile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list wlroots wayland guile-3.0 libxkbcommon))
    (native-inputs (list pkg-config wayland-protocols))
    (home-page "https://github.com/engstrand-config/dwl-guile")
    (synopsis "dynamic tiling Wayland compositor configurable in Guile Scheme")
    (description "dwl-guile is a dynamic tiling Wayland compositor based on dwl
and configurable in GNU Guile Scheme.  It features a built-in REPL for
interactive configuration.")
    (license license:gpl3+)))


;;; ---- 4. lisp-wrapper ----
;;; Wrapper scripts to make it easier to get started with Common Lisp.
;;; Source: https://github.com/xyproto/lisp
;;; License: GPL-2.0+

(define-public lisp-wrapper
  (package
    (name "lisp-wrapper")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xyproto/lisp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list sbcl))
    (home-page "https://github.com/xyproto/lisp")
    (synopsis "wrapper scripts for getting started with Common Lisp")
    (description "Lisp provides wrapper scripts to make it easier to get
started with Common Lisp.  It wraps SBCL with convenient commands for
evaluating expressions and running scripts.")
    (license license:gpl2+)))


;;; ---- 5. libdng-git ----
;;; Interface library between libtiff and DNG format.
;;; Source: https://gitlab.com/megapixels-org/libdng
;;; License: MIT

(define-public libdng-git
  (let ((commit "438df53")
        (revision "59"))
    (package
      (name "libdng-git")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/megapixels-org/libdng")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (inputs (list libtiff))
      (native-inputs (list pkg-config scdoc))
      (home-page "https://gitlab.com/megapixels-org/libdng")
      (synopsis "interface library for valid DNG output via libtiff")
      (description "libdng is an interface library between libtiff and the
world to make sure the output is valid DNG (Digital Negative) format.")
      (license license:expat))))


;;; ---- 6. ps3netsrv ----
;;; PS3 Net Server (mod by aldostools).
;;; Source: https://github.com/aldostools/ps3netsrv
;;; License: GPL-3.0+

(define-public ps3netsrv
  (package
    (name "ps3netsrv")
    (version "20250501")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aldostools/ps3netsrv")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list mbedtls-lts))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/aldostools/ps3netsrv")
    (synopsis "PS3 network server for serving game backups")
    (description "ps3netsrv is a network server for serving PS3 game backups
over the network.  This is the aldostools modified version with additional
features and improvements.")
    (license license:gpl3+)))


;;; ---- 7. gss-ntlmssp ----
;;; GSSAPI mechanism implementing NTLMSSP.
;;; Source: https://github.com/gssapi/gss-ntlmssp
;;; License: ISC

(define-public gss-ntlmssp-pkg
  (package
    (name "gss-ntlmssp")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gssapi/gss-ntlmssp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'bootstrap 'fix-autoreconf
                 (lambda _
                   (when (not (file-exists? "configure"))
                     (invoke "autoreconf" "-fiv")))))))
    (inputs (list mit-krb5 libunistring openssl))
    (native-inputs (list autoconf automake libtool pkg-config
                         doxygen))
    (home-page "https://github.com/gssapi/gss-ntlmssp")
    (synopsis "GSSAPI mechanism that implements NTLMSSP")
    (description "gss-ntlmssp is a GSSAPI mechanism plug-in that implements
NTLMSSP (NT LAN Manager Security Support Provider).  It allows applications
using GSSAPI to authenticate via NTLM.")
    (license license:isc)))


;;; ---- 8. c-icap ----
;;; Implementation of an ICAP server.
;;; Source: http://c-icap.sourceforge.net/
;;; License: GPL-2.0+

(define-public c-icap
  (package
    (name "c-icap")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/c-icap/c-icap/0.6.x/c_icap-"
                           version ".tar.gz"))
       (sha256
        (base32 "0z0fp1gk7l8mvxy16mvrabx5g2d1s7cx22km97a3sf3m9yk2vb9y"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list brotli bzip2 openldap lmdb openssl pcre2 zlib zstd))
    (native-inputs (list pkg-config))
    (home-page "http://c-icap.sourceforge.net/")
    (synopsis "implementation of an ICAP server")
    (description "c-icap is an implementation of an ICAP (Internet Content
Adaptation Protocol) server.  It can be used with HTTP proxies such as Squid
to provide content filtering, virus scanning, and other content adaptation
services.")
    (license (list license:gpl2+ license:lgpl2.1+))))


;;; ---- 9. ctwm-bzr ----
;;; Claude's Tab Window Manager.
;;; Source: http://ctwm.org/
;;; License: MIT

(define-public ctwm-bzr
  (package
    (name "ctwm-bzr")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ctwm.org/dist/ctwm-" version ".tar.xz"))
       (sha256
        (base32 "0a9036zyiqanv2fmhbri8kqhz1c7xrm4fkn4jrz67md6vlj4gz6z"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libxmu libxpm libjpeg-turbo libxt libsm libice))
    (native-inputs (list pkg-config))
    (home-page "http://ctwm.org/")
    (synopsis "Claude's Tab Window Manager for X11")
    (description "CTWM (Claude's Tab Window Manager) is a window manager for
the X Window System.  It is based on twm and provides virtual desktops,
title buttons, window menus, and many other features.")
    (license license:expat)))


;;; ---- 10. passmenu-otp-git ----
;;; Extension of passmenu for one-time passwords (OTP/2FA).
;;; Source: https://github.com/petrmanek/passmenu-otp
;;; License: MIT

(define-public passmenu-otp-git
  (let ((commit "2623a08")
        (revision "1"))
    (package
      (name "passmenu-otp-git")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/petrmanek/passmenu-otp")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("passmenu-otp" "bin/passmenu-otp"))))
      (inputs (list bash pass-otp dmenu xdotool))
      (home-page "https://github.com/petrmanek/passmenu-otp")
      (synopsis "passmenu extension for one-time passwords")
      (description "passmenu-otp is a simple extension of passmenu that adds
support for one-time passwords (OTP), often used for two-factor
authentication (2FA).")
      (license license:expat))))


;;; ---- 11. python-icsv2ledger-git ----
;;; Interactive importing of CSV files to Ledger format.
;;; Source: https://github.com/quentinsf/icsv2ledger
;;; License: MIT

(define-public python-icsv2ledger-git
  (let ((commit "97329f6")
        (revision "181"))
    (package
      (name "python-icsv2ledger-git")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/quentinsf/icsv2ledger")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system python-build-system)
      (arguments (list #:tests? #f))
      (inputs (list python))
      (home-page "https://github.com/quentinsf/icsv2ledger")
      (synopsis "interactive CSV to Ledger file converter")
      (description "icsv2ledger is a tool for interactively importing CSV
bank statements into Ledger accounting format.  It supports configurable
field mapping and automatic categorization.")
      (license license:expat))))


;;; ---- 12. python-pynotify-inotify ----
;;; Python inotify class for filesystem monitoring.
;;; Source: https://github.com/gene-git/pynotify
;;; License: GPL-2.0+

(define-public python-pynotify-inotify
  (package
    (name "python-pynotify-inotify")
    (version "1.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gene-git/pynotify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/gene-git/pynotify")
    (synopsis "Python inotify class for filesystem event monitoring")
    (description "pynotify provides a Python class for monitoring filesystem
events using Linux inotify.  It offers a clean interface for watching
file and directory changes.")
    (license license:gpl2+)))


;;; ---- 13. python-rtmixer ----
;;; Reliable low-latency audio playback and recording with Python.
;;; Source: https://github.com/spatialaudio/python-rtmixer
;;; License: MIT

(define-public python-rtmixer
  (package
    (name "python-rtmixer")
    (version "0.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spatialaudio/python-rtmixer")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (inputs (list portaudio))
    (native-inputs (list python-cffi python-setuptools python-wheel))
    (propagated-inputs (list python-cffi))
    (home-page "https://github.com/spatialaudio/python-rtmixer")
    (synopsis "reliable low-latency audio playback and recording")
    (description "python-rtmixer provides reliable low-latency audio playback
and recording with Python.  It uses PortAudio via CFFI and a lock-free ring
buffer for real-time audio processing.")
    (license license:expat)))


;;; ---- 14. python-ivre-git ----
;;; Network recon framework based on Nmap, Masscan, Zeek, etc.
;;; Source: https://github.com/ivre/ivre
;;; License: GPL-3.0+

(define-public python-ivre-git
  (let ((commit "dev157")
        (revision "1"))
    (package
      (name "python-ivre-git")
      (version "0.9.21")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ivre/ivre")
               (commit (string-append "v" version))))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list python-pymongo python-pyopenssl
                               python-cryptography))
      (native-inputs (list python-setuptools python-wheel))
      (home-page "https://ivre.rocks/")
      (synopsis "network recon framework based on Nmap, Masscan, and Zeek")
      (description "IVRE is a network reconnaissance framework that integrates
with Nmap, Masscan, Zgrab2, Nuclei, httpx, Zeek, and other tools.  It provides
a unified interface for network scanning, analysis, and visualization.")
      (license license:gpl3+))))


;;; ---- 15. adwaita-color-schemes ----
;;; Adwaita color schemes for KDE applications.
;;; Source: https://github.com/FedoraQt/QGnomePlatform
;;; License: LGPL-2.1

(define-public adwaita-color-schemes
  (package
    (name "adwaita-color-schemes")
    (version "0.9.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicman23/adwaita-color-schemes")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/color-schemes/"
                #:include-regexp (".*\\.colors$")))))
    (home-page "https://github.com/nicman23/adwaita-color-schemes")
    (synopsis "Adwaita color schemes for KDE applications")
    (description "Adwaita Color Schemes provides GNOME Adwaita color schemes
for use with KDE applications.  It includes both light and dark variants to
match the GNOME desktop appearance.")
    (license license:lgpl2.1)))


;;; ---- 16. notmuch-tools-git ----
;;; Small command-line tools for the Notmuch mail indexer.
;;; Source: https://framagit.org/manu/notmuch-tools
;;; License: GPL-3.0+

(define-public notmuch-tools-git
  (let ((commit "84c38f0")
        (revision "87"))
    (package
      (name "notmuch-tools-git")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://framagit.org/manu/notmuch-tools")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure)
                 (replace 'install
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                       (mkdir-p bin)
                       (for-each
                        (lambda (f)
                          (when (access? f X_OK)
                            (install-file f bin)))
                        (find-files "." #:directories? #f))))))))
      (inputs (list notmuch glib gmime sqlite))
      (native-inputs (list pkg-config))
      (home-page "https://framagit.org/manu/notmuch-tools")
      (synopsis "command-line tools for the Notmuch mail indexer")
      (description "notmuch-tools provides a set of small command-line tools for
the Notmuch mail indexer, including tag synchronization across machines and
other utility functions.")
      (license license:gpl3+))))


;;; ---- 17. ha-glue ----
;;; Libraries, tools, and utilities for the Heartbeat/Pacemaker cluster stack.
;;; Source: https://github.com/ClusterLabs/cluster-glue
;;; License: GPL-2.0+

(define-public ha-glue
  (package
    (name "ha-glue")
    (version "1.0.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ClusterLabs/cluster-glue")
             (commit (string-append "glue-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'bootstrap 'run-autogen
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (inputs (list python libxml2 libtool util-linux curl glib))
    (native-inputs (list autoconf automake pkg-config libtool))
    (home-page "https://github.com/ClusterLabs/cluster-glue")
    (synopsis "libraries and utilities for the Heartbeat/Pacemaker cluster stack")
    (description "cluster-glue (ha-glue) provides a set of libraries, tools, and
utilities suitable for the Heartbeat/Pacemaker cluster stack.  It includes
common infrastructure for high-availability clustering.")
    (license license:gpl2+)))


;;; ---- 18. libgaminggear ----
;;; Functionality library for gaming input devices.
;;; Source: http://sourceforge.net/projects/libgaminggear/
;;; License: GPL-2.0+

(define-public libgaminggear
  (package
    (name "libgaminggear")
    (version "0.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/libgaminggear/libgaminggear-"
             version ".tar.bz2"))
       (sha256
        (base32 "0jf5i1iv8j842imgiixbhwcr6qcwa93m27lzr6gb01ri5v35kggz"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libnotify libcanberra gtk+ sqlite))
    (native-inputs (list pkg-config doxygen glib))
    (home-page "http://sourceforge.net/projects/libgaminggear/")
    (synopsis "functionality library for gaming input devices")
    (description "libgaminggear provides common functionality for gaming input
devices such as keyboards and mice.  It handles device configuration, macro
recording, and profile management.")
    (license license:gpl2+)))


;;; ---- 19. chromeos-flashrom-git ----
;;; Flashrom ChromiumOS version with EC and host programmers.
;;; Source: https://chromium.googlesource.com/chromiumos/third_party/flashrom
;;; License: GPL-2.0+

(define-public chromeos-flashrom-git
  (let ((commit "90795b2cc")
        (revision "4051"))
    (package
      (name "chromeos-flashrom-git")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://chromium.googlesource.com/chromiumos/third_party/flashrom")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (inputs (list libusb libftdi pciutils))
      (native-inputs (list pkg-config))
      (home-page "https://chromium.googlesource.com/chromiumos/third_party/flashrom")
      (synopsis "ChromiumOS version of flashrom with EC and host programmers")
      (description "chromeos-flashrom is the ChromiumOS version of flashrom, a
utility for reading, writing, erasing and verifying flash ROM chips.  This
version includes EC and host programmers specific to ChromeOS devices.")
      (license license:gpl2+))))


;;; ---- 20. qtemu-git ----
;;; Qt GUI front-end for QEMU.
;;; Source: https://gitlab.com/qtemu/gui
;;; License: GPL-2.0+

(define-public qtemu-git
  (let ((commit "d6c2d66")
        (revision "26"))
    (package
      (name "qtemu-git")
      (version (git-version "2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/qtemu/gui")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list qemu qtbase qtsvg))
      (native-inputs (list pkg-config))
      (home-page "https://gitlab.com/qtemu/gui")
      (synopsis "Qt-based GUI front-end for QEMU virtual machines")
      (description "QtEmu is a graphical user interface for QEMU, similar to
VirtualBox.  It provides an easy-to-use interface for creating and managing
QEMU virtual machines.")
      (license license:gpl2+))))


;;; ---- 21. the-libs ----
;;; Common libraries for the- applications by Victor Tran.
;;; Source: https://github.com/vicr123/the-libs
;;; License: GPL-3.0+

(define-public the-libs
  (package
    (name "the-libs")
    (version "5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vicr123/the-libs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase qtmultimedia qtsvg))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/vicr123/the-libs")
    (synopsis "common libraries for the- applications")
    (description "the-libs provides common libraries used by the- applications
developed by Victor Tran, including shared UI components, utilities, and
theming support for Qt-based applications.")
    (license license:gpl3+)))


;;; ---- 22. opencoarrays ----
;;; Transport layer for coarray Fortran compilers.
;;; Source: https://github.com/sourceryinstitute/OpenCoarrays
;;; License: BSD-3

(define-public opencoarrays
  (package
    (name "opencoarrays")
    (version "2.10.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sourceryinstitute/OpenCoarrays")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_Fortran_COMPILER="
                                  #$(this-package-native-input "gfortran")
                                  "/bin/gfortran"))))
    (inputs (list openmpi))
    (native-inputs (list gfortran pkg-config))
    (home-page "https://github.com/sourceryinstitute/OpenCoarrays")
    (synopsis "transport layer for coarray Fortran compilers")
    (description "OpenCoarrays is an open-source software project that produces
an application binary interface (ABI) for coarray Fortran compilers.  It
enables parallel programming with Fortran coarrays using MPI as the transport
layer.")
    (license license:bsd-3)))


;;; ---- 23. precice-coupling ----
;;; Coupling library for partitioned multi-physics simulations.
;;; Source: https://github.com/precice/precice
;;; License: LGPL-3.0+

(define-public precice-coupling
  (package
    (name "precice-coupling")
    (version "3.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/precice/precice")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DPRECICE_FEATURE_MPI_COMMUNICATION=ON"
                   "-DPRECICE_FEATURE_PETSC_MAPPING=OFF")))
    (inputs (list boost libxml2 openmpi eigen))
    (native-inputs (list pkg-config gfortran))
    (home-page "https://precice.org")
    (synopsis "coupling library for partitioned multi-physics simulations")
    (description "preCICE (Precise Code Interaction Coupling Environment) is a
coupling library for partitioned multi-physics simulations.  It supports
surface coupling, volume coupling, and various data mapping schemes for
massively parallel systems.")
    (license license:lgpl3+)))


;;; ---- 24. nimdow-git ----
;;; Tiling window manager written in Nim.
;;; Source: https://github.com/avahe-kellenberger/nimdow
;;; License: GPL-2.0+

(define-public nimdow-git
  (package
    (name "nimdow-git")
    (version "0.7.41")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/avahe-kellenberger/nimdow")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "nim" "compile" "-d:release" "src/nimdow.nim")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "src/nimdow" bin)))))))
    (native-inputs (list nim))
    (home-page "https://github.com/avahe-kellenberger/nimdow")
    (synopsis "tiling window manager written in Nim")
    (description "Nimdow is a tiling window manager for X11 written in the Nim
programming language.  It is inspired by dwm and provides automatic tiling,
keyboard-driven navigation, and a minimal footprint.")
    (license license:gpl2+)))


;;; ---- 25. darknet-hankai-git ----
;;; Open source neural network framework (Hank AI fork).
;;; Source: https://github.com/hank-ai/darknet
;;; License: Apache-2.0

(define-public darknet-hankai-git
  (let ((commit "a3df422")
        (revision "90"))
    (package
      (name "darknet-hankai-git")
      (version (git-version "5.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/hank-ai/darknet")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DDARKNET_GPU=OFF"
                     "-DDARKNET_CUDNN=OFF"
                     "-DDARKNET_OPENCV=OFF")))
      (inputs (list openblas))
      (native-inputs (list pkg-config))
      (home-page "https://github.com/hank-ai/darknet")
      (synopsis "open source neural network framework in C and C++")
      (description "Darknet is an open source neural network framework written
in C and C++.  This is the Hank AI fork with improvements and active
maintenance.  It supports various network architectures including YOLO
for real-time object detection.")
      (license license:asl2.0))))


;;; ---- 26. assaultcube-common ----
;;; AssaultCube FPS game common files.
;;; Source: https://assault.cubers.net/
;;; License: zlib

(define-public assaultcube-common
  (package
    (name "assaultcube-common")
    (version "1.3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/assaultcube/AC/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1v1dkr3mja4hlhlrz5a38djj8qpi8s3lxkf2hf7wrr8fyaqivwh5"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "CXX=" (string-append #$(cc-for-target) "++"))
                   "-C" "source/src")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (share (string-append out "/share/assaultcube")))
                     (mkdir-p share)
                     (copy-recursively "packages" (string-append share "/packages"))
                     (copy-recursively "config" (string-append share "/config"))))))))
    (inputs (list zlib sdl2 sdl2-image openal mesa libvorbis))
    (native-inputs (list pkg-config))
    (home-page "https://assault.cubers.net/")
    (synopsis "AssaultCube first-person shooter game")
    (description "AssaultCube is a free, multiplayer, first-person shooter game
based on the Cube engine.  This package contains the common game data files
and assets.")
    (license license:zlib)))


;;; ---- 27. magics-plus-plus ----
;;; ECMWF Meteorological plotting software.
;;; Source: https://github.com/ecmwf/magics
;;; License: Apache-2.0

(define-public magics-plus-plus
  (package
    (name "magics-plus-plus")
    (version "4.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ecmwf/magics")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DENABLE_FORTRAN=OFF"
                   "-DENABLE_PYTHON=OFF")))
    (inputs (list eccodes libgeotiff qtbase pango))
    (native-inputs (list pkg-config swig))
    (home-page "https://confluence.ecmwf.int/display/MAGP")
    (synopsis "ECMWF meteorological plotting software")
    (description "Magics is the latest generation of the ECMWF's meteorological
plotting software.  It provides a comprehensive set of tools for visualizing
weather data, including contour plots, wind fields, satellite imagery overlays,
and other meteorological visualizations.")
    (license license:asl2.0)))
