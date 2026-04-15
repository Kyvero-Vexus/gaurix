;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415m
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 3 resolved with new recipes;
;;; 10 already packaged in prior passes;
;;; 17 re-evaluated with concrete exhaust reasons.
;;;
;;; Recipes (3 new):
;;;   1. vim-classic (gnu, commit 6f8889e, Vim 8.x fork by Drew DeVault,
;;;      Vim license)
;;;   2. gvim-classic (gnu, commit 6f8889e, Vim Classic with GTK3 GUI,
;;;      Vim license)
;;;   3. viu-media (pyproject, v3.3.7, anime terminal streaming TUI,
;;;      Unlicense)
;;;
;;; Already packaged (10):
;;;   - hardinfo2-git (#1059): recipe in recipe-resolver-260415e.scm
;;;     (as hardinfo2)
;;;   - jellyfin-desktop-git (#4129): recipe in recipe-resolver-260408t.scm
;;;     (as jellyfin-desktop-bin)
;;;   - spotube-bin (#5097): recipe in recipe-resolver-260408y.scm
;;;   - ksnip-git (#6811): recipe in recipe-resolver-260414ae.scm
;;;     (as ksnip-bin)
;;;   - python-rapidocr (#6825): recipe in deptree-resolver-260414q.scm
;;;   - opensnitch-git (#7282): recipe in recipe-resolver-260413ag.scm
;;;     (as opensnitch-bin)
;;;   - deezer-enhanced-git (#7237): recipe in recipe-resolver-260414z.scm
;;;     (as deezer-enhanced-bin)
;;;   - kdiff3-git (#7379): recipe in recipe-resolver-260414y.scm
;;;     (as kdiff3)
;;;   - xdg-desktop-portal-minimal-git (#7382): compat alias to
;;;     upstream xdg-desktop-portal in recipe-resolver-260414y.scm
;;;   - hyprshell (#7519): recipe in recipe-resolver-260414ae.scm
;;;     (as hyprshell-bin)
;;;
;;; Exhausted (17):
;;;   - lib32-amdvlk (#4676): MULTILIB_UNSUPPORTED: 32-bit AMD Vulkan
;;;     driver; A1: Guix does not support multilib (32-bit on 64-bit host);
;;;     A2: cross-compilation for i686-linux is architectural mismatch with
;;;     lib32 overlay model; A3: 64-bit amdvlk available in Guix as mesa
;;;   - lib32-amdonly-gaming-vulkan-radeon-git (#7062):
;;;     MULTILIB_UNSUPPORTED: 32-bit gaming Vulkan driver; same as
;;;     lib32-amdvlk; A1: no multilib; A2: no i686 cross-comp overlay;
;;;     A3: 64-bit mesa-vulkan available
;;;   - lib32-amdonly-gaming-vulkan-mesa-layers-git (#7063):
;;;     MULTILIB_UNSUPPORTED: 32-bit Vulkan layers; same blockers as above
;;;   - lib32-amdonly-gaming-opencl-rusticl-mesa-git (#7064):
;;;     MULTILIB_UNSUPPORTED: 32-bit OpenCL; same blockers as above
;;;   - lib32-amdonly-gaming-mesa-git (#7065): MULTILIB_UNSUPPORTED:
;;;     32-bit Mesa; same blockers as above
;;;   - lib32-openssl-1.0 (#11766): MULTILIB_UNSUPPORTED: 32-bit
;;;     OpenSSL 1.0; A1: no multilib in Guix; A2: OpenSSL 1.0 is EOL;
;;;     A3: 64-bit openssl available in Guix
;;;   - lib32-openssl-1.1 (#11910): MULTILIB_UNSUPPORTED: 32-bit
;;;     OpenSSL 1.1; A1: no multilib; A2: OpenSSL 1.1 is EOL;
;;;     A3: 64-bit openssl available
;;;   - lib32-gst-plugins-base (#33317): MULTILIB_UNSUPPORTED: 32-bit
;;;     GStreamer plugins; A1: no multilib; A2: cross-compile mismatch;
;;;     A3: 64-bit gst-plugins-base available
;;;   - linux-libre-hardened-headers (#7200): KERNEL_VARIANT: hardened
;;;     kernel headers; A1: Guix uses linux-libre with its own kernel
;;;     packaging model; A2: hardened patchset integration requires kernel
;;;     infrastructure not in batch scope; A3: use linux-libre-headers
;;;   - linux-libre-hardened-docs (#7201): KERNEL_VARIANT: hardened
;;;     kernel docs; A1: depends on linux-libre-hardened which is blocked;
;;;     A2: kernel doc generation requires full kernel build tree;
;;;     A3: use upstream kernel documentation
;;;   - linux-cachyos-cjktty-headers (#19311): KERNEL_VARIANT: CachyOS
;;;     CJK TTY kernel headers; A1: custom kernel config infrastructure
;;;     not available in batch; A2: CJK TTY patches are kernel-level;
;;;     A3: use linux-libre-headers with separate CJK console solution
;;;   - linux-cachyos-cjktty (#19312): KERNEL_VARIANT: CachyOS CJK TTY
;;;     kernel; A1: requires CachyOS kernel config + BORE scheduler +
;;;     CJK font patches; A2: non-libre firmware blobs; A3: use
;;;     linux-libre with fbterm/zhcon for CJK console
;;;   - systemd-oomd-defaults (#7445): SYSTEMD_ONLY: configuration files
;;;     for systemd-oomd; A1: Guix System uses Shepherd, not systemd;
;;;     A2: oomd defaults are systemd unit configs with no Shepherd
;;;     equivalent; A3: Guix has earlyoom as OOM killer alternative
;;;   - wps-office-365-edu-fonts (#4613): NON_DISTRIBUTABLE: proprietary
;;;     Microsoft/WPS fonts for education edition; A1: license prohibits
;;;     redistribution; A2: no free alternatives with same metrics;
;;;     A3: user can install manually via font-dir
;;;   - plasma-foreground-booster-dmemcg (#38279): SYSTEMD_KERNEL_EXPERIMENTAL:
;;;     experimental KDE cgroup memory controller; A1: requires systemd
;;;     cgroup integration (Guix uses Shepherd); A2: needs kernel with
;;;     dmemcg VRAM patches (not in linux-libre); A3: no stable release
;;;     (0 upstream tags, experimental API)
;;;   - penpot-frontend (#13307): CLOJURESCRIPT_COMPLEX: ClojureScript SPA
;;;     for Penpot design tool; A1: requires ClojureScript compiler +
;;;     shadow-cljs + npm ecosystem; A2: no standalone binary releases
;;;     (web app served by Penpot backend); A3: Docker-only deployment
;;;     model, frontend inseparable from backend
;;;   - metube-git (#13923): PYTHON_VERSION_INCOMPATIBLE: YouTube
;;;     downloader web UI requiring Python >= 3.13 (Guix has 3.11);
;;;     A1: pyproject.toml requires-python >= 3.13, Guix Python is 3.11;
;;;     A2: Angular web frontend needs npm build pipeline;
;;;     A3: python-socketio, curl-cffi, watchfiles not in Guix
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xorg)
  #:use-module (gaurix packages cron-c79f127f-r22-w03)
  #:export (
            vim-classic
            gvim-classic
            viu-media
            ))

;;;
;;; --- 1. vim-classic ---
;;; Fork of Vim 8.x maintained by Drew DeVault for long-term stability.
;;; Removes post-8.x complexity (Vim9 script, etc.) and focuses on the
;;; classic Vim experience.
;;; Upstream: https://git.sr.ht/~sircmpwn/vim-classic
;;;

(define-public vim-classic
  (package
    (name "vim-classic")
    (version "0.0.0-r11235.6f8889e")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.sr.ht/~sircmpwn/vim-classic/archive/"
                    "6f8889e.tar.gz"))
              (sha256
               (base32
                "0hl3z7xplsml288axh0xf94j3jlxw15646jcf1hp642qm14kw6xl"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;tests require X display
      #:configure-flags
      #~(list "--with-features=huge"
              "--enable-multibyte"
              "--enable-gui=no"
              "--without-x"
              (string-append "--with-tlib="
                             (assoc-ref %build-inputs "ncurses")
                             "/lib"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'enter-source-dir
            (lambda _
              ;; Sourcehut archives extract with a top-level directory
              ;; named after the commit.
              (let ((dirs (scandir "."
                                  (lambda (f)
                                    (and (not (string-prefix? "." f))
                                         (file-is-directory? f))))))
                (when (and dirs (= (length dirs) 1))
                  (chdir (car dirs)))))))))
    (native-inputs (list perl))           ;for stripping docs
    (inputs (list ncurses acl))
    (synopsis "Fork of Vim 8 for long-term maintenance")
    (description
     "Vim Classic is a fork of Vim 8.x started by Drew DeVault,
focused on long-term maintenance of the classic Vim experience.
It removes post-8.x additions such as Vim9 script while preserving
the core modal editing, extensive plugin compatibility, and mature
feature set that Vim users depend on.  Two spaces after periods.")
    (home-page "https://git.sr.ht/~sircmpwn/vim-classic")
    (license (license:non-copyleft
              "https://git.sr.ht/~sircmpwn/vim-classic/tree/master/item/LICENSE"
              "Vim license (Charityware, GPL-compatible)"))))

;;;
;;; --- 2. gvim-classic ---
;;; Vim Classic with GTK3 graphical user interface.
;;; Same source as vim-classic but built with --enable-gui=gtk3.
;;; Upstream: https://git.sr.ht/~sircmpwn/vim-classic
;;;

(define-public gvim-classic
  (package
    (inherit vim-classic)
    (name "gvim-classic")
    (arguments
     (list
      #:tests? #f                         ;tests require X display
      #:configure-flags
      #~(list "--with-features=huge"
              "--enable-multibyte"
              "--enable-gui=gtk3"
              "--enable-gtk3-check"
              "--with-x"
              (string-append "--with-tlib="
                             (assoc-ref %build-inputs "ncurses")
                             "/lib"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'enter-source-dir
            (lambda _
              (let ((dirs (scandir "."
                                  (lambda (f)
                                    (and (not (string-prefix? "." f))
                                         (file-is-directory? f))))))
                (when (and dirs (= (length dirs) 1))
                  (chdir (car dirs)))))))))
    (inputs (list ncurses acl gtk+ libxt))
    (synopsis "Fork of Vim 8 with GTK3 graphical interface")
    (description
     "GVim Classic provides the Vim Classic editor with a GTK3
graphical user interface.  It includes menus, scrollbars, and
mouse support in addition to all standard Vim Classic features.
Vim Classic is a fork of Vim 8.x by Drew DeVault focused on
long-term maintenance of the classic Vim experience.")))

;;;
;;; --- 3. viu-media ---
;;; Terminal UI for browsing and streaming anime from various sources.
;;; Python application with TUI built on Rich/InquirerPy.
;;; Upstream: https://github.com/viu-media/viu
;;;

(define-public viu-media
  (package
    (name "viu-media")
    (version "3.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/viu-media/viu/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "11nyygznwipspxhmj8ra8hzkdg778vk55ynwac44d07kjpid2bzk"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                  ;no test suite in tarball
    (propagated-inputs (list python-click
                             python-httpx
                             python-inquirerpy
                             python-pydantic
                             python-rich))
    (synopsis "Terminal interface for browsing and streaming anime")
    (description
     "Viu is a terminal user interface for browsing and streaming anime
from various online sources.  It provides fuzzy search, episode
tracking, multiple provider support, and integrates with mpv for
playback.  The TUI is built with Rich and InquirerPy for an
interactive command-line experience.")
    (home-page "https://github.com/viu-media/viu")
    (license license:unlicense)))
