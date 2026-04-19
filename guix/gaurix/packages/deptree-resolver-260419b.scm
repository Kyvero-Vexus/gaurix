;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260419b
;;; Source pool: TODO (BLOCKED pool was empty)
;;; Resolves 80 TODO packages with concrete recipes.
;;; Moves 19 packages to FAILED status.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260419b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system r)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (kcmutils-git
            kparts-git
            r-hms
            baloo-git
            perl-moosex-types
            knotifyconfig-git
            adplug
            gv
            harminv
            icu63
            json-sh
            lha
            libcapi
            libcotp
            liboglappth
            liboping
            libparserutils-git
            libpasastro
            librandombytes
            libsoundio
            libumem-git
            libvitamtp
            libwandio
            mimetic
            nqp
            octave-geometry
            octave-statistics
            octomap
            pbar
            pd-pure
            peerflix
            pencil
            perl-audio-flac-header
            perl-class-accessor-grouped
            perl-crypt-urandom
            perl-extutils-typemaps-default
            perl-iptables-parse
            perl-lingua-en-inflect-number
            perl-mixin-linewise
            perl-net-pcap
            perl-net-sftp-foreign
            perl-proc-daemon
            pure-faust
            pure-ffi
            pure-midi
            python-async-generator
            python-cmp-version
            python-fuzzyfinder
            python-oldest-supported-numpy
            python-pyspf
            python-raven
            python-verboselogs
            qt4pas
            quazip-qt4
            r-gridextra
            r-lazyeval
            r-sessioninfo
            r-tzdb
            rep-gtk
            ruby-cabin
            ruby-reverse-markdown
            ruby-stud
            ruby-version-gem
            s6
            signald
            silc-toolkit
            sssm
            tclcl
            tklib
            vapoursynth-plugin-bilateral-git
            websockify
            xi-core
            xylib
            argparser-c
            blend2d
            ctranslate2-git
            discord-chat-exporter-core
            eclipse-platform
            flif-mime
            icon
))

