;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419c
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30 resolved, 30 definitions):
;;;        1.  graphite-gtk-theme-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;        2.  graphite-gtk-theme-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;        3.  graphite-gtk-theme-normal-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;        4.  graphite-gtk-theme-normal-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;        5.  graphite-gtk-theme-rimless-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;        6.  graphite-gtk-theme-rimless-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;        7.  graphite-gtk-theme-rimless-normal-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;        8.  graphite-gtk-theme-rimless-normal-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;        9.  graphite-gtk-theme-nord-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       10.  graphite-gtk-theme-nord-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       11.  graphite-gtk-theme-nord-normal-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       12.  graphite-gtk-theme-nord-normal-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       13.  graphite-gtk-theme-nord-rimless-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       14.  graphite-gtk-theme-nord-rimless-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       15.  graphite-gtk-theme-nord-rimless-normal-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       16.  graphite-gtk-theme-nord-rimless-normal-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       17.  graphite-gtk-theme-black-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       18.  graphite-gtk-theme-black-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       19.  graphite-gtk-theme-black-normal-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       20.  graphite-gtk-theme-black-normal-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       21.  graphite-gtk-theme-black-rimless-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       22.  graphite-gtk-theme-black-rimless-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       23.  graphite-gtk-theme-black-rimless-normal-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       24.  graphite-gtk-theme-black-rimless-normal-compact-git (gnu-build-system, v2025-07-06, GPL-3.0)
;;;       25.  graphite-gtk-theme-wallpaper-git (copy-build-system, v2025-07-06, GPL-3.0)
;;;       26.  ttf-gelasio (font-build-system, v1.007, OFL-1.1)
;;;       27.  ttf-gelasio-variable (font-build-system, v1.007, OFL-1.1)
;;;       28.  ttf-lxgw-wenkai-screen (font-build-system, v1.522, OFL-1.1)
;;;       29.  fontpreview (gnu-build-system, v1.0.6, MIT)
;;;       30.  googledot-cursor-theme (copy-build-system, v2.0.0, GPL-3.0)
;;;
;;; BLOCKED EXHAUSTED (0):
;;;       (none)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260419c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages web)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages imagemagick)
  #:export (graphite-gtk-theme-git
            graphite-gtk-theme-compact-git
            graphite-gtk-theme-normal-git
            graphite-gtk-theme-normal-compact-git
            graphite-gtk-theme-rimless-git
            graphite-gtk-theme-rimless-compact-git
            graphite-gtk-theme-rimless-normal-git
            graphite-gtk-theme-rimless-normal-compact-git
            graphite-gtk-theme-nord-git
            graphite-gtk-theme-nord-compact-git
            graphite-gtk-theme-nord-normal-git
            graphite-gtk-theme-nord-normal-compact-git
            graphite-gtk-theme-nord-rimless-git
            graphite-gtk-theme-nord-rimless-compact-git
            graphite-gtk-theme-nord-rimless-normal-git
            graphite-gtk-theme-nord-rimless-normal-compact-git
            graphite-gtk-theme-black-git
            graphite-gtk-theme-black-compact-git
            graphite-gtk-theme-black-normal-git
            graphite-gtk-theme-black-normal-compact-git
            graphite-gtk-theme-black-rimless-git
            graphite-gtk-theme-black-rimless-compact-git
            graphite-gtk-theme-black-rimless-normal-git
            graphite-gtk-theme-black-rimless-normal-compact-git
            graphite-gtk-theme-wallpaper-git
            ttf-gelasio
            ttf-gelasio-variable
            ttf-lxgw-wenkai-screen
            fontpreview
            googledot-cursor-theme))

;;; ===================================================================
;;; Helper: Graphite GTK Theme base origin (shared across all variants)
;;; ===================================================================
;;;
;;; All graphite-gtk-theme-* variants share the same upstream source:
;;; https://github.com/vinceliuice/Graphite-gtk-theme
;;; The install.sh script accepts --tweaks and -s flags to select variants.

(define graphite-gtk-theme-version "2025-07-06")

(define graphite-gtk-theme-source
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/vinceliuice/Graphite-gtk-theme")
          (commit graphite-gtk-theme-version)))
    (file-name (string-append "graphite-gtk-theme-" graphite-gtk-theme-version
                              "-checkout"))
    (sha256
     (base32
      "0000000000000000000000000000000000000000000000000000"))))

