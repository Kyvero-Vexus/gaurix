;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425o
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (4): perl-term-extendedcolor, perl-file-lscolor, ls++, ls++-git (alias)
;;; Remaining BLOCKED: 99 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages perl)
  #:export (perl-term-extendedcolor
            perl-file-lscolor
            ls++))


;;; ---- 1. perl-term-extendedcolor ----
;;; CPAN: Term-ExtendedColor
;;; Like Term::ANSIColor, but for the extended 256-color set.
;;; Required by ls++ and perl-file-lscolor.
;;; License: Perl (GPL-1+ or Artistic-1.0)

(define-public perl-term-extendedcolor
  (package
    (name "perl-term-extendedcolor")
    (version "0.504")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/W/WO/WOLDRICH/Term-ExtendedColor-"
             version ".tar.gz"))
       (sha256
        (base32 "1003q39w9xf773xgdh3q07pb5nxh05ws09rbp5azfzd26bqghrc9"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Term-ExtendedColor")
    (synopsis "Color screen output using 256-color extended escape sequences")
    (description "Term::ExtendedColor provides functions to generate escape
sequences for the extended 256-color terminal palette.  It can be used in
place of @code{Term::ANSIColor} when more than the standard 16 ANSI colors
are needed.")
    (license license:perl-license)))


;;; ---- 2. perl-file-lscolor ----
;;; CPAN: File-LsColor
;;; Colorize input filenames using LS_COLORS rules.
;;; Required by ls++.
;;; License: Perl (GPL-1+ or Artistic-1.0)

(define-public perl-file-lscolor
  (package
    (name "perl-file-lscolor")
    (version "0.544")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/W/WO/WOLDRICH/File-LsColor-"
             version ".tar.gz"))
       (sha256
        (base32 "07r8kzkzmx4iy7cx0hqfvzip7fl8sn92i6bgy0yqk31bydwglclb"))))
    (build-system perl-build-system)
    (propagated-inputs (list perl-term-extendedcolor))
    (home-page "https://metacpan.org/release/File-LsColor")
    (synopsis "Colorize filenames like ls does using @code{LS_COLORS}")
    (description "File::LsColor colorizes file names and paths according to
the @code{LS_COLORS} environment variable, just like the @command{ls} command
does.  It supports the full extended 256-color palette via
@code{Term::ExtendedColor}.")
    (license license:perl-license)))


;;; ---- 3. ls++ ----
;;; AUR: ls++-git (#21854)
;;; Colorized LS on steroids.  A Perl wrapper around ls(1) that formats
;;; and colors the output using the extended 256-color palette.
;;; License: Perl (GPL-1+ or Artistic-1.0)

(define-public ls++
  (package
    (name "ls++")
    (version "0.36")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/trapd00r/ls--/archive/refs/heads/master.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yrbnxassb2jr9vijrflvl8nypdzr5kg106lg3659m7m241229fa"))))
    (build-system perl-build-system)
    (propagated-inputs
     (list perl-term-extendedcolor
           perl-file-lscolor
           perl-time-local))
    (home-page "https://github.com/trapd00r/ls--")
    (synopsis "Colorized ls on steroids with extended 256-color support")
    (description "ls++ is a Perl wrapper around @command{ls} that formats
directory listings with extended 256-color output, permission bit coloring,
human-readable sizes, and file-type highlighting.  It reads its configuration
from @file{~/.ls++.conf}.")
    (license license:perl-license)))
