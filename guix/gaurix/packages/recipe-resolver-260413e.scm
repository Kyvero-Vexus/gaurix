;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413e
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 18 recipes created
;;;   - 12 blocked with specific reason codes
;;;
;;; Recipes (18):
;;;   - dotbot (pyproject, expat)
;;;   - python-pytest-archon (pyproject, asl2.0)
;;;   - asn (copy, expat)
;;;   - font-lxgw-wenkai-mono-nerd (font/copy, silofl1.1)
;;;   - font-kopubworld (font/copy, non-copyleft)
;;;   - quickemu (copy, expat)
;;;   - libre-menu-editor (copy, gpl3+)
;;;   - ppd-cpu-boost (copy, gpl3+)
;;;   - deadd-notification-center-bin (copy, bsd-3)
;;;   - nzbhydra2-bin (copy, gpl3+)
;;;   - python-markdown-editor (python, expat)
;;;   - logiops (cmake, gpl3)
;;;   - keymapper (cmake, gpl3)
;;;   - bdinfo (gnu, lgpl3)
;;;   - kvm-configurator (go, expat)
;;;   - omnidotdev-terminal-bin (copy, asl2.0)
;;;   - scmd-bin (copy, expat)
;;;   - d-feet (meson, gpl2)
;;;
;;; Blocked (12):
;;;   - nerd-fonts-sf-mono (NEEDS_RECIPE_DESIGN_EXHAUSTED)
;;;   - oopz (NEEDS_RECIPE_DESIGN_EXHAUSTED)
;;;   - cleanupdate-git (NEEDS_RECIPE_DESIGN_EXHAUSTED)
;;;   - selectdefaultapplication-git (NEEDS_RECIPE_DESIGN_EXHAUSTED)
;;;   - portablemc (NEEDS_RECIPE_DESIGN)
;;;   - ego (NEEDS_RECIPE_DESIGN)
;;;   - embellish-git (NEEDS_RECIPE_DESIGN)
;;;   - emergency-alerts (NEEDS_RECIPE_DESIGN)
;;;   - plann (NEEDS_RECIPE_DESIGN)
;;;   - vaping (NEEDS_RECIPE_DESIGN)
;;;   - python-gdbgui (NEEDS_RECIPE_DESIGN)
;;;   - nodejs-http-server (NEEDS_RECIPE_DESIGN)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages spice)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages video)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages xorg)
  #:export (
            dotbot
            python-pytest-archon
            asn
            font-lxgw-wenkai-mono-nerd
            font-kopubworld
            quickemu
            libre-menu-editor
            ppd-cpu-boost
            deadd-notification-center-bin
            nzbhydra2-bin
            python-markdown-editor
            logiops
            keymapper
            bdinfo
            kvm-configurator
            omnidotdev-terminal-bin
            scmd-bin
            d-feet
            ))

;;; ── dotbot ─────────────────────────────────────────────────────────
;;; Dotfiles bootstrapper
;;; AUR: dotbot  →  Guix: dotbot
;;; Upstream: https://github.com/anishathalye/dotbot
;;;
(define-public dotbot
  (package
    (name "dotbot")
    (version "1.24.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/anishathalye/dotbot")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-pyyaml))
    (synopsis "tool that bootstraps your dotfiles")
    (description
     "Dotbot is a tool that bootstraps your dotfiles by creating symlinks,
running shell commands, and performing other setup tasks based on a YAML
configuration file.  It is designed to be used as a git submodule in a
dotfiles repository.")
    (home-page "https://github.com/anishathalye/dotbot")
    (license license:expat)))

