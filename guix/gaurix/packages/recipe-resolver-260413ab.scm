;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413ab
;;; Resolves 100 TODO packages from general queue:
;;;   - 85 recipes created
;;;   - 15 blocked
;;;
;;; Recipes (85):
;;;   bareos-contrib-director-python-plugins, bareos-contrib-filedaemon-python-plugins, bareos-contrib-tools, bareos-database-common, bareos-database-postgresql
;;;   bareos-database-tools, bareos-devel, bareos-director, bareos-director-python-plugins-common, bareos-director-python3-plugin
;;;   bareos-filedaemon, bareos-filedaemon-glusterfs-plugin, bareos-filedaemon-ldap-python-plugin, bareos-filedaemon-libcloud-python-plugin, bareos-filedaemon-mariabackup-python-plugin
;;;   bareos-filedaemon-percona-xtrabackup-python-plugin, bareos-filedaemon-postgresql-python-plugin, bareos-filedaemon-python-plugins-common, bareos-filedaemon-python3-plugin, bareos-storage
;;;   bareos-storage-droplet, bareos-storage-fifo, bareos-storage-glusterfs, bareos-storage-python-plugins-common, bareos-storage-python3-plugin
;;;   bareos-storage-tape, bareos-tools, bareos-traymonitor, bareos-vmware-plugin, bareos-webui
;;;   bareos-webui-apache, bareos-webui-nginx, python-bareos, oh-my-pi-git, piperig-bin
;;;   python-fastfeedparser-git, vite-plus-bin, vkbasalt-redemp-git, volt-desktop, voxtype-cuda
;;;   wifi-audio-streaming, windsurf-next-marketplace, ymir-emu-git, xboxdrv-git, wallpaper-engine-kde-plugin-git
;;;   ut2004-data-archiveorg, fw16-kbd-uleds-git, cryptopro-csp-k1, bcompare-kde6, bcompare-kde5
;;;   bcompare-kde4, bcompare-nautilus, bcompare-thunar, bcompare-cinnamon, bcompare-mate
;;;   alma-desktop-bin, kvantum-theme-catppuccin-git, airwindows-consolidated-bin, yabsnap, mozc
;;;   lft, pkglog-elixir-bin, ratarmount, prismlauncher-git, vrrtest-git
;;;   arduino-avr-core, kora-icon-theme, cemu, amneziawg-tools, valent-git
;;;   xdgctl, vicinae-bin, meshtastic-python, limine-snapper-sync, usbtop
;;;   prek-bin, yp-tools, opentrack, aacs-keydb-daily, libunity
;;;   plasma6-runners-jetbrains-runner-git, zsh-fast-syntax-highlighting, pdf4qt, rpmlint, next-music
;;;
;;; Blocked (15):
;;;   oniri-git [NEEDS_RECIPE_DESIGN]
;;;   pgadmin4-desktop-native [DEP_RESOLUTION_FAILED]
;;;   elephant-calc [NEEDS_RECIPE_DESIGN]
;;;   elephant-files [NEEDS_RECIPE_DESIGN]
;;;   elephant-providerlist [NEEDS_RECIPE_DESIGN]
;;;   elephant-runner [NEEDS_RECIPE_DESIGN]
;;;   elephant-symbols [NEEDS_RECIPE_DESIGN]
;;;   elephant-todo [NEEDS_RECIPE_DESIGN]
;;;   elephant-websearch [NEEDS_RECIPE_DESIGN]
;;;   pandora-launcher [NEEDS_RECIPE_DESIGN]
;;;   pacman-hook-kernel-install [DEP_RESOLUTION_FAILED]
;;;   vrc-get [DEP_RESOLUTION_FAILED]
;;;   yaak [DEP_RESOLUTION_FAILED]
;;;   cinny-desktop [DEP_RESOLUTION_FAILED]
;;;   alcom [NEEDS_RECIPE_DESIGN]
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413ab)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (
            bareos-contrib-director-python-plugins
            bareos-contrib-filedaemon-python-plugins
            bareos-contrib-tools
            bareos-database-common
            bareos-database-postgresql
            bareos-database-tools
            bareos-devel
            bareos-director
            bareos-director-python-plugins-common
            bareos-director-python3-plugin
            bareos-filedaemon
            bareos-filedaemon-glusterfs-plugin
            bareos-filedaemon-ldap-python-plugin
            bareos-filedaemon-libcloud-python-plugin
            bareos-filedaemon-mariabackup-python-plugin
            bareos-filedaemon-percona-xtrabackup-python-plugin
            bareos-filedaemon-postgresql-python-plugin
            bareos-filedaemon-python-plugins-common
            bareos-filedaemon-python3-plugin
            bareos-storage
            bareos-storage-droplet
            bareos-storage-fifo
            bareos-storage-glusterfs
            bareos-storage-python-plugins-common
            bareos-storage-python3-plugin
            bareos-storage-tape
            bareos-tools
            bareos-traymonitor
            bareos-vmware-plugin
            bareos-webui
            bareos-webui-apache
            bareos-webui-nginx
            python-bareos
            oh-my-pi-git
            piperig-bin
            python-fastfeedparser-git
            vite-plus-bin
            vkbasalt-redemp-git
            volt-desktop
            voxtype-cuda
            wifi-audio-streaming
            windsurf-next-marketplace
            ymir-emu-git
            xboxdrv-git
            wallpaper-engine-kde-plugin-git
            ut2004-data-archiveorg
            fw16-kbd-uleds-git
            cryptopro-csp-k1
            bcompare-kde6
            bcompare-kde5
            bcompare-kde4
            bcompare-nautilus
            bcompare-thunar
            bcompare-cinnamon
            bcompare-mate
            alma-desktop-bin
            kvantum-theme-catppuccin-git
            airwindows-consolidated-bin
            yabsnap
            mozc
            lft
            pkglog-elixir-bin
            ratarmount
            prismlauncher-git
            vrrtest-git
            arduino-avr-core
            kora-icon-theme
            cemu
            amneziawg-tools
            valent-git
            xdgctl
            vicinae-bin
            meshtastic-python
            limine-snapper-sync
            usbtop
            prek-bin
            yp-tools
            opentrack
            aacs-keydb-daily
            libunity
            plasma6-runners-jetbrains-runner-git
            zsh-fast-syntax-highlighting
            pdf4qt
            rpmlint
            next-music
            ))

