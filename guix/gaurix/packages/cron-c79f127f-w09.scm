;;; Chunk-local package module for blocked-tree run cron-c79f127f worker w09.
(define-module (gaurix packages cron-c79f127f-w09)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages kde-plasma)
  #:export (sonic-win
            cachyos-ananicy-rules
            circle-flags
            clash-geoip
            genders
            ghostty-shell-integration-nightly-bin
            ghostty-terminfo-nightly-bin
            keychron-link-udev
            libfmod
            localepurge))

(define-public sonic-win
  ;; AUR sonic-win is a downstream KWin fork for X11.  Use upstream Guix KWin as
  ;; the compatibility package to satisfy dependency resolution.
  (package
    (inherit kwin)
    (name "sonic-win")
    (synopsis "Compatibility package mapping sonic-win to upstream KWin")
    (description
     "Compatibility package for @code{sonic-win}.  This package maps the AUR
sonic-win dependency to the upstream Guix @code{kwin} package.")))

(define-public cachyos-ananicy-rules
  (package
    (name "cachyos-ananicy-rules")
    (version "1.1.32")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/CachyOS/ananicy-rules/archive/refs/tags/1.1.32.tar.gz")
       (sha256
        (base32 "0rn82aclgc8wgxk1xvzx6gzwsx58y08q45m1cbb06zq91is1qpwk"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (work (string-append (getcwd) "/work")))
            (mkdir-p work)
            (invoke tar "-xf" src "-C" work)
            (let* ((entries (scandir work (lambda (x) (not (member x '("." ".."))))))
                   (top (string-append work "/" (car entries)))
                   (target (string-append out "/etc/ananicy.d"))
                   (license-dir (string-append out "/share/licenses/cachyos-ananicy-rules")))
              (mkdir-p target)
              (for-each
               (lambda (name)
                 (unless (member name '("." ".." ".gitattributes" ".github" "README.md" "README" "LICENSE"))
                   (let ((path (string-append top "/" name)))
                     (if (file-is-directory? path)
                         (copy-recursively path (string-append target "/" name))
                         (install-file path target)))))
               (scandir top (lambda (x) (not (member x '("." ".."))))))
              (when (file-exists? (string-append top "/LICENSE"))
                (mkdir-p license-dir)
                (install-file (string-append top "/LICENSE") license-dir)))))))
    (home-page "https://github.com/CachyOS/ananicy-rules")
    (synopsis "Ananicy ruleset maintained by CachyOS")
    (description
     "This package provides the CachyOS-maintained ruleset for Ananicy process
scheduling profiles.")
    (license license:gpl3)))

(define-public circle-flags
  (package
    (name "circle-flags")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://packages.linuxmint.com/pool/main/c/circle-flags/circle-flags_2.7.0+mint1.tar.xz")
       (sha256
        (base32 "0kfq0jkb62k41y4bkpmi9bkxxzq31qnwm3il2x1chn7aw5p2hz9f"))))
    (build-system trivial-build-system)
    (native-inputs (list tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (work (string-append (getcwd) "/work")))
            (mkdir-p work)
            (invoke tar "-xf" src "-C" work)
            (let* ((top (string-append work "/circle-flags"))
                   (source-dir (string-append top "/usr/share/circle-flags-svg"))
                   (target-dir (string-append out "/share/circle-flags-svg")))
              (mkdir-p (string-append out "/share"))
              (copy-recursively source-dir target-dir))))))
    (home-page "https://github.com/linuxmint/circle-flags")
    (synopsis "Collection of circular national and regional flag SVGs")
    (description
     "Circle Flags provides a collection of circular flags in SVG format for
applications that need flag icon assets.")
    (license license:gpl3)))

(define-public clash-geoip
  (package
    (name "clash-geoip")
    (version "202603190030")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Loyalsoldier/geoip/releases/download/202603190030/Country.mmdb")
       (sha256
        (base32 "13z6c17v20z07k4qq4vnak3422h5nfkrn7sglykxb12wd9pra24v"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (target-dir (string-append out "/etc/clash")))
            (mkdir-p target-dir)
            (copy-file src (string-append target-dir "/Country.mmdb"))))))
    (home-page "https://github.com/Loyalsoldier/geoip")
    (synopsis "GeoIP country database for Clash-compatible clients")
    (description
     "This package installs the Country.mmdb GeoIP database used by Clash and
compatible clients.")
    (license (list license:cc-by-sa4.0 license:gpl3+))))

(define-public genders
  (package
    (name "genders")
    (version "1.32.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/chaos/genders/archive/genders-1-32-1.tar.gz")
       (sha256
        (base32 "0kfnv7zw18y0f0jyxfimq4bnv99jys78n78pbq5w27nhizn8dh8d"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "--with-non-shortened-hostnames"
              "--with-perl-vendor-arch"
              "--with-cplusplus-extensions"
              "--without-java-extensions"
              "--without-python-extensions")))
    (home-page "https://github.com/chaos/genders")
    (synopsis "Static cluster configuration database")
    (description
     "The genders package provides a static cluster configuration database and
query tools for cluster administration workflows.")
    (license license:gpl2+)))

(define-public ghostty-shell-integration-nightly-bin
  (package
    (name "ghostty-shell-integration-nightly-bin")
    (version "20260402.r15703.g48d3e97")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/jpenilla/ghostty-nightly-bin/releases/download/nightly/ghostty-shell-integration-nightly-bin-x86_64.tar.zst")
       (sha256
        (base32 "1h4ibfmd490h9v3rypyf1vpxa3zfckr3fxrjldh3wzg53hxlydmr"))))
    (build-system trivial-build-system)
    (native-inputs (list tar zstd))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (zstd (search-input-file %build-inputs "/bin/zstd"))
                 (work (string-append (getcwd) "/work"))
                 (source-dir (string-append work "/usr/share/ghostty/shell-integration"))
                 (target-dir (string-append out "/share/ghostty/shell-integration")))
            (mkdir-p work)
            (invoke tar (string-append "--use-compress-program=" zstd) "-xf" src "-C" work)
            (mkdir-p (string-append out "/share/ghostty"))
            (copy-recursively source-dir target-dir)))))
    (home-page "https://github.com/ghostty-org/ghostty")
    (synopsis "Nightly Ghostty shell integration scripts")
    (description
     "This package installs shell integration scripts from the Ghostty nightly
binary distribution.")
    (license license:expat)))