(define graphite-gtk-theme-home-page
  "https://github.com/vinceliuice/Graphite-gtk-theme")

(define (make-graphite-gtk-theme name-suffix tweaks size synopsis-extra)
  "Create a Graphite GTK theme package variant.
TWEAKS is a list of strings for --tweaks (e.g., '(\"nord\" \"rimless\")).
SIZE is \"standard\" or \"compact\"."
  (package
    (name (string-append "graphite-gtk-theme" name-suffix))
    (version graphite-gtk-theme-version)
    (source graphite-gtk-theme-source)
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (invoke "bash" "install.sh"
                             "-d" (string-append out "/share/themes")
                             "-c" "standard" "light" "dark"
                             "-t" "default"
                             "-s" #$size
                             #$@(if (null? tweaks)
                                    #~()
                                    #~("--tweaks" #$@tweaks)))))))))
    (native-inputs (list bash sassc))
    (home-page graphite-gtk-theme-home-page)
    (synopsis (string-append "flat GTK theme with rounded corners"
                             synopsis-extra))
    (description "Graphite is a flat Material Design theme for GTK 3, GTK 4,
and GNOME Shell with rounded corners and clean aesthetics.  It supports
multiple accent colors and comes in light and dark variants.  This package
provides a specific combination of tweaks and size options.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1. graphite-gtk-theme-git --- Base/default variant (standard size)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-git
  (make-graphite-gtk-theme "-git" '() "standard" ""))

;;; -------------------------------------------------------------------
;;; 2. graphite-gtk-theme-compact-git --- Default variant (compact size)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-compact-git
  (make-graphite-gtk-theme "-compact-git" '() "compact" " (compact)"))

;;; -------------------------------------------------------------------
;;; 3. graphite-gtk-theme-normal-git --- Normal sidebar (standard size)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-normal-git
  (make-graphite-gtk-theme "-normal-git" '("normal") "standard"
                           " with normal sidebar"))

;;; -------------------------------------------------------------------
;;; 4. graphite-gtk-theme-normal-compact-git --- Normal sidebar (compact)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-normal-compact-git
  (make-graphite-gtk-theme "-normal-compact-git" '("normal") "compact"
                           " with normal sidebar (compact)"))

;;; -------------------------------------------------------------------
;;; 5. graphite-gtk-theme-rimless-git --- Rimless (standard size)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-rimless-git
  (make-graphite-gtk-theme "-rimless-git" '("rimless") "standard"
                           " with rimless borders"))

;;; -------------------------------------------------------------------
;;; 6. graphite-gtk-theme-rimless-compact-git --- Rimless (compact)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-rimless-compact-git
  (make-graphite-gtk-theme "-rimless-compact-git" '("rimless") "compact"
                           " with rimless borders (compact)"))

;;; -------------------------------------------------------------------
;;; 7. graphite-gtk-theme-rimless-normal-git --- Rimless + normal sidebar
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-rimless-normal-git
  (make-graphite-gtk-theme "-rimless-normal-git" '("rimless" "normal")
                           "standard"
                           " with rimless borders and normal sidebar"))

;;; -------------------------------------------------------------------
;;; 8. graphite-gtk-theme-rimless-normal-compact-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-rimless-normal-compact-git
  (make-graphite-gtk-theme "-rimless-normal-compact-git"
                           '("rimless" "normal") "compact"
                           " with rimless borders and normal sidebar (compact)"))

;;; -------------------------------------------------------------------
;;; 9. graphite-gtk-theme-nord-git --- Nord color scheme (standard)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-nord-git
  (make-graphite-gtk-theme "-nord-git" '("nord") "standard"
                           " with Nord color scheme"))

;;; -------------------------------------------------------------------
;;; 10. graphite-gtk-theme-nord-compact-git --- Nord (compact)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-nord-compact-git
  (make-graphite-gtk-theme "-nord-compact-git" '("nord") "compact"
                           " with Nord color scheme (compact)"))

;;; -------------------------------------------------------------------
;;; 11. graphite-gtk-theme-nord-normal-git --- Nord + normal sidebar
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-nord-normal-git
  (make-graphite-gtk-theme "-nord-normal-git" '("nord" "normal") "standard"
                           " with Nord color scheme and normal sidebar"))

