;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414v
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 7 recipes created (1 Python pyproject + 1 Meson/Vala + 1 Go + 1 Qt5/qmake + 3 binary repacks)
;;;   - 1 compat alias (upstream Guix re-export)
;;;   - 22 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; Recipes (7):
;;;   gitfourchette, wayfarer, lumus, twmn,
;;;   ngrrram-bin, cmdcreate-bin, udever-bin
;;;
;;; Compat alias (1):
;;;   virt-install-git → virt-manager
;;;
;;; All sha256 hashes verified via `guix download` or `curl + sha256sum`.

(define-module (gaurix packages recipe-resolver-260414v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages image)
  #:use-module (gnu packages ocr)
  #:export (gitfourchette
            wayfarer
            lumus
            twmn
            ngrrram-bin
            cmdcreate-bin
            udever-bin
            virt-install-git))

;;;
;;; --- 1. gitfourchette (pyproject-build-system, Python/pygit2/PyQt6) ---
;;; The comfortable Git UI — graphical Git client.
;;; Source: https://github.com/jorio/gitfourchette
;;; Resolves: #7072 gitfourchette (line 54278)
;;;

(define-public gitfourchette
  (package
    (name "gitfourchette")
    (version "1.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jorio/gitfourchette/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "19hif0m2jz27k4ayzjhq5axb2gsx436lhvia2jy5abnfgiddgky8"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need Qt display
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python-wrapper))
    (propagated-inputs (list python-pygit2 python-pyqt))
    (synopsis "comfortable graphical Git client")
    (description "GitFourchette is a graphical Git client for Linux built with
pygit2 and PyQt6.  It provides a comfortable interface for everyday Git
operations including staging, committing, branching, merging, rebasing,
stashing, and history browsing.  It supports diff viewing with syntax
highlighting, interactive staging of individual hunks, and integration
with external diff/merge tools.")
    (home-page "https://gitfourchette.org")
    (license license:gpl3+)))

;;;
;;; --- 2. wayfarer (meson-build-system, Vala/GTK4) ---
;;; Wayland screen recorder using Pipewire and XDG Portal.
;;; Source: https://codeberg.org/stronnag/wayfarer
;;; Resolves: #4523 wayfarer-git (line 35525)
;;;

