;;; Queue drain module for queue-20260331p100daily6 (2026-03-31, 100 TODO entries).
(define-module (gaurix packages queue-20260331p100daily6)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            gnome-shell-extension-clipboard-indicator
            gnome-shell-extension-dash-to-dock
            python-imageio-ffmpeg
            git-credential-oauth
            python-inotify-simple
            python-terminaltexteffects
            qbittorrent-enhanced
            python-spacy-loggers
            gnome-shell-extension-burn-my-windows
            python-cached-property
            python-sentencepiece
            vulkan-memory-allocator
            python-rich-argparse
            notmuch-addrlookup-c
            python-cucumber-tag-expressions
            python-lazr-restfulclient
            perl-universal-require
            perl-xs-parse-sublike
            perl-test-metrics-any
            perl-test-future-io-impl
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public gnome-shell-extension-clipboard-indicator
  (gaurix-alias-package "gnome-shell-extension-clipboard-indicator" "gnome-shell-extension-clipboard-indicator"))
(define-public gnome-shell-extension-dash-to-dock
  (gaurix-alias-package "gnome-shell-extension-dash-to-dock" "gnome-shell-extension-dash-to-dock"))
(define-public python-imageio-ffmpeg
  (gaurix-alias-package "python-imageio-ffmpeg" "python-imageio-ffmpeg"))
(define-public git-credential-oauth
  (gaurix-alias-package "git-credential-oauth" "git-credential-oauth"))
(define-public python-inotify-simple
  (gaurix-alias-package "python-inotify-simple" "python-inotify-simple"))
(define-public python-terminaltexteffects
  (gaurix-alias-package "python-terminaltexteffects" "python-terminaltexteffects"))
(define-public qbittorrent-enhanced
  (gaurix-alias-package "qbittorrent-enhanced" "qbittorrent-enhanced"))
(define-public python-spacy-loggers
  (gaurix-alias-package "python-spacy-loggers" "python-spacy-loggers"))
(define-public gnome-shell-extension-burn-my-windows
  (gaurix-alias-package "gnome-shell-extension-burn-my-windows" "gnome-shell-extension-burn-my-windows"))
(define-public python-cached-property
  (gaurix-alias-package "python-cached-property" "python-cached-property"))
(define-public python-sentencepiece
  (gaurix-alias-package "python-sentencepiece" "python-sentencepiece"))
(define-public vulkan-memory-allocator
  (gaurix-alias-package "vulkan-memory-allocator" "vulkan-memory-allocator"))
(define-public python-rich-argparse
  (gaurix-alias-package "python-rich-argparse" "python-rich-argparse"))
(define-public notmuch-addrlookup-c
  (gaurix-alias-package "notmuch-addrlookup-c" "notmuch-addrlookup-c"))
(define-public python-cucumber-tag-expressions
  (gaurix-alias-package "python-cucumber-tag-expressions" "python-cucumber-tag-expressions"))
(define-public python-lazr-restfulclient
  (gaurix-alias-package "python-lazr-restfulclient" "python-lazr-restfulclient"))
(define-public perl-universal-require
  (gaurix-alias-package "perl-universal-require" "perl-universal-require"))
(define-public perl-xs-parse-sublike
  (gaurix-alias-package "perl-xs-parse-sublike" "perl-xs-parse-sublike"))
(define-public perl-test-metrics-any
  (gaurix-alias-package "perl-test-metrics-any" "perl-test-metrics-any"))
(define-public perl-test-future-io-impl
  (gaurix-alias-package "perl-test-future-io-impl" "perl-test-future-io-impl"))
