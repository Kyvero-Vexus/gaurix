;;; Resolved packages for blocked-tree worker w06 (cron-c79f127f).
(define-module (gaurix packages queue-20260402blocked-c79f127f-w06)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages qt)
  #:export (verify-lib
            libuvc
            qt5-connectivity
            osu-mime
            python-aiolimiter))

(define (rename-package p new-name)
  (package
    (inherit p)
    (name new-name)))

(define-public verify-lib
  (package
    (name "verify-lib")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://gitlab.com/fkzys/verify-lib/-/archive/v0.0.4/verify-lib-v0.0.4.tar.gz")
       (sha256
        (base32 "0kg9w023v439vy6in4q21la56ann9npydn00ny45sbfx9mkh8pm9"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "make"
                      (string-append "CC=" #$(cc-for-target))
                      (string-append "PREFIX=" (assoc-ref outputs "out"))
                      "install"))))))
    (home-page "https://gitlab.com/fkzys/verify-lib")
    (synopsis "Validate shell library files before sourcing")
    (description
     "verify-lib provides a small compiled checker used to validate shell
library files before sourcing them.")
    (license license:agpl3+)))

(define-public libuvc
  (package
    (name "libuvc")
    (version "0.0.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/libuvc/libuvc/archive/refs/tags/v0.0.7.tar.gz")
       (sha256
        (base32 "0wpfhsd95zdi3rirdfnp06vpb7rzs3xxrjp6zg6hqpdd4fbsfsvw"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list pkg-config))
    (inputs
     (list libjpeg-turbo
           libusb))
    (home-page "https://libuvc.github.io/libuvc/")
    (synopsis "Cross-platform library for USB video devices")
    (description
     "libuvc is a cross-platform library that provides direct access to USB
Video Class cameras.")
    (license license:bsd-3)))

(define-public qt5-connectivity
  (rename-package qtconnectivity-5 "qt5-connectivity"))

(define-public osu-mime
  (package
    (name "osu-mime")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osu-mime.tar.gz")
       (sha256
        (base32 "1ifa0pfynxw7ab4p615gwm6ff7ml161521vw1s5y35m1wcn5cywb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("osu-file-extensions.xml"
           "share/mime/packages/osu-file-extensions.xml"))))
    (home-page "https://aur.archlinux.org/packages/osu-mime")
    (synopsis "MIME definitions for osu! file formats")
    (description
     "osu-mime installs shared-mime-info XML definitions for osu! beatmap,
replay, storyboard, and skin-related file formats.")
    (license license:agpl3)))

(define-public python-aiolimiter
  (package
    (name "python-aiolimiter")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://files.pythonhosted.org/packages/source/a/aiolimiter/"
         "aiolimiter-"
         version
         ".tar.gz"))
       (sha256
        (base32 "1afcnm8p8r0lv2hs24jma08m1lfl1910b8aj4a1rwpc53bm3fap0"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-poetry-core))
    (home-page "https://github.com/mjpieters/aiolimiter")
    (synopsis "Efficient rate limiter for asyncio")
    (description
     "Aiolimiter provides an efficient asynchronous rate limiter for Python
asyncio applications.")
    (license license:expat)))
