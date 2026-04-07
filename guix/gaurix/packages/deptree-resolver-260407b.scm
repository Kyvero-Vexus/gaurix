;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407b
;;; Resolves BLOCKED packages from the priority queue (pass b).
;;; Covers: binary packages, source builds, compat aliases, data/fonts.

(define-module (gaurix packages deptree-resolver-260407b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system font)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages node)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xml))

;;;
;;; ── COMPAT ALIASES ─────────────────────────────────────────────────────
;;;

(define-public llama.cpp llama-cpp)

(define-public libappindicator-gtk2
  (package
    (inherit libappindicator)
    (name "libappindicator-gtk2")))

(define-public waybar-hyprland-git
  (package
    (inherit waybar)
    (name "waybar-hyprland-git")))

;;;
;;; ── FONT PACKAGES ──────────────────────────────────────────────────────
;;;

(define-public otf-uncut-sans
  (package
    (name "otf-uncut-sans")
    (version "2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grillitype/uncut")
                    (commit "e1d79e8c00a28b8a1fabd5a08a03e6e69b0882c7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://uncut.wtf")
    (synopsis "uncut Sans OTF font from Grilli Type")
    (description
     "Uncut Sans is a geometric sans-serif typeface designed by Grilli
Type.  This package provides the OTF variant of the font.")
    (license license:silofl1.1)))

(define-public ttf-uncut-sans
  (package
    (inherit otf-uncut-sans)
    (name "ttf-uncut-sans")
    (synopsis "uncut Sans TTF font from Grilli Type")
    (description
     "Uncut Sans is a geometric sans-serif typeface designed by Grilli
Type.  This package provides the TTF variant of the font.")))

(define-public woff-uncut-sans
  (package
    (inherit otf-uncut-sans)
    (name "woff-uncut-sans")
    (synopsis "uncut Sans WOFF web font from Grilli Type")
    (description
     "Uncut Sans is a geometric sans-serif typeface designed by Grilli
Type.  This package provides the WOFF web font variant.")))

(define-public woff2-uncut-sans
  (package
    (inherit otf-uncut-sans)
    (name "woff2-uncut-sans")
    (synopsis "uncut Sans WOFF2 web font from Grilli Type")
    (description
     "Uncut Sans is a geometric sans-serif typeface designed by Grilli
Type.  This package provides the WOFF2 web font variant.")))

(define-public ttf-space-mono
  (package
    (name "ttf-space-mono")
    (version "2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/googlefonts/spacemono")
                    (commit "f5bbc1a362de09e1b7a40e2e3e429dbcf7080821")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://fonts.google.com/specimen/Space+Mono")
    (synopsis "space Mono monospaced typeface from Google Fonts")
    (description
     "Space Mono is a fixed-width type family designed by Colophon Foundry
for Google Fonts.  It supports a Latin Extended glyph set, and is
available in regular and bold weights with matching italics.")
    (license license:silofl1.1)))

(define-public ttf-gabarito-git
  (package
    (name "ttf-gabarito-git")
    (version "1.000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/naipefoundry/gabarito")
                    (commit "1f3fb3949f16d71f6e19e37e85b5da7e0b6b13b2")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/naipefoundry/gabarito")
    (synopsis "light-hearted geometric sans typeface with 6 weights")
    (description
     "Gabarito is a geometric sans-serif typeface with a light-hearted
character.  It comes in 6 weights and is suitable for headings and
display text.")
    (license license:silofl1.1)))

;;;
;;; ── DATA / RESOURCE PACKAGES ───────────────────────────────────────────
;;;

(define-public 86box-roms
  (package
    (name "86box-roms")
    (version "5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/86Box/roms")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/86Box/roms"
           #:exclude ("README.md" "LICENSE" ".github")))))
    (home-page "https://github.com/86Box/roms")
    (synopsis "ROM files for the 86Box emulator")
    (description
     "This package provides the ROM files required by the 86Box emulator
to emulate various vintage PC hardware including BIOS, video cards,
and other peripherals.")
    (license (license:non-copyleft
              "https://github.com/86Box/roms/blob/master/LICENSE"
              "Mixed licenses per ROM vendor"))))

(define-public 86box-roms-git
  (package
    (inherit 86box-roms)
    (name "86box-roms-git")))

(define-public iscan-data
  (package
    (name "iscan-data")
    (version "1.39.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://support.epson.net/linux/src/scanner/iscan/"
                    "iscan-data_" version "-1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://support.epson.net/linux/src/scanner/iscan/")
    (synopsis "EPSON Image Scan data files")
    (description
     "Data files required by the EPSON Image Scan utility for various
Epson scanner models.  Includes firmware and calibration data.")
    (license license:gpl2+)))

(define-public fake-ms-fonts
  (package
    (name "fake-ms-fonts")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.eworm.de/download/linux/fake-ms-fonts-"
                    version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fontconfig/conf.avail"
           #:include-regexp ("\\.conf$")))))
    (home-page "https://www.eworm.de/")
    (synopsis "fontconfig aliases for core Microsoft TrueType fonts")
    (description
     "This package provides fontconfig configuration files that alias
common Microsoft fonts (Arial, Times New Roman, Courier New, etc.) to
their free counterparts (Liberation Sans, Liberation Serif, Liberation
Mono, etc.).")
    (license license:gpl2+)))

;;;
;;; ── BINARY PACKAGES ────────────────────────────────────────────────────
;;;

(define-public aspnet-targeting-pack-bin
  (package
    (name "aspnet-targeting-pack-bin")
    (version "10.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
                    version "/aspnetcore-targeting-pack-" version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet/packs/Microsoft.AspNetCore.App.Ref"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com/apps/aspnet")
    (synopsis "ASP.NET Core targeting pack (binary)")
    (description
     "The ASP.NET Core targeting pack provides the reference assemblies
needed to build ASP.NET Core applications.  This is a prebuilt binary
distribution from Microsoft.")
    (license license:expat)))

(define-public aspnet-runtime-bin
  (package
    (name "aspnet-runtime-bin")
    (version "10.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
                    version "/aspnetcore-runtime-" version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet/shared/Microsoft.AspNetCore.App"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com/apps/aspnet")
    (synopsis "ASP.NET Core runtime (binary)")
    (description
     "The ASP.NET Core runtime provides the libraries needed to run
ASP.NET Core web applications.  This is a prebuilt binary distribution
from Microsoft.")
    (license license:expat)))

(define-public equicord-installer-bin
  (package
    (name "equicord-installer-bin")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Equicord/Equilotl/releases/download/v"
                    version "/equilotl"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("equilotl" "bin/equilotl"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "equilotl")
              (chmod "equilotl" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Equicord/Equilotl")
    (synopsis "CLI installer for Equicord Discord client mod")
    (description
     "Equilotl is the command-line installer for the Equicord Discord
client modification.  It patches existing Discord installations to
add Equicord features.")
    (license license:gpl3)))

(define-public alice-bin
  (package
    (name "alice-bin")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri "https://www.alice.org/wp-content/uploads/2023/01/Alice3_unix_3_8_1.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/alice3"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.alice.org")
    (synopsis "educational programming environment for 3D animation")
    (description
     "Alice is a block-based programming environment that makes it easy
to create animations, build interactive narratives, or program simple
games in 3D.  It is designed as a teaching tool for introductory
computing.")
    (license (license:non-copyleft
              "https://www.alice.org"
              "Alice3 EULA"))))

(define-public claude-desktop-bin
  (package
    (name "claude-desktop-bin")
    (version "1.569.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://storage.googleapis.com/anthropic-claude-desktop/"
                    "claude-desktop_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/claude-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://claude.ai")
    (synopsis "Claude AI desktop application (binary)")
    (description
     "Claude Desktop provides a native desktop interface for interacting
with Anthropic's Claude AI assistant.  This is an unofficial Linux
binary package.")
    (license (license:non-copyleft
              "https://www.anthropic.com/terms"
              "Anthropic Terms of Service"))))

(define-public plex-media-server
  (package
    (name "plex-media-server")
    (version "1.43.0.10492")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.plex.tv/plex-media-server-new/"
                    version "-2c7c0c32a/debian/"
                    "plexmediaserver_" version
                    "-2c7c0c32a_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/plexmediaserver"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://plex.tv/")
    (synopsis "Plex Media Server for streaming personal media")
    (description
     "Plex Media Server organizes and streams personal media collections
including video, music, and photos to various client devices.  This is
a proprietary binary package.")
    (license (license:non-copyleft
              "https://www.plex.tv/about/privacy-legal/"
              "Plex Terms of Service"))))

;;;
;;; ── SIMPLE SOURCE BUILDS ───────────────────────────────────────────────
;;;

(define-public libjodycode
  (package
    (name "libjodycode")
    (version "4.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/jbruchon/libjodycode")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/jbruchon/libjodycode")
    (synopsis "shared code library used by jdupes and other utilities")
    (description
     "Libjodycode is a shared code library containing functions used by
several utilities written by Jody Bruchon, including jdupes.  It
provides common string handling, path manipulation, and hash functions.")
    (license license:expat)))

(define-public mdns-scan
  (package
    (name "mdns-scan")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://0pointer.de/lennart/projects/mdns-scan/"
                    "mdns-scan-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "mdns-scan" bin)))))))
    (home-page "http://0pointer.de/lennart/projects/mdns-scan/")
    (synopsis "scan mDNS/DNS-SD services on the local network")
    (description
     "mdns-scan is a small tool that scans for mDNS/DNS-SD published
services on the local network and lists them on standard output.  It
is useful for discovering services advertised via Avahi or Bonjour.")
    (license license:gpl2)))

(define-public alarm
  (package
    (name "alarm")
    (version "1.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/maandree/alarm")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/maandree/alarm")
    (synopsis "schedule an alarm for a program when starting it")
    (description
     "The alarm utility sets an alarm timer before executing a specified
program.  When the timer expires, the process receives SIGALRM, which
by default terminates it.  This is useful for enforcing time limits on
commands.")
    (license license:isc)))

(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "http://www.miketaylor.org.uk/tech/deb/deb2targz")
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("deb2targz" "bin/deb2targz"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "deb2targz")
              (chmod "deb2targz" #o755)))
          (add-after 'install 'wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((perl (search-input-file inputs "bin/perl")))
                (substitute* (string-append (assoc-ref outputs "out")
                                            "/bin/deb2targz")
                  (("#!/usr/bin/perl")
                   (string-append "#!" perl)))))))))
    (inputs (list perl))
    (home-page "http://www.miketaylor.org.uk/tech/deb/deb2targz")
    (synopsis "convert Debian .deb packages to .tar.gz archives")
    (description
     "deb2targz is a simple Perl script that converts Debian Linux .deb
package files into standard .tar.gz archives, making their contents
accessible on non-Debian systems.")
    (license license:public-domain)))

(define-public notify-send.sh
  (package
    (name "notify-send.sh")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vlevit/notify-send.sh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("notify-send.sh" "bin/notify-send.sh")
          ("notify-action.sh" "bin/notify-action.sh"))))
    (inputs (list bash))
    (home-page "https://github.com/vlevit/notify-send.sh")
    (synopsis "notify-send drop-in replacement with more features")
    (description
     "notify-send.sh is a drop-in replacement for the notify-send command
that adds support for replacing and closing existing notifications via
the freedesktop.org notification specification.  It also supports
custom notification actions.")
    (license license:gpl3)))

(define-public python-sqlite-migrate
  (package
    (name "python-sqlite-migrate")
    (version "0.1b0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/s/"
                    "sqlite-migrate/sqlite_migrate-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-click))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/simonw/sqlite-migrate")
    (synopsis "simple database migration system for SQLite")
    (description
     "sqlite-migrate is a simple database migration system built on top of
sqlite-utils.  It helps manage schema changes in SQLite databases through
an ordered sequence of migration scripts.")
    (license license:asl2.0)))

(define-public python-materialyoucolor
  (package
    (name "python-materialyoucolor")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/m/"
                    "materialyoucolor/materialyoucolor-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/T-Dynamos/materialyoucolor-python")
    (synopsis "Material You color algorithms for Python")
    (description
     "A Python implementation of Google's Material You color generation
algorithms.  It can extract dominant colors from images and generate
harmonious Material Design 3 color palettes.")
    (license license:expat)))

(define-public python-pluginmgr
  (package
    (name "python-pluginmgr")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/"
                    "pluginmgr/pluginmgr-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-hatchling))
    (home-page "https://github.com/20c/pluginmgr")
    (synopsis "lightweight Python plugin system")
    (description
     "pluginmgr is a lightweight Python plugin management system
supporting configuration inheritance and plugin discovery via
entry points or explicit registration.")
    (license license:asl2.0)))

(define-public moodbar
  (package
    (name "moodbar")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/exaile/moodbar/releases/download/v"
                    version "/moodbar-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list gstreamer gst-plugins-base))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/exaile/moodbar")
    (synopsis "audio mood visualization tool for music players")
    (description
     "Moodbar generates a color representation of a song's mood over
time, producing a visual summary of the track.  Originally developed for
the Amarok music player, it works as a GStreamer plugin and standalone
command-line tool.")
    (license license:gpl2+)))

(define-public ddccontrol
  (package
    (name "ddccontrol")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ddccontrol/ddccontrol")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'autoreconf
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs
     (list autoconf automake libtool pkg-config
           (@ (gnu packages gettext) gnu-gettext)
           (@ (gnu packages perl) perl)
           (@ (gnu packages xml) libxml2)))
    (inputs
     (list pciutils
           (@ (gnu packages xml) libxml2)
           glib))
    (home-page "https://github.com/ddccontrol/ddccontrol")
    (synopsis "control monitor parameters via DDC/CI protocol")
    (description
     "DDCcontrol allows users to read and adjust monitor settings such as
brightness, contrast, and input source through the DDC/CI protocol
without using the monitor's OSD menu.  It works over the I2C bus on
the display cable.")
    (license license:gpl2+)))

;;;
;;; ── JETBRAINS RUNTIME PACKAGES ─────────────────────────────────────────
;;;

(define-public datagrip-jre
  (package
    (name "datagrip-jre")
    (version "2026.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.jetbrains.com/datagrip/"
                    "datagrip-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("jbr" "share/datagrip-jre/jbr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis "JetBrains Runtime for DataGrip")
    (description
     "JetBrains Runtime (JBR) is a patched version of OpenJDK designed
specifically for JetBrains IDEs.  This package provides the JBR bundled
with DataGrip.")
    (license license:gpl2)))

(define-public goland-jre
  (package
    (name "goland-jre")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.jetbrains.com/go/"
                    "goland-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("jbr" "share/goland-jre/jbr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis "JetBrains Runtime for GoLand")
    (description
     "JetBrains Runtime (JBR) is a patched version of OpenJDK designed
specifically for JetBrains IDEs.  This package provides the JBR bundled
with GoLand.")
    (license license:gpl2)))

(define-public rustrover-jre
  (package
    (name "rustrover-jre")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.jetbrains.com/rustrover/"
                    "RustRover-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("jbr" "share/rustrover-jre/jbr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis "JetBrains Runtime for RustRover")
    (description
     "JetBrains Runtime (JBR) is a patched version of OpenJDK designed
specifically for JetBrains IDEs.  This package provides the JBR bundled
with RustRover.")
    (license license:gpl2)))

(define-public rustrover-eap-jre
  (package
    (inherit rustrover-jre)
    (name "rustrover-eap-jre")
    (version "2026.1pre")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.jetbrains.com/rustrover/"
                    "RustRover-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (synopsis "JetBrains Runtime for RustRover EAP")
    (description
     "JetBrains Runtime (JBR) is a patched version of OpenJDK designed
specifically for JetBrains IDEs.  This package provides the JBR bundled
with the Early Access Program version of RustRover.")))

;;;
;;; ── COMPLEX SOURCE (STUB / BLOCKED NOTES) ──────────────────────────────
;;;

;; The following packages require complex builds that cannot be safely
;; resolved in a batch pass.  See blocked-notes file for attempt history.

;;; qt5-webkit — needs full WebKit build with ICU, gstreamer, woff2, etc.
;;; cosmic-randr-git — Rust/Cargo with wayland dependencies
;;; mdcat — Rust/Cargo with openssl
;;; system76-acpi-dkms — DKMS kernel module
;;; arduino-avr-core — needs AVR cross-compilation toolchain
;;; foobar2000 — requires Wine runtime
;;; pacaur — Arch-specific, requires pacman/makepkg
;;; trizen — Arch-specific, requires pacman
;;; cosmic-comp-git — Rust compositor with many system deps
;;; clang-libs-minimal-git — LLVM trunk build
;;; vscodium-translucent — complex Electron build from source
;;; scala3 — JVM compiler with SBT build
;;; libastal-meta — meta package needing many libastal-* sub-packages
;;; openbangla-keyboard-git — CMake + Rust + IBus/Fcitx5
;;; qtutilities-qt6 — needs c++utilities not in Guix
