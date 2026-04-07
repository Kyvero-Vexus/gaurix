;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; NEEDS_RECIPE_DESIGN resolution — recipe-resolver pass 2026-04-06
;;; Resolves 30 packages from the NEEDS_RECIPE_DESIGN backlog.

(define-module (gaurix packages recipe-resolver-260406)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system font)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (protonhax
            overdue
            git-recursive
            helixbinhx
            freeze-bin
            amdfand-bin
            noto-fonts-emoji-blob
            clash-geoip
            togo-bin
            jsongrep-bin
            dosh
            python-markovify
            sqlite-utils
            nsz
            ddccontrol-db
            ezstream
            xdg-su
            genders
            libva-vdpau-driver
            adwaita-qt5
            adwaita-qt6
            gslapper
            opentyrian2000
            opentyrian2000-data
            chiaki
            rapidraw-bin
            gitarbor-bin
            restman-bin
            lianwall-bin
            iventoy-bin
            vr-lighthouse-bin
            ferrishot-bin
            blogr-bin
            boscaceoil-blue-bin
            triangle-bin))

;;;
;;; 1. protonhax — Bash script helper for Proton gaming
;;;    Simple script install, no build step.
;;;
(define-public protonhax
  (package
    (name "protonhax")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jcnils/protonhax/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "193b9446bjwnz8gmh77v8jp7fd1c4fwiqg31gfz377rh8z4p59rx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("protonhax" "bin/protonhax"))))
    (inputs (list bash))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jcnils/protonhax")
    (synopsis "helper for running programs inside Proton's Wine prefix")
    (description
     "Protonhax is a bash script that assists in executing external programs
within a Proton Wine prefix.  It enables launching tools alongside
Steam games running under Proton without manual prefix management.")
    (license license:bsd-3)))

;;;
;;; 2. overdue — Notify about daemons referencing outdated shared libraries
;;;    Script-based tool installed via Makefile.
;;;
(define-public overdue
  (package
    (name "overdue")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tylerjl/overdue/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "17wv5pz2d8i7cq1h0n4rl6yw73p1dsxrn14dvjjnj8zhfmi3b0y7"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list lsof))
    (home-page "https://github.com/tylerjl/overdue")
    (synopsis "notification tool for daemons using outdated shared libraries")
    (description
     "Overdue detects running daemons that reference outdated shared
libraries and notifies the administrator.  It uses @command{lsof} to
check for processes with deleted library references, helping identify
services that need restarting after system updates.")
    (license license:expat)))

;;;
;;; 3. git-recursive — Execute git operations across multiple repositories
;;;    Single script install.
;;;
(define-public git-recursive
  (package
    (name "git-recursive")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aelesbao/git-recursive/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0c4fv9jh700cslsmapq65snafpgk2691lamxbzbgc7hwz08blg1l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-recursive" "bin/git-recursive"))))
    (inputs (list git))
    (home-page "https://github.com/aelesbao/git-recursive")
    (synopsis "execute git operations in multiple repositories")
    (description
     "git-recursive is a command-line tool that allows executing git
operations across multiple repositories simultaneously.  It
recursively discovers git repositories in a directory tree and runs
the specified git command in each one.")
    (license license:expat)))

;;;
;;; 4. helixbinhx — Provide /bin/hx symlink for Helix editor
;;;    Pure symlink/wrapper package.
;;;
(define-public helixbinhx
  (package
    (name "helixbinhx")
    (version "2")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (helix-bin (search-input-file %build-inputs "/bin/helix")))
            (mkdir-p bin)
            (symlink helix-bin (string-append bin "/hx"))))))
    (inputs (list helix))
    (home-page "https://helix-editor.com")
    (synopsis "symlink providing @command{hx} for the Helix editor")
    (description
     "This package creates a @command{hx} symlink pointing to the Helix
text editor binary.  Some users and scripts expect the editor to be
available as @command{hx} rather than @command{helix}.")
    (license license:mpl2.0)))

