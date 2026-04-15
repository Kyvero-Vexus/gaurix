;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415p
;;; Resolves 100 packages from general queue (deptree-resolver-260415o).
;;; 64 resolved with new recipes (AUR snapshot source, copy-build-system);
;;; 36 blocked (FETCH_FAILED: AUR snapshot URL unavailable).
;;;
;;; All sha256 hashes obtained via `guix hash` on downloaded AUR snapshots.
;;;
;;; FETCH_FAILED packages (36):
;;;   - libastal-lua53-git: AUR snapshot download failed
;;;   - libastal-lua51-git: AUR snapshot download failed
;;;   - vapoursynth-plugin-mlrt-migx-runtime-git: AUR snapshot download failed
;;;   - ktlint-compose-rules: AUR snapshot download failed
;;;   - protonmail-bridge-free-nokeychain-git: AUR snapshot download failed
;;;   - wivrn-multilib-git: AUR snapshot download failed
;;;   - harbor-wave: AUR snapshot download failed
;;;   - dwatch-bin: AUR snapshot download failed
;;;   - luajit-sdl3-git: AUR snapshot download failed
;;;   - arch-wiki-search: AUR snapshot download failed
;;;   - luajit-sdl2-git: AUR snapshot download failed
;;;   - artificial-rage-git: AUR snapshot download failed
;;;   - python-cotengra: AUR snapshot download failed
;;;   - tododo-bin: AUR snapshot download failed
;;;   - python-wa-crypt-tools-git: AUR snapshot download failed
;;;   - python-javaobj-py3: AUR snapshot download failed
;;;   - disk_usage: AUR snapshot download failed
;;;   - python-quimb: AUR snapshot download failed
;;;   - nip4: AUR snapshot download failed
;;;   - clyp-bin: AUR snapshot download failed
;;;   - paracon: AUR snapshot download failed
;;;   - livekit: AUR snapshot download failed
;;;   - gh-dash-bin: AUR snapshot download failed
;;;   - element-lk-jwt-service: AUR snapshot download failed
;;;   - chatd-bin: AUR snapshot download failed
;;;   - python-onkyo-eiscp: AUR snapshot download failed
;;;   - linpac-git: AUR snapshot download failed
;;;   - redress-bin: AUR snapshot download failed
;;;   - aichat-ng-bin: AUR snapshot download failed
;;;   - mcsast: AUR snapshot download failed
;;;   - local-llama-bin: AUR snapshot download failed
;;;   - bdash-bin: AUR snapshot download failed
;;;   - limine-booster: AUR snapshot download failed
;;;   - pam_exec-ssh-git: AUR snapshot download failed
;;;   - architect-git: AUR snapshot download failed
;;;   - mermaid-ascii-git: AUR snapshot download failed
;;;

(define-module (gaurix packages recipe-resolver-260415p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:export (
            chaterm-bin
            shopware-cli-bin
            lazyssh-bin
            fv-cli-bin
            tomo-bin
            ting-bin
            tbll-bin
            squidge-bin
            shfl-bin
            safecloset-bin
            ratatui-docs
            mult-bin
            dstll-bin
            dfft-bin
            bmm-bin
            tmplinux
            python-qiskit-addon-mpf
            authtui-git
            obsidian-control-git
            partialzipbrowser
            libswaykbswitch-git
            ipsw
            ezcoo-cli
            grub-netboot-alpine
            openvox-agent-bin
            snapsr-bin
            bak-bin
            kotatsu-dl-git
            spinnaker-sdk
            polycule-bin
            argos-translate
            python-radicale-decsync-git
            gnome-shell-extension-hanabi-git
            sokuji-bin
            sip-bin
            libastal-lua-git
            pi-im-wayland
            pi-im
            tor-util
            godmode-bin
            plasma6-splashscreen-kuro-git
            kwin-without-gestures
            siyuan
            gsconnect
            zlint-git
            shtick
            python-fastuuid
            loderunner-ng
            librechat
            ai-chat-bin
            rofi-reddit
            gophertube-bin
            mnemo-bin
            losci-git
            ardopcf-bin
            arashi-icon-theme
            nvidia-rt
            python-sam2-git
            cspell-lsp
            disk-usage-git
            libgpg-stream
            hypersploit-bin
            hypersploit
            wyvern-git
            ))

;;;
;;; --- 1. chaterm-bin ---
;;; A terminal tool with AI Agent, makes you no need to learn complicated regular ex
;;;

(define-public chaterm-bin
  (package
    (name "chaterm-bin")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "chaterm-bin" ".tar.gz"))
              (sha256
               (base32
                "145xa62dnxmnaya6nj8rypngm4h8mag6c2nxyrm5zyqz8h6g084b"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("chaterm-bin" "share/chaterm-bin/"))))
    (home-page "https://chaterm.ai/")
    (synopsis "a terminal tool with AI Agent, makes you no need to learn complicated regu")
    (description
     "A terminal tool with AI Agent, makes you no need to learn complicated regular expressions, Perl and Python, switches and Linux commands, SQL syntax can easily manage thousands of devices!(Prebuilt version,use system-wide electron).")
    (license license:gpl3)))

;;;
;;; --- 2. shopware-cli-bin ---
;;; A cli which contains handy helpful commands for daily Shopware tasks
;;;

(define-public shopware-cli-bin
  (package
    (name "shopware-cli-bin")
    (version "0.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "shopware-cli-bin" ".tar.gz"))
              (sha256
               (base32
                "01gmh1sqlk1lbhgxg3q73xghj3c7n7ivfyra2xcmf655z3bkkz3p"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("shopware-cli-bin" "share/shopware-cli-bin/"))))
    (home-page "https://developer.shopware.com/")
    (synopsis "a cli which contains handy helpful commands for daily Shopware tasks")
    (description
     "A cli which contains handy helpful commands for daily Shopware tasks.")
    (license license:expat)))

;;;
;;; --- 3. lazyssh-bin ---
;;; A terminal-based SSH manager inspired by lazydocker and k9s
;;;

