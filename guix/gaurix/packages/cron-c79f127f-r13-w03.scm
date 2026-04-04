;;; Worker w03 batch (r13): resolve blocked packages.
(define-module (gaurix packages cron-c79f127f-r13-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (web uri)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages python)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xorg)
  #:export (rvgl-bin
            xlibre-xserver-devel-git
            xlibre-xserver-common-git
            archlinux-java-run
            auto-auto-complete
            firefox-beta-bin
            jdk-temurin
            aspnet-runtime-bin))


;;; ─── 1. rvgl-bin ─────────────────────────────────────────────────────────────
;;; Binary repackage of RVGL (Re-Volt GL), a rewrite of the 1999 RC car
;;; racing game Re-Volt.  Upstream distributes Linux binaries as a 7z archive.

(define-public rvgl-bin
  (package
    (name "rvgl-bin")
    (version "23.1030a1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://rvgl.org/downloads/rvgl_"
                           version "_linux.7z"))
       (sha256
        (base32 "0pna5la4qbvwcdk7bnypaqgjinxs54cv3lclhgdvxlrdrfjd2pyi"))))
    (build-system trivial-build-system)
    (native-inputs
     (list (@ (gnu packages compression) 7zip)))
    (inputs
     (list bash-minimal
           sdl2
           sdl2-image
           glibc))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source  (assoc-ref %build-inputs "source"))
                 (sevenz  (search-input-file %build-inputs "/bin/7z"))
                 (out     #$output)
                 (libdir  (string-append out "/lib/rvgl"))
                 (bindir  (string-append out "/bin")))
            (mkdir-p libdir)
            (mkdir-p bindir)
            (invoke sevenz "x" (string-append "-o" libdir) source)
            ;; Create wrapper script
            (let ((wrapper (string-append bindir "/rvgl")))
              (call-with-output-file wrapper
                (lambda (port)
                  (format port "#!~a~%exec ~a/rvgl \"$@\"~%"
                          (search-input-file %build-inputs "/bin/bash")
                          libdir)))
              (chmod wrapper #o755))))))
    (home-page "https://rvgl.org")
    (synopsis "Rewrite of Re-Volt, a popular R/C car racing game from 1999")
    (description
     "RVGL is a modern rewrite of Re-Volt, the popular R/C car racing game
originally released in 1999.  It runs natively on GNU/Linux and supports
modern hardware and operating systems.  The original game data is required
to play.")
    (license (license:non-copyleft
              "https://rvgl.org"
              "Proprietary freeware binary distribution"))))


;;; ─── 2. xlibre-xserver-devel-git ────────────────────────────────────────────
;;; Compatibility alias mapping the AUR xlibre-xserver-devel-git package to
;;; the upstream Guix xorg-server package.

(define-public xlibre-xserver-devel-git
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-devel-git")
    (synopsis "Compatibility alias for XLibre X server development files")
    (description
     "This package maps the AUR @code{xlibre-xserver-devel-git} package to
the upstream Guix @code{xorg-server} package.  XLibre is a community fork
of the Xorg X server; the development files are functionally equivalent.")))


;;; ─── 3. xlibre-xserver-common-git ───────────────────────────────────────────
;;; Compatibility alias mapping xlibre-xserver-common-git to xorg-server.

(define-public xlibre-xserver-common-git
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-common-git")
    (synopsis "Compatibility alias for XLibre X server common files")
    (description
     "This package maps the AUR @code{xlibre-xserver-common-git} package to
the upstream Guix @code{xorg-server} package.  XLibre is a community fork
of the Xorg X server; the common server files are equivalent.")))


;;; ─── 4. archlinux-java-run ──────────────────────────────────────────────────
;;; A Java application launcher script.

(define-public archlinux-java-run
  (package
    (name "archlinux-java-run")
    (version "12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/michaellass/archlinux-java-run"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "1p52kldkmf2j15v391j99scix896s6vflvf937b5jgmfmbl5x4yy"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "DESTDIR="))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'check))
      #:tests? #f))
    (inputs (list bash-minimal))
    (home-page "https://github.com/michaellass/archlinux-java-run")
    (synopsis "Java application launcher for selecting Java runtimes")
    (description
     "The @code{archlinux-java-run} script launches Java applications using a
preferred Java runtime, automatically selecting an appropriate version from
those installed on the system.")
    (license license:expat)))


;;; ─── 5. auto-auto-complete ──────────────────────────────────────────────────
;;; Generates shell tab-completion scripts for Bash, Zsh, and Fish.

(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/auto-auto-complete/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0lnk02ivkl85c6qv0jnmic3bck2ma6y62q5i0ccy53kdwlppjclb"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "MANPREFIX=" #$output "/share/man"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-after 'unpack 'fix-python-shebangs
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((python (assoc-ref inputs "python")))
                (substitute* "auto-auto-complete"
                  (("#!/usr/bin/env python3")
                   (string-append "#!" python "/bin/python3"))))))
          (delete 'check))
      #:tests? #f))
    (inputs (list python))
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (synopsis "Autogenerate shell tab-completion scripts")
    (description
     "auto-auto-complete generates tab-completion scripts for Bash, Zsh, and
Fish from a single, simple, shell-independent description of a command's
options and arguments.")
    (license license:isc)))


;;; ─── 6. firefox-beta-bin ────────────────────────────────────────────────────
;;; Binary repackage of the Mozilla Firefox Beta channel.

(define-public firefox-beta-bin
  (package
    (name "firefox-beta-bin")
    (version "150.0b4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://archive.mozilla.org/pub/firefox/releases/"
             version "/linux-x86_64/en-US/firefox-" version ".tar.xz"))
       (sha256
        (base32 "1iq9k82kifc2n5xabavw1lj77nhn991ri6l036dkwk1jfhwkyi3b"))))
    (build-system trivial-build-system)
    (native-inputs (list tar xz))
    (inputs
     (list bash-minimal
           glibc
           gtk+
           nss))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source (assoc-ref %build-inputs "source"))
                 (tar    (search-input-file %build-inputs "/bin/tar"))
                 (xz     (search-input-file %build-inputs "/bin/xz"))
                 (out    #$output)
                 (libdir (string-append out "/lib/firefox-beta"))
                 (bindir (string-append out "/bin")))
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname xz)))
            (mkdir-p libdir)
            (mkdir-p bindir)
            (invoke tar "xf" source "-C" libdir "--strip-components=1")
            ;; Create wrapper script
            (let ((wrapper (string-append bindir "/firefox-beta")))
              (call-with-output-file wrapper
                (lambda (port)
                  (format port "#!~a~%exec ~a/firefox \"$@\"~%"
                          (search-input-file %build-inputs "/bin/bash")
                          libdir)))
              (chmod wrapper #o755))))))
    (home-page "https://www.mozilla.org/en-US/firefox/channel/#beta")
    (synopsis "Mozilla Firefox web browser (Beta channel)")
    (description
     "Firefox Beta is the pre-release channel of the Mozilla Firefox web
browser.  It provides early access to upcoming features and improvements
before they reach the stable release.")
    (license license:mpl2.0)))


;;; ─── 7. jdk-temurin ─────────────────────────────────────────────────────────
;;; Binary repackage of Eclipse Temurin (Adoptium) JDK.

(define-public jdk-temurin
  (package
    (name "jdk-temurin")
    (version "25.0.2+10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin25-binaries/releases"
             "/download/jdk-" (uri-encode version)
             "/OpenJDK25U-jdk_x64_linux_hotspot_"
             (string-map (lambda (c) (if (char=? c #\+) #\_ c)) version)
             ".tar.gz"))
       (sha256
        (base32 "1f4airqvyv8sq178014ashgkw3a482v77qyy8qw87fb47f9qfwwq"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal glibc))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source (assoc-ref %build-inputs "source"))
                 (tar    (search-input-file %build-inputs "/bin/tar"))
                 (gzip   (search-input-file %build-inputs "/bin/gzip"))
                 (out    #$output)
                 (jdk    (string-append out "/lib/jvm/temurin-25"))
                 (bindir (string-append out "/bin")))
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (mkdir-p jdk)
            (mkdir-p bindir)
            (invoke tar "xf" source "-C" jdk "--strip-components=1")
            ;; Symlink key binaries
            (for-each
             (lambda (prog)
               (let ((src (string-append jdk "/bin/" prog))
                     (dst (string-append bindir "/" prog)))
                 (when (file-exists? src)
                   (symlink src dst))))
             '("java" "javac" "jar" "jshell" "javadoc"
               "jlink" "jmod" "jpackage"))))))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JDK (Adoptium OpenJDK binary distribution)")
    (description
     "Eclipse Temurin provides prebuilt OpenJDK binaries from the Adoptium
project (formerly AdoptOpenJDK).  This package includes the full JDK with
compiler, runtime, and development tools for Java 25.")
    (license license:gpl2+)))


