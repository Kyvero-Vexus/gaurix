;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260425b
;;; Resolves 100 packages from queue (TODO items 18379-18517).
;;;
;;; New recipes (36):
;;;     1. fvim-bin (copy-build-system, v0.2.1, expat)
;;;     2. intentrace-bin (copy-build-system, v0.8.0, expat)
;;;     3. infer-bin (copy-build-system, v1.2.0, expat)
;;;     4. ilorest-bin (copy-build-system, v4.6.0, proprietary)
;;;     5. mirrord-bin (copy-build-system, v3.120.0, expat)
;;;     6. veloren-bin (copy-build-system, v0.17.0, gpl3+)
;;;     7. doot-bin (copy-build-system, v1.2.0, expat)
;;;     8. venera-bin (copy-build-system, v0.7.0, expat)
;;;     9. yazi-nightly-bin (copy-build-system, v0.4.2, expat)
;;;    10. tiny-rdm-bin (copy-build-system, v2.7.0, gpl3)
;;;    11. goneovim-bin (copy-build-system, v0.6.9, expat)
;;;    12. anilibria-winmaclinux (copy-build-system, v1.2.15, gpl3)
;;;    13. epub-reader-bin (copy-build-system, v1.0.0, expat)
;;;    14. intellij-idea-ue-eap (copy-build-system, v2026.1.1, nonfree)
;;;    15. notion-app-enhanced (copy-build-system, v3.4.0, expat)
;;;    16. android-sdk-build-tools-34 (copy-build-system, v34.0.0, nonfree)
;;;    17. intel-opencl-runtime (copy-build-system, v2024.18.1, nonfree)
;;;    18. xhidecursor (gnu-build-system, v0.1, expat)
;;;    19. iprange (gnu-build-system, v1.0.4, gpl2+)
;;;    20. oggfwd (gnu-build-system, v0.2, gpl2+)
;;;    21. t2sz (cmake-build-system, v1.1.2, bsd-3)
;;;    22. qxw (gnu-build-system, v20210901, gpl2+)
;;;    23. xswm-git (gnu-build-system, v0.1, expat)
;;;    24. gnome-shell-extension-status-area-horizontal-spacing (copy-build-system, v24.1, gpl2+)
;;;    25. vlc-materia-skin (copy-build-system, v1.0, gpl3)
;;;    26. keybase-bash-completion (copy-build-system, v1.0, expat)
;;;    27. vim-nushell (copy-build-system, v1.0, expat)
;;;    28. mpv-quality-menu (copy-build-system, v1.0, gpl2+)
;;;    29. mpv-sponsorblock (copy-build-system, v1.0, gpl3)
;;;    30. firefox-clearurls (copy-build-system, v1.0, gpl3)
;;;    31. gnome-shell-extension-tilingshell (copy-build-system, v16.0, gpl2+)
;;;    32. python-pypuppetdb (pyproject-build-system, v3.2.0, asl2.0)
;;;    33. python-etils (pyproject-build-system, v1.8.0, asl2.0)
;;;    34. python-pyodide-lock (pyproject-build-system, v0.1.0, mpl2.0)
;;;    35. battery-notifier (copy-build-system, v1.0, expat)
;;;    36. nmap-netcat (copy-build-system, v7.95, gpl2+)
;;;
;;; BLOCKED (64): see blocked-notes file.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260425b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            fvim-bin
            intentrace-bin
            infer-bin
            ilorest-bin
            mirrord-bin
            veloren-bin
            doot-bin
            venera-bin
            yazi-nightly-bin
            tiny-rdm-bin
            goneovim-bin
            anilibria-winmaclinux
            epub-reader-bin
            intellij-idea-ue-eap
            notion-app-enhanced
            android-sdk-build-tools-34
            intel-opencl-runtime
            xhidecursor
            iprange
            oggfwd
            t2sz
            qxw
            xswm-git
            gnome-shell-extension-status-area-horizontal-spacing
            vlc-materia-skin
            keybase-bash-completion
            vim-nushell
            mpv-quality-menu
            mpv-sponsorblock
            firefox-clearurls
            gnome-shell-extension-tilingshell
            python-pypuppetdb
            python-etils
            python-pyodide-lock
            battery-notifier
            nmap-netcat
            ))

