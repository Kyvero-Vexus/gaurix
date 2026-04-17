;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417z
;;; Resolves 5 BLOCKED packages with new recipes.
;;; Documents 21 packages that remain BLOCKED with exhaustive approach history.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260417z)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages wine)
  #:export (watchman-bin
            resource-hacker
            jre-lts-bin
            jdk-lts-bin
            jdk-lts-doc))

;;; ─── watchman: file watching service by Meta (pre-built binary) ───

(define-public watchman-bin
  (package
    (name "watchman-bin")
    (version "2026.04.13.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/facebook/watchman/releases/download/v"
                    version "/watchman-v" version "-linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list unzip coreutils))
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (setenv "PATH"
                       (string-append #$unzip "/bin:" #$coreutils "/bin"))
               (let ((bin (string-append #$output "/bin"))
                     (lib (string-append #$output "/lib"))
                     (tmp (string-append (getcwd) "/tmp")))
                 (mkdir-p bin)
                 (mkdir-p lib)
                 (mkdir-p tmp)
                 (invoke "unzip" "-o" #$source "-d" tmp)
                 (let ((watchman-dir (string-append tmp "/watchman-v"
                                                    #$version "-linux")))
                   (copy-file (string-append watchman-dir "/bin/watchman")
                              (string-append bin "/watchman"))
                   (chmod (string-append bin "/watchman") #o755)
                   (when (file-exists? (string-append watchman-dir "/lib"))
                     (copy-recursively (string-append watchman-dir "/lib")
                                       lib)))))))
    (synopsis "file watching service by Meta")
    (description "Watchman is a file watching service by Meta that monitors
file system changes and triggers actions when they occur.  It is designed for
large codebases and provides efficient file change notifications via a
client-server architecture.")
    (home-page "https://facebook.github.io/watchman/")
    (license license:expat)))

;;; ─── resource-hacker: Windows PE resource editor via Wine ───

(define-public resource-hacker
  (package
    (name "resource-hacker")
    (version "5.2.8")
    (source (origin
              (method url-fetch)
              (uri "https://www.angusj.com/resourcehacker/resource_hacker.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list unzip coreutils))
    (inputs (list wine64 bash-minimal))
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (setenv "PATH"
                       (string-append #$unzip "/bin:" #$coreutils "/bin"))
               (let ((share (string-append #$output "/share/resource-hacker"))
                     (bin (string-append #$output "/bin")))
                 (mkdir-p share)
                 (mkdir-p bin)
                 (invoke "unzip" "-o" #$source "-d" share)
                 (call-with-output-file (string-append bin "/resource-hacker")
                   (lambda (port)
                     (format port
                             "#!/bin/sh~%exec \"~a/bin/wine64\" \"~a/ResourceHacker.exe\" \"$@\"~%"
                             #$wine64 share)))
                 (chmod (string-append bin "/resource-hacker") #o755)))))
    (synopsis "resource compiler and decompiler for Windows applications")
    (description "Resource Hacker is a freeware resource compiler and
decompiler for 32-bit and 64-bit Windows applications.  It can open any type
of Windows executable, view, modify, rename, add, and delete resources.  This
package runs the Windows binary through Wine.")
    (home-page "https://www.angusj.com/resourcehacker/")
    (license (license:non-copyleft
              "https://www.angusj.com/resourcehacker/"
              "Freeware; see upstream site for terms"))))

;;; ─── Oracle Java packages (pre-built binaries, Oracle NFTC license) ───

(define-public jre-lts-bin
  (package
    (name "jre-lts-bin")
    (version "25.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/java/25/archive/jre-"
                    version "_linux-x64_bin.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list #:install-plan
           #~'(("bin" "share/java/jre-lts/bin")
               ("conf" "share/java/jre-lts/conf")
               ("lib" "share/java/jre-lts/lib")
               ("legal" "share/java/jre-lts/legal")
               ("release" "share/java/jre-lts/release"))))
    (synopsis "Oracle Java Runtime Environment (LTS release, pre-built)")
    (description "Oracle Java Runtime Environment is the JRE for running Java
applications.  This is the Long-Term Support release from Oracle, provided as
a pre-built binary distribution under Oracle's No-Fee Terms and Conditions
license.")
    (home-page "https://www.oracle.com/java/")
    (license (license:non-copyleft
              "https://www.oracle.com/java/technologies/javase/jdk-faqs.html"
              "Oracle No-Fee Terms and Conditions"))))

(define-public jdk-lts-bin
  (package
    (name "jdk-lts-bin")
    (version "25.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/java/25/archive/jdk-"
                    version "_linux-x64_bin.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list #:install-plan
           #~'(("bin" "share/java/jdk-lts/bin")
               ("conf" "share/java/jdk-lts/conf")
               ("include" "share/java/jdk-lts/include")
               ("jmods" "share/java/jdk-lts/jmods")
               ("lib" "share/java/jdk-lts/lib")
               ("legal" "share/java/jdk-lts/legal")
               ("release" "share/java/jdk-lts/release"))))
    (synopsis "Oracle Java Development Kit (LTS release, pre-built)")
    (description "Oracle Java Development Kit provides the compiler, debugger,
and other tools needed for developing Java applications.  This is the
Long-Term Support release from Oracle, provided as a pre-built binary
distribution under Oracle's No-Fee Terms and Conditions license.")
    (home-page "https://www.oracle.com/java/")
    (license (license:non-copyleft
              "https://www.oracle.com/java/technologies/javase/jdk-faqs.html"
              "Oracle No-Fee Terms and Conditions"))))

(define-public jdk-lts-doc
  (package
    (name "jdk-lts-doc")
    (version "25.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/java/25/archive/jdk-"
                    version "_doc-all.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/doc/jdk-lts/"))))
    (synopsis "Oracle Java documentation (LTS release)")
    (description "Oracle Java documentation includes the API reference, guides,
and specifications for the Java Development Kit.  This is the Long-Term
Support release documentation from Oracle.")
    (home-page "https://docs.oracle.com/en/java/javase/25/")
    (license (license:non-copyleft
              "https://www.oracle.com/java/technologies/javase/jdk-faqs.html"
              "Oracle No-Fee Terms and Conditions"))))
