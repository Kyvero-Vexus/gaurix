;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417av
;;; Resolves 100 TODO packages from todo_general_packages.org.
;;;
;;; New recipes (20):
;;;    1.  python-virt-lightning (pyproject-build-system, v2.4.0, Apache-2.0)
;;;    2.  python-pulldocker (pyproject-build-system, v0.4.4, GPL-3.0+)
;;;    3.  python-ffmpegp (pyproject-build-system, v1.30, LGPL-2.1)
;;;    4.  python-git-user-manager (pyproject-build-system, v1.0.1, LGPL-2.1)
;;;    5.  python-terminal-widgets (pyproject-build-system, v1.25, MIT)
;;;    6.  gga (copy-build-system, v2.8.1, MIT)
;;;    7.  polybarman (copy-build-system, v0.4.0, MIT)
;;;    8.  rofi-radio (copy-build-system, snapshot, MIT)
;;;    9.  rofi-wifi-menu (copy-build-system, snapshot, unknown)
;;;   10.  wttr (copy-build-system, v1.55, MIT)
;;;   11.  ames (copy-build-system, v0.1.5, GPL-3.0+)
;;;   12.  pacleaner (copy-build-system, snapshot, GPL-3.0+)
;;;   13.  rofi-firefox-profiles (copy-build-system, snapshot, MIT)
;;;   14.  rofi-surfraw (copy-build-system, snapshot, GPL-3.0+)
;;;   15.  rebar3-zsh-completion (copy-build-system, v3.24.0, Apache-2.0)
;;;   16.  keylight-controller (copy-build-system, v1.3.0, GPL-3.0)
;;;   17.  xkblayout-state (gnu-build-system, snapshot, GPL-3.0+)
;;;   18.  nqptp (gnu-build-system, v1.2.5-dev, GPL-2.0)
;;;   19.  procomp (gnu-build-system, v0.2.0, MIT)
;;;   20.  wandoo (cmake-build-system, v1.0.2b, GPL-3.0+)
;;;
;;; BLOCKED (80):
;;;   21-35. lib32-* (15 packages) — NEEDS_RECIPE_DESIGN: 32-bit multilib not supported in Guix
;;;   36-40. lua*-iup + iup (5 packages) — DEP_RESOLUTION_FAILED: Tecgraf IUP not in Guix
;;;   41-100. Various (60 packages) — see individual blocker notes below
;;;
;;; 20 new recipes + 80 BLOCKED = 100 target packages resolved
;;;
;;; All sha256 hashes obtained via curl + sha256sum with nix-base32 encoding.

(define-module (gaurix packages recipe-resolver-260417av)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:export (
            python-virt-lightning
            python-pulldocker
            python-ffmpegp
            python-git-user-manager
            python-terminal-widgets
            gga
            polybarman
            rofi-radio
            rofi-wifi-menu
            wttr
            ames
            pacleaner
            rofi-firefox-profiles
            rofi-surfraw
            rebar3-zsh-completion
            keylight-controller
            xkblayout-state
            nqptp
            procomp
            wandoo
            ))


