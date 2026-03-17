(define-module (gaurix packages queue-20260317e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (aws-sam-cli-bin
            ludusavi-bin
            lazydocker-bin))

(define* (make-generic-bin-package name version uri hash cmd #:key (archive-type 'tar))
  (package
    (name name)
    (version version)
    (source
     (origin
       (method url-fetch)
       (uri uri)
       (sha256 (base32 hash))))
    (build-system trivial-build-system)
    (native-inputs
     (append (list coreutils findutils tar gzip xz unzip)
             (if (eq? archive-type 'zip) '() '())))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (work (string-append (getcwd) "/unpack"))
                 (opt (string-append out "/opt/" #$name))
                 (bin (string-append out "/bin")))
            (mkdir-p work)
            (if (eq? '#$archive-type 'zip)
                (invoke unzip "-q" src "-d" work)
                (invoke tar "-xf" src "-C" work))
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
    (description
     "Binary repackaging from upstream release artifacts with fixed source URI and hash.")
    (license license:asl2.0)))

(define-public aws-sam-cli-bin
  (make-generic-bin-package
   "aws-sam-cli-bin" "1.155.2"
   "https://github.com/aws/aws-sam-cli/releases/download/v1.155.2/aws-sam-cli-linux-x86_64.zip"
   "0x25y8c2v8wlibb5hnlzimcvihyd735sx7cax0dxhqcjpl2h2x9h"
   "sam"
   #:archive-type 'zip))

(define-public ludusavi-bin
  (make-generic-bin-package
   "ludusavi-bin" "0.30.0"
   "https://github.com/mtkennerly/ludusavi/releases/download/v0.30.0/ludusavi-v0.30.0-linux.tar.gz"
   "10v0k3vzmigdpj1pnpnfgh4q2nl897svzd8736fpzdl0gzd3g55w"
   "ludusavi"))

(define-public lazydocker-bin
  (make-generic-bin-package
   "lazydocker-bin" "0.25.0"
   "https://github.com/jesseduffield/lazydocker/releases/download/v0.25.0/lazydocker_0.25.0_Linux_x86_64.tar.gz"
   "0ggz698s1ycb66vk89x22d6v7i7ry60ykxgmd00zaji1id2v25ww"
   "lazydocker"))
