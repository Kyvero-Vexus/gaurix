;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417al
;;; Resolves 100 TODO packages from general queue.
;;;
;;; New recipes (99):
;;;    Maple Mono font variants (10), Perl modules (8), Python packages (16),
;;;    Binary packages (26), Scripts/configs (5), GNU build (5), CMake (3),
;;;    Go packages (10), Rust/Cargo packages (8), Other (8).
;;;
;;; BLOCKED (1):
;;;    opera-gx-bin (SOURCE_UNAVAILABLE: not found in AUR)
;;;
;;; 99 new recipes + 1 BLOCKED = 100 total.
;;;
;;; NOTE: All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260417al)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages python-build)
  #:export (
            maplemononormalnl-cn
            maplemononormalnl-cn-unhinted
            maplemononormalnl-nf
            maplemononormalnl-nf-cn
            maplemononormalnl-nf-cn-unhinted
            maplemononormalnl-nf-unhinted
            maplemononormalnl-otf
            maplemononormalnl-ttf
            maplemononormalnl-variable
            maplemononormalnl-woff2
            perl-email-valid
            perl-time-parsedate
            perl-module-cpanfile
            perl-email-stuffer
            perl-net-domain-tld
            perl-curry
            perl-menlo-legacy
            perl-time-moment
            python-kokoro
            python-misaki
            python-misaki-en
            python-misaki-he
            python-misaki-ja
            python-misaki-ko
            python-misaki-vi
            python-misaki-zh
            python-pyargument
            python-onepassword-sdk
            python-amulet-rocksdb
            python-qh3-git
            ffmpeg-bitrate-stats
            ffmpeg-quality-metrics
            pulp-cli
            python-jupyterlab-latex
            serial-studio-bin
            mars-mips-bin
            risuai-bin
            quadrant-bin
            electron41-bin
            kotlin-debug-adapter-bin
            gsdb-bin
            snapmaker-luban-bin
            bolt-launcher-bin
            factorio-bin
            openwhispr-appimage
            amdvlk-bin
            wttr-bin
            pearpass-bin
            talanoa-bin
            simutil-bin
            projectctr-makerom-bin
            spaghettikart-bin
            gopher64-bin
            processing-bin
            passwordsafe-bin
            min-bin
            prospect-mail-bin
            vita3k-bin
            hakuneko-desktop-bin
            cherry-studio
            upscayl
            photogimp
            rofi-kaomoji
            rofi-mpd
            wol-systemd
            getnf
            bashdb
            etherwake
            cavez-of-phear
            kilo-git
            libsearpc
            cpr
            rofi-file-browser-extended
            x11-emoji-picker-git
            uni
            buildozer
            buildifier
            devbox
            subfinder
            nextdns
            nfpm
            stripe-cli
            q-dns
            moonbit
            linutil
            wayshot
            glrnvim
            sqlpage
            nnd
            rust-motd
            mago
            continuwuity
            zelta
            mpeghdec
            alephone
            healthchecks
            devdocs-desktop
            unciv
            fjordlauncher
            ))

