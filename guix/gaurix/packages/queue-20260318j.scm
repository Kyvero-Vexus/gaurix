(define-module (gaurix packages queue-20260318j)
  #:use-module (guix packages)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages llvm)
  #:export (qqc2-desktop-style5
            clangd-bin))

(define-public qqc2-desktop-style5
  (package
    (inherit qqc2-desktop-style)
    (name "qqc2-desktop-style5")))

(define-public clangd-bin
  (package
    (inherit clang-toolchain)
    (name "clangd-bin")
    (synopsis "Compatibility package name for clangd from LLVM toolchain")
    (description
     "Compatibility package that provides clangd via Guix's clang-toolchain\nunder the AUR-style package name clangd-bin.")))