;;; ── python-pytest-archon ───────────────────────────────────────────
;;; Pytest plugin for enforcing architectural rules
;;; AUR: python-pytest-archon  →  Guix: python-pytest-archon
;;; Upstream: https://github.com/jwbargsten/pytest-archon
;;;
(define-public python-pytest-archon
  (package
    (name "python-pytest-archon")
    (version "0.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jwbargsten/pytest-archon")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (propagated-inputs (list python-pytest))
    (synopsis "pytest plugin for enforcing architectural rules in Python")
    (description
     "pytest-archon is a pytest plugin for enforcing architectural rules in
Python projects, inspired by Java's ArchUnit.  It allows writing tests that
verify module dependency constraints, ensuring that certain modules do not
import from others.")
    (home-page "https://github.com/jwbargsten/pytest-archon")
    (license license:asl2.0)))

;;; ── asn ────────────────────────────────────────────────────────────
;;; ASN/RPKI/BGP lookup tool (bash script)
;;; AUR: asn-git  →  Guix: asn
;;; Upstream: https://github.com/nitefood/asn
;;;
(define-public asn
  (package
    (name "asn")
    (version "0.81.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nitefood/asn")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("asn" "bin/asn")
               ("asn.1" "share/man/man1/asn.1"))))
    (inputs (list bash curl whois mtr jq nmap))
    (synopsis "ASN/RPKI/BGP/IP lookup and network reconnaissance tool")
    (description
     "ASN is a comprehensive bash script for performing ASN lookups, RPKI
validation, BGP stats, IPv4/IPv6 prefix lookups, IP geolocation,
traceroutes with ASN annotation, and more.  It queries multiple data
sources including RIPE, Team Cymru, and Shodan.")
    (home-page "https://github.com/nitefood/asn")
    (license license:expat)))

;;; ── font-lxgw-wenkai-mono-nerd ─────────────────────────────────────
;;; CJK Nerd Font variant of LXGW WenKai
;;; AUR: ttf-lxgw-wenkai-mono-nerd  →  Guix: font-lxgw-wenkai-mono-nerd
;;; Upstream: https://github.com/Yikai-Liao/LxgwWenKaiNerdFont
;;;
(define-public font-lxgw-wenkai-mono-nerd
  (package
    (name "font-lxgw-wenkai-mono-nerd")
    (version "1.522")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yikai-Liao/LxgwWenKaiNerdFont"
             "/releases/download/v" version
             "/LXGWWenKaiMonoNerdFont.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/lxgw-wenkai-mono-nerd/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "LXGW WenKai Mono font patched with Nerd Fonts glyphs")
    (description
     "This package provides the LXGW WenKai CJK font, a beautiful
open-source Chinese font, patched with Nerd Font icons in the Mono
(fixed-width) variant.  It is suitable for use in terminal emulators and
code editors.")
    (home-page "https://github.com/Yikai-Liao/LxgwWenKaiNerdFont")
    (license license:silofl1.1)))

;;; ── font-kopubworld ────────────────────────────────────────────────
;;; Korean KoPub World multilingual OTF fonts
;;; AUR: otf-kopubworld  →  Guix: font-kopubworld
;;; Upstream: https://www.kopus.org/biz-electronic-font2
;;;
(define-public font-kopubworld
  (package
    (name "font-kopubworld")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.kopus.org/wp-content/uploads/2021/03/KOPUBWORLD_OTF_FONTS.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/kopubworld/"
                #:include-regexp ("\\.otf$")))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-fonts
                 (lambda _
                   ;; The zip may contain nested directories with OTF files.
                   #t)))))
    (native-inputs (list unzip))
    (synopsis "KoPub World multilingual Korean OpenType fonts")
    (description
     "KoPubWorld is a family of six OpenType fonts (Dotum Light/Medium/Bold,
Batang Light/Medium/Bold) developed by the Korean Publishers Association
(KOPUS).  The fonts are free for personal and commercial use and cover
Korean, Latin, and other scripts.")
    (home-page "https://www.kopus.org/biz-electronic-font2")
    (license (license:non-copyleft
              "https://www.kopus.org/biz-electronic-font2"
              "KOPUS font license: free for personal and commercial use"))))

;;; ── quickemu ───────────────────────────────────────────────────────
;;; Quickly create and run virtual machines
;;; AUR: quickemu  →  Guix: quickemu
;;; Upstream: https://github.com/quickemu-project/quickemu
;;;
(define-public quickemu
  (package
    (name "quickemu")
    (version "4.9.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/quickemu-project/quickemu")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("quickemu" "bin/quickemu")
               ("quickget" "bin/quickget")
               ("quickreport" "bin/quickreport")
               ("chunkcheck" "bin/chunkcheck")
               ("docs/quickemu.1" "share/man/man1/quickemu.1")
               ("docs/quickget.1" "share/man/man1/quickget.1"))))
    (inputs (list bash coreutils grep jq curl wget sed
                  spice-gtk))
    (synopsis "quickly create and run optimised virtual machines")
    (description
     "Quickemu is a collection of shell scripts that automate creating and
running QEMU virtual machines.  It automatically configures optimal
settings for various guest operating systems including Windows, macOS,
and many Linux distributions.  Uses QEMU, SPICE, and UEFI firmware.")
    (home-page "https://github.com/quickemu-project/quickemu")
    (license license:expat)))

