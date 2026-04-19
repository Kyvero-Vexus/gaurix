;;; Blocked notes for recipe-resolver-260419h
;;;
;;; BLOCKED EXHAUSTED (30): All PHP 8.4 extension packages
;;;
;;; RATIONALE: Guix packages PHP as a single monolithic build with all standard
;;; extensions compiled in.  Arch Linux (AUR) splits PHP into per-extension
;;; packages (php84-zip, php84-xml, etc.), but this split is not applicable
;;; to the Guix packaging model.  Guix's php@8.4.17 already provides all of
;;; these extensions via configure-time flags.  The upstream Guix PHP package
;;; (gnu/packages/php.scm) enables: zip, xsl, xml, xmlreader, xmlwriter,
;;; simplexml, tidy, sqlite, sodium, soap, snmp (if net-snmp available),
;;; sockets, shmop, posix, phpdbg (as separate output), phar, pgsql, pdo,
;;; pcntl, openssl, opcache, odbc (if unixodbc available), mysql (mysqlnd),
;;; mbstring, ldap, intl, imap (if c-client available), iconv, gmp, gettext,
;;; gd, ftp, fpm, fileinfo, ffi, exif, enchant, pspell, tokenizer, sysvshm,
;;; sysvsem, sysvmsg.
;;;
;;; Resolution: SUBSUMES_BY_PARENT — use `php` from (gnu packages php) instead.
;;; These Arch-specific package splits have no equivalent in Guix and should
;;; not be individually packaged.
;;;
;;; Approaches tried (common to all 30):
;;;   A1: Create individual extension shared objects — Guix PHP compiles
;;;       extensions statically into the binary; no separate .so loading model.
;;;   A2: Create compat aliases inheriting from php — would be misleading since
;;;       the packages are not separate installable units in Guix.
;;;   A3: Accept Guix model — PHP extensions are part of the monolithic php
;;;       package.  Users should install `php` for all extension functionality.
;;;
;;; 1. php84-zip (#5648) — SUBSUMES_BY_PARENT
;;;    PHP ZIP extension (libzip integration).
;;;    Guix php includes libzip@1.9.2 as dependency, zip extension built-in.
;;;
;;; 2. php84-xsl (#5649) — SUBSUMES_BY_PARENT
;;;    PHP XSL/XSLT extension (libxslt integration).
;;;    Guix php includes libxslt@1.1.43 as dependency, xsl extension built-in.
;;;
;;; 3. php84-xmlwriter (#5650) — SUBSUMES_BY_PARENT
;;;    PHP XMLWriter extension (libxml2 integration).
;;;    Guix php includes libxml2@2.14.6, xmlwriter extension built-in.
;;;
;;; 4. php84-xmlreader (#5651) — SUBSUMES_BY_PARENT
;;;    PHP XMLReader extension (libxml2 integration).
;;;    Guix php includes libxml2@2.14.6, xmlreader extension built-in.
;;;
;;; 5. php84-xml (#5652) — SUBSUMES_BY_PARENT
;;;    PHP XML extension (expat/libxml2 integration).
;;;    Guix php includes libxml2@2.14.6, xml extension built-in.
;;;
;;; 6. php84-tokenizer (#5653) — SUBSUMES_BY_PARENT
;;;    PHP Tokenizer extension (PHP source token parsing).
;;;    Built-in PHP extension, no external dependency required.
;;;
;;; 7. php84-tidy (#5654) — SUBSUMES_BY_PARENT
;;;    PHP Tidy extension (HTML cleanup via libtidy).
;;;    Guix php includes tidy-html@5.8.0 as dependency, tidy extension built-in.
;;;
;;; 8. php84-sysvshm (#5655) — SUBSUMES_BY_PARENT
;;;    PHP System V shared memory extension.
;;;    Built-in PHP extension using kernel SysV IPC, no external dep.
;;;
;;; 9. php84-sysvsem (#5656) — SUBSUMES_BY_PARENT
;;;    PHP System V semaphore extension.
;;;    Built-in PHP extension using kernel SysV IPC, no external dep.
;;;
;;; 10. php84-sysvmsg (#5657) — SUBSUMES_BY_PARENT
;;;     PHP System V message queue extension.
;;;     Built-in PHP extension using kernel SysV IPC, no external dep.
;;;
;;; 11. php84-sqlite (#5658) — SUBSUMES_BY_PARENT
;;;     PHP SQLite3 extension (sqlite integration).
;;;     Guix php includes sqlite@3.39.3 as dependency, sqlite3 extension built-in.
;;;
;;; 12. php84-sodium (#5659) — SUBSUMES_BY_PARENT
;;;     PHP Sodium extension (libsodium cryptography).
;;;     Guix php includes libsodium@1.0.18 as dependency, sodium extension built-in.
;;;
;;; 13. php84-sockets (#5660) — SUBSUMES_BY_PARENT
;;;     PHP Sockets extension (BSD socket interface).
;;;     Built-in PHP extension, no external dependency required.
;;;
;;; 14. php84-soap (#5661) — SUBSUMES_BY_PARENT
;;;     PHP SOAP extension (web services).
;;;     Guix php includes libxml2, soap extension built-in.
;;;
;;; 15. php84-snmp (#5662) — SUBSUMES_BY_PARENT
;;;     PHP SNMP extension (network management protocol).
;;;     Guix php configure enables snmp if net-snmp available.
;;;
;;; 16. php84-simplexml (#5663) — SUBSUMES_BY_PARENT
;;;     PHP SimpleXML extension (XML parsing).
;;;     Guix php includes libxml2, simplexml extension built-in.
;;;
;;; 17. php84-shmop (#5664) — SUBSUMES_BY_PARENT
;;;     PHP Shared Memory extension (shmop functions).
;;;     Built-in PHP extension, no external dependency required.
;;;
;;; 18. php84-pspell (#5665) — SUBSUMES_BY_PARENT
;;;     PHP Pspell extension (spell checking via aspell).
;;;     Guix php includes aspell@0.60.8 as dependency, pspell extension built-in.
;;;
;;; 19. php84-posix (#5666) — SUBSUMES_BY_PARENT
;;;     PHP POSIX extension (POSIX.1 functions).
;;;     Built-in PHP extension, no external dependency required.
;;;
;;; 20. php84-phpdbg (#5667) — SUBSUMES_BY_PARENT
;;;     PHP interactive debugger (phpdbg SAPI).
;;;     Built into Guix php binary, available as phpdbg command.
;;;
;;; 21. php84-phar (#5668) — SUBSUMES_BY_PARENT
;;;     PHP Archive extension (phar packaging).
;;;     Built-in PHP extension, always enabled in modern PHP builds.
;;;
;;; 22. php84-pgsql (#5669) — SUBSUMES_BY_PARENT
;;;     PHP PostgreSQL extension.
;;;     Guix php includes postgresql@14.13 as dependency, pgsql extension built-in.
;;;
;;; 23. php84-pecl (#5670) — SUBSUMES_BY_PARENT
;;;     PHP Extension Community Library (installer tool).
;;;     PECL is part of the pear infrastructure included in Guix php.
;;;
;;; 24. php84-pear (#5671) — SUBSUMES_BY_PARENT
;;;     PHP Extension and Application Repository.
;;;     PEAR is included in Guix php build output.
;;;
;;; 25. php84-pdo (#5672) — SUBSUMES_BY_PARENT
;;;     PHP Data Objects extension (database abstraction).
;;;     Built-in PHP extension, always enabled in modern PHP builds.
;;;
;;; 26. php84-pcntl (#5673) — SUBSUMES_BY_PARENT
;;;     PHP Process Control extension (fork/signal handling).
;;;     Built-in PHP extension, enabled in CLI SAPI.
;;;
;;; 27. php84-openssl (#5674) — SUBSUMES_BY_PARENT
;;;     PHP OpenSSL extension (TLS/SSL cryptography).
;;;     Guix php includes openssl@3.0.8 as dependency, openssl extension built-in.
;;;
;;; 28. php84-opcache (#5675) — SUBSUMES_BY_PARENT
;;;     PHP OPcache extension (bytecode caching).
;;;     Built-in PHP extension, enabled by default in PHP 8.x builds.
;;;
;;; 29. php84-odbc (#5676) — SUBSUMES_BY_PARENT
;;;     PHP ODBC extension (database connectivity).
;;;     Guix php configure enables odbc if unixodbc available.
;;;
;;; 30. php84-mysql (#5677) — SUBSUMES_BY_PARENT
;;;     PHP MySQL/MySQLi extension (mysqlnd driver).
;;;     Built-in PHP extension using bundled mysqlnd, no external dep.
