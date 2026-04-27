;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; wldash --- Wayland launcher/dashboard written in Rust
;;;
;;; Source: https://github.com/kennylevinsen/wldash
;;; Version: 0.3.0 (tag v0.3.0, 2022-01-15)
;;; Build system: cargo-build-system
;;; License: GPL-3.0
;;;
;;; Crate dependencies were generated from the upstream Cargo.lock via
;;; (guix import crate) cargo-lock->expressions.  All 83 transitive crate
;;; dependencies are vendored as crate-source origins.
;;;
;;; System library dependencies: dbus, pulseaudio, alsa-lib, fontconfig,
;;; wayland, pkg-config.
;;;
;;; The sha256 hash for the source tarball was obtained via:
;;;   guix download https://github.com/kennylevinsen/wldash/archive/refs/tags/v0.3.0.tar.gz
;;;   => 1cqjykpj25qxl86yadm9bnp6qwn41449v1dxf3xsmvjvpjaxkm1x

(define-module (gaurix packages wldash)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages freedesktop)   ; wayland
  #:use-module (gnu packages glib)          ; dbus
  #:use-module (gnu packages pulseaudio)    ; pulseaudio
  #:use-module (gnu packages linux)         ; alsa-lib
  #:use-module (gnu packages fontutils)     ; fontconfig
  #:use-module (gnu packages pkg-config)    ; pkg-config
  #:export (lookup-cargo-inputs
            wldash))


;;;
;;; Crate sources (generated from Cargo.lock for wldash v0.3.0)
;;;

(define rust-ab-glyph-rasterizer-0.1.4
  (crate-source "ab_glyph_rasterizer" "0.1.4"
                "1zzz78231w849xslz9s0pwjj6gp02wfbbxdpysqhwwq1vqr5xznr"))

(define rust-alsa-0.4.3
  (crate-source "alsa" "0.4.3"
                "0d69ngf70yyvn4alf99x21rpp9jag4sj1jii16k8052b7rmky8gb"))

(define rust-alsa-sys-0.3.1
  (crate-source "alsa-sys" "0.3.1"
                "09qmmnpmlcj23zcgx2xsi4phcgm5i02g9xaf801y7i067mkfx3yv"))

(define rust-autocfg-1.0.1
  (crate-source "autocfg" "1.0.1"
                "0jj6i9zn4gjl03kjvziqdji6rwx8ykz8zk2ngpc331z2g3fk3c6d"))

(define rust-bitflags-1.2.1
  (crate-source "bitflags" "1.2.1"
                "14qnd5nq8p2almk79m4m8ydqhd413yaxsyjp5xd19g3mikzf47fg"))

(define rust-block-buffer-0.7.3
  (crate-source "block-buffer" "0.7.3"
                "12v8wizynqin0hqf140kmp9s38q223mp1b0hkqk8j5pk8720v560"))

(define rust-block-padding-0.1.5
  (crate-source "block-padding" "0.1.5"
                "1xbkmysiz23vimd17rnsjpw9bgjxipwfslwyygqlkx4in3dxwygs"))

(define rust-byte-tools-0.3.1
  (crate-source "byte-tools" "0.3.1"
                "1mqi29wsm8njpl51pfwr31wmpzs5ahlcb40wsjyd92l90ixcmdg3"))

(define rust-byteorder-1.4.2
  (crate-source "byteorder" "1.4.2"
                "0srh0h0594jmsnbvm7n0g8xabhla8lwb3gn8s0fzd7d1snix2i5f"))

(define rust-cc-1.0.66
  (crate-source "cc" "1.0.66"
                "0j7d7h4n81z5f22l3v8ggjvvw8m64636nlaqax4x1y44da1rc12c"))

(define rust-cfg-if-0.1.10
  (crate-source "cfg-if" "0.1.10"
                "08h80ihs74jcyp24cd75wwabygbbdgl05k6p5dmq8akbr78vv1a7"))

(define rust-cfg-if-1.0.0
  (crate-source "cfg-if" "1.0.0"
                "1za0vb97n4brpzpv8lsbnzmq5r8f2b0cpqqr0sy8h5bn751xxwds"))

(define rust-chrono-0.4.19
  (crate-source "chrono" "0.4.19"
                "0wyfl6c00vhfl562spnfcna3zkw8jqvcp652m9iskhl8j26dc2k7"))

