;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417aj
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (8):
;;;    1. ms-sys (gnu-build-system, v2.8.0, GPL-2.0+)
;;;    2. moodbar (meson-build-system, v1.3.0, GPL-3.0+)
;;;    3. paper-icon-theme (meson-build-system, v1.5.0, CC-BY-SA-4.0)
;;;    4. pavumeter (gnu-build-system, v0.9.3, GPL-2.0+)
;;;    5. gnome-colors-icon-theme (copy-build-system, v0.1.5, GPL-2.0)
;;;    6. perl-term-shellui (perl-build-system, v0.92, Artistic-2.0/GPL-1.0+)
;;;    7. perl-io-stty (perl-build-system, v0.04, Artistic-2.0/GPL-1.0+)
;;;    8. librepfunc (gnu-build-system, v1.11.2, GPL-2.0+)
;;;    9. w-scan-cpp — REMOVED (requires VDR, wirbelscan, satip bundled sources)
;;;       Moved to BLOCKED in blocked-notes.
;;;
;;; ALREADY_IN_GUIX (13):
;;;   11. libpthread-stubs (gnu/packages/xorg.scm v0.5)
;;;   12. tango-icon-theme (gnu/packages/gnome.scm v0.8.90)
;;;   13. esound (gnu/packages/gstreamer.scm v0.2.41)
;;;   14. ntpdate (gnu/packages/ntp.scm — included in ntp v4.2.8p18)
;;;   15. qucs (gnu/packages/electronics.scm — qucs-s v25.2.0)
;;;   16. lightdm-git (gnu/packages/display-managers.scm — lightdm v1.32.0)
;;;   17. fontconfig-ubuntu (gnu/packages/fontutils.scm — fontconfig v2.14.0)
;;;   18. xen (gnu/packages/virtualization.scm v4.19.0)
;;;   19. i3-git (gnu/packages/wm.scm — i3-wm v4.25)
;;;   20. arc-gtk-theme-git (gnu/packages/gnome-xyz.scm — arc-theme v20221218)
;;;   21. xscreensaver-arch-logo (gnu/packages/xdisorg.scm — xscreensaver v6.12)
;;;   22. faba-icon-theme-git (gnu/packages/gnome-xyz.scm — faba-icon-theme v4.3)
;;;   23. moka-icon-theme-git (gnu/packages/gnome-xyz.scm — moka-icon-theme v5.4.0)
;;;
;;; BLOCKED (9):
;;;   24. localepurge (DEBIAN_SPECIFIC)
;;;   25. alsi (ARCH_SPECIFIC)
;;;   26. kalu (ARCH_SPECIFIC)
;;;   27. hal-info (DEAD_PROJECT)
;;;   28. xcursor-human (SOURCE_UNAVAILABLE)
;;;   29. perl-gtk2-ex-simple-list (DEAD_PROJECT)
;;;   30. fontconfig-ubuntu-docs (ALREADY_IN_GUIX variant)
;;;   31. libsvg (BUILD_FAILURE — incompatible with modern libxml2)
;;;   32. w-scan-cpp (BUILD_FAILURE — requires VDR + bundled plugins not in Guix)
;;;
;;; 8 new recipes + 13 ALREADY_IN_GUIX + 9 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417aj)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:export (
            ms-sys
            moodbar
            paper-icon-theme
            pavumeter
            gnome-colors-icon-theme
            perl-term-shellui
            perl-io-stty
            librepfunc
            ))

;;; ===================================================================
;;; 1. ms-sys — write Microsoft-compatible boot records
;;; ===================================================================
(define-public ms-sys
  (package
    (name "ms-sys")
    (version "2.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/ms-sys/files/"
                    "ms-sys%20stable/" version
                    "/ms-sys-" version ".tar.gz/download"))
              (file-name (string-append "ms-sys-" version ".tar.gz"))
              (sha256
               (base32
                "0mzihgkxfcxg11z6s1gmfb2acdc3ij5amqvps2707dqcplzfw0m9"))))
    (build-system gnu-build-system)
    (native-inputs (list gettext-minimal))
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "Write Microsoft-compatible boot records to drives")
    (description "ms-sys writes Microsoft-compatible Master Boot Records
(MBR) and Partition Boot Records (PBR) to hard drives and removable media.
It supports boot records from Windows 95 through Windows 10, and can create
both standard and NTFS boot records.")
    (home-page "https://ms-sys.sourceforge.net/")
    (license license:gpl2+)))