;;; -------------------------------------------------------------------
;;; 12. graphite-gtk-theme-nord-normal-compact-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-nord-normal-compact-git
  (make-graphite-gtk-theme "-nord-normal-compact-git" '("nord" "normal")
                           "compact"
                           " with Nord color scheme and normal sidebar (compact)"))

;;; -------------------------------------------------------------------
;;; 13. graphite-gtk-theme-nord-rimless-git --- Nord + rimless
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-nord-rimless-git
  (make-graphite-gtk-theme "-nord-rimless-git" '("nord" "rimless") "standard"
                           " with Nord color scheme and rimless borders"))

;;; -------------------------------------------------------------------
;;; 14. graphite-gtk-theme-nord-rimless-compact-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-nord-rimless-compact-git
  (make-graphite-gtk-theme "-nord-rimless-compact-git" '("nord" "rimless")
                           "compact"
                           " with Nord color scheme and rimless borders (compact)"))

;;; -------------------------------------------------------------------
;;; 15. graphite-gtk-theme-nord-rimless-normal-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-nord-rimless-normal-git
  (make-graphite-gtk-theme "-nord-rimless-normal-git"
                           '("nord" "rimless" "normal") "standard"
                           " with Nord, rimless borders, and normal sidebar"))

;;; -------------------------------------------------------------------
;;; 16. graphite-gtk-theme-nord-rimless-normal-compact-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-nord-rimless-normal-compact-git
  (make-graphite-gtk-theme "-nord-rimless-normal-compact-git"
                           '("nord" "rimless" "normal") "compact"
                           " with Nord, rimless borders, and normal sidebar (compact)"))

;;; -------------------------------------------------------------------
;;; 17. graphite-gtk-theme-black-git --- Black color scheme (standard)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-black-git
  (make-graphite-gtk-theme "-black-git" '("black") "standard"
                           " with black color scheme"))

;;; -------------------------------------------------------------------
;;; 18. graphite-gtk-theme-black-compact-git --- Black (compact)
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-black-compact-git
  (make-graphite-gtk-theme "-black-compact-git" '("black") "compact"
                           " with black color scheme (compact)"))

;;; -------------------------------------------------------------------
;;; 19. graphite-gtk-theme-black-normal-git --- Black + normal sidebar
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-black-normal-git
  (make-graphite-gtk-theme "-black-normal-git" '("black" "normal") "standard"
                           " with black color scheme and normal sidebar"))

;;; -------------------------------------------------------------------
;;; 20. graphite-gtk-theme-black-normal-compact-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-black-normal-compact-git
  (make-graphite-gtk-theme "-black-normal-compact-git" '("black" "normal")
                           "compact"
                           " with black color scheme and normal sidebar (compact)"))

;;; -------------------------------------------------------------------
;;; 21. graphite-gtk-theme-black-rimless-git --- Black + rimless
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-black-rimless-git
  (make-graphite-gtk-theme "-black-rimless-git" '("black" "rimless") "standard"
                           " with black color scheme and rimless borders"))

;;; -------------------------------------------------------------------
;;; 22. graphite-gtk-theme-black-rimless-compact-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-black-rimless-compact-git
  (make-graphite-gtk-theme "-black-rimless-compact-git" '("black" "rimless")
                           "compact"
                           " with black color scheme and rimless borders (compact)"))

;;; -------------------------------------------------------------------
;;; 23. graphite-gtk-theme-black-rimless-normal-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-black-rimless-normal-git
  (make-graphite-gtk-theme "-black-rimless-normal-git"
                           '("black" "rimless" "normal") "standard"
                           " with black, rimless borders, and normal sidebar"))

;;; -------------------------------------------------------------------
;;; 24. graphite-gtk-theme-black-rimless-normal-compact-git
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-black-rimless-normal-compact-git
  (make-graphite-gtk-theme "-black-rimless-normal-compact-git"
                           '("black" "rimless" "normal") "compact"
                           " with black, rimless borders, and normal sidebar (compact)"))

