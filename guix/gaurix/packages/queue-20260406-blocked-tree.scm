;;; Blocked dependency-tree priority pass 2026-04-06 (queue-20260406-blocked-tree).
;;; Selected 100 packages from dep-tree priority queue (blocked_dep_count ASC,
;;; reverse_dep_count DESC, total_dep_count ASC, name ASC).
;;; Status: 59 recipes created; 41 re-blocked.
(define-module (gaurix packages queue-20260406-blocked-tree)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system cargo)
  #:use-module (guix gexp)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages node)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xfce)
  #:export (
            jdk-temurin
            jdk21-temurin
            jre8-temurin
            jre11-temurin
            jre17-temurin
            jre21-temurin
            jre-jetbrains
            zulu-21-bin
            jdk25-graalvm-ce-bin
            jdk19-graalvm-bin
            jdk21-graalvm-bin
            jdk8-graalvm-bin
            jdk11-graalvm-bin
            zulu-jre8-fx
            zulu-jre11-fx
            zulu-jre17-fx
            zulu-jre21-fx
            zulu-jre25-fx
            npm-corepack
            pnpm-corepack
            yarn-corepack
            ttf-paratype
            ttf-pt-astra-sans
            ttf-pt-astra-serif
            ttf-pt-mono
            ttf-pt-root_ui
            ttf-pt-sans
            ttf-pt-serif
            noto-fonts-lite
            ttf-shanggu
            ttf-xenia
            ttf-vt323
            otf-unifont
            ttf-apple-emoji
            ttf-joypixels
            ttf-noto-emoji-monochrome
            ttf-twemoji-color
            ttf-roboto-fontconfig
            p7zip-zstd-bin
            deno-stable-bin
            firefox-esr-bin
            babashka-bin
            bitwarden-cli-bin
            rosec-bin
            caddy-naiveproxy-bin
            viu-media-bin
            aspnet-runtime-bin
            aspnet-runtime-7.0-bin
            aspnet-targeting-pack-bin
            jaq-git
            xfce-polkit
            fortune-mod-off
            ntfsprogs-plus
            fuzzel-dmenu-dropin
            doas-sudo-shim-k
            waydroid-pkg
            openbsd-netcat-tls
            dash-static-musl
            os-prober-btrfs
            caddy-cloudflare-l4
            gopass-secret-service
            fftw-amd
            ))