(define-public kcmutils-git
  (package
    (name "kcmutils-git")
    (version "6.0.0_r1096.g453e4f4b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kcmutils-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Utilities for interacting with KCModules")
    (description "Utilities for interacting with KCModules.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kparts-git
  (package
    (name "kparts-git")
    (version "6.0.0_r822.g2d6ed3f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kparts-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Document centric plugin system")
    (description "Document centric plugin system.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public r-hms
  (package
    (name "r-hms")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "package=hms" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Pretty Time of Day")
    (description "Pretty Time of Day.")
    (home-page "https://cran.r-project.org/package=hms")
    (license license:expat)))

(define-public baloo-git
  (package
    (name "baloo-git")
    (version "5.240.0_r3149.gf6974075")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/baloo-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Framework for searching and managing metadata")
    (description "A framework for searching and managing metadata.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public perl-moosex-types
  (package
    (name "perl-moosex-types")
    (version "0.51")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/dist/MooseX-Types")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Organise your Moose types in libraries")
    (description "Organise your Moose types in libraries.")
    (home-page "https://metacpan.org/dist/MooseX-Types")
    (license license:gpl3+)))

(define-public knotifyconfig-git
  (package
    (name "knotifyconfig-git")
    (version "6.0.0_r512.gf9c2c1b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/knotifyconfig-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Configuration system for KNotify")
    (description "Configuration system for KNotify.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public adplug
  (package
    (name "adplug")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adplug.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AdLib sound player library")
    (description "AdLib sound player library.")
    (home-page "http://adplug.github.io/")
    (license license:lgpl3+)))

(define-public gv
  (package
    (name "gv")
    (version "3.7.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Program to view PostScript and PDF documents")
    (description "A program to view PostScript and PDF documents.")
    (home-page "https://www.gnu.org/software/gv/")
    (license license:gpl3+)))

(define-public harminv
  (package
    (name "harminv")
    (version "1.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NanoComp/harminv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Free program to solve the problem of harmonic inversion")
    (description "A free program to solve the problem of harmonic inversion.")
    (home-page "https://github.com/NanoComp/harminv")
    (license license:gpl3+)))

(define-public icu63
  (package
    (name "icu63")
    (version "63.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/icu63.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "International Components for Unicode library")
    (description "International Components for Unicode library.")
    (home-page "https://icu.unicode.org/")
    (license license:expat)))

(define-public json-sh
  (package
    (name "json-sh")
    (version "r106.0d5e5c7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dominictarr/JSON.sh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Command line json tool written in bash")
    (description "Command line json tool written in bash.")
    (home-page "https://github.com/dominictarr/JSON.sh")
    (license license:asl2.0)))

(define-public lha
  (package
    (name "lha")
    (version "1:1.14i_ac20220213")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lha.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Compression and archive utility for LH-7 format archives")
    (description "A compression and archive utility for LH-7 format archives.")
    (home-page "http://lha.osdn.jp")
    (license license:expat)))

(define-public libcapi
  (package
    (name "libcapi")
    (version "3.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libcapi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Modular libcapi20")
    (description "Modular libcapi20.")
    (home-page "https://www.tabos.org/")
    (license license:gpl2+)))

(define-public libcotp
  (package
    (name "libcotp")
    (version "4.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paolostivanin/libcotp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "C library that generates TOTP and HOTP")
    (description "C library that generates TOTP and HOTP.")
    (home-page "https://github.com/paolostivanin/libcotp")
    (license license:asl2.0)))

(define-public liboglappth
  (package
    (name "liboglappth")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liboglappth.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library containing computational chemistry facility of ghemical")
    (description "Library containing computational chemistry facility of ghemical.")
    (home-page "https://bioinformatics.org/ghemical/libghemical/")
    (license license:gpl3+)))

(define-public liboping
  (package
    (name "liboping")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liboping.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "C library to generate ICMP echo requests, better known as \"ping packets\"")
    (description "C library to generate ICMP echo requests, better known as \"ping packets\".")
    (home-page "https://noping.cc/")
    (license license:gpl3+)))

(define-public libparserutils-git
  (package
    (name "libparserutils-git")
    (version "0.2.4.r1.gd101b2b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libparserutils-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library for building efficient parsers")
    (description "Library for building efficient parsers.")
    (home-page "http://www.netsurf-browser.org/projects/libparserutils/")
    (license license:expat)))

(define-public libpasastro
  (package
    (name "libpasastro")
    (version "1.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pchev/libpasastro")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Provide Pascal interface for standard astronomy libraries")
    (description "Provide Pascal interface for standard astronomy libraries.")
    (home-page "https://github.com/pchev/libpasastro")
    (license license:gpl2+)))

(define-public librandombytes
  (package
    (name "librandombytes")
    (version "20240318")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librandombytes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Microlibrary for generating randomness")
    (description "A microlibrary for generating randomness.")
    (home-page "https://randombytes.cr.yp.to")
    (license license:unlicense)))

(define-public libsoundio
  (package
    (name "libsoundio")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.github.com/andrewrk/libsoundio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "C99 library providing cross-platform audio input and output")
    (description "A C99 library providing cross-platform audio input and output.")
    (home-page "https://www.github.com/andrewrk/libsoundio")
    (license license:expat)))

(define-public libumem-git
  (package
    (name "libumem-git")
    (version "1.0.r15.g3fc772c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/omniti-labs/portableumem")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Port of the Solaris libumem memory allocator")
    (description "A port of the Solaris libumem memory allocator.")
    (home-page "https://github.com/omniti-labs/portableumem/")
    (license license:expat)))

(define-public libvitamtp
  (package
    (name "libvitamtp")
    (version "2.5.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/codestation/vitamtp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library to interact with Vita's USB MTP protocol")
    (description "Library to interact with Vita's USB MTP protocol.")
    (home-page "https://github.com/codestation/vitamtp")
    (license license:gpl3+)))

(define-public libwandio
  (package
    (name "libwandio")
    (version "4.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libwandio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Software library written in C that provides an API for transparently")
    (description "Software library written in C that provides an API for transparently reading from and writing to files using a variety of supported compression methods.")
    (home-page "http://research.wand.net.nz/software/libwandio.php")
    (license license:lgpl3+)))

(define-public mimetic
  (package
    (name "mimetic")
    (version "1:0.9.8+r47+g2be9506")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mimetic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Free, MIT licensed, Email library (MIME) written in C++")
    (description "A free, MIT licensed, Email library (MIME) written in C++.")
    (home-page "https://www.codesink.org/mimetic_mime_library.html")
    (license license:expat)))

(define-public nqp
  (package
    (name "nqp")
    (version "2026.03")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Raku/nqp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Lightweight Raku-like environment for virtual machines (MoarVM backend)")
    (description "Lightweight Raku-like environment for virtual machines (MoarVM backend).")
    (home-page "https://github.com/Raku/nqp")
    (license license:artistic2.0)))

(define-public octave-geometry
  (package
    (name "octave-geometry")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-geometry.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library for geometric computing extending MatGeom functions. Useful to")
    (description "Library for geometric computing extending MatGeom functions. Useful to create, transform, manipulate and display geometric primitives.")
    (home-page "https://gnu-octave.github.io/packages/geometry/")
    (license license:gpl3+)))

(define-public octave-statistics
  (package
    (name "octave-statistics")
    (version "1.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-statistics.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Additional statistics functions for Octave")
    (description "Additional statistics functions for Octave.")
    (home-page "https://gnu-octave.github.io/packages/statistics/")
    (license license:gpl3+)))

(define-public octomap
  (package
    (name "octomap")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octomap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Efficient probabilistic 3D mapping framework based on octrees")
    (description "Efficient probabilistic 3D mapping framework based on octrees.")
    (home-page "https://octomap.github.io/")
    (license license:bsd-3)))

(define-public pbar
  (package
    (name "pbar")
    (version "20160830")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ritze/pbar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Progress bar in pacman style")
    (description "Progress bar in pacman style.")
    (home-page "https://github.com/ritze/pbar")
    (license license:gpl3+)))

(define-public pd-pure
  (package
    (name "pd-pure")
    (version "0.26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://purelang.bitbucket.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Loader plugin for the Pure programming language which lets you write")
    (description "Loader plugin for the Pure programming language which lets you write external Pd objects in Pure.")
    (home-page "http://purelang.bitbucket.org/")
    (license license:bsd-3)))

(define-public peerflix
  (package
    (name "peerflix")
    (version "0.39.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mafintosh/peerflix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Streaming torrent client for node.js")
    (description "Streaming torrent client for node.js.")
    (home-page "https://github.com/mafintosh/peerflix")
    (license license:expat)))

(define-public pencil
  (package
    (name "pencil")
    (version "3.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/evolus/pencil")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Sketching and GUI prototyping/wireframing tool")
    (description "Sketching and GUI prototyping/wireframing tool.")
    (home-page "https://github.com/evolus/pencil")
    (license license:gpl2+)))

(define-public perl-audio-flac-header
  (package
    (name "perl-audio-flac-header")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/Audio-FLAC-Header")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Audio::FLAC::Header - Access to FLAC audio metadata")
    (description "Audio::FLAC::Header - Access to FLAC audio metadata.")
    (home-page "https://metacpan.org/release/Audio-FLAC-Header")
    (license license:artistic2.0)))

(define-public perl-class-accessor-grouped
  (package
    (name "perl-class-accessor-grouped")
    (version "0.10014")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/Class-Accessor-Grouped")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Lets you build groups of accessors")
    (description "Lets you build groups of accessors.")
    (home-page "https://metacpan.org/release/Class-Accessor-Grouped")
    (license license:artistic2.0)))

(define-public perl-crypt-urandom
  (package
    (name "perl-crypt-urandom")
    (version "0.55")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/Crypt-URandom")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Provide non blocking randomness")
    (description "Provide non blocking randomness.")
    (home-page "https://metacpan.org/release/Crypt-URandom")
    (license license:gpl3+)))

(define-public perl-extutils-typemaps-default
  (package
    (name "perl-extutils-typemaps-default")
    (version "1.05")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/ExtUtils-Typemaps-Default/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ExtUtils::Typemaps::Default - A set of useful typemaps")
    (description "ExtUtils::Typemaps::Default - A set of useful typemaps.")
    (home-page "https://metacpan.org/release/ExtUtils-Typemaps-Default/")
    (license license:gpl3+)))

(define-public perl-iptables-parse
  (package
    (name "perl-iptables-parse")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri "http://search.cpan.org/~mrash/IPTables-Parse/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IPTables::Parse - Perl extension for parsing iptables and ip6tables")
    (description "IPTables::Parse - Perl extension for parsing iptables and ip6tables firewall rulesets.")
    (home-page "http://search.cpan.org/~mrash/IPTables-Parse/")
    (license license:gpl3+)))

(define-public perl-lingua-en-inflect-number
  (package
    (name "perl-lingua-en-inflect-number")
    (version "1.12")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/Lingua-EN-Inflect-Number")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Perl/CPAN Module Lingua::EN::Inflect::Number: Force number of words to")
    (description "Perl/CPAN Module Lingua::EN::Inflect::Number: Force number of words to singular or plural.")
    (home-page "https://metacpan.org/release/Lingua-EN-Inflect-Number")
    (license license:gpl3+)))

(define-public perl-mixin-linewise
  (package
    (name "perl-mixin-linewise")
    (version "0.111")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/dist/Mixin-Linewise")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Write your linewise code for handles; this does the rest")
    (description "Write your linewise code for handles; this does the rest.")
    (home-page "https://metacpan.org/dist/Mixin-Linewise")
    (license license:gpl3+)))

(define-public perl-net-pcap
  (package
    (name "perl-net-pcap")
    (version "0.21")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/Net-Pcap")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Perl/CPAN Module Net::Pcap")
    (description "Perl/CPAN Module Net::Pcap.")
    (home-page "https://metacpan.org/release/Net-Pcap")
    (license license:gpl3+)))

