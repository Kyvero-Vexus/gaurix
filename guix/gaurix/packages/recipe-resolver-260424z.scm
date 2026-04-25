;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424z
;;; Resolves 100 packages from queue (TODO items 18244-18399).
;;;
;;; New recipes (38):
;;;     1. altus-bin (copy-build-system, v5.7.2, gpl3)
;;;     2. verco-bin (copy-build-system, v6.12.0, gpl3+)
;;;     3. stegano-bin (copy-build-system, v0.6.1, expat)
;;;     4. secho-bin (copy-build-system, v1.2.0, gpl3)
;;;     5. rauthy-bin (copy-build-system, v0.0.11, agpl3+)
;;;     6. circumflex-bin (copy-build-system, v3.9, expat)
;;;     7. betterx-desktop-bin (copy-build-system, v2.1.0, gpl3)
;;;     8. didyoumean-bin (copy-build-system, v1.1.4, gpl3+)
;;;     9. landrun-bin (copy-build-system, v0.1.14, expat)
;;;    10. iv-cli-bin (copy-build-system, v0.11.1, expat)
;;;    11. fum-bin (copy-build-system, v1.3.1, expat)
;;;    12. renode-bin (copy-build-system, v1.16.1, expat)
;;;    13. mailhog-bin (copy-build-system, v1.0.1, expat)
;;;    14. chatterino2-7tv-bin (copy-build-system, v7.5.5, expat)
;;;    15. iwe-bin (copy-build-system, v0.0.55, asl2.0)
;;;    16. minijinja-cli-bin (copy-build-system, v2.19.0, expat)
;;;    17. gephgui-wry-bin (copy-build-system, v5.6.0, mpl2.0)
;;;    18. gourou-appimage (copy-build-system, v0.8.7, lgpl3)
;;;    19. nspire-merge (gnu, v1.0.1, expat)
;;;    20. dwatch (pyproject, v0.4.1, expat)
;;;    21. gradle-bash-completion (copy, v1.4.1, expat)
;;;    22. aria2cd (copy, v2.0.2, wtfpl2)
;;;    23. logalize (go, v0.8.0, expat)
;;;    24. gut (go, v0.3.2, expat)
;;;    25. jpu (go, v0.0.1, bsd-3)
;;;    26. icat (gnu, v0.5, bsd-2)
;;;    27. libcello (gnu, v2.1.0, bsd-2)
;;;    28. verbiste (gnu, v0.1.49, gpl2+)
;;;    29. netkit-bsd-finger (gnu, v0.17, bsd-3)
;;;    30. modest (cmake, v0.0.6, lgpl2.1)
;;;    31. sessiond (gnu, v0.6.1, gpl3+)
;;;    32. primitive (go, v1.0, expat)
;;;    33. colout (pyproject, v1.1, gpl3+)
;;;    34. python-textcase (pyproject, v0.2.1, gpl3+)
;;;    35. python-osc-placement (pyproject, v4.7.0, asl2.0)
;;;    36. walcord (copy, v2.10, expat)
;;;    37. abx (gnu, v0.2, gpl3+)
;;;
;;; BLOCKED (62): see blocked-notes file.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260424z)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            altus-bin
            verco-bin
            stegano-bin
            secho-bin
            rauthy-bin
            circumflex-bin
            betterx-desktop-bin
            didyoumean-bin
            landrun-bin
            iv-cli-bin
            fum-bin
            renode-bin
            mailhog-bin
            chatterino2-7tv-bin
            iwe-bin
            minijinja-cli-bin
            gephgui-wry-bin
            gourou-appimage
            nspire-merge
            dwatch
            gradle-bash-completion
            aria2cd
            logalize
            gut
            jpu
            icat
            libcello
            verbiste
            netkit-bsd-finger
            modest
            sessiond
            primitive
            colout
            python-textcase
            python-osc-placement
            walcord
            abx
            jcal-git
            ))

;;; ===== 1. altus-bin =====

;;; altus-bin — desktop client for WhatsApp Web with themes and multiple account support
(define-public altus-bin
  (package
    (name "altus-bin")
    (version "5.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/amanharwara/altus/releases/download/v5.7.2/Altus-5.7.2.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("Altus-5.7.2.AppImage" "bin/altus")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop client for WhatsApp Web with multiple accounts")
    (description "desktop client for WhatsApp Web with themes and multiple account support.")
    (home-page "https://github.com/amanharwara/altus")
    (license license:gpl3)))