;;; ===================================================================
;;; 2. moodbar — audio mood visualization tool
;;; ===================================================================
(define-public moodbar
  (package
    (name "moodbar")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/exaile/moodbar/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append "moodbar-" version ".tar.gz"))
              (sha256
               (base32
                "18b0ksn9yacdzgaj81ydkkwcvmly296bc02khpacip3wvq1m442k"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gstreamer
                  gst-plugins-base
                  fftw
                  glib))
    (arguments
     (list #:tests? #f))
    (synopsis "Audio mood visualization generator for music players")
    (description "Moodbar generates colorful visual representations of audio
files based on spectral analysis.  Each position in the moodbar corresponds
to a time offset in the audio file, with colors indicating the mood
characteristics of the sound at that point.  Used by music players like
Exaile and Amarok.")
    (home-page "https://github.com/exaile/moodbar")
    (license license:gpl3+)))

;;; ===================================================================
;;; 3. libsvg — REMOVED (incompatible with modern libxml2)
;;; Moved to BLOCKED in blocked-notes.
;;; ===================================================================

;;; ===================================================================
;;; 4. paper-icon-theme — modern flat icon theme
;;; ===================================================================
(define-public paper-icon-theme
  (package
    (name "paper-icon-theme")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/snwh/paper-icon-theme"
                    "/archive/refs/tags/v." version ".tar.gz"))
              (sha256
               (base32
                "1klf545hk6g7dx9g0bkblrzd46kz6hr0yj1mqvjq3r7cjpz1vwk2"))))
    (build-system meson-build-system)
    (native-inputs (list (list gtk+ "bin")))
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'disable-post-install
                 (lambda _
                   ;; gtk-update-icon-cache is handled by Guix profile hooks
                   (substitute* "meson.build"
                     (("meson.add_install_script.*") "")))))))
    (synopsis "modern flat icon theme for GTK desktops")
    (description "Paper is a free, modern icon theme designed for use on
GTK-based desktop environments.  It provides a consistent flat visual style
with soft colors and rounded shapes, suitable for GNOME, Xfce, Budgie,
and other desktops.  Includes Paper and Paper-Mono-Dark variants.")
    (home-page "https://snwh.org/paper")
    (license license:cc-by-sa4.0)))