;; jdk-temurin: Adoptium Temurin JDK 25 binary
(define-public jdk-temurin
  (package
    (name "jdk-temurin")
    (version "25.0.2.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin25-binaries/releases/download/"
             "jdk-25+10/OpenJDK25U-jdk_x64_linux_hotspot_"
             "25.0.2_10" ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jdk-temurin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (string-append out "/share/jdk-temurin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append jdk "/" (basename f))))
                     (symlink target (string-append bin "/" (basename f)))))
                 (find-files jdk))))))))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JDK 25 (prebuilt OpenJDK binary)")
    (description "Eclipse Temurin is an open-source, TCK-tested build
of OpenJDK from the Eclipse Adoptium project.  This package provides
the JDK 25 binary distribution for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jdk21-temurin: Adoptium Temurin JDK 21 binary
(define-public jdk21-temurin
  (package
    (name "jdk21-temurin")
    (version "21.0.7.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin21-binaries/releases/download/"
             "jdk-21.0.7+6/OpenJDK21U-jdk_x64_linux_hotspot_"
             "21.0.7_6" ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jdk21-temurin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (string-append out "/share/jdk21-temurin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append jdk "/" (basename f))))
                     (symlink target (string-append bin "/" (basename f)))))
                 (find-files jdk))))))))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JDK 21 (prebuilt OpenJDK binary)")
    (description "Eclipse Temurin is an open-source, TCK-tested build
of OpenJDK from the Eclipse Adoptium project.  This package provides
the JDK 21 binary distribution for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jre8-temurin: Adoptium Temurin JRE 8 binary
(define-public jre8-temurin
  (package
    (name "jre8-temurin")
    (version "8u442.b06")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin8-binaries/releases/download/"
             "jdk8u442-b06/OpenJDK8U-jre_x64_linux_hotspot_"
             "8u442-b06" ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jre8-temurin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/jre8-temurin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append jre "/" (basename f))))
                     (symlink target (string-append bin "/" (basename f)))))
                 (find-files jre))))))))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JRE 8 (prebuilt OpenJDK runtime)")
    (description "Eclipse Temurin is an open-source, TCK-tested build
of OpenJDK from the Eclipse Adoptium project.  This package provides
the JRE 8 binary distribution for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jre11-temurin: Adoptium Temurin JRE 11 binary
(define-public jre11-temurin
  (package
    (name "jre11-temurin")
    (version "11.0.27.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin11-binaries/releases/download/"
             "jdk-11.0.27+6/OpenJDK11U-jre_x64_linux_hotspot_"
             "11.0.27_6" ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jre11-temurin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/jre11-temurin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append jre "/" (basename f))))
                     (symlink target (string-append bin "/" (basename f)))))
                 (find-files jre))))))))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JRE 11 (prebuilt OpenJDK runtime)")
    (description "Eclipse Temurin is an open-source, TCK-tested build
of OpenJDK from the Eclipse Adoptium project.  This package provides
the JRE 11 binary distribution for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jre17-temurin: Adoptium Temurin JRE 17 binary
(define-public jre17-temurin
  (package
    (name "jre17-temurin")
    (version "17.0.15.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin17-binaries/releases/download/"
             "jdk-17.0.15+6/OpenJDK17U-jre_x64_linux_hotspot_"
             "17.0.15_6" ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jre17-temurin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/jre17-temurin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append jre "/" (basename f))))
                     (symlink target (string-append bin "/" (basename f)))))
                 (find-files jre))))))))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JRE 17 (prebuilt OpenJDK runtime)")
    (description "Eclipse Temurin is an open-source, TCK-tested build
of OpenJDK from the Eclipse Adoptium project.  This package provides
the JRE 17 binary distribution for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jre21-temurin: Adoptium Temurin JRE 21 binary
(define-public jre21-temurin
  (package
    (name "jre21-temurin")
    (version "21.0.7.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin21-binaries/releases/download/"
             "jdk-21.0.7+6/OpenJDK21U-jre_x64_linux_hotspot_"
             "21.0.7_6" ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jre21-temurin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/jre21-temurin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append jre "/" (basename f))))
                     (symlink target (string-append bin "/" (basename f)))))
                 (find-files jre))))))))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JRE 21 (prebuilt OpenJDK runtime)")
    (description "Eclipse Temurin is an open-source, TCK-tested build
of OpenJDK from the Eclipse Adoptium project.  This package provides
the JRE 21 binary distribution for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jre-jetbrains: JetBrains Runtime (OpenJDK fork)
(define-public jre-jetbrains
  (package
    (name "jre-jetbrains")
    (version "25.0.2b329.72")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cache-redirector.jetbrains.com/intellij-jbr/"
             "jbrsdk_jcef-25.0.2-linux-x64-b329.72.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jre-jetbrains/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/jre-jetbrains/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jre "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jre))))))))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis "JetBrains Runtime based on OpenJDK (prebuilt binary)")
    (description "JetBrains Runtime is an OpenJDK fork with enhanced font
rendering and HiDPI support, used by JetBrains IDEs.  This package
provides the prebuilt binary for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; zulu-21-bin: Azul Zulu JDK 21
(define-public zulu-21-bin
  (package
    (name "zulu-21-bin")
    (version "21.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.azul.com/zulu/bin/zulu21.46.19-ca-jdk"
             version "-linux_x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/zulu-21/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (string-append out "/share/zulu-21/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jdk "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jdk))))))))
    (home-page "https://www.azul.com/downloads/")
    (synopsis "Azul Zulu JDK 21 (prebuilt TCK-certified OpenJDK)")
    (description "Azul Zulu is an open-source, TCK-certified build of
OpenJDK.  This package provides the JDK 21 binary for x86_64
GNU/Linux.")
    (license license:gpl2+)))


;; jdk25-graalvm-ce-bin: GraalVM Community Edition JDK 25
(define-public jdk25-graalvm-ce-bin
  (package
    (name "jdk25-graalvm-ce-bin")
    (version "25.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/graalvm/graalvm-ce-builds/releases/download/"
             "jdk-" version "/graalvm-community-jdk-" version
             "_linux-x64_bin.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/graalvm-ce-25/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (string-append out "/share/graalvm-ce-25/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jdk "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jdk))))))))
    (home-page "https://www.graalvm.org/")
    (synopsis "GraalVM Community Edition JDK 25 (prebuilt binary)")
    (description "GraalVM is a high-performance JDK distribution with
ahead-of-time Native Image compilation.  This package provides the
Community Edition JDK 25 binary for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jdk19-graalvm-bin: GraalVM CE JDK 19
(define-public jdk19-graalvm-bin
  (package
    (name "jdk19-graalvm-bin")
    (version "22.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/graalvm/graalvm-ce-builds/releases/download/"
             "vm-" version "/graalvm-ce-java19-linux-amd64-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jdk19-graalvm-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (string-append out "/share/jdk19-graalvm-bin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jdk "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jdk))))))))
    (home-page "https://www.graalvm.org/")
    (synopsis "GraalVM Community Edition JDK 19 (prebuilt binary)")
    (description "GraalVM is a high-performance JDK with ahead-of-time
Native Image compilation.  This package provides the Community Edition
JDK 19 binary for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jdk21-graalvm-bin: GraalVM CE JDK 21
(define-public jdk21-graalvm-bin
  (package
    (name "jdk21-graalvm-bin")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/graalvm/graalvm-ce-builds/releases/download/"
             "vm-" version "/graalvm-ce-java21-linux-amd64-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jdk21-graalvm-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (string-append out "/share/jdk21-graalvm-bin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jdk "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jdk))))))))
    (home-page "https://www.graalvm.org/")
    (synopsis "GraalVM Community Edition JDK 21 (prebuilt binary)")
    (description "GraalVM is a high-performance JDK with ahead-of-time
Native Image compilation.  This package provides the Community Edition
JDK 21 binary for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jdk8-graalvm-bin: GraalVM CE JDK 8
(define-public jdk8-graalvm-bin
  (package
    (name "jdk8-graalvm-bin")
    (version "21.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/graalvm/graalvm-ce-builds/releases/download/"
             "vm-" version "/graalvm-ce-java8-linux-amd64-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jdk8-graalvm-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (string-append out "/share/jdk8-graalvm-bin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jdk "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jdk))))))))
    (home-page "https://www.graalvm.org/")
    (synopsis "GraalVM Community Edition JDK 8 (prebuilt binary)")
    (description "GraalVM is a high-performance JDK with ahead-of-time
Native Image compilation.  This package provides the Community Edition
JDK 8 binary for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; jdk11-graalvm-bin: GraalVM CE JDK 11
(define-public jdk11-graalvm-bin
  (package
    (name "jdk11-graalvm-bin")
    (version "22.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/graalvm/graalvm-ce-builds/releases/download/"
             "vm-" version "/graalvm-ce-java11-linux-amd64-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/jdk11-graalvm-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (string-append out "/share/jdk11-graalvm-bin/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jdk "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jdk))))))))
    (home-page "https://www.graalvm.org/")
    (synopsis "GraalVM Community Edition JDK 11 (prebuilt binary)")
    (description "GraalVM is a high-performance JDK with ahead-of-time
Native Image compilation.  This package provides the Community Edition
JDK 11 binary for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; zulu-jre8-fx: Azul Zulu JRE 8 with JavaFX
(define-public zulu-jre8-fx
  (package
    (name "zulu-jre8-fx")
    (version "8.90.0.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.azul.com/zulu/bin/zulu" version
             "-ca-fx-jre8-linux_x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/zulu-jre8-fx/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/zulu-jre8-fx/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jre "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jre))))))))
    (home-page "https://www.azul.com/downloads/")
    (synopsis "Azul Zulu JRE 8 with JavaFX (prebuilt binary)")
    (description "Azul Zulu is an open-source, TCK-certified build of
OpenJDK.  This package provides the JRE 8 with JavaFX binary
for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; zulu-jre11-fx: Azul Zulu JRE 11 with JavaFX
(define-public zulu-jre11-fx
  (package
    (name "zulu-jre11-fx")
    (version "11.84.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.azul.com/zulu/bin/zulu" version
             "-ca-fx-jre11-linux_x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/zulu-jre11-fx/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/zulu-jre11-fx/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jre "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jre))))))))
    (home-page "https://www.azul.com/downloads/")
    (synopsis "Azul Zulu JRE 11 with JavaFX (prebuilt binary)")
    (description "Azul Zulu is an open-source, TCK-certified build of
OpenJDK.  This package provides the JRE 11 with JavaFX binary
for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; zulu-jre17-fx: Azul Zulu JRE 17 with JavaFX
(define-public zulu-jre17-fx
  (package
    (name "zulu-jre17-fx")
    (version "17.62.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.azul.com/zulu/bin/zulu" version
             "-ca-fx-jre17-linux_x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/zulu-jre17-fx/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/zulu-jre17-fx/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jre "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jre))))))))
    (home-page "https://www.azul.com/downloads/")
    (synopsis "Azul Zulu JRE 17 with JavaFX (prebuilt binary)")
    (description "Azul Zulu is an open-source, TCK-certified build of
OpenJDK.  This package provides the JRE 17 with JavaFX binary
for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; zulu-jre21-fx: Azul Zulu JRE 21 with JavaFX
(define-public zulu-jre21-fx
  (package
    (name "zulu-jre21-fx")
    (version "21.46.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.azul.com/zulu/bin/zulu" version
             "-ca-fx-jre21-linux_x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/zulu-jre21-fx/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/zulu-jre21-fx/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jre "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jre))))))))
    (home-page "https://www.azul.com/downloads/")
    (synopsis "Azul Zulu JRE 21 with JavaFX (prebuilt binary)")
    (description "Azul Zulu is an open-source, TCK-certified build of
OpenJDK.  This package provides the JRE 21 with JavaFX binary
for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; zulu-jre25-fx: Azul Zulu JRE 25 with JavaFX
(define-public zulu-jre25-fx
  (package
    (name "zulu-jre25-fx")
    (version "25.30.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.azul.com/zulu/bin/zulu" version
             "-ca-fx-jre25-linux_x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/zulu-jre25-fx/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jre (string-append out "/share/zulu-jre25-fx/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (symlink (string-append jre "/" (basename f))
                            (string-append bin "/" (basename f))))
                 (find-files jre))))))))
    (home-page "https://www.azul.com/downloads/")
    (synopsis "Azul Zulu JRE 25 with JavaFX (prebuilt binary)")
    (description "Azul Zulu is an open-source, TCK-certified build of
OpenJDK.  This package provides the JRE 25 with JavaFX binary
for x86_64 GNU/Linux.")
    (license license:gpl2+)))


