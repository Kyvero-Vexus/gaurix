;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #10.
;;; 99 new recipes: 96 firefox-esr-i18n language packs (copy-build-system) +
;;; 1 C/Makefile tool (cc1541) + 1 Python/pyproject (durdraw) +
;;; 1 Python/setuptools (python-justext).
;;; 1 re-blocked: remarshal (DEP_RESOLUTION_FAILED: python-u-msgpack-python missing from Guix).

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd10)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xml)
  #:export (cc1541
            durdraw
            python-justext
            firefox-esr-i18n-ach
            firefox-esr-i18n-af
            firefox-esr-i18n-an
            firefox-esr-i18n-ar
            firefox-esr-i18n-ast
            firefox-esr-i18n-az
            firefox-esr-i18n-be
            firefox-esr-i18n-bg
            firefox-esr-i18n-bn
            firefox-esr-i18n-br
            firefox-esr-i18n-bs
            firefox-esr-i18n-ca
            firefox-esr-i18n-ca-valencia
            firefox-esr-i18n-cak
            firefox-esr-i18n-cs
            firefox-esr-i18n-cy
            firefox-esr-i18n-da
            firefox-esr-i18n-de
            firefox-esr-i18n-dsb
            firefox-esr-i18n-el
            firefox-esr-i18n-en-ca
            firefox-esr-i18n-en-gb
            firefox-esr-i18n-en-us
            firefox-esr-i18n-eo
            firefox-esr-i18n-es-ar
            firefox-esr-i18n-es-cl
            firefox-esr-i18n-es-es
            firefox-esr-i18n-es-mx
            firefox-esr-i18n-et
            firefox-esr-i18n-eu
            firefox-esr-i18n-fa
            firefox-esr-i18n-ff
            firefox-esr-i18n-fi
            firefox-esr-i18n-fr
            firefox-esr-i18n-fy-nl
            firefox-esr-i18n-ga-ie
            firefox-esr-i18n-gd
            firefox-esr-i18n-gl
            firefox-esr-i18n-gn
            firefox-esr-i18n-gu-in
            firefox-esr-i18n-he
            firefox-esr-i18n-hi-in
            firefox-esr-i18n-hr
            firefox-esr-i18n-hsb
            firefox-esr-i18n-hu
            firefox-esr-i18n-hy-am
            firefox-esr-i18n-ia
            firefox-esr-i18n-id
            firefox-esr-i18n-is
            firefox-esr-i18n-it
            firefox-esr-i18n-ja
            firefox-esr-i18n-ka
            firefox-esr-i18n-kab
            firefox-esr-i18n-kk
            firefox-esr-i18n-km
            firefox-esr-i18n-kn
            firefox-esr-i18n-ko
            firefox-esr-i18n-lij
            firefox-esr-i18n-lt
            firefox-esr-i18n-lv
            firefox-esr-i18n-mk
            firefox-esr-i18n-mr
            firefox-esr-i18n-ms
            firefox-esr-i18n-my
            firefox-esr-i18n-nb-no
            firefox-esr-i18n-ne-np
            firefox-esr-i18n-nl
            firefox-esr-i18n-nn-no
            firefox-esr-i18n-oc
            firefox-esr-i18n-pa-in
            firefox-esr-i18n-pl
            firefox-esr-i18n-pt-br
            firefox-esr-i18n-pt-pt
            firefox-esr-i18n-rm
            firefox-esr-i18n-ro
            firefox-esr-i18n-ru
            firefox-esr-i18n-si
            firefox-esr-i18n-sk
            firefox-esr-i18n-sl
            firefox-esr-i18n-son
            firefox-esr-i18n-sq
            firefox-esr-i18n-sr
            firefox-esr-i18n-sv-se
            firefox-esr-i18n-ta
            firefox-esr-i18n-te
            firefox-esr-i18n-th
            firefox-esr-i18n-tl
            firefox-esr-i18n-tr
            firefox-esr-i18n-trs
            firefox-esr-i18n-uk
            firefox-esr-i18n-ur
            firefox-esr-i18n-uz
            firefox-esr-i18n-vi
            firefox-esr-i18n-xh
            firefox-esr-i18n-zh-cn
            firefox-esr-i18n-zh-tw))

;;; ─────────────────────────────────────────────────────────────────
;;; Helper: Firefox ESR i18n language pack generator
;;; ─────────────────────────────────────────────────────────────────