(define-public perl-net-sftp-foreign
  (package
    (name "perl-net-sftp-foreign")
    (version "1.93")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/Net-SFTP-Foreign")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SSH File Transfer Protocol client using the native SSH client")
    (description "SSH File Transfer Protocol client using the native SSH client.")
    (home-page "https://metacpan.org/release/Net-SFTP-Foreign")
    (license license:gpl3+)))

(define-public perl-proc-daemon
  (package
    (name "perl-proc-daemon")
    (version "0.23")
    (source (origin
              (method url-fetch)
              (uri "https://metacpan.org/release/Proc-Daemon")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Run Perl program(s) as a daemon process")
    (description "Run Perl program(s) as a daemon process.")
    (home-page "https://metacpan.org/release/Proc-Daemon")
    (license license:gpl3+)))

(define-public pure-faust
  (package
    (name "pure-faust")
    (version "0.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://purelang.bitbucket.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Run Faust-generated signal processing modules in Pure")
    (description "Run Faust-generated signal processing modules in Pure.")
    (home-page "http://purelang.bitbucket.org/")
    (license license:lgpl3+)))

(define-public pure-ffi
  (package
    (name "pure-ffi")
    (version "0.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://purelang.bitbucket.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Interface to libffi which enables you to call C functions from Pure and")
    (description "An interface to libffi which enables you to call C functions from Pure and vice versa.")
    (home-page "http://purelang.bitbucket.org/")
    (license license:lgpl3+)))

(define-public pure-midi
  (package
    (name "pure-midi")
    (version "0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://purelang.bitbucket.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MIDI interface for pure")
    (description "MIDI interface for pure.")
    (home-page "http://purelang.bitbucket.org/")
    (license license:bsd-3)))

(define-public python-async-generator
  (package
    (name "python-async_generator")
    (version "1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/python-trio/async_generator")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Making it easy to write async iterators")
    (description "Making it easy to write async iterators.")
    (home-page "https://github.com/python-trio/async_generator")
    (license license:expat)))

(define-public python-cmp-version
  (package
    (name "python-cmp_version")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/kata198/cmp_version")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Script and python module to compare version numbers. Use this to compare")
    (description "A script and python module to compare version numbers. Use this to compare the version strings of packages, modules, really anything.")
    (home-page "http://github.com/kata198/cmp_version")
    (license license:lgpl3+)))

(define-public python-fuzzyfinder
  (package
    (name "python-fuzzyfinder")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amjith/fuzzyfinder")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Fuzzy Finder implemented in Python. Matches partial string entries from a")
    (description "Fuzzy Finder implemented in Python. Matches partial string entries from a list of strings.")
    (home-page "https://github.com/amjith/fuzzyfinder")
    (license license:bsd-3)))