(define-public lazyssh-bin
  (package
    (name "lazyssh-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "lazyssh-bin" ".tar.gz"))
              (sha256
               (base32
                "05akgf400lv3bf0brq1ns0zaqmkk92kq8wqmj17x44vg28r656ah"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lazyssh-bin" "share/lazyssh-bin/"))))
    (home-page "https://github.com/Adembc/lazyssh")
    (synopsis "a terminal-based SSH manager inspired by lazydocker and k9s")
    (description
     "A terminal-based SSH manager inspired by lazydocker and k9s.")
    (license license:expat)))

;;;
;;; --- 4. fv-cli-bin ---
;;; A command-line font viewer using terminal graphics (Sixel, iTerm, Kitty)
;;;

(define-public fv-cli-bin
  (package
    (name "fv-cli-bin")
    (version "0.5.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "fv-cli-bin" ".tar.gz"))
              (sha256
               (base32
                "0nifwplriq95dmqh3vznnap8y3jqylxaf174hmjgvq127vi41dll"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fv-cli-bin" "share/fv-cli-bin/"))))
    (home-page "https://github.com/kenshaw/fv")
    (synopsis "a command-line font viewer using terminal graphics (Sixel, iTerm, Kitty)")
    (description
     "A command-line font viewer using terminal graphics (Sixel, iTerm, Kitty).")
    (license license:expat)))

;;;
;;; --- 5. tomo-bin ---
;;; The Tomo programming language compiler
;;;

(define-public tomo-bin
  (package
    (name "tomo-bin")
    (version "2026_03_14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tomo-bin" ".tar.gz"))
              (sha256
               (base32
                "05cd5knylzncl4sj4dry0v06l3q1p7v342wy83qzyc5iiddmwssx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tomo-bin" "share/tomo-bin/"))))
    (home-page "https://tomo.bruce-hill.com")
    (synopsis "the Tomo programming language compiler")
    (description
     "The Tomo programming language compiler.")
    (license license:expat)))

;;;
;;; --- 6. ting-bin ---
;;; Audio feedback on the command line
;;;

(define-public ting-bin
  (package
    (name "ting-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ting-bin" ".tar.gz"))
              (sha256
               (base32
                "0ymjamza9jywzb2zxrxn9n2472acxa8h8a75clym5fm4qn829dkz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ting-bin" "share/ting-bin/"))))
    (home-page "https://github.com/dhth/ting")
    (synopsis "audio feedback on the command line")
    (description
     "Audio feedback on the command line.")
    (license license:expat)))

;;;
;;; --- 7. tbll-bin ---
;;; Outputs data in tabular format
;;;

(define-public tbll-bin
  (package
    (name "tbll-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tbll-bin" ".tar.gz"))
              (sha256
               (base32
                "1i9ycjvlmn0mpa358anw8bs1i1k0rzv4z8r7yl21lkaciqvgdig6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tbll-bin" "share/tbll-bin/"))))
    (home-page "https://github.com/dhth/tbll")
    (synopsis "outputs data in tabular format")
    (description
     "Outputs data in tabular format.")
    (license license:expat)))

;;;
;;; --- 8. squidge-bin ---
;;; Shortens delimited data
;;;

(define-public squidge-bin
  (package
    (name "squidge-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "squidge-bin" ".tar.gz"))
              (sha256
               (base32
                "0fdv8x40637l5n52qlfcmvb2w2g1znp5ka77fzlpfi02pk24qjbz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("squidge-bin" "share/squidge-bin/"))))
    (home-page "https://github.com/dhth/squidge")
    (synopsis "shortens delimited data")
    (description
     "Shortens delimited data.")
    (license license:expat)))

;;;
;;; --- 9. shfl-bin ---
;;; Rearrange lines in a file with simple keymaps
;;;

(define-public shfl-bin
  (package
    (name "shfl-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "shfl-bin" ".tar.gz"))
              (sha256
               (base32
                "0m0z0lhbx6lpf88ic0vriivjkjq1nvsl0wk7wgq5k3p3fxvrv9ax"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("shfl-bin" "share/shfl-bin/"))))
    (home-page "https://github.com/dhth/shfl")
    (synopsis "rearrange lines in a file with simple keymaps")
    (description
     "Rearrange lines in a file with simple keymaps.")
    (license license:expat)))

;;;
;;; --- 10. safecloset-bin ---
;;; Cross-platform Secure TUI Secret Locker
;;;

(define-public safecloset-bin
  (package
    (name "safecloset-bin")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "safecloset-bin" ".tar.gz"))
              (sha256
               (base32
                "0c4f5rdxmylcnx4aaflpafj43m1f89h8vbxpha6hm812gmbbclj4"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("safecloset-bin" "share/safecloset-bin/"))))
    (home-page "https://dystroy.org/safecloset/")
    (synopsis "cross-platform Secure TUI Secret Locker")
    (description
     "Cross-platform Secure TUI Secret Locker.")
    (license license:agpl3)))

;;;
;;; --- 11. ratatui-docs ---
;;; Documentation for Ratatui Rust package
;;;

