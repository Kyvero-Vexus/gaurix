(define-module (gaurix packages queue-20260318)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (fcitx5-lotus-bin
            emailbook-rs-bin
            aeroftp-bin
            traur-bin))

(define* (make-binary-repack-package name version uri hash cmd #:key (archive-type 'tar))
  (package
    (name name)
    (version version)
    (source
     (origin
       (method url-fetch)
       (uri uri)
       (sha256 (base32 hash))))
    (build-system trivial-build-system)
    (native-inputs (list coreutils findutils tar gzip xz unzip))
    (arguments
     (list
      #:modules '((guix build utils) (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils) (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (work (string-append (getcwd) "/unpack"))
                 (opt (string-append out "/opt/" #$name))
                 (bin (string-append out "/bin")))
            (mkdir-p work)
            (cond
             ((eq? '#$archive-type 'zip) (invoke unzip "-q" src "-d" work))
             ((eq? '#$archive-type 'appimage)
              (mkdir-p (string-append work "/app"))
              (copy-file src (string-append work "/app/" #$cmd))
              (chmod (string-append work "/app/" #$cmd) #o755))
             (else (invoke tar "-xf" src "-C" work)))
            (let* ((entries (scandir work (lambda (x) (not (member x '("." ".."))))))
                   (top (if (and (= (length entries) 1)
                                 (file-is-directory? (string-append work "/" (car entries))))
                            (string-append work "/" (car entries))
                            work)))
              (mkdir-p opt)
              (for-each
               (lambda (n)
                 (let ((p (string-append top "/" n)))
                   (if (file-is-directory? p)
                       (copy-recursively p (string-append opt "/" n))
                       (install-file p opt))))
               (scandir top (lambda (x) (not (member x '("." ".."))))))
              (mkdir-p bin)
              (let* ((preferred (string-append opt "/" #$cmd))
                     (cands (find-files opt (lambda (f st)
                                              (and (eq? 'regular (stat:type st))
                                                   (or (access? f X_OK)
                                                       (string-suffix? #$cmd f))))))
                     (chosen (if (file-exists? preferred) preferred (and (pair? cands) (car cands)))))
                (when chosen
                  (chmod chosen #o755)
                  (symlink chosen (string-append bin "/" #$cmd)))))))))
    (home-page uri)
    (synopsis "Binary repackaged application")
    (description "Binary repackaging from upstream release artifacts with fixed source URI and hash.")
    (license license:expat)))

(define-public fcitx5-lotus-bin
  (make-binary-repack-package
   "fcitx5-lotus-bin" "1.4.2"
   "https://github.com/LotusInputMethod/fcitx5-lotus/releases/download/v1.4.2/fcitx5-lotus-v1.4.2-x86_64-archlinux.tar.zst"
   "0f1j09y2ilapjpy88nqfc0w64lyx4s1b89i22i9wakanx49f1avp"
   "fcitx5-lotus"
   #:archive-type 'tar))

(define-public emailbook-rs-bin
  (make-binary-repack-package
   "emailbook-rs-bin" "0.4.0"
   "https://github.com/aik2mlj/emailbook-rs/releases/download/v0.4.0/emailbook-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
   "07l6vcvwjfip602a926d7inwwidps7083v57bq62app8ibr8gwzy"
   "emailbook-rs"
   #:archive-type 'tar))

(define-public aeroftp-bin
  (make-binary-repack-package
   "aeroftp-bin" "2.9.4"
   "https://github.com/axpnet/aeroftp/releases/download/v2.9.4/AeroFTP_2.9.4_amd64.AppImage"
   "1pwgfq3fgqcrxj3yh5qzhcl5nv4r914imxmr6icp38308vhx8xc4"
   "aeroftp"
   #:archive-type 'appimage))

(define-public traur-bin
  (make-binary-repack-package
   "traur-bin" "0.4.1"
   "https://github.com/Sohimaster/traur/releases/download/v0.4.1/traur-0.4.1-x86_64.tar.gz"
   "09gzdrp2fjj1z5x39s1zyr927p5fdwv10xwyq855vsz68ygr2dzp"
   "traur"
   #:archive-type 'tar))
