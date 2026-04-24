;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260424o
;;;
;;; Packages that could not be resolved in this pass:
;;;
;;; 1. kazam (70) -- MISSING_DEP: python-distutils-extra not in Guix
;;;    - A1: kazam v1.4.5 uses setup.py with python-distutils-extra (deprecated, removed from Python 3.12+);
;;;      python-distutils-extra is not in Guix and is itself deprecated upstream.
;;;    - A2: Tried pyproject-build-system — kazam has no pyproject.toml, only setup.py depending on
;;;      distutils_extra.auto which provides i18n/icon/desktop file integration.
;;;    - A3: Manual conversion to standard setuptools would require rewriting the build scripts
;;;      and i18n extraction pipeline — significant scope beyond packaging.
;;;    - Result: BLOCKED: MISSING_DEP: python-distutils-extra not in Guix; deprecated upstream
;;;
;;; 2. perl-devel-nytprof (752) -- MISSING_DEPS: multiple Perl modules
;;;    - A1: Tried guix import cpan Devel::NYTProf — importer does not exist for this package
;;;      or fails to resolve transitive dependencies.
;;;    - A2: Manual packaging requires perl-capture-tiny, perl-sub-name, perl-test-differences,
;;;      perl-json-maybexs, perl-file-which — some of these are in Guix but the test dependency
;;;      chain is deep and untested.
;;;    - A3: The package builds with ExtUtils::MakeMaker (standard Perl build), but the
;;;      XS/C extension needs correct linking against zlib + Perl internals; batch validation
;;;      not feasible without full build environment testing.
;;;    - Result: BLOCKED: COMPLEX_PERL_XS: C extension with deep test dependency chain

(define-module (gaurix packages recipe-resolver-260424o-blocked-notes))
