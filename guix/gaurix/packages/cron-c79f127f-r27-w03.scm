;;; Queue-drain module for cron-c79f127f-r27-w03 — 100 packages attempted.
(define-module (gaurix packages cron-c79f127f-r27-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system go)
  #:use-module (guix build-system trivial)
  #:autoload (gnu packages) (specification->package)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (ttf-zpix
            ttf-comic-sans
            ttf-unifraktur
            sardi-icons
            osx-el-capitan-theme
            acid-gtk-theme
            mini-xfwm4-theme
            xfce-simple-dark
            xts-dark-theme
            libhid
            libuser
            libt3key
            libtranscript
            libt3window
            sol2
            igsc-legacy
            level-zero-headers-legacy
            level-zero-loader-legacy
            pywinery
            gay
            hid-listen
            skiller-ctl
            tcptraceroute
            colorized-logs
            wtwitch
            rofi-power-menu
            mpvc
            sysz
            todotxt
            mpv-acestream
            amazon-ecr-credential-helper
            dms
            tcping-go
            droplet-agent
            open-in-mpv
            beangulp
            python-stitching
            pyinstaller-hooks-contrib
            python-acestream
            python-lineprofiler
            pypi2aur
            nhentai
            via-appimage
            cljfmt-bin
            amazon-corretto-21-bin
            mujoco-bin
            hunspell-pt-br
            hamradio-menus
            vimrc-amix
            sol2-single
            fish-done))