;;;
;;; 5. freeze-bin — Generate images of code and terminal output
;;;    Pre-built Go binary from Charm.sh.
;;;
(define-public freeze-bin
  (package
    (name "freeze-bin")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/charmbracelet/freeze/releases/download/v"
             version "/freeze_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "16skacpljnfcfi9v0rdmsg8dg4vds4saqah5z5q9bhf02vfxnbq1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("freeze" "bin/freeze"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/charmbracelet/freeze")
    (synopsis "generate images of code and terminal output")
    (description
     "Freeze is a tool for generating PNG, SVG, and WebP images of code
and terminal output.  It supports syntax highlighting, custom themes,
and various output formats for sharing code snippets as images.")
    (license license:expat)))

;;;
;;; 6. amdfand-bin — AMD GPU fan speed management tool (pre-built)
;;;
(define-public amdfand-bin
  (package
    (name "amdfand-bin")
    (version "1.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Eraden/amdgpud/releases/download/v1.0.12/"
             "amdfand-archlinux-latest-" version ".zip"))
       (sha256
        (base32 "0f71yp4kpbx5i6pqm99jgbkm4g34kl3zdi5qc3s3m1j7knk6x9g3"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (invoke unzip (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "amdfand" (string-append bin "/amdfand"))
            (chmod (string-append bin "/amdfand") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/amdfand"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/amdfand"))))))
    (native-inputs (list unzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Eraden/amdgpud")
    (synopsis "AMD GPU fan speed management daemon")
    (description
     "amdfand is a daemon that manages AMD GPU fan speeds based on
configurable temperature curves.  It monitors GPU temperature and
adjusts fan speed accordingly, providing automatic thermal management
for AMD graphics cards.")
    (license (list license:expat license:asl2.0))))

;;;
;;; 7. noto-fonts-emoji-blob — Blobmoji emoji font (blob-style Noto Emoji)
;;;
(define-public noto-fonts-emoji-blob
  (package
    (name "noto-fonts-emoji-blob")
    (version "15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/C1710/blobmoji/releases/download/v"
             version "/Blobmoji.ttf"))
       (sha256
        (base32 "1ybqxd3nkx2ychya5jw6k2yvaw17achj4kapxwsrpfina1kxdhyw"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append
                                    (assoc-ref outputs "out")
                                    "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (copy-file (assoc-ref %build-inputs "source")
                                (string-append font-dir "/Blobmoji.ttf"))))))))
    (home-page "https://github.com/C1710/blobmoji")
    (synopsis "blob-style emoji font based on Noto Emoji")
    (description
     "Blobmoji is a fork of Google's Noto Emoji font that preserves the
original blob-style emoji designs from Android.  It provides a full
set of Unicode emoji in the classic rounded blob style that many users
prefer over the newer flat designs.")
    (license license:asl2.0)))

;;;
;;; 8. clash-geoip — GeoIP database for Clash proxy tools
;;;
(define-public clash-geoip
  (package
    (name "clash-geoip")
    (version "202604020031")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Loyalsoldier/geoip/releases/download/"
             version "/Country.mmdb"))
       (sha256
        (base32 "1sn8iv680n8vjkmjnn3v3zc135v8y4n4pfxzvb2px1l91dvxqs5k"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (share (string-append out "/share/clash")))
            (mkdir-p share)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append share "/Country.mmdb"))))))
    (home-page "https://github.com/Loyalsoldier/geoip")
    (synopsis "GeoIP database for Clash and compatible proxy tools")
    (description
     "This package provides a MaxMind-format GeoIP database
(@file{Country.mmdb}) for use with Clash and other compatible proxy
tools.  The database enables geographic IP-based routing rules.")
    (license (list license:cc-by-sa4.0 license:gpl3+))))

