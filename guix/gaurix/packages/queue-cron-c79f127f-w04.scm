(define-module (gaurix packages queue-cron-c79f127f-w04)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:autoload (gnu packages) (specification->package)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (llvm-libs-minimal-git
            hyprtoolkit-git
            wayfire
            python-sse-starlette
            hyprshot
            logmein-hamachi
            ps3-env))

(define (pkg spec)
  (specification->package spec))

(define (gaurix-alias-package alias target)
  (package
    (inherit (pkg target))
    (name alias)))

(define-public llvm-libs-minimal-git
  (gaurix-alias-package "llvm-libs-minimal-git" "llvm"))

(define %hyprtoolkit-commit
  "f3e4245c8493d78c909ebe821544d3c6bab951ae")

(define-public hyprtoolkit-git
  (package
    (name "hyprtoolkit-git")
    (version (git-version "0.0.0" "97" %hyprtoolkit-commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hyprwm/hyprtoolkit.git")
             (commit %hyprtoolkit-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c5v3xavhnbh2hy2aci4rr5jhvs9ix6mqj7i98sdbsn513x44bav"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags #~(list "-GNinja")))
    (native-inputs
     (list
      (list "ninja" (pkg "ninja"))
      (list "pkg-config" (pkg "pkg-config"))))
    (inputs
     (list
      (list "aquamarine" (pkg "aquamarine"))
      (list "hyprgraphics" (pkg "hyprgraphics"))
      (list "hyprlang" (pkg "hyprlang"))
      (list "hyprutils" (pkg "hyprutils"))
      (list "hyprwayland-scanner" (pkg "hyprwayland-scanner"))
      (list "iniparser" (pkg "iniparser"))
      (list "libdrm" (pkg "libdrm"))
      (list "libxkbcommon" (pkg "libxkbcommon"))
      (list "mesa" (pkg "mesa"))
      (list "pango" (pkg "pango"))
      (list "pixman" (pkg "pixman"))
      (list "wayland" (pkg "wayland"))))
    (home-page "https://github.com/hyprwm/hyprtoolkit")
    (synopsis "Modern C++ Wayland-native GUI toolkit")
    (description
     "Hyprtoolkit is a modern C++ toolkit for Wayland-native graphical
applications, developed for the Hyprland ecosystem.")
    (license license:bsd-3)))

(define-public wayfire
  (package
    (name "wayfire")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/WayfireWM/wayfire/releases/download/v"
             version "/wayfire-" version ".tar.xz"))
       (sha256
        (base32 "1y7izkrjy3i0ngmmyvpdffiazj88nkh6gqpizck0292qx55cjmwj"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-Duse_system_wfconfig=enabled"
              "-Duse_system_wlroots=enabled"
              "-Dtests=disabled"
              "-Dxwayland=enabled"
              "-Dcustom_pch=false")))
    (native-inputs
     (list
      (list "cmake" (pkg "cmake"))
      (list "doctest" (pkg "doctest"))
      (list "glm" (pkg "glm"))
      (list "meson" (pkg "meson"))
      (list "ninja" (pkg "ninja"))
      (list "nlohmann-json" (pkg "nlohmann-json"))
      (list "pkg-config" (pkg "pkg-config"))
      (list "vulkan-headers" (pkg "vulkan-headers"))
      (list "wayland-protocols" (pkg "wayland-protocols"))))
    (inputs
     (list
      (list "cairo" (pkg "cairo"))
      (list "libinput" (pkg "libinput"))
      (list "libjpeg" (pkg "libjpeg"))
      (list "pango" (pkg "pango"))
      (list "wf-config" (pkg "wf-config"))
      (list "wlroots" (pkg "wlroots"))
      (list "yyjson" (pkg "yyjson"))))
    (home-page "https://wayfire.org")
    (synopsis "3D Wayland compositor")
    (description
     "Wayfire is a 3D Wayland compositor inspired by Compiz.  It supports
plugins, window effects, and modern Wayland workflows.")
    (license license:expat)))

(define-public python-sse-starlette
  (package
    (name "python-sse-starlette")
    (version "3.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/s/sse_starlette/"
             "sse_starlette-" version ".tar.gz"))
       (sha256
        (base32 "1wdyqwvp2zhfy35c7nqyq154hywliq1ar59834km92mgcz02zyda"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'relax-dependency-constraints
            (lambda _
              (substitute* "pyproject.toml"
                (("starlette>=0\\.49\\.1") "starlette")
                (("anyio>=4\\.7\\.0") "anyio")))))))
    (propagated-inputs
     (list
      (list "python-anyio" (pkg "python-anyio"))
      (list "python-starlette" (pkg "python-starlette"))))
    (native-inputs
     (list
      (list "python-setuptools" (pkg "python-setuptools"))))
    (home-page "https://github.com/sysid/sse-starlette")
    (synopsis "Server Sent Events support for Starlette and FastAPI")
    (description
     "SSE-Starlette adds Server-Sent Events support to Starlette and FastAPI
applications.")
    (license license:bsd-3)))

