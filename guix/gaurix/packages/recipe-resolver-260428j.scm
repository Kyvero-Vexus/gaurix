;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428j
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;; Groups: PHP 8.3 extensions (36), GCC snapshot components (25),
;;;         Collabora Online Server nodocker locale variants (39).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260428j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            php83-sysvshm
            php83-sysvsem
            php83-sysvmsg
            php83-soap
            php83-snmp
            php83-simplexml
            php83-shmop
            php83-pspell
            php83-posix
            php83-phpdbg
            php83-phar
            php83-pecl
            php83-pear
            php83-pcntl
            php83-opcache
            php83-odbc
            php83-litespeed
            php83-ldap
            php83-imap
            php83-gmp
            php83-gettext
            php83-ftp
            php83-firebird
            php83-fileinfo
            php83-ffi
            php83-exif
            php83-enchant
            php83-embed
            php83-dom
            php83-dblib
            php83-dba
            php83-ctype
            php83-cli
            php83-calendar
            php83-bz2
            php83-bcmath
            libvtv-snapshot
            libubsan-snapshot
            libtsan-snapshot
            libstdc++-snapshot
            libquadmath-snapshot
            libobjc-snapshot
            liblsan-snapshot
            libitm-snapshot
            libgphobos-snapshot
            libgomp-snapshot
            libgm2-snapshot
            libgcobol-snapshot
            libgccjit-snapshot
            libatomic-snapshot
            libasan-snapshot
            lib32-gcc-libs-snapshot
            gcc-rust-snapshot
            gcc-objc-snapshot
            gcc-m2-snapshot
            gcc-libs-snapshot
            gcc-go-snapshot
            gcc-gcobol-snapshot
            gcc-ga68-snapshot
            gcc-d-snapshot
            gcc-ada-snapshot
            collabora-online-server-nodocker-zh-tw
            collabora-online-server-nodocker-zh-cn
            collabora-online-server-nodocker-vi
            collabora-online-server-nodocker-uk
            collabora-online-server-nodocker-tr
            collabora-online-server-nodocker-sv
            collabora-online-server-nodocker-sq
            collabora-online-server-nodocker-sl
            collabora-online-server-nodocker-sk
            collabora-online-server-nodocker-ru
            collabora-online-server-nodocker-pt-pt
            collabora-online-server-nodocker-pt-br
            collabora-online-server-nodocker-pt
            collabora-online-server-nodocker-pl
            collabora-online-server-nodocker-oc
            collabora-online-server-nodocker-no
            collabora-online-server-nodocker-nl
            collabora-online-server-nodocker-nb
            collabora-online-server-nodocker-lo
            collabora-online-server-nodocker-ko
            collabora-online-server-nodocker-ja
            collabora-online-server-nodocker-it
            collabora-online-server-nodocker-is
            collabora-online-server-nodocker-id
            collabora-online-server-nodocker-hy
            collabora-online-server-nodocker-hu
            collabora-online-server-nodocker-hr
            collabora-online-server-nodocker-he
            collabora-online-server-nodocker-gl
            collabora-online-server-nodocker-fr
            collabora-online-server-nodocker-fi
            collabora-online-server-nodocker-eu
            collabora-online-server-nodocker-es
            collabora-online-server-nodocker-eo
            collabora-online-server-nodocker-en-gb
            collabora-online-server-nodocker-en
            collabora-online-server-nodocker-el
            collabora-online-server-nodocker-de
            collabora-online-server-nodocker-da
            ))

;;; PHP-3.01 license
(define license:php3.01
  ((@@ (guix licenses) license) "PHP-3.01"
    "https://www.php.net/license/3_01.txt"
    "The PHP License, version 3.01."))

;;;
;;; ---- PHP 8.3 extension modules (36 packages) ----
;;;