(define-public wayfarer
  (package
    (name "wayfarer")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/stronnag/wayfarer/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1b37gpjckrwy97fyfdda2khcf60wr6h5ij89g76j5akxds6ikd1k"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:glib-or-gtk? #t))
    (native-inputs (list pkg-config
                         vala
                         `(,glib "bin")  ;; glib-compile-schemas
                         blueprint-compiler
                         desktop-file-utils))
    (inputs (list gtk
                  glib
                  gstreamer
                  gst-plugins-base
                  pulseaudio
                  python-3))
    (synopsis "Wayland screen recorder using Pipewire")
    (description "Wayfarer is a screen recorder for Wayland desktops that uses
the XDG Desktop Portal and Pipewire for screen capture.  It provides a GTK4
interface for recording screen regions with configurable encoding settings
via GStreamer pipelines.  Supports output to various container formats
including WebM, MKV, and MP4.")
    (home-page "https://codeberg.org/stronnag/wayfarer")
    (license license:gpl3+)))

;;;
;;; --- 3. lumus (go-build-system, Go CLI) ---
;;; CLI tool to read PDF files in the terminal.
;;; Source: https://github.com/Josehpequeno/lumus
;;; Resolves: #4550 lumus (line 35737)
;;;

(define-public lumus
  (package
    (name "lumus")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Josehpequeno/lumus/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "10j1y13gkkb38934fiajkx47k05yk2w6j4348yid9wa2cb6sclg6"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "lumus"
           #:install-source? #f
           #:tests? #f  ;; tests need network access
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src/lumus")
                   (invoke "tar" "-xzf" source
                           "--strip-components=1"
                           "-C" "src/lumus"))))))
    (inputs (list poppler tesseract-ocr leptonica))
    (synopsis "read PDF files in the terminal")
    (description "Lumus is a command-line tool written in Go that renders PDF
pages as text in the terminal.  It uses Poppler for PDF parsing and
Tesseract OCR for text extraction from scanned documents.  Supports
page-by-page navigation and text search within PDF files.")
    (home-page "https://github.com/Josehpequeno/lumus")
    (license license:expat)))

;;;
;;; --- 4. twmn (gnu-build-system, Qt5/qmake) ---
;;; Notification system for tiling window managers.
;;; Source: https://github.com/sboli/twmn
;;; Resolves: #6751 twmn-git (line 51791)
;;;

(define-public twmn
  (package
    (name "twmn")
    (version "2025_10_23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sboli/twmn/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "192lrpyf8dxfpw8p0kcj6fdfh4yrqkf52lg4bryv4ifrvkbib99g"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (substitute* "twmnd/twmnd.pro"
                       (("target.path\\+=/usr/local/bin")
                        (string-append "target.path+=" out "/bin")))
                     (substitute* "twmnc/twmnc.pro"
                       (("target.path \\+= /usr/local/bin")
                        (string-append "target.path += " out "/bin")))
                     (invoke "qmake")))))))
    (native-inputs (list (specification->package "qtbase@5")
                         pkg-config))
    (inputs (list qtx11extras
                  boost
                  libxext
                  libxkbcommon))
    (synopsis "notification system for tiling window managers")
    (description "Twmn is a notification system for tiling window managers on
X11.  It consists of a daemon (@command{twmnd}) that displays notifications
as a slide-in bar and a client (@command{twmnc}) for sending notifications.
Twmn integrates with window managers like i3, dwm, awesome, and xmonad,
displaying unobtrusive text-based notifications without disrupting the
tiling layout.")
    (home-page "https://github.com/sboli/twmn")
    (license license:lgpl3+)))

;;;
;;; --- 5. ngrrram-bin (copy-build-system, pre-built binary) ---
;;; TUI typing practice tool for learning keyboard layouts.
;;; Source: https://github.com/wintermute-cell/ngrrram
;;; Resolves: #7231 ngrrram-git (line 55422)
;;;

(define-public ngrrram-bin
  (package
    (name "ngrrram-bin")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wintermute-cell/ngrrram/releases/download/v"
                    version "/ngrrram-linux"))
              (sha256
               (base32
                "1hdi5anqfyhdjm46y4lj49nrmj6yw37pbyz4pdgivlagw0klpjiz"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "ngrrram-linux" "bin/ngrrram"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "ngrrram-linux")))
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ngrrram")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI typing practice for learning keyboard layouts")
    (description "Ngrrram is a terminal-based typing practice tool written in
Rust.  It helps users learn and practice alternative keyboard layouts by
displaying random n-grams (sequences of characters) that the user must
type correctly.  Supports configurable n-gram length and various keyboard
layout definitions.")
    (home-page "https://github.com/wintermute-cell/ngrrram")
    (license license:gpl3)))

;;;
;;; --- 6. cmdcreate-bin (copy-build-system, pre-built binary) ---
;;; CLI tool to create, manage, and organize custom command aliases.
;;; Source: https://github.com/owen-debiasio/cmdcreate
;;; Resolves: #7050 cmdcreate (line 54108)
;;;

(define-public cmdcreate-bin
  (package
    (name "cmdcreate-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/owen-debiasio/cmdcreate/releases/download/v"
                    version "/cmdcreate-v" version "-linux-x86_64-bin"))
              (sha256
               (base32
                "1wz30vjwmzhqwbbgsdha48v3iyi223p52hnha869k6xsnr7dwkr2"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list (string-append "cmdcreate-v"
                                        #$(package-version this-package)
                                        "-linux-x86_64-bin")
                         "bin/cmdcreate"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source
                              (string-append "cmdcreate-v"
                                             #$(package-version this-package)
                                             "-linux-x86_64-bin"))))
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/cmdcreate")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "create and manage custom command aliases")
    (description "CmdCreate is a command-line tool written in Rust that helps
users create, manage, and organize custom shell command aliases and
scripts.  It provides an interactive interface for defining new commands,
editing existing ones, and organizing them into categories.  Commands are
stored persistently and can be exported or shared.")
    (home-page "https://github.com/owen-debiasio/cmdcreate")
    (license license:gpl3)))

;;;
;;; --- 7. udever-bin (copy-build-system, pre-built binary) ---
;;; Interactive udev rule generator for Linux devices.
;;; Source: https://github.com/lazytatzv/udever
;;; Resolves: #4448 udever-git (line 34968)
;;;

(define-public udever-bin
  (package
    (name "udever-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lazytatzv/udever/releases/download/v"
                    version "/udever-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "1vapjjai60y81ihn3khk1m9jmkyjv05b1487535q024y77kircqm"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "udever" "bin/udever"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/udever")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "interactive udev rule generator")
    (description "Udever is a terminal-based interactive tool for generating
Linux udev rules.  It guides users through the process of identifying
connected USB and other devices, selecting device attributes, and
generating properly formatted udev rules for device permissions,
naming, and event triggers.")
    (home-page "https://github.com/lazytatzv/udever")
    (license license:expat)))

;;;
;;; --- 8. virt-install-git (compat alias → virt-manager) ---
;;; Guix virt-manager already provides virt-install CLI.
;;; Resolves: #6756 virt-install-git (line 51835)
;;;

(define-public virt-install-git
  (package
    (inherit virt-manager)
    (name "virt-install-git")
    (synopsis "command-line tool for creating virtual machines (alias)")
    (description "This is a compatibility alias for the Guix virt-manager
package, which already includes the @command{virt-install} command-line
tool for creating and configuring KVM, Xen, and LXC virtual machines.
The AUR virt-install-git package is the git version of virt-install
which is a component of the virt-manager project.")))
