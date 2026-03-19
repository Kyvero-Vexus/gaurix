(define-module (gaurix packages queue-20260319k)
  #:use-module (guix packages)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages wine)
  #:export (wine32
            niri-wip-git
            gdk-pixbuf2-noglycin
            gdk-pixbuf2-noglycin-docs
            icu76))

(define-public wine32
  (package
    (inherit wine)
    (name "wine32")
    (synopsis "Compatibility package name for Wine")
    (description
     "Compatibility package that provides Wine under the AUR-style package
name wine32.")))

(define-public niri-wip-git
  (package
    (inherit niri)
    (name "niri-wip-git")
    (synopsis "Compatibility package name for niri")
    (description
     "Compatibility package that provides niri under the AUR-style package
name niri-wip-git.")))

(define-public gdk-pixbuf2-noglycin
  (package
    (inherit gdk-pixbuf)
    (name "gdk-pixbuf2-noglycin")
    (synopsis "Compatibility package name for gdk-pixbuf")
    (description
     "Compatibility package that provides gdk-pixbuf under the AUR-style
package name gdk-pixbuf2-noglycin.")))

(define-public gdk-pixbuf2-noglycin-docs
  (package
    (inherit gdk-pixbuf)
    (name "gdk-pixbuf2-noglycin-docs")
    (synopsis "Compatibility package name for gdk-pixbuf docs variant")
    (description
     "Compatibility package that provides gdk-pixbuf under the AUR-style
package name gdk-pixbuf2-noglycin-docs.  Guix does not provide a separate
standalone docs package for this variant.")))

(define-public icu76
  (package
    (inherit icu4c)
    (name "icu76")
    (synopsis "Compatibility package name for ICU")
    (description
     "Compatibility package that provides ICU under the AUR-style package
name icu76.")))