;;;
;;; 9. togo-bin — CLI task/todo manager (pre-built Go binary)
;;;
(define-public togo-bin
  (package
    (name "togo-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/prime-run/togo/releases/download/v"
             version "/togo_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0y8fsd8f63d41dw4yplzwslh499j1addaqx70j805lfx811y21wf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("togo" "bin/togo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/prime-run/togo")
    (synopsis "command-line task and todo management utility")
    (description
     "togo is a fast, simple command-line task management utility.  It
provides an intuitive interface for creating, listing, completing, and
organizing todo items directly from the terminal.")
    (license license:expat)))

;;;
;;; 10. jsongrep-bin — JSONPath-inspired query tool (pre-built Rust binary)
;;;
(define-public jsongrep-bin
  (package
    (name "jsongrep-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/micahkepe/jsongrep/releases/download/v"
             version "/jsongrep-" version
             "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "1a5wid98nphdqx7f5mh002vakgsmd02kxxjj6a41sx8z1fvj8n1q"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jg" "bin/jg"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/micahkepe/jsongrep")
    (synopsis "JSONPath-inspired query language for JSON documents")
    (description
     "jsongrep (jg) is a command-line tool for querying JSON documents
using a JSONPath-inspired syntax.  It provides fast filtering and
extraction of data from JSON files and streams.")
    (license license:expat)))

;;;
;;; 11. dosh — Docker shell wrapper
;;;    Shell scripts installed via Makefile.
;;;
(define-public dosh
  (package
    (name "dosh")
    (version "8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gportay/dosh/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "05ji7lpjxjcx12cr2n8mrcw7rb7sv2n9n356k44arj8drmsiw3gv"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash))
    (home-page "https://github.com/gportay/dosh")
    (synopsis "run shell commands in a Docker container")
    (description
     "dosh (Docker shell) is a wrapper that transparently executes shell
commands inside a Docker container.  It reads a @file{Doshfile} to
determine the container image and mounts, providing a consistent
development environment without manual Docker commands.")
    (license license:lgpl2.1+)))

;;;
;;; 12. python-markovify — Markov chain text generator
;;;
(define-public python-markovify
  (package
    (name "python-markovify")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "markovify" version))
       (sha256
        (base32 "0fgydnhqg22dggayl5dmf3dwkgizh4qh3wifwgnnpfslxmba3h7a"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; test suite uses nosetests
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-unidecode))
    (home-page "https://github.com/jsvine/markovify")
    (synopsis "simple, extensible Markov chain text generator")
    (description
     "Markovify is a Python library for building Markov chain models from
text and generating random sentences.  It provides a simple API for
training models on text corpora and producing new text that mimics the
statistical patterns of the original.")
    (license license:expat)))

;;;
;;; 13. sqlite-utils — CLI and Python library for SQLite manipulation
;;;
(define-public sqlite-utils
  (package
    (name "sqlite-utils")
    (version "3.39")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sqlite_utils" version))
       (sha256
        (base32 "1kfvz4ga254sjwfv7fx9skpz9g7y4xspk0vjck4vagiykg1fm8mz"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; needs python-hypothesis and fixtures
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-click
           python-click-default-group
           python-dateutil
           python-pluggy
           python-sqlite-fts4
           python-tabulate
           sqlite))
    (home-page "https://sqlite-utils.datasette.io/")
    (synopsis "CLI tool and Python library for manipulating SQLite databases")
    (description
     "sqlite-utils provides both a command-line interface and a Python
library for creating, querying, and transforming SQLite databases.  It
supports bulk inserts, full-text search, schema transformations, and
export to various formats.")
    (license license:asl2.0)))

;;;
;;; 14. nsz — Nintendo Switch NSP/XCI compressor
;;;
(define-public nsz
  (package
    (name "nsz")
    (version "4.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "nsz" version))
       (sha256
        (base32 "0gxswqhp5fp60xk431qwih657926h1cav3bnfr9lba8zzwrknvj5"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-pycryptodome
           python-zstandard))
    (home-page "https://github.com/nicoboss/nsz")
    (synopsis "Nintendo Switch NSP/XCI compressor and decompressor")
    (description
     "nsz is a tool for compressing and decompressing Nintendo Switch game
files in NSP and XCI formats.  It uses solid compression with Zstandard
to significantly reduce file sizes while remaining compatible with
Switch homebrew tools.")
    (license license:expat)))

;;;
;;; 15. ddccontrol-db — Monitor database for DDCControl
;;;
(define-public ddccontrol-db
  (package
    (name "ddccontrol-db")
    (version "20260120")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ddccontrol/ddccontrol-db/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "07jqg00l7kihd3hf2wppj8c9qfi1zixgsbwpw9qmhi4dxi3mxyqi"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   ;; The autogen.sh script calls gettextize interactively.
                   ;; Run autotools directly instead.
                   (invoke "autoreconf" "-vfi"))))))
    (native-inputs
     (list autoconf automake intltool gettext-minimal))
    (home-page "https://github.com/ddccontrol/ddccontrol-db")
    (synopsis "monitor database for DDCControl")
    (description
     "ddccontrol-db provides a database of monitor definitions for use with
DDCControl.  It contains XML descriptions of monitor capabilities
accessible via the DDC/CI protocol, enabling software control of
monitor settings such as brightness, contrast, and input selection.")
    (license license:gpl2+)))

;;;
;;; 16. ezstream — Command-line source client for Icecast
;;;
(define-public ezstream
  (package
    (name "ezstream")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://downloads.xiph.org/releases/ezstream/ezstream-"
             version ".tar.gz"))
       (sha256
        (base32 "0ajcqlk420ivm1wphpzccscadgfkjl5d9p3baicbm5as8mzqkphi"))))
    (build-system gnu-build-system)
    (inputs
     (list libogg libvorbis libxml2 libshout taglib))
    (native-inputs
     (list pkg-config check))
    (home-page "https://www.icecast.org/ezstream/")
    (synopsis "command-line source client for Icecast media streaming")
    (description
     "Ezstream is a command-line source client for the Icecast media
streaming server.  It can stream audio files, re-encode on the fly,
and handle playlists.  It supports Ogg Vorbis, MP3, Theora, and other
formats through external re-encoding programs.")
    (license license:gpl2+)))

;;;
;;; 17. xdg-su — Run programs as root using desktop-appropriate mechanism
;;;
(define-public xdg-su
  (package
    (name "xdg-su")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tarakbumba/xdg-su/archive/xdg-su-"
             version ".tar.gz"))
       (sha256
        (base32 "0mmdc0h06xqiyjrm1iyfip96fzk32dzfcmf70172c0c7i6bayzjj"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-vfi"))))))
    (native-inputs
     (list autoconf automake xmlto
           docbook-xsl docbook-xml-4.1.2))
    (home-page "https://github.com/tarakbumba/xdg-su")
    (synopsis "run a program as root using desktop-appropriate mechanism")
    (description
     "xdg-su detects the current desktop environment and uses the
appropriate graphical privilege escalation tool (such as kdesu, gksu,
or pkexec) to run a program as root.  It provides a unified interface
across different desktop environments.")
    (license license:expat)))

;;;
;;; 18. genders — Static cluster configuration database
;;;
(define-public genders
  (package
    (name "genders")
    (version "1.32.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chaos/genders/archive/genders-1-32-1.tar.gz"))
       (sha256
        (base32 "0kfnv7zw18y0f0jyxfimq4bnv99jys78n78pbq5w27nhizn8dh8d"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:parallel-build? #f  ;; upstream known to break with parallel make
           #:configure-flags
           #~(list "--without-java-extensions"
                   "--without-python-extensions"
                   "--with-cplusplus-extensions"
                   "--with-non-shortened-hostnames")
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-vfi")))
               (add-after 'unpack 'fix-test-flags
                 (lambda _
                   ;; Replace non-standard 'test -a' with 'test -e'
                   ;; in Makefiles for POSIX compliance.
                   (substitute* (find-files "." "Makefile\\.am$")
                     (("test -a") "test -e")))))))
    (native-inputs
     (list autoconf automake libtool))
    (inputs (list perl))
    (home-page "https://github.com/chaos/genders")
    (synopsis "static cluster configuration database for HPC environments")
    (description
     "Genders is a static cluster configuration database used for cluster
configuration management in high-performance computing environments.
It provides a simple flat-file database mapping hostnames to attributes,
with C, C++, and Perl interfaces for querying the database.")
    (license license:gpl2+)))