;;; ===== 2. verco-bin =====

;;; verco-bin — a simple Git/Mercurial TUI client based on keyboard shortcuts
(define-public verco-bin
  (package
    (name "verco-bin")
    (version "6.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/vamolessa/verco/releases/download/v6.12.0/verco-linux-x86_64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("verco-linux-x86_64" "bin/verco")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple Git/Mercurial TUI client")
    (description "a simple Git/Mercurial TUI client based on keyboard shortcuts.")
    (home-page "https://github.com/vamolessa/verco")
    (license license:gpl3+)))

;;; ===== 3. stegano-bin =====

;;; stegano-bin — CLI tool for steganography, supports hiding data in PNG and WAV via LSB encoding
(define-public stegano-bin
  (package
    (name "stegano-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/steganogram/stegano-rs/releases/download/v0.6.1/stegano-linux-x86_64-v0.6.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("stegano" "bin/stegano")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for steganography in PNG and WAV files")
    (description "CLI tool for steganography, supports hiding data in PNG and WAV via LSB encoding.")
    (home-page "https://github.com/steganogram/stegano-rs")
    (license license:expat)))

;;; ===== 4. secho-bin =====

;;; secho-bin — a dramatic, colorful replacement for echo
(define-public secho-bin
  (package
    (name "secho-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/CodeFlowShai/secho/releases/download/v1.2.0/secho-linux-x86_64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("secho-linux-x86_64" "bin/secho")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "colorful replacement for echo")
    (description "a dramatic, colorful replacement for echo.")
    (home-page "https://github.com/CodeFlowShai/secho")
    (license license:gpl3)))

;;; ===== 5. rauthy-bin =====

;;; rauthy-bin — an open source TOTP app for managing time-based one-time passwords
(define-public rauthy-bin
  (package
    (name "rauthy-bin")
    (version "0.0.11")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/charlesschaefer/rauthy-totp/releases/download/v0.0.11/rauthy-totp-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("rauthy-totp-linux-x86_64.AppImage" "bin/rauthy-totp")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source TOTP one-time password manager")
    (description "an open source TOTP app for managing time-based one-time passwords.")
    (home-page "https://github.com/charlesschaefer/rauthy-totp")
    (license license:agpl3+)))

;;; ===== 6. circumflex-bin =====

;;; circumflex-bin — a command line tool for browsing Hacker News in the terminal
(define-public circumflex-bin
  (package
    (name "circumflex-bin")
    (version "3.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/bensadeh/circumflex/releases/download/3.9/clx-linux-amd64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("clx-linux-amd64" "bin/clx")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line Hacker News browser for the terminal")
    (description "a command line tool for browsing Hacker News in the terminal.")
    (home-page "https://github.com/bensadeh/circumflex")
    (license license:expat)))

;;; ===== 7. betterx-desktop-bin =====

;;; betterx-desktop-bin — desktop application for BetterX
(define-public betterx-desktop-bin
  (package
    (name "betterx-desktop-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Feur-Inc/BetterX-Desktop/releases/download/v2.1.0/BetterX-Desktop-2.1.0.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("BetterX-Desktop-2.1.0.AppImage" "bin/betterx-desktop")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop application for BetterX experience enhancement")
    (description "desktop application for BetterX.")
    (home-page "https://feur-inc.github.io/BetterX-Website/")
    (license license:gpl3)))

;;; ===== 8. didyoumean-bin =====

;;; didyoumean-bin — a CLI spelling corrector
(define-public didyoumean-bin
  (package
    (name "didyoumean-bin")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hisbaan/didyoumean/releases/download/v1.1.4/didyoumean-linux-amd64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("didyoumean-linux-amd64" "bin/dym")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI spelling corrector")
    (description "a CLI spelling corrector.")
    (home-page "https://github.com/hisbaan/didyoumean")
    (license license:gpl3+)))

;;; ===== 9. landrun-bin =====

;;; landrun-bin — run any Linux process in a secure unprivileged sandbox using Landlock LSM
(define-public landrun-bin
  (package
    (name "landrun-bin")
    (version "0.1.14")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Zouuup/landrun/releases/download/v0.1.14/landrun_linux_amd64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("landrun_linux_amd64" "bin/landrun")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unprivileged sandbox using Landlock LSM")
    (description "run any Linux process in a secure unprivileged sandbox using Landlock LSM.")
    (home-page "https://github.com/Zouuup/landrun")
    (license license:expat)))

;;; ===== 10. iv-cli-bin =====

;;; iv-cli-bin — a command-line image viewer using terminal graphics (Sixel, iTerm, Kitty)
(define-public iv-cli-bin
  (package
    (name "iv-cli-bin")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kenshaw/iv/releases/download/v0.11.1/iv-0.11.1-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("iv" "bin/iv")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line image viewer for terminal graphics protocols")
    (description "a command-line image viewer using terminal graphics (Sixel, iTerm, Kitty).")
    (home-page "https://github.com/kenshaw/iv")
    (license license:expat)))

;;; ===== 11. fum-bin =====

;;; fum-bin — a fully riceable TUI-based MPRIS music client
(define-public fum-bin
  (package
    (name "fum-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/qxb3/fum/releases/download/v1.3.1/fum-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("fum" "bin/fum")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI-based MPRIS music client")
    (description "a fully riceable TUI-based MPRIS music client.")
    (home-page "https://github.com/qxb3/fum")
    (license license:expat)))

;;; ===== 12. renode-bin =====

;;; renode-bin — a virtual development framework for multinode embedded networks
(define-public renode-bin
  (package
    (name "renode-bin")
    (version "1.16.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/renode/renode/releases/download/v1.16.1/renode-1.16.1.linux-portable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("renode" "bin/renode")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtual development framework for embedded networks")
    (description "a virtual development framework for multinode embedded networks.")
    (home-page "https://www.renode.io")
    (license license:expat)))

;;; ===== 13. mailhog-bin =====

;;; mailhog-bin — web and API based SMTP testing tool
(define-public mailhog-bin
  (package
    (name "mailhog-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mailhog/MailHog/releases/download/v1.0.1/MailHog_linux_amd64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("MailHog_linux_amd64" "bin/mailhog")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "web and API based SMTP testing tool")
    (description "web and API based SMTP testing tool.")
    (home-page "https://github.com/mailhog/MailHog")
    (license license:expat)))

;;; ===== 14. chatterino2-7tv-bin =====

;;; chatterino2-7tv-bin — a fork of Chatterino2 with built-in support for 7tv emotes
(define-public chatterino2-7tv-bin
  (package
    (name "chatterino2-7tv-bin")
    (version "7.5.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SevenTV/chatterino7/releases/download/v7.5.5/chatterino-7tv-7.5.5-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("chatterino-7tv-7.5.5-x86_64.AppImage" "bin/chatterino7")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Chatterino2 fork with 7tv emote support")
    (description "a fork of Chatterino2 with built-in support for 7tv emotes.")
    (home-page "https://github.com/SevenTV/chatterino7")
    (license license:expat)))

;;; ===== 15. iwe-bin =====

;;; iwe-bin — text editor extension for markdown note taking
(define-public iwe-bin
  (package
    (name "iwe-bin")
    (version "0.0.55")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iwe-org/iwe/releases/download/v0.0.55/iwe-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("iwe" "bin/iwe")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "text editor extension for markdown note taking")
    (description "text editor extension for markdown note taking.")
    (home-page "https://github.com/iwe-org/iwe")
    (license license:asl2.0)))

;;; ===== 16. minijinja-cli-bin =====

;;; minijinja-cli-bin — command-line utility for the MiniJinja template engine
(define-public minijinja-cli-bin
  (package
    (name "minijinja-cli-bin")
    (version "2.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mitsuhiko/minijinja/releases/download/2.19.0/minijinja-cli-linux-x86_64.tar.xz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("minijinja-cli" "bin/minijinja-cli")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line utility for the MiniJinja template engine")
    (description "command-line utility for the MiniJinja template engine.")
    (home-page "https://github.com/mitsuhiko/minijinja")
    (license license:expat)))

;;; ===== 17. gephgui-wry-bin =====

;;; gephgui-wry-bin — Geph desktop GUI client
(define-public gephgui-wry-bin
  (package
    (name "gephgui-wry-bin")
    (version "5.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/geph-official/gephgui-wry/releases/download/v5.6.0/gephgui-wry-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("gephgui-wry" "bin/gephgui-wry")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Geph VPN desktop GUI client")
    (description "Geph desktop GUI client.")
    (home-page "https://github.com/geph-official/gephgui-wry")
    (license license:mpl2.0)))

;;; ===== 18. gourou-appimage =====

;;; gourou-appimage — download and decrypt Adobe encrypted PDF and EPUB files
(define-public gourou-appimage
  (package
    (name "gourou-appimage")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri "https://forge.soutade.fr/soutade/libgourou/releases/download/v0.8.7/knock-0.8.7-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("knock-0.8.7-x86_64.AppImage" "bin/knock")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "download and decrypt Adobe DRM encrypted ebooks")
    (description "download and decrypt Adobe encrypted PDF and EPUB files.")
    (home-page "https://forge.soutade.fr/soutade/libgourou")
    (license license:lgpl3)))

;;; ===== 19. nspire-merge =====

;;; nspire-merge — merges Lua source files and images for TI-Nspire projects
(define-public nspire-merge
  (package
    (name "nspire-merge")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexcoder04/nspire-merge")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "merge Lua source files and images for TI-Nspire projects")
    (description "merges Lua source files and images for TI-Nspire projects.")
    (home-page "https://github.com/alexcoder04/nspire-merge")
    (license license:expat)))

;;; ===== 20. dwatch =====

;;; dwatch — a tool to watch command output for differences and send notifications
(define-public dwatch
  (package
    (name "dwatch")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/IngoMeyer441/dwatch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "watch command output for differences and send notifications")
    (description "a tool to watch command output for differences and send notifications.")
    (home-page "https://github.com/IngoMeyer441/dwatch")
    (license license:expat)))

