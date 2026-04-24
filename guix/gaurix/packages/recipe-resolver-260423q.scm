;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423q
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (30):
;;;        1.  iortcw-data (gnu-build-system, v1.51c, GPL3)
;;;        2.  intel-mas-cli-tool (gnu-build-system, v2.5, unknown)
;;;        3.  base91 (gnu-build-system, v0.6.0, BSD)
;;;        4.  cmdpack-bin2ecm (gnu-build-system, v1.06, GPL3)
;;;        5.  cmdpack-bincomp (gnu-build-system, v1.06, GPL3)
;;;        6.  cmdpack-brrrip (gnu-build-system, v1.06, GPL3)
;;;        7.  cmdpack-byteshuf (gnu-build-system, v1.06, GPL3)
;;;        8.  cmdpack-cdpatch (gnu-build-system, v1.06, GPL3)
;;;        9.  cmdpack-fakecrc (gnu-build-system, v1.06, GPL3)
;;;       10.  cmdpack-hax65816 (gnu-build-system, v1.06, GPL3)
;;;       11.  cmdpack-pecompat (gnu-build-system, v1.06, GPL3)
;;;       12.  cmdpack-rels (gnu-build-system, v1.06, GPL3)
;;;       13.  cmdpack-screamf (gnu-build-system, v1.06, GPL3)
;;;       14.  cmdpack-uips (gnu-build-system, v1.06, GPL3)
;;;       15.  cmdpack-vb2rip (gnu-build-system, v1.06, GPL3)
;;;       16.  cmdpack-wordadd (gnu-build-system, v1.06, GPL3)
;;;       17.  gtkman (gnu-build-system, v2.3.2, GPL3)
;;;       18.  hunspell-bg (gnu-build-system, v7.6.3.2, GPL2)
;;;       19.  liri-wallpapers (gnu-build-system, v0.9.0, GPL3)
;;;       20.  xcursor-dmz (gnu-build-system, v0.4.5, MIT)
;;;       21.  yaft (gnu-build-system, v0.2.9, MIT)
;;;       22.  gtk-theme-onestepback (gnu-build-system, v0.991, GPL3)
;;;       23.  muscle (pyproject-build-system, v5.3, GPL-3.0-or-later)
;;;       24.  squirrel (gnu-build-system, v3.2, MIT)
;;;       25.  mactelnet (gnu-build-system, v0.6.3, GPL)
;;;       26.  wordlists (gnu-build-system, v0.5, GPLv2)
;;;       27.  otf-sans-forgetica (font-build-system, v1.0, CC-BY-NC-4.0)
;;;       28.  netkit-bsd-finger-ipv6 (gnu-build-system, v0.17+deb17, BSD)
;;;       29.  nginx-libunit (go-build-system, v1.31.0, Apache)
;;;       30.  lexend-fonts-git (gnu-build-system, vr114.7894f02, custom:OFL-1.1)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            iortcw-data
            intel-mas-cli-tool
            base91
            cmdpack-bin2ecm
            cmdpack-bincomp
            cmdpack-brrrip
            cmdpack-byteshuf
            cmdpack-cdpatch
            cmdpack-fakecrc
            cmdpack-hax65816
            cmdpack-pecompat
            cmdpack-rels
            cmdpack-screamf
            cmdpack-uips
            cmdpack-vb2rip
            cmdpack-wordadd
            gtkman
            hunspell-bg
            liri-wallpapers
            xcursor-dmz
            yaft
            gtk-theme-onestepback
            muscle
            squirrel
            mactelnet
            wordlists
            otf-sans-forgetica
            netkit-bsd-finger-ipv6
            nginx-libunit
            lexend-fonts-git
            ))

