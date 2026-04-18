;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418a
;;; Resolves 13 packages (11 BLOCKED + 2 new dependencies) from 100 evaluated.
;;; 89 packages remain BLOCKED after evaluation (see blocked-notes).
;;;
;;; New recipes (13):
;;;    1. python-terminaltables3 (pyproject-build-system, v4.0.0, MIT)
;;;    2. python-keep (pyproject-build-system, v2.11, MIT)
;;;    3. arcticons-icon-theme (copy-build-system, v12.6.0.1, GPL3+)
;;;    4. chipwhisperer-udev (copy-build-system, v6.0.0, Apache-2.0)
;;;    5. openrgb-udev-rules (copy-build-system, v0.9, GPL2+)
;;;    6. catppuccin-mocha-grub-theme (copy-build-system, v1.0.0, MIT)
;;;    7. flandre-grub-theme (copy-build-system, v0.0.0-1.39394ec, MIT)
;;;    8. sddm-lain-wired-theme (copy-build-system, v0.9.1, CC-BY-SA4.0)
;;;    9. multicolor-sddm-theme (copy-build-system, v0.0.0-1.798507a2, GPL3+)
;;;   10. nwg-wrapper (python-build-system, v0.1.3, MIT)
;;;   11. howdoi (python-build-system, v2.0.20, MIT)
;;;   12. rsvndump (gnu-build-system, v0.6.2, GPL3+)
;;;   13. ubuntu-wallpapers (copy-build-system, v25.04.2, CC-BY-SA3.0)
;;;
;;; NOTE: All sha256 hashes obtained via `guix download` or `guix hash -x`.

(define-module (gaurix packages deptree-resolver-260418a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages apr)
  #:use-module (gnu packages base)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages wm)
  #:export (python-terminaltables3
            python-keep
            arcticons-icon-theme
            chipwhisperer-udev
            openrgb-udev-rules
            catppuccin-mocha-grub-theme
            flandre-grub-theme
            sddm-lain-wired-theme
            multicolor-sddm-theme
            nwg-wrapper
            howdoi
            rsvndump
            ubuntu-wallpapers))


;;; -----------------------------------------------------------------------
;;; Dependency packages (needed by main packages below)
;;; -----------------------------------------------------------------------

;;; python-terminaltables3 — text tables in terminal (fork of terminaltables)
(define-public python-terminaltables3
  (package
    (name "python-terminaltables3")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "terminaltables3" version))
              (sha256
               (base32
                "0zxpvbmwalfxm1j5x6z2krr6jia275bm5l9l19d012da17ifygjf"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Generate simple tables in terminals from nested lists")
    (description "Terminaltables3 generates simple tables in terminals from
a list of lists of strings.  It is a maintained fork of terminaltables.")
    (home-page "https://github.com/matthewdeanmartin/terminaltables3")
    (license license:expat)))

;;; python-keep — personal shell command keeper
(define-public python-keep
  (package
    (name "python-keep")
    (version "2.11")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "keep" version))
              (sha256
               (base32
                "0kfrmh3mqassdx45r84mrlqxag0clh307jjd70nbzgjyysxjzg06"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-flit-core))
    (propagated-inputs
     (list python-pygithub
           python-click
           python-requests
           python-terminaltables3))
    (synopsis "Personal shell command keeper and organizer")
    (description "Keep is a command-line tool for storing and organizing
useful shell commands.  It integrates with GitHub Gist for backup and sync.")
    (home-page "https://github.com/orkohunter/keep")
    (license license:expat)))


;;; -----------------------------------------------------------------------
;;; Main resolved packages
;;; -----------------------------------------------------------------------

;;; arcticons-icon-theme — monotone line-based icon theme for Linux
(define-public arcticons-icon-theme
  (package
    (name "arcticons-icon-theme")
    (version "12.6.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/Arcticons/Arcticons-Linux/archive/"
                    version ".tar.gz"))
              (file-name (string-append "arcticons-icon-theme-"
                                        version ".tar.gz"))
              (sha256
               (base32
                "0sryyapfl31j4zqfhyn6j3a0ayynj54r1gckl3aybgn5w5wlqyj2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("arcticons-dark" "share/icons/arcticons-dark")
               ("arcticons-light" "share/icons/arcticons-light"))))
    (synopsis "Monotone line-based icon theme for Linux desktops")
    (description "Arcticons is a monotone line-based icon theme for Linux
desktops, adapted from the Arcticons Android icon pack.  It provides dark
and light variants following the Freedesktop icon theme specification.")
    (home-page "https://codeberg.org/Arcticons/Arcticons-Linux")
    (license license:gpl3+)))