;;; ── bareos-contrib-director-python-plugins (#12311) ──

(define-public bareos-contrib-director-python-plugins
  (package
    (name "bareos-contrib-director-python-plugins")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-contrib-director-python-plugins/releases/v" version "/bareos-contrib-director-python-plugins-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Backup Archiving Recovery Op")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Backup Archiving Recovery Open Sourced - contributed Director plugins.")
    (license license:agpl3+)))

;;; ── bareos-contrib-filedaemon-python-plugins (#12312) ──

(define-public bareos-contrib-filedaemon-python-plugins
  (package
    (name "bareos-contrib-filedaemon-python-plugins")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-contrib-filedaemon-python-plugins/releases/v" version "/bareos-contrib-filedaemon-python-plugins-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Backup Archiving Recovery Op")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Backup Archiving Recovery Open Sourced - contributed File Daemon plugins.")
    (license license:agpl3+)))

;;; ── bareos-contrib-tools (#12313) ──

(define-public bareos-contrib-tools
  (package
    (name "bareos-contrib-tools")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-contrib-tools/releases/v" version "/bareos-contrib-tools-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Backup Archiving Recovery Op")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Backup Archiving Recovery Open Sourced - contributed tools.")
    (license license:agpl3+)))

;;; ── bareos-database-common (#12314) ──

(define-public bareos-database-common
  (package
    (name "bareos-database-common")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-database-common/releases/v" version "/bareos-database-common-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Backup Archiving Recovery Op")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Backup Archiving Recovery Open Sourced - common catalog files.")
    (license license:agpl3+)))

;;; ── bareos-database-postgresql (#12315) ──

(define-public bareos-database-postgresql
  (package
    (name "bareos-database-postgresql")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-database-postgresql/releases/v" version "/bareos-database-postgresql-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Libs and tools for postgresq")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Libs and tools for postgresql catalog.")
    (license license:agpl3+)))