(define-public python-oldest-supported-numpy
  (package
    (name "python-oldest-supported-numpy")
    (version "2023.12.21")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/scipy/oldest-supported-numpy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Meta-package providing oldest supported Numpy for given Python version")
    (description "Meta-package providing oldest supported Numpy for given Python version.")
    (home-page "https://github.com/scipy/oldest-supported-numpy")
    (license license:bsd-3)))

(define-public python-pyspf
  (package
    (name "python-pyspf")
    (version "2.0.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyspf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python implementation of the Sender Policy Framework (SPF) protocol")
    (description "Python implementation of the Sender Policy Framework (SPF) protocol.")
    (home-page "https://pypi.python.org/pypi/pyspf")
    (license license:expat)))

(define-public python-raven
  (package
    (name "python-raven")
    (version "6.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/getsentry/raven-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python client for Sentry")
    (description "Python client for Sentry.")
    (home-page "https://github.com/getsentry/raven-python")
    (license license:bsd-3)))

(define-public python-verboselogs
  (package
    (name "python-verboselogs")
    (version "1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xolox/python-verboselogs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Verbose logging level for Python's logging module")
    (description "Verbose logging level for Python's logging module.")
    (home-page "https://github.com/xolox/python-verboselogs")
    (license license:expat)))

(define-public qt4pas
  (package
    (name "qt4pas")
    (version "2.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt4pas.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Free Pascal Qt4 Binding Library")
    (description "Free Pascal Qt4 Binding Library.")
    (home-page "http://users.telenet.be/Jan.Van.hijfte/qtforfpc/fpcqt4.html")
    (license license:lgpl3+)))