(define %firefox-esr-version "140.7.1esr")

(define (make-firefox-esr-i18n-package pkg-suffix xpi-locale hash)
  "Create a Firefox ESR i18n language pack package.
PKG-SUFFIX is the lowercase locale for the Guix package name.
XPI-LOCALE is the mixed-case locale used in the Mozilla download URL.
HASH is the base32 sha256 of the XPI file."
  (let ((pkg-name (string-append "firefox-esr-i18n-" pkg-suffix)))
    (module-define!
     (current-module)
     (string->symbol pkg-name)
     (package
       (name pkg-name)
       (version %firefox-esr-version)
       (source (origin
                 (method url-fetch)
                 (uri (string-append
                       "https://archive.mozilla.org/pub/firefox/releases/"
                       version "/linux-x86_64/xpi/" xpi-locale ".xpi"))
                 (sha256 (base32 hash))))
       (build-system copy-build-system)
       (arguments
        (list
         #:install-plan
         #~(list (list (string-append "firefox-esr-i18n-" #$pkg-suffix
                                       "-" #$version ".xpi")
                        (string-append "lib/firefox/distribution/extensions/"
                                       "langpack-" #$xpi-locale
                                       "@firefox.mozilla.org.xpi")))
         #:phases
         #~(modify-phases %standard-phases
             (add-before 'install 'rename-source
               (lambda _
                 (let ((xpi (car (find-files "." "\\.xpi$"))))
                   (rename-file xpi (string-append "firefox-esr-i18n-"
                                                    #$pkg-suffix "-"
                                                    #$version ".xpi"))))))))
       (home-page "https://www.mozilla.org/firefox/")
       (synopsis (string-append "Firefox ESR language pack for " xpi-locale))
       (description
        (string-append
         "This package provides the " xpi-locale " language pack for Firefox ESR.  "
         "Install it alongside Firefox ESR to use the browser in the "
         xpi-locale " locale."))
       (license license:mpl2.0)))))

;;; Generate all 96 firefox-esr-i18n packages
(make-firefox-esr-i18n-package "ach" "ach" "1qfc46i35scfbpd0ikq88kjln4fw5xxhrd8sj8w133dfmj9hszas")
(make-firefox-esr-i18n-package "af" "af" "00y9q2872jvzyrv5nsqnmsggd2lpsp7vfjwbxk0ks1wccr9zidg1")
(make-firefox-esr-i18n-package "an" "an" "1q6rxngrs451ma1bx133s342fq6ksds1z787bnmc3wxzcc65vp5k")
(make-firefox-esr-i18n-package "ar" "ar" "0a8p5z9kx05zaidvbm4mp6fyjzp2l1pv92s141h9wyhqnyzzb04p")
(make-firefox-esr-i18n-package "ast" "ast" "0y01m5lrfmdi25fxd9cq3nha78gm6n3picddjdg4j2y6c6ycff2w")
(make-firefox-esr-i18n-package "az" "az" "1xa4lh8nkx2kqjqxxzvx48s6rjdlln3xnsg3iiaizivrpxcy0s4f")
(make-firefox-esr-i18n-package "be" "be" "0x5pahbnz3fz80b9zg6qkil6zav9ajh61nnr7ays0d5al52dn8k2")
(make-firefox-esr-i18n-package "bg" "bg" "1kid2j7dbqgl7w72vj9k3l32h3s1vhjvijj3qh2zf0k29diqm5ds")
(make-firefox-esr-i18n-package "bn" "bn" "01pmgvr8ycwrskpzxv89jaiyj5y9k9s550r9dmnii1104nhgkzjv")
(make-firefox-esr-i18n-package "br" "br" "0cia81gg2x7j14xkay7my8mhkmcjz0an54jjh2vg1z1mg65qgg8h")
(make-firefox-esr-i18n-package "bs" "bs" "1n8j9m44nixkdm2bsp52gdhjxx4cfiyqpv5l28rn41vmcgfizd2j")
(make-firefox-esr-i18n-package "ca" "ca" "1p64win9s5yh15yfchrjx3i3w4vrqlqa4algv83cd88bj7x1qvsd")
(make-firefox-esr-i18n-package "ca-valencia" "ca-valencia" "1anybpw2mb725mdrzsj58iz0crm9d6cdm5jvyixbiq1rjji1x2ks")
(make-firefox-esr-i18n-package "cak" "cak" "1qgdzwcxqp0a5ss487zmiqfjr7bmx37k7rlp8mhczbf8z9mdyvm5")
(make-firefox-esr-i18n-package "cs" "cs" "13p9llva9isi6ad8b59c0dy1jmpd72ssh4h4kx9gc3vk2kycfpcp")
(make-firefox-esr-i18n-package "cy" "cy" "0hyr0hi14l7pf85hw11xd44bqjja0mx32azm12r8yb19h1wdyf40")
(make-firefox-esr-i18n-package "da" "da" "1qcx6b9k1sydd5k8j80jsgm5sgr423k46h9krxqy68c9g7w742yy")
(make-firefox-esr-i18n-package "de" "de" "15nrvi2c0xmsq0rnsi149nf5wci1vcmag7whn1jsphzwyqgj2j81")
(make-firefox-esr-i18n-package "dsb" "dsb" "1x3glm96airk0dycwh1r1qg2z1m3gwgs9l38gnc1rwn8mv9z783y")
(make-firefox-esr-i18n-package "el" "el" "17c5918hx1r1k34sz4rhgal8s514v5mmvqm8kfrrnw4ybk4qrdbj")
(make-firefox-esr-i18n-package "en-ca" "en-CA" "0zxi90g9q4lyfczsdk0n0q7vv32nr9330afqq2d5sx5qw6xm634c")
(make-firefox-esr-i18n-package "en-gb" "en-GB" "0945kqy2azl6jvq120q4jw24wccb4ii6aichys3szcgga1n27964")
(make-firefox-esr-i18n-package "en-us" "en-US" "075qs8sfpcin5ybqcrbnpiip09f0wkjzzdjqrfz0q6fk76p5nxlm")
(make-firefox-esr-i18n-package "eo" "eo" "1nsdqvn51dlh9x2mylvlzfbvw2wk1bb2m27flzmi0ww8i420lsx4")
(make-firefox-esr-i18n-package "es-ar" "es-AR" "18c1xpll95dqvdq7kxyb5wi2dggjbcf1ax49m6wv8fd20qxvqik7")
(make-firefox-esr-i18n-package "es-cl" "es-CL" "07kz90sf06qk1yw29rr1a2v4clpjzdgmrv86a6m9mv5jfvxwvfix")
(make-firefox-esr-i18n-package "es-es" "es-ES" "0hynz4k8x7fx8apb7s47xfb21sf0y7dy0dnaby52ypvgflgqyxj2")
(make-firefox-esr-i18n-package "es-mx" "es-MX" "0pcvf7g314c5x47dqvihp81jg9y48c0cbx14vsqj478g91is73w5")
(make-firefox-esr-i18n-package "et" "et" "12ls5al2phlp4h3pkd6v9qb3jn7nj8gbcv7c4wj6h9kavi336vz7")
(make-firefox-esr-i18n-package "eu" "eu" "15kgp1mb1r5kjn28ap2rabkd62dx7snivrvdpk0jxhphb0zbyyvd")
(make-firefox-esr-i18n-package "fa" "fa" "04lc7k2vmdgg0nn9myy77zhl1hzfqmmmsb014l0l2x458hmic0xm")
(make-firefox-esr-i18n-package "ff" "ff" "0j86s1c21ckhk2mvppg6v2hd886gf33l12vl3zyidhp2dxzaq6cf")
(make-firefox-esr-i18n-package "fi" "fi" "1a31ggxzh0pi149iwnfhpgqdibjnypjs11n82s8z96sb7mavmri4")
(make-firefox-esr-i18n-package "fr" "fr" "08d216nc6cyyyhynikii4rm7lgqg94kj28b5gl77xvifa4cldrlb")
(make-firefox-esr-i18n-package "fy-nl" "fy-NL" "11hpaka581kblla3bxzxq04xjz11rk2i7fyafac6w5gvqihzdsz2")
(make-firefox-esr-i18n-package "ga-ie" "ga-IE" "0d34735ax2vll4fmx5m3n8c555k3f2gvvah0abp621dqqnhw9cyj")
(make-firefox-esr-i18n-package "gd" "gd" "0cy45nz0wssmg213mrznryxgav5zwlngsil5195wg9nlsqyabgm8")
(make-firefox-esr-i18n-package "gl" "gl" "10wi16l3b5nnl1im8g7jwzznj5vp69qrwg7j9wqfk6qsri7kcwnp")
(make-firefox-esr-i18n-package "gn" "gn" "1z5ddy427a764q7x0vf9lp7hjbx5kjx1527nnhn7jg3c655ph4k4")
(make-firefox-esr-i18n-package "gu-in" "gu-IN" "0rf30jmg39wm0jyklx0mybgj4jvr8qrksq3xfd4p1s5g3ybnxvj7")
(make-firefox-esr-i18n-package "he" "he" "0r6ifjp447qbn2wfqylgdazkldpgjkppyvr69qdjq1gzzdn0l25v")
(make-firefox-esr-i18n-package "hi-in" "hi-IN" "0vsymcxsdvqpi8k5a3f1ivv5gcc7m6h00wmp8frca5dr89aylpan")
(make-firefox-esr-i18n-package "hr" "hr" "0vw8z2bv6mx3wzx750rr13khh9kh762hzkf975rmljw167kirhdi")
(make-firefox-esr-i18n-package "hsb" "hsb" "0bvk685mq85j03k4z69j1ggg2dckpgckc0rqydrf0yr4zgf61808")
(make-firefox-esr-i18n-package "hu" "hu" "1lp6axbp7p5kygin40c108bph85ilgb2lijhby2ypaxgz75j0qy6")
(make-firefox-esr-i18n-package "hy-am" "hy-AM" "0166gfxghlafjysd8idr52mgnrpyab4ivs3yrkixh4qgdd3j1896")
(make-firefox-esr-i18n-package "ia" "ia" "0rf7q5cgg356gaifri60p178sfsqavqqaa9g897c83l8ldfv5pfj")
(make-firefox-esr-i18n-package "id" "id" "1nrnmn65l63kg0nimm5ky1ylqksp3a2s8bqv49flhdbyng00jddb")
(make-firefox-esr-i18n-package "is" "is" "1y9s82c4ra7367g9697svg1h664yc5wi4nziszh1x7jf60kvaw7x")
(make-firefox-esr-i18n-package "it" "it" "0v1rrng9aq59ic14m0h79bmsj4drvafj7m0zwiiiy143bvybsz2m")
(make-firefox-esr-i18n-package "ja" "ja" "1bl54k8py840ghyyr6nzx7v45p8knz9zx7yckaf5aavvksnmlpq2")
(make-firefox-esr-i18n-package "ka" "ka" "1kkqmn2rl81m72rsw4zql6y9gp34w2i9339rklsb3gk12x22mh8a")
(make-firefox-esr-i18n-package "kab" "kab" "1z6xs8cb6xdnq14jqngwbv6fl1fqgifyb7h85ww2adpjn79baiy4")
(make-firefox-esr-i18n-package "kk" "kk" "1flnw0z3k6vb6xj7y6vh3626bwcy9fkvf6vx0c1ra2zg3k1i7fkk")
(make-firefox-esr-i18n-package "km" "km" "0q1mc1i2fiwz9rsqw2hcsn0y7kdx7skka2q9jrdbx5g9lm292qbf")
(make-firefox-esr-i18n-package "kn" "kn" "11sq0gwdcp0ilmiq1b840v6v0plb56b6kcciqj6a0mh99npijg06")
(make-firefox-esr-i18n-package "ko" "ko" "1b3cx58z497lbfsi5h8m6sq46bh33m930ld5wk0dczwbs6z04pks")
(make-firefox-esr-i18n-package "lij" "lij" "15jm0mb11va9mmx8vmdy4f9n0bgym5k8cq0za0ypfidfafwqdkma")
(make-firefox-esr-i18n-package "lt" "lt" "0zp6h7mvckfinsiy9ic8kzq4vwy8nqhknmgzxv464a6vv27ka480")
(make-firefox-esr-i18n-package "lv" "lv" "1k5w6v5idspzqb93fjpx0785jh29xqwcksd3frpwh772wzzcfbs0")
(make-firefox-esr-i18n-package "mk" "mk" "0lyf10qm8mgq2dxsfvs1bvq4shwglxdmvpkai5qm5frx4anwn47h")
(make-firefox-esr-i18n-package "mr" "mr" "0a24mw892nhmf0y5xidc3h3py9fsyr0jsyjh0nb0ais4m0gygaic")
(make-firefox-esr-i18n-package "ms" "ms" "180a4c5dql4i8l1c3bhzj71j6x7sa9lsl9q60rginfamq73lr9dx")
(make-firefox-esr-i18n-package "my" "my" "1cjibf3a47wgynb2fw6zp0ybg3s684mdm7zfyprqi8s0x7ysy501")
(make-firefox-esr-i18n-package "nb-no" "nb-NO" "13rr3pg54l5y73zqm7b01zr8qp3cm3ifli6108xgq758j1fmff6r")
(make-firefox-esr-i18n-package "ne-np" "ne-NP" "08n83zvzb0lvz24s203brcr2284fapbmyfk9mz11nfjvd81vbs1i")
(make-firefox-esr-i18n-package "nl" "nl" "10kqpncd16spxsqzhlmcl90d8vizcf534qxrhz4pa39h019kzsf1")
(make-firefox-esr-i18n-package "nn-no" "nn-NO" "1fqhhr7bck94z5yf4ay2rdz3ab6vfr2bb99wv0v5jgx3b80hrqny")
(make-firefox-esr-i18n-package "oc" "oc" "173a7m7vfciq1ighqlqq8c5vm4yf76m9ma59nnfdqfd42hc5mx2i")
(make-firefox-esr-i18n-package "pa-in" "pa-IN" "1j4i35k71qfcm23cw9h1b99rr16ls6skc2plyhjc72h5zsjnpq0j")
(make-firefox-esr-i18n-package "pl" "pl" "07wnvxjpcmk86v07z77y72xbp548jiqhi1vg67lamh5bnayj456b")
(make-firefox-esr-i18n-package "pt-br" "pt-BR" "1dw2f0d9dc1x9djasv7ci4waimg0hqr8smija29fr56p0qw26cph")
(make-firefox-esr-i18n-package "pt-pt" "pt-PT" "131jd24d6yvdjzm93xwk4xdlhvadd9yx55igfmv1ly7jk7w4pvzf")
(make-firefox-esr-i18n-package "rm" "rm" "0ynhbhf8hihnamyfb5asl74x0mrd72vmdylw51gszabql21kvvhw")
(make-firefox-esr-i18n-package "ro" "ro" "1mcgj4dx6hilbarf07y0r78m5nvmfhrbsgj59k5pcxnrxdvpywmw")
(make-firefox-esr-i18n-package "ru" "ru" "032949sw20h9k3jj1jfi8lpfbld2s5zd2s5s4ssnmjb1w8pa5a8c")
(make-firefox-esr-i18n-package "si" "si" "1iia3hf9pdwlnjswnr1c12pmf4fk7kki2gb43pc4cx7fxqn7ljwb")
(make-firefox-esr-i18n-package "sk" "sk" "0a9hqmqb9xyljlmg2a8mwmzbak3r70ff18g35igayjw1p4b6vn81")
(make-firefox-esr-i18n-package "sl" "sl" "0ldb1620nwk1yc5mhayxh7xgrmkb1jml2bdq79fw8373kx3lirda")
(make-firefox-esr-i18n-package "son" "son" "04kh622la42qdg5l1y5v1hcdfa5f8jps65giwfmzv4px9z24im1r")
(make-firefox-esr-i18n-package "sq" "sq" "1m1b113vkbn278bbxghvskpx8ggvr4cbai81ahs75vmszppmdmyh")
(make-firefox-esr-i18n-package "sr" "sr" "143f8y4pccn4jmx6cb1gj0j7rnx5v8xh8dcj6qri8841za5jrx86")
(make-firefox-esr-i18n-package "sv-se" "sv-SE" "1qj4mx1kcqqdca13rf3dajqnzxlvzc9c1pdvapnmq55rxdab2w1d")
(make-firefox-esr-i18n-package "ta" "ta" "0j8y42d3s6vmzhbjzi5bbpym2msraix79qhi80lah6718v9dy2xd")
(make-firefox-esr-i18n-package "te" "te" "1zr3k4m63j94ikvhcwfxzam0aw059nxc511l7kr6bcqmjfkxl21d")
(make-firefox-esr-i18n-package "th" "th" "1amvn3dgs3x9q83mpqnix3f1216w6cfzzlb8afm9jc7bvyh2rj99")
(make-firefox-esr-i18n-package "tl" "tl" "0i4a9zmffzspfzpkniz58z7xyjrk70l8hbjzgj4wa5l4l0lh8dd4")
(make-firefox-esr-i18n-package "tr" "tr" "0k3fl596p9vh563l7rqb9c5wmnm4k6szgkmv472cginin1i28d8p")
(make-firefox-esr-i18n-package "trs" "trs" "1hycvb3v2z3hcsymz1m2b54bygplqqqdjfk64zi557dn8hdf6z1i")
(make-firefox-esr-i18n-package "uk" "uk" "05w5hnwissw7fvn26nqssgand2bv1kzldjql2shd2lahjqba0c7v")
(make-firefox-esr-i18n-package "ur" "ur" "1i34dfwf57qc22szjg7amzvh3964fb6k1aafgyrcqcarckppvz3k")
(make-firefox-esr-i18n-package "uz" "uz" "1zh3l3rfwsw09gqs88f3bciq5s7szb2yshrj3hifkclhpdqpka7i")
(make-firefox-esr-i18n-package "vi" "vi" "1rrhihllg4xqa9l4kwibdh382spsb17mp3xzl8dph58g0g4y0282")
(make-firefox-esr-i18n-package "xh" "xh" "09rnn4sf7zz6v3ydx1k9nlkbgs971m1djiasdiiyqfjdg2mc6s82")
(make-firefox-esr-i18n-package "zh-cn" "zh-CN" "0f90dri5fxmvw4by8y1k1517dr89s6z5x5pg75l6h5dd1m5n44ik")
(make-firefox-esr-i18n-package "zh-tw" "zh-TW" "0g37izwlbr3whchy457id3gxw4dh82kx4s453rg4hkyriv7vv2ml")

;;; ─────────────────────────────────────────────────────────────────
;;; cc1541 — Commodore 64 .d64 disk image tool
;;; ─────────────────────────────────────────────────────────────────

(define-public cc1541
  (package
    (name "cc1541")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TrantorHF/cc1541/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0wc0i1x4f3ckgn7dgxg2vk17mf8zipcfn19h31v4z58x0v9yx8hf"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:make-flags #~(list (string-append "PREFIX=" #$output)
                           (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))  ;; no configure script; plain Makefile
    (home-page "https://bitbucket.org/PTV_Claus/cc1541/")
    (synopsis "tool for creating Commodore 1541 .d64 disk images")
    (description
     "cc1541 is a command-line tool for creating and manipulating Commodore
1541 .d64 disk images.  It supports custom sector interleaving, file
ordering, and various Commodore DOS features for cross-development
workflows.")
    (license license:expat)))

;;; ─────────────────────────────────────────────────────────────────
;;; durdraw — ASCII/ANSI art editor
;;; ─────────────────────────────────────────────────────────────────

(define-public durdraw
  (package
    (name "durdraw")
    (version "0.29.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cmang/durdraw/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1ighvmni3j8jxq0vihy5rz0i33g1zgq3ajgj07zdw0vxv47cqy3q"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f))  ;; no test suite in upstream
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://durdraw.org")
    (synopsis "frame-based ASCII and ANSI art editor and player")
    (description
     "Durdraw is a text-mode art editor and animation player for creating
ASCII, ANSI, and Unicode art.  It supports multiple frames for animation,
import/export of popular art formats, and playback of animated scenes in
the terminal.")
    (license license:bsd-3)))

;;; ─────────────────────────────────────────────────────────────────
;;; python-justext — boilerplate removal from HTML
;;; ─────────────────────────────────────────────────────────────────

(define-public python-justext
  (package
    (name "python-justext")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/j/jusText/"
                    "justext-" version ".tar.gz"))
              (sha256
               (base32
                "01gb1dd6hjcrljcym54p30m6s1lnk76yz9bmb9dwvi241i2nlj8k"))))
    (build-system python-build-system)
    (propagated-inputs (list python-lxml))
    (home-page "https://github.com/miso-belica/jusText")
    (synopsis "heuristic-based boilerplate removal from HTML pages")
    (description
     "jusText is a tool for removing boilerplate content, such as navigation
links, headers, and footers from HTML pages.  It uses a heuristic approach
based on paragraph-level text classification to extract the main content.")
    (license license:bsd-2)))