;;;
;;; 19. libva-vdpau-driver — VDPAU backend for VA-API
;;;
(define-public libva-vdpau-driver
  (package
    (name "libva-vdpau-driver")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://freedesktop.org/software/vaapi/releases/"
             "libva-vdpau-driver/libva-vdpau-driver-"
             version ".tar.bz2"))
       (sha256
        (base32 "1fcvgshzyc50yb8qqm6v6wn23ghimay23ci0p8sm8gxcy211jp0m"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list mesa libva libvdpau libx11))
    (home-page "https://freedesktop.org/wiki/Software/vaapi")
    (synopsis "VDPAU backend for the VA-API video acceleration framework")
    (description
     "This package provides a VDPAU-based backend for the Video
Acceleration API (VA-API).  It allows applications using VA-API to
utilize NVIDIA's VDPAU hardware video decoding capabilities,
bridging the two video acceleration frameworks.")
    (license license:gpl2+)))

;;;
;;; 20. adwaita-qt5 — Adwaita theme for Qt5 applications
;;;
(define-public adwaita-qt5
  (package
    (name "adwaita-qt5")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FedoraQt/adwaita-qt/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1a2v6fd9j42r27dp2035m3b8grrlgkjn4iflib0707978qfdfpyd"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DUSE_QT6=OFF")))
    (inputs (list qtbase-5))
    (home-page "https://github.com/FedoraQt/adwaita-qt")
    (synopsis "Adwaita theme for Qt5 applications")
    (description
     "Adwaita-Qt is a style plugin that makes Qt5 applications look like
they belong in a GNOME desktop environment.  It implements the Adwaita
theme natively in Qt, providing visual consistency between GTK and Qt
applications.")
    (license license:gpl2+)))

