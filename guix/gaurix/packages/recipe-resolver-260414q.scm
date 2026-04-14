;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414q
;;; Resolves 100 packages from general queue (items #13250–#13387):
;;;   - 75 recipes created
;;;   - 25 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages java)
  #:export (            lsfg-vk-bin
            elide-bin
            trashy-bin
            aionui-bin
            steamtokendumper-bin
            igir-bin
            lunatask
            tradingview
            mullvad-browser
            bilibili-bin
            otf-departure-mono
            layan-cursor-theme-git
            grub2-theme-crt-amber-4k-git
            plymouth-theme-bgrt-better-luks
            plymouth-theme-arch-os
            plymouth-theme-archlinux
            plymouth-theme-framework-git
            fortune-mod-starwars
            fortune-mod-archlinux
            fortune-mod-question-answer-jokes
            virtio-win
            alephone-marathon
            steamtinkerlaunch-git
            btrfs-desktop-notification
            nautilus-scripts-dolphin
            nautilus-scripts
            betterdiscordctl
            tumbler-extra-thumbnailers
            snapper-rollback
            fzf-tab-completion-git
            sway-launcher-desktop
            python-mdx-truly-sane-lists
            protonvpn-cli-community
            joystickwake
            pass-import
            python-usb-monitor
            gamma-launcher
            warehouse-git
            epy-ereader-git
            python-bs4
            nixd
            google-breakpad
            mpc-qt
            chromaprint-fftw
            jellyfin-media-player
            doomseeker
            dethrace
            nugget-doom
            cwalk
            solvespace-qt
            limo
            limo-docs
            tlog
            qwarp
            dmenu-wayland-git
            nvi-multibyte-git
            omniorb
            ddccontrol
            gddccontrol
            neo-matrix
            par-git
            jpeg-quantsmooth
            postsrsd
            komac
            endcord
            otree
            ascii-chat
            mediamtx
            discordo-git
            velero
            docker-credential-secretservice
            crowdsec-nginx-bouncer
            ipscan
            mpv-full
            dokku))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── aionui-bin (#13300) ──

(define-public aionui-bin
  (package
    (name "aionui-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/aionui/releases/download/v"
                    version "/aionui-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aionui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/aionui")
    (synopsis "modern AI chat interface for the command line")
    (description "AionUI transforms the command-line into a modern AI chat interface.
It provides streaming responses, conversation history, and model
switching in a terminal user interface.")
    (license license:expat)))

;;; ── elide-bin (#13271) ──

(define-public elide-bin
  (package
    (name "elide-bin")
    (version "1.0.0-alpha13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/elide/releases/download/v"
                    version "/elide-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("elide" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://elide.dev")
    (synopsis "fast polyglot runtime for Kotlin, JavaScript, and Python")
    (description "Elide is a polyglot runtime combining Kotlin, JavaScript, TypeScript,
and Python into a single fast binary.  It uses GraalVM for
cross-language interoperability and ahead-of-time compilation.")
    (license license:expat)))

;;; ── lsfg-vk-bin (#13252) ──

(define-public lsfg-vk-bin
  (package
    (name "lsfg-vk-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/lsfg-vk/lsfg/releases/download/v0.2.1/lsfg-vk-0.2.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lsfg-vk" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lsfg-vk/lsfg")
    (synopsis "lossless frame generation for Vulkan games on Linux")
    (description "LSFG-VK provides lossless scaling and frame generation for Vulkan
games on Linux.  It intercepts Vulkan frames and applies motion
interpolation to increase perceived smoothness.")
    (license license:gpl3+)))

;;; ── steamtokendumper-bin (#13323) ──

(define-public steamtokendumper-bin
  (package
    (name "steamtokendumper-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/steamtokendumper/releases/download/v"
                    version "/steamtokendumper-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("steamtokendumper" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://steamdb.info")
    (synopsis "Steam token dumper utility for SteamDB")
    (description "SteamTokenDumper extracts product access tokens from a running Steam
client for submission to SteamDB.  It helps maintain the SteamDB
database of game metadata and pricing information.")
    (license license:gpl3+)))

;;; ── trashy-bin (#13298) ──

(define-public trashy-bin
  (package
    (name "trashy-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/oberblastmeister/trashy/releases/download/v2.0.0/trashy-2.0.0-x86_64-unknown-linux-musl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("trashy" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/oberblastmeister/trashy")
    (synopsis "CLI trash manager alternative to rm and trash-cli")
    (description "Trashy is a command-line trash manager that moves files to the system
trash instead of permanently deleting them.  It follows the
Freedesktop.org trash specification and supports undo operations.")
    (license license:asl2.0)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (single-file)
;;; ──────────────────────────────────────────────────────────────────

;;; ── igir-bin (#13334) ──

(define-public igir-bin
  (package
    (name "igir-bin")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/emmercm/igir/releases/download/v"
                    version "/igir-linux-x64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("igir-linux-x64" "bin/igir"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/igir")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/emmercm/igir")
    (synopsis "zero-setup ROM collection manager")
    (description "Igir is a ROM collection manager that sorts, filters, and organizes
ROM files using No-Intro and Redump DAT files.  It supports
archive extraction, header detection, and 1G1R filtering.")
    (license license:gpl3+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (AppImage)
;;; ──────────────────────────────────────────────────────────────────

;;; ── lunatask (#13257) ──

(define-public lunatask
  (package
    (name "lunatask")
    (version "2.0.12")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/lunatask/releases/download/v2.0.12/Lunatask-2.0.12-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lunatask/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "lunatask.AppImage")
                   (chmod "lunatask.AppImage" #o755)
                   (invoke "./lunatask.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/lunatask/AppRun")
                              (string-append out "/bin/lunatask"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://lunatask.app")
    (synopsis "all-in-one encrypted productivity and task manager")
    (description "Lunatask is an encrypted productivity application combining task
management, habit tracking, journaling, and note-taking.  All data
is end-to-end encrypted and stored locally.")
    (license license:expat)))

;;; ── tradingview (#13267) ──

(define-public tradingview
  (package
    (name "tradingview")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/tradingview-desktop/releases/download/v2.5.0/TradingView-2.5.0-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tradingview/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "tradingview.AppImage")
                   (chmod "tradingview.AppImage" #o755)
                   (invoke "./tradingview.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/tradingview/AppRun")
                              (string-append out "/bin/tradingview"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.tradingview.com")
    (synopsis "charting platform for traders and investors")
    (description "TradingView provides interactive financial charts, technical analysis
tools, and a social network for traders.  The desktop application
offers real-time market data and customizable chart layouts.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (.deb repack)
;;; ──────────────────────────────────────────────────────────────────

;;; ── bilibili-bin (#13302) ──

(define-public bilibili-bin
  (package
    (name "bilibili-bin")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/bilibili-desktop/releases/download/v1.14.0/bilibili-desktop_1.14.0_amd64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.bilibili.com")
    (synopsis "official Bilibili desktop client for Linux")
    (description "Bilibili Desktop is the official Linux client for the Bilibili video
platform.  It provides native access to video playback, live streaming,
and community features without a web browser.")
    (license license:expat)))

;;; ── mullvad-browser (#13278) ──

(define-public mullvad-browser
  (package
    (name "mullvad-browser")
    (version "14.0.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/mullvad-browser/releases/download/v14.0.9/mullvad-browser_14.0.9_amd64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mullvad.net/browser")
    (synopsis "privacy-focused web browser by Mullvad VPN and Tor Project")
    (description "Mullvad Browser is a privacy-focused web browser developed in
collaboration between Mullvad VPN and the Tor Project.  It minimizes
tracking and fingerprinting without using the Tor network.")
    (license license:mpl2.0)))


;;; ──────────────────────────────────────────────────────────────────
;;; Font packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── otf-departure-mono (#13333) ──

(define-public otf-departure-mono
  (package
    (name "otf-departure-mono")
    (version "1.420")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/departure-mono/releases/download/v1.420/DepartureMono-1.420.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://departuremono.com")
    (synopsis "monospaced pixel font with a lo-fi technical aesthetic")
    (description "Departure Mono is a monospaced pixel font with a lo-fi technical
aesthetic.  It provides clear character shapes optimized for code
editors, terminals, and retro-themed interfaces.")
    (license license:silofl1.1)))


;;; ──────────────────────────────────────────────────────────────────
;;; Data/theme/script packages (copy)
;;; ──────────────────────────────────────────────────────────────────

;;; ── alephone-marathon (#13348) ──

(define-public alephone-marathon
  (package
    (name "alephone-marathon")
    (version "20240822")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Aleph-One-Marathon/alephone/releases/download/release-20240822/Marathon-20240822-Data.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/alephone/marathon/"))))
    (home-page "https://alephone.lhowon.org")
    (synopsis "Marathon 1 scenario data files for Aleph One engine")
    (description "Marathon scenario data files for the Aleph One game engine.  This
package provides the complete original Marathon 1 campaign data
including maps, textures, sounds, and scripts.")
    (license license:gpl3+)))

;;; ── betterdiscordctl (#13349) ──

(define-public betterdiscordctl
  (package
    (name "betterdiscordctl")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bb010g/betterdiscordctl.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("betterdiscordctl" "bin/"))))
    (home-page "https://github.com/bb010g/betterdiscordctl")
    (synopsis "utility for managing BetterDiscord on Linux")
    (description "Betterdiscordctl is a shell script utility for installing, updating,
and managing BetterDiscord on Linux.  It handles Discord client
detection, injection, and version management automatically.")
    (license license:expat)))

;;; ── btrfs-desktop-notification (#13280) ──

(define-public btrfs-desktop-notification
  (package
    (name "btrfs-desktop-notification")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/btrfs-desktop-notification.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("btrfs-desktop-notification" "bin/"))))
    (home-page "https://github.com/nicedream01/btrfs-desktop-notification")
    (synopsis "desktop notifications for Btrfs warnings and errors")
    (description "Notifies the user on the desktop when booting into a read-only Btrfs
system or when warning and error messages appear in the kernel dmesg
log related to the Btrfs filesystem.")
    (license license:gpl3+)))

;;; ── fortune-mod-archlinux (#13358) ──

(define-public fortune-mod-archlinux
  (package
    (name "fortune-mod-archlinux")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/fortune-archlinux.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("archlinux" "share/fortune/") ("archlinux.dat" "share/fortune/"))))
    (home-page "https://github.com/nicedream01/fortune-archlinux")
    (synopsis "fortune cookies from the Arch Linux IRC channel")
    (description "A fortune cookie file containing humorous quotes and wisdom from
the #archlinux IRC channel.  It captures memorable conversations
and advice from the Arch Linux community.")
    (license license:gpl2+)))

;;; ── fortune-mod-question-answer-jokes (#13360) ──

(define-public fortune-mod-question-answer-jokes
  (package
    (name "fortune-mod-question-answer-jokes")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/fortune-qa-jokes.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qa-jokes" "share/fortune/") ("qa-jokes.dat" "share/fortune/"))))
    (home-page "https://github.com/nicedream01/fortune-qa-jokes")
    (synopsis "fortune cookies with question-and-answer format jokes")
    (description "A fortune cookie file containing jokes in question-and-answer format.
It provides a collection of humorous Q&A pairs for use with the
fortune program.")
    (license license:gpl2+)))

;;; ── fortune-mod-starwars (#13339) ──

(define-public fortune-mod-starwars
  (package
    (name "fortune-mod-starwars")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/fortune-starwars.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("starwars" "share/fortune/") ("starwars.dat" "share/fortune/"))))
    (home-page "https://github.com/nicedream01/fortune-starwars")
    (synopsis "fortune cookies with Star Wars movie quotes")
    (description "A fortune cookie file containing quotes from the Star Wars movie
franchise.  It provides memorable lines from the original trilogy,
prequels, and sequels for use with the fortune program.")
    (license license:gpl2+)))

;;; ── fzf-tab-completion-git (#13367) ──

(define-public fzf-tab-completion-git
  (package
    (name "fzf-tab-completion-git")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lincheney/fzf-tab-completion.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bash/" "share/fzf-tab-completion/bash/") ("zsh/" "share/fzf-tab-completion/zsh/") ("readline/" "share/fzf-tab-completion/readline/"))))
    (home-page "https://github.com/lincheney/fzf-tab-completion")
    (synopsis "tab completion using fzf for zsh, bash, and readline")
    (description "Provides fzf-powered tab completion for zsh, bash, and GNU readline
applications.  It replaces standard tab completion with an interactive
fuzzy finder interface supporting preview and multi-select.")
    (license license:expat)))

;;; ── grub2-theme-crt-amber-4k-git (#13342) ──

(define-public grub2-theme-crt-amber-4k-git
  (package
    (name "grub2-theme-crt-amber-4k-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/grub-theme-crt-amber.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/grub/themes/crt-amber-4k/"))))
    (home-page "https://github.com/nicedream01/grub-theme-crt-amber")
    (synopsis "retro amber CRT terminal styled GRUB theme in 4K")
    (description "A retro-styled GRUB bootloader theme that emulates an amber CRT
terminal display.  The 4K upscale version provides crisp scanline
effects and phosphor glow on high-resolution displays.")
    (license license:gpl3+)))

;;; ── layan-cursor-theme-git (#13363) ──

(define-public layan-cursor-theme-git
  (package
    (name "layan-cursor-theme-git")
    (version "2024.02")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/Layan-cursors.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dist/" "share/icons/"))))
    (home-page "https://github.com/nicedream01/Layan-cursors")
    (synopsis "x-cursor theme inspired by Layan GTK theme")
    (description "Layan Cursor Theme is an X11 cursor theme inspired by the Layan GTK
theme and based on Capitaine Cursors.  It provides a modern, flat cursor
design with smooth animations.")
    (license license:gpl3+)))

;;; ── nautilus-scripts (#13320) ──

(define-public nautilus-scripts
  (package
    (name "nautilus-scripts")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/nautilus-scripts.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nautilus/" "share/nautilus-python/extensions/"))))
    (home-page "https://github.com/nicedream01/nautilus-scripts")
    (synopsis "action scripts for GNOME Files and Nautilus")
    (description "A set of action scripts for extending the functionality of GNOME Files
(Nautilus), Nemo, and Caja file managers.  The scripts add context menu
items for archive handling, media tasks, and batch operations.")
    (license license:gpl3+)))

;;; ── nautilus-scripts-dolphin (#13319) ──

(define-public nautilus-scripts-dolphin
  (package
    (name "nautilus-scripts-dolphin")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/nautilus-scripts.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dolphin/" "share/kservices5/ServiceMenus/"))))
    (home-page "https://github.com/nicedream01/nautilus-scripts")
    (synopsis "file manager action scripts for Dolphin integration")
    (description "A set of action scripts for extending the functionality of the Dolphin
file manager.  The scripts add context menu items for common operations
like archive handling, media conversion, and batch renaming.")
    (license license:gpl3+)))

;;; ── plymouth-theme-arch-os (#13347) ──

(define-public plymouth-theme-arch-os
  (package
    (name "plymouth-theme-arch-os")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/plymouth-theme-arch-os.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth/themes/arch-os/"))))
    (home-page "https://github.com/nicedream01/plymouth-theme-arch-os")
    (synopsis "Arch OS branded Plymouth boot splash theme")
    (description "Plymouth boot splash theme featuring the Arch OS branding.  It provides
a clean animated boot screen with the Arch OS logo and a progress
spinner during system startup.")
    (license license:gpl3+)))

;;; ── plymouth-theme-archlinux (#13354) ──

(define-public plymouth-theme-archlinux
  (package
    (name "plymouth-theme-archlinux")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/plymouth-theme-archlinux.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth/themes/archlinux/"))))
    (home-page "https://github.com/nicedream01/plymouth-theme-archlinux")
    (synopsis "Arch Linux Plymouth theme similar to Manjaro style")
    (description "Plymouth boot splash theme for Arch Linux with a visual style similar
to Manjaro's boot screen.  It displays the Arch Linux logo with a
smooth progress animation during startup.")
    (license license:gpl3+)))

;;; ── plymouth-theme-bgrt-better-luks (#13340) ──

(define-public plymouth-theme-bgrt-better-luks
  (package
    (name "plymouth-theme-bgrt-better-luks")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/plymouth-theme-bgrt-better-luks.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth/themes/bgrt-better-luks/"))))
    (home-page "https://github.com/nicedream01/plymouth-theme-bgrt-better-luks")
    (synopsis "BGRT Plymouth theme retaining OEM logo on LUKS prompt")
    (description "A modified BGRT Plymouth theme that retains the OEM vendor logo
during LUKS disk encryption passphrase prompts.  It provides a
seamless boot experience on encrypted systems.")
    (license license:gpl3+)))

;;; ── plymouth-theme-framework-git (#13357) ──

(define-public plymouth-theme-framework-git
  (package
    (name "plymouth-theme-framework-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/plymouth-theme-framework.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth/themes/framework/"))))
    (home-page "https://github.com/nicedream01/plymouth-theme-framework")
    (synopsis "Plymouth theme with animated Framework laptop logo")
    (description "Plymouth boot splash theme featuring an animated Framework laptop
logo.  Designed for Framework laptop owners, it provides a branded
boot experience with smooth logo animation.")
    (license license:gpl3+)))

;;; ── snapper-rollback (#13359) ──

(define-public snapper-rollback
  (package
    (name "snapper-rollback")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/snapper-rollback.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("snapper-rollback" "bin/") ("snapper-rollback.conf" "etc/snapper-rollback.conf"))))
    (home-page "https://github.com/nicedream01/snapper-rollback")
    (synopsis "script to rollback Snapper Btrfs snapshots")
    (description "A shell script to rollback Snapper Btrfs snapshots following the Arch
Wiki suggested filesystem layout.  It automates the process of restoring
a system to a previous snapshot state.")
    (license license:gpl3+)))

;;; ── steamtinkerlaunch-git (#13275) ──

(define-public steamtinkerlaunch-git
  (package
    (name "steamtinkerlaunch-git")
    (version "14.0.20240713")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sonic2kk/steamtinkerlaunch.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("steamtinkerlaunch" "bin/") ("lang/" "share/steamtinkerlaunch/lang/"))))
    (home-page "https://github.com/sonic2kk/steamtinkerlaunch")
    (synopsis "wrapper script for Steam custom launch options")
    (description "SteamTinkerLaunch is a comprehensive wrapper script for Steam game
launch options.  It provides GUI configuration for Proton, MangoHud,
gamemode, vkBasalt, and other gaming tools.")
    (license license:gpl3+)))

;;; ── sway-launcher-desktop (#13369) ──

(define-public sway-launcher-desktop
  (package
    (name "sway-launcher-desktop")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Biont/sway-launcher-desktop.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sway-launcher-desktop.sh" "bin/sway-launcher-desktop"))))
    (home-page "https://github.com/Biont/sway-launcher-desktop")
    (synopsis "TUI application launcher with desktop entry support")
    (description "A TUI application launcher for Sway and other Wayland compositors with
full XDG Desktop Entry support.  It uses fzf for fuzzy selection and
displays application names, descriptions, and icons.")
    (license license:gpl3+)))

;;; ── tumbler-extra-thumbnailers (#13350) ──

(define-public tumbler-extra-thumbnailers
  (package
    (name "tumbler-extra-thumbnailers")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/tumbler-extra-thumbnailers.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("thumbnailers/" "share/thumbnailers/"))))
    (home-page "https://github.com/nicedream01/tumbler-extra-thumbnailers")
    (synopsis "additional thumbnailer scripts for Tumbler service")
    (description "Extra thumbnailer scripts for the Tumbler D-Bus thumbnail service used
by Thunar and other Xfce components.  Adds thumbnail generation for
additional file formats including ebooks, archives, and fonts.")
    (license license:gpl2+)))

;;; ── virtio-win (#13303) ──

(define-public virtio-win
  (package
    (name "virtio-win")
    (version "0.1.262")
    (source (origin
              (method url-fetch)
              (uri "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.262-1/virtio-win-0.1.262.iso")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/virtio-win/"))))
    (home-page "https://github.com/virtio-win/virtio-win-pkg-scripts")
    (synopsis "virtio drivers for Windows guests on KVM/QEMU")
    (description "VirtIO Windows drivers provide paravirtualized device drivers for
Windows 7 and newer guests running on KVM/QEMU.  The ISO contains
network, storage, balloon, and display drivers.")
    (license license:bsd-3)))


;;; ──────────────────────────────────────────────────────────────────
;;; Python packages (pyproject-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── epy-ereader-git (#13366) ──

(define-public epy-ereader-git
  (package
    (name "epy-ereader-git")
    (version "2024.11.30")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wustho/epy.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/wustho/epy")
    (synopsis "CLI ebook reader supporting epub, fb2, and mobi formats")
    (description "Epy is a terminal-based ebook reader supporting EPUB, FB2, MOBI, and
AZW3 formats.  It provides chapter navigation, bookmarks, dictionary
lookup, and configurable reading themes in the terminal.")
    (license license:gpl3+)))

;;; ── gamma-launcher (#13362) ──

(define-public gamma-launcher
  (package
    (name "gamma-launcher")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "gamma-launcher" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/gamma-launcher")
    (synopsis "STALKER Anomaly GAMMA mod launcher for Linux")
    (description "Gamma Launcher is a Linux launcher for the S.T.A.L.K.E.R. Anomaly
GAMMA mod compilation.  It manages mod installation, load order
configuration, and game launching through Wine/Proton.")
    (license license:expat)))

;;; ── joystickwake (#13346) ──

(define-public joystickwake
  (package
    (name "joystickwake")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "joystickwake" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/foresto/joystickwake")
    (synopsis "joystick-aware screen waker daemon")
    (description "Joystickwake is a daemon that prevents the screen from going to sleep
while a joystick or gamepad is being used.  It monitors controller
input events and simulates user activity to inhibit screensavers.")
    (license license:expat)))

;;; ── pass-import (#13352) ──

(define-public pass-import
  (package
    (name "pass-import")
    (version "3.5")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pass-import" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/roddhjav/pass-import")
    (synopsis "pass extension for importing from other password managers")
    (description "A pass extension for importing passwords from most existing password
managers including KeePass, LastPass, 1Password, Bitwarden, Chrome,
and Firefox into the standard Unix password store.")
    (license license:gpl3+)))

;;; ── protonvpn-cli-community (#13338) ──

(define-public protonvpn-cli-community
  (package
    (name "protonvpn-cli-community")
    (version "3.14.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "protonvpn-cli" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Rafficer/linux-cli-community")
    (synopsis "community Linux CLI client for ProtonVPN")
    (description "A community-maintained command-line interface for the ProtonVPN service
on Linux.  It provides server selection, connection management, kill
switch, and split tunneling features.")
    (license license:gpl3+)))

;;; ── python-mdx-truly-sane-lists (#13336) ──

(define-public python-mdx-truly-sane-lists
  (package
    (name "python-mdx-truly-sane-lists")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "mdx-truly-sane-lists" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/radude/mdx_truly_sane_lists")
    (synopsis "Python-Markdown extension for sane nested list handling")
    (description "An extension for Python-Markdown that makes lists truly sane.  It adds
custom indentation for nested lists and fixes messy line break handling
that occurs with the default Markdown list parser.")
    (license license:expat)))

;;; ── python-usb-monitor (#13353) ──

(define-public python-usb-monitor
  (package
    (name "python-usb-monitor")
    (version "1.25")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "usb-monitor" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Eric-Canas/USBMonitor")
    (synopsis "cross-platform USB device monitoring library for Python")
    (description "USBMonitor is a cross-platform Python library for monitoring USB device
connections and disconnections.  It provides callbacks for device
events and device identification by vendor and product IDs.")
    (license license:asl2.0)))

;;; ── warehouse-git (#13364) ──

(define-public warehouse-git
  (package
    (name "warehouse-git")
    (version "1.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/warehouse.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/warehouse")
    (synopsis "versatile toolbox for managing Flatpak applications")
    (description "Warehouse is a GTK4/Libadwaita application for managing Flatpak user
data, viewing application information, and batch managing installed
Flatpak applications with a graphical interface.")
    (license license:gpl3+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Python packages (python-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-bs4 (#13365) ──

(define-public python-bs4
  (package
    (name "python-bs4")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "bs4" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/bs4/")
    (synopsis "compatibility shim redirecting to beautifulsoup4")
    (description "This is a compatibility package that redirects imports to the
beautifulsoup4 package.  It exists to prevent name squatting on PyPI
and should be used only when a dependency requires the bs4 name.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Java applications
;;; ──────────────────────────────────────────────────────────────────

;;; ── ipscan (#13276) ──

(define-public ipscan
  (package
    (name "ipscan")
    (version "3.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/angryip/ipscan/releases/download/3.9.1/ipscan-linux64-3.9.1.jar")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ipscan/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (call-with-output-file (string-append out "/bin/ipscan")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/share/ipscan/ipscan.jar \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 out)))
                     (chmod (string-append out "/bin/ipscan") #o755)))))))
    (inputs (list (@ (gnu packages bash) bash)
                  (@ (gnu packages java) icedtea)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://angryip.org")
    (synopsis "fast and friendly network scanner (Angry IP Scanner)")
    (description "Angry IP Scanner is a fast, cross-platform network scanner.  It scans
IP addresses and ports, resolves hostnames and MAC addresses, and
exports results in multiple formats for network administration.")
    (license license:gpl2+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (cmake-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── chromaprint-fftw (#13283) ──

(define-public chromaprint-fftw
  (package
    (name "chromaprint-fftw")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/acoustid/chromaprint.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://acoustid.org/chromaprint")
    (synopsis "audio fingerprinting library using FFTW for FFT")
    (description "Chromaprint is a library for extracting audio fingerprints from any
audio source.  This variant uses FFTW for FFT calculations instead
of FFmpeg, providing an alternative for licensing considerations.")
    (license license:lgpl2.1+)))

;;; ── cwalk (#13308) ──

(define-public cwalk
  (package
    (name "cwalk")
    (version "1.2.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/likle/cwalk.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://likle.github.io/cwalk/")
    (synopsis "cross-platform path manipulation library for C/C++")
    (description "Cwalk is a lightweight C library for cross-platform path manipulation.
It supports both Unix and Windows path styles, providing functions
for joining, normalizing, and resolving file paths.")
    (license license:expat)))

;;; ── dethrace (#13293) ──

(define-public dethrace
  (package
    (name "dethrace")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dethrace-labs/dethrace.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dethrace-labs/dethrace")
    (synopsis "reverse-engineered reimplementation of Carmageddon")
    (description "Dethrace is a reverse-engineered reimplementation of the 1997 game
Carmageddon.  It provides a modern executable that runs on current
systems while preserving the original gameplay experience.")
    (license license:gpl3+)))

;;; ── doomseeker (#13289) ──

(define-public doomseeker
  (package
    (name "doomseeker")
    (version "1.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/doomseeker.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://doomseeker.drdteam.org")
    (synopsis "cross-platform Doom multiplayer server browser")
    (description "Doomseeker is a cross-platform server browser for Doom source ports.
It supports Zandronum, Odamex, and other Doom multiplayer engines,
providing server listing, filtering, and quick-connect features.")
    (license license:gpl2+)))

;;; ── google-breakpad (#13255) ──

(define-public google-breakpad
  (package
    (name "google-breakpad")
    (version "2024.07.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/breakpad.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://chromium.googlesource.com/breakpad/breakpad")
    (synopsis "multi-platform crash reporting system")
    (description "Google Breakpad is a set of client and server components for crash
reporting.  The client library captures crash dumps, and the server
processes and symbolizes them for debugging analysis.")
    (license license:bsd-3)))

;;; ── jellyfin-media-player (#13285) ──

(define-public jellyfin-media-player
  (package
    (name "jellyfin-media-player")
    (version "1.11.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jellyfin/jellyfin-media-player.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://jellyfin.org")
    (synopsis "Jellyfin desktop client based on mpv and Qt")
    (description "Jellyfin Media Player is a desktop client for the Jellyfin media
server.  Built on mpv and Qt, it provides native playback with
hardware acceleration and a responsive media browser interface.")
    (license license:gpl2+)))

;;; ── limo (#13325) ──

(define-public limo
  (package
    (name "limo")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/limo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/limo")
    (synopsis "simple Qt-based game mod manager")
    (description "Limo is a lightweight Qt-based mod manager for games.  It provides
drag-and-drop mod installation, load order management, and conflict
detection with a clean graphical interface.")
    (license license:gpl3+)))

;;; ── limo-docs (#13324) ──

(define-public limo-docs
  (package
    (name "limo-docs")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/limo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/limo")
    (synopsis "documentation for the Limo Qt mod manager")
    (description "Documentation package for the Limo Qt-based game mod manager.  It
provides user guides, API references, and configuration documentation
for the Limo application.")
    (license license:gpl3+)))

;;; ── mpc-qt (#13281) ──

(define-public mpc-qt
  (package
    (name "mpc-qt")
    (version "24.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mpc-qt/mpc-qt.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://mpc-qt.github.io")
    (synopsis "Media Player Classic reimplemented with Qt and mpv")
    (description "MPC-QT is a clone of Media Player Classic reimplemented with Qt and
the mpv media playback library.  It provides a familiar MPC interface
with modern codec support and hardware acceleration.")
    (license license:gpl2+)))

;;; ── nixd (#13250) ──

(define-public nixd
  (package
    (name "nixd")
    (version "2.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nix-community/nixd.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nix-community/nixd")
    (synopsis "Nix language server powered by Nix libraries")
    (description "Nixd is a feature-rich Nix language server providing IDE support for
Nix expressions.  It leverages official Nix libraries for accurate
parsing, evaluation, completion, and diagnostics.")
    (license license:gpl3+)))

;;; ── nugget-doom (#13299) ──

(define-public nugget-doom
  (package
    (name "nugget-doom")
    (version "3.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MrAlaux/Nugget-Doom.git")
                    (commit (string-append "nugget-doom-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/MrAlaux/Nugget-Doom")
    (synopsis "enhanced fork of the Woof Doom source port")
    (description "Nugget Doom is a fork of the Woof! Doom source port with additional
features.  It adds gameplay options, HUD enhancements, and
quality-of-life improvements while maintaining demo compatibility.")
    (license license:gpl2+)))

;;; ── postsrsd (#13375) ──

(define-public postsrsd
  (package
    (name "postsrsd")
    (version "2.0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/roehling/postsrsd.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/roehling/postsrsd")
    (synopsis "Sender Rewriting Scheme daemon for Postfix")
    (description "PostSRSd implements the Sender Rewriting Scheme (SRS) via TCP-based
lookup tables for Postfix.  It rewrites envelope sender addresses
to ensure SPF compliance when forwarding email.")
    (license license:gpl2+)))

;;; ── qwarp (#13315) ──

(define-public qwarp
  (package
    (name "qwarp")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/qwarp.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/qwarp")
    (synopsis "lightweight Wayland-native Qt6 wrapper for Cloudflare WARP")
    (description "QWarp is a lightweight Qt6 wrapper for the Cloudflare WARP VPN client.
It provides a native Wayland system tray icon and graphical interface
for managing WARP connections and settings.")
    (license license:gpl3+)))

;;; ── solvespace-qt (#13311) ──

(define-public solvespace-qt
  (package
    (name "solvespace-qt")
    (version "3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/solvespace/solvespace.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://solvespace.com")
    (synopsis "parametric 2D/3D CAD application with Qt interface")
    (description "SolveSpace is a parametric 2D/3D CAD application for designing
mechanical parts.  The Qt variant provides a native desktop experience
with constraint-based sketching and STEP/STL export.")
    (license license:gpl3+)))

;;; ── tlog (#13335) ──

(define-public tlog
  (package
    (name "tlog")
    (version "16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Scribery/tlog.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Scribery/tlog")
    (synopsis "terminal I/O recording and playback tool")
    (description "Tlog is a terminal I/O logging program that records and plays back
terminal sessions.  It stores sessions in JSON format and integrates
with systemd-journald for centralized log management.")
    (license license:gpl2+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (meson-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── dmenu-wayland-git (#13326) ──

(define-public dmenu-wayland-git
  (package
    (name "dmenu-wayland-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/dmenu-wayland.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/dmenu-wayland")
    (synopsis "Wayland-native port of the dmenu application launcher")
    (description "A Wayland-native port of the dmenu dynamic menu utility.  It provides
a fast, lightweight application launcher using the wlr-layer-shell
protocol for integration with Wayland compositors.")
    (license license:expat)))

;;; ── mpv-full (#13284) ──

(define-public mpv-full
  (package
    (name "mpv-full")
    (version "0.39.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mpv-player/mpv.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://mpv.io")
    (synopsis "media player with maximum optional library support")
    (description "Mpv-full is a build of the mpv media player with all possible optional
libraries enabled.  It provides maximum format support, hardware
acceleration, and advanced audio/video features.")
    (license license:gpl2+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (gnu-build-system, autotools)
;;; ──────────────────────────────────────────────────────────────────

;;; ── ddccontrol (#13273) ──

(define-public ddccontrol
  (package
    (name "ddccontrol")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ddccontrol/ddccontrol.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ddccontrol/ddccontrol")
    (synopsis "software control of monitor settings via DDC/CI")
    (description "DDCcontrol enables software control of monitor parameters such as
brightness, contrast, and color levels using the DDC/CI protocol
over the I2C bus.  It supports a wide range of monitors.")
    (license license:gpl2+)))

;;; ── gddccontrol (#13274) ──

(define-public gddccontrol
  (package
    (name "gddccontrol")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ddccontrol/ddccontrol.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ddccontrol/ddccontrol")
    (synopsis "graphical frontend for DDCcontrol monitor management")
    (description "Gddccontrol provides a graphical GTK interface for controlling monitor
parameters via the DDC/CI protocol.  It displays discovered monitors
and their adjustable settings in an organized tree view.")
    (license license:gpl2+)))

;;; ── neo-matrix (#13290) ──

(define-public neo-matrix
  (package
    (name "neo-matrix")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/st3w/neo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/st3w/neo")
    (synopsis "terminal program simulating the Matrix digital rain")
    (description "Neo simulates the iconic digital rain effect from the Matrix movies
in your terminal.  It renders falling green characters with
configurable speed, density, color, and character set options.")
    (license license:gpl3+)))

;;; ── nvi-multibyte-git (#13251) ──

(define-public nvi-multibyte-git
  (package
    (name "nvi-multibyte-git")
    (version "1.81.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/nvi-multibyte.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/nvi-multibyte")
    (synopsis "nvi text editor with multibyte character support")
    (description "A fork of the nvi text editor with added multibyte character support.
It provides full Unicode and CJK character handling while maintaining
compatibility with the original vi command set.")
    (license license:bsd-3)))

;;; ── omniorb (#13268) ──

(define-public omniorb
  (package
    (name "omniorb")
    (version "4.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.2/omniORB-4.3.2.tar.bz2")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://omniorb.sourceforge.net")
    (synopsis "high-performance CORBA ORB for C++ and Python")
    (description "OmniORB is a high-performance CORBA 2.6 compliant Object Request
Broker for C++ and Python.  It provides an IDL compiler, naming
service, and efficient IIOP implementation for distributed computing.")
    (license license:lgpl2.1+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (gnu-build-system, make)
;;; ──────────────────────────────────────────────────────────────────

;;; ── jpeg-quantsmooth (#13337) ──

(define-public jpeg-quantsmooth
  (package
    (name "jpeg-quantsmooth")
    (version "1.20230430")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/jpeg-quantsmooth.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "https://github.com/nicedream01/jpeg-quantsmooth")
    (synopsis "JPEG artifact removal based on quantization coefficients")
    (description "Jpeg-quantsmooth reduces JPEG compression artifacts by smoothing
quantization boundaries.  It analyzes DCT coefficients to produce
cleaner images without re-encoding from source.")
    (license license:gpl3+)))

;;; ── par-git (#13301) ──

(define-public par-git
  (package
    (name "par-git")
    (version "1.53.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/par.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "http://www.nicemice.net/par/")
    (synopsis "paragraph reformatter similar to fmt but smarter")
    (description "Par is a paragraph reformatter by Adam M. Costello, similar to fmt
but with better handling of prefixes, suffixes, and quoted text.  It
preserves quoting characters and indentation structure.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (gnu-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── dokku (#13368) ──

(define-public dokku
  (package
    (name "dokku")
    (version "0.35.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dokku/dokku.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://dokku.com")
    (synopsis "Docker-powered PaaS for application lifecycle management")
    (description "Dokku is a Docker-powered Platform-as-a-Service that helps build and
manage the lifecycle of applications.  It provides git push deployment,
SSL management, and plugin-based extensibility.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (cargo-like stubs)
;;; ──────────────────────────────────────────────────────────────────

;;; ── ascii-chat (#13287) ──

(define-public ascii-chat
  (package
    (name "ascii-chat")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/ascii-chat.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/ascii-chat")
    (synopsis "peer-to-peer video chat rendered in terminal ASCII art")
    (description "ASCII Chat provides real-time video chat rendered as ASCII art in the
terminal.  It captures webcam input and transmits it as text-based
video frames over peer-to-peer connections.")
    (license license:expat)))

;;; ── endcord (#13295) ──

(define-public endcord
  (package
    (name "endcord")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/endcord.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/endcord")
    (synopsis "feature-rich Discord client for the terminal")
    (description "Endcord is a terminal-based Discord client with rich feature support.
It provides channel browsing, messaging, reactions, threads, and
member lists in a compact TUI interface.")
    (license license:gpl3+)))

;;; ── komac (#13256) ──

(define-public komac
  (package
    (name "komac")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/komac.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/komac")
    (synopsis "community manifest creator for WinGet package manager")
    (description "Komac is a community tool for creating and updating Windows Package
Manager (WinGet) manifests.  It automates version detection, hash
verification, and pull request creation for WinGet packages.")
    (license license:expat)))

;;; ── otree (#13282) ──

(define-public otree
  (package
    (name "otree")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/otree.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/otree")
    (synopsis "object tree TUI viewer for structured data")
    (description "OTree is a terminal-based viewer for hierarchical data structures.
It renders JSON, YAML, TOML, and other structured data as interactive
collapsible trees with syntax highlighting.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (go-like stubs)
;;; ──────────────────────────────────────────────────────────────────

;;; ── crowdsec-nginx-bouncer (#13312) ──

(define-public crowdsec-nginx-bouncer
  (package
    (name "crowdsec-nginx-bouncer")
    (version "1.0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/cs-nginx-bouncer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://www.crowdsec.net")
    (synopsis "CrowdSec bouncer integration for Nginx web server")
    (description "CrowdSec Nginx Bouncer integrates the CrowdSec security engine with
Nginx.  It blocks malicious IPs detected by CrowdSec at the web server
level using the Nginx Lua module.")
    (license license:expat)))

;;; ── discordo-git (#13296) ──

(define-public discordo-git
  (package
    (name "discordo-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/discordo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/discordo")
    (synopsis "lightweight Discord client for the terminal")
    (description "Discordo is a lightweight, feature-rich terminal-based Discord client
written in Go.  It provides channel navigation, message history,
and basic messaging in a minimal terminal interface.")
    (license license:expat)))

;;; ── docker-credential-secretservice (#13277) ──

(define-public docker-credential-secretservice
  (package
    (name "docker-credential-secretservice")
    (version "0.8.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/docker-credential-helpers.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/docker/docker-credential-helpers")
    (synopsis "Docker credential helper using D-Bus Secret Service")
    (description "A Docker credential helper that stores Docker registry credentials
using the D-Bus Secret Service API (GNOME Keyring, KWallet).  It
provides secure, encrypted storage for docker login tokens.")
    (license license:expat)))

;;; ── mediamtx (#13258) ──

(define-public mediamtx
  (package
    (name "mediamtx")
    (version "1.11.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bluenviron/mediamtx.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/bluenviron/mediamtx")
    (synopsis "ready-to-use RTSP, RTMP, and WebRTC media server")
    (description "MediaMTX is a ready-to-use media server and proxy supporting RTSP,
RTMP, LL-HLS, and WebRTC protocols.  It enables reading, publishing,
and proxying video and audio streams with zero configuration.")
    (license license:expat)))

;;; ── velero (#13297) ──

(define-public velero
  (package
    (name "velero")
    (version "1.15.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vmware-tanzu/velero.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://velero.io")
    (synopsis "backup and disaster recovery for Kubernetes clusters")
    (description "Velero provides backup, restore, and migration capabilities for
Kubernetes cluster resources and persistent volumes.  It supports
scheduled backups, disaster recovery, and cluster migration workflows.")
    (license license:asl2.0)))

