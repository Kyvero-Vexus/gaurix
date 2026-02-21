(define-module (gaurix packages visual-studio-code-bin)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression))

(define aur-revision "ca13b899c8e320fc78a420dbdf6932323e81b5c5")

(define-public visual-studio-code-bin
  (package
    (name "visual-studio-code-bin")
    ;; Version and download URL follow AUR visual-studio-code-bin.
    (version "1.109.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://update.code.visualstudio.com/"
                           version "/linux-x64/stable"))
       (file-name (string-append "code_x64_" version ".tar.gz"))
       (sha256
        (base32 "19xipl93dn29rl5imkrlhy9scr4sbak2gvip39jhz9fxq01h25kh"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (opt (string-append out "/opt/visual-studio-code"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (pixmaps (string-append out "/share/pixmaps")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xvf" src "-C" tmp)
            (copy-recursively (string-append tmp "/VSCode-linux-x64") opt)
            (mkdir-p bin)
            (symlink (string-append opt "/bin/code")
                     (string-append bin "/code"))
            (mkdir-p apps)
            (mkdir-p pixmaps)
            (copy-file (string-append opt "/resources/app/resources/linux/code.png")
                       (string-append pixmaps "/visual-studio-code.png"))
            (call-with-output-file (string-append apps "/visual-studio-code.desktop")
              (lambda (p)
                (display "[Desktop Entry]\nType=Application\nName=Visual Studio Code\nExec=code %F\nIcon=visual-studio-code\nCategories=Development;IDE;\nTerminal=false\n" p)))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://code.visualstudio.com/")
    (synopsis "Visual Studio Code binary distribution")
    (description
     "Binary repackaging of Microsoft's Visual Studio Code tarball for Linux,
following the AUR visual-studio-code-bin recipe metadata.")
    ;; Upstream labels this as custom commercial licensing.
    (license #f)))