;;;
;;; 21. adwaita-qt6 — Adwaita theme for Qt6 applications
;;;
(define-public adwaita-qt6
  (package
    (inherit adwaita-qt5)
    (name "adwaita-qt6")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DUSE_QT6=ON")))
    (inputs (list qtbase))
    (synopsis "Adwaita theme for Qt6 applications")
    (description
     "Adwaita-Qt is a style plugin that makes Qt6 applications look like
they belong in a GNOME desktop environment.  It implements the Adwaita
theme natively in Qt, providing visual consistency between GTK and Qt
applications.")))

;;;
;;; 22. gslapper — Wayland wallpaper utility with video support
;;;
(define-public gslapper
  (package
    (name "gslapper")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Nomadcxx/gSlapper/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "09dand4z4p9wb10yzjz2k2lq7zrlvxkz7kjr0s8fy4ixp35kk03v"))))
    (build-system meson-build-system)
    (native-inputs
     (list pkg-config wayland-protocols))
    (inputs
     (list gstreamer
           gst-plugins-base
           gst-plugins-good
           gst-plugins-bad
           wayland))
    (home-page "https://github.com/Nomadcxx/gSlapper")
    (synopsis "wayland wallpaper utility with video and image support")
    (description
     "gSlapper is a Wayland-native wallpaper utility that supports both
static images and video wallpapers.  It uses GStreamer for media
playback and supports per-monitor wallpaper configuration with smooth
transitions.")
    (license license:expat)))

;;;
;;; 23. opentyrian2000-data — Game data for OpenTyrian2000
;;;
(define-public opentyrian2000-data
  (package
    (name "opentyrian2000-data")
    (version "2000")
    (source
     (origin
       (method url-fetch)
       (uri "https://camanis.net/tyrian/tyrian2000.zip")
       (sha256
        (base32 "0rqnj9zdhlzn9awvc1rg505ggw6s2zr0qwxqg4i4akjifdpcg2rl"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (share (string-append out "/share/opentyrian2000"))
                 (unzip (search-input-file %build-inputs "/bin/unzip")))
            (invoke unzip "-o" (assoc-ref %build-inputs "source")
                    "-d" share)))))
    (native-inputs (list unzip))
    (home-page "https://github.com/KScl/opentyrian2000")
    (synopsis "game data files for OpenTyrian2000")
    (description
     "This package provides the freeware game data files required by
OpenTyrian2000, the open source port of the classic DOS shoot-em-up
Tyrian 2000.  The data includes levels, graphics, sound effects, and
music from the original game.")
    (license (license:non-copyleft
              "https://camanis.net/tyrian/"
              "Freeware game data"))))