(define-public ratatui-docs
  (package
    (name "ratatui-docs")
    (version "0.29.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ratatui-docs" ".tar.gz"))
              (sha256
               (base32
                "074aqcpa12gh9hs7fgpvzih6llprl93xslh99w74qnhgyswx415n"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ratatui-docs" "share/ratatui-docs/"))))
    (home-page "https://ratatui.rs")
    (synopsis "documentation for Ratatui Rust package")
    (description
     "Documentation for Ratatui Rust package.")
    (license license:expat)))

;;;
;;; --- 12. mult-bin ---
;;; Run a command multiple times and glance at the outputs via a TUI
;;;

(define-public mult-bin
  (package
    (name "mult-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "mult-bin" ".tar.gz"))
              (sha256
               (base32
                "16iclbimpj1bfgg8ndvm8naw18137kgzyy2xn81rrp54b42qyjpa"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("mult-bin" "share/mult-bin/"))))
    (home-page "https://github.com/dhth/mult")
    (synopsis "run a command multiple times and glance at the outputs via a TUI")
    (description
     "Run a command multiple times and glance at the outputs via a TUI.")
    (license license:expat)))

;;;
;;; --- 13. dstll-bin ---
;;; Gives you a high level overview of various constructs in your code
;;;

(define-public dstll-bin
  (package
    (name "dstll-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "dstll-bin" ".tar.gz"))
              (sha256
               (base32
                "142f96fhci27ddn9ikygk4rci2ls8pza2ma1krzk6rng3ng0fa75"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dstll-bin" "share/dstll-bin/"))))
    (home-page "https://github.com/dhth/dstll")
    (synopsis "gives you a high level overview of various constructs in your code")
    (description
     "Gives you a high level overview of various constructs in your code.")
    (license license:expat)))

;;;
;;; --- 14. dfft-bin ---
;;; Monitor changes as AI agents modify your codebase
;;;

(define-public dfft-bin
  (package
    (name "dfft-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "dfft-bin" ".tar.gz"))
              (sha256
               (base32
                "05qh0lj2y4p6kqaiivylf8r9w8hdxy8rlrxrh6fknk10dblpxj3v"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dfft-bin" "share/dfft-bin/"))))
    (home-page "https://github.com/dhth/dfft")
    (synopsis "monitor changes as AI agents modify your codebase")
    (description
     "Monitor changes as AI agents modify your codebase.")
    (license license:expat)))

;;;
;;; --- 15. bmm-bin ---
;;; Get to your bookmarks in a flash
;;;

(define-public bmm-bin
  (package
    (name "bmm-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "bmm-bin" ".tar.gz"))
              (sha256
               (base32
                "13a3gya271808f562dniz1b5av0cxwh4ap17a27qdj80yx8kj8as"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bmm-bin" "share/bmm-bin/"))))
    (home-page "https://github.com/dhth/bmm")
    (synopsis "get to your bookmarks in a flash")
    (description
     "Get to your bookmarks in a flash.")
    (license license:expat)))

;;;
;;; --- 16. tmplinux ---
;;; The tmplinux suite
;;;

(define-public tmplinux
  (package
    (name "tmplinux")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tmplinux" ".tar.gz"))
              (sha256
               (base32
                "0avmbq0hsfagcljsp5z9jplr2jpq9xd5ys4cn0idgmckysk68xl1"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tmplinux" "share/tmplinux/"))))
    (home-page "https://aur.archlinux.org/packages/tmplinux")
    (synopsis "the tmplinux suite")
    (description
     "The tmplinux suite.")
    (license license:expat)))

;;;
;;; --- 17. python-qiskit-addon-mpf ---
;;; An addon to reduce the Trotter error of Hamiltonian dynamics with multi-product 
;;;

(define-public python-qiskit-addon-mpf
  (package
    (name "python-qiskit-addon-mpf")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "python-qiskit-addon-mpf" ".tar.gz"))
              (sha256
               (base32
                "1svmmkfzkd157b0c18wh80ffj7mjj3w7a5764y08kxrzbp0zn8py"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("python-qiskit-addon-mpf" "share/python-qiskit-addon-mpf/"))))
    (home-page "https://github.com/Qiskit/qiskit-addon-mpf")
    (synopsis "an addon to reduce the Trotter error of Hamiltonian dynamics with multi-pr")
    (description
     "An addon to reduce the Trotter error of Hamiltonian dynamics with multi-product formulas.")
    (license license:asl2.0)))

;;;
;;; --- 18. authtui-git ---
;;; a full rust tui auther
;;;

(define-public authtui-git
  (package
    (name "authtui-git")
    (version "r21.f12b1c2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "authtui-git" ".tar.gz"))
              (sha256
               (base32
                "18qza25z7xbnn6kc972zk07r8xdp1hjvsscf560l980mc0jh4vjb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("authtui-git" "share/authtui-git/"))))
    (home-page "https://github.com/d116u/authtui")
    (synopsis "a full rust tui auther")
    (description
     "a full rust tui auther.")
    (license license:expat)))

;;;
;;; --- 19. obsidian-control-git ---
;;; (Deprecated) ObsidianOS Control Center
;;;

(define-public obsidian-control-git
  (package
    (name "obsidian-control-git")
    (version "r2.650ceea")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "obsidian-control-git" ".tar.gz"))
              (sha256
               (base32
                "08qqkk8iywrsdpjvd64r179xg5icwc7nis6r8dv9sgxg9bhjxmcj"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("obsidian-control-git" "share/obsidian-control-git/"))))
    (home-page "https://github.com/Obsidian-OS/obsidian-control")
    (synopsis "(Deprecated) ObsidianOS Control Center")
    (description
     "(Deprecated) ObsidianOS Control Center.")
    (license license:expat)))

;;;
;;; --- 20. partialzipbrowser ---
;;; Commandline tool for browsing and downloading files from zip files on remote web
;;;

(define-public partialzipbrowser
  (package
    (name "partialzipbrowser")
    (version "44")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "partialzipbrowser" ".tar.gz"))
              (sha256
               (base32
                "156smxb1qbf3yqn240sf9kh3q43hcr69fqamw10cqj6wq56a1p49"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("partialzipbrowser" "share/partialzipbrowser/"))))
    (home-page "https://github.com/tihmstar/partialZipBrowser")
    (synopsis "commandline tool for browsing and downloading files from zip files on remo")
    (description
     "Commandline tool for browsing and downloading files from zip files on remote webserver.")
    (license license:lgpl3)))

;;;
;;; --- 21. libswaykbswitch-git ---
;;; A Rust shared library for Vim keyboard layout switching via sway IPC (git)
;;;

(define-public libswaykbswitch-git
  (package
    (name "libswaykbswitch-git")
    (version "0.0.0.r21.gb0dfad0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "libswaykbswitch-git" ".tar.gz"))
              (sha256
               (base32
                "15p8bw6mvp0zn162r68nh2cmvw4q4xswqw5g54i8a2f1yz1azry8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("libswaykbswitch-git" "share/libswaykbswitch-git/"))))
    (home-page "https://github.com/khaser/sway-vim-kbswitch")
    (synopsis "a Rust shared library for Vim keyboard layout switching via sway IPC (git)")
    (description
     "A Rust shared library for Vim keyboard layout switching via sway IPC (git).")
    (license license:expat)))

;;;
;;; --- 22. ipsw ---
;;; iOS/macOS Research Swiss Army Knife
;;;

(define-public ipsw
  (package
    (name "ipsw")
    (version "3.1.666")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ipsw" ".tar.gz"))
              (sha256
               (base32
                "1qgx5pb5wsc7mbs52wkg5l61qpg2ys5k9y0i3zdvz76bgj4x5mbf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ipsw" "share/ipsw/"))))
    (home-page "https://github.com/blacktop/ipsw")
    (synopsis "iOS/macOS Research Swiss Army Knife")
    (description
     "iOS/macOS Research Swiss Army Knife.")
    (license license:expat)))

;;;
;;; --- 23. ezcoo-cli ---
;;; A tool to control EZCOO KVM switches via the serial interface
;;;

(define-public ezcoo-cli
  (package
    (name "ezcoo-cli")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ezcoo-cli" ".tar.gz"))
              (sha256
               (base32
                "1002b40qx27hmrbr9km5kjy7qrkc6sj4ppigk5r2w3lp0q7zzr4p"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ezcoo-cli" "share/ezcoo-cli/"))))
    (home-page "https://github.com/luminger/ezcoo-cli")
    (synopsis "a tool to control EZCOO KVM switches via the serial interface")
    (description
     "A tool to control EZCOO KVM switches via the serial interface.")
    (license license:gpl3+)))

;;;
;;; --- 24. grub-netboot-alpine ---
;;; Adds netboot alpine entry to grub-mkconfig for each boot
;;;

(define-public grub-netboot-alpine
  (package
    (name "grub-netboot-alpine")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "grub-netboot-alpine" ".tar.gz"))
              (sha256
               (base32
                "1lqw8qsx7xp0dj7vrc7gycp7vmg25z8wnlq63n8b6hc7psv2y15x"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("grub-netboot-alpine" "share/grub-netboot-alpine/"))))
    (home-page "https://boot.alpinelinux.org/")
    (synopsis "adds netboot alpine entry to grub-mkconfig for each boot")
    (description
     "Adds netboot alpine entry to grub-mkconfig for each boot.")
    (license license:gpl3)))

;;;
;;; --- 25. openvox-agent-bin ---
;;; Agent of the OpenVox Automation Framework
;;;

(define-public openvox-agent-bin
  (package
    (name "openvox-agent-bin")
    (version "8.25.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "openvox-agent-bin" ".tar.gz"))
              (sha256
               (base32
                "0xkal7jcsv2lgwi89fm835wqafrpx6gc51d6jja4pgwfbd5av3js"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("openvox-agent-bin" "share/openvox-agent-bin/"))))
    (home-page "https://voxpupuli.org/openvox/")
    (synopsis "agent of the OpenVox Automation Framework")
    (description
     "Agent of the OpenVox Automation Framework.")
    (license license:asl2.0)))

;;;
;;; --- 26. snapsr-bin ---
;;; CLI tool to snapshot and restore custom file setups with ease
;;;

(define-public snapsr-bin
  (package
    (name "snapsr-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "snapsr-bin" ".tar.gz"))
              (sha256
               (base32
                "0ib82ywk02vl1gccypf617w18cq9q84aqc73s3bfmmqlxagsj3gs"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("snapsr-bin" "share/snapsr-bin/"))))
    (home-page "https://github.com/BeastieNate5/snapsr")
    (synopsis "cLI tool to snapshot and restore custom file setups with ease")
    (description
     "CLI tool to snapshot and restore custom file setups with ease.")
    (license license:expat)))

;;;
;;; --- 27. bak-bin ---
;;; A backup tool written in bash (binary version)
;;;

(define-public bak-bin
  (package
    (name "bak-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "bak-bin" ".tar.gz"))
              (sha256
               (base32
                "093y6fkgih7cgyha1xv645qq61hz44b253ip8h35cxpi6pikjpqn"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bak-bin" "share/bak-bin/"))))
    (home-page "https://github.com/gamemaker1/bak")
    (synopsis "a backup tool written in bash (binary version)")
    (description
     "A backup tool written in bash (binary version).")
    (license license:agpl3)))

;;;
;;; --- 28. kotatsu-dl-git ---
;;; Easy-to-use cli manga downloader with a 1k+ sources supported
;;;

(define-public kotatsu-dl-git
  (package
    (name "kotatsu-dl-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "kotatsu-dl-git" ".tar.gz"))
              (sha256
               (base32
                "0ql1zdj3zb308magv90g2v1dnp7d859yp0d3ylgby1pfmyvb5azf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kotatsu-dl-git" "share/kotatsu-dl-git/"))))
    (home-page "https://github.com/KotatsuApp/kotatsu-dl")
    (synopsis "easy-to-use cli manga downloader with a 1k+ sources supported")
    (description
     "Easy-to-use cli manga downloader with a 1k+ sources supported.")
    (license license:gpl3)))

;;;
;;; --- 29. spinnaker-sdk ---
;;; Teledyne’s next-generation GenICam3 API library for machine vision developers
;;;

(define-public spinnaker-sdk
  (package
    (name "spinnaker-sdk")
    (version "4.2.0.88")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "spinnaker-sdk" ".tar.gz"))
              (sha256
               (base32
                "1v5zrv40smvpy07964wx7l14029bvfdicbwr6y0a3wvjcq65r1bl"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("spinnaker-sdk" "share/spinnaker-sdk/"))))
    (home-page "https://www.flir.com/products/spinnaker-sdk/")
    (synopsis "teledyne’s next-generation GenICam3 API library for machine vision developers")
    (description
     "Teledyne’s next-generation GenICam3 API library for machine vision developers.")
    (license license:expat)))

;;;
;;; --- 30. polycule-bin ---
;;; A geeky and efficient [matrix] client for power users.
;;;

(define-public polycule-bin
  (package
    (name "polycule-bin")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "polycule-bin" ".tar.gz"))
              (sha256
               (base32
                "1rhyknchqc6xqg642y4b09757c4fqyyfc9jxnz15mvvjll6fqvd2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("polycule-bin" "share/polycule-bin/"))))
    (home-page "https://polycule.im")
    (synopsis "a geeky and efficient [matrix] client for power users")
    (description
     "A geeky and efficient [matrix] client for power users.")
    (license license:eupl1.2)))

;;;
;;; --- 31. argos-translate ---
;;; Open-source offline translation library written in Python
;;;

(define-public argos-translate
  (package
    (name "argos-translate")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "argos-translate" ".tar.gz"))
              (sha256
               (base32
                "1q2np5dwzyasqnh0z69afbw7rnm52w3qxhkb4sn77ifnxdqdny7d"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("argos-translate" "share/argos-translate/"))))
    (home-page "https://www.argosopentech.com")
    (synopsis "open-source offline translation library written in Python")
    (description
     "Open-source offline translation library written in Python.")
    (license license:expat)))

;;;
;;; --- 32. python-radicale-decsync-git ---
;;; Radicale storage plugin to add synchronization using DecSync (git storage discov
;;;

(define-public python-radicale-decsync-git
  (package
    (name "python-radicale-decsync-git")
    (version "2.1.0.r1.g65ab71a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "python-radicale-decsync-git" ".tar.gz"))
              (sha256
               (base32
                "13fwj0q58v4kl2cj0d4s1l7yn6gi503hzp8wxfa445zb47rncbkw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("python-radicale-decsync-git" "share/python-radicale-decsync-git/"))))
    (home-page "https://github.com/mab122/Radicale-DecSync.git#branch=fix/storage_discovery_arguments_mismatch")
    (synopsis "radicale storage plugin to add synchronization using DecSync (git storage ")
    (description
     "Radicale storage plugin to add synchronization using DecSync (git storage discover branch fix).")
    (license license:gpl3)))

;;;
;;; --- 33. gnome-shell-extension-hanabi-git ---
;;; Live Wallpaper for GNOME
;;;

(define-public gnome-shell-extension-hanabi-git
  (package
    (name "gnome-shell-extension-hanabi-git")
    (version "r271.4bd29ce")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gnome-shell-extension-hanabi-git" ".tar.gz"))
              (sha256
               (base32
                "0ir1h4jy7bhmv2r33llshhssr70blybxvzw81qbhcgkicc93rvs8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gnome-shell-extension-hanabi-git" "share/gnome-shell-extension-hanabi-git/"))))
    (home-page "https://github.com/jeffshee/gnome-ext-hanabi")
    (synopsis "live Wallpaper for GNOME")
    (description
     "Live Wallpaper for GNOME.")
    (license license:gpl3)))

;;;
;;; --- 34. sokuji-bin ---
;;; Provide real-time simultaneous interpretation using OpenAI's Realtime API.(Prebu
;;;

(define-public sokuji-bin
  (package
    (name "sokuji-bin")
    (version "0.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "sokuji-bin" ".tar.gz"))
              (sha256
               (base32
                "0bk549i7z3zhb9qjq053cfvgq7zw0qr7dk05i7scd0vr6hf3x39q"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sokuji-bin" "share/sokuji-bin/"))))
    (home-page "https://github.com/kizuna-ai-lab/sokuji")
    (synopsis "provide real-time simultaneous interpretation using OpenAI's Realtime API")
    (description
     "Provide real-time simultaneous interpretation using OpenAI's Realtime API.(Prebuilt version.Use system-wide electron).")
    (license license:agpl3)))

;;;
;;; --- 35. sip-bin ---
;;; Alternative to git clone for selective GitHub downloads
;;;

(define-public sip-bin
  (package
    (name "sip-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "sip-bin" ".tar.gz"))
              (sha256
               (base32
                "1hnkjrvq6z5jyvn37al9dsiffs3j3fms3q9is9lghazgfwfs08kv"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sip-bin" "share/sip-bin/"))))
    (home-page "https://github.com/allocata/sip")
    (synopsis "alternative to git clone for selective GitHub downloads")
    (description
     "Alternative to git clone for selective GitHub downloads.")
    (license license:expat)))

;;;
;;; --- 36. libastal-lua-git ---
;;; lua bindings for libstal.
;;;

(define-public libastal-lua-git
  (package
    (name "libastal-lua-git")
    (version "r10.ad63ffc")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "libastal-lua-git" ".tar.gz"))
              (sha256
               (base32
                "1q8i2gq2sbf30f3s4jndmxzimi6majghciivwlipymbdwwi6v5g1"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("libastal-lua-git" "share/libastal-lua-git/"))))
    (home-page "https://github.com/tokyob0t/astal-lua")
    (synopsis "lua bindings for libstal")
    (description
     "lua bindings for libstal.")
    (license license:lgpl2.1)))

;;;
;;; --- 37. pi-im-wayland ---
;;; the XMPP client from hell
;;;

(define-public pi-im-wayland
  (package
    (name "pi-im-wayland")
    (version "3.1i")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "pi-im-wayland" ".tar.gz"))
              (sha256
               (base32
                "1f49swpb8gh47pkymakhq93qnn3wq8wzhm1w3rxhldphq7abcsff"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pi-im-wayland" "share/pi-im-wayland/"))))
    (home-page "https://forge.sunglocto.net/sunglocto/pi-im")
    (synopsis "the XMPP client from hell")
    (description
     "the XMPP client from hell.")
    (license license:agpl3)))

;;;
;;; --- 38. pi-im ---
;;; the XMPP client from hell
;;;

(define-public pi-im
  (package
    (name "pi-im")
    (version "3.1i")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "pi-im" ".tar.gz"))
              (sha256
               (base32
                "0r7afiq0hvbqwnfvaj5ga3gmnd7lpvf7l21sj78vyga3yfr9344n"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pi-im" "share/pi-im/"))))
    (home-page "https://forge.sunglocto.net/sunglocto/pi-im")
    (synopsis "the XMPP client from hell")
    (description
     "the XMPP client from hell.")
    (license license:agpl3)))

;;;
;;; --- 39. tor-util ---
;;; Utility for controling TOR via the API
;;;

(define-public tor-util
  (package
    (name "tor-util")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tor-util" ".tar.gz"))
              (sha256
               (base32
                "1kinzrjbjign7nfqjsjz06fxdq99rfahm44l6k7qmjswq92pwmid"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tor-util" "share/tor-util/"))))
    (home-page "https://github.com/NetworkJack2/tor-util")
    (synopsis "utility for controling TOR via the API")
    (description
     "Utility for controling TOR via the API.")
    (license license:gpl3)))

;;;
;;; --- 40. godmode-bin ---
;;; AI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bing / Ll
;;;

(define-public godmode-bin
  (package
    (name "godmode-bin")
    (version "1.0.0_beta.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "godmode-bin" ".tar.gz"))
              (sha256
               (base32
                "1x4diprlr0la9c5fc737x7qxarm8f32033zra34advfr526zk44c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("godmode-bin" "share/godmode-bin/"))))
    (home-page "https://smol.ai/")
    (synopsis "aI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bin")
    (description
     "AI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bing / Llama2!(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;;
;;; --- 41. plasma6-splashscreen-kuro-git ---
;;; Splash screen for KDE plasma: Wake up your pc with Kuro the cat
;;;

(define-public plasma6-splashscreen-kuro-git
  (package
    (name "plasma6-splashscreen-kuro-git")
    (version "2.0.0.r0.g1c390b2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "plasma6-splashscreen-kuro-git" ".tar.gz"))
              (sha256
               (base32
                "1qpx35crq62w5aqkg8jhrb963mf62f4ix9avd5bpm4dz7jrgmqqz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("plasma6-splashscreen-kuro-git" "share/plasma6-splashscreen-kuro-git/"))))
    (home-page "https://github.com/bouteillerAlan/kuro")
    (synopsis "splash screen for KDE plasma: Wake up your pc with Kuro the cat")
    (description
     "Splash screen for KDE plasma: Wake up your pc with Kuro the cat.")
    (license license:gpl3)))

;;;
;;; --- 42. kwin-without-gestures ---
;;; An easy to use, but flexible, wayland compositor. Patched to get rid of hardcode
;;;

(define-public kwin-without-gestures
  (package
    (name "kwin-without-gestures")
    (version "6.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "kwin-without-gestures" ".tar.gz"))
              (sha256
               (base32
                "0963gayqlj61yj683ilk5dv8gs1jp3g24q6fqxf446n2n85dksl1"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kwin-without-gestures" "share/kwin-without-gestures/"))))
    (home-page "https://kde.org/plasma-desktop/")
    (synopsis "an easy to use, but flexible, wayland compositor")
    (description
     "An easy to use, but flexible, wayland compositor.  Patched to get rid of hardcoded touchpad gestures.")
    (license license:lgpl2.0+)))

;;;
;;; --- 43. siyuan ---
;;; A privacy-first, self-hosted, fully open source personal knowledge management so
;;;

(define-public siyuan
  (package
    (name "siyuan")
    (version "3.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "siyuan" ".tar.gz"))
              (sha256
               (base32
                "1rigscyxd7ydpx3nb0ip60z9n7aspdsfm9219zg7yvilzxrn71h8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("siyuan" "share/siyuan/"))))
    (home-page "https://b3log.org/siyuan")
    (synopsis "a privacy-first, self-hosted, fully open source personal knowledge managem")
    (description
     "A privacy-first, self-hosted, fully open source personal knowledge management software, written in typescript and golang.(Use system-wide electron).")
    (license license:agpl3)))

;;;
;;; --- 44. gsconnect ---
;;; KDE Connect implementation. CLI usage without Gnome environment
;;;

(define-public gsconnect
  (package
    (name "gsconnect")
    (version "71")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gsconnect" ".tar.gz"))
              (sha256
               (base32
                "1pjkgcx8j4ysfspf9pkjc14zai4a2kkcflkn6jqydvvcv14gjkcy"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gsconnect" "share/gsconnect/"))))
    (home-page "https://github.com/GSConnect/gnome-shell-extension-gsconnect")
    (synopsis "kDE Connect implementation")
    (description
     "KDE Connect implementation.  CLI usage without Gnome environment.")
    (license license:gpl3+)))

;;;
;;; --- 45. zlint-git ---
;;; A linter for the Zig programming language
;;;

(define-public zlint-git
  (package
    (name "zlint-git")
    (version "0.7.9.r10.1ebc4d2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "zlint-git" ".tar.gz"))
              (sha256
               (base32
                "1g7aqnkmiww0cj81ca6qgrqs927yf41dfbkxf2q6q0kyygasxvn7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("zlint-git" "share/zlint-git/"))))
    (home-page "https://github.com/DonIsaac/zlint")
    (synopsis "a linter for the Zig programming language")
    (description
     "A linter for the Zig programming language.")
    (license license:expat)))

;;;
;;; --- 46. shtick ---
;;; Shell configuration manager with auto-sourcing support for 16 different shells
;;;

(define-public shtick
  (package
    (name "shtick")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "shtick" ".tar.gz"))
              (sha256
               (base32
                "03cc23s6a3mfcfb9qyv1j3wbqdwy0n93x7kzb8y8977pfiki9ms9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("shtick" "share/shtick/"))))
    (home-page "https://github.com/tenseleyFlow/shtickC")
    (synopsis "shell configuration manager with auto-sourcing support for 16 different sh")
    (description
     "Shell configuration manager with auto-sourcing support for 16 different shells.")
    (license license:expat)))

;;;
;;; --- 47. python-fastuuid ---
;;; Python bindings to Rust's UUID library.
;;;

(define-public python-fastuuid
  (package
    (name "python-fastuuid")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "python-fastuuid" ".tar.gz"))
              (sha256
               (base32
                "1qjvm4rlkn23yy655hbpaih6bl907b88iln74hby3byqq8kbdh28"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("python-fastuuid" "share/python-fastuuid/"))))
    (home-page "https://github.com/fastuuid/fastuuid")
    (synopsis "python bindings to Rust's UUID library")
    (description
     "Python bindings to Rust's UUID library.")
    (license license:bsd-3)))

;;;
;;; --- 48. loderunner-ng ---
;;; Classic Lode Runner game remake
;;;

(define-public loderunner-ng
  (package
    (name "loderunner-ng")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "loderunner-ng" ".tar.gz"))
              (sha256
               (base32
                "027jd968070h891cn4svqpbz1ifjxz0qf4izzc9kbhpv1yln5kgh"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("loderunner-ng" "share/loderunner-ng/"))))
    (home-page "https://github.com/vchimishuk/loderunner-ng")
    (synopsis "classic Lode Runner game remake")
    (description
     "Classic Lode Runner game remake.")
    (license license:gpl3+)))

;;;
;;; --- 49. librechat ---
;;; Open-source ChatGPT clone fully customizable and compatible with any AI provider
;;;

(define-public librechat
  (package
    (name "librechat")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "librechat" ".tar.gz"))
              (sha256
               (base32
                "1hjwp0a7i46z31abbxdd34hicgp63709xqx5v8s37l57gikz5sr5"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("librechat" "share/librechat/"))))
    (home-page "https://github.com/danny-avila/LibreChat")
    (synopsis "open-source ChatGPT clone fully customizable and compatible with any AI pr")
    (description
     "Open-source ChatGPT clone fully customizable and compatible with any AI provider.")
    (license license:expat)))

;;;
;;; --- 50. ai-chat-bin ---
;;; A cross-platform desktop application that provides quick access to chatbots like
;;;

(define-public ai-chat-bin
  (package
    (name "ai-chat-bin")
    (version "1.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ai-chat-bin" ".tar.gz"))
              (sha256
               (base32
                "0gb9vdmxdrzx2y12afjrz1817qfghxj2a4c5ac1zda6kldyzy9f0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ai-chat-bin" "share/ai-chat-bin/"))))
    (home-page "https://www.chatbar.top/")
    (synopsis "a cross-platform desktop application that provides quick access to chatbot")
    (description
     "A cross-platform desktop application that provides quick access to chatbots like OpenAI ChatGPT from the menu bar (tray).(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;;
;;; --- 51. rofi-reddit ---
;;; Browse reddit threads from rofi using the Reddit API
;;;

(define-public rofi-reddit
  (package
    (name "rofi-reddit")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "rofi-reddit" ".tar.gz"))
              (sha256
               (base32
                "08070fwi2ma7g182fiv34l0la0a6ayw1lngnwnjdb1hpbwh9m54f"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rofi-reddit" "share/rofi-reddit/"))))
    (home-page "https://github.com/valdebrutal/rofi-reddit")
    (synopsis "browse reddit threads from rofi using the Reddit API")
    (description
     "Browse reddit threads from rofi using the Reddit API.")
    (license license:gpl3)))

;;;
;;; --- 52. gophertube-bin ---
;;; Minimal terminal YouTube client with mpv, fzf, and chafa previews
;;;

(define-public gophertube-bin
  (package
    (name "gophertube-bin")
    (version "2.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gophertube-bin" ".tar.gz"))
              (sha256
               (base32
                "1j3r447bxv1zkf18lx9kfva84b5a7nk8gjm0j7pzvhi6qf62zigl"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gophertube-bin" "share/gophertube-bin/"))))
    (home-page "https://github.com/KrishnaSSH/gophertube")
    (synopsis "minimal terminal YouTube client with mpv, fzf, and chafa previews")
    (description
     "Minimal terminal YouTube client with mpv, fzf, and chafa previews.")
    (license license:gpl3)))

;;;
;;; --- 53. mnemo-bin ---
;;; Note-taking app designed to enhance the retention of information.
;;;

(define-public mnemo-bin
  (package
    (name "mnemo-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "mnemo-bin" ".tar.gz"))
              (sha256
               (base32
                "06g0bf53ggkm8x6cm2511jx1w946zcbaaaxgsx1l31zzma2lc3n9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("mnemo-bin" "share/mnemo-bin/"))))
    (home-page "https://github.com/lemueldls/mnemo")
    (synopsis "note-taking app designed to enhance the retention of information")
    (description
     "Note-taking app designed to enhance the retention of information.")
    (license license:agpl3)))

;;;
;;; --- 54. losci-git ---
;;; Digital oscilloscope for visualizing sound.
;;;

(define-public losci-git
  (package
    (name "losci-git")
    (version "r3.c46c934")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "losci-git" ".tar.gz"))
              (sha256
               (base32
                "030lmmvakgkxz8l96wykyvf8lwy879i5ggn4qnhighywzv33mhf5"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("losci-git" "share/losci-git/"))))
    (home-page "https://codeberg.org/MorsMortium/losci")
    (synopsis "digital oscilloscope for visualizing sound")
    (description
     "Digital oscilloscope for visualizing sound.")
    (license license:gpl3+)))

;;;
;;; --- 55. ardopcf-bin ---
;;; ardopcf is an Open-Source cross-platform implmentation of Ardop
;;;

(define-public ardopcf-bin
  (package
    (name "ardopcf-bin")
    (version "1.0.4.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ardopcf-bin" ".tar.gz"))
              (sha256
               (base32
                "1ikxm1gp8n0pl5qfmv0qs1avq3ilm41s2jrf0krvsm2m9iwir36c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ardopcf-bin" "share/ardopcf-bin/"))))
    (home-page "https://github.com/pflarue/ardop")
    (synopsis "ardopcf is an Open-Source cross-platform implmentation of Ardop")
    (description
     "ardopcf is an Open-Source cross-platform implmentation of Ardop.")
    (license license:expat)))

;;;
;;; --- 56. arashi-icon-theme ---
;;; Arashi a smooth, modern icon set with a twist!
;;;

(define-public arashi-icon-theme
  (package
    (name "arashi-icon-theme")
    (version "25.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "arashi-icon-theme" ".tar.gz"))
              (sha256
               (base32
                "0mhp95ch45ysxw5szd2jnsb2x8waqkwq2b8mimmsdadkrmv5kgvg"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("arashi-icon-theme" "share/arashi-icon-theme/"))))
    (home-page "https://github.com/0hStormy/Arashi")
    (synopsis "arashi a smooth, modern icon set with a twist!")
    (description
     "Arashi a smooth, modern icon set with a twist!.")
    (license license:cc-by4.0)))

;;;
;;; --- 57. nvidia-rt ---
;;; NVIDIA drivers for linux-rt
;;;

(define-public nvidia-rt
  (package
    (name "nvidia-rt")
    (version "590.48.01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "nvidia-rt" ".tar.gz"))
              (sha256
               (base32
                "1j03sg88bhnkd3hk5hi8xssrgl94h672acn4yyxfnbnyjwxxfvjs"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("nvidia-rt" "share/nvidia-rt/"))))
    (home-page "http://www.nvidia.com/")
    (synopsis "nVIDIA drivers for linux-rt")
    (description
     "NVIDIA drivers for linux-rt.")
    (license license:expat)))

;;;
;;; --- 58. python-sam2-git ---
;;; Facebook Research AI to Segment Anything in Images and Videos
;;;

(define-public python-sam2-git
  (package
    (name "python-sam2-git")
    (version "r76.2b90b9f")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "python-sam2-git" ".tar.gz"))
              (sha256
               (base32
                "10hfjj6gqgzx1q0ajzimabfmahrqlr5dv4vqvidwqqvdiwhkp5gx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("python-sam2-git" "share/python-sam2-git/"))))
    (home-page "https://github.com/facebookresearch/sam2")
    (synopsis "facebook Research AI to Segment Anything in Images and Videos")
    (description
     "Facebook Research AI to Segment Anything in Images and Videos.")
    (license license:asl2.0)))

;;;
;;; --- 59. cspell-lsp ---
;;; Performs spell checking in source code files, using the cspell library.
;;;

(define-public cspell-lsp
  (package
    (name "cspell-lsp")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "cspell-lsp" ".tar.gz"))
              (sha256
               (base32
                "1khrf9rl08ac5yfdcd9cp9pcd4i3k1j9z72855whsabqbjs3psw3"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cspell-lsp" "share/cspell-lsp/"))))
    (home-page "https://github.com/vlabo/cspell-lsp")
    (synopsis "performs spell checking in source code files, using the cspell library")
    (description
     "Performs spell checking in source code files, using the cspell library.")
    (license license:gpl3)))

;;;
;;; --- 60. disk_usage-git ---
;;; A tool to monitor disk usage and alert when usage exceeds a threshold
;;;

(define-public disk-usage-git
  (package
    (name "disk_usage-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "disk_usage-git" ".tar.gz"))
              (sha256
               (base32
                "0rw793cs7r89dqh1v8scnfcl7gfjvwn2rhgjvhhpqqzfv4p2bn4k"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("disk_usage-git" "share/disk_usage-git/"))))
    (home-page "https://github.com/0xM4LL0C/disk_usage")
    (synopsis "a tool to monitor disk usage and alert when usage exceeds a threshold")
    (description
     "A tool to monitor disk usage and alert when usage exceeds a threshold.")
    (license license:expat)))

;;;
;;; --- 61. libgpg-stream ---
;;; GNU-Standard GPG Streaming Library for secure multicast communication
;;;

(define-public libgpg-stream
  (package
    (name "libgpg-stream")
    (version "1.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "libgpg-stream" ".tar.gz"))
              (sha256
               (base32
                "1s05drcxs786i0y9rcvs1ljy7hwl9n0lnh1b4jgz4yrh7x6h11nh"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("libgpg-stream" "share/libgpg-stream/"))))
    (home-page "https://github.com/theesfeld/libgpg-stream")
    (synopsis "gNU-Standard GPG Streaming Library for secure multicast communication")
    (description
     "GNU-Standard GPG Streaming Library for secure multicast communication.")
    (license license:gpl3+)))

;;;
;;; --- 62. hypersploit-bin ---
;;; Bypasses HyperOS restrictions on bootloader unlocking
;;;

(define-public hypersploit-bin
  (package
    (name "hypersploit-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "hypersploit-bin" ".tar.gz"))
              (sha256
               (base32
                "1590ra99bv0jkfm29as6jakaj2fgn8278a65gnzinyh7kd61z4c6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hypersploit-bin" "share/hypersploit-bin/"))))
    (home-page "https://github.com/TheAirBlow/HyperSploit")
    (synopsis "bypasses HyperOS restrictions on bootloader unlocking")
    (description
     "Bypasses HyperOS restrictions on bootloader unlocking.")
    (license license:mpl2.0)))

;;;
;;; --- 63. hypersploit ---
;;; Bypasses HyperOS restrictions on bootloader unlocking
;;;

(define-public hypersploit
  (package
    (name "hypersploit")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "hypersploit" ".tar.gz"))
              (sha256
               (base32
                "0nr3vdf16ww12dkbslhsbwd1n2s894jkfygla8rhnzbdb5sp51gg"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hypersploit" "share/hypersploit/"))))
    (home-page "https://github.com/TheAirBlow/HyperSploit")
    (synopsis "bypasses HyperOS restrictions on bootloader unlocking")
    (description
     "Bypasses HyperOS restrictions on bootloader unlocking.")
    (license license:mpl2.0)))

;;;
;;; --- 64. wyvern-git ---
;;; Very minimal Wayland compositor written in Rust
;;;

(define-public wyvern-git
  (package
    (name "wyvern-git")
    (version "r4.0e06767")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wyvern-git" ".tar.gz"))
              (sha256
               (base32
                "0wmcwik68qay1dxynj1pspp885xngig3j5qcyja0l65m9m9yivr0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("wyvern-git" "share/wyvern-git/"))))
    (home-page "https://github.com/neoapps-dev/wyvern")
    (synopsis "very minimal Wayland compositor written in Rust")
    (description
     "Very minimal Wayland compositor written in Rust.")
    (license license:gpl3)))
