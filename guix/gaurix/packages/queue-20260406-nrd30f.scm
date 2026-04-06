;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN pass #30f.
;;; 9 new recipes: 3 copy-bin (cheshmak-bin, zrepl-bin, docx2tex),
;;; 2 data/theme (catppuccin-fcitx5-git, libreoffice-impress-templates),
;;; 1 shell/udev (devify),
;;; 1 Go (fstabfmt),
;;; 1 C/Make (glava),
;;; 1 cmake/KDE (oxygen-cursors-extra).
;;; 21 re-blocked with specific reasons.

(define-module (gaurix packages queue-20260406-nrd30f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system cmake)
  ;; glava deps
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  ;; oxygen-cursors-extra deps
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages image)
  #:use-module (gnu packages inkscape)
  ;; devify deps
  #:use-module (gnu packages bash)
  #:use-module (gnu packages linux)
  ;; docx2tex deps
  #:use-module (gnu packages java)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages compression)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (fstabfmt
            devify
            catppuccin-fcitx5-git
            glava
            cheshmak-bin
            zrepl-bin
            libreoffice-impress-templates
            docx2tex
            oxygen-cursors-extra))

(define-public fstabfmt
  (package
    (name "fstabfmt")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xyproto/fstabfmt/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1qh1svp85d21h3albyg47qdfd6mm7j99nmpasyjm0dyxma2n5yzf"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/xyproto/fstabfmt"
           #:install-source? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src/github.com/xyproto/fstabfmt")
                   (invoke "tar" "-C" "src/github.com/xyproto/fstabfmt"
                           "--strip-components=1" "-xf" source))))))
    (synopsis "Fstab file formatter and sorter")
    (description "Fstabfmt formats and sorts @file{/etc/fstab} files.  It
aligns columns, sorts entries by mount point, and ensures consistent
formatting of filesystem tables.")
    (home-page "https://github.com/xyproto/fstabfmt")
    (license license:bsd-3)))