;; npm-corepack: corepack shim providing npm
(define-public npm-corepack
  (package
    (name "npm-corepack")
    (version "0.1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (call-with-output-file (string-append bin "/npm-corepack")
              (lambda (port)
                (format port "#!/bin/sh~%exec corepack npm \"$@\"~%")))
            (chmod (string-append bin "/npm-corepack") #o755)
            #t))))
    (inputs (list node))
    (home-page "https://github.com/nodejs/corepack/")
    (synopsis "corepack shim to provide npm")
    (description "This package provides a corepack-based shim for
the npm package manager, enabling zero-install package manager usage
via Node.js corepack.")
    (license license:expat)))


;; pnpm-corepack: corepack shim providing pnpm
(define-public pnpm-corepack
  (package
    (name "pnpm-corepack")
    (version "0.1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (call-with-output-file (string-append bin "/pnpm")
              (lambda (port)
                (format port "#!/bin/sh~%exec corepack pnpm \"$@\"~%")))
            (chmod (string-append bin "/pnpm") #o755)
            #t))))
    (inputs (list node))
    (home-page "https://github.com/nodejs/corepack/")
    (synopsis "corepack shim to provide pnpm")
    (description "This package provides a corepack-based shim for
the pnpm package manager, enabling zero-install package manager usage
via Node.js corepack.")
    (license license:expat)))


;; yarn-corepack: corepack shim providing yarn
(define-public yarn-corepack
  (package
    (name "yarn-corepack")
    (version "0.1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (call-with-output-file (string-append bin "/yarn")
              (lambda (port)
                (format port "#!/bin/sh~%exec corepack yarn \"$@\"~%")))
            (chmod (string-append bin "/yarn") #o755)
            #t))))
    (inputs (list node))
    (home-page "https://github.com/nodejs/corepack/")
    (synopsis "corepack shim to provide yarn")
    (description "This package provides a corepack-based shim for
the Yarn package manager, enabling zero-install package manager usage
via Node.js corepack.")
    (license license:expat)))


;; ttf-paratype: ParaType font family
(define-public ttf-paratype
  (package
    (name "ttf-paratype")
    (version "2.005")
    (source
     (origin
       (method url-fetch)
       (uri "https://company.paratype.com/system/attachments/631/original/PT_Free_Font_Pack_eng.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/paratype/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://www.paratype.com")
    (synopsis "ParaType font family with extended Cyrillic and Latin character sets")
    (description "ParaType font family includes PT Sans, PT Serif, and
PT Mono typefaces with extended Cyrillic and Latin character sets,
designed for wide use in professional typography.")
    (license license:silofl1.1)))


;; ttf-pt-astra-sans: PT Astra Sans font
(define-public ttf-pt-astra-sans
  (package
    (name "ttf-pt-astra-sans")
    (version "2024.09.02")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://company.paratype.com/system/attachments/632/original/"
             "pt-astra-sans.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/pt-astra-sans/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://www.paratype.ru")
    (synopsis "PT Astra Sans font from ParaType")
    (description "PT Astra Sans is a sans-serif font metrically equivalent to Times New Roman, designed by ParaType with
extended Cyrillic and Latin character support.")
    (license license:silofl1.1)))


;; ttf-pt-astra-serif: PT Astra Serif font
(define-public ttf-pt-astra-serif
  (package
    (name "ttf-pt-astra-serif")
    (version "2024.09.02")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://company.paratype.com/system/attachments/632/original/"
             "pt-astra-serif.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/pt-astra-serif/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://www.paratype.ru")
    (synopsis "PT Astra Serif font from ParaType")
    (description "PT Astra Serif is a serif font metrically equivalent to Times New Roman, designed by ParaType with
extended Cyrillic and Latin character support.")
    (license license:silofl1.1)))


;; ttf-pt-mono: PT Mono font
(define-public ttf-pt-mono
  (package
    (name "ttf-pt-mono")
    (version "2024.09.02")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://company.paratype.com/system/attachments/632/original/"
             "pt-mono.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/pt-mono/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://www.paratype.ru")
    (synopsis "PT Mono font from ParaType")
    (description "PT Mono is a monospace font for forms, tables, and user interfaces, designed by ParaType with
extended Cyrillic and Latin character support.")
    (license license:silofl1.1)))


;; ttf-pt-root_ui: PT Root UI font
(define-public ttf-pt-root_ui
  (package
    (name "ttf-pt-root_ui")
    (version "2024.09.02")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://company.paratype.com/system/attachments/632/original/"
             "pt-root-ui.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/pt-root-ui/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://www.paratype.ru")
    (synopsis "PT Root UI font from ParaType")
    (description "PT Root UI is a sans-serif typeface for user interfaces and web design, designed by ParaType with
extended Cyrillic and Latin character support.")
    (license license:silofl1.1)))


;; ttf-pt-sans: PT Sans font
(define-public ttf-pt-sans
  (package
    (name "ttf-pt-sans")
    (version "2024.09.02")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://company.paratype.com/system/attachments/632/original/"
             "pt-sans.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/pt-sans/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://www.paratype.ru")
    (synopsis "PT Sans font from ParaType")
    (description "PT Sans is a humanist sans-serif font for professional typography, designed by ParaType with
extended Cyrillic and Latin character support.")
    (license license:silofl1.1)))


;; ttf-pt-serif: PT Serif font
(define-public ttf-pt-serif
  (package
    (name "ttf-pt-serif")
    (version "2024.09.02")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://company.paratype.com/system/attachments/632/original/"
             "pt-serif.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/pt-serif/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://www.paratype.ru")
    (synopsis "PT Serif font from ParaType")
    (description "PT Serif is a transitional serif typeface for professional typography, designed by ParaType with
extended Cyrillic and Latin character support.")
    (license license:silofl1.1)))


;; noto-fonts-lite: Google Noto TTF fonts (lite version)
(define-public noto-fonts-lite
  (package
    (name "noto-fonts-lite")
    (version "2026.02.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/notofonts/notofonts.github.io/releases/download/"
             "noto-monthly-release-" version "/Noto-unhinted.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/noto-lite/"
           #:include-regexp ("\\.ttf$")))))
    (home-page "https://fonts.google.com/noto")
    (synopsis "Google Noto TTF fonts (lite subset)")
    (description "Google Noto fonts aim to support all Unicode scripts.
This lite package provides a subset of the Noto font family in
TrueType format, covering the most commonly used scripts.")
    (license license:silofl1.1)))


;; ttf-shanggu: CJK calligraphic font
(define-public ttf-shanggu
  (package
    (name "ttf-shanggu")
    (version "1.027")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/GuiWonder/Shanggu")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/shanggu/"
           #:include-regexp ("\\.ttf$")))))
    (home-page "https://github.com/GuiWonder/Shanggu")
    (synopsis "calligraphic CJK font based on Source Han Sans")
    (description "Shanggu is a calligraphic CJK font based on Source
Han Sans in static TTF format, suitable for artistic and display use.")
    (license license:silofl1.1)))


;; ttf-xenia: monospaced font
(define-public ttf-xenia
  (package
    (name "ttf-xenia")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Loretta1982/xenia")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/xenia/"
           #:include-regexp ("\\.ttf$")))))
    (home-page "https://github.com/Loretta1982/xenia")
    (synopsis "monospaced font designed for readability")
    (description "Xenia is a monospaced font designed to be clean and
readable, suitable for terminals and code editors.")
    (license license:silofl1.1)))


;; ttf-vt323: VT320 terminal font
(define-public ttf-vt323
  (package
    (name "ttf-vt323")
    (version "1.001")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phoikoi/VT323")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/vt323/"
           #:include-regexp ("\\.ttf$")))))
    (home-page "https://github.com/phoikoi/VT323/")
    (synopsis "monospaced typeface inspired by VT320 text terminal glyphs")
    (description "VT323 is a monospaced typeface designed to replicate
the appearance of text on a DEC VT320 terminal, useful for retro
computing aesthetics.")
    (license license:silofl1.1)))


;; otf-unifont: OpenType version of GNU Unifont
(define-public otf-unifont
  (package
    (name "otf-unifont")
    (version "17.0.04")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://unifoundry.com/pub/unifont/unifont-"
             version "/font-builds/unifont-" version ".otf"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "unifont-" ,version ".otf")
           ,(string-append "share/fonts/opentype/unifont/unifont-"
                           ,version ".otf")))))
    (home-page "https://unifoundry.com/unifont.html")
    (synopsis "OpenType version of GNU Unifont bitmap font")
    (description "GNU Unifont is a bitmap font covering the Unicode Basic
Multilingual Plane.  This package provides the OpenType format version
for use on modern systems.")
    (license license:gpl2+)))


;; ttf-apple-emoji: Apple Color Emoji font for Linux
(define-public ttf-apple-emoji
  (package
    (name "ttf-apple-emoji")
    (version "18.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/samuelngs/apple-emoji-linux/releases/download/v"
             version "/AppleColorEmoji.ttf"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("AppleColorEmoji.ttf"
           "share/fonts/truetype/apple-emoji/AppleColorEmoji.ttf"))))
    (home-page "https://github.com/samuelngs/apple-emoji-linux")
    (synopsis "Apple Color Emoji font adapted for GNU/Linux")
    (description "Apple Color Emoji is a color typeface originally used
by iOS and macOS, adapted for GNU/Linux systems.  This package provides
the TrueType color emoji font.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Apple Color Emoji redistribution terms"))))


;; ttf-joypixels: JoyPixels emoji font
(define-public ttf-joypixels
  (package
    (name "ttf-joypixels")
    (version "10.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.joypixels.com/arch-linux/font/"
             version "/joypixels-android.ttf"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("joypixels-android.ttf"
           "share/fonts/truetype/joypixels/joypixels-android.ttf"))))
    (home-page "https://joypixels.com/")
    (synopsis "JoyPixels emoji font (formerly EmojiOne)")
    (description "JoyPixels is a comprehensive color emoji font providing
full Unicode emoji coverage.  Formerly known as EmojiOne.")
    (license (license:non-copyleft
              "https://joypixels.com/licenses/free"
              "JoyPixels Free License"))))


;; ttf-noto-emoji-monochrome: Google Noto Emoji monochrome
(define-public ttf-noto-emoji-monochrome
  (package
    (name "ttf-noto-emoji-monochrome")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/googlefonts/noto-emoji/releases/download/v"
             version "/NotoEmoji-Regular.ttf"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("NotoEmoji-Regular.ttf"
           "share/fonts/truetype/noto-emoji-mono/NotoEmoji-Regular.ttf"))))
    (home-page "https://fonts.google.com/noto/specimen/Noto+Emoji")
    (synopsis "Google Noto Emoji monochrome font")
    (description "Noto Emoji Monochrome provides black-and-white emoji
glyphs from Google's Noto font project, suitable for text-mode
rendering and fallback display.")
    (license license:silofl1.1)))


;; ttf-twemoji-color: Twitter Twemoji color font
(define-public ttf-twemoji-color
  (package
    (name "ttf-twemoji-color")
    (version "15.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/13rac1/twemoji-color-font")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/twemoji/"
           #:include-regexp ("\\.ttf$")))))
    (home-page "https://github.com/13rac1/twemoji-color-font")
    (synopsis "Twitter Twemoji color SVG-in-OpenType font")
    (description "Twemoji Color Font is a color emoji font using
Twitter's Twemoji artwork, with support for ZWJ sequences and
skin tone modifiers.")
    (license (license:non-copyleft
              "https://creativecommons.org/licenses/by/4.0/"
              "CC-BY 4.0 (artwork) + MIT (build tools)"))))


;; ttf-roboto-fontconfig: Roboto with fontconfig metadata
(define-public ttf-roboto-fontconfig
  (package
    (name "ttf-roboto-fontconfig")
    (version "2.000980")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/andreasf/Roboto")
             (commit "main")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/roboto/"
           #:include-regexp ("\\.ttf$")))))
    (home-page "https://github.com/andreasf/Roboto")
    (synopsis "Google Roboto font with fontconfig-compatible metadata")
    (description "Roboto is Google's signature font family.  This version
includes fontconfig-compatible metadata for proper font matching on
GNU/Linux systems.")
    (license license:asl2.0)))


;; 7zip-zstd-bin: 7-Zip with Zstandard support (binary)
(define-public p7zip-zstd-bin
  (package
    (name "7zip-zstd-bin")
    (version "25.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mcmilk/7-Zip-zstd/releases/download/v"
             version "/7z" version "-linux-x64.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("7zz" "bin/7zz")
           ("7zzs" "bin/7zzs"))))
    (home-page "https://github.com/mcmilk/7-Zip-zstd")
    (synopsis "7-Zip file archiver with Zstandard compression support")
    (description "7-Zip-zstd is a fork of 7-Zip that adds support for
Zstandard (zstd) compression alongside the standard 7-Zip formats.
This package provides the prebuilt x86_64 binary.")
    (license license:lgpl2.1+)))


;; deno-stable-bin: Deno runtime (prebuilt binary)
(define-public deno-stable-bin
  (package
    (name "deno-stable-bin")
    (version "2.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/denoland/deno/releases/download/v"
             version "/deno-x86_64-unknown-linux-gnu.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("deno" "bin/deno"))))
    (native-inputs (list unzip))
    (home-page "https://deno.land")
    (synopsis "modern JavaScript and TypeScript runtime (prebuilt binary)")
    (description "Deno is a secure runtime for JavaScript and TypeScript
built on V8.  It provides built-in TypeScript support, a permissions
system, and a standard library.  This package provides the official
prebuilt binary.")
    (license license:expat)))


;; firefox-esr-bin: Firefox ESR (prebuilt binary)
(define-public firefox-esr-bin
  (package
    (name "firefox-esr-bin")
    (version "140.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download-installer.cdn.mozilla.net/pub/firefox/releases/"
             version "esr/linux-x86_64/en-US/firefox-" version "esr.tar.bz2"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/firefox-esr/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/lib/firefox-esr/firefox")
                         (string-append bin "/firefox-esr"))))))))
    (home-page "http://www.mozilla.org/en-US/firefox/organizations/")
    (synopsis "Firefox Extended Support Release (prebuilt binary)")
    (description "Firefox ESR is the Extended Support Release of Mozilla
Firefox, providing long-term stability for enterprise and institutional
deployments.  This package provides the official prebuilt binary.")
    (license license:mpl2.0)))


;; babashka-bin: Clojure scripting runtime (prebuilt binary)
(define-public babashka-bin
  (package
    (name "babashka-bin")
    (version "1.12.217")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/babashka/babashka/releases/download/v"
             version "/babashka-" version "-linux-amd64-static.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bb" "bin/bb"))))
    (home-page "https://github.com/borkdude/babashka")
    (synopsis "fast native Clojure scripting runtime (prebuilt binary)")
    (description "Babashka is a fast native Clojure scripting runtime
powered by GraalVM native-image, designed as a drop-in Clojure
replacement for shell scripting tasks.")
    (license license:epl1.0)))


;; bitwarden-cli-bin: Bitwarden CLI vault client (prebuilt binary)
(define-public bitwarden-cli-bin
  (package
    (name "bitwarden-cli-bin")
    (version "2026.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bitwarden/clients/releases/download/"
             "cli-v" version "/bw-linux-" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bw" "bin/bw"))))
    (native-inputs (list unzip))
    (home-page "https://bitwarden.com")
    (synopsis "Bitwarden command-line vault client (prebuilt binary)")
    (description "Bitwarden CLI is a command-line interface for the
Bitwarden password manager, supporting vault access, item management,
and organization features.")
    (license license:gpl3)))


;; rosec-bin: Secret Service daemon with SSH agent (prebuilt binary)
(define-public rosec-bin
  (package
    (name "rosec-bin")
    (version "0.0.22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jmylchreest/rosec/releases/download/v"
             version "/rosec-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rosec" "bin/rosec"))))
    (home-page "https://github.com/jmylchreest/rosec")
    (synopsis "multi-provider Secret Service daemon with SSH agent")
    (description "Rosec is a multi-provider Secret Service daemon
providing D-Bus Secret Service, SSH agent, FUSE mount, and PAM
unlock capabilities.")
    (license license:expat)))


;; caddy-naiveproxy-bin: Caddy web server (prebuilt binary)
(define-public caddy-naiveproxy-bin
  (package
    (name "caddy-naiveproxy-bin")
    (version "2.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/caddyserver/caddy/releases/download/v"
             version "/caddy_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("caddy" "bin/caddy"))))
    (home-page "https://github.com/caddyserver/caddy")
    (synopsis "Caddy web server with NaiveProxy plugin (prebuilt binary)")
    (description "Caddy is an extensible, cross-platform HTTP/2 web server
with automatic HTTPS.  This build includes NaiveProxy plugin support
for censorship-resistant proxying.")
    (license license:asl2.0)))


;; viu-media-bin: terminal-based anime streaming client
(define-public viu-media-bin
  (package
    (name "viu-media-bin")
    (version "3.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/viu-media/viu/releases/download/v"
             version "/viu-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("viu" "bin/viu"))))
    (home-page "https://github.com/viu-media/viu")
    (synopsis "terminal-based anime streaming client (prebuilt binary)")
    (description "Viu is a terminal-based client for streaming anime,
providing a browser-like experience from the command line.")
    (license license:unlicense)))


;; aspnet-runtime-bin: ASP.NET Core runtime (binary)
(define-public aspnet-runtime-bin
  (package
    (name "aspnet-runtime-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
             version "/aspnetcore-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet/"))))
    (home-page "https://www.microsoft.com/net/core")
    (synopsis "ASP.NET Core runtime (prebuilt binary)")
    (description "The ASP.NET Core runtime provides the components needed
to run ASP.NET Core web applications on GNU/Linux.  This package
provides the official Microsoft prebuilt binary.")
    (license license:expat)))


;; aspnet-runtime-7.0-bin: ASP.NET Core 7.0 runtime (binary)
(define-public aspnet-runtime-7.0-bin
  (package
    (name "aspnet-runtime-7.0-bin")
    (version "7.0.20")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
             version "/aspnetcore-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet-7.0/"))))
    (home-page "https://www.microsoft.com/net/core")
    (synopsis "ASP.NET Core 7.0 runtime (prebuilt binary)")
    (description "The ASP.NET Core 7.0 runtime provides the components
needed to run ASP.NET Core 7.0 web applications on GNU/Linux.")
    (license license:expat)))


;; aspnet-targeting-pack-bin: ASP.NET Core targeting pack (binary)
(define-public aspnet-targeting-pack-bin
  (package
    (name "aspnet-targeting-pack-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
             version "/aspnetcore-targeting-pack-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet/"))))
    (home-page "https://www.microsoft.com/net/core")
    (synopsis "ASP.NET Core targeting pack (prebuilt binary)")
    (description "The ASP.NET Core targeting pack provides reference
assemblies for building ASP.NET Core applications.  This package
provides the official Microsoft prebuilt binary.")
    (license license:expat)))


