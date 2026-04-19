;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260419e
;;; Source pool: BLOCKED (all 9 remaining BLOCKED packages)
;;; Resolves 8 BLOCKED packages with concrete recipes.
;;; 1 package remains BLOCKED (simple-live-app: Flutter SDK required).
;;; Includes 1 new dependency: oracle-instantclient-basic.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260419e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages python)
  #:export (oracle-instantclient-basic
            oracle-instantclient-sqlplus
            apple-mac-plymouth-git
            noto-fonts-cjk-glyph-conf
            noto-fonts-cjk-locale-conf
            universal-gcode-sender
            icu70
            ibc
            youdao-dict))

(define-public oracle-instantclient-basic
  (package
    (name "oracle-instantclient-basic")
    (version "23.7.0.25.01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/otn_software/linux/instantclient/"
                    "2370000/instantclient-basic-linux.x64-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/oracle-instantclient/"
                #:include-regexp (".*\\.so.*" ".*\\.jar" ".*network.*")))))
    (native-inputs (list unzip))
    (synopsis "Oracle Instant Client basic libraries")
    (description "Oracle Instant Client enables applications to connect to a
local or remote Oracle Database.  This package provides the shared libraries
required for OCI, OCCI, and JDBC-OCI applications.")
    (home-page "https://www.oracle.com/database/technologies/instant-client.html")
    (license (license:non-copyleft
              "https://www.oracle.com/downloads/licenses/distribution-license.html"
              "Oracle Technology Network License"))))

(define-public oracle-instantclient-sqlplus
  (package
    (name "oracle-instantclient-sqlplus")
    (version "23.7.0.25.01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/otn_software/linux/instantclient/"
                    "2370000/instantclient-sqlplus-linux.x64-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sqlplus" "bin/sqlplus")
               ("." "lib/oracle-instantclient/"
                #:include-regexp (".*\\.so.*"))
               ("." "share/oracle-instantclient/sqlplus/"
                #:include-regexp (".*\\.sql")))))
    (native-inputs (list unzip))
    (inputs (list oracle-instantclient-basic))
    (synopsis "SQL*Plus for Oracle Instant Client")
    (description "SQL*Plus is an interactive and batch query tool for Oracle
Database.  This package provides the SQL*Plus command-line interface for use
with Oracle Instant Client.")
    (home-page "https://www.oracle.com/database/technologies/instant-client.html")
    (license (license:non-copyleft
              "https://www.oracle.com/downloads/licenses/distribution-license.html"
              "Oracle Technology Network License"))))

(define-public apple-mac-plymouth-git
  (package
    (name "apple-mac-plymouth-git")
    (version "1.0.r16.da00ab1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Msouza91/apple-mac-plymouth")
                    (commit "da00ab1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth/themes/apple-mac-plymouth/"
                #:include-regexp (".*\\.png" ".*\\.plymouth" ".*\\.script")))))
    (synopsis "Apple Mac boot theme for Plymouth")
    (description "Plymouth theme that emulates the Apple macOS boot screen
appearance, providing a minimal loading animation.")
    (home-page "https://github.com/Msouza91/apple-mac-plymouth")
    (license license:gpl3)))

(define-public noto-fonts-cjk-glyph-conf
  (package
    (name "noto-fonts-cjk-glyph-conf")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "noto-fonts-cjk-glyph-conf.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fontconfig/conf.avail/"
                #:include-regexp (".*\\.conf")))))
    (synopsis "Fontconfig fix for Noto CJK glyph rendering in Pango")
    (description "Fontconfig configuration that fixes the issue where
Noto CJK font glyphs render too high in Pango-based applications such
as those in the GNOME desktop environment.")
    (home-page "https://aur.archlinux.org/packages/noto-fonts-cjk-glyph-conf")
    (license license:gpl3+)))

(define-public noto-fonts-cjk-locale-conf
  (package
    (name "noto-fonts-cjk-locale-conf")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "noto-fonts-cjk-locale-conf.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fontconfig/conf.avail/"
                #:include-regexp (".*\\.conf")))))
    (synopsis "Fontconfig locale-aware ordering for Noto CJK fonts")
    (description "Fontconfig configuration that makes Noto CJK fonts
display correctly according to the system locale, selecting the
appropriate regional variant automatically.")
    (home-page "https://aur.archlinux.org/packages/noto-fonts-cjk-locale-conf")
    (license license:gpl3+)))

(define-public universal-gcode-sender
  (package
    (name "universal-gcode-sender")
    (version "2.1.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/winder/Universal-G-Code-Sender/"
                    "releases/download/v" version
                    "/UniversalGcodeSender.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("UniversalGcodeSender.jar" "share/java/universal-gcode-sender/UniversalGcodeSender.jar")
               ("." "share/java/universal-gcode-sender/lib/"
                #:include-regexp (".*\\.jar")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/universal-gcode-sender/UniversalGcodeSender.jar")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/universal-gcode-sender")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 jar)))
                     (chmod (string-append bin "/universal-gcode-sender") #o755)))))))
    (native-inputs (list unzip))
    (inputs (list (list openjdk17 "jdk")))
    (synopsis "Java-based GRBL-compatible cross-platform G-Code sender")
    (description "Universal G-Code Sender is a Java application for sending
G-Code to CNC machines.  It supports GRBL, TinyG, g2core, and Smoothieware
controllers with features including a 3D visualizer, pendant support, and
macro system.")
    (home-page "https://github.com/winder/Universal-G-Code-Sender")
    (license license:gpl3)))

(define-public icu70
  (package
    (name "icu70")
    (version "70.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/unicode-org/icu/releases/download/"
                    "release-70-1/icu4c-70_1-src.tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list (string-append "--prefix=" #$output)
              "--enable-shared"
              "--enable-static=no")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'chdir-to-source
            (lambda _ (chdir "source"))))))
    (native-inputs (list python-minimal))
    (synopsis "International Components for Unicode (version 70)")
    (description "ICU is a set of C/C++ and Java libraries providing Unicode
and globalization support for software applications.  This is version 70.1,
provided for compatibility with software requiring this specific version.")
    (home-page "https://icu.unicode.org/")
    (license license:x11)))

(define-public ibc
  (package
    (name "ibc")
    (version "3.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/IbcAlpha/IBC/releases/download/"
                    version "/IBCLinux-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ibc/"
                #:include-regexp (".*\\.jar" ".*\\.sh" ".*\\.txt" ".*\\.ini")))))
    (native-inputs (list unzip))
    (synopsis "Headless IB Gateway/TWS controller for Interactive Brokers")
    (description "IBC (formerly IB Controller) automates the running of
Interactive Brokers Gateway or Trader Workstation in headless mode.  It handles
login, two-factor authentication prompts, and configuration management for
automated trading setups.")
    (home-page "https://github.com/IbcAlpha/IBC")
    (license license:gpl3)))

(define-public youdao-dict
  (package
    (name "youdao-dict")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://codown.youdao.com/cidian/linux/youdao-dict_"
                    version "-ubuntu-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share" "share/")
               ("usr/bin" "bin/"))))
    (native-inputs (list unzip))
    (synopsis "Youdao dictionary client for Linux")
    (description "Youdao Dictionary is a Chinese-English dictionary and
translation tool.  This is the prebuilt Linux version providing word lookup,
sentence translation, and screen-capture translation features.")
    (home-page "http://cidian.youdao.com/")
    (license (license:non-copyleft
              "https://cidian.youdao.com/"
              "Youdao proprietary license"))))
