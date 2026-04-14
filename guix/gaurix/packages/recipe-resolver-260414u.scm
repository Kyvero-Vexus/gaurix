;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414u
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 8 recipes created (2 source C/CMake + 1 Python setuptools + 1 Python pyproject + 4 binary repacks)
;;;   - 2 compat aliases (upstream Guix re-exports)
;;;   - 20 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; Recipes (8):
;;;   hopm, bluray-info, python-pycxx, python-ratarmount,
;;;   yazi-bin, openlinkhub-bin, biscuit-lang-bin, qownnotes-bin
;;;
;;; Compat aliases (2):
;;;   waybar-minimal-nosystemd-git → waybar
;;;   fprintd-clients-git → fprintd
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages recipe-resolver-260414u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages linux)
  #:export (hopm
            bluray-info
            python-pycxx
            python-ratarmount
            yazi-bin
            openlinkhub-bin
            biscuit-lang-bin
            qownnotes-bin
            waybar-minimal-nosystemd-git
            fprintd-clients-git))

;;;
;;; --- 1. hopm (gnu-build-system, C/Autotools source) ---
;;; Hybrid Open Proxy Monitor — open proxy scanner for IRC networks.
;;; Source: https://github.com/ircd-hybrid/hopm
;;; Resolves: #13478 hopm (line 99527)
;;;

(define-public hopm
  (package
    (name "hopm")
    (version "1.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ircd-hybrid/hopm/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "12q6hdbfhppi6arr7w5nqchngjk8mx04n39qjnxnfi24cf4nxqnz"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-vfi"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list openssl))
    (synopsis "hybrid open proxy monitor for IRC networks")
    (description "HOPM (Hybrid Open Proxy Monitor) is an open proxy scanning
daemon designed to work with IRC servers.  It monitors IRC connections and
scans connecting clients for open proxies, automatically banning any that
are found to be running open proxy services.  Originally based on BOPM
(Blitzed Open Proxy Monitor).")
    (home-page "https://github.com/ircd-hybrid/hopm")
    (license license:gpl2)))

;;;
;;; --- 2. bluray-info (cmake-build-system, C source) ---
;;; Blu-ray disc information and backup utilities.
;;; Source: https://github.com/beandog/bluray_info
;;; Resolves: #13499 bluray_info-git (line 99679)
;;;

(define-public bluray-info
  (package
    (name "bluray-info")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/beandog/bluray_info/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1f69mbk47aaanb4nax70wb3cqa0hx17lnbkwk2rzwirivx98za3v"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list libbluray))
    (synopsis "Blu-ray disc information and backup utilities")
    (description "Bluray_info is a set of command-line utilities for reading
Blu-ray disc information and performing backup operations.  It includes
@command{bluray_info} for displaying disc metadata, @command{bluray_copy}
for copying titles, @command{bluray_backup} for full disc backup, and
@command{bluray_player} for playback via mpv.")
    (home-page "https://github.com/beandog/bluray_info")
    (license license:gpl2)))

;;;
;;; --- 3. python-pycxx (pyproject-build-system, Python/C++) ---
;;; PyCXX — C++ facilities for writing Python extensions.
;;; Source: https://sourceforge.net/projects/cxx/
;;; Resolves: #13436 python-pycxx (line 99219)
;;;

(define-public python-pycxx
  (package
    (name "python-pycxx")
    (version "7.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/cxx/files/CXX/PyCXX%20V"
                    version "/pycxx-" version ".tar.gz"))
              (sha256
               (base32
                "1cmvzh9lacqdizwx6l4f2kf2fyh3d8914va2ka63szwyqcbwlh21"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "C++ facilities for writing Python extensions")
    (description "PyCXX makes it easy to write Python extensions in C++.  It
provides C++ wrappers for the Python C API that handle reference counting
automatically, provide type-safe conversions, and integrate with C++
exception handling.  PyCXX supports both Python 3 and the stable ABI.")
    (home-page "https://cxx.sourceforge.net")
    (license license:bsd-3)))

;;;
;;; --- 4. python-ratarmount (pyproject-build-system, Python source) ---
;;; FUSE-based random access mount for archives.
;;; Source: https://github.com/mxmlnkn/ratarmount
;;; Resolves: #3383 ratarmount-git (line 26369)
;;;

(define-public python-ratarmount
  (package
    (name "python-ratarmount")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mxmlnkn/ratarmount/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1sd4fmfwg3m26xwsv4grdkp1lyvxkn7hf97bzcd2ax361dbpik3q"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need FUSE kernel module
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python-fusepy))
    (propagated-inputs (list python-msgpack
                             python-rarfile))
    (synopsis "random-access mount for TAR, RAR, and other archives via FUSE")
    (description "Ratarmount mounts archive files (TAR, RAR, ZIP, GZ, BZ2, XZ,
ZSTD) as read-only FUSE file systems with fast random access.  It creates an
index on first mount, allowing subsequent mounts and file access without
extracting the full archive.  Useful for exploring large compressed datasets.")
    (home-page "https://github.com/mxmlnkn/ratarmount")
    (license license:expat)))

;;;
;;; --- 5. yazi-bin (copy-build-system, pre-built binary) ---
;;; Blazing-fast terminal file manager written in Rust.
;;; Source: https://github.com/sxyazi/yazi
;;; Resolves: #4218 yazi-git (line 33216)
;;;