;;; ── libre-menu-editor ──────────────────────────────────────────────
;;; GTK4 application menu editor
;;; AUR: libre-menu-editor  →  Guix: libre-menu-editor
;;; Upstream: https://codeberg.org/libre-menu-editor/libre-menu-editor
;;;
(define-public libre-menu-editor
  (package
    (name "libre-menu-editor")
    (version "1.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/libre-menu-editor/libre-menu-editor"
             "/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("export/" "")
               ("libre-menu-editor/" "share/libre-menu-editor/"))))
    (inputs (list python-wrapper python-pygobject gtk))
    (synopsis "customize the Linux application menu via a GTK4 GUI")
    (description
     "Libre Menu Editor is a Python/GTK4/libadwaita application for customizing
Linux desktop application menus by editing @file{.desktop} files.  It provides
a clean adaptive interface for modifying menu launchers, setting default
applications, and managing custom launchers.")
    (home-page "https://codeberg.org/libre-menu-editor/libre-menu-editor")
    (license license:gpl3+)))

;;; ── ppd-cpu-boost ──────────────────────────────────────────────────
;;; Synchronize CPU Turbo Boost with power-profiles-daemon
;;; AUR: ppd-cpu-boost  →  Guix: ppd-cpu-boost
;;; Upstream: https://github.com/quinsaiz/ppd-cpu-boost
;;;
(define-public ppd-cpu-boost
  (package
    (name "ppd-cpu-boost")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/quinsaiz/ppd-cpu-boost")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ppd-cpu-boost" "bin/ppd-cpu-boost"))))
    (inputs (list python-wrapper python-pygobject))
    (synopsis "synchronize CPU Turbo Boost state with power-profiles-daemon")
    (description
     "ppd-cpu-boost is a Python script that synchronizes CPU Turbo Boost
enable/disable state with the active power profile managed by
power-profiles-daemon (PPD).  When a performance profile is active, turbo
boost is enabled; when a power-saving profile is active, it is disabled.
Works with both Intel and AMD CPUs.")
    (home-page "https://github.com/quinsaiz/ppd-cpu-boost")
    (license license:gpl3+)))