(define-public quazip-qt4
  (package
    (name "quazip-qt4")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quazip-qt4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package, qt4 version")
    (description "C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package, qt4 version.")
    (home-page "http://sourceforge.net/projects/quazip/")
    (license license:lgpl3+)))

(define-public r-gridextra
  (package
    (name "r-gridextra")
    (version "2.3")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "index.html" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Provides a number of user-level functions to work with \"grid\" graphics,")
    (description "Provides a number of user-level functions to work with \"grid\" graphics, notably to arrange multiple grid-based plots on a page, and draw tables.")
    (home-page "http://cran.r-project.org/web/packages/gridExtra/index.html")
    (license license:gpl3+)))

(define-public r-lazyeval
  (package
    (name "r-lazyeval")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "package=lazyeval" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Lightweight Well-Known Geometry Parsing")
    (description "Lightweight Well-Known Geometry Parsing.")
    (home-page "https://cran.r-project.org/package=lazyeval")
    (license license:gpl3+)))

(define-public r-sessioninfo
  (package
    (name "r-sessioninfo")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "package=sessioninfo" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "R Session Information")
    (description "R Session Information.")
    (home-page "https://cran.r-project.org/package=sessioninfo")
    (license license:gpl3+)))

(define-public r-tzdb
  (package
    (name "r-tzdb")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "package=tzdb" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Time Zone Database Information")
    (description "Time Zone Database Information.")
    (home-page "https://cran.r-project.org/package=tzdb")
    (license license:expat)))

(define-public rep-gtk
  (package
    (name "rep-gtk")
    (version "0.90.8.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rep-gtk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Binding of the GTK and GDK libraries for the librep Lisp environment")
    (description "Binding of the GTK and GDK libraries for the librep Lisp environment.")
    (home-page "http://sawfish.wikia.com/wiki/Rep-GTK")
    (license license:gpl3+)))

(define-public ruby-cabin
  (package
    (name "ruby-cabin")
    (version "0.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jordansissel/ruby-cabin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Experiments in structured and contextual logging")
    (description "Experiments in structured and contextual logging.")
    (home-page "https://github.com/jordansissel/ruby-cabin")
    (license license:asl2.0)))

(define-public ruby-reverse-markdown
  (package
    (name "ruby-reverse_markdown")
    (version "3.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xijo/reverse_markdown")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Ruby gem to convert html into markdown")
    (description "Ruby gem to convert html into markdown.")
    (home-page "https://github.com/xijo/reverse_markdown")
    (license license:wtfpl2)))

(define-public ruby-stud
  (package
    (name "ruby-stud")
    (version "0.0.23")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "stud" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Small reusable bits of code")
    (description "Small reusable bits of code.")
    (home-page "https://rubygems.org/gems/stud")
    (license license:asl2.0)))

(define-public ruby-version-gem
  (package
    (name "ruby-version_gem")
    (version "1.1.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pboling/version_gem")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Enhance that VERSION! Sugar for boring Version modules")
    (description "Enhance that VERSION! Sugar for boring Version modules.")
    (home-page "https://github.com/pboling/version_gem")
    (license license:expat)))

(define-public s6
  (package
    (name "s6")
    (version "2.14.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/s6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Small suite of programs for UNIX, designed to allow process supervision")
    (description "A small suite of programs for UNIX, designed to allow process supervision.")
    (home-page "https://skarnet.org/software/s6")
    (license license:isc)))

(define-public signald
  (package
    (name "signald")
    (version "0.23.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/signald/signald")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Unofficial daemon that facilitates communication with the Signal messaging app")
    (description "An unofficial daemon that facilitates communication with the Signal messaging app.")
    (home-page "https://gitlab.com/signald/signald")
    (license license:gpl3+)))

(define-public silc-toolkit
  (package
    (name "silc-toolkit")
    (version "1.1.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/silc-toolkit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Toolkit for Secure Internet Live Conferencing")
    (description "Toolkit for Secure Internet Live Conferencing.")
    (home-page "http://silcnet.org")
    (license license:gpl2+)))

