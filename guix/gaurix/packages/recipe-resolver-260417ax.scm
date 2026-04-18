;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass 260417ax (2026-04-18)
;;;
;;; Summary: 17 new recipes, 13 blocked with exhaustion notes.
;;;
;;; New recipes:
;;;   - tcping: TCP ping tool v2.1.0 (C/Make, MIT)
;;;   - conserver: serial console sharing daemon v8.3.0 (autotools, BSD-3)
;;;   - sixpair: PS3 Sixaxis Bluetooth pairing v0.1 (C/Make, Unlicense)
;;;   - libcsptr: smart pointers for C v2.0.4 (cmake, MIT)
;;;   - nx-udev: Nintendo Switch udev rules v0.1.1 (data, GPL-3.0)
;;;   - usb-dirty-pages-udev: USB dirty pages udev rules (data, GPL-3.0)
;;;   - breezex-cursor-theme: BreezeX Dark cursor theme v2.0.1 (data, GPL-3.0)
;;;   - catppuccin-grub-themes: Catppuccin GRUB themes (data, MIT)
;;;   - font-vazir-code: Persian monospace font v1.1.2 (font, OFL-1.1)
;;;   - font-all-the-icons: Emacs all-the-icons fonts v5.0.0 (font, MIT/OFL)
;;;   - numix-cursor-theme: Numix cursor theme v1.2 (data, GPL-3.0)
;;;   - papirus-smplayer-theme: Papirus SMPlayer theme (data, GPL-3.0)
;;;   - whitesur-wallpapers: macOS-style wallpapers (data, GPL-3.0)
;;;   - tbsm: terminal-based session manager v0.7 (bash, GPL-2.0)
;;;   - forgit: git aliases with fzf v25.03.0 (shell, MIT)
;;;   - opf-fido: file format identifier v1.6.1 (Python, Apache-2.0)
;;;   - keep-presence: mouse activity emulator v1.0.7 (Python/copy, CC0)
;;;
;;; Blocked (13):
;;;   howdoi, rsvndump, arcticons-icon-theme, nwg-wrapper,
;;;   openrgb-udev-rules, chipwhisperer-udev, ubuntu-wallpapers,
;;;   sddm-lain-wired-theme, multicolor-sddm-theme, flandre-grub-theme-git,
;;;   catppuccin-mocha-grub-theme-git, adwaita-colors-icon-theme,
;;;   gtk-theme-flat-color-git
;;;
;;; Hashes obtained via `guix hash` / `guix download` on 2026-04-18.

(define-module (gaurix packages recipe-resolver-260417ax)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages xml)
  #:export (tcping
            conserver
            sixpair
            libcsptr
            nx-udev
            usb-dirty-pages-udev
            breezex-cursor-theme
            catppuccin-grub-themes
            font-vazir-code
            font-all-the-icons
            numix-cursor-theme
            papirus-smplayer-theme
            whitesur-wallpapers
            tbsm
            forgit
            opf-fido
            keep-presence))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; GNU-BUILD-SYSTEM PACKAGES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── tcping ─────────────────────────────────────────────────────────
;;; TCP ping — check reachability of TCP ports
;;;
(define-public tcping
  (package
    (name "tcping")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mkirchner/tcping/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "1j9rgjx2r5610dcvyf2l1wsi1c2jivbi601cb8xif07y41s45amq"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" (or (getenv "CC") "gcc"))
              (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "tcping" bin)))))))
    (home-page "https://github.com/mkirchner/tcping")
    (synopsis "ping-like tool for checking TCP port reachability")
    (description
     "Tcping checks if a TCP port on a remote host is open and reachable,
similar to ICMP ping.  It reports connection times and supports
multiple probes with configurable intervals, providing a simple
way to test network connectivity at the transport layer.")
    (license license:expat)))