;;; ── deadd-notification-center-bin ──────────────────────────────────
;;; Customizable notification daemon (pre-built binary)
;;; AUR: deadd-notification-center-bin  →  Guix: deadd-notification-center-bin
;;; Upstream: https://github.com/phuhl/linux_notification_center
;;;
(define-public deadd-notification-center-bin
  (package
    (name "deadd-notification-center-bin")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/phuhl/linux_notification_center"
             "/releases/download/" version
             "/deadd-notification-center"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("deadd-notification-center" "bin/deadd-notification-center"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "deadd-notification-center")
                   (chmod "deadd-notification-center" #o755))))))
    (inputs (list gtk+))
    (synopsis "customizable notification daemon with notification center")
    (description
     "A notification daemon written in Haskell that displays system
notifications via D-Bus.  It features a notification center, customizable
CSS styling, action buttons, and progress bars.  Configuration is done
through YAML files.")
    (home-page "https://github.com/phuhl/linux_notification_center")
    (license license:bsd-3)))

;;; ── nzbhydra2-bin ──────────────────────────────────────────────────
;;; Usenet meta search aggregator (Java binary)
;;; AUR: nzbhydra2-bin  →  Guix: nzbhydra2-bin
;;; Upstream: https://github.com/theotherp/nzbhydra2
;;;
(define-public nzbhydra2-bin
  (package
    (name "nzbhydra2-bin")
    (version "8.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/theotherp/nzbhydra2"
             "/releases/download/v" version
             "/nzbhydra2-" version "-amd64-linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nzbhydra2/"
                #:include-regexp (".*")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/nzbhydra2")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/nzbhydra2")
                       (lambda (port)
                         (format port "#!~a~%exec ~a/nzbhydra2 \"$@\"~%"
                                 (which "bash") share)))
                     (chmod (string-append bin "/nzbhydra2") #o755)))))))
    (native-inputs (list unzip))
    (inputs (list bash))
    (synopsis "usenet meta search aggregator for newznab indexers")
    (description
     "NZBHydra2 is a meta search tool that aggregates Usenet newsgroup
indexers and torrent trackers, enabling unified searching for media
content.  The backend uses Java with Spring Boot and an H2 database.")
    (home-page "https://github.com/theotherp/nzbhydra2")
    (license license:gpl3+)))

;;; ── python-markdown-editor ─────────────────────────────────────────
;;; Standalone Markdown editor in the browser
;;; AUR: markdown-editor  →  Guix: python-markdown-editor
;;; Upstream: https://github.com/ncornette/Python-Markdown-Editor
;;;
(define-public python-markdown-editor
  (package
    (name "python-markdown-editor")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/M/Markdown-Editor/"
             "Markdown-Editor-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-markdown
           python-pygments
           python-bottle
           python-pymdown-extensions))
    (synopsis "standalone editor for your Markdown files")
    (description
     "Python-Markdown-Editor is a lightweight standalone Markdown editor that
runs in the browser using the Bottle web framework.  It provides live
preview, syntax highlighting via Pygments, and GitHub Flavored Markdown
support through pymdown-extensions.")
    (home-page "https://github.com/ncornette/Python-Markdown-Editor")
    (license license:expat)))

;;; ── logiops ────────────────────────────────────────────────────────
;;; Userspace driver for HID++ Logitech devices
;;; AUR: logiops  →  Guix: logiops
;;; Upstream: https://github.com/PixlOne/logiops
;;;
(define-public logiops
  (package
    (name "logiops")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PixlOne/logiops/releases/download/v"
             version "/logiops-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config cmake))
    (inputs (list libevdev eudev libconfig glib))
    (synopsis "unofficial userspace driver for HID++ Logitech devices")
    (description
     "LogiOps is a C++ userspace driver for Logitech mice and keyboards that
use the HID++ protocol.  It supports per-device configuration of buttons,
gestures, scroll, DPI, and smartshift.  It runs as a system service.")
    (home-page "https://github.com/PixlOne/logiops")
    (license license:gpl3)))

;;; ── keymapper ──────────────────────────────────────────────────────
;;; Cross-platform context-aware key remapper
;;; AUR: keymapper  →  Guix: keymapper
;;; Upstream: https://github.com/houmain/keymapper
;;;
(define-public keymapper
  (package
    (name "keymapper")
    (version "5.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/houmain/keymapper")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config cmake))
    (inputs (list eudev libx11 dbus))
    (synopsis "cross-platform context-aware key remapper")
    (description
     "Keymapper allows redefining keyboard layouts and shortcuts system-wide
or per application.  It supports managing all keyboard shortcuts in a
single configuration file and using mouse buttons in mappings.  The daemon
(keymapperd) intercepts input and applies remappings.")
    (home-page "https://github.com/houmain/keymapper")
    (license license:gpl3)))

;;; ── bdinfo ─────────────────────────────────────────────────────────
;;; Blu-ray disc info and track extraction tool
;;; AUR: bdinfo-git  →  Guix: bdinfo
;;; Upstream: https://github.com/schnusch/bdinfo
;;;
(define-public bdinfo
  (package
    (name "bdinfo")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/schnusch/bdinfo")
             (commit "041c7603be2c6a0680434507647628b8254e4f4e")))
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
                     (install-file "bdinfo" bin)))))))
    (inputs (list libbluray))
    (native-inputs (list pkg-config))
    (synopsis "get Blu-ray info and extract tracks with metadata")
    (description
     "bdinfo is a C command-line utility that retrieves Blu-ray disc metadata
and extracts audio/video tracks including language information and chapter
data.  It uses libbluray for disc access and provides capabilities not
available through ffmpeg alone.")
    (home-page "https://github.com/schnusch/bdinfo")
    (license license:lgpl3)))