;;; ===== 21. gradle-bash-completion =====

;;; gradle-bash-completion — bash completion for Gradle
(define-public gradle-bash-completion
  (package
    (name "gradle-bash-completion")
    (version "1.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gradle/gradle-completion")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("gradle-completion.bash" "share/bash-completion/completions/gradle")))))
    (synopsis "bash completion for Gradle build tool")
    (description "bash completion for Gradle.")
    (home-page "https://github.com/gradle/gradle-completion")
    (license license:expat)))

;;; ===== 22. aria2cd =====

;;; aria2cd — a script and systemd service to start aria2 automatically
(define-public aria2cd
  (package
    (name "aria2cd")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/aria2cd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "script and service to start aria2 automatically")
    (description "a script and systemd service to start aria2 automatically.")
    (home-page "https://aur.archlinux.org/packages/aria2cd")
    (license license:wtfpl2)))

;;; ===== 23. logalize =====

;;; logalize — fast and extensible log colorizer, alternative to ccze
(define-public logalize
  (package
    (name "logalize")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/deponian/logalize")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/deponian/logalize"
           #:tests? #f))
    (synopsis "fast and extensible log colorizer")
    (description "fast and extensible log colorizer, alternative to ccze.")
    (home-page "https://github.com/deponian/logalize")
    (license license:expat)))

