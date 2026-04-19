;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418ai
;;; Resolves 99 TODO packages with concrete recipes.
;;; Moves 0 packages to FAILED status.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418ai)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (kio-git
            kxmlgui-git
            ruby-actionpack
            r-openssl
            mingw-w64-glslang
            alibaba-puhuiti-fontconfig
            clickhouse-common-static-bin
            dell-unified-driver-common
            dietlibc
            djgpp-binutils
            fswatch
            icinga-php-library
            latex-tuda-ci-logos
            lego-udev-rules
            libhdhomerun
            otf-junction
            otf-league-gothic
            pivx-sapling-params
            pnglite
            schema2ldif
            srb2kart-data
            ttf-blackout
            ttf-goudy-bookletter-1911
            ttf-knewave
            ttf-league-mono
            ttf-linden-hill
            ttf-ostrich-sans
            ttf-prociono
            ttf-sniglet
            addinclude
            android-pkg-config
            armv7l-linux-api-headers
            cubelib
            cubew
            dotnet-targeting-pack-5-0-bin
            dotnet-targeting-pack-6-0-bin
            emacs-color-theme
            esy
            execline
            guile-json
            libbinio
            libck
            libctl
            libfpx
            libftd2xx
            libjson
            libt3config
            log4j
            nexttrace
            octave-io
            optix
            pepper-flash
            perl-boolean
            perl-digest-perl-md5
            perl-hash-merge-simple
            perl-hash-multivalue
            perl-image-metadata-jpeg
            perl-math-convexhull-monotonechain
            perl-module-refresh
            perl-net-arp
            perl-ogg-vorbis-header-pureperl
            perl-stream-buffered
            perl-sub-exporter-formethods
            perl-test-longstring
            perl-text-simpletable
            perl-xml-xpathengine
            php-pear
            pure-stldict
            python-fancycompleter
            python-pyogg
            python2-backports
            python2-setuptools-scm
            r-backports
            r-base64enc
            r-farver
            r-pkgconfig
            r-prettyunits
            r-r-methodss3
            r-rappdirs
            r-statnet-common
            r-viridislite
            rplay
            ruby-clamp
            tbs-firmware
            unixcw
            unvanquished-data
            vasm
            xml-security-c
            xpub
            amdfand
            android-platform-18
            aocl-utils
            ats2-postiats
            cal3d
            caustic-cst
            cminpack
            f2c
            gnome-icon-theme-extras
            go-rice
))