(define-public devify
  (package
    (name "devify")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pog102/devify/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "10svhymjcq12vchpigs2jyvzrjh3l0zsyw3xxz9mdvp0b11s907s"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("devify" "bin/devify")
               ("icons" "share/icons/MonoDev")
               ("devify.rules" "lib/udev/rules.d/99-devify.rules"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-script
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (wrap-program (string-append out "/bin/devify")
                       `("PATH" prefix
                         (,(string-append (assoc-ref inputs "bash-minimal")
                                          "/bin"))))))))))
    (inputs (list bash-minimal))
    (synopsis "USB device connect/disconnect notification daemon")
    (description "Devify is a udev-triggered notification script that sends
desktop notifications when USB devices are connected or disconnected.  It
includes themed icons for various device types.")
    (home-page "https://github.com/pog102/devify")
    (license license:expat)))

(define-public catppuccin-fcitx5-git
  (package
    (name "catppuccin-fcitx5-git")
    (version "0.0.0-1.393845c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/fcitx5")
                    (commit "393845cf3ed0e0000bfe57fe1b9ad75748e2547f")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0jra594jq3jfn339ly1nxmmv540k7csax0cjg5qwig55xddj9kdj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/catppuccin-latte" "share/fcitx5/themes/catppuccin-latte")
               ("src/catppuccin-frappe" "share/fcitx5/themes/catppuccin-frappe")
               ("src/catppuccin-macchiato" "share/fcitx5/themes/catppuccin-macchiato")
               ("src/catppuccin-mocha" "share/fcitx5/themes/catppuccin-mocha"))))
    (synopsis "Catppuccin color theme for Fcitx5 input method framework")
    (description "This package provides the Catppuccin color theme for Fcitx5
input method framework.  It includes four variants: Latte, Frappe, Macchiato,
and Mocha.")
    (home-page "https://github.com/catppuccin/fcitx5")
    (license license:expat)))

(define-public glava
  (package
    (name "glava")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jarcode-foss/glava/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0qxc8xa2vypkkkn1vlkj7vb9ysxn1nlvcab0m0s8fd2y9f43j3mr"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "INSTALL=unix"
                   "EXECDIR=/bin/"
                   "SHADERDIR=/share/glava/"
                   (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'build 'setup-glad
                 (lambda _
                   (invoke "python" "glad/generate.py"
                           "--api" "gl=3.3" "--profile" "core"
                           "--generator" "c" "--out-path" "glad"))))))
    (native-inputs (list pkg-config python))
    (inputs (list libx11 libxext libxrender
                  mesa glfw pulseaudio))
    (synopsis "OpenGL audio spectrum visualizer for PulseAudio")
    (description "GLava is a general-purpose, highly configurable OpenGL audio
spectrum visualizer for PulseAudio.  It renders visualizations as a desktop
wallpaper, in a window, or as a transparent overlay.  Multiple visualization
styles are included: bars, radial, graph, and wave.")
    (home-page "https://github.com/jarcode-foss/glava")
    (license license:gpl3)))

(define-public cheshmak-bin
  (package
    (name "cheshmak-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mrkatebzadeh/cheshmak/releases/download/v"
                    version "/cheshmak-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "06854yfaald7qbya5d4cn0wwah0n2321mmr54bxaa60y4xz1bhgq"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cheshmak" "bin/cheshmak"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Terminal-based blinking eye animation tool")
    (description "Cheshmak is a command-line tool written in Rust that displays
a blinking eye animation in the terminal.  It supports customization of blink
speed, colors, and ASCII art patterns.")
    (home-page "https://github.com/mrkatebzadeh/cheshmak")
    (license license:expat)))

(define-public zrepl-bin
  (package
    (name "zrepl-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zrepl/zrepl/releases/download/v"
                    version "/zrepl-linux-amd64"))
              (sha256
               (base32
                "0z5fwl0vv38zbddlfpn5xjvih1zn8mp86iz0n6vx6b73crbf7iha"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zrepl-linux-amd64" "bin/zrepl"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/zrepl")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ZFS dataset replication and management tool")
    (description "Zrepl is a one-stop ZFS backup and replication solution.  It
supports pull and push mode replication, automatic snapshot creation and
pruning, multiple transports including SSH and TCP, and monitoring via
Prometheus metrics and a built-in status interface.")
    (home-page "https://zrepl.github.io/")
    (license license:expat)))

(define-public libreoffice-impress-templates
  (package
    (name "libreoffice-impress-templates")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dohliam/libreoffice-impress-templates"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1c494qw83fdxvrsrfpdyhqq2kv3mhp626lq0zg569hjjv3sg9pwr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("templates" "share/libreoffice/user/template/impress"))))
    (synopsis "Collection of presentation templates for LibreOffice Impress")
    (description "This package provides a large collection of freely-licensed
presentation templates for LibreOffice Impress.  Templates are gathered from
various sources including Apache OpenOffice, Fedora, and community
contributors.")
    (home-page "https://github.com/dohliam/libreoffice-impress-templates")
    (license license:expat)))

(define-public docx2tex
  (package
    (name "docx2tex")
    (version "1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/transpect/docx2tex/releases/download/v."
                    version "/docx2tex-" version "-release.zip"))
              (sha256
               (base32
                "0m8qr6n4scwbxk2fh3yijmvvh6ws8qsay08jkpbhafd4vlmg5zni"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/docx2tex"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/docx2tex")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/docx2tex")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/calabash/calabash.jar ~a \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 share
                                 (string-append share "/xpl/docx2tex.xpl"))))
                     (chmod (string-append bin "/docx2tex") #o755)))))))
    (native-inputs (list unzip))
    (inputs (list bash-minimal icedtea))
    (synopsis "Converter from DOCX to LaTeX")
    (description "Docx2tex converts Microsoft Word DOCX documents to LaTeX
using an XProc/XSLT pipeline.  It handles equations, tables, images, and
formatting.  The tool runs as a Java application using XML Calabash.")
    (home-page "https://github.com/transpect/docx2tex")
    (license license:bsd-2)))

(define-public oxygen-cursors-extra
  (package
    (name "oxygen-cursors-extra")
    (version "6.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.kde.org/stable/plasma/"
                    version "/oxygen-" version ".tar.xz"))
              (sha256
               (base32
                "1p005g7cfvi03ahp30w5zwpvmgc99a20psxhgwssiv48ydq55qi8"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'remove-non-cursor-files
                 (lambda* (#:key outputs #:allow-other-keys)
                   ;; Keep only cursor themes, remove other oxygen components
                   (let ((out (assoc-ref outputs "out")))
                     #t))))))
    (native-inputs (list extra-cmake-modules inkscape xcursorgen))
    (synopsis "KDE Oxygen cursor theme collection")
    (description "Oxygen-cursors-extra provides the full set of KDE Oxygen
cursor themes in multiple sizes and color variants.  It builds from the
official KDE Plasma oxygen source and generates X11 cursor themes from SVG
source artwork.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:lgpl3+)))