(define-public ghostty-terminfo-nightly-bin
  (package
    (name "ghostty-terminfo-nightly-bin")
    (version "20260402.r15703.g48d3e97")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/jpenilla/ghostty-nightly-bin/releases/download/nightly/ghostty-terminfo-nightly-bin-x86_64.tar.zst")
       (sha256
        (base32 "160a9wgl3gacmp9vl46i42z54dz0knczs67nnd1lm9gnvjnsf79w"))))
    (build-system trivial-build-system)
    (native-inputs (list tar zstd))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (zstd (search-input-file %build-inputs "/bin/zstd"))
                 (work (string-append (getcwd) "/work"))
                 (source-dir (string-append work "/usr/share/terminfo"))
                 (target-dir (string-append out "/share/terminfo")))
            (mkdir-p work)
            (invoke tar (string-append "--use-compress-program=" zstd) "-xf" src "-C" work)
            (copy-recursively source-dir target-dir)))))
    (home-page "https://github.com/ghostty-org/ghostty")
    (synopsis "Nightly Ghostty terminfo entry")
    (description
     "This package installs Ghostty terminfo data from the Ghostty nightly
binary distribution.")
    (license license:expat)))

(define-public keychron-link-udev
  (package
    (name "keychron-link-udev")
    (version "1.0.0")
    (source
     (plain-file
      "70-keychron-link.rules"
      "# SPDX-FileCopyrightText: 2025 Michał Gawron <mgawron@metacode.pl>\n#\n# SPDX-License-Identifier: 0BSD\n\n# Keychron Link\nSUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"3434\", ATTRS{idProduct}==\"d030\", TAG+=\"uaccess\"\nSUBSYSTEM==\"usb\", ATTRS{idVendor}==\"3434\", ATTRS{idProduct}==\"d030\", TAG+=\"uaccess\"\n"))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (target-dir (string-append out "/lib/udev/rules.d")))
            (mkdir-p target-dir)
            (copy-file src (string-append target-dir "/70-keychron-link.rules"))))))
    (home-page "https://aur.archlinux.org/packages/keychron-link-udev")
    (synopsis "Udev rule for the Keychron Link wireless receiver")
    (description
     "This package installs udev rules required to access the Keychron Link
wireless receiver as an unprivileged user.")
    (license license:bsd-0)))