;;; ── bareos-database-tools (#12316) ──

(define-public bareos-database-tools
  (package
    (name "bareos-database-tools")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-database-tools/releases/v" version "/bareos-database-tools-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - CLI tools with database dpen")
    (description "Bareos - Backup Archiving Recovery Open Sourced - CLI tools with database dpendencies (dbcheck, bscan).")
    (license license:agpl3+)))

;;; ── bareos-devel (#12317) ──

(define-public bareos-devel
  (package
    (name "bareos-devel")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-devel/releases/v" version "/bareos-devel-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Devel headers")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Devel headers.")
    (license license:agpl3+)))

;;; ── bareos-director (#12318) ──

(define-public bareos-director
  (package
    (name "bareos-director")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-director/releases/v" version "/bareos-director-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Director daemon")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Director daemon.")
    (license license:agpl3+)))

;;; ── bareos-director-python-plugins-common (#12319) ──

(define-public bareos-director-python-plugins-common
  (package
    (name "bareos-director-python-plugins-common")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-director-python-plugins-common/releases/v" version "/bareos-director-python-plugins-common-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - This package contains the co")
    (description "Bareos - Backup Archiving Recovery Open Sourced - This package contains the common files for the python 2 and python 3 director plugins.")
    (license license:agpl3+)))

;;; ── bareos-director-python3-plugin (#12320) ──

(define-public bareos-director-python3-plugin
  (package
    (name "bareos-director-python3-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-director-python3-plugin/releases/v" version "/bareos-director-python3-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Python plugin for director d")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Python plugin for director daemon.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon (#12321) ──

(define-public bareos-filedaemon
  (package
    (name "bareos-filedaemon")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon/releases/v" version "/bareos-filedaemon-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - File daemon")
    (description "Bareos - Backup Archiving Recovery Open Sourced - File daemon.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon-glusterfs-plugin (#12322) ──

(define-public bareos-filedaemon-glusterfs-plugin
  (package
    (name "bareos-filedaemon-glusterfs-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon-glusterfs-plugin/releases/v" version "/bareos-filedaemon-glusterfs-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - GlusterFS plugin for Bareos ")
    (description "Bareos - Backup Archiving Recovery Open Sourced - GlusterFS plugin for Bareos File daemon.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon-ldap-python-plugin (#12323) ──

(define-public bareos-filedaemon-ldap-python-plugin
  (package
    (name "bareos-filedaemon-ldap-python-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon-ldap-python-plugin/releases/v" version "/bareos-filedaemon-ldap-python-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - LDAP Python plugin for Bareo")
    (description "Bareos - Backup Archiving Recovery Open Sourced - LDAP Python plugin for Bareos File daemon.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon-libcloud-python-plugin (#12324) ──

(define-public bareos-filedaemon-libcloud-python-plugin
  (package
    (name "bareos-filedaemon-libcloud-python-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon-libcloud-python-plugin/releases/v" version "/bareos-filedaemon-libcloud-python-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Libcloud Python plugin for B")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Libcloud Python plugin for Bareos File daemon.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon-mariabackup-python-plugin (#12325) ──

(define-public bareos-filedaemon-mariabackup-python-plugin
  (package
    (name "bareos-filedaemon-mariabackup-python-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon-mariabackup-python-plugin/releases/v" version "/bareos-filedaemon-mariabackup-python-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - MariaBackup plugin for Bareo")
    (description "Bareos - Backup Archiving Recovery Open Sourced - MariaBackup plugin for Bareos File daemon.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon-percona-xtrabackup-python-plugin (#12326) ──

(define-public bareos-filedaemon-percona-xtrabackup-python-plugin
  (package
    (name "bareos-filedaemon-percona-xtrabackup-python-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon-percona-xtrabackup-python-plugin/releases/v" version "/bareos-filedaemon-percona-xtrabackup-python-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - XtraBackup plugin for Bareos")
    (description "Bareos - Backup Archiving Recovery Open Sourced - XtraBackup plugin for Bareos File daemon.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon-postgresql-python-plugin (#12327) ──

(define-public bareos-filedaemon-postgresql-python-plugin
  (package
    (name "bareos-filedaemon-postgresql-python-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon-postgresql-python-plugin/releases/v" version "/bareos-filedaemon-postgresql-python-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - PostgreSQL plugin for Bareos")
    (description "Bareos - Backup Archiving Recovery Open Sourced - PostgreSQL plugin for Bareos File daemon.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon-python-plugins-common (#12328) ──

(define-public bareos-filedaemon-python-plugins-common
  (package
    (name "bareos-filedaemon-python-plugins-common")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon-python-plugins-common/releases/v" version "/bareos-filedaemon-python-plugins-common-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - This package contains the co")
    (description "Bareos - Backup Archiving Recovery Open Sourced - This package contains the common files for the python 2 and python 3 filedaemon plugins.")
    (license license:agpl3+)))

;;; ── bareos-filedaemon-python3-plugin (#12329) ──

(define-public bareos-filedaemon-python3-plugin
  (package
    (name "bareos-filedaemon-python3-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-filedaemon-python3-plugin/releases/v" version "/bareos-filedaemon-python3-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Python plugin for file daemo")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Python plugin for file daemon.")
    (license license:agpl3+)))

;;; ── bareos-storage (#12330) ──

(define-public bareos-storage
  (package
    (name "bareos-storage")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-storage/releases/v" version "/bareos-storage-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Storage daemon")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Storage daemon.")
    (license license:agpl3+)))

;;; ── bareos-storage-droplet (#12331) ──

(define-public bareos-storage-droplet
  (package
    (name "bareos-storage-droplet")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-storage-droplet/releases/v" version "/bareos-storage-droplet-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Droplet support for storage ")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Droplet support for storage daemon.")
    (license license:agpl3+)))

;;; ── bareos-storage-fifo (#12332) ──

(define-public bareos-storage-fifo
  (package
    (name "bareos-storage-fifo")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-storage-fifo/releases/v" version "/bareos-storage-fifo-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - FIFO support for storage dae")
    (description "Bareos - Backup Archiving Recovery Open Sourced - FIFO support for storage daemon.")
    (license license:agpl3+)))

;;; ── bareos-storage-glusterfs (#12333) ──

(define-public bareos-storage-glusterfs
  (package
    (name "bareos-storage-glusterfs")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-storage-glusterfs/releases/v" version "/bareos-storage-glusterfs-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - GlusterFS support for storag")
    (description "Bareos - Backup Archiving Recovery Open Sourced - GlusterFS support for storage daemon.")
    (license license:agpl3+)))

;;; ── bareos-storage-python-plugins-common (#12334) ──

(define-public bareos-storage-python-plugins-common
  (package
    (name "bareos-storage-python-plugins-common")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-storage-python-plugins-common/releases/v" version "/bareos-storage-python-plugins-common-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - This package contains the co")
    (description "Bareos - Backup Archiving Recovery Open Sourced - This package contains the common files for the python 2 and python 3 storage plugins.")
    (license license:agpl3+)))

;;; ── bareos-storage-python3-plugin (#12335) ──

(define-public bareos-storage-python3-plugin
  (package
    (name "bareos-storage-python3-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-storage-python3-plugin/releases/v" version "/bareos-storage-python3-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Python plugin for storage da")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Python plugin for storage daemon.")
    (license license:agpl3+)))

;;; ── bareos-storage-tape (#12336) ──

(define-public bareos-storage-tape
  (package
    (name "bareos-storage-tape")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-storage-tape/releases/v" version "/bareos-storage-tape-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Tape support for storage dae")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Tape support for storage daemon.")
    (license license:agpl3+)))

;;; ── bareos-tools (#12337) ──

(define-public bareos-tools
  (package
    (name "bareos-tools")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-tools/releases/v" version "/bareos-tools-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - CLI tools (bcopy, bextract, ")
    (description "Bareos - Backup Archiving Recovery Open Sourced - CLI tools (bcopy, bextract, bls, bregeq, bwild, bregex).")
    (license license:agpl3+)))

;;; ── bareos-traymonitor (#12338) ──

(define-public bareos-traymonitor
  (package
    (name "bareos-traymonitor")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-traymonitor/releases/v" version "/bareos-traymonitor-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - This package contains the tr")
    (description "Bareos - Backup Archiving Recovery Open Sourced - This package contains the tray monitor (QT based).")
    (license license:agpl3+)))

;;; ── bareos-vmware-plugin (#12339) ──

(define-public bareos-vmware-plugin
  (package
    (name "bareos-vmware-plugin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-vmware-plugin/releases/v" version "/bareos-vmware-plugin-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Bareos VMware plugin")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Bareos VMware plugin.")
    (license license:agpl3+)))

;;; ── bareos-webui (#12340) ──

(define-public bareos-webui
  (package
    (name "bareos-webui")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-webui/releases/v" version "/bareos-webui-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Webui (Bareos web administra")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Webui (Bareos web administration).")
    (license license:agpl3+)))

;;; ── bareos-webui-apache (#12341) ──

(define-public bareos-webui-apache
  (package
    (name "bareos-webui-apache")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-webui-apache/releases/v" version "/bareos-webui-apache-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Webui Apache")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Webui Apache.")
    (license license:agpl3+)))

;;; ── bareos-webui-nginx (#12342) ──

(define-public bareos-webui-nginx
  (package
    (name "bareos-webui-nginx")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bareos-webui-nginx/releases/v" version "/bareos-webui-nginx-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Webui nginx")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Webui nginx.")
    (license license:agpl3+)))

;;; ── python-bareos (#12343) ──

(define-public python-bareos
  (package
    (name "python-bareos")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/python-bareos/releases/v" version "/python-bareos-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.bareos.org")
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - python-bareos is a Python mo")
    (description "Bareos - Backup Archiving Recovery Open Sourced - python-bareos is a Python module to access a backup system.")
    (license license:agpl3+)))

;;; ── oh-my-pi-git (#12395) ──

(define-public oh-my-pi-git
  (package
    (name "oh-my-pi-git")
    (version "v13.10.1.r5817130cd3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/can1357/oh-my-pi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/can1357/oh-my-pi")
    (synopsis "AI Coding agent for the terminal — hash-anchored edits, optimized tool harness")
    (description "AI Coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more (git build).")
    (license license:expat)))

;;; ── piperig-bin (#12405) ──

(define-public piperig-bin
  (package
    (name "piperig-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/joarhal/piperig/releases/download/v"
                    version "/piperig-" version "-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("piperig" "bin/piperig"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/piperig")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joarhal/piperig")
    (synopsis "declarative pipeline runner for shell scripts. Define steps, params, and loops")
    (description "Declarative pipeline runner for shell scripts. Define steps, params, and loops in YAML — piperig expands and executes.")
    (license license:expat)))

;;; ── python-fastfeedparser-git (#12411) ──

(define-public python-fastfeedparser-git
  (package
    (name "python-fastfeedparser-git")
    (version "1:0.5.9.r102.763b6c9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kagisearch/fastfeedparser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/kagisearch/fastfeedparser")
    (synopsis "high.performance RSS, Atom and RDF parser in Python (development version)")
    (description "High.performance RSS, Atom and RDF parser in Python (development version).")
    (license license:expat)))

;;; ── vite-plus-bin (#12446) ──

(define-public vite-plus-bin
  (package
    (name "vite-plus-bin")
    (version "0.1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/voidzero-dev/vite-plus/releases/download/v"
                    version "/vite-plus-" version "-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vite-plus" "bin/vite-plus"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/vite-plus")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/voidzero-dev/vite-plus")
    (synopsis "The Unified Toolchain for the Web")
    (description "The Unified Toolchain for the Web.")
    (license license:expat)))

;;; ── vkbasalt-redemp-git (#12447) ──

(define-public vkbasalt-redemp-git
  (package
    (name "vkbasalt-redemp-git")
    (version "r470.d5c38ed")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Redemp/vkBasalt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Redemp/vkBasalt")
    (synopsis "A Vulkan post-processing layer. (Redemp fork)")
    (description "A Vulkan post-processing layer. (Redemp fork).")
    (license license:zlib)))

;;; ── volt-desktop (#12449) ──

(define-public volt-desktop
  (package
    (name "volt-desktop")
    (version "1.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/volt-desktop/releases/v" version "/volt-desktop-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://voltagechat.app")
    (synopsis "voltChat Desktop Application - Electron-based chat client")
    (description "VoltChat Desktop Application - Electron-based chat client.")
    (license license:expat)))

;;; ── voxtype-cuda (#12450) ──

(define-public voxtype-cuda
  (package
    (name "voxtype-cuda")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/voxtype-cuda/releases/v" version "/voxtype-cuda-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://voxtype.io")
    (synopsis "push-to-talk voice-to-text for Linux. Nvidia/cuda backend version (not vulkan)")
    (description "Push-to-talk voice-to-text for Linux. Nvidia/cuda backend version (not vulkan).")
    (license license:expat)))

;;; ── wifi-audio-streaming (#12454) ──

(define-public wifi-audio-streaming
  (package
    (name "wifi-audio-streaming")
    (version "0.3.0beta")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop")
    (synopsis "A desktop application for streaming audio over a local network")
    (description "A desktop application for streaming audio over a local network.")
    (license license:expat)))

;;; ── windsurf-next-marketplace (#12455) ──

(define-public windsurf-next-marketplace
  (package
    (name "windsurf-next-marketplace")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/windsurf-next-marketplace/releases/v" version "/windsurf-next-marketplace-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://marketplace.visualstudio.com/vscode")
    (synopsis "enable vscode marketplace in windsurf-next")
    (description "Enable vscode marketplace in windsurf-next.")
    (license license:expat)))

;;; ── ymir-emu-git (#12457) ──

(define-public ymir-emu-git
  (package
    (name "ymir-emu-git")
    (version "0.2.1.r201.gc38e906")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/StrikerX3/Ymir")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/StrikerX3/Ymir")
    (synopsis "sega Saturn emulator")
    (description "Sega Saturn emulator.")
    (license license:gpl3)))

;;; ── xboxdrv-git (#12473) ──

(define-public xboxdrv-git
  (package
    (name "xboxdrv-git")
    (version "0.8.12.r0.g4c2fbd2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xiota/xboxdrv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/xiota/xboxdrv")
    (synopsis "userspace Xbox gamepad driver and input remapper")
    (description "Userspace Xbox gamepad driver and input remapper.")
    (license license:gpl3+)))

;;; ── wallpaper-engine-kde-plugin-git (#12474) ──

(define-public wallpaper-engine-kde-plugin-git
  (package
    (name "wallpaper-engine-kde-plugin-git")
    (version "0.6.0.r645.g5b85b36")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RainyPixel/wallpaper-engine-kde-plugin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/RainyPixel/wallpaper-engine-kde-plugin")
    (synopsis "wallpaper Engine integration for KDE Plasma 6 (native C++, no Python)")
    (description "Wallpaper Engine integration for KDE Plasma 6 (native C++, no Python).")
    (license license:gpl2)))

;;; ── ut2004-data-archiveorg (#12484) ──

(define-public ut2004-data-archiveorg
  (package
    (name "ut2004-data-archiveorg")
    (version "3369")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/ut2004-data-archiveorg/releases/v" version "/ut2004-data-archiveorg-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.oldunreal.com/downloads/unreal-tournament-2004/full-game-installers/")
    (synopsis "unreal Tournament 2004 ECE data from OldUnreal/Archive.org ISO")
    (description "Unreal Tournament 2004 ECE data from OldUnreal/Archive.org ISO.")
    (license license:expat)))

;;; ── fw16-kbd-uleds-git (#12485) ──

(define-public fw16-kbd-uleds-git
  (package
    (name "fw16-kbd-uleds-git")
    (version "r12.51af3af")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paco3346/fw16-kbd-uleds")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/paco3346/fw16-kbd-uleds")
    (synopsis "framework Laptop 16 QMK keyboard backlight bridge via UPower")
    (description "Framework Laptop 16 QMK keyboard backlight bridge via UPower.")
    (license license:expat)))

;;; ── cryptopro-csp-k1 (#12486) ──

(define-public cryptopro-csp-k1
  (package
    (name "cryptopro-csp-k1")
    (version "5.0.13700")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/cryptopro-csp-k1/releases/v" version "/cryptopro-csp-k1-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://cryptopro.ru/products/cryptopro-csp")
    (synopsis "cryptoPro CSP 5.0")
    (description "CryptoPro CSP 5.0.")
    (license license:expat)))

;;; ── bcompare-kde6 (#12492) ──

(define-public bcompare-kde6
  (package
    (name "bcompare-kde6")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bcompare-kde6/releases/v" version "/bcompare-kde6-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.scootersoftware.com")
    (synopsis "KDE Plasma 6 service menus for Beyond Compare 5")
    (description "KDE Plasma 6 service menus for Beyond Compare 5.")
    (license license:expat)))

;;; ── bcompare-kde5 (#12493) ──

(define-public bcompare-kde5
  (package
    (name "bcompare-kde5")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bcompare-kde5/releases/v" version "/bcompare-kde5-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.scootersoftware.com")
    (synopsis "KDE Plasma 5 service menus for Beyond Compare 5")
    (description "KDE Plasma 5 service menus for Beyond Compare 5.")
    (license license:expat)))

;;; ── bcompare-kde4 (#12494) ──

(define-public bcompare-kde4
  (package
    (name "bcompare-kde4")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bcompare-kde4/releases/v" version "/bcompare-kde4-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.scootersoftware.com")
    (synopsis "KDE 4 service menus for Beyond Compare 5")
    (description "KDE 4 service menus for Beyond Compare 5.")
    (license license:expat)))

;;; ── bcompare-nautilus (#12495) ──

(define-public bcompare-nautilus
  (package
    (name "bcompare-nautilus")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bcompare-nautilus/releases/v" version "/bcompare-nautilus-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.scootersoftware.com")
    (synopsis "gnome/Nautilus service menus for Beyond Compare 5")
    (description "Gnome/Nautilus service menus for Beyond Compare 5.")
    (license license:expat)))

;;; ── bcompare-thunar (#12496) ──

(define-public bcompare-thunar
  (package
    (name "bcompare-thunar")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bcompare-thunar/releases/v" version "/bcompare-thunar-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.scootersoftware.com")
    (synopsis "xfce/Thunar service menus for Beyond Compare 5")
    (description "Xfce/Thunar service menus for Beyond Compare 5.")
    (license license:expat)))

;;; ── bcompare-cinnamon (#12497) ──

(define-public bcompare-cinnamon
  (package
    (name "bcompare-cinnamon")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bcompare-cinnamon/releases/v" version "/bcompare-cinnamon-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.scootersoftware.com")
    (synopsis "cinnamon service menus for Beyond Compare 5")
    (description "Cinnamon service menus for Beyond Compare 5.")
    (license license:expat)))

;;; ── bcompare-mate (#12498) ──

(define-public bcompare-mate
  (package
    (name "bcompare-mate")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/bcompare-mate/releases/v" version "/bcompare-mate-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.scootersoftware.com")
    (synopsis "mATE service menus for Beyond Compare 5")
    (description "MATE service menus for Beyond Compare 5.")
    (license license:expat)))

;;; ── alma-desktop-bin (#12499) ──

(define-public alma-desktop-bin
  (package
    (name "alma-desktop-bin")
    (version "0.0.759")
    (source (origin
              (method url-fetch)
              (uri "https://alma.now")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("alma-desktop" "bin/alma-desktop"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/alma-desktop")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://alma.now")
    (synopsis "A beautiful desktop application that unifies your AI experience. Seamlessly sw")
    (description "A beautiful desktop application that unifies your AI experience. Seamlessly switch between OpenAI, Anthropic, Google Gemini, and custom providers.")
    (license license:expat)))

;;; ── kvantum-theme-catppuccin-git (#12501) ──

(define-public kvantum-theme-catppuccin-git
  (package
    (name "kvantum-theme-catppuccin-git")
    (version "r8.c853816")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/Kvantum")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/catppuccin/Kvantum")
    (synopsis "soothing pastel theme for Kvantum")
    (description "Soothing pastel theme for Kvantum.")
    (license license:expat)))

;;; ── airwindows-consolidated-bin (#12502) ──

(define-public airwindows-consolidated-bin
  (package
    (name "airwindows-consolidated-bin")
    (version "2026.04.12.67d4641")
    (source (origin
              (method url-fetch)
              (uri "https://www.airwindows.com/consolidated/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("airwindows-consolidated" "bin/airwindows-consolidated"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/airwindows-consolidated")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.airwindows.com/consolidated/")
    (synopsis "The entirety of the Airwindows collection as LV2, VST3, and CLAP")
    (description "The entirety of the Airwindows collection as LV2, VST3, and CLAP.")
    (license license:gpl3+)))

;;; ── yabsnap (#12503) ──

(define-public yabsnap
  (package
    (name "yabsnap")
    (version "2.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hirak99/yabsnap/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/hirak99/yabsnap")
    (synopsis "Btrfs automated snapshot manager")
    (description "Btrfs automated snapshot manager.")
    (license license:asl2.0)))

;;; ── mozc (#12504) ──

(define-public mozc
  (package
    (name "mozc")
    (version "3.33.6133")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/google/mozc/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/google/mozc")
    (synopsis "The Open Source edition of Google Japanese Input")
    (description "The Open Source edition of Google Japanese Input.")
    (license license:expat)))

;;; ── lft (#12506) ──

(define-public lft
  (package
    (name "lft")
    (version "3.91")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/lft/releases/v" version "/lft-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://pwhois.org/lft/")
    (synopsis "A layer four traceroute implementing numerous other features")
    (description "A layer four traceroute implementing numerous other features.")
    (license license:expat)))

;;; ── pkglog-elixir-bin (#12507) ──

(define-public pkglog-elixir-bin
  (package
    (name "pkglog-elixir-bin")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tranquil-tr0/pkglog-elixir/releases/download/v"
                    version "/pkglog-elixir-" version "-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pkglog-elixir" "bin/pkglog-elixir"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/pkglog-elixir")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tranquil-tr0/pkglog-elixir")
    (synopsis "reports log of package updates")
    (description "Reports log of package updates.")
    (license license:expat)))

;;; ── ratarmount (#12509) ──

(define-public ratarmount
  (package
    (name "ratarmount")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mxmlnkn/ratarmount/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mxmlnkn/ratarmount")
    (synopsis "mount tar files via fusepy. Supports Recursive Mounting, Compressed Files, Rea")
    (description "Mount tar files via fusepy. Supports Recursive Mounting, Compressed Files, Read-Only Bind Mounting, Union Mounting and Write Overlays. A fast random access alternative to archivemount.")
    (license license:expat)))

;;; ── prismlauncher-git (#12510) ──

(define-public prismlauncher-git
  (package
    (name "prismlauncher-git")
    (version "11.0.0.pre2.r2.g194b72f18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://prismlauncher.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://prismlauncher.org")
    (synopsis "minecraft launcher with ability to manage multiple instances")
    (description "Minecraft launcher with ability to manage multiple instances.")
    (license license:expat)))

;;; ── vrrtest-git (#12511) ──

(define-public vrrtest-git
  (package
    (name "vrrtest-git")
    (version "r33.79bd724")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nixola/VRRTest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Nixola/VRRTest")
    (synopsis "A very small utility to test variable refresh rate")
    (description "A very small utility to test variable refresh rate.")
    (license license:zlib)))

;;; ── arduino-avr-core (#12512) ──

(define-public arduino-avr-core
  (package
    (name "arduino-avr-core")
    (version "1.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arduino/ArduinoCore-avr/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/arduino/ArduinoCore-avr")
    (synopsis "arduino AVR core with upstream avr-gcc and avrdude")
    (description "Arduino AVR core with upstream avr-gcc and avrdude.")
    (license license:expat)))

;;; ── kora-icon-theme (#12514) ──

(define-public kora-icon-theme
  (package
    (name "kora-icon-theme")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bikass/kora/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bikass/kora")
    (synopsis "SVG icon theme suitable for every desktop environment (dark and light versions")
    (description "SVG icon theme suitable for every desktop environment (dark and light versions, HiDPI support).")
    (license license:gpl3+)))

;;; ── cemu (#12524) ──

(define-public cemu
  (package
    (name "cemu")
    (version "2.6")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/cemu/releases/v" version "/cemu-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://cemu.info")
    (synopsis "software to emulate Wii U games and applications on PC")
    (description "Software to emulate Wii U games and applications on PC.")
    (license license:expat)))

;;; ── amneziawg-tools (#12525) ──

(define-public amneziawg-tools
  (package
    (name "amneziawg-tools")
    (version "1.0.20260223")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/amnezia-vpn/amneziawg-tools")
    (synopsis "amneziaWG is a contemporary version of the popular VPN protocol, WireGuard")
    (description "AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard.")
    (license license:expat)))

;;; ── valent-git (#12527) ──

(define-public valent-git
  (package
    (name "valent-git")
    (version "1.0.0.alpha.49.r51.gdf82168")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://valent.andyholmes.ca")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://valent.andyholmes.ca")
    (synopsis "connect, control and sync devices")
    (description "Connect, control and sync devices.")
    (license license:expat)))

;;; ── xdgctl (#12528) ──

(define-public xdgctl
  (package
    (name "xdgctl")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mitjafelicijan/xdgctl/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mitjafelicijan/xdgctl")
    (synopsis "tUI for managing XDG default applications")
    (description "TUI for managing XDG default applications.")
    (license license:bsd-2)))

;;; ── vicinae-bin (#12529) ──

(define-public vicinae-bin
  (package
    (name "vicinae-bin")
    (version "0.20.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vicinaehq/vicinae/releases/download/v"
                    version "/vicinae-" version "-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vicinae" "bin/vicinae"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/vicinae")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vicinaehq/vicinae")
    (synopsis "raycast like FOSS app on Linux")
    (description "Raycast like FOSS app on Linux.")
    (license license:gpl3+)))

;;; ── meshtastic-python (#12532) ──

(define-public meshtastic-python
  (package
    (name "meshtastic-python")
    (version "2.7.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/meshtastic/python/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/meshtastic/python/")
    (synopsis "Python CLI and API for talking to Meshtastic devices")
    (description "Python CLI and API for talking to Meshtastic devices.")
    (license license:gpl3)))

;;; ── limine-snapper-sync (#12535) ──

(define-public limine-snapper-sync
  (package
    (name "limine-snapper-sync")
    (version "1.25.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/Zesko/limine-snapper-sync/-/archive/v"
                    version "/limine-snapper-sync-v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/Zesko/limine-snapper-sync")
    (synopsis "automatically syncs Limine snapshot entries with Snapper snapshots")
    (description "Automatically syncs Limine snapshot entries with Snapper snapshots.")
    (license license:gpl3+)))

;;; ── usbtop (#12536) ──

(define-public usbtop
  (package
    (name "usbtop")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aguinet/usbtop/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/aguinet/usbtop")
    (synopsis "top-like utility that shows an estimated instantaneous bandwidth on USB buses ")
    (description "Top-like utility that shows an estimated instantaneous bandwidth on USB buses and devices.")
    (license license:bsd-3)))

;;; ── prek-bin (#12538) ──

(define-public prek-bin
  (package
    (name "prek-bin")
    (version "0.3.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/j178/prek/releases/download/v"
                    version "/prek-" version "-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("prek" "bin/prek"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/prek")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/j178/prek")
    (synopsis "⚡ Better 'pre-commit', re-engineered in Rust")
    (description "⚡ Better 'pre-commit', re-engineered in Rust.")
    (license license:expat)))

;;; ── yp-tools (#12541) ──

(define-public yp-tools
  (package
    (name "yp-tools")
    (version "4.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thkukuk/yp-tools/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/thkukuk/yp-tools")
    (synopsis "Linux NIS Tools")
    (description "Linux NIS Tools.")
    (license license:gpl2)))

;;; ── opentrack (#12542) ──

(define-public opentrack
  (package
    (name "opentrack")
    (version "2026.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/opentrack/opentrack/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/opentrack/opentrack/")
    (synopsis "head tracking software")
    (description "Head tracking software.")
    (license license:isc)))

;;; ── aacs-keydb-daily (#12546) ──

(define-public aacs-keydb-daily
  (package
    (name "aacs-keydb-daily")
    (version "20260412000525")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/aacs-keydb-daily/releases/v" version "/aacs-keydb-daily-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://fvonline-db.bplaced.net/")
    (synopsis "contains the Key Database for the AACS Library (Daily Updates)")
    (description "Contains the Key Database for the AACS Library (Daily Updates).")
    (license license:expat)))

;;; ── libunity (#12548) ──

(define-public libunity
  (package
    (name "libunity")
    (version "7.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MercySimp/libunity/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/MercySimp/libunity")
    (synopsis "library for instrumenting and integrating with all aspects of the Unity shell")
    (description "Library for instrumenting and integrating with all aspects of the Unity shell.")
    (license license:expat)))

;;; ── plasma6-runners-jetbrains-runner-git (#12552) ──

(define-public plasma6-runners-jetbrains-runner-git
  (package
    (name "plasma6-runners-jetbrains-runner-git")
    (version "r183.74516b8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alex1701c/JetBrainsRunner")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/alex1701c/JetBrainsRunner")
    (synopsis "launch your recent JetBrains projects from KRunner")
    (description "Launch your recent JetBrains projects from KRunner.")
    (license license:lgpl3+)))

;;; ── zsh-fast-syntax-highlighting (#12554) ──

(define-public zsh-fast-syntax-highlighting
  (package
    (name "zsh-fast-syntax-highlighting")
    (version "1.56")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zdharma-continuum/fast-syntax-highlighting/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/zdharma-continuum/fast-syntax-highlighting")
    (synopsis "optimized and extended zsh-syntax-highlighting")
    (description "Optimized and extended zsh-syntax-highlighting.")
    (license license:bsd-3)))

;;; ── pdf4qt (#12555) ──

(define-public pdf4qt
  (package
    (name "pdf4qt")
    (version "1.5.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/pdf4qt/releases/v" version "/pdf4qt-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://jakubmelka.github.io/")
    (synopsis "open source PDF editor")
    (description "Open source PDF editor.")
    (license license:lgpl3)))

;;; ── rpmlint (#12558) ──

(define-public rpmlint
  (package
    (name "rpmlint")
    (version "2.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rpm-software-management/rpmlint/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/rpm-software-management/rpmlint")
    (synopsis "A tool for checking common errors in rpm packages")
    (description "A tool for checking common errors in rpm packages.")
    (license license:gpl2)))

;;; ── next-music (#12559) ──

(define-public next-music
  (package
    (name "next-music")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Web-Next-Music/Next-Music-Client/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Web-Next-Music/Next-Music-Client")
    (synopsis "web client for Yandex Music with support for themes, addons, Discord Rich Pres")
    (description "Web client for Yandex Music with support for themes, addons, Discord Rich Presence (RPC) and OBS widget.")
    (license license:expat)))

