;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425h
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (6): neovim-lspconfig, qt5-mqtt, hq, php-mcrypt,
;;;                  sbctl, snowflake-pt-server
;;; Already resolved (2): mingw-w64-sqlite, python2-wxpython3
;;; Remaining BLOCKED: 92 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages php)
  #:use-module (gnu packages mcrypt)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages linux)
  #:use-module (gaurix packages recipe-resolver-260424z)
  #:export (neovim-lspconfig
            qt5-mqtt
            hq
            php-mcrypt
            sbctl
            snowflake-pt-server))


;;; ---- 1. neovim-lspconfig ----
;;; AUR: neovim-lspconfig-opt-git (#18703)
;;; Neovim LSP configuration collection (Lua plugin).
;;; License: Apache-2.0

(define-public neovim-lspconfig
  (package
    (name "neovim-lspconfig")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neovim/nvim-lspconfig"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1k36nq4acdc0k67x00mp51l016kpw3vgqrislpzzrk5jl0h563j9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("doc" "share/nvim/site/pack/guix/opt/nvim-lspconfig/doc")
          ("lua" "share/nvim/site/pack/guix/opt/nvim-lspconfig/lua")
          ("plugin" "share/nvim/site/pack/guix/opt/nvim-lspconfig/plugin"))))
    (home-page "https://github.com/neovim/nvim-lspconfig")
    (synopsis "Quickstart configs for Neovim LSP")
    (description "This package provides default LSP client configurations for
various language servers, enabling quick setup of Neovim's built-in Language
Server Protocol support.  It includes configurations for dozens of language
servers with sensible defaults.")
    (license license:asl2.0)))


;;; ---- 2. qt5-mqtt ----
;;; AUR: qt5-mqtt (#18831) -- Qt MQTT module for Qt 5.
;;; Official Qt module providing MQTT client and server support.
;;; License: GPL-3.0

(define-public qt5-mqtt
  (package
    (name "qt5-mqtt")
    (version "5.15.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/qt/qtmqtt/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "10aiaghwgs5qqmn21v7xlpl00gbmrf173l5782iigknsbgksn5w5"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (qmake (search-input-file inputs "bin/qmake")))
                (invoke qmake
                        (string-append "PREFIX=" out)
                        (string-append "INSTALL_ROOT=")))))
          (add-before 'build 'set-qt-environment
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "QMAKEPATH"
                      (string-append
                       (dirname (search-input-file inputs "bin/qmake"))
                       "/..")))))))
    (native-inputs (list qtbase-5))
    (inputs (list qtbase-5))
    (home-page "https://doc.qt.io/qt-5/qtmqtt-index.html")
    (synopsis "Qt 5 MQTT protocol implementation")
    (description "Qt MQTT provides an implementation of the MQTT protocol
specification.  It enables applications to act as telemetry displays and
devices to publish telemetry data.  The module supports MQTT versions 3.1,
3.1.1, and 5.0.")
    (license license:gpl3)))


;;; ---- 3. hq ----
;;; AUR: hq (#18286) -- HTML processor using CSS selectors.
;;; Small C++ tool built with Meson, depends on modest (HTML parser).
;;; License: MIT

(define-public hq
  (package
    (name "hq")
    (version "3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coderobe/hq/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0db27x4zhv02phwadkfknlpdh5f2fax4v96i8hfxyaf5rwngw4vq"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list modest fmt))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/coderobe/hq")
    (synopsis "HTML processor using CSS selectors")
    (description "hq is a command-line HTML processor that uses CSS selectors
to extract and manipulate content from HTML documents.  It reads HTML from
standard input and outputs matching elements, similar to how @command{jq}
works for JSON.")
    (license license:expat)))


;;; ---- 4. php-mcrypt ----
;;; AUR: php83-mcrypt (#18398) -- PHP mcrypt extension (PECL).
;;; Provides mcrypt encryption functions for PHP.
;;; License: PHP-3.01

(define-public php-mcrypt
  (package
    (name "php-mcrypt")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pecl.php.net/get/mcrypt-" version ".tgz"))
              (sha256
               (base32
                "1x6ypbjmc3f0pqb047gqrs28nv09pxviy4hj19wvxvz2yaxjzshj"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (phpize (search-input-file inputs "bin/phpize"))
                    (php-config (search-input-file inputs "bin/php-config")))
                (invoke phpize)
                (invoke "./configure"
                        (string-append "--prefix=" out)
                        (string-append "--with-php-config=" php-config)))))
          (add-after 'install 'install-ini
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (ini-dir (string-append out "/etc/php/conf.d")))
                (mkdir-p ini-dir)
                (call-with-output-file
                    (string-append ini-dir "/mcrypt.ini")
                  (lambda (port)
                    (format port "extension=mcrypt.so~%")))))))))
    (native-inputs (list autoconf automake php))
    (inputs (list libmcrypt php))
    (home-page "https://pecl.php.net/package/mcrypt")
    (synopsis "PHP bindings for the libmcrypt encryption library")
    (description "This package provides PHP bindings for the libmcrypt
library, offering symmetric encryption and decryption functions.  It supports
a wide range of block ciphers and cipher modes including DES, 3DES, Blowfish,
Twofish, AES, and more.  Note: the underlying libmcrypt library is
unmaintained; consider using OpenSSL functions for new projects.")
    (license license:php3.01)))