;;; ── kvm-configurator ───────────────────────────────────────────────
;;; Terminal helper for creating KVM virtual machines
;;; AUR: kvm-configurator  →  Guix: kvm-configurator
;;; Upstream: https://github.com/mrtoadie/kvm-configurator
;;;
(define-public kvm-configurator
  (package
    (name "kvm-configurator")
    (version "1.0.9.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mrtoadie/kvm-configurator")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/mrtoadie/kvm-configurator"
           #:tests? #f
           #:install-source? #f))
    (synopsis "terminal helper for creating KVM virtual machines")
    (description
     "kvm-configurator is a Go CLI tool that provides an interactive terminal
interface for creating and configuring KVM/QEMU virtual machines using
virt-install.  It loads OS configuration from a YAML file and saves VM
configurations as XML files.")
    (home-page "https://github.com/mrtoadie/kvm-configurator")
    (license license:expat)))

;;; ── omnidotdev-terminal-bin ────────────────────────────────────────
;;; GPU-accelerated terminal emulator (pre-built binary)
;;; AUR: omnidotdev-terminal  →  Guix: omnidotdev-terminal-bin
;;; Upstream: https://github.com/omnidotdev/terminal
;;;
(define-public omnidotdev-terminal-bin
  (package
    (name "omnidotdev-terminal-bin")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/omnidotdev/terminal/releases/download/v"
             version "/omni-terminal-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("omni-terminal" "bin/omni-terminal"))))
    (synopsis "GPU-accelerated terminal emulator")
    (description
     "Omni Terminal is a GPU-accelerated terminal emulator written in Rust
with Wayland native support.  It provides cross-platform binaries for
Linux, macOS, and Windows.")
    (home-page "https://github.com/omnidotdev/terminal")
    (license license:asl2.0)))

;;; ── scmd-bin ───────────────────────────────────────────────────────
;;; AI-powered terminal intelligence (pre-built binary)
;;; AUR: scmd-bin  →  Guix: scmd-bin
;;; Upstream: https://github.com/sunboylabs/scmd
;;;
(define-public scmd-bin
  (package
    (name "scmd-bin")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sunboylabs/scmd/releases/download/v"
             version "/scmd_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scmd" "bin/scmd"))))
    (synopsis "AI intelligence for your terminal, local-first")
    (description
     "scmd is a CLI tool that provides AI-powered intelligence for terminal
operations.  It uses local LLM inference to provide AI assistance without
sending data to external servers.")
    (home-page "https://github.com/sunboylabs/scmd")
    (license license:expat)))

;;; ── d-feet ─────────────────────────────────────────────────────────
;;; D-Bus debugger for GNOME (archived, replaced by D-Spy)
;;; AUR: d-feet  →  Guix: d-feet
;;; Upstream: https://download.gnome.org/sources/d-feet/
;;;
(define-public d-feet
  (package
    (name "d-feet")
    (version "0.3.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.gnome.org/sources/d-feet/0.3/"
             "d-feet-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (native-inputs (list pkg-config python-wrapper))
    (inputs (list gtk+ python-pygobject))
    (synopsis "D-Bus debugger for GNOME")
    (description
     "D-Feet is a graphical D-Bus debugger that lets you inspect D-Bus
interfaces of running programs and invoke methods on those interfaces.
Note: this project is archived by GNOME; users are encouraged to migrate
to D-Spy which is actively developed.")
    (home-page "https://wiki.gnome.org/Apps/DFeet")
    (license license:gpl2)))
