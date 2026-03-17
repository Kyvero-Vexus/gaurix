(define-module (gaurix packages queue-20260317)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (qbz-bin
            pixelorama-bin
            vm-curator-bin
            ookla-speedtest-bin
            wayscriber-bin
            rate-mirrors-bin
            mcat-bin
            symfony-cli-bin
            eqonomize-bin
            setwall-bin
            credit-bin
            wander-bin
            tpack-bin
            lore-bin
            lazyllama-bin
            kl-bin
            jcode-bin
            dumber-browser-bin
            llmfit-bin
            tuios-bin))

(define* (make-generic-tarball-bin-package name version uri hash cmd)
  (package
    (name name)
    (version version)
    (source
     (origin
       (method url-fetch)
       (uri uri)
       (sha256 (base32 hash))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip xz coreutils))
    (arguments
     (list
      #:modules '((guix build utils)
                  (srfi srfi-1)
                  (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (srfi srfi-1)
                       (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (work (string-append (getcwd) "/unpack"))
                 (opt (string-append out "/opt/" #$name))
                 (bin (string-append out "/bin")))
            (mkdir-p work)
            (invoke tar "-xf" src "-C" work)
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
    (synopsis (string-append name " binary package"))
    (description
     "Binary repackaging from upstream release artifacts with fixed source URI and hash.")
    (license #f)))

(define-public qbz-bin
  (make-generic-tarball-bin-package
   "qbz-bin" "1.1.20" "https://github.com/vicrodh/qbz/releases/download/v1.1.20/qbz_1.1.20_amd64.tar.gz" "0ickirr4a5i1bx2mk6f9hyrrxliry8bpw5pynqvwmgj8sdk2ficm" "qbz"))
(define-public pixelorama-bin
  (make-generic-tarball-bin-package
   "pixelorama-bin" "1.1.8" "https://github.com/Orama-Interactive/Pixelorama/releases/download/v1.1.8/Pixelorama-Linux-64bit.tar.gz" "0vmbs3vlnwsb2i26asy9l3yh252l10224m39ms0frjij11w3hziv" "pixelorama"))
(define-public vm-curator-bin
  (make-generic-tarball-bin-package
   "vm-curator-bin" "0.4.7" "https://github.com/mroboff/vm-curator/releases/download/v0.4.7/vm-curator-v0.4.7-linux-x86_64.tar.gz" "0mpf3g2g84xx33jjzmgy26pragkafbivxrrnjlds5ikdn9f09f8y" "vm-curator"))
(define-public ookla-speedtest-bin
  (make-generic-tarball-bin-package
   "ookla-speedtest-bin" "1.2.0" "https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz" "0mlhb5n59zwvxmizldrjz0ca0pdw5nqrmlvfss7j3jjzckawzvmp" "ookla-speedtest"))
(define-public wayscriber-bin
  (make-generic-tarball-bin-package
   "wayscriber-bin" "0.9.11" "https://github.com/devmobasa/wayscriber/releases/download/v0.9.11/wayscriber-v0.9.11-linux-x86_64.tar.gz" "1x3ni0i8p0hd6b1drzkg22h4wala7ak8a7rfp6r23kmz74qq1hp6" "wayscriber"))
(define-public rate-mirrors-bin
  (make-generic-tarball-bin-package
   "rate-mirrors-bin" "0.28.2" "https://github.com/westandskif/rate-mirrors/releases/download/v0.28.2/rate-mirrors-v0.28.2-x86_64-unknown-linux-musl.tar.gz" "1y25s8d956mf8qxvpmjgm27rmsc25xf443sz0jld3bmah0hlsjd6" "rate-mirrors"))
(define-public mcat-bin
  (make-generic-tarball-bin-package
   "mcat-bin" "0.4.6" "https://github.com/Skardyy/mcat/releases/download/v0.4.6/mcat-x86_64-unknown-linux-gnu.tar.xz" "19bjnprdg4339107apnkv1valwbi3fwlxqm2d0lqw2f7054mxp8l" "mcat"))
(define-public symfony-cli-bin
  (make-generic-tarball-bin-package
   "symfony-cli-bin" "5.16.1" "https://github.com/symfony-cli/symfony-cli/releases/download/v5.16.1/symfony-cli_linux_amd64.tar.gz" "182r0iw5802c3rlr69bdrhcdgbfcc93wg4v3y2gcj4w1aliwzdnb" "symfony-cli"))
(define-public eqonomize-bin
  (make-generic-tarball-bin-package
   "eqonomize-bin" "1.5.12" "https://github.com/Eqonomize/Eqonomize/releases/download/v1.5.12/eqonomize-1.5.12-x86_64.tar.gz" "0iyp6vz8dx9ki9hvg8lhimlx8xpgbmndz1c2qdl8iz86jpdmzfz8" "eqonomize"))
(define-public setwall-bin
  (make-generic-tarball-bin-package
   "setwall-bin" "1.2.0" "https://github.com/fosskers/rs-setwall/releases/download/v1.2.0/setwall-1.2.0-x86_64.tar.gz" "0ygcdw59f1iqycwsajkqrk9l002nlp5f5svz1d29gxpvlrkfrq98" "setwall"))
(define-public credit-bin
  (make-generic-tarball-bin-package
   "credit-bin" "1.4.0" "https://github.com/fosskers/credit/releases/download/v1.4.0/credit-1.4.0-x86_64.tar.gz" "0c1lp7jp1c7z851wr8fm9sras1q5wfjaya1ywvypzlkjks1dl8za" "credit"))
(define-public wander-bin
  (make-generic-tarball-bin-package
   "wander-bin" "1.1.0" "https://github.com/robinovitch61/wander/releases/download/v1.1.0/wander_1.1.0_Linux_x86_64.tar.gz" "07c2348k9b1178vd3kp0mad93yw6vr1l9k73cjd2yif5w9gmi8fi" "wander"))
(define-public tpack-bin
  (make-generic-tarball-bin-package
   "tpack-bin" "0.7.0" "https://github.com/tmuxpack/tpack/releases/download/v0.7.0/tpack_0.7.0_linux_amd64.tar.gz" "11pis0a1bxh4mgqzbfd075zgd6w165nnfaky4f2j0jpzm6a2pgl8" "tpack"))
(define-public lore-bin
  (make-generic-tarball-bin-package
   "lore-bin" "0.3.0" "https://github.com/robinovitch61/lore/releases/download/v0.3.0/lore_0.3.0_Linux_x86_64.tar.gz" "1dw6w05pddycv97nm4c21yd1121yga3rr6qdvm7glicgwl7m408h" "lore"))
(define-public lazyllama-bin
  (make-generic-tarball-bin-package
   "lazyllama-bin" "0.5.1" "https://github.com/Pommersche92/lazyllama/releases/download/v0.5.1/lazyllama-0.5.1-x86_64.tar.gz" "10fsd4zhx6sj9ric0vdds0xv5bq2i22k949mqap7n3bwfkjg2qz2" "lazyllama"))
(define-public kl-bin
  (make-generic-tarball-bin-package
   "kl-bin" "0.7.0" "https://github.com/robinovitch61/kl/releases/download/v0.7.0/kl_0.7.0_Linux_x86_64.tar.gz" "154vfvzsq692rnji3yz7747v48v49q9b655pxfk6fasm4bkxsx4n" "kl"))
(define-public jcode-bin
  (make-generic-tarball-bin-package
   "jcode-bin" "0.7.0" "https://github.com/1jehuang/jcode/releases/download/v0.7.0/jcode-linux-x86_64.tar.gz" "13mr35qlxs7p3ba4pd5nbfgpw542h86lssq8icfl3zkz69r70506" "jcode"))
(define-public dumber-browser-bin
  (make-generic-tarball-bin-package
   "dumber-browser-bin" "0.27.2" "https://github.com/bnema/dumber/releases/download/v0.27.2/dumber_linux_x86_64.tar.gz" "130xa8xdfrz80ls06v0zgywhgr08fd23xcb4yxlm4dd3lb13c6la" "dumber-browser"))
(define-public llmfit-bin
  (make-generic-tarball-bin-package
   "llmfit-bin" "0.7.4" "https://github.com/AlexsJones/llmfit/releases/download/v0.7.4/llmfit-v0.7.4-x86_64-unknown-linux-gnu.tar.gz" "0plz4rg6lz4qghpxbndgnwigdxsa2dpmj9y0jq08zwv12yaflagj" "llmfit"))
(define-public tuios-bin
  (make-generic-tarball-bin-package
   "tuios-bin" "0.6.0" "https://github.com/Gaurav-Gosain/tuios/releases/download/v0.6.0/tuios_0.6.0_Linux_x86_64.tar.gz" "1sz8jvik833biplb6wl4isgjhfvi2rbrigaj7kmxigy0iqn9yh1z" "tuios"))

