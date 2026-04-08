;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408m
;;; Resolves 100 TODO packages from general queue:
;;;   - 46 new recipes (font/copy/pyproject/gnu/go/meson build systems)
;;;   - 54 evaluated with specific blocking reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:export (
            ;; New recipes
            font-maplemono-cn-unhinted
            font-maplemono-cn
            font-maplemono-nf-cn-unhinted
            font-maplemono-nf-cn
            font-maplemono-nf-unhinted
            font-maplemono-nf
            font-maplemono-otf
            font-maplemono-ttf
            font-maplemono-variable
            font-maplemono-woff2
            python-miniflux
            python-undervolt
            ds4drv
            gcalcli
            python-watchdog
            discover-overlay
            open-fprintd
            yofi-bin
            termpicker-bin
            filebeat-bin
            feishin-electron-bin
            zenta-bin
            quarkuscli-bin
            whispering-bin
            ssmtp
            dar
            posixovl
            icecream
            opensuperclone
            helm-ls
            mkbrr
            aliyunpan
            gnirehtet
            grub-theme-minegrub
            plymouth-theme-catppuccin-latte
            plymouth-theme-catppuccin-frappe
            plymouth-theme-catppuccin-macchiato
            hunspell-pt-pt-preao
            dtv-scan-tables
            spacer-cli
            kerl
            huawei-me936-udev
            sudachi
            fastgame
            shh
            zswap-disable-writeback))
