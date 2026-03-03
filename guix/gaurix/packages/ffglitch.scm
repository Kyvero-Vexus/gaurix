(define-module (gaurix packages ffglitch)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages compression))

(define-public ffglitch
  (package
    (name "ffglitch")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ffglitch.org/pub/src/"
                           name "-" version ".tar.xz"))
       (sha256
        (base32 "0vm4bd1al5ixsc8577970mjn25mb9j5vwf1hwi32h10vrvabpv3s"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "--disable-doc"
              "--enable-gpl"
              "--enable-static"
              "--disable-shared"
              "--disable-autodetect"
              "--disable-iconv"
              "--enable-zlib"
              "--enable-libxvid"
              "--enable-rtmidi"
              "--enable-libzmq"
              "--enable-sdl2"
              "--enable-libxcb"
              "--enable-libdrm")
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key configure-flags #:allow-other-keys)
              (apply invoke "sh" "./configure" configure-flags)))
          (add-after 'build 'build-qjs
            (lambda _
              (invoke "make" "qjs")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (for-each (lambda (prog)
                            (install-file prog bin))
                          '("ffedit" "ffgac" "fflive" "qjs"))))))))
    (native-inputs
     (list nasm))
    (inputs
     (list libdrm
           libxau
           libxcb
           libxdmcp
           rtmidi
           sdl2
           xvid
           zeromq
           zlib))
    (home-page "https://ffglitch.org")
    (synopsis "FFmpeg fork for glitching")
    (description
     "FFglitch is a creative FFmpeg fork focused on glitch workflows.  This
package installs the ffedit, ffgac, fflive, and qjs command-line tools.")
    (license license:gpl3)))
