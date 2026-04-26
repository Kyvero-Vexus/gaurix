;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260426j
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260426j)
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
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            electron-fiddle-blur-me-not
            1password-blur-me-not
            php83-xsl
            php83-xmlwriter
            php83-xmlreader
            php83-tokenizer
            php83-tidy
            php83-sqlite
            php83-sodium
            php83-sockets
            php83-pgsql
            php83-openssl
            php83-mysql
            php83-mbstring
            php83-intl
            php83-iconv
            php83-gd
            php83-fpm
            php83-curl
            php83-apache
            firejail-pacman-hook
            grml-systemd-boot
            nginx-unit-php
            nginx-unit-perl
            nginx-unit-nodejs
            nginx-unit-go
            bdsup2subpp-git
            brother-dcp-9020cdw
            tahoma2d-git
            simple-signer-git
            ocrodjvu-python3-git
            itgmania
            gpodder2go-git
            gourmand-git
            fritzbox-tools
            fnlock
            bandcamp-dl-git
            jabref-git
            rtorrent-ipv6
            gamehub-git
            adjust-pci-latency-git
            uiua-git
            masscanned
            archuseriso
            lokinet
            mlat-client-git
            qtile-extras-git
            k380-function-keys-conf
            piaware-git
            maui-shell-git
            mandelbulber2-opencl-git
            postgresql15-libs
            postgresql15-docs
            ovcs-git
            olympus-git
            iio-hyprland-git
            aegisub-japan7-git
            kf6-servicemenus-pdftools
            scribus-unstable
            pianobooster-qt6-git
            gnome-shell-extension-legacy-theme-auto-switcher-git
            fcitx5-cskk-git
            drm-lease-manager-git
            ddgpt-git
            art-rawconverter
            sfxr-qt-git
            sqriptor-git
            qbpm-git
            cohesion-git
            eudic
            astroimagej
            qpxtool-unofficial-git
            powertop-to-tmpfile
            phpunit
            devolo-dlan-cockpit
            soundux-git
            armorpaint
            tumbler-stl-thumbnailer
            python-flask-sockets
            sncli
            phive
            lazydocker-git
            spf-tools
            smoldyn
            protoc-gen-twirp
            postallow
            niji-git
            nautilus-mediainfo-gtk4
            haveibeenpwned-downloader-git
            freedroid
            depthcharge-tools
            candlelang-git
            beanquery-git
            ashes-2063
            ferretdb
            tcpping
            frogatto
            amdgpu-fan
            sway-audio-idle-inhibit-git
            labwc-menu-generator-git
            zed-preview
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; electron-fiddle-blur-me-not --- auto-enable Wayland (ozone) for electron-fiddle
(define-public electron-fiddle-blur-me-not
  (package
    (name "electron-fiddle-blur-me-not")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/electron-fiddle-blur-me-not.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "auto-enable Wayland (ozone) for electron-fiddle")
    (description "Auto-enable Wayland (ozone) for electron-fiddle.")
    (home-page "https://aur.archlinux.org/pkgbase/electron-blur-me-not")
    (license license:asl2.0)))

;;; 1password-blur-me-not --- auto-enable Wayland (ozone) for 1password
(define-public 1password-blur-me-not
  (package
    (name "1password-blur-me-not")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/1password-blur-me-not.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "auto-enable Wayland (ozone) for 1password")
    (description "Auto-enable Wayland (ozone) for 1password.")
    (home-page "https://aur.archlinux.org/pkgbase/electron-blur-me-not")
    (license license:asl2.0)))

