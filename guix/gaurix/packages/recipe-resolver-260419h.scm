;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419h
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (0):
;;;     (none — all 30 are architectural mismatches resolved as EXHAUSTED)
;;;
;;; BLOCKED EXHAUSTED (30): PHP 8.4 extension packages
;;;     All resolved as SUBSUMES_BY_PARENT: Guix builds PHP as a single
;;;     monolithic package with extensions compiled in.  Arch Linux splits
;;;     PHP into per-extension packages; this split is not applicable to
;;;     the Guix model.  Guix php@8.4.17 already includes all 30 extensions.
;;;
;;;     1.  php84-zip -> SUBSUMES_BY_PARENT (libzip built-in)
;;;     2.  php84-xsl -> SUBSUMES_BY_PARENT (libxslt built-in)
;;;     3.  php84-xmlwriter -> SUBSUMES_BY_PARENT (libxml2 built-in)
;;;     4.  php84-xmlreader -> SUBSUMES_BY_PARENT (libxml2 built-in)
;;;     5.  php84-xml -> SUBSUMES_BY_PARENT (libxml2 built-in)
;;;     6.  php84-tokenizer -> SUBSUMES_BY_PARENT (core built-in)
;;;     7.  php84-tidy -> SUBSUMES_BY_PARENT (tidy-html built-in)
;;;     8.  php84-sysvshm -> SUBSUMES_BY_PARENT (kernel IPC built-in)
;;;     9.  php84-sysvsem -> SUBSUMES_BY_PARENT (kernel IPC built-in)
;;;    10.  php84-sysvmsg -> SUBSUMES_BY_PARENT (kernel IPC built-in)
;;;    11.  php84-sqlite -> SUBSUMES_BY_PARENT (sqlite built-in)
;;;    12.  php84-sodium -> SUBSUMES_BY_PARENT (libsodium built-in)
;;;    13.  php84-sockets -> SUBSUMES_BY_PARENT (core built-in)
;;;    14.  php84-soap -> SUBSUMES_BY_PARENT (libxml2 built-in)
;;;    15.  php84-snmp -> SUBSUMES_BY_PARENT (configure-time option)
;;;    16.  php84-simplexml -> SUBSUMES_BY_PARENT (libxml2 built-in)
;;;    17.  php84-shmop -> SUBSUMES_BY_PARENT (core built-in)
;;;    18.  php84-pspell -> SUBSUMES_BY_PARENT (aspell built-in)
;;;    19.  php84-posix -> SUBSUMES_BY_PARENT (core built-in)
;;;    20.  php84-phpdbg -> SUBSUMES_BY_PARENT (phpdbg SAPI built-in)
;;;    21.  php84-phar -> SUBSUMES_BY_PARENT (core built-in)
;;;    22.  php84-pgsql -> SUBSUMES_BY_PARENT (postgresql built-in)
;;;    23.  php84-pecl -> SUBSUMES_BY_PARENT (pear infra built-in)
;;;    24.  php84-pear -> SUBSUMES_BY_PARENT (pear infra built-in)
;;;    25.  php84-pdo -> SUBSUMES_BY_PARENT (core built-in)
;;;    26.  php84-pcntl -> SUBSUMES_BY_PARENT (CLI SAPI built-in)
;;;    27.  php84-openssl -> SUBSUMES_BY_PARENT (openssl built-in)
;;;    28.  php84-opcache -> SUBSUMES_BY_PARENT (default in PHP 8.x)
;;;    29.  php84-odbc -> SUBSUMES_BY_PARENT (configure-time option)
;;;    30.  php84-mysql -> SUBSUMES_BY_PARENT (mysqlnd built-in)
;;;
;;; See recipe-resolver-260419h-blocked-notes.scm for detailed analysis.

(define-module (gaurix packages recipe-resolver-260419h))

;;; No package exports — all 30 entries are SUBSUMES_BY_PARENT exhaustions.
;;; PHP extensions in Arch Linux are separate packages, but in Guix they are
;;; built into the monolithic php package from (gnu packages php).
