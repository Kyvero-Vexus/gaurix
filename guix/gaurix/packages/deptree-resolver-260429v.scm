;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260429v
;;; 100 BLOCKED evaluated, 1 resolved to DONE, 1 new package.
;;; 1 new recipe:
;;;   hnefatafl-copenhagen → DONE (Copenhagen Hnefatafl board game, Rust/Cargo)
;;; 99 remain BLOCKED (intractable categories confirmed).
;;;
;;; Key findings this pass:
;;; - hnefatafl-copenhagen (#18404): was BLOCKED as COMPLEX_DEPS because
;;;   it is a Rust application with 735 transitive crate dependencies.
;;;   Resolution: Guix's cargo-build-system with crate-source origins
;;;   provides all crate dependencies inline.  Source from crates.io,
;;;   hash verified.  System deps: alsa-lib, openssl, vulkan-loader,
;;;   libxkbcommon, wayland, pkg-config.
;;; - All other 99 packages re-evaluated: categories stable, no new
;;;   resolution paths found.  Key blockers: DKMS kernel modules (9),
;;;   multilib/lib32 (5), MinGW cross-compilation (9), proprietary (9),
;;;   Arch-specific tools (9), SELinux (2), kernel headers (4),
;;;   abandoned upstream (5), not-in-AUR (9), .NET/dotnet (3),
;;;   Electron apps (3), init-system-specific (2), Wine/complex (2),
;;;   platform-unsupported (5), Crystal language (1), hardware-specific (3),
;;;   complex dependencies (9).
;;;
;;; Verification: AUR cache (110883 packages) and upstream Guix checked.
;;; See deptree-resolver-260429v-blocked-notes.scm for detailed evaluation.
;;;
;;; Generated: 2026-04-29

(define-module (gaurix packages deptree-resolver-260429v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages vulkan)
  #:export (hnefatafl-copenhagen))

;;; ========================================================================
;;; RESOLVED: hnefatafl-copenhagen
;;; ========================================================================
;;; Copenhagen Hnefatafl client, engine, server, and AI.
;;; A board game implementing the Copenhagen variant of the ancient Viking
;;; game Hnefatafl.  Features online play, AI opponents, and a graphical
;;; client built with the Iced GUI framework.
;;;
;;; Source: https://codeberg.org/dcampbell/hnefatafl (crates.io release)
;;; Build: cargo-build-system, 735 crate dependencies (all hashes verified
;;;   via crates.io sparse index).
;;; License: AGPL-3.0-or-later
;;; System deps: alsa-lib (audio), openssl (TLS), vulkan-loader (GPU),
;;;   libxkbcommon (keyboard), wayland (display), pkg-config (build).

(define-public hnefatafl-copenhagen
  (package
    (name "hnefatafl-copenhagen")
    (version "5.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hnefatafl-copenhagen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fdk1y8x6x6bdj1v038lmznc8hsc9slgp74rll3lzda2mdanc20a"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f))
    (native-inputs (list pkg-config))
    (inputs (list alsa-lib
                  openssl
                  vulkan-loader
                  libxkbcommon
                  wayland
               (crate-source "ab_glyph" "0.2.32"
                "1hkc7y8yjd261d5cm9771dawnwc26rgdlniv3jysb3n3f9s4bh01")
               (crate-source "ab_glyph_rasterizer" "0.1.10"
                "065n6bj7kqk6f12336lm87fqmvf4lxg7rkg2j56nix228jmgnvrn")
               (crate-source "adler2" "2.0.1"
                "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j")
               (crate-source "ahash" "0.8.12"
                "0xbsp9rlm5ki017c0w6ay8kjwinwm8knjncci95mii30rmwz25as")
               (crate-source "aho-corasick" "1.1.4"
                "00a32wb2h07im3skkikc495jvncf62jl6s96vwc7bhi70h9imlyx")
               (crate-source "aligned" "0.4.3"
                "1186lhb3gb4x6spzw7ff0zcraa8cr9zqk4ldpm5g1vb2ijc0higf")
               (crate-source "aligned-vec" "0.6.4"
                "16vnf78hvfix5cwzd5xs5a2g6afmgb4h7n6yfsc36bv0r22072fw")
               (crate-source "alloca" "0.4.0"
                "1x6p4387rz6j7h342kp3b7bgvqzyl9mibf959pkfk9xflrgd19z5")
               (crate-source "alsa" "0.11.0"
                "0pdx9k0766lfwnflia3vaxl89rfjc4v3riym5jl71mnwkq24fac1")
               (crate-source "alsa-sys" "0.4.0"
                "010yyg1wp3dijm6574s3m0r23azab1scxv7b0zvd6p96b846jxdd")
               (crate-source "android-activity" "0.6.1"
                "1k8v4mw8kijvmjmqwr05cjvk2arklx2968bjjpa5szc5aaq1nahg")
               (crate-source "android-build" "0.1.3"
                "1zdqn0h2kya3f05g55vg8x53ixh7khrmd5r3rw44cl2x2xj4rb4c")
               (crate-source "android-properties" "0.2.2"
                "016slvg269c0y120p9qd8vdfqa2jbw4j0g18gfw6p3ain44v4zpw")
               (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1")
               (crate-source "anes" "0.1.6"
                "16bj1ww1xkwzbckk32j2pnbn5vk6wgsl3q4p3j9551xbcarwnijb")
               (crate-source "anstream" "1.0.0"
                "13d2bj0xfg012s4rmq44zc8zgy1q8k9yp7yhvfnarscnmwpj2jl2")
               (crate-source "anstyle" "1.0.14"
                "0030szmgj51fxkic1hpakxxgappxzwm6m154a3gfml83lq63l2wl")
               (crate-source "anstyle-parse" "1.0.0"
                "03hkv2690s0crssbnmfkr76kw1k7ah2i6s5amdy9yca2n8w7zkjj")
               (crate-source "anstyle-query" "1.1.5"
                "1p6shfpnbghs6jsa0vnqd8bb8gd7pjd0jr7w0j8jikakzmr8zi20")
               (crate-source "anstyle-wincon" "3.0.11"
                "0zblannm70sk3xny337mz7c6d8q8i24vhbqi42ld8v7q1wjnl7i9")
               (crate-source "anyhow" "1.0.102"
                "0b447dra1v12z474c6z4jmicdmc5yxz5bakympdnij44ckw2s83z")
               (crate-source "arbitrary" "1.4.2"
                "1wcbi4x7i3lzcrkjda4810nqv03lpmvfhb0a85xrq1mbqjikdl63")
               (crate-source "arc-swap" "1.9.1"
                "01xjlahcya8igdalxmda375lnlhjqwjz0cdqhy0bc1jkyzb1yfka")
               (crate-source "arg_enum_proc_macro" "0.3.4"
                "1sjdfd5a8j6r99cf0bpqrd6b160x9vz97y5rysycsjda358jms8a")
               (crate-source "argon2" "0.6.0-rc.8"
                "1xfz1jmb8g37663nljz5wdl2sgy646qs4j642mnf3x1vnx00kxbs")
               (crate-source "arrayref" "0.3.9"
                "1jzyp0nvp10dmahaq9a2rnxqdd5wxgbvp8xaibps3zai8c9fi8kn")
               (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw")
               (crate-source "as-raw-xcb-connection" "1.0.1"
                "0sqgpz2ymv5yx76r5j2npjq2x5qvvqnw0vrs35cyv30p3pfp2m8p")
               (crate-source "as-slice" "0.2.1"
                "05j52y1ws8kir5zjxnl48ann0if79sb56p9nm76hvma01r7nnssi")
               (crate-source "ash" "0.38.0+1.3.281"
                "0vx4yf689v1rc680jvy8bnysx5sgd8f33wnp2vqaizh0v0v4kd0b")
               (crate-source "async-broadcast" "0.7.2"
                "0ckmqcwyqwbl2cijk1y4r0vy60i89gqc86ijrxzz5f2m4yjqfnj3")
               (crate-source "async-channel" "2.5.0"
                "1ljq24ig8lgs2555myrrjighycpx2mbjgrm3q7lpa6rdsmnxjklj")
               (crate-source "async-executor" "1.14.0"
                "0al1rmxjy7p7r6h50z698q5lwssqs5a2vzmqbazm1z2sv1rgjsy9")
               (crate-source "async-fs" "2.2.0"
                "1iclw9970mh4ndb0bd68a6901kqy81rf9yypvf78pvaavy0scd40")
               (crate-source "async-io" "2.6.0"
                "1z16s18bm4jxlmp6rif38mvn55442yd3wjvdfhvx4hkgxf7qlss5")
               (crate-source "async-lock" "3.4.2"
                "04c3xrrdrfrvh9v0ajxrangpy38qi76qq268zslphnxxjqjpy3r9")
               (crate-source "async-net" "2.0.0"
                "1xyc5a5vcp3a7h1q2lbfh79wz8136dig4q4x6g4w2ws8ml7h0j5r")
               (crate-source "async-process" "2.5.0"
                "0xfswxmng6835hjlfhv7k0jrfp7czqxpfj6y2s5dsp05q0g94l7w")
               (crate-source "async-recursion" "1.1.1"
                "04ac4zh8qz2xjc79lmfi4jlqj5f92xjvfaqvbzwkizyqd4pl4hrv")
               (crate-source "async-signal" "0.2.14"
                "11dlpb15la279r5cazppy18gbk2xzzl60ahzl19m1kr0l2psmdaj")
               (crate-source "async-task" "4.7.1"
                "1pp3avr4ri2nbh7s6y9ws0397nkx1zymmcr14sq761ljarh3axcb")
               (crate-source "async-trait" "0.1.89"
                "1fsxxmz3rzx1prn1h3rs7kyjhkap60i7xvi0ldapkvbb14nssdch")
               (crate-source "atomic-polyfill" "1.0.3"
                "1x00ndablb89zvbr8m03cgjzgajg86fqn8pgz85yy2gy1pivrwlc")
               (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m")
               (crate-source "autocfg" "1.5.0"
                "1s77f98id9l4af4alklmzq46f21c980v13z2r1pcxx6bqgw0d1n0")
               (crate-source "av-scenechange" "0.14.1"
                "1543y7riwcy4mmsgcalxcm3bnb41hvwiqiz774nbj68fq9vischg")
               (crate-source "av1-grain" "0.2.5"
                "1y3p43i5xncbny0pfh8kw09am3l3mgyg82ln65r3f434443xpzcc")
               (crate-source "avif-serialize" "0.8.8"
                "0gd5hr9vd2rkf9gn60f39rham6lzn8a4cdy0p57ihrxx0zq84l1p")
               (crate-source "aws-lc-rs" "1.16.3"
                "13q3i8j2nfykpw0yln0n21m70nfgls5b9gz1lxgsf94hwqzzpihf")
               (crate-source "aws-lc-sys" "0.40.0"
                "1rrghm82i50zz40ykizqnrn65lavf856hqfiz6wffh8ybvp3f07m")
               (crate-source "badwords-rs" "0.4.0"
                "0dqr3ggpiadbd5yld99slncrwg2cmg8058jycpvaf9hmkyk5vy56")
               (crate-source "base62" "2.2.4"
                "0jzfkr5ldw7g5sh1l62qsxrhvnfpq9hw0kb8qkxvf3n6672plqyd")
               (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj")
               (crate-source "base64ct" "1.8.3"
                "01nyyyx84bhwrcc168hn47d8gvz2pzpv3y3lmck7mq4hw5vh3x9a")
               (crate-source "bincode" "1.3.3"
                "1bfw3mnwzx5g1465kiqllp5n4r10qrqy88kdlp3jfwnq2ya5xx5i")
               (crate-source "bit-set" "0.8.0"
                "18riaa10s6n59n39vix0cr7l2dgwdhcpbcm97x1xbyfp1q47x008")
               (crate-source "bit-vec" "0.8.0"
                "1xxa1s2cj291r7k1whbxq840jxvmdsq9xgh7bvrxl46m80fllxjy")
               (crate-source "bit_field" "0.10.3"
                "1ikhbph4ap4w692c33r8bbv6yd2qxm1q3f64845grp1s6b3l0jqy")
               (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy")
               (crate-source "bitflags" "2.11.1"
                "1cvqijg3rvwgis20a66vfdxannjsxfy5fgjqkaq3l13gyfcj4lf4")
               (crate-source "bitstream-io" "4.10.0"
                "07zxcy47l51k6vsxphzhgcnqyzl21pprs7212687c64s56z01zvy")
               (crate-source "blake2" "0.11.0-rc.6"
                "141np599s7lwrk0mmyqrxrgwmh13k7ad4y5kzcgqwcjy484il7q6")
               (crate-source "block" "0.1.6"
                "16k9jgll25pzsq14f244q22cdv0zb4bqacldg3kx6h89d7piz30d")
               (crate-source "block-buffer" "0.12.0"
                "1glh8w49a7cj0wlkalyn9j605jzf2ss0lg8dqq5xh8cr2q451lyd")
               (crate-source "block2" "0.5.1"
                "0pyiha5his2grzqr3mynmq244laql2j20992i59asp0gy7mjw4rc")
               (crate-source "block2" "0.6.2"
                "1xcfllzx6c3jc554nmb5qy6xmlkl6l6j5ib4wd11800n0n3rvsyd")
               (crate-source "blocking" "1.6.2"
                "08bz3f9agqlp3102snkvsll6wc9ag7x5m1xy45ak2rv9pq18sgz8")
               (crate-source "borsh" "1.6.1"
                "0nhqivq6rp7318hcns1rf25gpsdd7wvwhbxpzblpspasjpwf7lfg")
               (crate-source "bstr" "1.12.1"
                "1arc1v7h5l86vd6z76z3xykjzldqd5icldn7j9d3p7z6x0d4w133")
               (crate-source "built" "0.8.0"
                "0r5f08lpjsr6j5ajkbmd0ymfmajpq8ddbfvi8ji8rx48y88qzbgl")
               (crate-source "bumpalo" "3.20.2"
                "1jrgxlff76k9glam0akhwpil2fr1w32gbjdf5hpipc7ld2c7h82x")
               (crate-source "bytemuck" "1.25.0"
                "1v1z32igg9zq49phb3fra0ax5r2inf3aw473vldnm886sx5vdvy8")
               (crate-source "bytemuck_derive" "1.10.2"
                "1zvmjmw1sdmx9znzm4dpbb2yvz9vyim8w6gp4z256l46qqdvvazr")
               (crate-source "byteorder" "1.5.0"
                "0jzncxyf404mwqdbspihyzpkndfgda450l0893pz5xj685cg5l0z")
               (crate-source "byteorder-lite" "0.1.0"
                "15alafmz4b9az56z6x7glcbcb6a8bfgyd109qc3bvx07zx4fj7wg")
               (crate-source "bytes" "1.11.1"
                "0czwlhbq8z29wq0ia87yass2mzy1y0jcasjb8ghriiybnwrqfx0y")
               (crate-source "calloop" "0.13.0"
                "1v5zgidnhsyml403rzr7vm99f8q6r5bxq5gxyiqkr8lcapwa57dr")
               (crate-source "calloop" "0.14.4"
                "1xsd8xk53v9zbvhjy7ynf4gya9s4rvvh8jqx9psi1b2v6rw9kgsd")
               (crate-source "calloop-wayland-source" "0.3.0"
                "086x5mq16prrcwd9k6bw9an0sp8bj9l5daz4ziz5z4snf2c6m9lm")
               (crate-source "calloop-wayland-source" "0.4.1"
                "1yi1c23naqhd8m94q3v366s4cak8l50zy7ldrkqfn0hajkqgr3hk")
               (crate-source "cast" "0.3.0"
                "1dbyngbyz2qkk0jn2sxil8vrz3rnpcj142y184p9l4nbl9radcip")
               (crate-source "cc" "1.2.61"
                "0vawvnrrsmi8dygavq3wx085cmlp10sp3fhld5842rlqkqsr0vfi")
               (crate-source "cesu8" "1.1.0"
                "0g6q58wa7khxrxcxgnqyi9s1z2cjywwwd3hzr5c55wskhx6s0hvd")
               (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k")
               (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1")
               (crate-source "chacha20" "0.10.0"
                "00bn2rn8l68qvlq93mhq7b4ns4zy9qbjsyjbb9kljgl4hqr9i3bg")
               (crate-source "chrono" "0.4.44"
                "1c64mk9a235271j5g3v4zrzqqmd43vp9vki7vqfllpqf5rd0fwy6")
               (crate-source "ciborium" "0.2.2"
                "03hgfw4674im1pdqblcp77m7rc8x2v828si5570ga5q9dzyrzrj2")
               (crate-source "ciborium-io" "0.2.2"
                "0my7s5g24hvp1rs1zd1cxapz94inrvqpdf1rslrvxj8618gfmbq5")
               (crate-source "ciborium-ll" "0.2.2"
                "1n8g4j5rwkfs3rzfi6g1p7ngmz6m5yxsksryzf5k72ll7mjknrjp")
               (crate-source "clap" "4.6.1"
                "0lcf88l7vlg796rrqr7wipbbmfa5sgsgx4211b7xmxxv8dz13nqx")
               (crate-source "clap_builder" "4.6.0"
                "17q6np22yxhh5y5v53y4l31ps3hlaz45mvz2n2nicr7n3c056jki")
               (crate-source "clap_derive" "4.6.1"
                "1acpz49hi00iv9jkapixjzcv7s51x8qkfaqscjm36rqgf428dkpj")
               (crate-source "clap_lex" "1.1.0"
                "1ycqkpygnlqnndghhcxjb44lzl0nmgsia64x9581030yifxs7m68")
               (crate-source "clap_mangen" "0.3.0"
                "01qghmfrn9d73hkddq085h22h1y3b84n1n0d16za7xprbfs44a6q")
               (crate-source "clipboard-win" "5.4.1"
                "1m44gqy11rq1ww7jls86ppif98v6kv2wkwk8p17is86zsdq3gq5x")
               (crate-source "clipboard_macos" "0.1.1"
                "13zkbmnsl2c98452kvia7vr2ywwl123bj2q81diw78vv0jm4lzwv")
               (crate-source "clipboard_wayland" "0.2.2"
                "1f1prf3qhww5qqbbqbf27ygq103z9r1b678cs4lpg672qimqhgq0")
               (crate-source "clipboard_x11" "0.4.3"
                "1m2szxgxk8s8j7anp73pdijdp50yvnjhakscj8wzvnpza8sf6qxx")
               (crate-source "cmake" "0.1.58"
                "0y06zxw5sv1p5vvpp5rz1qwbrq7ccawrl09nqy5ahx1a5418mxy0")
               (crate-source "cmov" "0.5.3"
                "0ipp2fzpcz2z9l4ywks98bd1viwpw81lfd5pdj3sdi0z04ys921z")
               (crate-source "cobs" "0.3.0"
                "18f0kxxa1fqb8pz2dxwssnhsrvhrs5j4p8xllgin5d7h36sn3a8g")
               (crate-source "codespan-reporting" "0.12.0"
                "108g41xqzhr8fx8hlpy5qzmqq8ylldbj37wndkaqm34yy1d2wvgy")
               (crate-source "color_quant" "1.1.0"
                "12q1n427h2bbmmm1mnglr57jaz2dj9apk0plcxw7nwqiai7qjyrx")
               (crate-source "colorchoice" "1.0.5"
                "0w75k89hw39p0mnnhlrwr23q50rza1yjki44qvh2mgrnj065a1qx")
               (crate-source "combine" "4.6.7"
                "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms")
               (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c")
               (crate-source "core-foundation" "0.10.1"
                "1xjns6dqf36rni2x9f47b65grxwdm20kwdg9lhmzdrrkwadcv9mj")
               (crate-source "core-foundation" "0.9.4"
                "13zvbbj07yk3b61b8fhwfzhy35535a583irf23vlcg59j7h9bqci")
               (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp")
               (crate-source "core-graphics" "0.23.2"
                "10dhv3gk4kmbzl14xxkrhhky4fdp8h6nzff6h0019qgr6nz84xy0")
               (crate-source "core-graphics-types" "0.1.3"
                "1bxg8nxc8fk4kxnqyanhf36wq0zrjr552c58qy6733zn2ihhwfa5")
               (crate-source "core-graphics-types" "0.2.0"
                "1sqka1rz84lr3p69i1s6lggnpnznmrw4ngc5q76w9xhky80s2i1x")
               (crate-source "core_maths" "0.1.1"
                "0c0dv11ixxpc9bsx5xasvl98mb1dlprzcm6qq6ls3nsygw0mwx3p")
               (crate-source "coreaudio-rs" "0.14.1"
                "11imkq5iwxkf31sgbvx8cq1jy6ni67m79i2nfq6bj8d0f955gp8n")
               (crate-source "cosmic-text" "0.15.0"
                "0dvpwc4rb7gysrd7sir10k2hk2j2vis6xn35wg5s6mws78l54f0p")
               (crate-source "cpal" "0.17.3"
                "1mq6lpmzfpnjs7gn8wv8qpnj951g7wk1dinasyaxiw60caijv56q")
               (crate-source "cpufeatures" "0.3.0"
                "00fjhygsqmh4kbxxlb99mcsbspxcai6hjydv4c46pwb67wwl2alb")
               (crate-source "crc32fast" "1.5.0"
                "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl")
               (crate-source "criterion" "0.8.2"
                "1wwq9pfildrkqgb5pq3mwmv297kvvsizkx7m6sjzk4i4mar4c04m")
               (crate-source "criterion-plot" "0.8.2"
                "1si9mrnzgs0123mr6d5pmhxq29rxph2q6pbvwjal6mav9wphmn6q")
               (crate-source "critical-section" "1.2.0"
                "02ylhcykxjc40xrfhk1lwc21jqgz4dbwv3jr49ymw733c51yl3kr")
               (crate-source "crossbeam-deque" "0.8.6"
                "0l9f1saqp1gn5qy0rxvkmz4m6n7fc0b3dbm6q1r5pmgpnyvi3lcx")
               (crate-source "crossbeam-epoch" "0.9.18"
                "03j2np8llwf376m3fxqx859mgp9f83hj1w34153c7a9c7i5ar0jv")
               (crate-source "crossbeam-utils" "0.8.21"
                "0a3aa2bmc8q35fb67432w16wvi54sfmb69rk9h5bhd18vw0c99fh")
               (crate-source "crunchy" "0.2.4"
                "1mbp5navim2qr3x48lyvadqblcxc1dm0lqr0swrkkwy2qblvw3s6")
               (crate-source "cryoglyph" "0.1.0"
                "06f5dvmsirrkrrpnyv92gdcsd7801a9n7cbgfdhx9nycvddpkg08")
               (crate-source "crypto-common" "0.2.1"
                "041p8bs680hrg6rhicfifn19cfvybq9aya5i4i0k08d9byqpnwkp")
               (crate-source "csv" "1.4.0"
                "0f7r2ip0rbi7k377c3xmsh9xd69sillffhpfmbgnvz3yrxl9vkaj")
               (crate-source "csv-core" "0.1.13"
                "10lppd3fdb1i5npgx9xqjs5mjmy2qbdi8n16i48lg03ak4k3qjkh")
               (crate-source "ctor" "0.10.1"
                "1gxwv3anxszkiipdfqlwqflih3a831np31c6wvgwc5hvcm10vkw3")
               (crate-source "ctrlc" "3.5.2"
                "0qh1lvlr6k58dliqllx1n7mjfwp1mzr607bks3r9m0a5msrgmcg0")
               (crate-source "ctutils" "0.4.2"
                "17m2s9jv7i780k26cq2fcyslg0pakv9plwdrmygdwha1hfiiambx")
               (crate-source "cursor-icon" "1.2.0"
                "0bvkw7ak1mqwcpkgd9lh7n00hcvlh87jfl7188f231nz6zfy2ypj")
               (crate-source "dasp_sample" "0.11.0"
                "0zzw35akm3qs2rixbmlijk6h0l4g9ry6g74qc59zv1q8vs1f31qc")
               (crate-source "digest" "0.11.2"
                "0g0m77q7zfafm4jgy6i70wwimy9f41ywidbz9w467rh8px4xnl28")
               (crate-source "directories" "6.0.0"
                "0zgy2w088v8w865c11dmc3dih899fgrhvrfp7g83h6v6ai60kx8n")
               (crate-source "dirs-sys" "0.5.0"
                "1aqzpgq6ampza6v012gm2dppx9k35cdycbj54808ksbys9k366p0")
               (crate-source "dispatch" "0.2.0"
                "0fwjr9b7582ic5689zxj8lf7zl94iklhlns3yivrnv8c9fxr635x")
               (crate-source "dispatch2" "0.3.1"
                "0f5xmnbzpaz1g80m27kd804p75nswh0ikb6wvqh4ba3x9rz3c3hy")
               (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp")
               (crate-source "dlib" "0.5.3"
                "0jpr4smrwrv8xj70mz4ixnbc6ljm82f12z2mz1hv89056y3wv3mb")
               (crate-source "doc-comment" "0.3.4"
                "1j8jbrw8335hciwn3h2idkfc3kmx3pfn0sxcwjw1m8lmn6w5a2bq")
               (crate-source "document-features" "0.2.12"
                "0qcgpialq3zgvjmsvar9n6v10rfbv6mk6ajl46dd4pj5hn3aif6l")
               (crate-source "downcast-rs" "1.2.1"
                "1lmrq383d1yszp7mg5i7i56b17x2lnn3kb91jwsq0zykvg2jbcvm")
               (crate-source "dpi" "0.1.2"
                "0xhsvzgjvdch2fwmfc9vkb708b0q59b6imypyjlgbiigyb74rcfq")
               (crate-source "dtor" "0.8.1"
                "0nvpl8nwcc8bd9ah2jhfwj9wbfyxa7dcmf4g991xvmll2pfk9wpd")
               (crate-source "dunce" "1.0.5"
                "04y8wwv3vvcqaqmqzssi6k0ii9gs6fpz96j5w9nky2ccsl23axwj")
               (crate-source "either" "1.15.0"
                "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8")
               (crate-source "email-encoding" "0.4.1"
                "1dkhcqmhgc25m437fzxhkvhd135yc4xd9pzpsc77i7lv9m8fd64j")
               (crate-source "email_address" "0.2.9"
                "0jf4v3npa524c7npy7w3jl0a6gng26f51a4bgzs3jqna12dz2yg0")
               (crate-source "embedded-io" "0.4.0"
                "1v9wrc5nsgaaady7i3ya394sik5251j0iq5rls7mrx7fv696h6pg")
               (crate-source "embedded-io" "0.6.1"
                "0v901xykajh3zffn6x4cnn4fhgfw3c8qpjwbsk6gai3gaccg3l7d")
               (crate-source "encoding_rs" "0.8.35"
                "1wv64xdrr9v37rqqdjsyb8l8wzlcbab80ryxhrszvnj59wy0y0vm")
               (crate-source "endi" "1.1.1"
                "16a0076dx41vgrzzimm9clcym77h732czqjiajanmzvd1i1y5dv6")
               (crate-source "enumflags2" "0.7.12"
                "1vzcskg4dca2jiflsfx1p9yw1fvgzcakcs7cpip0agl51ilgf9qh")
               (crate-source "enumflags2_derive" "0.7.12"
                "09rqffacafl1b83ir55hrah9gza0x7pzjn6lr6jm76fzix6qmiv7")
               (crate-source "env_filter" "1.0.1"
                "1vvf9xhaxm0m78bp23b8j3cbv1vm5vffn3gaas27mc64rhm0rs9j")
               (crate-source "env_logger" "0.11.10"
                "0smmk1hqzk7z91rg7fdq98d03gh9kidkd0ymim43zb4n457w0886")
               (crate-source "equator" "0.4.2"
                "1z760z5r0haxjyakbqxvswrz9mq7c29arrivgq8y1zldhc9v44a7")
               (crate-source "equator-macro" "0.4.2"
                "1cqzx3cqn9rxln3a607xr54wippzff56zs5chqdf3z2bnks3rwj4")
               (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7")
               (crate-source "errno" "0.3.14"
                "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir")
               (crate-source "error-code" "3.3.2"
                "0nacxm9xr3s1rwd6fabk3qm89fyglahmbi4m512y0hr8ym6dz8ny")
               (crate-source "etagere" "0.2.15"
                "0hjkik00nl8bm9fafpzqkb6yah3mkphc21zpc159a5fwwncvz2gw")
               (crate-source "euclid" "0.22.14"
                "01ksjl4vb8ms89laswnjpld3z4n6c1s7qlqq0djx3imiwdjm787i")
               (crate-source "event-listener" "5.4.1"
                "1asnp3agbr8shcl001yd935m167ammyi8hnvl0q1ycajryn6cfz1")
               (crate-source "event-listener-strategy" "0.5.4"
                "14rv18av8s7n8yixg38bxp5vg2qs394rl1w052by5npzmbgz7scb")
               (crate-source "exr" "1.74.0"
                "1gk3cc2qkfm0jqw4v1d7g4c356k9iz583bq17iiwp8kalm1y0023")
               (crate-source "fastrand" "2.4.1"
                "1mnqxxnxvd69ma9mczabpbbsgwlhd6l78yv3vd681453a9s247wz")
               (crate-source "fax" "0.2.6"
                "1ax0jmvsszxd03hj6ga1kyl7gaqcfw0akg2wf0q6gk9pizaffpgh")
               (crate-source "fax_derive" "0.2.0"
                "0zap434zz4xvi5rnysmwzzivig593b4ng15vwzwl7js2nw7s3b50")
               (crate-source "fdeflate" "0.3.7"
                "130ga18vyxbb5idbgi07njymdaavvk6j08yh1dfarm294ssm6s0y")
               (crate-source "find-msvc-tools" "0.1.9"
                "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv")
               (crate-source "finl_unicode" "1.4.0"
                "1md4j32sa8g6y7q9yphpslhhjdjxig1bczkjp8mxccz5lv1xsi4q")
               (crate-source "flate2" "1.1.9"
                "0g2pb7cxnzcbzrj8bw4v6gpqqp21aycmf6d84rzb6j748qkvlgw4")
               (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz")
               (crate-source "foldhash" "0.1.5"
                "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r")
               (crate-source "foldhash" "0.2.0"
                "1nvgylb099s11xpfm1kn2wcsql080nqmnhj1l25bp3r2b35j9kkp")
               (crate-source "font-types" "0.10.1"
                "1idqs7pfv9134fzkfykjcg5x34gfjclpqqccln7d9jxv0ks599ir")
               (crate-source "font-types" "0.11.3"
                "1mygnhm4xrnm803w2ax63ka3nm0s56l4h26mrs9xkbbdby8ssf2v")
               (crate-source "fontconfig-parser" "0.5.8"
                "0ijnbzg31sl6v49g7q2l7sl76hjj8z0hvlsz77cdvm029vi77ixv")
               (crate-source "fontdb" "0.23.0"
                "0199vry9x8zn9ix4x4rqvv53dy2ryhy68l53jwr580hj7ndphzj5")
               (crate-source "foreign-types" "0.3.2"
                "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn")
               (crate-source "foreign-types" "0.5.0"
                "0rfr2zfxnx9rz3292z5nyk8qs2iirznn5ff3rd4vgdwza6mdjdyp")
               (crate-source "foreign-types-macros" "0.2.3"
                "0hjpii8ny6l7h7jpns2cp9589016l8mlrpaigcnayjn9bdc6qp0s")
               (crate-source "foreign-types-shared" "0.1.1"
                "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00")
               (crate-source "foreign-types-shared" "0.3.1"
                "0nykdvv41a3d4py61bylmlwjhhvdm0b3bcj9vxhqgxaxnp5ik6ma")
               (crate-source "form_urlencoded" "1.2.2"
                "1kqzb2qn608rxl3dws04zahcklpplkd5r1vpabwga5l50d2v4k6b")
               (crate-source "fs_extra" "1.3.0"
                "075i25z70j2mz9r7i9p9r521y8xdj81q7skslyb7zhqnnw33fw22")
               (crate-source "futures" "0.3.32"
                "0b9q86r5ar18v5xjiyqn7sb8sa32xv98qqnfz779gl7ns7lpw54b")
               (crate-source "futures-channel" "0.3.32"
                "07fcyzrmbmh7fh4ainilf1s7gnwvnk07phdq77jkb9fpa2ffifq7")
               (crate-source "futures-core" "0.3.32"
                "07bbvwjbm5g2i330nyr1kcvjapkmdqzl4r6mqv75ivvjaa0m0d3y")
               (crate-source "futures-executor" "0.3.32"
                "17aplz3ns74qn7a04qg7qlgsdx5iwwwkd4jvdfra6hl3h4w9rwms")
               (crate-source "futures-io" "0.3.32"
                "063pf5m6vfmyxj74447x8kx9q8zj6m9daamj4hvf49yrg9fs7jyf")
               (crate-source "futures-lite" "2.6.1"
                "1ba4dg26sc168vf60b1a23dv1d8rcf3v3ykz2psb7q70kxh113pp")
               (crate-source "futures-macro" "0.3.32"
                "0ys4b1lk7s0bsj29pv42bxsaavalch35rprp64s964p40c1bfdg8")
               (crate-source "futures-sink" "0.3.32"
                "14q8ml7hn5a6gyy9ri236j28kh0svqmrk4gcg0wh26rkazhm95y3")
               (crate-source "futures-task" "0.3.32"
                "14s3vqf8llz3kjza33vn4ixg6kwxp61xrysn716h0cwwsnri2xq3")
               (crate-source "futures-util" "0.3.32"
                "1mn60lw5kh32hz9isinjlpw34zx708fk5q1x0m40n6g6jq9a971q")
               (crate-source "gethostname" "1.1.0"
                "1n6bj9gh503ggjblfjcai96gmxynxsrykaynljlrfdra34q95m0v")
               (crate-source "getrandom" "0.2.17"
                "1l2ac6jfj9xhpjjgmcx6s1x89bbnw9x6j9258yy6xjkzpq0bqapz")
               (crate-source "getrandom" "0.3.4"
                "1zbpvpicry9lrbjmkd4msgj3ihff1q92i334chk7pzf46xffz7c9")
               (crate-source "getrandom" "0.4.2"
                "0mb5833hf9pvn9dhvxjgfg5dx0m77g8wavvjdpvpnkp9fil1xr8d")
               (crate-source "gif" "0.14.2"
                "0n81js7vlb9bwrjb765sicza3k0vrihjddrgm2mvpbfr272gr37f")
               (crate-source "gl_generator" "0.14.0"
                "0k8j1hmfnff312gy7x1aqjzcm8zxid7ij7dlb8prljib7b1dz58s")
               (crate-source "glam" "0.25.0"
                "1cr80mz1qyc73fvp2d93d4g2svv675fmcrkrzi0bpyajpvcna5hm")
               (crate-source "glob" "0.3.3"
                "106jpd3syfzjfj2k70mwm0v436qbx96wig98m4q8x071yrq35hhc")
               (crate-source "globset" "0.4.18"
                "1qsp3wg0mgxzmshcgymdlpivqlc1bihm6133pl6dx2x4af8w3psj")
               (crate-source "globwalk" "0.8.1"
                "1k6xwkydr7igvwjn3xkwjywk4213lcs53f576ilqz1h84jaazqwk")
               (crate-source "glow" "0.16.0"
                "022z12nlyfpy36fvp2szq792xix1xbgkznpmicf1c404sxhfmrf5")
               (crate-source "glutin_wgl_sys" "0.6.1"
                "0gng2810jb5x133lmy17qifjx6s90lnprm86afg7mfls505y0kic")
               (crate-source "gpu-alloc" "0.6.0"
                "0wd1wq7qs8ja0cp37ajm9p1r526sp6w0kvjp3xx24jsrjfx2vkgv")
               (crate-source "gpu-alloc-types" "0.3.0"
                "190wxsp9q8c59xybkfrlzqqyrxj6z39zamadk1q7v0xad2s07zwq")
               (crate-source "gpu-allocator" "0.27.0"
                "1kfa6kvvslmrr63p4n5fsm8myp03xi5lzylywys9f0l0xyjs4lf1")
               (crate-source "gpu-descriptor" "0.3.2"
                "1jm0acxkw9lrzzcbvjqynwdr53qsqz7vx5d8c8h77qq5j4s8775q")
               (crate-source "gpu-descriptor-types" "0.2.0"
                "14ab90klss7w0ybj95fcnqxjsjya17xjhf576dpvi4zq5ml45wpx")
               (crate-source "guillotiere" "0.6.2"
                "10m7fhp5kzf09kz08k6apkbzblriyqynjl1wwa9i7jrnq1jmhbdn")
               (crate-source "h2" "0.4.13"
                "0m6w5gg0n0m1m5915bxrv8n4rlazhx5icknkslz719jhh4xdli1g")
               (crate-source "half" "2.7.1"
                "0jyq42xfa6sghc397mx84av7fayd4xfxr4jahsqv90lmjr5xi8kf")
               (crate-source "harfrust" "0.3.2"
                "1n5r45i2f8w71ia9vql7c8da1qxd7j3hfxpylc98l7f72bdj1h4j")
               (crate-source "hash32" "0.2.1"
                "0rrbv5pc5b1vax6j6hk7zvlrpw0h6aybshxy9vbpgsrgfrc5zhxh")
               (crate-source "hashbrown" "0.15.5"
                "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj")
               (crate-source "hashbrown" "0.16.1"
                "004i3njw38ji3bzdp9z178ba9x3k0c1pgy8x69pj7yfppv4iq7c4")
               (crate-source "hashbrown" "0.17.0"
                "0l8gvcz80lvinb7x22h53cqbi2y1fm603y2jhhh9qwygvkb7sijg")
               (crate-source "heapless" "0.7.17"
                "0kwn2wzk9fnsqnwp6rqjqhvh6hfq4rh225xwqjm72b5n1ry4bind")
               (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113")
               (crate-source "hermit-abi" "0.5.2"
                "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw")
               (crate-source "hex" "0.4.3"
                "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z")
               (crate-source "hexf-parse" "0.2.1"
                "1pr3a3sk66ddxdyxdxac7q6qaqjcn28v0njy22ghdpfn78l8d9nz")
               (crate-source "hostname" "0.4.2"
                "1g8cfg0a1v8y5a0zkncbns8hh24amjgskl39cc583wxfawsslyk1")
               (crate-source "http" "1.4.0"
                "06iind4cwsj1d6q8c2xgq8i2wka4ps74kmws24gsi1bzdlw2mfp3")
               (crate-source "http-body" "1.0.1"
                "111ir5k2b9ihz5nr9cz7cwm7fnydca7dx4hc7vr16scfzghxrzhy")
               (crate-source "http-body-util" "0.1.3"
                "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh")
               (crate-source "httparse" "1.10.1"
                "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd")
               (crate-source "httpdate" "1.0.3"
                "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz")
               (crate-source "hybrid-array" "0.4.11"
                "1i878m874s249357fx3rzj4fx8b4rlrxw19vpnazwlgdl0vnim08")
               (crate-source "hyper" "1.9.0"
                "1jmwbwqcaficskg76kq402gbymbnh2z4v99xwq3l5aa6n8bg16b2")
               (crate-source "hyper-rustls" "0.27.9"
                "03vfnsm873wsp1dk0q85nxvk7w6syp8c2m5bcdjcyfgg4786ijik")
               (crate-source "hyper-util" "0.1.20"
                "186zdc58hmm663csmjvrzgkr6jdh93sfmi3q2pxi57gcaqjpqm4n")
               (crate-source "iana-time-zone" "0.1.65"
                "0w64khw5p8s4nzwcf36bwnsmqzf61vpwk9ca1920x82bk6nwj6z3")
               (crate-source "iana-time-zone-haiku" "0.1.2"
                "17r6jmj31chn7xs9698r122mapq85mfnv98bb4pg6spm0si2f67k")
               (crate-source "iced" "0.14.0"
                "1cqzf3fzcwn4j696yzrpb8k5ar8fv8xdp8sphczn9flkdh1023h0")
               (crate-source "iced_aw" "0.13.1"
                "1qlg6y83xpj27m49fi9dkmmdmbz8g2mc3ji9xxz9qh9a6a6nnrry")
               (crate-source "iced_beacon" "0.14.0"
                "0ic87wy6hqd8w9ai11gsb70pj3agy5rzdphridg7l9a40jbqz902")
               (crate-source "iced_core" "0.14.0"
                "11cxf8scyvx4r722q1dj9agyxg02m51yfai5d5z3wh4rsqvikawi")
               (crate-source "iced_debug" "0.14.0"
                "1gm05qhb89xd625c7gz42wlgp8ar9vy3cghhyi9hwqjs46q5l0r5")
               (crate-source "iced_devtools" "0.14.0"
                "0fdkqh7y6yrymm24lappr1kp8yyvmw258bxh6hr5hp5c0siy5f2r")
               (crate-source "iced_fonts" "0.3.0"
                "07aczhpyd632xmd07lgxyvwab88mwdc0ws8n89vjiqwrhiygyk11")
               (crate-source "iced_fonts_macros" "0.3.0"
                "0bkmx102jdb895cl7vrfn2d5v369c632ja0aj78rrc8c25g15xby")
               (crate-source "iced_futures" "0.14.0"
                "02nz7wm85xmhl2ls8dyiab6dp80fmwcc0diw573vxps2mp68a34c")
               (crate-source "iced_graphics" "0.14.0"
                "00m18kxq58xwb6i81393r1m4jb14np8zm9cgyram05f4rv1a2k13")
               (crate-source "iced_program" "0.14.0"
                "0wx6whk9s61y6knmlcznkq7sc6m1gcrsq3dhis6ninkwjk1gxykd")
               (crate-source "iced_renderer" "0.14.0"
                "01dcbnp2l7ssg7yvk92qwqz44py60xynribfk1vw1s084j0c0315")
               (crate-source "iced_runtime" "0.14.0"
                "1m589zs8dk07vha6jfa1aik6b56lr0vf6hij31s6dh74kj0rp26i")
               (crate-source "iced_tiny_skia" "0.14.0"
                "0gfcx5i1qbr3ppja1p99xbm6xcy1zzyjj8szzx593g53fn5wy2py")
               (crate-source "iced_wgpu" "0.14.0"
                "04qwaqqaxj79pq7fql7989f84h020q04b4sp0ahzi80ckfcll57z")
               (crate-source "iced_widget" "0.14.2"
                "1aspx7drf0sprvgl4p7rz16hdlqidjp2phcbirhw429i1px6lndi")
               (crate-source "iced_winit" "0.14.0"
                "0x9d2qixfzbsiyhvayjb021c724bcygr6zbhp7iisban8zfbwzcb")
               (crate-source "icu_collections" "2.2.0"
                "070r7xd0pynm0hnc1v2jzlbxka6wf50f81wybf9xg0y82v6x3119")
               (crate-source "icu_locale_core" "2.2.0"
                "0a9cmin5w1x3bg941dlmgszn33qgq428k7qiqn5did72ndi9n8cj")
               (crate-source "icu_normalizer" "2.2.0"
                "1d7krxr0xpc4x9635k1100a24nh0nrc59n65j6yk6gbfkplmwvn5")
               (crate-source "icu_normalizer_data" "2.2.0"
                "0f5d5d5fhhr9937m2z6z38fzh6agf14z24kwlr6lyczafypf0fys")
               (crate-source "icu_properties" "2.2.0"
                "1pkh3s837808cbwxvfagwc28cvwrz2d9h5rl02jwrhm51ryvdqxy")
               (crate-source "icu_properties_data" "2.2.0"
                "052awny0qwkbcbpd5jg2cd7vl5ry26pq4hz1nfsgf10c3qhbnawf")
               (crate-source "icu_provider" "2.2.0"
                "08dl8pxbwr8zsz4c5vphqb7xw0hykkznwi4rw7bk6pwb3krlr70k")
               (crate-source "id-arena" "2.3.0"
                "0m6rs0jcaj4mg33gkv98d71w3hridghp5c4yr928hplpkgbnfc1x")
               (crate-source "idna" "1.1.0"
                "1pp4n7hppm480zcx411dsv9wfibai00wbpgnjj4qj0xa7kr7a21v")
               (crate-source "idna_adapter" "1.2.1"
                "0i0339pxig6mv786nkqcxnwqa87v4m94b2653f6k3aj0jmhfkjis")
               (crate-source "ignore" "0.4.25"
                "0jlv2s4fxqj9fsz6y015j5vbz6i475hj80j9q3sy05d0cniq5myk")
               (crate-source "image" "0.25.10"
                "0131b9fsd5grxf3lchfs2ci0rg8ga2mh1ygai7k2zh1k8cwq1aw5")
               (crate-source "image-webp" "0.2.4"
                "1hz814csyi9283vinzlkix6qpnd6hs3fkw7xl6z2zgm4w7rrypjj")
               (crate-source "imgref" "1.12.0"
                "1j3iwdal9mdkmyrsms3lz4n1bxxxjxss2jvbmh662fns63fcxig7")
               (crate-source "indexmap" "2.14.0"
                "1na9z6f0d5pkjr1lgsni470v98gv2r7c41j8w48skr089x2yjrnl")
               (crate-source "interpolate_name" "0.2.4"
                "0q7s5mrfkx4p56dl8q9zq71y1ysdj4shh6f28qf9gly35l21jj63")
               (crate-source "ipnet" "2.12.0"
                "1qpq2y0asyv0jppw7zww9y96fpnpinwap8a0phhqqgyy3znnz3yr")
               (crate-source "iri-string" "0.7.12"
                "082fpx6c5ghvmqpwxaf2b268m47z2ic3prajqbmi1s1qpfj5kri5")
               (crate-source "is_terminal_polyfill" "1.70.2"
                "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6")
               (crate-source "itertools" "0.10.5"
                "0ww45h7nxx5kj6z2y6chlskxd1igvs4j507anr6dzg99x1h25zdh")
               (crate-source "itertools" "0.11.0"
                "0mzyqcc59azx9g5cg6fs8k529gvh4463smmka6jvzs3cd2jp7hdi")
               (crate-source "itertools" "0.13.0"
                "11hiy3qzl643zcigknclh446qb9zlg4dpdzfkjaa9q9fqpgyfgj1")
               (crate-source "itertools" "0.14.0"
                "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b")
               (crate-source "itoa" "1.0.18"
                "10jnd1vpfkb8kj38rlkn2a6k02afvj3qmw054dfpzagrpl6achlg")
               (crate-source "jiff" "0.2.24"
                "0g87al8yqp05m63dhqzi359xgsslc0grqz00nvfdyq8dcayms2zh")
               (crate-source "jiff-static" "0.2.24"
                "1mz6v0d1hd8wjgfzccgda5g9z01s1yxnyiizvahjw0pq1w1xw070")
               (crate-source "jiff-tzdb" "0.1.6"
                "0xihzlnnyk0xnrzpq4xcyjdcmy8xc3ychzb9ayjkh4vgha2fy069")
               (crate-source "jiff-tzdb-platform" "0.1.3"
                "1s1ja692wyhbv7f60mc0x90h7kn1pv65xkqi2y4imarbmilmlnl7")
               (crate-source "jni" "0.21.1"
                "15wczfkr2r45slsljby12ymf2hij8wi5b104ghck9byjnwmsm1qs")
               (crate-source "jni" "0.22.4"
                "161lza8gz071h22pgyqyx4n91ixd691z2dbb1pq2g97k5i49mzay")
               (crate-source "jni-macros" "0.22.4"
                "18v02mcn5c7mb2yw6r930xg6ynsn7hwkxv8z2kdhn3qprjn0j0d0")
               (crate-source "jni-sys" "0.3.1"
                "0n1j8fbz081w1igfrpc79n6vgm7h3ik34nziy5fjgq5nz7hm59j1")
               (crate-source "jni-sys" "0.4.1"
                "1wlahx6f2zhczdjqyn8mk7kshb8x5vsd927sn3lvw41rrf47ldy6")
               (crate-source "jni-sys-macros" "0.4.1"
                "0r32gbabrak15a7p487765b5wc0jcna2yv88mk6m1zjqyi1bkh1q")
               (crate-source "jobserver" "0.1.34"
                "0cwx0fllqzdycqn4d6nb277qx5qwnmjdxdl0lxkkwssx77j3vyws")
               (crate-source "js-sys" "0.3.95"
                "1jhj3kgxxgwm0cpdjiz7i2qapqr7ya9qswadmr63dhwx3lnyjr19")
               (crate-source "kamadak-exif" "0.6.1"
                "0ds8k36qi88mzhx5fm1cgbxg0s4kmyiibmqpl5asvvvlfc6dhc0i")
               (crate-source "khronos-egl" "6.0.0"
                "0xnzdx0n1bil06xmh8i1x6dbxvk7kd2m70bbm6nw1qzc43r1vbka")
               (crate-source "khronos_api" "3.1.0"
                "1p0xj5mlbagqyvvnv8wmv3cr7l9y1m153888pxqwg3vk3mg5inz2")
               (crate-source "kurbo" "0.10.4"
                "0h1lqqdxv2xd5lyvpfsw01hyjpzkms03sdndwxkpvs93v7mx860n")
               (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv")
               (crate-source "leb128fmt" "0.1.0"
                "1chxm1484a0bly6anh6bd7a99sn355ymlagnwj3yajafnpldkv89")
               (crate-source "lebe" "0.5.3"
                "1f459clndzzm35nyd15vj5dlasyagfasp7hcgl6lh2b658rs6ybs")
               (crate-source "lettre" "0.11.21"
                "19qz0pmnmn3qf6wrsq7gg7h114f3aam6a4cxbfcnph77ks2sbgfs")
               (crate-source "libc" "0.2.186"
                "0rnyhzjyqq9x56skkllbjzzzwym3r61lq3l4hqj64v71gw0r3av8")
               (crate-source "libfuzzer-sys" "0.4.12"
                "13ghagfsynmqda1pkpalila6kf0llqxh3214ynzi5knqgldnhapi")
               (crate-source "libloading" "0.8.9"
                "0mfwxwjwi2cf0plxcd685yxzavlslz7xirss3b9cbrzyk4hv1i6p")
               (crate-source "libm" "0.2.16"
                "10brh0a3qjmbzkr5mf5xqi887nhs5y9layvnki89ykz9xb1wxlmn")
               (crate-source "libredox" "0.1.16"
                "0v54zvgknag9310wcjykgv86pgq02qr3mzgkdg4r6m1k7ns3nbz0")
               (crate-source "lilt" "0.8.1"
                "1bap1s8l2vzyxbing3z2jh4l4s376l1wbqcvz99hbcpnxzjn4xgn")
               (crate-source "linebender_resource_handle" "0.1.1"
                "1x34mrmqan0m3m9xf2iy6vpkcx6vwiiyzm2g3ixqdi56rimzz9fl")
               (crate-source "linux-raw-sys" "0.12.1"
                "0lwasljrqxjjfk9l2j8lyib1babh2qjlnhylqzl01nihw14nk9ij")
               (crate-source "linux-raw-sys" "0.4.15"
                "1aq7r2g7786hyxhv40spzf2nhag5xbw2axxc1k8z5k1dsgdm4v6j")
               (crate-source "litemap" "0.8.2"
                "1w7628bc7wwcxc4n4s5kw0610xk06710nh2hn5kwwk2wa91z9nlj")
               (crate-source "litrs" "1.0.0"
                "14p0kzzkavnngvybl88nvfwv031cc2qx4vaxpfwsiifm8grdglqi")
               (crate-source "lock_api" "0.4.14"
                "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2")
               (crate-source "log" "0.4.29"
                "15q8j9c8g5zpkcw0hnd6cf2z7fxqnvsjh3rw5mv5q10r83i34l2y")
               (crate-source "loop9" "0.1.5"
                "0qphc1c0cbbx43pwm6isnwzwbg6nsxjh7jah04n1sg5h4p0qgbhg")
               (crate-source "lru" "0.16.4"
                "0fgg35wrpfdrkv9hcabkg92g3sv4867g1rir7ay9lq1zs3ayhrkz")
               (crate-source "lru-slab" "0.1.2"
                "0m2139k466qj3bnpk66bwivgcx3z88qkxvlzk70vd65jq373jaqi")
               (crate-source "mach2" "0.5.0"
                "1siskhk6qhhzw40k1gc23zg6irx0bqpi1bmm8ns5bv11ak6ra6va")
               (crate-source "malloc_buf" "0.0.6"
                "1jqr77j89pwszv51fmnknzvd53i1nkmcr8rjrvcxhm4dx1zr1fv2")
               (crate-source "maybe-rayon" "0.1.1"
                "06cmvhj4n36459g327ng5dnj8d58qs472pv5ahlhm7ynxl6g78cf")
               (crate-source "memchr" "2.8.0"
                "0y9zzxcqxvdqg6wyag7vc3h0blhdn7hkq164bxyx2vph8zs5ijpq")
               (crate-source "memmap2" "0.9.10"
                "1qz0n4ch68pz2mp07sdwnk27imdjjqy6aqir3hp9j4g0iw19hh3i")
               (crate-source "memoffset" "0.9.1"
                "12i17wh9a9plx869g7j4whf62xw68k5zd4k0k5nh6ys5mszid028")
               (crate-source "metal" "0.32.0"
                "01g6a10l2p576ibybz0v9hignw7qj0r6d513qbf2vxrzcxpmmh80")
               (crate-source "mime" "0.3.17"
                "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8")
               (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz")
               (crate-source "mio" "1.2.0"
                "1hanrh4fwsfkdqdaqfidz48zz1wdix23zwn3r2x78am0garfbdsh")
               (crate-source "moxcms" "0.8.1"
                "0jz4fd5f7pdn1rngqc96lxriqjkym1lswdhdbjr037s8p9ac31dv")
               (crate-source "mundy" "0.2.2"
                "12vy5rlllwhdc0w7zdhm44w9j7sm2aqlw88571ll7v4lw74i6f2j")
               (crate-source "mutate_once" "0.1.2"
                "1byj4yz6h0mdx3mmj0mq23ma59kw41pckspr2gz8rl22k0y27lhk")
               (crate-source "naga" "27.0.3"
                "1n57m5hwi42mk57ljz7manc45b8ky8890891y86yw4cb1rgz4v06")
               (crate-source "native-tls" "0.2.18"
                "1wmv0g5p6jwyyslyw88w5fv9kc9qvjd1hi2d4sfl4qm19vhh0ma6")
               (crate-source "ndk" "0.9.0"
                "1m32zpmi5w1pf3j47k6k5fw395dc7aj8d0mdpsv53lqkprxjxx63")
               (crate-source "ndk-context" "0.1.1"
                "12sai3dqsblsvfd1l1zab0z6xsnlha3xsfl7kagdnmj3an3jvc17")
               (crate-source "ndk-sys" "0.6.0+11769913"
                "0wx8r6pji20if4xs04g73gxl98nmjrfc73z0v6w1ypv6a4qdlv7f")
               (crate-source "new_debug_unreachable" "1.0.6"
                "11phpf1mjxq6khk91yzcbd3ympm78m3ivl7xg6lg2c0lf66fy3k5")
               (crate-source "nix" "0.31.2"
                "1lzmcqcnb9z8l4aq5ympx71bcwc0y5yf7d8jv6hnn7hc682hfvax")
               (crate-source "no_std_io2" "0.9.3"
                "0l0mcg7gb1705rj9dnlr29q500rhklyvnjjzc1ad61vf9f1df7mm")
               (crate-source "nom" "8.0.0"
                "01cl5xng9d0gxf26h39m0l8lprgpa00fcc75ps1yzgbib1vn35yz")
               (crate-source "noop_proc_macro" "0.3.0"
                "1j2v1c6ric4w9v12h34jghzmngcwmn0hll1ywly4h6lcm4rbnxh6")
               (crate-source "normpath" "1.5.0"
                "16z68q809749ky2vl72f3lqnhf3vjclvcc3y2z5v8m2nj0msn8xz")
               (crate-source "num-bigint" "0.4.6"
                "1f903zd33i6hkjpsgwhqwi2wffnvkxbn6rv4mkgcjcqi7xr4zr55")
               (crate-source "num-derive" "0.4.2"
                "00p2am9ma8jgd2v6xpsz621wc7wbn1yqi71g15gc3h67m7qmafgd")
               (crate-source "num-format" "0.4.4"
                "1hvjmib117jspyixfr76f900mhz5zfn71dnyqg9iywb339vxjlm6")
               (crate-source "num-integer" "0.1.46"
                "13w5g54a9184cqlbsq80rnxw4jj4s0d8wv75jsq5r2lms8gncsbr")
               (crate-source "num-rational" "0.4.2"
                "093qndy02817vpgcqjnj139im3jl7vkq4h68kykdqqh577d18ggq")
               (crate-source "num-traits" "0.2.19"
                "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787")
               (crate-source "num_enum" "0.7.6"
                "09kg0c2y08npdv0c9dbm4m9a9wz8w2qaiqqxl4gj3v22hj1wl2sx")
               (crate-source "num_enum_derive" "0.7.6"
                "1y0x9z49s27vdas6mglqbv02sgkdmbr8ns2kwspzrp2ra81rh2b8")
               (crate-source "objc" "0.2.7"
                "1cbpf6kz8a244nn1qzl3xyhmp05gsg4n313c9m3567625d3innwi")
               (crate-source "objc-sys" "0.3.5"
                "0423gry7s3rmz8s3pzzm1zy5mdjif75g6dbzc2lf2z0c77fipffd")
               (crate-source "objc2" "0.5.2"
                "015qa2d3vh7c1j2736h5wjrznri7x5ic35vl916c22gzxva8b9s6")
               (crate-source "objc2" "0.6.4"
                "17x8qpl512frscfqbmgjr20kg3y4r0xdqxphja17dz5f0znsh4is")
               (crate-source "objc2-app-kit" "0.2.2"
                "1zqyi5l1bm26j1bgmac9783ah36m5kcrxlqp5carglnpwgcrms74")
               (crate-source "objc2-app-kit" "0.3.2"
                "132ijwni8lsi8phq7wnmialkxp46zx998fns3zq5np0ya1mr77nl")
               (crate-source "objc2-audio-toolbox" "0.3.2"
                "024vny0nxb93ihdk97q1zrbpism4i8xa7flsnycn678jj4d50j39")
               (crate-source "objc2-avf-audio" "0.3.2"
                "1glh82g1yi74hwxy2d60hyllqhys6xcw8r80n2fykn7f3l1q18qk")
               (crate-source "objc2-cloud-kit" "0.2.2"
                "02dhjvmcq8c2bwj31jx423jygif1scs9f0lmlab0ayhw75b3ppbl")
               (crate-source "objc2-cloud-kit" "0.3.2"
                "0714xrydi9wvh25s2110sjfpx9mv4xs9p4ys71q8fhxvh3c79bbk")
               (crate-source "objc2-contacts" "0.2.2"
                "12a8m927xrrxa54xhqhqnkkl1a6l07pyrpnqfk9jz09kkh755zx5")
               (crate-source "objc2-core-audio" "0.3.2"
                "1cn3d7cni2ngr18j14s4xfin3h4gqq3k2kshr3vzbgqdigmbrvp1")
               (crate-source "objc2-core-audio-types" "0.3.2"
                "075xj0j67n59m6v7pa0d556l06imicg9kcj24siz832a4zng52as")
               (crate-source "objc2-core-data" "0.2.2"
                "1vvk8zjylfjjj04dzawydmqqz5ajvdkhf22cnb07ihbiw14vyzv1")
               (crate-source "objc2-core-data" "0.3.2"
                "1ylqsa6hpma7k4090pkil8b7c0i8dcxnh46zwhnfidgv7rjjlh0b")
               (crate-source "objc2-core-foundation" "0.3.2"
                "0dnmg7606n4zifyjw4ff554xvjmi256cs8fpgpdmr91gckc0s61a")
               (crate-source "objc2-core-graphics" "0.3.2"
                "01x8413pxq0m5rwidlaczni8v5cz9dc3xqzq8l9zlpl9cv8cj8p0")
               (crate-source "objc2-core-image" "0.2.2"
                "102csfb82zi2sbzliwsfd589ckz0gysf7y6434c9zj97lmihj9jm")
               (crate-source "objc2-core-image" "0.3.2"
                "01phi7cx2k32a8x45qr0y1623l2b8gg764c6isgj15rbinrn7mg5")
               (crate-source "objc2-core-location" "0.2.2"
                "10apgsrigqryvi4rcc0f6yfjflvrl83f4bi5hkr48ck89vizw300")
               (crate-source "objc2-core-text" "0.3.2"
                "0bfrzqxhgh4y1imk1bb9g0v28g0frigls6hnc942npfj93xhvphc")
               (crate-source "objc2-core-video" "0.3.2"
                "19j1a7f863gh30nq03w70x1js3f3vdg3wp4azllky8vkvzqwl9fl")
               (crate-source "objc2-encode" "4.1.0"
                "0cqckp4cpf68mxyc2zgnazj8klv0z395nsgbafa61cjgsyyan9gg")
               (crate-source "objc2-foundation" "0.2.2"
                "1a6mi77jsig7950vmx9ydvsxaighzdiglk5d229k569pvajkirhf")
               (crate-source "objc2-foundation" "0.3.2"
                "0wijkxzzvw2xkzssds3fj8279cbykz2rz9agxf6qh7y2agpsvq73")
               (crate-source "objc2-io-surface" "0.3.2"
                "07fqx4fmwydf2arrc4xs4awv7zyzzxh60fyqdfmrpm9n148qh1qq")
               (crate-source "objc2-link-presentation" "0.2.2"
                "160k4qh00yrx57dabn3hzas4r98kmk9bc0qsy1jvwday3irax8d1")
               (crate-source "objc2-metal" "0.2.2"
                "1mmdga66qpxrcfq3gxxhysfx3zg1hpx4z886liv3j0pnfq9bl36x")
               (crate-source "objc2-quartz-core" "0.2.2"
                "0ynw8819c36l11rim8n0yzk0fskbzrgaqayscyqi8swhzxxywaz4")
               (crate-source "objc2-quartz-core" "0.3.2"
                "07vzaf6y1lk7zygkgvpp23mm19ipdm9yq8af22gvywdkaa23bhcn")
               (crate-source "objc2-symbols" "0.2.2"
                "1p04hjkxan18g2b7h9n2n8xxsvazapv2h6mfmmdk06zc7pz4ws0a")
               (crate-source "objc2-ui-kit" "0.2.2"
                "0vrb5r8z658l8c19bx78qks8c5hg956544yirf8npk90idwldfxq")
               (crate-source "objc2-uniform-type-identifiers" "0.2.2"
                "1ziv4wkbxcaw015ypg0q49ycl7m14l3x56mpq2k1rznv92bmzyj4")
               (crate-source "objc2-user-notifications" "0.2.2"
                "1cscv2w3vxzaslz101ddv0z9ycrrs4ayikk4my4qd3im8bvcpkvn")
               (crate-source "once_cell" "1.21.4"
                "0l1v676wf71kjg2khch4dphwh1jp3291ffiymr2mvy1kxd5kwz4z")
               (crate-source "once_cell_polyfill" "1.70.2"
                "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq")
               (crate-source "oorandom" "11.1.5"
                "07mlf13z453fq01qff38big1lh83j8l6aaglf63ksqzzqxc0yyfn")
               (crate-source "openssl" "0.10.78"
                "08lj1fvhpfcga3nxs40vnl4spxfrswljvncxqwyazniw85r4737k")
               (crate-source "openssl-macros" "0.1.1"
                "173xxvfc63rr5ybwqwylsir0vq6xsj4kxiv4hmg4c3vscdmncj59")
               (crate-source "openssl-probe" "0.2.1"
                "1gpwpb7smfhkscwvbri8xzbab39wcnby1jgz1s49vf1aqgsdx1vw")
               (crate-source "openssl-sys" "0.9.114"
                "1dhvfj1nvikl4gaq9zb9ka2g7r67n03pb3s3vg7w9z07rm2i5khk")
               (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04")
               (crate-source "orbclient" "0.3.53"
                "1pdjzkbnn8q71jsfwhxck573mb21inxrgrkjfsd565mxvcyr7ihj")
               (crate-source "ordered-float" "5.3.0"
                "03mx5yg3ncp0g524y7zbyvhwcxpd8l9v30lgybm5bhqx2v551ndp")
               (crate-source "ordered-stream" "0.2.0"
                "0l0xxp697q7wiix1gnfn66xsss7fdhfivl2k7bvpjs4i3lgb18ls")
               (crate-source "owned_ttf_parser" "0.25.1"
                "0fsqzcbc4sq8qhkmc3rgcfg1xg389nmhlxvmvi6h38dca680x0in")
               (crate-source "page_size" "0.6.0"
                "1nj0rrwpvagagssljbm29ww1iyrrg15p1q4sk70r2cfi9qcv5m9h")
               (crate-source "parking" "2.2.1"
                "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk")
               (crate-source "parking_lot" "0.12.5"
                "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck")
               (crate-source "parking_lot_core" "0.9.12"
                "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896")
               (crate-source "password-hash" "0.6.1"
                "0fvjsi13hdxyzv6nfl3yvhwqx6ggavppizwwrpzxd60n0ck1id5a")
               (crate-source "paste" "1.0.15"
                "02pxffpdqkapy292harq6asfjvadgp1s005fip9ljfsn9fvxgh2p")
               (crate-source "pastey" "0.1.1"
                "1v389jkifv757903flrrps67dvc6q6giwlyx3xi33hcfjmgjxyrm")
               (crate-source "percent-encoding" "2.3.2"
                "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv")
               (crate-source "phc" "0.6.1"
                "14p8mwc1ikrllbrz1xv63vzxwb99hpb15yn7v3fzsfprfndpdp24")
               (crate-source "pin-project" "1.1.11"
                "05zm3y3bl83ypsr6favxvny2kys4i19jiz1y18ylrbxwsiz9qx7i")
               (crate-source "pin-project-internal" "1.1.11"
                "1ik4mpb92da75inmjvxf2qm61vrnwml3x24wddvrjlqh1z9hxcnr")
               (crate-source "pin-project-lite" "0.2.17"
                "1kfmwvs271si96zay4mm8887v5khw0c27jc9srw1a75ykvgj54x8")
               (crate-source "pin-utils" "0.1.0"
                "117ir7vslsl2z1a7qzhws4pd01cg2d3338c47swjyvqv2n60v1wb")
               (crate-source "piper" "0.2.5"
                "1hd3j94mw5dwc457gs9ssb2r5b9iipywndf5srqx7pj38jd4fdf8")
               (crate-source "pkg-config" "0.3.33"
                "17jnqmcbxsnwhg9gjf0nh6dj5k0x3hgwi3mb9krjnmfa9v435w8r")
               (crate-source "plain" "0.2.3"
                "19n1xbxb4wa7w891268bzf6cbwq4qvdb86bik1z129qb0xnnnndl")
               (crate-source "plotters" "0.3.7"
                "0ixpy9svpmr2rkzkxvvdpysjjky4gw104d73n7pi2jbs7m06zsss")
               (crate-source "plotters-backend" "0.3.7"
                "0ahpliim4hrrf7d4ispc2hwr7rzkn6d6nf7lyyrid2lm28yf2hnz")
               (crate-source "plotters-svg" "0.3.7"
                "0w56sxaa2crpasa1zj0bhxzihlapqfkncggavyngg0w86anf5fji")
               (crate-source "png" "0.18.1"
                "0qca282xp8a6d7mikxrwji3f52mjn4vnqxz2v9iz5adj665rnxk0")
               (crate-source "polling" "3.11.0"
                "0622qfbxi3gb0ly2c99n3xawp878fkrd1sl83hjdhisx11cly3jx")
               (crate-source "portable-atomic" "1.13.1"
                "0j8vlar3n5acyigq8q6f4wjx3k3s5yz0rlpqrv76j73gi5qr8fn3")
               (crate-source "portable-atomic-util" "0.2.7"
                "0616j0fhy6y71hyxg3n86f6hng0fmsc269s3wp4gl8ww4p8hd8f2")
               (crate-source "postcard" "1.1.3"
                "094srff139n7m8g5ssq36ag6s29ikf7fgpz660x2hkj5vnsw6r37")
               (crate-source "potential_utf" "0.1.5"
                "0r0518fr32xbkgzqap509s3r60cr0iancsg9j1jgf37cyz7b20q1")
               (crate-source "ppv-lite86" "0.2.21"
                "1abxx6qz5qnd43br1dd9b2savpihzjza8gb4fbzdql1gxp2f7sl5")
               (crate-source "presser" "0.3.1"
                "1ykvqx861sjmhkdh540aafqba7i7li7gqgwrcczy6v56i9m8xkz8")
               (crate-source "prettyplease" "0.2.37"
                "0azn11i1kh0byabhsgab6kqs74zyrg69xkirzgqyhz6xmjnsi727")
               (crate-source "proc-macro-crate" "3.5.0"
                "0kv1g1d1zjwxlgcaba2qlshzyy32j03xic8rskqlcr5mnblsfyz6")
               (crate-source "proc-macro2" "1.0.106"
                "0d09nczyaj67x4ihqr5p7gxbkz38gxhk4asc0k8q23g9n85hzl4g")
               (crate-source "profiling" "1.0.17"
                "0wqp6i1bl7azy9270dp92srbbr55mgdh9qnk5b1y44lyarmlif1y")
               (crate-source "profiling-procmacros" "1.0.17"
                "0nrxdh5r723raxbs136jmjx46p0c5qgai8jwz4j555mn0ad7ywaj")
               (crate-source "pxfm" "0.1.29"
                "0gvfd9r73i2mqf1cdc2y5yf0m0skhc16a5aglxiwsv2c57swrig0")
               (crate-source "qoi" "0.4.1"
                "00c0wkb112annn2wl72ixyd78mf56p4lxkhlmsggx65l3v3n8vbz")
               (crate-source "quick-error" "2.0.1"
                "18z6r2rcjvvf8cn92xjhm2qc3jpd1ljvcbf12zv0k9p565gmb4x9")
               (crate-source "quick-xml" "0.39.2"
                "0z86jkw618p0d7q3zqp7pzh7cnf7wwlanzx8gyma3dffwzl233wm")
               (crate-source "quinn" "0.11.9"
                "086gzj666dr3slmlynkvxlndy28hahgl361d6bf93hk3i6ahmqmr")
               (crate-source "quinn-proto" "0.11.14"
                "1660jkxhzi1pnywzs13ifczwrlv6ds9qds111vsnxjciqpz44js3")
               (crate-source "quinn-udp" "0.5.14"
                "1gacawr17a2zkyri0r3m0lc9spzmxbq1by3ilyb8v2mdvjhcdpmd")
               (crate-source "quote" "1.0.45"
                "095rb5rg7pbnwdp6v8w5jw93wndwyijgci1b5lw8j1h5cscn3wj1")
               (crate-source "quoted_printable" "0.5.2"
                "0wm9xr8qajngy0lvsf00hy51s6x53w73qzpb0yj2l4lscn2hb3j7")
               (crate-source "r-efi" "5.3.0"
                "03sbfm3g7myvzyylff6qaxk4z6fy76yv860yy66jiswc2m6b7kb9")
               (crate-source "r-efi" "6.0.0"
                "1gyrl2k5fyzj9k7kchg2n296z5881lg7070msabid09asp3wkp7q")
               (crate-source "rand" "0.10.1"
                "01r22vdpw6z69jzy6khnyr0ljq9im337h4j0mkyz26lnqyyfis6j")
               (crate-source "rand" "0.9.4"
                "1sknbxgs6nfg0nxdd7689lwbyr2i4vaswchrv4b34z8vpc3azia4")
               (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk")
               (crate-source "rand_core" "0.10.1"
                "0s9wiacxrr100icl7i41308gcj85nlcclrc5jx1jd6p10dhigf33")
               (crate-source "rand_core" "0.9.5"
                "0g6qc5r3f0hdmz9b11nripyp9qqrzb0xqk9piip8w8qlvqkcibvn")
               (crate-source "range-alloc" "0.1.5"
                "020xrpn0qaabkxg49wpi0hgy92d8ikji55cyancphnmfi6bl2ifa")
               (crate-source "rangemap" "1.7.1"
                "0s7am2w72siggn668h03gn3g06gsinv6m1jaaxmnbj59177l6d4p")
               (crate-source "rav1e" "0.8.1"
                "0axk3ji3jmlr81svmsy5zvj8shmhpp8lz5nyghkq752xx1bdvdj3")
               (crate-source "ravif" "0.13.0"
                "0ifcpczxf6kcsqlky08vbjrvw9yd1m9mfszywxdhy6wpglci08z5")
               (crate-source "raw-window-handle" "0.6.2"
                "0ff5c648hncwx7hm2a8fqgqlbvbl4xawb6v3xxv9wkpjyrr5arr0")
               (crate-source "rayon" "1.12.0"
                "0vcj63xgnk72c30vdrak7dhl53snnaqv9x2faf1d94hzg1kb2fgv")
               (crate-source "rayon-core" "1.13.0"
                "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92")
               (crate-source "read-fonts" "0.35.0"
                "0n0kr71apps034i708r6vx3y2kd35da2j4vikm5zdbc8nhiwy5v7")
               (crate-source "read-fonts" "0.37.0"
                "1r82vwrmsai9i7bgmnblb7sn08k2kca75lpz0x9v3yijy2mlyqvv")
               (crate-source "redox_syscall" "0.4.1"
                "1aiifyz5dnybfvkk4cdab9p2kmphag1yad6iknc7aszlxxldf8j7")
               (crate-source "redox_syscall" "0.5.18"
                "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd")
               (crate-source "redox_syscall" "0.7.4"
                "0fk4infcfn2hvshrwgf7r48rf9mr1zxy1a28d7xn798x7ffasl7l")
               (crate-source "redox_users" "0.5.2"
                "1b17q7gf7w8b1vvl53bxna24xl983yn7bd00gfbii74bcg30irm4")
               (crate-source "regex" "1.12.3"
                "0xp2q0x7ybmpa5zlgaz00p8zswcirj9h8nry3rxxsdwi9fhm81z1")
               (crate-source "regex-automata" "0.4.14"
                "13xf7hhn4qmgfh784llcp2kzrvljd13lb2b1ca0mwnf15w9d87bf")
               (crate-source "regex-syntax" "0.8.10"
                "02jx311ka0daxxc7v45ikzhcl3iydjbbb0mdrpc1xgg8v7c7v2fw")
               (crate-source "renderdoc-sys" "1.1.0"
                "0cj8zjs7k0gvchcx3jhpg8r9bbqy8b1hsgbz0flcq2ydn12hmcqr")
               (crate-source "reqwest" "0.13.2"
                "00d8xyrbcp0519rr9rhl685ymb6hi3lv0i2bca5lic9s53il6gxb")
               (crate-source "rgb" "0.8.53"
                "1i0c55whln68zs6f5qqrkbg1mzai0p3qk1mwkwzdgr9i3dw4pcs7")
               (crate-source "ring" "0.17.14"
                "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54")
               (crate-source "rodio" "0.22.2"
                "1sq1xikp3phcisvb3kny2srqgsq2dhjd8k8syy70jnfvg6xkd9fh")
               (crate-source "roff" "1.1.1"
                "12c1pibjxdjai80hpalxgqkzn30316x49iry4rdscrcn3mz42g1j")
               (crate-source "ron" "0.12.1"
                "1z68ps1v4kn7c0lsdc5f27qhb3baglph49wmx6hfq6gqyd9bjis1")
               (crate-source "roxmltree" "0.20.0"
                "15vw91ps91wkmmgy62khf9zb63bdinvm80957dascbsw7dwvc83c")
               (crate-source "rust-i18n" "4.0.0"
                "1fmpqdqcsnjkwpjwfxippnl9k3k00g2925w3bmsaxh7jwvsin0r1")
               (crate-source "rust-i18n-macro" "4.0.0"
                "0lpz94wa6j8j8c4izv2pb9vnji0gw9jaa9nayw38cd9vfsam5zji")
               (crate-source "rust-i18n-support" "4.0.0"
                "0vrz8jby8wpmb93jz7rll244jvvp77in4lyqlcx818pfr0aw3g39")
               (crate-source "rustc-hash" "1.1.0"
                "1qkc5khrmv5pqi5l5ca9p5nl5hs742cagrndhbrlk3dhlrx3zm08")
               (crate-source "rustc-hash" "2.1.2"
                "1gjdc5bw9982cj176jvgz9rrqf9xvr1q1ddpzywf5qhs7yzhlc4l")
               (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg")
               (crate-source "rustix" "0.38.44"
                "0m61v0h15lf5rrnbjhcb9306bgqrhskrqv7i1n0939dsw8dbrdgx")
               (crate-source "rustix" "1.1.4"
                "14511f9yjqh0ix07xjrjpllah3325774gfwi9zpq72sip5jlbzmn")
               (crate-source "rustls" "0.23.39"
                "03p6fkdwbdpp93dfidc4nzgmalwp3gxnv0rk421a5k3pn2612b3w")
               (crate-source "rustls-native-certs" "0.8.3"
                "0qrajg2n90bcr3bcq6j95gjm7a9lirfkkdmjj32419dyyzan0931")
               (crate-source "rustls-pki-types" "1.14.1"
                "1a9pr54y0f3qr97bxpd3ahjldq0gqdld0h799xbnwdzbwxx1k9rh")
               (crate-source "rustls-platform-verifier" "0.6.2"
                "110pqkn3px9115pb6h6a23cq738v29gbp559dfvpmbibqzmzx68x")
               (crate-source "rustls-platform-verifier-android" "0.1.1"
                "13vq6sxsgz9547xm2zbdxiw8x7ad1g8n8ax6xvxsjqszk7q6awgq")
               (crate-source "rustls-webpki" "0.103.13"
                "0vkm7z9pnxz5qz66p2kmyy2pwx0g4jnsbqk5xzfhs4czcjl2ki31")
               (crate-source "rustrict" "0.7.38"
                "0xp91rqx09935c5i834dxpagypw192hridlxfvpk97d4ixdp5s30")
               (crate-source "rustversion" "1.0.22"
                "0vfl70jhv72scd9rfqgr2n11m5i9l1acnk684m2w83w0zbqdx75k")
               (crate-source "ryu" "1.0.23"
                "0zs70sg00l2fb9jwrf6cbkdyscjs53anrvai2hf7npyyfi5blx4p")
               (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k")
               (crate-source "schannel" "0.1.29"
                "0ffrzz5vf2s3gnzvphgb5gg8fqifvryl07qcf7q3x1scj3jbghci")
               (crate-source "scoped-tls" "1.0.1"
                "15524h04mafihcvfpgxd8f4bgc3k95aclz8grjkg9a0rxcvn9kz1")
               (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l")
               (crate-source "sctk-adwaita" "0.10.1"
                "1v14vqp7k39jk7pgaibwc06qq9vcmi82k7zlv3qpfvq52w17y9xn")
               (crate-source "security-framework" "3.7.0"
                "07fd0j29j8yczb3hd430vwz784lx9knb5xwbvqna1nbkbivvrx5p")
               (crate-source "security-framework-sys" "2.17.0"
                "1qr0w0y9iwvmv3hwg653q1igngnc5b74xcf0679cbv23z0fnkqkc")
               (crate-source "self_cell" "1.2.2"
                "12cdmh9p2h72rmw923kj841jji4k0vrykihvx19fn059az8pcbmi")
               (crate-source "semver" "1.0.28"
                "1kaimrpy876bcgi8bfj0qqfxk77zm9iz2zhn1hp9hj685z854y4a")
               (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls")
               (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1")
               (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m")
               (crate-source "serde_json" "1.0.149"
                "11jdx4vilzrjjd1dpgy67x5lgzr0laplz30dhv75lnf5ffa07z43")
               (crate-source "serde_repr" "0.1.20"
                "1755gss3f6lwvv23pk7fhnjdkjw7609rcgjlr8vjg6791blf6php")
               (crate-source "serde_spanned" "0.6.9"
                "18vmxq6qfrm110caszxrzibjhy2s54n1g5w1bshxq9kjmz7y0hdz")
               (crate-source "serde_spanned" "1.1.1"
                "09jzk7i6wihn3d8i3wi4j4n98ghi93c3b8m8k64nxq0ijn3vaqk6")
               (crate-source "serde_yaml" "0.9.34+deprecated"
                "0isba1fjyg3l6rxk156k600ilzr8fp7crv82rhal0rxz5qd1m2va")
               (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg")
               (crate-source "signal-hook-registry" "1.4.8"
                "06vc7pmnki6lmxar3z31gkyg9cw7py5x9g7px70gy2hil75nkny4")
               (crate-source "simd-adler32" "0.3.9"
                "0532ysdwcvzyp2bwpk8qz0hijplcdwpssr5gy5r7qwqqy5z5qgbh")
               (crate-source "simd_cesu8" "1.1.1"
                "0crcbgvyycmazji2vqj9vxn2czdyl3gxmicp4xqdzkc7pdbh3ycl")
               (crate-source "simd_helpers" "0.1.0"
                "19idqicn9k4vhd04ifh2ff41wvna79zphdf2c81rlmpc7f3hz2cm")
               (crate-source "simdutf8" "0.1.5"
                "0vmpf7xaa0dnaikib5jlx6y4dxd3hxqz6l830qb079g7wcsgxag3")
               (crate-source "siphasher" "1.0.2"
                "13k7cfbpcm8qgj9p2n8dwg9skv9s0hxk5my30j5chy1p4l78bamj")
               (crate-source "skrifa" "0.37.0"
                "0hcqlhgbiv5lhjv6l0hfj2gm1nabvdy9iv9zry77acpmxlfhfccc")
               (crate-source "skrifa" "0.40.0"
                "1b1lfid1326df2aq4cjqz7jv63m3i21czrgks7fxgyvm4hyzxgbz")
               (crate-source "slab" "0.4.12"
                "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c")
               (crate-source "slotmap" "1.1.1"
                "0f20xf53zaysx9ydzkwwqm6hsjyb8lj2j6amhg57iln3jcy8rmdx")
               (crate-source "smallvec" "1.15.1"
                "00xxdxxpgyq5vjnpljvkmy99xij5rxgh913ii1v16kzynnivgcb7")
               (crate-source "smithay-client-toolkit" "0.19.2"
                "05h05hg4dn3v6br5jbdbs5nalk076a64s7fn6i01nqzby2hxwmrl")
               (crate-source "smithay-client-toolkit" "0.20.0"
                "1h2cacmsh9zpw6sgmap49zx7cqhksfwas91mm40i5cz2ylwdl4h5")
               (crate-source "smithay-clipboard" "0.7.3"
                "09hjm3dyjq4s3nxfzi65bg95hv540fi5zr5xad879xrryw1lqw3i")
               (crate-source "smol" "2.0.2"
                "17srgkyzswns43cnqcfb1846a8nsna47qj7wrk1rj8c9c3id6fx3")
               (crate-source "smol_str" "0.2.2"
                "1bfylqf2vnqaglw58930vpxm2rfzji5gjp15a2c0kh8aj6v8ylyx")
               (crate-source "smol_str" "0.3.6"
                "08qm7y1k2fkzrs8k78m03h4z4wbarv5g0bfr5m62m1glzil77aja")
               (crate-source "socket2" "0.6.3"
                "0gkjjcyn69hqhhlh5kl8byk5m0d7hyrp2aqwzbs3d33q208nwxis")
               (crate-source "softbuffer" "0.4.8"
                "1hznrcdzhhlr2x84926g28ybnlx649y1anr7mc4m3w5v3sl8vhda")
               (crate-source "spin" "0.9.8"
                "0rvam5r0p3a6qhc18scqpvpgb3ckzyqxpgdfyjnghh8ja7byi039")
               (crate-source "spirv" "0.3.0+sdk-1.3.268.0"
                "0i3qj7yvvprai1s03dvll2gkfy8398nl64wvllkhaaa4vh1i197d")
               (crate-source "stable_deref_trait" "1.2.1"
                "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc")
               (crate-source "static_assertions" "1.1.0"
                "0gsl6xmw10gvn3zs1rv99laj5ig7ylffnh71f9l34js4nr4r7sx2")
               (crate-source "strict-num" "0.1.1"
                "0cb7l1vhb8zj90mzm8avlk815k40sql9515s865rqdrdfavvldv6")
               (crate-source "strsim" "0.10.0"
                "08s69r4rcrahwnickvi0kq49z524ci50capybln83mg6b473qivk")
               (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x")
               (crate-source "subtle" "2.6.1"
                "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk")
               (crate-source "svg_fmt" "0.4.5"
                "1yq2kv7klg8s5k19prn36cprlnb811cqgwhy079g7lng651wr4q1")
               (crate-source "swash" "0.2.7"
                "0r5fb8rnqayydb9rw5fply28wjp5lpm87y84cab3ifn2d79kqbw4")
               (crate-source "symphonia" "0.5.5"
                "0fbhlmvf1m9rb5xdy057vzymvirmzx39gx4hl3x9p7d1630a8wsp")
               (crate-source "symphonia-codec-vorbis" "0.5.5"
                "0wqwbnwb3ibwf14mx6irqm99bdap4950nxbjypz9zmlw61y869gh")
               (crate-source "symphonia-core" "0.5.5"
                "1by293wrwb37as89fx8qzr1klvq6l5jw1pbyz1zvpxmpg57wq07a")
               (crate-source "symphonia-format-ogg" "0.5.5"
                "1jrrar1v3a2x7gkm3c5j35mfzywphg5093a2x25amlqygk35aj9b")
               (crate-source "symphonia-metadata" "0.5.5"
                "05kbkshrzqj83mlbkdwxkgkjzmhb3q99xm4rzid6xzlz5gs6yc1n")
               (crate-source "symphonia-utils-xiph" "0.5.5"
                "05lzmgxppqn647hmc1j9pgqsdqa2pxxcgvk8dd23i8wrnxdch9zf")
               (crate-source "syn" "2.0.117"
                "16cv7c0wbn8amxc54n4w15kxlx5ypdmla8s0gxr2l7bv7s0bhrg6")
               (crate-source "sync_wrapper" "1.0.2"
                "0qvjyasd6w18mjg5xlaq5jgy84jsjfsvmnn12c13gypxbv75dwhb")
               (crate-source "synstructure" "0.13.2"
                "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj")
               (crate-source "sys-locale" "0.3.2"
                "1i16hq9mkwpzqvixjfy1ph4i2q5klgagjg4hibz6k894l2crmawf")
               (crate-source "system-configuration" "0.7.0"
                "12rwilylzc625qnxl30h5kf8wj5ka61zjrwpmb034cd0mc6ksgx1")
               (crate-source "system-configuration-sys" "0.6.0"
                "1i5sqrmgy58l4704hibjbl36hclddglh73fb3wx95jnmrq81n7cf")
               (crate-source "tempfile" "3.27.0"
                "1gblhnyfjsbg9wjg194n89wrzah7jy3yzgnyzhp56f3v9jd7wj9j")
               (crate-source "termcolor" "1.4.1"
                "0mappjh3fj3p2nmrg4y7qv94rchwi9mzmgmfflr8p2awdj7lyy86")
               (crate-source "thiserror" "1.0.69"
                "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn")
               (crate-source "thiserror" "2.0.18"
                "1i7vcmw9900bvsmay7mww04ahahab7wmr8s925xc083rpjybb222")
               (crate-source "thiserror-impl" "1.0.69"
                "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg")
               (crate-source "thiserror-impl" "2.0.18"
                "1mf1vrbbimj1g6dvhdgzjmn6q09yflz2b92zs1j9n3k7cxzyxi7b")
               (crate-source "tiff" "0.11.3"
                "0lmw68ic77sixk17r4rl2vsv00rqhja3yj2h9p5bcd9x6krylgxn")
               (crate-source "tiny-skia" "0.11.4"
                "1aq9gd4qh4418g8v08qzakqqggx8hl66qcianl3k5bjdsja37lc3")
               (crate-source "tiny-skia-path" "0.11.4"
                "14ywbdfakvacl6rxxmzbnycplaxpc6i2linh2yqk0sp8qb07z7lw")
               (crate-source "tiny-xlib" "0.2.5"
                "1d5gzd7hq9nzch5m1gk6ydqv60rz9hd644gx52nz4sbaxsihq2m9")
               (crate-source "tinystr" "0.8.3"
                "0vfr8x285w6zsqhna0a9jyhylwiafb2kc8pj2qaqaahw48236cn8")
               (crate-source "tinytemplate" "1.2.1"
                "1g5n77cqkdh9hy75zdb01adxn45mkh9y40wdr7l68xpz35gnnkdy")
               (crate-source "tinyvec" "1.11.0"
                "1wvycrghzmaysnw34kzwnf0mfx6r75045s24r214wnnjadqfcq9y")
               (crate-source "tinyvec_macros" "0.1.1"
                "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z")
               (crate-source "tokio" "1.52.1"
                "1imw1dkkv38p66i33m5hsyk3d6prsbyrayjvqhndjvz89ybywzdn")
               (crate-source "tokio-macros" "2.7.0"
                "15m4f37mdafs0gg36sh0rskm1i768lb7zmp8bw67kaxr3avnqniq")
               (crate-source "tokio-rustls" "0.26.4"
                "0qggwknz9w4bbsv1z158hlnpkm97j3w8v31586jipn99byaala8p")
               (crate-source "tokio-util" "0.7.18"
                "1600rd47pylwn7cap1k7s5nvdaa9j7w8kqigzp1qy7mh0p4cxscs")
               (crate-source "toml" "0.8.23"
                "0qnkrq4lm2sdhp3l6cb6f26i8zbnhqb7mhbmksd550wxdfcyn6yw")
               (crate-source "toml" "1.1.2+spec-1.1.0"
                "1vpggpamqhw4852kic7465zsidczsla06wz6friqkkfbhigd3ww1")
               (crate-source "toml_datetime" "0.6.11"
                "077ix2hb1dcya49hmi1avalwbixmrs75zgzb3b2i7g2gizwdmk92")
               (crate-source "toml_datetime" "1.1.1+spec-1.1.0"
                "1mws2mkkf46l7inn77azhm0vdwxngv9vsbhbl0ah33p2c9gzcr9i")
               (crate-source "toml_edit" "0.22.27"
                "16l15xm40404asih8vyjvnka9g0xs9i4hfb6ry3ph9g419k8rzj1")
               (crate-source "toml_edit" "0.25.11+spec-1.1.0"
                "0awzffbkx33v9x4h19b5mfrwp3sn4ifr16y58sbk6j6l5v9c8n8b")
               (crate-source "toml_parser" "1.1.2+spec-1.1.0"
                "09kmzc55a0j21whm290wlf5a8b18a0qc87a1s8sncrckc6wfkax2")
               (crate-source "toml_write" "0.1.2"
                "008qlhqlqvljp1gpp9rn5cqs74gwvdgbvs92wnpq8y3jlz4zi6ax")
               (crate-source "toml_writer" "1.1.1+spec-1.1.0"
                "1nwjhvvrxz8f4ck1qi4xcz2x9qhpci37nrknhxxf9sqk22dsyvbm")
               (crate-source "tower" "0.5.3"
                "1m5i3a2z1sgs8nnz1hgfq2nr4clpdmizlp1d9qsg358ma5iyzrgb")
               (crate-source "tower-http" "0.6.8"
                "1y514jwzbyrmrkbaajpwmss4rg0mak82k16d6588w9ncaffmbrnl")
               (crate-source "tower-layer" "0.3.3"
                "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j")
               (crate-source "tower-service" "0.3.3"
                "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd")
               (crate-source "tracing" "0.1.44"
                "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3")
               (crate-source "tracing-attributes" "0.1.31"
                "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l")
               (crate-source "tracing-core" "0.1.36"
                "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv")
               (crate-source "triomphe" "0.1.15"
                "0fazg0zgq2zbjx50vkwg1zxr8nxc9skqj9rpsqcpak4jiymcasfx")
               (crate-source "try-lock" "0.2.5"
                "0jqijrrvm1pyq34zn1jmy2vihd4jcrjlvsh4alkjahhssjnsn8g4")
               (crate-source "ttf-parser" "0.25.1"
                "0cbgqglcwwjg3hirwq6xlza54w04mb5x02kf7zx4hrw50xmr1pyj")
               (crate-source "typeid" "1.0.3"
                "0727ypay2p6mlw72gz3yxkqayzdmjckw46sxqpaj08v0b0r64zdw")
               (crate-source "typenum" "1.20.0"
                "1pj35y6q11d3y55gdl6g1h2dfhmybjming0jdi9bh0bpnqm11kj0")
               (crate-source "uds_windows" "1.2.1"
                "0vidqwwfgn8wyzvbxiqil787b4wyqjia50zpdbbjqx7n8wlgpxpj")
               (crate-source "unicode-bidi" "0.3.18"
                "1xcxwbsqa24b8vfchhzyyzgj0l6bn51ib5v8j6krha0m77dva72w")
               (crate-source "unicode-ident" "1.0.24"
                "0xfs8y1g7syl2iykji8zk5hgfi5jw819f5zsrbaxmlzwsly33r76")
               (crate-source "unicode-linebreak" "0.1.5"
                "07spj2hh3daajg335m4wdav6nfkl0f6c0q72lc37blr97hych29v")
               (crate-source "unicode-normalization" "0.1.25"
                "1s76dcrxw7vs32yhpi0p074apdc3s7lak7809f3qvclwij3zdm2z")
               (crate-source "unicode-script" "0.5.8"
                "1vmifpgd0map3frmvhszhl96k82crcry083prv05wii7p45x8fiq")
               (crate-source "unicode-segmentation" "1.13.2"
                "135a26m4a0wj319gcw28j6a5aqvz00jmgwgmcs6szgxjf942facn")
               (crate-source "unicode-width" "0.2.2"
                "0m7jjzlcccw716dy9423xxh0clys8pfpllc5smvfxrzdf66h9b5l")
               (crate-source "unicode-xid" "0.2.6"
                "0lzqaky89fq0bcrh6jj6bhlz37scfd8c7dsj5dq7y32if56c1hgb")
               (crate-source "unsafe-libyaml" "0.2.11"
                "0qdq69ffl3v5pzx9kzxbghzn0fzn266i1xn70y88maybz9csqfk7")
               (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf")
               (crate-source "url" "2.5.8"
                "1v8f7nx3hpr1qh76if0a04sj08k86amsq4h8cvpw6wvk76jahrzz")
               (crate-source "utf8_iter" "1.0.4"
                "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn")
               (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6")
               (crate-source "uuid" "1.23.1"
                "0xlwg23rmsfl3gx98qsyzpl24pf4bs9wi3mqx5c6i319hyb4mmyx")
               (crate-source "v_frame" "0.3.9"
                "1qkvb4ks33zck931vzqckjn36hkngj6l2cwmvfsnlpc7r0kpfsv6")
               (crate-source "vcpkg" "0.2.15"
                "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc")
               (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb")
               (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99")
               (crate-source "want" "0.3.1"
                "03hbfrnvqqdchb5kgxyavb9jabwza0dmh2vw5kg0dq8rxl57d9xz")
               (crate-source "wasi" "0.11.1+wasi-snapshot-preview1"
                "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc")
               (crate-source "wasip2" "1.0.3+wasi-0.2.9"
                "1mi3w855dz99xzjqc4aa8c9q5b6z1y5c963pkk4cvmr6vdr4c1i0")
               (crate-source "wasip3" "0.4.0+wasi-0.3.0-rc-2026-01-06"
                "19dc8p0y2mfrvgk3qw3c3240nfbylv22mvyxz84dqpgai2zzha2l")
               (crate-source "wasm-bindgen" "0.2.118"
                "129s5r14fx4v4xrzpx2c6l860nkxpl48j50y7kl6j16bpah3iy8b")
               (crate-source "wasm-bindgen-futures" "0.4.68"
                "1y7bq5d9fk7s9xaayx38bgs9ns35na0kpb5zw19944zvya1x6wgk")
               (crate-source "wasm-bindgen-macro" "0.2.118"
                "1v98r8vs17cj8918qsg0xx4nlg4nxk1g0jd4nwnyrh1687w29zzf")
               (crate-source "wasm-bindgen-macro-support" "0.2.118"
                "0169jr0q469hfx5zqxfyywf2h2f4aj17vn4zly02nfwqmxghc24x")
               (crate-source "wasm-bindgen-shared" "0.2.118"
                "0ag1vvdzi4334jlzilsy14y3nyzwddf1ndn62fyhf6bg62g4vl2z")
               (crate-source "wasm-encoder" "0.244.0"
                "06c35kv4h42vk3k51xjz1x6hn3mqwfswycmr6ziky033zvr6a04r")
               (crate-source "wasm-metadata" "0.244.0"
                "02f9dhlnryd2l7zf03whlxai5sv26x4spfibjdvc3g9gd8z3a3mv")
               (crate-source "wasmparser" "0.244.0"
                "1zi821hrlsxfhn39nqpmgzc0wk7ax3dv6vrs5cw6kb0v5v3hgf27")
               (crate-source "wasmtimer" "0.4.3"
                "0jv45z8yvgn6jgqqhmd1rpakk0yhf13gr5s6hhskw0gak5mqsn8w")
               (crate-source "wayland-backend" "0.3.15"
                "0pbm8j3vv6baqz312biwqfi4qzadbi6nng9v4p3nx4afnlhdsmr8")
               (crate-source "wayland-client" "0.31.14"
                "0i014rcfjgccknnlyfk94fxn4w32l56cpjdmi4qhqsblpfb7qp34")
               (crate-source "wayland-csd-frame" "0.3.0"
                "0zjcmcqprfzx57hlm741n89ssp4sha5yh5cnmbk2agflvclm0p32")
               (crate-source "wayland-cursor" "0.31.14"
                "0kdk7xwj465idk54jf1f24024gdp63wyagca68a176xyh23x2lja")
               (crate-source "wayland-protocols" "0.32.12"
                "13rdk2akpdg90v42sjlz7c86541isxgq347772cl5qmd7i98afjn")
               (crate-source "wayland-protocols-experimental" "20250721.0.1"
                "1cfbimd2qbbcgv21i3l7kq3pm6lvrjbb7d6pj33sxjld29izi8a0")
               (crate-source "wayland-protocols-misc" "0.3.12"
                "1j19dg8h98s153rj2fvbqkghjicdfgjjkr6nvaw0jgpjkrcng5bf")
               (crate-source "wayland-protocols-plasma" "0.3.12"
                "14adi3xgkldbih60705gshlq2lskds5chhsn3znk271cxgqqqv9b")
               (crate-source "wayland-protocols-wlr" "0.3.12"
                "0d424vn2hj27r4gjlshm6hy8fcqysr805jkqdjbwgmrng0pya17b")
               (crate-source "wayland-scanner" "0.31.10"
                "0jjbsb04pzz8kqiw0wy2ssqx6dqpy70ixrm3ck1vsvnq1y8llclw")
               (crate-source "wayland-sys" "0.31.11"
                "1gp3hlkxx13i55lyyi794vnw9a780z3skx0xhj71zr69xwzv5snq")
               (crate-source "web-sys" "0.3.95"
                "0zfr2jy5bpkkggl88i43yy37p538hg20i56kwn421yj9g6qznbag")
               (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras")
               (crate-source "webbrowser" "1.2.1"
                "0wlz31z5zgwvjgg95w0wyzmp7ny5dx20ggm7ys7ydwbaj605bj8g")
               (crate-source "webpki-root-certs" "1.0.7"
                "0b59x5mzsilk42w59nif3lfhc24pgzb0v35pi6p01qy37z7424gk")
               (crate-source "weezl" "0.1.12"
                "122a1dhha6cib5az4ihcqlh60ns2bi6rskdv875p94lbvj6wk2m2")
               (crate-source "wgpu" "27.0.1"
                "0xvsrmcp862zh3sd6nkr0cbsznna4c3l1hrilzkms4nygjn8prmz")
               (crate-source "wgpu-core" "27.0.3"
                "1rya571frb73y32iwnhnxada31dk64vzj6b1nabihfsl2pjmv9r7")
               (crate-source "wgpu-core-deps-apple" "27.0.0"
                "0cyjas0gx6wxjshv3f25p7gvqycnl7ckyphxaqlwgq4visaswwh7")
               (crate-source "wgpu-core-deps-emscripten" "27.0.0"
                "1dd69pd9z8m4a88h7qmkcjr20qmnfhkxn7fqrwz83c4m992c6smh")
               (crate-source "wgpu-core-deps-wasm" "27.0.0"
                "1dshg8m7qg3crlscvy1hi1brhbhfxdydy6a8wivsh9xhygf2f44v")
               (crate-source "wgpu-core-deps-windows-linux-android" "27.0.0"
                "1hq3ka3mm507fysc3y017hp19bdj8a95mw1086778w8ssqkp06bi")
               (crate-source "wgpu-hal" "27.0.4"
                "1khk8gb81izrd9815fdy4ywq1fsczynswwgz9ay9iqbyqmhwn8av")
               (crate-source "wgpu-types" "27.0.1"
                "1sx5blmyas6k40ilhlrfsy31xcvcf0l1dn9dgxrxp42r756gip5g")
               (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw")
               (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc")
               (crate-source "winapi-util" "0.1.11"
                "08hdl7mkll7pz8whg869h58c1r9y7in0w0pk8fm24qc77k0b39y2")
               (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki")
               (crate-source "window_clipboard" "0.5.1"
                "0cyph2xr8g9rx24cnh5xrg75v3njc4l4iyski3g2vbsy60k44rfm")
               (crate-source "windows" "0.58.0"
                "1dkjj94b0gn91nn1n22cvm4afsj98f5qrhcl3112v6f4jcfx816x")
               (crate-source "windows" "0.62.2"
                "10457l9ihrbw8j79z2v4plyjxkf6xvb5npd0lqwmkh702gpaszsj")
               (crate-source "windows-collections" "0.3.2"
                "0436rjbkqn3j9m2v2lcmwwk0l3n2r57yvqb7fcy4m8d8y5ddkci3")
               (crate-source "windows-core" "0.58.0"
                "16czypy425jzmiys4yb3pwsh7cm6grxn9kjp889iqnf2r17d99kb")
               (crate-source "windows-core" "0.62.2"
                "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q")
               (crate-source "windows-future" "0.3.2"
                "1jq5qs2dwzf6rl60f8gr49z2mifxsrdh4y4yfdws467ya41gkmp1")
               (crate-source "windows-implement" "0.58.0"
                "16spr5z65z21qyv379rv2mb1s5q2i9ibd1p2pkn0dr9qr535pg9b")
               (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5")
               (crate-source "windows-interface" "0.58.0"
                "059mxmfvx3x88q74ms0qlxmj2pnidmr5mzn60hakn7f95m34qg05")
               (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z")
               (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h")
               (crate-source "windows-numerics" "0.3.1"
                "09hgbg8pf89r4090yyhh9q29ppi7yyxkgmga9ascshy19a240bkf")
               (crate-source "windows-registry" "0.6.1"
                "082p7l615qk8a4g8g15yipc5lghga6cgfhm74wm7zknwzgvjnx82")
               (crate-source "windows-result" "0.2.0"
                "03mf2z1xcy2slhhsm15z24p76qxgm2m74xdjp8bihyag47c4640x")
               (crate-source "windows-result" "0.4.1"
                "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp")
               (crate-source "windows-strings" "0.1.0"
                "042dxvi3133f7dyi2pgcvknwkikk47k8bddwxbq5s0l6qhjv3nac")
               (crate-source "windows-strings" "0.5.1"
                "14bhng9jqv4fyl7lqjz3az7vzh8pw0w4am49fsqgcz67d67x0dvq")
               (crate-source "windows-sys" "0.45.0"
                "1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m")
               (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8")
               (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y")
               (crate-source "windows-sys" "0.60.2"
                "1jrbc615ihqnhjhxplr2kw7rasrskv9wj3lr80hgfd42sbj01xgj")
               (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf")
               (crate-source "windows-targets" "0.42.2"
                "0wfhnib2fisxlx8c507dbmh97kgij4r6kcxdi0f9nk6l1k080lcf")
               (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv")
               (crate-source "windows-targets" "0.53.5"
                "1wv9j2gv3l6wj3gkw5j1kr6ymb5q6dfc42yvydjhv3mqa7szjia9")
               (crate-source "windows-threading" "0.2.1"
                "0dsvsy33vxs0153z4n39sqkzx382cjjkrd46rb3z3zfak5dvsj9r")
               (crate-source "windows_aarch64_gnullvm" "0.42.2"
                "1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr")
               (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j")
               (crate-source "windows_aarch64_gnullvm" "0.53.1"
                "0lqvdm510mka9w26vmga7hbkmrw9glzc90l4gya5qbxlm1pl3n59")
               (crate-source "windows_aarch64_msvc" "0.42.2"
                "0hsdikjl5sa1fva5qskpwlxzpc5q9l909fpl1w6yy1hglrj8i3p0")
               (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09")
               (crate-source "windows_aarch64_msvc" "0.53.1"
                "01jh2adlwx043rji888b22whx4bm8alrk3khjpik5xn20kl85mxr")
               (crate-source "windows_i686_gnu" "0.42.2"
                "0kx866dfrby88lqs9v1vgmrkk1z6af9lhaghh5maj7d4imyr47f6")
               (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf")
               (crate-source "windows_i686_gnu" "0.53.1"
                "18wkcm82ldyg4figcsidzwbg1pqd49jpm98crfz0j7nqd6h6s3ln")
               (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf")
               (crate-source "windows_i686_gnullvm" "0.53.1"
                "030qaxqc4salz6l4immfb6sykc6gmhyir9wzn2w8mxj8038mjwzs")
               (crate-source "windows_i686_msvc" "0.42.2"
                "0q0h9m2aq1pygc199pa5jgc952qhcnf0zn688454i7v4xjv41n24")
               (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294")
               (crate-source "windows_i686_msvc" "0.53.1"
                "1hi6scw3mn2pbdl30ji5i4y8vvspb9b66l98kkz350pig58wfyhy")
               (crate-source "windows_x86_64_gnu" "0.42.2"
                "0dnbf2xnp3xrvy8v9mgs3var4zq9v9yh9kv79035rdgyp2w15scd")
               (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl")
               (crate-source "windows_x86_64_gnu" "0.53.1"
                "16d4yiysmfdlsrghndr97y57gh3kljkwhfdbcs05m1jasz6l4f4w")
               (crate-source "windows_x86_64_gnullvm" "0.42.2"
                "18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16")
               (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94")
               (crate-source "windows_x86_64_gnullvm" "0.53.1"
                "1qbspgv4g3q0vygkg8rnql5c6z3caqv38japiynyivh75ng1gyhg")
               (crate-source "windows_x86_64_msvc" "0.42.2"
                "1w5r0q0yzx827d10dpjza2ww0j8iajqhmb54s735hhaj66imvv4s")
               (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq")
               (crate-source "windows_x86_64_msvc" "0.53.1"
                "0l6npq76vlq4ksn4bwsncpr8508mk0gmznm6wnhjg95d19gzzfyn")
               (crate-source "winit" "0.30.13"
                "13cpylyvdl066fivncw96pn29y15rhzlqba73sym10wziajmyxd6")
               (crate-source "winnow" "0.7.15"
                "0i9rkl2rqpbnnxlgs20gmkj3nd0b2k8q55mjmpc2ybb84xwxjyfz")
               (crate-source "winnow" "1.0.2"
                "1l7xnfvlgy4da6gq5ip2bgcm8i9d0rwzaxg1p88nlw8lxy5p1q9f")
               (crate-source "wit-bindgen" "0.51.0"
                "19fazgch8sq5cvjv3ynhhfh5d5x08jq2pkw8jfb05vbcyqcr496p")
               (crate-source "wit-bindgen" "0.57.1"
                "0vjk2jb593ri9k1aq4iqs2si9mrw5q46wxnn78im7hm7hx799gqy")
               (crate-source "wit-bindgen-core" "0.51.0"
                "1p2jszqsqbx8k7y8nwvxg65wqzxjm048ba5phaq8r9iy9ildwqga")
               (crate-source "wit-bindgen-rust" "0.51.0"
                "08bzn5fsvkb9x9wyvyx98qglknj2075xk1n7c5jxv15jykh6didp")
               (crate-source "wit-bindgen-rust-macro" "0.51.0"
                "0ymizapzv2id89igxsz2n587y2hlfypf6n8kyp68x976fzyrn3qc")
               (crate-source "wit-component" "0.244.0"
                "1clwxgsgdns3zj2fqnrjcp8y5gazwfa1k0sy5cbk0fsmx4hflrlx")
               (crate-source "wit-parser" "0.244.0"
                "0dm7avvdxryxd5b02l0g5h6933z1cw5z0d4wynvq2cywq55srj7c")
               (crate-source "writeable" "0.6.3"
                "1i54d13h9bpap2hf13xcry1s4lxh7ap3923g8f3c0grd7c9fbyhz")
               (crate-source "x11-dl" "2.21.0"
                "0vsiq62xpcfm0kn9zjw5c9iycvccxl22jya8wnk18lyxzqj5jwrq")
               (crate-source "x11rb" "0.13.2"
                "053lvnaw9ycbl791mgwly2hw27q6vqgzrb1y5kz1as52wmdsm4wr")
               (crate-source "x11rb-protocol" "0.13.2"
                "1g81cznbyn522b0fbis0i44wh3adad2vhsz5pzf99waf3sbc4vza")
               (crate-source "xcursor" "0.3.10"
                "0awgy98awg4ydcfmynqfcwvl4bnnfcm4i2vvnk2n926a02jy9jdy")
               (crate-source "xkbcommon-dl" "0.4.2"
                "1iai0r3b5skd9vbr8z5b0qixiz8jblzfm778ddm8ba596a0dwffh")
               (crate-source "xkeysym" "0.2.1"
                "0mksx670cszyd7jln6s7dhkw11hdfv7blwwr3isq98k22ljh1k5r")
               (crate-source "xml-rs" "0.8.28"
                "0grdj7xwbki5zrkalrg8dljyf14y4yj3wrj34sbzqp06i9zk7s1s")
               (crate-source "y4m" "0.8.0"
                "0j24y2zf60lpxwd7kyg737hqfyqx16y32s0fjyi6fax6w4hlnnks")
               (crate-source "yazi" "0.2.1"
                "1dgv0dd0329dcbs57z2wj03daz8y1axgprw3pf5yf5jsbcjkh5z0")
               (crate-source "yoke" "0.8.2"
                "1jprcs7a98a5whvfs6r3jvfh1nnfp6zyijl7y4ywmn88lzywbs5b")
               (crate-source "yoke-derive" "0.8.2"
                "13l5y5sz4lqm7rmyakjbh6vwgikxiql51xfff9hq2j485hk4r16y")
               (crate-source "zbus" "5.14.0"
                "1g305kwnw9f420c6m10i40cjdjm2s31ddpngac5a8hrrpmfzk0na")
               (crate-source "zbus_macros" "5.14.0"
                "08ljsjl1zhpzdf7hx37yaifi14rvysj354bfqjrc9al4drhpjzl9")
               (crate-source "zbus_names" "4.3.1"
                "03y5f8xwzmk4y5wb4g95a1hl48mxlmhcbwqz62mrnqbqbdnszn7z")
               (crate-source "zeno" "0.3.3"
                "0915lg3b1qiixizic9kwj2bw42x35baxqvl9dn0m2plkj91drwvd")
               (crate-source "zerocopy" "0.8.48"
                "1sb8plax8jbrsng1jdval7bdhk7hhrx40dz3hwh074k6knzkgm7f")
               (crate-source "zerocopy-derive" "0.8.48"
                "1m5s0g92cxggqc74j83k1priz24k3z93sj5gadppd20p9c4cvqvh")
               (crate-source "zerofrom" "0.1.7"
                "1py40in4rirc9q8w36q67pld0zk8ssg024xhh0cncxgal7ra3yk9")
               (crate-source "zerofrom-derive" "0.1.7"
                "18c4wsnznhdxx6m80piil1lbyszdiwsshgjrybqcm4b6qic22lqi")
               (crate-source "zeroize" "1.8.2"
                "1l48zxgcv34d7kjskr610zqsm6j2b4fcr2vfh9jm9j1jgvk58wdr")
               (crate-source "zerotrie" "0.2.4"
                "1gr0pkcn3qsr6in6iixqyp0vbzwf2j1jzyvh7yl2yydh3p9m548g")
               (crate-source "zerovec" "0.11.6"
                "0fdjsy6b31q9i0d73sl7xjd12xadbwi45lkpfgqnmasrqg5i3ych")
               (crate-source "zerovec-derive" "0.11.3"
                "0m85qj92mmfvhjra6ziqky5b1p4kcmp5069k7kfadp5hr8jw8pb2")
               (crate-source "zmij" "1.0.21"
                "1amb5i6gz7yjb0dnmz5y669674pqmwbj44p4yfxfv2ncgvk8x15q")
               (crate-source "zune-core" "0.5.1"
                "1ya0zdqxlr5v57791j7bvm408ri2cfx81a4v6z85f560yw3hi2nb")
               (crate-source "zune-inflate" "0.2.54"
                "00kg24jh3zqa3i6rg6yksnb71bch9yi1casqydl00s7nw8pk7avk")
               (crate-source "zune-jpeg" "0.5.15"
                "15kjpn6pywxlwb8w5irfd68x31wi3mb4y1da8bqh7havh5drvg17")
               (crate-source "zvariant" "5.10.0"
                "02sls8pi570z1wssl150413x0mcwqhi9ywlliqsbwfwh46djj22p")
               (crate-source "zvariant_derive" "5.10.0"
                "0b3mh0kzf6sz7vd5j9gimq86awjcigddh26cz5b6di79xc9b0nav")
               (crate-source "zvariant_utils" "3.3.0"
                "1sf5i71in36gc08jhak83pprnkam8gk936cqlq9hzx7q9sk26p7p")))
    (home-page "https://hnefatafl.org")
    (synopsis
     "Copenhagen Hnefatafl client, engine, server and artificial intelligence")
    (description
     "Copenhagen Hnefatafl is a board game client, engine, server, and
artificial intelligence.  It implements the Copenhagen variant of the ancient
Viking board game Hnefatafl, featuring online play against other players or
AI opponents, and a graphical client built with the Iced GUI framework.")
    (license license:agpl3+)))
