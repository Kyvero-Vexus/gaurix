;;; Recipe design pass chunk1 (2026-04-02).
(define-module (gaurix packages recipe-design-20260402-chunk1)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (blogr-bin
            feedr-bin
            crier-bin
            cliamp-bin
            ferrishot-bin
            ferris-scan-bin
            gram-editor-bin
            console2svg-bin
            lazytail-bin
            funzzy-bin))

(define-public blogr-bin
  (package
    (name "blogr-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bahdotsh/blogr/releases/download/v"
                           version
                           "/blogr-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0hmp0s8mjikxb1jz715y5c0lnh4mqxn1nzav9mrm2zgy0fz1wfhn"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (string-append (assoc-ref %build-inputs "tar") "/bin/tar"))
                 (gzip (string-append (assoc-ref %build-inputs "gzip") "/bin/gzip"))
                 (bin (string-append out "/bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "blogr" bin)
            (chmod (string-append bin "/blogr") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/blogr")
    (synopsis "Terminal-first blog editor and publisher")
    (description
     "Blogr is a terminal-native blogging tool for writing, editing, and
publishing posts without leaving the command line.")
    (license license:expat)))

(define-public feedr-bin
  (package
    (name "feedr-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bahdotsh/feedr/releases/download/v"
                           version
                           "/feedr-linux-x86_64"))
       (sha256
        (base32 "12lq9hqv67cbry40zcsd3l6s2q9jf0wdgczahiknqxpamnnyy83p"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (target (string-append bin "/feedr")))
            (mkdir-p bin)
            (copy-file src target)
            (chmod target #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/feedr")
    (synopsis "Terminal RSS and Atom reader")
    (description
     "Feedr is a feature-rich terminal-based RSS and Atom feed reader with
keyboard-driven workflows.")
    (license license:expat)))

(define-public crier-bin
  (package
    (name "crier-bin")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/skorotkiewicz/crier/releases/download/"
                           version
                           "/crier-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0b204py1nf70fw5zdbn4xdcfj659d5v27bsglrn704qjib62ghhl"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (string-append (assoc-ref %build-inputs "tar") "/bin/tar"))
                 (gzip (string-append (assoc-ref %build-inputs "gzip") "/bin/gzip"))
                 (bin (string-append out "/bin"))
                 (doc (string-append out "/share/doc/crier-bin"))
                 (lic (string-append out "/share/licenses/crier-bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "crier" bin)
            (chmod (string-append bin "/crier") #o755)
            (mkdir-p doc)
            (install-file "README.md" doc)
            (mkdir-p lic)
            (install-file "LICENSE" lic)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/skorotkiewicz/crier")
    (synopsis "Push notification CLI for LAN and MQTT")
    (description
     "Crier is a command-line push notification tool that can deliver messages
over local TCP or across networks via MQTT.")
    (license license:expat)))

(define-public cliamp-bin
  (package
    (name "cliamp-bin")
    (version "1.31.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bjarneo/cliamp/releases/download/v"
                           version
                           "/cliamp-linux-amd64"))
       (sha256
        (base32 "1iy4xya7fli6cdr0cznb0bklcy8bqqgmw3x2iiyyjmzi6c6w2yj7"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (target (string-append bin "/cliamp")))
            (mkdir-p bin)
            (copy-file src target)
            (chmod target #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "Retro terminal music player")
    (description
     "Cliamp is a terminal music player inspired by Winamp-era interfaces,
with support for local media and streaming workflows.")
    (license license:expat)))

(define-public ferrishot-bin
  (package
    (name "ferrishot-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nik-rev/ferrishot/releases/download/v"
             version
             "/ferrishot-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "06r4glglzilbvrwgf5xw2r12l7v32zvni5avk20phgm0xkdgpgml"))))
    (build-system trivial-build-system)
    (native-inputs (list tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (string-append (assoc-ref %build-inputs "tar") "/bin/tar"))
                 (xz (string-append (assoc-ref %build-inputs "xz") "/bin/xz"))
                 (root "ferrishot-x86_64-unknown-linux-gnu")
                 (bin (string-append out "/bin"))
                 (doc (string-append out "/share/doc/ferrishot-bin"))
                 (lic (string-append out "/share/licenses/ferrishot-bin")))
            (invoke tar (string-append "--use-compress-program=" xz) "-xf" src)
            (mkdir-p bin)
            (install-file (string-append root "/ferrishot") bin)
            (chmod (string-append bin "/ferrishot") #o755)
            (mkdir-p doc)
            (install-file (string-append root "/README.md") doc)
            (install-file (string-append root "/CHANGELOG.md") doc)
            (mkdir-p lic)
            (install-file (string-append root "/LICENSE-MIT") lic)
            (install-file (string-append root "/LICENSE-APACHE") lic)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nik-rev/ferrishot")
    (synopsis "Rust screenshot utility")
    (description
     "Ferrishot is a lightweight screenshot tool written in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Vnilabean/ferris-scan/releases/download/v"
             version
             "/ferris-scan-tui-v"
             version
             "-linux"))
       (sha256
        (base32 "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
    (build-system trivial-build-system)
    (native-inputs
     (list
      (list "ferris-scan-gui"
            (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Vnilabean/ferris-scan/releases/download/v"
                    version
                    "/ferris-scan-gui-v"
                    version
                    "-linux"))
              (sha256
               (base32 "1fdjhgz0gzlad89jggq99m4bfyi7a3mssp5fdnkm9xkinar61xys"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src-tui (assoc-ref %build-inputs "source"))
                 (src-gui (assoc-ref %build-inputs "ferris-scan-gui"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src-tui (string-append bin "/ferris-scan-tui"))
            (copy-file src-gui (string-append bin "/ferris-scan-gui"))
            (chmod (string-append bin "/ferris-scan-tui") #o755)
            (chmod (string-append bin "/ferris-scan-gui") #o755)
            (symlink "ferris-scan-tui" (string-append bin "/ferris-scan"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "Lightweight file scanner with TUI and GUI frontends")
    (description
     "Ferris Scan is a lightweight file scanner implemented in Rust.
This package installs both the TUI and GUI release binaries.")
    (license license:expat)))

(define-public gram-editor-bin
  (package
    (name "gram-editor-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/GramEditor/gram/releases/download/"
             version
             "/gram-linux-x86_64-"
             version
             ".tar.gz"))
       (sha256
        (base32 "044sivzmka5chgmjw32y8vmxfplnigav654pxvfwbfwdvhhxf79c"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (string-append (assoc-ref %build-inputs "tar") "/bin/tar"))
                 (gzip (string-append (assoc-ref %build-inputs "gzip") "/bin/gzip"))
                 (app-dir (string-append out "/opt/gram-editor"))
                 (desktop-dir (string-append out "/share/applications"))
                 (doc-dir (string-append out "/share/doc/gram-editor-bin"))
                 (bin-dir (string-append out "/bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p (string-append out "/opt"))
            (copy-recursively "gram.app" app-dir)
            (chmod (string-append app-dir "/bin/gram") #o755)
            (chmod (string-append app-dir "/libexec/gram-editor") #o755)
            (mkdir-p bin-dir)
            (symlink (string-append app-dir "/bin/gram")
                     (string-append bin-dir "/gram"))
            (mkdir-p desktop-dir)
            (copy-file (string-append app-dir "/share/applications/gram.desktop")
                       (string-append desktop-dir "/gram.desktop"))
            (copy-recursively (string-append app-dir "/share/icons")
                              (string-append out "/share/icons"))
            (when (file-exists? (string-append app-dir "/licenses.md"))
              (mkdir-p doc-dir)
              (copy-file (string-append app-dir "/licenses.md")
                         (string-append doc-dir "/licenses.md")))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/GramEditor/gram")
    (synopsis "Code editor for terminal-first workflows")
    (description
     "Gram is a modern code editor distributed as a prebuilt Linux bundle.
This package installs the upstream x86_64 binary release and desktop entry.")
    (license (list license:gpl3+ license:agpl3+ license:asl2.0))))

(define-public console2svg-bin
  (package
    (name "console2svg-bin")
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arika0093/console2svg/releases/download/v"
             version
             "/console2svg-linux-x64"))
       (sha256
        (base32 "0cwbq60zw4dx5gg2xkd5qny22yg9cjkyfrcnznl4rmkicxas8mal"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (target (string-append bin "/console2svg")))
            (mkdir-p bin)
            (copy-file src target)
            (chmod target #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "Convert terminal output to SVG")
    (description
     "Console2svg converts terminal output streams into SVG images suitable
for documentation and sharing.")
    (license license:asl2.0)))

(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/raaymax/lazytail/releases/download/v"
             version
             "/lazytail-linux-x86_64.tar.gz"))
       (sha256
        (base32 "1fycd87x4idp7va9j7fxldkmqm1c20v3qxymk3j4x85061006lmn"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (string-append (assoc-ref %build-inputs "tar") "/bin/tar"))
                 (gzip (string-append (assoc-ref %build-inputs "gzip") "/bin/gzip"))
                 (bin (string-append out "/bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "lazytail" bin)
            (chmod (string-append bin "/lazytail") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "Terminal log viewer with follow and filtering")
    (description
     "Lazytail is a fast terminal-based log viewer with live filtering and
follow mode for operational debugging.")
    (license license:expat)))

(define-public funzzy-bin
  (package
    (name "funzzy-bin")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cristianoliveira/funzzy/releases/download/v"
             version
             "/funzzy-v"
             version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "1fd6f3j40f33wk4d7wymaia08gi7hax59dif4zda7h5qchpf9z3g"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (string-append (assoc-ref %build-inputs "tar") "/bin/tar"))
                 (gzip (string-append (assoc-ref %build-inputs "gzip") "/bin/gzip"))
                 (bin (string-append out "/bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "pkg/funzzy" bin)
            (install-file "pkg/fzz" bin)
            (chmod (string-append bin "/funzzy") #o755)
            (chmod (string-append bin "/fzz") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "Lightweight file watcher")
    (description
     "Funzzy is a lightweight generic-purpose file watcher for automating
commands when files change.")
    (license license:expat)))