(define rust-const-cstr-0.3.0
  (crate-source "const-cstr" "0.3.0"
                "19ij6m8s16d0i7vma535l7w4x8bcanjcxs7c6n7sci86ydghnggd"))

(define rust-dbus-0.6.5
  (crate-source "dbus" "0.6.5"
                "068qyxvaam34sjmhjgxz6iikklvylxly7gp6n00yksqydzrz1da8"))

(define rust-digest-0.8.1
  (crate-source "digest" "0.8.1"
                "1madjl27f3kj5ql7kwgvb9c8b7yb7bv7yfgx7rqzj4i3fp4cil7k"))

(define rust-dlib-0.4.2
  (crate-source "dlib" "0.4.2"
                "0xlsf3lrz9hd7q3ff6lp5mw4kn3nbryn746kd07i93r6wg8ia7xi"))

(define rust-downcast-rs-1.2.0
  (crate-source "downcast-rs" "1.2.0"
                "0l36kgxqd5djhqwf5abxjmgasdw8n0qsjvw3jdvhi91nj393ba4y"))

(define rust-dtoa-0.4.7
  (crate-source "dtoa" "0.4.7"
                "0kpagin5jx9khw1ylardzm9hp1g8k0i87qrkgsrwchfp6hlyvmw8"))

(define rust-either-1.6.1
  (crate-source "either" "1.6.1"
                "0mwl9vngqf5jvrhmhn9x60kr5hivxyjxbmby2pybncxfqhf4z3g7"))

(define rust-fake-simd-0.1.2
  (crate-source "fake-simd" "0.1.2"
                "1vfylvk4va2ivqx85603lyqqp0zk52cgbs4n5nfbbbqx577qm2p8"))

(define rust-fontconfig-0.2.0
  (crate-source "fontconfig" "0.2.0"
                "0ngj5vzsvsy7z6c6whzqigfrzkmqng230ick64dn5yszwdy0wmx5"))

(define rust-fuzzy-matcher-0.3.7
  (crate-source "fuzzy-matcher" "0.3.7"
                "153csv8rsk2vxagb68kpmiknvdd3bzqj03x805khckck28rllqal"))

(define rust-generic-array-0.12.3
  (crate-source "generic-array" "0.12.3"
                "1v5jg7djicq34nbiv1dwaki71gkny002wyy9qfn3y0hfmrs053y6"))

(define rust-itertools-0.10.3
  (crate-source "itertools" "0.10.3"
                "1qy55fqbaisr9qgbn7cvdvqlfqbh1f4ddf99zwan56z7l6gx3ad9"))

(define rust-itoa-0.4.7
  (crate-source "itoa" "0.4.7"
                "0di7fggbknwfjcw8cgzm1dnm3ik32l2m1f7nmyh8ipmh45h069fx"))

(define rust-lazy-static-1.4.0
  (crate-source "lazy_static" "1.4.0"
                "0in6ikhw8mgl33wjv6q6xfrb5b9jr16q8ygjy803fay4zcisvaz2"))

(define rust-libc-0.2.86
  (crate-source "libc" "0.2.86"
                "074b38mq1rx3dgg7sf952d4ccywq450zymk7gzn5q9z39f92sa5p"))

(define rust-libdbus-sys-0.2.1
  (crate-source "libdbus-sys" "0.2.1"
                "1w06ycq2mw8zfp9j73macgdl8d2881bnxbzdyyxys90ljyya64nw"))

(define rust-libloading-0.6.7
  (crate-source "libloading" "0.6.7"
                "10wq4a4jkman8k6y0v2cw3d38y1h3rw6d2in5klggm8jg90k46im"))

(define rust-libpulse-binding-2.23.0
  (crate-source "libpulse-binding" "2.23.0"
                "03khphfxifmmszh541hvnjhyksydhai4hv9b7pxpslh1d205yh5j"))

(define rust-libpulse-sys-1.18.0
  (crate-source "libpulse-sys" "1.18.0"
                "10msfr8f951v86ag0fl2bsm4a3siq2r7hz9bqhhg7i234s1yj5yg"))

(define rust-linked-hash-map-0.5.4
  (crate-source "linked-hash-map" "0.5.4"
                "1ww8zsraqnvrsknd315481185igwkx5n14xnhq5i8216z65b7fbz"))