;;; ===== 24. gut =====

;;; gut — a beginner-friendly porcelain for git
(define-public gut
  (package
    (name "gut")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/julien040/gut")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/julien040/gut"
           #:tests? #f))
    (synopsis "beginner-friendly porcelain for git")
    (description "a beginner-friendly porcelain for git.")
    (home-page "https://github.com/julien040/gut")
    (license license:expat)))

;;; ===== 25. jpu =====

;;; jpu — JuleProtonUp is a fast and lightweight ProtonUp alternative
(define-public jpu
  (package
    (name "jpu")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adamperkowski/jpu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/adamperkowski/jpu"
           #:tests? #f))
    (synopsis "fast and lightweight ProtonUp alternative")
    (description "JuleProtonUp is a fast and lightweight ProtonUp alternative.")
    (home-page "https://github.com/adamperkowski/jpu")
    (license license:bsd-3)))

;;; ===== 26. icat =====

;;; icat — outputs images in 256-color capable terminals
(define-public icat
  (package
    (name "icat")
    (version "0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/atextor/icat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "display images in 256-color terminals")
    (description "outputs images in 256-color capable terminals.")
    (home-page "https://github.com/atextor/icat")
    (license license:bsd-2)))

;;; ===== 27. libcello =====

;;; libcello — higher level programming library in C
(define-public libcello
  (package
    (name "libcello")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://libcello.org/static/libCello-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "higher level programming library in C")
    (description "higher level programming library in C.")
    (home-page "https://libcello.org")
    (license license:bsd-2)))

;;; ===== 28. verbiste =====

;;; verbiste — French conjugation system
(define-public verbiste
  (package
    (name "verbiste")
    (version "0.1.49")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://perso.b2b2c.ca/~sarrazip/dev/verbiste-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "French conjugation system")
    (description "French conjugation system.")
    (home-page "http://sarrazip.com/dev/verbiste.html")
    (license license:gpl2+)))

;;; ===== 29. netkit-bsd-finger =====

;;; netkit-bsd-finger — BSD-finger ported to Linux
(define-public netkit-bsd-finger
  (package
    (name "netkit-bsd-finger")
    (version "0.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://ftp.linux.org.uk/pub/linux/Networking/netkit/bsd-finger-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "BSD-finger network utility ported to Linux")
    (description "BSD-finger ported to Linux.")
    (home-page "http://ftp.linux.org.uk/pub/linux/Networking/netkit")
    (license license:bsd-3)))

;;; ===== 30. modest =====

;;; modest — fast HTML renderer implemented as a pure C99 library
(define-public modest
  (package
    (name "modest")
    (version "0.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lexborisov/modest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "fast HTML renderer as pure C99 library")
    (description "fast HTML renderer implemented as a pure C99 library.")
    (home-page "https://github.com/lexborisov/modest")
    (license license:lgpl2.1)))

;;; ===== 31. sessiond =====

;;; sessiond — standalone X session manager for systemd-logind
(define-public sessiond
  (package
    (name "sessiond")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jcrd/sessiond/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "standalone X session manager for systemd-logind")
    (description "standalone X session manager for systemd-logind.")
    (home-page "https://sessiond.org/")
    (license license:gpl3+)))

;;; ===== 32. primitive =====

;;; primitive — reproducing images with geometric primitives
(define-public primitive
  (package
    (name "primitive")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bmaltais/primitive")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/bmaltais/primitive"
           #:tests? #f))
    (synopsis "reproduce images with geometric primitives")
    (description "reproducing images with geometric primitives.")
    (home-page "https://github.com/bmaltais/primitive")
    (license license:expat)))

;;; ===== 33. colout =====

;;; colout — reads text on stdin and produces colorized and stylized output
(define-public colout
  (package
    (name "colout")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nojhan/colout")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "colorize text on stdin with patterns and styles")
    (description "reads text on stdin and produces colorized and stylized output.")
    (home-page "https://github.com/nojhan/colout")
    (license license:gpl3+)))

;;; ===== 34. python-textcase =====

;;; python-textcase — feature-rich Python text case conversion library
(define-public python-textcase
  (package
    (name "python-textcase")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zobweyt/textcase")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Python text case conversion library")
    (description "feature-rich Python text case conversion library.")
    (home-page "https://github.com/zobweyt/textcase")
    (license license:gpl3+)))

;;; ===== 35. python-osc-placement =====

;;; python-osc-placement — OpenStackClient plugin for the Placement service
(define-public python-osc-placement
  (package
    (name "python-osc-placement")
    (version "4.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/o/osc-placement/osc_placement-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "OpenStackClient plugin for the Placement service")
    (description "OpenStackClient plugin for the Placement service.")
    (home-page "http://docs.openstack.org/osc-placement")
    (license license:asl2.0)))

;;; ===== 36. walcord =====

;;; walcord — Pywal themes for Vesktop/Vencord/BetterDiscord
(define-public walcord
  (package
    (name "walcord")
    (version "2.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Danrus1100/walcord")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'((("walcord" "bin/walcord")))))
    (synopsis "Pywal themes for Vesktop and Vencord")
    (description "Pywal themes for Vesktop/Vencord/BetterDiscord.")
    (home-page "https://github.com/Danrus1100/walcord")
    (license license:expat)))

;;; ===== 37. abx =====

;;; abx — a simple ABX tester to compare audio files with GUI
(define-public abx
  (package
    (name "abx")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://phintsan.kapsi.fi/abx-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple ABX audio comparison tester with GUI")
    (description "a simple ABX tester to compare audio files with GUI.")
    (home-page "http://phintsan.kapsi.fi/abx.html")
    (license license:gpl3+)))

;;; ===== 38. jcal-git =====

;;; jcal-git — Jalali calendar library and tools
(define-public jcal-git
  (package
    (name "jcal-git")
    (version "0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ashkang/jcal")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Jalali (Persian) calendar library and tools")
    (description "Jalali calendar is a small and portable free software library
to manipulate date and time in Jalali calendar system.")
    (home-page "http://www.nongnu.org/jcal/")
    (license license:gpl3+)))