;;;
;;; 24. opentyrian2000 — Open source port of Tyrian 2000
;;;
(define-public opentyrian2000
  (package
    (name "opentyrian2000")
    (version "2000.20250408")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/KScl/opentyrian2000/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0vjxsbqv2aw341byn5h4yhxqhzhi7q5wxs9hgfy90nzi6412x6y3"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output)
                   (string-append "gamesdir=" #$output
                                  "/share/opentyrian2000"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-after 'install 'install-data
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((data-dir (string-append #$output
                                                  "/share/opentyrian2000")))
                     ;; Data is provided by the opentyrian2000-data package
                     ;; or can be installed separately.
                     #t))))))
    (inputs (list sdl2 sdl2-net))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/KScl/opentyrian2000")
    (synopsis "open source port of the classic DOS shoot-em-up Tyrian 2000")
    (description
     "OpenTyrian2000 is an open source port of the classic DOS vertical
scrolling shoot-em-up Tyrian 2000.  It faithfully recreates the original
gameplay with modern platform support, using SDL2 for graphics, audio,
and input.  Game data files are required and available separately.")
    (license license:gpl2)))

;;;
;;; 25. chiaki — Free and open source PS4/PS5 Remote Play client
;;;
(define-public chiaki
  (package
    (name "chiaki")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://git.sr.ht/~thestr4ng3r/chiaki/refs/download/v"
             version "/chiaki-v" version "-src.tar.gz"))
       (sha256
        (base32 "1kyrflhmbgs4nnz0jnivkd3fg62l1ci87mziiwh3xhi4r2zg1h18"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"))))
    (native-inputs
     (list pkg-config protobuf python python-protobuf))
    (inputs
     (list ffmpeg opus openssl qtbase-5 qtmultimedia-5 qtsvg-5 sdl2))
    (home-page "https://git.sr.ht/~thestr4ng3r/chiaki")
    (synopsis "free and open source PlayStation Remote Play client")
    (description
     "Chiaki is a free and open source client for PlayStation 4 and
PlayStation 5 Remote Play.  It allows streaming PS4/PS5 gameplay to a
PC over a local network, supporting low-latency video and audio with
controller input forwarding.")
    (license license:agpl3+)))

;;;
;;; 26. rapidraw-bin — GPU-accelerated RAW image editor (pre-built)
;;;
(define-public rapidraw-bin
  (package
    (name "rapidraw-bin")
    (version "1.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CyberTimon/RapidRAW/releases/download/v"
             version "/03_RapidRAW_v" version
             "_ubuntu-24.04_amd64.deb"))
       (sha256
        (base32 "0sriywhcji2kmm0idn2i19mdffg1b2amsay44y3v5ccgzbg0zqi9"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib/rapidraw"))
                 (ar  (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname ar) ":"
                            (dirname tar) ":"
                            (dirname xz)))
            ;; Extract the .deb archive
            (invoke ar "x" (assoc-ref %build-inputs "source"))
            (invoke tar "xf" "data.tar.xz")
            (mkdir-p bin)
            (mkdir-p lib)
            ;; Copy the binary
            (let ((rapid-bin (string-append "usr/bin/rapid-raw")))
              (when (file-exists? rapid-bin)
                (copy-file rapid-bin (string-append bin "/rapid-raw"))
                (chmod (string-append bin "/rapid-raw") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/rapid-raw"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/rapid-raw"))))))))
    (native-inputs (list binutils patchelf tar xz))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/CyberTimon/RapidRAW")
    (synopsis "GPU-accelerated RAW image editor")
    (description
     "RapidRAW is a fast, GPU-accelerated RAW image editor built with
Tauri.  It provides a graphical interface for editing RAW photograph
files with real-time preview and GPU-powered processing.")
    (license license:agpl3)))

;;;
;;; 27. gitarbor-bin — Terminal-based Git client (pre-built)
;;;
(define-public gitarbor-bin
  (package
    (name "gitarbor-bin")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cadamsdev/gitarbor-tui/releases/download/v"
             version "/gitarbor-linux-x64.tar.gz"))
       (sha256
        (base32 "1alb4fg7y7v8ldiv57w6y9mgqv3si2fvd3b5ffihpmmb3vg4mbid"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname gzip)))
            (invoke tar "xzf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "gitarbor" (string-append bin "/gitarbor"))
            (chmod (string-append bin "/gitarbor") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/gitarbor"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/gitarbor"))))))
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cadamsdev/gitarbor-tui")
    (synopsis "terminal-based Git client with TUI interface")
    (description
     "GitArbor is a next-generation Git client that runs in the terminal.
Built with Bun, OpenTUI, and React, it provides an interactive
terminal user interface for common Git operations.")
    (license license:expat)))

