;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418h
;;; Resolves 28 NEEDS_RECIPE_DESIGN packages.
;;; 2 packages marked BLOCKED with exhausted reasons.
;;;
;;; New recipes (28):
;;;    1.  ttf-symbola (font-build-system, v14.00, custom)
;;;    2.  otf-symbola (font-build-system, v14.00, custom)
;;;    3.  svxlink-sounds-en-us-heather-16k (copy-build-system, v25.05, GPL-2.0)
;;;    4.  devkit-env (trivial-build-system, v1.0.1, GPL-3.0+)
;;;    5.  random (gnu-build-system, v1.3, MIT)
;;;    6.  kak-ansi (gnu-build-system, v0.2.8, Unlicense)
;;;    7.  jelly (copy-build-system, v3.5.0, 0BSD)
;;;    8.  fladder-bin (copy-build-system, v0.10.3, GPL-3.0+)
;;;    9.  parm-bin (copy-build-system, v0.1.6, GPL-3.0)
;;;   10.  opendeck-bin (gnu-build-system, v2.11.1, GPL-3.0+)
;;;   11.  vkd3d-proton-bin (copy-build-system, v3.0b, LGPL-2.1+)
;;;   12.  piliplus-bin (copy-build-system, v2.0.4, GPL-3.0+)
;;;   13.  hyprshell-bin (copy-build-system, v4.9.5, MIT)
;;;   14.  python-pandas-docs (copy-build-system, v2.2.3, BSD-3)
;;;   15.  desktopius (meson-build-system, v1.0.8, GPL-3.0+)
;;;   16.  nextcloud-app-user-usage-report (copy-build-system, v4.0.0, AGPL-3.0+)
;;;   17.  kak-bundle-git (copy-build-system, git, 0BSD)
;;;   18.  duperemove-service (copy-build-system, v1.1.0, GPL-3.0+)
;;;   19.  tlp-rdw-systemd (copy-build-system, v1.0.1, GPL-3.0+)
;;;   20.  mii-emu (gnu-build-system, v1.97, MIT)
;;;   21.  sedutil (gnu-build-system, v1.49.13, GPL-3.0+)
;;;   22.  motion-git (gnu-build-system, v4.7.1, GPL-2.0+)
;;;   23.  nikki-editor (gnu-build-system, v0.2.1, MIT)
;;;   24.  responder (pyproject-build-system, v3.1.7.0, GPL-3.0+)
;;;   25.  libreoffice-extension-h2orestart (copy-build-system, v0.7.11, GPL-3.0+)
;;;   26.  pipewire-module-xrdp (gnu-build-system, v0.2, MIT)
;;;   27.  libnick (cmake-build-system, v2025.10.0, GPL-3.0+)
;;;   28.  maddy (go-build-system, v0.7.1, GPL-3.0+)
;;;
;;; Blocked (2):
;;;   29.  gde-creator-bin --- NO_LICENSE: upstream repo has no license file
;;;   30.  rice-switcher --- UPSTREAM_DELETED: repo S1rEx1/Rice-Switcher returns 404
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:export (
            ttf-symbola
            otf-symbola
            svxlink-sounds-en-us-heather-16k
            devkit-env
            random
            kak-ansi
            jelly
            fladder-bin
            parm-bin
            opendeck-bin
            vkd3d-proton-bin
            piliplus-bin
            hyprshell-bin
            python-pandas-docs
            desktopius
            nextcloud-app-user-usage-report
            kak-bundle-git
            duperemove-service
            tlp-rdw-systemd
            mii-emu
            sedutil
            motion-git
            nikki-editor
            responder
            libreoffice-extension-h2orestart
            pipewire-module-xrdp
            libnick
            maddy
            ))


;;; ===================================================================
;;; FONT PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. ttf-symbola --- Unicode symbol font (TrueType)
;;; Source: Wayback Machine archive of dn-works.com PDF
;;; -------------------------------------------------------------------
(define-public ttf-symbola
  (package
    (name "ttf-symbola")
    (version "14.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://web.archive.org/web/20240107144224/"
                    "https://dn-works.com/wp-content/uploads/2021/"
                    "UFAS121921/Symbola.pdf"))
              (file-name "Symbola.pdf")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "Symbola.pdf")))
               (add-before 'install 'extract-fonts
                 (lambda _
                   (invoke "pdfdetach" "-saveall" "Symbola.pdf")
                   (delete-file "Symbola.otf"))))))
    (native-inputs (list poppler))
    (home-page "https://dn-works.com/ufas/")
    (synopsis "font for Unicode symbol blocks (TrueType)")
    (description "Symbola covers many symbol blocks of the Unicode Standard
including Mathematical Operators, Musical Symbols, Braille Patterns, Playing
Cards, Domino Tiles, and Mahjong Tiles.  This package provides the TrueType
format variant.")
    (license (license:non-copyleft
              "https://dn-works.com/ufas/"
              "Custom; free for personal, charity, and UFAS use"))))

