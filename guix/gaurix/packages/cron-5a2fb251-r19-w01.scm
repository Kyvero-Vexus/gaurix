;;; NEEDS_RECIPE_DESIGN resolution — round 19, worker 01
;;; 8 new recipes: bililive-recorder-bin, noto-fonts-cjk-fontconfig,
;;;   libmodule, mas, wrkflw-bin, iwmenu-bin, bzmenu-bin, pwmenu-bin
;;; 2 BLOCKED: webtorrent-bittorrent-tracker (MISSING_GUIX_DEPS: 20+ npm deps),
;;;   clightd (MISSING_GUIX_DEPS: complex dbus/polkit/elogind integration)
(define-module (gaurix packages cron-5a2fb251-r19-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc))

;;; ─────────────────────────────────────────────
;;; bililive-recorder-bin — BiliBili stream recorder (binary)
;;; .NET self-contained CLI for Linux x86_64.
;;; ─────────────────────────────────────────────
(define-public bililive-recorder-bin
  (package
    (name "bililive-recorder-bin")
    (version "2.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/BililiveRecorder/BililiveRecorder"
             "/releases/download/v" version
             "/BililiveRecorder-CLI-linux-x64.zip"))
       (file-name (string-append "bililive-recorder-" version "-linux-x64.zip"))
       (sha256
        (base32 "0lmcbn128xnmnfv0yv2wkps5a4bmydq6dlhmy236bhrd8a62hd5d"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (bash (search-input-file %build-inputs "/bin/bash"))
                 (ld-so (search-input-file %build-inputs
                                           "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib"))
                 (rpath (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (lib-dir (string-append out "/lib/bililive-recorder"))
                 (bin-dir (string-append out "/bin")))
            (invoke unzip "-q" src "-d" lib-dir)
            ;; Patch the main executable
            (let ((exe (string-append lib-dir "/BililiveRecorder.Cli")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath"
                      (string-append lib-dir ":" rpath) exe))
            ;; Patch .so files
            (for-each
             (lambda (f)
               (chmod f #o755)
               (invoke patchelf "--set-rpath"
                       (string-append lib-dir ":" rpath) f))
             (find-files lib-dir "\\.so$"))
            ;; Create wrapper script
            (mkdir-p bin-dir)
            (call-with-output-file (string-append bin-dir "/bililive-recorder")
              (lambda (port)
                (format port "#!~a~%exec ~a/BililiveRecorder.Cli \"$@\"~%"
                        bash lib-dir)))
            (chmod (string-append bin-dir "/bililive-recorder") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BililiveRecorder/BililiveRecorder")
    (synopsis "BiliBili live stream recorder")
    (description
     "BililiveRecorder (B站录播姬) is a live stream recording tool for
BiliBili (bilibili.com).  It runs as a command-line application and can
record multiple rooms simultaneously with automatic stream reconnection.")
    (license license:gpl3)))

;;; ─────────────────────────────────────────────
;;; noto-fonts-cjk-fontconfig — Fontconfig snippet for Noto CJK fonts
;;; ─────────────────────────────────────────────
(define-public noto-fonts-cjk-fontconfig
  (package
    (name "noto-fonts-cjk-fontconfig")
    (version "1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (conf-dir (string-append out "/share/fontconfig/conf.avail"))
                 (default-dir (string-append out "/share/fontconfig/conf.default")))
            (mkdir-p conf-dir)
            (mkdir-p default-dir)
            (call-with-output-file (string-append conf-dir "/70-noto-cjk.conf")
              (lambda (port)
                (display
"<?xml version=\"1.0\"?>
<!DOCTYPE fontconfig SYSTEM \"urn:fontconfig:fonts.dtd\">
<fontconfig>
  <description>Append noto-fonts-cjk to noto-fonts according to locale</description>
  <!-- Noto Sans -->
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-cn</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK SC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-sg</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK SC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-hk</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK HK</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-tw</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK TC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>ja</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK JP</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>ko</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK KR</string></edit>
  </match>
  <!-- Noto Serif -->
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-cn</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Serif</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Serif CJK SC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-sg</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Serif</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Serif CJK SC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-hk</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Serif</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Serif CJK HK</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-tw</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Serif</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Serif CJK TC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>ja</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Serif</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Serif CJK JP</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>ko</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Serif</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Serif CJK KR</string></edit>
  </match>
  <!-- Noto Sans Mono -->
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-cn</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans Mono</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans Mono CJK SC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-sg</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans Mono</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans Mono CJK SC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-hk</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans Mono</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans Mono CJK HK</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>zh-tw</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans Mono</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans Mono CJK TC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>ja</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans Mono</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans Mono CJK JP</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\"><string>ko</string></test>
    <test name=\"family\" qual=\"any\"><string>Noto Sans Mono</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans Mono CJK KR</string></edit>
  </match>
</fontconfig>
" port)))
            ;; Symlink to conf.default
            (symlink "../conf.avail/70-noto-cjk.conf"
                     (string-append default-dir "/70-noto-cjk.conf"))))))
    (home-page "https://aur.archlinux.org/packages/noto-fonts-cjk-fontconfig")
    (synopsis "Fontconfig configuration for Noto CJK fonts")
    (description
     "Installs a fontconfig configuration file that appends the appropriate
CJK variant of Noto fonts (Sans, Serif, Mono) based on the user's locale
setting (Chinese Simplified/Traditional, Japanese, Korean).")
    (license license:gpl3+)))

;;; ─────────────────────────────────────────────
;;; libmodule — C library for building modular projects
;;; CMake build. Dependency of clightd.
;;; ─────────────────────────────────────────────
(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FedeDP/libmodule/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zpp46jly4sqb7gbffxajv72i6rh60cacc7sfrsr65mym9liw43j"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f  ;; tests require cmocka which is optional
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "C library to build modular, event-driven projects")
    (description
     "Libmodule is a C library that provides an easy-to-use API for building
modular, event-driven projects.  It uses a publish/subscribe pattern and
integrates with the system event loop (epoll/kqueue).")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; mas — Macro cross-assembler (asl) for various processors
;;; Uses plain GNU Make with Makefile.def configuration.
;;; ─────────────────────────────────────────────
(define-public mas
  (package
    (name "mas")
    (version "1.42-bld302")
    (source
     (origin
       (method url-fetch)
       (uri "http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/asl-current.tar.gz")
       (file-name (string-append "asl-" version ".tar.gz"))
       (sha256
        (base32 "00bdvrpa7wf16xrpgpg3bygrqyswxkwaq470fbmpzh52fb6jvsms"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                ;; Create Makefile.def from template
                (call-with-output-file "Makefile.def"
                  (lambda (port)
                    (format port "OBJDIR =~%")
                    (format port "CC = gcc~%")
                    (format port "CFLAGS = -O2 -Wall~%")
                    (format port "HOST_OBJEXTENSION = .o~%")
                    (format port "LD = $(CC)~%")
                    (format port "LDFLAGS =~%")
                    (format port "HOST_EXEXTENSION =~%")
                    (format port "TARG_OBJDIR = $(OBJDIR)~%")
                    (format port "TARG_CC = $(CC)~%")
                    (format port "TARG_CFLAGS = $(CFLAGS)~%")
                    (format port "TARG_OBJEXTENSION = $(HOST_OBJEXTENSION)~%")
                    (format port "TARG_LD = $(LD)~%")
                    (format port "TARG_LDFLAGS = $(LDFLAGS)~%")
                    (format port "TARG_EXEXTENSION = $(HOST_EXEXTENSION)~%")
                    (format port "INSTROOT:=~a/~%" out))))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (invoke "make" "install"
                        (string-append "INSTROOT=" out "/"))))))))
    (home-page "http://john.ccac.rwth-aachen.de:8000/as/")
    (synopsis "Macro cross-assembler for various microprocessors")
    (description
     "AS (also known as asl) is a portable macro cross-assembler for a large
variety of microprocessors and microcontrollers, including 6502, 68000, 8051,
ARM, AVR, PIC, Z80, and many others.  It is mainly targeted at embedded
processors and single-board computers.")
    (license license:gpl2)))

;;; ─────────────────────────────────────────────
;;; wrkflw-bin — Validate and execute GitHub Actions locally
;;; ─────────────────────────────────────────────
(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bahdotsh/wrkflw/releases/download/v"
             version "/wrkflw-v" version "-linux-x86_64.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bkqs48ph0b0m96p6v6kgrkh3kbhaqfcc5vvs4lsw5bfk3fizyxy"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file %build-inputs
                                           "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib"))
                 (rpath (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir (string-append out "/bin")))
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname gzip)))
            (invoke tar "xzf" src)
            (mkdir-p bin-dir)
            (install-file "wrkflw" bin-dir)
            (chmod (string-append bin-dir "/wrkflw") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/wrkflw"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/wrkflw"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "Validate and run GitHub Actions workflows locally")
    (description
     "Wrkflw lets you validate and execute GitHub Actions workflow files
on your local machine, without needing to push to GitHub.  Useful for
testing CI/CD pipelines during development.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; iwmenu-bin — Launcher-driven Wi-Fi manager (binary)
;;; ─────────────────────────────────────────────
(define-public iwmenu-bin
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/iwmenu/releases/download/v"
             version "/iwmenu-x86_64-linux-gnu"))
       (file-name (string-append name "-" version))
       (sha256
        (base32 "1pwkv6a8h5kx82dn7wpd9n701i510v2zwjzykd66r9rpm9pkc2rf"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file %build-inputs
                                           "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib"))
                 (rpath (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/iwmenu"))
            (chmod (string-append bin-dir "/iwmenu") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/iwmenu"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/iwmenu"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "Launcher-driven Wi-Fi manager for Linux")
    (description
     "Iwmenu is a launcher-driven Wi-Fi network manager for Linux.  It
integrates with launchers like dmenu, rofi, or fuzzel to provide a simple
interactive interface for connecting to, disconnecting from, and managing
Wi-Fi networks via iwd.")
    (license license:gpl3)))

;;; ─────────────────────────────────────────────
;;; bzmenu-bin — Launcher-driven Bluetooth manager (binary)
;;; ─────────────────────────────────────────────
(define-public bzmenu-bin
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/bzmenu/releases/download/v"
             version "/bzmenu-x86_64-linux-gnu"))
       (file-name (string-append name "-" version))
       (sha256
        (base32 "0ggnand2ih6s1si6amp0mnl9r6d4gjj65vx03kysmzdvggxy71a2"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file %build-inputs
                                           "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib"))
                 (rpath (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/bzmenu"))
            (chmod (string-append bin-dir "/bzmenu") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/bzmenu"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/bzmenu"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "Launcher-driven Bluetooth manager for Linux")
    (description
     "Bzmenu is a launcher-driven Bluetooth device manager for Linux.  It
integrates with launchers like dmenu, rofi, or fuzzel to provide a simple
interactive interface for pairing, connecting to, and managing Bluetooth
devices.")
    (license license:gpl3)))

;;; ─────────────────────────────────────────────
;;; pwmenu-bin — Launcher-driven audio manager (binary)
;;; ─────────────────────────────────────────────
(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/pwmenu/releases/download/v"
             version "/pwmenu-x86_64-linux-gnu"))
       (file-name (string-append name "-" version))
       (sha256
        (base32 "0gj12lpwx6zw3p6gcda1gq7cr5frsvzzq1plra2sm511m0lg3rbj"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file %build-inputs
                                           "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib"))
                 (rpath (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/pwmenu"))
            (chmod (string-append bin-dir "/pwmenu") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/pwmenu"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/pwmenu"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "Launcher-driven audio manager for Linux")
    (description
     "Pwmenu is a launcher-driven audio manager for Linux using PipeWire.
It integrates with launchers like dmenu, rofi, or fuzzel to provide a
simple interactive interface for switching audio sinks, sources, and
controlling volume.")
    (license license:gpl3)))