;;; ---- 5. sbctl ----
;;; AUR: sbctl-git (#18638) -- Secure Boot key manager.
;;; Go project for managing Secure Boot keys and signing EFI binaries.
;;; Packaged as stable v0.18 instead of -git.
;;; License: MIT

(define-public sbctl
  (package
    (name "sbctl")
    (version "0.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Foxboron/sbctl/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0kfimh5jgj19n1c7lz86dm0bhgydwnd0cxa8xcwvwanla1xsz8ks"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/foxboron/sbctl"
      #:install-source? #f
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'build
            (lambda* (#:key import-path #:allow-other-keys)
              (with-directory-excursion (string-append "src/" import-path)
                (invoke "go" "build"
                        "-o" "sbctl"
                        "-ldflags" (string-append "-X main.Version=" #$version)
                        "./cmd/sbctl"))))
          (replace 'install
            (lambda* (#:key import-path outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (with-directory-excursion (string-append "src/" import-path)
                  (install-file "sbctl" bin))))))))
    (native-inputs (list go))
    (inputs (list efivar))
    (home-page "https://github.com/Foxboron/sbctl")
    (synopsis "Secure Boot key manager and EFI binary signer")
    (description "sbctl is a tool for managing Secure Boot keys and signing
EFI binaries.  It creates and enrolls custom Secure Boot keys, signs EFI
binaries and kernel images, and can automatically re-sign files when they
are updated.  It aims to make Secure Boot key management straightforward
on Linux systems.")
    (license license:expat)))


;;; ---- 6. snowflake-pt-server ----
;;; AUR: snowflake-pt-server (#18649) -- Tor Snowflake server-side
;;; pluggable transport.
;;; Go project from the Tor Project.  The proxy component is already in Guix
;;; as snowflake-proxy; this packages the server component.
;;; License: BSD-3-Clause

(define-public snowflake-pt-server
  (package
    (name "snowflake-pt-server")
    (version "2.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.torproject.org/tpo/anti-censorship"
                    "/pluggable-transports/snowflake/-/archive/v"
                    version "/snowflake-v" version ".tar.gz"))
              (sha256
               (base32
                "0mxcaqai7vxgc11aznl3kf2z54nz85annzjdpxiymgj8x3bshqhk"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path
      "gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/v2"
      #:install-source? #f
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'build
            (lambda* (#:key import-path #:allow-other-keys)
              (with-directory-excursion (string-append "src/" import-path)
                (invoke "go" "build"
                        "-o" "snowflake-server"
                        "./server"))))
          (replace 'install
            (lambda* (#:key import-path outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (with-directory-excursion (string-append "src/" import-path)
                  (install-file "snowflake-server" bin))))))))
    (native-inputs (list go))
    (home-page
     "https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake")
    (synopsis "Server-side Tor Snowflake pluggable transport")
    (description "This package provides the server component of the Snowflake
pluggable transport for Tor.  Snowflake uses WebRTC to proxy traffic through
temporary browser-based proxies, helping users circumvent internet censorship.
This server-side component is run by Tor bridge operators to accept connections
from Snowflake proxies.")
    (license license:bsd-3)))