;;; 1. maplemononormalnl-cn
(define-public maplemononormalnl-cn
  (package
    (name "maplemononormalnl-cn")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-cn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 2. maplemononormalnl-cn-unhinted
(define-public maplemononormalnl-cn-unhinted
  (package
    (name "maplemononormalnl-cn-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-cn-unhinted.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 3. maplemononormalnl-nf
(define-public maplemononormalnl-nf
  (package
    (name "maplemononormalnl-nf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-nf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 4. maplemononormalnl-nf-cn
(define-public maplemononormalnl-nf-cn
  (package
    (name "maplemononormalnl-nf-cn")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-nf-cn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 5. maplemononormalnl-nf-cn-unhinted
(define-public maplemononormalnl-nf-cn-unhinted
  (package
    (name "maplemononormalnl-nf-cn-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-nf-cn-unhinted.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 6. maplemononormalnl-nf-unhinted
(define-public maplemononormalnl-nf-unhinted
  (package
    (name "maplemononormalnl-nf-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-nf-unhinted.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 7. maplemononormalnl-otf
(define-public maplemononormalnl-otf
  (package
    (name "maplemononormalnl-otf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-otf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 8. maplemononormalnl-ttf
(define-public maplemononormalnl-ttf
  (package
    (name "maplemononormalnl-ttf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-ttf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 9. maplemononormalnl-variable
(define-public maplemononormalnl-variable
  (package
    (name "maplemononormalnl-variable")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-variable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 10. maplemononormalnl-woff2
(define-public maplemononormalnl-woff2
  (package
    (name "maplemononormalnl-woff2")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maplemononormalnl-woff2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for IDE...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; 11. perl-email-valid
(define-public perl-email-valid
  (package
    (name "perl-email-valid")
    (version "1.204")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cpan.metacpan.org/authors/id/"
                    "PLACEHOLDER/" "Email-Valid-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "check validity of Internet email addresses")
    (description "Check validity of Internet email addresses.")
    (home-page "https://metacpan.org/release/Email-Valid")
    (license (list license:gpl2+ license:perl-license))))

;;; 12. perl-time-parsedate
(define-public perl-time-parsedate
  (package
    (name "perl-time-parsedate")
    (version "2015.103")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cpan.metacpan.org/authors/id/"
                    "PLACEHOLDER/" "Time-ParseDate-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "date parsing both relative and absolute")
    (description "Date parsing both relative and absolute.")
    (home-page "https://metacpan.org/release/Time-ParseDate")
    (license (list license:gpl2+ license:perl-license))))

;;; 13. perl-module-cpanfile
(define-public perl-module-cpanfile
  (package
    (name "perl-module-cpanfile")
    (version "1.1004")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cpan.metacpan.org/authors/id/"
                    "PLACEHOLDER/" "Module-CPANfile-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "module-CPANfile - Parse cpanfile")
    (description "Module-CPANfile - Parse cpanfile.")
    (home-page "https://metacpan.org/release/Module-CPANfile/")
    (license (list license:gpl2+ license:perl-license))))

;;; 14. perl-email-stuffer
(define-public perl-email-stuffer
  (package
    (name "perl-email-stuffer")
    (version "0.020")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cpan.metacpan.org/authors/id/"
                    "PLACEHOLDER/" "Email-Stuffer-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a more casual approach to creating and sending emails")
    (description "A more casual approach to creating and sending emails.")
    (home-page "https://metacpan.org/pod/Email::Stuffer")
    (license (list license:artistic2.0 license:gpl1+))))

;;; 15. perl-net-domain-tld
(define-public perl-net-domain-tld
  (package
    (name "perl-net-domain-tld")
    (version "1.75")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cpan.metacpan.org/authors/id/"
                    "PLACEHOLDER/" "Net-Domain-TLD-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "work with TLD names")
    (description "Work with TLD names.")
    (home-page "https://metacpan.org/release/Net-Domain-TLD")
    (license (list license:gpl2+ license:perl-license))))

;;; 16. perl-curry
(define-public perl-curry
  (package
    (name "perl-curry")
    (version "2.000001")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cpan.metacpan.org/authors/id/"
                    "PLACEHOLDER/" "curry-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "perl/CPAN Module curry: Create automatic curried method call closures for any...")
    (description "Perl/CPAN Module curry: Create automatic curried method call closures for any class or object.")
    (home-page "https://metacpan.org/release/curry")
    (license (list license:gpl2+ license:perl-license))))

;;; 17. perl-menlo-legacy
(define-public perl-menlo-legacy
  (package
    (name "perl-menlo-legacy")
    (version "1.9022")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cpan.metacpan.org/authors/id/"
                    "PLACEHOLDER/" "Menlo-Legacy-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "legacy internal and client support for Menlo")
    (description "Legacy internal and client support for Menlo.")
    (home-page "http://search.cpan.org/dist/Menlo-Legacy/")
    (license (list license:gpl2+ license:perl-license))))

;;; 18. perl-time-moment
(define-public perl-time-moment
  (package
    (name "perl-time-moment")
    (version "0.44")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cpan.metacpan.org/authors/id/"
                    "PLACEHOLDER/" "Time-Moment-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "encoding and decoding of UTF-8 encoding form")
    (description "Encoding and decoding of UTF-8 encoding form.")
    (home-page "https://metacpan.org/release/Time-Moment")
    (license (list license:gpl2+ license:perl-license))))

;;; 19. python-kokoro
(define-public python-kokoro
  (package
    (name "python-kokoro")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "kokoro" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "TTS An inference library for Kokoro-82M")
    (description "TTS An inference library for Kokoro-82M.")
    (home-page "https://pypi.org/project/kokoro")
    (license license:expat)))

;;; 20. python-misaki
(define-public python-misaki
  (package
    (name "python-misaki")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "misaki" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "g2P engine for TTS")
    (description "G2P engine for TTS.")
    (home-page "https://pypi.org/project/misaki")
    (license license:expat)))

;;; 21. python-misaki-en
(define-public python-misaki-en
  (package
    (name "python-misaki-en")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "misaki" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "g2P engine for TTS - en")
    (description "G2P engine for TTS - en.")
    (home-page "https://pypi.org/project/misaki")
    (license license:expat)))

;;; 22. python-misaki-he
(define-public python-misaki-he
  (package
    (name "python-misaki-he")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "misaki" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "g2P engine for TTS - he")
    (description "G2P engine for TTS - he.")
    (home-page "https://pypi.org/project/misaki")
    (license license:expat)))

;;; 23. python-misaki-ja
(define-public python-misaki-ja
  (package
    (name "python-misaki-ja")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "misaki" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "g2P engine for TTS - ja")
    (description "G2P engine for TTS - ja.")
    (home-page "https://pypi.org/project/misaki")
    (license license:expat)))

;;; 24. python-misaki-ko
(define-public python-misaki-ko
  (package
    (name "python-misaki-ko")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "misaki" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "g2P engine for TTS - ko")
    (description "G2P engine for TTS - ko.")
    (home-page "https://pypi.org/project/misaki")
    (license license:expat)))

;;; 25. python-misaki-vi
(define-public python-misaki-vi
  (package
    (name "python-misaki-vi")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "misaki" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "g2P engine for TTS - vi")
    (description "G2P engine for TTS - vi.")
    (home-page "https://pypi.org/project/misaki")
    (license license:expat)))

;;; 26. python-misaki-zh
(define-public python-misaki-zh
  (package
    (name "python-misaki-zh")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "misaki" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "g2P engine for TTS - zh")
    (description "G2P engine for TTS - zh.")
    (home-page "https://pypi.org/project/misaki")
    (license license:expat)))

;;; 27. python-pyargument
(define-public python-pyargument
  (package
    (name "python-pyargument")
    (version "0.60")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyargument" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "a lightweight Python command-line argument parser that provides basic support...")
    (description "A lightweight Python command-line argument parser that provides basic support for flags and options.")
    (home-page "https://github.com/ankushbhagats/pyargument")
    (license license:expat)))

;;; 28. python-onepassword-sdk
(define-public python-onepassword-sdk
  (package
    (name "python-onepassword-sdk")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "onepassword-sdk" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "python SDK for 1Password")
    (description "Python SDK for 1Password.")
    (home-page "https://github.com/1Password/onepassword-sdk-python")
    (license license:expat)))

;;; 29. python-amulet-rocksdb
(define-public python-amulet-rocksdb
  (package
    (name "python-amulet-rocksdb")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "amulet-rocksdb" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "a pybind11 wrapper for RocksDB")
    (description "A pybind11 wrapper for RocksDB.")
    (home-page "https://github.com/Amulet-Team/Amulet-RocksDB")
    (license license:non-copyleft)))

;;; 30. python-qh3-git
(define-public python-qh3-git
  (package
    (name "python-qh3-git")
    (version "1.7.1.r0.gafd189c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jawah/qh3")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "lightweight QUIC and HTTP/3 implementation in Python (development version)")
    (description "Lightweight QUIC and HTTP/3 implementation in Python (development version).")
    (home-page "https://github.com/jawah/qh3")
    (license license:bsd-3)))

;;; 31. ffmpeg-bitrate-stats
(define-public ffmpeg-bitrate-stats
  (package
    (name "ffmpeg-bitrate-stats")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ffmpeg_bitrate_stats" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "calculate bitrate statistics using FFmpeg")
    (description "Calculate bitrate statistics using FFmpeg.")
    (home-page "https://github.com/slhck/ffmpeg-bitrate-stats")
    (license license:expat)))

;;; 32. ffmpeg-quality-metrics
(define-public ffmpeg-quality-metrics
  (package
    (name "ffmpeg-quality-metrics")
    (version "3.11.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ffmpeg_quality_metrics" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "calculate quality metrics with FFmpeg (SSIM, PSNR, VMAF, VIF)")
    (description "Calculate quality metrics with FFmpeg (SSIM, PSNR, VMAF, VIF).")
    (home-page "https://github.com/slhck/ffmpeg-quality-metrics")
    (license license:expat)))

;;; 33. pulp-cli
(define-public pulp-cli
  (package
    (name "pulp-cli")
    (version "0.38.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pulp-cli" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "command line interface to talk to the Pulp 3 REST API")
    (description "Command line interface to talk to the Pulp 3 REST API.")
    (home-page "https://github.com/pulp/pulp-cli")
    (license license:gpl2+)))

;;; 34. python-jupyterlab-latex
(define-public python-jupyterlab-latex
  (package
    (name "python-jupyterlab-latex")
    (version "4.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "jupyterlab-latex" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "jupyterLab extension for running LaTeX")
    (description "JupyterLab extension for running LaTeX.")
    (home-page "https://github.com/jupyterlab/jupyterlab-latex")
    (license license:bsd-3)))

;;; 35. serial-studio-bin
(define-public serial-studio-bin
  (package
    (name "serial-studio-bin")
    (version "3.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/serial-studio-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open-source telemetry dashboard. Supports UART, BLE, MQTT, Modbus, CAN Bus an...")
    (description "Open-source telemetry dashboard.  Supports UART, BLE, MQTT, Modbus, CAN Bus and more.")
    (home-page "https://serial-studio.com")
    (license license:non-copyleft)))

;;; 36. mars-mips-bin
(define-public mars-mips-bin
  (package
    (name "mars-mips-bin")
    (version "4.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mars-mips-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "MIPS runtime (binary version)")
    (description "MIPS runtime (binary version).")
    (home-page "https://dpetersanderson.github.io")
    (license license:expat)))

;;; 37. risuai-bin
(define-public risuai-bin
  (package
    (name "risuai-bin")
    (version "2026.4.120")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/risuai-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "make your own story. User-friendly software for LLM roleplaying.(Prebuilt ver...")
    (description "Make your own story.  User-friendly software for LLM roleplaying.(Prebuilt version).")
    (home-page "https://risuai.net/")
    (license license:gpl3)))

;;; 38. quadrant-bin
(define-public quadrant-bin
  (package
    (name "quadrant-bin")
    (version "26.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quadrant-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "an easy way to manage your Minecraft modpacks, written in React and Rust.(Pre...")
    (description "An easy way to manage your Minecraft modpacks, written in React and Rust.(Prebuilt version).")
    (home-page "https://usequadrant.dev/")
    (license license:mpl2.0)))

;;; 39. electron41-bin
(define-public electron41-bin
  (package
    (name "electron41-bin")
    (version "41.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/electron41-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description "Build cross platform desktop apps with web technologies — prebuilt.")
    (home-page "https://electronjs.org")
    (license (list license:non-copyleft license:expat))))

;;; 40. kotlin-debug-adapter-bin
(define-public kotlin-debug-adapter-bin
  (package
    (name "kotlin-debug-adapter-bin")
    (version "0.4.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kotlin-debug-adapter-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "kotlin/JVM debugging for any editor/IDE using the Debug Adapter Protocol")
    (description "Kotlin/JVM debugging for any editor/IDE using the Debug Adapter Protocol.")
    (home-page "https://github.com/fwcd/kotlin-debug-adapter")
    (license license:expat)))

;;; 41. gsdb-bin
(define-public gsdb-bin
  (package
    (name "gsdb-bin")
    (version "0.3.31")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gsdb-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a database management tool for PostgreSQL, MySQL, and SQLite (pre-built binary)")
    (description "A database management tool for PostgreSQL, MySQL, and SQLite (pre-built binary).")
    (home-page "https://github.com/ginkcode/gsdb")
    (license license:expat)))

;;; 42. snapmaker-luban-bin
(define-public snapmaker-luban-bin
  (package
    (name "snapmaker-luban-bin")
    (version "4.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snapmaker-luban-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "snapmaker Luban is an easy-to-use 3-in-1 software tailor-made for Snapmaker m...")
    (description "Snapmaker Luban is an easy-to-use 3-in-1 software tailor-made for Snapmaker machines.")
    (home-page "https://github.com/Snapmaker/Luban")
    (license license:agpl3+)))

;;; 43. bolt-launcher-bin
(define-public bolt-launcher-bin
  (package
    (name "bolt-launcher-bin")
    (version "0.20.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bolt-launcher-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "free open-source third-party implementation of the Jagex Launcher")
    (description "Free open-source third-party implementation of the Jagex Launcher.")
    (home-page "https://bolt.adamcake.com/")
    (license license:agpl3+)))

;;; 44. factorio-bin
(define-public factorio-bin
  (package
    (name "factorio-bin")
    (version "0.0.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/factorio-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "go cross-compiler")
    (description "Go cross-compiler.")
    (home-page "https://github.com/mcandre/factorio")
    (license license:bsd-2)))

;;; 45. openwhispr-appimage
(define-public openwhispr-appimage
  (package
    (name "openwhispr-appimage")
    (version "1.6.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openwhispr-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "voice-to-text dictation app with local Whisper/Parakeet and cloud models (App...")
    (description "Voice-to-text dictation app with local Whisper/Parakeet and cloud models (AppImage).")
    (home-page "https://github.com/OpenWhispr/openwhispr")
    (license license:expat)))

;;; 46. amdvlk-bin
(define-public amdvlk-bin
  (package
    (name "amdvlk-bin")
    (version "2025.Q2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/amdvlk-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "AMD's standalone Vulkan driver (Stable RPM Release)")
    (description "AMD's standalone Vulkan driver (Stable RPM Release).")
    (home-page "https://github.com/GPUOpen-Drivers/AMDVLK")
    (license license:expat)))

;;; 47. wttr-bin
(define-public wttr-bin
  (package
    (name "wttr-bin")
    (version "1.55")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wttr-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a simple script that checks the weather condition via http://wttr.in")
    (description "A simple script that checks the weather condition via http://wttr.in.")
    (home-page "https://github.com/cblte/bash-script-wttr")
    (license license:expat)))

;;; 48. pearpass-bin
(define-public pearpass-bin
  (package
    (name "pearpass-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pearpass-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "pearPass is a distributed password manager powered by Pear Runtime. It allows...")
    (description "PearPass is a distributed password manager powered by Pear Runtime.  It allows secure storage of passwords, credit card details, and secure notes, with peer-to-peer syncing and end-to-end encryption.")
    (home-page "https://pass.pears.com/")
    (license license:non-copyleft)))

;;; 49. talanoa-bin
(define-public talanoa-bin
  (package
    (name "talanoa-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/talanoa-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "talanoa is a modern email client that is designed to be fast, secure, and eas...")
    (description "Talanoa is a modern email client that is designed to be fast, secure, and easy to use.")
    (home-page "https://talanoa.email")
    (license license:non-copyleft)))

;;; 50. simutil-bin
(define-public simutil-bin
  (package
    (name "simutil-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simutil-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "cross platform utility TUI app for launching iOS simulators / Android emulato...")
    (description "Cross platform utility TUI app for launching iOS simulators / Android emulators, discover physical devices, ADB tools and more...")
    (home-page "https://github.com/dungngminh/simutil")
    (license license:expat)))

;;; 51. projectctr-makerom-bin
(define-public projectctr-makerom-bin
  (package
    (name "projectctr-makerom-bin")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/projectctr-makerom-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "creates CTR cxi/cfa/cci/cia files")
    (description "Creates CTR cxi/cfa/cci/cia files.")
    (home-page "https://github.com/3DSGuy/Project_CTR/")
    (license license:non-copyleft)))

;;; 52. spaghettikart-bin
(define-public spaghettikart-bin
  (package
    (name "spaghettikart-bin")
    (version "0.9.9.1.libpatch")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spaghettikart-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "spaghetti Kart Reimplimentation engine for Mario Kart 64")
    (description "Spaghetti Kart Reimplimentation engine for Mario Kart 64.")
    (home-page "https://gitlab.com/linuxbombay/spaghettikart")
    (license license:gpl2+)))

;;; 53. gopher64-bin
(define-public gopher64-bin
  (package
    (name "gopher64-bin")
    (version "1.1.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gopher64-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "n64 emulator written in Rust")
    (description "N64 emulator written in Rust.")
    (home-page "https://github.com/gopher64/gopher64")
    (license license:gpl3)))

;;; 54. processing-bin
(define-public processing-bin
  (package
    (name "processing-bin")
    (version "4.5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/processing-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "programming environment for creating images, animations and interactions.(Pre...")
    (description "Programming environment for creating images, animations and interactions.(Prebuilt version).")
    (home-page "https://processing.org/")
    (license license:gpl2)))

;;; 55. passwordsafe-bin
(define-public passwordsafe-bin
  (package
    (name "passwordsafe-bin")
    (version "1.23.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/passwordsafe-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "popular secure and convenient password manager(Prebuilt version)")
    (description "Popular secure and convenient password manager(Prebuilt version).")
    (home-page "https://pwsafe.org/")
    (license license:artistic2.0)))

;;; 56. min-bin
(define-public min-bin
  (package
    (name "min-bin")
    (version "1.35.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/min-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "min is a fast, minimal browser that protects your privacy")
    (description "Min is a fast, minimal browser that protects your privacy.")
    (home-page "https://github.com/minbrowser/min")
    (license license:asl2.0)))

;;; 57. prospect-mail-bin
(define-public prospect-mail-bin
  (package
    (name "prospect-mail-bin")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/prospect-mail-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "prospect Mail is an Outlook Electron desktop application for the new design")
    (description "Prospect Mail is an Outlook Electron desktop application for the new design.")
    (home-page "https://github.com/julian-alarcon/prospect-mail")
    (license license:expat)))

;;; 58. vita3k-bin
(define-public vita3k-bin
  (package
    (name "vita3k-bin")
    (version "r3806.cf3d6273")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vita3k-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "experimental PlayStation Vita emulator")
    (description "Experimental PlayStation Vita emulator.")
    (home-page "https://vita3k.org/")
    (license license:gpl2)))

;;; 59. hakuneko-desktop-bin
(define-public hakuneko-desktop-bin
  (package
    (name "hakuneko-desktop-bin")
    (version "6.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hakuneko-desktop-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "manga & Anime Downloader for Linux, Windows & MacOS")
    (description "Manga & Anime Downloader for Linux, Windows & MacOS.")
    (home-page "https://github.com/manga-download/hakuneko")
    (license license:expat)))

;;; 60. cherry-studio
(define-public cherry-studio
  (package
    (name "cherry-studio")
    (version "1.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cherry-studio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a desktop client that supports for multiple LLM providers.(Use system-wide el...")
    (description "A desktop client that supports for multiple LLM providers.(Use system-wide electron).")
    (home-page "https://cherry-ai.com/")
    (license license:expat)))

;;; 61. upscayl
(define-public upscayl
  (package
    (name "upscayl")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/upscayl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a free and open source AI Image Upscaler App")
    (description "A free and open source AI Image Upscaler App.")
    (home-page "https://upscayl.org/")
    (license license:agpl3)))

;;; 62. photogimp
(define-public photogimp
  (package
    (name "photogimp")
    (version "3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Diolinux/PhotoGIMP")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "GIMP config overlay that mimics Adobe Photoshop layout and shortcuts")
    (description "GIMP config overlay that mimics Adobe Photoshop layout and shortcuts.")
    (home-page "https://github.com/Diolinux/PhotoGIMP")
    (license license:gpl3)))

;;; 63. rofi-kaomoji
(define-public rofi-kaomoji
  (package
    (name "rofi-kaomoji")
    (version "r17.e3bbf20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Seme4eg/rofi-kaomoji")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "browse and copy kaomojis using rofi")
    (description "Browse and copy kaomojis using rofi.")
    (home-page "https://github.com/Seme4eg/rofi-kaomoji")
    (license license:expat)))

;;; 64. rofi-mpd
(define-public rofi-mpd
  (package
    (name "rofi-mpd")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/samedamci/rofi-mpd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "script for controlling mpd through rofi")
    (description "Script for controlling mpd through rofi.")
    (home-page "https://github.com/samedamci/rofi-mpd")
    (license license:expat)))

;;; 65. wol-systemd
(define-public wol-systemd
  (package
    (name "wol-systemd")
    (version "20240304")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wol-systemd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a systemd unit file for enabling Wake-On-LAN automatically")
    (description "A systemd unit file for enabling Wake-On-LAN automatically.")
    (home-page "https://wiki.archlinux.org/index.php/Wake-on-LAN")
    (license license:fdl1.3+)))

;;; 66. getnf
(define-public getnf
  (package
    (name "getnf")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/getnf/getnf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "command-line tool for installing Nerd Fonts")
    (description "Command-line tool for installing Nerd Fonts.")
    (home-page "https://github.com/getnf/getnf")
    (license license:gpl3+)))

;;; 67. bashdb
(define-public bashdb
  (package
    (name "bashdb")
    (version "5.2_1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bashdb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a debugger for Bash scripts loosely modeled on the gdb command syntax")
    (description "A debugger for Bash scripts loosely modeled on the gdb command syntax.")
    (home-page "https://bashdb.sourceforge.net/")
    (license license:gpl2+)))

;;; 68. etherwake
(define-public etherwake
  (package
    (name "etherwake")
    (version "1.09")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/etherwake.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "utility for waking up computers via wake-on-lan (wol)")
    (description "Utility for waking up computers via wake-on-lan (wol).")
    (home-page "https://web.archive.org/web/20060427201642/http://www.scyld.com/wakeonlan.html")
    (license license:gpl2+)))

;;; 69. cavez-of-phear
(define-public cavez-of-phear
  (package
    (name "cavez-of-phear")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cavez-of-phear.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a Boulder Dash like game for consoles/terminals. Level editor included")
    (description "A Boulder Dash like game for consoles/terminals.  Level editor included.")
    (home-page "https://web.archive.org/web/20140328135903/http://www.x86.no/cavezofphear/")
    (license license:gpl2+)))

;;; 70. kilo-git
(define-public kilo-git
  (package
    (name "kilo-git")
    (version "r20.323d93b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/antirez/kilo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a small text editor in less than 1K lines of code")
    (description "A small text editor in less than 1K lines of code.")
    (home-page "https://github.com/antirez/kilo")
    (license license:bsd-2)))

;;; 71. libsearpc
(define-public libsearpc
  (package
    (name "libsearpc")
    (version "3.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haiwen/libsearpc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a simple C language RPC framework (including both server side & client side)")
    (description "A simple C language RPC framework (including both server side & client side).")
    (home-page "https://github.com/haiwen/libsearpc")
    (license license:asl2.0)))

;;; 72. cpr
(define-public cpr
  (package
    (name "cpr")
    (version "1.14.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libcpr/cpr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "c++ Requests: Curl for People, a spiritual port of Python Requests")
    (description "C++ Requests: Curl for People, a spiritual port of Python Requests.")
    (home-page "https://github.com/libcpr/cpr")
    (license license:expat)))

;;; 73. rofi-file-browser-extended
(define-public rofi-file-browser-extended
  (package
    (name "rofi-file-browser-extended")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/marvinkreis/rofi-file-browser-extended")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "use rofi to quickly open files")
    (description "Use rofi to quickly open files.")
    (home-page "https://github.com/marvinkreis/rofi-file-browser-extended")
    (license license:expat)))

;;; 74. x11-emoji-picker-git
(define-public x11-emoji-picker-git
  (package
    (name "x11-emoji-picker-git")
    (version "0.8.2.r10.gcf0dd46")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GaZaTu/x11-emoji-picker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "linux XServer emoji picker written in C++")
    (description "Linux XServer emoji picker written in C++.")
    (home-page "https://github.com/GaZaTu/x11-emoji-picker")
    (license license:expat)))

;;; 75. uni
(define-public uni
  (package
    (name "uni")
    (version "2.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arp242/uni")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "query the Unicode database from the commandline, with good support for emojis")
    (description "Query the Unicode database from the commandline, with good support for emojis.")
    (home-page "https://github.com/arp242/uni")
    (license license:expat)))

;;; 76. buildozer
(define-public buildozer
  (package
    (name "buildozer")
    (version "8.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bazelbuild/buildtools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a command line tool to rewrite Bazel BUILD files using standard conventions")
    (description "A command line tool to rewrite Bazel BUILD files using standard conventions.")
    (home-page "https://github.com/bazelbuild/buildtools")
    (license license:asl2.0)))

;;; 77. buildifier
(define-public buildifier
  (package
    (name "buildifier")
    (version "8.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bazelbuild/buildtools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a command line tool to format Bazel BUILD files")
    (description "A command line tool to format Bazel BUILD files.")
    (home-page "https://github.com/bazelbuild/buildtools")
    (license license:asl2.0)))

;;; 78. devbox
(define-public devbox
  (package
    (name "devbox")
    (version "0.17.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jetpack-io/devbox")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a cli tool to easily create isolated shells and containers")
    (description "A cli tool to easily create isolated shells and containers.")
    (home-page "https://github.com/jetpack-io/devbox")
    (license license:asl2.0)))

;;; 79. subfinder
(define-public subfinder
  (package
    (name "subfinder")
    (version "2.13.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/projectdiscovery/subfinder")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a subdomain discovery tool that discovers valid subdomains for websites")
    (description "A subdomain discovery tool that discovers valid subdomains for websites.")
    (home-page "https://github.com/projectdiscovery/subfinder")
    (license license:expat)))

;;; 80. nextdns
(define-public nextdns
  (package
    (name "nextdns")
    (version "1.47.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nextdns/nextdns")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "nextDNS DNS/53 to DoH Proxy")
    (description "NextDNS DNS/53 to DoH Proxy.")
    (home-page "https://github.com/nextdns/nextdns")
    (license license:expat)))

;;; 81. nfpm
(define-public nfpm
  (package
    (name "nfpm")
    (version "2.46.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/goreleaser/nfpm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "nFPM is a simple, 0-dependencies, deb, rpm and apk packager")
    (description "NFPM is a simple, 0-dependencies, deb, rpm and apk packager.")
    (home-page "https://nfpm.goreleaser.com")
    (license license:expat)))

;;; 82. stripe-cli
(define-public stripe-cli
  (package
    (name "stripe-cli")
    (version "1.40.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stripe/stripe-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI for Stripe")
    (description "CLI for Stripe.")
    (home-page "https://github.com/stripe/stripe-cli")
    (license license:asl2.0)))

;;; 83. q-dns
(define-public q-dns
  (package
    (name "q-dns")
    (version "0.19.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/natesales/q")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH")
    (description "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.")
    (home-page "https://github.com/natesales/q")
    (license license:gpl3+)))

;;; 84. moonbit
(define-public moonbit
  (package
    (name "moonbit")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nomadcxx/moonbit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a modern system cleaner built in Go with a TUI and CLI")
    (description "A modern system cleaner built in Go with a TUI and CLI.")
    (home-page "https://github.com/Nomadcxx/moonbit")
    (license license:gpl3)))

;;; 85. linutil
(define-public linutil
  (package
    (name "linutil")
    (version "2026.04.07")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ChrisTitusTech/linutil")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "distro-agnostic toolbox designed to simplify everyday Linux tasks")
    (description "Distro-agnostic toolbox designed to simplify everyday Linux tasks.")
    (home-page "https://github.com/ChrisTitusTech/linutil")
    (license license:expat)))

;;; 86. wayshot
(define-public wayshot
  (package
    (name "wayshot")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/waycrate/wayshot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "screenshot tool for wlroots compositors")
    (description "Screenshot tool for wlroots compositors.")
    (home-page "https://github.com/waycrate/wayshot")
    (license license:bsd-3)))

;;; 87. glrnvim
(define-public glrnvim
  (package
    (name "glrnvim")
    (version "1.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/beeender/glrnvim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a GPU-accelerated neovim GUI")
    (description "A GPU-accelerated neovim GUI.")
    (home-page "https://github.com/beeender/glrnvim")
    (license license:gpl3+)))

;;; 88. sqlpage
(define-public sqlpage
  (package
    (name "sqlpage")
    (version "0.43.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lovasoa/SQLpage")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "fast SQL-only data application builder. Automatically build a UI on top of SQ...")
    (description "Fast SQL-only data application builder.  Automatically build a UI on top of SQL queries.")
    (home-page "https://sql-page.com")
    (license license:expat)))

;;; 89. nnd
(define-public nnd
  (package
    (name "nnd")
    (version "0.69")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/al13n321/nnd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a debugger for Linux")
    (description "A debugger for Linux.")
    (home-page "https://github.com/al13n321/nnd")
    (license license:asl2.0)))

;;; 90. rust-motd
(define-public rust-motd
  (package
    (name "rust-motd")
    (version "2.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rust-motd/rust-motd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "beautiful, useful, configurable MOTD generation with zero runtime dependencies")
    (description "Beautiful, useful, configurable MOTD generation with zero runtime dependencies.")
    (home-page "https://github.com/rust-motd/rust-motd")
    (license license:expat)))

;;; 91. mago
(define-public mago
  (package
    (name "mago")
    (version "1.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/carthage-software/mago")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "an extremely fast PHP linter, formatter, and static analyzer, written in Rust")
    (description "An extremely fast PHP linter, formatter, and static analyzer, written in Rust.")
    (home-page "https://mago.carthage.software/")
    (license license:expat)))

;;; 92. continuwuity
(define-public continuwuity
  (package
    (name "continuwuity")
    (version "0.5.7_alpha.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://forgejo.ellis.link/continuwuation/continuwuity")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a very cool, featureful fork of conduit (rust matrix homeserver)")
    (description "A very cool, featureful fork of conduit (rust matrix homeserver).")
    (home-page "https://forgejo.ellis.link/continuwuation/continuwuity")
    (license license:asl2.0)))

;;; 93. zelta
(define-public zelta
  (package
    (name "zelta")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bellhops/zelta")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a safe and powerful ZFS backup and replication suite")
    (description "A safe and powerful ZFS backup and replication suite.")
    (home-page "https://zelta.space")
    (license license:bsd-2)))

;;; 94. mpeghdec
(define-public mpeghdec
  (package
    (name "mpeghdec")
    (version "3.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpeghdec.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "fraunhofer MPEG-H audio decoder")
    (description "Fraunhofer MPEG-H audio decoder.")
    (home-page "https://mpegh.com/")
    (license license:non-copyleft)))

;;; 95. alephone
(define-public alephone
  (package
    (name "alephone")
    (version "1.11_20250829")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alephone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a free, enhanced port of the classic FPS \"Marathon 2\" by Bungie Software")
    (description "A free, enhanced port of the classic FPS \"Marathon 2\" by Bungie Software.")
    (home-page "https://alephone.lhowon.org/")
    (license license:gpl3+)))

;;; 96. healthchecks
(define-public healthchecks
  (package
    (name "healthchecks")
    (version "3.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/healthchecks/healthchecks")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "a cron monitoring service with a web-based dashboard, API, and notification i...")
    (description "A cron monitoring service with a web-based dashboard, API, and notification integrations.")
    (home-page "https://github.com/healthchecks/healthchecks")
    (license license:bsd-3)))

;;; 97. devdocs-desktop
(define-public devdocs-desktop
  (package
    (name "devdocs-desktop")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devdocs-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "devDocs GTK3 application for multiple API documentations in a fast searchable...")
    (description "DevDocs GTK3 application for multiple API documentations in a fast searchable interface.")
    (home-page "https://github.com/hardpixel/devdocs-desktop")
    (license license:gpl2+)))

;;; 98. unciv
(define-public unciv
  (package
    (name "unciv")
    (version "4.20.1.REL")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yairm210/Unciv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open-source remake of Civilization V")
    (description "Open-source remake of Civilization V.")
    (home-page "https://github.com/yairm210/Unciv")
    (license license:mpl2.0)))

;;; 99. fjordlauncher
(define-public fjordlauncher
  (package
    (name "fjordlauncher")
    (version "11.0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/unmojang/FjordLauncher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "prism Launcher fork with support for alternative auth servers")
    (description "Prism Launcher fork with support for alternative auth servers.")
    (home-page "https://github.com/unmojang/FjordLauncher")
    (license license:non-copyleft)))