(define-public hyprshot
  (package
    (name "hyprshot")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Gustash/Hyprshot/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0fb79wll1w63bamzhvirfgc88khj6aylg15gp48xhwz4dvkdnnri"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (license-dir (string-append out "/share/licenses/hyprshot")))
                (mkdir-p bin)
                (mkdir-p license-dir)
                (install-file "hyprshot" bin)
                (chmod (string-append bin "/hyprshot") #o755)
                (install-file "LICENSE" license-dir)))))))
    (propagated-inputs
     (list
      (list "bash" (pkg "bash"))
      (list "grim" (pkg "grim"))
      (list "jq" (pkg "jq"))
      (list "libnotify" (pkg "libnotify"))
      (list "slurp" (pkg "slurp"))
      (list "wl-clipboard" (pkg "wl-clipboard"))))
    (home-page "https://github.com/Gustash/Hyprshot")
    (synopsis "Utility to take screenshots in Hyprland")
    (description
     "Hyprshot is a utility script to take area, window, and monitor
screenshots in Hyprland and copy results to the clipboard.")
    (license license:gpl3)))

(define-public logmein-hamachi
  (package
    (name "logmein-hamachi")
    (version "2.1.0.203")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vpn.net/installers/logmein-hamachi-"
             version "-x64.tgz"))
       (sha256
        (base32 "0zy0jzvdqccfsg42m2lq1rj8r2c4iypd1h9vxl9824cbl92yim37"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (opt (string-append out "/opt/logmein-hamachi"))
                     (bin (string-append opt "/bin"))
                     (doc (string-append out "/share/doc/logmein-hamachi")))
                (mkdir-p bin)
                (mkdir-p doc)
                (for-each
                 (lambda (file)
                   (install-file file bin)
                   (chmod (string-append bin "/" file) #o755))
                 '("hamachid" "dnsup" "dnsdown"))
                (for-each
                 (lambda (file)
                   (install-file file doc))
                 '("README" "CHANGES" "LICENSE"))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append bin "/hamachid")
                         (string-append out "/bin/hamachi"))))))))
    (home-page "https://www.vpn.net/linux")
    (synopsis "Zero-configuration VPN service client")
    (description
     "LogMeIn Hamachi is a hosted VPN client that creates virtual private
networks between computers.  This package installs the Linux binary client.")
    (license (license:non-copyleft
              "https://www.vpn.net/"
              "Proprietary LogMeIn Hamachi license"))))

(define-public ps3-env
  (package
    (name "ps3-env")
    (version "20230409")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ps3-env.tar.gz")
       (sha256
        (base32 "0nqnvjfn95r3bqlzcqmlghyhzxx1px50c7fa14mfwbh41zn0blin"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (prefix (string-append out "/opt/ps3dev"))
                     (modules-dir (string-append out "/etc/modules/modulefiles")))
                (mkdir-p prefix)
                (for-each
                 (lambda (file)
                   (install-file file prefix))
                 '("ps3toolchain.sh" "ps3libraries.sh"
                   "modulefile_ps3toolchain" "modulefile_ps3libraries"))
                (mkdir-p modules-dir)
                (symlink (string-append prefix "/modulefile_ps3toolchain")
                         (string-append modules-dir "/ps3toolchain"))
                (symlink (string-append prefix "/modulefile_ps3libraries")
                         (string-append modules-dir "/ps3libraries"))))))))
    (home-page "https://github.com/ps3dev/ps3toolchain")
    (synopsis "Environment setup files for PS3 homebrew toolchains")
    (description
     "ps3-env provides shell snippets and environment module files used by
PS3 homebrew development toolchains.")
    (license license:expat)))