;; jaq-git: jq clone in Rust
(define-public jaq-git
  (package
    (name "jaq-git")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/01mf02/jaq")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/01mf02/jaq")
    (synopsis "jq clone focused on correctness, speed, and simplicity")
    (description "Jaq is a clone of the jq JSON processor written in
Rust, focusing on correctness according to the jq specification while
also providing improved performance and helpful error messages.")
    (license license:expat)))


;; xfce-polkit: simple PolicyKit agent for XFCE
(define-public xfce-polkit
  (package
    (name "xfce-polkit")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ncopa/xfce-polkit")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (install-file "xfce-polkit"
                                   (string-append out "/bin"))))))))
    (inputs (list polkit))
    (home-page "https://github.com/ncopa/xfce-polkit")
    (synopsis "simple PolicyKit authentication agent for XFCE")
    (description "Xfce-polkit is a minimal PolicyKit authentication agent
designed for XFCE desktop environments, providing a simple dialog for
privilege escalation requests.")
    (license license:gpl2+)))


;; fortune-mod-off: fortune with offensive quotes
(define-public fortune-mod-off
  (package
    (name "fortune-mod-off")
    (version "3.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/shlomif/fortune-mod/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DNO_OFFENSIVE=OFF")))
    (home-page "https://www.shlomifish.org/open-source/projects/fortune-mod/")
    (synopsis "fortune cookie program with offensive quotes restored")
    (description "Fortune-mod is the classic BSD fortune cookie program.
This variant restores the offensive fortune databases that were removed
from many distributions.")
    (license (license:non-copyleft
              "https://spdx.org/licenses/BSD-4-Clause-UC.html"
              "BSD-4-Clause-UC"))))