;;; ── conserver ───────────────────────────────────────────────────────
;;; Console server — serial console sharing and logging daemon
;;;
(define-public conserver
  (package
    (name "conserver")
    (version "8.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bstansell/conserver/releases/download/v"
             version "/conserver-" version ".tar.gz"))
       (sha256
        (base32 "01445z0cbzz05ikrj1ymq59riab2r4yd9k769p56pwql7v72lar0"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.conserver.com/")
    (synopsis "serial console remote sharing and logging daemon")
    (description
     "Conserver is a daemon for managing remote access to serial consoles.
It supports multiple simultaneous users on a single console, logging
of all console output, automatic reconnection, and IPMI serial-over-LAN
access.  Console sessions can be recorded and replayed.")
    (license license:bsd-3)))

;;; ── sixpair ────────────────────────────────────────────────────────
;;; Associate PS3 Sixaxis controller to system Bluetooth via USB
;;;
(define-public sixpair
  (package
    (name "sixpair")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/redwil/sixpair/archive/"
             "cbf604a.tar.gz"))
       (sha256
        (base32 "11x3a4g0i86829mkgpla2j0dx7xsq5i5cmxr9afr4mqvkk882szd"))))
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
                (install-file "sixpair" bin)))))))
    (inputs (list libusb-compat))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/redwil/sixpair")
    (synopsis "pair PS3 Sixaxis controller to system Bluetooth via USB")
    (description
     "Sixpair sets the Bluetooth master address on a PlayStation 3 Sixaxis
or DualShock 3 controller while it is connected via USB.  This allows
the controller to pair directly with a Linux system's Bluetooth
adapter without using the PS3 console.")
    (license license:public-domain)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── libcsptr ───────────────────────────────────────────────────────
;;; Smart pointers for the C programming language
;;;
(define-public libcsptr
  (package
    (name "libcsptr")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Snaipe/libcsptr/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0f1249jb4pc3iv5p7c2kgyws2alpfwgcm29n1swxy7rfwpzn8psn"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Snaipe/libcsptr")
    (synopsis "smart pointer constructs for the C programming language")
    (description
     "Libcsptr provides smart pointer semantics for C, including unique
and shared pointers with automatic cleanup via @code{__attribute__
((cleanup))}.  It supports custom destructors, arrays, and a
convenient @code{smart} macro for concise declarations.")
    (license license:expat)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; COPY-BUILD-SYSTEM PACKAGES — UDEV RULES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── nx-udev ────────────────────────────────────────────────────────
;;; udev rules for Nintendo Switch access without root
;;;
(define-public nx-udev
  (package
    (name "nx-udev")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pheki/nx-udev/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "02z5kd20sqcsg0xqc6x7ksxh0f57px0fs24gf4q75jga4wps3j9n"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("70-nintendo-switch.rules"
                "lib/udev/rules.d/70-nintendo-switch.rules"))))
    (home-page "https://github.com/pheki/nx-udev")
    (synopsis "udev rules for Nintendo Switch USB access without root")
    (description
     "Nx-udev provides udev rules that allow communication with a Nintendo
Switch console over USB without requiring root privileges.  The rules
grant appropriate permissions for RCM mode, normal USB, and serial
interfaces used by homebrew tools.")
    (license license:gpl3)))

;;; ── usb-dirty-pages-udev ───────────────────────────────────────────
;;; udev rules to tune dirty page writeback for USB storage
;;;
(define-public usb-dirty-pages-udev
  (package
    (name "usb-dirty-pages-udev")
    (version "23.10.15")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/biglinux/usb-dirty-pages-udev/archive/refs/heads/main.tar.gz")
       (sha256
        (base32 "0sj9maz8q155qjip3hapfxapjqgkrwhib2h4dzl063mal3mgwxvk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("99-usb-dirty-pages.rules"
                "lib/udev/rules.d/99-usb-dirty-pages.rules")
               ("set_bdi_variables.sh"
                "lib/udev/set_bdi_variables.sh"))))
    (home-page "https://github.com/biglinux/usb-dirty-pages-udev")
    (synopsis "udev rules to tune dirty page cache for USB storage")
    (description
     "Usb-dirty-pages-udev provides a udev rule and helper script that
adjust the Linux kernel dirty page writeback parameters for USB
mass storage devices.  This reduces the amount of data cached in
RAM before writing to USB drives, lowering the risk of data loss
on unexpected removal.")
    (license license:gpl3)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; COPY-BUILD-SYSTEM PACKAGES — CURSOR THEMES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── breezex-cursor-theme ───────────────────────────────────────────
;;; Extended KDE Breeze cursor theme (Dark variant)
;;;
(define-public breezex-cursor-theme
  (package
    (name "breezex-cursor-theme")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ful1e5/BreezeX_Cursor/releases/download/v"
             version "/BreezeX-Dark.tar.xz"))
       (sha256
        (base32 "0lxnam952dv4qly0v3a5g0bxj0jcxx4dv47jwmgmdwdhcqs79pwc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("BreezeX-Dark" "share/icons/BreezeX-Dark"))))
    (home-page "https://github.com/ful1e5/BreezeX_Cursor")
    (synopsis "extended KDE Breeze cursor theme with improved visuals")
    (description
     "BreezeX is an extended cursor theme inspired by KDE Breeze with
enhanced visual design.  This package provides the Dark variant
with all standard X11 cursor shapes for use in desktop environments
including KDE Plasma, GNOME, and Sway.")
    (license license:gpl3)))

;;; ── numix-cursor-theme ─────────────────────────────────────────────
;;; Numix cursor theme (pre-built)
;;;
(define-public numix-cursor-theme
  (package
    (name "numix-cursor-theme")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/numixproject/numix-cursor-theme"
             "/releases/download/v" version
             "/numix-cursor-" version ".tar"))
       (sha256
        (base32 "114prjzzpvxfjxwsra4wqnkz5gpivl6p102ffyz9mwlph3s3jmhc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Numix-Cursor" "share/icons/Numix-Cursor")
               ("Numix-Cursor-Light" "share/icons/Numix-Cursor-Light"))))
    (home-page "https://github.com/numixproject/numix-cursor-theme")
    (synopsis "cursor theme from the Numix project")
    (description
     "Numix Cursor is a clean, modern X11 cursor theme from the Numix
Project.  This package includes both the standard dark and the light
variants, providing all common cursor shapes for use across desktop
environments.")
    (license license:gpl3)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; COPY-BUILD-SYSTEM PACKAGES — GRUB THEMES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── catppuccin-grub-themes ─────────────────────────────────────────
;;; Catppuccin color palette GRUB2 themes (frappe, latte, macchiato)
;;;
(define-public catppuccin-grub-themes
  (package
    (name "catppuccin-grub-themes")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/catppuccin/grub/archive/refs/heads/main.tar.gz")
       (sha256
        (base32 "1bmn218n6jvbrx31szkdh2lwijx10m1j9ifqzhg9a5xlrsgnfwjj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/catppuccin-frappe-grub-theme"
                "share/grub/themes/catppuccin-frappe")
               ("src/catppuccin-latte-grub-theme"
                "share/grub/themes/catppuccin-latte")
               ("src/catppuccin-macchiato-grub-theme"
                "share/grub/themes/catppuccin-macchiato"))))
    (home-page "https://github.com/catppuccin/grub")
    (synopsis "catppuccin color palette themes for GRUB2 bootloader")
    (description
     "Catppuccin GRUB themes provide the Catppuccin pastel color palette
for the GRUB2 bootloader.  This package includes three Catppuccin
flavor variants: Frappe (muted blue), Latte (light), and Macchiato
(muted green).  Each theme includes styled boot menu entries and
OS detection icons.")
    (license license:expat)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; COPY-BUILD-SYSTEM PACKAGES — FONTS
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── font-vazir-code ────────────────────────────────────────────────
;;; Vazir Code — Persian monospace programming font
;;;
(define-public font-vazir-code
  (package
    (name "font-vazir-code")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rastikerdar/vazir-code-font"
             "/releases/download/v" version
             "/vazir-code-font-v" version ".zip"))
       (sha256
        (base32 "07h77f4wvfzr00qzmb9vp1rksnw1k3a84fkh0gdq3lpimsgq242w"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/vazir-code"
                #:include-regexp ("\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "https://github.com/rastikerdar/vazir-code-font")
    (synopsis "Persian monospace programming font based on Vazir and Inconsolata")
    (description
     "Vazir Code is a monospace programming font designed for Persian and
Arabic script, based on Vazir and Hack/Inconsolata.  It provides
proper display of Persian characters in code editors alongside
Latin glyphs, with Regular, Bold, and other weight variants.")
    (license license:silofl1.1)))

;;; ── font-all-the-icons ─────────────────────────────────────────────
;;; Icon fonts for Emacs all-the-icons package
;;;
(define-public font-all-the-icons
  (package
    (name "font-all-the-icons")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/domtronn/all-the-icons.el/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0mxa3klw82h8xr2wsnjqa39vk05dz58cxbah24p0hpkip924bb3j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts" "share/fonts/all-the-icons"))))
    (home-page "https://github.com/domtronn/all-the-icons.el")
    (synopsis "icon fonts used by the Emacs all-the-icons package")
    (description
     "This package provides the TTF icon fonts used by the Emacs
all-the-icons package.  It includes six font families: Octicons,
FontAwesome, Material Design Icons, Weather Icons, all-the-icons,
and file-icons.  Installing these fonts system-wide allows
all-the-icons to display properly in both terminal and GUI Emacs.")
    (license license:expat)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; COPY-BUILD-SYSTEM PACKAGES — THEMES AND WALLPAPERS
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── papirus-smplayer-theme ─────────────────────────────────────────
;;; Papirus icon theme for SMPlayer
;;;
(define-public papirus-smplayer-theme
  (package
    (name "papirus-smplayer-theme")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/PapirusDevelopmentTeam/papirus-smplayer-theme/archive/refs/heads/master.tar.gz")
       (sha256
        (base32 "08bd52yr241lchnbkwfg3ns087a7r5d32gsm9i419si55sfzk5gj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Papirus" "share/smplayer/themes/Papirus")
               ("Papirus-Dark" "share/smplayer/themes/Papirus-Dark")
               ("Papirus-Light" "share/smplayer/themes/Papirus-Light"))))
    (home-page "https://github.com/PapirusDevelopmentTeam/papirus-smplayer-theme")
    (synopsis "papirus icon theme for the SMPlayer media player")
    (description
     "Papirus SMPlayer theme provides Papirus-styled icons for the
SMPlayer media player.  It includes Light, Dark, and standard
color variants that integrate visually with the Papirus icon
theme family.")
    (license license:gpl3)))

;;; ── whitesur-wallpapers ────────────────────────────────────────────
;;; macOS-style wallpapers with time-based variants
;;;
(define-public whitesur-wallpapers
  (package
    (name "whitesur-wallpapers")
    (version "2023.11.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/vinceliuice/WhiteSur-wallpapers/archive/refs/heads/main.tar.gz")
       (sha256
        (base32 "02ngjpar40jfvky7jr7myp1qzylg9i1bq155qjjyg39pg0fnqpx9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/backgrounds/whitesur"
                #:include-regexp ("\\.jpe?g$" "\\.png$")))))
    (home-page "https://github.com/vinceliuice/WhiteSur-wallpapers")
    (synopsis "macOS-style wallpapers with light and dark variants")
    (description
     "WhiteSur wallpapers is a collection of high-resolution desktop
backgrounds designed to complement the WhiteSur GTK theme.  The
images are inspired by macOS aesthetics and include both light and
dark variants for use with automatic wallpaper switching.")
    (license license:gpl3)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; COPY-BUILD-SYSTEM PACKAGES — SHELL TOOLS
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── tbsm ───────────────────────────────────────────────────────────
;;; Terminal Based Session Manager — bash session/app launcher
;;;
(define-public tbsm
  (package
    (name "tbsm")
    (version "0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/loh-tar/tbsm/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0cnadr9hij5qv4z7nb1d4qh5lrvfz6rdsabcs58lsz7ydv7dcrzw"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "DESTDIR=" #$output)
              "install")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (etc (string-append out "/etc/xdg/tbsm/themes"))
                     (doc (string-append out "/share/doc/tbsm")))
                (mkdir-p bin)
                (mkdir-p etc)
                (mkdir-p doc)
                (install-file "src/tbsm" bin)
                (chmod (string-append bin "/tbsm") #o755)
                (for-each (lambda (f) (install-file f etc))
                          (find-files "themes"))
                (for-each (lambda (f) (install-file f doc))
                          (find-files "doc"))))))))
    (inputs (list bash))
    (home-page "https://gitlab.com/loh-tar/tbsm")
    (synopsis "terminal-based session manager and application launcher")
    (description
     "TBSM is a pure Bash session manager inspired by CDM, TDM, and
KRunner.  It can launch X11 sessions, Wayland compositors, or
arbitrary applications from a simple text-based menu displayed
on a TTY.  It supports theming and custom session entries via
configuration files.")
    (license license:gpl2)))

;;; ── forgit ─────────────────────────────────────────────────────────
;;; Interactive Git commands powered by fzf
;;;
(define-public forgit
  (package
    (name "forgit")
    (version "25.03.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wfxr/forgit/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0anwplpprjmnppzwy5qn5p2rhzjs499yznjwzn6javmd99g2bhp1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin" "bin")
               ("completions" "share/forgit/completions")
               ("conf.d" "share/forgit/conf.d")
               ("forgit.plugin.zsh" "share/forgit/forgit.plugin.zsh")
               ("forgit.plugin.sh" "share/forgit/forgit.plugin.sh"))))
    (home-page "https://github.com/wfxr/forgit")
    (synopsis "interactive git commands using fzf fuzzy finder")
    (description
     "Forgit provides interactive wrappers around common Git commands
using fzf for fuzzy selection.  It supports interactive log
browsing, diff viewing, staging, stashing, cherry-picking, and
more.  Forgit works as a plugin for Bash, Zsh, and Fish shells.")
    (license license:expat)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; PYTHON PACKAGES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── opf-fido ───────────────────────────────────────────────────────
;;; File format identifier using PRONOM signatures
;;;
(define-public opf-fido
  (package
    (name "opf-fido")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/openpreserve/fido/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "13dip8nkzchcmn67bp3yb77rkzgarfnk4c2d6d14n05mswyd5039"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-olefile python-six python-importlib-resources
           python-requests))
    (home-page "https://github.com/openpreserve/fido")
    (synopsis "format identification tool for digital objects using PRONOM")
    (description
     "FIDO (Format Identification for Digital Objects) identifies the file
format of digital objects using the PRONOM file format signatures
maintained by The National Archives.  It supports identification via
binary signatures and container-based analysis for formats like
OLE2 and ZIP-based office documents.")
    (license license:asl2.0)))

;;; ── keep-presence ──────────────────────────────────────────────────
;;; Moves the mouse to emulate user activity
;;;
(define-public keep-presence
  (package
    (name "keep-presence")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/carrot69/keep-presence/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0d3nxwv4p6y3cmpyqi3zsdsah6r6arjx8ryd51y0rf8q0n14qq04"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/keep-presence.py" "bin/keep-presence"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-script
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (python (search-input-file inputs "bin/python3"))
                          (script (string-append out "/bin/keep-presence")))
                     (wrap-program script
                       `("GUIX_PYTHONPATH" prefix
                         ,(search-path-as-string->list
                           (getenv "GUIX_PYTHONPATH"))))))))))
    (inputs (list python python-pynput))
    (home-page "https://github.com/carrot69/keep-presence")
    (synopsis "simulate mouse movement to emulate user presence")
    (description
     "Keep-presence is a tool that periodically moves the mouse cursor
a small amount to prevent screen blanking, automatic locking, or
idle-detection systems from activating.  It supports configurable
intervals and movement sizes.")
    (license license:cc0)))