(define rust-maplit-1.0.2
  (crate-source "maplit" "1.0.2"
                "07b5kjnhrrmfhgqm9wprjw8adx6i225lqp49gasgqg74lahnabiy"))

(define rust-memmap-0.7.0
  (crate-source "memmap" "0.7.0"
                "0ns7kkd1h4pijdkwfvw4qlbbmqmlmzwlq3g2676dcl5vwyazv1b5"))

(define rust-multimap-0.8.2
  (crate-source "multimap" "0.8.2"
                "0cq3hlqwyxz0hmcpbajghhc832ln6h0qszvf89kv8fx875hhfm8j"))

(define rust-nix-0.15.0
  (crate-source "nix" "0.15.0"
                "0aa2l7wg9pzx24ks4p97gdy09a4hhs1sr9drxnm75v906d7hnbiv"))

(define rust-nix-0.16.1
  (crate-source "nix" "0.16.1"
                "1jx73a06qdaxzgfs321mm5r1zk74aji1fp0agqjh5d5sz26sy3nx"))

(define rust-nix-0.18.0
  (crate-source "nix" "0.18.0"
                "0m8h9bskjjqx9sk687z8bxqg2kpwhdh78jq6zfaxsb8llvk0yic3"))

(define rust-num-bigint-0.2.6
  (crate-source "num-bigint" "0.2.6"
                "015k3wixdi4w698sappvy43pf8bvkw0f88xplmdgc3zfk2cpy309"))

(define rust-num-complex-0.2.4
  (crate-source "num-complex" "0.2.4"
                "15dwaksw729r3v14sgzc9723s3fnfixiir8jzwx7b7kim48r9cdn"))

(define rust-num-derive-0.3.3
  (crate-source "num-derive" "0.3.3"
                "0gbl94ckzqjdzy4j8b1p55mz01g6n1l9bckllqvaj0wfz7zm6sl7"))

(define rust-num-integer-0.1.44
  (crate-source "num-integer" "0.1.44"
                "1nq152y3304as1iai95hqz8prqnc94lks1s7q05sfjdmcf56kk6j"))

(define rust-num-rational-0.2.4
  (crate-source "num-rational" "0.2.4"
                "1vsaz96chxcgpqd5a0dq8hb3b4sj6dnlhwmpbkf4mx6vnls0202w"))

(define rust-num-traits-0.2.14
  (crate-source "num-traits" "0.2.14"
                "144j176s2p76azy2ngk2vkdzgwdc0bc8c93jhki8c9fsbknb2r4s"))

(define rust-once-cell-1.5.2
  (crate-source "once_cell" "1.5.2"
                "183zs1dbmsv24mkafjypf9qwjrx46an58vb004a162l113sl3g8k"))

(define rust-opaque-debug-0.2.3
  (crate-source "opaque-debug" "0.2.3"
                "172j6bs8ndclqxa2m64qc0y1772rr73g4l9fg2svscgicnbfff98"))

(define rust-os-pipe-0.9.2
  (crate-source "os_pipe" "0.9.2"
                "04yjs1hf88jjm17g8a2lr7ibxyyg460rzbgcw9f1yzihq833y8zv"))

(define rust-owned-ttf-parser-0.6.0
  (crate-source "owned_ttf_parser" "0.6.0"
                "1qydjksjcllf0pnm0jkjvbg4n52wfcwv59dl5b06cqn40sw3z4lz"))

(define rust-pest-2.1.3
  (crate-source "pest" "2.1.3"
                "0lry80bm90x47nq71wxq83kjrm9ashpz4kbm92p90ysdx4m8gx0h"))

(define rust-pest-derive-2.1.0
  (crate-source "pest_derive" "2.1.0"
                "1l5jfa6ril71cw5nsiw0r45br54dd8cj2r1nc2d1wq6wb3jilgc3"))

(define rust-pest-generator-2.1.3
  (crate-source "pest_generator" "2.1.3"
                "0mfgl0p6v91ywdqr9i8w053v70cnfqjk8y5rhwbvir9idridpf4r"))

(define rust-pest-meta-2.1.3
  (crate-source "pest_meta" "2.1.3"
                "07d1jbbbpxpchk0j37ljas46sdyyg599z3zw2ac0f5sk9x06xgjl"))

