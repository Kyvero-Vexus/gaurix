;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424n
;;; Resolves 57 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (5):
;;;      1.  grive (cmake-build-system, v0.5.3, license:gpl2)
;;;      2.  font-alibaba-puhuiti (font-build-system, v3.0, non-copyleft)
;;;      3.  faba-mono-icons (copy-build-system, r106.2006c52, license:gpl3+)
;;;      4.  illogical-impulse-oneui4-icons (copy-build-system, r71.693095d, license:gpl3+)
;;;      5.  font-consolas-ligaturized — SKIPPED: NON_DISTRIBUTABLE (proprietary base font)
;;;
;;; ALREADY_IN_GUIX (4):
;;;      1.  arm-linux-gnueabihf-gdb → gdb-multiarch in (gnu packages gdb)
;;;      2.  guile-git-lib → guile-git v0.10.0 in (gnu packages guile)
;;;      3.  python-pocketsphinx → pocketsphinx v5.0.4 in (gnu packages speech)
;;;      4.  electron25 → electron25-bin in (gaurix packages deptree-resolver-260415i)
;;;
;;; ALREADY_RESOLVED (2):
;;;      1.  otf-alibaba-puhuiti → font-alibaba-puhuiti (this pass)
;;;      2.  ttf-alibaba-puhuiti → font-alibaba-puhuiti (this pass)
;;;
;;; DUPLICATE (1):
;;;      1.  vmware-workstation (#11356) → duplicate of #1833
;;;
;;; Remaining BLOCKED: 45 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:export (grive
            font-alibaba-puhuiti
            faba-mono-icons
            illogical-impulse-oneui4-icons))

;;; -- grive --
;;; Open-source Google Drive client (grive2 fork) supporting full and
;;; partial sync via Google Drive REST API.
;;; Source: GitHub release tarball with 4 patches for modern compiler compat.
;;; License: GPL-2.0

(define-public grive
  (package
    (name "grive")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vitalif/grive2/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "17a427gh8j58i6a34qxq95xkxypy66wfypyf10z3aja7x4r7rdjc"))
              (patches
               (list
                ;; PR #363: fix missing #include <memory> for GCC 12+
                (origin
                  (method url-fetch)
                  (uri "https://patch-diff.githubusercontent.com/raw/vitalif/grive2/pull/363.patch")
                  (sha256
                   (base32 "13d4vgcynmdhm5abzd7j9cbcbjcc5rax07my8wg84kw82ngxv8nv")))
                ;; PR #371: replace deprecated fgrep with grep -F
                (origin
                  (method url-fetch)
                  (uri "https://patch-diff.githubusercontent.com/raw/vitalif/grive2/pull/371.patch")
                  (sha256
                   (base32 "0g54j6yf4arbhi1dan8m327g4n1p4zrg00q3ry7n7r8yzw5xafkv")))
                ;; PR #403: fix libgcrypt compilation
                (origin
                  (method url-fetch)
                  (uri "https://patch-diff.githubusercontent.com/raw/vitalif/grive2/pull/403.patch")
                  (sha256
                   (base32 "0bqr7zx7qs5an8bhpcs5d9pd603222n8hagairwha7izb4zja67d")))
                ;; PR #410: fix Boost 1.89 build
                (origin
                  (method url-fetch)
                  (uri "https://patch-diff.githubusercontent.com/raw/vitalif/grive2/pull/410.patch")
                  (sha256
                   (base32 "086b71vv8gshjkp5lydcv4z56xynz9isib4143y268m3kbfx9gym")))))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list yajl curl libgcrypt boost json-c expat))
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_EXE_LINKER_FLAGS=-ljson-c"))))
    (home-page "https://github.com/vitalif/grive2")
    (synopsis "Google Drive client with partial sync support")
    (description "Grive2 is an open-source Google Drive client for GNU/Linux.
It supports the Google Drive REST API and offers both full and incremental
sync of your Google Drive files with a local directory.")
    (license license:gpl2)))

;;; -- font-alibaba-puhuiti --
;;; Alibaba PuHuiTi 3.0 — free commercial-use Chinese font family with
;;; 10 PuHuiTi weights and 6 Sans weights in OTF and TTF formats.
;;; Source: GitHub mirror (official Alibaba OSS URL no longer accessible).
;;; License: Free for commercial use, redistribution permitted (v3.0).

(define-public font-alibaba-puhuiti
  (package
    (name "font-alibaba-puhuiti")
    (version "3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hongzhi725/AlibabaPuHuiTi")
                    (commit "ef70ffb8fe4c033425cc5f0f24e47c714eb360d3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "03kqqwnvbk6mjm91q6cidbbl2fnm3wb009gcbn2n20sf3ibdignq"))))
    (build-system font-build-system)
    (home-page "https://www.alibabafonts.com/")
    (synopsis "Alibaba PuHuiTi free Chinese font family")
    (description "Alibaba PuHuiTi is a Chinese font family created by Alibaba
Group.  Version 3.0 includes 10 PuHuiTi weights and 6 AlibabaSans weights
in both OTF and TTF formats.  The font is permanently free for personal and
commercial use worldwide.")
    (license (license:non-copyleft
              "https://www.alibabafonts.com/#/legal"
              "Alibaba PuHuiTi free commercial license"))))

;;; -- faba-mono-icons --
;;; Monochrome panel icon supplement for the Faba icon theme.
;;; Source: GitHub (archived repository, last commit 2006c52).
;;; License: GPL-3.0+ (icons: CC-BY-SA-4.0)

(define-public faba-mono-icons
  (let ((revision "106")
        (commit "2006c5281eb988c799068734f289a85443800cda"))
    (package
      (name "faba-mono-icons")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/snwh/faba-mono-icons")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0nisfl92y6hrbakp9qxi0ygayl6avkzrhwirg6854bwqjy2dvjv9"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("Faba-Mono" "share/icons/Faba-Mono")
                 ("Faba-Mono-Dark" "share/icons/Faba-Mono-Dark"))))
      (home-page "https://github.com/snwh/faba-mono-icons")
      (synopsis "Monochrome panel icons for the Faba icon theme")
      (description "Faba Mono is a set of monochrome panel icons designed as
a supplement to the Faba icon theme.  It includes both light and dark
variants for use with different panel backgrounds.")
      (license license:gpl3+))))

;;; -- illogical-impulse-oneui4-icons --
;;; Samsung OneUI 4 style icon theme adapted for desktop Linux.
;;; Source: GitHub (end-4/OneUI4-Icons).
;;; License: GPL-3.0

(define-public illogical-impulse-oneui4-icons
  (let ((revision "71")
        (commit "693095d45c67e6b48a9873e36af6283f05080e66"))
    (package
      (name "illogical-impulse-oneui4-icons")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/end-4/OneUI4-Icons")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "10zp1vbzxk7gihgs223d5zipni0gvvq0v1mq47mb65ah8960hs2m"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("OneUI" "share/icons/OneUI")
                 ("OneUI-dark" "share/icons/OneUI-dark")
                 ("OneUI-light" "share/icons/OneUI-light"))))
      (home-page "https://github.com/end-4/OneUI4-Icons")
      (synopsis "Samsung OneUI 4 style icon theme for desktop Linux")
      (description "A Samsung OneUI 4 inspired icon theme for desktop Linux,
providing scalable SVG icons in regular, dark, and light variants.")
      (license license:gpl3+))))
