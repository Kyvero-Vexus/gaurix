;;; Chunk-local package module for blocked-tree run cron-c79f127f-r8 worker w01.
(define-module (gaurix packages cron-c79f127f-r8-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages cinnamon)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages web)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages man)
  #:autoload (gnu packages) (specification->package)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (httpdirfs
            paru
            openssl-1.1
            html2markdown
            xapp-thumbnailers-common
            qt5-doc
            auto-auto-complete
            archlinux-java-run
            gnome-icon-theme-symbolic
            doas))

;;; ─── Strategy A: upstream Guix aliases ───────────────────────────────────────

(define-public openssl-1.1
  ;; Guix ships openssl 1.1.1u; AUR wants 1.1.1w.  Alias for compatibility.
  (let ((upstream (specification->package "openssl@1.1.1u")))
    (package
      (inherit upstream)
      (name "openssl-1.1")
      (synopsis "Compatibility alias mapping openssl-1.1 to upstream OpenSSL 1.1")
      (description
       "This package maps the AUR @code{openssl-1.1} name to the upstream
Guix @code{openssl} 1.1.x package, providing the legacy OpenSSL 1.1 branch."))))

(define-public doas
  ;; Guix ships opendoas 6.8.2; AUR package 'doas' is the same software.
  (let ((upstream (specification->package "opendoas")))
    (package
      (inherit upstream)
      (name "doas")
      (synopsis "Compatibility alias mapping doas to upstream opendoas")
      (description
       "This package maps the AUR @code{doas} name to the upstream Guix
@code{opendoas} package, a minimal replacement for sudo from the OpenBSD
project."))))

(define-public gnome-icon-theme-symbolic
  ;; gnome-icon-theme-symbolic is the legacy name for the GNOME symbolic icons
  ;; now provided by adwaita-icon-theme.
  (let ((upstream (specification->package "adwaita-icon-theme")))
    (package
      (inherit upstream)
      (name "gnome-icon-theme-symbolic")
      (synopsis "Compatibility alias mapping gnome-icon-theme-symbolic to adwaita-icon-theme")
      (description
       "This package maps the AUR @code{gnome-icon-theme-symbolic} name to the
upstream Guix @code{adwaita-icon-theme}, which is the modern successor providing
GNOME's symbolic icon set."))))

(define-public qt5-doc
  ;; Qt5 documentation is not separately packaged in Guix.  Map to qttools@5
  ;; which includes qdoc and Qt Assistant for working with Qt documentation.
  (let ((upstream (specification->package "qttools@5")))
    (package
      (inherit upstream)
      (name "qt5-doc")
      (synopsis "Compatibility alias mapping qt5-doc to upstream qttools (Qt5)")
      (description
       "This package maps the AUR @code{qt5-doc} name to the upstream Guix
@code{qttools} for Qt5.  While Guix does not ship the full pre-built Qt5
documentation, @code{qttools} provides @command{qdoc} and Qt Assistant for
browsing and generating Qt documentation."))))

(define-public paru
  ;; Paru is an Arch Linux AUR helper wrapping pacman.  On Guix the native
  ;; package manager fulfills the same role.  Alias to guix itself.
  (let ((upstream (specification->package "guix")))
    (package
      (inherit upstream)
      (name "paru")
      (synopsis "Compatibility stub mapping AUR helper paru to the Guix package manager")
      (description
       "Paru is an AUR helper for Arch Linux.  Since Guix is a functional
package manager that already provides equivalent functionality (building from
source, managing packages), this compatibility package maps @code{paru} to the
Guix package manager."))))

(define-public archlinux-java-run
  ;; archlinux-java-run is an Arch-specific Java launcher script.  On Guix,
  ;; Java is managed via profiles and icedtea/openjdk packages.  Map to
  ;; bash-minimal as a stub since the actual script is Arch-specific.
  (let ((upstream (specification->package "bash-minimal")))
    (package
      (inherit upstream)
      (name "archlinux-java-run")
      (synopsis "Compatibility stub for Arch Linux Java launcher")
      (description
       "The @code{archlinux-java-run} package is an Arch Linux-specific Java
application launcher.  On Guix, Java runtime selection is handled through
profiles and environment variables.  This compatibility stub provides a
placeholder."))))

;;; ─── Strategy B: binary repack ───────────────────────────────────────────────

(define-public html2markdown
  (package
    (name "html2markdown")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/JohannesKaufmann/html-to-markdown"
             "/releases/download/v" version
             "/html-to-markdown_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0yq4n71m0ahd9wv52qm6b7j20hanvb5nyyckyv3gwmf2944ilx0c"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source (assoc-ref %build-inputs "source"))
                 (tar    (assoc-ref %build-inputs "tar"))
                 (gzip   (assoc-ref %build-inputs "gzip"))
                 (bin    (string-append #$output "/bin")))
            (setenv "PATH" (string-append tar "/bin:" gzip "/bin"))
            (invoke "tar" "xzf" source)
            (mkdir-p bin)
            (install-file "html2markdown" bin)
            (chmod (string-append bin "/html2markdown") #o755)))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://html-to-markdown.com")
    (synopsis "Convert HTML to Markdown from the command line")
    (description
     "html2markdown is a command-line tool written in Go that converts HTML
content into clean Markdown.  It supports various HTML elements and produces
well-formatted Markdown output.")
    (license license:expat)))

;;; ─── Strategy C: source builds ───────────────────────────────────────────────

(define-public httpdirfs
  (package
    (name "httpdirfs")
    (version "1.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fangfufu/httpdirfs/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1wz9amh32fnrz57l2j3g66q7sxrms8g4mpcs3fbk4cggm98nipn7"))))
    (build-system meson-build-system)
    (native-inputs
     (list pkg-config help2man))
    (inputs
     (list gumbo-parser fuse curl expat openssl `(,util-linux "lib")))
    (home-page "https://github.com/fangfufu/httpdirfs")
    (synopsis "Mount HTTP directory listings as a file system")
    (description
     "HTTPDirFS is a FUSE filesystem that mounts HTTP directory listings.
It allows you to browse web server directory indexes as if they were local
directories, enabling transparent access to files hosted on HTTP servers.")
    (license license:gpl3+)))

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
          (delete 'check))  ; no test suite
      #:tests? #f))
    (inputs (list python))
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (synopsis "Autogenerate shell tab-completion scripts")
    (description
     "auto-auto-complete generates tab-completion scripts for Bash, Zsh, and
Fish from a single, simple, shell-independent description of a command's
options and arguments.")
    (license license:isc)))

(define-public xapp-thumbnailers-common
  (package
    (name "xapp-thumbnailers-common")
    (version "1.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/linuxmint/xapp-thumbnailers/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "04cqrn40lrl0wbmj6d2fmqi9lmxph9c6539gx65n6g5d7vcmszxb"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-install-dir
            (lambda _
              ;; The meson.build installs to '/' which doesn't work in Guix.
              ;; Patch it to install under the output prefix.
              (substitute* "meson.build"
                (("install_dir: '/'")
                 (string-append "install_dir: '" #$output "'"))))))
      #:tests? #f))  ; no test suite
    (inputs
     (list python
           python-pygobject
           python-pillow
           libxapp
           gdk-pixbuf))
    (home-page "https://github.com/linuxmint/xapp-thumbnailers")
    (synopsis "Common files for XApp thumbnailer plugins")
    (description
     "This package provides common support files for XApp thumbnailer plugins
used in Cinnamon and other Linux Mint desktop environments.  It includes
thumbnailers for various file formats like EPUB, MP3, AppImage, and more.")
    (license license:gpl3+)))