(define rust-pkg-config-0.3.19
  (crate-source "pkg-config" "0.3.19"
                "0k4860955riciibxr8bhnklp79jydp4xfylwdn5v9kj96hxlac9q"))

(define rust-proc-macro2-1.0.24
  (crate-source "proc-macro2" "1.0.24"
                "0wcabxzrddcjmryndw8fpyxcq6rw63m701vx86xxf03y3bp081qy"))

(define rust-quote-1.0.9
  (crate-source "quote" "1.0.9"
                "19rjmfqzk26rxbgxy5j2ckqc2v12sw2xw8l4gi8bzpn2bmsbkl63"))

(define rust-rcalc-lib-0.9.3
  (crate-source "rcalc_lib" "0.9.3"
                "0vk5y9l72mszdmdxj01964a0fyflx1nxj619ja155rvqflnzr5r4"))

(define rust-rust-ini-0.14.0
  (crate-source "rust-ini" "0.14.0"
                "1wnbh64jqaj8vw7m3p83biiv1sd4aaia4azzd164ai19fbbag5hc"))

(define rust-rusttype-0.9.2
  (crate-source "rusttype" "0.9.2"
                "0ngcwn7d2dybjrylga3gpxm3k3mcw3m405hcp32iignhvrx74z6w"))

(define rust-ryu-1.0.5
  (crate-source "ryu" "1.0.5"
                "0vpqv1dj7fksa6hm3zpk5rbsjs0ifbfy7xwzsyyil0rx37a03lvi"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-serde-1.0.123
  (crate-source "serde" "1.0.123"
                "1bk9733mgiv5sg8yb19y8mc85fb2aaqp1k02v10alavj688idmcj"))

(define rust-serde-derive-1.0.123
  (crate-source "serde_derive" "1.0.123"
                "0ccg4m7ww6mfs5vjdbdifri2kf1wyd4difjnqnraph2gssaw54ck"))

(define rust-serde-json-1.0.62
  (crate-source "serde_json" "1.0.62"
                "11hlwc4glh244sk6ncnvj3n01pi538iv2qygyxyfllj5g59n277a"))

(define rust-serde-yaml-0.8.17
  (crate-source "serde_yaml" "0.8.17"
                "08xvb5zxz3x5dgx0fy1q0aq9aa9fibcvi75333wnnwk1mga4wr8m"))

(define rust-sha-1-0.8.2
  (crate-source "sha-1" "0.8.2"
                "1pv387q0r7llk2cqzyq0nivzvkgqgzsiygqzlv7b68z9xl5lvngp"))

(define rust-shlex-0.1.1
  (crate-source "shlex" "0.1.1"
                "1lmv6san7g8dv6jdfp14m7bdczq9ss7j7bgsfqyqjc3jnjfippvz"))

(define rust-smallvec-1.6.1
  (crate-source "smallvec" "1.6.1"
                "0kk08axr0ybfbjzk65a41k84mb6sfhyajmfndaka9igkx34kf3zy"))

(define rust-syn-1.0.60
  (crate-source "syn" "1.0.60"
                "1080gw6mlja7yl26crya3k403wjdp7v3wx9mxcmpcnlar9z5j067"))

(define rust-thread-local-1.1.3
  (crate-source "thread_local" "1.1.3"
                "1gccp3grndpi6dyhzylz4hkqnkzc1xyri98n0xwwhnn90i7d4640"))

(define rust-time-0.1.44
  (crate-source "time" "0.1.44"
                "0m9jwy2pcmk232r3b9r80fs12mkckfjffjha4qfaxcdq9a8ydfbd"))

(define rust-timerfd-1.2.0
  (crate-source "timerfd" "1.2.0"
                "14gwkm2c38bm76ccpp4g20qqs77h86d1l81594i76pb751k3xd8b"))

(define rust-ttf-parser-0.6.2
  (crate-source "ttf-parser" "0.6.2"
                "1p4z969pwd5adayy3ijq94iiak42yfxz8hk5wnkdsirymgbpqp9y"))

(define rust-typenum-1.12.0
  (crate-source "typenum" "1.12.0"
                "0cvbksljz61ian21fnn0h51kphl0pwpzb932bv4s0rwy1wh8lg1p"))

(define rust-ucd-trie-0.1.3
  (crate-source "ucd-trie" "0.1.3"
                "072cblf8v3wzyaz3lhbpzgil4s03dpzg1ppy3gqx2l4v622y3pjn"))

(define rust-unicode-segmentation-1.7.1
  (crate-source "unicode-segmentation" "1.7.1"
                "15n736z0pbj30pj44jb9s9rjavzrmx8v8pzdgsl5yfmfwrxjw3dv"))

(define rust-unicode-xid-0.2.1
  (crate-source "unicode-xid" "0.2.1"
                "0r6mknipyy9vpz8mwmxvkx65ff2ha1n2pxqjj6f46lcn8yrhpzpp"))

(define rust-void-1.0.2
  (crate-source "void" "1.0.2"
                "0zc8f0ksxvmhvgx4fdg0zyn6vdnbxd2xv9hfx4nhzg6kbs4f80ka"))

(define rust-walkdir-2.3.2
  (crate-source "walkdir" "2.3.2"
                "0mnszy33685v8y9js8mw6x2p3iddqs8vfj7n2dhqddnlbirz5340"))

(define rust-wasi-0.10.0+wasi-snapshot-preview1
  (crate-source "wasi" "0.10.0+wasi-snapshot-preview1"
                "07y3l8mzfzzz4cj09c8y90yak4hpsi9g7pllyzpr6xvwrabka50s"))

(define rust-wayland-client-0.28.3
  (crate-source "wayland-client" "0.28.3"
                "1mxnflzv9s3qpcp0z7kqvrzki5bknfar9n9yky06f8ivs00vxgdx"))

(define rust-wayland-commons-0.28.3
  (crate-source "wayland-commons" "0.28.3"
                "0mid1sgy3bmiywnrhsr31b8w6zvk1ll2ci2as15ddv8pczvm0128"))

(define rust-wayland-protocols-0.28.3
  (crate-source "wayland-protocols" "0.28.3"
                "0c0sw13qssrvf3jgygwqpiimpaagz3haxn9jridd4k85sfs856ii"))

(define rust-wayland-scanner-0.28.3
  (crate-source "wayland-scanner" "0.28.3"
                "0g8ky63qk27in7zajycj3fyydsxlj19hanfcvr8d7z5kcxbvl43h"))

(define rust-wayland-sys-0.28.3
  (crate-source "wayland-sys" "0.28.3"
                "16f03jsy7q6p2wpaazc4w4kycyyk0fz7lacpdbcizl9m1i7874v7"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.5
  (crate-source "winapi-util" "0.1.5"
                "0y71bp7f6d536czj40dhqk0d55wfbbwqfp2ymqf1an5ibgl6rv3h"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-xml-rs-0.8.3
  (crate-source "xml-rs" "0.8.3"
                "12ndxyhzxw2zdr76ql8nfdwb2vwhvdkrxwk4pbjafqfglmjv0zdh"))

(define rust-yaml-rust-0.4.5
  (crate-source "yaml-rust" "0.4.5"
                "118wbqrr4n6wgk5rjjnlrdlahawlxc1bdsx146mwk8f79in97han"))

(define rust-yeslogic-fontconfig-sys-2.11.1
  (crate-source "yeslogic-fontconfig-sys" "2.11.1"
                "1lz32b4cry6nfy4ifbpyk6ss37vrm6n2d7gdbqhqfp0vrp2s1571"))


;;;
;;; Cargo inputs mapping
;;;

(define-cargo-inputs lookup-cargo-inputs
  (wldash => (list rust-ab-glyph-rasterizer-0.1.4
                   rust-alsa-0.4.3
                   rust-alsa-sys-0.3.1
                   rust-autocfg-1.0.1
                   rust-bitflags-1.2.1
                   rust-block-buffer-0.7.3
                   rust-block-padding-0.1.5
                   rust-byte-tools-0.3.1
                   rust-byteorder-1.4.2
                   rust-cc-1.0.66
                   rust-cfg-if-0.1.10
                   rust-cfg-if-1.0.0
                   rust-chrono-0.4.19
                   rust-const-cstr-0.3.0
                   rust-dbus-0.6.5
                   rust-digest-0.8.1
                   rust-dlib-0.4.2
                   rust-downcast-rs-1.2.0
                   rust-dtoa-0.4.7
                   rust-either-1.6.1
                   rust-fake-simd-0.1.2
                   rust-fontconfig-0.2.0
                   rust-fuzzy-matcher-0.3.7
                   rust-generic-array-0.12.3
                   rust-itertools-0.10.3
                   rust-itoa-0.4.7
                   rust-lazy-static-1.4.0
                   rust-libc-0.2.86
                   rust-libdbus-sys-0.2.1
                   rust-libloading-0.6.7
                   rust-libpulse-binding-2.23.0
                   rust-libpulse-sys-1.18.0
                   rust-linked-hash-map-0.5.4
                   rust-maplit-1.0.2
                   rust-memmap-0.7.0
                   rust-multimap-0.8.2
                   rust-nix-0.15.0
                   rust-nix-0.16.1
                   rust-nix-0.18.0
                   rust-num-bigint-0.2.6
                   rust-num-complex-0.2.4
                   rust-num-derive-0.3.3
                   rust-num-integer-0.1.44
                   rust-num-rational-0.2.4
                   rust-num-traits-0.2.14
                   rust-once-cell-1.5.2
                   rust-opaque-debug-0.2.3
                   rust-os-pipe-0.9.2
                   rust-owned-ttf-parser-0.6.0
                   rust-pest-2.1.3
                   rust-pest-derive-2.1.0
                   rust-pest-generator-2.1.3
                   rust-pest-meta-2.1.3
                   rust-pkg-config-0.3.19
                   rust-proc-macro2-1.0.24
                   rust-quote-1.0.9
                   rust-rcalc-lib-0.9.3
                   rust-rust-ini-0.14.0
                   rust-rusttype-0.9.2
                   rust-ryu-1.0.5
                   rust-same-file-1.0.6
                   rust-serde-1.0.123
                   rust-serde-derive-1.0.123
                   rust-serde-json-1.0.62
                   rust-serde-yaml-0.8.17
                   rust-sha-1-0.8.2
                   rust-shlex-0.1.1
                   rust-smallvec-1.6.1
                   rust-syn-1.0.60
                   rust-thread-local-1.1.3
                   rust-time-0.1.44
                   rust-timerfd-1.2.0
                   rust-ttf-parser-0.6.2
                   rust-typenum-1.12.0
                   rust-ucd-trie-0.1.3
                   rust-unicode-segmentation-1.7.1
                   rust-unicode-xid-0.2.1
                   rust-void-1.0.2
                   rust-walkdir-2.3.2
                   rust-wasi-0.10.0+wasi-snapshot-preview1
                   rust-wayland-client-0.28.3
                   rust-wayland-commons-0.28.3
                   rust-wayland-protocols-0.28.3
                   rust-wayland-scanner-0.28.3
                   rust-wayland-sys-0.28.3
                   rust-winapi-0.3.9
                   rust-winapi-i686-pc-windows-gnu-0.4.0
                   rust-winapi-util-0.1.5
                   rust-winapi-x86-64-pc-windows-gnu-0.4.0
                   rust-xml-rs-0.8.3
                   rust-yaml-rust-0.4.5
                   rust-yeslogic-fontconfig-sys-2.11.1)))


;;;
;;; Package definition
;;;

(define-public wldash
  (package
    (name "wldash")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kennylevinsen/wldash/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1cqjykpj25qxl86yadm9bnp6qwn41449v1dxf3xsmvjvpjaxkm1x"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:tests? #f))      ;no test suite
    (inputs
     (cons* alsa-lib
            dbus
            fontconfig
            pulseaudio
            wayland
            (cargo-inputs 'wldash
                          #:module '(gaurix packages wldash))))
    (native-inputs (list pkg-config))
    (supported-systems '("x86_64-linux" "aarch64-linux"))
    (synopsis "Wayland launcher and dashboard")
    (description
     "Wldash is a dashboard and launcher for Wayland compositors that support
the wlr-layer-shell protocol.  It provides a launcher with fuzzy matching,
a clock widget, a battery indicator, a PulseAudio volume display, and a
backlight control.  Configuration is done via YAML or JSON files.")
    (home-page "https://github.com/kennylevinsen/wldash")
    (license license:gpl3)))