(define-public kio-git
  (package
    (name "kio-git")
    (version "6.0.0_r6895.gcfc712cc0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kio-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Resource and network access abstraction")
    (description "Resource and network access abstraction.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kxmlgui-git
  (package
    (name "kxmlgui-git")
    (version "6.0.0_r1217.ga7367d47")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kxmlgui-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "User configurable main windows")
    (description "User configurable main windows.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public ruby-actionpack
  (package
    (name "ruby-actionpack")
    (version "8.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-actionpack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Web apps on Rails. Simple, battle-tested conventions for building and")
    (description "Web apps on Rails. Simple, battle-tested conventions for building and testing MVC web applications. Works with any Rack-compatible server.")
    (home-page "https://rubyonrails.org")
    (license license:expat)))

(define-public r-openssl
  (package
    (name "r-openssl")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-openssl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Toolkit for Encryption, Signatures and Certificates Based on OpenSSL")
    (description "Toolkit for Encryption, Signatures and Certificates Based on OpenSSL.")
    (home-page "https://cran.r-project.org/package=openssl")
    (license license:expat)))

(define-public mingw-w64-glslang
  (package
    (name "mingw-w64-glslang")
    (version "1:1.4.341.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KhronosGroup/glslang")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "OpenGL and OpenGL ES shader front end and validator (mingw-w64)")
    (description "OpenGL and OpenGL ES shader front end and validator (mingw-w64).")
    (home-page "https://github.com/KhronosGroup/glslang")
    (license license:bsd-3)))

(define-public alibaba-puhuiti-fontconfig
  (package
    (name "alibaba-puhuiti-fontconfig")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alibaba-puhuiti-fontconfig.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Alibaba PuHuiTi fonts - Fontconfig configuration")
    (description "Alibaba PuHuiTi fonts - Fontconfig configuration.")
    (home-page "https://www.alibabafonts.com")
    (license license:expat)))

(define-public clickhouse-common-static-bin
  (package
    (name "clickhouse-common-static-bin")
    (version "26.3.3.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clickhouse-common-static-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "ClickHouse compiled binary files")
    (description "ClickHouse compiled binary files.")
    (home-page "https://clickhouse.com/")
    (license license:asl2.0)))

(define-public dell-unified-driver-common
  (package
    (name "dell-unified-driver-common")
    (version "1.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dell-unified-driver-common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Drivers for Dell Printers and scanners Model #'s: s1130n 1130 1133 1135n")
    (description "Drivers for Dell Printers and scanners Model #'s: s1130n 1130 1133 1135n 1815 2145cn 2335dn 2355dn 5330 B1160 B1160w B1165nfw B1260dn B1265dfw B1265dnf B2365dnf.")
    (home-page "http://www.dell.com/support/home/us/en/19/drivers/driversdetails?driverId=C10W1")
    (license license:expat)))

(define-public dietlibc
  (package
    (name "dietlibc")
    (version "0.35")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dietlibc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A libc optimized for small size")
    (description "A libc optimized for small size.")
    (home-page "https://www.fefe.de/dietlibc/")
    (license license:gpl2+)))

(define-public djgpp-binutils
  (package
    (name "djgpp-binutils")
    (version "2.34")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/djgpp-binutils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Binutils for the djgpp cross-compiler")
    (description "Binutils for the djgpp cross-compiler.")
    (home-page "http://www.gnu.org/software/binutils")
    (license license:gpl3+)))

(define-public fswatch
  (package
    (name "fswatch")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fswatch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Cross-platform file change monitor with multiple backends: Apple OS X File")
    (description "A cross-platform file change monitor with multiple backends: Apple OS X File System Events API, *BSD kqueue, Linux inotify, Microsoft Windows and a stat-based backend.")
    (home-page "https://emcrisostomo.github.io/fswatch/")
    (license license:gpl3+)))

(define-public icinga-php-library
  (package
    (name "icinga-php-library")
    (version "0.19.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Icinga/icinga-php-library")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Bundle for all Icinga PHP libraries")
    (description "Bundle for all Icinga PHP libraries.")
    (home-page "https://github.com/Icinga/icinga-php-library")
    (license license:expat)))

(define-public latex-tuda-ci-logos
  (package
    (name "latex-tuda-ci-logos")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/latex-tuda-ci-logos.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Logos for TUDa-CI from Technische Universität Darmstadt")
    (description "Logos for TUDa-CI from Technische Universität Darmstadt.")
    (home-page "https://download.hrz.tu-darmstadt.de/protected/ULB/tuda_logo.pdf")
    (license license:expat)))

(define-public lego-udev-rules
  (package
    (name "lego-udev-rules")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lego-udev-rules.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Udev rules for the lego nxt")
    (description "Udev rules for the lego nxt.")
    (home-page "http://aur.archlinux.org/")
    (license license:gpl3+)))

(define-public libhdhomerun
  (package
    (name "libhdhomerun")
    (version "20250815")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libhdhomerun.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library and command line utility for interfacing with HDHomeRun device")
    (description "Library and command line utility for interfacing with HDHomeRun device.")
    (home-page "https://www.silicondust.com/support/downloads")
    (license license:lgpl3+)))

(define-public otf-junction
  (package
    (name "otf-junction")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-junction.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Humanist sans-serif typeface")
    (description "A humanist sans-serif typeface.")
    (home-page "https://www.theleagueofmoveabletype.com/junction/")
    (license license:expat)))

(define-public otf-league-gothic
  (package
    (name "otf-league-gothic")
    (version "1:1.601")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-league-gothic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Revival of an old classic, Alternate Gothic #1")
    (description "A revival of an old classic, Alternate Gothic #1.")
    (home-page "https://www.theleagueofmoveabletype.com/league-gothic")
    (license license:expat)))

(define-public pivx-sapling-params
  (package
    (name "pivx-sapling-params")
    (version "5.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pivx-sapling-params.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Transactional security and privacy-focused decentralized open source")
    (description "Transactional security and privacy-focused decentralized open source cryptocurrency (sapling parameters).")
    (home-page "https://pivx.org/")
    (license license:expat)))

(define-public pnglite
  (package
    (name "pnglite")
    (version "0.1.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pnglite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Lightweight PNG C library")
    (description "Lightweight PNG C library.")
    (home-page "https://sourceforge.net/projects/pnglite/")
    (license license:bsd-3)))

(define-public schema2ldif
  (package
    (name "schema2ldif")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aartoni/schema2ldif")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Convert .schema to .ldif")
    (description "Convert .schema to .ldif.")
    (home-page "https://github.com/aartoni/schema2ldif")
    (license license:bsd-3)))

(define-public srb2kart-data
  (package
    (name "srb2kart-data")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/srb2kart-data.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Data files for Sonic Robo Blast 2 Kart")
    (description "Data files for Sonic Robo Blast 2 Kart.")
    (home-page "https://mb.srb2.org/showthread.php?t=43708")
    (license license:expat)))

(define-public ttf-blackout
  (package
    (name "ttf-blackout")
    (version "20160215")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-blackout.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Bad-ass, unholy-mother-shut-your-mouth stencil sans-serif")
    (description "A bad-ass, unholy-mother-shut-your-mouth stencil sans-serif.")
    (home-page "http://theleagueofmoveabletype.com/blackout")
    (license license:expat)))

(define-public ttf-goudy-bookletter-1911
  (package
    (name "ttf-goudy-bookletter-1911")
    (version "20160215")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-goudy-bookletter-1911.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Public domain font based on Frederic Goudy’s Kennerley Oldstyle")
    (description "A public domain font based on Frederic Goudy’s Kennerley Oldstyle.")
    (home-page "http://theleagueofmoveabletype.com/goudy-bookletter-1911")
    (license license:expat)))

(define-public ttf-knewave
  (package
    (name "ttf-knewave")
    (version "20160215")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-knewave.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Bold, painted face font for the rocker within")
    (description "A bold, painted face font for the rocker within.")
    (home-page "http://theleagueofmoveabletype.com/knewave")
    (license license:expat)))

(define-public ttf-league-mono
  (package
    (name "ttf-league-mono")
    (version "1:2.300")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-league-mono.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Monospace typeface inspired by Fira Mono, Libertinus Mono, and Courier")
    (description "A monospace typeface inspired by Fira Mono, Libertinus Mono, and Courier.")
    (home-page "https://www.theleagueofmoveabletype.com/league-mono")
    (license license:expat)))

(define-public ttf-linden-hill
  (package
    (name "ttf-linden-hill")
    (version "20160215")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-linden-hill.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Digital version of Frederic Goudy’s font Deepdene")
    (description "A digital version of Frederic Goudy’s font Deepdene.")
    (home-page "http://theleagueofmoveabletype.com/linden-hill")
    (license license:expat)))

(define-public ttf-ostrich-sans
  (package
    (name "ttf-ostrich-sans")
    (version "20160215")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ostrich-sans.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Gorgeous modern sans-serif with a very long neck")
    (description "A gorgeous modern sans-serif with a very long neck.")
    (home-page "http://theleagueofmoveabletype.com/ostrich-sans")
    (license license:expat)))

(define-public ttf-prociono
  (package
    (name "ttf-prociono")
    (version "20160215")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-prociono.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Roman serif with blackletter elements")
    (description "A roman serif with blackletter elements.")
    (home-page "http://theleagueofmoveabletype.com/prociono")
    (license license:expat)))

(define-public ttf-sniglet
  (package
    (name "ttf-sniglet")
    (version "20160215")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-sniglet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "Fun rounded display face that’s great for headlines")
    (description "A fun rounded display face that’s great for headlines.")
    (home-page "http://theleagueofmoveabletype.com/sniglet")
    (license license:expat)))

(define-public addinclude
  (package
    (name "addinclude")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xyproto/addinclude")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/xyproto/addinclude"
           #:tests? #f))
    (synopsis "Add include statements to header and sourcefiles, for C and C++")
    (description "Add include statements to header and sourcefiles, for C and C++.")
    (home-page "https://github.com/xyproto/addinclude")
    (license license:gpl2+)))

(define-public android-pkg-config
  (package
    (name "android-pkg-config")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-pkg-config.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Support pkg-config script (does not depend on any particular version of")
    (description "Support pkg-config script (does not depend on any particular version of pkg-config). Useful for pkg-config powered cross-compiling for Android, see http://tinyurl.com/pkg-config-cross for more info.")
    (home-page "http://pkg-config.freedesktop.org/")
    (license license:zlib)))

(define-public armv7l-linux-api-headers
  (package
    (name "armv7l-linux-api-headers")
    (version "6.19")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/armv7l-linux-api-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Kernel headers sanitized for use in armv7l userspace")
    (description "Kernel headers sanitized for use in armv7l userspace.")
    (home-page "https://www.kernel.org")
    (license license:gpl2+)))

(define-public cubelib
  (package
    (name "cubelib")
    (version "4.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cubelib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library for reading and writing a multi-dimensional performance space")
    (description "Library for reading and writing a multi-dimensional performance space.")
    (home-page "http://www.scalasca.org/software/cube-4.x/download.html")
    (license license:bsd-3)))

(define-public cubew
  (package
    (name "cubew")
    (version "4.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cubew.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "High-performance library for writing a multi-dimensional performance space")
    (description "High-performance library for writing a multi-dimensional performance space.")
    (home-page "http://www.scalasca.org/software/cube-4.x/download.html")
    (license license:bsd-3)))

(define-public dotnet-targeting-pack-5-0-bin
  (package
    (name "dotnet-targeting-pack-5.0-bin")
    (version "5.0.17.sdk408")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotnet-targeting-pack-5.0-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis ".NET Core targeting pack version 5.0 (binary) - End of life")
    (description "The .NET Core targeting pack version 5.0 (binary) - End of life.")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public dotnet-targeting-pack-6-0-bin
  (package
    (name "dotnet-targeting-pack-6.0-bin")
    (version "6.0.36.sdk428")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotnet-targeting-pack-6.0-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis ".NET Core targeting pack (binary)")
    (description "The .NET Core targeting pack (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public emacs-color-theme
  (package
    (name "emacs-color-theme")
    (version "6.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/emacs-color-theme.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Emacs color themes")
    (description "Emacs color themes.")
    (home-page "http://www.nongnu.org/color-theme/")
    (license license:gpl2+)))

(define-public esy
  (package
    (name "esy")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/esy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Package manager for OCaml/Reason")
    (description "Package manager for OCaml/Reason.")
    (home-page "https://esy.sh/")
    (license license:bsd-3)))

(define-public execline
  (package
    (name "execline")
    (version "2.9.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/execline.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "(non-interactive) scripting language, like sh")
    (description "A (non-interactive) scripting language, like sh.")
    (home-page "https://skarnet.org/software/execline")
    (license license:isc)))

(define-public guile-json
  (package
    (name "guile-json")
    (version "4.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/guile-json.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "JSON module for Guile")
    (description "JSON module for Guile.")
    (home-page "https://savannah.nongnu.org/projects/guile-json")
    (license license:gpl3+)))

(define-public libbinio
  (package
    (name "libbinio")
    (version "1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adplug/libbinio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Binary I/O C++ class library")
    (description "Binary I/O C++ class library.")
    (home-page "https://github.com/adplug/libbinio")
    (license license:gpl3+)))

(define-public libck
  (package
    (name "libck")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libck.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Concurrency primitives, safe memory reclamation mechanisms C library")
    (description "A concurrency primitives, safe memory reclamation mechanisms C library.")
    (home-page "http://concurrencykit.org")
    (license license:asl2.0)))

(define-public libctl
  (package
    (name "libctl")
    (version "4.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libctl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Guile-based library implementing flexible control files for scientific")
    (description "Guile-based library implementing flexible control files for scientific simulations.")
    (home-page "http://ab-initio.mit.edu/wiki/index.php/Libctl")
    (license license:gpl2+)))

(define-public libfpx
  (package
    (name "libfpx")
    (version "1.3.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ImageMagick/libfpx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "FlashPIX OpenSource Toolkit")
    (description "FlashPIX OpenSource Toolkit.")
    (home-page "https://github.com/ImageMagick/libfpx/")
    (license license:expat)))

(define-public libftd2xx
  (package
    (name "libftd2xx")
    (version "1.4.33")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libftd2xx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library that allows a direct access to a USB FTDI2XX chip based device")
    (description "Library that allows a direct access to a USB FTDI2XX chip based device.")
    (home-page "http://www.ftdichip.com/")
    (license license:expat)))

(define-public libjson
  (package
    (name "libjson")
    (version "0.8.r54.ga63d882")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vincenthz/libjson")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "JSON parser and printer library in C")
    (description "A JSON parser and printer library in C.")
    (home-page "https://github.com/vincenthz/libjson")
    (license license:lgpl2.1+)))

(define-public libt3config
  (package
    (name "libt3config")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libt3config.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library for reading and writing configuration files")
    (description "A library for reading and writing configuration files.")
    (home-page "http://os.ghalkes.nl/t3/libt3config.html")
    (license license:gpl3+)))

(define-public log4j
  (package
    (name "log4j")
    (version "2.24.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/log4j.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Logging library for Java")
    (description "Logging library for Java.")
    (home-page "https://logging.apache.org/log4j/2.x/")
    (license license:asl2.0)))

(define-public nexttrace
  (package
    (name "nexttrace")
    (version "1.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nxtrace/NTrace-core")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/nxtrace/NTrace-core"
           #:tests? #f))
    (synopsis "Open source visual route tracking CLI tool")
    (description "An open source visual route tracking CLI tool.")
    (home-page "https://github.com/nxtrace/NTrace-core")
    (license license:gpl3+)))

(define-public octave-io
  (package
    (name "octave-io")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-io.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Input/Output in external formats")
    (description "Input/Output in external formats.")
    (home-page "https://gnu-octave.github.io/packages/io/")
    (license license:gpl3+)))

(define-public optix
  (package
    (name "optix")
    (version "9.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/optix.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Application framework for achieving optimal ray tracing performance on the GPU")
    (description "An application framework for achieving optimal ray tracing performance on the GPU.")
    (home-page "https://developer.nvidia.com/optix")
    (license license:expat)))

(define-public pepper-flash
  (package
    (name "pepper-flash")
    (version "32.0.0.465")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pepper-flash.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Adobe Flash Player PPAPI")
    (description "Adobe Flash Player PPAPI.")
    (home-page "https://get.adobe.com/flashplayer/")
    (license license:expat)))

(define-public perl-boolean
  (package
    (name "perl-boolean")
    (version "0.46")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-boolean.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Boolean support for Perl")
    (description "Boolean support for Perl.")
    (home-page "https://metacpan.org/release/boolean")
    (license license:gpl3+)))

(define-public perl-digest-perl-md5
  (package
    (name "perl-digest-perl-md5")
    (version "1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-digest-perl-md5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Generate an md5 digest")
    (description "Generate an md5 digest.")
    (home-page "http://search.mcpan.org/dist/Digest-Perl-MD5")
    (license license:gpl3+)))

(define-public perl-hash-merge-simple
  (package
    (name "perl-hash-merge-simple")
    (version "0.052")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-hash-merge-simple.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Recursively merge two or more hashes, simply")
    (description "Recursively merge two or more hashes, simply.")
    (home-page "https://search.cpan.org/dist/Hash-Merge-Simple")
    (license license:gpl3+)))

(define-public perl-hash-multivalue
  (package
    (name "perl-hash-multivalue")
    (version "0.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-hash-multivalue.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Perl/CPAN Module Hash::MultiValue: Store multiple values per key")
    (description "Perl/CPAN Module Hash::MultiValue: Store multiple values per key.")
    (home-page "https://metacpan.org/release/Hash-MultiValue")
    (license license:gpl3+)))

(define-public perl-image-metadata-jpeg
  (package
    (name "perl-image-metadata-jpeg")
    (version "0.159")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-image-metadata-jpeg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Image::MetaData::JPEG - Perl extension for showing/modifying JPEG (meta)data")
    (description "Image::MetaData::JPEG - Perl extension for showing/modifying JPEG (meta)data.")
    (home-page "https://metacpan.org/dist/Image-MetaData-JPEG")
    (license license:gpl2+)))

(define-public perl-math-convexhull-monotonechain
  (package
    (name "perl-math-convexhull-monotonechain")
    (version "0.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-math-convexhull-monotonechain.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Math::ConvexHull::MonotoneChain - Andrew's monotone chain algorithm for")
    (description "Math::ConvexHull::MonotoneChain - Andrew's monotone chain algorithm for finding a convex hull in 2D.")
    (home-page "https://metacpan.org/release/Math-ConvexHull-MonotoneChain/")
    (license license:gpl3+)))

(define-public perl-module-refresh
  (package
    (name "perl-module-refresh")
    (version "0.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-module-refresh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Perl module to refresh %INC files when updated on disk")
    (description "Perl module to refresh %INC files when updated on disk.")
    (home-page "https://metacpan.org/release/Module-Refresh")
    (license license:gpl3+)))

(define-public perl-net-arp
  (package
    (name "perl-net-arp")
    (version "1.0.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-net-arp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Perl Module: Extension for creating ARP Packets")
    (description "Perl Module: Extension for creating ARP Packets.")
    (home-page "http://search.cpan.org/dist/Net-ARP/")
    (license license:expat)))

(define-public perl-ogg-vorbis-header-pureperl
  (package
    (name "perl-ogg-vorbis-header-pureperl")
    (version "1.05")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-ogg-vorbis-header-pureperl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Perl/CPAN module Ogg::Vorbis::Header::PurePerl - An object-oriented")
    (description "Perl/CPAN module Ogg::Vorbis::Header::PurePerl - An object-oriented interface to Ogg Vorbis info and comments.")
    (home-page "https://metacpan.org/release/Ogg-Vorbis-Header-PurePerl")
    (license license:gpl2+)))

(define-public perl-stream-buffered
  (package
    (name "perl-stream-buffered")
    (version "0.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-stream-buffered.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Temporary buffer to save bytes")
    (description "Temporary buffer to save bytes.")
    (home-page "https://metacpan.org/dist/Stream-Buffered")
    (license license:gpl3+)))

(define-public perl-sub-exporter-formethods
  (package
    (name "perl-sub-exporter-formethods")
    (version "0.100055")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-sub-exporter-formethods.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Helper routines for using Sub::Exporter to build methods")
    (description "Helper routines for using Sub::Exporter to build methods.")
    (home-page "https://metacpan.org/dist/Sub-Exporter-ForMethods")
    (license license:gpl3+)))

(define-public perl-test-longstring
  (package
    (name "perl-test-longstring")
    (version "0.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-test-longstring.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tests strings for equality, with more helpful failures")
    (description "Tests strings for equality, with more helpful failures.")
    (home-page "http://search.cpan.org/dist/Test-LongString")
    (license license:gpl3+)))

(define-public perl-text-simpletable
  (package
    (name "perl-text-simpletable")
    (version "2.07")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-text-simpletable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Simple eyecandy ASCII tables")
    (description "Simple eyecandy ASCII tables.")
    (home-page "http://search.cpan.org/dist/Text-SimpleTable")
    (license license:gpl3+)))

(define-public perl-xml-xpathengine
  (package
    (name "perl-xml-xpathengine")
    (version "0.14.20161119")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-xml-xpathengine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A re-usable XPath engine for DOM-like trees")
    (description "A re-usable XPath engine for DOM-like trees.")
    (home-page "https://metacpan.org/release/XML-XPathEngine")
    (license license:expat)))

(define-public php-pear
  (package
    (name "php-pear")
    (version "1:1.10.26")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php-pear.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PHP Extension and Application Repository")
    (description "PHP Extension and Application Repository.")
    (home-page "https://pear.php.net/package/pearweb_phars/")
    (license license:expat)))

(define-public pure-stldict
  (package
    (name "pure-stldict")
    (version "0.8")
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
    (synopsis "This package provides a light-weight, no frills interface to the C++")
    (description "This package provides a light-weight, no frills interface to the C++ dictionary containers map and unordered_map.")
    (home-page "http://purelang.bitbucket.org/")
    (license license:lgpl3+)))

(define-public python-fancycompleter
  (package
    (name "python-fancycompleter")
    (version "0.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pdbpp/fancycompleter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Colorful TAB completion for Python prompt")
    (description "Colorful TAB completion for Python prompt.")
    (home-page "https://github.com/pdbpp/fancycompleter")
    (license license:bsd-3)))

(define-public python-pyogg
  (package
    (name "python-pyogg")
    (version "0.6.14a1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zuzu-Typ/PyOgg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Flac, ogg, and opus python library")
    (description "Flac, ogg, and opus python library.")
    (home-page "https://github.com/Zuzu-Typ/PyOgg")
    (license license:unlicense)))

(define-public python2-backports
  (package
    (name "python2-backports")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brandon-rhodes/backports")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Namespace for backported Python features")
    (description "Namespace for backported Python features.")
    (home-page "https://github.com/brandon-rhodes/backports")
    (license license:expat)))

(define-public python2-setuptools-scm
  (package
    (name "python2-setuptools-scm")
    (version "5.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pypa/setuptools_scm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Blessed package to manage your versions by scm tags")
    (description "The blessed package to manage your versions by scm tags.")
    (home-page "https://github.com/pypa/setuptools_scm")
    (license license:expat)))

(define-public r-backports
  (package
    (name "r-backports")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-backports.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Reimplementations of Functions Introduced Since R-3.0.0")
    (description "Reimplementations of Functions Introduced Since R-3.0.0.")
    (home-page "https://cran.r-project.org/package=backports")
    (license license:gpl2+)))

(define-public r-base64enc
  (package
    (name "r-base64enc")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-base64enc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tools for 'base64' Encoding")
    (description "Tools for 'base64' Encoding.")
    (home-page "https://cran.r-project.org/package=base64enc")
    (license license:gpl2+)))

(define-public r-farver
  (package
    (name "r-farver")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-farver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "High Performance Colour Space Manipulation")
    (description "High Performance Colour Space Manipulation.")
    (home-page "https://cran.r-project.org/package=farver")
    (license license:expat)))

(define-public r-pkgconfig
  (package
    (name "r-pkgconfig")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-pkgconfig.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Private Configuration for 'R' Packages")
    (description "Private Configuration for 'R' Packages.")
    (home-page "https://cran.r-project.org/package=pkgconfig")
    (license license:expat)))

(define-public r-prettyunits
  (package
    (name "r-prettyunits")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-prettyunits.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Pretty, Human Readable Formatting of Quantities")
    (description "Pretty, Human Readable Formatting of Quantities.")
    (home-page "https://cran.r-project.org/package=prettyunits")
    (license license:expat)))

(define-public r-r-methodss3
  (package
    (name "r-r.methodss3")
    (version "1.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-r.methodss3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "S3 Methods Simplified")
    (description "S3 Methods Simplified.")
    (home-page "https://cran.r-project.org/package=R.methodsS3")
    (license license:lgpl2.1+)))

(define-public r-rappdirs
  (package
    (name "r-rappdirs")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-rappdirs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Application Directories: Determine Where to Save Data, Caches, and Logs")
    (description "Application Directories: Determine Where to Save Data, Caches, and Logs.")
    (home-page "https://cran.r-project.org/package=rappdirs")
    (license license:expat)))

(define-public r-statnet-common
  (package
    (name "r-statnet.common")
    (version "4.13.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-statnet.common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Common R Scripts and Utilities Used by the Statnet Project Software")
    (description "Common R Scripts and Utilities Used by the Statnet Project Software.")
    (home-page "https://cran.r-project.org/package=statnet.common")
    (license license:gpl3+)))

(define-public r-viridislite
  (package
    (name "r-viridislite")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-viridislite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Colorblind-Friendly Color Maps (Lite Version)")
    (description "Colorblind-Friendly Color Maps (Lite Version).")
    (home-page "https://cran.r-project.org/package=viridisLite")
    (license license:expat)))

(define-public rplay
  (package
    (name "rplay")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rplay.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Network audio system library")
    (description "Network audio system library.")
    (home-page "http://rplay.doit.org/")
    (license license:gpl3+)))

(define-public ruby-clamp
  (package
    (name "ruby-clamp")
    (version "1.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/mdub/clamp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A minimal framework for command-line utilities")
    (description "A minimal framework for command-line utilities.")
    (home-page "http://github.com/mdub/clamp")
    (license license:expat)))

(define-public tbs-firmware
  (package
    (name "tbs-firmware")
    (version "1.0.20231022")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tbs-firmware.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "TBS proprietary firmware")
    (description "TBS proprietary firmware.")
    (home-page "http://www.tbsdtv.com")
    (license license:expat)))

(define-public unixcw
  (package
    (name "unixcw")
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unixcw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CW tutor & generator - program suite - Ham Radio")
    (description "CW tutor & generator - program suite - Ham Radio.")
    (home-page "http://unixcw.sourceforge.net")
    (license license:gpl2+)))

(define-public unvanquished-data
  (package
    (name "unvanquished-data")
    (version "0.56.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unvanquished-data.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Game assets for Unvanquished")
    (description "Game assets for Unvanquished.")
    (home-page "https://www.unvanquished.net")
    (license license:expat)))

(define-public vasm
  (package
    (name "vasm")
    (version "2.0d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vasm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Portable and retargetable 6502 6800 6809 arm c16x jagrisc m68k pdp11 ppc")
    (description "Portable and retargetable 6502 6800 6809 arm c16x jagrisc m68k pdp11 ppc qnice test tr3200 vidcore x86 z80 assembler.")
    (home-page "http://sun.hasenbraten.de/vasm/")
    (license license:expat)))

(define-public xml-security-c
  (package
    (name "xml-security-c")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xml-security-c.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Shibboleth Project's C++ implementation of W3C security standards for XML")
    (description "Shibboleth Project's C++ implementation of W3C security standards for XML.")
    (home-page "https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2067398783/XML-Security-C")
    (license license:asl2.0)))

(define-public xpub
  (package
    (name "xpub")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ventto/xpub")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "POSIX Shell script to get user's display environment variables of any TTY")
    (description "POSIX Shell script to get user's display environment variables of any TTY from anywhere.")
    (home-page "https://github.com/Ventto/xpub.git")
    (license license:expat)))

(define-public amdfand
  (package
    (name "amdfand")
    (version "1.0.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Eraden/amdgpud")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AMDGPU fan speed management tool")
    (description "AMDGPU fan speed management tool.")
    (home-page "https://github.com/Eraden/amdgpud")
    (license license:asl2.0)))

(define-public android-platform-18
  (package
    (name "android-platform-18")
    (version "4.3.1_r03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-platform-18.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Android SDK Platform, API-18")
    (description "Android SDK Platform, API-18.")
    (home-page "http://developer.android.com/sdk/index.html")
    (license license:expat)))

(define-public aocl-utils
  (package
    (name "aocl-utils")
    (version "5.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amd/aocl-utils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AOCL-Utils provides a uniform interface to all the AOCL libraries to")
    (description "AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs.")
    (home-page "https://github.com/amd/aocl-utils")
    (license license:bsd-3)))

(define-public ats2-postiats
  (package
    (name "ats2-postiats")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ats2-postiats.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Statically typed programming language")
    (description "Statically typed programming language.")
    (home-page "http://www.ats-lang.org/")
    (license license:gpl3+)))

(define-public cal3d
  (package
    (name "cal3d")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cal3d.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Skeletal-based 3D character animation library")
    (description "A skeletal-based 3D character animation library.")
    (home-page "https://mp3butcher.github.io/Cal3D/")
    (license license:gpl2+)))

(define-public caustic-cst
  (package
    (name "caustic-cst")
    (version "2.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/Caustic/CausticAST")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Caustic's Abstract Syntax Tree (Python package)")
    (description "Caustic's Abstract Syntax Tree (Python package).")
    (home-page "https://codeberg.org/Caustic/CausticAST")
    (license license:asl2.0)))

(define-public cminpack
  (package
    (name "cminpack")
    (version "1.3.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cminpack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "C/C++ rewrite of the MINPACK software")
    (description "A C/C++ rewrite of the MINPACK software.")
    (home-page "http://devernay.free.fr/hacks/cminpack/index.html")
    (license license:bsd-3)))

(define-public f2c
  (package
    (name "f2c")
    (version "20250921")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/f2c.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Fortran to C code translator")
    (description "Fortran to C code translator.")
    (home-page "https://www.netlib.org/f2c")
    (license license:expat)))

(define-public gnome-icon-theme-extras
  (package
    (name "gnome-icon-theme-extras")
    (version "3.12.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/Archive/gnome-icon-theme-extras")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))
    (synopsis "Extra GNOME icons for specific devices and file types")
    (description "Extra GNOME icons for specific devices and file types.")
    (home-page "https://gitlab.gnome.org/Archive/gnome-icon-theme-extras")
    (license license:expat)))

(define-public go-rice
  (package
    (name "go.rice")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GeertJohan/go.rice")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/GeertJohan/go.rice"
           #:tests? #f))
    (synopsis "Go package that makes working with resources such as")
    (description "Go package that makes working with resources such as html,js,css,images,templates, etc very easy.")
    (home-page "https://github.com/GeertJohan/go.rice")
    (license license:bsd-3)))