;;; -------------------------------------------------------------------
;;; 2. otf-symbola --- Unicode symbol font (OpenType)
;;; -------------------------------------------------------------------
(define-public otf-symbola
  (package
    (inherit ttf-symbola)
    (name "otf-symbola")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "Symbola.pdf")))
               (add-before 'install 'extract-fonts
                 (lambda _
                   (invoke "pdfdetach" "-saveall" "Symbola.pdf")
                   (delete-file "Symbola.ttf"))))))
    (synopsis "font for Unicode symbol blocks (OpenType)")
    (description "Symbola covers many symbol blocks of the Unicode Standard
including Mathematical Operators, Musical Symbols, Braille Patterns, Playing
Cards, Domino Tiles, and Mahjong Tiles.  This package provides the OpenType
format variant.")))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (data, scripts, plugins)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 3. svxlink-sounds-en-us-heather-16k --- SvxLink English voice pack
;;; -------------------------------------------------------------------
(define-public svxlink-sounds-en-us-heather-16k
  (package
    (name "svxlink-sounds-en-us-heather-16k")
    (version "25.05")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sm0svx/svxlink-sounds-en_US-heather"
                    "/releases/download/" version
                    "/svxlink-sounds-en_US-heather-16k-" version ".tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/svxlink/sounds/en_US/heather/16k/"))))
    (home-page "https://github.com/sm0svx/svxlink-sounds-en_US-heather")
    (synopsis "english language pack for SvxLink server (voice Heather)")
    (description "This package provides the English (US) language sound files
for the SvxLink amateur radio repeater system.  The voice talent is Heather,
sampled at 16 kHz.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. devkit-env --- devkitPro environment settings
;;; No upstream source; script generated inline.
;;; -------------------------------------------------------------------
(define-public devkit-env
  (package
    (name "devkit-env")
    (version "1.0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((dir (string-append #$output "/etc/profile.d")))
                 (mkdir-p dir)
                 (with-output-to-file (string-append dir "/devkit-env.sh")
                   (lambda ()
                     (display "export DEVKITPRO=/opt/devkitpro\n")
                     (display "export DEVKITARM=${DEVKITPRO}/devkitARM\n")
                     (display "export DEVKITPPC=${DEVKITPRO}/devkitPPC\n")
                     (display
                      "export PATH=${DEVKITPRO}/tools/bin:$PATH\n")))))))
    (home-page "https://devkitpro.org/")
    (synopsis "environment settings for devkitPro supplied tools")
    (description "Devkit-env provides shell environment variable settings for
the devkitPro homebrew development toolchains.  It configures DEVKITPRO,
DEVKITARM, and DEVKITPPC paths and adds devkitPro tools to PATH.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. jelly --- CLI tool to explore and stream Jellyfin media
;;; Runtime deps: chafa, curl, fzf, jq, mpv, socat
;;; -------------------------------------------------------------------
(define-public jelly
  (package
    (name "jelly")
    (version "3.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AzureHound/jelly/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/jelly" "bin/jelly")
               ("src/mpv" "share/jelly/mpv"))))
    ;; NOTE: Runtime deps chafa, curl, fzf, jq, mpv, socat need wrapping
    ;; into PATH.  These should be added as inputs once module paths are
    ;; confirmed.
    (home-page "https://github.com/AzureHound/jelly")
    (synopsis "explore and stream Jellyfin media from the command line")
    (description "Jelly is a bash script that lets you explore and stream
media from a Jellyfin server directly in the terminal.  It uses fzf for
selection, mpv for playback, and chafa for thumbnail previews.")
    (license license:public-domain)))  ;; 0BSD