;;; ─── 8. aspnet-runtime-bin ──────────────────────────────────────────────────
;;; Binary repackage of the ASP.NET Core runtime from Microsoft.

(define-public aspnet-runtime-bin
  (package
    (name "aspnet-runtime-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
             version "/aspnetcore-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0fxsiaq4lgn5kwxmlsmq0j0v0hgcywhlg8smdwv89mddnq1n642b"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal glibc))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source (assoc-ref %build-inputs "source"))
                 (tar    (search-input-file %build-inputs "/bin/tar"))
                 (gzip   (search-input-file %build-inputs "/bin/gzip"))
                 (out    #$output)
                 (dotnet (string-append out "/share/dotnet"))
                 (bindir (string-append out "/bin")))
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (mkdir-p dotnet)
            (mkdir-p bindir)
            (invoke tar "xf" source "-C" dotnet)
            ;; Symlink the dotnet executable if present
            (let ((exe (string-append dotnet "/dotnet")))
              (when (file-exists? exe)
                (symlink exe (string-append bindir "/dotnet"))))))))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis "ASP.NET Core runtime (binary distribution)")
    (description
     "The ASP.NET Core runtime enables running ASP.NET Core web applications
and services.  This binary package provides the pre-built runtime from
Microsoft for GNU/Linux x86_64.")
    (license license:expat)))