;;;
;;; 28. restman-bin — Terminal REST API client (pre-built)
;;;
(define-public restman-bin
  (package
    (name "restman-bin")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cadamsdev/restman/releases/download/v"
             version "/restman-linux-x64.tar.gz"))
       (sha256
        (base32 "16wp8xqssh9348f58vwdgc34dwi2jkv8rcsrcgmn6ar4jy3vq0dv"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname gzip)))
            (invoke tar "xzf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "restman" (string-append bin "/restman"))
            (chmod (string-append bin "/restman") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/restman"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/restman"))))))
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cadamsdev/restman")
    (synopsis "terminal REST API client with TUI interface")
    (description
     "Restman is a simple and easy-to-use REST API client that runs in the
terminal.  It provides an interactive TUI for sending HTTP requests
and inspecting responses, serving as an open-source alternative to
Postman for terminal-based workflows.")
    (license license:expat)))

;;;
;;; 29. lianwall-bin — CLI wallpaper engine for Wayland (pre-built)
;;;
(define-public lianwall-bin
  (package
    (name "lianwall-bin")
    (version "5.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yueosa/lianwall/releases/download/v"
             version "/lianwall_" version "_linux_x86_64"))
       (sha256
        (base32 "068hv339bd3fsx4zc4ckj5fvpm8cwnklbqplcj2h62sphv5d4842"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/lianwall"))
            (chmod (string-append bin "/lianwall") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Yueosa/lianwall")
    (synopsis "CLI wallpaper engine for Wayland based on swww and mpvpaper")
    (description
     "LianWall is a command-line wallpaper engine for Wayland compositors.
Built on top of swww and mpvpaper, it supports both static image and
video wallpapers with smooth transitions and per-monitor configuration.")
    (license license:expat)))

;;;
;;; 30. iventoy-bin — Enhanced PXE boot server (pre-built)
;;;
(define-public iventoy-bin
  (package
    (name "iventoy-bin")
    (version "1.0.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ventoy/PXE/releases/download/v"
             version "/iventoy-" version "-linux-free.tar.gz"))
       (sha256
        (base32 "1ylfhinlckcg3jl3n4j92j4d3w3917pnhksbqdjmfqib1xc2czax"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iventoy.sh" "bin/iventoy")
               ("lib/" "lib/iventoy/lib/")
               ("data/" "lib/iventoy/data/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.iventoy.com")
    (synopsis "enhanced PXE boot server for network-based OS installation")
    (description
     "iVentoy is an enhanced PXE server that allows network booting of ISO
files directly without extracting them.  It supports booting multiple
operating systems over the network, with a web-based management
interface for configuration.")
    (license (license:non-copyleft
              "https://www.iventoy.com/en/license.html"
              "iVentoy custom license"))))

;;;
;;; 31. vr-lighthouse-bin — VR Lighthouse power state management (pre-built)
;;;
(define-public vr-lighthouse-bin
  (package
    (name "vr-lighthouse-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ShayBox/lighthouse/releases/download/"
             version "/Linux-x86_64.zip"))
       (sha256
        (base32 "1wk9v7j2ac0s0s2f4v5c2rjr62hxc3m23s34l6f9zlzy65mb3n6f"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (invoke unzip (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "lighthouse" (string-append bin "/lighthouse"))
            (chmod (string-append bin "/lighthouse") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/lighthouse"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/lighthouse"))))))
    (native-inputs (list unzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ShayBox/lighthouse")
    (synopsis "VR Lighthouse base station power management tool")
    (description
     "Lighthouse is a command-line tool for managing the power state of
SteamVR Lighthouse (base station) devices via Bluetooth.  It can turn
base stations on and off, reducing power consumption when VR is not
in use.")
    (license license:expat)))

;;;
;;; 32. ferrishot-bin — Screenshot tool written in Rust (pre-built)
;;;
(define-public ferrishot-bin
  (package
    (name "ferrishot-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nik-rev/ferrishot/releases/download/v"
             version "/ferrishot-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "06r4glglzilbvrwgf5xw2r12l7v32zvni5avk20phgm0xkdgpgml"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname xz)))
            (invoke tar "xf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "ferrishot-x86_64-unknown-linux-gnu/ferrishot"
                       (string-append bin "/ferrishot"))
            (chmod (string-append bin "/ferrishot") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/ferrishot"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/ferrishot"))))))
    (native-inputs (list tar xz patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nik-rev/ferrishot")
    (synopsis "screenshot tool written in Rust")
    (description
     "Ferrishot is a fast, lightweight screenshot tool written in Rust.
It provides screen capture functionality with an interactive selection
interface for capturing specific regions of the screen.")
    (license (list license:expat license:asl2.0))))

;;;
;;; 33. blogr-bin — Terminal blog publishing tool (pre-built)
;;;
(define-public blogr-bin
  (package
    (name "blogr-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bahdotsh/blogr/releases/download/v"
             version "/blogr-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0hmp0s8mjikxb1jz715y5c0lnh4mqxn1nzav9mrm2zgy0fz1wfhn"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname gzip)))
            (invoke tar "xzf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "blogr" (string-append bin "/blogr"))
            (chmod (string-append bin "/blogr") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/blogr"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/blogr"))))))
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/blogr")
    (synopsis "terminal-based blog writing and publishing tool")
    (description
     "blogr is a command-line tool for writing, editing, and publishing
blog posts without leaving the terminal.  It provides a streamlined
workflow for managing blog content directly from the command line.")
    (license license:expat)))