;;; -------------------------------------------------------------------
;;; 6. kak-bundle-git --- plugin manager for Kakoune
;;; -------------------------------------------------------------------
(define-public kak-bundle-git
  (package
    (name "kak-bundle-git")
    (version "0-1.5b49521")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/jdugan6240/kak-bundle")
                    (commit "5b49521f1f00a4bc9a0b12aff05d945e29b82fd3")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rc" "share/kak/autoload/plugins/kak-bundle/")
               ("doc" "share/doc/kak-bundle/"))))
    (home-page "https://codeberg.org/jdugan6240/kak-bundle")
    (synopsis "plugin manager for the Kakoune text editor")
    (description "Kak-bundle is a plugin manager for the Kakoune text editor.
It provides commands for installing, updating, and removing Kakoune plugins
from within the editor.")
    (license license:public-domain)))  ;; 0BSD

;;; -------------------------------------------------------------------
;;; 7. duperemove-service --- systemd service for duperemove
;;; -------------------------------------------------------------------
(define-public duperemove-service
  (package
    (name "duperemove-service")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/mek101/duperemove-service/archive/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("duperemove-service" "bin/duperemove-service")
               ("duperemove@.service"
                "lib/systemd/system/duperemove@.service")
               ("duperemove@.timer"
                "lib/systemd/system/duperemove@.timer")
               ("target-defaults.conf"
                "share/duperemove-service/target-defaults.conf"))))
    (home-page "https://codeberg.org/mek101/duperemove-service")
    (synopsis "systemd service for scheduled filesystem deduplication")
    (description "Duperemove-service provides a systemd service and timer for
running duperemove on a schedule.  It automates filesystem block deduplication
on Btrfs and XFS volumes.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. tlp-rdw-systemd --- TLP radio device watchdog for systemd-networkd
;;; -------------------------------------------------------------------
(define-public tlp-rdw-systemd
  (package
    (name "tlp-rdw-systemd")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OJFord/tlp-rdw-systemd/archive/refs"
                    "/tags/v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tlp-rdw.service" "lib/systemd/system/tlp-rdw.service")
               ("tlp-rdw.path" "lib/systemd/system/tlp-rdw.path"))))
    (home-page "https://github.com/OJFord/tlp-rdw-systemd")
    (synopsis "TLP radio device watchdog using systemd-networkd")
    (description "Tlp-rdw-systemd provides a systemd-networkd based
alternative to TLP's Radio Device Watchdog that normally requires
NetworkManager.  It enables automatic toggling of Wi-Fi and Bluetooth
radios based on network connection state.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9. nextcloud-app-user-usage-report --- Nextcloud usage reporting
;;; -------------------------------------------------------------------
(define-public nextcloud-app-user-usage-report
  (package
    (name "nextcloud-app-user-usage-report")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nextcloud/user_usage_report"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nextcloud/apps/user_usage_report/"
                #:exclude (".git" ".github" "tests")))))
    (home-page "https://github.com/nextcloud/user_usage_report")
    (synopsis "Nextcloud app for generating user usage reports")
    (description "User Usage Report is a Nextcloud application that provides
administrators with reports on user activity.  It tracks storage usage,
file counts, and last login times for all users on the Nextcloud instance.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 10. python-pandas-docs --- documentation for Python Pandas
;;; NOTE: AUR v2.3.1 docs are 404 on pydata.org; using v2.2.3 instead.
;;; -------------------------------------------------------------------
(define-public python-pandas-docs
  (package
    (name "python-pandas-docs")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pandas.pydata.org/pandas-docs/version/"
                    version "/pandas.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/doc/python-pandas/html/"))))
    (home-page "https://pandas.pydata.org/")
    (synopsis "documentation for the Python Pandas data analysis library")
    (description "This package provides the pre-built HTML documentation for
the Pandas data analysis and manipulation library for Python.  It includes
the API reference, user guide, and tutorials.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11. libreoffice-extension-h2orestart --- HWP import for LibreOffice
;;; -------------------------------------------------------------------
(define-public libreoffice-extension-h2orestart
  (package
    (name "libreoffice-extension-h2orestart")
    (version "0.7.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ebandal/H2Orestart/releases/download/v"
                    version "/H2Orestart.oxt"))
              (file-name (string-append name "-" version ".oxt"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "ext")
                   (copy-file source "ext/H2Orestart.oxt"))))
           #:install-plan
           #~'(("ext/H2Orestart.oxt"
                "share/libreoffice/extensions/H2Orestart.oxt"))))
    (home-page "https://github.com/ebandal/H2Orestart")
    (synopsis "LibreOffice extension for importing HWP and HWPX files")
    (description "H2Orestart is a LibreOffice extension that enables reading
Hangul Word Processor (HWP) and HWPX document formats.  It allows opening
and converting Korean government and office documents in LibreOffice.")
    (license license:gpl3+)))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (prebuilt binaries)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 12. fladder-bin --- Jellyfin frontend (Flutter)
