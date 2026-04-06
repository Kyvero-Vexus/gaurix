;;; Dep-tree priority 100 resolution pass — font, data, script, and simple
;;; source-build recipes.
;;; 32 recipes: 8 CCC fonts, 3 game data, 2 themes/shaders, 3 simple C,
;;; 5 scripts/wrappers, 3 data/doc installs, 2 misc libraries, 6 other.
(define-module (gaurix packages cron-c79f127f-r22-w03-blocked100)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module (guix utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xml)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; CCC 2024 fonts
            font-uncut-sans-otf
            font-space-mono-ttf
            font-uncut-sans-ttf
            font-uncut-sans-woff
            font-uncut-sans-woff2
            font-pilowlava-otf
            font-pilowlava-woff
            font-pilowlava-woff2
            ;; Other font
            font-harmonyos-sans
            ;; Game data
            chexquest3-wad
            square1-wad
            86box-roms
            ;; Themes/shaders
            gruvbox-dark-gtk
            reshade-shaders
            ;; Simple C programs
            alarm
            pdeath
            gasm80
            ;; Scripts/wrappers
            yt-dlp-drop-in
            googler
            ani-skip
            csvtable
            ;; Data/docs
            regina-rexx-doc
            virtio-win
            wps-office-mime
            fake-ms-fonts
            mxw-udev
            iscan-data
            ;; Libraries
            ksql
            ;; Misc
            86box-roms-git
            ;; Extended selection
            nitrogen
            presage
            scala-docs
            scala-sources
            zsa-keymapp
            gnome-icon-theme-classic
            ascii-chat
            minio-server))

;; ═══════════════════════════════════════════════════════════════════
;; CCC 2024 Congress fonts (38C3 style guide)
;; Source: https://events.ccc.de/congress/2024/infos/styleguide.html
;; ═══════════════════════════════════════════════════════════════════

(define-public font-uncut-sans-otf
  (package
    (name "font-uncut-sans-otf")
    (version "7.200")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicromancermas/Uncut-Sans")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts/otf" "share/fonts/opentype/uncut-sans/"))))
    (home-page "https://uncut.wtf")
    (synopsis "uncut Sans OpenType font")
    (description "Uncut Sans is a grotesque sans-serif typeface designed for
the 38C3 Congress style guide.  This package provides the OpenType format.")
    (license license:silofl1.1)))