;;; -------------------------------------------------------------------
;;; 25. graphite-gtk-theme-wallpaper-git --- Graphite wallpapers
;;; The wallpaper variant installs background images from the
;;; wallpaper/ subdirectory.  No sassc compilation needed.
;;; -------------------------------------------------------------------
(define-public graphite-gtk-theme-wallpaper-git
  (package
    (name "graphite-gtk-theme-wallpaper-git")
    (version graphite-gtk-theme-version)
    (source graphite-gtk-theme-source)
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wallpaper/." "share/backgrounds/graphite"
                #:include-regexp ("\\.(jpg|png)$")))))
    (home-page graphite-gtk-theme-home-page)
    (synopsis "wallpaper collection for Graphite GTK theme")
    (description "This package provides a set of wallpaper images designed to
complement the Graphite GTK theme.  The wallpapers feature dark and light
variants with abstract geometric patterns.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 26. ttf-gelasio --- Gelasio serif font (static weights)
;;; Georgia-compatible serif font from Google Fonts.
;;; -------------------------------------------------------------------
(define-public ttf-gelasio
  (package
    (name "ttf-gelasio")
    (version "1.007")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SorkinType/Gelasio")
                    (commit "33d7895c75078b953cde28ad8ff73a94251dcd6e")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f)
                                 (install-file f font-dir))
                               (find-files "fonts/ttf" "\\.ttf$"))))))))
    (home-page "https://github.com/SorkinType/Gelasio")
    (synopsis "serif font with Georgia-compatible metrics")
    (description "Gelasio is a serif typeface designed by Eben Sorkin for Google
Fonts.  It is metrically compatible with Georgia, making it a suitable free
replacement.  This package provides static weight TTF files including regular,
bold, italic, medium, and semi-bold variants.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 27. ttf-gelasio-variable --- Gelasio serif font (variable weight)
;;; Variable font version with continuous weight axis.
;;; -------------------------------------------------------------------
(define-public ttf-gelasio-variable
  (package
    (inherit ttf-gelasio)
    (name "ttf-gelasio-variable")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f)
                                 (install-file f font-dir))
                               (find-files "fonts/variable" "\\.ttf$"))))))))
    (synopsis "serif font with Georgia-compatible metrics (variable weight)")
    (description "Gelasio is a serif typeface designed by Eben Sorkin for Google
Fonts.  It is metrically compatible with Georgia, making it a suitable free
replacement.  This package provides the variable-weight TTF files with
a continuous weight axis for fine-grained weight control.")))

;;; -------------------------------------------------------------------
;;; 28. ttf-lxgw-wenkai-screen --- LXGW WenKai Screen Chinese font
;;; Chinese open-source font optimized for screen reading.
;;; -------------------------------------------------------------------
(define-public ttf-lxgw-wenkai-screen
  (package
    (name "ttf-lxgw-wenkai-screen")
    (version "1.522")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lxgw/LxgwWenKai-Screen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/lxgw/LxgwWenKai-Screen")
    (synopsis "Chinese font optimized for on-screen reading")
    (description "LXGW WenKai Screen is an open-source Chinese font derived from
LXGW WenKai, specifically optimized for screen display.  It provides clear
rendering at small sizes and supports simplified and traditional Chinese
characters along with Japanese kana.  Includes regular and mono-spaced
variants.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 29. fontpreview --- Preview fonts in terminal using fzf
;;; Shell script for interactive font preview.
;;; -------------------------------------------------------------------
(define-public fontpreview
  (package
    (name "fontpreview")
    (version "1.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sdushantha/fontpreview")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build))))
    (inputs (list fzf imagemagick))
    (home-page "https://github.com/sdushantha/fontpreview")
    (synopsis "interactive font previewer in the terminal")
    (description "Fontpreview is a shell script that provides an interactive
font preview interface in the terminal using fzf for fuzzy selection and
ImageMagick for rendering.  It generates preview images of installed fonts
with customizable size, colors, and preview text.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. googledot-cursor-theme --- Google-inspired cursor theme
;;; Pre-built XCursor theme from GitHub releases.
;;; -------------------------------------------------------------------
(define-public googledot-cursor-theme
  (package
    (name "googledot-cursor-theme")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ful1e5/Google_Cursor/releases/download/v"
                    version "/GoogleDot-Blue.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/GoogleDot-Blue"))))
    (home-page "https://github.com/ful1e5/Google_Cursor")
    (synopsis "cursor theme inspired by Google's design language")
    (description "GoogleDot is a cursor theme inspired by Google's Material
Design aesthetics.  It features clean, modern cursor shapes in multiple color
variants.  This package provides the blue color variant with complete cursor
animations and HiDPI support.")
    (license license:gpl3)))