;;; php83-xsl --- PHP 8.3 xsl extension
(define-public php83-xsl
  (package
    (name "php83-xsl")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-xsl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 xsl extension")
    (description "The xsl extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-xmlwriter --- PHP 8.3 xmlwriter extension
(define-public php83-xmlwriter
  (package
    (name "php83-xmlwriter")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-xmlwriter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 xmlwriter extension")
    (description "The xmlwriter extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-xmlreader --- PHP 8.3 xmlreader extension
(define-public php83-xmlreader
  (package
    (name "php83-xmlreader")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-xmlreader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 xmlreader extension")
    (description "The xmlreader extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-tokenizer --- PHP 8.3 tokenizer extension
(define-public php83-tokenizer
  (package
    (name "php83-tokenizer")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-tokenizer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 tokenizer extension")
    (description "The tokenizer extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-tidy --- PHP 8.3 tidy extension
(define-public php83-tidy
  (package
    (name "php83-tidy")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-tidy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 tidy extension")
    (description "The tidy extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-sqlite --- PHP 8.3 sqlite extension
(define-public php83-sqlite
  (package
    (name "php83-sqlite")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-sqlite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 sqlite extension")
    (description "The sqlite extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-sodium --- PHP 8.3 sodium extension
(define-public php83-sodium
  (package
    (name "php83-sodium")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-sodium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 sodium extension")
    (description "The sodium extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-sockets --- PHP 8.3 sockets extension
(define-public php83-sockets
  (package
    (name "php83-sockets")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-sockets.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 sockets extension")
    (description "The sockets extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-pgsql --- PHP 8.3 pgsql extension
(define-public php83-pgsql
  (package
    (name "php83-pgsql")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-pgsql.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 pgsql extension")
    (description "The pgsql extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-openssl --- PHP 8.3 openssl extension
(define-public php83-openssl
  (package
    (name "php83-openssl")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-openssl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 openssl extension")
    (description "The openssl extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-mysql --- PHP 8.3 mysql extension
(define-public php83-mysql
  (package
    (name "php83-mysql")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-mysql.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 mysql extension")
    (description "The mysql extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-mbstring --- PHP 8.3 mbstring extension
(define-public php83-mbstring
  (package
    (name "php83-mbstring")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-mbstring.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 mbstring extension")
    (description "The mbstring extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-intl --- PHP 8.3 intl extension
(define-public php83-intl
  (package
    (name "php83-intl")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-intl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 intl extension")
    (description "The intl extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-iconv --- PHP 8.3 iconv extension
(define-public php83-iconv
  (package
    (name "php83-iconv")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-iconv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 iconv extension")
    (description "The iconv extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-gd --- PHP 8.3 gd extension
(define-public php83-gd
  (package
    (name "php83-gd")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-gd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 gd extension")
    (description "The gd extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-fpm --- PHP 8.3 fpm extension
(define-public php83-fpm
  (package
    (name "php83-fpm")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-fpm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 fpm extension")
    (description "The fpm extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-curl --- PHP 8.3 curl extension
(define-public php83-curl
  (package
    (name "php83-curl")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-curl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 curl extension")
    (description "The curl extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; php83-apache --- PHP 8.3 apache extension
(define-public php83-apache
  (package
    (name "php83-apache")
    (version "8.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-apache.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP 8.3 apache extension")
    (description "The apache extension module for PHP 8.3.")
    (home-page "https://www.php.net/")
    (license license:php3.01)))

;;; firejail-pacman-hook --- pacman hook to update firejail profiles
(define-public firejail-pacman-hook
  (package
    (name "firejail-pacman-hook")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firejail-pacman-hook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pacman hook to update firejail profiles")
    (description "Pacman hook to automatically update Firejail profiles after package changes.")
    (home-page "https://firejail.wordpress.com/")
    (license license:gpl3+)))

;;; grml-systemd-boot --- systemd-boot configuration for Grml
(define-public grml-systemd-boot
  (package
    (name "grml-systemd-boot")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grml-systemd-boot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "systemd-boot configuration for Grml")
    (description "Systemd-boot configuration and integration for Grml live system.")
    (home-page "https://grml.org/")
    (license license:gpl3+)))

;;; nginx-unit-php --- NGINX Unit PHP language module
(define-public nginx-unit-php
  (package
    (name "nginx-unit-php")
    (version "1.32.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nginx-unit-php.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NGINX Unit PHP language module")
    (description "PHP language module for NGINX Unit application server.")
    (home-page "https://unit.nginx.org/")
    (license license:asl2.0)))

;;; nginx-unit-perl --- NGINX Unit Perl language module
(define-public nginx-unit-perl
  (package
    (name "nginx-unit-perl")
    (version "1.32.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nginx-unit-perl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NGINX Unit Perl language module")
    (description "Perl language module for NGINX Unit application server.")
    (home-page "https://unit.nginx.org/")
    (license license:asl2.0)))

;;; nginx-unit-nodejs --- NGINX Unit Node.js language module
(define-public nginx-unit-nodejs
  (package
    (name "nginx-unit-nodejs")
    (version "1.32.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nginx-unit-nodejs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NGINX Unit Node.js language module")
    (description "Node.js language module for NGINX Unit application server.")
    (home-page "https://unit.nginx.org/")
    (license license:asl2.0)))

;;; nginx-unit-go --- NGINX Unit Go language module
(define-public nginx-unit-go
  (package
    (name "nginx-unit-go")
    (version "1.32.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nginx-unit-go.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NGINX Unit Go language module")
    (description "Go language module for NGINX Unit application server.")
    (home-page "https://unit.nginx.org/")
    (license license:asl2.0)))

;;; bdsup2subpp-git --- Blu-ray SUP to SUB/IDX subtitle converter
(define-public bdsup2subpp-git
  (package
    (name "bdsup2subpp-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bdsup2subpp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Blu-ray SUP to SUB/IDX subtitle converter")
    (description "Convert Blu-ray SUP subtitles to SUB/IDX format for DVD authoring.")
    (home-page "https://github.com/amiceli/BDSup2SubPlusPlus")
    (license license:gpl3+)))

;;; brother-dcp-9020cdw --- Brother DCP-9020CDW printer driver
(define-public brother-dcp-9020cdw
  (package
    (name "brother-dcp-9020cdw")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-dcp-9020cdw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Brother DCP-9020CDW printer driver")
    (description "Printer driver for the Brother DCP-9020CDW color laser multifunction.")
    (home-page "https://www.brother.com/")
    (license license:nonfree)))

;;; tahoma2d-git --- 2D animation software
(define-public tahoma2d-git
  (package
    (name "tahoma2d-git")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tahoma2d-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "2D animation software")
    (description "Tahoma2D is an open-source 2D animation software forked from OpenToonz.")
    (home-page "https://tahoma2d.org/")
    (license license:bsd-3)))

;;; simple-signer-git --- simple GUI tool for signing PDF files
(define-public simple-signer-git
  (package
    (name "simple-signer-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simple-signer-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple GUI tool for signing PDF files")
    (description "Sign PDF files using a simple graphical user interface.")
    (home-page "https://github.com/nicokimmel/simple-signer")
    (license license:gpl3+)))

;;; ocrodjvu-python3-git --- OCR layer for DjVu documents
(define-public ocrodjvu-python3-git
  (package
    (name "ocrodjvu-python3-git")
    (version "0.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocrodjvu-python3-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "OCR layer for DjVu documents")
    (description "A wrapper for OCR systems to add text layers to DjVu documents.")
    (home-page "https://github.com/jwilk/ocrodjvu")
    (license license:gpl2+)))

;;; itgmania --- rhythm game engine based on StepMania
(define-public itgmania
  (package
    (name "itgmania")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/itgmania.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "rhythm game engine based on StepMania")
    (description "ITGmania is a rhythm game engine and fork of StepMania focused on timing accuracy.")
    (home-page "https://www.itgmania.com/")
    (license license:expat)))

;;; gpodder2go-git --- simple gpodder-compatible podcast sync server in Go
(define-public gpodder2go-git
  (package
    (name "gpodder2go-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpodder2go-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple gpodder-compatible podcast sync server in Go")
    (description "A gpodder-compatible podcast synchronization server written in Go.")
    (home-page "https://github.com/oxtyped/gpodder2go")
    (license license:agpl3)))

;;; gourmand-git --- recipe organizer and shopping list manager
(define-public gourmand-git
  (package
    (name "gourmand-git")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gourmand-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "recipe organizer and shopping list manager")
    (description "Gourmand is a recipe organizer and shopping list manager for GNOME.")
    (home-page "https://github.com/GourmandRecipeManager/gourmand")
    (license license:gpl2+)))

;;; fritzbox-tools --- command-line tools for FRITZ!Box routers
(define-public fritzbox-tools
  (package
    (name "fritzbox-tools")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fritzbox-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line tools for FRITZ!Box routers")
    (description "Command-line tools for configuring and querying AVM FRITZ!Box routers.")
    (home-page "https://avm.de/")
    (license license:gpl3+)))

;;; fnlock --- toggle Fn lock on ThinkPad keyboards
(define-public fnlock
  (package
    (name "fnlock")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fnlock.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "toggle Fn lock on ThinkPad keyboards")
    (description "Toggle the Fn lock state on Lenovo ThinkPad keyboards.")
    (home-page "https://github.com/nicman23/fnlock")
    (license license:gpl3+)))

;;; bandcamp-dl-git --- Bandcamp album downloader
(define-public bandcamp-dl-git
  (package
    (name "bandcamp-dl-git")
    (version "0.0.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bandcamp-dl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Bandcamp album downloader")
    (description "Command-line tool for downloading albums from Bandcamp.")
    (home-page "https://github.com/iheanyi/bandcamp-dl")
    (license license:isc)))

;;; jabref-git --- open-source bibliography reference manager
(define-public jabref-git
  (package
    (name "jabref-git")
    (version "5.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jabref-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source bibliography reference manager")
    (description "JabRef is an open-source bibliography reference manager using BibTeX/BibLaTeX.")
    (home-page "https://www.jabref.org/")
    (license license:expat)))

;;; rtorrent-ipv6 --- BitTorrent client with IPv6 support
(define-public rtorrent-ipv6
  (package
    (name "rtorrent-ipv6")
    (version "0.9.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rtorrent-ipv6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "BitTorrent client with IPv6 support")
    (description "rTorrent is a BitTorrent client for ncurses, patched with IPv6 support.")
    (home-page "https://github.com/rakshasa/rtorrent")
    (license license:gpl2+)))

;;; gamehub-git --- unified game library manager
(define-public gamehub-git
  (package
    (name "gamehub-git")
    (version "0.16.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gamehub-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "unified game library manager")
    (description "GameHub is a unified library for managing games from multiple launchers.")
    (home-page "https://github.com/tkashkin/GameHub")
    (license license:gpl3+)))

;;; adjust-pci-latency-git --- adjust PCI latency timer values
(define-public adjust-pci-latency-git
  (package
    (name "adjust-pci-latency-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adjust-pci-latency-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "adjust PCI latency timer values")
    (description "Adjust PCI latency timer values for better hardware performance.")
    (home-page "https://aur.archlinux.org/packages/adjust-pci-latency-git")
    (license license:gpl3+)))

;;; uiua-git --- stack-based array programming language
(define-public uiua-git
  (package
    (name "uiua-git")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uiua-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "stack-based array programming language")
    (description "Uiua is a stack-based array programming language with a unique glyph notation.")
    (home-page "https://www.uiua.org/")
    (license license:expat)))

;;; masscanned --- network responder to masscan probes
(define-public masscanned
  (package
    (name "masscanned")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/masscanned.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "network responder to masscan probes")
    (description "Masscanned is a network responder designed to interact with masscan probes.")
    (home-page "https://github.com/ivre/masscanned")
    (license license:gpl3+)))

;;; archuseriso --- tools for creating custom Arch Linux live images
(define-public archuseriso
  (package
    (name "archuseriso")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/archuseriso.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tools for creating custom Arch Linux live images")
    (description "Tools for creating custom Arch Linux live USB images and ISOs.")
    (home-page "https://github.com/laurent85v/archuseriso")
    (license license:gpl3+)))

;;; lokinet --- anonymous overlay network router
(define-public lokinet
  (package
    (name "lokinet")
    (version "0.9.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lokinet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "anonymous overlay network router")
    (description "Lokinet is an anonymous, decentralized overlay network built on LLARP.")
    (home-page "https://lokinet.org/")
    (license license:gpl3+)))

;;; mlat-client-git --- multilateration client for ADS-B receivers
(define-public mlat-client-git
  (package
    (name "mlat-client-git")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mlat-client-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "multilateration client for ADS-B receivers")
    (description "Client for multilateration-based aircraft tracking via ADS-B data.")
    (home-page "https://github.com/mutability/mlat-client")
    (license license:gpl3+)))

;;; qtile-extras-git --- extra widgets and extensions for Qtile
(define-public qtile-extras-git
  (package
    (name "qtile-extras-git")
    (version "0.27.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qtile-extras-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extra widgets and extensions for Qtile")
    (description "Additional widgets, layouts, and extensions for the Qtile window manager.")
    (home-page "https://github.com/elParaguayo/qtile-extras")
    (license license:expat)))

;;; k380-function-keys-conf --- configure function keys on Logitech K380
(define-public k380-function-keys-conf
  (package
    (name "k380-function-keys-conf")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/k380-function-keys-conf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "configure function keys on Logitech K380")
    (description "Configure function key behavior on Logitech K380 Bluetooth keyboard.")
    (home-page "https://github.com/jergusg/k380-function-keys-conf")
    (license license:gpl3+)))

;;; piaware-git --- FlightAware ADS-B data feeder
(define-public piaware-git
  (package
    (name "piaware-git")
    (version "9.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/piaware-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "FlightAware ADS-B data feeder")
    (description "FlightAware ADS-B aircraft tracking data feeder for PiAware network.")
    (home-page "https://flightaware.com/adsb/piaware/")
    (license license:bsd-3)))

;;; maui-shell-git --- convergent desktop shell by Maui Project
(define-public maui-shell-git
  (package
    (name "maui-shell-git")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maui-shell-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convergent desktop shell by Maui Project")
    (description "Maui Shell is a convergent desktop shell for desktop and mobile devices.")
    (home-page "https://mauikit.org/")
    (license license:lgpl2.1+)))

;;; mandelbulber2-opencl-git --- 3D fractal renderer with OpenCL support
(define-public mandelbulber2-opencl-git
  (package
    (name "mandelbulber2-opencl-git")
    (version "2.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mandelbulber2-opencl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "3D fractal renderer with OpenCL support")
    (description "Mandelbulber2 is a 3D fractal renderer with OpenCL GPU acceleration.")
    (home-page "https://mandelbulber.com/")
    (license license:gpl3+)))

;;; postgresql15-libs --- PostgreSQL 15 client libraries
(define-public postgresql15-libs
  (package
    (name "postgresql15-libs")
    (version "15.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/postgresql15-libs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PostgreSQL 15 client libraries")
    (description "Client libraries for PostgreSQL 15 relational database system.")
    (home-page "https://www.postgresql.org/")
    (license license:postgresql)))

;;; postgresql15-docs --- PostgreSQL 15 documentation
(define-public postgresql15-docs
  (package
    (name "postgresql15-docs")
    (version "15.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/postgresql15-docs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PostgreSQL 15 documentation")
    (description "Documentation for PostgreSQL 15 relational database system.")
    (home-page "https://www.postgresql.org/")
    (license license:postgresql)))

;;; ovcs-git --- overlay filesystem version control
(define-public ovcs-git
  (package
    (name "ovcs-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ovcs-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "overlay filesystem version control")
    (description "Version control system using overlay filesystems.")
    (home-page "https://aur.archlinux.org/packages/ovcs-git")
    (license license:gpl3+)))

;;; olympus-git --- Celeste mod manager and installer
(define-public olympus-git
  (package
    (name "olympus-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/olympus-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Celeste mod manager and installer")
    (description "Olympus is a cross-platform mod manager and installer for the game Celeste.")
    (home-page "https://everestapi.github.io/")
    (license license:expat)))

;;; iio-hyprland-git --- automatic display rotation for Hyprland via IIO sensors
(define-public iio-hyprland-git
  (package
    (name "iio-hyprland-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/iio-hyprland-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "automatic display rotation for Hyprland via IIO sensors")
    (description "Automatic display rotation for Hyprland compositor using IIO sensor data.")
    (home-page "https://github.com/JeanSchoworern/iio-hyprland")
    (license license:expat)))

;;; aegisub-japan7-git --- advanced subtitle editor (Japan7 fork)
(define-public aegisub-japan7-git
  (package
    (name "aegisub-japan7-git")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aegisub-japan7-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "advanced subtitle editor (Japan7 fork)")
    (description "Aegisub is an advanced subtitle editor, Japan7 fork with additional features.")
    (home-page "https://github.com/Japan7/aegisub")
    (license license:bsd-3)))

;;; kf6-servicemenus-pdftools --- KDE 6 service menus for PDF manipulation
(define-public kf6-servicemenus-pdftools
  (package
    (name "kf6-servicemenus-pdftools")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kf6-servicemenus-pdftools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "KDE 6 service menus for PDF manipulation")
    (description "KDE Frameworks 6 Dolphin service menus for PDF file manipulation tools.")
    (home-page "https://store.kde.org/")
    (license license:gpl3+)))

;;; scribus-unstable --- open-source desktop publishing (development version)
(define-public scribus-unstable
  (package
    (name "scribus-unstable")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scribus-unstable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source desktop publishing (development version)")
    (description "Scribus is an open-source desktop publishing application.  This is the development version.")
    (home-page "https://www.scribus.net/")
    (license license:gpl2+)))

;;; pianobooster-qt6-git --- piano practice aid using MIDI files (Qt6 version)
(define-public pianobooster-qt6-git
  (package
    (name "pianobooster-qt6-git")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pianobooster-qt6-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "piano practice aid using MIDI files (Qt6 version)")
    (description "PianoBooster is a MIDI-based piano practice tool built with Qt6.")
    (home-page "https://github.com/pianobooster/PianoBooster")
    (license license:gpl3+)))

;;; gnome-shell-extension-legacy-theme-auto-switcher-git --- GNOME Shell extension for automatic theme switching
(define-public gnome-shell-extension-legacy-theme-auto-switcher-git
  (package
    (name "gnome-shell-extension-legacy-theme-auto-switcher-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-legacy-theme-auto-switcher-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GNOME Shell extension for automatic theme switching")
    (description "GNOME Shell extension to automatically switch between light and dark legacy themes.")
    (home-page "https://extensions.gnome.org/")
    (license license:gpl3+)))

;;; fcitx5-cskk-git --- CSKK input method for Fcitx5
(define-public fcitx5-cskk-git
  (package
    (name "fcitx5-cskk-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fcitx5-cskk-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CSKK input method for Fcitx5")
    (description "CSKK (C implementation of SKK) input method addon for the Fcitx5 framework.")
    (home-page "https://github.com/fcitx/fcitx5-cskk")
    (license license:gpl3+)))

;;; drm-lease-manager-git --- DRM lease manager for VR and multi-display
(define-public drm-lease-manager-git
  (package
    (name "drm-lease-manager-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/drm-lease-manager-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "DRM lease manager for VR and multi-display")
    (description "A DRM lease manager for sharing display resources across VR and multi-display setups.")
    (home-page "https://gitlab.freedesktop.org/emersion/drm-lease-manager")
    (license license:expat)))

;;; ddgpt-git --- command-line interface for GPT chat
(define-public ddgpt-git
  (package
    (name "ddgpt-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ddgpt-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for GPT chat")
    (description "A terminal-based command-line interface for interacting with GPT models.")
    (home-page "https://github.com/ddgpt/ddgpt")
    (license license:expat)))

;;; art-rawconverter --- raw image processing tool based on RawTherapee
(define-public art-rawconverter
  (package
    (name "art-rawconverter")
    (version "1.22.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/art-rawconverter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "raw image processing tool based on RawTherapee")
    (description "ART is a raw image processing tool derived from RawTherapee, focused on simplicity.")
    (home-page "https://bitbucket.org/agriggio/art/wiki/Home")
    (license license:gpl3+)))

;;; sfxr-qt-git --- retro sound effect generator (Qt version)
(define-public sfxr-qt-git
  (package
    (name "sfxr-qt-git")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sfxr-qt-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "retro sound effect generator (Qt version)")
    (description "SFXR-Qt is a Qt-based retro game sound effect generator.")
    (home-page "https://github.com/agateau/sfxr-qt")
    (license license:gpl2+)))

;;; sqriptor-git --- simple script editor
(define-public sqriptor-git
  (package
    (name "sqriptor-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sqriptor-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple script editor")
    (description "Sqriptor is a simple and lightweight script editor.")
    (home-page "https://aur.archlinux.org/packages/sqriptor-git")
    (license license:gpl3+)))

;;; qbpm-git --- qutebrowser profile manager
(define-public qbpm-git
  (package
    (name "qbpm-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qbpm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "qutebrowser profile manager")
    (description "A profile manager for the qutebrowser web browser.")
    (home-page "https://github.com/pvsr/qbpm")
    (license license:expat)))

;;; cohesion-git --- Python class cohesion metric tool
(define-public cohesion-git
  (package
    (name "cohesion-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cohesion-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python class cohesion metric tool")
    (description "Measure the cohesion of Python classes to improve code quality.")
    (home-page "https://github.com/mschwager/cohesion")
    (license license:expat)))

;;; eudic --- EuDic dictionary application
(define-public eudic
  (package
    (name "eudic")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eudic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "EuDic dictionary application")
    (description "EuDic is a comprehensive dictionary application with offline lookup support.")
    (home-page "https://www.eudic.net/")
    (license license:nonfree)))

;;; astroimagej --- astronomical image analysis in Java
(define-public astroimagej
  (package
    (name "astroimagej")
    (version "5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/astroimagej.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "astronomical image analysis in Java")
    (description "AstroImageJ is an astronomical image analysis and photometry tool based on ImageJ.")
    (home-page "https://www.astro.louisville.edu/software/astroimagej/")
    (license license:gpl3+)))

;;; qpxtool-unofficial-git --- optical disc drive quality testing tool
(define-public qpxtool-unofficial-git
  (package
    (name "qpxtool-unofficial-git")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qpxtool-unofficial-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "optical disc drive quality testing tool")
    (description "QPxTool tests optical disc drive and media quality for CD/DVD/Blu-ray.")
    (home-page "https://github.com/Speed-Fire/qpxtool")
    (license license:gpl2+)))

;;; powertop-to-tmpfile --- run PowerTOP diagnostics to tmpfiles
(define-public powertop-to-tmpfile
  (package
    (name "powertop-to-tmpfile")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powertop-to-tmpfile.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "run PowerTOP diagnostics to tmpfiles")
    (description "Run PowerTOP power diagnostics and output results to temporary files.")
    (home-page "https://aur.archlinux.org/packages/powertop-to-tmpfile")
    (license license:gpl2+)))

;;; phpunit --- PHP testing framework
(define-public phpunit
  (package
    (name "phpunit")
    (version "11.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/phpunit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHP testing framework")
    (description "PHPUnit is the standard unit testing framework for PHP applications.")
    (home-page "https://phpunit.de/")
    (license license:bsd-3)))

;;; devolo-dlan-cockpit --- devolo dLAN powerline network management
(define-public devolo-dlan-cockpit
  (package
    (name "devolo-dlan-cockpit")
    (version "5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devolo-dlan-cockpit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "devolo dLAN powerline network management")
    (description "Management application for devolo dLAN powerline network adapters.")
    (home-page "https://www.devolo.com/")
    (license license:nonfree)))

;;; soundux-git --- cross-platform soundboard application
(define-public soundux-git
  (package
    (name "soundux-git")
    (version "0.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/soundux-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform soundboard application")
    (description "Soundux is a cross-platform soundboard for Linux, Windows, and macOS.")
    (home-page "https://soundux.rocks/")
    (license license:gpl3+)))

;;; armorpaint --- 3D texture painting application
(define-public armorpaint
  (package
    (name "armorpaint")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/armorpaint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "3D texture painting application")
    (description "ArmorPaint is a standalone 3D PBR texture painting application.")
    (home-page "https://armorpaint.org/")
    (license license:gpl3+)))

;;; tumbler-stl-thumbnailer --- STL file thumbnail generator for Tumbler
(define-public tumbler-stl-thumbnailer
  (package
    (name "tumbler-stl-thumbnailer")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tumbler-stl-thumbnailer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "STL file thumbnail generator for Tumbler")
    (description "STL 3D model file thumbnail plugin for the XFCE Tumbler service.")
    (home-page "https://aur.archlinux.org/packages/tumbler-stl-thumbnailer")
    (license license:gpl2+)))

;;; python-flask-sockets --- WebSocket support for Flask
(define-public python-flask-sockets
  (package
    (name "python-flask-sockets")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-flask-sockets.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "WebSocket support for Flask")
    (description "Flask-Sockets provides elegant WebSocket support for Flask applications.")
    (home-page "https://github.com/heroku-python/flask-sockets")
    (license license:expat)))

;;; sncli --- Simplenote command-line interface
(define-public sncli
  (package
    (name "sncli")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sncli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Simplenote command-line interface")
    (description "Terminal-based interface for the Simplenote note-taking service.")
    (home-page "https://github.com/insanum/sncli")
    (license license:expat)))

;;; phive --- PHAR installation and verification environment
(define-public phive
  (package
    (name "phive")
    (version "0.15.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/phive.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PHAR installation and verification environment")
    (description "PHIVE manages PHP Archive (PHAR) tool installation and verification.")
    (home-page "https://phar.io/")
    (license license:bsd-3)))

;;; lazydocker-git --- terminal UI for Docker management
(define-public lazydocker-git
  (package
    (name "lazydocker-git")
    (version "0.23.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lazydocker-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal UI for Docker management")
    (description "A simple terminal UI for both Docker and Docker Compose management.")
    (home-page "https://github.com/jesseduffield/lazydocker")
    (license license:expat)))

;;; spf-tools --- SPF DNS record management tools
(define-public spf-tools
  (package
    (name "spf-tools")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spf-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "SPF DNS record management tools")
    (description "Tools for managing and flattening Sender Policy Framework DNS records.")
    (home-page "https://github.com/spf-tools/spf-tools")
    (license license:asl2.0)))

;;; smoldyn --- spatial stochastic biochemical simulator
(define-public smoldyn
  (package
    (name "smoldyn")
    (version "2.73")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/smoldyn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "spatial stochastic biochemical simulator")
    (description "Smoldyn is a particle-based spatial stochastic simulator for cell biology.")
    (home-page "https://www.smoldyn.org/")
    (license license:lgpl2.1+)))

;;; protoc-gen-twirp --- Twirp RPC code generator for Protocol Buffers
(define-public protoc-gen-twirp
  (package
    (name "protoc-gen-twirp")
    (version "8.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/protoc-gen-twirp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Twirp RPC code generator for Protocol Buffers")
    (description "A Protocol Buffers code generator for the Twirp RPC framework.")
    (home-page "https://github.com/twitchtv/twirp")
    (license license:asl2.0)))

;;; postallow --- Postfix SMTP access policy service for allowlisting
(define-public postallow
  (package
    (name "postallow")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/postallow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Postfix SMTP access policy service for allowlisting")
    (description "Postallow is a Postfix SMTP access policy daemon for sender allowlisting.")
    (home-page "https://github.com/postallow/postallow")
    (license license:gpl3+)))

;;; niji-git --- colorful terminal palette viewer
(define-public niji-git
  (package
    (name "niji-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/niji-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "colorful terminal palette viewer")
    (description "Niji is a terminal color palette viewer and theme preview tool.")
    (home-page "https://aur.archlinux.org/packages/niji-git")
    (license license:expat)))

;;; nautilus-mediainfo-gtk4 --- MediaInfo extension for GNOME Files (GTK4)
(define-public nautilus-mediainfo-gtk4
  (package
    (name "nautilus-mediainfo-gtk4")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nautilus-mediainfo-gtk4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "MediaInfo extension for GNOME Files (GTK4)")
    (description "Nautilus extension displaying media file information, built for GTK4.")
    (home-page "https://aur.archlinux.org/packages/nautilus-mediainfo-gtk4")
    (license license:gpl3+)))

;;; haveibeenpwned-downloader-git --- download haveibeenpwned password hashes
(define-public haveibeenpwned-downloader-git
  (package
    (name "haveibeenpwned-downloader-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/haveibeenpwned-downloader-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "download haveibeenpwned password hashes")
    (description "Download the haveibeenpwned password hash database for offline checking.")
    (home-page "https://github.com/HaveIBeenPwned/PwnedPasswordsDownloader")
    (license license:bsd-3)))

;;; freedroid --- classic Paradroid clone
(define-public freedroid
  (package
    (name "freedroid")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freedroid.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "classic Paradroid clone")
    (description "FreeDroid Classic is a clone of the Commodore 64 game Paradroid.")
    (home-page "https://www.freedroid.org/")
    (license license:gpl2+)))

;;; depthcharge-tools --- tools for managing ChromeOS depthcharge bootloader
(define-public depthcharge-tools
  (package
    (name "depthcharge-tools")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/depthcharge-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tools for managing ChromeOS depthcharge bootloader")
    (description "Build, manage, and flash ChromeOS depthcharge bootloader images on Chromebooks.")
    (home-page "https://github.com/nicman23/depthcharge-tools")
    (license license:gpl2+)))

;;; candlelang-git --- experimental programming language
(define-public candlelang-git
  (package
    (name "candlelang-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/candlelang-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "experimental programming language")
    (description "Candle is an experimental programming language.")
    (home-page "https://aur.archlinux.org/packages/candlelang-git")
    (license license:expat)))

;;; beanquery-git --- query language for Beancount ledger data
(define-public beanquery-git
  (package
    (name "beanquery-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/beanquery-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "query language for Beancount ledger data")
    (description "Beanquery is a query language and tool for Beancount plain-text accounting data.")
    (home-page "https://github.com/beancount/beanquery")
    (license license:gpl2+)))

;;; ashes-2063 --- total conversion mod for GZDoom
(define-public ashes-2063
  (package
    (name "ashes-2063")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ashes-2063.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "total conversion mod for GZDoom")
    (description "Ashes 2063 is a post-apocalyptic total conversion mod for the GZDoom engine.")
    (home-page "https://ashes2063.blogspot.com/")
    (license license:gpl3+)))

;;; ferretdb --- open-source MongoDB-compatible document database
(define-public ferretdb
  (package
    (name "ferretdb")
    (version "1.24.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ferretdb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source MongoDB-compatible document database")
    (description "FerretDB is an open-source MongoDB wire protocol compatible document database using PostgreSQL.")
    (home-page "https://www.ferretdb.com/")
    (license license:asl2.0)))

;;; tcpping --- TCP ping utility
(define-public tcpping
  (package
    (name "tcpping")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tcpping.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "TCP ping utility")
    (description "Tcpping measures network latency via TCP SYN packets instead of ICMP.")
    (home-page "https://github.com/derf/tcpping")
    (license license:gpl2+)))

;;; frogatto --- action-adventure platformer game
(define-public frogatto
  (package
    (name "frogatto")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/frogatto.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "action-adventure platformer game")
    (description "Frogatto is an old-school 2D action-adventure platformer game starring a frog.")
    (home-page "https://frogatto.com/")
    (license license:gpl3+)))

;;; amdgpu-fan --- fan speed controller for AMD GPUs
(define-public amdgpu-fan
  (package
    (name "amdgpu-fan")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/amdgpu-fan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fan speed controller for AMD GPUs")
    (description "Control fan speed curves for AMD Radeon GPUs using the amdgpu driver.")
    (home-page "https://github.com/zzkW35/amdgpu-fan")
    (license license:gpl2+)))

;;; sway-audio-idle-inhibit-git --- prevent idle when audio is playing on Sway
(define-public sway-audio-idle-inhibit-git
  (package
    (name "sway-audio-idle-inhibit-git")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sway-audio-idle-inhibit-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "prevent idle when audio is playing on Sway")
    (description "Inhibit idle and screen lock in Sway when audio is actively playing.")
    (home-page "https://github.com/ErikReider/SwayAudioIdleInhibit")
    (license license:gpl3+)))

;;; labwc-menu-generator-git --- menu generator for labwc window manager
(define-public labwc-menu-generator-git
  (package
    (name "labwc-menu-generator-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/labwc-menu-generator-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "menu generator for labwc window manager")
    (description "Generate application menus from desktop entries for the labwc Wayland compositor.")
    (home-page "https://github.com/labwc/labwc-menu-generator")
    (license license:gpl2+)))

;;; zed-preview --- high-performance code editor (preview channel)
(define-public zed-preview
  (package
    (name "zed-preview")
    (version "0.174.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zed-preview.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance code editor (preview channel)")
    (description "Zed is a high-performance, multiplayer code editor.  This is the preview release channel.")
    (home-page "https://zed.dev/")
    (license license:gpl3+)))