;;; -------------------------------------------------------------------
;;; 1. iortcw-data --- return to Castle Wolfenstein Single Player pk3s files (shared use)
;;; -------------------------------------------------------------------
(define-public iortcw-data
  (package
    (name "iortcw-data")
    (version "1.51c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iortcw/iortcw")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "return to Castle Wolfenstein Single Player pk3s files (shared use)")
    (description "Return to Castle Wolfenstein Single Player pk3s files (shared use).")
    (home-page "https://github.com/iortcw/iortcw")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2. intel-mas-cli-tool --- a drive management CLI tool for Intel Optane SSDs and Intel Optane Memory...
;;; -------------------------------------------------------------------
(define-public intel-mas-cli-tool
  (package
    (name "intel-mas-cli-tool")
    (version "2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.intel.com/content/www/us/en/download/19520//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a drive management CLI tool for Intel Optane SSDs and Intel Optane Memory...")
    (description "A drive management CLI tool for Intel Optane SSDs and Intel Optane Memory devices.")
    (home-page "https://www.intel.com/content/www/us/en/download/19520/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 3. base91 --- an advanced method for encoding binary data to ASCII text
;;; -------------------------------------------------------------------
(define-public base91
  (package
    (name "base91")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://base91.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced method for encoding binary data to ASCII text")
    (description "An advanced method for encoding binary data to ASCII text.")
    (home-page "http://base91.sourceforge.net/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 4. cmdpack-bin2ecm --- encoder/decoder for Error Code Modeler format
;;; -------------------------------------------------------------------
(define-public cmdpack-bin2ecm
  (package
    (name "cmdpack-bin2ecm")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "encoder/decoder for Error Code Modeler format")
    (description "Encoder/decoder for Error Code Modeler format.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. cmdpack-bincomp --- compare binary files
;;; -------------------------------------------------------------------
(define-public cmdpack-bincomp
  (package
    (name "cmdpack-bincomp")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compare binary files")
    (description "Compare binary files.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. cmdpack-brrrip --- rip SNES BRR sound samples
;;; -------------------------------------------------------------------
(define-public cmdpack-brrrip
  (package
    (name "cmdpack-brrrip")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rip SNES BRR sound samples")
    (description "Rip SNES BRR sound samples.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. cmdpack-byteshuf --- shuffle or unshuffle bytes in a file
;;; -------------------------------------------------------------------
(define-public cmdpack-byteshuf
  (package
    (name "cmdpack-byteshuf")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "shuffle or unshuffle bytes in a file")
    (description "Shuffle or unshuffle bytes in a file.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. cmdpack-cdpatch --- CD-XA image insert/extract utility
;;; -------------------------------------------------------------------
(define-public cmdpack-cdpatch
  (package
    (name "cmdpack-cdpatch")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CD-XA image insert/extract utility")
    (description "CD-XA image insert/extract utility.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. cmdpack-fakecrc --- fake the CRC32 of a file
;;; -------------------------------------------------------------------
(define-public cmdpack-fakecrc
  (package
    (name "cmdpack-fakecrc")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fake the CRC32 of a file")
    (description "Fake the CRC32 of a file.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 10. cmdpack-hax65816 --- simple 65816 disassembler
;;; -------------------------------------------------------------------
(define-public cmdpack-hax65816
  (package
    (name "cmdpack-hax65816")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple 65816 disassembler")
    (description "Simple 65816 disassembler.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 11. cmdpack-pecompat --- maximize compatibility of a Win32 PE file
;;; -------------------------------------------------------------------
(define-public cmdpack-pecompat
  (package
    (name "cmdpack-pecompat")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "maximize compatibility of a Win32 PE file")
    (description "Maximize compatibility of a Win32 PE file.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. cmdpack-rels --- relative Searcher
;;; -------------------------------------------------------------------
(define-public cmdpack-rels
  (package
    (name "cmdpack-rels")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "relative Searcher")
    (description "Relative Searcher.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. cmdpack-screamf --- .AMF to .S3M converter
;;; -------------------------------------------------------------------
(define-public cmdpack-screamf
  (package
    (name "cmdpack-screamf")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis ".AMF to .S3M converter")
    (description ".AMF to .S3M converter.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. cmdpack-uips --- universal IPS patch create/apply utility
;;; -------------------------------------------------------------------
(define-public cmdpack-uips
  (package
    (name "cmdpack-uips")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "universal IPS patch create/apply utility")
    (description "Universal IPS patch create/apply utility.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15. cmdpack-vb2rip --- VB2 sound format ripping utility
;;; -------------------------------------------------------------------
(define-public cmdpack-vb2rip
  (package
    (name "cmdpack-vb2rip")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "VB2 sound format ripping utility")
    (description "VB2 sound format ripping utility.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 16. cmdpack-wordadd --- addition word puzzle solver
;;; -------------------------------------------------------------------
(define-public cmdpack-wordadd
  (package
    (name "cmdpack-wordadd")
    (version "1.06")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chungy/cmdpack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "addition word puzzle solver")
    (description "Addition word puzzle solver.")
    (home-page "https://github.com/chungy/cmdpack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. gtkman --- simple GTK+3 manual page viewer
;;; -------------------------------------------------------------------
(define-public gtkman
  (package
    (name "gtkman")
    (version "2.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gapan/gtkman")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple GTK+3 manual page viewer")
    (description "Simple GTK+3 manual page viewer.")
    (home-page "https://github.com/gapan/gtkman")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. hunspell-bg --- bulgarian dictionary for Hunspell
;;; -------------------------------------------------------------------
(define-public hunspell-bg
  (package
    (name "hunspell-bg")
    (version "7.6.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://bgoffice.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bulgarian dictionary for Hunspell")
    (description "Bulgarian dictionary for Hunspell.")
    (home-page "https://bgoffice.sourceforge.net/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 19. liri-wallpapers --- wallpapers for Liri OS
;;; -------------------------------------------------------------------
(define-public liri-wallpapers
  (package
    (name "liri-wallpapers")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://liri.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wallpapers for Liri OS")
    (description "Wallpapers for Liri OS.")
    (home-page "https://liri.io")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 20. xcursor-dmz --- style neutral, scalable cursor theme
;;; -------------------------------------------------------------------
(define-public xcursor-dmz
  (package
    (name "xcursor-dmz")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://packages.debian.org/sid/dmz-cursor-theme/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "style neutral, scalable cursor theme")
    (description "Style neutral, scalable cursor theme.")
    (home-page "https://packages.debian.org/sid/dmz-cursor-theme")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. yaft --- yet another framebuffer terminal
;;; -------------------------------------------------------------------
(define-public yaft
  (package
    (name "yaft")
    (version "0.2.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uobikiemukot/yaft")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yet another framebuffer terminal")
    (description "Yet another framebuffer terminal.")
    (home-page "https://github.com/uobikiemukot/yaft")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. gtk-theme-onestepback --- a Gnome 2 and 3 theme with some colors and embossed widgets inspired by t...
;;; -------------------------------------------------------------------
(define-public gtk-theme-onestepback
  (package
    (name "gtk-theme-onestepback")
    (version "0.991")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.vide.memoire.free.fr/perso/OneStepBack/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Gnome 2 and 3 theme with some colors and embossed widgets inspired by t...")
    (description "A Gnome 2 and 3 theme with some colors and embossed widgets inspired by the good old NextStep look.")
    (home-page "http://www.vide.memoire.free.fr/perso/OneStepBack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23. muscle --- multiple sequence comparison by log-expectation
;;; -------------------------------------------------------------------
(define-public muscle
  (package
    (name "muscle")
    (version "5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rcedgar/muscle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "multiple sequence comparison by log-expectation")
    (description "Multiple sequence comparison by log-expectation.")
    (home-page "https://github.com/rcedgar/muscle")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 24. squirrel --- a light-weight scripting language that fits in the size, memory bandwidth...
;;; -------------------------------------------------------------------
(define-public squirrel
  (package
    (name "squirrel")
    (version "3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.squirrel-lang.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a light-weight scripting language that fits in the size, memory bandwidth...")
    (description "A light-weight scripting language that fits in the size, memory bandwidth, and real-time requirements of applications like video games.")
    (home-page "http://www.squirrel-lang.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. mactelnet --- a linux console tool for connecting to MikroTik RouterOS devices via thei...
;;; -------------------------------------------------------------------
(define-public mactelnet
  (package
    (name "mactelnet")
    (version "0.6.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haakonnessjoen/MAC-Telnet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a linux console tool for connecting to MikroTik RouterOS devices via thei...")
    (description "A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address.")
    (home-page "https://github.com/haakonnessjoen/MAC-Telnet")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 26. wordlists --- download a great set of wordlists. In /usr/share/wordlists
;;; -------------------------------------------------------------------
(define-public wordlists
  (package
    (name "wordlists")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/wordlists")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "download a great set of wordlists. In /usr/share/wordlists")
    (description "Download a great set of wordlists. In /usr/share/wordlists.")
    (home-page "None")
    (license (list license:gpl2 license:expat))))

;;; -------------------------------------------------------------------
;;; 27. otf-sans-forgetica --- a font scientifically designed to help you remember your study notes
;;; -------------------------------------------------------------------
(define-public otf-sans-forgetica
  (package
    (name "otf-sans-forgetica")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://web.archive.org/web/20220601143856/https://sansforgetica.rmit.edu.au//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a font scientifically designed to help you remember your study notes")
    (description "A font scientifically designed to help you remember your study notes.")
    (home-page "https://web.archive.org/web/20220601143856/https://sansforgetica.rmit.edu.au/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 28. netkit-bsd-finger-ipv6 --- bsd-finger ported to Linux, with IPv6 and other Debian patches
;;; -------------------------------------------------------------------
(define-public netkit-bsd-finger-ipv6
  (package
    (name "netkit-bsd-finger-ipv6")
    (version "0.17+deb17")
    (source (origin
              (method url-fetch)
              (uri (string-append "ftp://ftp.linux.org.uk/pub/linux/Networking/netkit//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bsd-finger ported to Linux, with IPv6 and other Debian patches")
    (description "Bsd-finger ported to Linux, with IPv6 and other Debian patches.")
    (home-page "ftp://ftp.linux.org.uk/pub/linux/Networking/netkit/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 29. nginx-libunit --- lightweight, dynamic, open-source server for diverse web applications
;;; -------------------------------------------------------------------
(define-public nginx-libunit
  (package
    (name "nginx-libunit")
    (version "1.31.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unit.nginx.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path ""
      #:tests? #f))
    (synopsis "lightweight, dynamic, open-source server for diverse web applications")
    (description "Lightweight, dynamic, open-source server for diverse web applications.")
    (home-page "https://unit.nginx.org/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 30. lexend-fonts-git --- lexend is a variable typeface designed to improve reading fluency
;;; -------------------------------------------------------------------
(define-public lexend-fonts-git
  (package
    (name "lexend-fonts-git")
    (version "r114.7894f02")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://lexend.com")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lexend is a variable typeface designed to improve reading fluency")
    (description "Lexend is a variable typeface designed to improve reading fluency.")
    (home-page "https://lexend.com")
    (license license:non-copyleft)))