;;; -------------------------------------------------------------------
(define-public fladder-bin
  (package
    (name "fladder-bin")
    (version "0.10.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DonutWare/Fladder/releases/download/v"
                    version "/Fladder-Linux-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fladder/"
                #:exclude ("LICENSES")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-binary-link
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/fladder/fladder")
                              (string-append out "/bin/fladder"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DonutWare/Fladder")
    (synopsis "simple Jellyfin frontend built with Flutter")
    (description "Fladder is a cross-platform Jellyfin media server client
built with Flutter.  It provides a clean interface for browsing and playing
media from a Jellyfin server.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. parm-bin --- package manager using GitHub Releases
;;; -------------------------------------------------------------------
(define-public parm-bin
  (package
    (name "parm-bin")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alxrw/parm/releases/download/v"
                    version "/parm-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("parm" "bin/parm"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alxrw/parm")
    (synopsis "cross-platform package manager using GitHub Releases")
    (description "Parm is a command-line package manager that installs
software directly from GitHub Releases.  It tracks installed packages
and supports updates and removal.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. opendeck-bin --- stream controller device application
;;; Distributed as .deb; extracted with ar + tar.
;;; -------------------------------------------------------------------
(define-public opendeck-bin
  (package
    (name "opendeck-bin")
    (version "2.11.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nekename/OpenDeck/releases/download/v"
                    version "/opendeck_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (let ((data-tar (car (find-files "." "^data\\.tar"))))
                     (invoke "tar" "xf" data-tar))))
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (copy-recursively "usr" out)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nekename/OpenDeck")
    (synopsis "cross-platform stream controller device application")
    (description "OpenDeck is an application for controlling Elgato Stream
Deck and compatible devices.  It provides a graphical interface for
configuring button actions, profiles, and integrations.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. vkd3d-proton-bin --- Direct3D 12 to Vulkan translation library
;;; -------------------------------------------------------------------
(define-public vkd3d-proton-bin
  (package
    (name "vkd3d-proton-bin")
    (version "3.0b")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/HansKristian-Work/vkd3d-proton"
                    "/releases/download/v" version
                    "/vkd3d-proton-" version ".tar.zst"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("x64" "share/vkd3d-proton/x64/")
               ("x86" "share/vkd3d-proton/x86/")
               ("setup_vkd3d_proton.sh"
                "bin/setup_vkd3d_proton.sh"))))
    (native-inputs (list zstd))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/HansKristian-Work/vkd3d-proton")
    (synopsis "Direct3D 12 to Vulkan translation library for Proton")
    (description "Vkd3d-proton is a fork of vkd3d that translates Direct3D 12
API calls to Vulkan, used by Proton to run Windows games on Linux.  This
package provides prebuilt DLL libraries for use with Wine and Proton.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 16. piliplus-bin --- Bilibili third-party client
;;; -------------------------------------------------------------------
(define-public piliplus-bin
  (package
    (name "piliplus-bin")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bggRGjQaUbCoE/PiliPlus"
                    "/releases/download/" version
                    "/PiliPlus_linux_" version "%2B4848_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/piliplus/"
                #:exclude ("LICENSES")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-binary-link
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/piliplus/PiliPlus")
                              (string-append out "/bin/piliplus"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bggRGjQaUbCoE/PiliPlus")
    (synopsis "third-party Bilibili client built with Flutter")
    (description "PiliPlus is a third-party client for the Bilibili video
platform built with Flutter.  It provides a desktop interface for browsing,
watching, and managing Bilibili content on Linux.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17. hyprshell-bin --- GTK4 window switcher for Hyprland
;;; -------------------------------------------------------------------
(define-public hyprshell-bin
  (package
    (name "hyprshell-bin")
    (version "4.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/H3rmt/hyprshell/releases/download/v"
                    version "/hyprshell-" version "-x86_64.tar.zst"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprshell" "bin/hyprshell"))))
    (native-inputs (list zstd))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/H3rmt/hyprshell")
    (synopsis "GTK4-based window switcher and launcher for Hyprland")
    (description "Hyprshell is a GTK4-based window switcher and application
launcher designed for the Hyprland Wayland compositor.  It provides a visual
overlay for switching between open windows and launching applications.")
    (license license:expat)))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES (source builds)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 18. random --- CLI random number generator
;;; No releases or tags; using git HEAD.
;;; -------------------------------------------------------------------
(define-public random
  (package
    (name "random")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ivanch/random")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke #$(cc-for-target) "-o" "random" "random.c")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "random" bin)))))))
    (home-page "https://github.com/ivanch/random")
    (synopsis "simple command-line random number generator")
    (description "Random is a minimal command-line tool for generating random
numbers.  It supports specifying ranges and count of random numbers to
generate, using the C standard library random facilities.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. kak-ansi --- ANSI escape code renderer for Kakoune
;;; -------------------------------------------------------------------
(define-public kak-ansi
  (package
    (name "kak-ansi")
    (version "0.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/eraserhd/kak-ansi/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (kak (string-append out
                                              "/share/kak/autoload/plugins/"
                                              "kak-ansi")))
                     (install-file "kak-ansi-filter" bin)
                     (mkdir-p kak)
                     (for-each (lambda (f) (install-file f kak))
                               (find-files "rc" "\\.kak$"))))))))
    (home-page "https://github.com/eraserhd/kak-ansi")
    (synopsis "ANSI escape code rendering plugin for Kakoune")
    (description "Kak-ansi is a Kakoune editor plugin that renders ANSI SGR
escape sequences as Kakoune face attributes.  It includes a C filter program
for processing ANSI output and Kakoune scripts for integration.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 20. mii-emu --- Apple //e emulator for Linux
;;; -------------------------------------------------------------------
(define-public mii-emu
  (package
    (name "mii-emu")
    (version "1.97")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/buserror/mii_emu/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list alsa-lib mesa glu libx11 pixman))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/buserror/mii_emu")
    (synopsis "Apple //e emulator for Linux")
    (description "MII is an Apple //e emulator for Linux that provides
accurate emulation of the Apple II enhanced computer.  It features OpenGL
rendering, disk image support, and joystick input.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. sedutil --- TCG OPAL SED management program
;;; -------------------------------------------------------------------
(define-public sedutil
  (package
    (name "sedutil")
    (version "1.49.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Drive-Trust-Alliance/sedutil"
                    "/archive/refs/tags/" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake libtool))
    (home-page "https://github.com/Drive-Trust-Alliance/sedutil")
    (synopsis "TCG OPAL 2.00 self-encrypting drive management program")
    (description "Sedutil is a command-line tool for managing self-encrypting
drives (SEDs) that comply with the TCG OPAL 2.00 standard.  It allows
setting up drive encryption, managing passwords, and locking or unlocking
the drive.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. motion-git --- software motion detector for cameras
;;; Using latest stable release (4.7.1) rather than git HEAD.
;;; -------------------------------------------------------------------
(define-public motion-git
  (package
    (name "motion-git")
    (version "4.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Motion-Project/motion/archive/refs"
                    "/tags/release-" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libjpeg-turbo sqlite ffmpeg libwebp))
    ;; NOTE: also needs libmicrohttpd; check module availability
    (native-inputs (list autoconf automake libtool pkg-config))
    (home-page "https://motion-project.github.io/")
    (synopsis "software motion detector for video cameras")
    (description "Motion is a program that monitors the video signal from
one or more cameras and is able to detect if a significant part of the
picture has changed.  It can save images, video clips, and trigger events
when motion is detected.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 23. nikki-editor --- simple terminal text editor in C
;;; -------------------------------------------------------------------
(define-public nikki-editor
  (package
    (name "nikki-editor")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nijat19trying/nikki-editor"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke #$(cc-for-target) "-Wall" "-Wextra" "-O2"
                           "src/nikki.c" "-o" "nikki")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "nikki" bin)))))))
    (home-page "https://github.com/nijat19trying/nikki-editor")
    (synopsis "simple terminal-based text editor written in C")
    (description "Nikki is a minimal terminal text editor written in C.  It
provides basic text editing functionality with a small footprint, suitable
for quick edits in a terminal environment.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. pipewire-module-xrdp --- xRDP PipeWire audio module
;;; -------------------------------------------------------------------
(define-public pipewire-module-xrdp
  (package
    (name "pipewire-module-xrdp")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neutrinolabs/pipewire-module-xrdp"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list pipewire))
    (native-inputs (list autoconf automake libtool pkg-config))
    (home-page "https://github.com/neutrinolabs/pipewire-module-xrdp")
    (synopsis "PipeWire audio redirection module for xRDP")
    (description "Pipewire-module-xrdp provides a PipeWire module that enables
audio redirection over xRDP remote desktop sessions.  It allows remote users
to hear audio from applications running on the server through their RDP
client.")
    (license license:expat)))


;;; ===================================================================
;;; MESON-BUILD-SYSTEM
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 25. desktopius --- desktop file editor
;;; NOTE: Requires 'granite' library (elementary OS) which may not be
;;; in official Guix.
;;; -------------------------------------------------------------------
(define-public desktopius
  (package
    (name "desktopius")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alexkdeveloper/dfc/archive/refs"
                    "/tags/" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list glib gtk+))
    ;; NOTE: Also requires 'granite' from elementary OS; not in Guix.
    (native-inputs (list pkg-config vala))
    (home-page "https://github.com/alexkdeveloper/dfc")
    (synopsis "application for creating and editing desktop files")
    (description "Desktopius (Desktop File Creator) is a graphical application
for creating and editing @file{.desktop} files on Linux.  It provides a
form-based interface for setting application name, executable path, icon,
categories, and other freedesktop.org desktop entry fields.")
    (license license:gpl3+)))


;;; ===================================================================
;;; PYPROJECT-BUILD-SYSTEM
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 26. responder --- LLMNR/NBT-NS/MDNS network security tool
;;; NOTE: Needs python-pdm-backend (native), python-aioquic and
;;; python-netifaces (propagated).  Some may not be in Guix.
;;; -------------------------------------------------------------------
(define-public responder
  (package
    (name "responder")
    (version "3.1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lgandx/Responder")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    ;; NOTE: Requires python-pdm-backend as build backend.
    ;; Propagated deps: python-netifaces, python-aioquic.
    (inputs (list python))
    (home-page "https://github.com/lgandx/Responder")
    (synopsis "LLMNR, NBT-NS, and MDNS poisoner for security testing")
    (description "Responder is a network security tool that answers LLMNR
(Link-Local Multicast Name Resolution), NBT-NS (NetBIOS Name Service), and
MDNS queries.  It includes built-in rogue authentication servers for
capturing credentials during authorized penetration testing.")
    (license license:gpl3+)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 27. libnick --- cross-platform base for Nickvision applications
;;; NOTE: Requires cpr, maddy (C++ markdown parser), and sqlcipher
;;; which may not be in Guix.
;;; -------------------------------------------------------------------
(define-public libnick
  (package
    (name "libnick")
    (version "2025.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NickvisionApps/libnick/archive/refs"
                    "/tags/" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    ;; NOTE: Also needs cpr, maddy (markdown parser), sqlcipher.
    (inputs (list boost glib libsecret))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/NickvisionApps/libnick")
    (synopsis "cross-platform C++ base library for Nickvision applications")
    (description "Libnick is a cross-platform C++ library providing shared
functionality for the Nickvision family of applications.  It includes
utilities for networking, database access, system notifications, keyring
integration, and application updates.")
    (license license:gpl3+)))


;;; ===================================================================
;;; GO-BUILD-SYSTEM
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 28. maddy --- composable all-in-one mail server
;;; NOTE: Go module dependency vendoring is needed for building.
;;; -------------------------------------------------------------------
(define-public maddy
  (package
    (name "maddy")
    (version "0.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/foxcpp/maddy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/foxcpp/maddy"
           #:tests? #f))
    ;; NOTE: Full Go dependency vendoring required for build.
    ;; Needs scdoc for man page generation.
    (home-page "https://github.com/foxcpp/maddy")
    (synopsis "composable all-in-one mail server")
    (description "Maddy is an all-in-one mail server that implements SMTP,
IMAP, DKIM, SPF, DMARC, and other email protocols.  It provides a single
binary deployment with a composable configuration system for building
custom mail handling pipelines.")
    (license license:gpl3+)))