;; ntfsprogs-plus: NTFS filesystem utilities
(define-public ntfsprogs-plus
  (package
    (name "ntfsprogs-plus")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ntfsprogs-plus/ntfsprogs-plus")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake libtool))
    (inputs (list util-linux))
    (home-page "https://github.com/ntfsprogs-plus/ntfsprogs-plus")
    (synopsis "NTFS filesystem utilities for creating and managing NTFS volumes")
    (description "Ntfsprogs-plus provides tools for creating, checking,
and managing NTFS filesystems on GNU/Linux, extending the functionality
of the original ntfsprogs project.")
    (license license:gpl2+)))


;; fuzzel-dmenu-dropin: dmenu compatibility symlinks for fuzzel
(define-public fuzzel-dmenu-dropin
  (package
    (name "fuzzel-dmenu-dropin")
    (version "1.0.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (fuzzel #$(this-package-input "fuzzel")))
            (mkdir-p bin)
            (symlink (string-append fuzzel "/bin/fuzzel")
                     (string-append bin "/dmenu"))
            #t))))
    (inputs (list fuzzel))
    (home-page "https://codeberg.org/dnkl/fuzzel")
    (synopsis "dmenu drop-in replacement symlinks for fuzzel")
    (description "This package creates a @code{dmenu} symlink pointing
to the fuzzel application launcher, allowing scripts and tools that
expect dmenu to use fuzzel instead.")
    (license license:expat)))


;; doas-sudo-shim-k: sudo wrapper using doas with -k support
(define-public doas-sudo-shim-k
  (package
    (name "doas-sudo-shim-k")
    (version "0.1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fclivaz42/doas-sudo-shim")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sudo" "bin/sudo"))))
    (home-page "https://github.com/fclivaz42/doas-sudo-shim")
    (synopsis "sudo wrapper that delegates to doas with -k flag support")
    (description "Doas-sudo-shim provides a @code{sudo} command that
delegates to @code{doas}, including support for the @code{-k} flag
to ensure compatibility with tools like makepkg.")
    (license license:isc)))


;; waydroid: Android compatibility layer for Wayland
(define-public waydroid-pkg
  (package
    (name "waydroid")
    (version "1.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/waydroid/waydroid")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("waydroid" "bin/waydroid")
           ("data" "share/waydroid/data")
           ("tools" "share/waydroid/tools"))))
    (inputs (list python))
    (home-page "https://waydro.id/")
    (synopsis "container-based Android system on GNU/Linux")
    (description "Waydroid uses Linux namespaces to run a full Android
system in a container on GNU/Linux Wayland desktops, enabling Android
applications to run alongside native applications.")
    (license license:gpl3)))


;; openbsd-netcat-tls: OpenBSD netcat with TLS support
(define-public openbsd-netcat-tls
  (package
    (name "openbsd-netcat-tls")
    (version "1.234")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/openbsd-netcat-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libressl))
    (home-page "https://www.libressl.org")
    (synopsis "OpenBSD netcat implementation with TLS support")
    (description "The OpenBSD variant of netcat (nc) with TLS support
via LibreSSL, providing secure TCP/UDP network connections and
the full functionality of the original OpenBSD netcat.")
    (license license:isc)))


;; dash-static-musl: statically linked POSIX shell
(define-public dash-static-musl
  (package
    (name "dash-static-musl")
    (version "0.5.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://gondor.apana.org.au/~herbert/dash/files/dash-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "--enable-static"
              (string-append "LDFLAGS=-static"))))
    (home-page "http://gondor.apana.org.au/~herbert/dash/")
    (synopsis "small POSIX-compliant shell, statically linked")
    (description "Dash is the Debian Almquist Shell, a POSIX-compliant
shell that aims to be as small as possible.  This version is statically
linked for use in minimal environments and initramfs.")
    (license license:bsd-3)))