;;;
;;; 34. boscaceoil-blue-bin — Beginner-friendly music making app (pre-built)
;;;
(define-public boscaceoil-blue-bin
  (package
    (name "boscaceoil-blue-bin")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/YuriSizov/boscaceoil-blue/releases/download/"
             version "-stable/boscaceoil-blue-linux-x86_64.zip"))
       (sha256
        (base32 "0pb5vh6fyc3fkmvcblnyhb0zapsa4fg6p65s8pzznn8d3n7lwiy2"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib/boscaceoil-blue"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (invoke unzip (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (mkdir-p lib)
            (copy-file "boscaceoil-blue-linux-x86_64/boscaceoil-blue.x86_64"
                       (string-append lib "/boscaceoil-blue"))
            (chmod (string-append lib "/boscaceoil-blue") #o755)
            (when (file-exists?
                   "boscaceoil-blue-linux-x86_64/libgdsion.linux.template_release.x86_64.so")
              (copy-file
               "boscaceoil-blue-linux-x86_64/libgdsion.linux.template_release.x86_64.so"
               (string-append lib "/libgdsion.linux.template_release.x86_64.so")))
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append lib "/boscaceoil-blue"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib:"
                                   lib)
                    (string-append lib "/boscaceoil-blue"))
            ;; Create wrapper script
            (call-with-output-file (string-append bin "/boscaceoil-blue")
              (lambda (port)
                (format port "#!~a~%exec ~a/boscaceoil-blue \"$@\"~%"
                        (search-input-file %build-inputs "/bin/bash")
                        lib)))
            (chmod (string-append bin "/boscaceoil-blue") #o755)))))
    (native-inputs (list unzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/YuriSizov/boscaceoil-blue")
    (synopsis "beginner-friendly music creation application")
    (description
     "Bosca Ceoil Blue is a simple and beginner-friendly application for
making music.  Built with the Godot engine, it provides an intuitive
interface for creating chiptune and electronic music without requiring
music theory knowledge.")
    (license license:expat)))

;;;
;;; 35. triangle-bin — Image-to-art converter using Delaunay triangulation (pre-built)
;;;
(define-public triangle-bin
  (package
    (name "triangle-bin")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/esimov/triangle/releases/download/v"
             version "/triangle-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "11mx9xqv4npiblnyr6m937bcw3h4mi345m30jw85vr20ynhyjz3h"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname gzip)))
            (invoke tar "xzf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file
             (string-append "triangle-" #$version "-linux-amd64/triangle")
             (string-append bin "/triangle"))
            (chmod (string-append bin "/triangle") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/triangle"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/triangle"))))))
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/esimov/triangle")
    (synopsis "convert images to art using Delaunay triangulation")
    (description
     "Triangle is a tool that converts images into computer-generated art
using Delaunay triangulation.  It analyzes an input image and
recreates it as a mosaic of triangles, producing a stylized low-poly
artistic effect.")
    (license license:expat)))