;;; ===== 1. fvim-bin =====

;;; fvim-bin — cross-platform Neovim front-end UI built with F# + Avalonia
(define-public fvim-bin
  (package
    (name "fvim-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yatli/fvim/releases/download/v"
                    version "/fvim-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fvim"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/fvim/FVim")
                              (string-append out "/bin/fvim"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform Neovim front-end UI built with F# and Avalonia")
    (description "FVim is a cross-platform Neovim front-end UI built with F# and
Avalonia, providing GPU-accelerated rendering, ligature support, and a modern UI
for Neovim.")
    (home-page "https://github.com/yatli/fvim")
    (license license:expat)))

;;; ===== 2. intentrace-bin =====

;;; intentrace-bin — strace with intent, a system call tracer with rich context
(define-public intentrace-bin
  (package
    (name "intentrace-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pvolok/intentrace/releases/download/v"
                    version "/intentrace-v" version "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("intentrace" "bin/intentrace"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "strace alternative with rich contextual output")
    (description "Intentrace is a strace alternative that provides rich contextual
output, going further than raw system call tracing to show the intent behind
system calls.")
    (home-page "https://github.com/pvolok/intentrace")
    (license license:expat)))

;;; ===== 3. infer-bin =====

;;; infer-bin — static analysis tool for Java, C++, Objective-C and C by Meta
(define-public infer-bin
  (package
    (name "infer-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/facebook/infer/releases/download/v"
                    version "/infer-linux-x86_64-v" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin" "bin")
                              ("lib" "lib")
                              ("share" "share"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "static analysis tool for Java, C++, Objective-C, and C")
    (description "Infer is a static analysis tool for Java, C++, Objective-C and C,
written in OCaml.  It is used at Meta to find bugs before code ships to
production.")
    (home-page "https://fbinfer.com/")
    (license license:expat)))

;;; ===== 4. ilorest-bin =====

;;; ilorest-bin — HPE RESTful Interface Tool for server management
(define-public ilorest-bin
  (package
    (name "ilorest-bin")
    (version "4.6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1014216295/v"
                    version "/ilorest-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ilorest" "bin/ilorest"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "HPE RESTful Interface Tool for server management")
    (description "HPE iLOrest is a RESTful Interface Tool providing CLI access to
iLO RESTful API for HPE server management, configuration, and provisioning.")
    (home-page "https://hewlettpackard.github.io/python-redfish-utility/")
    (license (license:nonfree
              "https://www.hpe.com/us/en/software/licensing.html"))))

;;; ===== 5. mirrord-bin =====

;;; mirrord-bin — run local code in the context of a cloud environment
(define-public mirrord-bin
  (package
    (name "mirrord-bin")
    (version "3.120.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/metalbear-co/mirrord/releases/download/"
                    version "/mirrord_linux_x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mirrord_linux_x86_64" "bin/mirrord"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "run local code in the context of a cloud environment")
    (description "mirrord lets you run a local process in the context of your
cloud environment.  It mirrors traffic, DNS, file access, and environment
variables from a remote Kubernetes pod to your local process.")
    (home-page "https://mirrord.dev/")
    (license license:expat)))

;;; ===== 6. veloren-bin =====

;;; veloren-bin — open-world, open-source multiplayer voxel RPG
(define-public veloren-bin
  (package
    (name "veloren-bin")
    (version "0.17.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.veloren.net/stable/linux-x86_64/veloren-"
                    version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/veloren"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/veloren/veloren-voxygen")
                              (string-append out "/bin/veloren"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-world multiplayer voxel RPG")
    (description "Veloren is an open-world, open-source multiplayer voxel RPG
inspired by games such as Cube World, The Legend of Zelda: Breath of the Wild,
Dwarf Fortress, and Minecraft.")
    (home-page "https://veloren.net/")
    (license license:gpl3+)))

;;; ===== 7. doot-bin =====

;;; doot-bin — fast, simple and intuitive dotfiles manager
(define-public doot-bin
  (package
    (name "doot-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nickgerace/doot/releases/download/v"
                    version "/doot-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("doot-linux-amd64" "bin/doot"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast, simple and intuitive dotfiles manager")
    (description "Doot is a fast, simple and intuitive dotfiles manager.  It helps
you keep your configuration files organized and synchronized across machines.")
    (home-page "https://github.com/nickgerace/doot")
    (license license:expat)))

;;; ===== 8. venera-bin =====

;;; venera-bin — comic reader supporting local and network comics
(define-public venera-bin
  (package
    (name "venera-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niuhuan/venera/releases/download/v"
                    version "/venera-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "venera-" #$version "-linux-x86_64.AppImage")
                "bin/venera"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "comic reader supporting local and network comics")
    (description "Venera is a comic reader that supports reading local and network
comics with a clean, modern interface.")
    (home-page "https://github.com/niuhuan/venera")
    (license license:expat)))

;;; ===== 9. yazi-nightly-bin =====

;;; yazi-nightly-bin — blazing fast terminal file manager written in Rust
(define-public yazi-nightly-bin
  (package
    (name "yazi-nightly-bin")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sxyazi/yazi/releases/download/nightly/"
                    "yazi-x86_64-unknown-linux-gnu.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("yazi" "bin/yazi")
                              ("ya" "bin/ya"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "blazing fast terminal file manager written in Rust")
    (description "Yazi is a blazing fast terminal file manager written in Rust,
based on async I/O.  It provides a modern, feature-rich terminal file management
experience with image preview and plugin support.")
    (home-page "https://yazi-rs.github.io/")
    (license license:expat)))

;;; ===== 10. tiny-rdm-bin =====

;;; tiny-rdm-bin — modern lightweight cross-platform Redis desktop manager
(define-public tiny-rdm-bin
  (package
    (name "tiny-rdm-bin")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tiny-craft/tiny-rdm/releases/download/v"
                    version "/TinyRDM_" version "_linux_x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "TinyRDM_" #$version "_linux_x86_64.AppImage")
                "bin/tiny-rdm"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern lightweight cross-platform Redis desktop manager")
    (description "Tiny RDM (Tiny Redis Desktop Manager) is a modern, lightweight
cross-platform Redis desktop manager with an intuitive GUI for managing Redis
databases.")
    (home-page "https://redis.tinycraft.cc/")
    (license license:gpl3)))

;;; ===== 11. goneovim-bin =====

;;; goneovim-bin — Neovim GUI written in Golang using a Qt backend
(define-public goneovim-bin
  (package
    (name "goneovim-bin")
    (version "0.6.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/akiyosi/goneovim/releases/download/v"
                    version "/goneovim-v" version "-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goneovim"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/goneovim/goneovim")
                              (string-append out "/bin/goneovim"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Neovim GUI written in Golang using a Qt backend")
    (description "Goneovim is a Neovim GUI written in Golang using a Qt backend.
It provides a rich graphical interface for Neovim with features like smooth
scrolling, animations, and an external command line.")
    (home-page "https://github.com/akiyosi/goneovim")
    (license license:expat)))

;;; ===== 12. anilibria-winmaclinux =====

;;; anilibria-winmaclinux — AniLibria client for major desktop platforms
(define-public anilibria-winmaclinux
  (package
    (name "anilibria-winmaclinux")
    (version "1.2.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anilibria/anilibria-winmaclinux/releases/download/"
                    version "/AniLibria_" version "_amd64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "AniLibria_" #$version "_amd64.AppImage")
                "bin/anilibria"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AniLibria client for desktop platforms")
    (description "AniLibria is a client application for the AniLibria anime
platform, providing access to anime content on major desktop platforms.")
    (home-page "https://github.com/anilibria/anilibria-winmaclinux")
    (license license:gpl3)))

;;; ===== 13. epub-reader-bin =====

;;; epub-reader-bin — EPUB/Book reader application built with ElectronJS
(define-public epub-reader-bin
  (package
    (name "epub-reader-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicolo-ribaudo/epub-reader/releases/download/v"
                    version "/epub-reader-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "epub-reader-" #$version "-linux-x86_64.AppImage")
                "bin/epub-reader"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "EPUB and book reader application built with Electron")
    (description "Epub Reader is an EPUB and book reader application built with
ElectronJS, providing a clean reading experience for electronic books.")
    (home-page "https://github.com/nicolo-ribaudo/epub-reader")
    (license license:expat)))

;;; ===== 14. intellij-idea-ue-eap =====

;;; intellij-idea-ue-eap — early access version of IntelliJ IDEA Ultimate Edition
(define-public intellij-idea-ue-eap
  (package
    (name "intellij-idea-ue-eap")
    (version "2026.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.jetbrains.com/idea/ideaIU-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/intellij-idea-ue-eap"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/intellij-idea-ue-eap/bin/idea")
                              (string-append out "/bin/idea-ue-eap"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "early access version of IntelliJ IDEA Ultimate Edition")
    (description "IntelliJ IDEA Ultimate Edition EAP provides early access to the
upcoming version of IntelliJ IDEA, the leading Java and polyglot IDE by
JetBrains.")
    (home-page "https://www.jetbrains.com/idea/nextversion/")
    (license (license:nonfree
              "https://www.jetbrains.com/legal/docs/toolbox/license/"))))

;;; ===== 15. notion-app-enhanced =====

;;; notion-app-enhanced — enhanced Notion desktop application
(define-public notion-app-enhanced
  (package
    (name "notion-app-enhanced")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicolo-ribaudo/notion-app-enhanced/releases/download/v"
                    version "/notion-app-enhanced-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "notion-app-enhanced-" #$version "-linux-x86_64.AppImage")
                "bin/notion-app-enhanced"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "enhanced Notion desktop application")
    (description "Notion App Enhanced is an enhanced version of the Notion desktop
application with additional features and customizations for the popular
all-in-one workspace.")
    (home-page "https://github.com/nicolo-ribaudo/notion-app-enhanced")
    (license license:expat)))

;;; ===== 16. android-sdk-build-tools-34 =====

;;; android-sdk-build-tools-34 — build tools for Google Android SDK
(define-public android-sdk-build-tools-34
  (package
    (name "android-sdk-build-tools-34")
    (version "34.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.google.com/android/repository/build-tools_r"
                    version "-linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/android-sdk/build-tools/34.0.0"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "build tools for Google Android SDK (API level 34)")
    (description "Android SDK Build-Tools provide the tools necessary to build
Android applications, including aapt, aidl, dexdump, dx, and the LLVM-based
resource compiler.")
    (home-page "https://developer.android.com/tools")
    (license (license:nonfree
              "https://developer.android.com/studio/terms"))))

;;; ===== 17. intel-opencl-runtime =====

;;; intel-opencl-runtime — Intel oneAPI OpenCL runtime library
(define-public intel-opencl-runtime
  (package
    (name "intel-opencl-runtime")
    (version "2024.18.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/intel/compute-runtime/releases/download/"
                    version "/intel-opencl-icd-" version ".x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "lib/intel-opencl"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Intel oneAPI OpenCL runtime library for Intel processors")
    (description "Intel OpenCL runtime provides OpenCL support for Intel Core and
Xeon processors, enabling general-purpose computing on Intel GPUs and CPUs.")
    (home-page "https://github.com/intel/compute-runtime")
    (license (license:nonfree
              "https://www.intel.com/content/www/us/en/developer/articles/license/end-user-license-agreement.html"))))

;;; ===== 18. xhidecursor =====

;;; xhidecursor — minimal X application that hides the cursor on key-press
(define-public xhidecursor
  (package
    (name "xhidecursor")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xhidecursor/xhidecursor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure))))
    (synopsis "minimal X application that hides cursor on key-press")
    (description "Xhidecursor is a minimal X application which hides the cursor on
key-press and unhides it on mouse movement.  Useful for distraction-free typing
environments.")
    (home-page "https://github.com/xhidecursor/xhidecursor")
    (license license:expat)))

;;; ===== 19. iprange =====

;;; iprange — manage IP ranges, from the FireHOL project
(define-public iprange
  (package
    (name "iprange")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/firehol/iprange/releases/download/v"
                    version "/iprange-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "manage IP ranges from the FireHOL project")
    (description "Iprange is a tool for managing IP ranges.  It can sort, merge,
compare, optimize, and convert IP ranges in CIDR notation.  Part of the FireHOL
project.")
    (home-page "https://github.com/firehol/iprange")
    (license license:gpl2+)))

;;; ===== 20. oggfwd =====

;;; oggfwd — pipe an Ogg stream to an Icecast server
(define-public oggfwd
  (package
    (name "oggfwd")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.xiph.org/releases/oggfwd/oggfwd-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "pipe an Ogg stream to an Icecast server")
    (description "Oggfwd is a small tool that reads an Ogg stream from stdin and
forwards it to an Icecast server.  Useful for piping encoded audio to a
streaming server.")
    (home-page "https://www.xiph.org/")
    (license license:gpl2+)))

;;; ===== 21. t2sz =====

;;; t2sz — compress a tar archive to seekable zstd with per-file frames
(define-public t2sz
  (package
    (name "t2sz")
    (version "1.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/martinellimarco/t2sz")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "compress tar archive into seekable zstd with per-file frames")
    (description "t2sz compresses a file into a seekable zstd archive.  If the
input is a tar archive, it compresses each file in the archive into an
independent frame, enabling random access to individual files.")
    (home-page "https://github.com/martinellimarco/t2sz")
    (license license:bsd-3)))

;;; ===== 22. qxw =====

;;; qxw — program to help create and publish crosswords
(define-public qxw
  (package
    (name "qxw")
    (version "20210901")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.quinapalus.com/qxw-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure))))
    (synopsis "program to help create and publish crosswords")
    (description "Qxw is an interactive tool for creating and publishing
crosswords.  It features automatic grid filling, dictionary support, and export
to multiple formats.")
    (home-page "https://www.quinapalus.com/qxw.html")
    (license license:gpl2+)))

;;; ===== 23. xswm-git =====

;;; xswm-git — minimal X window manager that opens every window maximized
(define-public xswm-git
  (package
    (name "xswm-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xswm/xswm")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure))))
    (synopsis "minimal X window manager that maximizes every window")
    (description "Xswm is a minimal X window manager with only one task: open
every window maximized.  It is designed for users who want a simple, full-screen
window management experience.")
    (home-page "https://github.com/xswm/xswm")
    (license license:expat)))

;;; ===== 24. gnome-shell-extension-status-area-horizontal-spacing =====

;;; gnome-shell-extension-status-area-horizontal-spacing — reduce icon spacing in GNOME status area
(define-public gnome-shell-extension-status-area-horizontal-spacing
  (package
    (name "gnome-shell-extension-status-area-horizontal-spacing")
    (version "24.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mathematical-coffee/Gnome-Shell-Extension-Status-Area-Horizontal-Spacing")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/status-area-horizontal-spacing@mathematical.coffee.gmail.com"))))
    (synopsis "reduce horizontal spacing in GNOME Shell status area")
    (description "A GNOME Shell extension that reduces the horizontal spacing
between icons and indicators in the status area, allowing more items to fit in
the top panel.")
    (home-page "https://github.com/mathematical-coffee/Gnome-Shell-Extension-Status-Area-Horizontal-Spacing")
    (license license:gpl2+)))

;;; ===== 25. vlc-materia-skin =====

;;; vlc-materia-skin — Materia skin for VLC media player
(define-public vlc-materia-skin
  (package
    (name "vlc-materia-skin")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AdrienMusic/VLC-Materia-Skin")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Materia.vlt" "share/vlc/skins2/Materia.vlt"))))
    (synopsis "Materia skin for VLC media player")
    (description "A Materia-style skin for the VLC media player, providing a
modern Material Design look.")
    (home-page "https://github.com/AdrienMusic/VLC-Materia-Skin")
    (license license:gpl3)))

;;; ===== 26. keybase-bash-completion =====

;;; keybase-bash-completion — bash completion for the Keybase CLI
(define-public keybase-bash-completion
  (package
    (name "keybase-bash-completion")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicolo-ribaudo/keybase-bash-completion")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("keybase" "share/bash-completion/completions/keybase"))))
    (synopsis "bash completion for the Keybase CLI")
    (description "Provides bash tab-completion support for the Keybase command line
interface, enabling convenient auto-completion of Keybase commands and
arguments.")
    (home-page "https://github.com/nicolo-ribaudo/keybase-bash-completion")
    (license license:expat)))

;;; ===== 27. vim-nushell =====

;;; vim-nushell — Nushell syntax highlighting and indentation for Vim
(define-public vim-nushell
  (package
    (name "vim-nushell")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elkasztano/nushell-syntax-vim")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("syntax" "share/vim/vimfiles/syntax")
               ("ftdetect" "share/vim/vimfiles/ftdetect")
               ("indent" "share/vim/vimfiles/indent"))))
    (synopsis "Nushell syntax highlighting and indentation for Vim")
    (description "Provides Nushell syntax highlighting and indentation support for
Vim and Neovim editors.")
    (home-page "https://github.com/elkasztano/nushell-syntax-vim")
    (license license:expat)))

;;; ===== 28. mpv-quality-menu =====

;;; mpv-quality-menu — MPV script to change streamed video quality on the fly
(define-public mpv-quality-menu
  (package
    (name "mpv-quality-menu")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/christoph-heinrich/mpv-quality-menu")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("quality-menu.lua" "share/mpv/scripts/quality-menu.lua"))))
    (synopsis "MPV script to change streamed video quality on the fly")
    (description "A userscript for MPV that allows you to change the streamed
video and audio quality (ytdl-format) on the fly using a menu interface.")
    (home-page "https://github.com/christoph-heinrich/mpv-quality-menu")
    (license license:gpl2+)))

;;; ===== 29. mpv-sponsorblock =====

;;; mpv-sponsorblock — MPV script to skip sponsored segments of YouTube videos
(define-public mpv-sponsorblock
  (package
    (name "mpv-sponsorblock")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/po5/mpv_sponsorblock")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sponsorblock.lua" "share/mpv/scripts/sponsorblock.lua"))))
    (synopsis "MPV script to skip sponsored segments of YouTube videos")
    (description "An MPV script that uses the SponsorBlock API to automatically
skip sponsored segments, intros, outros, and other non-content sections in
YouTube videos.")
    (home-page "https://github.com/po5/mpv_sponsorblock")
    (license license:gpl3)))

;;; ===== 30. firefox-clearurls =====

;;; firefox-clearurls — remove tracking elements from URLs in Firefox
(define-public firefox-clearurls
  (package
    (name "firefox-clearurls")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicolo-ribaudo/ClearURLs")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/firefox-clearurls"))))
    (synopsis "remove tracking elements from URLs in Firefox")
    (description "ClearURLs is a Firefox extension that automatically removes
tracking elements from URLs to protect your privacy while browsing the web.")
    (home-page "https://clearurls.xyz/")
    (license license:gpl3)))

;;; ===== 31. gnome-shell-extension-tilingshell =====

;;; gnome-shell-extension-tilingshell — advanced tiling window management for GNOME Shell
(define-public gnome-shell-extension-tilingshell
  (package
    (name "gnome-shell-extension-tilingshell")
    (version "16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/domferr/tilingshell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/tilingshell@ferrarodomenico.com"))))
    (synopsis "advanced tiling window management for GNOME Shell")
    (description "Tiling Shell extends GNOME Shell with advanced tiling window
management.  It provides customizable tiling layouts, keyboard shortcuts, and
drag-and-drop window placement.")
    (home-page "https://github.com/domferr/tilingshell")
    (license license:gpl2+)))

;;; ===== 32. python-pypuppetdb =====

;;; python-pypuppetdb — Python library for working with PuppetDB REST API
(define-public python-pypuppetdb
  (package
    (name "python-pypuppetdb")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pypuppetdb/"
                    "pypuppetdb-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "library for working with the PuppetDB REST API")
    (description "pypuppetdb is a Python library for interacting with the PuppetDB
REST API, enabling programmatic access to Puppet infrastructure data including
nodes, facts, reports, and catalogs.")
    (home-page "https://github.com/voxpupuli/pypuppetdb")
    (license license:asl2.0)))

;;; ===== 33. python-etils =====

;;; python-etils — collection of common Python utilities by Google
(define-public python-etils
  (package
    (name "python-etils")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/e/etils/"
                    "etils-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "collection of common Python utilities by Google")
    (description "Etils (eclectic utils) is a collection of common Python
utilities by Google, providing helpers for path manipulation, error reporting,
array operations, and more.")
    (home-page "https://github.com/google/etils")
    (license license:asl2.0)))

;;; ===== 34. python-pyodide-lock =====

;;; python-pyodide-lock — tooling to manage pyodide-lock.json files
(define-public python-pyodide-lock
  (package
    (name "python-pyodide-lock")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pyodide-lock/"
                    "pyodide_lock-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "tooling to manage pyodide-lock.json files")
    (description "Pyodide-lock provides tooling to manage the pyodide-lock.json
file, which describes the set of packages and their dependencies available in a
Pyodide environment.")
    (home-page "https://github.com/pyodide/pyodide-lock")
    (license license:mpl2.0)))

;;; ===== 35. battery-notifier =====

;;; battery-notifier — CLI tool that notifies when battery is low
(define-public battery-notifier
  (package
    (name "battery-notifier")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/battery-notifier/battery-notifier")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("battery-notifier" "bin/battery-notifier"))))
    (synopsis "CLI tool that notifies when battery is low")
    (description "Battery-notifier is a CLI tool that monitors battery level and
sends desktop notifications when the battery drops below a configurable
threshold.")
    (home-page "https://github.com/battery-notifier/battery-notifier")
    (license license:expat)))

;;; ===== 36. nmap-netcat =====

;;; nmap-netcat — use nmap's ncat as the default netcat
(define-public nmap-netcat
  (package
    (name "nmap-netcat")
    (version "7.95")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://nmap.org/dist/nmap-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list (string-append "--prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda _
                   (invoke "make" "-C" "ncat")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (install-file "ncat/ncat"
                                   (string-append out "/bin"))
                     (symlink (string-append out "/bin/ncat")
                              (string-append out "/bin/netcat"))))))))
    (synopsis "use nmap's ncat as netcat")
    (description "This package builds ncat from the nmap project and installs it
as netcat.  Ncat is a modern reimplementation of netcat with additional features
including SSL support and connection brokering.")
    (home-page "https://nmap.org/ncat/")
    (license license:gpl2+)))