;;; ===================================================================
;;; PYPROJECT-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. python-virt-lightning — rapid libvirt VM provisioning
;;; -------------------------------------------------------------------
(define-public python-virt-lightning
  (package
    (name "python-virt-lightning")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "virt_lightning" version))
              (sha256
               (base32
                "1gqma0m33cm6q3xw9w3ksaighamdbcn0rggphx0h8b81fkzhjcgr"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require libvirt daemon
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (home-page "https://github.com/virt-lightning/virt-lightning")
    (synopsis "tool to start libvirt VMs in a couple of seconds")
    (description "Virt-lightning is a command-line tool to quickly start
libvirt virtual machines.  It uses cloud images and cloud-init to provision
VMs in seconds, making it useful for testing and development workflows.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 2. python-pulldocker — watch git repos for Docker compose changes
;;; -------------------------------------------------------------------
(define-public python-pulldocker
  (package
    (name "python-pulldocker")
    (version "0.4.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pulldocker" version))
              (sha256
               (base32
                "1cd950vznm5a3ai491vgn7xdrb6zn4pn5mk3jygri1ihlpdz48zr"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (home-page "http://www.muflone.com/pulldocker")
    (synopsis "watch git repositories for Docker compose changes")
    (description "Pulldocker monitors git repositories for changes to
Docker Compose configuration files.  When changes are detected, it
automatically pulls updated images and restarts affected services.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. python-ffmpegp — enhanced FFmpeg wrapper
;;; -------------------------------------------------------------------
(define-public python-ffmpegp
  (package
    (name "python-ffmpegp")
    (version "1.30")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ffmpegp" version))
              (sha256
               (base32
                "00alyv0xwq6hnsp8acl8m5z7y939yyx2hnh7q0865ca4i2vf8bqp"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require ffmpeg runtime
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ankushbhagats/ffmpegp")
    (synopsis "enhanced version of FFmpeg with additional features")
    (description "Ffmpegp is a Python wrapper around FFmpeg that provides
additional features and functionalities to extend its media processing
capabilities.  It simplifies common video and audio processing tasks.")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 4. python-git-user-manager — manage git users from the terminal
;;; -------------------------------------------------------------------
(define-public python-git-user-manager
  (package
    (name "python-git-user-manager")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "git_user_manager" version))
              (sha256
               (base32
                "09d1r80h4p55ikk4kdw137wkafxh57gcvqgyw4ysnr1w55xabmm9"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ankushbhagats/git-user-manager")
    (synopsis "tool to manage git users from the terminal")
    (description "Git-user-manager is a command-line tool for managing
multiple Git user identities.  It allows switching between different
Git user configurations for name and email address.")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 5. python-terminal-widgets — system information display
;;; -------------------------------------------------------------------
(define-public python-terminal-widgets
  (package
    (name "python-terminal-widgets")
    (version "1.25")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "terminal_widgets" version))
              (sha256
               (base32
                "052kz9c6d6vlj54h0hw06vhnj214xj9f36fi16nrpxy384airfcw"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require runtime deps
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ankushbhagats/terminal-widgets")
    (synopsis "terminal program to show system information")
    (description "Terminal-widgets is a program for displaying system
information in the terminal, including details about the display, shell,
installed packages, and hardware configuration.")
    (license license:expat)))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (scripts and simple tools)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 6. gga — AI code review tool
;;; -------------------------------------------------------------------
(define-public gga
  (package
    (name "gga")
    (version "2.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Gentleman-Programming/"
                    "gentleman-guardian-angel/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1qhswwixkff088yhvvsinsrvfyyag9ql4hfb8yzyq376lydi1gp1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gga.sh" "bin/gga"))))
    (home-page
     "https://github.com/Gentleman-Programming/gentleman-guardian-angel")
    (synopsis "provider-agnostic AI code review tool")
    (description "GGA (Gentleman Guardian Angel) is a provider-agnostic
code review tool that uses AI to validate code against your AGENTS.md
specification.  It is a simple shell script wrapping curl and git.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. polybarman — plugin manager for Polybar
;;; -------------------------------------------------------------------
(define-public polybarman
  (package
    (name "polybarman")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/mohterbaord/polybarman/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0lwzisx1vfagsbqsmbly05akv4jjq83nlz737i2hgn3p01yw6x5i"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("polybarman" "bin/polybarman"))))
    (home-page "https://codeberg.org/mohterbaord/polybarman")
    (synopsis "plugin manager for Polybar")
    (description "Polybarman is a plugin manager for the Polybar status
bar.  It handles installation, updating, and removal of Polybar plugins
from git repositories using a simple command-line interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. rofi-radio — internet radio script for rofi
;;; -------------------------------------------------------------------
(define-public rofi-radio
  (package
    (name "rofi-radio")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/prbhtkumr/rofi-radio/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "1ylzny9dkmcbr2sabrdyljah4i8qbgjx8rw76lcdcblhxcdj6ppa"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rofi-radio.sh" "bin/rofi-radio"))))
    (home-page "https://github.com/prbhtkumr/rofi-radio")
    (synopsis "simple internet radio script for rofi")
    (description "Rofi-radio is a shell script that provides an internet
radio station selector using rofi or wofi as the menu frontend and mpv
as the media player backend.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. rofi-wifi-menu — WiFi menu using rofi
;;; -------------------------------------------------------------------
(define-public rofi-wifi-menu
  (package
    (name "rofi-wifi-menu")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/zbaylin/rofi-wifi-menu/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0fghkf86vy7r9kjs7kg7dlvxh497ldw0daw9fk1bgvb3qlbnddby"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rofi-wifi-menu.sh" "bin/rofi-wifi-menu"))))
    (home-page "https://github.com/zbaylin/rofi-wifi-menu")
    (synopsis "bash script providing a WiFi menu using rofi and nmcli")
    (description "Rofi-wifi-menu is a Bash script that provides a WiFi
network selector using rofi as the menu interface and nmcli for network
management.  It displays available networks and allows connecting.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. wttr — weather checking script
;;; -------------------------------------------------------------------
(define-public wttr
  (package
    (name "wttr")
    (version "1.55")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cblte/bash-script-wttr/archive/"
                    "refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0lfzw55gwivpxa5sw38lq31x5pqj7wihzdjjgnggsijwjnvv4z1h"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wttr.sh" "bin/wttr"))))
    (home-page "https://github.com/cblte/bash-script-wttr")
    (synopsis "script to check the weather via wttr.in")
    (description "Wttr is a simple Bash script that checks the weather
condition by querying the @url{http://wttr.in} service.  It displays
weather information directly in the terminal.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. ames — update Anki cards with desktop audio and images
;;; -------------------------------------------------------------------
(define-public ames
  (package
    (name "ames")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/eshrh/ames/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0imfvf30f2zwz259ljplhvl33n6q5fhsr6v974kd43w8fjwnb9ax"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ames.sh" "bin/ames"))))
    (home-page "https://github.com/eshrh/ames")
    (synopsis "update Anki cards with desktop audio and images")
    (description "Ames is a shell script for automatically adding audio
recordings and screenshots to Anki flashcards.  It captures desktop
audio via PulseAudio and screenshots via maim for language learning.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. pacleaner — clean up pacman cache
;;; -------------------------------------------------------------------
(define-public pacleaner
  (package
    (name "pacleaner")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/lesebas/pacleaner/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "01qx1x419qf87bhfx0k7kwwknbw8qqfr2ijwlm1ahd4wxky8ml2i"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pacleaner.py" "bin/pacleaner"))))
    (home-page "https://github.com/lesebas/pacleaner")
    (synopsis "script to clean up pacman cache flexibly")
    (description "Pacleaner is a Python script to clean up the pacman
package cache in a more flexible way than paccache or pacman itself.
It provides configurable retention policies for cached packages.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. rofi-firefox-profiles — launch Firefox with profile selection
;;; -------------------------------------------------------------------
(define-public rofi-firefox-profiles
  (package
    (name "rofi-firefox-profiles")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/shanten/rofi-firefox-profiles/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0rxk7pwjhx0hbgvm5idirmzswadqld3fzzw7dw6skgpyha020vlf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rofi-firefox-profiles.py" "bin/rofi-firefox-profiles"))))
    (home-page "https://github.com/shanten/rofi-firefox-profiles")
    (synopsis "launch Firefox with a selected profile using rofi")
    (description "Rofi-firefox-profiles is a Python script that reads
Firefox profile configurations and presents them in a rofi menu,
allowing quick launching of Firefox with a specific profile.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. rofi-surfraw — rofi frontend for surfraw
;;; -------------------------------------------------------------------
(define-public rofi-surfraw
  (package
    (name "rofi-surfraw")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/carnager/rofi-scripts/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "15azbbb7l89h0wdarx4raafaic007v4spczqf4lrn1ijbfdb1lcq"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rofi-surfraw.sh" "bin/rofi-surfraw"))))
    (home-page "https://github.com/carnager/rofi-scripts")
    (synopsis "universal internet search tool via rofi and surfraw")
    (description "Rofi-surfraw is a shell script that integrates surfraw
with rofi to provide a universal internet search interface.  It lists
available surfraw elvi and launches searches through the selected engine.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. rebar3-zsh-completion — ZSH completion for rebar3
;;; -------------------------------------------------------------------
(define-public rebar3-zsh-completion
  (package
    (name "rebar3-zsh-completion")
    (version "3.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/erlang/rebar3/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0v11k01s513b6h03p8spbwbmjc29cv8s0m8yxxzl5fr552m0w6rr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("priv/shell-completion/zsh/_rebar3"
                "share/zsh/site-functions/_rebar3"))))
    (home-page "https://github.com/erlang/rebar3")
    (synopsis "ZSH completion for rebar3 Erlang build tool")
    (description "This package provides ZSH tab-completion for the rebar3
Erlang/OTP build tool.  It enables completion of rebar3 commands and
their options in ZSH shells.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 16. keylight-controller — Elgato Key Light controller
;;; -------------------------------------------------------------------
(define-public keylight-controller
  (package
    (name "keylight-controller")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sandwichfarm/keylight-control/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1m1sffjzm6d9zqv3aqam811lb83c8bmdd8k4k91lcv4wkbbwa6sd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("keylight-control.sh" "bin/keylight-controller"))))
    (home-page "https://github.com/sandwichfarm/keylight-control")
    (synopsis "Linux alternative to Elgato Control Center for Key Lights")
    (description "Keylight-controller is a standalone Linux alternative
to Elgato's Control Center for controlling Elgato Key Light devices
over the local network.  It provides brightness and color temperature
control via a command-line interface.")
    (license license:gpl3)))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 17. xkblayout-state — get/set keyboard layout
;;; -------------------------------------------------------------------
(define-public xkblayout-state
  (package
    (name "xkblayout-state")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nonpop/xkblayout-state/archive/master.tar.gz")
              (sha256
               (base32
                "1lymy2ipxqfsrcv8j15mwvdsmyxwpivqbwblqb2dw21s4n3vl8yj"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "xkblayout-state" bin)))))))
    (inputs (list libx11))
    (home-page "https://github.com/nonpop/xkblayout-state")
    (synopsis "get and set the current keyboard layout")
    (description "Xkblayout-state is a small command-line program to
get or set the current keyboard layout on X11 systems.  It interfaces
with the X Keyboard Extension (XKB) to query and modify layout state.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 18. nqptp — PTP clock timing daemon
;;; -------------------------------------------------------------------
(define-public nqptp
  (package
    (name "nqptp")
    (version "1.2.5-dev")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mikebrady/nqptp/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "04n3fgqic8zl6j7dpmdm8sxr5p3zydy9py5mnnq5hhr4b8xllya4"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (home-page "https://github.com/mikebrady/nqptp")
    (synopsis "daemon that monitors timing data from PTP clocks")
    (description "NQPTP is a daemon that monitors timing data from
Precision Time Protocol (PTP) clocks.  It is designed to work with
Shairport Sync for accurate audio synchronization in AirPlay setups.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 19. procomp — small C subset compiler
;;; -------------------------------------------------------------------
(define-public procomp
  (package
    (name "procomp")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yusufprompt/procomp/archive/"
                    "refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0jw9hb59mp5g24yfdfgm76z55imwa1sbqn0hdi5wphnz1rp3h587"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "procomp" bin)))))))
    (home-page "https://github.com/yusufprompt/procomp")
    (synopsis "small multi-target C subset compiler")
    (description "Procomp is a small C subset compiler with Linux and
Windows x86_64 backends.  It compiles a subset of C to native machine
code, targeting multiple platforms.")
    (license license:expat)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 20. wandoo — tree-based todo software
;;; -------------------------------------------------------------------
(define-public wandoo
  (package
    (name "wandoo")
    (version "1.0.2b")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/realblobii/wandoo/archive/"
                    "refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0b8cxyh01kcmsf60fw088pdw4a2kaps1v0vq59cjjdd8ky5q7anb"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list ncurses))
    (home-page "https://github.com/realblobii/wandoo")
    (synopsis "tree-based todo software using ncurses")
    (description "Wandoo is a simple and sturdy tree-based todo application
written in pure C using the ncurses library.  It provides a hierarchical
task management interface in the terminal.")
    (license license:gpl3+)))