;;; ===================================================================
;;; 5. pavumeter — PulseAudio volume meter
;;; ===================================================================
(define-public pavumeter
  (package
    (name "pavumeter")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://0pointer.de/lennart/projects/pavumeter/"
                    "pavumeter-" version ".tar.gz"))
              (sha256
               (base32
                "0yq67w8j8l1xsv8pp37bylax22npd6msbavr6pb25yvyq825i3gx"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtkmm-2 pulseaudio))
    (arguments
     (list #:configure-flags
           #~(list "--disable-lynx")))
    (synopsis "Simple volume meter for PulseAudio")
    (description "PaVuMeter is a simple GTK volume meter for the PulseAudio
sound server.  It provides a graphical VU-style meter that shows input and
output audio levels in real time, useful for monitoring microphone levels
and playback volume.")
    (home-page "https://0pointer.de/lennart/projects/pavumeter/")
    (license license:gpl2+)))

;;; ===================================================================
;;; 6. gnome-colors-icon-theme — GNOME-Colors icon theme revival
;;; ===================================================================
(define-public gnome-colors-icon-theme
  (package
    (name "gnome-colors-icon-theme")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/somasis/gnome-colors-revival"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (file-name (string-append "gnome-colors-icon-theme-" version ".tar.gz"))
              (sha256
               (base32
                "0hvgkp7fc5yidpnk8lzfqmh154diaacjrkcn4zn7r0g0yr8m667d"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gnome-brave" "share/icons/gnome-brave")
               ("gnome-carbonite" "share/icons/gnome-carbonite")
               ("gnome-colors-common" "share/icons/gnome-colors-common")
               ("gnome-dust" "share/icons/gnome-dust")
               ("gnome-human" "share/icons/gnome-human")
               ("gnome-illustrious" "share/icons/gnome-illustrious")
               ("gnome-noble" "share/icons/gnome-noble")
               ("gnome-tribute" "share/icons/gnome-tribute")
               ("gnome-wine" "share/icons/gnome-wine")
               ("gnome-wise" "share/icons/gnome-wise"))))
    (synopsis "GNOME-Colors icon theme suite for GTK desktops")
    (description "GNOME-Colors is a set of GNOME icon themes with several
color variants: Brave (blue), Carbonite, Dust (brown), Human (orange),
Illustrious, Noble (purple), Tribute, Wine (red), and Wise (green).  This is the community
revival of the original GNOME-Colors project.")
    (home-page "https://github.com/somasis/gnome-colors-revival")
    (license license:gpl2)))

;;; ===================================================================
;;; 7. perl-term-shellui — interactive shell UI for Perl
;;; ===================================================================
(define-public perl-term-shellui
  (package
    (name "perl-term-shellui")
    (version "0.92")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/B/BR/BRONSON/"
                    "Term-ShellUI-" version ".tar.gz"))
              (sha256
               (base32
                "1nrbjh2vw5fdr826qmxka58jhaxhyi02l0q9zzp3awr2fqfc0y9j"))))
    (build-system perl-build-system)
    (synopsis "Fully-featured shell-like command line environment for Perl")
    (description "Term::ShellUI provides a comprehensive shell-like command
line interface for Perl programs.  It supports command completion, history,
help text, subcommands, command aliases, and pipelining with a simple
declarative API for defining commands.")
    (home-page "https://metacpan.org/pod/Term::ShellUI")
    (license (list license:artistic2.0 license:gpl1+))))

;;; ===================================================================
;;; 8. perl-io-stty — change and print terminal line settings
;;; ===================================================================
(define-public perl-io-stty
  (package
    (name "perl-io-stty")
    (version "0.04")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/T/TO/TODDR/"
                    "IO-Stty-" version ".tar.gz"))
              (sha256
               (base32
                "1hjicqy50mgbippn310k4zclr9ksz05yyg81za3q4gb9m3qhk5aw"))))
    (build-system perl-build-system)
    (synopsis "Change and print terminal line settings from Perl")
    (description "IO::Stty provides a Perl interface for manipulating
terminal line settings.  It allows programs to query and modify terminal
attributes such as baud rate, character size, parity, and control
characters, similar to the stty command.")
    (home-page "https://metacpan.org/pod/IO::Stty")
    (license (list license:artistic2.0 license:gpl1+))))

;;; ===================================================================
;;; 9. librepfunc — common C++ functions library for VDR tools
;;; ===================================================================
(define-public librepfunc
  (package
    (name "librepfunc")
    (version "1.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wirbel-at-vdr-portal/librepfunc"
                    "/archive/refs/tags/" version ".tar.gz"))
              (file-name (string-append "librepfunc-" version ".tar.gz"))
              (sha256
               (base32
                "0wi9g9f42mk1c86g29px7qljn83xl6hcdwcd9r6v92yxinylk0zg"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CXX=" #$(cxx-for-target))
                   (string-append "DESTDIR=" #$output)
                   "prefix=/"
                   (string-append "pkgconfigdir=/lib/pkgconfig"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "Common C++ functions library for VDR-related tools")
    (description "Librepfunc is a collection of common C++ functions, classes,
and utilities used by VDR (Video Disk Recorder) ecosystem tools such as
w_scan_cpp.  It provides string manipulation, file handling, and other
general-purpose routines.")
    (home-page "https://github.com/wirbel-at-vdr-portal/librepfunc")
    (license license:gpl2+)))

;;; ===================================================================
;;; 10. w-scan-cpp — REMOVED (requires VDR + bundled plugins not in Guix)
;;; Moved to BLOCKED in blocked-notes.
;;; ===================================================================