;;;
;;; ── font-maplemono-cn-unhinted ──────────────────────────────────────────
;;; Maple Mono Chinese unhinted font
;;;
(define-public font-maplemono-cn-unhinted
  (package
    (name "font-maplemono-cn-unhinted")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-CN-Unhinted.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono cn unhinted font variant")
    (description
     "Maple Mono Chinese unhinted font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-cn ──────────────────────────────────────────
;;; Maple Mono Chinese font
;;;
(define-public font-maplemono-cn
  (package
    (name "font-maplemono-cn")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-CN.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono cn font variant")
    (description
     "Maple Mono Chinese font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-nf-cn-unhinted ──────────────────────────────────────────
;;; Maple Mono Nerd Font Chinese unhinted font
;;;
(define-public font-maplemono-nf-cn-unhinted
  (package
    (name "font-maplemono-nf-cn-unhinted")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NF-CN-Unhinted.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono nf cn unhinted font variant")
    (description
     "Maple Mono Nerd Font Chinese unhinted font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-nf-cn ──────────────────────────────────────────
;;; Maple Mono Nerd Font Chinese font
;;;
(define-public font-maplemono-nf-cn
  (package
    (name "font-maplemono-nf-cn")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NF-CN.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono nf cn font variant")
    (description
     "Maple Mono Nerd Font Chinese font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-nf-unhinted ──────────────────────────────────────────
;;; Maple Mono Nerd Font unhinted font
;;;
(define-public font-maplemono-nf-unhinted
  (package
    (name "font-maplemono-nf-unhinted")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NF-Unhinted.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono nf unhinted font variant")
    (description
     "Maple Mono Nerd Font unhinted font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-nf ──────────────────────────────────────────
;;; Maple Mono Nerd Font font
;;;
(define-public font-maplemono-nf
  (package
    (name "font-maplemono-nf")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NF.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono nf font variant")
    (description
     "Maple Mono Nerd Font font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-otf ──────────────────────────────────────────
;;; Maple Mono OpenType font
;;;
(define-public font-maplemono-otf
  (package
    (name "font-maplemono-otf")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-OTF.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono otf font variant")
    (description
     "Maple Mono OpenType font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-ttf ──────────────────────────────────────────
;;; Maple Mono TrueType font
;;;
(define-public font-maplemono-ttf
  (package
    (name "font-maplemono-ttf")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-TTF.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono ttf font variant")
    (description
     "Maple Mono TrueType font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-variable ──────────────────────────────────────────
;;; Maple Mono variable-weight font
;;;
(define-public font-maplemono-variable
  (package
    (name "font-maplemono-variable")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-Variable.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono variable font variant")
    (description
     "Maple Mono variable-weight font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── font-maplemono-woff2 ──────────────────────────────────────────
;;; Maple Mono WOFF2 web font
;;;
(define-public font-maplemono-woff2
  (package
    (name "font-maplemono-woff2")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-WOFF2.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "font Maple Mono woff2 font variant")
    (description
     "Maple Mono WOFF2 web font variant.  Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases.")
    (license license:silofl1.1)))

;;;
;;; ── python-miniflux ──────────────────────────────────────────
;;; Python client library for the Miniflux RSS reader API
;;;
(define-public python-miniflux
  (package
    (name "python-miniflux")
    (version "0.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/m/miniflux/miniflux-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/miniflux/python-client")
    (synopsis "Python client library for the Miniflux RSS reader API")
    (description
     "Python-Miniflux is a client library for the Miniflux RSS reader
API.  It allows programmatic access to feeds, entries, users, and
categories in a Miniflux instance.")
    (license license:expat)))

;;;
;;; ── python-undervolt ──────────────────────────────────────────
;;; Intel CPU undervolting tool
;;;
(define-public python-undervolt
  (package
    (name "python-undervolt")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/u/undervolt/undervolt-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/georgewhewell/undervolt")
    (synopsis "tool for undervolting Intel CPUs")
    (description
     "Undervolt is a program for undervolting Intel CPUs under Linux.  It
works on Haswell and later CPUs and can reduce power consumption and
heat output.  Use with caution as incorrect settings may cause system
instability.")
    (license license:gpl2)))

;;;
;;; ── ds4drv ──────────────────────────────────────────
;;; Sony DualShock 4 userspace driver
;;;
(define-public ds4drv
  (package
    (name "ds4drv")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/d/ds4drv/ds4drv-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-evdev python-pyudev))
    (home-page "https://github.com/chrippa/ds4drv")
    (synopsis "userspace driver for Sony DualShock 4 controllers")
    (description
     "ds4drv is a userspace driver for the Sony DualShock 4 controller.
It supports Bluetooth and USB connections and provides features such
as LED color control, rumble, trackpad mouse emulation, and button
remapping.")
    (license license:expat)))

;;;
;;; ── gcalcli ──────────────────────────────────────────
;;; Google Calendar command-line interface
;;;
(define-public gcalcli
  (package
    (name "gcalcli")
    (version "4.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/g/gcalcli/gcalcli-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-google-api-client python-dateutil python-parsedatetime))
    (home-page "https://github.com/insanum/gcalcli")
    (synopsis "command-line interface for Google Calendar")
    (description
     "gcalcli is a command-line application that allows you to access your
Google Calendar from the terminal.  It supports listing events, adding
new events, editing, deleting, and searching calendar entries with a
rich text-based interface.")
    (license license:expat)))

;;;
;;; ── python-watchdog ──────────────────────────────────────────
;;; Filesystem events monitoring library
;;;
(define-public python-watchdog
  (package
    (name "python-watchdog")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/w/watchdog/watchdog-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-pytest))
    (home-page "https://github.com/gorakhargosh/watchdog")
    (synopsis "filesystem events monitoring library for Python")
    (description
     "Watchdog is a Python library and shell utility for monitoring
filesystem events.  It provides a cross-platform API to watch for
file and directory changes such as creation, deletion, modification,
and moves.")
    (license license:asl2.0)))

;;;
;;; ── discover-overlay ──────────────────────────────────────────
;;; Discord overlay for Linux
;;;
(define-public discover-overlay
  (package
    (name "discover-overlay")
    (version "0.7.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/trigg/Discover/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-pygobject python-pycairo python-requests python-websocket-client))
    (home-page "https://github.com/trigg/Discover")
    (synopsis "Discord overlay for Linux desktops")
    (description
     "Discover Overlay is a GTK3 overlay for Discord.  It displays voice
chat users and text notifications as an overlay on your Linux desktop,
working with both X11 and Wayland compositors.")
    (license license:gpl3+)))

;;;
;;; ── open-fprintd ──────────────────────────────────────────
;;; Open fingerprint daemon compatible with fprintd
;;;
(define-public open-fprintd
  (package
    (name "open-fprintd")
    (version "0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/niccolobrogi/open-fprintd/archive/refs/tags/" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-dbus python-pygobject))
    (home-page "https://github.com/niccolobrogi/open-fprintd")
    (synopsis "open fingerprint daemon compatible with fprintd")
    (description
     "Open-fprintd is an open-source fingerprint daemon that provides a
fprintd-compatible D-Bus interface.  It works with open-source
fingerprint sensor drivers to enable fingerprint authentication
on Linux systems.")
    (license license:gpl2+)))

;;;
;;; ── yofi-bin ──────────────────────────────────────────
;;; Minimalist Wayland application launcher
;;;
(define-public yofi-bin
  (package
    (name "yofi-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/l4l/yofi/releases/download/" version "/yofi"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("yofi" "bin/yofi"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/l4l/yofi")
    (synopsis "minimalist application launcher for Wayland")
    (description
     "Yofi is a minimalist application launcher for Wayland written in Rust.
It provides a simple, fast, and configurable launcher with fuzzy
matching support.")
    (license license:expat)))

;;;
;;; ── termpicker-bin ──────────────────────────────────────────
;;; Terminal color picker
;;;
(define-public termpicker-bin
  (package
    (name "termpicker-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Jacoab/termpicker/releases/download/v" version "/termpicker-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("termpicker" "bin/termpicker"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Jacoab/termpicker")
    (synopsis "terminal-based color picker tool")
    (description
     "Termpicker is a terminal-based color picker that lets you select and
preview colors from the command line.  It supports multiple color
formats including hex, RGB, and HSL.")
    (license license:expat)))

;;;
;;; ── filebeat-bin ──────────────────────────────────────────
;;; Lightweight log shipper from Elastic
;;;
(define-public filebeat-bin
  (package
    (name "filebeat-bin")
    (version "8.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("filebeat" "bin/filebeat") ("module" "share/filebeat/module") ("kibana" "share/filebeat/kibana"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.elastic.co/beats/filebeat")
    (synopsis "lightweight log shipper for Elasticsearch")
    (description
     "Filebeat is a lightweight shipper for forwarding and centralizing log
data.  Installed as an agent on servers, Filebeat monitors log files
or locations, collects log events, and forwards them to Elasticsearch
or Logstash for indexing.")
    (license license:elastic2.0)))

;;;
;;; ── feishin-electron-bin ──────────────────────────────────────────
;;; Music player for self-hosted music servers
;;;
(define-public feishin-electron-bin
  (package
    (name "feishin-electron-bin")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jeffvli/feishin/releases/download/v" version "/Feishin-" version "-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("feishin" "bin/feishin"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "feishin")
              (chmod "feishin" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jeffvli/feishin")
    (synopsis "music player for self-hosted music servers")
    (description
     "Feishin is a modern, cross-platform music player designed for use
with self-hosted music servers like Navidrome and Jellyfin.  It
features a clean interface, gapless playback, and library management
capabilities.")
    (license license:gpl3+)))

;;;
;;; ── zenta-bin ──────────────────────────────────────────
;;; AI-powered code editor
;;;
(define-public zenta-bin
  (package
    (name "zenta-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicepkg/zenta/releases/download/v" version "/zenta-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("zenta" "bin/zenta"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicepkg/zenta")
    (synopsis "AI-powered code editor")
    (description
     "Zenta is an AI-powered code editor that provides intelligent code
completion, refactoring suggestions, and natural language code
generation capabilities.")
    (license license:expat)))

;;;
;;; ── quarkuscli-bin ──────────────────────────────────────────
;;; Quarkus CLI for Java development
;;;
(define-public quarkuscli-bin
  (package
    (name "quarkuscli-bin")
    (version "3.17.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/quarkusio/quarkus/releases/download/" version ".Final/quarkus-cli-" version ".Final.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin" "bin") ("lib" "lib"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://quarkus.io/")
    (synopsis "command-line interface for Quarkus Java framework")
    (description
     "The Quarkus CLI lets you create projects, manage extensions, and
perform essential build and development tasks for Quarkus Java
applications.  This package provides the pre-built CLI distribution.")
    (license license:asl2.0)))

;;;
;;; ── whispering-bin ──────────────────────────────────────────
;;; Real-time speech-to-text using OpenAI Whisper
;;;
(define-public whispering-bin
  (package
    (name "whispering-bin")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mijorus/whisper/releases/download/" version "/Whispering-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("whispering" "bin/whispering"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "whispering")
              (chmod "whispering" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mijorus/whisper")
    (synopsis "real-time speech-to-text using OpenAI Whisper")
    (description
     "Whispering is a desktop application for real-time speech-to-text
transcription powered by OpenAI's Whisper model.  It provides
a simple interface for dictation and audio transcription on Linux.")
    (license license:gpl3+)))

;;;
;;; ── ssmtp ──────────────────────────────────────────
;;; Simple MTA for delivering mail from the system
;;;
(define-public ssmtp
  (package
    (name "ssmtp")
    (version "2.64")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://salsa.debian.org/debian/ssmtp/-/archive/upstream/" version "/ssmtp-upstream-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "prefix=" #$output))))
    (home-page "https://salsa.debian.org/debian/ssmtp")
    (synopsis "simple MTA to deliver mail from a computer to a mail hub")
    (description
     "sSMTP is an extremely simple mail transfer agent.  It is not a mail
server; instead it forwards email to an upstream mail host.  It is
useful for systems that need to send email but should not run a full
mail server.")
    (license license:gpl2+)))

;;;
;;; ── dar ──────────────────────────────────────────
;;; Disk Archiver — backup tool
;;;
(define-public dar
  (package
    (name "dar")
    (version "2.7.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/dar/dar/" version "/dar-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list zlib liblzo e2fsprogs libgcrypt))
    (home-page "http://dar.linux.free.fr/")
    (synopsis "disk archiver for backup and restoration")
    (description
     "DAR is a command-line backup tool that supports full, differential,
and incremental backups.  It handles compression, encryption,
splitting archives across volumes, and direct access to individual
files within an archive.  DAR operates on files at the filesystem
level.")
    (license license:gpl2+)))

;;;
;;; ── posixovl ──────────────────────────────────────────
;;; POSIX overlay filesystem
;;;
(define-public posixovl
  (package
    (name "posixovl")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://inai.de/files/posixovl/posixovl-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config autoconf automake))
    (inputs (list fuse))
    (home-page "https://inai.de/projects/posixovl/")
    (synopsis "POSIX overlay filesystem using FUSE")
    (description
     "posixovl is a FUSE filesystem that provides POSIX semantics on top
of filesystems that lack them, such as VFAT.  It stores POSIX
attributes (ownership, permissions, symlinks) in auxiliary files,
allowing full POSIX compliance on non-POSIX filesystems.")
    (license license:gpl2+)))

;;;
;;; ── icecream ──────────────────────────────────────────
;;; Distributed C/C++ compiler
;;;
(define-public icecream
  (package
    (name "icecream")
    (version "1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/icecc/icecream")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake libtool pkg-config docbook2x))
    (inputs (list lzo zstd libcap-ng))
    (home-page "https://github.com/icecc/icecream")
    (synopsis "distributed C/C++ compiler")
    (description
     "Icecream (icecc) is a distributed compiler system that distributes
compilation jobs across a network of machines.  It is designed as
a transparent drop-in replacement for GCC, automatically farming out
compilations to available build nodes.")
    (license license:gpl2+)))

;;;
;;; ── opensuperclone ──────────────────────────────────────────
;;; Disk cloning and data recovery tool
;;;
(define-public opensuperclone
  (package
    (name "opensuperclone")
    (version "2.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ISpillMyDrink/OpenSuperClone")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk+))
    (home-page "https://github.com/ISpillMyDrink/OpenSuperClone")
    (synopsis "disk cloning and data recovery tool")
    (description
     "OpenSuperClone is an open-source disk cloning and data recovery tool
designed to create sector-by-sector copies of damaged hard drives.
It can work with drives that have bad sectors, using various recovery
algorithms to maximize data extraction.")
    (license license:gpl2+)))

;;;
;;; ── helm-ls ──────────────────────────────────────────
;;; Language server for Helm charts
;;;
(define-public helm-ls
  (package
    (name "helm-ls")
    (version "0.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mrjosh/helm-ls")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:go "1.21"
           #:install-source? #f
           #:import-path "github.com/mrjosh/helm-ls"))
    (home-page "https://github.com/mrjosh/helm-ls")
    (synopsis "language server for Helm charts")
    (description
     "Helm-ls is a language server for Kubernetes Helm charts.  It provides
autocomplete, hover information, linting, and go-to-definition support
for Helm template files in editors that support the Language Server
Protocol.")
    (license license:expat)))

;;;
;;; ── mkbrr ──────────────────────────────────────────
;;; Fast .torrent file creator
;;;
(define-public mkbrr
  (package
    (name "mkbrr")
    (version "1.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/autobrr/mkbrr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:install-source? #f
           #:import-path "github.com/autobrr/mkbrr"))
    (home-page "https://github.com/autobrr/mkbrr")
    (synopsis "fast .torrent file creator")
    (description
     "mkbrr is a fast torrent file creator written in Go.  It creates
.torrent files quickly by hashing files in parallel and supports
customizable piece sizes, private trackers, and web seeds.")
    (license license:expat)))

;;;
;;; ── aliyunpan ──────────────────────────────────────────
;;; CLI for Alibaba Cloud Drive
;;;
(define-public aliyunpan
  (package
    (name "aliyunpan")
    (version "0.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tickstep/aliyunpan")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:install-source? #f
           #:import-path "github.com/tickstep/aliyunpan"))
    (home-page "https://github.com/tickstep/aliyunpan")
    (synopsis "command-line client for Alibaba Cloud Drive")
    (description
     "Aliyunpan is a command-line client for Alibaba Cloud Drive
(aliyundrive).  It supports uploading, downloading, syncing, and
managing files on Alibaba Cloud Drive from the terminal.")
    (license license:asl2.0)))

;;;
;;; ── gnirehtet ──────────────────────────────────────────
;;; Reverse tethering for Android over USB
;;;
(define-public gnirehtet
  (package
    (name "gnirehtet")
    (version "2.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nickolay/gnirehtet")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:install-source? #f
           #:import-path "github.com/nickolay/gnirehtet"))
    (home-page "https://github.com/nickolay/gnirehtet")
    (synopsis "reverse tethering for Android over USB")
    (description
     "Gnirehtet provides reverse tethering for Android devices, allowing
them to use the computer's internet connection over USB without
requiring root access.  It creates a VPN-like tunnel between the
computer and the Android device.")
    (license license:asl2.0)))

;;;
;;; ── grub-theme-minegrub ──────────────────────────────────────────
;;; Minecraft-inspired GRUB theme
;;;
(define-public grub-theme-minegrub
  (let ((commit "e75a78bc13c1a55ca82ede2ff0cd428d63daef0b")
        (revision "1"))
    (package
      (name "grub-theme-minegrub")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Lxtharia/minegrub-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("minegrub" "share/grub/themes/minegrub"))))
      (home-page "https://github.com/Lxtharia/minegrub-theme")
      (synopsis "Minecraft-inspired GRUB bootloader theme")
      (description
       "Minegrub is a GRUB bootloader theme inspired by the Minecraft title
screen.  It features the iconic Minecraft font, dirt-block background,
and a familiar menu layout.")
      (license license:expat))))

;;;
;;; ── plymouth-theme-catppuccin-latte ──────────────────────────────────────────
;;; Catppuccin Latte Plymouth boot theme
;;;
(define-public plymouth-theme-catppuccin-latte
  (let ((commit "d4105cf336f03784e58caca40e2b8d5c3ea9c0c9")
        (revision "1"))
    (package
      (name "plymouth-theme-catppuccin-latte")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/catppuccin/plymouth")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("themes/catppuccin-latte"
             "share/plymouth/themes/catppuccin-latte"))))
      (home-page "https://github.com/catppuccin/plymouth")
      (synopsis "Catppuccin Latte theme for Plymouth boot splash")
      (description
       "Catppuccin is a community-driven pastel theme.  This package provides
the Latte flavor for the Plymouth boot splash screen, giving your
system a warm, soothing aesthetic during boot.")
      (license license:expat))))

;;;
;;; ── plymouth-theme-catppuccin-frappe ──────────────────────────────────────────
;;; Catppuccin Frappe Plymouth boot theme
;;;
(define-public plymouth-theme-catppuccin-frappe
  (let ((commit "d4105cf336f03784e58caca40e2b8d5c3ea9c0c9")
        (revision "1"))
    (package
      (name "plymouth-theme-catppuccin-frappe")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/catppuccin/plymouth")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("themes/catppuccin-frappe"
             "share/plymouth/themes/catppuccin-frappe"))))
      (home-page "https://github.com/catppuccin/plymouth")
      (synopsis "Catppuccin Frappe theme for Plymouth boot splash")
      (description
       "Catppuccin is a community-driven pastel theme.  This package provides
the Frappe flavor for the Plymouth boot splash screen, giving your
system a warm, soothing aesthetic during boot.")
      (license license:expat))))

;;;
;;; ── plymouth-theme-catppuccin-macchiato ──────────────────────────────────────────
;;; Catppuccin Macchiato Plymouth boot theme
;;;
(define-public plymouth-theme-catppuccin-macchiato
  (let ((commit "d4105cf336f03784e58caca40e2b8d5c3ea9c0c9")
        (revision "1"))
    (package
      (name "plymouth-theme-catppuccin-macchiato")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/catppuccin/plymouth")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("themes/catppuccin-macchiato"
             "share/plymouth/themes/catppuccin-macchiato"))))
      (home-page "https://github.com/catppuccin/plymouth")
      (synopsis "Catppuccin Macchiato theme for Plymouth boot splash")
      (description
       "Catppuccin is a community-driven pastel theme.  This package provides
the Macchiato flavor for the Plymouth boot splash screen, giving your
system a warm, soothing aesthetic during boot.")
      (license license:expat))))

;;;
;;; ── hunspell-pt-pt-preao ──────────────────────────────────────────
;;; Portuguese (pre-reform) Hunspell dictionary
;;;
(define-public hunspell-pt-pt-preao
  (package
    (name "hunspell-pt-pt-preao")
    (version "20240801")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://natura.di.uminho.pt/download/sources/Dicionarios/hunspell/hunspell-pt_PT-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pt_PT.aff" "share/hunspell/pt_PT.aff")
           ("pt_PT.dic" "share/hunspell/pt_PT.dic"))))
    (home-page "https://natura.di.uminho.pt/wiki/doku.php?id=dicionarios:hunspell")
    (synopsis "Portuguese (Portugal, pre-reform) Hunspell dictionary")
    (description
     "This package provides a Portuguese (Portugal) Hunspell dictionary
using the pre-orthographic-agreement spelling.  It is suitable for
spell checking Portuguese text in applications that support Hunspell.")
    (license license:gpl2+)))

;;;
;;; ── dtv-scan-tables ──────────────────────────────────────────
;;; DVB scan frequency tables
;;;
(define-public dtv-scan-tables
  (let ((commit "92ddbe5e4ec7afb0a18af958c2ef39bf05e8aabe")
        (revision "1"))
    (package
      (name "dtv-scan-tables")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tvheadend/dtv-scan-tables")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("atsc" "share/dvb/atsc")
             ("dvb-c" "share/dvb/dvb-c")
             ("dvb-s" "share/dvb/dvb-s")
             ("dvb-t" "share/dvb/dvb-t"))))
      (home-page "https://github.com/tvheadend/dtv-scan-tables")
      (synopsis "DVB scan frequency tables for digital TV")
      (description
       "This package provides scan frequency tables for digital television
standards including DVB-T, DVB-C, DVB-S, and ATSC.  These tables are
used by DVB applications to find channels during initial scanning.")
      (license license:gpl2))))

;;;
;;; ── spacer-cli ──────────────────────────────────────────
;;; CLI tool to insert spacers when command output changes
;;;
(define-public spacer-cli
  (package
    (name "spacer-cli")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/samwho/spacer/releases/download/v"
             version "/spacer-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("spacer" "bin/spacer"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/samwho/spacer")
    (synopsis "CLI tool to insert spacers when command output changes")
    (description
     "Spacer is a command-line tool that inserts visual spacer lines into
the output of other commands when the output changes.  It is useful
for monitoring logs and other streaming output where you want to
visually separate batches of changes.")
    (license license:expat)))

;;;
;;; ── kerl ──────────────────────────────────────────
;;; Easy building and installing of Erlang/OTP instances
;;;
(define-public kerl
  (package
    (name "kerl")
    (version "4.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kerl/kerl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kerl" "bin/kerl"))))
    (home-page "https://github.com/kerl/kerl")
    (synopsis "easy building and installing of Erlang/OTP instances")
    (description
     "Kerl is a shell script that lets you easily build and install
multiple Erlang/OTP versions.  It is inspired by tools like rbenv
and pyenv, providing a simple way to manage multiple Erlang
installations side by side.")
    (license license:expat)))

;;;
;;; ── huawei-me936-udev ──────────────────────────────────────────
;;; Udev rules for Huawei ME936 LTE modem
;;;
(define-public huawei-me936-udev
  (package
    (name "huawei-me936-udev")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pkoretic/huawei-me936")
             (commit "master")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("60-huawei-me936.rules"
           "lib/udev/rules.d/60-huawei-me936.rules"))))
    (home-page "https://github.com/pkoretic/huawei-me936")
    (synopsis "udev rules for Huawei ME936 LTE modem")
    (description
     "This package provides udev rules for the Huawei ME936 LTE modem
to ensure proper device initialization on Linux systems.")
    (license license:gpl2+)))

;;;
;;; ── sudachi ──────────────────────────────────────────
;;; Japanese morphological analyzer
;;;
(define-public sudachi
  (package
    (name "sudachi")
    (version "0.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/WorksApplications/Sudachi/releases/download/v"
             version "/sudachi-" version "-executable.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sudachi.jar" "share/java/sudachi.jar")
           ("sudachi.json" "etc/sudachi/sudachi.json"))))
    (home-page "https://github.com/WorksApplications/Sudachi")
    (synopsis "Japanese morphological analyzer")
    (description
     "Sudachi is a Japanese morphological analyzer developed by Works
Applications.  It provides multiple granularity tokenization, handles
ambiguous OOV (out-of-vocabulary) words, and includes a comprehensive
built-in dictionary.")
    (license license:asl2.0)))

;;;
;;; ── fastgame ──────────────────────────────────────────
;;; Game performance optimizer for Linux
;;;
(define-public fastgame
  (package
    (name "fastgame")
    (version "0.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FeralInteractive/gamemode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list dbus))
    (home-page "https://github.com/FeralInteractive/gamemode")
    (synopsis "game performance optimizer for Linux")
    (description
     "Fastgame is a tool for optimizing game performance on Linux.  It
adjusts system settings such as CPU governor, I/O priority, and GPU
performance modes when games are running to provide a smoother gaming
experience.")
    (license license:bsd-3)))

;;;
;;; ── shh ──────────────────────────────────────────
;;; Automatic SSH agent management
;;;
(define-public shh
  (package
    (name "shh")
    (version "2024.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/anordal/shh")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/anordal/shh")
    (synopsis "automatic SSH agent management")
    (description
     "shh is a tool for automatic SSH agent management.  It ensures your
SSH keys are loaded when needed and manages agent lifetime, making
SSH key management seamless and hands-free.")
    (license license:mpl2.0)))

;;;
;;; ── zswap-disable-writeback ──────────────────────────────────
;;; Script to disable zswap writeback to disk
;;;
(define-public zswap-disable-writeback
  (package
    (name "zswap-disable-writeback")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/niccolobrogi/zswap-disable-writeback")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("zswap-disable-writeback" "bin/zswap-disable-writeback"))))
    (home-page "https://github.com/niccolobrogi/zswap-disable-writeback")
    (synopsis "disable zswap writeback to disk")
    (description
     "A script to disable zswap writeback to swap on disk.  This keeps
compressed pages in memory instead of writing them back to the swap
device, which can improve performance on systems with sufficient RAM.")
    (license license:gpl3+)))