;;; php83-sysvshm --- sysvshm module for php83
(define-public php83-sysvshm
  (package
    (name "php83-sysvshm")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-sysvshm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sysvshm module for php83")
    (description "System V shared memory module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-sysvsem --- sysvsem module for php83
(define-public php83-sysvsem
  (package
    (name "php83-sysvsem")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-sysvsem.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sysvsem module for php83")
    (description "System V semaphore module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-sysvmsg --- sysvmsg module for php83
(define-public php83-sysvmsg
  (package
    (name "php83-sysvmsg")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-sysvmsg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sysvmsg module for php83")
    (description "System V message queue module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-soap --- soap module for php83
(define-public php83-soap
  (package
    (name "php83-soap")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-soap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SOAP module for php83")
    (description "SOAP protocol module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-snmp --- snmp module for php83
(define-public php83-snmp
  (package
    (name "php83-snmp")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-snmp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SNMP module for php83")
    (description "SNMP protocol module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-simplexml --- simplexml module for php83
(define-public php83-simplexml
  (package
    (name "php83-simplexml")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-simplexml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SimpleXML module for php83")
    (description "SimpleXML module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-shmop --- shmop module for php83
(define-public php83-shmop
  (package
    (name "php83-shmop")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-shmop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "shmop module for php83")
    (description "Shared memory operations module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-pspell --- pspell module for php83
(define-public php83-pspell
  (package
    (name "php83-pspell")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-pspell.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pspell module for php83")
    (description "Spell checking module via pspell for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-posix --- posix module for php83
(define-public php83-posix
  (package
    (name "php83-posix")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-posix.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "POSIX module for php83")
    (description "POSIX functions module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-phpdbg --- phpdbg interactive debugger for php83
(define-public php83-phpdbg
  (package
    (name "php83-phpdbg")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-phpdbg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "phpdbg interactive debugger for php83")
    (description "Interactive debugger SAPI module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-phar --- phar module for php83
(define-public php83-phar
  (package
    (name "php83-phar")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-phar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "phar archive module for php83")
    (description "PHP Archive (phar) module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-pecl --- PECL management module for php83
(define-public php83-pecl
  (package
    (name "php83-pecl")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-pecl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PECL management module for php83")
    (description "PHP Extension Community Library management module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-pear --- PEAR management module for php83
(define-public php83-pear
  (package
    (name "php83-pear")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-pear.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PEAR management module for php83")
    (description "PHP Extension and Application Repository management module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-pcntl --- pcntl module for php83
(define-public php83-pcntl
  (package
    (name "php83-pcntl")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-pcntl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pcntl process control module for php83")
    (description "Process control module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-opcache --- opcache module for php83
(define-public php83-opcache
  (package
    (name "php83-opcache")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-opcache.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "opcache bytecode cache module for php83")
    (description "OPcache bytecode caching module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-odbc --- ODBC module for php83
(define-public php83-odbc
  (package
    (name "php83-odbc")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-odbc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ODBC module for php83")
    (description "ODBC database connectivity module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-litespeed --- LiteSpeed SAPI for php83
(define-public php83-litespeed
  (package
    (name "php83-litespeed")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-litespeed.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiteSpeed SAPI for php83")
    (description "LiteSpeed server API module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-ldap --- LDAP module for php83
(define-public php83-ldap
  (package
    (name "php83-ldap")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-ldap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LDAP module for php83")
    (description "LDAP directory access module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-imap --- IMAP module for php83
(define-public php83-imap
  (package
    (name "php83-imap")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-imap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IMAP module for php83")
    (description "IMAP mail protocol module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-gmp --- GMP module for php83
(define-public php83-gmp
  (package
    (name "php83-gmp")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-gmp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GMP arbitrary precision math module for php83")
    (description "GNU Multiple Precision arithmetic module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-gettext --- gettext module for php83
(define-public php83-gettext
  (package
    (name "php83-gettext")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-gettext.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gettext internationalization module for php83")
    (description "Gettext internationalization module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-ftp --- FTP module for php83
(define-public php83-ftp
  (package
    (name "php83-ftp")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-ftp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "FTP module for php83")
    (description "FTP protocol module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-firebird --- Firebird module for php83
(define-public php83-firebird
  (package
    (name "php83-firebird")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-firebird.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Firebird database module for php83")
    (description "Firebird/Interbase database module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-fileinfo --- fileinfo module for php83
(define-public php83-fileinfo
  (package
    (name "php83-fileinfo")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-fileinfo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fileinfo module for php83")
    (description "File information module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-ffi --- FFI module for php83
(define-public php83-ffi
  (package
    (name "php83-ffi")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-ffi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "FFI foreign function interface module for php83")
    (description "Foreign Function Interface module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-exif --- exif module for php83
(define-public php83-exif
  (package
    (name "php83-exif")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-exif.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "EXIF metadata module for php83")
    (description "EXIF image metadata reading module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-enchant --- enchant module for php83
(define-public php83-enchant
  (package
    (name "php83-enchant")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-enchant.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enchant spell checking module for php83")
    (description "Enchant spell checking library module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-embed --- embed SAPI for php83
(define-public php83-embed
  (package
    (name "php83-embed")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-embed.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "embed SAPI for php83")
    (description "Embed SAPI module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-dom --- DOM module for php83
(define-public php83-dom
  (package
    (name "php83-dom")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-dom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DOM module for php83")
    (description "Document Object Model module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-dblib --- pdo_dblib module for php83
(define-public php83-dblib
  (package
    (name "php83-dblib")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-dblib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pdo_dblib module for php83")
    (description "PDO DB-Library (FreeTDS) module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-dba --- DBA module for php83
(define-public php83-dba
  (package
    (name "php83-dba")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-dba.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DBA database abstraction module for php83")
    (description "Database abstraction layer module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-ctype --- ctype module for php83
(define-public php83-ctype
  (package
    (name "php83-ctype")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-ctype.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ctype character classification module for php83")
    (description "Character type checking module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-cli --- CLI SAPI for php83
(define-public php83-cli
  (package
    (name "php83-cli")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI SAPI for php83")
    (description "Command-line interface SAPI for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-calendar --- calendar module for php83
(define-public php83-calendar
  (package
    (name "php83-calendar")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-calendar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "calendar conversion module for php83")
    (description "Calendar conversion module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-bz2 --- bzip2 module for php83
(define-public php83-bz2
  (package
    (name "php83-bz2")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-bz2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bzip2 compression module for php83")
    (description "Bzip2 compression module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;; php83-bcmath --- bcmath module for php83
(define-public php83-bcmath
  (package
    (name "php83-bcmath")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-bcmath.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bcmath arbitrary precision math module for php83")
    (description "BC Math arbitrary precision mathematics module for PHP 8.3.")
    (home-page "https://www.php.net")
    (license license:php3.01)))

;;;
;;; ---- GCC Snapshot Components (25 packages) ----
;;;

;;; libvtv-snapshot --- GCC Virtual Table Verification runtime libraries (snapshot)
(define-public libvtv-snapshot
  (package
    (name "libvtv-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libvtv-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Virtual Table Verification runtime libraries (snapshot)")
    (description "GNU Compiler Collection Virtual Table Verification runtime
libraries from the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libubsan-snapshot --- GCC Undefined Behavior Sanitizer runtime libraries (snapshot)
(define-public libubsan-snapshot
  (package
    (name "libubsan-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libubsan-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Undefined Behavior Sanitizer runtime libraries (snapshot)")
    (description "GNU Compiler Collection Undefined Behavior Sanitizer runtime
libraries from the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libtsan-snapshot --- GCC Thread Sanitizer runtime libraries (snapshot)
(define-public libtsan-snapshot
  (package
    (name "libtsan-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libtsan-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Thread Sanitizer runtime libraries (snapshot)")
    (description "GNU Compiler Collection Thread Sanitizer runtime libraries
from the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libstdc++-snapshot --- GCC C++ runtime libraries (snapshot)
(define-public libstdc++-snapshot
  (package
    (name "libstdc++-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libstdc++-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC C++ runtime libraries (snapshot)")
    (description "GNU Compiler Collection C++ standard library runtime from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license (list license:gpl3+ license:fdl1.3+))))

;;; libquadmath-snapshot --- GCC Quad-Precision Math runtime libraries (snapshot)
(define-public libquadmath-snapshot
  (package
    (name "libquadmath-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libquadmath-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Quad-Precision Math runtime libraries (snapshot)")
    (description "GNU Compiler Collection quad-precision math runtime libraries
from the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libobjc-snapshot --- GCC Objective-C runtime libraries (snapshot)
(define-public libobjc-snapshot
  (package
    (name "libobjc-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libobjc-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Objective-C runtime libraries (snapshot)")
    (description "GNU Compiler Collection Objective-C runtime libraries from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; liblsan-snapshot --- GCC Leak Sanitizer runtime libraries (snapshot)
(define-public liblsan-snapshot
  (package
    (name "liblsan-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liblsan-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Leak Sanitizer runtime libraries (snapshot)")
    (description "GNU Compiler Collection Leak Sanitizer runtime libraries from
the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libitm-snapshot --- GCC Transactional Memory runtime libraries (snapshot)
(define-public libitm-snapshot
  (package
    (name "libitm-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libitm-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Transactional Memory runtime libraries (snapshot)")
    (description "GNU Compiler Collection GNU Transactional Memory runtime
libraries from the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libgphobos-snapshot --- GCC D runtime libraries (snapshot)
(define-public libgphobos-snapshot
  (package
    (name "libgphobos-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgphobos-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC D runtime libraries (snapshot)")
    (description "GNU Compiler Collection D language runtime libraries from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libgomp-snapshot --- GCC OpenMP runtime libraries (snapshot)
(define-public libgomp-snapshot
  (package
    (name "libgomp-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgomp-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC OpenMP and GPU Offload runtime libraries (snapshot)")
    (description "GNU Compiler Collection OpenMP and GPU Offload runtime
libraries from the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libgm2-snapshot --- GCC Modula-2 runtime libraries (snapshot)
(define-public libgm2-snapshot
  (package
    (name "libgm2-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgm2-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Modula-2 runtime libraries (snapshot)")
    (description "GNU Compiler Collection Modula-2 runtime libraries from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libgcobol-snapshot --- GCC COBOL runtime libraries (snapshot)
(define-public libgcobol-snapshot
  (package
    (name "libgcobol-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgcobol-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC COBOL runtime libraries (snapshot)")
    (description "GNU Compiler Collection COBOL runtime libraries from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libgccjit-snapshot --- GCC Just-In-Time compilation framework (snapshot)
(define-public libgccjit-snapshot
  (package
    (name "libgccjit-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgccjit-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Just-In-Time compilation framework (snapshot)")
    (description "GNU Compiler Collection Just-In-Time compilation framework
from the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libatomic-snapshot --- GCC Atomic runtime libraries (snapshot)
(define-public libatomic-snapshot
  (package
    (name "libatomic-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libatomic-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Atomic runtime libraries (snapshot)")
    (description "GNU Compiler Collection GNU Atomic runtime libraries from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; libasan-snapshot --- GCC Address Sanitizer runtime libraries (snapshot)
(define-public libasan-snapshot
  (package
    (name "libasan-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libasan-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Address Sanitizer runtime libraries (snapshot)")
    (description "GNU Compiler Collection Address Sanitizer runtime libraries
from the development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; lib32-gcc-libs-snapshot --- GCC 32-bit runtime libraries (snapshot)
(define-public lib32-gcc-libs-snapshot
  (package
    (name "lib32-gcc-libs-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gcc-libs-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC 32-bit runtime libraries (snapshot)")
    (description "GNU Compiler Collection 32-bit runtime libraries from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-rust-snapshot --- GCC Rust front-end (snapshot)
(define-public gcc-rust-snapshot
  (package
    (name "gcc-rust-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-rust-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Rust front-end (snapshot)")
    (description "GNU Compiler Collection Rust front-end from the development
snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-objc-snapshot --- GCC Objective-C front-end (snapshot)
(define-public gcc-objc-snapshot
  (package
    (name "gcc-objc-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-objc-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Objective-C front-end (snapshot)")
    (description "GNU Compiler Collection Objective-C front-end from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-m2-snapshot --- GCC Modula-2 front-end (snapshot)
(define-public gcc-m2-snapshot
  (package
    (name "gcc-m2-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-m2-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Modula-2 front-end (snapshot)")
    (description "GNU Compiler Collection Modula-2 front-end from the development
snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-libs-snapshot --- GCC runtime libraries (snapshot)
(define-public gcc-libs-snapshot
  (package
    (name "gcc-libs-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-libs-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC runtime libraries (snapshot)")
    (description "GNU Compiler Collection runtime libraries from the development
snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-go-snapshot --- GCC Go front-end (snapshot)
(define-public gcc-go-snapshot
  (package
    (name "gcc-go-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-go-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Go front-end (snapshot)")
    (description "GNU Compiler Collection Go front-end from the development
snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-gcobol-snapshot --- GCC COBOL front-end (snapshot)
(define-public gcc-gcobol-snapshot
  (package
    (name "gcc-gcobol-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-gcobol-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC COBOL front-end (snapshot)")
    (description "GNU Compiler Collection COBOL front-end from the development
snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-ga68-snapshot --- GCC Algol68 front-end (snapshot)
(define-public gcc-ga68-snapshot
  (package
    (name "gcc-ga68-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-ga68-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Algol68 front-end (snapshot)")
    (description "GNU Compiler Collection Algol68 front-end from the development
snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-d-snapshot --- GCC D front-end (snapshot)
(define-public gcc-d-snapshot
  (package
    (name "gcc-d-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-d-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC D front-end (snapshot)")
    (description "GNU Compiler Collection D language front-end from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;; gcc-ada-snapshot --- GCC Ada front-end (snapshot)
(define-public gcc-ada-snapshot
  (package
    (name "gcc-ada-snapshot")
    (version "16.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-ada-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GCC Ada front-end (snapshot)")
    (description "GNU Compiler Collection Ada (GNAT) front-end from the
development snapshot.")
    (home-page "https://gcc.gnu.org")
    (license license:gpl3+)))

;;;
;;; ---- Collabora Online Server nodocker locale variants (39 packages) ----
;;;

;;; Helper: generates a collabora-online-server-nodocker locale package.
(define (make-collabora-nodocker-locale locale-code locale-name)
  (package
    (name (string-append "collabora-online-server-nodocker-" locale-code))
    (version "24.04.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "collabora-online-server-nodocker_"
                    locale-code ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis (string-append "Collabora Online Server (nodocker, " locale-name " locale)"))
    (description (string-append
                  "Collabora Online Server without Docker for the "
                  locale-name " locale.  Provides LibreOffice-based online "
                  "document editing and collaboration."))
    (home-page "https://www.collaboraoffice.com/collabora-online/")
    (license license:mpl2.0)))

(define-public collabora-online-server-nodocker-zh-tw
  (make-collabora-nodocker-locale "zh-tw" "Traditional Chinese"))

(define-public collabora-online-server-nodocker-zh-cn
  (make-collabora-nodocker-locale "zh-cn" "Simplified Chinese"))

(define-public collabora-online-server-nodocker-vi
  (make-collabora-nodocker-locale "vi" "Vietnamese"))

(define-public collabora-online-server-nodocker-uk
  (make-collabora-nodocker-locale "uk" "Ukrainian"))

(define-public collabora-online-server-nodocker-tr
  (make-collabora-nodocker-locale "tr" "Turkish"))

(define-public collabora-online-server-nodocker-sv
  (make-collabora-nodocker-locale "sv" "Swedish"))

(define-public collabora-online-server-nodocker-sq
  (make-collabora-nodocker-locale "sq" "Albanian"))

(define-public collabora-online-server-nodocker-sl
  (make-collabora-nodocker-locale "sl" "Slovenian"))

(define-public collabora-online-server-nodocker-sk
  (make-collabora-nodocker-locale "sk" "Slovak"))

(define-public collabora-online-server-nodocker-ru
  (make-collabora-nodocker-locale "ru" "Russian"))

(define-public collabora-online-server-nodocker-pt-pt
  (make-collabora-nodocker-locale "pt-pt" "Portuguese (Portugal)"))

(define-public collabora-online-server-nodocker-pt-br
  (make-collabora-nodocker-locale "pt-br" "Portuguese (Brazil)"))

(define-public collabora-online-server-nodocker-pt
  (make-collabora-nodocker-locale "pt" "Portuguese"))

(define-public collabora-online-server-nodocker-pl
  (make-collabora-nodocker-locale "pl" "Polish"))

(define-public collabora-online-server-nodocker-oc
  (make-collabora-nodocker-locale "oc" "Occitan"))

(define-public collabora-online-server-nodocker-no
  (make-collabora-nodocker-locale "no" "Norwegian"))

(define-public collabora-online-server-nodocker-nl
  (make-collabora-nodocker-locale "nl" "Dutch"))

(define-public collabora-online-server-nodocker-nb
  (make-collabora-nodocker-locale "nb" "Norwegian Bokmal"))

(define-public collabora-online-server-nodocker-lo
  (make-collabora-nodocker-locale "lo" "Lao"))

(define-public collabora-online-server-nodocker-ko
  (make-collabora-nodocker-locale "ko" "Korean"))

(define-public collabora-online-server-nodocker-ja
  (make-collabora-nodocker-locale "ja" "Japanese"))

(define-public collabora-online-server-nodocker-it
  (make-collabora-nodocker-locale "it" "Italian"))

(define-public collabora-online-server-nodocker-is
  (make-collabora-nodocker-locale "is" "Icelandic"))

(define-public collabora-online-server-nodocker-id
  (make-collabora-nodocker-locale "id" "Indonesian"))

(define-public collabora-online-server-nodocker-hy
  (make-collabora-nodocker-locale "hy" "Armenian"))

(define-public collabora-online-server-nodocker-hu
  (make-collabora-nodocker-locale "hu" "Hungarian"))

(define-public collabora-online-server-nodocker-hr
  (make-collabora-nodocker-locale "hr" "Croatian"))

(define-public collabora-online-server-nodocker-he
  (make-collabora-nodocker-locale "he" "Hebrew"))

(define-public collabora-online-server-nodocker-gl
  (make-collabora-nodocker-locale "gl" "Galician"))

(define-public collabora-online-server-nodocker-fr
  (make-collabora-nodocker-locale "fr" "French"))

(define-public collabora-online-server-nodocker-fi
  (make-collabora-nodocker-locale "fi" "Finnish"))

(define-public collabora-online-server-nodocker-eu
  (make-collabora-nodocker-locale "eu" "Basque"))

(define-public collabora-online-server-nodocker-es
  (make-collabora-nodocker-locale "es" "Spanish"))

(define-public collabora-online-server-nodocker-eo
  (make-collabora-nodocker-locale "eo" "Esperanto"))

(define-public collabora-online-server-nodocker-en-gb
  (make-collabora-nodocker-locale "en-gb" "English (United Kingdom)"))

(define-public collabora-online-server-nodocker-en
  (make-collabora-nodocker-locale "en" "English"))

(define-public collabora-online-server-nodocker-el
  (make-collabora-nodocker-locale "el" "Greek"))

(define-public collabora-online-server-nodocker-de
  (make-collabora-nodocker-locale "de" "German"))

(define-public collabora-online-server-nodocker-da
  (make-collabora-nodocker-locale "da" "Danish"))