;;; chipwhisperer-udev — udev rules for ChipWhisperer hardware
(define-public chipwhisperer-udev
  (package
    (name "chipwhisperer-udev")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://raw.githubusercontent.com/newaetech/chipwhisperer/"
                    "v" version "/50-newae.rules"))
              (file-name (string-append "chipwhisperer-udev-" version
                                        "-50-newae.rules"))
              (sha256
               (base32
                "0q36kzs5gn3ddayhakwnm1d23rxcs6ay0qkl62f0n85pyqj73g19"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (assoc-ref %build-inputs "source")
                         "lib/udev/rules.d/50-newae.rules"))))
    (synopsis "Udev rules for ChipWhisperer security research hardware")
    (description "This package provides udev rules for NewAE Technology
ChipWhisperer hardware security research devices, allowing non-root access
to the USB devices.")
    (home-page "https://github.com/newaetech/chipwhisperer")
    (license license:asl2.0)))

;;; openrgb-udev-rules — udev rules for OpenRGB
(define-public openrgb-udev-rules
  (package
    (name "openrgb-udev-rules")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://openrgb.org/releases/release_" version
                    "/60-openrgb.rules"))
              (file-name (string-append "openrgb-udev-rules-" version
                                        "-60-openrgb.rules"))
              (sha256
               (base32
                "0f5bmz0q8gs26mhy4m55gvbvcyvd7c0bf92aal4dsyg9n7lyq6xp"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (assoc-ref %build-inputs "source")
                         "lib/udev/rules.d/60-openrgb.rules"))))
    (synopsis "Udev rules for OpenRGB RGB lighting control")
    (description "This package provides udev rules for the OpenRGB RGB
lighting control software, granting non-root access to supported RGB
hardware devices.")
    (home-page "https://openrgb.org")
    (license license:gpl2+)))

;;; catppuccin-mocha-grub-theme — Catppuccin Mocha theme for GRUB
(define-public catppuccin-mocha-grub-theme
  (package
    (name "catppuccin-mocha-grub-theme")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/grub")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1kgcs7dl83iwfn6q18b8frikv159an9vpx2kwacn1w2s5faaid7x"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/catppuccin-mocha-grub-theme"
                "share/grub/themes/catppuccin-mocha"))))
    (synopsis "Catppuccin Mocha theme for the GRUB bootloader")
    (description "This package provides the Catppuccin Mocha theme for the
GRUB bootloader.  Catppuccin is a soothing pastel color palette with warm
tones.")
    (home-page "https://github.com/catppuccin/grub")
    (license license:expat)))

;;; flandre-grub-theme — Flandre Scarlet themed GRUB bootloader theme
(define-public flandre-grub-theme
  (let ((commit "39394ec5db70d94c6099537801ab2e34f825c70a")
        (revision "1"))
    (package
      (name "flandre-grub-theme")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://git.jamjar.ws/strat/flandre_grub")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1031aq23z98m82cfmahv7974jm969np8l53qzq7xa9apjk2lhl2q"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("theme" "share/grub/themes/flandre"))))
      (synopsis "Flandre Scarlet themed GRUB bootloader theme")
      (description "A GRUB bootloader theme inspired by Flandre Scarlet from
the Touhou Project series.  It provides custom background, fonts, and icons
for the GRUB boot menu.")
      (home-page "https://git.jamjar.ws/strat/flandre_grub")
      (license license:expat))))

;;; sddm-lain-wired-theme — Serial Experiments Lain SDDM theme
(define-public sddm-lain-wired-theme
  (package
    (name "sddm-lain-wired-theme")
    (version "0.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lll2yu/sddm-lain-wired-theme")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0b0jqsxk9w2x7mmdnxipmd57lpj6sjj7il0cnhy0jza0vzssry4j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sddm/themes/lain-wired/"))))
    (synopsis "Serial Experiments Lain themed SDDM login screen")
    (description "A login theme for the SDDM display manager inspired by
the anime Serial Experiments Lain.  It features animated GIF backgrounds
and themed visual elements.")
    (home-page "https://github.com/lll2yu/sddm-lain-wired-theme")
    (license license:cc-by-sa4.0)))

;;; multicolor-sddm-theme — terminal colorscheme SDDM themes
(define-public multicolor-sddm-theme
  (let ((commit "798507a2362459a6084d7c140c67c23702913c8c")
        (revision "1"))
    (package
      (name "multicolor-sddm-theme")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://gitlab.com/dwt1/multicolor-sddm-theme")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "18hdphxrs165qvk6by19wf07dmrxg26nd678wgri1q3sdqf6p9rb"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("Starter"
                  "share/sddm/themes/multicolor-starter")
                 ("Where is Everybody?"
                  "share/sddm/themes/multicolor-where"))))
      (synopsis "SDDM themes based on terminal colorschemes")
      (description "Multicolor SDDM theme is a collection of SDDM display
manager themes based on popular terminal colorschemes.  It includes variants
inspired by Doom One, Dracula, Nord, and other color palettes.")
      (home-page "https://gitlab.com/dwt1/multicolor-sddm-theme")
      (license license:gpl3+))))