(define-public yazi-bin
  (package
    (name "yazi-bin")
    (version "26.1.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sxyazi/yazi/releases/download/v"
                    version "/yazi-x86_64-unknown-linux-gnu.zip"))
              (sha256
               (base32
                "0l0789b1avbfmr7vpi51mdrbr3vf8j8k7b1z7ys5zfsz5ndjcdm1"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "yazi-x86_64-unknown-linux-gnu/yazi" "bin/yazi")
                   (list "yazi-x86_64-unknown-linux-gnu/ya" "bin/ya"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (chmod (string-append bin "/yazi") #o755)
                     (chmod (string-append bin "/ya") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "blazing-fast terminal file manager written in Rust")
    (description "Yazi is a terminal file manager written in Rust with async
I/O for non-blocking operations.  It features image previews (via terminals
that support the Kitty graphics protocol, sixel, or ueberzug++), a plugin
system, bulk rename, and integration with tools like fd, ripgrep, fzf, and
zoxide.")
    (home-page "https://github.com/sxyazi/yazi")
    (license license:expat)))

;;;
;;; --- 6. openlinkhub-bin (copy-build-system, pre-built binary) ---
;;; Open-source iCUE replacement for managing Corsair devices on Linux.
;;; Source: https://github.com/jurkovic-nikola/OpenLinkHub
;;; Resolves: #4214 openlinkhub-git (line 33182)
;;;

(define-public openlinkhub-bin
  (package
    (name "openlinkhub-bin")
    (version "0.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jurkovic-nikola/OpenLinkHub/"
                    "releases/download/" version
                    "/OpenLinkHub_" version "_amd64.tar.gz"))
              (sha256
               (base32
                "1sxidjqr3y3m8bc8qcfgjvvx9a0ncfz1hc2j5q84ivnyqx06vg3w"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "OpenLinkHub" "bin/OpenLinkHub")
                   (list "web/" "share/openlinkhub/web/")
                   (list "database/" "share/openlinkhub/database/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/OpenLinkHub")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source Linux interface for Corsair iCUE devices")
    (description "OpenLinkHub is an open-source replacement for Corsair iCUE
on Linux.  It provides a web dashboard to manage RGB lighting, fan speeds,
and LCD screens on Corsair AIO coolers, Commander hubs, keyboards, mice, and
headsets over USB HID.")
    (home-page "https://github.com/jurkovic-nikola/OpenLinkHub")
    (license license:gpl3)))

;;;
;;; --- 7. biscuit-lang-bin (copy-build-system, pre-built binary) ---
;;; Biscuit programming language compiler with LLVM backend.
;;; Source: https://github.com/biscuitlang/bl
;;; Resolves: #13502 biscuit-lang (line 99702)
;;;

(define-public biscuit-lang-bin
  (package
    (name "biscuit-lang-bin")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/biscuitlang/bl/releases/download/"
                    version "/blc-x86_64-linux.zip"))
              (sha256
               (base32
                "1pnkv50rqcsbnccam5qnmlkass7kw6hznl25nd6pqx0n7qprrnrf"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "blc" "bin/blc")
                   (list "lib/" "lib/biscuit/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/blc")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "biscuit programming language compiler")
    (description "Biscuit (BL) is an imperative, compiled programming language
inspired by JAI and C, with an LLVM backend.  It features compile-time code
execution, strong type inference, automatic memory management via defer, and
a module system.  The compiler produces native binaries.")
    (home-page "https://github.com/biscuitlang/bl")
    (license license:expat)))

;;;
;;; --- 8. qownnotes-bin (copy-build-system, AppImage binary) ---
;;; Plain-text notepad with Markdown support and Nextcloud integration.
;;; Source: https://github.com/pbek/QOwnNotes
;;; Resolves: #11636 qownnotes (line 85189)
;;;

(define-public qownnotes-bin
  (package
    (name "qownnotes-bin")
    (version "26.4.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pbek/QOwnNotes/releases/download/v"
                    version "/QOwnNotes-x86_64.AppImage"))
              (sha256
               (base32
                "1pfdhmfgblrdq3mzwzcs3vk7mq0188rv3ncjq6fg70g9psski7yk"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list (string-append "QOwnNotes-x86_64.AppImage")
                         "bin/qownnotes"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "QOwnNotes-x86_64.AppImage")))
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/qownnotes")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "plain-text notepad with Markdown and Nextcloud integration")
    (description "QOwnNotes is a plain-text file notepad and todo list manager
with Markdown support and Nextcloud/ownCloud integration.  Notes are stored
as plain-text files, searchable and browsable via a Qt-based GUI with syntax
highlighting, encryption, tagging, and a scripting engine.")
    (home-page "https://www.qownnotes.org")
    (license license:gpl2)))

;;;
;;; --- 9. waybar-minimal-nosystemd-git (compat alias → waybar) ---
;;; Guix waybar already builds without systemd (uses elogind).
;;; Resolves: #13411 waybar-minimal-nosystemd-git (line 99029)
;;;

(define-public waybar-minimal-nosystemd-git
  (package
    (inherit waybar)
    (name "waybar-minimal-nosystemd-git")
    (synopsis "highly customizable Wayland bar (no-systemd alias)")
    (description "This is a compatibility alias for the Guix waybar package,
which is already built without systemd support.  Guix uses elogind and
Shepherd instead of systemd, so the upstream waybar package already provides
the no-systemd variant.")))

;;;
;;; --- 10. fprintd-clients-git (compat alias → fprintd) ---
;;; Upstream fprintd in Guix already provides the client tools.
;;; Resolves: #11271 fprintd-clients-git (line 82200)
;;;

(define-public fprintd-clients-git
  (package
    (inherit fprintd)
    (name "fprintd-clients-git")
    (synopsis "D-Bus daemon for fingerprint reader access (clients alias)")
    (description "This is a compatibility alias for the Guix fprintd package,
which already includes the fingerprint client tools (fprintd-enroll,
fprintd-verify, fprintd-list) and the PAM module.  The AUR
fprintd-clients-git package provides a clients-only fork, but Guix's
upstream fprintd includes these tools by default.")))