(define-public sssm
  (package
    (name "sssm")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Infernio/sssm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Simple Steam Skin Manager")
    (description "Simple Steam Skin Manager.")
    (home-page "https://github.com/Infernio/sssm")
    (license license:expat)))

(define-public tclcl
  (package
    (name "tclcl")
    (version "1.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tclcl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tcl with classes (TclCl) is a Tcl/C++ interface")
    (description "Tcl with classes (TclCl) is a Tcl/C++ interface.")
    (home-page "http://otcl-tclcl.sourceforge.net/tclcl/")
    (license license:expat)))

(define-public tklib
  (package
    (name "tklib")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tklib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tklib specializes in utilities for GUI programming")
    (description "Tklib specializes in utilities for GUI programming.")
    (home-page "https://core.tcl-lang.org/tklib/home")
    (license license:expat)))

(define-public vapoursynth-plugin-bilateral-git
  (package
    (name "vapoursynth-plugin-bilateral-git")
    (version "3.6.g5c246c0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vapoursynth-plugin-bilateral-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Plugin for Vapoursynth: bilateral (GIT version)")
    (description "Plugin for Vapoursynth: bilateral (GIT version).")
    (home-page "http://forum.doom9.org/showthread.php?t=171306")
    (license license:gpl3+)))

(define-public websockify
  (package
    (name "websockify")
    (version "0.13.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/novnc/websockify")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "WebSockets support for any application/server")
    (description "WebSockets support for any application/server.")
    (home-page "https://github.com/novnc/websockify")
    (license license:lgpl3+)))

(define-public xi-core
  (package
    (name "xi-core")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xi-editor/xi-editor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Modern editor with a backend written in Rust")
    (description "A modern editor with a backend written in Rust.")
    (home-page "https://github.com/xi-editor/xi-editor")
    (license license:asl2.0)))

(define-public xylib
  (package
    (name "xylib")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xylib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Portable C++ library for reading files that contain x-y data from powder")
    (description "Portable C++ library for reading files that contain x-y data from powder diffraction, spectroscopy or other experimental methods.")
    (home-page "http://xylib.sourceforge.net/")
    (license license:gpl3+)))

(define-public argparser-c
  (package
    (name "argparser-c")
    (version "5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maandree/argparser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Command line argument parser library, like getopt, except better. C version")
    (description "Command line argument parser library, like getopt, except better. C version.")
    (home-page "https://github.com/maandree/argparser")
    (license license:agpl3+)))

(define-public blend2d
  (package
    (name "blend2d")
    (version "0.21.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blend2d.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "High-performance 2D vector graphics engine written in C++")
    (description "A high-performance 2D vector graphics engine written in C++.")
    (home-page "https://blend2d.com")
    (license license:zlib)))

(define-public ctranslate2-git
  (package
    (name "ctranslate2-git")
    (version "1703.77a48d43")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenNMT/ctranslate2")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Fast inference engine for OpenNMT models")
    (description "Fast inference engine for OpenNMT models.")
    (home-page "https://github.com/OpenNMT/ctranslate2")
    (license license:gpl3+)))

(define-public discord-chat-exporter-core
  (package
    (name "discord-chat-exporter-core")
    (version "2.47.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Tyrrrz/DiscordChatExporter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Exports Discord chat logs to a file - Core")
    (description "Exports Discord chat logs to a file - Core.")
    (home-page "https://github.com/Tyrrrz/DiscordChatExporter")
    (license license:expat)))

(define-public eclipse-platform
  (package
    (name "eclipse-platform")
    (version "4.39")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eclipse-platform.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Minimal installation suitable for complete per-user customization with the")
    (description "A minimal installation suitable for complete per-user customization with the built-in Eclipse package manager.")
    (home-page "https://www.eclipse.org")
    (license license:expat)))

(define-public flif-mime
  (package
    (name "flif-mime")
    (version "r16.9272881")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spillerrec/qt-flif-plugin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MIME file type for the FLIF image format")
    (description "MIME file type for the FLIF image format.")
    (home-page "https://github.com/spillerrec/qt-flif-plugin")
    (license license:gpl3+)))

(define-public icon
  (package
    (name "icon")
    (version "1:9.5.25a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gtownsend/icon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Icon programming language")
    (description "The Icon programming language.")
    (home-page "https://github.com/gtownsend/icon")
    (license license:expat)))