;;; nwg-wrapper — desktop widget wrapper for wlroots compositors
(define-public nwg-wrapper
  (package
    (name "nwg-wrapper")
    (version "0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nwg-piotr/nwg-wrapper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1svyfrfvpj9bzi202gwki4r0zsj3lhxjhis112fsgvds6dvc180q"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (inputs
     (list gtk+
           gtk-layer-shell))
    (propagated-inputs
     (list python-pygobject
           python-i3ipc))
    (synopsis "Wrapper to display script output on wlroots desktops")
    (description "Nwg-wrapper is a GTK3-based tool for displaying script
output or text file content as widgets on the desktop in Sway and other
wlroots-based Wayland compositors.  It uses gtk-layer-shell for positioning.")
    (home-page "https://github.com/nwg-piotr/nwg-wrapper")
    (license license:expat)))

;;; howdoi — instant coding answers via the command line
(define-public howdoi
  (package
    (name "howdoi")
    (version "2.0.20")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "howdoi" version))
              (sha256
               (base32
                "1ag2qdmclqs7km6hlkxba0ivx0ri8avhwj4gm26qy3qc7v2l1kai"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-pygments
           python-cssselect
           python-lxml
           python-pyquery
           python-requests
           python-cachelib
           python-appdirs
           python-keep
           python-rich
           python-colorama))
    (synopsis "Instant coding answers via the command line")
    (description "Howdoi provides instant coding answers from the command
line by scraping Stack Overflow.  It searches for programming questions
and returns concise code snippets as answers.")
    (home-page "https://github.com/gleitz/howdoi")
    (license license:expat)))

;;; rsvndump — remote Subversion repository dump tool
(define-public rsvndump
  (package
    (name "rsvndump")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/rsvndump/rsvndump/rsvndump-"
                    version "/rsvndump-" version ".tar.bz2"))
              (sha256
               (base32
                "00kcqqwb3cb6n5y5c3k0r5z2fngjnnmzacq5blg9ijwww3qh7nmj"))))
    (build-system gnu-build-system)
    (inputs
     (list subversion apr))
    (synopsis "Dump a remote Subversion repository")
    (description "Rsvndump is a command-line tool that produces an
@command{svnadmin}-compatible dump of a remote Subversion repository without
requiring local filesystem access to the repository.  It is useful for
migrating repositories between servers or converting them to other formats.")
    (home-page "https://rsvndump.sourceforge.io/")
    (license license:gpl3+)))

;;; ubuntu-wallpapers — default wallpapers from Ubuntu releases
(define-public ubuntu-wallpapers
  (package
    (name "ubuntu-wallpapers")
    (version "26.04.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://archive.ubuntu.com/ubuntu/pool/main/u/"
                    "ubuntu-wallpapers/ubuntu-wallpapers_"
                    version ".orig.tar.gz"))
              (sha256
               (base32
                "06j1d5bb63mj2wq6kg9621m3gbwafc3wzif0ilbxz4my070zqa39"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/backgrounds/ubuntu/"
                #:exclude ("setup.py" "setup.cfg" "debian"
                           "ubuntu-wallpapers.xml.in"
                           "ubuntu-wallpapers-noble.xml.in"
                           "COPYING")))))
    (synopsis "Default wallpaper images from Ubuntu releases")
    (description "This package provides the default desktop wallpaper images
from various Ubuntu releases.  The collection includes both photographic and
abstract artwork.")
    (home-page "https://launchpad.net/ubuntu-wallpapers")
    (license license:cc-by-sa3.0)))