(define-public libfmod
  (package
    (name "libfmod")
    (version "4.44.64")
    (source
     (origin
       (method url-fetch)
       (uri "https://web.archive.org/web/20240822124426/https://zdoom.org/files/fmod/fmodapi44464linux.tar.gz")
       (sha256
        (base32 "047hk92xapwwqj281f4zwl0ih821rrliya70gfj82sdfjh9lz8i1"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (lib-dir (string-append out "/lib"))
                 (license-dir (string-append out "/share/licenses/libfmod"))
                 (root "fmodapi44464linux")
                 (api-lib (string-append root "/api/lib"))
                 (event-lib (string-append root "/fmoddesignerapi/api/lib")))
            (invoke tar "-xf" src)
            (mkdir-p lib-dir)
            (for-each
             (lambda (name)
               (copy-file (string-append api-lib "/" name)
                          (string-append lib-dir "/" name)))
             '("libfmodex-4.44.64.so"
               "libfmodexL-4.44.64.so"))
            (for-each
             (lambda (name)
               (copy-file (string-append event-lib "/" name)
                          (string-append lib-dir "/" name)))
             '("libfmodevent-4.44.64.so"
               "libfmodeventL-4.44.64.so"
               "libfmodeventnet-4.44.64.so"))
            (for-each
             (lambda (pair)
               (let ((target (car pair))
                     (link-name (cdr pair)))
                 (symlink target (string-append lib-dir "/" link-name))))
             '(("libfmodex-4.44.64.so" . "libfmodex.so")
               ("libfmodexL-4.44.64.so" . "libfmodexL.so")
               ("libfmodevent-4.44.64.so" . "libfmodevent.so")
               ("libfmodeventL-4.44.64.so" . "libfmodeventL.so")
               ("libfmodeventnet-4.44.64.so" . "libfmodeventnet.so")))
            (mkdir-p license-dir)
            (copy-file (string-append root "/documentation/LICENSE.TXT")
                       (string-append license-dir "/LICENSE.TXT"))))))
    (home-page "https://zdoom.org/files/fmod/")
    (synopsis "FMOD Ex runtime libraries")
    (description
     "This package provides the proprietary FMOD Ex 4 runtime shared libraries
for compatibility with software that still depends on @code{libfmodex}.")
    (license (license:non-copyleft "https://www.fmod.com/licensing#fmod-licensing"))))

(define-public localepurge
  (package
    (name "localepurge")
    (version "0.7.3.11")
    (source
     (origin
       (method url-fetch)
       (uri "http://deb.debian.org/debian/pool/main/l/localepurge/localepurge_0.7.3.11.tar.xz")
       (sha256
        (base32 "03hqgyfqqbb1h097zyv71nk12x1x00ldgplgk9jhzwgra44iwc7p"))))
    (build-system trivial-build-system)
    (native-inputs (list bash-minimal tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (bash (search-input-file %build-inputs "/bin/bash"))
                 (root (string-append (getcwd) "/localepurge-0.7.3.11"))
                 (bin-dir (string-append out "/bin"))
                 (man-dir (string-append out "/share/man/man8"))
                 (etc-dir (string-append out "/etc"))
                 (cache-dir (string-append out "/var/cache/localepurge")))
            (invoke tar "-xf" src)
            (mkdir-p bin-dir)
            (copy-file (string-append root "/usr/sbin/localepurge")
                       (string-append bin-dir "/localepurge"))
            (copy-file (string-append root "/debian/localepurge.config")
                       (string-append bin-dir "/localepurge-config"))
            (chmod (string-append bin-dir "/localepurge") #o755)
            (chmod (string-append bin-dir "/localepurge-config") #o755)
            (substitute* (list (string-append bin-dir "/localepurge")
                               (string-append bin-dir "/localepurge-config"))
              (("#! /bin/bash") (string-append "#!" bash))
              (("#!/bin/bash") (string-append "#!" bash)))
            (mkdir-p man-dir)
            (copy-file (string-append root "/debian/localepurge.8")
                       (string-append man-dir "/localepurge.8"))
            (mkdir-p etc-dir)
            (call-with-output-file (string-append etc-dir "/locale.nopurge")
              (lambda (port)
                (display "####################################################\n" port)
                (display "# localepurge configuration (Guix default)\n" port)
                (display "####################################################\n" port)
                (display "#NEEDSCONFIGFIRST\n" port)
                (display "MANDELETE\n" port)
                (display "SHOWFREEDSPACE\n" port)
                (display "en\n" port)
                (display "en_US\n" port)
                (display "en_US.UTF-8\n" port)))
            (mkdir-p cache-dir)
            (call-with-output-file (string-append cache-dir "/localelist")
              (lambda (port)
                (display "en\nen_US\nen_US.UTF-8\n" port)))))))
    (home-page "https://packages.debian.org/source/sid/localepurge")
    (synopsis "Script to remove unneeded locale data")
    (description
     "Localepurge removes unneeded locale files and localized manual pages to
reduce disk usage on systems where only a subset of locales is required.")
    (license license:gpl2+)))