;; os-prober-btrfs: OS detection with btrfs support
(define-public os-prober-btrfs
  (package
    (name "os-prober-btrfs")
    (version "1.84")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://salsa.debian.org/installer-team/os-prober/-/archive/"
             version "/os-prober-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (install-file "os-prober" (string-append out "/bin"))
                (install-file "linux-boot-prober"
                              (string-append out "/bin"))))))))
    (home-page "https://joeyh.name/code/os-prober/")
    (synopsis "utility to detect other operating systems with btrfs support")
    (description "Os-prober detects other operating systems on a set of
drives, useful for bootloader configuration.  This version includes
patches for btrfs filesystem support and other fixes.")
    (license license:gpl3+)))


;; caddy-cloudflare-l4: Caddy with Cloudflare DNS and L4 plugins
(define-public caddy-cloudflare-l4
  (package
    (name "caddy-cloudflare-l4")
    (version "2.11.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/caddyserver/caddy/releases/download/v"
             version "/caddy_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("caddy" "bin/caddy"))))
    (home-page "https://github.com/caddyserver/caddy")
    (synopsis "Caddy web server with Cloudflare DNS and L4 plugins")
    (description "Caddy is a powerful, extensible HTTP/2 web server with
automatic HTTPS.  This build includes the Cloudflare DNS provider and
Layer 4 (TCP/UDP) proxy plugins.")
    (license license:asl2.0)))


;; gopass-secret-service: D-Bus Secret Service for GoPass
(define-public gopass-secret-service
  (package
    (name "gopass-secret-service")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nikicat/gopass-secret-service")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (invoke "go" "build" "-o" "gopass-secret-service" ".")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (install-file "gopass-secret-service"
                            (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nikicat/gopass-secret-service")
    (synopsis "D-Bus Secret Service provider backed by GoPass")
    (description "Gopass-secret-service implements the D-Bus Secret
Service specification using GoPass as its backend, allowing desktop
applications to access GoPass secrets transparently.")
    (license license:expat)))


;; fftw-amd: AMD-optimized FFTW
(define-public fftw-amd
  (package
    (name "fftw-amd")
    (version "3.3.10amd5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/amd/amd-fftw")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DENABLE_AVX2=ON"
              "-DENABLE_AMD_OPT=ON")))
    (home-page "https://github.com/amd/amd-fftw/")
    (synopsis "AMD-optimized FFTW library for discrete Fourier transforms")
    (description "AMD FFTW is a fork of FFTW optimized for AMD Ryzen and
EPYC processors, with performance improvements for AVX2 and related
instruction set extensions.")
    (license license:gpl2)))