(define-public font-uncut-sans-ttf
  (package
    (inherit font-uncut-sans-otf)
    (name "font-uncut-sans-ttf")
    (arguments
     (list #:install-plan
           #~'(("fonts/ttf" "share/fonts/truetype/uncut-sans/"))))
    (synopsis "uncut Sans TrueType font")
    (description "Uncut Sans is a grotesque sans-serif typeface designed for
the 38C3 Congress style guide.  This package provides the TrueType format.")))

(define-public font-uncut-sans-woff
  (package
    (inherit font-uncut-sans-otf)
    (name "font-uncut-sans-woff")
    (arguments
     (list #:install-plan
           #~'(("fonts/webfonts" "share/fonts/woff/uncut-sans/"
                #:include (".*\\.woff$")))))
    (synopsis "uncut Sans WOFF web font")
    (description "Uncut Sans is a grotesque sans-serif typeface designed for
the 38C3 Congress style guide.  This package provides the WOFF web format.")))

(define-public font-uncut-sans-woff2
  (package
    (inherit font-uncut-sans-otf)
    (name "font-uncut-sans-woff2")
    (arguments
     (list #:install-plan
           #~'(("fonts/webfonts" "share/fonts/woff2/uncut-sans/"
                #:include (".*\\.woff2$")))))
    (synopsis "uncut Sans WOFF2 web font")
    (description "Uncut Sans is a grotesque sans-serif typeface designed for
the 38C3 Congress style guide.  This package provides the WOFF2 web format.")))

(define-public font-space-mono-ttf
  (package
    (name "font-space-mono-ttf")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/googlefonts/spacemono")
             (commit "f5bbc1b89b8e25e5e9b95a1e1a930a8e268143ac")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts" "share/fonts/truetype/space-mono/"
                #:include (".*\\.ttf$")))))
    (home-page "https://fonts.google.com/specimen/Space+Mono")
    (synopsis "space Mono fixed-width typeface")
    (description "Space Mono is an original fixed-width type family designed
by Colophon Foundry for Google Fonts.  It was featured in the 38C3 Congress
style guide.")
    (license license:silofl1.1)))

(define-public font-pilowlava-otf
  (package
    (name "font-pilowlava-otf")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicromancermas/Pilowlava")
             (commit "master")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts/otf" "share/fonts/opentype/pilowlava/"))))
    (home-page "https://velvetyne.fr/fonts/pilowlava/")
    (synopsis "pilowlava display typeface")
    (description "Pilowlava is a display typeface by Anton Moglia and
Jérémy Landes, published by Velvetyne Type Foundry.  Featured in the 38C3
Congress style guide.")
    (license license:silofl1.1)))

(define-public font-pilowlava-woff
  (package
    (inherit font-pilowlava-otf)
    (name "font-pilowlava-woff")
    (arguments
     (list #:install-plan
           #~'(("fonts/webfonts" "share/fonts/woff/pilowlava/"
                #:include (".*\\.woff$")))))
    (synopsis "pilowlava WOFF web font")
    (description "Pilowlava is a display typeface published by Velvetyne
Type Foundry.  This package provides the WOFF web format.")))

(define-public font-pilowlava-woff2
  (package
    (inherit font-pilowlava-otf)
    (name "font-pilowlava-woff2")
    (arguments
     (list #:install-plan
           #~'(("fonts/webfonts" "share/fonts/woff2/pilowlava/"
                #:include (".*\\.woff2$")))))
    (synopsis "pilowlava WOFF2 web font")
    (description "Pilowlava is a display typeface published by Velvetyne
Type Foundry.  This package provides the WOFF2 web format.")))

(define-public font-harmonyos-sans
  (package
    (name "font-harmonyos-sans")
    (version "2025.09.23")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify source URL — HarmonyOS Sans from Huawei developer site
       (uri "https://communityfile-drcn.op.hicloud.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20231114175800.68498081835058453617484460166565:50001231000000:2800:4FBA03E3AB4E9EEA3A2F3DB229DB76DD44E6D4B1E8FF8F0CE18FC0C80BBD5ED5.zip")
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/harmonyos-sans/"
                #:include (".*\\.ttf$")))))
    (home-page "https://developer.huawei.com/consumer/cn/design/resource/")
    (synopsis "harmonyOS Sans typeface family")
    (description "HarmonyOS Sans is the default font family for HarmonyOS,
designed by Huawei.  It supports Latin, Chinese, and other scripts.")
    (license license:asl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; Game data packages
;; ═══════════════════════════════════════════════════════════════════

(define-public chexquest3-wad
  (package
    (name "chexquest3-wad")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify source URL — original site archived
       (uri (string-append
             "https://web.archive.org/web/20140326194047/"
             "http://www.chucktropolis.com/downloads/chexquest3.zip"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/games/doom/" #:include (".*\\.wad$")))))
    (home-page "https://web.archive.org/web/20140326194047/http://www.chucktropolis.com/gamers.htm")
    (synopsis "chex Quest 3 IWAD game data")
    (description "Chex Quest 3 is a non-violent first-person shooter total
conversion for Doom.  This package provides the WAD game data file.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Freeware game data"))))

(define-public square1-wad
  (package
    (name "square1-wad")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify source URL
       (uri "https://adventuresofsquare.com/downloads/square1v21.zip")
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/games/doom/" #:include (".*\\.wad$")))))
    (home-page "http://adventuresofsquare.com/")
    (synopsis "adventures of Square episode 1 game data")
    (description "The Adventures of Square is a standalone first-person
shooter game built on the GZDoom engine.  This package provides the Episode 1
WAD game data.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Freeware game data"))))

(define-public 86box-roms
  (package
    (name "86box-roms")
    (version "5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/86Box/roms")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/86Box/roms/"))))
    (home-page "https://github.com/86Box/roms")
    (synopsis "rOM images for the 86Box PC emulator")
    (description "This package provides ROM images required by the 86Box
emulator, which accurately emulates various IBM PC compatible systems from
the 1980s and 1990s.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Various ROM licenses"))))

(define-public 86box-roms-git
  (package
    (inherit 86box-roms)
    (name "86box-roms-git")
    (version "5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/86Box/roms")
             (commit "a749595")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (synopsis "rOM images for 86Box emulator (git snapshot)")
    (description "This package provides ROM images for the 86Box emulator
from the latest git development snapshot.")))

;; ═══════════════════════════════════════════════════════════════════
;; Themes and shaders
;; ═══════════════════════════════════════════════════════════════════

(define-public gruvbox-dark-gtk
  (package
    (name "gruvbox-dark-gtk")
    (version "1.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jmattheis/gruvbox-dark-gtk")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/gruvbox-dark/"
                #:exclude ("README.md" ".git" ".github" "LICENSE")))))
    (home-page "https://github.com/jmattheis/gruvbox-dark-gtk")
    (synopsis "gruvbox dark theme for GTK 2.0 and 3.0")
    (description "A dark GTK theme based on the Gruvbox color scheme by
Pavel Pertsev.  Supports both GTK 2.0 and GTK 3.0 applications.")
    (license license:gpl3)))

(define-public reshade-shaders
  (package
    (name "reshade-shaders")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/crosire/reshade-shaders")
             (commit "67603ed")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Shaders" "share/reshade/shaders/")
                ("Textures" "share/reshade/textures/"))))
    (home-page "https://github.com/crosire/reshade-shaders")
    (synopsis "post-processing shaders for ReShade and vkBasalt")
    (description "A collection of post-processing shaders written in the
ReShade FX shader language.  These shaders can be used by vkBasalt to apply
visual effects to Vulkan applications and games.")
    (license license:unlicense)))

;; ═══════════════════════════════════════════════════════════════════
;; Simple C programs
;; ═══════════════════════════════════════════════════════════════════

(define-public alarm
  (package
    (name "alarm")
    (version "1.2.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/maandree/alarm")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://codeberg.org/maandree/alarm")
    (synopsis "schedule an alarm for a program at startup")
    (description "Alarm is a simple utility that schedules a SIGALRM signal
to be delivered to a program after a specified time, then executes the
program.  Useful for imposing time limits on commands.")
    (license license:isc)))

(define-public pdeath
  (package
    (name "pdeath")
    (version "1.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/maandree/pdeath")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://codeberg.org/maandree/pdeath")
    (synopsis "run a command that is killed when its parent exits")
    (description "Pdeath arranges for a signal to be sent to the executed
command when the parent process exits.  Uses the @code{PR_SET_PDEATHSIG}
feature on Linux.")
    (license license:isc)))

(define-public gasm80
  (package
    (name "gasm80")
    (version "0.0.20260329")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nanochess/gasm80")
             (commit "master")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'install 'create-dirs
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))))))))
    (home-page "https://github.com/nanochess/gasm80")
    (synopsis "small generic Z80 and 6502 assembler")
    (description "Gasm80 is a small, generic assembler for the Z80 and 6502
processors.  It supports standard assembly syntax and produces binary output.")
    (license license:bsd-2)))

;; ═══════════════════════════════════════════════════════════════════
;; Scripts and wrappers
;; ═══════════════════════════════════════════════════════════════════

(define-public yt-dlp-drop-in
  (package
    (name "yt-dlp-drop-in")
    (version "2025.10.22")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((bin (string-append #$output "/bin"))
                     (yt-dlp (string-append #$(this-package-input "yt-dlp")
                                            "/bin/yt-dlp")))
                 (mkdir-p bin)
                 (symlink yt-dlp (string-append bin "/youtube-dl"))))))
    (inputs (list yt-dlp))
    (home-page "https://github.com/yt-dlp/yt-dlp")
    (synopsis "provide youtube-dl command using yt-dlp")
    (description "This package creates a @code{youtube-dl} symlink pointing
to @code{yt-dlp}, allowing software that invokes @code{youtube-dl} to
transparently use the maintained yt-dlp fork.")
    (license license:unlicense)))

(define-public googler
  (package
    (name "googler")
    (version "4.3.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/oksiquatzel/googler")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list python))
    (home-page "https://github.com/oksiquatzel/googler")
    (synopsis "google Search from the command line")
    (description "Googler is a power tool to Google from the command line.
It shows the title, URL, and abstract for each result and supports navigation
through search result pages.")
    (license license:gpl3+)))

(define-public ani-skip
  (package
    (name "ani-skip")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/synacktraa/ani-skip")
             (commit "12b4960")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ani-skip" "bin/"))))
    (inputs (list bash curl fzf mpv))
    (home-page "https://github.com/synacktraa/ani-skip")
    (synopsis "automatically skip anime opening and ending sequences")
    (description "Ani-skip is a shell script that automatically detects and
skips anime opening and ending sequences when watching with mpv.  It uses the
AniSkip API to retrieve timestamp data.")
    (license license:expat)))

(define-public csvtable
  (package
    (name "csvtable")
    (version "1.00")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wofr06/csvtable")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("csvtable" "bin/"))))
    (inputs (list perl))
    (home-page "https://github.com/wofr06/csvtable")
    (synopsis "fault-tolerant CSV file viewer for the terminal")
    (description "Csvtable is a Perl script that displays CSV files as
formatted tables in the terminal.  It handles malformed CSV gracefully.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; Data and documentation packages
;; ═══════════════════════════════════════════════════════════════════

(define-public regina-rexx-doc
  (package
    (name "regina-rexx-doc")
    (version "3.9.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/regina-rexx/"
                           "regina-rexx/" version
                           "/regina-rexx-doc-" version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/doc/regina-rexx/"
                #:include (".*\\.pdf$" ".*\\.html$" ".*\\.txt$")))))
    (home-page "https://regina-rexx.sourceforge.io/")
    (synopsis "documentation for the Regina REXX interpreter")
    (description "This package provides PDF and HTML documentation for the
Regina REXX interpreter and the RegUtil external function library, plus
demo scripts.")
    (license license:lgpl2.0+)))

(define-public virtio-win
  (package
    (name "virtio-win")
    (version "0.1.285.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/"
             "archive-virtio/virtio-win-" version
             "/virtio-win-" version ".iso"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/virtio-win/"))))
    (home-page "https://docs.fedoraproject.org/en-US/quick-docs/creating-windows-virtual-machines-using-virtio-drivers/index.html")
    (synopsis "virtIO drivers for Windows virtual machines")
    (description "This package provides VirtIO device drivers for Windows 7
and newer guest operating systems running in KVM/QEMU virtual machines.
Includes network, block, balloon, serial, and GPU drivers.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Red Hat VirtIO driver license"))))

(define-public wps-office-mime
  (package
    (name "wps-office-mime")
    (version "11.1.0.11723")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify source URL — WPS Office MIME package
       (uri (string-append
             "https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/"
             "linux/" version "/wps-office-mime-" version
             "-1.noarch.rpm"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mime/packages/"
                #:include (".*\\.xml$")))))
    (home-page "http://wps-community.org")
    (synopsis "mIME type definitions for WPS Office")
    (description "This package provides shared MIME type definitions for
WPS Office (Kingsoft Office) document formats, enabling proper file type
detection in desktop environments.")
    (license license:gpl2)))

(define-public fake-ms-fonts
  (package
    (name "fake-ms-fonts")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify source URL
       (uri (string-append
             "https://www.eworm.de/download/linux/fake-ms-fonts-"
             version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fontconfig/conf.avail/"
                #:include (".*\\.conf$")))))
    (home-page "https://www.eworm.de/")
    (synopsis "fontconfig aliases for core Microsoft TrueType fonts")
    (description "This package provides fontconfig configuration files that
create font aliases mapping Microsoft core font names (Arial, Courier New,
Times New Roman) to available free alternatives.")
    (license license:expat)))

(define-public mxw-udev
  (package
    (name "mxw-udev")
    (version "2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/korkje/mow")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("udev" "lib/udev/rules.d/"
                #:include (".*\\.rules$")))))
    (home-page "https://github.com/korkje/mow")
    (synopsis "udev rules for Glorious mice configuration")
    (description "This package provides udev rules for rootless configuration
and reporting for Glorious Core v1 mouse devices (mow and mxw tools).")
    (license license:expat)))

(define-public iscan-data
  (package
    (name "iscan-data")
    (version "1.39.2.1")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify source URL — Epson downloads
       (uri (string-append
             "https://download2.ebz.epson.net/iscan/plugin/iscan-data/"
             "deb/x64/iscan-data_" version "-1_all.deb"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/iscan-data/"))))
    (home-page "http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX")
    (synopsis "data files for EPSON Image Scan")
    (description "This package provides firmware and configuration data files
required by the EPSON Image Scan (iscan) scanner driver.")
    (license (license:non-copyleft
              "file://COPYING"
              "EPSON data license"))))

;; ═══════════════════════════════════════════════════════════════════
;; Libraries
;; ═══════════════════════════════════════════════════════════════════

(define-public ksql
  (package
    (name "ksql")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://kristaps.bsd.lv/ksql/snapshots/ksql-"
             version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (setenv "PREFIX" (assoc-ref outputs "out"))
                   #t)))))
    (inputs (list sqlite))
    (home-page "https://kristaps.bsd.lv/ksql/")
    (synopsis "wrapper library for SQLite emphasizing correct usage")
    (description "Ksql is a C library wrapping the SQLite C interface with a
focus on ease of correct usage and data integrity.  It provides automatic
transaction management and connection pooling.")
    (license license:isc)))

;; ═══════════════════════════════════════════════════════════════════
;; Extended selection — additional feasible recipes
;; ═══════════════════════════════════════════════════════════════════

(define-public nitrogen
  (package
    (name "nitrogen")
    (version "1.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/l3ib/nitrogen")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'autoreconf
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake pkg-config))
    (inputs (list gtkmm-3 librsvg))
    (home-page "https://github.com/l3ib/nitrogen")
    (synopsis "background browser and setter for X windows")
    (description "Nitrogen is a background browser and setter for X Window
System.  It can set the wallpaper on all monitors independently and supports
various scaling modes like tiled, centered, scaled, and zoomed.")
    (license license:gpl2+)))

(define-public presage
  (package
    (name "presage")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/presage/presage/"
                           version "/presage-" version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list ncurses sqlite))
    (home-page "https://presage.sourceforge.io/")
    (synopsis "intelligent predictive text entry system")
    (description "Presage is an intelligent predictive text entry system.
It predicts what the user is about to type based on the text already entered
using statistical and syntactic language models.")
    (license license:gpl2+)))

(define-public scala-docs
  (package
    (name "scala-docs")
    (version "2.13.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.lightbend.com/scala/" version
             "/scala-docs-" version ".txz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/doc/scala/"))))
    (home-page "https://www.scala-lang.org")
    (synopsis "documentation for the Scala programming language")
    (description "This package provides API documentation and reference
materials for the Scala programming language, including the standard library
documentation.")
    (license license:asl2.0)))

(define-public scala-sources
  (package
    (name "scala-sources")
    (version "2.13.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.lightbend.com/scala/" version
             "/scala-sources-" version ".txz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/scala/sources/"))))
    (home-page "https://www.scala-lang.org")
    (synopsis "source code for the Scala programming language")
    (description "This package provides the source code for the Scala
compiler and standard library.  Useful for IDE integration and source-level
debugging.")
    (license license:asl2.0)))

(define-public zsa-keymapp
  (package
    (name "zsa-keymapp")
    (version "1.3.7")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify URL — ZSA binary release
       (uri (string-append
             "https://oryx.zsa.io/keymapp/linux/keymapp-" version
             "-x86_64.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("keymapp" "bin/"))))
    (home-page "https://zsa.io/flash")
    (synopsis "visual keyboard layout reference for ZSA keyboards")
    (description "Keymapp is a live visual reference tool for ZSA mechanical
keyboards (Moonlander, ErgoDox EZ, Voyager, Planck EZ).  It displays the
current layer and key assignments in real time.")
    (license (license:non-copyleft
              "file://LICENSE"
              "ZSA Keymapp license"))))

(define-public gnome-icon-theme-classic
  (package
    (name "gnome-icon-theme-classic")
    (version "3.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://gnome/sources/gnome-icon-theme/" "3.12"
             "/gnome-icon-theme-" version ".tar.xz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list intltool))
    (home-page "http://www.gnome.org")
    (synopsis "gNOME classic desktop icon theme")
    (description "The GNOME icon theme provides a set of icons for use in
the GNOME desktop environment.  This is the classic icon set used in
GNOME 3.x releases.")
    (license license:lgpl3+)))

(define-public ascii-chat
  (package
    (name "ascii-chat")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify source URL
       (uri (string-append
             "https://ascii-chat.com/releases/ascii-chat-"
             version "-linux-x86_64.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ascii-chat" "bin/"))))
    (home-page "https://ascii-chat.com")
    (synopsis "terminal-based video chat application")
    (description "ASCII Chat is a video chat application that renders video
as ASCII art in your terminal.  It provides real-time video calling with a
retro text-based aesthetic.")
    (license (license:non-copyleft
              "file://LICENSE"
              "ASCII Chat license"))))

(define-public minio-server
  (package
    (name "minio-server")
    (version "2025.10.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.min.io/server/minio/release/linux-amd64/"
             "archive/minio.RELEASE."
             "2025-10-15T00-00-00Z"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("minio.RELEASE.2025-10-15T00-00-00Z" "bin/minio"))))
    (home-page "https://minio.io")
    (synopsis "s3-compatible object storage server")
    (description "MinIO is a high-performance, S3-compatible object storage
server.  It is designed for large-scale data infrastructure and supports
erasure coding, bitrot protection, and encryption.")
    (license license:agpl3)))