(define-public ttf-zpix
  (package
    (name "ttf-zpix")
    (version "3.1.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/SolidZORO/zpix-pixel-font/releases/download/v3.1.10/zpix.ttf")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((font-dir (string-append #$output "/share/fonts/truetype")))
            (mkdir-p font-dir)
            (copy-file #$source (string-append font-dir "/ttf-zpix.ttf"))
            #t))))
    (home-page "https://github.com/SolidZORO/zpix-pixel-font")
    (synopsis "pixel-style CJK font supporting Chinese, Japanese, and English")
    (description
     "Zpix is a pixel-style TrueType font supporting Simplified Chinese, Traditional
Chinese, Japanese, and English characters.  It is designed for retro-style
interfaces and pixel art applications.")
    (license license:silofl1.1)))

(define-public ttf-comic-sans
  (package
    (name "ttf-comic-sans")
    (version "5.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/corefonts/comic32.exe")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list (specification->package "cabextract")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((font-dir (string-append #$output "/share/fonts/truetype"))
                (cabextract (string-append (assoc-ref %build-inputs "cabextract")
                                           "/bin/cabextract")))
            (mkdir-p font-dir)
            (invoke cabextract "-F" "*.ttf" "-d" font-dir #$source)
            #t))))
    (home-page "https://learn.microsoft.com/en-us/typography/font-list/comic-sans-ms")
    (synopsis "comic Sans MS TrueType font")
    (description
     "This package provides the Comic Sans MS TrueType font, a casual sans-serif
typeface designed by Vincent Connare for Microsoft.")
    (license (license:non-copyleft
      "https://learn.microsoft.com/en-us/typography/font-list/comic-sans-ms"
      "Microsoft desktop font redistribution license."))))

(define-public ttf-unifraktur
  (package
    (name "ttf-unifraktur")
    (version "20170319")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/project/unifraktur/fonts/UnifrakturMaguntia.2017-03-19.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list (specification->package "unzip")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((font-dir (string-append #$output "/share/fonts/truetype"))
                (unzip (string-append (assoc-ref %build-inputs "unzip") "/bin/unzip")))
            (mkdir-p font-dir)
            (invoke unzip "-j" #$source "-d" font-dir "*.ttf" "*.otf")
            #t))))
    (home-page "https://unifraktur.sourceforge.net")
    (synopsis "open-source Fraktur fonts for Unicode text")
    (description
     "UniFraktur provides Fraktur typefaces mapped to Unicode code points, allowing
blackletter text to be rendered in standard Unicode-capable applications.")
    (license license:silofl1.1)))

(define-public sardi-icons
  (package
    (name "sardi-icons")
    (version "25.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/erikdubois/Sardi/archive/refs/tags/v25.10.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((target (string-append #$output "/share/icons/sardi-icons")))
                (mkdir-p target)
                (copy-recursively "." target)
                #t))))))
    (home-page "https://github.com/erikdubois/Sardi")
    (synopsis "collection of circular icon themes for Linux desktops")
    (description
     "Sardi is a collection of icon themes with six different circular icon styles
and ten folder variants, designed for use on Linux desktops.")
    (license (license:non-copyleft
               "https://creativecommons.org/licenses/by-nc-sa/4.0/"
               "Creative Commons Attribution-NonCommercial-ShareAlike 4.0"))))

(define-public osx-el-capitan-theme
  (package
    (name "osx-el-capitan-theme")
    (version "4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/AJJLagerwororth/macOS-Sierra/archive/refs/heads/master.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((target (string-append #$output "/share/themes/osx-el-capitan-theme")))
                (mkdir-p target)
                (copy-recursively "." target)
                #t))))))
    (home-page "https://github.com/Elbullazul/macOS-Sierra")
    (synopsis "GTK3 theme mimicking macOS Sierra appearance")
    (description
     "This GTK3 theme provides a macOS Sierra-inspired look for GNOME Shell, Xfce,
and Cinnamon desktop environments.")
    (license license:gpl3)))

(define-public acid-gtk-theme
  (package
    (name "acid-gtk-theme")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://dl.opendesktop.org/api/files/download/id/1461281461/ACID.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((target (string-append #$output "/share/themes/acid-gtk-theme")))
                (mkdir-p target)
                (copy-recursively "." target)
                #t))))))
    (home-page "https://www.deviantart.com/sixsixfive/art/ACID-280889262")
    (synopsis "dark minimalistic GTK theme optimized for Xfce")
    (description
     "ACID is a dark, minimalistic GTK theme optimized for fast rendering on Xfce4
desktop environments.")
    (license license:gpl2+)))

(define-public mini-xfwm4-theme
  (package
    (name "mini-xfwm4-theme")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://dl.opendesktop.org/api/files/download/id/1461489270/mini.tar.bz2")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((target (string-append #$output "/share/themes/mini-xfwm4-theme")))
                (mkdir-p target)
                (copy-recursively "." target)
                #t))))))
    (home-page "https://xfce-look.org/content/show.php?content=154240")
    (synopsis "thin window border theme for Xfce window manager")
    (description
     "Mini is a very thin window border theme for Xfce4 window manager, designed
to maximize screen space for application windows.")
    (license license:gpl3)))

(define-public xfce-simple-dark
  (package
    (name "xfce-simple-dark")
    (version "9")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/trustable-code/xfce-simple-dark/archive/refs/tags/v9.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((target (string-append #$output "/share/themes/xfce-simple-dark")))
                (mkdir-p target)
                (copy-recursively "." target)
                #t))))))
    (home-page "https://github.com/trustable-code/xfce-simple-dark")
    (synopsis "dark themes for Xfce widgets and window decoration")
    (description
     "Xfce Simple Dark provides dark themes for Xfce widgets, Xfce window
decoration, and the Geany text editor.")
    (license license:gpl3)))

(define-public xts-dark-theme
  (package
    (name "xts-dark-theme")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.com/linux-stuffs/xts-themes/-/archive/main/xts-themes-main.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((target (string-append #$output "/share/themes/xts-dark-theme")))
                (mkdir-p target)
                (copy-recursively "." target)
                #t))))))
    (home-page "https://gitlab.com/linux-stuffs/xts-themes")
    (synopsis "dark theme for Xfce4 theme switcher")
    (description
     "XTS Dark Theme provides a dark colour scheme for use with the Xfce4 theme
switcher utility.")
    (license license:gpl3)))

(define-public libhid
  (package
    (name "libhid")
    (version "0.2.16")
    (source
     (origin
       (method url-fetch)
       (uri "https://alioth-archive.debian.org/releases/libhid/libhid/libhid-0.2.16.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://alioth-archive.debian.org/releases/libhid/")
    (synopsis "library for accessing USB HID devices")
    (description
     "Libhid is a C library providing a generic and flexible interface for
communicating with USB Human Interface Devices (HID).")
    (license license:gpl2+)))

(define-public libuser
  (package
    (name "libuser")
    (version "0.64")
    (source
     (origin
       (method url-fetch)
       (uri "https://pagure.io/libuser/archive/libuser-0.64/libuser-libuser-0.64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pagure.io/libuser/")
    (synopsis "standardized interface for user and group account management")
    (description
     "Libuser provides a standardized C library interface for manipulating and
administering user and group accounts on GNU/Linux systems.")
    (license license:lgpl2.1+)))

(define-public libt3key
  (package
    (name "libt3key")
    (version "0.2.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://os.ghalkes.nl/dist/libt3key-0.2.10.tar.bz2")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://os.ghalkes.nl/t3/libt3key.html")
    (synopsis "terminal key sequence database library")
    (description
     "Libt3key is a library for retrieving terminal key sequence definitions,
allowing applications to interpret keyboard input in a portable way.")
    (license license:gpl3+)))

(define-public libtranscript
  (package
    (name "libtranscript")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://os.ghalkes.nl/dist/libtranscript-0.3.3.tar.bz2")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://os.ghalkes.nl/libtranscript.html")
    (synopsis "character set conversion library")
    (description
     "Libtranscript is a character set conversion library providing an interface
for translating between different character encodings.")
    (license license:gpl3+)))

(define-public libt3window
  (package
    (name "libt3window")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://os.ghalkes.nl/dist/libt3window-0.4.1.tar.bz2")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://os.ghalkes.nl/t3/libt3window.html")
    (synopsis "library for creating window-based terminal programs")
    (description
     "Libt3window is a C library providing an interface for creating window-based
terminal programs with support for windows, panels, and input handling.")
    (license license:gpl3+)))

(define-public sol2
  (package
    (name "sol2")
    (version "3.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ThePhD/sol2/archive/refs/tags/v3.5.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://sol2.readthedocs.io")
    (synopsis "C++ to Lua API wrapper with advanced features")
    (description
     "Sol2 is a header-only C++ library that provides a fast and intuitive API
wrapper for Lua, supporting advanced features such as table manipulation,
coroutines, and usertype binding.")
    (license license:expat)))

(define-public igsc-legacy
  (package
    (name "igsc-legacy")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/intel/igsc/archive/refs/tags/V0.9.3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/intel/igsc/")
    (synopsis "Intel graphics system controller firmware update library")
    (description
     "IGSC is the Intel Graphics System Controller library for firmware updates
on legacy Intel graphics platforms.")
    (license license:asl2.0)))

(define-public level-zero-headers-legacy
  (package
    (name "level-zero-headers-legacy")
    (version "1.17.44")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/oneapi-src/level-zero/archive/refs/tags/v1.17.44.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/oneapi-src/level-zero")
    (synopsis "oneAPI Level Zero headers for legacy platforms")
    (description
     "Level Zero headers provide the C API definitions for accessing low-level
interfaces in oneAPI platform devices on legacy Intel hardware.")
    (license license:expat)))

(define-public level-zero-loader-legacy
  (package
    (name "level-zero-loader-legacy")
    (version "1.17.44")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/oneapi-src/level-zero/archive/refs/tags/v1.17.44.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/oneapi-src/level-zero")
    (synopsis "oneAPI Level Zero loader for legacy platforms")
    (description
     "Level Zero loader provides the runtime loader library for the oneAPI
Level Zero API on legacy Intel graphics platforms.")
    (license license:expat)))

(define-public pywinery
  (package
    (name "pywinery")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ergoithz/pywinery/archive/refs/tags/0.3.3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ergoithz/pywinery")
    (synopsis "graphical wine-prefix manager")
    (description
     "Pywinery is a graphical and simple Wine prefix manager that allows launching
applications and managing the configuration of separate Wine prefixes.")
    (license license:gpl3)))

(define-public gay
  (package
    (name "gay")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ms-jpq/gay/archive/refs/tags/v1.3.4.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ms-jpq/gay")
    (synopsis "colourful text output tool similar to lolcat")
    (description
     "Gay is a command-line tool that produces colourful rainbow-style text output,
similar to lolcat but with additional colour gradient options.")
    (license license:expat)))

(define-public hid-listen
  (package
    (name "hid-listen")
    (version "1.01")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.pjrc.com/teensy/hid_listen_1.01.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.pjrc.com/teensy/hid_listen.html")
    (synopsis "debugging tool for USB HID devices")
    (description
     "HID Listen is a utility that prints debugging information from USB HID
devices, useful for developing and testing keyboard firmware.")
    (license license:gpl3)))

(define-public skiller-ctl
  (package
    (name "skiller-ctl")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/anyc/skiller-ctl/archive/refs/tags/v0.2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/anyc/skiller-ctl")
    (synopsis "control tool for Sharkoon Skiller keyboards")
    (description
     "Skiller-ctl is a utility for controlling additional features of Sharkoon
Skiller keyboards, such as LED configuration and macro settings.")
    (license license:gpl3)))

(define-public tcptraceroute
  (package
    (name "tcptraceroute")
    (version "1.5beta7")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/mct/tcptraceroute/archive/refs/tags/tcptraceroute-1.5beta7.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://michael.toren.net/code/tcptraceroute/")
    (synopsis "traceroute implementation using TCP packets")
    (description
     "Tcptraceroute is a traceroute implementation that uses TCP SYN packets
rather than UDP or ICMP, enabling tracing through firewalls that block
standard traceroute traffic.")
    (license license:gpl2+)))

(define-public colorized-logs
  (package
    (name "colorized-logs")
    (version "2.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/kilobyte/colorized-logs/archive/refs/tags/v2.6.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kilobyte/colorized-logs")
    (synopsis "tools for processing ANSI-coloured logs")
    (description
     "Colorized-logs provides tools for handling terminal output with ANSI colour
codes, including conversion to HTML and stripping of escape sequences.")
    (license license:expat)))

(define-public wtwitch
  (package
    (name "wtwitch")
    (version "2.6.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/krathalan/wtwitch/archive/refs/tags/2.6.3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (install-file f bin)
                   (chmod (string-append bin "/" (basename f)) #o755))
                 (find-files "." "\\.(sh|bash|lua|pl)$"))
                #t))))))
    (home-page "https://github.com/krathalan/wtwitch")
    (synopsis "terminal user interface for Twitch")
    (description
     "Wtwitch is a terminal-based Twitch client that allows browsing streams,
checking channel status, and launching streams from the command line.")
    (license license:gpl3)))

(define-public rofi-power-menu
  (package
    (name "rofi-power-menu")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/jluttine/rofi-power-menu/archive/refs/tags/3.1.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (install-file f bin)
                   (chmod (string-append bin "/" (basename f)) #o755))
                 (find-files "." "\\.(sh|bash|lua|pl)$"))
                #t))))))
    (home-page "https://github.com/jluttine/rofi-power-menu")
    (synopsis "configurable power menu mode for Rofi")
    (description
     "Rofi-power-menu provides a configurable power menu mode for the Rofi
application launcher, supporting shutdown, reboot, suspend, and logout actions.")
    (license license:expat)))

(define-public mpvc
  (package
    (name "mpvc")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/lwilletts/mpvc/archive/refs/tags/1.4.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (install-file f bin)
                   (chmod (string-append bin "/" (basename f)) #o755))
                 (find-files "." "\\.(sh|bash|lua|pl)$"))
                #t))))))
    (home-page "https://github.com/lwilletts/mpvc")
    (synopsis "mpv terminal controller using IPC")
    (description
     "Mpvc is a command-line controller for the mpv media player that communicates
over the mpv IPC socket, allowing playback control from the terminal.")
    (license license:expat)))

(define-public sysz
  (package
    (name "sysz")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/joehillen/sysz/archive/refs/tags/1.4.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (install-file f bin)
                   (chmod (string-append bin "/" (basename f)) #o755))
                 (find-files "." "\\.(sh|bash|lua|pl)$"))
                #t))))))
    (home-page "https://github.com/joehillen/sysz")
    (synopsis "fzf-based systemd unit manager")
    (description
     "Sysz is an interactive systemd unit manager that uses fzf for fuzzy
finding and selection of system and user services.")
    (license license:unlicense)))

(define-public todotxt
  (package
    (name "todotxt")
    (version "2.12.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/todotxt/todo.txt-cli/archive/refs/tags/v2.12.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (install-file f bin)
                   (chmod (string-append bin "/" (basename f)) #o755))
                 (find-files "." "\\.(sh|bash|lua|pl)$"))
                #t))))))
    (home-page "https://github.com/todotxt/todo.txt-cli")
    (synopsis "simple todo.txt task manager for the command line")
    (description
     "Todo.txt CLI is a minimal, standards-based task manager that stores tasks
in a plain text file following the todo.txt format.")
    (license license:gpl3)))

(define-public mpv-acestream
  (package
    (name "mpv-acestream")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Digitalone1/mpv-acestream/archive/refs/tags/v0.5.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (install-file f bin)
                   (chmod (string-append bin "/" (basename f)) #o755))
                 (find-files "." "\\.(sh|bash|lua|pl)$"))
                #t))))))
    (home-page "https://github.com/Digitalone1/mpv-acestream")
    (synopsis "Lua script adding AceStream protocol to mpv")
    (description
     "Mpv-acestream is a Lua script that adds AceStream protocol handler support
to the mpv media player.")
    (license license:gpl3+)))

(define-public amazon-ecr-credential-helper
  (package
    (name "amazon-ecr-credential-helper")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/awslabs/amazon-ecr-credential-helper/archive/refs/tags/v0.12.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "github.com/placeholder"))
    (home-page "https://github.com/awslabs/amazon-ecr-credential-helper")
    (synopsis "Docker credential helper for Amazon ECR")
    (description
     "Amazon ECR Credential Helper is a credential helper for the Docker daemon
that simplifies authentication with Amazon Elastic Container Registry.")
    (license license:asl2.0)))

(define-public dms
  (package
    (name "dms")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/anacrolix/dms/archive/refs/tags/v1.7.2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "github.com/placeholder"))
    (home-page "https://github.com/anacrolix/dms")
    (synopsis "UPnP DLNA digital media server")
    (description
     "DMS is a UPnP DLNA Digital Media Server that shares media files over the
local network for playback on DLNA-compatible devices.")
    (license license:bsd-3)))

(define-public tcping-go
  (package
    (name "tcping-go")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/pouriyajamshidi/tcping/archive/refs/tags/v2.7.1.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "github.com/placeholder"))
    (home-page "https://github.com/pouriyajamshidi/tcping")
    (synopsis "cross-platform TCP port ping utility")
    (description
     "Tcping is a cross-platform ping utility for TCP ports, inspired by the
Linux ping tool, useful for testing connectivity to services behind firewalls.")
    (license license:expat)))

(define-public droplet-agent
  (package
    (name "droplet-agent")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/digitalocean/droplet-agent/archive/refs/tags/1.3.3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "github.com/placeholder"))
    (home-page "https://github.com/digitalocean/droplet-agent")
    (synopsis "DigitalOcean Droplet monitoring agent")
    (description
     "Droplet Agent is the DigitalOcean agent for enhanced droplet monitoring
and graph metrics collection.")
    (license license:asl2.0)))

(define-public open-in-mpv
  (package
    (name "open-in-mpv")
    (version "2.4.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Baldomo/open-in-mpv/archive/refs/tags/v2.4.3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "github.com/placeholder"))
    (home-page "https://github.com/Baldomo/open-in-mpv")
    (synopsis "browser extension handler for opening video in mpv")
    (description
     "Open-in-mpv is a URL handler and browser extension companion that enables
opening web videos directly in the mpv media player.")
    (license license:gpl3)))

(define-public beangulp
  (package
    (name "beangulp")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/beancount/beangulp/archive/refs/tags/0.2.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/beancount/beangulp")
    (synopsis "importers framework for Beancount")
    (description
     "Beangulp is an importers framework for the Beancount double-entry
bookkeeping system, facilitating automated transaction import.")
    (license license:gpl2+)))

(define-public python-stitching
  (package
    (name "python-stitching")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/OpenStitching/stitching/archive/refs/tags/0.6.1.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/OpenStitching/stitching")
    (synopsis "Python package for image stitching")
    (description
     "Python-stitching provides fast and robust image stitching capabilities,
combining multiple overlapping photographs into a single panoramic image.")
    (license license:asl2.0)))

(define-public pyinstaller-hooks-contrib
  (package
    (name "pyinstaller-hooks-contrib")
    (version "2025.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/pyinstaller/pyinstaller-hooks-contrib/archive/refs/tags/2025.10.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pyinstaller/pyinstaller-hooks-contrib")
    (synopsis "community-maintained hooks for PyInstaller")
    (description
     "PyInstaller-hooks-contrib is a collection of community-maintained import hooks
for PyInstaller, extending support for third-party Python packages.")
    (license license:asl2.0)))

(define-public python-acestream
  (package
    (name "python-acestream")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/jonian/python-acestream/archive/refs/tags/0.2.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jonian/python-acestream")
    (synopsis "Python interface to interact with AceStream engine")
    (description
     "Python-acestream provides a Python interface for interacting with the AceStream
engine and its HTTP API for peer-to-peer media streaming.")
    (license license:gpl3)))

(define-public python-lineprofiler
  (package
    (name "python-lineprofiler")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/pyutils/line_profiler/archive/refs/tags/v5.0.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pyutils/line_profiler")
    (synopsis "line-by-line Python profiler")
    (description
     "Line-profiler is a Python profiler that measures execution time on a
line-by-line basis, useful for identifying performance bottlenecks.")
    (license license:bsd-3)))

(define-public pypi2aur
  (package
    (name "pypi2aur")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://files.pythonhosted.org/packages/source/p/pypi2aur/pypi2aur-0.1.14.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pypi.org/project/pypi2aur/")
    (synopsis "PyPI to AUR PKGBUILD generator")
    (description
     "Pypi2aur is a tool for generating Arch Linux AUR PKGBUILD files from
Python packages hosted on PyPI.")
    (license license:expat)))

(define-public nhentai
  (package
    (name "nhentai")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/RicterZ/nhentai/archive/refs/heads/master.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/RicterZ/nhentai")
    (synopsis "CLI tool for downloading doujinshi")
    (description
     "Nhentai is a command-line tool for downloading doujinshi manga from
online galleries.")
    (license license:expat)))

(define-public via-appimage
  (package
    (name "via-appimage")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/the-via/releases/releases/download/v3.0.0/via-3.0.0-linux.AppImage")
       (file-name (string-append "via-appimage-" "3.0.0" ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((bin (string-append #$output "/bin"))
                (lib (string-append #$output "/lib/via-appimage")))
            (mkdir-p bin)
            (mkdir-p lib)
            (copy-file #$source (string-append lib "/via-appimage.AppImage"))
            (chmod (string-append lib "/via-appimage.AppImage") #o755)
            (call-with-output-file (string-append bin "/via-appimage")
              (lambda (port)
                (format port "#!~a/bin/bash\nexec ~a/lib/via-appimage/via-appimage.AppImage \"$@\"\n"
                        (assoc-ref %build-inputs "bash") #$output)))
            (chmod (string-append bin "/via-appimage") #o755)
            #t))))
    (native-inputs (list (specification->package "bash")))
    (home-page "https://caniusevia.com/")
    (synopsis "keyboard configuration tool")
    (description
     "VIA is a keyboard configuration tool for programming keymaps, macros,
and lighting on compatible mechanical keyboards.")
    (license license:expat)))

(define-public cljfmt-bin
  (package
    (name "cljfmt-bin")
    (version "0.16.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/weavejester/cljfmt/releases/download/0.16.3/cljfmt-linux-amd64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (for-each (lambda (f) (install-file f bin))
                          (find-files "." (lambda (f s) (executable-file? f))))
                #t))))))
    (home-page "https://github.com/weavejester/cljfmt")
    (synopsis "formatter for Clojure code")
    (description
     "Cljfmt is a code formatter for the Clojure programming language, enforcing
consistent indentation and whitespace conventions.")
    (license license:epl1.0)))

(define-public amazon-corretto-21-bin
  (package
    (name "amazon-corretto-21-bin")
    (version "21.0.8.9.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://corretto.aws/downloads/resources/21.0.8.9.1/amazon-corretto-21.0.8.9.1-linux-x64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((out #$output))
                (copy-recursively "." out)
                #t))))))
    (home-page "https://aws.amazon.com/corretto/")
    (synopsis "Amazon Corretto OpenJDK 21 distribution")
    (description
     "Amazon Corretto is a no-cost, multiplatform, production-ready distribution
of OpenJDK, providing long-term support patches and updates.")
    (license license:gpl2)))

(define-public mujoco-bin
  (package
    (name "mujoco-bin")
    (version "3.3.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/google-deepmind/mujoco/releases/download/3.3.5/mujoco-3.3.5-linux-x86_64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let* ((out #$output)
                     (lib (string-append out "/lib"))
                     (inc (string-append out "/include"))
                     (bin (string-append out "/bin")))
                (when (file-exists? "lib")
                  (mkdir-p lib)
                  (copy-recursively "lib" lib))
                (when (file-exists? "include")
                  (mkdir-p inc)
                  (copy-recursively "include" inc))
                (when (file-exists? "bin")
                  (mkdir-p bin)
                  (copy-recursively "bin" bin))
                #t))))))
    (home-page "https://www.mujoco.org")
    (synopsis "multi-joint dynamics physics simulator")
    (description
     "MuJoCo is a general-purpose physics simulator for multi-joint dynamics
with contact, developed by Google DeepMind for robotics and AI research.")
    (license license:asl2.0)))

(define-public hunspell-pt-br
  (package
    (name "hunspell-pt-br")
    (version "3.2.15")
    (source
     (origin
       (method url-fetch)
       (uri "https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VERO-3.2.15.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((dict-dir (string-append #$output "/share/hunspell")))
                (mkdir-p dict-dir)
                (for-each (lambda (f) (install-file f dict-dir))
                          (append (find-files "." "\\.dic$")
                                  (find-files "." "\\.aff$")))
                #t))))))
    (home-page "https://pt-br.libreoffice.org/projetos/vero")
    (synopsis "Brazilian Portuguese dictionary for Hunspell")
    (description
     "VERO provides Brazilian Portuguese grammar, spelling, and hyphenation
dictionaries for the Hunspell spell checker.")
    (license license:lgpl3+)))

(define-public hamradio-menus
  (package
    (name "hamradio-menus")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hamradio-menus.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((share (string-append #$output "/share/hamradio-menus")))
                (mkdir-p share)
                (copy-recursively "." share)
                #t))))))
    (home-page "https://www.archlinux.org/")
    (synopsis "XDG-compliant menu entries for ham radio software")
    (description
     "Hamradio-menus installs XDG-compliant desktop menu categories and entries
for organizing ham radio applications.")
    (license license:gpl2+)))

(define-public vimrc-amix
  (package
    (name "vimrc-amix")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/amix/vimrc/archive/refs/heads/master.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((share (string-append #$output "/share/vimrc-amix")))
                (mkdir-p share)
                (copy-recursively "." share)
                #t))))))
    (home-page "https://github.com/amix/vimrc")
    (synopsis "curated Vim configuration collection")
    (description
     "The Ultimate vimrc is a curated collection of Vim configuration files
and plugins maintained by amix.")
    (license license:expat)))

(define-public sol2-single
  (package
    (name "sol2-single")
    (version "3.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ThePhD/sol2/archive/refs/tags/v3.5.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let ((inc (string-append #$output "/include")))
                (mkdir-p inc)
                (for-each (lambda (f) (install-file f inc))
                          (find-files "single/include" "\\.hpp$"))
                #t))))))
    (home-page "https://sol2.readthedocs.io")
    (synopsis "single-header variant of the Sol2 C++ Lua wrapper")
    (description
     "Sol2-single is the single-header distribution of the Sol2 C++ to Lua API
wrapper library, intended for projects that prefer header-only dependencies.")
    (license license:expat)))

(define-public fish-done
  (package
    (name "fish-done")
    (version "1.21.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/franciscolourenco/done/archive/refs/tags/1.21.1.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let* ((fish-dir (string-append #$output
                                "/share/fish/vendor_conf.d"))
                     (func-dir (string-append #$output
                                "/share/fish/vendor_functions.d")))
                (mkdir-p fish-dir)
                (mkdir-p func-dir)
                (for-each (lambda (f) (install-file f fish-dir))
                          (find-files "conf.d" "\\.fish$"))
                (for-each (lambda (f) (install-file f func-dir))
                          (find-files "functions" "\\.fish$"))
                #t))))))
    (home-page "https://github.com/franciscolourenco/done")
    (synopsis "fish shell notification plugin for long processes")
    (description
     "Fish-done is a Fish shell plugin that sends desktop notifications when
long-running processes complete.")
    (license license:expat)))
