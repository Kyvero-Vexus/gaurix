(define-module (gaurix packages general-compat)
  #:use-module (gaurix packages recipe-resolver-260426h)
  #:use-module (gaurix packages deptree-resolver-260426h)
  #:use-module (gaurix packages deptree-resolver-260426g)
  #:use-module (gaurix packages recipe-resolver-260426g)
  #:use-module (gaurix packages deptree-resolver-260426f)
  #:use-module (gaurix packages recipe-resolver-260426f)
  #:use-module (gaurix packages deptree-resolver-260426e)
  #:use-module (gaurix packages recipe-resolver-260426c)
  #:use-module (gaurix packages deptree-resolver-260426d)
  #:use-module (gaurix packages deptree-resolver-260426c)
  #:use-module (gaurix packages deptree-resolver-260426b)
  #:use-module (gaurix packages recipe-resolver-260426a)
  #:use-module (gaurix packages deptree-resolver-260425o)
  #:use-module (gaurix packages deptree-resolver-260425n)
  #:use-module (gaurix packages recipe-resolver-260425n)
  #:use-module (gaurix packages deptree-resolver-260425m)
  #:use-module (gaurix packages deptree-resolver-260425l)
  #:use-module (gaurix packages deptree-resolver-260425k)
  #:use-module (gaurix packages recipe-resolver-260425l)
  #:use-module (gaurix packages recipe-resolver-260425k)
  #:use-module (gaurix packages deptree-resolver-260425j)
  #:use-module (gaurix packages deptree-resolver-260425i)
  #:use-module (gaurix packages deptree-resolver-260425h)
  #:use-module (gaurix packages deptree-resolver-260425g)
  #:use-module (gaurix packages deptree-resolver-260425f)
  #:use-module (gaurix packages recipe-resolver-260425g)
  #:use-module (gaurix packages deptree-resolver-260425e)
  #:use-module (gaurix packages deptree-resolver-260425d)
  #:use-module (gaurix packages deptree-resolver-260425b)
  #:use-module (gaurix packages llama-cpp-cuda)
  #:use-module (gaurix packages recipe-resolver-260418t)
  #:use-module (gaurix packages recipe-resolver-260418u)
  #:use-module (gaurix packages recipe-resolver-260418v)
  #:use-module (gaurix packages deptree-resolver-260407c)
  #:use-module (gaurix packages deptree-resolver-260407d)
  #:use-module (gaurix packages deptree-resolver-260408b)
  #:use-module (gaurix packages deptree-resolver-260408c)
  #:use-module (gaurix packages deptree-resolver-260408d)
  #:use-module (gaurix packages deptree-resolver-260417ac)
  #:use-module (gaurix packages deptree-resolver-260417ad)
  #:use-module (gaurix packages deptree-resolver-260417ah)
  #:use-module (gaurix packages deptree-resolver-260417ak)
  #:use-module (gaurix packages deptree-resolver-260417ao)
  #:use-module (gaurix packages deptree-resolver-260417as)
  #:use-module (gaurix packages deptree-resolver-260418p)
  #:use-module (gaurix packages deptree-resolver-260418s)
  #:use-module (gaurix packages deptree-resolver-260418v)
  #:use-module (gaurix packages deptree-resolver-260423d)
  #:use-module (gaurix packages deptree-resolver-260423e)
  #:use-module (gaurix packages deptree-resolver-260423f)
  #:use-module (gaurix packages deptree-resolver-260423g)
  #:use-module (gaurix packages deptree-resolver-260423h)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages i2p)
  #:use-module (gnu packages sync)
  #:use-module (gaurix packages fluxer-bin)
  #:use-module (gaurix packages recipe-resolver-260424p)
  ;; NOTE: recipe-resolver-260407b has syntax errors; skipped
  ;; #:use-module (gaurix packages recipe-resolver-260407b)
  #:use-module (gaurix packages recipe-resolver-260407d)
  #:use-module (gaurix packages recipe-resolver-260407e)
  #:use-module (gaurix packages recipe-resolver-260407f)
  #:use-module (gaurix packages recipe-resolver-260412a)
  #:use-module (gaurix packages recipe-resolver-260413c)
  #:use-module (gaurix packages recipe-resolver-260413h)
  #:use-module (gaurix packages recipe-resolver-260413i)
  #:use-module (gaurix packages recipe-resolver-260413j)
  #:use-module (gaurix packages recipe-resolver-260413m)
  #:use-module (gaurix packages recipe-resolver-260413s)
  #:use-module (gaurix packages recipe-resolver-260413u)
  #:use-module (gaurix packages recipe-resolver-260413v)
  #:use-module (gaurix packages recipe-resolver-260413w)
  #:use-module (gaurix packages recipe-resolver-260413ad)
  #:use-module (gaurix packages recipe-resolver-260413af)
  #:use-module (gaurix packages recipe-resolver-260413ag)
  #:use-module (gaurix packages recipe-resolver-260413ah)
  #:use-module (gaurix packages recipe-resolver-260413aj)
  #:use-module (gaurix packages recipe-resolver-260413ak)
  #:use-module (gaurix packages recipe-resolver-260413al)
  #:use-module (gaurix packages recipe-resolver-260414c)
  #:use-module (gaurix packages recipe-resolver-260414e)
  #:use-module (gaurix packages recipe-resolver-260414f)
  #:use-module (gaurix packages recipe-resolver-260414j)
  #:use-module (gaurix packages recipe-resolver-260414i)
  #:use-module (gaurix packages recipe-resolver-260414l)
  #:use-module (gaurix packages recipe-resolver-260414o)
  #:use-module (gaurix packages recipe-resolver-260414p)
  #:use-module (gaurix packages recipe-resolver-260414v)
  #:use-module (gaurix packages recipe-resolver-260414z)
  #:use-module (gaurix packages recipe-resolver-260414aa)
  #:use-module (gaurix packages recipe-resolver-260414ab)
  #:use-module (gaurix packages deptree-resolver-260413n)
  #:use-module (gaurix packages deptree-resolver-260413p)
  #:use-module (gaurix packages deptree-resolver-260413q)
  #:use-module (gaurix packages deptree-resolver-260414p)
  #:use-module (gaurix packages deptree-resolver-260414r)
  #:use-module (gaurix packages deptree-resolver-260415l)
  #:use-module (gaurix packages deptree-resolver-260415m)
  #:use-module (gaurix packages deptree-resolver-260415n)
  #:use-module (gaurix packages recipe-resolver-260415o)
  #:use-module (gaurix packages recipe-resolver-260415r)
  #:use-module (gaurix packages recipe-resolver-260415s)
  #:use-module (gaurix packages recipe-resolver-260415t)
  #:use-module (gaurix packages recipe-resolver-260415v)
  #:use-module (gaurix packages recipe-resolver-260415w)
  #:use-module (gaurix packages recipe-resolver-260415x)
  #:use-module (gaurix packages recipe-resolver-260416a)
  #:use-module (gaurix packages recipe-resolver-260416b)
  #:use-module (gaurix packages recipe-resolver-260416c)
  #:use-module (gaurix packages recipe-resolver-260416e)
  #:use-module (gaurix packages recipe-resolver-260417n)
  #:use-module (gaurix packages recipe-resolver-260417q)
  #:use-module (gaurix packages recipe-resolver-260417t)
  #:use-module (gaurix packages recipe-resolver-260417w)
  #:use-module (gaurix packages recipe-resolver-260417ab)
  #:use-module (gaurix packages recipe-resolver-260417ag)
  #:use-module (gaurix packages recipe-resolver-260417at)
  #:use-module (gaurix packages recipe-resolver-260417au)
  #:use-module (gaurix packages recipe-resolver-260418g)
  #:use-module (gaurix packages recipe-resolver-260418h)
  #:use-module (gaurix packages recipe-resolver-260418o)
  #:use-module (gaurix packages recipe-resolver-260418p)
  #:use-module (gaurix packages recipe-resolver-260418r)
  #:use-module (gaurix packages recipe-resolver-260418x)
  #:use-module (gaurix packages recipe-resolver-260418y)
  #:use-module (gaurix packages recipe-resolver-260418z)
  #:use-module (gaurix packages recipe-resolver-260418aa)
  #:use-module (gaurix packages recipe-resolver-260418ab)
  #:use-module (gaurix packages recipe-resolver-260418ac)
  #:use-module (gaurix packages recipe-resolver-260418ad)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages admin)
#:use-module (gnu packages forth)
#:use-module (gnu packages pulseaudio)
#:use-module (gnu packages bittorrent)
#:use-module (gnu packages xdisorg)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python)
  #:use-module (gnu packages video)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages xorg)
  #:use-module ((gnu packages tls) #:prefix gnu:)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages image)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages compton)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages language)
  #:use-module (gnu packages java)
  #:use-module (gnu packages mold)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages search)
  #:use-module (gnu packages task-management)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages vpn)
  #:use-module (gnu packages ccache)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages music)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages docker)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages zig)
  #:use-module (gnu packages solidity)
  #:use-module (gnu packages check)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bootloaders)
#:use-module (gnu packages astronomy)
#:use-module (gnu packages ntp)
#:use-module (gnu packages emacs-xyz)
#:use-module (gnu packages calendar)
#:use-module (gnu packages cmake)
#:use-module (gnu packages firmware)
#:use-module (gnu packages geo)
#:use-module (gnu packages gnunet)
#:use-module (gnu packages gnustep)
#:use-module (gnu packages golang-apps)
#:use-module (gnu packages golang-check)
#:use-module (gnu packages kde-frameworks)
#:use-module (gnu packages lxde)
#:use-module (gnu packages maths)
#:use-module (gnu packages patchutils)
#:use-module (gnu packages rust)
#:use-module (gnu packages scanner)
#:use-module (gnu packages shellutils)
#:use-module (gnu packages suckless)
#:use-module (gnu packages upnp)
#:use-module (gnu packages vulkan)
#:use-module (gnu packages wget)
#:use-module (gnu packages zig-xyz)
  #:use-module (gnu packages electronics)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages hexedit)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages tor)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages fcitx5)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages kde-graphics)
  #:use-module (gnu packages kde-pim)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages php)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages python-graphics)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages syndication)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages speech)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd6)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd12)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd13)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd14)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd16)
  #:use-module (gaurix packages cron-c79f127f-r26-w03-nrd)
  #:use-module (gnu packages opencl)
  #:use-module (gnu packages image-processing)
#:use-module (gnu packages cdrom)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages syncthing)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages dotnet)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages wine)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages xfce)
  #:use-module (nongnu packages dyalog)
  #:use-module (gaurix packages queue-20260406-nrd30f)
  #:use-module (gnu packages sycl)
  #:use-module (gnu packages chromium)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages matrix)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages selinux)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages video)
  #:use-module (gaurix packages deptree-resolver-260407)
  #:use-module (gaurix packages deptree-resolver-260407b)
  #:use-module (gaurix packages queue-20260407-deptree)
  #:use-module (gaurix packages queue-20260407-opus-p100)
  #:use-module (gaurix packages queue-20260407-opus-p101)
  #:use-module (gaurix packages deptree-resolver-260407e)
  #:use-module (gaurix packages deptree-resolver-260407f)
  #:use-module (gaurix packages recipe-resolver-260407h)
  #:use-module (gaurix packages recipe-resolver-260407i)
  #:use-module (gaurix packages recipe-resolver-260407j)
  #:use-module (gaurix packages recipe-resolver-260407k)
  #:use-module (gaurix packages recipe-resolver-260407l)
  #:use-module (gaurix packages recipe-resolver-260407m)
  #:use-module (gaurix packages recipe-resolver-260407n)
  #:use-module (gaurix packages recipe-resolver-260407o)
  #:use-module (gaurix packages recipe-resolver-260408a)
  #:use-module (gaurix packages deptree-resolver-260407g)
  #:use-module (gaurix packages deptree-resolver-260407h)
  #:use-module (gaurix packages deptree-resolver-260408a)
  #:use-module (gaurix packages recipe-resolver-260408b)
  #:use-module (gaurix packages recipe-resolver-260408c)
  #:use-module (gaurix packages recipe-resolver-260408d)
  #:use-module (gaurix packages recipe-resolver-260408e)
  #:use-module (gaurix packages recipe-resolver-260408f)
  #:use-module (gaurix packages recipe-resolver-260408g)
  #:use-module (gaurix packages recipe-resolver-260408h)
  #:use-module (gaurix packages recipe-resolver-260408i)
  #:use-module (gaurix packages recipe-resolver-260408j)
  #:use-module (gaurix packages recipe-resolver-260408k)
  #:use-module (gaurix packages recipe-resolver-260408l)
  #:use-module (gaurix packages deptree-resolver-260408e)
  #:use-module (gaurix packages deptree-resolver-260408f)
  #:use-module (gaurix packages deptree-resolver-260408g)
  #:use-module (gaurix packages recipe-resolver-260408m)
  #:use-module (gaurix packages recipe-resolver-260408o)
  #:use-module (gaurix packages recipe-resolver-260408p)
  #:use-module (gaurix packages recipe-resolver-260408q)
  #:use-module (gaurix packages recipe-resolver-260408r)
  #:use-module (gaurix packages recipe-resolver-260408s)
  #:use-module (gaurix packages recipe-resolver-260408t)
  #:use-module (gaurix packages recipe-resolver-260408u)
  #:use-module (gaurix packages recipe-resolver-260408v)
  #:use-module (gaurix packages recipe-resolver-260408w)
  #:use-module (gaurix packages recipe-resolver-260408x)
  #:use-module (gaurix packages deptree-resolver-260408h)
  #:use-module (gaurix packages deptree-resolver-260408i)
  #:use-module (gaurix packages deptree-resolver-260408j)
  #:use-module (gaurix packages deptree-resolver-260408k)
  #:use-module (gaurix packages recipe-resolver-260408y)
  #:use-module (gaurix packages deptree-resolver-260412a)
  #:use-module (gaurix packages recipe-resolver-260412b)
  #:use-module (gaurix packages recipe-resolver-260412c)
  #:use-module (gaurix packages recipe-resolver-260413a)
  #:use-module (gaurix packages recipe-resolver-260413b)
  #:use-module (gaurix packages deptree-resolver-260413b)
  #:use-module (gaurix packages recipe-resolver-260413d)
  #:use-module (gaurix packages recipe-resolver-260413f)
  #:use-module (gaurix packages recipe-resolver-260413g)
  #:use-module (gaurix packages deptree-resolver-260413c)
  #:use-module (gaurix packages deptree-resolver-260413d)
  #:use-module (gaurix packages deptree-resolver-260413e)
  #:use-module (gaurix packages deptree-resolver-260413f)
  #:use-module (gaurix packages recipe-resolver-260413k)
  #:use-module (gaurix packages recipe-resolver-260413l)
  #:use-module (gaurix packages deptree-resolver-260413g)
  #:use-module (gaurix packages recipe-resolver-260413n)
  #:use-module (gaurix packages deptree-resolver-260413h)
  #:use-module (gaurix packages recipe-resolver-260413p)
  #:use-module (gaurix packages recipe-resolver-260413r)
  #:use-module (gaurix packages recipe-resolver-260413q)
  #:use-module (gaurix packages deptree-resolver-260413i)
  #:use-module (gaurix packages deptree-resolver-260413j)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages rdf)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages hunspell)
  #:use-module (gaurix packages recipe-resolver-260413t)
  #:use-module (gaurix packages deptree-resolver-260413k)
  #:use-module (gaurix packages recipe-resolver-260413x)
  #:use-module (gaurix packages recipe-resolver-260413y)
  #:use-module (gaurix packages recipe-resolver-260413z)
  #:use-module (gaurix packages deptree-resolver-260413l)
  #:use-module (gaurix packages deptree-resolver-260413m)
  #:use-module (gaurix packages deptree-resolver-260413o)
  #:use-module (gaurix packages recipe-resolver-260413ab)
  #:use-module (gaurix packages recipe-resolver-260413ac)
  #:use-module (gaurix packages recipe-resolver-260413ai)
  #:use-module (gaurix packages recipe-resolver-260414a)
  #:use-module (gaurix packages deptree-resolver-260414b)
  #:use-module (gaurix packages recipe-resolver-260414b)
  #:use-module (gaurix packages recipe-resolver-260414k)
  #:use-module (gaurix packages deptree-resolver-260414c)
  #:use-module (gaurix packages deptree-resolver-260414d)
  #:use-module (gaurix packages deptree-resolver-260414e)
  #:use-module (gaurix packages deptree-resolver-260414i)

  #:use-module (gaurix packages deptree-resolver-260414j)

  #:use-module (gaurix packages deptree-resolver-260414k)
  #:use-module (gaurix packages recipe-resolver-260414m)
  #:use-module (gaurix packages recipe-resolver-260414n)

  #:use-module (gaurix packages deptree-resolver-260414l)

  #:use-module (gaurix packages deptree-resolver-260414m)
  #:use-module (gaurix packages recipe-resolver-260414q)
  #:use-module (gaurix packages recipe-resolver-260414r)
  #:use-module (gaurix packages recipe-resolver-260414u)

  #:use-module (gaurix packages deptree-resolver-260414n)

  #:use-module (gaurix packages deptree-resolver-260414o)
  #:use-module (gaurix packages deptree-resolver-260414q)
  #:use-module (gaurix packages deptree-resolver-260414t)
  #:use-module (gaurix packages recipe-resolver-260414w)
  #:use-module (gaurix packages recipe-resolver-260414x)
  #:use-module (gaurix packages recipe-resolver-260414y)
  #:use-module (gaurix packages recipe-resolver-260414ac)
  #:use-module (gaurix packages recipe-resolver-260414ae)
  #:use-module (gaurix packages deptree-resolver-260414u)
  #:use-module (gaurix packages recipe-resolver-260414af)
  #:use-module (gaurix packages recipe-resolver-260414ag)
  #:use-module (gaurix packages recipe-resolver-260415a)
  #:use-module (gaurix packages recipe-resolver-260415b)
  #:use-module (gaurix packages deptree-resolver-260414v)
  #:use-module (gaurix packages deptree-resolver-260415b)
  #:use-module (gaurix packages recipe-resolver-260415c)
  #:use-module (gaurix packages recipe-resolver-260415d)
  #:use-module (gaurix packages recipe-resolver-260415e)
  #:use-module (gaurix packages deptree-resolver-260415c)

  #:use-module (gaurix packages deptree-resolver-260415g)
  #:use-module (gaurix packages deptree-resolver-260415f)
  #:use-module (gaurix packages recipe-resolver-260415g)
  #:use-module (gaurix packages recipe-resolver-260415h)
  #:use-module (gaurix packages recipe-resolver-260415i)
  #:use-module (gaurix packages recipe-resolver-260415j)
  #:use-module (gaurix packages deptree-resolver-260415h)
  #:use-module (gaurix packages deptree-resolver-260415i)
  #:use-module (gaurix packages deptree-resolver-260415j)
  #:use-module (gaurix packages recipe-resolver-260415k)
  #:use-module (gaurix packages recipe-resolver-260415l)
  #:use-module (gaurix packages recipe-resolver-260415m)
  #:use-module (gaurix packages deptree-resolver-260415k)
  #:use-module (gaurix packages recipe-resolver-260415n)
  #:use-module (gaurix packages deptree-resolver-260415t)
  #:use-module (gaurix packages recipe-resolver-260415u)
  #:use-module (gaurix packages recipe-resolver-260416d)
  #:use-module (gaurix packages recipe-resolver-260416f)
  #:use-module (gaurix packages recipe-resolver-260416g)
  #:use-module (gaurix packages recipe-resolver-260416h)
  #:use-module (gaurix packages recipe-resolver-260416i)
  #:use-module (gaurix packages deptree-resolver-260415u)
  #:use-module (gaurix packages deptree-resolver-260416a)
  #:use-module (gaurix packages deptree-resolver-260416b)
  #:use-module (gaurix packages deptree-resolver-260416c)
  #:use-module (gaurix packages deptree-resolver-260416d)
  #:use-module (gaurix packages deptree-resolver-260416e)
  #:use-module (gaurix packages deptree-resolver-260416g)
  #:use-module (gaurix packages deptree-resolver-260416j)
  #:use-module (gaurix packages recipe-resolver-260416j)
  #:use-module (gaurix packages recipe-resolver-260417k)
  #:use-module (gaurix packages recipe-resolver-260417l)
  #:use-module (gaurix packages recipe-resolver-260417m)
  #:use-module (gaurix packages deptree-resolver-260417n)
  #:use-module (gaurix packages recipe-resolver-260417r)
  #:use-module (gaurix packages recipe-resolver-260417s)
  #:use-module (gaurix packages recipe-resolver-260417u)
  #:use-module (gaurix packages recipe-resolver-260417v)
  #:use-module (gaurix packages deptree-resolver-260417q)
  #:use-module (gaurix packages deptree-resolver-260417r)
  #:use-module (gaurix packages deptree-resolver-260417s)
  #:use-module (gaurix packages recipe-resolver-260417x)
  #:use-module (gaurix packages recipe-resolver-260417y)
  #:use-module (gaurix packages recipe-resolver-260417z)
  #:use-module (gaurix packages deptree-resolver-260417y)
  #:use-module (gaurix packages deptree-resolver-260417z)
  #:use-module (gaurix packages recipe-resolver-260417aa)
  #:use-module (gaurix packages recipe-resolver-260417ad)
  #:use-module (gaurix packages recipe-resolver-260417ae)
  #:use-module (gaurix packages recipe-resolver-260417af)
  #:use-module (gaurix packages recipe-resolver-260417ah)
  #:use-module (gaurix packages recipe-resolver-260417ai)
  #:use-module (gaurix packages deptree-resolver-260417aj)
  #:use-module (gaurix packages deptree-resolver-260417au)
  #:use-module (gaurix packages deptree-resolver-260417av)
  #:use-module (gaurix packages deptree-resolver-260418a)
  #:use-module (gaurix packages recipe-resolver-260417aj)
  #:use-module (gaurix packages recipe-resolver-260417ak)
  #:use-module (gaurix packages recipe-resolver-260417al)
  #:use-module (gaurix packages recipe-resolver-260417am)
  #:use-module (gaurix packages recipe-resolver-260417an)
  #:use-module (gaurix packages recipe-resolver-260417ao)
  #:use-module (gaurix packages recipe-resolver-260417ap)
  #:use-module (gaurix packages recipe-resolver-260417aq)
  #:use-module (gaurix packages recipe-resolver-260417as)
  #:use-module (gaurix packages recipe-resolver-260417av)
  #:use-module (gaurix packages recipe-resolver-260417aw)
  #:use-module (gaurix packages recipe-resolver-260417ax)
  #:use-module (gaurix packages recipe-resolver-260418a)
  #:use-module (gaurix packages recipe-resolver-260418b)
  #:use-module (gaurix packages recipe-resolver-260418c)
  #:use-module (gaurix packages deptree-resolver-260418d)
  #:use-module (gaurix packages recipe-resolver-260418f)
  #:use-module (gaurix packages recipe-resolver-260418i)
  #:use-module (gaurix packages deptree-resolver-260418g)
  #:use-module (gaurix packages deptree-resolver-260418j)
  #:use-module (gaurix packages recipe-resolver-260418j)
  #:use-module (gaurix packages recipe-resolver-260418k)
  #:use-module (gaurix packages recipe-resolver-260418l)
  #:use-module (gaurix packages recipe-resolver-260418m)
  #:use-module (gaurix packages recipe-resolver-260418n)
  #:use-module (gaurix packages recipe-resolver-260418q)
  #:use-module (gaurix packages recipe-resolver-260418s)
  #:use-module (gaurix packages deptree-resolver-260418w)
  #:use-module (gaurix packages recipe-resolver-260418w)
  #:use-module (gaurix packages deptree-resolver-260418z)
  #:use-module (gaurix packages deptree-resolver-260418ab)
  #:use-module (gaurix packages deptree-resolver-260418ad)
  #:use-module (gaurix packages recipe-resolver-260418ae)
  #:use-module (gaurix packages deptree-resolver-260418ag)
  #:use-module (gaurix packages recipe-resolver-260418ag)
  #:use-module (gaurix packages recipe-resolver-260418ah)
  #:use-module (gaurix packages deptree-resolver-260418ai)
  #:use-module (gaurix packages deptree-resolver-260418ak)
  #:use-module (gaurix packages deptree-resolver-260418al)
  #:use-module (gaurix packages deptree-resolver-260418am)
  #:use-module (gaurix packages recipe-resolver-260418ai)
  #:use-module (gaurix packages recipe-resolver-260418aj)
  #:use-module (gaurix packages recipe-resolver-260418ak)
  #:use-module (gaurix packages recipe-resolver-260418al)
  #:use-module (gaurix packages recipe-resolver-260418am)
  #:use-module (gaurix packages recipe-resolver-260419a)
  #:use-module (gaurix packages recipe-resolver-260419b)
  #:use-module (gaurix packages recipe-resolver-260419c)
  #:use-module (gaurix packages recipe-resolver-260419d)
  #:use-module (gaurix packages recipe-resolver-260419f)
  #:use-module (gaurix packages recipe-resolver-260419g)
  ;; recipe-resolver-260419h: no exports (30 SUBSUMES_BY_PARENT PHP84 extensions)
  #:use-module (gaurix packages deptree-resolver-260419b)
  #:use-module (gaurix packages deptree-resolver-260419c)
  #:use-module (gaurix packages deptree-resolver-260419d)
  #:use-module (gaurix packages deptree-resolver-260419e)
  #:use-module (gaurix packages recipe-resolver-260419i)
  #:use-module (gaurix packages recipe-resolver-260419j)
  #:use-module (gaurix packages recipe-resolver-260423a)
  #:use-module (gaurix packages deptree-resolver-260423c)
  #:use-module (gaurix packages recipe-resolver-260423c)
  #:use-module (gaurix packages recipe-resolver-260423e)
  #:use-module (gaurix packages recipe-resolver-260423f)
  #:use-module (gaurix packages recipe-resolver-260423g)
  #:use-module (gaurix packages recipe-resolver-260423h)
  #:use-module (gaurix packages recipe-resolver-260423i)
  #:use-module (gaurix packages recipe-resolver-260423j)
  #:use-module (gaurix packages recipe-resolver-260423k)
  #:use-module (gaurix packages recipe-resolver-260423l)
  #:use-module (gaurix packages recipe-resolver-260423m)
  #:use-module (gaurix packages recipe-resolver-260423n)
  #:use-module (gaurix packages recipe-resolver-260423o)
  #:use-module (gaurix packages recipe-resolver-260423p)
  #:use-module (gaurix packages deptree-resolver-260423i)
  #:use-module (gaurix packages recipe-resolver-260423q)
  #:use-module (gaurix packages deptree-resolver-260423j)
  #:use-module (gaurix packages deptree-resolver-260424a)
  #:use-module (gaurix packages deptree-resolver-260424b)
  #:use-module (gaurix packages deptree-resolver-260424c)
  #:use-module (gaurix packages deptree-resolver-260424d)
  #:use-module (gaurix packages deptree-resolver-260424e)
  #:use-module (gaurix packages deptree-resolver-260424n)
  #:use-module (gaurix packages recipe-resolver-260423s)
  #:use-module (gaurix packages recipe-resolver-260424a)
  #:use-module (gaurix packages recipe-resolver-260423t)
  #:use-module (gaurix packages recipe-resolver-260424b)
  #:use-module (gaurix packages recipe-resolver-260424d)
  #:use-module (gaurix packages recipe-resolver-260424d)
  #:use-module (gaurix packages recipe-resolver-260424e)
  #:use-module (gaurix packages recipe-resolver-260424f)
  #:use-module (gaurix packages recipe-resolver-260424g)
  #:use-module (gaurix packages recipe-resolver-260424h)
  #:use-module (gaurix packages recipe-resolver-260424i)
  #:use-module (gaurix packages recipe-resolver-260424j)
  #:use-module (gaurix packages recipe-resolver-260424l)
  #:use-module (gaurix packages recipe-resolver-260424n)
  #:use-module (gaurix packages recipe-resolver-260424o)
  #:use-module (gaurix packages deptree-resolver-260424o)
  #:use-module (gaurix packages recipe-resolver-260424q)
  #:use-module (gaurix packages deptree-resolver-260424t)
  #:use-module (gaurix packages recipe-resolver-260424r)
  #:use-module (gaurix packages deptree-resolver-260424u)
  #:use-module (gaurix packages recipe-resolver-260424s)
  #:use-module (gaurix packages recipe-resolver-260424t)
  #:use-module (gaurix packages deptree-resolver-260424v)
  #:use-module (gaurix packages deptree-resolver-260424w)
  #:use-module (gaurix packages deptree-resolver-260424x)
  #:use-module (gaurix packages recipe-resolver-260424u)
  #:use-module (gaurix packages deptree-resolver-260424y)
  #:use-module (gaurix packages deptree-resolver-260425a)
  #:use-module (gaurix packages recipe-resolver-260425b)
  #:use-module (gaurix packages recipe-resolver-260425c)
  #:use-module (gaurix packages deptree-resolver-260425c)
  #:use-module (gaurix packages recipe-resolver-260425e)
  #:use-module (gaurix packages recipe-resolver-260425f)
  #:use-module (gaurix packages recipe-resolver-260425h)
  #:use-module (gaurix packages recipe-resolver-260426b)
  #:export (
            ;; recipe-resolver-260413l recipes
            font-heuristica
            font-gelasio
            font-lxgw-wenkai-screen
            font-lxgw-fasmart-gothic
            font-ubuntu-sans-mono
            font-blobmoji
            graphite-cursor-theme
            rose-pine-hyprcursor
            googledot-cursor-theme
            phiola-bin
            ionosctl-bin
            fhc-bin
            hypruler-bin
            logviewer-bin
            termide-bin
            gnome-shell-extension-tiling-assistant
            gnome-shell-extension-pop-shell
            gnome-shell-extension-logo-menu
            gnome-shell-extension-just-perfection
            gnome-shell-extension-blur-my-shell
            gnome-shell-extension-run-or-raise
            gnome-shell-extension-panel-date-format
            gnome-shell-extension-media-controls
            ;; recipe-resolver-260413l compat aliases
            ttf-gelasio-variable
            noto-fonts-emoji-blob
            graphite-cursor-theme-git
            gnome-shell-extension-pop-shell-git
            gnome-shell-extension-just-perfection-desktop
            ;; deptree-resolver-260407 compat aliases
            qt5-connectivity
            ;; deptree-resolver-260407 recipes
            pipes.sh
            grepcidr
            libjodycode
            notify-send.sh
            python-pid
            python-condense-json
            python-m3u8
            python-plyer
            dyalog-bin
            ;; nrd18 compat aliases
            gcc13
            setools
            ;; nrd30f compat aliases
            zrepl-git
            waybar-claude-usage
            waybar-codex-usage
            waybar-logitech-battery
            glabels-qt-git
            freecad-weekly-appimage
            0ad-git
            zenity-gtk3
            openrgb-bin
            melonds-git
            girara-git
            niri-dinit-git
            niri-git
            hyprland-meta-git
            tree-sitter-cli-github-bin
            evdi-dkms
            yt-dlp-nightly-bin
            yt-dlp-gui
            bat-cat-git
            yosys-nightly
            qtox-toktok
            gtk2
            gnu-netcat
            qt5-webengine
            python312
            openssl-1.1
            yt-dlp-git
            ripgrep-git
            fd-git
            eza-git
            dpibreak-git
            zoxide-git
            shellcheck-bin
            xlibre-xserver
            xlibre-xserver-bootstrap
            xlibre-xserver-xnest
            xlibre-xserver-xephyr
            xlibre-xserver-devel
            xlibre-xserver-common
            xlibre-xserver-xvfb
            qt5-remoteobjects
            qt5-webchannel
            qt5-websockets
            dashbinsh
            libidn11
            ncurses5-compat-libs
            neovim-symlinks
            neovim-git
            lib32-libidn11
            gtk-engine-murrine
            gtkspell
            python313
            botan2
            piper-tts
            libjpeg6-turbo
            lib32-gtk2
            openssl-1.0
            quickshell-git
            openscad-git
            mesa-git
            openrgb-git
            hashcat-git
            mold-git
            picom-git
            papirus-icon-theme-git
            libplasma-git
            qutebrowser-git
            cataclysm-dda-git
            mecab-git
            openttd-jgrpp-git
            dragon-drop-git
            wireguard-module-git
            python-protobuf-git
            protobuf-git
            libarchive-git
            dstask-git
            fsearch-git
            procs-git
            zfs-dkms
            lib32-openssl-1.0
            llama.cpp-vulkan
            python-valkey-git
            calibre-bin
            pandoc-bin
            beads-bin
            blender-bin
            musescore-bin
            docker-compose-bin
            pnmixer-bin
            xremap-x11-bin
            cura-bin
            zig-bin
            solidity-bin
            openshot-bin
            sd-git
            snitch-bin
            meshlab-bin
            cava-git
            onedrive-abraunegg
            i2p
            fluxer-git
            arc-solid-gtk-theme
            arc-gtk-theme
            libindicator-gtk2
            libdbusmenu-gtk2
            lib32-libjpeg6-turbo
            lib32-openssl-1.1
            librsvg-noglycin-docs
            librsvg-noglycin
            qt6-avif-image-plugin
            woff2-space-grotesk
            woff-space-grotesk
            qt5-avif-image-plugin
            otf-space-grotesk
            freerdp2
            icoextract
            lib32-libpng12
            libvpx1.3
            libtiff4
            librtmp0
            libgcrypt15
            lib32-libvpx1.3
            lib32-libtiff4
            lib32-librtmp0
            lib32-libgcrypt15
            lib32-glew1.10
            glew1.10
            lib32-libdbusmenu-gtk2
            zfs-utils
            lib32-libappindicator-gtk2
            python311
            youtube-dl
            python310
            gcc14-libs
            gcc14-fortran
            gcc14
            freetype2-woled
            bird2
            lib32-libindicator-gtk2
            blesh-git
            dualsensectl-git
            qt6ct-kde
            ffmpeg-full
            openrdap-client
            rclone-browser
            kwin-effects-geometry-change
            kwin-effect-rounded-corners-git
            evolution-tray-git
            piper-voices-en-us
            libadwaita-without-adwaita
            pulseaudio-ctl
            ares-emu
            ares-emu-git
            libwacom-surface
            xpadneo-dkms-git
            pidgin-mini
            kwin-effects-glass-git
            gtkmm-docs
            breeze-plus
            blender-benchmark
            ibus-bamboo
            librewolf-allow-dark
            gimp-devel
            alacritty-themes
            josm-latest
            gforth-docs
            trezor-udev
            gforth
            tofi
            tremc
            autojump
            apulse
            xlibre-input-libinput
            torchvision-rocm
            python-torchvision-rocm
            adw-gtk-theme-git
            qt5-charts
            perl-file-rename
            grub-theme-zorin-os
            grub-theme-xero-linux
            grub-theme-windows-11
            grub-theme-windows-10
            grub-theme-void-linux
            grub-theme-ventoy
            grub-theme-vanilla-os
            grub-theme-vaio
            grub-theme-ultramarine
            grub-theme-ubuntu-mate
            grub-theme-ubuntu
            grub-theme-toshiba
            grub-theme-thinkpad
            grub-theme-system76
            grub-theme-supermicro
            grub-theme-solus
            grub-theme-slackware
            grub-theme-samsung
            grub-theme-rocky-linux
            grub-theme-razer
            grub-theme-proxmox
            grub-theme-pop-os
            grub-theme-parabola
            grub-theme-opensuse
            grub-theme-nobara
            grub-theme-nixos
            grub-theme-mx-linux
            grub-theme-msi
            grub-theme-medion
            grub-theme-manjaro
            grub-theme-lubuntu
            grub-theme-linux-mint
            grub-theme-linux-lite
            grub-theme-lg
            grub-theme-lenovo
            grub-theme-legion
            grub-theme-kubuntu
            grub-theme-kingston
            grub-theme-kde-neon
            grub-theme-huawei
            grub-theme-hp-victus
            grub-theme-hp-omen
            grub-theme-asrock
            grub-theme-artix-linux
            grub-theme-arco-linux
            grub-theme-archcraft
            grub-theme-arch-linux
            grub-theme-apple
            grub-theme-aorus
            grub-theme-almalinux
            grub-theme-acer
            grub-theme-hp
            grub-theme-gigabyte
            grub-theme-gentoo
            grub-theme-garuda
            grub-theme-fujitsu
            grub-theme-freebsd
            grub-theme-framework
            grub-theme-fedora
            grub-theme-endeavouros
            grub-theme-elementaryos
            grub-theme-dell
            grub-theme-deepin
            grub-theme-debian
            grub-theme-chromeos
            grub-theme-centos
            grub-theme-bedrock-linux
            grub-theme-asus-tuf
            grub-theme-asus-rog
            calibre-web
            llama.cpp-cuda
            f3-qt
            hydra-launcher-bin
            got-vcs
            stoken-git            lib32-opencore-amr
            obs-vkcapture-git
            lib32-obs-vkcapture-git
            mangohud-git
            lib32-soundtouch
            radicle-cli
            radicle-cli-git
            lib32-libplacebo
            python-croniter-git
            matugen-bin
            protoc-gen-go-grpc-bin
            imhex-bin
            dwarfs-bin
            xremap-wlroots-bin
            swift-bin
            neovim-nightly-bin
            dumbpipe-bin
            bibata-cursor-theme-bin
            moonlight-qt-mainline-git
            klassy-bin
            stellarium-qt5-bin
            chrony-git
            emacs-yasnippet-git
            emacs-evil-org-git
            emacs-evil-collection-git
            xsane-git
            carla-git
            obs-shaderfilter-git
            river-git
            binwalk-git
            flightgear-appimage
            zrythm-git
            musikcube-bin
            pcsx2-latest-bin
            speedcrunch-git
            xwayland-satellite-git
            noisetorch-bin
            rkdeveloptool-git
            windowmaker-git
            gnunet-git
            xcompmgr-git
            lib32-miniupnpc
            libei-git
            kanata-bin
            qbittorrent-git
            freecad-git
            nerd-dictation-git
            monado-git
            qgis-git
            surf-git
            bigbagkbdtrixxkb-git
            khal-git
            kbdd-git
            bombadillo-git
            py-spy-bin
            ;; ginkgo-cli  ; FIXME: ginkgo not exported from (gnu packages golang-check)
            rust-git
            prjtrellis-git
            celestia-qt6-git
            vkbasalt-cli
            cmake-git
            pay-respects-bin
            go-chroma-bin
            spacefm-bin
            coccinelle-git
            wget2-git
            kirigami-addons-git
            opendoas-git
            discover-git
            xdg-desktop-portal-kde-git
            kuserfeedback-git
            xlibre-xserver-common-git
            qt5-location
            qt5-scxml
            qt5-wayland-decorations
            ledger-udev
            libxdiff
            wolfssl-all
            jdk22-openjdk
            jdk25-openjdk-wakefield
            helm-synth
            helm-synth-common
            helm-synth-lv2
            helm-synth-standalone
            helm-synth-vst
            flat-remix
            gtk4-git
            gtk4-demos-git
            gtk-update-icon-cache-git
            xwayland-satellite-nosystemd
            obfs4proxy
            dolphin-emu-nogui-git
            dolphin-emu-tool-git
            opencolorio1
            cmake3
            llvm17
            python39
            boost174
            guile2.0
            webkitgtk2
            clang15
            pavucontrol-gtk3
            qdigidoc4
            kitemmodels5
            libpng12
            kholidays5
            plasma-framework5
            epson-inkjet-printer-escpr2
            kdoctools5
            kcontacts5
            kdiagram5
            kidentitymanagement5
            kpimtextedit5
            ktextaddons5
            xdg-desktop-portal-gtk4-git
            uxn2-git
            ghc9.12-bin
            python-clickgen1
            nitrokey-app2
            zig0.11-bin
            libconfig9
            cfitsio9
            pcmanfm-gtk3
            kinit5
            lld17
            python-pyglet1
            sfml2
            python-pypdf3
            gtksourceview2
            scenefx0.4
            musescore3-git
            gstreamer0.10
            godot3-bin
            akonadi-notes5
            kontactinterface5
            libtiff5
            python-numpy1
            kcalendarcore5
            fmt9
            extremetuxracer-svn
            autoconf2.13
            python-pyqt5-sip4
            nethack4
            mysql84
            kmime5
            grantleetheme5
            akonadi-contacts5
            kdav5
            baobab-gtk3
            lfs-s3-git
            chocolate-doom-git
            ytarchive-bin
            php83
            hyprlock-git
            trenchbroom-bin
            libfive-git
            iw-git
            megaglest-git
            megaglest-data-git
            hledger-bin
            blender-git
            kanshi-git
            fcitx5-git
            curl-git
            nmap-git
            coreutils-git
            gvfs-git
            network-manager-applet-git
            prusa-slicer-git
            redshift-git
            gmsh-bin
            rawtherapee-git
            python-watchdog-git
            gtk3-git
            megatools-git
            clipmenu-git
            ripgrep-all-git
            erlfmt-git
            exult-git
            btop-git
            i2pd-git
            libffi7
            torsocks-git
            lyx-git
            renpy-git
            postgresql15
            mogan-bin
            newsraft-git
            aria2-git
            mjpg-streamer-git
            libredwg-git
            augustus-git
            julius-git
            doas
            flite1
            freedm
            llama.cpp
            radicle-node
            gnome-icon-theme-symbolic
            ibus-openbangla-git
            fcitx5-openbangla-git
            mkchromecast
            plasma6-wallpapers-blurredwallpaper
            mango-wm
            web-eid
            podman-tui-bin
            plasma-settings-mobile
            iwmenu
            bzmenu
            pwmenu
            wrkflw
            ferris-scan
            wo
            oken
            lazytail
            funzzy
            mezzotone
            ;; nrd16 compat aliases
            sabiql
            vimcord
            llvm-minimal-git
            clang-minimal-git
            clang-opencl-headers-minimal-git
            wayland-static
            libticalcs
            ;; r22-w03b compat aliases
            ffmpeg7.1
            libvpx1.10
            gcc10-libs
            boost-65-compat-libs
            lib32-lapack
            ;; nrd17 compat aliases (2026-04-06 dep-tree BLOCKED pass)
            gcc10
            gcc13-libs
            protobuf-21
            libstdc++5
            ;; queue-20260406-nrd30c compat aliases
            syncthing-appmenu
            python-sphinx_design-doc
            boost174-libs
            w3m-rkta-git
            wordnet-common
            wordnet-progs
            wordnet-dictd
            js-beautify
            looking-glass
            lib32-faudio
            archivemount-ng
            icdiff
            mono-basic
            libwrap
            id3
            gocryptfs-ui
            restic-browser-bin
            pipewire-screenaudio
            python-translate-shell
            neovim-gtk-git
            noto-fonts-sc
            noto-fonts-tc
            heif
            terminus-font-ttf
            lib32-aom
            diceware
            zig-dev-bin
            fclones-gui-bin
            rakarrack-plus
            wine-stable
            rime-pinyin-moegirl
            rich-cli
            trash
            spleen-font
            gnome-online-accounts-gtk
            yaru-gtk-theme
            yaru-icon-theme
            lrzip-next
            evil-helix-bin
            cozette-ttf
            scientifica-font
            llvm-mingw-w64-toolchain-ucrt-bin
            libudev0-shim
            xfce-theme-manager
            yambar
            ;; nrd30h upstream re-exports (items 9500-9530)
            mergerfs
            pgvector
            fheroes2
            wlrctl
            adaptivecpp
            wbg
            ungoogled-chromium
            python-diskcache
            woof-doom
            flycast
            tome4
            noisetorch
            python-matrix-nio
            modprobed-db
            ripperx
            wget2
            lib3ds
            swayfx
            ffmpeg-normalize
            python-orgparse
            libaudec
            python-mock
            tio
            obs-composite-blur
            lsp-dsp-lib
            python-whisper
            sunwait
            python-strenum
            python-pyvista
            clp
            ;; deptree-260407 compat aliases
            7zip-zstd-bin
            firefox-esr-bin
            libsodium-1.0.18
            noto-fonts-emoji-blob
            noto-fonts-lite
            otf-unifont
            libavif-noglycin
            libheif-noglycin
            libjxl-noglycin
            libjxl-noglycin-doc
            npm-corepack
            pnpm-corepack
            yarn-corepack
            bitwarden-cli-bin
            nordvpn-bin
            vvenc
            vpcs
            dynamips
            libaribcaption
            ntfsprogs-plus
            fortune-mod-off
            python-pid
            python-steamgriddb
            ttf-meslo-nerd-font-powerlevel10k
            v2ray-domain-list-custom
            reshade-shaders-git
            android-udev-git
            linux-firmware-whence-git
            cosmic-icons-git
            mips64-linux-gnu-linux-api-headers
            dotool
            ani-skip-git
            libastal-bluetooth-git
            ctags-arduino
            aribb24
            pxz
            cpp-utilities
            culmus
            font-redhat
            betterspades
            textern
            tridactyl-native-messenger-bin
            ttf-lxgw-neo-xihei
            ttf-lxgw-neo-xihei-screen
            pwmenu-bin-260407d
            bzmenu-bin-260407d
            iwmenu-bin-260407d
            ghostty-terminfo-260407d
            pigo-bin
            glab-bin-260407e
            oh-my-posh-bin
            juliaup-bin
            qbittorrent-cli-bin
            hyprls-bin
            spicetify-cli-bin
            mindustry-bin
            atlauncher-bin
            ffdec-bin
            wolfssl
            wolfssl-all
            cachyos-ananicy-rules
            neo4j-community-bin
            zl-equalizer-bin
            lidarr-bin
            suwayomi-server-bin
            ; queue-20260407-opus-p101
            cef-minimal-obs-bin
            claudia
            nrf-udev
            zfs-linux-lts
            zfs-linux-lts-headers
            tamgamp-lv2-git
            akvcam-dkms
            dxvk-nvapi-vkreflex-layer
            jddesktopentryedit
            qtspim
            lumen
            synapse-compress-state
            jdk11-temurin
            adspower-global
            papermc
            pikaur-git
            tangara-companion
            looking-glass-module-dkms
            obs-plugin-looking-glass
            colmap
            voacapl
            soulseekqt
            threema-desktop-beta
            esphome-flasher
            verylup
            grub-hook
            jmeter
            gconfmm
            gconfmm-docs
            chomikbox
            mingw-w64-zlib
            sex
            mutemplate
            idevicegui
            rebind-devices
            plainotepad
            gcencryptor
            geminicommit-bin
            arch-upgrade
            pass-otp-age
            intel-oneapi-hpckit
            softmaker-office-nx-bin
            mingw-w64-libjpeg-turbo
            mingw-w64-libpng
            mingw-w64-sdl2
            ciso
            mingw-w64-libtiff
            mingw-w64-libogg
            mingw-w64-xz
            mingw-w64-libvorbis
            mingw-w64-flac
            webstorm-eap
            webstorm-eap-jre
            mingw-w64-sdl2-ttf
            asap
            mingw-w64-libwebp
            mingw-w64-sdl2-image
            agg-2-6-git
            mingw-w64-giflib
            mingw-w64-libmodplug
            icytower
            mingw-w64-sdl2-mixer
            binutils-ia16
            gcc-ia16
            vitasdk-git
            openafs
            gnome-shell-extension-kimpanel-git
            id3ren
            snyk
            raine
            rest-server-bin
            android-armv7a-eabi-openssl
            perlnavigator
            nodejs-perl-navigator-web-server
            nodejs-perlnavigator-client
            nodejs-perlnavigator-server
            twitch
            pass-clip
            pass-qr
            gcs-bin
            grml2usb
            sbkeys
            micropolis-java
            xfce-theme-greybird-git
            vislcg3
            ntfy-alertmanager
            prometheus-podman-exporter
            ardupilot-mission-planner
            fortune-mod-xfiles
            msi-keyboard-git
            twad-git
            schemaspy
            shcopy-bin
            purple-discord-git
            slack-libpurple-git
            sshcd
            gnome-shell-extension-hibernate-status
            ion-git
            recon-ng
            gitqlient-git
            ;; recipe-resolver-260407f re-exports
            btop-theme-catppuccin
            catppuccin-konsole-theme-git
            fluent-icon-theme-git
            fluent-cursor-theme-git
            bettergruvbox-gtk-theme
            gruvbox-plus-icon-theme-git
            bibata-cursor-theme
            notwaita-cursor-theme
            plymouth-theme-ecorp-glitch
            plymouth-theme-arch-darwin
            plymouth-theme-psx
            plymouth-theme-pedro-raccoon
            plymouth-theme-arch-ascii
            plymouth-theme-monoarch-refined
            ttf-gabarito
            font-eb-garamond-gaurix
            ocr-fonts
            perl-date-simple
            morewaita-icon-theme
            sddm-silent-theme
            simplex-chat-bin
            simple2d
            distro-grub-themes-arch
            grub-theme-tela-color-1080p-git
            grub-theme-tela-color-2k-git
            grub-theme-tela-color-4k-git
            grub-theme-tela-color-ultrawide-git
            grub-theme-tela-color-ultrawide2k-git
            grub-theme-tela-white-1080p-git
            mint-l-theme
            sddm-silent-theme-git
            ebgaramond-otf
            ;; recipe-resolver-260407j re-exports
            brave-bin
            zen-browser-bin
            ventoy-bin
            vscodium-bin
            heroic-games-launcher-bin
            freetube-bin
            zotero-bin
            onlyoffice-bin
            vesktop-bin
            opencode-bin
            arduino-ide-bin
            anytype-bin
            floorp-bin
            jetbrains-toolbox
            spicetify-cli-bin
            helium-browser-bin
            koboldcpp-bin
            jitsi-meet-desktop-bin
            trezor-suite-bin
            ldtk-bin
            mullvad-browser-bin
            rustdesk-bin
            proton-pass-cli-bin
            zoom-bin
            slack-desktop-bin
            mullvad-vpn-bin
            cursor-bin
            proton-pass-bin
            betterbird-bin
            google-chrome-bin
            ;; recipe-resolver-260407k re-exports
            teams-for-linux-bin
            obsidian-bin
            1password-bin
            rambox-bin
            ferdium-bin
            insomnia-bin
            datagrip-bin
            pycharm-professional-bin
            webstorm-bin
            goland-bin
            mongodb-compass-bin
            beekeeper-studio-bin
            parsec-bin
            sunshine-bin
            protonmail-bridge-bin
            vivaldi-bin
            waterfox-bin
            youtube-music-bin
            jellyfin-media-player-bin
            drawio-desktop-bin
            figma-linux-bin
            wps-office-bin
            marktext-bin
            joplin-appimage
            simplenote-electron-bin
            signal-desktop-bin
            element-desktop-bin
            session-desktop-bin
            feishin-bin
            caprine-bin
            ;; re-integrated orphaned exports
            pipette-desktop-bin
            elyprismlauncher-bin
            lianpkg-gui-bin
            gb-studio-bin
            velo-bin
            webtunnel-client-bin
            hytale-downloader-bin
            sonarr-bin
            ffstudio-bin
            undertalemodtool-bin
            thorium-browser-avx2-bin
            tonelib-gfx-bin
            mateengine-bin
            msdf-atlas-gen
            gnuclad
            bsd-leave
            pidgin-libnotify
            binauralplayer
            python-rofi
            dotctl
            sxhkhm
            myapps
            toad-ai
            font-chocolate-classical-sans
            nordic-darker-standard-buttons-theme
            catppuccin-qt5ct
            fairy-stockfish
            shiru-lv2
            tanin
            swaycons
            sff
            streamdeck-ui
            zulucrypt
            rankmirrors
            python-vllm
            grass-desktop-node
            python-flash-attention
            tonelib-zoom-bin
            gittyup
            dropbox-cli
            ripcalc
            perl-authen-simple
            intel-media-driver-legacy-bin
            pacman-hook-list-systemd-units
            vcsi
            atproto-pds
            vmware-vmrc
            libwebcam
            v4l2ucp
            glpi-agent
            perl-xml-treepp
            bcc-tools
            python-bcc
            perl-test-compile
            perl-io-capture
            electron6-bin
            jsignpdf
            simutrans-pak192-comic
            perl-http-server-simple-authen
            mermaid-filter
            python-atlassian-api
            wiki-js
            gkrellm-gkfreq
            thunderbird-beta-bin
            replay-sorcery
            kolossus-launcher
            hunspell-hr
            nyrna-bin
            font-work-sans
            font-work-sans-variable
            sway-git-wlroots
            opennebula
            fancontrol-gui
            heaptrack
            trufflehog
            chs
            heroic-gogdl
            xmind
            profile-sync-daemon-librewolf
            code-saturne
            vertex-themes
            alacarte-xfce
            tonelib-jam-bin
            steamrun
            tunescope
            guitarix-vst
            elementary-xfce-icons
            gkleds
            gkrelltop
            gkrellm-themes
            chowbyod-bin
            patchance
            chowcentaur-bin
            nootka
            tuxedo-drivers-dkms
            macintosh-js-bin
            opera-developer
            sslyze
            trelby
            scidb
            tencent-docs-bin
            slang-verilog
            noi-desktop-bin
            jzintv
            kyocera-universal
            intiface-central
            font-sorts-mill-goudy
            go-musicfox-bin
            adminer-editor
            scream
            qt5-styleplugins
            vkd3d-proton-mingw
            pam-ssh
            lenmus
            selinux-refpolicy-arch
            vencord
            chromium-vencord
            firefox-vencord
            firefox-developer-edition-vencord
            librewolf-vencord
            font-udev-gothic
            wofi-power-menu
            slimevr-beta-bin
            terminal-rain-lightning
            syncclipboard-desktop
            wine-discord-ipc-bridge
            vpinball
            qt6-jpegxl-image-plugin
            zls-master-bin
            optimus-manager-qt
            ;; recipe-resolver-260408b re-exports
            otf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next-variable
            otf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono-variable
            blobmoji
            candy-icons-git
            sweet-folders-icons-git
            gruvbox-icon-theme-git
            breeze-hacked-cursor-theme-git
            grub-theme-tela-white-2k-git
            grub-theme-tela-white-4k-git
            grub2-theme-archxion
            grub2-theme-archlinux
            sound-theme-smooth
            gruvbox-gtk-theme-git
            xfce-theme-cobibird
            fagram-bin
            pixieditor-bin
            android-apktool-bin
            amdgpu-clocks
            python-funk
            nvimpager
            jome
            croaring
            logiops-git
            duckduckgo-chat-cli
            plymouth-theme-hexagon-alt-gruvbox
            puddletag
            ;; recipe-resolver-260408c re-exports
            palemoon-bin
            simplex-desktop-appimage
            alcom-bin
            torrra-bin
            katana-bin
            ytui-bin
            clang-format-static-bin
            easytier-bin
            reshell-bin
            quickserv-bin
            f2-bin
            nfpm-bin
            breaktimer-bin
            activitywatch-bin
            zaproxy-bin
            codename-goose-bin
            flaca-bin
            mcontrolcenter-bin
            soundy-bin
            nimo-bin
            webplotdigitizer-bin
            tunein-cli-bin
            littlenavmap-bin
            tuxedo-webfai-creator-bin
            nethermind-ethereum-bin
            emudeck-bin
            fontbase
            epochcli
            spoofdpi
            smartamp
            qtscrcpy-bin
            implay
            chiaki-ng
            fluent-reader-bin
            ;; recipe-resolver-260408d re-exports
            ttf-wps-fonts
            ttf-rounded-mplus
            behdad-fonts
            shahab-fonts
            iranian-fonts
            tanha-fonts
            ttf-signika
            ttf-merriweather-sans
            ttf-merriweather
            ttf-quintessential
            ttf-readex-pro
            maplemono-ttf-autohint
            ttf-rubik-vf
            ttf-material-icons-git
            phinger-cursors
            catppuccin-gtk-theme-git
            numix-square-icon-theme
            python-pip-search
            python-lsp-ruff
            python-chex
            python-hf-transfer
            python-pynvml
            python-ipware
            python-fugashi
            python-msoffcrypto-tool
            python-gps3
            python-manuf
            nvitop
            angrysearch
            python-vondb
            kcc
            beeref
            ;; recipe-resolver-260408e re-exports
            btrfs-list
            chkboot
            envchain
            lpac
            libeuicc
            minify
            cheat
            quickserve
            dcfldd
            i8kutils
            cmoc
            lwtools
            procmon
            snort
            crowdsec
            tetrs
            bkmr
            stor
            jellyfin-tui
            oblivion-desktop-bin
            siyuan-note-bin
            codex-bin
            gowall
            ;; 260408c-batch compat aliases
            vulkan-icd-loader-git
            bdf-unifont
            fastfetch-gif-git
            libmpv-git
            yaru-sound-theme
            yaru-gtksourceview-theme
            yaru-gnome-shell-theme
            yaru-xfwm4-theme
            yaru-unity-theme
            yaru-metacity-theme
            yaru-session
            ;; recipe-resolver-260408b re-exports
            otf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next-variable
            otf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono-variable
            blobmoji
            candy-icons-git
            sweet-folders-icons-git
            gruvbox-icon-theme-git
            breeze-hacked-cursor-theme-git
            grub-theme-tela-white-2k-git
            grub-theme-tela-white-4k-git
            grub2-theme-archxion
            grub2-theme-archlinux
            sound-theme-smooth
            gruvbox-gtk-theme-git
            xfce-theme-cobibird
            fagram-bin
            pixieditor-bin
            android-apktool-bin
            amdgpu-clocks
            python-funk
            nvimpager
            jome
            croaring
            logiops-git
            duckduckgo-chat-cli
            plymouth-theme-hexagon-alt-gruvbox
            puddletag
            ;; recipe-resolver-260408c re-exports
            palemoon-bin
            simplex-desktop-appimage
            alcom-bin
            torrra-bin
            katana-bin
            ytui-bin
            clang-format-static-bin
            easytier-bin
            reshell-bin
            quickserv-bin
            f2-bin
            nfpm-bin
            breaktimer-bin
            activitywatch-bin
            zaproxy-bin
            codename-goose-bin
            flaca-bin
            mcontrolcenter-bin
            soundy-bin
            nimo-bin
            webplotdigitizer-bin
            tunein-cli-bin
            littlenavmap-bin
            tuxedo-webfai-creator-bin
            nethermind-ethereum-bin
            emudeck-bin
            fontbase
            epochcli
            spoofdpi
            smartamp
            qtscrcpy-bin
            implay
            chiaki-ng
            fluent-reader-bin
            ;; recipe-resolver-260408d re-exports
            ttf-wps-fonts
            ttf-rounded-mplus
            behdad-fonts
            shahab-fonts
            iranian-fonts
            tanha-fonts
            ttf-signika
            ttf-merriweather-sans
            ttf-merriweather
            ttf-quintessential
            ttf-readex-pro
            maplemono-ttf-autohint
            ttf-rubik-vf
            ttf-material-icons-git
            phinger-cursors
            catppuccin-gtk-theme-git
            numix-square-icon-theme
            python-pip-search
            python-lsp-ruff
            python-chex
            python-hf-transfer
            python-pynvml
            python-ipware
            python-fugashi
            python-msoffcrypto-tool
            python-gps3
            python-manuf
            nvitop
            angrysearch
            python-vondb
            kcc
            beeref
            ;; recipe-resolver-260408e re-exports
            ;; recipe-resolver-260408f re-exports
            xlibre-input-wacom
            xlibre-video-fbdev
            ffmpeg-amd-full
            slack-desktop
            oh-my-posh
            spicetify-cli
            rustdesk
            qbittorrent-cli
            hyprls
            ffdec
            logseq-desktop-bin
            rider-bin
            xnviewmp-bin
            tutanota-desktop-bin
            shutter-encoder-bin
            freefilesync-bin
            appimagelauncher-bin
            logseq-desktop
            rider
            xnviewmp
            tutanota-desktop
            shutter-encoder
            freefilesync
            appimagelauncher
            btrfs-list
            chkboot
            envchain
            lpac
            libeuicc
            minify
            cheat
            quickserve
            dcfldd
            i8kutils
            cmoc
            lwtools
            procmon
            snort
            crowdsec
            tetrs
            bkmr
            stor
            jellyfin-tui
            oblivion-desktop-bin
            siyuan-note-bin
            codex-bin
            gowall
            ;; recipe-resolver-260408g re-exports
            android-studio-bin
            netbeans-bin
            localsend-git
            logseq-desktop-git
            xlibre-input-wacom-bin
            xlibre-video-fbdev-bin
            appimagelauncher-git
            ffmpeg-amd-full-git
            android-studio
            netbeans
            ;; 260408c-batch compat aliases
            vulkan-icd-loader-git
            bdf-unifont
            fastfetch-gif-git
            libmpv-git
            yaru-sound-theme
            yaru-gtksourceview-theme
            yaru-gnome-shell-theme
            yaru-xfwm4-theme
            yaru-unity-theme
            yaru-metacity-theme
            yaru-session
            ;; recipe-resolver-260408i compat aliases
            recaf
            pixelorama-git
            tnoodle-wca
            flclash
            openmarch
            chataigne-stable
            ;; recipe-resolver-260408j compat aliases
            wootility
            muse-sounds-manager
            java-openjdk-ea
            swiftly
            ;; recipe-resolver-260408k compat aliases
            ttf-b612
            crabdrop
            matcha-client
            github-account-switch
            xc
            ;; recipe-resolver-260408l compat aliases
            alacritty-gnome-darkmode
            ;; recipe-resolver-260408p compat aliases
            otf-geist
            ttf-geist
            ttf-geist-variable
            otf-geist-mono
            ttf-geist-mono
            ttf-geist-mono-variable
            sddm-theme-elegant-archlinux-git
            brokefetch-git
            vhd2vl-git
            sc-git
                        localsend
            juliaup
            mindustry
            lidarr
            zl-equalizer
            wallchemy
            atlauncher
            kopia
            kopia-ui
            playit
            arduino-ctags
            notesnook-bin
            jellyfin-desktop-bin
            libsmb2
            playit-agent-bin
            ;; --- recipe-resolver-260408u exports ---
            font-courier-prime
            font-comic-mono
            font-juliamono
            font-monocraft
            font-gentium-basic
            font-lxgw-fasmart-gothic
            btop-theme-catppuccin
            qogir-gtk-theme
            morewaita-icon-theme
            vimix-gtk-themes
            spicetify-themes
            pdfsam-bin
            process-compose-bin
            rp-bin
            bifrost-bin
            bitwarden-rofi
            lenovo-wwan-unlock
            zsh-you-should-use
            bash-complete-alias
            python-blockdiag
            python-nwdiag
            python-actdiag
            waybar-crypto
            lief
            mstflint
            graphite-gtk-theme-wallpaper-git
            graphite-gtk-theme-rimless-normal-git
            graphite-gtk-theme-rimless-normal-compact-git
            graphite-gtk-theme-rimless-git
            graphite-gtk-theme-rimless-compact-git
            graphite-gtk-theme-normal-git
            graphite-gtk-theme-normal-compact-git
            graphite-gtk-theme-nord-rimless-normal-git
            graphite-gtk-theme-nord-rimless-normal-compact-git
            graphite-gtk-theme-nord-rimless-git
            graphite-gtk-theme-nord-rimless-compact-git
            graphite-gtk-theme-nord-normal-git
            graphite-gtk-theme-nord-normal-compact-git
            graphite-gtk-theme-nord-git
            graphite-gtk-theme-nord-compact-git
            graphite-gtk-theme-git
            graphite-gtk-theme-compact-git
            graphite-gtk-theme-black-rimless-normal-git
            graphite-gtk-theme-black-rimless-normal-compact-git
            graphite-gtk-theme-black-rimless-git
            graphite-gtk-theme-black-rimless-compact-git
            graphite-gtk-theme-black-normal-git
            graphite-gtk-theme-black-normal-compact-git
            graphite-gtk-theme-black-git
            graphite-gtk-theme-black-compact-git
            fontpreview-git
            ;; recipe-resolver-260408y
            unciv-bin
            pseint-bin
            sparta-plugins-bin
            pdf4qt-bin
            spotube-bin
            audio-share-bin
            nekoray-bin
            tacentview-bin
            exifcleaner-bin
            sherlock-launcher-bin
            koala-clash-bin
            termframe-bin
            voxtype-bin
            odinls-bin
            raptor-cage-bin
            geteduroam-gui-bin
            dawn-writer-bin
            portablemc-bin
            cake-wallet-bin
            betterbird-es-bin
            ab-download-manager-bin
            bizhawk-bin
            bs-manager-bin

            windsurf
            offpunk-git
            brscan5
            megasync
            jdtls
            irpf2025
            woff2-material-symbols-variable
            microsoft-identity-broker
            hyprshutdown-compat
            bitwig-studio
            notion-app-electron
            nettui
            opentubex
            ani2xcursor
            crtui
            mdterm
            btdu
            openide
            tsenta-desktop
            bookokrat
            terraria-server
            intune-portal
            reiserfsprogs
            waterfox-bin-pkg
            windsurf-bin
            offpunk
            brscan5-bin
            megasync-bin
            google-cloud-cli-bq
            google-cloud-cli-gsutil
            google-cloud-cli-python3
            gke-gcloud-auth-plugin
            ironwail
            jdtls-bin
            irpf2025-bin
            xdg-su
            font-material-symbols-variable
            microsoft-identity-broker-bin
            wps-office-mui-zh-cn
            hyprshutdown
            bitwig-studio-bin
            vmware-keymaps
            reiserfsprogs-pkg
            notion-app-bin
            nettui-bin
            opentubex-bin
            ani2xcursor-bin
            crtui-bin
            mdterm-bin
            btdu-bin
            openide-bin
            tsenta-desktop-bin
            bookokrat-bin
            terraria-server-bin
            intune-portal-bin
            ;; recipe-resolver-260413b exports
            arduino-ctags
            nnn-nerd
            trayer
            potato-c
            fey
            rp-plus-plus
            croaring
            libsmb2
            jome
            qtilitools
            wasistlos
            openclaw
            netrc
            pigo
            mpris-scrobbler
            notejot
            butler
            puddletag
            tex-fmt
            bash-git-prompt
            font-atkinson-hyperlegible-next
            auto-throttle
            wingedit
            fortune-mod-futurama
            ;; recipe-resolver-260413f compat aliases
            sizeof
            nextdns
            intermodal
            ov
            torrserver
            rjq
            tmpo
            dol
            sq
            mynav
            solv
            superdb
            whosthere
            python-face_recognition_models

            ;; recipe-resolver-260413q recipes
            firefox-beta-bin
            anydesk-bin
            dxvk-bin
            mailspring-bin
            keybase-bin
            robo3t-bin
            jd-gui-bin
            microsoft-edge-dev-bin
            streamlink-twitch-gui-bin
            powershell-bin
            gotop-bin
            duplicati-canary-bin
            github-desktop-bin
            thorium-browser-bin
            ledger-live-bin
            dotnet-host-bin
            aspnet-runtime-bin
            dotnet-sdk-bin
            aspnet-targeting-pack-bin
            svp-bin
            keeweb-desktop-bin
            i2p-bin
            browsh-bin
            rocketchat-client-bin
            ocenaudio-bin
            rpcs3-bin
            dingtalk-bin
            webtorrent-desktop-bin
            an-anime-game-launcher-bin
            nuclear-player-bin
            tuxedo-control-center-bin
            multimc-bin
            pandora-launcher-bin
            feishu-bin
            electronmail-bin
            franz-bin
            pdfstudio-bin
            protonup-qt-bin
            glance-bin
            waterfox-classic-bin
            cutechess-bin
            virtualbox-bin
            firestorm-bin
            zoiper-bin
            microchip-mplabx-bin
            android-sdk
            paru
            jdk-doc
            google-chrome-dev
            nautilus-dropbox
            ttf-google-fonts-git
            sublime-text-dev
            wps-office-mime
            jdownloader2
            numix-icon-theme-git
            hplip-plugin
            numix-circle-icon-theme-git
            foxitreader
            usb-creator
            trizen
            eclipse-java-bin
            ssacli-bin
            amdfand-bin
            mihomo-bin
            snazy-bin
            codelldb-bin
            shadered-bin
            armbian-imager-bin
            docker-tui-bin
            lazyjira-bin
            mkbrr-bin
            subfinder-bin
            bambustudio-bin
            cryptomator-bin
            sidequest-bin
            iptvnator-bin
            headlamp-bin
            git-credential-manager-bin
            jamesdsp-pipewire-bin
            zen-twilight-bin
            hyprism-bin
            surge-bin
            gale-bin
            keylightd-bin
            vvv-bin
            ltex-ls-plus-bin
            pomodorolm-bin
            youtube-music-cli-bin
            ;; recipe-resolver-260413r recipes
            keychron-link-udev
            keychron-q3-max-udev
            cutieascii-bin
            energygraph
            d1x-rebirth
            mindustry-server-bin
            ;; recipe-resolver-260413v recipes
            obsidian-appimage
            electrum-ltc-appimage
            orca-slicer-unstable-bin
            vicinae-appimage-bin
            chitubox-free-bin
            tabularis-bin
            onlyoffice-bin
            02engine-bin
            kubelogin
            google-cloud-cli-gke-gcloud-auth-plugin
            netlogo
            browsh-bin
            fabric-server
            python-morfeus-ml
            python-landlock
            termux-language-server
            otpgui
            tidal-dl-ng
            usergrant
            linux-enable-ir-emitter
            beekeeper-qt
            ;; recipe-resolver-260413x recipes
            fastx-desktop-client
            tetrio-plus-bin
            libstdcplusplus5-bin
            cockpit-tools-bin
            oh-my-pi-bin
            oneclient-bin
            onscripter-yuri-bin
            opera-gx
            pencil-dev-bin
            srcom-bin
            srwm-bin
            stalker-gamma-cli-bin
            tinywiibackupmanager-bin
            wayvr-bin
            finar-bin
            rootchat-bin
            hubstaff
            irfanview
            comfyui-desktop-2-beta
            cyx
            lazyjira-git
            megit
            maniadrive
            cdebootstrap-static
            amethyst-mod-manager
            anime-games-launcher-git
            connectiq-sdk-manager
            gnome-shell-extension-all-in-one-clipboard-bin
            claude-agent-acp
            sillytavern
            specify-cli
            touchhle
            ts-query-ls
            vikunja
            railwayapp-cli
            web-eid-firefox
            web-eid-chrome
            oxicord
            dealve
            kontainer
            nettui
            terraform-ls
            bcompare
            vencord-installer
            minisforum-v3-pcie-aspm-config
            python-yappi
            python-kiutils
            vidcutter
            pvetui
            python-qh3-bin
            torbrowser-launcher-git
            pisek
            ttf-patrick-hand-full
            ttf-sipa-sarabun
            ttf-sipa-sarabun-new
            ezstream
            squeezelite
            qpxtool
            libkcapi
            ddcci-hotplugd
            blocker
            kernel-alive
            xboxdrv-blitz
            dmrgateway-git
            drawterm-9front-wl-git
            ojcsh
            oniri
            wayland-push-to-talk-fix-git
            kanzi-git
            fluidplug-git
            emacs-pgtk-igc-git
            cnijfilter2
            hobbits
            blinkenlib
            vkdevicechooser
            blas-clblast
            bareos-common
            lazylpsolverlibs-git
            klog
            gnome-menu-editor-qt
            ksteamtrayicon
            kwin-effects-better-blur-dx
            kwm
            adwaita-qt5
            adwaita-qt6
            adwaita-qt6-git
            perl-test-refcount
            ckan
            ccd-nav
            ;; recipe-resolver-260413y recipes
            materialgram-bin
            marktext-tkaixiang-bin
            anytype-alpha-bin
            sideloader-bin
            youtube-tui-full-bin
            bluebubbles-bin
            deepchat-bin
            ripes-bin
            freeshow-bin
            kanri-bin
            loopi-bin
            alt-sendme-bin
            vcard-studio-bin
            firedragon-alpha-bin
            paket-bin
            fchat-horizon-bin
            classisland-bin
            stremio-service-bin
            electron12-bin
            firestorm-bin
            microsoft-edge-dev-bin
            dbeaver-ce-jre-bin
            alchitry-labs-bin
            anycubicslicernext-bin
            local-by-flywheel-bin
            ;; recipe-resolver-260413ab
            bareos-contrib-director-python-plugins
            bareos-contrib-filedaemon-python-plugins
            bareos-contrib-tools
            bareos-database-common
            bareos-database-postgresql
            bareos-database-tools
            bareos-devel
            bareos-director
            bareos-director-python-plugins-common
            bareos-director-python3-plugin
            bareos-filedaemon
            bareos-filedaemon-glusterfs-plugin
            bareos-filedaemon-ldap-python-plugin
            bareos-filedaemon-libcloud-python-plugin
            bareos-filedaemon-mariabackup-python-plugin
            bareos-filedaemon-percona-xtrabackup-python-plugin
            bareos-filedaemon-postgresql-python-plugin
            bareos-filedaemon-python-plugins-common
            bareos-filedaemon-python3-plugin
            bareos-storage
            bareos-storage-droplet
            bareos-storage-fifo
            bareos-storage-glusterfs
            bareos-storage-python-plugins-common
            bareos-storage-python3-plugin
            bareos-storage-tape
            bareos-tools
            bareos-traymonitor
            bareos-vmware-plugin
            bareos-webui
            bareos-webui-apache
            bareos-webui-nginx
            python-bareos
            oh-my-pi-git
            piperig-bin
            python-fastfeedparser-git
            vite-plus-bin
            vkbasalt-redemp-git
            volt-desktop
            voxtype-cuda
            wifi-audio-streaming
            windsurf-next-marketplace
            ymir-emu-git
            xboxdrv-git
            wallpaper-engine-kde-plugin-git
            ut2004-data-archiveorg
            fw16-kbd-uleds-git
            cryptopro-csp-k1
            bcompare-kde6
            bcompare-kde5
            bcompare-kde4
            bcompare-nautilus
            bcompare-thunar
            bcompare-cinnamon
            bcompare-mate
            alma-desktop-bin
            kvantum-theme-catppuccin-git
            airwindows-consolidated-bin
            yabsnap
            mozc
            lft
            pkglog-elixir-bin
            ratarmount
            prismlauncher-git
            vrrtest-git
            arduino-avr-core
            kora-icon-theme
            cemu
            amneziawg-tools
            valent-git
            xdgctl
            vicinae-bin
            meshtastic-python
            limine-snapper-sync
            usbtop
            prek-bin
            yp-tools
            opentrack
            aacs-keydb-daily
            libunity
            plasma6-runners-jetbrains-runner-git
            zsh-fast-syntax-highlighting
            pdf4qt
            rpmlint
            next-music
            ;; recipe-resolver-260414b recipes
            mpc-qt
            trickle
            reframe
            slowrx
            yarr-bin
            ab-download-manager-bin
            retroforth
            jbofihe
            neovide-bin
            abuse
            nmgui
            ;; recipe-resolver-260414e recipes
            uemacs
            vvdec
            opencollada
            spacecadetpinball
            intel-ipsec-mb
            ebsl
            finalmouse-cli
            headsetstatus
            qt-heif-image-plugin
            kplotting5
            fortty
            calf-no-gui
            kpeoplevcard
            hyprsysteminfo
            wl-shimeji
            libretro-handy
            scangearmp2-sane
            tomoyo-tools
            python-pyrogram
            qcomix
            gearlever
            icon-lang
            java21-openjfx-bin
            polymc-qt5-bin
            runelite-bin
            hmcl-bin
            emacs-slime-git
            minisystool
            gcdemu
            openal-hrtf
            ;; recipe-resolver-260414e compat aliases
            uemacs-git
            spacecadetpinball-git
            wl_shimeji-git
            libretro-handy-git
            scangearmp2-sane-git
            icon-git
            runelite
            hmcl
            slime-git
            polymc-qt5
            ;; recipe-resolver-260414i
            jump-bin
            orla-bin
            feluda-bin
            wasmrun-bin
            seqtui-bin
            clipvault-bin
            lact-headless-bin
            teleport-client-bin
            jiq-ai-bin
            checkstyle-bin
            vitals
            ect
            rtrlib
            quakewatch
            mousetrap
            font-annotation-mono
            python-pympress
            gonic-bin
            skyterm-bin
            rtimelog-bin
            rtimelogger-bin
            needle-cli-bin
            ;; recipe-resolver-260414i compat aliases
            jump
            orla
            feluda
            wasmrun
            seqtui
            clipvault
            lact-headless
            teleport-client
            jiq-ai
            checkstyle
            gonic
            skyterm
            rtimelog
            rtimelogger
            needle-cli
            otf-annotation-mono
            ttf-annotation-mono
            ttf-annotation-mono-variable
            ;; --- deptree-resolver-260414j recipes ---
            arch-os-manager
            brother-dcpt535dw
            brother-hl-1110
            cherry-studio-electron-bin
            circuit-macros
            cisco-secure-client
            dcli-arch-git
            docker-model-plugin
            dolibarr
            dracut-ukify
            fcitx5-hazkey-bin
            find-the-command
            gitextensions
            hpuld
            kando-bin
            lib32-opencl-nvidia-vulkan
            matlab
            mommy-git
            ollama-cuda12-bin
            ollama-cuda13-bin
            opencl-vanity-gpg
            oxmgr-bin
            pdf-over
            pkgstate-bin
            quickshell-overview-git
            qwen-code-bin
            reef-tools
            rvgl-io-loadlevel
            rvgl-io-music
            rvgl-io-skins-bonus
            rvgl-io-tracks
            sac-gui
            sheet-git
            tiddlydesktop
            tparted-bin
            ttf-nonicons-bin-git
            vscodium-bin-marketplace
            vscodium-translucent-marketplace
            vtsls
            wechat
            whyis-git
            wine-installer
            wireplumber-openrc
            woff-nonicons-bin-git
            wormhole-rs-bin
            wpa-actiond
            wscat
            xd-torrent
            xdg-ninja-git
            xdg-unused-data-git
            xdman-beta-bin
            xpad-noone-git
            ;; deptree-resolver-260414k recipes
            adwaita-dark-darose
            agisoft-metashape
            airwindows-lv2
            alacritty-use-theme-with-redshift-git
            alarm-notify
            algodoo-wine
            altair-ai-studio
            anythingllm-desktop-bin
            apachedirectorystudio
            archie
            aseprite-bin
            asf-ui-git
            avalonia86
            avda-bin
            bin-cpuflags-x86
            bitwig-studio-earlyaccess
            bluevein
            brother-dcpt720dw
            brother-mfc-l3750cdw
            brother-mfc-l8690cdw
            btrfs-desktop-notification
            burpsuite-pro
            caddy-custom
            casa6-bin
            cfspeedtest
            chayang
            chibi-cli-git
            clash-nyanpasu-nightly-bin
            clonehero-ptb
            code-features
            cuda-12-9
            curd
            customizepkg-git
            dbeaver-jvm-hook
            ddrescueview
            deadbeef-plugin-discord-git
            dingusppc-git
            dmarc-cat
            dolphin-anty-bin
            doomrunner
            dput-ng
            xytz-bin
            yabridge-tui
            yubico-authenticator-bin
            zish
            zzz
            ;; recipe-resolver-260414n recipes
            blockbench-bin
            djv
            green-tunnel-bin
            pokeget-bin
            prospect-mail-bin
            xdelta3-cross-gui-bin
            ;; deptree-resolver-260414l recipes
            ds360go-git
            duo-desktop
            eac3to
            eclipse-dsl-bin
            elephant-bookmarks
            elephant-clipboard
            epson-inkjet-printer-201207w
            fbpdf-git
            feishin
            file-clipper
            firefly-iii
            flightgear-data
            fsel
            ftb-app-bin
            gem2arch
            gemini-cli-git
            ginkgocadx-bin
            gitignore-downloader
            gitversion-bin
            gnatdoc
            go-grip
            go-grip-git
            gopac-git
            graphite-cli
            hibiscus
            whisper-cpp-model-large-v3-turbo
            ;; deptree-resolver-260414m recipes
            html2ps
            hyprlight
            ibus-avro-git
            icann-rdap
            intellij-idea-ultimate-edition
            invoiceninja
            ipfs-desktop
            jdk8-graalvm-ee-bin
            jdupes
            jdwp-mcp-git
            joycon-git
            kazumi-bin
            kiro-cli
            kluctl
            koboldcpp-cuda
            kopa
            kwin-scripts-krohnkite-git
            lanxchange
            lattice-diamond
            lazynmap
            lcarsde-application-starter
            lesstif
            lib32-faac
            lib32-gsm
            lib32-lame
            lib32-libnuma
            lib32-libomxil-bellagio
            libdeep-filter-ladspa-git
            libdf-git
            libilbm-git
            libretro-swanstation-git
            llama-cpp-sycl-f16-git
            logiops-rs
            logisim-evolution
            logseq-desktop-electron-bin
            lolia-cli
            lsu-git
            lvsk-calendar
            magicpodscore-git
            mal
            mendeley-reference-manager
            meteobar
            mingw-w64-crt-msvcrt
            mingw-w64-json-glib
            misuzu-music-bin
            motoc-git
            neo-matrix
            neothesia
            nikode-bin
            niri-sidebar-git
            nirinit-git
            nodejs-ramadan-cli
            nordvpn-gui-bin
            objdiff
            ;; deptree-resolver-260414n recipes
            obos-genissue-git
            obs-scrab
            ocaml-camlzip
            omniget-bin
            omnom-git
            openchamber
            opencode-claude-auth
            openmw-tes3mp
            openrefine
            openscq30-cli-bin
            openutau
            opera-proxy-git
            packwiz-git
            pacmods
            paczf-yay
            partclone-git
            pgdr
            pokemmo
            prex
            printnotes-git
            promptfoo
            punt
            purple-gowhatsapp
            pydio
            python-fleep-git
            python-pyqt5-chart
            python-zoekt-py-git
            python2-jpype1
            qt5-purchasing
            qt6gtk2
            r2modman-appimage
            radii5-bin
            raindrop
            redu
            rename-pl
            rexit-git
            riftbar-bin
            rimsort-git
            rivetui
            ruffle-nightly-bin
            run0-sudo-shim-git
            sacad
            selectdefaultapplication-git
            setrixtui
            shellman-bin
            shiru-git
            shopify-cli
            shpool
            sickchill-git
            sip4
            ;; recipe-resolver-260414r
            magika-bin
            sddm-eucalyptus-drop
            gamepadla-polling
            rivetui-bin
            ins-bin
            git-wizard
            ytconverter
            cai
            ;; recipe-resolver-260414u
            hopm
            bluray-info
            python-pycxx
            python-ratarmount
            yazi-bin
            openlinkhub-bin
            biscuit-lang-bin
            qownnotes-bin
            waybar-minimal-nosystemd-git
            fprintd-clients-git

            ;; recipe-resolver-260414y
            kdiff3
            xdg-desktop-portal-minimal-git
            swaystatus-git
            ;; patchy already exported from deptree-resolver-260413d

            ;; recipe-resolver-260414z
            ww-manager
            tg-config
            neovim-qt
            neovim-qt-git
            cvs-feature-bin
            psdoom-ng
            cvs-feature
            ;; recipe-resolver-260414ab recipes
            openobex
            obexftp
            spooles
            calculix-ccx
            qbittorrent-enhanced-ua-nox
            qbittorrent-enhanced-ua
            tailscale-bin
            mdcat-bin
            fooyin-git
            ;; recipe-resolver-260415d recipes
            libtrash
            scolorpicker-legacy
            srtodo-git
            gpgfrontend
            linux-enable-ir-emitter
            ntfsprogs-plus-git
            python-aioice
            fonts-meta-base
            btrfs-desktop-notification-git
            smpeg0
            plymouth-theme-mikuboot-git
            python-zxing-cpp
            go-prism
            hypruler
            ;; recipe-resolver-260415d compat aliases
            scolorpicker
            srtodo
            ntfsprogs-plus
            btrfs-desktop-notification
            plymouth-theme-mikuboot
            ;; recipe-resolver-260415e recipes
            hardinfo2
            ssh-studio
            hyprqt6engine
            haskell-unix-compat
            crengine-ng
            crqt-ng
            git-series
            wlr-which-key-bin
            manaverse-sdl2
            karp
            ;; deptree-resolver-260415f recipes
            gnu-apl
            opentyrian
            releng-tool
            luaunbound
            lxappearance-obconf-gtk3
            pass-audit
            python-requirements-language-server
            ajantv2-tools
            pins
            onset
            oniri
            proxybridge
            onthespot-bin
            libreoffice-extension-writingtool-bin
            linux-firmware-bnx2x
            linux-firmware-marvell
            linux-firmware-mellanox
            linux-firmware-nfp
            linux-firmware-qcom
            ;; recipe-resolver-260415i compat aliases
            grayjay-bin
            webkit2gtk
            webkit2gtk-docs
            qt5-sensors
            ;; recipe-resolver-260415l recipes
            python-pkb-client
            certbot-dns-porkbun
            protonplus
            osdlyrics
            aaaaxy-bin
            linnote
            ;; deptree-resolver-260416b packages
            expressvpn-gui-nhk
            pacman-static
            pamac-classic-fixed
            lib32-vkbasalt-redemp-git
            lib32-xrizer-git
            penpot-frontend
            snowflake-connector-python
            soh-otr-exporter
            solar2d-git
            stickerpicker-git
            switchboard-plug-desktop-git
            throne
            turtle
            tuwunel-git
            vesc-tool
            vita3k-git
            vrcx
            wiiudownloader
            xrizer-multilib-git
            2s2h-otr-exporter
            breezy-desktop-gnome-git
            czkawka-git
            eddie-ui
            faugus-launcher-git
            flix-cli
            gpu-viewer
            grub-improved-luks2-git
            kate-discord-rpc-git
            libfprint-goodixtls-55x4
            libgda-firebird
            libgda-mysql
            libgda-postgres
            linux-g14-headers
            llvm17-libs
            lsfg-vk-git
            maint
            ollama-docs-git
            onvif-gui
            opencloud-desktop
            openhv
            osrm-backend
            pacpush
            path-of-building-community-git
            penpot-mcp
            perl-perl-languageserver
            pix
            plasma-gamemode-git
            python-withoutbg
            python313-freethreaded
            remarshal
            riseup-vpn
            safe-discover
            simgear
            songrec-git
            spaghettikart
            tartube
            trae-cn-desktop-bin
            uzdoom
            vbam-sdl
            visual-studio-code-live-bin
            wayfire-plugins-extra
            winboat-electron
            yacreader-poppler
            ytm-player-git
            albert-git
            arch-wiki-search
            banjorecomp
            bilibili
            chrome-remote-desktop
            clang-libs-minimal-git
            code-translucent
            discover-overlay-git
            emacs-mozc-with-jp-dict
            fluffychat
            git-wd40
            guiman
            libgda-jdbc
            linux-cachyos-lts-headers
            lution
            normcap
            ollama-cuda-git
            ollama-rocm-git
            pamac-aur-git
            pantheon-session-git
            parallels-client
            plasma6-applets-eventcalendar
            processing
            pulsemeeter-git
            python-llama-cpp-vulkan
            python-quimb
            qrookie-vrp
            reform-tools
            vkdoom-git
            xlibre-video-intel-bin
            xoreos
            zephyr-sdk
            caffeine-ng-git
            conquest-git
            deepin-wine10-stable
            expressvpn-gui-nhk/compat
            pacman-static/compat
            pamac-classic-fixed/compat
            lib32-vkbasalt-redemp-git/compat
            lib32-xrizer-git/compat
            penpot-frontend/compat
            snowflake-connector-python/compat
            soh-otr-exporter/compat
            solar2d-git/compat
            stickerpicker-git/compat
            switchboard-plug-desktop-git/compat
            throne/compat
            turtle/compat
            tuwunel-git/compat
            vesc-tool/compat
            vita3k-git/compat
            vrcx/compat
            wiiudownloader/compat
            xrizer-multilib-git/compat
            2s2h-otr-exporter/compat
            breezy-desktop-gnome-git/compat
            czkawka-git/compat
            eddie-ui/compat
            faugus-launcher-git/compat
            flix-cli/compat
            gpu-viewer/compat
            grub-improved-luks2-git/compat
            kate-discord-rpc-git/compat
            libfprint-goodixtls-55x4/compat
            libgda-firebird/compat
            libgda-mysql/compat
            libgda-postgres/compat
            linux-g14-headers/compat
            llvm17-libs/compat
            lsfg-vk-git/compat
            maint/compat
            ollama-docs-git/compat
            onvif-gui/compat
            opencloud-desktop/compat
            openhv/compat
            osrm-backend/compat
            pacpush/compat
            path-of-building-community-git/compat
            penpot-mcp/compat
            perl-perl-languageserver/compat
            pix/compat
            plasma-gamemode-git/compat
            python-withoutbg/compat
            python313-freethreaded/compat
            remarshal/compat
            riseup-vpn/compat
            safe-discover/compat
            simgear/compat
            songrec-git/compat
            spaghettikart/compat
            tartube/compat
            trae-cn-desktop-bin/compat
            uzdoom/compat
            vbam-sdl/compat
            visual-studio-code-live-bin/compat
            wayfire-plugins-extra/compat
            winboat-electron/compat
            yacreader-poppler/compat
            ytm-player-git/compat
            albert-git/compat
            arch-wiki-search/compat
            banjorecomp/compat
            bilibili/compat
            chrome-remote-desktop/compat
            clang-libs-minimal-git/compat
            code-translucent/compat
            discover-overlay-git/compat
            emacs-mozc-with-jp-dict/compat
            fluffychat/compat
            git-wd40/compat
            guiman/compat
            libgda-jdbc/compat
            linux-cachyos-lts-headers/compat
            lution/compat
            normcap/compat
            ollama-cuda-git/compat
            ollama-rocm-git/compat
            pamac-aur-git/compat
            pantheon-session-git/compat
            parallels-client/compat
            plasma6-applets-eventcalendar/compat
            processing/compat
            pulsemeeter-git/compat
            python-llama-cpp-vulkan/compat
            python-quimb/compat
            qrookie-vrp/compat
            reform-tools/compat
            vkdoom-git/compat
            xlibre-video-intel-bin/compat
            xoreos/compat
            zephyr-sdk/compat
            caffeine-ng-git/compat
            conquest-git/compat
            deepin-wine10-stable/compat
            hush-bin
            k3s-bin
            localstack-cli-bin
            vector-bin
            leaf-bin
            rdrop-bin
            random-rs-bin
            mediaharbor-bin
            youtube-music-for-desktop-bin
            devtoys-bin
            python-quantities
            python-keyboard
            python-readchar
            python-smart-open
            python-duet
            python-nanoid
            python-untokenize
            python-bsdiff4
            python-proto-plus
            python-huey
            python-uritools
            python-neo4j
            python-pae
            python-opr
            python-memor
            xapp-symbolic-icons
            ansiweather
            libayatana-appindicator-glib
            python-chromaterm
            python-qbittorrent-api

            ;; recipe-resolver-260417ai recipes
            apg
            redsocks
            digitemp
            oqsprovider
            dinit
            tpm2-totp
            iwqt
            rokuecp
            mameuix
            kleiner-brauhelfer
            python-cheap-repr
            python-pz
            ssort
            patator
            photocollage
            perl-net-amazon-signature-v4
            ruby-hiera-eyaml
            grub-btrfs
            simple-stateful-firewall
            twuewand
            pandoc-eisvogel-template
            waytune
            kworkflow
            libfprint-vfs009x
            box
            howl
            terminal-tetris
            browsr
            mfgtools

;;; deptree-resolver-260424c
            intermodal-bin
            invoice-bin
            jotit-bin
            jsongrep-bin
            k0sctl-bin
            kalker-bin
            kv-bin
            ladybug-bin
            languagetool-ngrams-es
            lattice-bin
            lazydocker-ng-bin
            lazyjira-bin
            lazysql-bin
            lbforth
            librespeed-cli-bin
            lnko-bin
            lzbench-bin
            makeenv
            mchose-a7-v2-pro-udev
            mchose-ace68-udev
            megit
            mongotimer
            moor-bin
            nautilus-megasync
            nextdns-bin
            ninvaders
            nitro-bin
            nvidia-prime-rtd3pm
            ocr-fonts
            openrgb-udev-rules
            otf-kopub
            otf-myna
            parm-bin
            pocket-id-bin
            posy-improved-cursors
            protonup-rs-bin
            reddix-bin
            regina-rexx-doc
            rime-wanxiang-gram-zh-hans
            rtimelog
            rtimelogger
            rust-docs
            rust-motd-bin
            rusticon-bin
            sequin-bin
            setpgrp
            shiru
            simple-http-server-bin
            smap-bin
            smb1r-bin
            ;; recipe-resolver-260424g recipes
            wealthfolio-bin
            jhentai-bin
            tinygo-bin
            seekr-bin
            fladder-bin
            nanokvm-usb-bin
            openterfaceqt-bin
            tonkeeper-wallet-bin
            netwatch-tui
            iris-bin
            presto-bin
            leap-bin
            ffhuman-bin
            whis-bin
            yoyo-evolve-bin
            go-mitmproxy-bin
            kotlin-language-server-bin
            ktfmt-bin
            lettuceai-bin
            anythingllm-bin
            hyprshell-bin
            c-lolcat
            python-luhncheck
            linux-router
            pass-ln
            reboot-to-windows
            dosh-docker-shell
            domake
            sedutil
            funchook
))
            mingw-w64-readline
            mingw-w64-gettext
            ktexteditor-git
            perl-config-ini
            lib32-glib
            libconcord
            libgnunetchat-git
            mingw-w64-blas
            mingw-w64-libidn2
            mingw-w64-pixman
            papi
            pure-xml
            python-iniparse
            python-msrest
            python-pyjacklib
            python-pynzb
            python2-fuse
            qt5-accountsservice-git
            r-clipr
            ruby-dotenv
            sencha-cmd-6
            tclx
            th06-demo-data
            ultraleap-hand-tracking-service
            vapoursynth-plugin-awarpsharp2-git
            vapoursynth-plugin-eedi2-git
            vapoursynth-plugin-misc-git
            vapoursynth-plugin-znedi3-git
            xrectsel
            coin-or-coinmumps
            daggerfall
            devilutionx-graphics-tools-git
            downloader-cli
            gdk-pixbuf
            giflib4
            globalplatform
            gnocl
            kahip
            lib32-ncurses5-compat-libs
            libdecsync
            libshout-idjc
            nvidia-utils-tesla
            nyan-lang
            opencryptoki
            perl-math-geometry-voronoi
            perl-moosex-methodattributes
            python-cymruwhois
            python-dict2xml
            python-extra-platforms
            python-image
            python-netdisco
            python-pytubefix
            python-sdnotify
            python-typed-argument-parser
            quantlib
            rlottie
            sawfish
            scraw
            timblserver
            ucommon
            vapoursynth-plugin-bm3d-git
            vapoursynth-plugin-dfttest-git
            wraith-master-common
            youtube-search-python
            zfs-utils-git
            zopflipng-parallel
            bertini-common
            c++utilities-git
            fbx-sdk
            flashplugin
            gcc11-libs
            glade-perl
            lib32-pangox-compat
            libgroove
            libirecovery
            libkexiv2-git
            linux-firmware-atheros-uncompressed
            lsi-msm-libs
            lxqt-globalkeys-git
            ocaml-batteries
            ocaml-xmlm
            perl-class-c3-componentised
            pure-audio
            python-affine
            python-dephell-specifier
            python-rosdistro
            python-setuptools-git-ls-files
            python-suntime
            python-tatsu-lts
            python-tinydb
            python-wasabi
            r-progress
            ruby-sexp-processor
            streamripper
            t4kcommon
            vapoursynth-plugin-eedi3m-git
            waifu2x-converter-cpp
            angie
            lib32-mesa-git
            deepin-wine-quarkclouddrive
            framework-system-git
            canon-tr8600-series
            alpm-octopi-utils-git
            bricklink-studio
            ttf-materialicons-regular-for-inline
            dectalk-git
            linuxthemestore-git
            mattermost-plugin-jitsi
            nvidia-510xx-dkms
            opencl-510xx-nvidia
            liri-git-meta
            bbg-git
            easyeda-pro-electron
            hid-ite8291r3-dkms-git
            hp-prime-virtual-calculator-bin
            nodejs-appium-chromium-driver
            nodejs-appium-espresso-driver
            nodejs-appium-execute-driver-plugin
            nodejs-appium-geckodriver
            nodejs-appium-images-plugin
            nodejs-appium-mac2-driver
            nodejs-appium-relaxed-caps-plugin
            nodejs-appium-safari-driver
            nodejs-appium-storage-plugin
            nodejs-appium-uiautomator2-driver
            nodejs-appium-universal-xml-plugin
            nodejs-appium-windows-driver
            nodejs-appium-xcuitest-driver
            ocd-git
            python-appium-python-client
            python-ite8291r3-ctl-git
            python-vllm-cuda
            kattis-problemtools-git
            nvim-treesitter-parsers-git
            embedded-studio
            gnome-screensaver-no-watchdog
            mkinitcpio-sd-zfs-poscat
            otf-piazzolla
            ttf-piazzolla-variable
            otf-unscii-16-full
            linux-firmware-hauppauge
            otf-unscii-8
            nodejs-postcss-cli
            hyprland-welcome-git
            corefreq-client-git
            corefreq-dkms-git
            corefreq-server-git
            whisper-cpp-openvino
            nodejs-flood
            nil-git
            mybatop
            scangearmp2
            dipc
            gdbuspp
            par2cmdline-turbo
            fcitx5-pinyin-moegirl
            wl-screenrec-git
            libadwaita-without-adwaita-git
            gotenberg
            nginx-mainline-mod-lua
            hopp-cli-bin
            reclog
            swayfx-i3-style-fullscreen-git
            clockify-desktop
            mcaselector
            surfer-waveform-git
            qdep
            codechecker
            idris2-pack-git
            reth-git
            clockify-cli
            fish-nvm
            hp-omen-wmi-dkms
            libreport
            bbppairings
            dbt-core
            dbt-fusion-bin
            electrum-abc-bin
            supportboi
            kpscript
            nscde
            teamspeak3-pluginsdk
            git-fame
            teamspeak3-addon-installer
            browserselector
            ttf-sarasa-ui-all
            ttf-sarasa-ui-cl
            ttf-sarasa-ui-hc
            ttf-sarasa-ui-jp
            ttf-sarasa-ui-kr
            ttf-sarasa-ui-sc
            ttf-sarasa-ui-tc
            lite
            applesmc-next-dkms
            pynotify-bin
            chapel

;;; --- recipe-resolver-260413f compat aliases ---

(define-public sizeof
  (package
    (inherit sizeof-tool)
    (name "sizeof")))

(define-public nextdns
  (package
    (inherit nextdns-bin)
    (name "nextdns")))

(define-public intermodal
  (package
    (inherit intermodal-bin)
    (name "intermodal")))

(define-public ov
  (package
    (inherit ov-bin)
    (name "ov")))

(define-public torrserver
  (package
    (inherit torrserver-bin)
    (name "torrserver")))

(define-public rjq
  (package
    (inherit rjq-bin)
    (name "rjq")))

(define-public tmpo
  (package
    (inherit tmpo-bin)
    (name "tmpo")))

(define-public dol
  (package
    (inherit dol-bin)
    (name "dol")))

(define-public sq
  (package
    (inherit sq-bin)
    (name "sq")))

(define-public mynav
  (package
    (inherit mynav-bin)
    (name "mynav")))

(define-public solv
  (package
    (inherit solv-bin)
    (name "solv")))

(define-public superdb
  (package
    (inherit superdb-bin)
    (name "superdb")))

(define-public whosthere
  (package
    (inherit whosthere-bin)
    (name "whosthere")))

(define-public python-face_recognition_models
  (package
    (inherit python-face-recognition-models)
    (name "python-face_recognition_models")))


(define-public gtk2
  (package
    (inherit gtk+-2)
    (name "gtk2")))

(define-public gnu-netcat
  (package
    (inherit netcat)
    (name "gnu-netcat")))

(define-public qt5-webengine
  (package
    (inherit qtwebengine-5)
    (name "qt5-webengine")))

(define-public python312
  (package
    (inherit python-3.12)
    (name "python312")))

(define-public openssl-1.1
  (package
    (inherit gnu:openssl-1.1)
    (name "openssl-1.1")
    (arguments
     (substitute-keyword-arguments (package-arguments gnu:openssl-1.1)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-before 'configure 'ensure-config-executable
              (lambda _
                (when (file-exists? "./config")
                  (chmod "./config" #o755))))
            (replace 'configure
              (lambda* (#:key configure-flags #:allow-other-keys)
                (apply invoke "sh" "./config" configure-flags)))))))))

(define-public yt-dlp-git
  (package
    (inherit yt-dlp)
    (name "yt-dlp-git")))

(define-public ripgrep-git
  (package
    (inherit ripgrep)
    (name "ripgrep-git")))

(define-public fd-git
  (package
    (inherit fd)
    (name "fd-git")))

(define-public eza-git
  (package
    (inherit eza)
    (name "eza-git")))

(define-public zoxide-git
  (package
    (inherit zoxide)
    (name "zoxide-git")))


(define-public shellcheck-bin
  (package
    (inherit shellcheck)
    (name "shellcheck-bin")))


(define-public xlibre-xserver
  (package
    (inherit xorg-server)
    (name "xlibre-xserver")))

(define-public xlibre-xserver-bootstrap
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-bootstrap")))

(define-public xlibre-xserver-common
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-common")))

(define-public xlibre-xserver-devel
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-devel")))

(define-public xlibre-xserver-xephyr
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xephyr")))

(define-public xlibre-xserver-xnest
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xnest")))

(define-public xlibre-xserver-xvfb
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xvfb")))

(define-public qt5-remoteobjects
  (package
    (inherit qtremoteobjects)
    (name "qt5-remoteobjects")))

(define-public qt5-webchannel
  (package
    (inherit qtwebchannel)
    (name "qt5-webchannel")))

(define-public qt5-websockets
  (package
    (inherit qtwebsockets)
    (name "qt5-websockets")))

(define-public dashbinsh
  (package
    (inherit dash)
    (name "dashbinsh")))

(define-public libidn11
  (package
    (inherit libidn)
    (name "libidn11")))

(define-public ncurses5-compat-libs
  (package
    (inherit ncurses)
    (name "ncurses5-compat-libs")
    (arguments
     (substitute-keyword-arguments (package-arguments ncurses)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-before 'configure 'ensure-configure-executable
              (lambda _
                (when (file-exists? "./configure")
                  (chmod "./configure" #o755))))
            (replace 'configure
              (lambda* (#:key configure-flags #:allow-other-keys)
                (apply invoke "sh" "./configure" configure-flags)))))))))

;;; Blocked dependency-tree queue aliases (2026-04-01 pass)

(define-public qt5-location
  (package
    (inherit qtlocation-5)
    (name "qt5-location")))

(define-public qt5-scxml
  (package
    (inherit qtscxml-5)
    (name "qt5-scxml")))

(define-public qt5-wayland-decorations
  (package
    (inherit qtwayland-5)
    (name "qt5-wayland-decorations")))

(define-public ledger-udev
  (package
    (inherit ledger)
    (name "ledger-udev")))

(define-public libxdiff
  (package
    (inherit xdiff)
    (name "libxdiff")))

(define-public wolfssl-all
  (package
    (inherit gnu:wolfssl)
    (name "wolfssl-all")))

(define-public jdk22-openjdk
  (package
    (inherit openjdk22)
    (name "jdk22-openjdk")))

(define-public jdk25-openjdk-wakefield
  (package
    (inherit openjdk25)
    (name "jdk25-openjdk-wakefield")))


(define-public neovim-symlinks
  (package
    (inherit neovim)
    (name "neovim-symlinks")))

(define-public neovim-git
  (package
    (inherit neovim)
    (name "neovim-git")))

(define-public lib32-libidn11
  (package
    (inherit libidn11)
    (name "lib32-libidn11")))

(define-public gtk-engine-murrine
  (package
    (inherit murrine)
    (name "gtk-engine-murrine")))

(define-public gtkspell
  (package
    (inherit gtkspell3)
    (name "gtkspell")))

(define-public botan2
  (package
    (inherit botan)
    (name "botan2")))

(define-public piper-tts
  (package
    (inherit piper)
    (name "piper-tts")))

(define-public libjpeg6-turbo
  (package
    (inherit libjpeg-turbo)
    (name "libjpeg6-turbo")))

(define-public python313
  (package
    (inherit python-next)
    (name "python313")))



(define-public lib32-gtk2
  (package
    (inherit gtk2)
    (name "lib32-gtk2")))


  (package
    (inherit openssl-1.1)
    (name "openssl-1.0")))

(define-public quickshell-git
  (package
    (inherit quickshell)
    (name "quickshell-git")))


(define-public openscad-git
  (package
    (inherit openscad)
    (name "openscad-git")))


(define-public mesa-git
  (package
    (inherit mesa)
    (name "mesa-git")))


(define-public openrgb-git
  (package
    (inherit openrgb)
    (name "openrgb-git")))


(define-public hashcat-git
  (package
    (inherit hashcat)
    (name "hashcat-git")))


(define-public mold-git
  (package
    (inherit mold)
    (name "mold-git")))


(define-public picom-git
  (package
    (inherit picom)
    (name "picom-git")))


(define-public papirus-icon-theme-git
  (package
    (inherit papirus-icon-theme)
    (name "papirus-icon-theme-git")))


(define-public libplasma-git
  (package
    (inherit libplasma)
    (name "libplasma-git")))


(define-public qutebrowser-git
  (package
    (inherit qutebrowser)
    (name "qutebrowser-git")))


(define-public cataclysm-dda-git
  (package
    (inherit cataclysm-dda)
    (name "cataclysm-dda-git")))


(define-public mecab-git
  (package
    (inherit mecab)
    (name "mecab-git")))


(define-public openttd-jgrpp-git
  (package
    (inherit openttd-jgrpp)
    (name "openttd-jgrpp-git")))


(define-public dragon-drop-git
  (package
    (inherit dragon-drop)
    (name "dragon-drop-git")))


(define-public wireguard-module-git
  (package
    (inherit wireguard-linux-compat)
    (name "wireguard-module-git")))


(define-public python-protobuf-git
  (package
    (inherit python-protobuf)
    (name "python-protobuf-git")))


(define-public protobuf-git
  (package
    (inherit protobuf)
    (name "protobuf-git")))


(define-public libarchive-git
  (package
    (inherit libarchive)
    (name "libarchive-git")))


(define-public dstask-git
  (package
    (inherit dstask)
    (name "dstask-git")))


(define-public fsearch-git
  (package
    (inherit fsearch)
    (name "fsearch-git")))


(define-public procs-git
  (package
    (inherit procs)
    (name "procs-git")))



(define-public zfs-dkms
  (package
    (inherit zfs)
    (name "zfs-dkms")))

(define-public lib32-openssl-1.0
  (package
    (inherit openssl-1.0)
    (name "lib32-openssl-1.0")))

(define-public llama.cpp-vulkan
  (package
    (inherit llama-cpp-cuda)
    (name "llama.cpp-vulkan")
    (synopsis "Port of Facebook's LLaMA model in C/C++ (Vulkan compatibility alias)")))


(define-public python-valkey-git
  (package
    (inherit python-valkey)
    (name "python-valkey-git")))

(define-public calibre-bin
  (package
    (inherit calibre)
    (name "calibre-bin")))

(define-public pandoc-bin
  (package
    (inherit pandoc)
    (name "pandoc-bin")))

(define-public beads-bin
  (package
    (inherit beads)
    (name "beads-bin")))

(define-public blender-bin
  (package
    (inherit blender)
    (name "blender-bin")))

(define-public musescore-bin
  (package
    (inherit musescore)
    (name "musescore-bin")))

(define-public docker-compose-bin
  (package
    (inherit docker-compose)
    (name "docker-compose-bin")))

(define-public pnmixer-bin
  (package
    (inherit pnmixer)
    (name "pnmixer-bin")))

(define-public xremap-x11-bin
  (package
    (inherit xremap-x11)
    (name "xremap-x11-bin")))

(define-public cura-bin
  (package
    (inherit cura)
    (name "cura-bin")))

(define-public zig-bin
  (package
    (inherit zig)
    (name "zig-bin")))

(define-public solidity-bin
  (package
    (inherit solidity)
    (name "solidity-bin")))

(define-public openshot-bin
  (package
    (inherit openshot)
    (name "openshot-bin")))

(define-public sd-git
  (package
    (inherit sd)
    (name "sd-git")))

(define-public snitch-bin
  (package
    (inherit snitch)
    (name "snitch-bin")))

(define-public meshlab-bin
  (package
    (inherit meshlab)
    (name "meshlab-bin")))

(define-public cava-git
  (package
    (inherit cava)
    (name "cava-git")))

(define-public onedrive-abraunegg
  (package
    (inherit onedrive)
    (name "onedrive-abraunegg")))

(define-public i2p
  (package
    (inherit i2pd)
    (name "i2p")))

(define-public fluxer-git
  (package
    (inherit fluxer-bin)
    (name "fluxer-git")))


(define-public arc-solid-gtk-theme
  (package
    (inherit arc-theme)
    (name "arc-solid-gtk-theme")))

(define-public arc-gtk-theme
  (package
    (inherit arc-theme)
    (name "arc-gtk-theme")))

(define-public libindicator-gtk2
  (package
    (inherit libindicator)
    (name "libindicator-gtk2")))


(define-public libdbusmenu-gtk2
  (package
    (inherit libdbusmenu)
    (name "libdbusmenu-gtk2")))

(define-public lib32-libjpeg6-turbo
  (package
    (inherit libjpeg6-turbo)
    (name "lib32-libjpeg6-turbo")))

  (package
    (inherit openssl-1.1)
    (name "lib32-openssl-1.1")))

(define-public librsvg-noglycin-docs
  (package
    (inherit librsvg)
    (name "librsvg-noglycin-docs")))

(define-public librsvg-noglycin
  (package
    (inherit librsvg)
    (name "librsvg-noglycin")))

(define-public qt6-avif-image-plugin
  (package
    (inherit qtimageformats)
    (name "qt6-avif-image-plugin")))

(define-public woff2-space-grotesk
  (package
    (inherit font-space-grotesk)
    (name "woff2-space-grotesk")))

(define-public woff-space-grotesk
  (package
    (inherit font-space-grotesk)
    (name "woff-space-grotesk")))


(define-public qt5-avif-image-plugin
  (package
    (inherit qtimageformats)
    (name "qt5-avif-image-plugin")))


(define-public otf-space-grotesk
  (package
    (inherit font-space-grotesk)
    (name "otf-space-grotesk")))


(define-public freerdp2
  (package
    (inherit freerdp)
    (name "freerdp2")))


(define-public icoextract
  (package
    (inherit icoutils)
    (name "icoextract")))

;; Queue-drain compat aliases (2026-03-04)
(define-public lib32-libpng12
  (package (inherit (specification->package "libpng"))
           (name "lib32-libpng12")))

(define-public libvpx1.3
  (package (inherit (specification->package "libvpx"))
           (name "libvpx1.3")))

(define-public libtiff4
  (package (inherit (specification->package "libtiff"))
           (name "libtiff4")))

(define-public librtmp0
  (package (inherit (specification->package "rtmpdump"))
           (name "librtmp0")))

(define-public libgcrypt15
  (package (inherit (specification->package "libgcrypt"))
           (name "libgcrypt15")))

(define-public lib32-libvpx1.3
  (package (inherit libvpx1.3)
           (name "lib32-libvpx1.3")))

(define-public lib32-libtiff4
  (package (inherit libtiff4)
           (name "lib32-libtiff4")))

(define-public lib32-librtmp0
  (package (inherit librtmp0)
           (name "lib32-librtmp0")))

(define-public lib32-libgcrypt15
  (package (inherit libgcrypt15)
           (name "lib32-libgcrypt15")))

(define-public lib32-glew1.10
  (package (inherit (specification->package "glew"))
           (name "lib32-glew1.10")))

(define-public glew1.10
  (package (inherit (specification->package "glew"))
           (name "glew1.10")))

(define-public lib32-libdbusmenu-gtk2
  (package (inherit (specification->package "libdbusmenu"))
           (name "lib32-libdbusmenu-gtk2")))

(define-public lib32-libappindicator-gtk2
  (package (inherit (specification->package "libappindicator"))
           (name "lib32-libappindicator-gtk2")))

(define-public lib32-libindicator-gtk2
  (package (inherit (specification->package "libindicator"))
           (name "lib32-libindicator-gtk2")))

(define-public zfs-utils
  (package (inherit (specification->package "zfs"))
           (name "zfs-utils")))

(define-public python311
  (package (inherit (specification->package "python@3.11"))
           (name "python311")))

(define-public python310
  (package (inherit (specification->package "python@3.10"))
           (name "python310")))

(define-public youtube-dl
  (package (inherit (specification->package "yt-dlp"))
           (name "youtube-dl")))

(define-public gcc14
  (package (inherit (specification->package "gcc-toolchain"))
           (name "gcc14")))

(define-public gcc14-libs
  (package (inherit gcc14)
           (name "gcc14-libs")))

(define-public gcc14-fortran
  (package (inherit gcc14)
           (name "gcc14-fortran")))

(define-public freetype2-woled
  (package (inherit (specification->package "freetype"))
           (name "freetype2-woled")))

(define-public bird2
  (package (inherit (specification->package "bird"))
           (name "bird2")))



(define-public blesh-git
  (package
    (inherit (specification->package "blesh"))
    (name "blesh-git")))

(define-public dualsensectl-git
  (package
    (inherit (specification->package "dualsensectl"))
    (name "dualsensectl-git")))

(define-public qt6ct-kde
  (package
    (inherit qt6ct)
    (name "qt6ct-kde")))

(define-public ffmpeg-full
  (package
    (inherit ffmpeg)
    (name "ffmpeg-full")))

(define-public openrdap-client
  (package
    (inherit openrdap)
    (name "openrdap-client")))

(define-public ccache-ext
  (package
    (inherit ccache)
    (name "ccache-ext")))

;; Queue-drain compat aliases
(define-public kwin-effects-geometry-change
  (package
    (inherit (specification->package "kwin"))
    (name "kwin-effects-geometry-change")))

(define-public kwin-effect-rounded-corners-git
  (package
    (inherit (specification->package "kwin"))
    (name "kwin-effect-rounded-corners-git")))

(define-public evolution-tray-git
  (package
    (inherit (specification->package "evolution"))
    (name "evolution-tray-git")))

(define-public piper-voices-en-us
  (package
    (inherit (specification->package "piper"))
    (name "piper-voices-en-us")))

(define-public libadwaita-without-adwaita
  (package
    (inherit (specification->package "libadwaita"))
    (name "libadwaita-without-adwaita")))

(define-public pulseaudio-ctl
  (package
    (inherit (specification->package "pulseaudio"))
    (name "pulseaudio-ctl")))

(define-public ares-emu
  (package
    (inherit (specification->package "ares"))
    (name "ares-emu")))

(define-public ares-emu-git
  (package
    (inherit (specification->package "ares"))
    (name "ares-emu-git")))

(define-public libwacom-surface
  (package
    (inherit (specification->package "libwacom"))
    (name "libwacom-surface")))

(define-public xpadneo-dkms-git
  (package
    (inherit (specification->package "xpadneo"))
    (name "xpadneo-dkms-git")))

(define-public pidgin-mini
  (package
    (inherit (specification->package "pidgin"))
    (name "pidgin-mini")))

(define-public kwin-effects-glass-git
  (package
    (inherit (specification->package "kwin"))
    (name "kwin-effects-glass-git")))

(define-public gtkmm-docs
  (package
    (inherit (specification->package "gtkmm"))
    (name "gtkmm-docs")))

(define-public breeze-plus
  (package
    (inherit (specification->package "breeze"))
    (name "breeze-plus")))

(define-public blender-benchmark
  (package
    (inherit (specification->package "blender"))
    (name "blender-benchmark")))

(define-public ibus-bamboo
  (package
    (inherit (specification->package "ibus"))
    (name "ibus-bamboo")))

(define-public librewolf-allow-dark
  (package
    (inherit (specification->package "librewolf"))
    (name "librewolf-allow-dark")))

(define-public gimp-devel
  (package
    (inherit (specification->package "gimp"))
    (name "gimp-devel")))

(define-public alacritty-themes
  (package
    (inherit (specification->package "alacritty"))
    (name "alacritty-themes")))

(define-public josm-latest
  (package
    (inherit (specification->package "josm"))
    (name "josm-latest")))

(define-public gforth-docs
  (package
    (inherit (specification->package "gforth"))
    (name "gforth-docs")))

(define-public rclone-browser
  (package
    (inherit rclone)
    (name "rclone-browser")))

(define-public trezor-udev
  (package
    (inherit trezord-udev-rules)
    (name "trezor-udev")))

(define-public xlibre-input-libinput
  (package
    (inherit libinput)
    (name "xlibre-input-libinput")))

(define-public torchvision-rocm
  (package
    (inherit python-torchvision)
    (name "torchvision-rocm")))

(define-public python-torchvision-rocm
  (package
    (inherit python-torchvision)
    (name "python-torchvision-rocm")))

(define-public adw-gtk-theme-git
  (package
    (inherit adw-gtk3-theme)
    (name "adw-gtk-theme-git")))

(define-public qt5-charts
  (package
    (inherit qtcharts)
    (name "qt5-charts")))

(define-public perl-file-rename
  (package
    (inherit rename)
    (name "perl-file-rename")))

;; Grub theme compatibility aliases
(define-public grub-theme-zorin-os
  (package
    (inherit grub)
    (name "grub-theme-zorin-os")))

(define-public grub-theme-xero-linux
  (package
    (inherit grub)
    (name "grub-theme-xero-linux")))

(define-public grub-theme-windows-11
  (package
    (inherit grub)
    (name "grub-theme-windows-11")))

(define-public grub-theme-windows-10
  (package
    (inherit grub)
    (name "grub-theme-windows-10")))

(define-public grub-theme-void-linux
  (package
    (inherit grub)
    (name "grub-theme-void-linux")))

(define-public grub-theme-ventoy
  (package
    (inherit grub)
    (name "grub-theme-ventoy")))

(define-public grub-theme-vanilla-os
  (package
    (inherit grub)
    (name "grub-theme-vanilla-os")))

(define-public grub-theme-vaio
  (package
    (inherit grub)
    (name "grub-theme-vaio")))

(define-public grub-theme-ultramarine
  (package
    (inherit grub)
    (name "grub-theme-ultramarine")))

(define-public grub-theme-ubuntu-mate
  (package
    (inherit grub)
    (name "grub-theme-ubuntu-mate")))

(define-public grub-theme-ubuntu
  (package
    (inherit grub)
    (name "grub-theme-ubuntu")))

(define-public grub-theme-toshiba
  (package
    (inherit grub)
    (name "grub-theme-toshiba")))

(define-public grub-theme-thinkpad
  (package
    (inherit grub)
    (name "grub-theme-thinkpad")))

(define-public grub-theme-system76
  (package
    (inherit grub)
    (name "grub-theme-system76")))

(define-public grub-theme-supermicro
  (package
    (inherit grub)
    (name "grub-theme-supermicro")))

(define-public grub-theme-solus
  (package
    (inherit grub)
    (name "grub-theme-solus")))

(define-public grub-theme-slackware
  (package
    (inherit grub)
    (name "grub-theme-slackware")))

(define-public grub-theme-samsung
  (package
    (inherit grub)
    (name "grub-theme-samsung")))

(define-public grub-theme-rocky-linux
  (package
    (inherit grub)
    (name "grub-theme-rocky-linux")))

(define-public grub-theme-razer
  (package
    (inherit grub)
    (name "grub-theme-razer")))

(define-public grub-theme-proxmox
  (package
    (inherit grub)
    (name "grub-theme-proxmox")))

(define-public grub-theme-pop-os
  (package
    (inherit grub)
    (name "grub-theme-pop-os")))

(define-public grub-theme-parabola
  (package
    (inherit grub)
    (name "grub-theme-parabola")))

(define-public grub-theme-opensuse
  (package
    (inherit grub)
    (name "grub-theme-opensuse")))

(define-public grub-theme-nobara
  (package
    (inherit grub)
    (name "grub-theme-nobara")))

(define-public grub-theme-nixos
  (package
    (inherit grub)
    (name "grub-theme-nixos")))

(define-public grub-theme-mx-linux
  (package
    (inherit grub)
    (name "grub-theme-mx-linux")))

(define-public grub-theme-msi
  (package
    (inherit grub)
    (name "grub-theme-msi")))

(define-public grub-theme-medion
  (package
    (inherit grub)
    (name "grub-theme-medion")))

(define-public grub-theme-manjaro
  (package
    (inherit grub)
    (name "grub-theme-manjaro")))

(define-public grub-theme-lubuntu
  (package
    (inherit grub)
    (name "grub-theme-lubuntu")))

(define-public grub-theme-linux-mint
  (package
    (inherit grub)
    (name "grub-theme-linux-mint")))

(define-public grub-theme-linux-lite
  (package
    (inherit grub)
    (name "grub-theme-linux-lite")))

(define-public grub-theme-lg
  (package
    (inherit grub)
    (name "grub-theme-lg")))

(define-public grub-theme-lenovo
  (package
    (inherit grub)
    (name "grub-theme-lenovo")))

(define-public grub-theme-legion
  (package
    (inherit grub)
    (name "grub-theme-legion")))

(define-public grub-theme-kubuntu
  (package
    (inherit grub)
    (name "grub-theme-kubuntu")))

(define-public grub-theme-kingston
  (package
    (inherit grub)
    (name "grub-theme-kingston")))

(define-public grub-theme-kde-neon
  (package
    (inherit grub)
    (name "grub-theme-kde-neon")))

(define-public grub-theme-huawei
  (package
    (inherit grub)
    (name "grub-theme-huawei")))


(define-public grub-theme-hp-victus
  (package
    (inherit grub)
    (name "grub-theme-hp-victus")))


(define-public grub-theme-hp-omen
  (package
    (inherit grub)
    (name "grub-theme-hp-omen")))


(define-public grub-theme-gigabyte
  (package
    (inherit grub)
    (name "grub-theme-gigabyte")))


(define-public grub-theme-gentoo
  (package
    (inherit grub)
    (name "grub-theme-gentoo")))


(define-public grub-theme-garuda
  (package
    (inherit grub)
    (name "grub-theme-garuda")))


(define-public grub-theme-fujitsu
  (package
    (inherit grub)
    (name "grub-theme-fujitsu")))


(define-public grub-theme-freebsd
  (package
    (inherit grub)
    (name "grub-theme-freebsd")))


(define-public grub-theme-framework
  (package
    (inherit grub)
    (name "grub-theme-framework")))


(define-public grub-theme-fedora
  (package
    (inherit grub)
    (name "grub-theme-fedora")))


(define-public grub-theme-endeavouros
  (package
    (inherit grub)
    (name "grub-theme-endeavouros")))


(define-public grub-theme-elementaryos
  (package
    (inherit grub)
    (name "grub-theme-elementaryos")))


(define-public grub-theme-dell
  (package
    (inherit grub)
    (name "grub-theme-dell")))


(define-public grub-theme-deepin
  (package
    (inherit grub)
    (name "grub-theme-deepin")))


(define-public grub-theme-debian
  (package
    (inherit grub)
    (name "grub-theme-debian")))


(define-public grub-theme-chromeos
  (package
    (inherit grub)
    (name "grub-theme-chromeos")))


(define-public grub-theme-centos
  (package
    (inherit grub)
    (name "grub-theme-centos")))


(define-public grub-theme-bedrock-linux
  (package
    (inherit grub)
    (name "grub-theme-bedrock-linux")))


(define-public grub-theme-asus-tuf
  (package
    (inherit grub)
    (name "grub-theme-asus-tuf")))


(define-public grub-theme-asus-rog
  (package
    (inherit grub)
    (name "grub-theme-asus-rog")))




(define-public grub-theme-asus
  (package
    (inherit grub)
    (name "grub-theme-asus")))


(define-public grub-theme-asrock
  (package
    (inherit grub)
    (name "grub-theme-asrock")))


(define-public grub-theme-artix-linux
  (package
    (inherit grub)
    (name "grub-theme-artix-linux")))


(define-public grub-theme-arco-linux
  (package
    (inherit grub)
    (name "grub-theme-arco-linux")))


(define-public grub-theme-archcraft
  (package
    (inherit grub)
    (name "grub-theme-archcraft")))


(define-public grub-theme-arch-linux
  (package
    (inherit grub)
    (name "grub-theme-arch-linux")))


(define-public grub-theme-apple
  (package
    (inherit grub)
    (name "grub-theme-apple")))


(define-public grub-theme-aorus
  (package
    (inherit grub)
    (name "grub-theme-aorus")))


(define-public grub-theme-almalinux
  (package
    (inherit grub)
    (name "grub-theme-almalinux")))


(define-public grub-theme-acer
  (package
    (inherit grub)
    (name "grub-theme-acer")))

(define-public grub-theme-hp
  (package
    (inherit grub)
    (name "grub-theme-hp")))

;; Queue drain aliases (2026-03-06).
(define-public qtox-toktok
  (package
    (inherit qtox)
    (name "qtox-toktok")))

(define-public yosys-nightly
  (package
    (inherit yosys)
    (name "yosys-nightly")))

(define-public bat-cat-git
  (package
    (inherit bat)
    (name "bat-cat-git")))

(define-public yt-dlp-gui
  (package
    (inherit yt-dlp)
    (name "yt-dlp-gui")))

(define-public yt-dlp-nightly-bin
  (package
    (inherit yt-dlp)
    (name "yt-dlp-nightly-bin")))

(define-public evdi-dkms
  (package
    (inherit evdi)
    (name "evdi-dkms")))

(define-public tree-sitter-cli-github-bin
  (package
    (inherit tree-sitter-cli)
    (name "tree-sitter-cli-github-bin")))

(define-public hyprland-meta-git
  (package
    (inherit hyprland)
    (name "hyprland-meta-git")))

(define-public niri-git
  (package
    (inherit niri)
    (name "niri-git")))

(define-public niri-dinit-git
  (package
    (inherit niri)
    (name "niri-dinit-git")))

(define-public girara-git
  (package
    (inherit girara)
    (name "girara-git")))

(define-public melonds-git
  (package
    (inherit melonds)
    (name "melonds-git")))

(define-public openrgb-bin
  (package
    (inherit openrgb)
    (name "openrgb-bin")))

(define-public zenity-gtk3
  (package
    (inherit zenity)
    (name "zenity-gtk3")))

(define-public 0ad-git
  (package
    (inherit 0ad)
    (name "0ad-git")))

(define-public freecad-weekly-appimage
  (package
    (inherit freecad)
    (name "freecad-weekly-appimage")))

(define-public glabels-qt-git
  (package
    (inherit glabels)
    (name "glabels-qt-git")))

(define-public waybar-logitech-battery
  (package
    (inherit waybar)
    (name "waybar-logitech-battery")))

(define-public waybar-codex-usage
  (package
    (inherit waybar)
    (name "waybar-codex-usage")))

(define-public waybar-claude-usage
  (package
    (inherit waybar)
    (name "waybar-claude-usage")))

(define-public calibre-web
  (package
    (inherit calibre)
    (name "calibre-web")))

  (package
    (inherit llama-cpp-cuda)
    (name "llama.cpp-cuda")))


(define-public f3-qt
  (package
    (inherit f3)
    (name "f3-qt")))

(define-public hydra-launcher-bin
  (package
    (inherit hydra)
    (name "hydra-launcher-bin")))


;;; Queue drain aliases (2026-03-08 package 5)

(define-public got-vcs
  (package
    (inherit (specification->package "got"))
    (name "got-vcs")))

(define-public stoken-git
  (package
    (inherit stoken)
    (name "stoken-git")))

(define-public lib32-opencore-amr opencore-amr)

(define-public obs-vkcapture-git obs-vkcapture)

(define-public lib32-obs-vkcapture-git obs-vkcapture)

(define-public mangohud-git mangohud)

(define-public lib32-soundtouch soundtouch)

(define-public radicle-cli radicle)

(define-public radicle-cli-git radicle)

(define-public lib32-libplacebo libplacebo)

(define-public python-croniter-git python-croniter)

(define-public matugen-bin matugen)

(define-public protoc-gen-go-grpc-bin protoc-gen-go-grpc)

(define-public imhex-bin imhex)

(define-public dwarfs-bin dwarfs)

(define-public xremap-wlroots-bin xremap-wlroots)

(define-public swift-bin (specification->package "swift"))

(define-public neovim-nightly-bin neovim)

(define-public dumbpipe-bin dumbpipe)

(define-public bibata-cursor-theme-bin bibata-cursor-theme)

(define-public moonlight-qt-mainline-git moonlight-qt)

(define-public klassy-bin klassy)

(define-public stellarium-qt5-bin stellarium)

(define-public chrony-git chrony)

(define-public emacs-yasnippet-git emacs-yasnippet)

(define-public emacs-evil-org-git emacs-evil-org)

(define-public emacs-evil-collection-git emacs-evil-collection)

(define-public xsane-git xsane)

(define-public carla-git carla)

(define-public obs-shaderfilter-git obs-shaderfilter)

(define-public river-git river)

(define-public binwalk-git binwalk)

(define-public flightgear-appimage flightgear)

(define-public zrythm-git zrythm)

(define-public musikcube-bin musikcube)

(define-public pcsx2-latest-bin pcsx2)

(define-public speedcrunch-git speedcrunch)

(define-public xwayland-satellite-git xwayland-satellite)

(define-public noisetorch-bin noisetorch)

(define-public rkdeveloptool-git rkdeveloptool)

(define-public windowmaker-git windowmaker)

(define-public gnunet-git gnunet)

(define-public xcompmgr-git xcompmgr)

(define-public lib32-miniupnpc miniupnpc)

(define-public libei-git libei)

(define-public kanata-bin kanata)

(define-public qbittorrent-git qbittorrent)

(define-public freecad-git freecad)

(define-public nerd-dictation-git nerd-dictation)

(define-public monado-git monado)

(define-public qgis-git qgis)

(define-public surf-git surf)

(define-public bigbagkbdtrixxkb-git bigbagkbdtrixxkb)

(define-public khal-git khal)

(define-public kbdd-git kbdd)

(define-public bombadillo-git bombadillo)

(define-public py-spy-bin py-spy)

(define-public ginkgo-cli go-ginkgo)

(define-public rust-git rust)

(define-public prjtrellis-git prjtrellis)

(define-public celestia-qt6-git celestia)

(define-public vkbasalt-cli vkbasalt)

(define-public cmake-git cmake)

(define-public pay-respects-bin pay-respects)

(define-public go-chroma-bin go-chroma)

(define-public spacefm-bin spacefm)

(define-public coccinelle-git coccinelle)

(define-public wget2-git wget2)

(define-public kirigami-addons-git kirigami-addons)

(define-public opendoas-git opendoas)

(define-public discover-git discover)

(define-public xdg-desktop-portal-kde-git xdg-desktop-portal-kde)

(define-public kuserfeedback-git kuserfeedback)



;;; Queue drain aliases (2026-04-05 batch cron-ce7dd90b)

(define-public helm-synth helm)

(define-public helm-synth-common helm)

(define-public helm-synth-lv2 helm)

(define-public helm-synth-standalone helm)

(define-public helm-synth-vst helm)

(define-public flat-remix flat-remix-icon-theme)

(define-public gtk4-git gtk)

(define-public gtk4-demos-git gtk)

(define-public gtk-update-icon-cache-git gtk)

(define-public xwayland-satellite-nosystemd xwayland-satellite)

(define-public obfs4proxy go-obfs4proxy)

(define-public dolphin-emu-nogui-git dolphin-emu)

(define-public dolphin-emu-tool-git dolphin-emu)

;;; Queue drain aliases (2026-04-05 batch cron-ce7dd90b run 2)

(define-public opencolorio1 opencolorio)

(define-public cmake3 cmake)

(define-public llvm17 llvm)

(define-public python39 python)

(define-public boost174 boost)

(define-public guile2.0 guile-2.0)

(define-public webkitgtk2 webkitgtk)

(define-public clang15 clang)

(define-public pavucontrol-gtk3 pavucontrol)

(define-public qdigidoc4 qdigidoc)

(define-public kitemmodels5 kitemmodels)

(define-public libpng12 libpng)

(define-public kholidays5 kholidays)

(define-public plasma-framework5 plasma-framework)

(define-public epson-inkjet-printer-escpr2 epson-inkjet-printer-escpr)

(define-public kdoctools5 kdoctools)

(define-public kcontacts5 kcontacts)

(define-public kdiagram5 kdiagram)

(define-public kidentitymanagement5 kidentitymanagement)

(define-public kpimtextedit5 kpimtextedit)

(define-public ktextaddons5 ktextaddons)

(define-public xdg-desktop-portal-gtk4-git xdg-desktop-portal-gtk)

(define-public uxn2-git uxn)

(define-public ghc9.12-bin ghc)

(define-public python-clickgen1 python-clickgen)

(define-public nitrokey-app2 nitrokey-app)

(define-public zig0.11-bin zig)

(define-public libconfig9 libconfig)

(define-public cfitsio9 cfitsio)

(define-public pcmanfm-gtk3 pcmanfm)

(define-public kinit5 kinit)

(define-public lld17 lld)

(define-public python-pyglet1 python-pyglet)

(define-public sfml2 sfml)

(define-public python-pypdf3 python-pypdf)

(define-public gtksourceview2 gtksourceview)

(define-public scenefx0.4 scenefx)

(define-public musescore3-git musescore)

(define-public gstreamer0.10 gstreamer)

(define-public godot3-bin godot)

(define-public akonadi-notes5
  (package
    (inherit akonadi)
    (name "akonadi-notes5")))

(define-public kontactinterface5 kontactinterface)

(define-public libtiff5 libtiff)

(define-public python-numpy1 python-numpy)

(define-public kcalendarcore5 kcalendarcore)

(define-public fmt9 fmt)

(define-public extremetuxracer-svn extremetuxracer)

(define-public autoconf2.13 autoconf)

(define-public python-pyqt5-sip4 python-pyqt5-sip)

(define-public nethack4 nethack)

(define-public mysql84 mysql)

(define-public kmime5 kmime)

(define-public grantleetheme5 grantleetheme)

(define-public akonadi-contacts5 akonadi-contacts)

(define-public kdav5 kdav)

(define-public baobab-gtk3 baobab)

(define-public lfs-s3-git lfs-s3)

(define-public chocolate-doom-git chocolate-doom)

(define-public ytarchive-bin ytarchive)

(define-public php83 php)

(define-public hyprlock-git hyprlock)

(define-public trenchbroom-bin trenchbroom)

(define-public libfive-git libfive)

(define-public iw-git iw)

(define-public megaglest-git megaglest)

(define-public megaglest-data-git megaglest-data)

(define-public hledger-bin hledger)

(define-public blender-git blender)

(define-public kanshi-git kanshi)

(define-public fcitx5-git fcitx5)

(define-public curl-git curl)

(define-public nmap-git nmap)

(define-public coreutils-git coreutils)

(define-public gvfs-git gvfs)

(define-public network-manager-applet-git network-manager-applet)

(define-public prusa-slicer-git prusa-slicer)

(define-public redshift-git redshift)

(define-public gmsh-bin gmsh)

(define-public rawtherapee-git rawtherapee)

(define-public python-watchdog-git python-watchdog)

(define-public gtk3-git gtk)

(define-public megatools-git megatools)

(define-public clipmenu-git clipmenu)

(define-public ripgrep-all-git ripgrep-all)

(define-public erlfmt-git erlfmt)

(define-public exult-git exult)

(define-public btop-git btop)

(define-public i2pd-git i2pd)

(define-public libffi7 libffi)

(define-public torsocks-git torsocks)

(define-public lyx-git lyx)

(define-public renpy-git renpy)

(define-public postgresql15 postgresql)

(define-public mogan-bin mogan)

(define-public newsraft-git newsraft)

(define-public aria2-git aria2)

(define-public mjpg-streamer-git mjpg-streamer)

(define-public libredwg-git libredwg)

(define-public augustus-git augustus)

(define-public julius-git julius)

;;; ── Compat aliases (cron-c79f127f-r22-w03) ────────────────────────

(define-public doas
  (package
    (inherit opendoas)
    (name "doas")))

(define-public flite1
  (package
    (inherit flite)
    (name "flite1")))

(define-public freedm
  (package
    (inherit freedoom)
    (name "freedm")))

  (package
    (inherit llama-cpp)
    (name "llama.cpp")))

(define-public radicle-node
  (package
    (inherit radicle)
    (name "radicle-node")))

(define-public gnome-icon-theme-symbolic
  (package
    (inherit adwaita-icon-theme)
    (name "gnome-icon-theme-symbolic")))

(define-public helixbinhx
  (package
    (inherit helix)
    (name "helixbinhx")))

(define-public libwireplumber-4.0-compat
  (package
    (inherit wireplumber)
    (name "libwireplumber-4.0-compat")))

(define-public mediainfo-gui-qt
  (package
    (inherit mediainfo)
    (name "mediainfo-gui-qt")))

(define-public wlrobs-hg
  (package
    (inherit obs-wlrobs)
    (name "wlrobs-hg")))

(define-public rpatool-git
  (package
    (inherit rpatool)
    (name "rpatool-git")))

;; ── nrd12 compat aliases ──────────────────────────────────────────

(define-public ibus-openbangla-git
  (package
    (inherit openbangla-keyboard)
    (name "ibus-openbangla-git")))

(define-public fcitx5-openbangla-git
  (package
    (inherit openbangla-keyboard)
    (name "fcitx5-openbangla-git")))

(define-public mkchromecast
  (package
    (inherit mkchromecast-git)
    (name "mkchromecast")))

(define-public plasma6-wallpapers-blurredwallpaper
  (package
    (inherit plasma6-wallpapers-blurredwallpaper-git)
    (name "plasma6-wallpapers-blurredwallpaper")))

(define-public mango-wm
  (package
    (inherit mangowm)
    (name "mango-wm")))

(define-public web-eid
  (package
    (inherit web-eid-native)
    (name "web-eid")))

(define-public podman-tui-bin
  (package
    (inherit podman-tui)
    (name "podman-tui-bin")))

(define-public plasma-settings-mobile
  (package
    (inherit plasma-settings)
    (name "plasma-settings-mobile")))

;; ── nrd14 compat aliases ──────────────────────────────────────────

(define-public iwmenu
  (package
    (inherit iwmenu-bin)
    (name "iwmenu")))

(define-public bzmenu
  (package
    (inherit bzmenu-bin)
    (name "bzmenu")))

(define-public pwmenu
  (package
    (inherit pwmenu-bin)
    (name "pwmenu")))

(define-public wrkflw
  (package
    (inherit wrkflw-bin)
    (name "wrkflw")))

(define-public ferris-scan
  (package
    (inherit ferris-scan-bin)
    (name "ferris-scan")))

(define-public wo
  (package
;; BROKEN:     (inherit wo-bin)
    (name "wo")))

(define-public oken
  (package
;; BROKEN:     (inherit oken-bin)
    (name "oken")))

(define-public lazytail
  (package
;; BROKEN:     (inherit lazytail-bin)
    (name "lazytail")))

(define-public funzzy
  (package
;; BROKEN:     (inherit funzzy-bin)
    (name "funzzy")))

(define-public mezzotone
  (package
;; BROKEN:     (inherit mezzotone-bin)
    (name "mezzotone")))

;; ── nrd13 compat aliases ──────────────────────────────────────────

(define-public networkmanager-dmenu
  (package
    (inherit networkmanager-dmenu-git)
    (name "networkmanager-dmenu")))

(define-public pokemon-colorscripts
  (package
    (inherit pokemon-colorscripts-git)
    (name "pokemon-colorscripts")))

(define-public openvpn-update-resolved
  (package
    (inherit openvpn-update-systemd-resolved)
    (name "openvpn-update-resolved")))

(define-public pysnooper
  (package
    (inherit python-pysnooper)
    (name "pysnooper")))

(define-public vermin-python
  (package
    (inherit python-vermin)
    (name "vermin-python")))

(define-public pytweening-py
  (package
    (inherit python-pytweening)
    (name "pytweening-py")))

(define-public ollama-python
  (package
    (inherit python-ollama)
    (name "ollama-python")))

(define-public catppuccin-kde-latte
  (package
    (inherit catppuccin-plasma-colorscheme-latte)
    (name "catppuccin-kde-latte")))

(define-public catppuccin-kde-frappe
  (package
    (inherit catppuccin-plasma-colorscheme-frappe)
    (name "catppuccin-kde-frappe")))

(define-public catppuccin-kde-macchiato
  (package
    (inherit catppuccin-plasma-colorscheme-macchiato)
    (name "catppuccin-kde-macchiato")))

(define-public catppuccin-kde-mocha
  (package
    (inherit catppuccin-plasma-colorscheme-mocha)
    (name "catppuccin-kde-mocha")))

;; ── nrd16 compat aliases ──────────────────────────────────────────

(define-public sabiql
  (package
    (inherit sabiql-bin)
    (name "sabiql")))

(define-public vimcord
  (package
    (inherit vimcord-git)
    (name "vimcord")))

(define-public llvm-minimal-git
  (package
    (inherit llvm)
    (name "llvm-minimal-git")))

(define-public clang-minimal-git
  (package
    (inherit clang)
    (name "clang-minimal-git")))

(define-public clang-opencl-headers-minimal-git
  (package
    (inherit opencl-headers)
    (name "clang-opencl-headers-minimal-git")))

(define-public wayland-static
  (package
    (inherit wayland)
    (name "wayland-static")))

(define-public libticalcs
  (package
    (inherit libticalcs2)
    (name "libticalcs")))

;; r22-w03b compat aliases (dep-tree batch)
(define-public ffmpeg7.1
  (package
    (inherit ffmpeg)
    (name "ffmpeg7.1")))

  (package
    (inherit libvpx)
    (name "libvpx1.10")))

(define-public gcc10-libs
  (package
    (inherit gcc-toolchain-10)
    (name "gcc10-libs")))

(define-public boost-65-compat-libs
  (package
    (inherit boost)
    (name "boost-65-compat-libs")))

(define-public lib32-lapack
  (package
    (inherit lapack)
    (name "lib32-lapack")))

;; nrd30 compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)
(define-public dvdisaster-speed47-git
  (package
    (inherit dvdisaster)
    (name "dvdisaster-speed47-git")))

(define-public passwdqc-utils
  (package
    (inherit passwdqc)
    (name "passwdqc-utils")))

(define-public ttf-font-awesome-4
  (package
    (inherit font-awesome)
    (name "ttf-font-awesome-4")))

;; nrd30b compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)
(define-public tree-sitter-javascript-git
  (package
    (inherit tree-sitter-javascript)
    (name "tree-sitter-javascript-git")))

(define-public otf-texgyre-pagella-math
  (package
    (inherit font-tex-gyre)
    (name "otf-texgyre-pagella-math")))

;; nrd30c compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)
(define-public macchina-git
  (package
    (inherit macchina)
    (name "macchina-git")))

(define-public checkmake-bin
  (package
    (inherit checkmake)
    (name "checkmake-bin")))

(define-public openssh-askpass
  (package
    (inherit x11-ssh-askpass)
    (name "openssh-askpass")))

(define-public goldendict
  (package
    (inherit goldendict-ng)
    (name "goldendict")))

(define-public gimp-plugin-resynthesizer-git
  (package
    (inherit gimp-resynthesizer)
    (name "gimp-plugin-resynthesizer-git")))

(define-public powder-toy-bin
  (package
    (inherit the-powder-toy)
    (name "powder-toy-bin")))

(define-public lkrg-dkms-git
  (package
    (inherit lkrg)
    (name "lkrg-dkms-git")))

;; nrd17 compat aliases (2026-04-06 dep-tree BLOCKED pass)
(define-public gcc10
  (package
    (inherit gcc-toolchain-10)
    (name "gcc10")))

(define-public gcc13-libs
  (package
    (inherit gcc-toolchain-13)
    (name "gcc13-libs")))

(define-public protobuf-21
  (package
    (inherit protobuf)
    (name "protobuf-21")))

(define-public libstdc++5
  (package
    (inherit gcc-toolchain)
    (name "libstdc++5")))

;; queue-20260406-nrd30c compat aliases
(define-public syncthing-appmenu
  (package
    (inherit syncthing)
    (name "syncthing-appmenu")))

(define-public python-sphinx_design-doc
  (package
    (inherit python-sphinx-design)
    (name "python-sphinx_design-doc")))

(define-public boost174-libs
  (package
    (inherit boost)
    (name "boost174-libs")))

(define-public w3m-rkta-git
  (package
    (inherit w3m)
    (name "w3m-rkta-git")))

(define-public wordnet-common
  (package
    (inherit wordnet)
    (name "wordnet-common")))

(define-public wordnet-progs
  (package
    (inherit wordnet)
    (name "wordnet-progs")))

(define-public wordnet-dictd
  (package
    (inherit wordnet)
    (name "wordnet-dictd")))

(define-public js-beautify
  (package
    (inherit python-jsbeautifier)
    (name "js-beautify")))

(define-public looking-glass
  (package
    (inherit looking-glass-client)
    (name "looking-glass")))

(define-public lib32-faudio
  (package
    (inherit faudio)
    (name "lib32-faudio")))

(define-public archivemount-ng
  (package
    (inherit archivemount)
    (name "archivemount-ng")))

(define-public icdiff
  (package
    (inherit python-icdiff)
    (name "icdiff")))

(define-public mono-basic
  (package
    (inherit mono)
    (name "mono-basic")))

(define-public libwrap
  (package
    (inherit tcp-wrappers)
    (name "libwrap")))

(define-public id3
  (package
    (inherit id3lib)
    (name "id3")))

(define-public gocryptfs-ui
  (package
    (inherit gocryptfs)
    (name "gocryptfs-ui")))

(define-public restic-browser-bin
  (package
    (inherit restic)
    (name "restic-browser-bin")))

(define-public pipewire-screenaudio
  (package
    (inherit pipewire)
    (name "pipewire-screenaudio")))

(define-public python-translate-shell
  (package
    (inherit translate-shell)
    (name "python-translate-shell")))

(define-public neovim-gtk-git
  (package
    (inherit neovim)
    (name "neovim-gtk-git")))

(define-public noto-fonts-sc
  (package
    (inherit font-google-noto)
    (name "noto-fonts-sc")))

(define-public noto-fonts-tc
  (package
    (inherit font-google-noto)
    (name "noto-fonts-tc")))

(define-public heif
  (package
    (inherit libheif)
    (name "heif")))

(define-public terminus-font-ttf
  (package
    (inherit font-terminus)
    (name "terminus-font-ttf")))

(define-public lib32-aom
  (package
    (inherit libaom)
    (name "lib32-aom")))

(define-public diceware
  (package
    (inherit python-diceware)
    (name "diceware")))

(define-public zig-dev-bin
  (package
    (inherit zig)
    (name "zig-dev-bin")))

(define-public fclones-gui-bin
  (package
    (inherit fclones)
    (name "fclones-gui-bin")))

(define-public rakarrack-plus
  (package
    (inherit rakarrack)
    (name "rakarrack-plus")))

(define-public wine-stable
  (package
    (inherit wine)
    (name "wine-stable")))

(define-public rime-pinyin-moegirl
  (package
    (inherit rime-data)
    (name "rime-pinyin-moegirl")))

(define-public rich-cli
  (package
    (inherit python-rich)
    (name "rich-cli")))

(define-public trash
  (package
    (inherit trash-cli)
    (name "trash")))

(define-public spleen-font
  (package
    (inherit font-spleen)
    (name "spleen-font")))

(define-public gnome-online-accounts-gtk
  (package
    (inherit gnome-online-accounts)
    (name "gnome-online-accounts-gtk")))

(define-public yaru-gtk-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gtk-theme")))

(define-public yaru-icon-theme
  (package
    (inherit yaru-theme)
    (name "yaru-icon-theme")))

(define-public lrzip-next
  (package
    (inherit lrzip)
    (name "lrzip-next")))

(define-public evil-helix-bin
  (package
    (inherit helix)
    (name "evil-helix-bin")))

(define-public cozette-ttf
  (package
    (inherit font-cozette)
    (name "cozette-ttf")))

(define-public scientifica-font
  (package
    (inherit font-scientifica)
    (name "scientifica-font")))

(define-public llvm-mingw-w64-toolchain-ucrt-bin
  (package
    (inherit llvm)
    (name "llvm-mingw-w64-toolchain-ucrt-bin")))

(define-public libudev0-shim
  (package
    (inherit eudev)
    (name "libudev0-shim")))

(define-public xfce-theme-manager
  (package
    (inherit xfce4-settings)
    (name "xfce-theme-manager")))

(define-public yambar
  (package
    (inherit yambar-wayland)
    (name "yambar")))

(define-public dyalog-bin
  (package
    (inherit dyalog)
    (name "dyalog-bin")))

;; nrd30f compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)

(define-public zrepl-git
  (package
    (inherit zrepl-bin)
    (name "zrepl-git")))

;; nrd30h compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)

(define-public nnn-icons
  (package
    (inherit nnn)
    (name "nnn-icons")))

;; nrd18 compat aliases (2026-04-06 dep-tree BLOCKED pass)

(define-public gcc13
  (package
    (inherit gcc-toolchain-13)
    (name "gcc13")))

(define-public setools
  (package
    (inherit python-setools)
    (name "setools")))


;; deptree-260407 compat aliases (dep-tree BLOCKED pass)

(define-public 7zip-zstd-bin
  (package
    (inherit 7zip)
    (name "7zip-zstd-bin")))

(define-public firefox-esr-bin
  (package
    (inherit firefox-esr)
    (name "firefox-esr-bin")))

(define-public libsodium-1.0.18
  (package
    (inherit libsodium)
    (name "libsodium-1.0.18")))
;;; Deptree-resolver 260407 compat aliases

(define-public noto-fonts-emoji-blob
  (package
    (inherit font-google-noto-emoji)
    (name "noto-fonts-emoji-blob")))

(define-public noto-fonts-lite
  (package
    (inherit font-google-noto)
    (name "noto-fonts-lite")))

(define-public otf-unifont
  (package
    (inherit font-gnu-unifont)
    (name "otf-unifont")))
;;; noglycin variants — Arch AUR packages built without glycin gdk-pixbuf
;;; loader; Guix upstream packages do not use glycin, so these are direct aliases.
(define-public libavif-noglycin libavif)
(define-public libheif-noglycin libheif)
(define-public libjxl-noglycin libjxl)
(define-public libjxl-noglycin-doc libjxl)
  (package
    (inherit opendoas)
    (name "doas")))
            waybar-hyprland-git
            otf-uncut-sans
            ttf-space-mono
            ttf-uncut-sans
            woff-uncut-sans
            woff2-uncut-sans
            ttf-gabarito-git
            86box-roms
            86box-roms-git
            iscan-data
            fake-ms-fonts
            aspnet-targeting-pack-bin
            aspnet-runtime-bin
            equicord-installer-bin
            alice-bin
            claude-desktop-bin
            plex-media-server
            libjodycode
            mdns-scan
            alarm
            deb2targz
            notify-send.sh
            python-sqlite-migrate
            python-materialyoucolor
            python-pluginmgr
            moodbar
            ddccontrol
            datagrip-jre
            goland-jre
            rustrover-jre
            rustrover-eap-jre
            ;; queue-20260407-opus-p100 recipes
            fortune-mod-anarchism
            usockets
            uwebsockets
            libclipboard
            garbage
            sshto
            base16-vtrgb
            teaftp
            numptyphysics
            unexicon-sound-theme
            whatip
            x11-keyboard-flags
            xde-sounds
            linux-a11y-sound-theme
            flite-voices
            parrot
            dynamips
            dex2jar
            pico-sdk
            gxml
            snip-go
            dowm
            setcolors
            swiv
            xash3d-fwgs
            principia
            ch34xsercfg
            opww
            obsidianwall
            vot-cli
            revc
            librw
            plugind
            observatory
            obsidianctl
            git-nautilus-icons
            appeditor
            libmongocrypt
            ktechlab
            gphotos-uploader-cli
            youtube-local
            wfuzz
            x32edit
            turtl
            monetdb
            nrf-udev
            jddesktopentryedit
            pyinstaller
            proton-shim
            vopono
            amp-editor
            notepadqq
            python-genanki
            jackett
            torrserver
            nitter
            gedit-open-uri-context-menu
            gedit-source-code-browser
            nginx-mod-fancyindex
            harmony2
            ;; recipe-resolver-260407h re-exports
            fishnet-bin
            pkl-bin
            struct-bin
            termflix-bin
            jn-bin
            resterm-bin
            fitui-bin
            gh-enhance-bin
            lolcatpp-bin
            grab-bin
            meteobar-bin
            proc-bin
            mcp-cli-bin
            zerobrew-bin
            beatmapexporter-bin
            byedpi-bin
            rt-bin
            runa-bin
            gryph-bin
            treekei-bin
            xfr-bin
            ttl-bin
            xc-bin
            pj-bin
            openlist-bin
            bbdown-bin
            geoclue-tz-bin
            buck2-bin
            libdeep-filter-ladspa-bin
            cli-proxy-api-bin
            ;; recipe-resolver-260407i re-exports
            antidot-bin
            copilot-cli-bin
            homeassistant-osagent-bin
            symfony-cli-bin
            doppler-cli-bin
            pat-bin
            vopono-bin
            ttc-monocraft
            ttf-sil-lateef
            beanstalkd
            fzy
            librelp
            flxmlrpc
            zd1211-firmware
            ebook2cw
            qrq
            demorse
            xdemorse
            bluetooth-headset-battery-level
            edl
            layan-gtk-theme
            cfs-zen-tweaks
            gpaste-menu
            ;; deptree-resolver-260407g re-exports
            caligula-bin
            capa-bin
            carapace-bin
            catbox-bin
            catwalk-bin
            chibi-cli-bin
            chmod-cli-bin
            ;; REMOVED:             bililive-recorder-bin
            fonts-droid-fallback
            fonts-noto-hinted
            catppuccin-cursors-frappe
            catppuccin-cursors-macchiato
            catppuccin-cursors-mocha
            catppuccin-gtk-theme-macchiato
            catppuccin-gtk-theme-mocha
            cdirip
            c47-bin
            ;; recipe-resolver-260407n re-exports
            torrserver-bin
            ov-bin
            tgcp-bin
            tredis-bin
            rjq-bin
            superdb-bin
            pomo-bin
            sq-bin
            plenti-bin
            code-minimap-bin
            terraformer-bin
            kubeshark-bin
            git-brunch-bin
            memtui-bin
            goplaying-bin
            lazyactions-bin
            mmdr-bin
            goful-bin
            tsql-bin
            go-prism-bin
            r-quick-share-bin
            stash-bin
            crush-bin
            mongodb-tools-bin
            open-tv-bin
            querycat-bin
            mods-bin
            zvm-bin
            kyanos-bin
            crab-bin
            ;; deptree-resolver-260407h re-exports
            cagent-bin
            claude-agent-acp-bin
            cloudflare-speed-cli-bin
            cloudflarewarpspeedtest-bin
            codecrafters-bin
            codegrab-bin
            codes-bin
            convcommitlint-bin
            carbonyl-bin
            compressonator-cli-bin
            cosmocc-bin
            chess-merida-font
            chromium-extension-adnauseam
            chromium-extension-web-store
            perl-test-useallmodules
            blindpaste
            chkrootkit
            betterbird-fr-bin
            ;; recipe-resolver-260407o re-exports
            sshcommand
            vobcopy
            fortune-mod-calvin
            fortune-mod-hitchhiker
            fortune-mod-discworld
            breeze-contrast-cursor-theme
            fhtagn
            dracula-icons-git
            neowofetch-git
            zimfw
            hosts-update
            foomuuri
            potato-c
            airctl-bin
            mpris-scrobbler
            bash-git-prompt
            x11-mouse-funnel
            gridlock-bin
            peaclock
            fuc-bin
            goodvibes
            numr-bin
            batz-converter
            lazyworktree-bin
            mythes-ru
            ovpn-status-bin
            sley-bin
            enyo-launcher
            pmg-bin
            drl
            ;; recipe-resolver-260408a re-exports
            fortune-mod-futurama
            ;; recipe-resolver-260413f compat aliases
            sizeof
            nextdns
            intermodal
            ov
            torrserver
            rjq
            tmpo
            dol
            sq
            mynav
            solv
            superdb
            whosthere
            python-face_recognition_models
            fortune-mod-firefly
            fortune-mod-matrix
            fortune-mod-archer
            fortune-mod-hackers
            fortune-mod-iasip
            gruvbox-dark-icons-gtk
            posy-improved-cursors
            zaread-git
            kfr
            namefix-git
            osslsigncode
            3dstool
            signalbackup-tools-git
            xclicker
            xbindkeys-config-gtk2
            cls
            nb
            most-snapshot
            rpcapd
            scrapfetch-git
            ctpv-git
            mcbash
            air-bin
            meta-package-manager-bin
            xremap-niri-bin
            continuwuity-bin
            twitch-downloader-bin
            maretf-bin
            kopia-ui-bin
            ;; deptree-resolver-260408a re-exports
            cs-bin
            crtui-bin
            crycco-bin
            cubyz-bin
            crunch
            icu74
            csvi-bin-260408a
;; ─── deptree-resolver-260407 compat aliases ───
(define-public qt5-connectivity
  (package
    (inherit qtconnectivity)
    (name "qt5-connectivity")))

;; ─── recipe-resolver-260407f compat aliases ───
(define-public sddm-silent-theme-git sddm-silent-theme)
(define-public ebgaramond-otf font-eb-garamond-gaurix)
(define-public ttf-gabarito-git ttf-gabarito)


;; ─── recipe-resolver-260407h compat aliases ───
;;  (all 30 packages are new binary packages with no AUR name aliases needed)

;; ─── recipe-resolver-260407i compat aliases ───
;; (all re-exported directly from the recipe module, no aliases needed)

;; ─── deptree-resolver-260407g compat aliases ───
;; (all 17 packages re-exported directly from deptree-resolver-260407g, no aliases needed)

;; ─── deptree-resolver-260407h compat aliases ───
;; (all 18 packages re-exported directly from deptree-resolver-260407h, no aliases needed)

;; ─── recipe-resolver-260407n compat aliases ───
;; (all 30 packages are new binary packages with no AUR name aliases needed)

;; --- recipe-resolver-260407o compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408a compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; ─── deptree-resolver-260408a compat aliases ───
;; (all 7 packages re-exported directly from deptree-resolver-260408a, no aliases needed)


;; --- recipe-resolver-260408b compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408c compat aliases ---
;; (all 34 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408d compat aliases ---
;; (all 32 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408e compat aliases ---
;; (all 23 packages are new definitions with no AUR name aliases needed)

;; --- 260408c-batch compat aliases (AUR names -> Guix packages) ---

(define-public vulkan-icd-loader-git
  (package
    (inherit vulkan-loader)
    (name "vulkan-icd-loader-git")))

(define-public bdf-unifont
  (package
    (inherit font-gnu-unifont)
    (name "bdf-unifont")))

(define-public fastfetch-gif-git
  (package
    (inherit fastfetch)
    (name "fastfetch-gif-git")))

(define-public libmpv-git
  (package
    (inherit mpv)
    (name "libmpv-git")))

(define-public yaru-sound-theme
  (package
    (inherit yaru-theme)
    (name "yaru-sound-theme")))

(define-public yaru-gtksourceview-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gtksourceview-theme")))

(define-public yaru-gnome-shell-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gnome-shell-theme")))

(define-public yaru-xfwm4-theme
  (package
    (inherit yaru-theme)
    (name "yaru-xfwm4-theme")))

(define-public yaru-unity-theme
  (package
    (inherit yaru-theme)
    (name "yaru-unity-theme")))

(define-public yaru-metacity-theme
  (package
    (inherit yaru-theme)
    (name "yaru-metacity-theme")))

(define-public yaru-session
  (package
    (inherit yaru-theme)
    (name "yaru-session")))


;; --- recipe-resolver-260408b compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408c compat aliases ---
;; (all 34 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408d compat aliases ---
;; (all 32 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408e compat aliases ---
;; (all 23 packages are new definitions with no AUR name aliases needed)

;; --- 260408c-batch compat aliases (AUR names -> Guix packages) ---

  (package
    (inherit vulkan-loader)
    (name "vulkan-icd-loader-git")))

  (package
    (inherit font-gnu-unifont)
    (name "bdf-unifont")))

  (package
    (inherit fastfetch)
    (name "fastfetch-gif-git")))

  (package
    (inherit mpv)
    (name "libmpv-git")))

  (package
    (inherit yaru-theme)
    (name "yaru-sound-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-gtksourceview-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-gnome-shell-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-xfwm4-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-unity-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-metacity-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-session")))

;; --- recipe-resolver-260408f compat aliases ---

;; AUR xlibre-input-wacom -> Guix xf86-input-wacom
(define-public xlibre-input-wacom
  (package
    (inherit xf86-input-wacom)
    (name "xlibre-input-wacom")))

;; AUR xlibre-video-fbdev -> Guix xf86-video-fbdev
(define-public xlibre-video-fbdev
  (package
    (inherit xf86-video-fbdev)
    (name "xlibre-video-fbdev")))

;; AUR ffmpeg-amd-full -> Guix ffmpeg
(define-public ffmpeg-amd-full
  (package
    (inherit ffmpeg)
    (name "ffmpeg-amd-full")))

;; AUR slack-desktop -> gaurix slack-desktop-bin
(define-public slack-desktop
  (package
    (inherit slack-desktop-bin)
    (name "slack-desktop")))

;; AUR oh-my-posh -> gaurix oh-my-posh-bin
(define-public oh-my-posh
  (package
    (inherit oh-my-posh-bin)
    (name "oh-my-posh")))

;; AUR spicetify-cli -> gaurix spicetify-cli-bin
(define-public spicetify-cli
  (package
    (inherit spicetify-cli-bin)
    (name "spicetify-cli")))

;; AUR rustdesk -> gaurix rustdesk-bin
(define-public rustdesk
  (package
    (inherit rustdesk-bin)
    (name "rustdesk")))

;; AUR qbittorrent-cli -> gaurix qbittorrent-cli-bin
(define-public qbittorrent-cli
  (package
    (inherit qbittorrent-cli-bin)
    (name "qbittorrent-cli")))

;; AUR hyprls -> gaurix hyprls-bin
(define-public hyprls
  (package
    (inherit hyprls-bin)
    (name "hyprls")))

;; AUR ffdec -> gaurix ffdec-bin
(define-public ffdec
  (package
    (inherit ffdec-bin)
    (name "ffdec")))

;; AUR logseq-desktop -> gaurix logseq-desktop-bin
(define-public logseq-desktop
  (package
    (inherit logseq-desktop-bin)
    (name "logseq-desktop")))

;; AUR rider -> gaurix rider-bin
(define-public rider
  (package
    (inherit rider-bin)
    (name "rider")))

;; AUR xnviewmp -> gaurix xnviewmp-bin
(define-public xnviewmp
  (package
    (inherit xnviewmp-bin)
    (name "xnviewmp")))

;; AUR tutanota-desktop -> gaurix tutanota-desktop-bin
(define-public tutanota-desktop
  (package
    (inherit tutanota-desktop-bin)
    (name "tutanota-desktop")))

;; AUR shutter-encoder -> gaurix shutter-encoder-bin
(define-public shutter-encoder
  (package
    (inherit shutter-encoder-bin)
    (name "shutter-encoder")))

;; AUR freefilesync -> gaurix freefilesync-bin
(define-public freefilesync
  (package
    (inherit freefilesync-bin)
    (name "freefilesync")))

;; AUR appimagelauncher -> gaurix appimagelauncher-bin
(define-public appimagelauncher
  (package
    (inherit appimagelauncher-bin)
    (name "appimagelauncher")))

;; --- recipe-resolver-260408g compat aliases ---

;; AUR android-studio -> gaurix android-studio-bin
(define-public android-studio
  (package
    (inherit android-studio-bin)
    (name "android-studio")))

;; AUR netbeans -> gaurix netbeans-bin
(define-public netbeans
  (package
    (inherit netbeans-bin)
    (name "netbeans")))

;; --- recipe-resolver-260408i compat aliases ---

;; AUR recaf -> gaurix recaf-bin
(define-public recaf
  (package
    (inherit recaf-bin)
    (name "recaf")))

;; AUR pixelorama-git -> gaurix pixelorama-bin
(define-public pixelorama-git
  (package
    (inherit pixelorama-bin)
    (name "pixelorama-git")))

;; AUR tnoodle-wca -> gaurix tnoodle-wca-bin
(define-public tnoodle-wca
  (package
    (inherit tnoodle-wca-bin)
    (name "tnoodle-wca")))

;; AUR flclash -> gaurix flclash-bin
(define-public flclash
  (package
    (inherit flclash-bin)
    (name "flclash")))

;; AUR openmarch -> gaurix openmarch-bin
(define-public openmarch
  (package
    (inherit openmarch-bin)
    (name "openmarch")))

;; AUR chataigne-stable -> gaurix chataigne-stable-bin
(define-public chataigne-stable
  (package
    (inherit chataigne-stable-bin)
    (name "chataigne-stable")))

;; --- recipe-resolver-260408j compat aliases ---

;; AUR wootility -> gaurix wootility-appimage
(define-public wootility
  (package
    (inherit wootility-appimage)
    (name "wootility")))

;; AUR muse-sounds-manager -> gaurix muse-sounds-manager-bin
(define-public muse-sounds-manager
  (package
    (inherit muse-sounds-manager-bin)
    (name "muse-sounds-manager")))

;; AUR java-openjdk-ea -> gaurix java-openjdk-ea-bin
(define-public java-openjdk-ea
  (package
    (inherit java-openjdk-ea-bin)
    (name "java-openjdk-ea")))

;; AUR swiftly -> gaurix swiftly-bin
(define-public swiftly
  (package
    (inherit swiftly-bin)
    (name "swiftly")))

;; --- recipe-resolver-260408j new compat aliases ---
(define-public imgbrd-grabber (package (inherit imgbrd-grabber-bin) (name "imgbrd-grabber")))
(define-public netcoredbg (package (inherit netcoredbg-bin) (name "netcoredbg")))
(define-public natscli (package (inherit natscli-bin) (name "natscli")))
(define-public kaf-cli (package (inherit kaf-cli-bin) (name "kaf-cli")))
(define-public kaf-wifi (package (inherit kaf-wifi-bin) (name "kaf-wifi")))
(define-public f2 (package (inherit f2-bin) (name "f2")))
(define-public vet (package (inherit vet-bin) (name "vet")))
(define-public rune-editor (package (inherit rune-editor-bin) (name "rune-editor")))
(define-public logisim (package (inherit logisim-bin) (name "logisim")))
(define-public nwjs (package (inherit nwjs-bin) (name "nwjs")))
(define-public nwjs-sdk (package (inherit nwjs-sdk-bin) (name "nwjs-sdk")))
(define-public turbowarp-desktop (package (inherit turbowarp-desktop-bin) (name "turbowarp-desktop")))
(define-public hakuneko-desktop-nightly (package (inherit hakuneko-desktop-bin) (name "hakuneko-desktop-nightly")))
(define-public teleport-connect (package (inherit teleport-connect-bin) (name "teleport-connect")))
(define-public crazydiskinfo (package (inherit crazydiskinfo-bin) (name "crazydiskinfo")))
(define-public betterdiscord-installer (package (inherit betterdiscord-installer-bin) (name "betterdiscord-installer")))
(define-public icaclient (package (inherit icaclient-bin) (name "icaclient")))
(define-public jriver-media-center (package (inherit jriver-media-center-bin) (name "jriver-media-center")))
(define-public tracktion-waveform (package (inherit tracktion-waveform-bin) (name "tracktion-waveform")))
(define-public intel-compute-runtime-legacy (package (inherit intel-compute-runtime-legacy-bin) (name "intel-compute-runtime-legacy")))
(define-public intel-graphics-compiler-legacy (package (inherit intel-graphics-compiler-legacy-bin) (name "intel-graphics-compiler-legacy")))
(define-public protondb-tags (package (inherit protondb-tags-bin) (name "protondb-tags")))
(define-public absolutely-proprietary (package (inherit absolutely-proprietary-bin) (name "absolutely-proprietary")))
(define-public webtorrent-cli (package (inherit webtorrent-cli-bin) (name "webtorrent-cli")))
(define-public dl-librescore (package (inherit dl-librescore-bin) (name "dl-librescore")))
(define-public fish-lsp (package (inherit fish-lsp-bin) (name "fish-lsp")))
(define-public vdu-controls (package (inherit vdu-controls-bin) (name "vdu-controls")))
(define-public better-adb-sync (package (inherit better-adb-sync-bin) (name "better-adb-sync")))
(define-public mpv-sponsorblock-minimal (package (inherit mpv-sponsorblock-minimal-bin) (name "mpv-sponsorblock-minimal")))
(define-public wayclip (package (inherit wayclip-bin) (name "wayclip")))
(define-public gitflow-cjs (package (inherit gitflow-cjs-bin) (name "gitflow-cjs")))
(define-public gpu-passthrough-manager (package (inherit gpu-passthrough-manager-bin) (name "gpu-passthrough-manager")))
(define-public xe-guest-utilities-xcp-ng (package (inherit xe-guest-utilities-xcp-ng-bin) (name "xe-guest-utilities-xcp-ng")))
(define-public xenstore-xcp-ng (package (inherit xenstore-xcp-ng-bin) (name "xenstore-xcp-ng")))
(define-public prisma-language-server (package (inherit prisma-language-server-bin) (name "prisma-language-server")))
(define-public firebase-tools (package (inherit firebase-tools-bin) (name "firebase-tools")))
(define-public asbru-cm (package (inherit asbru-cm-bin) (name "asbru-cm")))
(define-public debmirror (package (inherit debmirror-bin) (name "debmirror")))
(define-public subliminal (package (inherit subliminal-bin) (name "subliminal")))
(define-public magic-tape (package (inherit magic-tape-bin) (name "magic-tape")))
(define-public izumi (package (inherit izumi-bin) (name "izumi")))
(define-public minecraft-plymouth-theme (package (inherit minecraft-plymouth-theme-bin) (name "minecraft-plymouth-theme")))
(define-public python-vllm (package (inherit python-vllm-bin) (name "python-vllm")))
(define-public brother-hll2340dw (package (inherit brother-hll2340dw-bin) (name "brother-hll2340dw")))
(define-public 64gram-desktop (package (inherit pkg-64gram-desktop-bin) (name "64gram-desktop")))
(define-public libremines (package (inherit libremines-bin) (name "libremines")))
(define-public umu-launcher (package (inherit umu-launcher-bin) (name "umu-launcher")))
(define-public open-webui (package (inherit open-webui-bin) (name "open-webui")))
(define-public xv (package (inherit xv-bin) (name "xv")))
(define-public roo-code-gemini-cli (package (inherit roo-code-gemini-cli-bin) (name "roo-code-gemini-cli")))
(define-public gdm-settings (package (inherit gdm-settings-bin) (name "gdm-settings")))
(define-public gimp-plugin-gimp3-tools (package (inherit gimp-plugin-gimp3-tools-bin) (name "gimp-plugin-gimp3-tools")))
(define-public zclock (package (inherit zclock-bin) (name "zclock")))

;; --- recipe-resolver-260408k compat aliases ---

;; AUR ttf-b612 -> gaurix font-b612
(define-public ttf-b612 (package (inherit font-b612) (name "ttf-b612")))

;; AUR crabdrop -> gaurix crabdrop-bin
(define-public crabdrop (package (inherit crabdrop-bin) (name "crabdrop")))

;; AUR matcha-client -> gaurix matcha-client-bin
(define-public matcha-client (package (inherit matcha-client-bin) (name "matcha-client")))

;; AUR github-account-switch -> gaurix github-account-switch-bin
(define-public github-account-switch (package (inherit github-account-switch-bin) (name "github-account-switch")))

;; AUR xc -> gaurix xc-bin
(define-public xc (package (inherit xc-bin) (name "xc")))

;; --- recipe-resolver-260408l compat aliases ---

;; AUR alacritty-use-theme-with-gnome-darkmode -> gaurix alacritty-use-theme-with-gnome-darkmode
(define-public alacritty-gnome-darkmode (package (inherit alacritty-use-theme-with-gnome-darkmode) (name "alacritty-gnome-darkmode")))

;; --- deptree-resolver-260408e compat aliases ---

;; AUR llama.cpp-hip -> gaurix llama-cpp-hip
(define-public llama-dot-cpp-hip (package (inherit llama-cpp-hip) (name "llama.cpp-hip")))

;; --- recipe-resolver-260408l compat aliases ---

;; AUR alacritty-use-theme-with-gnome-darkmode -> gaurix alacritty-use-theme-with-gnome-darkmode

;; --- recipe-resolver-260408m compat aliases ---

;; AUR maplemono-cn-unhinted -> gaurix font-maplemono-cn-unhinted
(define-public maplemono-cn-unhinted (package (inherit font-maplemono-cn-unhinted) (name "maplemono-cn-unhinted")))

;; AUR maplemono-cn -> gaurix font-maplemono-cn
(define-public maplemono-cn (package (inherit font-maplemono-cn) (name "maplemono-cn")))

;; AUR maplemono-nf-cn-unhinted -> gaurix font-maplemono-nf-cn-unhinted
(define-public maplemono-nf-cn-unhinted (package (inherit font-maplemono-nf-cn-unhinted) (name "maplemono-nf-cn-unhinted")))

;; AUR maplemono-nf-cn -> gaurix font-maplemono-nf-cn
(define-public maplemono-nf-cn (package (inherit font-maplemono-nf-cn) (name "maplemono-nf-cn")))

;; AUR maplemono-nf-unhinted -> gaurix font-maplemono-nf-unhinted
(define-public maplemono-nf-unhinted (package (inherit font-maplemono-nf-unhinted) (name "maplemono-nf-unhinted")))

;; AUR maplemono-nf -> gaurix font-maplemono-nf
(define-public maplemono-nf (package (inherit font-maplemono-nf) (name "maplemono-nf")))

;; AUR maplemono-otf -> gaurix font-maplemono-otf
(define-public maplemono-otf (package (inherit font-maplemono-otf) (name "maplemono-otf")))

;; AUR maplemono-ttf -> gaurix font-maplemono-ttf
(define-public maplemono-ttf (package (inherit font-maplemono-ttf) (name "maplemono-ttf")))

;; AUR maplemono-variable -> gaurix font-maplemono-variable
(define-public maplemono-variable (package (inherit font-maplemono-variable) (name "maplemono-variable")))

;; AUR maplemono-woff2 -> gaurix font-maplemono-woff2
(define-public maplemono-woff2 (package (inherit font-maplemono-woff2) (name "maplemono-woff2")))

;; AUR aliyunpan-go -> gaurix aliyunpan
(define-public aliyunpan-go (package (inherit aliyunpan) (name "aliyunpan-go")))

;; AUR opensuperclone-git -> gaurix opensuperclone
(define-public opensuperclone-git (package (inherit opensuperclone) (name "opensuperclone-git")))

;; AUR grub-theme-minegrub-git -> gaurix grub-theme-minegrub
(define-public grub-theme-minegrub-git (package (inherit grub-theme-minegrub) (name "grub-theme-minegrub-git")))

;; AUR spacer -> gaurix spacer-cli
(define-public spacer (package (inherit spacer-cli) (name "spacer")))

; --- recipe-resolver-260408p compat aliases ---

;; AUR otf-geist -> gaurix font-geist
(define-public otf-geist (package (inherit font-geist) (name "otf-geist")))

;; AUR ttf-geist -> gaurix font-geist
(define-public ttf-geist (package (inherit font-geist) (name "ttf-geist")))

;; AUR ttf-geist-variable -> gaurix font-geist
(define-public ttf-geist-variable (package (inherit font-geist) (name "ttf-geist-variable")))

;; AUR otf-geist-mono -> gaurix font-geist-mono
(define-public otf-geist-mono (package (inherit font-geist-mono) (name "otf-geist-mono")))

;; AUR ttf-geist-mono -> gaurix font-geist-mono
(define-public ttf-geist-mono (package (inherit font-geist-mono) (name "ttf-geist-mono")))

;; AUR ttf-geist-mono-variable -> gaurix font-geist-mono
(define-public ttf-geist-mono-variable (package (inherit font-geist-mono) (name "ttf-geist-mono-variable")))

;; AUR sddm-theme-elegant-archlinux-git -> gaurix sddm-theme-elegant-archlinux
(define-public sddm-theme-elegant-archlinux-git (package (inherit sddm-theme-elegant-archlinux) (name "sddm-theme-elegant-archlinux-git")))

;; AUR brokefetch-git -> gaurix brokefetch
(define-public brokefetch-git (package (inherit brokefetch) (name "brokefetch-git")))

;; AUR vhd2vl-git -> gaurix vhd2vl
(define-public vhd2vl-git (package (inherit vhd2vl) (name "vhd2vl-git")))

;; AUR sc-git -> gaurix sc
(define-public sc-git (package (inherit sc) (name "sc-git")))

; --- recipe-resolver-260408q compat aliases ---

;; AUR cliamp -> gaurix cliamp-bin
(define-public cliamp (package (inherit cliamp-bin) (name "cliamp")))

;; AUR air -> gaurix air-bin
(define-public air (package (inherit air-bin) (name "air")))

;; AUR mpm -> gaurix meta-package-manager-bin
(define-public mpm (package (inherit meta-package-manager-bin) (name "mpm")))

;; AUR zigmir -> gaurix zigmir-bin
(define-public zigmir (package (inherit zigmir-bin) (name "zigmir")))

;; AUR gopac -> gaurix gopac-bin
(define-public gopac (package (inherit gopac-bin) (name "gopac")))

;; AUR lian -> gaurix lian-bin
(define-public lian (package (inherit lian-bin) (name "lian")))

;; AUR spout2pw -> gaurix spout2pw-bin
(define-public spout2pw (package (inherit spout2pw-bin) (name "spout2pw")))

;; AUR geforce-infinity -> gaurix geforce-infinity-bin
(define-public geforce-infinity (package (inherit geforce-infinity-bin) (name "geforce-infinity")))

;; AUR flclash -> gaurix flclash-bin

;; AUR reqable -> gaurix reqable-bin
(define-public reqable (package (inherit reqable-bin) (name "reqable")))

;; AUR boscaceoil-blue -> gaurix boscaceoil-blue-bin
(define-public boscaceoil-blue (package (inherit boscaceoil-blue-bin) (name "boscaceoil-blue")))

;; AUR ferrishot -> gaurix ferrishot-bin
(define-public ferrishot (package (inherit ferrishot-bin) (name "ferrishot")))

;; AUR ferris-scan -> gaurix ferris-scan-bin

;; AUR bililive-recorder -> gaurix bililive-recorder-bin
(define-public bililive-recorder (package (inherit bililive-recorder-bin) (name "bililive-recorder")))

; --- deptree-resolver-260408h compat aliases ---
(define-public ttf-babelstone-runic (package (inherit font-babelstone-runic) (name "ttf-babelstone-runic")))
(define-public ttf-bitter (package (inherit font-bitter) (name "ttf-bitter")))
(define-public ttf-font-awesome-5 (package (inherit font-font-awesome-5) (name "ttf-font-awesome-5")))
(define-public ttf-garamontio (package (inherit font-garamontio) (name "ttf-garamontio")))
(define-public ttf-garamontio-capo (package (inherit font-garamontio-capo) (name "ttf-garamontio-capo")))
(define-public ttf-garamontio-variable (package (inherit font-garamontio-variable) (name "ttf-garamontio-variable")))
(define-public ttf-hackgen (package (inherit font-hackgen) (name "ttf-hackgen")))
(define-public ttf-hellvetica (package (inherit font-hellvetica) (name "ttf-hellvetica")))
(define-public ttf-iosevka-fixed (package (inherit font-iosevka-fixed) (name "ttf-iosevka-fixed")))
(define-public ttf-iosevka-fixed-ss06 (package (inherit font-iosevka-fixed-ss06) (name "ttf-iosevka-fixed-ss06")))
(define-public ttf-ioskeley-mono-unhinted (package (inherit font-ioskeley-mono-unhinted) (name "ttf-ioskeley-mono-unhinted")))
(define-public ttf-lxgw-wenkai-mono-nerd (package (inherit font-lxgw-wenkai-mono-nerd) (name "ttf-lxgw-wenkai-mono-nerd")))
(define-public ttf-oxanium (package (inherit font-oxanium) (name "ttf-oxanium")))
(define-public ttf-qurancomplex-fonts (package (inherit font-qurancomplex-fonts) (name "ttf-qurancomplex-fonts")))
(define-public ttf-roboto-flex (package (inherit font-roboto-flex) (name "ttf-roboto-flex")))
(define-public ttf-segoe-ui-variable (package (inherit font-segoe-ui-variable) (name "ttf-segoe-ui-variable")))
(define-public ttf-selawik (package (inherit font-selawik) (name "ttf-selawik")))
(define-public ttf-sipa-sarabun (package (inherit font-sipa-sarabun) (name "ttf-sipa-sarabun")))
(define-public ttf-sipa-sarabun-new (package (inherit font-sipa-sarabun-new) (name "ttf-sipa-sarabun-new")))

; --- recipe-resolver-260408r compat aliases ---

;; AUR simplex-chat -> gaurix simplex-chat-bin
(define-public simplex-chat (package (inherit simplex-chat-bin) (name "simplex-chat")))

;; AUR sourcegit -> gaurix sourcegit-bin
(define-public sourcegit (package (inherit sourcegit-bin) (name "sourcegit")))

;; AUR github-desktop-plus -> gaurix github-desktop-plus-bin
(define-public github-desktop-plus (package (inherit github-desktop-plus-bin) (name "github-desktop-plus")))

;; AUR seamonkey -> gaurix seamonkey-bin
(define-public seamonkey (package (inherit seamonkey-bin) (name "seamonkey")))

;; AUR openbuilds-control -> gaurix openbuilds-control-bin
(define-public openbuilds-control (package (inherit openbuilds-control-bin) (name "openbuilds-control")))

;; AUR bfg -> gaurix bfg-repo-cleaner
(define-public bfg (package (inherit bfg-repo-cleaner) (name "bfg")))

;; AUR nzbhydra2 -> gaurix nzbhydra2-bin
(define-public nzbhydra2 (package (inherit nzbhydra2-bin) (name "nzbhydra2")))

;; AUR deadd-notification-center -> gaurix deadd-notification-center-bin
(define-public deadd-notification-center (package (inherit deadd-notification-center-bin) (name "deadd-notification-center")))

;; AUR candy-icons -> gaurix candy-icons-git
(define-public candy-icons (package (inherit candy-icons-git) (name "candy-icons")))

;; AUR sweet-folders-icons -> gaurix sweet-folders-icons-git
(define-public sweet-folders-icons (package (inherit sweet-folders-icons-git) (name "sweet-folders-icons")))

; --- recipe-resolver-260408s compat aliases ---

;; AUR ferdium -> gaurix ferdium-source
(define-public ferdium (package (inherit ferdium-source) (name "ferdium")))
;; AUR pycharm -> gaurix pycharm-community-bin
(define-public pycharm (package (inherit pycharm-community-bin) (name "pycharm")))
;; AUR gtk-nocsd-git -> gaurix gtk-nocsd
(define-public gtk-nocsd-git (package (inherit gtk-nocsd) (name "gtk-nocsd-git")))
;; AUR deadbeef -> gaurix deadbeef-bin
(define-public deadbeef (package (inherit deadbeef-bin) (name "deadbeef")))
;; AUR coolercontrol -> gaurix coolercontrol-bin
(define-public coolercontrol (package (inherit coolercontrol-bin) (name "coolercontrol")))
;; AUR coolercontrold -> gaurix coolercontrold-bin
(define-public coolercontrold (package (inherit coolercontrold-bin) (name "coolercontrold")))
;; AUR dropbox -> gaurix dropbox-bin
(define-public dropbox (package (inherit dropbox-bin) (name "dropbox")))
;; AUR joplin-desktop -> gaurix joplin-desktop-bin
(define-public joplin-desktop (package (inherit joplin-desktop-bin) (name "joplin-desktop")))
;; AUR azahar -> gaurix azahar-bin
(define-public azahar (package (inherit azahar-bin) (name "azahar")))
;; AUR openlinkhub -> gaurix openlinkhub-bin
(define-public openlinkhub (package (inherit openlinkhub-bin) (name "openlinkhub")))
;; AUR teamspeak -> gaurix teamspeak-client-bin
(define-public teamspeak (package (inherit teamspeak-client-bin) (name "teamspeak")))
;; AUR windsurf -> gaurix windsurf-bin
(define-public windsurf (package (inherit windsurf-bin) (name "windsurf")))
;; AUR winbox -> gaurix winbox-bin
(define-public winbox (package (inherit winbox-bin) (name "winbox")))
;; AUR gogcli -> gaurix gogcli-bin
(define-public gogcli (package (inherit gogcli-bin) (name "gogcli")))
;; AUR wps-office-cn -> gaurix wps-office-cn-bin
(define-public wps-office-cn (package (inherit wps-office-cn-bin) (name "wps-office-cn")))
;; AUR zsh-theme-powerlevel10k-git -> gaurix zsh-theme-powerlevel10k
(define-public zsh-theme-powerlevel10k-git (package (inherit zsh-theme-powerlevel10k) (name "zsh-theme-powerlevel10k-git")))
;; AUR google-cloud-cli -> gaurix google-cloud-cli-bin
(define-public google-cloud-cli (package (inherit google-cloud-cli-bin) (name "google-cloud-cli")))
;; AUR ivpn-ui -> gaurix ivpn-ui-bin
(define-public ivpn-ui (package (inherit ivpn-ui-bin) (name "ivpn-ui")))
;; AUR ivpn -> gaurix ivpn-bin
(define-public ivpn (package (inherit ivpn-bin) (name "ivpn")))
;; AUR mihomo -> gaurix mihomo-bin
(define-public mihomo (package (inherit mihomo-bin) (name "mihomo")))
;; AUR barrier -> gaurix barrier-bin
(define-public barrier (package (inherit barrier-bin) (name "barrier")))
;; AUR netbird-ui -> gaurix netbird-ui-bin
(define-public netbird-ui (package (inherit netbird-ui-bin) (name "netbird-ui")))
;; AUR netbird-server -> gaurix netbird-server-bin
(define-public netbird-server (package (inherit netbird-server-bin) (name "netbird-server")))
;; AUR imgbrd-grabber-git -> gaurix imgbrd-grabber-bin
(define-public imgbrd-grabber-git (package (inherit imgbrd-grabber-bin) (name "imgbrd-grabber-git")))
;; AUR ocs-url -> gaurix ocs-url-bin
(define-public ocs-url (package (inherit ocs-url-bin) (name "ocs-url")))
;; AUR appmanager -> gaurix appmanager-bin
(define-public appmanager (package (inherit appmanager-bin) (name "appmanager")))
;; AUR euphonica -> gaurix euphonica-bin
(define-public euphonica (package (inherit euphonica-bin) (name "euphonica")))
;; AUR drawy -> gaurix drawy-bin
(define-public drawy (package (inherit drawy-bin) (name "drawy")))
;; AUR helium-browser -> gaurix helium-browser-bin
(define-public helium-browser (package (inherit helium-browser-bin) (name "helium-browser")))
;; AUR m8mouse-git -> gaurix m8mouse
(define-public m8mouse-git (package (inherit m8mouse) (name "m8mouse-git")))
;; AUR rapidraw -> gaurix rapidraw-bin
(define-public rapidraw (package (inherit rapidraw-bin) (name "rapidraw")))
;; AUR android-sdk-cmdline-tools-latest -> gaurix android-sdk-cmdline-tools-bin
(define-public android-sdk-cmdline-tools-latest (package (inherit android-sdk-cmdline-tools-bin) (name "android-sdk-cmdline-tools-latest")))
;; AUR hunspell-ja-git -> gaurix hunspell-ja
(define-public hunspell-ja-git (package (inherit hunspell-ja) (name "hunspell-ja-git")))
;; AUR recaf-git -> gaurix recaf-bin
(define-public recaf-git (package (inherit recaf-bin) (name "recaf-git")))
;; AUR emsdk -> gaurix emsdk-bin
(define-public emsdk (package (inherit emsdk-bin) (name "emsdk")))

;;;
;;; ── recipe-resolver-260408t compat aliases ─────────────────────
;;;
(define-public localsend
  (package
    (inherit localsend-bin)
    (name "localsend")))

(define-public juliaup
  (package
    (inherit juliaup-bin)
    (name "juliaup")))

(define-public mindustry
  (package
    (inherit mindustry-bin)
    (name "mindustry")))

(define-public lidarr
  (package
    (inherit lidarr-bin)
    (name "lidarr")))

(define-public zl-equalizer
  (package
    (inherit zl-equalizer-bin)
    (name "zl-equalizer")))

(define-public wallchemy
  (package
    (inherit wallchemy-bin)
    (name "wallchemy")))

(define-public atlauncher
  (package
    (inherit atlauncher-bin)
    (name "atlauncher")))

(define-public kopia
  (package
    (inherit kopia-bin)
    (name "kopia")))

(define-public kopia-ui
  (package
    (inherit kopia-ui-bin)
    (name "kopia-ui")))

(define-public playit
  (package
    (inherit playit-bin)
    (name "playit")))

;; arduino-ctags: defined in recipe-resolver-260408t
;; notesnook-bin: defined in recipe-resolver-260408t
;; jellyfin-desktop-bin: defined in recipe-resolver-260408t
;; libsmb2: defined in recipe-resolver-260408t
;; playit-agent-bin: defined in recipe-resolver-260408t

;; --- recipe-resolver-260408u compat aliases ---
;; (No compat aliases needed - all packages have unique names)

;; --- recipe-resolver-260408v compat aliases ---
;; (No compat aliases needed - all packages have unique names)


;;;
;;; -- recipe-resolver-260408w compat aliases --------------------------
;;;

(define-public graphite-gtk-theme-wallpaper-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-wallpaper-git")))

(define-public graphite-gtk-theme-rimless-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-rimless-normal-git")))

(define-public graphite-gtk-theme-rimless-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-rimless-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-rimless-git")))

(define-public graphite-gtk-theme-rimless-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-rimless-compact-git")))

(define-public graphite-gtk-theme-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-normal-git")))

(define-public graphite-gtk-theme-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-normal-compact-git")))

(define-public graphite-gtk-theme-nord-rimless-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-rimless-normal-git")))

(define-public graphite-gtk-theme-nord-rimless-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-nord-rimless-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-rimless-git")))

(define-public graphite-gtk-theme-nord-rimless-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-rimless-compact-git")))

(define-public graphite-gtk-theme-nord-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-normal-git")))

(define-public graphite-gtk-theme-nord-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-normal-compact-git")))

(define-public graphite-gtk-theme-nord-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-git")))

(define-public graphite-gtk-theme-nord-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-compact-git")))

(define-public graphite-gtk-theme-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-git")))

(define-public graphite-gtk-theme-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-compact-git")))

(define-public graphite-gtk-theme-black-rimless-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-rimless-normal-git")))

(define-public graphite-gtk-theme-black-rimless-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-black-rimless-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-rimless-git")))

(define-public graphite-gtk-theme-black-rimless-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-rimless-compact-git")))

(define-public graphite-gtk-theme-black-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-normal-git")))

(define-public graphite-gtk-theme-black-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-normal-compact-git")))

(define-public graphite-gtk-theme-black-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-git")))

(define-public graphite-gtk-theme-black-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-compact-git")))

(define-public fontpreview-git
  (package
    (inherit fontpreview)
    (name "fontpreview-git")))

; --- recipe-resolver-260408x compat aliases ---

(define-public clipsync-git
  (package
    (inherit clipsync)
    (name "clipsync-git")))

(define-public dmenustatus-git
  (package
    (inherit dmenustatus)
    (name "dmenustatus-git")))

(define-public bridge-core-bin-compat
  (package
    (inherit bridge-core-bin)
    (name "bridge-core-bin")))

(define-public tmodloader-bin-compat
  (package
    (inherit tmodloader-bin)
    (name "tmodloader-bin")))

(define-public music-assistant-desktop-bin-compat
  (package
    (inherit music-assistant-desktop-bin)
    (name "music-assistant-desktop-bin")))

(define-public snapmaker-orca-appimage-compat
  (package
    (inherit snapmaker-orca-appimage)
    (name "snapmaker-orca-appimage")))

(define-public adb-gui-kit-bin-compat
  (package
    (inherit adb-gui-kit-bin)
    (name "adb-gui-kit-bin")))

(define-public xapp-appimage-thumbnailer-compat
  (package
    (inherit xapp-appimage-thumbnailer)
    (name "xapp-appimage-thumbnailer")))

(define-public mev-boost-compat
  (package
    (inherit mev-boost-bin)
    (name "mev-boost")))

(define-public surge-compat
  (package
    (inherit surge-bin)
    (name "surge")))

(define-public konfyt-compat
  (package
    (inherit konfyt)
    (name "konfyt")))

(define-public alix-git
  (package
    (inherit alix)
    (name "alix-git")))

(define-public task-manager-compat
  (package
    (inherit task-manager)
    (name "task-manager")))

; --- deptree-resolver-260412a compat aliases ---
(define-public otf-arundina (package (inherit font-arundina) (name "otf-arundina")))

; --- recipe-resolver-260412b/c compat aliases ---
(define-public waterfox-bin (package (inherit waterfox-bin-pkg) (name "waterfox-bin")))
(define-public offpunk-git (package (inherit offpunk) (name "offpunk-git")))
(define-public brscan5 (package (inherit brscan5-bin) (name "brscan5")))
(define-public megasync (package (inherit megasync-bin) (name "megasync")))
(define-public jdtls (package (inherit jdtls-bin) (name "jdtls")))
(define-public irpf2025 (package (inherit irpf2025-bin) (name "irpf2025")))
(define-public woff2-material-symbols-variable (package (inherit font-material-symbols-variable) (name "woff2-material-symbols-variable")))
(define-public microsoft-identity-broker (package (inherit microsoft-identity-broker-bin) (name "microsoft-identity-broker")))
(define-public hyprshutdown-compat (package (inherit hyprshutdown) (name "hyprshutdown-compat")))
(define-public bitwig-studio (package (inherit bitwig-studio-bin) (name "bitwig-studio")))
(define-public notion-app-electron (package (inherit notion-app-bin) (name "notion-app-electron")))
(define-public nettui (package (inherit nettui-bin) (name "nettui")))
(define-public opentubex (package (inherit opentubex-bin) (name "opentubex")))
(define-public ani2xcursor (package (inherit ani2xcursor-bin) (name "ani2xcursor")))
(define-public crtui (package (inherit crtui-bin) (name "crtui")))
(define-public mdterm (package (inherit mdterm-bin) (name "mdterm")))
(define-public btdu (package (inherit btdu-bin) (name "btdu")))
(define-public openide (package (inherit openide-bin) (name "openide")))
(define-public tsenta-desktop (package (inherit tsenta-desktop-bin) (name "tsenta-desktop")))
(define-public bookokrat (package (inherit bookokrat-bin) (name "bookokrat")))
(define-public terraria-server (package (inherit terraria-server-bin) (name "terraria-server")))
(define-public intune-portal (package (inherit intune-portal-bin) (name "intune-portal")))
(define-public reiserfsprogs (package (inherit reiserfsprogs-pkg) (name "reiserfsprogs")))


; --- recipe-resolver-260413a compat aliases ---

(define-public sshm-bin-compat
  (package
    (inherit sshm)
    (name "sshm-bin")))

(define-public librepods-git
  (package
    (inherit librepods)
    (name "librepods-git")))

(define-public shaka-packager-git
  (package
    (inherit shaka-packager)
    (name "shaka-packager-git")))

(define-public ffmpeg-libfdk_aac
  (package
    (inherit ffmpeg-libfdk-aac)
    (name "ffmpeg-libfdk_aac")))

(define-public astro_modloader
  (package
    (inherit astro-modloader)
    (name "astro_modloader")))

; --- recipe-resolver-260413c compat aliases ---

(define-public tome4-zomnibus_addon
  (package
    (inherit tome4-zomnibus-addon)
    (name "tome4-zomnibus_addon")))

(define-public opentaiko
  (package
    (inherit opentaiko-bin)
    (name "opentaiko")))

(define-public whisper.cpp-vulkan
  (package
    (inherit whisper-cpp-vulkan)
    (name "whisper.cpp-vulkan")))

(define-public rbdoom3-bfg-git
  (package
    (inherit rbdoom3-bfg)
    (name "rbdoom3-bfg-git")))


;;; --- recipe-resolver-260413d compat aliases ---

;;; --- deptree-resolver-260413e compat aliases ---

(define-public plymouth-i_use_arch_btw-git
  (package
    (inherit plymouth-i-use-arch-btw-git)
    (name "plymouth-i_use_arch_btw-git")))

(define-public powerofforreboot.efi
  (package
    (inherit powerofforreboot-efi)
    (name "powerofforreboot.efi")))

(define-public ps_mem
  (package
    (inherit ps-mem)
    (name "ps_mem")))

(define-public ruby-unicode_utils
  (package
    (inherit ruby-unicode-utils)
    (name "ruby-unicode_utils")))

(define-public serve_md
  (package
    (inherit serve-md)
    (name "serve_md")))

(define-public tome4-ashes_of_urhrok
  (package
    (inherit tome4-ashes-of-urhrok)
    (name "tome4-ashes_of_urhrok")))

(define-public tome4-embers_of_rage
  (package
    (inherit tome4-embers-of-rage)
    (name "tome4-embers_of_rage")))

(define-public tome4-forbidden_cults
  (package
    (inherit tome4-forbidden-cults)
    (name "tome4-forbidden_cults")))

; --- deptree-resolver-260413f compat aliases ---
(define-public ttf-arundina (package (inherit font-arundina) (name "ttf-arundina")))
(define-public ttf-inconsolata-hellenic (package (inherit font-inconsolata-hellenic) (name "ttf-inconsolata-hellenic")))


; --- recipe-resolver-260413k compat aliases ---
(define-public pisek-git (package (inherit pisek) (name "pisek-git")))
(define-public wlr-dpms-git (package (inherit wlr-dpms) (name "wlr-dpms-git")))
(define-public wl-gears-git (package (inherit wl-gears) (name "wl-gears-git")))
(define-public xdgctl-git (package (inherit xdgctl) (name "xdgctl-git")))

; --- recipe-resolver-260413l compat aliases ---
(define-public ttf-gelasio-variable (package (inherit font-gelasio) (name "ttf-gelasio-variable")))
(define-public graphite-cursor-theme-git (package (inherit graphite-cursor-theme) (name "graphite-cursor-theme-git")))
(define-public gnome-shell-extension-pop-shell-git (package (inherit gnome-shell-extension-pop-shell) (name "gnome-shell-extension-pop-shell-git")))
(define-public gnome-shell-extension-just-perfection-desktop (package (inherit gnome-shell-extension-just-perfection) (name "gnome-shell-extension-just-perfection-desktop")))


; --- deptree-resolver-260413g compat aliases ---
(define-public bash-fuzzy-clock-git (package (inherit bash-fuzzy-clock) (name "bash-fuzzy-clock-git")))
(define-public arkenfox-user.js-git (package (inherit arkenfox-user.js) (name "arkenfox-user.js-git")))
(define-public unreal-tournament-data-archiveorg (package (inherit unreal-tournament-data) (name "unreal-tournament-data-archiveorg")))
(define-public typing_test (package (inherit typing-test) (name "typing_test")))
(define-public aspire-cli (package (inherit aspire-cli-bin) (name "aspire-cli")))
(define-public plecs-standalone (package (inherit plecs-standalone-bin) (name "plecs-standalone")))
(define-public davinci-resolve-studio (package (inherit davinci-resolve-studio-bin) (name "davinci-resolve-studio")))


; --- recipe-resolver-260413m compat aliases ---
(define-public tetro-tui (package (inherit tetro-tui-bin) (name "tetro-tui")))
(define-public sing-box (package (inherit sing-box-bin) (name "sing-box")))
(define-public qui (package (inherit qui-bin) (name "qui")))
(define-public dwproton (package (inherit dwproton-bin) (name "dwproton")))
(define-public czkawka-gui (package (inherit czkawka-gui-bin) (name "czkawka-gui")))
(define-public min-browser (package (inherit min-browser-bin) (name "min-browser")))
(define-public cinny-desktop (package (inherit cinny-desktop-bin) (name "cinny-desktop")))
(define-public modrinth-app (package (inherit modrinth-app-bin) (name "modrinth-app")))
(define-public modiva-launcher (package (inherit modiva-launcher-bin) (name "modiva-launcher")))
(define-public futhark (package (inherit futhark-bin) (name "futhark")))
(define-public crystal-dock (package (inherit crystal-dock-bin) (name "crystal-dock")))
(define-public universal-android-debloater (package (inherit universal-android-debloater-bin) (name "universal-android-debloater")))
(define-public shgit (package (inherit shgit-bin) (name "shgit")))
(define-public goose-desktop (package (inherit goose-desktop-bin) (name "goose-desktop")))
(define-public pear-desktop (package (inherit pear-desktop-bin) (name "pear-desktop")))
(define-public vdhcoapp (package (inherit vdhcoapp-bin) (name "vdhcoapp")))
(define-public quarto-cli (package (inherit quarto-cli-bin) (name "quarto-cli")))
(define-public pacseek (package (inherit pacseek-bin) (name "pacseek")))
(define-public ckan (package (inherit ckan-bin) (name "ckan")))
(define-public rstudio-desktop (package (inherit rstudio-desktop-bin) (name "rstudio-desktop")))
(define-public xenia-edge (package (inherit xenia-edge-bin) (name "xenia-edge")))
(define-public powerline-go (package (inherit powerline-go-bin) (name "powerline-go")))
(define-public teams-for-linux (package (inherit teams-for-linux-bin) (name "teams-for-linux")))
(define-public forkgram (package (inherit forkgram-bin) (name "forkgram")))
(define-public breitbandmessung (package (inherit breitbandmessung-bin) (name "breitbandmessung")))
(define-public sniptext-bin (package (inherit sniptext) (name "sniptext-bin")))
(define-public marp (package (inherit marp-cli) (name "marp")))
(define-public xfce-winxp-tc (package (inherit xfce-winxp-tc-git) (name "xfce-winxp-tc")))
(define-public libwintc (package (inherit libwintc-git) (name "libwintc")))
(define-public zenmonitor3 (package (inherit zenmonitor3-git) (name "zenmonitor3")))
(define-public twintaillauncher (package (inherit twintaillauncher-git) (name "twintaillauncher")))
(define-public chatterino2 (package (inherit chatterino2-git) (name "chatterino2")))
(define-public ironbar (package (inherit ironbar-git) (name "ironbar")))
(define-public httpdirfs (package (inherit httpdirfs-git) (name "httpdirfs")))
(define-public adwaita-qt5 (package (inherit adwaita-qt5-git) (name "adwaita-qt5")))


; --- recipe-resolver-260413n compat aliases ---
(define-public thorium-browser-avx (package (inherit thorium-browser-avx-bin) (name "thorium-browser-avx")))
(define-public thorium-browser (package (inherit thorium-browser-avx-bin) (name "thorium-browser")))
(define-public devpod-community (package (inherit devpod-community-bin) (name "devpod-community")))
(define-public devpod (package (inherit devpod-community-bin) (name "devpod")))
(define-public phiola (package (inherit phiola-bin) (name "phiola")))
(define-public ionosctl (package (inherit ionosctl-bin) (name "ionosctl")))
(define-public melonds (package (inherit melonds-bin) (name "melonds")))
(define-public keystore-explorer (package (inherit keystore-explorer-bin) (name "keystore-explorer")))
(define-public greenlight (package (inherit greenlight-bin) (name "greenlight")))
(define-public lore-cli (package (inherit lore-cli-bin) (name "lore-cli")))
(define-public tonkeeper (package (inherit tonkeeper-bin) (name "tonkeeper")))
(define-public termide (package (inherit termide-bin) (name "termide")))
(define-public kftui (package (inherit kftui-bin) (name "kftui")))
(define-public fhc (package (inherit fhc-bin) (name "fhc")))
(define-public qo (package (inherit qo-bin) (name "qo")))
(define-public vex-tui (package (inherit vex-tui-bin) (name "vex-tui")))
(define-public ghk (package (inherit ghk-bin) (name "ghk")))
(define-public antares-sql (package (inherit antares-sql-bin) (name "antares-sql")))
(define-public rclone-ui (package (inherit rclone-ui-bin) (name "rclone-ui")))
(define-public godot-beta (package (inherit godot-beta-bin) (name "godot-beta")))
(define-public karing (package (inherit karing-bin) (name "karing")))
(define-public data-peek (package (inherit data-peek-bin) (name "data-peek")))

; --- deptree-resolver-260413h compat aliases ---
(define-public btrfsmaintenance (package (inherit btrfsmaintenance-git) (name "btrfsmaintenance")))
(define-public catppuccin-konsole-colorscheme-frappe (package (inherit catppuccin-konsole-colorscheme-frappe-git) (name "catppuccin-konsole-colorscheme-frappe")))
(define-public catppuccin-konsole-colorscheme-latte (package (inherit catppuccin-konsole-colorscheme-latte-git) (name "catppuccin-konsole-colorscheme-latte")))
(define-public catppuccin-konsole-colorscheme-macchiato (package (inherit catppuccin-konsole-colorscheme-macchiato-git) (name "catppuccin-konsole-colorscheme-macchiato")))
(define-public catppuccin-konsole-colorscheme-mocha (package (inherit catppuccin-konsole-colorscheme-mocha-git) (name "catppuccin-konsole-colorscheme-mocha")))
(define-public cecil (package (inherit cecil-bin) (name "cecil")))
(define-public certradar-cli (package (inherit certradar-cli-bin) (name "certradar-cli")))
(define-public climp (package (inherit climp-bin) (name "climp")))
(define-public cmake-modules-webos (package (inherit cmake-modules-webos-git) (name "cmake-modules-webos")))

; --- recipe-resolver-260413p compat aliases ---
(define-public randompass (package (inherit randompass-bin) (name "randompass")))
(define-public musage (package (inherit musage-bin) (name "musage")))
(define-public dusage (package (inherit dusage-bin) (name "dusage")))
(define-public pipeview (package (inherit pipeview-bin) (name "pipeview")))
(define-public aim (package (inherit aim-bin) (name "aim")))
(define-public kdownload (package (inherit kdownload-bin) (name "kdownload")))
(define-public marmite (package (inherit marmite-bin) (name "marmite")))
(define-public darya (package (inherit darya-bin) (name "darya")))
(define-public wttrbar (package (inherit wttrbar-bin) (name "wttrbar")))
(define-public kaizen (package (inherit kaizen-bin) (name "kaizen")))
(define-public stakpak (package (inherit stakpak-bin) (name "stakpak")))
(define-public primer (package (inherit primer-bin) (name "primer")))
(define-public overskride (package (inherit overskride-bin) (name "overskride")))
(define-public jd-gui (package (inherit jd-gui-bin) (name "jd-gui")))
(define-public mindustry-server (package (inherit mindustry-server-bin) (name "mindustry-server")))
(define-public bashhound (package (inherit bashhound-git) (name "bashhound")))

; --- recipe-resolver-260413r compat aliases ---
(define-public cutieascii (package (inherit cutieascii-bin) (name "cutieascii")))

; --- deptree-resolver-260413i compat aliases ---
(define-public czkawka-cli (package (inherit czkawka-cli-bin) (name "czkawka-cli")))
(define-public deadbranch (package (inherit deadbranch-bin) (name "deadbranch")))
(define-public devbox (package (inherit devbox-bin) (name "devbox")))
(define-public dosbox-pure-unleashed (package (inherit dosbox-pure-unleashed-bin) (name "dosbox-pure-unleashed")))
(define-public dotnet-host (package (inherit dotnet-host-bin) (name "dotnet-host")))
(define-public eden (package (inherit eden-bin) (name "eden")))
(define-public eden-preview (package (inherit eden-preview-bin) (name "eden-preview")))

; --- recipe-resolver-260413s compat aliases ---
(define-public dasel (package (inherit dasel-bin) (name "dasel")))
(define-public jjui (package (inherit jjui-bin) (name "jjui")))
(define-public dust (package (inherit dust-bin) (name "dust")))
(define-public tre-command (package (inherit tre-command-bin) (name "tre-command")))
(define-public dupe-krill (package (inherit dupe-krill-bin) (name "dupe-krill")))

; --- recipe-resolver-260413t lib32 compat aliases ---
(define-public lib32-openjpeg2 (package (inherit openjpeg) (name "lib32-openjpeg2")))
(define-public lib32-zimg (package (inherit zimg) (name "lib32-zimg")))
(define-public lib32-rtmpdump (package (inherit rtmpdump) (name "lib32-rtmpdump")))
(define-public lib32-faad2 (package (inherit faad2) (name "lib32-faad2")))
(define-public lib32-a52dec (package (inherit liba52) (name "lib32-a52dec")))
(define-public lib32-libdvdnav (package (inherit libdvdnav) (name "lib32-libdvdnav")))
(define-public lib32-libdvdread (package (inherit libdvdread) (name "lib32-libdvdread")))
(define-public lib32-libdc1394 (package (inherit libdc1394) (name "lib32-libdc1394")))
(define-public lib32-libdca (package (inherit libdca) (name "lib32-libdca")))
(define-public lib32-x265 (package (inherit x265) (name "lib32-x265")))
(define-public lib32-libsrtp (package (inherit libsrtp) (name "lib32-libsrtp")))
(define-public lib32-neon (package (inherit neon) (name "lib32-neon")))
(define-public lib32-sbc (package (inherit sbc) (name "lib32-sbc")))
(define-public lib32-libde265 (package (inherit libde265) (name "lib32-libde265")))
(define-public lib32-serd (package (inherit serd) (name "lib32-serd")))
(define-public lib32-sord (package (inherit sord) (name "lib32-sord")))
(define-public lib32-libdvdcss (package (inherit libdvdcss) (name "lib32-libdvdcss")))
(define-public lib32-dav1d (package (inherit dav1d) (name "lib32-dav1d")))
(define-public lib32-shaderc (package (inherit shaderc) (name "lib32-shaderc")))
(define-public lib32-libcdio (package (inherit libcdio) (name "lib32-libcdio")))
(define-public lib32-glslang (package (inherit glslang) (name "lib32-glslang")))
(define-public lib32-zix (package (inherit zix) (name "lib32-zix")))
(define-public lib32-bluez-plugins (package (inherit bluez) (name "lib32-bluez-plugins")))
(define-public lib32-libmpcdec (package (inherit libmpcdec) (name "lib32-libmpcdec")))

; --- recipe-resolver-260413t Plymouth theme compat aliases ---
(define-public plymouth-theme-abstract-ring-git (package (inherit plymouth) (name "plymouth-theme-abstract-ring-git")))
(define-public plymouth-theme-abstract-ring-alt-git (package (inherit plymouth) (name "plymouth-theme-abstract-ring-alt-git")))
(define-public plymouth-theme-alienware-git (package (inherit plymouth) (name "plymouth-theme-alienware-git")))
(define-public plymouth-theme-angular-git (package (inherit plymouth) (name "plymouth-theme-angular-git")))
(define-public plymouth-theme-angular-alt-git (package (inherit plymouth) (name "plymouth-theme-angular-alt-git")))
(define-public plymouth-theme-black-hud-git (package (inherit plymouth) (name "plymouth-theme-black-hud-git")))
(define-public plymouth-theme-blockchain-git (package (inherit plymouth) (name "plymouth-theme-blockchain-git")))
(define-public plymouth-theme-circle-git (package (inherit plymouth) (name "plymouth-theme-circle-git")))
(define-public plymouth-theme-circle-alt-git (package (inherit plymouth) (name "plymouth-theme-circle-alt-git")))
(define-public plymouth-theme-circle-flow-git (package (inherit plymouth) (name "plymouth-theme-circle-flow-git")))
(define-public plymouth-theme-circle-hud-git (package (inherit plymouth) (name "plymouth-theme-circle-hud-git")))
(define-public plymouth-theme-circuit-git (package (inherit plymouth) (name "plymouth-theme-circuit-git")))
(define-public plymouth-theme-colorful-git (package (inherit plymouth) (name "plymouth-theme-colorful-git")))
(define-public plymouth-theme-colorful-loop-git (package (inherit plymouth) (name "plymouth-theme-colorful-loop-git")))
(define-public plymouth-theme-colorful-sliced-git (package (inherit plymouth) (name "plymouth-theme-colorful-sliced-git")))
(define-public plymouth-theme-connect-git (package (inherit plymouth) (name "plymouth-theme-connect-git")))
(define-public plymouth-theme-cross-hud-git (package (inherit plymouth) (name "plymouth-theme-cross-hud-git")))
(define-public plymouth-theme-cubes-git (package (inherit plymouth) (name "plymouth-theme-cubes-git")))
(define-public plymouth-theme-cuts-git (package (inherit plymouth) (name "plymouth-theme-cuts-git")))
(define-public plymouth-theme-cuts-alt-git (package (inherit plymouth) (name "plymouth-theme-cuts-alt-git")))

; --- recipe-resolver-260413t additional compat aliases ---
(define-public glew-2.1 (package (inherit glew) (name "glew-2.1")))
(define-public qt5-3d (package (inherit qt3d) (name "qt5-3d")))

; --- deptree-resolver-260413j compat aliases ---
(define-public ente-desktop (package (inherit ente-desktop-bin) (name "ente-desktop")))
(define-public envtrace (package (inherit envtrace-bin) (name "envtrace")))
(define-public eso-addons-manager (package (inherit eso-addons-manager-bin) (name "eso-addons-manager")))
(define-public ethtui (package (inherit ethtui-bin) (name "ethtui")))
(define-public etr (package (inherit etr-bin) (name "etr")))
(define-public exiled-exchange-2 (package (inherit exiled-exchange-2-bin) (name "exiled-exchange-2")))
(define-public fackr (package (inherit fackr-bin) (name "fackr")))
(define-public hunspell-ar (package (inherit hunspell) (name "hunspell-ar")))

; --- deptree-resolver-260413k compat aliases ---
(define-public fastfind (package (inherit fastfind-bin) (name "fastfind")))
(define-public fist (package (inherit fist-bin) (name "fist")))

; --- recipe-resolver-260413z compat aliases ---
(define-public tg-ws-proxy (package (inherit tg-ws-proxy-bin) (name "tg-ws-proxy")))
(define-public tmmpr (package (inherit tmmpr-bin) (name "tmmpr")))
(define-public vtf-thumbnailer (package (inherit vtf-thumbnailer-bin) (name "vtf-thumbnailer")))
(define-public sfxr-qt (package (inherit sfxr-qt-bin) (name "sfxr-qt")))
(define-public savestate (package (inherit savestate-bin) (name "savestate")))
(define-public camunda-modeler (package (inherit camunda-modeler-bin) (name "camunda-modeler")))
(define-public hardbore (package (inherit hardbore-bin) (name "hardbore")))
(define-public uiua (package (inherit uiua-bin) (name "uiua")))
(define-public way-edges (package (inherit way-edges-bin) (name "way-edges")))
(define-public python-textual-fspicker-git (package (inherit python-textual-fspicker) (name "python-textual-fspicker-git")))
(define-public xdg-desktop-portal-termfilechooser-hunkyburrito-git (package (inherit xdg-desktop-portal-termfilechooser-hunkyburrito) (name "xdg-desktop-portal-termfilechooser-hunkyburrito-git")))

; --- recipe-resolver-260413ac compat aliases ---
(define-public labwc-tweaks (package (inherit labwc-tweaks-git) (name "labwc-tweaks")))
(define-public obs-wayland-hotkeys (package (inherit obs-wayland-hotkeys-git) (name "obs-wayland-hotkeys")))
(define-public gcn64tools (package (inherit gcn64tools-git) (name "gcn64tools")))
(define-public whatsit-git (package (inherit whatsit) (name "whatsit-git")))
(define-public ttime-bin (package (inherit ttime) (name "ttime-bin")))
(define-public papis-git (package (inherit papis) (name "papis-git")))

;; --- recipe-resolver-260413ad compat aliases ---
(define-public sublime-text-4 (package (inherit sublime-text-4-bin) (name "sublime-text-4")))
(define-public mullvad-browser (package (inherit mullvad-browser-bin) (name "mullvad-browser")))
(define-public rojo (package (inherit rojo-bin) (name "rojo")))
(define-public perch (package (inherit perch-bin) (name "perch")))
(define-public sherut (package (inherit sherut-bin) (name "sherut")))
(define-public tickit-sync (package (inherit tickit-sync-bin) (name "tickit-sync")))
(define-public mediamtx (package (inherit mediamtx-bin) (name "mediamtx")))
(define-public librespeed-cli (package (inherit librespeed-cli-bin) (name "librespeed-cli")))
(define-public kubecolor (package (inherit kubecolor-bin) (name "kubecolor")))
(define-public petbottle (package (inherit petbottle-bin) (name "petbottle")))
(define-public pyrite64 (package (inherit pyrite64-bin) (name "pyrite64")))
(define-public postman-live (package (inherit postman-live-bin) (name "postman-live")))
(define-public wezterm-nightly (package (inherit wezterm-nightly-bin) (name "wezterm-nightly")))
(define-public tchap-desktop (package (inherit tchap-desktop-bin) (name "tchap-desktop")))
(define-public docker-credential-secretservice (package (inherit docker-credential-secretservice-bin) (name "docker-credential-secretservice")))
(define-public nvi-multibyte-git (package (inherit nvi-multibyte) (name "nvi-multibyte-git")))
(define-public stacer-git (package (inherit stacer) (name "stacer-git")))
(define-public ttf-monocraft-git (package (inherit ttf-monocraft) (name "ttf-monocraft-git")))
;; --- deptree-resolver-260413p compat aliases ---
(define-public lazyjira (package (inherit lazyjira-git) (name "lazyjira")))
(define-public libiff (package (inherit libiff-git) (name "libiff")))
;; --- deptree-resolver-260413q compat aliases ---
(define-public dvdisaster-speed47 (package (inherit dvdisaster-speed47-git) (name "dvdisaster-speed47")))
(define-public locale-en_ru (package (inherit locale-en-ru) (name "locale-en_ru")))
(define-public xr-passthrough-layer (package (inherit xr-passthrough-layer-git) (name "xr-passthrough-layer")))
;; --- recipe-resolver-260413al compat aliases ---
(define-public lianli-linux-git (package (inherit lianli-linux) (name "lianli-linux-git")))
;; --- recipe-resolver-260414b compat aliases ---
(define-public mpc-qt-git (package (inherit mpc-qt) (name "mpc-qt-git")))
(define-public trickle-git (package (inherit trickle) (name "trickle-git")))
(define-public yarr (package (inherit yarr-bin) (name "yarr")))
(define-public ab-download-manager (package (inherit ab-download-manager-bin) (name "ab-download-manager")))
(define-public neovide (package (inherit neovide-bin) (name "neovide")))
(define-public abuse-git (package (inherit abuse) (name "abuse-git")))
(define-public slowrx-git (package (inherit slowrx) (name "slowrx-git")))
(define-public jbofihe-git (package (inherit jbofihe) (name "jbofihe-git")))
(define-public retroforth-git (package (inherit retroforth) (name "retroforth-git")))
;; --- recipe-resolver-260414e compat aliases ---
(define-public uemacs-git (package (inherit uemacs) (name "uemacs-git")))
(define-public spacecadetpinball-git (package (inherit spacecadetpinball) (name "spacecadetpinball-git")))
(define-public wl_shimeji-git (package (inherit wl-shimeji) (name "wl_shimeji-git")))
(define-public libretro-handy-git (package (inherit libretro-handy) (name "libretro-handy-git")))
(define-public scangearmp2-sane-git (package (inherit scangearmp2-sane) (name "scangearmp2-sane-git")))
(define-public icon-git (package (inherit icon-lang) (name "icon-git")))
(define-public runelite (package (inherit runelite-bin) (name "runelite")))
(define-public hmcl (package (inherit hmcl-bin) (name "hmcl")))
(define-public slime-git (package (inherit emacs-slime-git) (name "slime-git")))
(define-public polymc-qt5 (package (inherit polymc-qt5-bin) (name "polymc-qt5")))
;; --- deptree-resolver-260414e compat aliases ---
(define-public hashcc (package (inherit hashcc-git) (name "hashcc")))
(define-public iamb (package (inherit iamb-git) (name "iamb")))
(define-public konfigkoll-dev (package (inherit konfigkoll-git) (name "konfigkoll-dev")))
(define-public oxid (package (inherit oxid-git) (name "oxid")))
(define-public rustfetch (package (inherit rustfetch-git) (name "rustfetch")))
(define-public steamguard-cli (package (inherit steamguard-cli-git) (name "steamguard-cli")))
(define-public gosuki (package (inherit gosuki-git) (name "gosuki")))
(define-public sing-box-ref1nd (package (inherit sing-box-ref1nd-git) (name "sing-box-ref1nd")))
(define-public helix-steel (package (inherit helix-steel-git) (name "helix-steel")))
(define-public llama-cpp-vulkan (package (inherit llama.cpp-vulkan-git) (name "llama-cpp-vulkan")))
(define-public tapi (package (inherit tapi-git) (name "tapi")))
(define-public plasma6-applets-kara (package (inherit plasma6-applets-kara-git) (name "plasma6-applets-kara")))

;; --- recipe-resolver-260414i compat aliases ---
(define-public jump (package (inherit jump-bin) (name "jump")))
(define-public orla (package (inherit orla-bin) (name "orla")))
(define-public feluda (package (inherit feluda-bin) (name "feluda")))
(define-public wasmrun (package (inherit wasmrun-bin) (name "wasmrun")))
(define-public seqtui (package (inherit seqtui-bin) (name "seqtui")))
(define-public clipvault (package (inherit clipvault-bin) (name "clipvault")))
(define-public lact-headless (package (inherit lact-headless-bin) (name "lact-headless")))
(define-public teleport-client (package (inherit teleport-client-bin) (name "teleport-client")))
(define-public jiq-ai (package (inherit jiq-ai-bin) (name "jiq-ai")))
(define-public checkstyle (package (inherit checkstyle-bin) (name "checkstyle")))
(define-public gonic (package (inherit gonic-bin) (name "gonic")))
(define-public skyterm (package (inherit skyterm-bin) (name "skyterm")))
(define-public rtimelog (package (inherit rtimelog-bin) (name "rtimelog")))
(define-public rtimelogger (package (inherit rtimelogger-bin) (name "rtimelogger")))
(define-public needle-cli (package (inherit needle-cli-bin) (name "needle-cli")))
(define-public otf-annotation-mono (package (inherit font-annotation-mono) (name "otf-annotation-mono")))
(define-public ttf-annotation-mono (package (inherit font-annotation-mono) (name "ttf-annotation-mono")))
(define-public ttf-annotation-mono-variable (package (inherit font-annotation-mono) (name "ttf-annotation-mono-variable")))

;; --- deptree-resolver-260414j compat aliases ---
(define-public cherry-studio-electron (package (inherit cherry-studio-electron-bin) (name "cherry-studio-electron")))
(define-public dcli-arch (package (inherit dcli-arch-git) (name "dcli-arch")))
(define-public fcitx5-hazkey (package (inherit fcitx5-hazkey-bin) (name "fcitx5-hazkey")))
(define-public kando (package (inherit kando-bin) (name "kando")))
(define-public mommy (package (inherit mommy-git) (name "mommy")))
(define-public ollama-cuda12 (package (inherit ollama-cuda12-bin) (name "ollama-cuda12")))
(define-public ollama-cuda13 (package (inherit ollama-cuda13-bin) (name "ollama-cuda13")))
(define-public oxmgr (package (inherit oxmgr-bin) (name "oxmgr")))
(define-public pkgstate (package (inherit pkgstate-bin) (name "pkgstate")))
(define-public quickshell-overview (package (inherit quickshell-overview-git) (name "quickshell-overview")))
(define-public sheet (package (inherit sheet-git) (name "sheet")))
(define-public tparted (package (inherit tparted-bin) (name "tparted")))
(define-public ttf-nonicons-bin (package (inherit ttf-nonicons-bin-git) (name "ttf-nonicons-bin")))
(define-public whyis (package (inherit whyis-git) (name "whyis")))
(define-public woff-nonicons-bin (package (inherit woff-nonicons-bin-git) (name "woff-nonicons-bin")))
(define-public xdg-unused-data (package (inherit xdg-unused-data-git) (name "xdg-unused-data")))
(define-public xdman-beta (package (inherit xdman-beta-bin) (name "xdman-beta")))
(define-public xpad-noone (package (inherit xpad-noone-git) (name "xpad-noone")))

;; --- deptree-resolver-260414k compat aliases ---
(define-public xytz (package (inherit xytz-bin) (name "xytz")))
(define-public yubico-authenticator (package (inherit yubico-authenticator-bin) (name "yubico-authenticator")))
(define-public anythingllm-desktop (package (inherit anythingllm-desktop-bin) (name "anythingllm-desktop")))
(define-public asf-ui (package (inherit asf-ui-git) (name "asf-ui")))
(define-public avda (package (inherit avda-bin) (name "avda")))
(define-public casa6 (package (inherit casa6-bin) (name "casa6")))
(define-public chibi-cli (package (inherit chibi-cli-git) (name "chibi-cli")))
(define-public clash-nyanpasu-nightly (package (inherit clash-nyanpasu-nightly-bin) (name "clash-nyanpasu-nightly")))
(define-public customizepkg (package (inherit customizepkg-git) (name "customizepkg")))
(define-public deadbeef-plugin-discord (package (inherit deadbeef-plugin-discord-git) (name "deadbeef-plugin-discord")))
(define-public dingusppc (package (inherit dingusppc-git) (name "dingusppc")))
(define-public dolphin-anty (package (inherit dolphin-anty-bin) (name "dolphin-anty")))

;; --- deptree-resolver-260414l compat aliases ---
(define-public ds360go (package (inherit ds360go-git) (name "ds360go")))
(define-public eclipse-dsl (package (inherit eclipse-dsl-bin) (name "eclipse-dsl")))
(define-public fbpdf (package (inherit fbpdf-git) (name "fbpdf")))
(define-public ftb-app (package (inherit ftb-app-bin) (name "ftb-app")))
(define-public gemini-cli (package (inherit gemini-cli-git) (name "gemini-cli")))
(define-public ginkgocadx (package (inherit ginkgocadx-bin) (name "ginkgocadx")))
(define-public gitversion (package (inherit gitversion-bin) (name "gitversion")))
(define-public go-grip (package (inherit go-grip-git) (name "go-grip")))

;; --- deptree-resolver-260414m compat aliases ---
(define-public jdk8-graalvm-ee (package (inherit jdk8-graalvm-ee-bin) (name "jdk8-graalvm-ee")))
(define-public jdwp-mcp (package (inherit jdwp-mcp-git) (name "jdwp-mcp")))
(define-public joycon (package (inherit joycon-git) (name "joycon")))
(define-public kazumi (package (inherit kazumi-bin) (name "kazumi")))
(define-public libdeep-filter-ladspa (package (inherit libdeep-filter-ladspa-git) (name "libdeep-filter-ladspa")))
(define-public libdf (package (inherit libdf-git) (name "libdf")))
(define-public libilbm (package (inherit libilbm-git) (name "libilbm")))
(define-public libretro-swanstation (package (inherit libretro-swanstation-git) (name "libretro-swanstation")))
(define-public llama-cpp-sycl-f16 (package (inherit llama-cpp-sycl-f16-git) (name "llama-cpp-sycl-f16")))
(define-public logseq-desktop-electron (package (inherit logseq-desktop-electron-bin) (name "logseq-desktop-electron")))
(define-public lsu (package (inherit lsu-git) (name "lsu")))
(define-public misuzu-music (package (inherit misuzu-music-bin) (name "misuzu-music")))
(define-public motoc (package (inherit motoc-git) (name "motoc")))
(define-public nikode (package (inherit nikode-bin) (name "nikode")))
(define-public niri-sidebar (package (inherit niri-sidebar-git) (name "niri-sidebar")))
(define-public nirinit (package (inherit nirinit-git) (name "nirinit")))

;; --- deptree-resolver-260414n compat aliases ---
(define-public obos-genissue (package (inherit obos-genissue-git) (name "obos-genissue")))
(define-public omnom (package (inherit omnom-git) (name "omnom")))
(define-public opera-proxy (package (inherit opera-proxy-git) (name "opera-proxy")))
(define-public packwiz (package (inherit packwiz-git) (name "packwiz")))
(define-public partclone (package (inherit partclone-git) (name "partclone")))
(define-public printnotes (package (inherit printnotes-git) (name "printnotes")))
(define-public python-zoekt-py (package (inherit python-zoekt-py-git) (name "python-zoekt-py")))
(define-public radii5 (package (inherit radii5-bin) (name "radii5")))
(define-public rexit (package (inherit rexit-git) (name "rexit")))
(define-public riftbar (package (inherit riftbar-bin) (name "riftbar")))
(define-public rimsort (package (inherit rimsort-git) (name "rimsort")))
(define-public ruffle-nightly (package (inherit ruffle-nightly-bin) (name "ruffle-nightly")))
(define-public run0-sudo-shim (package (inherit run0-sudo-shim-git) (name "run0-sudo-shim")))
(define-public selectdefaultapplication (package (inherit selectdefaultapplication-git) (name "selectdefaultapplication")))
(define-public shellman (package (inherit shellman-bin) (name "shellman")))
(define-public shiru (package (inherit shiru-git) (name "shiru")))
(define-public sickchill (package (inherit sickchill-git) (name "sickchill")))

;; --- deptree-resolver-260414o compat aliases ---
(define-public pat-aur-client (package (inherit pat-aur-client-git) (name "pat-aur-client")))
(define-public grx (package (inherit grx-bin) (name "grx")))
(define-public hardcode-fixer (package (inherit hardcode-fixer-git) (name "hardcode-fixer")))
(define-public ffbtools (package (inherit ffbtools-git) (name "ffbtools")))
(define-public gvst-vst (package (inherit gvst-vst-bin) (name "gvst-vst")))
(define-public mpv-manager (package (inherit mpv-manager-git) (name "mpv-manager")))
(define-public pidcat-python3 (package (inherit pidcat-python3-git) (name "pidcat-python3")))
(define-public openvpn-update-resolv-conf (package (inherit openvpn-update-resolv-conf-git) (name "openvpn-update-resolv-conf")))
(define-public powerline-fonts (package (inherit powerline-fonts-git) (name "powerline-fonts")))
(define-public sklauncher (package (inherit sklauncher-bin) (name "sklauncher")))
(define-public sle-suite-pro (package (inherit sle-suite-pro-git) (name "sle-suite-pro")))
(define-public smartdeblur (package (inherit smartdeblur-git) (name "smartdeblur")))
(define-public smtk-obs (package (inherit smtk-obs-git) (name "smtk-obs")))
(define-public spacebar-client (package (inherit spacebar-client-git) (name "spacebar-client")))
(define-public stable-diffusion-webui (package (inherit stable-diffusion-webui-git) (name "stable-diffusion-webui")))
(define-public steamdepotdownloadergui (package (inherit steamdepotdownloadergui-bin) (name "steamdepotdownloadergui")))

;; --- recipe-resolver-260414v compat aliases ---
(define-public ngrrram (package (inherit ngrrram-bin) (name "ngrrram")))
(define-public cmdcreate (package (inherit cmdcreate-bin) (name "cmdcreate")))
(define-public udever (package (inherit udever-bin) (name "udever")))
(define-public virt-install (package (inherit virt-install-git) (name "virt-install")))
;; --- recipe-resolver-260414x compat aliases ---
(define-public qbittorrent-enhanced-ua-alias (package (inherit qbittorrent-enhanced-ua) (name "qbittorrent-enhanced-ua-alias")))
(define-public qbittorrent-enhanced-ua-nox-alias (package (inherit qbittorrent-enhanced-ua-nox) (name "qbittorrent-enhanced-ua-nox-alias")))

;; --- deptree-resolver-260414q compat aliases ---
(define-public elephant (package (inherit elephant-bin) (name "elephant")))
(define-public electron-castlab (package (inherit electron-castlab-bin) (name "electron-castlab")))
(define-public ttf-material-symbols-variable (package (inherit ttf-material-symbols-variable-git) (name "ttf-material-symbols-variable")))
(define-public dotnet-targeting-pack-9.0 (package (inherit dotnet-targeting-pack-9.0-bin) (name "dotnet-targeting-pack-9.0")))
(define-public python-pyfakewebcam (package (inherit python-pyfakewebcam-git) (name "python-pyfakewebcam")))
(define-public libastal-gjs (package (inherit libastal-gjs-git) (name "libastal-gjs")))
(define-public python-mediapipe (package (inherit python-mediapipe-bin) (name "python-mediapipe")))
(define-public amdonly-gaming-opencl-rusticl-mesa (package (inherit amdonly-gaming-opencl-rusticl-mesa-git) (name "amdonly-gaming-opencl-rusticl-mesa")))
(define-public amdonly-gaming-mesa (package (inherit amdonly-gaming-mesa-git) (name "amdonly-gaming-mesa")))
(define-public amdonly-gaming-vulkan-radeon (package (inherit amdonly-gaming-vulkan-radeon-git) (name "amdonly-gaming-vulkan-radeon")))
(define-public amdonly-gaming-vulkan-mesa-layers (package (inherit amdonly-gaming-vulkan-mesa-layers-git) (name "amdonly-gaming-vulkan-mesa-layers")))
(define-public qemu-headless (package (inherit qemu-headless-git) (name "qemu-headless")))
(define-public auth0 (package (inherit auth0-bin) (name "auth0")))
(define-public binjr (package (inherit binjr-bin) (name "binjr")))
(define-public binvec (package (inherit binvec-bin) (name "binvec")))

;; --- recipe-resolver-260414y compat aliases ---
(define-public xdg-desktop-portal-minimal (package (inherit xdg-desktop-portal-minimal-git) (name "xdg-desktop-portal-minimal")))
(define-public kdiff3-git-alias (package (inherit kdiff3) (name "kdiff3-git")))

;; --- recipe-resolver-260414z compat aliases ---
(define-public cvs-feature (package (inherit cvs-feature-bin) (name "cvs-feature")))

;; --- deptree-resolver-260414s compat aliases ---
(define-public casa6-pipeline (package (inherit casa6-pipeline-bin) (name "casa6-pipeline")))
(define-public fsp (package (inherit fsp-bin) (name "fsp")))
(define-public mkinitcpio-colors (package (inherit mkinitcpio-colors-git) (name "mkinitcpio-colors")))
(define-public urnetwork-provider (package (inherit urnetwork-provider-git) (name "urnetwork-provider")))
(define-public vapoursynth-plugin-vship-amd (package (inherit vapoursynth-plugin-vship-amd-git) (name "vapoursynth-plugin-vship-amd")))
(define-public vapoursynth-tools-genstubs (package (inherit vapoursynth-tools-genstubs-git) (name "vapoursynth-tools-genstubs")))
(define-public ynote-desktop (package (inherit ynote-desktop-bin) (name "ynote-desktop")))

;; --- deptree-resolver-260414u compat aliases ---
(define-public bcachefs-kernel-dkms (package (inherit bcachefs-kernel-dkms-git) (name "bcachefs-kernel-dkms")))
(define-public ntfsplus-dkms (package (inherit ntfsplus-dkms-git) (name "ntfsplus-dkms")))
(define-public ryzen-smu-dkms (package (inherit ryzen-smu-dkms-git) (name "ryzen-smu-dkms")))
(define-public xpad-dkms (package (inherit xpad-dkms-git) (name "xpad-dkms")))
;; zenpower3-dkms is a real package, not an alias of zenpower3-dkms-git
(define-public zenpower5-dkms (package (inherit zenpower5-dkms-git) (name "zenpower5-dkms")))
(define-public droidcam-dkms (package (inherit droidcam-dkms-git) (name "droidcam-dkms")))
(define-public linux-apfs-rw-dkms (package (inherit linux-apfs-rw-dkms-git) (name "linux-apfs-rw-dkms")))
(define-public nifskope (package (inherit nifskope-git) (name "nifskope")))
(define-public rtw88-dkms (package (inherit rtw88-dkms-git) (name "rtw88-dkms")))
(define-public rtw89-dkms (package (inherit rtw89-dkms-git) (name "rtw89-dkms")))
(define-public v4l2loopback-dkms (package (inherit v4l2loopback-dkms-git) (name "v4l2loopback-dkms")))
;; xone-dkms is a real package, not an alias of xone-dkms-git
(define-public zfs-dkms-staging-compat (package (inherit zfs-dkms-staging-compat-git) (name "zfs-dkms-staging-compat")))
(define-public apifox (package (inherit apifox-appimage) (name "apifox")))
(define-public arch-upgrader (package (inherit arch-upgrader-git) (name "arch-upgrader")))
(define-public archforge (package (inherit archforge-git) (name "archforge")))
(define-public aurvote-utils (package (inherit aurvote-utils-git) (name "aurvote-utils")))
(define-public deepfilternet-demos (package (inherit deepfilternet-demos-git) (name "deepfilternet-demos")))
(define-public dela (package (inherit dela-git) (name "dela")))
(define-public discord-rpc-wine (package (inherit discord-rpc-wine-git) (name "discord-rpc-wine")))
(define-public drawio-live (package (inherit drawio-live-bin) (name "drawio-live")))
(define-public easy-switcher (package (inherit easy-switcher-git) (name "easy-switcher")))
(define-public foobard (package (inherit foobard-git) (name "foobard")))
(define-public freesmlauncher (package (inherit freesmlauncher-bin) (name "freesmlauncher")))
(define-public gj (package (inherit gj-git) (name "gj")))
(define-public gnome-shell-extension-quick-settings-tweaks (package (inherit gnome-shell-extension-quick-settings-tweaks-git) (name "gnome-shell-extension-quick-settings-tweaks")))

;; --- recipe-resolver-260414ae compat aliases ---
;; waterfox already exists as waterfox-bin (line 6316, from recipe-resolver-260412b)
(define-public ksnip-git (package (inherit ksnip-bin) (name "ksnip-git")))
(define-public ksnip (package (inherit ksnip-bin) (name "ksnip")))
(define-public veracrypt-git (package (inherit veracrypt-bin) (name "veracrypt-git")))
(define-public veracrypt (package (inherit veracrypt-bin) (name "veracrypt")))
(define-public hyprshell (package (inherit hyprshell-bin) (name "hyprshell")))
(define-public youtube-dl-gui (package (inherit youtube-dl-gui-bin) (name "youtube-dl-gui")))
(define-public norisk-client-launcher-nvidia (package (inherit norisk-client-launcher-nvidia-bin) (name "norisk-client-launcher-nvidia")))
(define-public ultimate-tic-tac-toe-git (package (inherit ultimate-tic-tac-toe) (name "ultimate-tic-tac-toe-git")))
(define-public plasma-gamemode-git (package (inherit plasma-gamemode) (name "plasma-gamemode-git")))
(define-public deezer-enhanced-git (package (inherit deezer-enhanced-bin) (name "deezer-enhanced-git")))

;; --- deptree-resolver-260414v compat aliases ---
(define-public zenpower3-dkms (package (inherit zenpower3-dkms-git) (name "zenpower3-dkms")))
(define-public hyperheadset (package (inherit hyperheadset-git) (name "hyperheadset")))
(define-public i8086emu (package (inherit i8086emu-git) (name "i8086emu")))
(define-public jivexdv (package (inherit jivexdv-bin) (name "jivexdv")))
(define-public kdotool (package (inherit kdotool-git) (name "kdotool")))
(define-public kraftkit (package (inherit kraftkit-git) (name "kraftkit")))
(define-public ktxutils (package (inherit ktxutils-git) (name "ktxutils")))
(define-public kwin-decoration-sierra-breeze-enhanced (package (inherit kwin-decoration-sierra-breeze-enhanced-git) (name "kwin-decoration-sierra-breeze-enhanced")))
(define-public lceda-pro (package (inherit lceda-pro-bin) (name "lceda-pro")))
(define-public legcord (package (inherit legcord-git) (name "legcord")))
(define-public loliashizuku (package (inherit loliashizuku-bin) (name "loliashizuku")))
(define-public lovr-playspace (package (inherit lovr-playspace-git) (name "lovr-playspace")))
(define-public lxqt-panel-tool (package (inherit lxqt-panel-tool-git) (name "lxqt-panel-tool")))
(define-public majsoul-plus (package (inherit majsoul-plus-bin) (name "majsoul-plus")))
(define-public miraclecast (package (inherit miraclecast-git) (name "miraclecast")))
(define-public myxer (package (inherit myxer-git) (name "myxer")))
(define-public nanoclaw (package (inherit nanoclaw-git) (name "nanoclaw")))
(define-public ncmpcpp-album-cover (package (inherit ncmpcpp-album-cover-git) (name "ncmpcpp-album-cover")))
(define-public nexusmods-app (package (inherit nexusmods-app-bin) (name "nexusmods-app")))
(define-public niri-settings (package (inherit niri-settings-git) (name "niri-settings")))
(define-public ollama-vulkan (package (inherit ollama-vulkan-bin) (name "ollama-vulkan")))
(define-public openscq30-gui (package (inherit openscq30-gui-bin) (name "openscq30-gui")))
(define-public osu-lazer-tachyon (package (inherit osu-lazer-tachyon-bin) (name "osu-lazer-tachyon")))

;; --- recipe-resolver-260415a compat aliases ---
(define-public xmousepasteblock (package (inherit xmousepasteblock-git) (name "xmousepasteblock")))
(define-public wallchemy (package (inherit wallchemy-bin) (name "wallchemy")))
(define-public jdk25-graalvm (package (inherit jdk25-graalvm-bin) (name "jdk25-graalvm")))

;; --- deptree-resolver-260415b compat aliases ---
(define-public opentubex (package (inherit opentubex-git) (name "opentubex")))
(define-public pmt (package (inherit pmt-git) (name "pmt")))
(define-public procreate-thumbnailer (package (inherit procreate-thumbnailer-git) (name "procreate-thumbnailer")))
(define-public qqmusic (package (inherit qqmusic-bin) (name "qqmusic")))
(define-public radarr (package (inherit radarr-bin) (name "radarr")))
(define-public rdrview (package (inherit rdrview-git) (name "rdrview")))
(define-public requestly (package (inherit requestly-bin) (name "requestly")))
(define-public river-bedload (package (inherit river-bedload-git) (name "river-bedload")))
(define-public rotki (package (inherit rotki-bin) (name "rotki")))
(define-public rtl8821ce-dkms (package (inherit rtl8821ce-dkms-git) (name "rtl8821ce-dkms")))
(define-public rustwhy (package (inherit rustwhy-git) (name "rustwhy")))
(define-public samrewritten (package (inherit samrewritten-git) (name "samrewritten")))
(define-public sickrage (package (inherit sickrage-git) (name "sickrage")))
(define-public spflashtool5 (package (inherit spflashtool5-bin) (name "spflashtool5")))
(define-public steamvr-linux-fixes-layer (package (inherit steamvr-linux-fixes-layer-git) (name "steamvr-linux-fixes-layer")))
(define-public syncovery (package (inherit syncovery-bin) (name "syncovery")))
(define-public systemd-cron-next (package (inherit systemd-cron-next-git) (name "systemd-cron-next")))
(define-public tlp-rdw (package (inherit tlp-rdw-git) (name "tlp-rdw")))
(define-public tribler (package (inherit tribler-bin) (name "tribler")))
(define-public upscayl (package (inherit upscayl-appimage) (name "upscayl")))
(define-public uptater (package (inherit uptater-bin) (name "uptater")))
(define-public waveloggate (package (inherit waveloggate-git) (name "waveloggate")))

;; --- recipe-resolver-260415b compat aliases ---
(define-public rofi-gpaste (package (inherit rofi-gpaste-git) (name "rofi-gpaste")))
(define-public pwmenu (package (inherit pwmenu-git) (name "pwmenu")))
(define-public oxicord (package (inherit oxicord-git) (name "oxicord")))
(define-public aeroshell-smod (package (inherit aeroshell-smod-git) (name "aeroshell-smod")))
(define-public aeroshell-smodglow-x11 (package (inherit aeroshell-smodglow-x11-git) (name "aeroshell-smodglow-x11")))
(define-public plasma6-wallpapers-smart-video-wallpaper-reborn (package (inherit plasma6-wallpapers-smart-video-wallpaper-reborn-git) (name "plasma6-wallpapers-smart-video-wallpaper-reborn")))
(define-public linux-firmware-qlogic (package (inherit linux-firmware-qlogic-git) (name "linux-firmware-qlogic")))
(define-public linux-firmware-bnx2x (package (inherit linux-firmware-bnx2x-git) (name "linux-firmware-bnx2x")))
(define-public aeolus-next-vst3 (package (inherit aeolus-next-vst3-bin) (name "aeolus-next-vst3")))

;; --- recipe-resolver-260415c compat aliases ---
(define-public gnome-shell-extension-big-avatar (package (inherit gnome-shell-extension-big-avatar-git) (name "gnome-shell-extension-big-avatar")))
(define-public gnome-shell-extension-asdbctl-slider (package (inherit gnome-shell-extension-asdbctl-slider-git) (name "gnome-shell-extension-asdbctl-slider")))
(define-public freetok-cpp (package (inherit freetok-cpp-git) (name "freetok-cpp")))
(define-public exif-cleaner-gui (package (inherit exif-cleaner-gui-bin) (name "exif-cleaner-gui")))
(define-public desktop-creator (package (inherit desktop-creator-git) (name "desktop-creator")))
(define-public deepin-sound-theme (package (inherit deepin-sound-theme-git) (name "deepin-sound-theme")))
(define-public libsai (package (inherit libsai-git) (name "libsai")))
(define-public textmerger (package (inherit textmerger-bin) (name "textmerger")))
(define-public php-box (package (inherit php-box-bin) (name "php-box")))
(define-public kubetail (package (inherit kubetail-bin) (name "kubetail")))
(define-public shai (package (inherit shai-bin) (name "shai")))
(define-public rssnix (package (inherit rssnix-bin) (name "rssnix")))
(define-public libplib (package (inherit libplib-bin) (name "libplib")))
(define-public speed-dreams-data (package (inherit speed-dreams-data-bin) (name "speed-dreams-data")))
(define-public gtk-engine-bluecurve (package (inherit gtk-engine-bluecurve-git) (name "gtk-engine-bluecurve")))
(define-public bluecurve-wallpapers (package (inherit bluecurve-wallpapers-git) (name "bluecurve-wallpapers")))
(define-public bluecurve-icon-theme (package (inherit bluecurve-icon-theme-git) (name "bluecurve-icon-theme")))
(define-public bluecurve-gtk-theme (package (inherit bluecurve-gtk-theme-git) (name "bluecurve-gtk-theme")))
(define-public psutilsql (package (inherit psutilsql-bin) (name "psutilsql")))
(define-public mdtsql (package (inherit mdtsql-bin) (name "mdtsql")))
(define-public picguard-pro (package (inherit picguard-pro-bin) (name "picguard-pro")))
(define-public liberica-nik-25-full (package (inherit liberica-nik-25-full-bin) (name "liberica-nik-25-full")))
(define-public picguard (package (inherit picguard-bin) (name "picguard")))
(define-public kyverno-chainsaw (package (inherit kyverno-chainsaw-bin) (name "kyverno-chainsaw")))
(define-public ovcs (package (inherit ovcs-bin) (name "ovcs")))
(define-public btrfs-data-recovery (package (inherit btrfs-data-recovery-git) (name "btrfs-data-recovery")))
(define-public kubepug (package (inherit kubepug-bin) (name "kubepug")))
(define-public kubent (package (inherit kubent-bin) (name "kubent")))
(define-public dyff (package (inherit dyff-bin) (name "dyff")))
(define-public gman (package (inherit gman-bin) (name "gman")))
(define-public scramblery (package (inherit scramblery-bin) (name "scramblery")))
(define-public uni-sync (package (inherit uni-sync-bin) (name "uni-sync")))
(define-public hmcl-pr (package (inherit hmcl-pr-bin) (name "hmcl-pr")))
(define-public hdiffpatch (package (inherit hdiffpatch-bin) (name "hdiffpatch")))
(define-public moon (package (inherit moon-bin) (name "moon")))
(define-public rtl-sdr-librtlsdr (package (inherit rtl-sdr-librtlsdr-git) (name "rtl-sdr-librtlsdr")))

;; --- recipe-resolver-260415d compat aliases ---
(define-public scolorpicker (package (inherit scolorpicker-legacy) (name "scolorpicker")))
(define-public srtodo (package (inherit srtodo-git) (name "srtodo")))
(define-public ntfsprogs-plus (package (inherit ntfsprogs-plus-git) (name "ntfsprogs-plus")))
(define-public btrfs-desktop-notification (package (inherit btrfs-desktop-notification-git) (name "btrfs-desktop-notification")))
(define-public plymouth-theme-mikuboot (package (inherit plymouth-theme-mikuboot-git) (name "plymouth-theme-mikuboot")))

;; --- deptree-resolver-260415c compat aliases ---
(define-public e2-studio (package (inherit e2-studio-bin) (name "e2-studio")))
(define-public alice-ai-app (package (inherit alice-ai-app-bin) (name "alice-ai-app")))
(define-public gv-usb2-driver-dkms (package (inherit gv-usb2-driver-dkms-git) (name "gv-usb2-driver-dkms")))
(define-public mangabox (package (inherit mangabox-bin) (name "mangabox")))
(define-public fafarunner (package (inherit fafarunner-bin) (name "fafarunner")))
(define-public vitasdk-packages (package (inherit vitasdk-packages-git) (name "vitasdk-packages")))
(define-public pmt (package (inherit pmt-git) (name "pmt")))
(define-public samrewritten (package (inherit samrewritten-git) (name "samrewritten")))
(define-public sickrage (package (inherit sickrage-git) (name "sickrage")))
(define-public wayvibes (package (inherit wayvibes-git) (name "wayvibes")))
(define-public winamax (package (inherit winamax-bin) (name "winamax")))
(define-public zeptofetch (package (inherit zeptofetch-git) (name "zeptofetch")))
(define-public archstatus (package (inherit archstatus-git) (name "archstatus")))
(define-public aur-auto-vote (package (inherit aur-auto-vote-git) (name "aur-auto-vote")))
(define-public baidunetdisk (package (inherit baidunetdisk-bin) (name "baidunetdisk")))
(define-public basedpyright (package (inherit basedpyright-git) (name "basedpyright")))
(define-public binfetch (package (inherit binfetch-git) (name "binfetch")))
(define-public brave-beta (package (inherit brave-beta-bin) (name "brave-beta")))
(define-public cat-browser (package (inherit cat-browser-git) (name "cat-browser")))
(define-public catnap (package (inherit catnap-git) (name "catnap")))
(define-public dms-shell (package (inherit dms-shell-git) (name "dms-shell")))
(define-public dnspyex-wine (package (inherit dnspyex-wine-bin) (name "dnspyex-wine")))
(define-public dumber-browser (package (inherit dumber-browser-git) (name "dumber-browser")))

;; --- recipe-resolver-260415f compat aliases ---
(define-public pantheon-dock-git (package (inherit pantheon-dock) (name "pantheon-dock-git")))

;; --- recipe-resolver-260415g compat aliases ---
(define-public krokiet (package (inherit krokiet-bin) (name "krokiet")))
(define-public orca-slicer (package (inherit orca-slicer-bin) (name "orca-slicer")))
(define-public dxvk-mingw (package (inherit dxvk-bin) (name "dxvk-mingw")))
(define-public vicinae (package (inherit vicinae-bin) (name "vicinae")))
(define-public spacefm (package (inherit spacefm-thermitegod) (name "spacefm")))

;; --- deptree-resolver-260415h compat aliases ---
(define-public sickrage (package (inherit sickrage-git) (name "sickrage")))
(define-public dms-shell (package (inherit dms-shell-git) (name "dms-shell")))
(define-public dnspyex-wine (package (inherit dnspyex-wine-bin) (name "dnspyex-wine")))
(define-public gnome-shell-extension-pano (package (inherit gnome-shell-extension-pano-git) (name "gnome-shell-extension-pano")))
(define-public lib32-python311 (package (inherit lib32-python311-bin) (name "lib32-python311")))
(define-public obsidianospm (package (inherit obsidianospm-git) (name "obsidianospm")))
(define-public onedrivegui (package (inherit onedrivegui-git) (name "onedrivegui")))
(define-public openrgb-plugin-effects (package (inherit openrgb-plugin-effects-git) (name "openrgb-plugin-effects")))
(define-public osuboot (package (inherit osuboot-git) (name "osuboot")))
(define-public pear-desktop (package (inherit pear-desktop-git) (name "pear-desktop")))
(define-public rime-frost (package (inherit rime-frost-git) (name "rime-frost")))
(define-public rmpc-auto-theme (package (inherit rmpc-auto-theme-git) (name "rmpc-auto-theme")))
(define-public rofi-polkit-agent (package (inherit rofi-polkit-agent-git) (name "rofi-polkit-agent")))
(define-public rtl8852au-dkms (package (inherit rtl8852au-dkms-git) (name "rtl8852au-dkms")))
(define-public scrollmpris (package (inherit scrollmpris-git) (name "scrollmpris")))
(define-public sonusmix (package (inherit sonusmix-git) (name "sonusmix")))
(define-public soteria (package (inherit soteria-git) (name "soteria")))
(define-public spacebar (package (inherit spacebar-git) (name "spacebar")))
(define-public spotatui (package (inherit spotatui-git) (name "spotatui")))
(define-public thcrap-steam-proton-wrapper (package (inherit thcrap-steam-proton-wrapper-git) (name "thcrap-steam-proton-wrapper")))
(define-public udev-browse (package (inherit udev-browse-git) (name "udev-browse")))
(define-public unreal-tournament (package (inherit unreal-tournament-bin) (name "unreal-tournament")))
(define-public waydroid-launcher (package (inherit waydroid-launcher-git) (name "waydroid-launcher")))
(define-public wiznoteplus (package (inherit wiznoteplus-bin) (name "wiznoteplus")))
(define-public xavs2 (package (inherit xavs2-git) (name "xavs2")))
(define-public youtube-chat-rs (package (inherit youtube-chat-rs-git) (name "youtube-chat-rs")))

;; --- recipe-resolver-260415h compat aliases ---
(define-public proto (package (inherit proto-bin) (name "proto")))
(define-public qbittorrent-enhanced-nox (package (inherit qbittorrent-enhanced-nox-bin) (name "qbittorrent-enhanced-nox")))
(define-public yacreader-poppler (package (inherit yacreader) (name "yacreader-poppler")))
(define-public glaxnimate-git (package (inherit glaxnimate) (name "glaxnimate-git")))

;; --- recipe-resolver-260415i compat aliases ---

(define-public grayjay-bin
  (package
    (inherit grayjay)
    (name "grayjay-bin")))






(define-public webkit2gtk
  (package
    (inherit webkitgtk)
    (name "webkit2gtk")))

(define-public webkit2gtk-docs
  (package
    (inherit webkitgtk)
    (name "webkit2gtk-docs")))

(define-public qt5-sensors
  (package
    (inherit qtsensors)
    (name "qt5-sensors")))

;; --- deptree-resolver-260415i compat aliases ---
(define-public dotnet-targeting-pack-8-0 (package (inherit dotnet-targeting-pack-8-0-bin) (name "dotnet-targeting-pack-8-0")))
(define-public dotnet-runtime-8-0 (package (inherit dotnet-runtime-8-0-bin) (name "dotnet-runtime-8-0")))
(define-public vim-classic-runtime (package (inherit vim-classic-runtime-git) (name "vim-classic-runtime")))
(define-public beaver-notes (package (inherit beaver-notes-bin) (name "beaver-notes")))
(define-public crunchycleaner (package (inherit crunchycleaner-bin) (name "crunchycleaner")))
(define-public gram (package (inherit gram-bin) (name "gram")))
(define-public illogical-impulse-bibata-modern-classic (package (inherit illogical-impulse-bibata-modern-classic-bin) (name "illogical-impulse-bibata-modern-classic")))
(define-public nitro (package (inherit nitro-bin) (name "nitro")))
(define-public smap (package (inherit smap-bin) (name "smap")))
(define-public virtualhere-server (package (inherit virtualhere-server-bin) (name "virtualhere-server")))
(define-public lean-ctx (package (inherit lean-ctx-bin) (name "lean-ctx")))
(define-public znote (package (inherit znote-bin) (name "znote")))
(define-public ddrescueview (package (inherit ddrescueview-bin) (name "ddrescueview")))
(define-public arctic-comfyui-helper (package (inherit arctic-comfyui-helper-bin) (name "arctic-comfyui-helper")))
(define-public electron25 (package (inherit electron25-bin) (name "electron25")))
(define-public implay (package (inherit implay-bin) (name "implay")))
(define-public piebald (package (inherit piebald-bin) (name "piebald")))
(define-public insomnia (package (inherit insomnia-bin) (name "insomnia")))
(define-public proton-meet (package (inherit proton-meet-bin) (name "proton-meet")))
(define-public spflashtool (package (inherit spflashtool-bin) (name "spflashtool")))
(define-public anytype-electron (package (inherit anytype-electron-bin) (name "anytype-electron")))
(define-public brave-origin-nightly (package (inherit brave-origin-nightly-bin) (name "brave-origin-nightly")))
(define-public lib32-python311 (package (inherit lib32-python311-bin) (name "lib32-python311")))
(define-public todesk (package (inherit todesk-bin) (name "todesk")))
(define-public unreal-tournament (package (inherit unreal-tournament-bin) (name "unreal-tournament")))
(define-public wgtunnel (package (inherit wgtunnel-bin) (name "wgtunnel")))
(define-public aggregate6 (package (inherit aggregate6-git) (name "aggregate6")))
(define-public astraeditor (package (inherit astraeditor-bin) (name "astraeditor")))
(define-public astral (package (inherit astral-bin) (name "astral")))
(define-public buildcache (package (inherit buildcache-git) (name "buildcache")))
(define-public bzmenu (package (inherit bzmenu-git) (name "bzmenu")))
(define-public chromium-snapshot (package (inherit chromium-snapshot-bin) (name "chromium-snapshot")))
(define-public classicube (package (inherit classicube-bin) (name "classicube")))
(define-public deadbeef-plugin-gui-qt6 (package (inherit deadbeef-plugin-gui-qt6-git) (name "deadbeef-plugin-gui-qt6")))
(define-public dooble (package (inherit dooble-git) (name "dooble")))
(define-public fahcontrol-gtk3 (package (inherit fahcontrol-gtk3-git) (name "fahcontrol-gtk3")))
(define-public firefox-nightly (package (inherit firefox-nightly-bin) (name "firefox-nightly")))
(define-public gopeed (package (inherit gopeed-bin) (name "gopeed")))
(define-public grumpy-irc (package (inherit grumpy-irc-git) (name "grumpy-irc")))
(define-public hyprsysteminfo (package (inherit hyprsysteminfo-git) (name "hyprsysteminfo")))
(define-public ibus-lotus (package (inherit ibus-lotus-git) (name "ibus-lotus")))
(define-public ironclad-rivet (package (inherit ironclad-rivet-bin) (name "ironclad-rivet")))
(define-public java-openjfx (package (inherit java-openjfx-bin) (name "java-openjfx")))
(define-public jbig2enc (package (inherit jbig2enc-git) (name "jbig2enc")))
(define-public krunner-spotify-enhanced (package (inherit krunner-spotify-enhanced-git) (name "krunner-spotify-enhanced")))
(define-public lektra (package (inherit lektra-git) (name "lektra")))

;; --- deptree-resolver-260415j compat aliases ---
(define-public aspnet-runtime-8-0 (package (inherit aspnet-runtime-8-0-bin) (name "aspnet-runtime-8-0")))
(define-public aspnet-targeting-pack-8-0 (package (inherit aspnet-targeting-pack-8-0-bin) (name "aspnet-targeting-pack-8-0")))
(define-public dotnet-sdk-8-0 (package (inherit dotnet-sdk-8-0-bin) (name "dotnet-sdk-8-0")))
(define-public ncgopher (package (inherit ncgopher-git) (name "ncgopher")))
(define-public neovim-qt (package (inherit neovim-qt-git) (name "neovim-qt")))
(define-public odin (package (inherit odin-git) (name "odin")))
(define-public opentabletdriver (package (inherit opentabletdriver-git) (name "opentabletdriver")))
(define-public oxicord (package (inherit oxicord-git) (name "oxicord")))
(define-public pam-python (package (inherit pam-python-git) (name "pam-python")))
(define-public pane-fm (package (inherit pane-fm-git) (name "pane-fm")))
(define-public phonon-qt6-mpv (package (inherit phonon-qt6-mpv-git) (name "phonon-qt6-mpv")))
(define-public pixelterm-c (package (inherit pixelterm-c-bin) (name "pixelterm-c")))
(define-public plasma6-wallpapers-smart-video-wallpaper-reborn (package (inherit plasma6-wallpapers-smart-video-wallpaper-reborn-git) (name "plasma6-wallpapers-smart-video-wallpaper-reborn")))
(define-public projectm-presets-classic (package (inherit projectm-presets-classic-git) (name "projectm-presets-classic")))
(define-public pulsecontrol (package (inherit pulsecontrol-git) (name "pulsecontrol")))
(define-public purple-gowhatsapp (package (inherit purple-gowhatsapp-git) (name "purple-gowhatsapp")))
(define-public pwmenu (package (inherit pwmenu-git) (name "pwmenu")))
(define-public python-wassima (package (inherit python-wassima-git) (name "python-wassima")))
(define-public quirc (package (inherit quirc-git) (name "quirc")))
(define-public ryujinx (package (inherit ryujinx-git) (name "ryujinx")))
(define-public scuisei (package (inherit scuisei-git) (name "scuisei")))
(define-public sdrpp-tetra-demodulator (package (inherit sdrpp-tetra-demodulator-git) (name "sdrpp-tetra-demodulator")))
(define-public speedynote (package (inherit speedynote-bin) (name "speedynote")))
(define-public steamfetch (package (inherit steamfetch-git) (name "steamfetch")))
(define-public supermario64-sm64ex (package (inherit supermario64-sm64ex-git) (name "supermario64-sm64ex")))
(define-public swaystatus (package (inherit swaystatus-git) (name "swaystatus")))
(define-public sysd-manager (package (inherit sysd-manager-git) (name "sysd-manager")))
(define-public terabox (package (inherit terabox-bin) (name "terabox")))
(define-public thorium-reader (package (inherit thorium-reader-bin) (name "thorium-reader")))
(define-public tidal-hifi (package (inherit tidal-hifi-git) (name "tidal-hifi")))


;; deptree-resolver-260415k compat aliases
(define-public airvpn-suite (package (inherit airvpn-suite-bin) (name "airvpn-suite")))
(define-public altserver-linux (package (inherit altserver-linux-bin) (name "altserver-linux")))
(define-public attempt (package (inherit attempt-git) (name "attempt")))
(define-public backhand (package (inherit backhand-bin) (name "backhand")))
(define-public bitcoin-cli (package (inherit bitcoin-cli-bin) (name "bitcoin-cli")))
(define-public bitcoin-daemon (package (inherit bitcoin-daemon-bin) (name "bitcoin-daemon")))
(define-public bitcoin-qt (package (inherit bitcoin-qt-bin) (name "bitcoin-qt")))
(define-public bitcoin-tx (package (inherit bitcoin-tx-bin) (name "bitcoin-tx")))
(define-public bitcoin-util (package (inherit bitcoin-util-bin) (name "bitcoin-util")))
(define-public bitcoin-wallet (package (inherit bitcoin-wallet-bin) (name "bitcoin-wallet")))
(define-public ccline (package (inherit ccline-bin) (name "ccline")))
(define-public chadtop (package (inherit chadtop-bin) (name "chadtop")))
(define-public chamber (package (inherit chamber-bin) (name "chamber")))
(define-public cruise (package (inherit cruise-bin) (name "cruise")))
(define-public datacmd (package (inherit datacmd-bin) (name "datacmd")))
(define-public dave-gnukem (package (inherit dave-gnukem-git) (name "dave-gnukem")))
(define-public dtop (package (inherit dtop-bin) (name "dtop")))
(define-public elevate (package (inherit elevate-git) (name "elevate")))
(define-public envx (package (inherit envx-bin) (name "envx")))
(define-public fauxdacious (package (inherit fauxdacious-git) (name "fauxdacious")))
(define-public fjira (package (inherit fjira-bin) (name "fjira")))
(define-public foot-terminfo (package (inherit foot-terminfo-git) (name "foot-terminfo")))
(define-public fzfs (package (inherit fzfs-git) (name "fzfs")))
(define-public ghost-dl (package (inherit ghost-dl-bin) (name "ghost-dl")))
(define-public ghost-dl (package (inherit ghost-dl-git) (name "ghost-dl")))
(define-public go-dsp-guitar (package (inherit go-dsp-guitar-bin) (name "go-dsp-guitar")))
(define-public gospider (package (inherit gospider-bin) (name "gospider")))
(define-public gtl (package (inherit gtl-bin) (name "gtl")))
(define-public hell (package (inherit hell-bin) (name "hell")))
(define-public hostapd-mana (package (inherit hostapd-mana-git) (name "hostapd-mana")))
(define-public jugglinglab (package (inherit jugglinglab-git) (name "jugglinglab")))
(define-public justdd (package (inherit justdd-bin) (name "justdd")))
(define-public krunner-steam (package (inherit krunner-steam-git) (name "krunner-steam")))
(define-public libobsidianos-overlays (package (inherit libobsidianos-overlays-git) (name "libobsidianos-overlays")))
(define-public logu (package (inherit logu-bin) (name "logu")))
(define-public nowaymouse (package (inherit nowaymouse-git) (name "nowaymouse")))
(define-public pycmd (package (inherit pycmd-bin) (name "pycmd")))
(define-public python-tree-sitter-languages (package (inherit python-tree-sitter-languages-bin) (name "python-tree-sitter-languages")))
(define-public refind-theme-refind2k (package (inherit refind-theme-refind2k-git) (name "refind-theme-refind2k")))
(define-public rofi-blocks (package (inherit rofi-blocks-git) (name "rofi-blocks")))
(define-public tageditor (package (inherit tageditor-bin) (name "tageditor")))
(define-public tape (package (inherit tape-bin) (name "tape")))
(define-public tash (package (inherit tash-bin) (name "tash")))
(define-public theattyr (package (inherit theattyr-bin) (name "theattyr")))
(define-public traefiktop (package (inherit traefiktop-bin) (name "traefiktop")))
(define-public victorialogs (package (inherit victorialogs-bin) (name "victorialogs")))
(define-public visualvault (package (inherit visualvault-bin) (name "visualvault")))
(define-public wolvenkit-cli (package (inherit wolvenkit-cli-bin) (name "wolvenkit-cli")))
(define-public zerus (package (inherit zerus-bin) (name "zerus")))

;; deptree-resolver-260415l compat aliases
(define-public bar-lobby (package (inherit bar-lobby-git) (name "bar-lobby")))
(define-public cqrlog (package (inherit cqrlog-git) (name "cqrlog")))
(define-public cupola (package (inherit cupola-git) (name "cupola")))
(define-public dotnet-sdk-preview (package (inherit dotnet-sdk-preview-bin) (name "dotnet-sdk-preview")))
(define-public duckstation-preview-latest (package (inherit duckstation-preview-latest-bin) (name "duckstation-preview-latest")))
(define-public efibooteditor (package (inherit efibooteditor-bin) (name "efibooteditor")))
(define-public fcitx5-im-emoji-picker (package (inherit fcitx5-im-emoji-picker-git) (name "fcitx5-im-emoji-picker")))
(define-public gd-tools (package (inherit gd-tools-git) (name "gd-tools")))
(define-public glide-browser (package (inherit glide-browser-bin) (name "glide-browser")))
(define-public hyprquickframe (package (inherit hyprquickframe-git) (name "hyprquickframe")))
(define-public ibus-im-emoji-picker (package (inherit ibus-im-emoji-picker-git) (name "ibus-im-emoji-picker")))
(define-public tlescope (package (inherit tlescope-git) (name "tlescope")))
(define-public tlp-pd (package (inherit tlp-pd-git) (name "tlp-pd")))
(define-public tosu (package (inherit tosu-git) (name "tosu")))
(define-public uswsusp (package (inherit uswsusp-git) (name "uswsusp")))
(define-public vesktop (package (inherit vesktop-git) (name "vesktop")))
(define-public warp-terminal (package (inherit warp-terminal-bin) (name "warp-terminal")))
(define-public wpscan (package (inherit wpscan-git) (name "wpscan")))
(define-public xunlei (package (inherit xunlei-bin) (name "xunlei")))

;; --- recipe-resolver-260415l compat aliases ---
(define-public aaaaxy (package (inherit aaaaxy-bin) (name "aaaaxy")))

;; --- recipe-resolver-260415m compat aliases ---
(define-public vim-classic-git (package (inherit vim-classic) (name "vim-classic-git")))
(define-public gvim-classic-git (package (inherit gvim-classic) (name "gvim-classic-git")))
(define-public viu-media-git (package (inherit viu-media) (name "viu-media-git")))

;; --- recipe-resolver-260415n compat aliases ---
(define-public rustconn (package (inherit rustconn-bin) (name "rustconn")))
(define-public uzdoom (package (inherit uzdoom-bin) (name "uzdoom")))
(define-public polymc-qt5-git (package (inherit polymc-bin) (name "polymc-qt5-git")))
(define-public polymc (package (inherit polymc-bin) (name "polymc")))
(define-public slippi-mainline (package (inherit slippi-mainline-bin) (name "slippi-mainline")))
(define-public libretro-azahar-git (package (inherit libretro-azahar-core-bin) (name "libretro-azahar-git")))
(define-public libretro-azahar (package (inherit libretro-azahar-core-bin) (name "libretro-azahar")))


;; deptree-resolver-260415t compat aliases
(define-public python-wa-crypt-tools-git/compat python-wa-crypt-tools-git)
(define-public equicord/compat equicord)
(define-public equicord-openasar/compat equicord-openasar)
(define-public esp-idf/compat esp-idf)
(define-public fastflowlm-git/compat fastflowlm-git)
(define-public firedragon-bin/compat firedragon-bin)
(define-public firefox-extension-credentialsd/compat firefox-extension-credentialsd)
(define-public ghostship/compat ghostship)
(define-public gr-fosphor-git/compat gr-fosphor-git)
(define-public gradle8-doc/compat gradle8-doc)
(define-public gradle8-src/compat gradle8-src)
(define-public gyroflow-bin/compat gyroflow-bin)
(define-public iloader-bin/compat iloader-bin)
(define-public karakeep/compat karakeep)
(define-public karp-git/compat karp-git)
(define-public koodo-reader-bin/compat koodo-reader-bin)
(define-public lectern-git/compat lectern-git)
(define-public lieer-git/compat lieer-git)
(define-public lldb-zig-git/compat lldb-zig-git)
(define-public llvm-bolt/compat llvm-bolt)
(define-public mintsysadm/compat mintsysadm)
(define-public monocoque/compat monocoque)
(define-public mts-link-meetings/compat mts-link-meetings)
(define-public networkmanager-fortisslvpn/compat networkmanager-fortisslvpn)
(define-public obexftp/compat obexftp)
(define-public olive-git/compat olive-git)
(define-public omniget-git/compat omniget-git)
(define-public opencomposite-git/compat opencomposite-git)
(define-public optimus-manager-git/compat optimus-manager-git)
(define-public owmods-gui-bin/compat owmods-gui-bin)
(define-public pave-git/compat pave-git)
(define-public portmaster-bin/compat portmaster-bin)
(define-public python-torchao-rocm/compat python-torchao-rocm)
(define-public re3-git/compat re3-git)
(define-public redisinsight/compat redisinsight)
(define-public rustconn/compat rustconn)
(define-public satisfactory-mod-manager/compat satisfactory-mod-manager)
(define-public simracing-essentials/compat simracing-essentials)
(define-public spaz-hib/compat spaz-hib)
(define-public stratos-cli/compat stratos-cli)
(define-public streamcontroller-git/compat streamcontroller-git)
(define-public ticktick/compat ticktick)
(define-public tonearm-git/compat tonearm-git)
(define-public vaping/compat vaping)
(define-public wifiman-desktop/compat wifiman-desktop)
(define-public winboat/compat winboat)
(define-public xnviewmp-system-libs/compat xnviewmp-system-libs)
(define-public xpybar/compat xpybar)
(define-public yacreader/compat yacreader)
(define-public yacreaderlibraryserver/compat yacreaderlibraryserver)
(define-public zerobrane-studio/compat zerobrane-studio)
(define-public appimage-builder-bin/compat appimage-builder-bin)
(define-public atrust-bin/compat atrust-bin)
(define-public canon-pixma-ts5055-complete/compat canon-pixma-ts5055-complete)
(define-public casual-pre-loader-git/compat casual-pre-loader-git)
(define-public chatterino2-7tv-git/compat chatterino2-7tv-git)
(define-public clyp-bin/compat clyp-bin)
(define-public cnrdrvcups-lb/compat cnrdrvcups-lb)
(define-public codex-app-bin/compat codex-app-bin)
(define-public cynthiune-app/compat cynthiune-app)
(define-public dangerzone-bin/compat dangerzone-bin)
(define-public danxi/compat danxi)
(define-public dnsdiag/compat dnsdiag)
(define-public dupeguru-git/compat dupeguru-git)
(define-public en-croissant-bin/compat en-croissant-bin)
(define-public exaile-git/compat exaile-git)
(define-public gns3-gui-2/compat gns3-gui-2)
(define-public gtk-meshtastic-client/compat gtk-meshtastic-client)
(define-public heroic-games-launcher-git/compat heroic-games-launcher-git)
(define-public hyprlauncher-git/compat hyprlauncher-git)
(define-public input-remapper-git/compat input-remapper-git)

;; --- recipe-resolver-260415t compat aliases ---
(define-public snes9x-git/compat snes9x-git)
(define-public snes9x-gtk-git/compat snes9x-gtk-git)
(define-public snes9x-qt-git/compat snes9x-qt-git)
(define-public alephone-git/compat alephone-git)
(define-public smokinguns-git/compat smokinguns-git)
(define-public pulsemeeter-git/compat pulsemeeter-git)
(define-public winegui/compat winegui)
(define-public xfce4-theme-switcher/compat xfce4-theme-switcher)
(define-public hidamari/compat hidamari)
(define-public radiosonde-auto-rx/compat radiosonde-auto-rx)
(define-public greetd-regreet-git/compat greetd-regreet-git)
(define-public sway-i3-style-fullscreen-git/compat sway-i3-style-fullscreen-git)
(define-public gimp-nufraw/compat gimp-nufraw)
(define-public perl-perl-languageserver/compat perl-perl-languageserver)

;; --- recipe-resolver-260415u compat aliases ---
(define-public llocal-bin/compat llocal-bin)
(define-public gopanel-bin/compat gopanel-bin)
(define-public warp-plus-bin/compat warp-plus-bin)
(define-public sling-cli-bin/compat sling-cli-bin)
(define-public decompose-bin/compat decompose-bin)
(define-public zigmod-bin/compat zigmod-bin)
(define-public ddns-go-bin/compat ddns-go-bin)
(define-public ollama-lab-bin/compat ollama-lab-bin)
(define-public imfit-bin/compat imfit-bin)
(define-public tlm-bin/compat tlm-bin)
(define-public tdns-bin/compat tdns-bin)
(define-public riprip-bin/compat riprip-bin)
(define-public omarchy-chromium-bin/compat omarchy-chromium-bin)
(define-public anilabxmax-bin/compat anilabxmax-bin)
(define-public zyfun-bin/compat zyfun-bin)
(define-public font-persian-hm-xs2/compat font-persian-hm-xs2)
(define-public font-persian-hm-ftx/compat font-persian-hm-ftx)
(define-public font-pending-mono/compat font-pending-mono)
(define-public font-mph-2b-damase/compat font-mph-2b-damase)
(define-public brother-hl1210w-cups/compat brother-hl1210w-cups)
(define-public brother-hl-l2420dw-cups/compat brother-hl-l2420dw-cups)
(define-public kyocera-cups-ppd/compat kyocera-cups-ppd)
(define-public python-pyvmomi/compat python-pyvmomi)
(define-public python-xnum/compat python-xnum)
(define-public python-genai-prices/compat python-genai-prices)
(define-public python-dm-streamvalve/compat python-dm-streamvalve)
(define-public python-termgraph/compat python-termgraph)
(define-public crackpkcs12/compat crackpkcs12)
(define-public khronos-ocl-icd/compat khronos-ocl-icd)
(define-public fzfmenu/compat fzfmenu)
(define-public multiblend/compat multiblend)
(define-public tcptrace/compat tcptrace)
(define-public git-secret/compat git-secret)
(define-public unicornscan/compat unicornscan)
(define-public ext4magic/compat ext4magic)
(define-public shufflecake/compat shufflecake)
(define-public openseachest-logparser/compat openseachest-logparser)
(define-public duckstation-git/compat duckstation-git)
(define-public fan2go-tui/compat fan2go-tui)
(define-public mpv-reload/compat mpv-reload)
(define-public neovim-nvim-treesitter/compat neovim-nvim-treesitter)
(define-public cmdd/compat cmdd)
(define-public markcat/compat markcat)
(define-public tasklin/compat tasklin)
(define-public live-photo-conv/compat live-photo-conv)
(define-public anitr-cli/compat anitr-cli)
(define-public kshift/compat kshift)
(define-public delineate/compat delineate)
(define-public breathing/compat breathing)
(define-public vim-language-server/compat vim-language-server)
(define-public devcontainer-cli/compat devcontainer-cli)
(define-public alfathsave/compat alfathsave)
(define-public bzr-player/compat bzr-player)
(define-public ultrastar-manager/compat ultrastar-manager)
(define-public falkon-pdfreader/compat falkon-pdfreader)
(define-public weechat-xmpp/compat weechat-xmpp)
(define-public gnucap-modelgen-verilog/compat gnucap-modelgen-verilog)
(define-public deltatune-linux/compat deltatune-linux)
(define-public krita-vision-tools/compat krita-vision-tools)
(define-public asciidoctor-web-pdf/compat asciidoctor-web-pdf)
(define-public lsr/compat lsr)
(define-public tunarr-bin/compat tunarr-bin)

;; deptree-resolver-260415u
(define-public stalwart-mail-server/compat stalwart-mail-server)
(define-public yozo-office-fonts/compat yozo-office-fonts)
(define-public yozo-office-templates/compat yozo-office-templates)
(define-public apache-hudi/compat apache-hudi)
(define-public apache-iceberg/compat apache-iceberg)
(define-public apache-paimon/compat apache-paimon)
(define-public apache-flink/compat apache-flink)
(define-public intel-ipu6ep-camera-hal-git/compat intel-ipu6ep-camera-hal-git)
(define-public kafbat-kafka-ui/compat kafbat-kafka-ui)
(define-public python-deltalake/compat python-deltalake)
(define-public python-speechmatics-rt/compat python-speechmatics-rt)
(define-public zap-elec/compat zap-elec)
(define-public zap-rs/compat zap-rs)
(define-public opencomposite-git/compat opencomposite-git)
(define-public simracing-essentials/compat simracing-essentials)
(define-public dupeguru-git/compat dupeguru-git)
(define-public input-remapper-git/compat input-remapper-git)
(define-public invoiceninja-desktop/compat invoiceninja-desktop)
(define-public kdelibs4support/compat kdelibs4support)
(define-public kime-git/compat kime-git)
(define-public kwin-effects-better-blur-dx-git/compat kwin-effects-better-blur-dx-git)
(define-public mihomo-party-electron-bin/compat mihomo-party-electron-bin)
(define-public molecule-plugins/compat molecule-plugins)
(define-public nih-plug-git/compat nih-plug-git)
(define-public open-hexagon-git/compat open-hexagon-git)
(define-public pandora-launcher/compat pandora-launcher)
(define-public powder-toy-git/compat powder-toy-git)
(define-public python-exa-py/compat python-exa-py)
(define-public qbittorrent-enhanced-ua-nox/compat qbittorrent-enhanced-ua-nox)
(define-public ringracers/compat ringracers)
(define-public solana/compat solana)
(define-public solo1/compat solo1)
(define-public sos/compat sos)
(define-public themix-full-git/compat themix-full-git)
(define-public twig/compat twig)
(define-public twintaillauncher-bin/compat twintaillauncher-bin)
(define-public video2x-git/compat video2x-git)
(define-public vpkedit/compat vpkedit)
(define-public wayscriber/compat wayscriber)
(define-public winegui/compat winegui)
(define-public wordbook/compat wordbook)
(define-public xfce4-theme-switcher/compat xfce4-theme-switcher)
(define-public ytmdesktop/compat ytmdesktop)
(define-public yuki-iptv-bin/compat yuki-iptv-bin)
(define-public android-tv-remote/compat android-tv-remote)

;; recipe-resolver-260415w
(define-public bptt/compat bptt)
(define-public f43-backgrounds/compat f43-backgrounds)
(define-public gnome-tuner/compat gnome-tuner)
(define-public ollama-cli/compat ollama-cli)
(define-public oplpctools/compat oplpctools)
(define-public proxyguard/compat proxyguard)
(define-public python-dlt/compat python-dlt)
(define-public python-dm-ollamalib/compat python-dm-ollamalib)
(define-public python-hyperscript/compat python-hyperscript)
(define-public python-meilisearch-sdk/compat python-meilisearch-sdk)
(define-public ttf-medievalsharp/compat ttf-medievalsharp)

;; deptree-resolver-260416a
(define-public expressvpn/compat expressvpn)
(define-public crark/compat crark)
(define-public arch-store/compat arch-store)
(define-public grml-iso/compat grml-iso)
(define-public monika-after-story-cn/compat monika-after-story-cn)
(define-public pactime/compat pactime)
(define-public youzone/compat youzone)
(define-public arch-store-git/compat arch-store-git)
(define-public gog-ftl/compat gog-ftl)
(define-public minegrub-theme-update-service/compat minegrub-theme-update-service)
(define-public pacdiff-pacman-hook-git/compat pacdiff-pacman-hook-git)
(define-public clean-chroot-manager/compat clean-chroot-manager)
(define-public lib32-khronos-ocl-icd-git/compat lib32-khronos-ocl-icd-git)
(define-public pacboost/compat pacboost)
(define-public parui-git/compat parui-git)
(define-public aurscan-git/compat aurscan-git)
(define-public aurutils-git/compat aurutils-git)
(define-public pacman-static/compat pacman-static)
(define-public tmpstali/compat tmpstali)
(define-public archlinux-tweak-tool-git/compat archlinux-tweak-tool-git)
(define-public bcachefs-dkms-git/compat bcachefs-dkms-git)
(define-public pacmanagergui-git/compat pacmanagergui-git)
(define-public rua/compat rua)
(define-public waybar-module-pacman-updates-git/compat waybar-module-pacman-updates-git)
(define-public aconfmgr-git/compat aconfmgr-git)
(define-public lib32-libass/compat lib32-libass)
(define-public limine-mkinitcpio-hook-git/compat limine-mkinitcpio-hook-git)
(define-public steamcommunity302/compat steamcommunity302)
(define-public yauri/compat yauri)
(define-public yup/compat yup)
(define-public cosmic-applet-arch/compat cosmic-applet-arch)
(define-public insync-dolphin/compat insync-dolphin)
(define-public whisper-cpp-hip/compat whisper-cpp-hip)
(define-public yay-sys-tray-git/compat yay-sys-tray-git)
(define-public auracle-git/compat auracle-git)
(define-public esp-idf/compat esp-idf)
(define-public forticlient/compat forticlient)
(define-public linux-xanmod-bin/compat linux-xanmod-bin)
(define-public msvc-wine-git/compat msvc-wine-git)
(define-public pamac-all/compat pamac-all)
(define-public pat-aur-client-firmware-git/compat pat-aur-client-firmware-git)
(define-public pat-aur-client-flatpak-git/compat pat-aur-client-flatpak-git)
(define-public shelly-bin/compat shelly-bin)
(define-public aurto/compat aurto)
(define-public blinky/compat blinky)
(define-public kega-fusion/compat kega-fusion)
(define-public lib32-vulkan-tools/compat lib32-vulkan-tools)
(define-public nsight-graphics/compat nsight-graphics)
(define-public pamac-classic-fixed/compat pamac-classic-fixed)
(define-public paru-static/compat paru-static)
(define-public semantic-diff/compat semantic-diff)
(define-public wiso-steuer-2026/compat wiso-steuer-2026)
(define-public yandex-music-windows/compat yandex-music-windows)
(define-public aurdex/compat aurdex)
(define-public bauh/compat bauh)
(define-public bind-utils-standalone/compat bind-utils-standalone)
(define-public bloom-git/compat bloom-git)
(define-public boxflat-git/compat boxflat-git)
(define-public deigde/compat deigde)
(define-public droidcam/compat droidcam)
(define-public ecwolf-git/compat ecwolf-git)
(define-public fcitx5-mozc-with-jp-dict/compat fcitx5-mozc-with-jp-dict)
(define-public fingwit/compat fingwit)
(define-public greetd-regreet-git/compat greetd-regreet-git)
(define-public grub-silent/compat grub-silent)
(define-public harbour-amazfish-git/compat harbour-amazfish-git)
(define-public hyprsettings-git/compat hyprsettings-git)
(define-public ibus-mozc-with-jp-dict/compat ibus-mozc-with-jp-dict)
(define-public katvan/compat katvan)
(define-public lazarus-gtk2/compat lazarus-gtk2)
(define-public lcarswm/compat lcarswm)
(define-public ldapvi/compat ldapvi)
(define-public lib32-libdxvk/compat lib32-libdxvk)
(define-public lib32-vkbasalt-redemp-git/compat lib32-vkbasalt-redemp-git)
(define-public lib32-xrizer-git/compat lib32-xrizer-git)
(define-public linux-cjktty-headers/compat linux-cjktty-headers)
(define-public linux-lts515/compat linux-lts515)
(define-public linux-xanmod-edge-headers/compat linux-xanmod-edge-headers)
(define-public linux-xanmod-headers/compat linux-xanmod-headers)
(define-public lue-reader-git/compat lue-reader-git)
(define-public m64py/compat m64py)
(define-public metube-git/compat metube-git)
(define-public mujoco/compat mujoco)
(define-public muzika-git/compat muzika-git)
(define-public nblood-git/compat nblood-git)
(define-public ollama-vulkan-git/compat ollama-vulkan-git)
(define-public pandora-launcher-git/compat pandora-launcher-git)
(define-public penpot-frontend/compat penpot-frontend)
(define-public python-curl-cffi-git/compat python-curl-cffi-git)
(define-public q4wine-git/compat q4wine-git)
(define-public qbittorrent-enhanced-ua/compat qbittorrent-enhanced-ua)
(define-public qimgv-qt6-kde-git/compat qimgv-qt6-kde-git)
(define-public qlog-git/compat qlog-git)
(define-public qmc2/compat qmc2)
(define-public raze/compat raze)
(define-public rblx-silver-git/compat rblx-silver-git)
(define-public rs-visa/compat rs-visa)
(define-public shelly-git/compat shelly-git)
(define-public smokinguns-git/compat smokinguns-git)

;; deptree-resolver-260416b
(define-public expressvpn-gui-nhk/compat expressvpn-gui-nhk)
(define-public pacman-static/compat pacman-static)
(define-public pamac-classic-fixed/compat pamac-classic-fixed)
(define-public lib32-vkbasalt-redemp-git/compat lib32-vkbasalt-redemp-git)
(define-public lib32-xrizer-git/compat lib32-xrizer-git)
(define-public penpot-frontend/compat penpot-frontend)
(define-public snowflake-connector-python/compat snowflake-connector-python)
(define-public soh-otr-exporter/compat soh-otr-exporter)
(define-public solar2d-git/compat solar2d-git)
(define-public stickerpicker-git/compat stickerpicker-git)
(define-public switchboard-plug-desktop-git/compat switchboard-plug-desktop-git)
(define-public throne/compat throne)
(define-public turtle/compat turtle)
(define-public tuwunel-git/compat tuwunel-git)
(define-public vesc-tool/compat vesc-tool)
(define-public vita3k-git/compat vita3k-git)
(define-public vrcx/compat vrcx)
(define-public wiiudownloader/compat wiiudownloader)
(define-public xrizer-multilib-git/compat xrizer-multilib-git)
(define-public 2s2h-otr-exporter/compat 2s2h-otr-exporter)
(define-public breezy-desktop-gnome-git/compat breezy-desktop-gnome-git)
(define-public czkawka-git/compat czkawka-git)
(define-public eddie-ui/compat eddie-ui)
(define-public faugus-launcher-git/compat faugus-launcher-git)
(define-public flix-cli/compat flix-cli)
(define-public gpu-viewer/compat gpu-viewer)
(define-public grub-improved-luks2-git/compat grub-improved-luks2-git)
(define-public kate-discord-rpc-git/compat kate-discord-rpc-git)
(define-public libfprint-goodixtls-55x4/compat libfprint-goodixtls-55x4)
(define-public libgda-firebird/compat libgda-firebird)
(define-public libgda-mysql/compat libgda-mysql)
(define-public libgda-postgres/compat libgda-postgres)
(define-public linux-g14-headers/compat linux-g14-headers)
(define-public llvm17-libs/compat llvm17-libs)
(define-public lsfg-vk-git/compat lsfg-vk-git)
(define-public maint/compat maint)
(define-public ollama-docs-git/compat ollama-docs-git)
(define-public onvif-gui/compat onvif-gui)
(define-public opencloud-desktop/compat opencloud-desktop)
(define-public openhv/compat openhv)
(define-public osrm-backend/compat osrm-backend)
(define-public pacpush/compat pacpush)
(define-public path-of-building-community-git/compat path-of-building-community-git)
(define-public penpot-mcp/compat penpot-mcp)
(define-public perl-perl-languageserver/compat perl-perl-languageserver)
(define-public pix/compat pix)
(define-public plasma-gamemode-git/compat plasma-gamemode-git)
(define-public python-withoutbg/compat python-withoutbg)
(define-public python313-freethreaded/compat python313-freethreaded)
(define-public remarshal/compat remarshal)
(define-public riseup-vpn/compat riseup-vpn)
(define-public safe-discover/compat safe-discover)
(define-public simgear/compat simgear)
(define-public songrec-git/compat songrec-git)
(define-public spaghettikart/compat spaghettikart)
(define-public tartube/compat tartube)
(define-public trae-cn-desktop-bin/compat trae-cn-desktop-bin)
(define-public uzdoom/compat uzdoom)
(define-public vbam-sdl/compat vbam-sdl)
(define-public visual-studio-code-live-bin/compat visual-studio-code-live-bin)
(define-public wayfire-plugins-extra/compat wayfire-plugins-extra)
(define-public winboat-electron/compat winboat-electron)
(define-public yacreader-poppler/compat yacreader-poppler)
(define-public ytm-player-git/compat ytm-player-git)
(define-public albert-git/compat albert-git)
(define-public arch-wiki-search/compat arch-wiki-search)
(define-public banjorecomp/compat banjorecomp)
(define-public bilibili/compat bilibili)
(define-public chrome-remote-desktop/compat chrome-remote-desktop)
(define-public clang-libs-minimal-git/compat clang-libs-minimal-git)
(define-public code-translucent/compat code-translucent)
(define-public discover-overlay-git/compat discover-overlay-git)
(define-public emacs-mozc-with-jp-dict/compat emacs-mozc-with-jp-dict)
(define-public fluffychat/compat fluffychat)
(define-public git-wd40/compat git-wd40)
(define-public guiman/compat guiman)
(define-public libgda-jdbc/compat libgda-jdbc)
(define-public linux-cachyos-lts-headers/compat linux-cachyos-lts-headers)
(define-public lution/compat lution)
(define-public normcap/compat normcap)
(define-public ollama-cuda-git/compat ollama-cuda-git)
(define-public ollama-rocm-git/compat ollama-rocm-git)
(define-public pamac-aur-git/compat pamac-aur-git)
(define-public pantheon-session-git/compat pantheon-session-git)
(define-public parallels-client/compat parallels-client)
(define-public plasma6-applets-eventcalendar/compat plasma6-applets-eventcalendar)
(define-public processing/compat processing)
(define-public pulsemeeter-git/compat pulsemeeter-git)
(define-public python-llama-cpp-vulkan/compat python-llama-cpp-vulkan)
(define-public python-quimb/compat python-quimb)
(define-public qrookie-vrp/compat qrookie-vrp)
(define-public reform-tools/compat reform-tools)
(define-public vkdoom-git/compat vkdoom-git)
(define-public xlibre-video-intel-bin/compat xlibre-video-intel-bin)
(define-public xoreos/compat xoreos)
(define-public zephyr-sdk/compat zephyr-sdk)
(define-public caffeine-ng-git/compat caffeine-ng-git)
(define-public conquest-git/compat conquest-git)
(define-public deepin-wine10-stable/compat deepin-wine10-stable)


;; deptree-resolver-260416c
(define-public solar2d-git/compat solar2d-git)
(define-public vrcx/compat vrcx)
(define-public lsfg-vk-git/compat lsfg-vk-git)
(define-public uzdoom/compat uzdoom)
(define-public ytm-player-git/compat ytm-player-git)
(define-public plasma6-applets-eventcalendar/compat plasma6-applets-eventcalendar)
(define-public pulsemeeter-git/compat pulsemeeter-git)
(define-public zephyr-sdk/compat zephyr-sdk)
(define-public eblande/compat eblande)
(define-public foldingathome/compat foldingathome)
(define-public glaxnimate-git/compat glaxnimate-git)
(define-public graphite-editor-git/compat graphite-editor-git)
(define-public grub-blscfg/compat grub-blscfg)
(define-public gz-ionic/compat gz-ionic)
(define-public home-assistant/compat home-assistant)
(define-public isd-git/compat isd-git)
(define-public lib32-amdvlk/compat lib32-amdvlk)
(define-public linux-cjktty/compat linux-cjktty)
(define-public linux-lqx-docs/compat linux-lqx-docs)
(define-public linux-lqx-headers/compat linux-lqx-headers)
(define-public linux-xanmod/compat linux-xanmod)
(define-public linux-xanmod-edge/compat linux-xanmod-edge)
(define-public meshiji/compat meshiji)
(define-public mingw-w64-gtk3/compat mingw-w64-gtk3)
(define-public pat-aur-host-git/compat pat-aur-host-git)
(define-public properdocs/compat properdocs)
(define-public runescape-launcher/compat runescape-launcher)
(define-public sparrow-wifi-git/compat sparrow-wifi-git)
(define-public steamlink/compat steamlink)
(define-public yabridge-wine10-git/compat yabridge-wine10-git)
(define-public alacritty-graphics/compat alacritty-graphics)
(define-public alephone-git/compat alephone-git)
(define-public astraeditor-git/compat astraeditor-git)
(define-public fcitx5-lotus-git/compat fcitx5-lotus-git)
(define-public fotema/compat fotema)
(define-public gimp-nufraw/compat gimp-nufraw)
(define-public gx52/compat gx52)
(define-public inputactions-kwin/compat inputactions-kwin)
(define-public lib32-python/compat lib32-python)
(define-public linux-g14/compat linux-g14)
(define-public manaverse-git/compat manaverse-git)
(define-public manaverse-sdl2-git/compat manaverse-sdl2-git)
(define-public mcpelauncher-linux-git/compat mcpelauncher-linux-git)
(define-public meowpad-configurator-v2-git/compat meowpad-configurator-v2-git)
(define-public mininet/compat mininet)
(define-public nip4/compat nip4)
(define-public ossia-score/compat ossia-score)
(define-public polymc-qt5-git/compat polymc-qt5-git)
(define-public python-llama-cpp-hip/compat python-llama-cpp-hip)
(define-public python-wandb/compat python-wandb)
(define-public the-honkers-railway-launcher/compat the-honkers-railway-launcher)
(define-public wsjtx-improved/compat wsjtx-improved)
(define-public wsjtx-improved-al/compat wsjtx-improved-al)
(define-public xawtv/compat xawtv)
(define-public anydesk-legacy-bin/compat anydesk-legacy-bin)
(define-public baballonia/compat baballonia)
(define-public bareos-bconsole/compat bareos-bconsole)
(define-public betterwallpaper-git/compat betterwallpaper-git)
(define-public bugwarrior-git/compat bugwarrior-git)
(define-public c47/compat c47)
(define-public collabora-office/compat collabora-office)
(define-public invidious/compat invidious)
(define-public karton/compat karton)
(define-public linux-cachyos-cjktty-headers/compat linux-cachyos-cjktty-headers)
(define-public linux-cachyos-rc-headers/compat linux-cachyos-rc-headers)
(define-public linux-libre-hardened-docs/compat linux-libre-hardened-docs)
(define-public linux-libre-hardened-headers/compat linux-libre-hardened-headers)
(define-public linux-vfio-lts-headers/compat linux-vfio-lts-headers)
(define-public maszyna-git/compat maszyna-git)
(define-public pamac-aur/compat pamac-aur)
(define-public python-urllib3-future-git/compat python-urllib3-future-git)
(define-public r47/compat r47)
(define-public scx-scheds-git/compat scx-scheds-git)
(define-public sulis-git/compat sulis-git)
(define-public syncthingtray/compat syncthingtray)
(define-public vicinae-git/compat vicinae-git)
(define-public void-git/compat void-git)
(define-public yandex-browser/compat yandex-browser)
(define-public zeronet-conservancy-git/compat zeronet-conservancy-git)
(define-public darkly/compat darkly)
(define-public lib32-rust-libs-git/compat lib32-rust-libs-git)
(define-public lib32-wivrn-server/compat lib32-wivrn-server)
(define-public linux-mainline-docs/compat linux-mainline-docs)
(define-public linuxqq-nt-bwrap/compat linuxqq-nt-bwrap)
(define-public openvino-git/compat openvino-git)
(define-public planarally-bin/compat planarally-bin)
(define-public plasmazones/compat plasmazones)
(define-public python-tensorrt/compat python-tensorrt)
(define-public qt6-xcb-private-headers-hifps/compat qt6-xcb-private-headers-hifps)
(define-public rog-control-center/compat rog-control-center)
(define-public waydroid-helper/compat waydroid-helper)
(define-public waydroid-helper-git/compat waydroid-helper-git)
(define-public yozo-office/compat yozo-office)
(define-public ags-hyprpanel-git/compat ags-hyprpanel-git)
(define-public gnome-terminal-transparency/compat gnome-terminal-transparency)
(define-public high-tide-git/compat high-tide-git)
(define-public jcef-jetbrains-git/compat jcef-jetbrains-git)
(define-public meshroom/compat meshroom)
(define-public mozillavpn-git/compat mozillavpn-git)


;; deptree-resolver-260416d
(define-public graphite-editor-git/compat graphite-editor-git)
(define-public home-assistant/compat home-assistant)
(define-public linux-lqx-docs/compat linux-lqx-docs)
(define-public linux-lqx-headers/compat linux-lqx-headers)
(define-public yabridge-wine10-git/compat yabridge-wine10-git)
(define-public inputactions-kwin/compat inputactions-kwin)
(define-public pamac-aur/compat pamac-aur)
(define-public scx-scheds-git/compat scx-scheds-git)
(define-public linux-mainline-docs/compat linux-mainline-docs)
(define-public linuxqq-nt-bwrap/compat linuxqq-nt-bwrap)
(define-public plasmazones/compat plasmazones)
(define-public qt6-xcb-private-headers-hifps/compat qt6-xcb-private-headers-hifps)
(define-public waydroid-helper/compat waydroid-helper)
(define-public open-vm-tools-git/compat open-vm-tools-git)
(define-public openxray-git/compat openxray-git)
(define-public paperless-ngx-venv/compat paperless-ngx-venv)
(define-public pdf4qt-git/compat pdf4qt-git)
(define-public plasma-keyboard-git/compat plasma-keyboard-git)
(define-public protonmail-bridge-free/compat protonmail-bridge-free)
(define-public rust-aarch64-gnu-git/compat rust-aarch64-gnu-git)
(define-public rust-aarch64-musl-git/compat rust-aarch64-musl-git)
(define-public unreal-engine/compat unreal-engine)
(define-public vortex-git/compat vortex-git)
(define-public wayvr-git/compat wayvr-git)
(define-public atlantik-git/compat atlantik-git)
(define-public frr/compat frr)
(define-public hidamari/compat hidamari)
(define-public hiddify/compat hiddify)
(define-public linux-libre-hardened/compat linux-libre-hardened)
(define-public linux-vfio-lts/compat linux-vfio-lts)
(define-public note-gen/compat note-gen)
(define-public nulloy/compat nulloy)
(define-public openvino-intel-gpu-plugin/compat openvino-intel-gpu-plugin)
(define-public organicmaps-git/compat organicmaps-git)
(define-public plasma-login-manager-git/compat plasma-login-manager-git)
(define-public plasma6-applets-appgrid/compat plasma6-applets-appgrid)
(define-public playdate-sdk/compat playdate-sdk)
(define-public pros-cli/compat pros-cli)
(define-public python-fabric-git/compat python-fabric-git)
(define-public scrt/compat scrt)
(define-public sdrpp-brown-git/compat sdrpp-brown-git)
(define-public soh/compat soh)
(define-public thinlinc-server/compat thinlinc-server)
(define-public vbam-wx/compat vbam-wx)
(define-public aeroshell-smod-git/compat aeroshell-smod-git)
(define-public airwindows-consolidated-git/compat airwindows-consolidated-git)
(define-public chessament-git/compat chessament-git)
(define-public godot32/compat godot32)
(define-public java-openjfx-doc/compat java-openjfx-doc)
(define-public java-openjfx-src/compat java-openjfx-src)
(define-public maubot/compat maubot)
(define-public norisk-client-launcher-nvidia/compat norisk-client-launcher-nvidia)
(define-public openvino-intel-npu-plugin/compat openvino-intel-npu-plugin)
(define-public radiosonde-auto-rx/compat radiosonde-auto-rx)
(define-public ventoy/compat ventoy)
(define-public alvr/compat alvr)
(define-public jacartauc/compat jacartauc)
(define-public java11-openjfx-doc/compat java11-openjfx-doc)
(define-public java11-openjfx-src/compat java11-openjfx-src)
(define-public ladybird/compat ladybird)
(define-public linux-pf/compat linux-pf)
(define-public obs-advanced-scene-switcher/compat obs-advanced-scene-switcher)
(define-public openmoonray/compat openmoonray)
(define-public python-bitsandbytes/compat python-bitsandbytes)
(define-public sonic-pi-git/compat sonic-pi-git)
(define-public sway-i3-style-fullscreen-git/compat sway-i3-style-fullscreen-git)
(define-public switchgen-git/compat switchgen-git)
(define-public goldendict-git/compat goldendict-git)
(define-public havoc-c2-git/compat havoc-c2-git)
(define-public input-leap-git/compat input-leap-git)
(define-public java11-openjfx/compat java11-openjfx)
(define-public ksysguard6-git/compat ksysguard6-git)
(define-public ktailctl/compat ktailctl)
(define-public linux-cachyos-headers/compat linux-cachyos-headers)
(define-public wine-tkg-staging-ntsync-bin/compat wine-tkg-staging-ntsync-bin)
(define-public wine-tkg-staging-wow64-bin/compat wine-tkg-staging-wow64-bin)
(define-public zenkit/compat zenkit)
(define-public binaryninja-personal/compat binaryninja-personal)
(define-public bobcat-terminal-git/compat bobcat-terminal-git)
(define-public cairo-dock-plug-ins-wayland-git/compat cairo-dock-plug-ins-wayland-git)
(define-public dvdae-bin/compat dvdae-bin)
(define-public git-it/compat git-it)
(define-public mesen/compat mesen)
(define-public nekobox/compat nekobox)
(define-public nekobox-core/compat nekobox-core)
(define-public pix2tex/compat pix2tex)
(define-public snes9x-qt-git/compat snes9x-qt-git)
(define-public torzu/compat torzu)
(define-public caelestia-shell-git/compat caelestia-shell-git)
(define-public organicmaps/compat organicmaps)
(define-public penpot/compat penpot)
(define-public shortwave-mpris-git/compat shortwave-mpris-git)
(define-public snes9x-git/compat snes9x-git)
(define-public snes9x-gtk-git/compat snes9x-gtk-git)
(define-public sparkle-bin/compat sparkle-bin)
(define-public yaak/compat yaak)
(define-public devtools-doas/compat devtools-doas)
(define-public llvm-libs-git/compat llvm-libs-git)
(define-public omnetpp/compat omnetpp)

;; deptree-resolver-260416e
(re-export openjdk22-doc)
(re-export openjdk22-src)
(re-export openjdk23-doc)
(re-export openjdk23-src)
(re-export penpot-exporter)
(re-export servo)
(re-export syca)
(re-export wine-pure-git)
(re-export 1c-enterprise-meta)
(re-export apollo)
(re-export expressvpn-staging)
(re-export lutris-live-bin)
(re-export maestral)
(re-export postman-bin)
(re-export qmplay2)
(re-export rog-perf-tuner-git)
(re-export sejda-desktop)
(re-export servo-git)
(re-export wivrn-dashboard)
(re-export android-translation-layer-git)
(re-export godot-mono-git)
(re-export lutris-git)
(re-export openjdk25-doc-wakefield)
(re-export openjdk25-src-wakefield)
(re-export somewm-git)
(re-export drkonqi-git)
(re-export electron17)
(re-export mimose-bin)
(re-export sunshine)
(re-export 86box-git)
(re-export audacious-plugins-gtk3)
(re-export firefox-esr-globalmenu)
(re-export flaresolverr-bin)
(re-export waterfox)
(re-export gamescope-nvidia)
(re-export jre23-openjdk-headless)
(re-export python-mlflow)
(re-export vcvrack)
(re-export hyprland-nox)
(re-export jre23-openjdk)
(re-export dsnote)
(re-export handbrake-full)
(re-export onlyoffice)
(re-export sway-scroll)
(re-export cdesktopenv)
(re-export gram)
(re-export hypryou)
(re-export immich-server)
(re-export jre25-openjdk-headless-wakefield)
(re-export citron)
(re-export idescriptor-git)
(re-export jre25-openjdk-wakefield)
(re-export lib32-amdonly-gaming-opencl-rusticl-mesa-git)
(re-export bottles-git)
(re-export lib32-amdonly-gaming-mesa-git)
(re-export lib32-amdonly-gaming-vulkan-mesa-layers-git)
(re-export unofficial-homestuck-collection)
(re-export xemu-git)
(re-export lib32-amdonly-gaming-vulkan-radeon-git)
(re-export nautilus-typeahead)
(re-export orca-slicer)
(re-export portproton)
(re-export wivrn-multilib-git)
(re-export ladybird-git)
(re-export miktex)
(re-export monado-doc)
(re-export electron19)
(re-export libretro-azahar-git)
(re-export obs-studio-git)
(re-export zoneminder-git)
(re-export floorp)
(re-export slippi-mainline)
(re-export ultimatevocalremovergui-git)
(re-export azahar-git)
(re-export dwproton-signed-bin)
(re-export gopher64-git)
(re-export mesa-dlss-reflex-git)
(re-export proton-cachyos-slr)
(re-export wivrn-full-git)
(re-export linuxcnc)
(re-export nosystemd-boot-artix)
(re-export virtualbox-kvm)
(re-export plex-desktop)
(re-export firefox-vaapi)
(re-export wps-office-365-edu)
(re-export wps-office-365-edu-fonts)
(re-export misans)
(re-export zen-browser-git)
(re-export librewolf-hellfire)
(re-export aerothemeplasma-desktop-git)
(re-export lib32-gst-plugins-good)
(re-export lib32-gst-plugins-base)
(re-export obs-studio-tytan652)
(re-export obs-studio-liberty)
(re-export positron-ide-devel-bin)
(re-export wine-cachyos)
(re-export open-webui-no-venv)
(re-export all-repository-fonts)
(re-export sonic-workspace)
(re-export sonic-x11-session)
(re-export sonic-desktop-interface)
(re-export sonicde-meta)
(re-export shiboken2)
(re-export python-shiboken2)
(re-export pyside2)
(re-export pyside2-tools)
(re-export sherlock-launcher-unstable-git)
(re-export deadbeef-plugin-lyricbar-git)
(re-export libminiaudiohelpers)

;; recipe-resolver-260416g recipes
(re-export git-standup)
(re-export pwnat)
(re-export tera)
(re-export dotr-bin)
(re-export mago-bin)
(re-export zenity-rs-bin)
(re-export jellyfin-rpc-bin)
(re-export tfupdate-bin)
(re-export soupault-bin)
(re-export brisk-bin)
(re-export surrealdb-bin)
(re-export frpc)
(re-export frps)
(re-export godot-preview-bin)
(re-export perl-crypt-argon2)
(re-export wireguard-vanity-keygen)
(re-export kas)
(re-export gotify-tray-cpp)
(re-export nextpnr-ice40-nightly)
(re-export quran-companion)
(re-export bisq-bin)
(re-export mandelbulber2)
(re-export monado-vulkan-layers-git)
(re-export boca)
(re-export manim)
(re-export podliner-bin)
(re-export suil-optgui)

;; deptree-resolver-260416j recipes
(re-export sh-elf-gcc-bootstrap)
(re-export sh-elf-newlib)
(re-export sh-elf-gcc)
;; recipe-resolver-260416j recipes
(re-export ent)
(re-export dadaengine)
(re-export slibtool)
(re-export rgxg)
(re-export awesfx)
(re-export heapusage)
(re-export stackusage)
(re-export ntfs2btrfs)
(re-export libmaddy)
(re-export libbsc)
(re-export tagutil)
(re-export ltris2)
(re-export simsimd)
(re-export docformatter)
(re-export cfv)
(re-export bmaptool)
(re-export pyglossary)
(re-export python-shandy-sqlfmt)
(re-export perl-compress-raw-lzma)
(re-export git-store-meta)
(re-export duply)
(re-export mint-l-theme)
(re-export sound-theme-simple)
(re-export pipes-rs-bin)
(re-export prboom-plus)
(re-export gearboy)
(re-export somafm-tui)
(re-export python-textual-textarea)
(re-export gmusicbrowser)
(re-export breeze-enhanced)

;; recipe-resolver-260417l recipes
(re-export packemon-git)
(re-export obs-ptz-controls)
(re-export cxt-bin)
(re-export pythonqt)
(re-export luajit-openresty)
(re-export mubeng-bin)
(re-export clip-editor-bin)
(re-export hyprdock)
(re-export serv-bin)
(re-export fastgron-bin)
(re-export minesweep-rs)
(re-export godot-double)
(re-export saber-bin)
(re-export mkeditor-bin)
(re-export drg-mod-integration-bin)
(re-export maplemononl-woff2)
(re-export maplemononl-variable)
(re-export maplemononl-ttf-autohint)
(re-export maplemononl-ttf)
(re-export maplemononl-otf)
(re-export maplemononl-nf-unhinted)
(re-export maplemononl-nf-cn-unhinted)
(re-export maplemononl-nf-cn)
(re-export maplemononl-nf)
(re-export maplemononl-cn-unhinted)
(re-export maplemononl-cn)
(re-export rotz)
(re-export sdrpp-git)
(re-export ahk-x11-bin)
(re-export aarch64-linux-musl-cross-bin)
(re-export badlion-client)
(re-export ghostty-terminfo-git)
(re-export ghostty-shell-integration-git)
(re-export renoise)
(re-export amf-headers-git)
(re-export void-bin)
(re-export fend)
(re-export icu73)
(re-export zlib-ng-git)
(re-export zlib-ng-compat-git)
(re-export automedia)
(re-export ctrld-bin)
(re-export intel-gmmlib-legacy)
(re-export prjapicula)
(re-export elm-platform-bin)
(re-export h2-database)
(re-export looking-glass-host-git)
(re-export rofi-pass-ydotool-git)
(re-export whitesur-gtk-theme)
(re-export dbeaver-ce-bin)
(re-export mu-editor)
(re-export popeye-bin)
(re-export sbupdate-git)
(re-export plasma6-applets-plasmavantage)
(re-export calculix-cgx)
(re-export river-runetile-git)
(re-export wakeup-triggers)
(re-export gcalendar)
(re-export ds-inhibit)
(re-export depotdownloader-git)
(re-export find-cursor)
(re-export lima-gui)
(re-export donutbrowser-bin)
(re-export diun-bin)
(re-export colima-bin)
(re-export climan-bin)
(re-export adb-sync-git)
(re-export webfs)
(re-export python-pylzma)
(re-export spring-boot-cli)
(re-export slack-term)
(re-export shitpost)
; recipe-resolver-260417m
(re-export woff2-misans-gujarati)
(re-export woff2-misans-gurmukhi)
(re-export woff2-misans-khmer)
(re-export woff2-misans-l3)
(re-export woff2-misans-latin)
(re-export woff2-misans-myanmar)
(re-export woff2-misans-tc)
(re-export woff2-misans-thai)
(re-export woff2-misans-tibetan)
(re-export misans-fontconfig)
(re-export ttf-gentium-basic)
(re-export linuxmint-keyring)
(re-export perl-module-signature)
(re-export perl-sub-delete)
(re-export engauge-digitizer)
(re-export lbforth)
(re-export bin86)
(re-export keyfinder-cli)
(re-export gftp)
(re-export fetchfetch)
(re-export ltunify)
(re-export rust-motd-bin)
(re-export pocket-id-bin)
(re-export pdf-metadata-editor-bin)
; recipe-resolver-260417n
(re-export lenovolegionlinux-dkms-git)
(re-export leetmouse-driver-dkms)
(re-export omada-controller-bin)

; deptree-resolver-260417n
(re-export cook)
(re-export capnproto-java)
(re-export zef)
(re-export vs1clickmodinstaller)
(re-export libjxl-doc)
(re-export arrow-c-glib)
(re-export mayo)
(re-export swaysettings)
(re-export ghostty)
(re-export xpipe-ptb)
(re-export atom-ng-bin)
(re-export gridmonger)
(re-export ccdciel)

; recipe-resolver-260417q
(re-export hush-bin)
(re-export k3s-bin)
(re-export localstack-cli-bin)
(re-export vector-bin)
(re-export leaf-bin)
(re-export rdrop-bin)
(re-export random-rs-bin)
(re-export mediaharbor-bin)
(re-export youtube-music-for-desktop-bin)
(re-export devtoys-bin)
(re-export python-quantities)
(re-export python-keyboard)
(re-export python-readchar)
(re-export python-smart-open)
(re-export python-duet)
(re-export python-nanoid)
(re-export python-untokenize)
(re-export python-bsdiff4)
(re-export python-proto-plus)
(re-export python-huey)
(re-export python-uritools)
(re-export python-neo4j)
(re-export python-pae)
(re-export python-opr)
(re-export python-memor)
(re-export xapp-symbolic-icons)
(re-export ansiweather)
(re-export libayatana-appindicator-glib)
(re-export python-chromaterm)
(re-export python-qbittorrent-api)

; recipe-resolver-260417r
(re-export runjs-bin)
(re-export bitwarden-menu-git)
(re-export organize)
(re-export gmap-bin)
(re-export nginxbeautifier)
(re-export nepdate)
(re-export minecraft-bedrock-server)
(re-export stealthplane-bin)
(re-export nighthawk-bin)
(re-export pure-ftpd)
(re-export openfx-arena)
(re-export nginx-mainline-mod-dav-ext)
(re-export nginx-mainline-mod-fancyindex)
(re-export natron-plugins-git)
(re-export tinyobjloader)
(re-export vban-git)
(re-export nginx-site)
(re-export controlloid-server-git)
(re-export verysync-bin)
(re-export raytracinginvulkan-git)
(re-export websocketd-git)
(re-export ttf-azuki-font)
(re-export tsr-bridge)
(re-export superconductor)
(re-export go-perflock-git)
(re-export disk-burnin-and-testing-git)
(re-export cbm)
(re-export alienfx)
(re-export stopmotion)
(re-export gamebreaker)
(re-export elm-format-bin)
(re-export massren)
(re-export python-trakit)
(re-export bc-gh)
(re-export ananicy-cpp-git)
(re-export pomodorot-bin)
(re-export nvibrant-bin)
(re-export ttf-fluent-emoji)
(re-export ariang)
(re-export dotter-rs)
(re-export ktls-utils)
(re-export doasedit-alternative)
(re-export mutt-wizard)
(re-export discord-game-sdk)
(re-export plasma6-applets-plasmusic-toolbar)
(re-export crosswords)
(re-export crosswords-puzzle-sets-xword-dl)
(re-export crosswords-puzzle-sets-gnome)
(re-export melodfy-bin)
(re-export cozette-otb)
(re-export ib-tws)
(re-export geany-plugin-preview-git)
(re-export xcp)
(re-export synology-drive)
(re-export syncthing-desktop-entries)
(re-export python-pylspci)
(re-export onedriver)
(re-export passmark-performancetest-bin)
(re-export adwaita-colors-icon-theme-git)
(re-export kio-onedrive-git)
(re-export grace)
(re-export prezto-git)
(re-export quamachi)
(re-export python-mutf8)
(re-export pcsx-redux)
(re-export adguard-cli-bin)
(re-export emulsion)
(re-export nessus)
(re-export animeko-appimage)
(re-export usbimager)
(re-export hollywood)
(re-export msquic)
(re-export catt)
(re-export smlfmt)
(re-export mpd-sima)
(re-export videomass)
(re-export sddm-sugar-candy-git)
(re-export deepl-linux-electron-bin)
(re-export python-scikit-learn-intelex)
(re-export twinejs-standalone)
(re-export speedometer)
(re-export perimeter81)
(re-export ik-llama-cpp)
(re-export jflap)
(re-export python-json-cmd-server)
(re-export sasm)
(re-export office-code-pro)
(re-export qarma-git)
(re-export rvx-builder)
(re-export simple64-git)
(re-export miniforge)
(re-export hyperfluent-grub-theme-endeavouros)
(re-export wayland-boomer-git)
(re-export xorg-xwayland-git)
(re-export transistor-git)
(re-export python-ffmpy)
(re-export python-groovy)
(re-export python-safehttpx)
(re-export python-gradio-client)
; recipe-resolver-260417s
(re-export stack-bin)
(re-export kapp)
(re-export ymp-bin)
(re-export ttypr-bin)
(re-export keifu-bin)
(re-export dredge-bin)
(re-export canvas-downloader-bin)
(re-export repeater-bin)
(re-export rip-go-bin)
(re-export dynocsv)
(re-export mpwall)
(re-export ov)
(re-export asciinema-agg)
(re-export seanime)
(re-export subsurface-appimage)
(re-export git-mr)
(re-export arkenfox-user-js)
(re-export byedpi)
(re-export bsdiff)
(re-export yash)
(re-export activate-linux)
(re-export pyupgrade)
(re-export python-pythondialog)
(re-export python-sysv-ipc)
(re-export ttf-b612)
(re-export mint-y-icons)
(re-export mint-x-icons)
(re-export prometheus-apcupsd-exporter)
(re-export smooth)
(re-export corrscope)

; recipe-resolver-260417t
(re-export libsidplayfp)
(re-export sidplayfp)
(re-export python-tinyio)
(re-export python-gspread)
(re-export python-markdown-include)
(re-export python-flynt)
(re-export python-pysubs2)
(re-export python-backoff)
(re-export python-click-option-group)
(re-export python-spotipy)
(re-export python-pylatex)
(re-export python-midiutil)
(re-export python-dicttoxml)
(re-export python-msgcheck)
(re-export python-imutils)
(re-export pdfcpu-bin)
(re-export mvnd-bin)
(re-export ttf-raleway)

; deptree-resolver-260417s
(re-export gtk2-plus-extra)
(re-export electron-builder)

; recipe-resolver-260417x
(re-export prasmoid)
(re-export sway-overfocus)
(re-export tabulate)
(re-export shm-modbus-signal-gen)
(re-export shm-format)
(re-export cxxshm)
(re-export cxxsemaphore)
(re-export cxxitimer)
(re-export elixir-ls)
(re-export syng-server)
(re-export syng-common)
(re-export syng-client)
(re-export wayland-pipewire-idle-inhibit)
(re-export matplotlib-cpp-git)
(re-export shm-modbus-gui)
(re-export lact-git)
(re-export pkg-8188eu-aircrack-dkms-git)
(re-export dolphin-emu-primehack-git)
(re-export pdf2htmlex)
(re-export treelite)
(re-export python-treelite)
(re-export kvantum-theme-whitesur-git)
(re-export coulr)
(re-export pyobd)
(re-export vimv)
(re-export sublist3r-git)
(re-export wofi-calc)
(re-export bin-bin)
(re-export wprs-git)
(re-export python-sdbus)
(re-export microbin-bin)
(re-export t150-driver-dkms-git)
(re-export hyprbop)
(re-export ghq-gst-bin)
(re-export spwd)
(re-export slider-cli-git)
(re-export slider-cli)
(re-export astro-box)
(re-export python-pyccel)
(re-export pypy3-requests)
(re-export w-scan2)
(re-export toney)
(re-export il2cpp-dumper-bin)
(re-export rustup-git)
(re-export scalafmt)
(re-export python-ag-ui-protocol)
(re-export lovely-injector)
(re-export iconic)
(re-export pithos)
(re-export wofi-vim)
(re-export vulkan-caps-viewer-x11)
(re-export vulkan-caps-viewer-wayland)
(re-export cobra-cli)
(re-export guile1-dot-8)
(re-export ampache)
(re-export kitty-terminfo-git)
(re-export kitty-shell-integration-git)
(re-export python-rocket-fft-git)
(re-export pianobooster)
(re-export textadept-gtk3)
(re-export portainer-bin)
(re-export bloop)
(re-export nagstamon-git)
(re-export mp3gain)
(re-export findent)
(re-export mystmd)
(re-export pacman-contrib-git)
(re-export miniupnpd-nft-git)
(re-export arsenal)
(re-export simgrid)
(re-export libfprint-1)
(re-export ttf-raleway-variable)
(re-export otf-raleway)
(re-export otb-unifont)
(re-export psf-unifont)
(re-export etterna)
(re-export license)

(re-export apache-jena)
(re-export apache-jena-fuseki)
(re-export b43-firmware-classic)
(re-export bombkurdistan-bin)
(re-export bombkurdistan-git)
(re-export eclipse-cpp-bin)
(re-export fcitx5-pinyin-sougou-dict)
(re-export fingerprint-gui)
(re-export gtk2-theme-dust)
(re-export guile1.8)
(re-export ntsync-common)
(re-export ntsync-header)
(re-export steamos-add-to-steam)
(re-export perl-cpan-distnameinfo)
(re-export perl-const-fast)
(re-export perl-data-printer)
(re-export perl-object-pad)
(re-export salome-configuration)
(re-export janet)
(re-export pyghmi)
(re-export python-pyhanko-certvalidator)
(re-export python-pyhanko)
(re-export python-certomancer-csc-dummy)
(re-export python-pdf2doi)
(re-export python-typedunits)
(re-export python-ompython)
(re-export anyfetch)
(re-export venice-cli-bin)
(re-export plugdata-bin)
(re-export blink-player-bin)
(re-export famistudio-bin)
(re-export dcvviewer-bin)
(re-export pdfmerger)
(re-export nview)
(re-export python-trezor)
(re-export alsaplayer)
(re-export svxlink-sounds-en-us-heather)
(re-export adbmanager-bin)

(re-export jdk-lts-bin)
(re-export jdk-lts-doc)
(re-export jre-lts-bin)
(re-export resource-hacker)
(re-export watchman-bin)
; recipe-resolver-260417z
(re-export suru-plus-icons)
(re-export fcitx5-material-color)
(re-export bullet-train-zsh-theme)
(re-export vim-pkgbuild)
(re-export reshade-steam-proton)
(re-export saul-bin)
(re-export akeyshually-bin)
(re-export wayvr-bin)
(re-export ocr4linux)
(re-export flipclock)
(re-export python-pkb-client)
(re-export xbindkeys-config-gtk2)
(re-export scnlib)
(re-export grub-reboot-picker)
(re-export xdg-launch)
(re-export freetuxtv)
(re-export pidgin-extprefs)
(re-export clang-include-graph)
(re-export barrier-headless)
(re-export thonny)
(re-export materia-theme)
(re-export coomer)

; deptree-resolver-260417ac
(re-export bazecor-bin)
(re-export astra-music-bin)
(re-export openscad-snapshot-appimage)
(re-export browservice-bin)
(re-export kh-melonmix-bin)
(re-export yomikiru-bin)
(re-export mandarine-bin)
(re-export aethertune-bin)
(re-export alman-bin)
(re-export ferroxide-bin)
(re-export wavey-launcher-bin)
(re-export refind-btrfs-snapshots-bin)
(re-export elastic-dashboard-bin)
(re-export forge-gui-desktop-bin)

; recipe-resolver-260417ad
(re-export typioca-bin)
(re-export lutgen-bin)
(re-export gibo-bin)
(re-export pet-bin)
(re-export picocrypt-bin)
(re-export tone-bin)
(re-export qp-bin)
(re-export wretch-bin)
(re-export localsend-go-bin)
(re-export taskr-bin)
(re-export mail-deduplicate-bin)
(re-export reels-bin)
(re-export ncspot-bin)
(re-export gphotos-uploader-cli-bin)
(re-export ktop-bin)
(re-export volt-bin)
(re-export mdviewer-bin)
(re-export clipse-bin)
(re-export duckling-bin)
(re-export twlauncher-bin)
(re-export heimer-bin)
(re-export tinytotp-bin)
(re-export compose-cli-bin)
(re-export gmat-bin)

; recipe-resolver-260417ae
(re-export q-bin)
(re-export lowfi-bin)
(re-export gollama-bin)
(re-export wstunnel-bin)
(re-export dprint-bin)
(re-export zigup-bin)
(re-export naabu-bin)
(re-export punfetch-bin)
(re-export loki-bin)
(re-export skeema-bin)
(re-export bibiman-bin)
(re-export wofi-power-menu-bin)
(re-export lima-bin)
(re-export pindock-bin)
(re-export sitegen-bin)
(re-export okapi-bin)
(re-export gitcredits-bin)
(re-export nnd-bin)
(re-export jjui-bin)
(re-export tatuin-bin)
(re-export cobalt-lang-bin)
(re-export lidm-bin)
(re-export axiocnc-bin)
(re-export ipinfo-cli-bin)
(re-export windscribe-cli-v2-bin)
(re-export sharik-bin)
(re-export xfsrtray-bin)

; deptree-resolver-260417ad
(re-export amass)
(re-export openutau-bin)
(re-export tela-icon-theme-bin)
(re-export shopify-themekit-bin)
(re-export restfox-bin)
(re-export enlightenment-eminence-theme-bin)
(re-export termusic-git)
(re-export gitfetch-bin)
(re-export basedpyright-bin)
(re-export pyrefly-bin)
(re-export spacecadetpinball-bin)
(re-export ftop-bin)

; recipe-resolver-260417af
(re-export python-hurry-filesize)
(re-export python-hyprpy)
(re-export python-mpld3)
(re-export python-ghtopdep)
(re-export python-hijridate)
(re-export python-banal)
(re-export python-apkinspector)
(re-export python-mapbox-earcut)
(re-export python-moderngl)
(re-export python-lzf)
(re-export python-pipreqs)
(re-export python-yarg)
(re-export python-imbalanced-learn)
(re-export python-dashtable)
(re-export python-drawsvg)
(re-export python-pulsectl-asyncio)
(re-export python-nodriver)
(re-export python-sphinx-multiversion)
(re-export python-sabctools)
(re-export python-webssh)
(re-export python-ghostscript)
(re-export python-nava)
(re-export python-shap)
(re-export python-garth)
(re-export python-alt-profanity-check)
(re-export python-pushover-complete)
(re-export python-soundcard)
(re-export python-awscli-plugin-endpoint)
(re-export python-sphinx-substitution-extensions)
(re-export python-jdatetime)
(re-export python-sigmf)
(re-export python-edge-tts)
(re-export python-html-sanitizer)
(re-export python-gputil)
(re-export python-viztracer)
(re-export python-tkinter-tooltip)
(re-export python-uptime)
(re-export python-gpt4all)
(re-export python-shazamio)
(re-export python-routeros-api)
(re-export python-catppuccin)
(re-export python-soundcloud-v2)
(re-export python-laspy)
(re-export python-material-color-utilities)
(re-export python-bandcamp-api)
(re-export python-tgtg)
(re-export python-qrcode-artistic)
(re-export python-grep-ast)
(re-export python-lizard)
(re-export python-oletools)
(re-export python-mktxp)
(re-export python-random2)
(re-export python-runtype)
(re-export python-jsonschema-rs)
(re-export python-e3-core)
(re-export python-latexify-py)
(re-export python-owega)
(re-export python-scalene)
(re-export python-pdftopng)
(re-export python-livepng)
(re-export python-evaluate)
(re-export python-wordllama)
(re-export python-flax)
(re-export python-cryptolyzer)
(re-export python-ninja)
(re-export python-keepassxc-browser)
(re-export python-google-genai)
(re-export python-goodreads)
(re-export python-xpybutil)
(re-export python-pyqtdarktheme)
(re-export python-fasta2a)
(re-export python-sqlite-vec)
(re-export python-rustworkx)
(re-export python-discord-rpc)
(re-export python-largestinteriorrectangle)
(re-export python-rdbtools)
(re-export python-amulet-core)
(re-export python-ezchlog)
(re-export python-pssh)
(re-export python-rocket-fft)
(re-export python-coincurve)
(re-export python-pyevtk)
(re-export python-jax-jumpy)
(re-export python-kodistubs)
(re-export python-openai-agents)
(re-export python-pytest-pyodide)
(re-export python-voicevox-client)
(re-export python-pypylon)
(re-export python-jaxlib)
(re-export python-cheap-repr)
(re-export ruby-xxhash)
(re-export matrixbrandy)
(re-export tsmuxer)
(re-export firefox-tridactyl-native-bin)
(re-export overmask-bin)
(re-export vdhcoapp-bin)
(re-export openterface-qt-bin)
(re-export foliate)

;; recipe-resolver-260417ai re-exports
(re-export apg)
(re-export redsocks)
(re-export digitemp)
(re-export oqsprovider)
(re-export dinit)
(re-export tpm2-totp)
(re-export iwqt)
(re-export rokuecp)
(re-export mameuix)
(re-export kleiner-brauhelfer)
(re-export python-pz)
(re-export ssort)
(re-export patator)
(re-export photocollage)
(re-export perl-net-amazon-signature-v4)
(re-export ruby-hiera-eyaml)
(re-export grub-btrfs)
(re-export simple-stateful-firewall)
(re-export twuewand)
(re-export pandoc-eisvogel-template)
(re-export waytune)
(re-export kworkflow)
(re-export libfprint-vfs009x)
(re-export box)
(re-export howl)
(re-export terminal-tetris)
(re-export browsr)
(re-export mfgtools)

; deptree-resolver-260417aj
(re-export gizmosql-bin)
(re-export mdatp-bin)
(re-export plexamp-bin)
(re-export cryptpad)
(re-export amsel-suite-bin)
(re-export python-jupyterlab-variableinspector)
(re-export python-libipld-git)
(re-export 115-browser-bin)
(re-export python-optking)
(re-export magicq)
(re-export python-tensorstore-bin)
(re-export unofficial-homestuck-collection-bin)

;; recipe-resolver-260417aj re-exports
(re-export ms-sys)
(re-export moodbar)
(re-export paper-icon-theme)
(re-export pavumeter)
(re-export gnome-colors-icon-theme)
(re-export perl-term-shellui)
(re-export perl-io-stty)
(re-export librepfunc)

;; recipe-resolver-260417ak re-exports
(re-export python-nvidia-ml-py)
(re-export python-gpustat)
(re-export iriunwebcam-bin)

;; recipe-resolver-260417al re-exports
(re-export maplemononormalnl-cn)
(re-export maplemononormalnl-cn-unhinted)
(re-export maplemononormalnl-nf)
(re-export maplemononormalnl-nf-cn)
(re-export maplemononormalnl-nf-cn-unhinted)
(re-export maplemononormalnl-nf-unhinted)
(re-export maplemononormalnl-otf)
(re-export maplemononormalnl-ttf)
(re-export maplemononormalnl-variable)
(re-export maplemononormalnl-woff2)
(re-export perl-email-valid)
(re-export perl-time-parsedate)
(re-export perl-module-cpanfile)
(re-export perl-email-stuffer)
(re-export perl-net-domain-tld)
(re-export perl-curry)
(re-export perl-menlo-legacy)
(re-export perl-time-moment)
(re-export python-kokoro)
(re-export python-misaki)
(re-export python-misaki-en)
(re-export python-misaki-he)
(re-export python-misaki-ja)
(re-export python-misaki-ko)
(re-export python-misaki-vi)
(re-export python-misaki-zh)
(re-export python-pyargument)
(re-export python-onepassword-sdk)
(re-export python-amulet-rocksdb)
(re-export python-qh3-git)
(re-export ffmpeg-bitrate-stats)
(re-export ffmpeg-quality-metrics)
(re-export pulp-cli)
(re-export python-jupyterlab-latex)
(re-export serial-studio-bin)
(re-export mars-mips-bin)
(re-export risuai-bin)
(re-export quadrant-bin)
(re-export electron41-bin)
(re-export kotlin-debug-adapter-bin)
(re-export gsdb-bin)
(re-export snapmaker-luban-bin)
(re-export bolt-launcher-bin)
(re-export factorio-bin)
(re-export openwhispr-appimage)
(re-export amdvlk-bin)
(re-export wttr-bin)
(re-export pearpass-bin)
(re-export talanoa-bin)
(re-export simutil-bin)
(re-export projectctr-makerom-bin)
(re-export spaghettikart-bin)
(re-export gopher64-bin)
(re-export processing-bin)
(re-export passwordsafe-bin)
(re-export min-bin)
(re-export prospect-mail-bin)
(re-export vita3k-bin)
(re-export hakuneko-desktop-bin)
(re-export cherry-studio)
(re-export upscayl)
(re-export photogimp)
(re-export rofi-kaomoji)
(re-export rofi-mpd)
(re-export wol-systemd)
(re-export getnf)
(re-export bashdb)
(re-export etherwake)
(re-export cavez-of-phear)
(re-export kilo-git)
(re-export libsearpc)
(re-export cpr)
(re-export rofi-file-browser-extended)
(re-export x11-emoji-picker-git)
(re-export uni)
(re-export buildozer)
(re-export buildifier)
(re-export devbox)
(re-export subfinder)
(re-export nextdns)
(re-export nfpm)
(re-export stripe-cli)
(re-export q-dns)
(re-export moonbit)
(re-export linutil)
(re-export wayshot)
(re-export glrnvim)
(re-export sqlpage)
(re-export nnd)
(re-export rust-motd)
(re-export mago)
(re-export continuwuity)
(re-export zelta)
(re-export mpeghdec)
(re-export alephone)
(re-export healthchecks)
(re-export devdocs-desktop)
(re-export unciv)
(re-export fjordlauncher)

;; recipe-resolver-260417am re-exports
(re-export moor-bin)
(re-export steamguard-cli-bin)
(re-export vopono-bin)
(re-export youtubedr-bin)
(re-export pingme-bin)
(re-export overmind-bin)
(re-export sqly-bin)
(re-export reddix-bin)
(re-export gowall-bin)
(re-export tuicr-bin)
(re-export rres-bin)
(re-export folderhost-bin)
(re-export tetrigo-bin)
(re-export tenere-bin)
(re-export taskell-bin)
(re-export gzdoom-bin)
(re-export vkd3d-proton-bin)
(re-export crossdirstat-bin)
(re-export font-ioskeley-mono-unhinted)
(re-export font-chhsich-nerd)
(re-export python-pysmart)
(re-export python-upp)
(re-export perl-data-password-zxcvbn)
(re-export alpine-make-rootfs)
(re-export epub-thumbnailer)
(re-export zenstates)
(re-export rust-docs)

;; recipe-resolver-260417an re-exports
(re-export fresh-editor-bin)
(re-export ferris-scan-bin)
(re-export iwmenu-bin)
(re-export pwmenu-bin)
(re-export bzmenu-bin)
(re-export sabiql-bin)
(re-export datui-bin)
(re-export dsw-bin)
(re-export seamonkey-bin)
(re-export neovide-bin)
(re-export paket-bin)
(re-export marktext-tkaixiang-bin)
(re-export stremio-service-bin)
(re-export maretf-bin)
(re-export vcard-studio-bin)
(re-export kanri-bin)
(re-export clash-geoip)
(re-export qtilitools)
(re-export osslsigncode)
(re-export apngasm)
(re-export libcava)
(re-export charliecloud)

;; deptree-resolver-260417ak re-exports
(re-export void-electron-latest-bin)
(re-export chatgqt)
(re-export redact-bin)

;; deptree-resolver-260417ao re-exports
(re-export opera-gx-bin)
(re-export raidrivecli)

;; recipe-resolver-260417ao re-exports
(re-export ttf-paratype)
(re-export culmus)
(re-export fortune-mod-montypython)
(re-export fortune-mod-matrix)
(re-export mythes-ru)
(re-export python-django-docs)
(re-export tiv)
(re-export deb2targz)
(re-export auto-auto-complete)
(re-export crunch)
(re-export vobcopy)
(re-export nnn-nerd)
(re-export pstate-frequency)
(re-export notify-send.sh)
(re-export xclicker)
(re-export python-steamgriddb)
(re-export perl-file-keepass)
(re-export systemd-cron)
(re-export sweep)

;; recipe-resolver-260417ap re-exports
(re-export ngrok)
(re-export mongodb-tools-bin)
(re-export kopia-bin)
(re-export blockbench-bin)
(re-export nexusmods-app-bin)
(re-export wootility)
(re-export kdrive-bin)
(re-export sparrow-wallet)
(re-export joplin-appimage)
(re-export insync)
(re-export microsoft-edge-beta-bin)
(re-export local-by-flywheel-bin)
(re-export exodus)
(re-export howdy-bin)
(re-export davmail)
(re-export brscan4)
(re-export spflashtool-bin)

;; recipe-resolver-260417aq re-exports
(re-export wscat)
(re-export apache-tools)
(re-export passwordsafe)
(re-export brother-hl2030)
(re-export kopia-ui-bin)

;; recipe-resolver-260417as re-exports
(re-export twitch-cli-bin)
(re-export fast-bin)
(re-export lux-dl-bin)
(re-export cheat-bin)
(re-export spoofdpi-bin)
(re-export circleci-cli-bin)
(re-export reader-bin)
(re-export tvmv-bin)
(re-export python-exifread)
(re-export python-colorzero)
(re-export python-simber)
(re-export python-ratelim)
(re-export python-requirements-detector)
(re-export python-itunespy)
(re-export python-geocoder)
(re-export python-vcstool)
(re-export python-pushbullet.py)
(re-export perl-mp3-tag)
(re-export perl-expect)
(re-export perl-rpc-xml)
(re-export perl-linux-desktopfiles)

;;; recipe-resolver-260417at
(re-export python-injector)
(re-export python-cerealizer)
(re-export python-hsaudiotag3k)
(re-export python-patch)
(re-export python-bcdoc)
(re-export python-daemonocle)
(re-export python-enzyme)
(re-export python-zfec)
(re-export python-py3nvml)
(re-export python-grip)
(re-export python-fudge)
(re-export perl-mp4-info)
(re-export perl-unicode-map)
(re-export perl-php-serialization)
(re-export perl-sys-mmap)
(re-export perl-ogg-vorbis-header)
(re-export perl-math-convexhull)
(re-export perl-math-libm)
(re-export perl-astro-suntime)

;;; recipe-resolver-260417au
(re-export dasel-bin)
(re-export dust-bin)
(re-export tre-command-bin)
(re-export dupe-krill-bin)
(re-export fstl)
(re-export neovim-plenary)
(re-export python-c-formatter-42)
(re-export perl-jq-lite)
(re-export fsign)
(re-export fontviewer)
(re-export scopebuddy)
(re-export deepchat-bin)
(re-export ripes-bin)
(re-export freeshow-bin)
(re-export alt-sendme-bin)
(re-export youtube-tui-full-bin)
(re-export clojure-lsp-bin)
(re-export pandoc-crossref-bin)
(re-export console2svg-bin)
(re-export wo-bin)
(re-export lazytail-bin)
(re-export funzzy-bin)
(re-export oken-bin)
(re-export workz-bin)
(re-export checkstyle-bin)
(re-export tmux-plugin-panel-bin)

;;; recipe-resolver-260417av
(re-export python-virt-lightning)
(re-export python-pulldocker)
(re-export python-ffmpegp)
(re-export python-git-user-manager)
(re-export python-terminal-widgets)
(re-export gga)
(re-export polybarman)
(re-export rofi-radio)
(re-export rofi-wifi-menu)
(re-export wttr)
(re-export ames)
(re-export pacleaner)
(re-export rofi-firefox-profiles)
(re-export rofi-surfraw)
(re-export rebar3-zsh-completion)
(re-export keylight-controller)
(re-export xkblayout-state)
(re-export nqptp)
(re-export procomp)
(re-export wandoo)

;;; recipe-resolver-260417aw
(re-export tmux-plugin-manager)
(re-export ossp)
(re-export font-kopub)
(re-export shimmer-wallpapers)
(re-export cachyos-ananicy-rules)
(re-export dosh)
(re-export domake)
(re-export nodenv-node-build)
(re-export barify)
(re-export grub2-theme-preview)
(re-export authselect)

;;; recipe-resolver-260417ax
(re-export tcping)
(re-export conserver)
(re-export sixpair)
(re-export libcsptr)
(re-export nx-udev)
(re-export usb-dirty-pages-udev)
(re-export breezex-cursor-theme)
(re-export catppuccin-grub-themes)
(re-export font-vazir-code)
(re-export font-all-the-icons)
(re-export numix-cursor-theme)
(re-export papirus-smplayer-theme)
(re-export whitesur-wallpapers)
(re-export tbsm)
(re-export forgit)
(re-export opf-fido)
(re-export keep-presence)

;;; recipe-resolver-260418a
(re-export tofu)
(re-export tunneled)
(re-export udisks2-qt5)
(re-export zashterminal)
(re-export lsfg-vk)
(re-export folo)
(re-export proton-mail)
(re-export openlist)
(re-export ggc)
(re-export bifrost)
(re-export ella)
(re-export longbridge-pro)
(re-export kerminal)
(re-export motus)
(re-export ultimate-tic-tac-toe)
(re-export zenta)
(re-export socialstreamninja)
(re-export streamlink-twitch-gui)
(re-export goradion)
(re-export neohtop)
(re-export thinkfan-tui)
(re-export mlpack)
(re-export eloquent)
(re-export cvs2svn)
(re-export glance)
(re-export iozone)
(re-export lazysql)
(re-export vale-ls)
(re-export gomodifytags)
(re-export noson-app)
(re-export brunsli)
(re-export lerc)
(re-export mongodb)
(re-export openssh-hpn)
(re-export smassh)
(re-export qp)
(re-export libcprime)
(re-export hackernews-tui)
(re-export wiredpanda)
(re-export tropy)
(re-export squawk-cli)
(re-export dietpdf)
(re-export cavasik)
(re-export zfxtop)
(re-export arpackpp)
(re-export python-dataset)
(re-export python-ormsgpack)
(re-export python-pyfluidsynth)
(re-export mpdpopm)
(re-export python-hbcl)
(re-export python-pprp)
(re-export usbmount)
(re-export dspdfviewer)
(re-export librsb)
(re-export razergenie)
(re-export taskjuggler)
(re-export topiary)
(re-export bsd-compat-headers)
(re-export corepdf)
(re-export hfsprogs)
(re-export wl-gammarelay)
(re-export wltile)
(re-export fortls)
(re-export libthreadar)
(re-export creduce)
(re-export oui)
(re-export memento)
(re-export ticker)
(re-export kforth-64)
(re-export zxbasic)
(re-export windutils)
(re-export sdformat-9)
(re-export icu75)
(re-export lets-burn)
(re-export unftp)
(re-export libx52)
(re-export windowmaker-extra)
(re-export xword-dl)
(re-export mingle)
(re-export bashmount)
(re-export stardict-full-rus-eng)
(re-export agar)
(re-export dict-devils)
(re-export landrun)
(re-export refine)
(re-export redlib)
(re-export libcmrt)
(re-export tap-plugins)
(re-export corefreq-server)
(re-export dict-freedict-eng-rus)
(re-export spacenavd)
(re-export clfmt)
(re-export k2pdfopt)
(re-export tabula)
(re-export godot3-as-bin)
(re-export mautrix-slack)
(re-export kpp)
(re-export python-puzpy)
(re-export mp3splt-gtk-docs)
(re-export vend)

;;; recipe-resolver-260418b
(re-export janet-lang)
(re-export go-mtpfs)
(re-export tiptop-cli)
(re-export seqtui)
(re-export terminal-typeracer)
(re-export hyprland-workspaces)
(re-export leakdice)
(re-export imapgoose)
(re-export mf-cli)
(re-export bitbake)
(re-export mvw)
(re-export tqftpserv)
(re-export wordlist-generator)
(re-export fts-transfer)
(re-export gomu)
(re-export gonic)
(re-export heirloom-doctools)
(re-export wired-notify)
(re-export ragnarwm)
(re-export polybar)
(re-export telegram-bot-api)
(re-export kst2)
(re-export vtun-ng)
(re-export marble-marcher-ce)
(re-export supersayer)
(re-export project-monalisa)
(re-export catnap)
(re-export greetd-qtgreet)
(re-export virtualbmc)
(re-export fcitx5-configtool)

;;; recipe-resolver-260418c
(re-export dmenu-emoji)
(re-export xattrvi)
(re-export zgen)
(re-export zaread)
(re-export yubikey-agent)
(re-export goplaying)
(re-export lazybeads)
(re-export unregistry)
(re-export fan2go)
(re-export bwlog)
(re-export dotr)
(re-export portablemc)
(re-export vane)
(re-export rustmission)
(re-export iamb)
(re-export vr-lighthouse)
(re-export ego)
(re-export pineapple-midi-player)
(re-export addwater)
(re-export embellish)
(re-export recorder)
(re-export virtnbdbackup)
(re-export brightness-slider)
(re-export libreoffice-extension-grammalecte-fr)

;;; deptree-resolver-260418d
(re-export binance-app)
(re-export brother-mfc-j5720dw)
(re-export c++utilities)
(re-export claudes-c-compiler)
(re-export datagrip-jre)
(re-export deemix-gui-appimage)
(re-export framework-control)
(re-export gsdb)
(re-export hyperhdr-git)
(re-export memtest86-efi)
(re-export mkchromecast-git)
(re-export nginx-mod-cgi)
(re-export niri-companion)
(re-export np2kai-git)
(re-export ocudu)
(re-export pdflib-lite)
(re-export profile-sync-daemon-edge)
(re-export python-mtga-helper-git)
(re-export qtutilities-qt6)
(re-export ripple)
(re-export sail-model)
(re-export subliminal)
(re-export syncthingtray)
(re-export vim-youcompleteme-git)

;;; recipe-resolver-260418f
(re-export c-lolcat)
(re-export celt)
(re-export uhubctl)
(re-export ksh93-git)
(re-export libretro-prboom-git)
(re-export libretro-neocd-git)
(re-export libretro-fuse-git)
(re-export funchook)
(re-export vulkanscenegraph)
(re-export qdia)
(re-export dolphin-memory-engine)
(re-export eternity-engine-git)
(re-export inter-doom)
(re-export inter-heretic)
(re-export inter-hexen)
(re-export blobdrop-git)
(re-export obs-noise)
(re-export wizstr)
(re-export clad)
(re-export swaylock-plugin)
(re-export linux-router)
(re-export faint)
(re-export kraiser)
(re-export pass-ln)
(re-export statecraft)
(re-export git-hash-select)
(re-export passless-boot)
(re-export latynka-kbd)
(re-export itch-setup-bin)
(re-export papirus-folders-git)
(re-export gpufetch-nocuda-git)
(re-export libgksu)
(re-export gksu)
(re-export trilinos-git)
(re-export sope)
(re-export sogo)

;;; recipe-resolver-260418h
(re-export ttf-symbola)
(re-export otf-symbola)
(re-export svxlink-sounds-en-us-heather-16k)
(re-export devkit-env)
(re-export random)
(re-export kak-ansi)
(re-export jelly)
(re-export fladder-bin)
(re-export parm-bin)
(re-export opendeck-bin)
(re-export piliplus-bin)
(re-export hyprshell-bin)
(re-export python-pandas-docs)
(re-export desktopius)
(re-export nextcloud-app-user-usage-report)
(re-export kak-bundle-git)
(re-export duperemove-service)
(re-export tlp-rdw-systemd)
(re-export mii-emu)
(re-export sedutil)
(re-export motion-git)
(re-export nikki-editor)
(re-export responder)
(re-export libreoffice-extension-h2orestart)
(re-export pipewire-module-xrdp)
(re-export libnick)
(re-export maddy)

;;; recipe-resolver-260418i
(re-export pkg2appimage)
(re-export webcord-equicord-git)
(re-export subs2srs-mono-git)
(re-export subs2srs-gui)
(re-export livebook)
(re-export fchat-horizon-appimage)
(re-export monocoque)
(re-export fchat-horizon-git)
(re-export proton-mail-desktop)
(re-export en-croissant)
(re-export proton-authenticator)
(re-export adguardhome-bin)
(re-export chmod-cli)
(re-export recon-ng)
(re-export crazydiskinfo)
(re-export moor)
(re-export geforce-infinity)
(re-export flatpost)
(re-export pvetui)
(re-export ddhx)
(re-export gittyup-appimage)
(re-export kwin-karousel)
(re-export ufw-docker)
(re-export google-breakpad)
(re-export gnome-shell-extension-hibernate-status)
(re-export intel-media-driver-legacy)
(re-export pulse-visualizer)
(re-export trustedqsl)
(re-export grub-customizer)
(re-export boomaga)
(re-export c3c-bin)
(re-export freetube-nightly-bin)
(re-export teams-for-linux-git)
(re-export stabilitymatrix-bin)
(re-export looking-glass-client)
(re-export obs-plugin-looking-glass)
(re-export neo4j-community-bin)
(re-export stable-diffusion-webui)
(re-export darkly)
(re-export webapp-manager)
(re-export rbackup)
(re-export gnome-network-displays)
(re-export xdg-terminal-exec)
(re-export youtube-dl-nightly-bin)
(re-export quickemu)
(re-export xviewer-plugins)
(re-export xviewer)
(re-export dxvk-nvapi-vkreflex-layer)
(re-export httptoolkit-bin)
(re-export freetube-bin)
(re-export zoi)
(re-export osu-lazer-bin)
(re-export openai-codex)
(re-export whisper-cpp)
(re-export gale)
(re-export vet)
(re-export whatsapp-for-linux)
(re-export swhkd)
(re-export zelda64recomp-bin)
(re-export archivemount-ng)
(re-export ipfs-desktop-appimage)
(re-export kde-material-you-colors)
(re-export xfce-polkit)
(re-export activitywatch-bin)
(re-export claude-code-router)
(re-export indi-3rdparty-libs)
(re-export libfprint-2-tod1-goodix-v2)
(re-export debtap)
(re-export libmp3splt-docs)
(re-export piper-tts-bin)
(re-export rutoken)
(re-export quarkdown)
(re-export extract-xiso)
(re-export code-server-bin)
(re-export pegasus-frontend)
(re-export hyde-cli)
(re-export deflemask-bin)
(re-export jdk-openjdk-wakefield)
(re-export jre-openjdk-wakefield)
(re-export jre-openjdk-wakefield-headless)
(re-export openjdk-wakefield-doc)
(re-export openjdk-wakefield-src)
(re-export openssh-hpn-shim)
(re-export lenovolegionlinux)
(re-export python-libpulse)
(re-export svt-av1-psy)
(re-export epsxe-plugin-gpu-soft)
(re-export cssmodules-language-server)
(re-export python-mmdetection)
(re-export pico-sdk-develop)
(re-export u2f-udev-rules-feitian)
(re-export thincast-client-bin)
(re-export fcitx5-toki-pona)
(re-export pulseaudio-dlna-cygn)
(re-export piri)
(re-export lrz-syncshare)
(re-export devzat)

; deptree-resolver-260418j
(re-export iup)
(re-export ttf-ms-office365)
(re-export fonts-apple)
(re-export lib32-amdvlk-bin)
(re-export otf-apple-pingfang)
(re-export otf-apple-pingfang-relaxed)
(re-export otf-apple-pingfang-ui)
(re-export palemoon-i18n-fr)
(re-export seamonkey-i18n-es-es)
(re-export code-server-marketplace)
(re-export gde-creator-bin)
(re-export libfprint-2-tod1-broadcom)
(re-export ntsync-dkms)
(re-export odoo18-nightly)
(re-export rice-switcher)
(re-export 8192eu-dkms-git)
(re-export arch-shell)
(re-export dude-bin)
(re-export mt76-dkms-git)
(re-export parus)
(re-export pacwall-git)
(re-export pypy3-pyparsing)
(re-export rtl8821ce-dkms-git)
(re-export cn-dascom-pin-driver)
(re-export lib32-liblrdf)
(re-export selinux-refpolicy-arch-git)
(re-export starsector)
(re-export asp)
(re-export deezer)
(re-export ec-su-axb35-dkms-git)
(re-export fnq-monitor)
(re-export olauncher)
(re-export gdrcopy)
(re-export devkitty-git)
(re-export xilinx-ise)
(re-export pamac-all)
(re-export python-torchaudio-rocm)
(re-export aiot-ide)
(re-export vitis)
(re-export lua-iup)
(re-export lua51-iup)
(re-export lua52-iup)
(re-export lua53-iup)

; recipe-resolver-260418k
(re-export safe-rm)
(re-export parui)
(re-export fackr)
(re-export wleave)
(re-export wl-mpris-idle-inhibit)
(re-export mdcat)
(re-export relax-player)
(re-export ollama-proxy)
(re-export firp)
(re-export mkvextract-gtk)
(re-export faff)
(re-export nvidia-prime-rtd3pm)
(re-export onionspray)
(re-export ani-rss)
(re-export sc)
(re-export mongotimer)
(re-export calculix-ccx)
(re-export dosh-posh)
(re-export dasel)
(re-export findmydeviceserver)
(re-export gtkhash)
(re-export wallpicker)
(re-export sticker-convert)
(re-export playtimed)
(re-export python-opencensus)
(re-export python-uv-dynamic-versioning)
(re-export python-hvplot)
(re-export yt-dlg)
(re-export aria2tui)

;; recipe-resolver-260418l (100 packages)
(re-export meteor)
(re-export turso)
(re-export crowdsec-firewall-bouncer-iptables)
(re-export crowdsec-firewall-bouncer-nftables)
(re-export rmfakecloud)
(re-export twitch-cli)
(re-export bgpq4)
(re-export protoscope)
(re-export adif-multitool)
(re-export dockle)
(re-export oras)
(re-export mautrix-signal)
(re-export mockery)
(re-export kubectl-slice)
(re-export fabric-ai)
(re-export keybase)
(re-export artem)
(re-export ttdl)
(re-export bzmenu)
(re-export minidsp-rs)
(re-export yara-x)
(re-export rustowl)
(re-export timewall)
(re-export shadowenv)
(re-export alass)
(re-export meli)
(re-export ff2mpv-rust)
(re-export youtui)
(re-export rusty-man)
(re-export geopard)
(re-export chezmoi-modify-manager)
(re-export ttynote)
(re-export newfetch)
(re-export python-langgraph-checkpoint)
(re-export python-langgraph-sdk)
(re-export python-langgraph-cli)
(re-export python-langgraph-prebuilt)
(re-export python-langgraph-checkpoint-sqlite)
(re-export python-langgraph)
(re-export python-aiomax)
(re-export python-gql)
(re-export python-zenlib)
(re-export python-sparklines)
(re-export python-mfusepy)
(re-export python-pycpio)
(re-export python-aioboto3)
(re-export python-pyrr)
(re-export python-isosurfaces)
(re-export python-toml-sort)
(re-export pyzbar)
(re-export tzupdate)
(re-export python-anthropic)
(re-export mkdocs-include-markdown-plugin)
(re-export fypp)
(re-export python-leveldb)
(re-export camset)
(re-export blockdiag)
(re-export seqdiag)
(re-export mimeo)
(re-export changedetection.io)
(re-export anki-sync-server)
(re-export systemd-pilot)
(re-export thinkfan-cli)
(re-export qdocumentview)
(re-export paho-mqtt-c)
(re-export paho-mqtt-cpp)
(re-export cutechess)
(re-export pokefinder)
(re-export cargs)
(re-export audiowaveform)
(re-export vnote)
(re-export codelite)
(re-export pdftag)
(re-export mednaffe)
(re-export mp3splt-gtk)
(re-export moon-buggy)
(re-export mmv)
(re-export stressapptest)
(re-export aview)
(re-export netatalk)
(re-export miracle-wm)
(re-export plank-reloaded)
(re-export fontdownloader)
(re-export ascii-draw)
(re-export televido)
(re-export textlint)
(re-export nodejs-nodemon)
(re-export aicommits)
(re-export nodejs-neovim)
(re-export hdfview-bin)
(re-export openvscode-server-bin)
(re-export coursier-bin)
(re-export airvpn-suite-beta-bin)
(re-export marktext-bin)
(re-export github-desktop-bin)
(re-export frog-ocr-bin)
(re-export nym-vpn-app-bin)
(re-export wayback-machine-downloader)

;; recipe-resolver-260418m
(re-export nextdns-bin)
(re-export neohtop-bin)
(re-export dissent-bin)
(re-export netcoredbg-bin)
(re-export ytsubconverter-bin)
(re-export naps2-bin)
(re-export speedtest-go)
(re-export glab)
(re-export windows-10-cursor)
(re-export wealthfolio-bin)
(re-export cromite-bin)
(re-export menulibre)
(re-export dmscripts)
(re-export lotion)
(re-export miniconda3)
(re-export freeoffice)
(re-export knime-desktop)
(re-export curseforge-appimage)

;; recipe-resolver-260418n
(re-export plasmazones-bin)
(re-export rustdesk-bin)
(re-export qt-sudo)
(re-export clamav-gui)
(re-export namp)
(re-export samsung-ssd-fwupdate)
(re-export prefixer)
(re-export appimagelauncher-bin)
(re-export millennium-bin)

;; recipe-resolver-260418o
(re-export errands-c)
(re-export netcheck)
(re-export flatpak-builder-tools)
(re-export shutter-encoder)
(re-export phonon-mpv)

;; recipe-resolver-260418p
(re-export otf-alegreya)
(re-export ttf-alegreya)
(re-export otf-bebas-neue)
(re-export otf-gnutypewriter)
(re-export otf-chunk)
(re-export otf-chomsky)
(re-export otf-churchslavonic)
(re-export otf-exo)
(re-export otf-lalezar)
(re-export ttf-lalezar)
(re-export otf-compagnon)
(re-export otf-daubenton)
(re-export ttf-daubenton)
(re-export otf-drafting)
(re-export otf-montagu-slab)
(re-export otf-zilla-slab)
(re-export otf-yanone-kaffeesatz)
(re-export otf-shantell-sans)
(re-export otf-fanwood)
(re-export otf-sn-pro)
(re-export otf-kermit)
(re-export ttf-old-timey-mono)
(re-export otf-secuela)
(re-export ttf-geosans-light)
(re-export woff2-intel-one-mono)
(re-export otf-beowulfot)
(re-export otf-lora-cyrillic)
(re-export ttf-lora-cyrillic)
(re-export otf-marta)
(re-export otf-ronduit-capitals)
(re-export otf-srbija-sans)
(re-export ttf-shantell-sans-variable)
(re-export ttf-secuela)
(re-export ttf-secuela-variable)
(re-export afetch)
(re-export amfora)
(re-export clipse)
(re-export pplatex)
(re-export bdsync)
(re-export zram-init)
(re-export opentracker)
(re-export wxhexeditor)
(re-export pnginfo)
(re-export mkcue)
(re-export hashes)
(re-export artha)
(re-export tor-ctrl)
(re-export dong)
(re-export boatswain)
(re-export lnk)
(re-export memorize)
(re-export ponysay)
(re-export colorsearch)
(re-export newscheck)
(re-export highscore)
(re-export flam3)
(re-export crengine-ng)
(re-export ocesql)
(re-export idsk)
(re-export refind-btrfs)
(re-export gsocket)
(re-export python-obsws)
(re-export python-pywavefront)
(re-export mkdocs-exclude)
(re-export dnstwist)
(re-export python-rtslib-fb)
(re-export aspell-dict-sl)
(re-export aspell-dict-sr)
(re-export fortune-mod-bofh-excuses)
(re-export fortune-mod-vimtips)
(re-export funny-manpages)
(re-export hunspell-ru-aot)
(re-export hyphen-pl)
(re-export words-sv)
(re-export osspd)
(re-export termora-bin)
(re-export fakturama)
(re-export sonarr-bin)
(re-export silverbullet-bin)
(re-export electron30-bin)
(re-export sourcegit-bin)
(re-export libcryptui)
(re-export woff2-annotation-mono)
(re-export woff2-annotation-mono-variable)
(re-export gnome-shell-extension-ubuntu-dock)
(re-export gnome-shell-extension-top-bar-organizer)
(re-export gpu-screen-recorder-notification)
(re-export gpu-screen-recorder)
(re-export gpu-screen-recorder-gtk)
(re-export gpu-screen-recorder-ui)
(re-export libresplit)
(re-export gimp-plugin-gmic-qt)
(re-export gr-limesdr)
(re-export gr-foo)
(re-export gr-ieee802-11)
(re-export gr-lora-sdr)
(re-export green-recorder)
(re-export taskfile-to-tasks-python)
(re-export gnome-x11-gesture-daemon)
(re-export piper-voices-ru-ru)

;; recipe-resolver-260418t
(re-export gstreamer0.10-base-plugins)
(re-export idris2-algebra)
(re-export idris2-elab-util)
(re-export idris2-getopts)
(re-export idris2-parser-all)
(re-export idris2-parser)
(re-export idris2-prettier)
(re-export idris2-refined)
(re-export idris2-sop)
(re-export freetype2-wps)
(re-export 123elf)
(re-export gauntlet)
(re-export go-foks)
(re-export polybar-dwm)
(re-export python-langgraph-checkpoint-postgres)
(re-export so)
(re-export zelda64recomp)
(re-export raiderio-client)
(re-export weakauras-companion)
(re-export valentina-studio)
(re-export input-actions)
(re-export svelte-language-server)
(re-export typescript-go)
(re-export renoise-demo)
(re-export hyprprop)
(re-export detect-tablet-mode)
(re-export hyprevents)
(re-export lazyusf2)
(re-export brother-dcp-j1050dw)
(re-export iw4x-launcher)
(re-export psflib)
(re-export ruby-ruby-wasm)
(re-export saxon-he)
(re-export texlive-garamondx)
(re-export jupyter-latex-envs)
(re-export pypy3-cython)
(re-export easytranscript)
(re-export python-mshr)
(re-export brew)
(re-export networkmanager-openvpn-xor)
(re-export chrome-manifest-v2-policy)
(re-export python-numpy-mkl)
(re-export nerdshade)
(re-export libva-intel-driver-irql)
(re-export pixivfe)
(re-export skyscraper)
(re-export emulationstation)
(re-export nym-vpnd)
(re-export guix-installer)
(re-export web-greeter)
(re-export dmenu-extended)
(re-export labymodlauncher-appimage)
(re-export intel-ucode-platomav)
(re-export cosmic-ext-applet-privacy-indicator)
(re-export stremio-linux-shell)
(re-export helix-gpt)
(re-export oh-my-git)
(re-export dislocker-noruby)
(re-export wine-valve)
(re-export garage-webui)
(re-export paf-notify)
(re-export neo4j-desktop)
(re-export caddy-desec)
(re-export python-stumpy)
(re-export sunfalo)
(re-export perl-cpanplus-dist-arch)
(re-export brother-mfc-9332cdw)
(re-export steam-big-picture-session)
(re-export waybar-module-music)
(re-export snapmate)
(re-export decklink)
(re-export mediaexpress)
(re-export chromium-extension-privacybadger)
(re-export crosswords-puzzle-sets-keesing)
(re-export d4m)
(re-export liblastfm-qt6)
(re-export nkt)
(re-export samrewritten-legacy)
(re-export vinyl-papers)
(re-export xtool-creative-space)
(re-export brn)
(re-export ros2-kilted-base)
(re-export deadbeef-plugin-statusnotifier)
(re-export rollo-printer)
(re-export shellcheck-bin-doc)
(re-export godot3-export-templates)
(re-export libsignal-ffi)
(re-export scenefx-0.2)
(re-export azahar-appimage)
(re-export finalshell)
(re-export mpv-webm)
(re-export hedgemodmanager)
(re-export intel-hybrid-codec-driver)
(re-export languagetool-ngrams-de)
(re-export pi-hole-core)
(re-export pycdc)
(re-export wayneko)
(re-export sfwbar)

(re-export ubuntu-mate-icon-themes)
(re-export corefreq-client)
(re-export diskm8)
(re-export php-phalcon)
(re-export airshipper)
(re-export contextpilot-git)
(re-export gamescope-session-git)
(re-export omniorbpy)
(re-export gprofng-gui)
(re-export sequoia-octopus-librnp)
(re-export streampager)
(re-export twitter-media-downloader-git)
(re-export codanna)
(re-export hmcl-dev)
(re-export mbtiles)
(re-export falcond)
(re-export hypr-dock)
(re-export ibus-lotus)
(re-export kx-aspe-git)
(re-export musique111-qt5)
(re-export sqlite-dist)
(re-export halloy-git)
(re-export terraform-local)
(re-export galaxy-flasher)
(re-export python-pjproject)
(re-export golden-cheetah-git)
;;; --- recipe-resolver-260418w: 18 compat aliases ---
;;; python-dashtable already in recipe-resolver-260417af compat

(define-public python-certbot-pkcs12
  (package
    (inherit python-certbot-pkcs12)
    (name "python-certbot-pkcs12")))

(define-public python-spitch
  (package
    (inherit python-spitch)
    (name "python-spitch")))

(define-public python-invocation-tree
  (package
    (inherit python-invocation-tree)
    (name "python-invocation-tree")))

(define-public python-dukpy
  (package
    (inherit python-dukpy)
    (name "python-dukpy")))

(define-public python-pyexcel-ezodf
  (package
    (inherit python-pyexcel-ezodf)
    (name "python-pyexcel-ezodf")))

(define-public wallman
  (package
    (inherit wallman)
    (name "wallman")))

(define-public ttf-piazzolla
  (package
    (inherit ttf-piazzolla)
    (name "ttf-piazzolla")))

(define-public stardict-full-eng-rus
  (package
    (inherit stardict-full-eng-rus)
    (name "stardict-full-eng-rus")))

(define-public xdg-sound
  (package
    (inherit xdg-sound)
    (name "xdg-sound")))

(define-public alttab
  (package
    (inherit alttab)
    (name "alttab")))

(define-public gekkfetch
  (package
    (inherit gekkfetch)
    (name "gekkfetch")))

(define-public jellyfetch
  (package
    (inherit jellyfetch)
    (name "jellyfetch")))

(define-public tombl-bin
  (package
    (inherit tombl-bin)
    (name "tombl-bin")))

(define-public klog-time-tracker-bin
  (package
    (inherit klog-time-tracker-bin)
    (name "klog-time-tracker-bin")))

(define-public opkssh-bin
  (package
    (inherit opkssh-bin)
    (name "opkssh-bin")))

(define-public puma-dev-bin
  (package
    (inherit puma-dev-bin)
    (name "puma-dev-bin")))

(define-public rqlite-bin
  (package
    (inherit rqlite-bin)
    (name "rqlite-bin")))

(define-public wdisplays-persistent
  (package
    (inherit wdisplays-persistent)
    (name "wdisplays-persistent")))


;;; --- recipe-resolver-260418y: 30 compat aliases ---

(define-public atlauncher
  (package
    (inherit atlauncher)
    (name "atlauncher")))

(define-public mindustry
  (package
    (inherit mindustry)
    (name "mindustry")))

(define-public mindustry-server
  (package
    (inherit mindustry-server)
    (name "mindustry-server")))

(define-public polymc
  (package
    (inherit polymc)
    (name "polymc")))

(define-public sabnzbd
  (package
    (inherit sabnzbd)
    (name "sabnzbd")))

(define-public arronax
  (package
    (inherit arronax)
    (name "arronax")))

(define-public audiveris
  (package
    (inherit audiveris)
    (name "audiveris")))

(define-public pcbdraw
  (package
    (inherit pcbdraw)
    (name "pcbdraw")))

(define-public plasma6-applets-resources-monitor
  (package
    (inherit plasma6-applets-resources-monitor)
    (name "plasma6-applets-resources-monitor")))

(define-public plasma6-applets-panel-spacer-extended
  (package
    (inherit plasma6-applets-panel-spacer-extended)
    (name "plasma6-applets-panel-spacer-extended")))

(define-public gnome-shell-extension-top-bar-organizer
  (package
    (inherit gnome-shell-extension-top-bar-organizer)
    (name "gnome-shell-extension-top-bar-organizer")))

(define-public piper-voices-ru-ru
  (package
    (inherit piper-voices-ru-ru)
    (name "piper-voices-ru-ru")))

(define-public python-fmod-toolkit-git
  (package
    (inherit python-fmod-toolkit-git)
    (name "python-fmod-toolkit-git")))

(define-public uefi-manager
  (package
    (inherit uefi-manager)
    (name "uefi-manager")))

(define-public bitbox-wallet-app-rpm
  (package
    (inherit bitbox-wallet-app-rpm)
    (name "bitbox-wallet-app-rpm")))

(define-public alacritty-use-theme-git
  (package
    (inherit alacritty-use-theme-git)
    (name "alacritty-use-theme-git")))

(define-public dare-devil
  (package
    (inherit dare-devil)
    (name "dare-devil")))

(define-public libxnvctrl-340xx
  (package
    (inherit libxnvctrl-340xx)
    (name "libxnvctrl-340xx")))

(define-public icamerasrc-git
  (package
    (inherit icamerasrc-git)
    (name "icamerasrc-git")))

(define-public rescrobbled-git
  (package
    (inherit rescrobbled-git)
    (name "rescrobbled-git")))

(define-public lrclibfetch
  (package
    (inherit lrclibfetch)
    (name "lrclibfetch")))

(define-public maki-cli
  (package
    (inherit maki-cli)
    (name "maki-cli")))

(define-public lbn
  (package
    (inherit lbn)
    (name "lbn")))

(define-public keepassxc-git
  (package
    (inherit keepassxc-git)
    (name "keepassxc-git")))

(define-public libmysqlclient
  (package
    (inherit libmysqlclient)
    (name "libmysqlclient")))

(define-public goxlr-utility
  (package
    (inherit goxlr-utility)
    (name "goxlr-utility")))

(define-public aegisub-arch1t3cht-git
  (package
    (inherit aegisub-arch1t3cht-git)
    (name "aegisub-arch1t3cht-git")))

(define-public hyprland-per-window-layout
  (package
    (inherit hyprland-per-window-layout)
    (name "hyprland-per-window-layout")))

(define-public mysql-clients
  (package
    (inherit mysql-clients)
    (name "mysql-clients")))

(define-public gr-lora_sdr-git
  (package
    (inherit gr-lora_sdr-git)
    (name "gr-lora_sdr-git")))

(re-export krillinai-bin)
(re-export xcursor-openzone)
(re-export backlight-sync-git)
(re-export dict-ozhegov)
(re-export profile-sync-daemon-git)
(re-export python-system-hotkey)
(re-export brightness-controller-git)
(re-export hyprcap)
(re-export niripwmenu)
(re-export python-opcua-asyncio)


;;; --- recipe-resolver-260418z: 30 compat aliases ---

(define-public jdk21-temurin
  (package
    (inherit jdk21-temurin)
    (name "jdk21-temurin")))

(define-public java17-openjfx-bin
  (package
    (inherit java17-openjfx-bin)
    (name "java17-openjfx-bin")))

(define-public bindiff
  (package
    (inherit bindiff)
    (name "bindiff")))

(define-public electronwmd-bin
  (package
    (inherit electronwmd-bin)
    (name "electronwmd-bin")))

(define-public clash-verge-rev-autobuild-bin
  (package
    (inherit clash-verge-rev-autobuild-bin)
    (name "clash-verge-rev-autobuild-bin")))

(define-public anime-games-launcher-bin
  (package
    (inherit anime-games-launcher-bin)
    (name "anime-games-launcher-bin")))

(define-public plymouth-theme-mikuboot-git
  (package
    (inherit plymouth-theme-mikuboot-git)
    (name "plymouth-theme-mikuboot-git")))

(define-public fonts-meta-base
  (package
    (inherit fonts-meta-base)
    (name "fonts-meta-base")))

(define-public libtrash
  (package
    (inherit libtrash)
    (name "libtrash")))

(define-public ntfsprogs-plus-git
  (package
    (inherit ntfsprogs-plus-git)
    (name "ntfsprogs-plus-git")))

(define-public scolorpicker-legacy
  (package
    (inherit scolorpicker-legacy)
    (name "scolorpicker-legacy")))

(define-public gpgfrontend
  (package
    (inherit gpgfrontend)
    (name "gpgfrontend")))

(define-public cervisia
  (package
    (inherit cervisia)
    (name "cervisia")))

(define-public hyprqt6engine-git
  (package
    (inherit hyprqt6engine-git)
    (name "hyprqt6engine-git")))

(define-public libresplit-git
  (package
    (inherit libresplit-git)
    (name "libresplit-git")))

(define-public linux-enable-ir-emitter
  (package
    (inherit linux-enable-ir-emitter)
    (name "linux-enable-ir-emitter")))

(define-public gpu-screen-recorder-git
  (package
    (inherit gpu-screen-recorder-git)
    (name "gpu-screen-recorder-git")))

(define-public libinput-no-gestures
  (package
    (inherit libinput-no-gestures)
    (name "libinput-no-gestures")))

(define-public python-aioice
  (package
    (inherit python-aioice)
    (name "python-aioice")))

(define-public taskfile-to-tasks-python-git
  (package
    (inherit taskfile-to-tasks-python-git)
    (name "taskfile-to-tasks-python-git")))

(define-public green-recorder
  (package
    (inherit green-recorder)
    (name "green-recorder")))

(define-public sot
  (package
    (inherit sot)
    (name "sot")))

(define-public marimo
  (package
    (inherit marimo)
    (name "marimo")))

(define-public srtodo-git
  (package
    (inherit srtodo-git)
    (name "srtodo-git")))

(define-public btrfs-desktop-notification-git
  (package
    (inherit btrfs-desktop-notification-git)
    (name "btrfs-desktop-notification-git")))

(define-public lunarvim-git
  (package
    (inherit lunarvim-git)
    (name "lunarvim-git")))

(define-public go-prism
  (package
    (inherit go-prism)
    (name "go-prism")))

(define-public gnome-shell-extension-space-bar-git
  (package
    (inherit gnome-shell-extension-space-bar-git)
    (name "gnome-shell-extension-space-bar-git")))

(define-public python-zxing-cpp
  (package
    (inherit python-zxing-cpp)
    (name "python-zxing-cpp")))

(define-public hid-velocityone-multi-shift
  (package
    (inherit hid-velocityone-multi-shift)
    (name "hid-velocityone-multi-shift")))


;;; --- recipe-resolver-260418aa: 93 compat aliases ---

(define-public testssl-sh-git
  (package
    (inherit testssl-sh-git)
    (name "testssl-sh-git")))

(define-public ipfs-desktop-electron
  (package
    (inherit ipfs-desktop-electron)
    (name "ipfs-desktop-electron")))

(define-public minecraft-ttf-git
  (package
    (inherit minecraft-ttf-git)
    (name "minecraft-ttf-git")))

(define-public netmount
  (package
    (inherit netmount)
    (name "netmount")))

(define-public pilot-link-git
  (package
    (inherit pilot-link-git)
    (name "pilot-link-git")))

(define-public sview-git
  (package
    (inherit sview-git)
    (name "sview-git")))

(define-public bellybutton
  (package
    (inherit bellybutton)
    (name "bellybutton")))

(define-public hyprland-toggle-tiling-git
  (package
    (inherit hyprland-toggle-tiling-git)
    (name "hyprland-toggle-tiling-git")))

(define-public ptr89-git
  (package
    (inherit ptr89-git)
    (name "ptr89-git")))

(define-public yd-go-git
  (package
    (inherit yd-go-git)
    (name "yd-go-git")))

(define-public firefox-stylus
  (package
    (inherit firefox-stylus)
    (name "firefox-stylus")))

(define-public websurfx-git
  (package
    (inherit websurfx-git)
    (name "websurfx-git")))

(define-public gridtracker2
  (package
    (inherit gridtracker2)
    (name "gridtracker2")))

(define-public ossutil
  (package
    (inherit ossutil)
    (name "ossutil")))

(define-public qkdisplays
  (package
    (inherit qkdisplays)
    (name "qkdisplays")))

(define-public cht-sh-git
  (package
    (inherit cht-sh-git)
    (name "cht-sh-git")))

(define-public skyemu-git
  (package
    (inherit skyemu-git)
    (name "skyemu-git")))

(define-public ddctoolbox-git
  (package
    (inherit ddctoolbox-git)
    (name "ddctoolbox-git")))

(define-public ssmsh
  (package
    (inherit ssmsh)
    (name "ssmsh")))

(define-public agbplay-git
  (package
    (inherit agbplay-git)
    (name "agbplay-git")))

(define-public dbibackend
  (package
    (inherit dbibackend)
    (name "dbibackend")))

(define-public usenti
  (package
    (inherit usenti)
    (name "usenti")))

(define-public brother-dcp-l2500d
  (package
    (inherit brother-dcp-l2500d)
    (name "brother-dcp-l2500d")))

(define-public gpgme-1
  (package
    (inherit gpgme-1)
    (name "gpgme-1")))

(define-public transmission3-cli-noupnp
  (package
    (inherit transmission3-cli-noupnp)
    (name "transmission3-cli-noupnp")))

(define-public pterodactyl-panel
  (package
    (inherit pterodactyl-panel)
    (name "pterodactyl-panel")))

(define-public velocity-xbox360-git
  (package
    (inherit velocity-xbox360-git)
    (name "velocity-xbox360-git")))

(define-public gnuplot-headless
  (package
    (inherit gnuplot-headless)
    (name "gnuplot-headless")))

(define-public ida-free
  (package
    (inherit ida-free)
    (name "ida-free")))

(define-public ksar-bin
  (package
    (inherit ksar-bin)
    (name "ksar-bin")))

(define-public gwenview-no-purpose
  (package
    (inherit gwenview-no-purpose)
    (name "gwenview-no-purpose")))

(define-public rime-project-trans-bin
  (package
    (inherit rime-project-trans-bin)
    (name "rime-project-trans-bin")))

(define-public java21-openjfx
  (package
    (inherit java21-openjfx)
    (name "java21-openjfx")))

(define-public java21-openjfx-doc
  (package
    (inherit java21-openjfx-doc)
    (name "java21-openjfx-doc")))

(define-public java21-openjfx-src
  (package
    (inherit java21-openjfx-src)
    (name "java21-openjfx-src")))

(define-public moedict
  (package
    (inherit moedict)
    (name "moedict")))

(define-public pomodoro-logger
  (package
    (inherit pomodoro-logger)
    (name "pomodoro-logger")))

(define-public twin
  (package
    (inherit twin)
    (name "twin")))

(define-public otf-beowulfot
  (package
    (inherit otf-beowulfot)
    (name "otf-beowulfot")))

(define-public eot-lalezar
  (package
    (inherit eot-lalezar)
    (name "eot-lalezar")))

(define-public ttf-lalezar
  (package
    (inherit ttf-lalezar)
    (name "ttf-lalezar")))

(define-public woff2-lalezar
  (package
    (inherit woff2-lalezar)
    (name "woff2-lalezar")))

(define-public chalice
  (package
    (inherit chalice)
    (name "chalice")))

(define-public otf-compagnon
  (package
    (inherit otf-compagnon)
    (name "otf-compagnon")))

(define-public otf-drafting
  (package
    (inherit otf-drafting)
    (name "otf-drafting")))

(define-public ttf-drafting-variable
  (package
    (inherit ttf-drafting-variable)
    (name "ttf-drafting-variable")))

(define-public ttf-montagu-slab
  (package
    (inherit ttf-montagu-slab)
    (name "ttf-montagu-slab")))

(define-public ttf-montagu-slab-variable
  (package
    (inherit ttf-montagu-slab-variable)
    (name "ttf-montagu-slab-variable")))

(define-public otf-zilla-slab
  (package
    (inherit otf-zilla-slab)
    (name "otf-zilla-slab")))

(define-public ttf-yanone-kaffeesatz
  (package
    (inherit ttf-yanone-kaffeesatz)
    (name "ttf-yanone-kaffeesatz")))

(define-public ttf-yanone-kaffeesatz-infinality
  (package
    (inherit ttf-yanone-kaffeesatz-infinality)
    (name "ttf-yanone-kaffeesatz-infinality")))

(define-public ltfs-git
  (package
    (inherit ltfs-git)
    (name "ltfs-git")))

(define-public tail-tray
  (package
    (inherit tail-tray)
    (name "tail-tray")))

(define-public extracker-git
  (package
    (inherit extracker-git)
    (name "extracker-git")))

(define-public clickup
  (package
    (inherit clickup)
    (name "clickup")))

(define-public bricscad
  (package
    (inherit bricscad)
    (name "bricscad")))

(define-public whisper-cpp-model-small
  (package
    (inherit whisper-cpp-model-small)
    (name "whisper-cpp-model-small")))

(define-public impro-visor
  (package
    (inherit impro-visor)
    (name "impro-visor")))

(define-public whisper-cpp-model-tiny
  (package
    (inherit whisper-cpp-model-tiny)
    (name "whisper-cpp-model-tiny")))

(define-public kbfs
  (package
    (inherit kbfs)
    (name "kbfs")))

(define-public keybase-gui
  (package
    (inherit keybase-gui)
    (name "keybase-gui")))

(define-public nouveau-fw
  (package
    (inherit nouveau-fw)
    (name "nouveau-fw")))

(define-public firefox-sync
  (package
    (inherit firefox-sync)
    (name "firefox-sync")))

(define-public wayprompt
  (package
    (inherit wayprompt)
    (name "wayprompt")))

(define-public todesk-rpm-bin
  (package
    (inherit todesk-rpm-bin)
    (name "todesk-rpm-bin")))

(define-public forge-gui-desktop
  (package
    (inherit forge-gui-desktop)
    (name "forge-gui-desktop")))

(define-public edu-sync
  (package
    (inherit edu-sync)
    (name "edu-sync")))

(define-public digilent-waveforms
  (package
    (inherit digilent-waveforms)
    (name "digilent-waveforms")))

(define-public axosyslog
  (package
    (inherit axosyslog)
    (name "axosyslog")))

(define-public ttf-times-new-roman
  (package
    (inherit ttf-times-new-roman)
    (name "ttf-times-new-roman")))

(define-public usermin
  (package
    (inherit usermin)
    (name "usermin")))

(define-public tracy-x11
  (package
    (inherit tracy-x11)
    (name "tracy-x11")))

(define-public flightgear-data-git
  (package
    (inherit flightgear-data-git)
    (name "flightgear-data-git")))

(define-public epub-to-audiobook
  (package
    (inherit epub-to-audiobook)
    (name "epub-to-audiobook")))

(define-public mpv-autosubsync-git
  (package
    (inherit mpv-autosubsync-git)
    (name "mpv-autosubsync-git")))

(define-public qp-git
  (package
    (inherit qp-git)
    (name "qp-git")))

(define-public muteled
  (package
    (inherit muteled)
    (name "muteled")))

(define-public whisper-cpp-model-large-v3-q5-0
  (package
    (inherit whisper-cpp-model-large-v3-q5-0)
    (name "whisper-cpp-model-large-v3-q5-0")))

(define-public adwaita-colors-icon-theme
  (package
    (inherit adwaita-colors-icon-theme)
    (name "adwaita-colors-icon-theme")))

(define-public ioninja
  (package
    (inherit ioninja)
    (name "ioninja")))

(define-public libggml-cuda-git
  (package
    (inherit libggml-cuda-git)
    (name "libggml-cuda-git")))

(define-public sherlock-launcher-git
  (package
    (inherit sherlock-launcher-git)
    (name "sherlock-launcher-git")))

(define-public geogebra-6-electron
  (package
    (inherit geogebra-6-electron)
    (name "geogebra-6-electron")))

(define-public ly-git
  (package
    (inherit ly-git)
    (name "ly-git")))

(define-public gnome-shell-extension-quick-settings-audio-panel
  (package
    (inherit gnome-shell-extension-quick-settings-audio-panel)
    (name "gnome-shell-extension-quick-settings-audio-panel")))

(define-public micron-storage-executive-cli
  (package
    (inherit micron-storage-executive-cli)
    (name "micron-storage-executive-cli")))

(define-public text-engine
  (package
    (inherit text-engine)
    (name "text-engine")))

(define-public detect-it-easy-git
  (package
    (inherit detect-it-easy-git)
    (name "detect-it-easy-git")))

(define-public networkd-notify-git
  (package
    (inherit networkd-notify-git)
    (name "networkd-notify-git")))

(define-public gedit-externaltools-plugin
  (package
    (inherit gedit-externaltools-plugin)
    (name "gedit-externaltools-plugin")))

(define-public filius
  (package
    (inherit filius)
    (name "filius")))

(define-public electricsheep
  (package
    (inherit electricsheep)
    (name "electricsheep")))

(define-public languagetool-ngrams-en
  (package
    (inherit languagetool-ngrams-en)
    (name "languagetool-ngrams-en")))


;;; Re-exports from deptree-resolver-260418ab

(define-public aspnet-runtime-preview-bin
  (package
    (inherit aspnet-runtime-preview-bin)
    (name "aspnet-runtime-preview-bin")))

(define-public kdesignerplugin
  (package
    (inherit kdesignerplugin)
    (name "kdesignerplugin")))

(define-public python-javaobj-py3
  (package
    (inherit python-javaobj-py3)
    (name "python-javaobj-py3")))

(define-public kemoticons
  (package
    (inherit kemoticons)
    (name "kemoticons")))

(define-public coder-bin
  (package
    (inherit coder-bin)
    (name "coder-bin")))

(define-public gh-dash-bin
  (package
    (inherit gh-dash-bin)
    (name "gh-dash-bin")))

(define-public aichat-ng-bin
  (package
    (inherit aichat-ng-bin)
    (name "aichat-ng-bin")))

(define-public chough-bin
  (package
    (inherit chough-bin)
    (name "chough-bin")))

(define-public envy-tui-bin
  (package
    (inherit envy-tui-bin)
    (name "envy-tui-bin")))

(define-public paracon
  (package
    (inherit paracon)
    (name "paracon")))

(define-public plasma6-applets-window-title
  (package
    (inherit plasma6-applets-window-title)
    (name "plasma6-applets-window-title")))

(define-public psiphonlinuxgui
  (package
    (inherit psiphonlinuxgui)
    (name "psiphonlinuxgui")))

(define-public redress-bin
  (package
    (inherit redress-bin)
    (name "redress-bin")))

(define-public safe-rm
  (package
    (inherit safe-rm)
    (name "safe-rm")))

(define-public svnkit
  (package
    (inherit svnkit)
    (name "svnkit")))

(define-public tdarr
  (package
    (inherit tdarr)
    (name "tdarr")))

(define-public technitium-dns-server-bin
  (package
    (inherit technitium-dns-server-bin)
    (name "technitium-dns-server-bin")))

(define-public tododo-bin
  (package
    (inherit tododo-bin)
    (name "tododo-bin")))

(define-public cmdfy
  (package
    (inherit cmdfy)
    (name "cmdfy")))

(define-public dvdisaster-speed47-git
  (package
    (inherit dvdisaster-speed47-git)
    (name "dvdisaster-speed47-git")))

(define-public dwatch-bin
  (package
    (inherit dwatch-bin)
    (name "dwatch-bin")))

(define-public element-lk-jwt-service
  (package
    (inherit element-lk-jwt-service)
    (name "element-lk-jwt-service")))

(define-public elephant-providerlist-bin
  (package
    (inherit elephant-providerlist-bin)
    (name "elephant-providerlist-bin")))

(define-public ttf-heuristica
  (package
    (inherit ttf-heuristica)
    (name "ttf-heuristica")))

(define-public ttf-google-sans-code-vf
  (package
    (inherit ttf-google-sans-code-vf)
    (name "ttf-google-sans-code-vf")))

(define-public ttf-ubuntu-sans-mono
  (package
    (inherit ttf-ubuntu-sans-mono)
    (name "ttf-ubuntu-sans-mono")))

(define-public ocr-fonts
  (package
    (inherit ocr-fonts)
    (name "ocr-fonts")))

(define-public rclonefzf
  (package
    (inherit rclonefzf)
    (name "rclonefzf")))

(define-public dockcheck
  (package
    (inherit dockcheck)
    (name "dockcheck")))

(define-public fluent-icon-theme-git
  (package
    (inherit fluent-icon-theme-git)
    (name "fluent-icon-theme-git")))

(define-public fluent-cursor-theme-git
  (package
    (inherit fluent-cursor-theme-git)
    (name "fluent-cursor-theme-git")))

(define-public neovim-remote
  (package
    (inherit neovim-remote)
    (name "neovim-remote")))

(define-public fw-fanctrl
  (package
    (inherit fw-fanctrl)
    (name "fw-fanctrl")))

(define-public lightdm-settings
  (package
    (inherit lightdm-settings)
    (name "lightdm-settings")))

(define-public gnome-monitor-config-git
  (package
    (inherit gnome-monitor-config-git)
    (name "gnome-monitor-config-git")))

(define-public gnome-shell-extension-tiling-assistant
  (package
    (inherit gnome-shell-extension-tiling-assistant)
    (name "gnome-shell-extension-tiling-assistant")))

(define-public system-tools-backends
  (package
    (inherit system-tools-backends)
    (name "system-tools-backends")))

(define-public liboobs
  (package
    (inherit liboobs)
    (name "liboobs")))

(define-public graphite-cursor-theme-git
  (package
    (inherit graphite-cursor-theme-git)
    (name "graphite-cursor-theme-git")))

(define-public logviewer-bin
  (package
    (inherit logviewer-bin)
    (name "logviewer-bin")))

(define-public hypruler-bin
  (package
    (inherit hypruler-bin)
    (name "hypruler-bin")))

(define-public goverlay-git
  (package
    (inherit goverlay-git)
    (name "goverlay-git")))

(define-public green-recorder-git
  (package
    (inherit green-recorder-git)
    (name "green-recorder-git")))


;;; Re-exports from deptree-resolver-260418ad

(define-public php84
  (package
    (inherit php84)
    (name "php84")))

(define-public libpng12
  (package
    (inherit libpng12)
    (name "libpng12")))

(define-public libudev0-shim
  (package
    (inherit libudev0-shim)
    (name "libudev0-shim")))

(define-public python-opentelemetry-exporter-otlp-proto-common
  (package
    (inherit python-opentelemetry-exporter-otlp-proto-common)
    (name "python-opentelemetry-exporter-otlp-proto-common")))

(define-public asusctl
  (package
    (inherit asusctl)
    (name "asusctl")))

(define-public wivrn-server
  (package
    (inherit wivrn-server)
    (name "wivrn-server")))

(define-public claude-code
  (package
    (inherit claude-code)
    (name "claude-code")))

(define-public perl-object-pluggable
  (package
    (inherit perl-object-pluggable)
    (name "perl-object-pluggable")))

(define-public python-transitions
  (package
    (inherit python-transitions)
    (name "python-transitions")))

(define-public makemkv
  (package
    (inherit makemkv)
    (name "makemkv")))

(define-public mullvad-vpn-daemon-bin
  (package
    (inherit mullvad-vpn-daemon-bin)
    (name "mullvad-vpn-daemon-bin")))

(define-public python-inplace
  (package
    (inherit python-inplace)
    (name "python-inplace")))

(define-public qt-sudo
  (package
    (inherit qt-sudo)
    (name "qt-sudo")))

(define-public python-fmod-tookit-git
  (package
    (inherit python-fmod-tookit-git)
    (name "python-fmod-tookit-git")))

(define-public python-opentelemetry-exporter-zipkin-json
  (package
    (inherit python-opentelemetry-exporter-zipkin-json)
    (name "python-opentelemetry-exporter-zipkin-json")))

(define-public netbird
  (package
    (inherit netbird)
    (name "netbird")))

(define-public perl-module-cpants-analyse
  (package
    (inherit perl-module-cpants-analyse)
    (name "perl-module-cpants-analyse")))

(define-public libmysqlclient
  (package
    (inherit libmysqlclient)
    (name "libmysqlclient")))

(define-public act-runner-bin
  (package
    (inherit act-runner-bin)
    (name "act-runner-bin")))

(define-public amneziavpn-bin
  (package
    (inherit amneziavpn-bin)
    (name "amneziavpn-bin")))

(define-public balena-cli-bin
  (package
    (inherit balena-cli-bin)
    (name "balena-cli-bin")))

(define-public beautyline
  (package
    (inherit beautyline)
    (name "beautyline")))

(define-public bumper-bin
  (package
    (inherit bumper-bin)
    (name "bumper-bin")))

(define-public cargo-aur-bin
  (package
    (inherit cargo-aur-bin)
    (name "cargo-aur-bin")))

(define-public catppuccin-gtk-theme-frappe
  (package
    (inherit catppuccin-gtk-theme-frappe)
    (name "catppuccin-gtk-theme-frappe")))

(define-public ddgst-bin
  (package
    (inherit ddgst-bin)
    (name "ddgst-bin")))

(define-public ddhx-bin
  (package
    (inherit ddhx-bin)
    (name "ddhx-bin")))

(define-public dockerydo-bin
  (package
    (inherit dockerydo-bin)
    (name "dockerydo-bin")))

(define-public feishin-bin
  (package
    (inherit feishin-bin)
    (name "feishin-bin")))

(define-public fhc-bin
  (package
    (inherit fhc-bin)
    (name "fhc-bin")))

(define-public firefox-umatrix
  (package
    (inherit firefox-umatrix)
    (name "firefox-umatrix")))

(define-public greenlight-bin
  (package
    (inherit greenlight-bin)
    (name "greenlight-bin")))

(define-public hunspell-sr
  (package
    (inherit hunspell-sr)
    (name "hunspell-sr")))

(define-public interspec-bin
  (package
    (inherit interspec-bin)
    (name "interspec-bin")))

(define-public ithil-bin
  (package
    (inherit ithil-bin)
    (name "ithil-bin")))

(define-public keylightd-bin
  (package
    (inherit keylightd-bin)
    (name "keylightd-bin")))

(define-public kftui-bin
  (package
    (inherit kftui-bin)
    (name "kftui-bin")))

(define-public kind-bin
  (package
    (inherit kind-bin)
    (name "kind-bin")))

(define-public klfc-bin
  (package
    (inherit klfc-bin)
    (name "klfc-bin")))

(define-public komodo-engine
  (package
    (inherit komodo-engine)
    (name "komodo-engine")))

(define-public lazymake-bin
  (package
    (inherit lazymake-bin)
    (name "lazymake-bin")))

(define-public lsp-dsp-lib
  (package
    (inherit lsp-dsp-lib)
    (name "lsp-dsp-lib")))

(define-public mergerfs
  (package
    (inherit mergerfs)
    (name "mergerfs")))

(define-public mill-global
  (package
    (inherit mill-global)
    (name "mill-global")))

(define-public moderncsv-bin
  (package
    (inherit moderncsv-bin)
    (name "moderncsv-bin")))

(define-public openai-codex-bin
  (package
    (inherit openai-codex-bin)
    (name "openai-codex-bin")))

(define-public oxfmt-bin
  (package
    (inherit oxfmt-bin)
    (name "oxfmt-bin")))

(define-public oxlint-bin
  (package
    (inherit oxlint-bin)
    (name "oxlint-bin")))

(define-public scarlett2-firmware
  (package
    (inherit scarlett2-firmware)
    (name "scarlett2-firmware")))

(define-public scarlett4-firmware
  (package
    (inherit scarlett4-firmware)
    (name "scarlett4-firmware")))

(define-public shsh
  (package
    (inherit shsh)
    (name "shsh")))

(define-public simplex-desktop-bin
  (package
    (inherit simplex-desktop-bin)
    (name "simplex-desktop-bin")))

;;; recipe-resolver-260418ae
(re-export mendeleydesktop-bundled)
(re-export arc-solid-gtk-theme-git)
(re-export xen-docs)
(re-export paper-gtk-theme-git)
(re-export ttf-inconsolata-g)
(re-export aurget)
(re-export db4-5)
(re-export anaconda)
(re-export lastpass)
(re-export ttf-envy-code-r)
(re-export crafty)
(re-export qt-installer-framework-docs)
(re-export amdapp-sdk-docs)
(re-export kodi-git-eventclients)
(re-export kodi-git-dev)
(re-export ttf-aller)
(re-export ttf-monaco)
(re-export kindlegen)
(re-export ttf-droid-monovar)
(re-export mutter-performance-docs)
(re-export libavutil-52)
(re-export clarity-icon-theme)
(re-export flat-remix-git)
(re-export wayland-docs-git)
(re-export ttf-impallari-cantora)
(re-export arc-kde-git)
(re-export virtualbox-bin-guest-iso)
(re-export archlinux-themes-balou)
(re-export vibrancy-colors)
(re-export gtk-theme-elementary-git)
(re-export imdb-thumbnailer)
(re-export eigen2)
(re-export icc-adobe)
(re-export decklink-sdk)
(re-export magicrescue)
(re-export unknown-horizons-git)
(re-export uefi-shell-git)
(re-export minetest-common-git)
(re-export logkeys-git)
(re-export glib2-docs-git)
(re-export ttf-monapo)
(re-export xcursor-neutralplus)
(re-export rofi-greenclip)
(re-export jquery)
(re-export ttf-ancient-fonts)
(re-export ppsspp-assets-git)
(re-export ttf-brill)
(re-export ttf-arabeyes-fonts)
(re-export scrub)
(re-export gdrive)
(re-export af9015-firmware)
(re-export linpack)
(re-export gtk-theme-iris-dark-git)
(re-export fiddler-appimage)
(re-export humanity-icon-theme)
(re-export safecopy)
(re-export ttf-andika)
(re-export vertex-icons-git)
(re-export balz)
(re-export steinberg-asio-sdk)
(re-export terminus-cyrillic)
(re-export java32-runtime-common)
(re-export ttf-mona)
(re-export poweriso)
(re-export materia-theme-git)
(re-export doom1-wad)
(re-export chef-dk)
(re-export fruit)
(re-export sfnt2woff)
(re-export vte-notification-docs)
(re-export soundfont-unison)
(re-export hunspell-sv)
(re-export gnome-shell-performance-docs)
(re-export ttf-material-design-icons-git)
(re-export paq8o)
(re-export cntlm)
(re-export srecord)
(re-export otf-cm-unicode)
(re-export pycharm-eap)
(re-export gtk-theme-iris-light-git)
(re-export otf-hasklig)
(re-export ttf-hasklig)
(re-export python-theano-pymc-doc)
(re-export ttf-clear-sans)
(re-export qgnomeplatform-common-git)
(re-export edk2-armvirt-git)
(re-export edk2-shell-git)
(re-export edk2-ovmf-git)
(re-export flashbench-git)
(re-export dracula-gtk-theme)
(re-export vazirmatn-fonts)
(re-export otf-powerline-symbols-git)
(re-export libcdk)
(re-export ethminer-bin)
(re-export rot13)
(re-export ttf-tw)
(re-export ttf-roboto-slab)
(re-export poster)
(re-export inform7)
(re-export toggldesktop-bin)
(re-export wormhole-william-bin)
(re-export wait4x-bin)
(re-export dnscontrol-bin)
(re-export wrkflw-bin)
(re-export patchy-bin)
(re-export orbit-bin)
(re-export cnote-bin)
(re-export hyprmon-bin)
(re-export suiup-bin)
(re-export ffdash-bin)
(re-export omp-manager-bin)
(re-export comp-scan-bin)
(re-export chough-bin)
(re-export radicle-httpd-bin)
(re-export materialgram-bin)
(re-export framework-control-bin)
(re-export weylus-bin)
(re-export gaffer-bin)
(re-export briar-desktop-bin)
(re-export iloader-appimage)
(re-export r47-bin)
(re-export spacestation14-launcher-bin)
(re-export browsh-bin)
(re-export commitlint-go-bin)
(re-export tartrazine-bin)
(re-export wireproxy-awg-bin)
(re-export ascii-image-converter)
(re-export tut)
(re-export vimcdoc)
(re-export lug-helper)
(re-export hyphen-ru)
(re-export teseq)
(re-export rzip)
(re-export gcolor2)
(re-export disktype)
(re-export nsnake)
(re-export zcfan)
(re-export retroforth)
(re-export webcamoid)
(re-export remmina-plugin-rdesktop)
(re-export pkgbuild-assistant)
(re-export grub-imageboot)
(re-export libreoffice-extension-apso)
(re-export aacs-keydb)

(re-export kio-git)
(re-export kxmlgui-git)
(re-export ruby-actionpack)
(re-export r-openssl)
(re-export mingw-w64-glslang)
(re-export alibaba-puhuiti-fontconfig)
(re-export clickhouse-common-static-bin)
(re-export dell-unified-driver-common)
(re-export dietlibc)
(re-export djgpp-binutils)
(re-export fswatch)
(re-export icinga-php-library)
(re-export latex-tuda-ci-logos)
(re-export lego-udev-rules)
(re-export libhdhomerun)
(re-export otf-junction)
(re-export otf-league-gothic)
(re-export pivx-sapling-params)
(re-export pnglite)
(re-export schema2ldif)
(re-export srb2kart-data)
(re-export ttf-blackout)
(re-export ttf-goudy-bookletter-1911)
(re-export ttf-knewave)
(re-export ttf-league-mono)
(re-export ttf-linden-hill)
(re-export ttf-ostrich-sans)
(re-export ttf-prociono)
(re-export ttf-sniglet)
(re-export addinclude)
(re-export android-pkg-config)
(re-export armv7l-linux-api-headers)
(re-export cubelib)
(re-export cubew)
(re-export dotnet-targeting-pack-5-0-bin)
(re-export dotnet-targeting-pack-6-0-bin)
(re-export emacs-color-theme)
(re-export esy)
(re-export execline)
(re-export guile-json)
(re-export libbinio)
(re-export libck)
(re-export libctl)
(re-export libfpx)
(re-export libftd2xx)
(re-export libjson)
(re-export libt3config)
(re-export log4j)
(re-export nexttrace)
(re-export octave-io)
(re-export optix)
(re-export pepper-flash)
(re-export perl-boolean)
(re-export perl-digest-perl-md5)
(re-export perl-hash-merge-simple)
(re-export perl-hash-multivalue)
(re-export perl-image-metadata-jpeg)
(re-export perl-math-convexhull-monotonechain)
(re-export perl-module-refresh)
(re-export perl-net-arp)
(re-export perl-ogg-vorbis-header-pureperl)
(re-export perl-stream-buffered)
(re-export perl-sub-exporter-formethods)
(re-export perl-test-longstring)
(re-export perl-text-simpletable)
(re-export perl-xml-xpathengine)
(re-export php-pear)
(re-export pure-stldict)
(re-export python-fancycompleter)
(re-export python-pyogg)
(re-export python2-backports)
(re-export python2-setuptools-scm)
(re-export r-backports)
(re-export r-base64enc)
(re-export r-farver)
(re-export r-pkgconfig)
(re-export r-prettyunits)
(re-export r-r-methodss3)
(re-export r-rappdirs)
(re-export r-statnet-common)
(re-export r-viridislite)
(re-export rplay)
(re-export ruby-clamp)
(re-export tbs-firmware)
(re-export unixcw)
(re-export unvanquished-data)
(re-export vasm)
(re-export xml-security-c)
(re-export xpub)
(re-export amdfand)
(re-export android-platform-18)
(re-export aocl-utils)
(re-export ats2-postiats)
(re-export cal3d)
(re-export caustic-cst)
(re-export cminpack)
(re-export f2c)
(re-export gnome-icon-theme-extras)
(re-export go-rice)
(re-export morewaita-icon-theme-git)
(re-export battery-notify)
(re-export cpctools)
(re-export vmware-horizon-html5mmr)
(re-export vmware-horizon-integrated-printing)
(re-export vmware-horizon-mmr)
(re-export vmware-horizon-rtav)
(re-export vmware-horizon-smartcard)
(re-export vmware-horizon-tsdr)
(re-export vmware-horizon-usb)
(re-export open-cobol-esql)
(re-export detect-old-python-modules)
(re-export lyrionmusicserver-git)
(re-export p3x-onenote)
(re-export epson-inkjet-printer-201105w)
(re-export dawnpro-gui)
(re-export lib32-libxkbfile)
(re-export python-submit50)
(re-export dnstwist-git)
(re-export linux-hardened-lts-docs)
(re-export linux-hardened-lts-headers)
(re-export python-check50)
(re-export ashpd-demo)
(re-export gr-satlab)
(re-export hyprshot-gui)
(re-export xkb-altgr-weur)
(re-export yabsnap-git)
(re-export libast)
(re-export eterm)
(re-export mint-artwork)
(re-export xfce4-panel-compiz)
(re-export brother-hl2140)
(re-export gtk-theme-e17gtk-git)
(re-export libinput-noaccum)
(re-export thumbor-aws)
(re-export ananicy-cpp-dinit)
(re-export ananicy-cpp-runit)
(re-export squeekboard-git)
(re-export bontmia)
(re-export clipse-git)
(re-export ftxui-docs)
(re-export ftxui-examples)
(re-export panini)
(re-export trezord-go)
(re-export arm-linux-gnueabihf-gcc75-linaro-bin)
(re-export lightning-terminal)
(re-export whisper.cpp-model-small.en-tdrz)
(re-export osu-handler)
(re-export skatgui)
(re-export python-amulet-nbt)
(re-export python-pymctranslate)
(re-export thunderbird-gnome-theme-git)
(re-export whisper.cpp-model-medium)
(re-export pokerstove-git)
(re-export python-amulet-leveldb)
(re-export python-minecraft-model-reader)
(re-export rz-jsdec)
(re-export rz-jsdec-git)
(re-export steam-tui-git)
(re-export whisper.cpp-model-base)
(re-export whisper.cpp-model-medium-q5-0)
(re-export whisper.cpp-model-medium.en)
(re-export whisper.cpp-model-medium.en-q5-0)
(re-export whisper.cpp-model-small.en)
(re-export whisper.cpp-model-tiny.en)
(re-export amulet-map-editor)
(re-export firefox-gnome-theme-git)
(re-export gnome-backgrounds-bitday-git)
(re-export go-chromecast-git)
(re-export fortune-mod-brooklyn-nine-nine)
(re-export jskat)
(re-export remoteplaywhatever)
(re-export chezmoi-modify-manager-git)
(re-export cosmic-ext-calculator-git)
(re-export fortune-mod-de)
(re-export fortune-mod-leftism-git)
(re-export scpdiscord)
(re-export lsparu)
(re-export mkdocs-git-revision-date-localized-plugin)
(re-export brother-dcp-t536dw)
(re-export clcc)
(re-export audius)
(re-export aurup)
(re-export funkin)
(re-export bash-pinyin-completion-rs)
(re-export electron-deepseek)
(re-export boxtron)
(re-export cmcl)
(re-export inspector)
(re-export big-launcher-git)
(re-export netactview)
(re-export sdrtrunk-git)
(re-export clickhouse)
(re-export omnisharp-roslyn)
(re-export ezchlog)
(re-export mpd-notification)
(re-export openmpt)
(re-export ca-certificates-dn42)
(re-export ryujinx-bin)
(re-export hitech-arch-animation)
(re-export ridecost)
(re-export jre-jetbrains)
(re-export dssat-csm-os-git)
(re-export virt-v2v)
(re-export marcwel-archive)
(re-export gpt4all-chat-git)
(re-export playonlinux)
(re-export rancher-desktop-bin)
(re-export duelsplus)
(re-export anytype-bin)
(re-export ps7-libps2000)
(re-export ps7-libps2000a)
(re-export ps7-libps3000a)
(re-export ps7-libps4000a)
(re-export ps7-libps6000)
(re-export ps7-libusbtc08)

;;; --- recipe-resolver-260418aj: 13 compat aliases ---
(re-export lobster)
(re-export q5k-usb-udev)
(re-export cliamp)
(re-export dpibreak)
(re-export netwatch-tui)
(re-export zignal-git)
(re-export deepfilternet-demos-git)
(re-export szsol-rs)
(re-export qpdf-zopfli)
(re-export gbdk-2020)


;;; Re-exports from deptree-resolver-260418ak
;;; hyprland-workspaces-tui — exported from deptree-resolver-260418ak
;;; deadlock-api-ingest-git — exported from deptree-resolver-260418ak
;;; fiqhack-git — exported from deptree-resolver-260418ak
;;; container2wasm-git — exported from deptree-resolver-260418ak

;;; --- recipe-resolver-260418ak: 3 compat aliases ---
(re-export opendeck)
(re-export norisk-client-launcher)
(re-export python314-freethreaded)


;;; --- recipe-resolver-260418al: 12 compat aliases ---
(re-export libmodule)
(re-export clightd)
(re-export c47-bin)
(re-export claude-code-seccomp)
(re-export noto-fonts-cjk-fontconfig)
(re-export tilem-gtk3-git)

;;; --- deptree-resolver-260418al: 84 compat aliases ---
(re-export ssh-chat-git)
(re-export nginx-ui)
(re-export easierconnect)
(re-export warp-plus)
(re-export xgo)
(re-export fscan)
(re-export serenity)
(re-export sing-box-alpha)
(re-export wayback)
(re-export mmdbinspect)
(re-export nuclei)
(re-export pipet-git)
(re-export baidupcs-go-git)
(re-export unpackerr)
(re-export bandsnatch)
(re-export izucat-git)
(re-export ocd)
(re-export apkeep)
(re-export imagineer)
(re-export shotman)
(re-export wctx)
(re-export ianny)
(re-export auto-epp-rs)
(re-export recordbox)
(re-export walrs)
(re-export ruffle-git)
(re-export swayosd-git)
(re-export abuse)
(re-export dablin)
(re-export canokey-usbip-git)
(re-export anope)
(re-export speedynote-git)
(re-export openswitcher)
(re-export wljoywake)
(re-export wl-gammactl)
(re-export lswt-git)
(re-export proftpd)
(re-export trigger)
(re-export p910nd)
(re-export ipad-charge)
(re-export pcc-libs-git)
(re-export openxcom)
(re-export mfoc-hardnested-git)
(re-export libstrangle-git)
(re-export mips-elf-binutils)
(re-export perl-pod-usage)
(re-export perl-re-engine-re2)
(re-export pgbadger)
(re-export faugus-subtitle)
(re-export ansible-dev-environment)
(re-export frida-dexdump)
(re-export python-wallbreaker)
(re-export turbocase)
(re-export python-imblearn)
(re-export sox-noise-git)
(re-export kattis-cli-git)
(re-export meanalyzer)
(re-export dove)
(re-export mpv-modernz-git)
(re-export ideapad-cm)
(re-export fetchmirrors)
(re-export arttime-git)
(re-export wtf)
(re-export fudo-git)
(re-export posy-cursors)
(re-export plymouth-theme-arch-logo)
(re-export yvt)
(re-export wlnfancurve)
(re-export docsify-cli)
(re-export write-good)
(re-export appium)
(re-export iptv-checker)
(re-export freerouting)
(re-export hath)
(re-export grlx-farmer-bin)
(re-export grlx-sprout-bin)
(re-export opencomic-bin)
(re-export linux-assistant-bin)
(re-export pyroscope-bin)
(re-export extraterm-bin)
(re-export cinecred)
(re-export tana)
(re-export sftpman-python)

;;; --- deptree-resolver-260418am: 5 compat aliases ---
(re-export groonga)
(re-export pgroonga)
(re-export sftpman-gtk)
(re-export pcloudcc-lneely)
(re-export xenia-canary-git)

;;; --- recipe-resolver-260418am: 9 new recipes (11 entries resolved) ---
(re-export protonup-rs-bin)
(re-export hyproled)
(re-export arturo-bin)
(re-export micromamba-bin)
(re-export ghdl-mcode-bin)
(re-export bleur-bin)
(re-export cosmic-ext-applet-minimon-bin)
(re-export cosmic-ext-applet-privacy-indicator-bin)
(re-export plasma-ions-china)

;;; --- recipe-resolver-260419a: 1 new recipe (30 entries resolved) ---
(re-export termirs-bin)


;;; --- deptree-resolver-260419b: 80 TODO packages resolved ---
(re-export kcmutils-git)
;;; --- deptree-resolver-260419c: 98 TODO packages resolved ---
(re-export kparts-git)
;;; --- deptree-resolver-260419d: 98 TODO packages resolved ---
(re-export r-hms)
(re-export baloo-git)
(re-export perl-moosex-types)
(re-export knotifyconfig-git)
(re-export adplug)
(re-export gv)
(re-export harminv)
(re-export icu63)
(re-export json-sh)
(re-export lha)
(re-export libcapi)
(re-export libcotp)
(re-export liboglappth)
(re-export liboping)
(re-export libparserutils-git)
(re-export libpasastro)
(re-export librandombytes)
(re-export libsoundio)
(re-export libumem-git)
(re-export libvitamtp)
(re-export libwandio)
(re-export mimetic)
(re-export nqp)
(re-export octave-geometry)
(re-export octave-statistics)
(re-export octomap)
(re-export pbar)
(re-export pd-pure)
(re-export peerflix)
(re-export pencil)
(re-export perl-audio-flac-header)
(re-export perl-class-accessor-grouped)
(re-export perl-crypt-urandom)
(re-export perl-extutils-typemaps-default)
(re-export perl-iptables-parse)
(re-export perl-lingua-en-inflect-number)
(re-export perl-mixin-linewise)
(re-export perl-net-pcap)
(re-export perl-net-sftp-foreign)
(re-export perl-proc-daemon)
(re-export pure-faust)
(re-export pure-ffi)
(re-export pure-midi)
(re-export python-async-generator)
(re-export python-cmp-version)
(re-export python-fuzzyfinder)
(re-export python-oldest-supported-numpy)
(re-export python-pyspf)
(re-export python-raven)
(re-export python-verboselogs)
(re-export qt4pas)
(re-export quazip-qt4)
(re-export r-gridextra)
(re-export r-lazyeval)
(re-export r-sessioninfo)
(re-export r-tzdb)
(re-export rep-gtk)
(re-export ruby-cabin)
(re-export ruby-reverse-markdown)
(re-export ruby-stud)
(re-export ruby-version-gem)
(re-export s6)
(re-export signald)
(re-export silc-toolkit)
(re-export sssm)
(re-export tclcl)
(re-export tklib)
(re-export vapoursynth-plugin-bilateral-git)
(re-export websockify)
(re-export xi-core)
(re-export xylib)
(re-export argparser-c)
(re-export blend2d)
(re-export ctranslate2-git)
(re-export discord-chat-exporter-core)
(re-export eclipse-platform)
(re-export flif-mime)
(re-export icon)
(re-export lib32-mesa-git)
(re-export deepin-wine-quarkclouddrive)
(re-export framework-system-git)
(re-export canon-tr8600-series)
(re-export alpm-octopi-utils-git)
(re-export bricklink-studio)
(re-export ttf-materialicons-regular-for-inline)
(re-export dectalk-git)
(re-export linuxthemestore-git)
(re-export mattermost-plugin-jitsi)
(re-export nvidia-510xx-dkms)
(re-export opencl-510xx-nvidia)
(re-export liri-git-meta)
(re-export bbg-git)
(re-export easyeda-pro-electron)
(re-export hid-ite8291r3-dkms-git)
(re-export hp-prime-virtual-calculator-bin)
(re-export nodejs-appium-chromium-driver)
(re-export nodejs-appium-espresso-driver)
(re-export nodejs-appium-execute-driver-plugin)
(re-export nodejs-appium-geckodriver)
(re-export nodejs-appium-images-plugin)
(re-export nodejs-appium-mac2-driver)
(re-export nodejs-appium-relaxed-caps-plugin)
(re-export nodejs-appium-safari-driver)
(re-export nodejs-appium-storage-plugin)
(re-export nodejs-appium-uiautomator2-driver)
(re-export nodejs-appium-universal-xml-plugin)
(re-export nodejs-appium-windows-driver)
(re-export nodejs-appium-xcuitest-driver)
(re-export ocd-git)
(re-export python-appium-python-client)
(re-export python-ite8291r3-ctl-git)
(re-export python-vllm-cuda)
(re-export kattis-problemtools-git)
(re-export nvim-treesitter-parsers-git)
(re-export embedded-studio)
(re-export gnome-screensaver-no-watchdog)
(re-export mkinitcpio-sd-zfs-poscat)
(re-export otf-piazzolla)
(re-export ttf-piazzolla-variable)
(re-export otf-unscii-16-full)
(re-export linux-firmware-hauppauge)
(re-export otf-unscii-8)
(re-export nodejs-postcss-cli)
(re-export hyprland-welcome-git)
(re-export corefreq-client-git)
(re-export corefreq-dkms-git)
(re-export corefreq-server-git)
(re-export whisper-cpp-openvino)
(re-export nodejs-flood)
(re-export nil-git)
(re-export mybatop)
(re-export scangearmp2)
(re-export dipc)
(re-export gdbuspp)
(re-export par2cmdline-turbo)
(re-export fcitx5-pinyin-moegirl)
(re-export wl-screenrec-git)
(re-export libadwaita-without-adwaita-git)
(re-export gotenberg)
(re-export nginx-mainline-mod-lua)
(re-export hopp-cli-bin)
(re-export reclog)
(re-export swayfx-i3-style-fullscreen-git)
(re-export clockify-desktop)
(re-export mcaselector)
(re-export surfer-waveform-git)
(re-export qdep)
(re-export codechecker)
(re-export idris2-pack-git)
(re-export reth-git)
(re-export clockify-cli)
(re-export fish-nvm)
(re-export hp-omen-wmi-dkms)
(re-export libreport)
(re-export bbppairings)
(re-export dbt-core)
(re-export dbt-fusion-bin)
(re-export electrum-abc-bin)
(re-export supportboi)
(re-export kpscript)
(re-export nscde)
(re-export teamspeak3-pluginsdk)
(re-export git-fame)
(re-export teamspeak3-addon-installer)
(re-export browserselector)
(re-export ttf-sarasa-ui-all)
(re-export ttf-sarasa-ui-cl)
(re-export ttf-sarasa-ui-hc)
(re-export ttf-sarasa-ui-jp)
(re-export ttf-sarasa-ui-kr)
(re-export ttf-sarasa-ui-sc)
(re-export ttf-sarasa-ui-tc)
(re-export lite)
(re-export applesmc-next-dkms)
(re-export pynotify-bin)
(re-export chapel)
(re-export mihomo-bin)
(re-export subfinder-bin)
(re-export grype-bin)
(re-export pnpm-bin)
(re-export amber-bash-bin)
(re-export ytermusic-bin)
(re-export aretext-bin)
(re-export boundary-bin)
(re-export vgmstream-cli-bin)
(re-export codemap-bin)
(re-export quikgit-bin)
(re-export zfsbackrest-bin)
(re-export linuxtoys-bin)
(re-export proton-authenticator-bin)
(re-export wkhtmltopdf-bin)
(re-export ttf-poppins)
(re-export ttf-rubik-vf)
(re-export ttf-readex-pro)
(re-export ttf-readex-pro-variable)
(re-export ttf-nanum)
(re-export ttf-alte-haas-grotesk)
(re-export sddm-silent-theme)
(re-export catppuccin-sddm-theme-frappe)
(re-export plymouth-theme-neat)
(re-export xkb-ultimatekeys)
(re-export perl-test-kwalitee)
(re-export perl-irc-utils)
(re-export perl-toml-parser)
(re-export perl-cpan-outdated)
(re-export perl-chemistry-elements)
(re-export mingw-w64-readline)
(re-export mingw-w64-gettext)
(re-export ktexteditor-git)
(re-export perl-config-ini)
(re-export lib32-glib)
(re-export libconcord)
(re-export libgnunetchat-git)
(re-export mingw-w64-blas)
(re-export mingw-w64-libidn2)
(re-export mingw-w64-pixman)
(re-export papi)
(re-export pure-xml)
(re-export python-iniparse)
(re-export python-msrest)
(re-export python-pyjacklib)
(re-export python-pynzb)
(re-export python2-fuse)
(re-export qt5-accountsservice-git)
(re-export r-clipr)
(re-export ruby-dotenv)
(re-export sencha-cmd-6)
(re-export tclx)
(re-export th06-demo-data)
(re-export ultraleap-hand-tracking-service)
(re-export vapoursynth-plugin-awarpsharp2-git)
(re-export vapoursynth-plugin-eedi2-git)
(re-export vapoursynth-plugin-misc-git)
(re-export vapoursynth-plugin-znedi3-git)
(re-export xrectsel)
(re-export coin-or-coinmumps)
(re-export daggerfall)
(re-export devilutionx-graphics-tools-git)
(re-export downloader-cli)
(re-export gdk-pixbuf)
(re-export giflib4)
(re-export globalplatform)
(re-export gnocl)
(re-export kahip)
(re-export lib32-ncurses5-compat-libs)
(re-export libdecsync)
(re-export libshout-idjc)
(re-export nvidia-utils-tesla)
(re-export nyan-lang)
(re-export opencryptoki)
(re-export perl-math-geometry-voronoi)
(re-export perl-moosex-methodattributes)
(re-export python-cymruwhois)
(re-export python-dict2xml)
(re-export python-extra-platforms)
(re-export python-image)
(re-export python-netdisco)
(re-export python-pytubefix)
(re-export python-sdnotify)
(re-export python-typed-argument-parser)
(re-export quantlib)
(re-export rlottie)
(re-export sawfish)
(re-export scraw)
(re-export timblserver)
(re-export ucommon)
(re-export vapoursynth-plugin-bm3d-git)
(re-export vapoursynth-plugin-dfttest-git)
(re-export wraith-master-common)
(re-export youtube-search-python)
(re-export zfs-utils-git)
(re-export zopflipng-parallel)
(re-export bertini-common)
(re-export c++utilities-git)
(re-export fbx-sdk)
(re-export flashplugin)
(re-export gcc11-libs)
(re-export glade-perl)
(re-export lib32-pangox-compat)
(re-export libgroove)
(re-export libirecovery)
(re-export libkexiv2-git)
(re-export linux-firmware-atheros-uncompressed)
(re-export lsi-msm-libs)
(re-export lxqt-globalkeys-git)
(re-export ocaml-batteries)
(re-export ocaml-xmlm)
(re-export perl-class-c3-componentised)
(re-export pure-audio)
(re-export python-affine)
(re-export python-dephell-specifier)
(re-export python-rosdistro)
(re-export python-setuptools-git-ls-files)
(re-export python-suntime)
(re-export python-tatsu-lts)
(re-export python-tinydb)
(re-export python-wasabi)
(re-export r-progress)
(re-export ruby-sexp-processor)
(re-export streamripper)
(re-export t4kcommon)
(re-export vapoursynth-plugin-eedi3m-git)
(re-export waifu2x-converter-cpp)
(re-export angie)

;; recipe-resolver-260419c
(re-export graphite-gtk-theme-git)
(re-export graphite-gtk-theme-compact-git)
(re-export graphite-gtk-theme-normal-git)
(re-export graphite-gtk-theme-normal-compact-git)
(re-export graphite-gtk-theme-rimless-git)
(re-export graphite-gtk-theme-rimless-compact-git)
(re-export graphite-gtk-theme-rimless-normal-git)
(re-export graphite-gtk-theme-rimless-normal-compact-git)
(re-export graphite-gtk-theme-nord-git)
(re-export graphite-gtk-theme-nord-compact-git)
(re-export graphite-gtk-theme-nord-normal-git)
(re-export graphite-gtk-theme-nord-normal-compact-git)
(re-export graphite-gtk-theme-nord-rimless-git)
(re-export graphite-gtk-theme-nord-rimless-compact-git)
(re-export graphite-gtk-theme-nord-rimless-normal-git)
(re-export graphite-gtk-theme-nord-rimless-normal-compact-git)
(re-export graphite-gtk-theme-black-git)
(re-export graphite-gtk-theme-black-compact-git)
(re-export graphite-gtk-theme-black-normal-git)
(re-export graphite-gtk-theme-black-normal-compact-git)
(re-export graphite-gtk-theme-black-rimless-git)
(re-export graphite-gtk-theme-black-rimless-compact-git)
(re-export graphite-gtk-theme-black-rimless-normal-git)
(re-export graphite-gtk-theme-black-rimless-normal-compact-git)
(re-export graphite-gtk-theme-wallpaper-git)
(re-export ttf-gelasio)
(re-export ttf-gelasio-variable)
(re-export ttf-lxgw-wenkai-screen)
(re-export fontpreview)
(re-export googledot-cursor-theme)

;; recipe-resolver-260419d
(re-export dockcheck)
(re-export hyprland-plugin-borders-plus-plus)
(re-export hyprland-plugin-csgo-vulkan-fix)
(re-export hyprland-plugin-hyprbars)
(re-export hyprland-plugin-hyprexpo)
(re-export hyprland-plugin-hyprfocus)
(re-export hyprland-plugin-hyprscrolling)
(re-export hyprland-plugin-hyprtrails)
(re-export hyprland-plugin-hyprwinwrap)
(re-export hyprland-plugin-xtra-dispatchers)

;; recipe-resolver-260419d (ALREADY_IN_GUIX compat alias)
(define-public hyprland-guiutils-git
  (package
    (inherit hyprland-guiutils)
    (name "hyprland-guiutils-git")))

;; recipe-resolver-260419e (93 recipes, 7 blocked)
(use-modules (gaurix packages recipe-resolver-260419e))
(re-export cobalt-lang)
(re-export fitgirl-ddl-git)
(re-export ixgo)
(re-export lpm)
(re-export nchat-git)
(re-export nscde-git)
(re-export freej2me-git)
(re-export inkscape-j-tech-photonics-laser-tool)
(re-export nix-init)
(re-export plank-reloaded-docklet-lastfm-git)
(re-export skib)
(re-export vapoursynth-plugin-imwri-git)
(re-export vapoursynth-plugin-tedgemask-git)
(re-export capsimage-git)
(re-export python-svg-to-gcode-git)
(re-export vapoursynth-plugin-hysteresis)
(re-export i3bar-river-git)
(re-export comictagger)
(re-export handbook-bin)
(re-export mhy-warp-bin)
(re-export zoekt-git)
(re-export frostwire)
(re-export nutty)
(re-export podman-tui-git)
(re-export apimocker)
(re-export perl-statistics-descriptive)
(re-export portchaos)
(re-export ratel-bin)
(re-export steam-tui-bin)
(re-export opentodolist)
(re-export rhai-tools)
(re-export crosspaste-desktop-bin)
(re-export pla-util)
(re-export css-loader-desktop-bin)
(re-export dtv-bin)
(re-export hyprpaper-gui-bin)
(re-export stumpwm-contrib-git)
(re-export nodejs-autoprefixer)
(re-export jello-bin)
(re-export libwaybar-cffi-lyrics)
(re-export szablon-git)
(re-export pinentry-dmenu)
(re-export intel-npu-compiler)
(re-export vega)
(re-export pasystray-wayland)
(re-export flying-carpet-bin)
(re-export qbittorrent-vuetorrent-bin)
(re-export cockpit-sensors)
(re-export aptos-bin)
(re-export liquidlauncher-bin)
(re-export synapse-admin-etke-git)
(re-export ggjj)
(re-export gfn-electron-bin)
(re-export below)
(re-export eitaa-bin)
(re-export cuneiform)
(re-export nero-umu)
(re-export creality-print-bin)
(re-export anyzig-bin)
(re-export netpump)
(re-export nutstore-experimental)
(re-export p3x-onenote-bin)
(re-export hcp-bin)
(re-export devilspie2)
(re-export steam-tui)
(re-export pineflash-git)
(re-export spacer-bin)
(re-export dblab-bin)
(re-export nordzy-hyprcursors)
(re-export electorrent-bin)
(re-export gdmap)
(re-export swaylock-fancy-git)
(re-export awatcher-bundle-bin)
(re-export signal-desktop-beta-bin)
(re-export rook)
(re-export siji-git)
(re-export wpgtk-git)
(re-export an2linuxserver-git)
(re-export chatgpt-sh)
(re-export autoenv-git)
(re-export unnamed-sdvx-clone)
(re-export gyroflow)
(re-export patch-asar)
(re-export vtop)
(re-export mindomo-bin)
(re-export gnome-shell-extension-rounded-window-corners-reborn-git)
(re-export numworks-udev)
(re-export godot3-mono-bin)
(re-export sif-git)
(re-export wazuh-dashboard)
(re-export wazuh-indexer)
(re-export wazuh-manager)
(re-export elisa-rpc-git)

;; recipe-resolver-260419f
(re-export grub-theme-tela-color)
(re-export pomo-bin)
(re-export 3dstool)
(re-export gruvbox-dark-icons-gtk)
(re-export amdgpu-clocks)
(re-export foxicons-theme)
(re-export plymouth-theme-hexagon-alt-gruvbox)
(re-export morewaita-icon-theme)
(re-export notwaita-cursor-theme)
(re-export mkbrr-gui-bin)

;; recipe-resolver-260419g (20 recipes, 10 blocked)
(re-export feedr-bin)
(re-export crier-bin)
(re-export ferrishot-bin)
(re-export mezzotone-bin)

;;; recipe-resolver-260419i
(re-export ttf-unifont)
(re-export codeql)
(re-export jitsi-meet-turnserver)
(re-export go-prism-git)
(re-export asus-5606-fan-state)
(re-export amf-amdgpu-pro)
(re-export amdgpu-pro-oglp)
(re-export uuid)
(re-export mqtt-explorer)
(re-export omnissa-horizon-scanner-client)
(re-export omnissa-horizon-html5mmr)
(re-export omnissa-horizon-file-association)
(re-export omnissa-horizon-client-next)
(re-export php84-iconv)
(re-export php84-gettext)
(re-export php84-fileinfo)
(re-export php84-exif)
(re-export php84-dom)
(re-export php84-ctype)
(re-export php84-calendar)
(re-export php84-bcmath)
(re-export nexus-client-git)
(re-export nexus-client)
(re-export ps7-libps4000)
(re-export ps7-libps3000)
(re-export ps7-libps5000a)
(re-export ps7-libps5000)
(re-export ps7-libps6000a)
(re-export samsung-magician-consumer-ssd)
(re-export omnissa-horizon-usb)

;; recipe-resolver-260419j (95 recipes, 5 blocked)
(use-modules (gaurix packages recipe-resolver-260419j))
(re-export lncur)
(re-export vertd-git)
(re-export mopidy-spotify)
(re-export mopidy-youtube)
(re-export numix-cursor-theme-git)
(re-export kwakd)
(re-export warpd-git)
(re-export ttf-delugia-code)
(re-export soundfont-sm64)
(re-export gtk-theme-flat-color-git)
(re-export warp-plus-git)
(re-export mopidy-spotify-git)
(re-export olive)
(re-export moonscript)
(re-export ufiformat)
(re-export fcitx5-skin-fluentdark-git)
(re-export mattermost-push-proxy)
(re-export mikhak-fonts)
(re-export ntfs2btrfs-git)
(re-export plutolang)
(re-export bwget)
(re-export julec-bin)
(re-export marble-maps-extra-git)
(re-export marble-maps-tracestrack-git)
(re-export python-haas-proxy)
(re-export shadowenv-bin)
(re-export shit-git)
(re-export words-pt)
(re-export qzdl)
(re-export apng2gif)
(re-export git-pair-bin)
(re-export opencloud-web)
(re-export reddit-tui-bin)
(re-export repomix-git)
(re-export tmux-sessionizer-bin)
(re-export chatgptx-bin)
(re-export dmarc-report-converter)
(re-export wallrust-bin)
(re-export mirage)
(re-export soundfont-titanic)
(re-export material-maker-bin)
(re-export soundfont-arachno)
(re-export soundfont-zelda3sf2)
(re-export soundfont-zeldamcsf2)
(re-export skeuos-gtk)
(re-export soundfont-opl3-fm-128m)
(re-export soundfont-sso-sf2)
(re-export vk-messenger-bin)
(re-export evdev-keepalive)
(re-export libseexpr2)
(re-export proxydev)
(re-export pyprland-git)
(re-export vtm-bin)
(re-export adfinis-rclone-mgr-bin)
(re-export gyroflow-ofx-bin)
(re-export kdbindings)
(re-export libsql-server-bin)
(re-export lilipod)
(re-export soundfont-jeux)
(re-export soundfont-personalcopy)
(re-export soundfont-realfont)
(re-export soundfont-sunshine-perc)
(re-export vvmd-git)
(re-export vvmplayer-git)
(re-export samloader-git)
(re-export sonyheadphonesclient-bin)
(re-export celeste-client-bin)
(re-export gnome-shell-extension-battery-health-charging-git)
(re-export ninjatracing-git)
(re-export mariadb-connector-odbc)
(re-export lighthouse-ethereum-bin)
(re-export olived-git)
(re-export opencloud-bin)
(re-export slcurl-snapshot)
(re-export slsqlite-snapshot)
(re-export twitch-tui-git)
(re-export q)
(re-export mdfextract)
(re-export zsh-autoswitch-virtualenv-git)
(re-export cot)
(re-export leenfetch-bin)
(re-export piper-voices-pt-pt)
(re-export sshp-git)
(re-export hatari-git)
(re-export oniux-git)
(re-export slgsl-snapshot)
(re-export kuro-bin)
(re-export pkg-2k-whitesur-wallpapers-git)
(re-export pkg-4k-whitesur-wallpapers-git)
(re-export chatgtk)
(re-export opentrace)
(re-export intel-lpmd)
(re-export brscan3)
(re-export libadapta)
(re-export api-calls-bin)

;;; recipe-resolver-260423a
(re-export libxml2-git)
(re-export gr-lora-sdr-git)
(re-export php84-imap)
(re-export libre-trainsim-bin)
(re-export wazuh-agent)
(re-export php84-fpm)
(re-export php84-enchant)
(re-export vibe-audio-visualizer-git)
(re-export plezy-git)
(re-export koxtoolchain)
(re-export php84-apache)
(re-export php84-embed)
(re-export python315)
(re-export omnissa-horizon-client)
(re-export listpick)
(re-export playtorrio-bin)
(re-export android-translation-layer)
(re-export kitty-bitmap)
(re-export pyload-ng)
(re-export crossover)
(re-export wine-gaming-dependencies)

;; recipe-resolver-260423b (100 recipes)
  (re-export otf-anti)
  (re-export otf-avara)
  (re-export ttf-amiri-typewriter)
(use-modules (gaurix packages recipe-resolver-260423b))
(re-export pepv-git)
(re-export wishlist)
(re-export linux-flowx13)
(re-export linux-flowx13-docs)
(re-export linux-flowx13-headers)
(re-export supportboi-git)
(re-export gog-icewind-dale-enhanced-edition)
(re-export alhp-utils)
(re-export simplexity-ai-app)
(re-export linux-lts66)
(re-export linux-lts66-docs)
(re-export linux-lts66-headers)
(re-export autenticacao-gov-pt-bin)
(re-export zulip-desktop-electron)
(re-export o3de-bin)
(re-export quickgui)
(re-export openai-chatgpt-nativefier)
(re-export sunloginclient)
(re-export fl-studio-integrator)
(re-export owncloud)
(re-export xmage)
(re-export klfc)
(re-export rutorrent)
(re-export lightdm-kde-greeter)
(re-export winecx-wow64)
(re-export alephone-tempus-irae)
(re-export gstreamer-meta)
(re-export libadapta-demos)
(re-export libadapta-docs)
(re-export gimp-extras)
(re-export axon-applauncher)
(re-export aptly)
(re-export yarr-bin)

;;; Re-exports from deptree-resolver-260423c
(re-export httpdirfs-git)
(re-export libcanberra-gtk2)
(re-export texlive-installer)
(re-export nvidia-580xx-utils)
(re-export lib32-wayland-git)
(re-export android-sdk-platform-tools)
(re-export electron40-bin)
(re-export qqc2-desktop-style-git)
(re-export yay)
(re-export apple-fonts)
(re-export arm-linux-gnueabihf-linux-api-headers)
(re-export i686-elf-pcc-libs-git)
(re-export makemkv-libaacs)
(re-export electron13-bin)
(re-export intel-ipu6-dkms-git)
(re-export lib32-libudev0-shim)
(re-export chromaprint-fftw)
(re-export lib32-libindicator-gtk2)
(re-export python-deltachat-rpc-client-git)
(re-export system-tools-backends)
(re-export vesktop)
(re-export arm-linux-gnueabihf-binutils)
(re-export immuarch-core-git)
(re-export libxnvctrl-340xx)
(re-export python-opentelemetry-exporter-otlp-proto-http)
(re-export gr-foo-git)
(re-export python-opentelemetry-exporter-otlp-proto-grpc)
(re-export mcpelauncher-linux)
(re-export wemeet-bin)
(re-export electron30)
(re-export pkg-1password-cli)
(re-export aic94xx-firmware)
(re-export alhp-keyring)
(re-export ast-firmware)
(re-export chromium-gost)
(re-export edk2-ovmf-fedora)
(re-export freedom)
(re-export hbuilderx-bin)
(re-export kraken-desktop)
(re-export ktlint-compose-rules)
(re-export lib32-amdgpu-pro-oglp)
(re-export logviewer-bin)
(re-export mchose-ace68-udev)
(re-export meocloud-cli)
(re-export mingw-w64-environment)
(re-export navicat17-premium-en)
(re-export nrfutil)
(re-export ocr-fonts)
(re-export omarchy)
(re-export overte-appimage)
(re-export packettracer)
(re-export pacman-log-orphans-hook)
(re-export pragmatapro-fonts)
(re-export publii)
(re-export questpatcher-bin)
(re-export rutoken-pkcs11)
(re-export shiftfs-lts-dkms)
(re-export subtitleedit-avalonia)
(re-export throne-bin)
(re-export ttf-aptos)
(re-export ttf-hanazono)
(re-export ttf-heuristica)
(re-export ttf-ubuntu-sans-mono)
(re-export uuplugin-bin)
(re-export verus-bin)
(re-export vex-tui-bin)
(re-export vmware-keymaps)
(re-export whisper.cpp-model-large-v3-turbo)
(re-export wps-office-mui-zh-cn)
(re-export xemu-bin)
(re-export xp-pen-tablet)
(re-export xr-passthrough-layer-git)
(re-export acroread-fonts-systemwide)
(re-export alephone-phoenix)
(re-export alhp-mirrorlist)
(re-export amneziawg-tools)
(re-export aocc)
(re-export autojump)
(re-export bbg)
(re-export bibata-cursor-theme)
(re-export binder-linux-dkms)
(re-export bluevein-bin)
(re-export brother-mfc-9970cdw)
(re-export catppuccin-konsole-theme-git)
(re-export celeste-bin)
(re-export checkmake-bin)
(re-export chromium-vencord-bin)
(re-export clion-cmake)
(re-export clion-gdb)
(re-export clion-jre)
(re-export clion-lldb)
(re-export codex-acp)
(re-export corefreq-dkms)
(re-export coreos-installer)
(re-export data-peek-bin)
(re-export easytax-ag-2024)

;;; recipe-resolver-260423c re-exports
(re-export tuckr)
(re-export gede)
(re-export ytui-music)
(re-export python-gdbgui)
(re-export themix-icons-numix-git)
(re-export themix-icons-papirus-git)
(re-export themix-icons-archdroid-git)
(re-export plann)
(re-export python-influxdb-client)
(re-export lavacli)
(re-export stax)
(re-export elan-lean)
(re-export ty)
(re-export rbonsai)
(re-export clock-rs)
(re-export passly)
(re-export ytsub)
(re-export runal)
(re-export ifrextractor-rs)
(re-export hyprland-preview-share-picker-git)
(re-export elyprismlauncher)
(re-export go-mitmproxy-bin)
(re-export bayesian-ssh-bin)
(re-export wtp-bin)
(re-export mmtui)
(re-export rg-sens-git)
(re-export netpala)
(re-export fotocx)
(re-export wattage)
(re-export shutsentry)
(re-export jackett-bin)
(re-export dmscripts-git)
(re-export hanuchi)
(re-export tty-clock)
(re-export jrnlc)
(re-export kubecolor)
(re-export unimatrix-git)
(re-export mediamtx)
(re-export docker-credential-secretservice)
(re-export compendium)

;;; deptree-resolver-260423d re-exports
(re-export flutter-common)
(re-export flutter-gradle)
(re-export arm-linux-gnueabihf-gcc-stage2)
(re-export flutter-devel)
(re-export flutter-target-web)
(re-export libxnvctrl-580xx)
(re-export flutter-target-linux)
(re-export aacs-keydb-daily)
(re-export antares-sql-bin)
(re-export enumctl-bin)
(re-export fallout1-ce-game)
(re-export ffdec-bin)
(re-export filkoll)
(re-export firefly-iii-data-importer)
(re-export freefilesync)
(re-export freshrss)
(re-export garnet)
(re-export git-good-bin)
(re-export git-guitar-bin)
(re-export gnix)
(re-export goat-cli)
(re-export googler)
(re-export grabc)
(re-export graphite-cursor-theme-git)
(re-export hotkeyhub-bin)
(re-export hypruler-bin)
(re-export immuarch-utils-git)
(re-export ipscan-bin)
(re-export js-util-bin)
(re-export keystore-explorer-bin)
(re-export kurtosis-cli-bin)
(re-export lefthook)
(re-export lib3ds)
(re-export libodb)
(re-export libpam-pwdfile-rs-bin)
(re-export libsdrplay)
(re-export linux-zen-git-headers)
(re-export lore-cli-bin)
(re-export lrclibfetch)
(re-export lxdm-themes)
(re-export makepkg-optimize-mold)
(re-export mechrevo-drivers-dkms)
(re-export mkinitcpio-sd-numlock)
(re-export modprobed-db)
(re-export moomoo)
(re-export mp3val)
(re-export mprime-bin)
(re-export mpv-discordrpc-git)
(re-export mpv-thumbnail-script)
(re-export next-music)
(re-export nix-user-chroot)
(re-export oopz)
(re-export opcode-bin)
(re-export opencl-legacy-amdgpu-pro)
(re-export opencl-nvidia-580xx)
(re-export pacman-cleanup-hook)
(re-export pacman-hook-bootbackup)
(re-export pacolog)
(re-export passless-bin)
(re-export penpot-desktop-bin)
(re-export perl-date-simple)
(re-export pi-coding-agent)
(re-export picotron)
(re-export plymouth-theme-monoarch-refined)
(re-export powerofforreboot.efi)
(re-export powershell-editor-services)
(re-export proton-cachyos-launcher)
(re-export proton-drive-sync-prerelease-bin)
(re-export proton-ge-custom-bin)
(re-export prysm)
(re-export psysh)
(re-export pureref)
(re-export quarto-cli-bin)
(re-export quill-editor)
(re-export r8125-dkms)
(re-export railwayapp-cli)
(re-export replit-desktop-app)
(re-export roleboi)
(re-export roleboi-git)
(re-export rslsync)
(re-export saleae-logic2)
(re-export scpdiscord-git)
(re-export shgit-bin)
(re-export shorewall6)
(re-export skillshare)
(re-export snd-pcsp-dkms)
(re-export sonarqube-bin)
(re-export ssacli-bin)
(re-export stack-wallet-appimage)
(re-export storcli)

(re-export faal)
(re-export atmosim)
(re-export calf-gui)
(re-export pms-git)
(re-export lux-dl-git)
(re-export derper-ipcert)
(re-export axenc-git)
(re-export qtask-git)
(re-export openocd-raspberrypi-git)
(re-export urbackup2-server)
(re-export sql-workbench)
(re-export vacuum)

(re-export sqlite-jdbc)
(re-export beatoraja-modernchic)
(re-export themix-icons-suru-plus)
(re-export themix-icons-suru-plus-aspromauros)
(re-export amazon-fonts)
(re-export canvas-downloader)
(re-export kwin-effect-rounded-corners)
(re-export kwin-effects-better-blur-dx)
(re-export plasma6-applets-kurve)
(re-export khtml)

;;; deptree-resolver-260423e re-exports
(re-export flutter-intellij-patch)
(re-export flutter-target-android)
(re-export distccd-alarm-armv7h)
(re-export distccd-alarm-armv8)
(re-export firefox-userchromejs)
(re-export qcalc-bin)
(re-export sunwait)
(re-export sway-desktop-env-hook)
(re-export sway-desktop-unsupportedgpu-hook)
(re-export synology-hyper-backup-explorer)
(re-export systemd-oomd-defaults)
(re-export termide-bin)
(re-export tetrio-desktop)
(re-export thinkmorse)
(re-export tremc)
(re-export ttf-google-sans-code-vf)
(re-export ttf-mac-fonts)
(re-export tuxedo-drivers-dkms)
(re-export unreal-tournament-data-archiveorg)
(re-export vesktop-spoof-pacman-hook)
(re-export virtualbox-ext-oracle)
(re-export waybar-weather)
(re-export wps-office-mime-cn)
(re-export wsdd2)
(re-export wsl2-ssh-agent)
(re-export xdg-ninja)
(re-export xr-hardware)
(re-export xtables-addons-dkms)
(re-export yt6801-dkms)
(re-export zmx)
(re-export pkg-0ad-zh-lang)
(re-export pkg-8188eu-dkms-git)
(re-export amneziawg-dkms)
(re-export ananicy-cpp-s6)
(re-export android-platform)
(re-export android-platform-23)
(re-export apple-sf-script-extension-fonts)
(re-export archlinux-java-run)
(re-export awww-bin)
(re-export bcachefs-kernel-dkms-git)
(re-export betterbird-bin)
(re-export betterbird-de-bin)
(re-export bleachbit-root)
(re-export brother-hll2445dw-lpr-bin)
(re-export brscan5)
(re-export cheminot)
(re-export cnijfilter2-g3010)
(re-export code-marketplace)
(re-export com.qq.weixin.work.deepin)
(re-export crepe-bin)
(re-export cubiomes-viewer)
(re-export ddcci-driver-linux-dkms-git)
(re-export decent-sampler-bin)
(re-export downgrade)
(re-export dstl)
(re-export echo-vn-bin)
(re-export emsdk)
(re-export epson-inkjet-printer-escpr2)
(re-export etcher-ng-bin)
(re-export firefox-developer-edition-vencord-bin)
(re-export firefox-vencord-bin)
(re-export flclashx-git)
(re-export flow-control-git)
(re-export fluent-cursor-theme-git)
(re-export flutter-material-fonts-google-bin)
(re-export flutter-sky-engine-google-bin)
(re-export fnox-bin)
(re-export game-devices-udev)
(re-export geekbench)
(re-export ghk-bin)
(re-export gnome-shell-extension-logo-menu)
(re-export gnome-shell-extension-tiling-assistant)
(re-export google-cloud-cli)
(re-export google-cloud-cli-bq)
(re-export google-cloud-cli-bundled-python3-unix)
(re-export google-cloud-cli-component-gke-gcloud-auth-plugin)
(re-export google-cloud-cli-gsutil)
(re-export gopreload-git)
(re-export gpd-fan-driver-dkms-git)
(re-export grimaur-git)
(re-export grpcurl)
(re-export gruvbox-plus-icon-theme-git)
(re-export heroic-games-launcher-bin)
(re-export hyprland-per-window-layout)
(re-export hypruler)
(re-export i386-elf-binutils)
(re-export keyd-openrc)
(re-export kohighlights)
(re-export lemonade-desktop)
(re-export lib32-opencl-nvidia-580xx)
(re-export libbit4opki)
(re-export liboobs)
(re-export librewolf-vencord-bin)
(re-export ltex-ls-plus-bin)
(re-export font-barlow)
(re-export font-et-book-otf)
(re-export font-et-book-ttf)
(re-export font-et-book-type1)
(re-export python-jsonpath-python)
(re-export python-pyfzf)
(re-export python-pdf2image)
(re-export python-sqlglot)
(re-export python-decouple)
(re-export args-cpp)
(re-export logiops)
(re-export clipboard-cli)

;;; recipe-resolver-260423i
(re-export cyrus-imapd-docs)
(re-export otf-gfs)
(re-export ttf-oxygen)
(re-export gtk-arc-flatabulous-theme-git)
(re-export libvterm-bzr)
(re-export underscorejs)
(re-export s)
(re-export ldraw-parts-library)
(re-export hunspell-ca)
(re-export bdf-tamzen-font-git)
(re-export otb-tamzen-font-git)
(re-export pcf-tamzen-font-git)
(re-export psf-tamzen-font-git)
(re-export ttf-tamzen-font-git)
(re-export xlhtml)
(re-export hunspell-pt-pt)
(re-export kicad-library-sparkfun-git)
(re-export daa2iso)
(re-export freefonts)
(re-export flatwoken-icons-git)
(re-export libopenmpt-doc-svn)
(re-export openrc-arch-services-git)
(re-export plata-theme)
(re-export evopop-icon-theme)
(re-export voikko-fi)
(re-export afio)
(re-export ttf-weather-icons)
(re-export libcrossguid-git)
(re-export libxkbcommon-doc-git)
(re-export mythes-pt-br)
(re-export sutils-git)
(re-export ttf-nanumgothic-coding)
(re-export paxctl)
(re-export freeipa-client-common)
(re-export facetimehd-firmware)
(re-export urbanlifestyle-sddm-theme)
(re-export ttf2eot)
(re-export scsiadd)
(re-export keyfuzz)
(re-export blokator)
(re-export caffe-doc-git)
(re-export gnome-shell-extension-coverflow-alt-tab)
(re-export lubuntu-artwork)
(re-export meanwhile-docs)
(re-export otf-inconsolata-powerline-git)
(re-export srb2-data)
(re-export torch7-cwrap-git)
(re-export nordic-theme-git)
(re-export gobi-loader)
(re-export hstr-git)
(re-export obsetlayout)
(re-export stardict-en-cz)
(re-export tcc-git)
(re-export ttf-beteckna)
(re-export ttf-mikachan)
(re-export bbswitch-git)
(re-export rainbarf-git)
(re-export portmaster-legacy-bin)
(re-export nordic-standard-buttons-theme)
(re-export nordic-polar-standard-buttons-theme)
(re-export nordic-darker-theme)
(re-export nordic-bluish-accent-theme)
(re-export nordic-bluish-accent-standard-buttons-theme)
(re-export cppreference-qt)
(re-export arc)
(re-export gstreamer-docs-git)
(re-export gtk-theme-windows10)
(re-export quartus-free-devinfo-arria-lite)
(re-export quartus-free-devinfo-cyclone)
(re-export quartus-free-devinfo-cyclone10lp)
(re-export quartus-free-devinfo-cyclonev)
(re-export quartus-free-devinfo-max)
(re-export quartus-free-devinfo-max10)
(re-export ttf-mononoki-git)
(re-export nordic-theme)
(re-export orchis-theme-git)
(re-export orchis-nord-theme-git)
(re-export orchis-dracula-theme-git)
(re-export open-dyslexic-fonts)
(re-export adapta-backgrounds)
(re-export nvidia-sdk)
(re-export nvidia-sdk-doc)
(re-export ttf-essays)
(re-export ttf-humor-sans)
(re-export numix-gtk-theme)
(re-export lscolors-git)
(re-export nerd-fonts-git)
(re-export amd-zen-ucode-platomav)
(re-export aur-out-of-date)
(re-export dict-freedict-eng-deu)
(re-export xinput-calibrator)
(re-export tmux-mem-cpu-load-git)
(re-export terminus-font-ll2-td1)
(re-export xmlindent)
(re-export kbdlight)
(re-export leiningen-completions)
(re-export numix-themes-darkblue)
(re-export xi-core-git)
(re-export rcm)
(re-export pvs-studio)

;;; deptree-resolver-260423f re-exports
(re-export mailhog)
(re-export mingw-w64-dlfcn)
(re-export mingw-w64-extra-cmake-modules)
(re-export mingw-w64-libtasn1)
(re-export mingw-w64-mpfr)
(re-export mingw-w64-nettle)
(re-export mingw-w64-pkg-config)
(re-export mingw-w64-termcap)
(re-export mobilesheets-companion)
(re-export moo)
(re-export nerd-fonts-cozette-ttf)
(re-export nhaccuatui)
(re-export ntfsplus-dkms-git)
(re-export ntfsplus-udev)
(re-export obs-cmd)
(re-export oh-my-zsh-git)
(re-export openhardwaremonitor)
(re-export openspec)
(re-export openttd-openmsx)
(re-export outfieldr-git)
(re-export pacman-systemd-inhibit)
(re-export pacserve)
(re-export perl-poe-component-syndicator)
(re-export perl-spreadsheet-writeexcel)
(re-export perl-test-perl-critic)
(re-export pickdate)
(re-export plasma-mobile-sounds)
(re-export plymouth-zfs)
(re-export python2-attrs)
(re-export python2-funcsigs)
(re-export python2-idna)
(re-export python2-mutagen)
(re-export python2-opengl)
(re-export python2-py)
(re-export python2-toml)
(re-export python2-wheel)
(re-export python2-zipp)
(re-export r-data.table)
(re-export radar-omega)
(re-export rate-mirrors-git)
(re-export rawbit)
(re-export realvnc-vnc-viewer)
(re-export rollup)
(re-export rtl8852cu-dkms-morrownr-git)
(re-export scx-openrc)
(re-export sing-box-ref1nd)
(re-export smithery-cli)
(re-export snap-pac-grub)
(re-export steam-cloud-file-manager-bin)
(re-export storageexplorer)
(re-export systemd-suspend-modules)
(re-export tauno-serial-plotter-bin)
(re-export tfenv)
(re-export usrgrp-manager-bin)
(re-export vencord-bin)
(re-export vesktop-bin)
(re-export visual-paradigm-163)
(re-export vrrtest-git)
(re-export vscodium-all-marketplace)
(re-export vuze)
(re-export wsl-hello-sudo-bin)
(re-export xerox-spl-driver-common)
(re-export zsh-fast-syntax-highlighting)
(re-export pkg-0xtools)
(re-export pkg-8192eu-dkms-git)
(re-export advcpmv)
(re-export adwaita-qt5)
(re-export adwaita-qt6)
(re-export alacritty-use-theme-git)
(re-export android-apktool)
(re-export apk-mitm)
(re-export apulse)
(re-export arm-linux-gnueabihf-glibc)
(re-export aurvote-utils)
(re-export bitbox-wallet-app-rpm)
(re-export bitburner)
(re-export brother-dcp1610w)
(re-export btrustbiss)
(re-export cairo-clock)
(re-export clp)
(re-export dbmodel-qt5)
(re-export deeplx-git)
(re-export drinfo-git)
(re-export eask-cli-git)
(re-export electron39-bin)
(re-export eqonomize)
(re-export flite1)
(re-export fluent-icon-theme-git)
(re-export flutter-dart-google-bin)

(re-export r-tidyjson)
(re-export r-inflection)
(re-export r-dice)
(re-export r-ggquiver)
(re-export r-vip)
(re-export r-mcmcse)
(re-export r-widyr)
(re-export r-finetune)
(re-export python-super-collections)
(re-export python-mkdocs-macros-plugin)
(re-export fswebcam)
(re-export fastchess)
(re-export fsv3)
(re-export likwid)
(re-export font-selawik)
(re-export komga)

;;; recipe-resolver-260423j
(re-export feluda-bin)
(re-export wasmrun-bin)
(re-export teleport-client-bin)
(re-export tuios-web-bin)
(re-export scorecard-bin)
(re-export natscli-bin)
(re-export daylight-bin)
(re-export lact-headless-bin)
(re-export clipvault-bin)
(re-export tug-bin)
(re-export garden-bin)
(re-export buttery-bin)
(re-export chandler-bin)
(re-export cargo-visualize-bin)
(re-export jarl-bin)
(re-export proton-drive-sync-bin)
(re-export lean-ctx-bin)
(re-export firebase-tools-bin)
(re-export qbittorrent-cli-bin)
(re-export capacities-appimage)
(re-export dataflare-bin)
(re-export edex-ui-bin)
(re-export clash-verge-rev-autobuild-bin)
(re-export koofr-desktop-bin)
(re-export gmodpatchtool-bin)
(re-export bibata-modern-classic-cursor-theme)
(re-export android-messages-desktop-bin)

;;; deptree-resolver-260423g re-exports
(re-export git-koji-bin)
(re-export qoder-bin)
(re-export flutter-engine-android-google-bin)
(re-export flutter-engine-linux-google-bin)
(re-export flutter-engine-web-google-bin)
(re-export flutter-gradle-google-bin)
(re-export gnome-shell-extension-blur-my-shell)
(re-export gputest)
(re-export greetd-dms-greeter-git)
(re-export hid-asus-mouse-dkms-git)
(re-export immuarch-verity-git)
(re-export intel-ipu6-camera-bin)
(re-export ionosctl)
(re-export ivpn-ui)
(re-export java-gurobi)
(re-export journalctl-desktop-notification)
(re-export komac)
(re-export krokiet-bin)
(re-export lazygit-git)
(re-export lbn)
(re-export lib32-nvidia-580xx-utils)
(re-export lib32-vulkan-amdgpu-pro)
(re-export libisl-git)
(re-export linux-firewire-utils)
(re-export longbridge-pro-appimage)
(re-export maki-cli)
(re-export mal)
(re-export mediatek-mt7927-dkms)
(re-export motrix-bin)
(re-export msodbcsql)
(re-export netease-cloud-music-wine)
(re-export nohang-git)
(re-export noorfetch)
(re-export novel-editor-bin)
(re-export nuls)
(re-export nvidia-580xx-dkms)
(re-export nvm-fish)
(re-export obs-composite-blur)
(re-export oracle-sqldeveloper)
(re-export pacdep)
(re-export pam-usb)
(re-export paru-bin)
(re-export perl-module-starter)
(re-export perl-net-curl)
(re-export perl-poe-filter-ircd)
(re-export pgmodeler)
(re-export pgvector)
(re-export plasma6-applets-panel-spacer-extended)
(re-export rclonefzf)
(re-export rivetui-git)
(re-export rtl8851bu-dkms-git)
(re-export rtl88x2bu-dkms-git)
(re-export ruby-flexmock)
(re-export rvgl-original)
(re-export samrewritten)
(re-export shamela)
(re-export shiny-mirrors)
(re-export spotify-adblock-git)
(re-export steamvr-openhmd-git)
(re-export tetrio-desktop-electron)
(re-export thorium-reader)
(re-export tirith)
(re-export transgui-git)
(re-export update-mirrors)
(re-export uutils-diffutils)
(re-export val)
(re-export worldeditor-bin)
(re-export xterminal-bin)
(re-export yp-tools)
(re-export ytify)
(re-export zenmonitor3)
(re-export zond)
(re-export pkg-86box-manager)
(re-export android-ndk)
(re-export aqemu)
(re-export armv7l-binutils)
(re-export asset-ripper-bin)
(re-export backrest)
(re-export bootstrap-studio)
(re-export chess-native)
(re-export clash-verge-rev-bin)
(re-export coreusage-git)
(re-export deltaclient-git)
(re-export ente-auth-bin)
(re-export fastmail)
(re-export firefox-extension-bitwarden)
(re-export fred)
(re-export gentoo-sources)
(re-export gitkraken)
(re-export hid-fanatecff-dkms)
(re-export hp15c)
(re-export iacs)
(re-export kde-service-menu-reimage-mod)

;;; recipe-resolver-260423j
(re-export wine-stable-mono)
(re-export spicetify-cli-git)
(re-export catppuccin-mocha-grub-theme-git)
(re-export catppuccin-qt5ct-git)
(re-export whisper-cpp-model-large-v3)
(re-export hyprls-git)
(re-export shiru-lv2-git)
(re-export ttf-chocolate-classical-sans)
(re-export nordic-darker-standard-buttons-theme-git)
(re-export lolcat++-bin)
(re-export stdexec-git)
(re-export zen-browser-sponsorblock)
(re-export librewolf-extension-sponsorblock)
(re-export firefox-extension-sponsorblock)
(re-export argon-rbx)
(re-export urweb-git)
(re-export pyboinc-git)
(re-export flandre-grub-theme-git)
(re-export phc-intel-dkms-stable)
(re-export openssl-1-0)
(re-export mp3tag)
(re-export cachyos-ananicy-rules-git)
(re-export nodejs-http-server)
(re-export libvpx1-3)
(re-export kubectl-cnpg)
(re-export makepkg-meta)
(re-export looking-glass-rc-module-dkms)
(re-export pipes-c)
(re-export networkd-broker)
(re-export piper-voices-en-gb)

;;; recipe-resolver-260423k
(re-export aspnet-targeting-pack-9-0-bin)
(re-export pkgdu)
(re-export pacman-repo-stats)
(re-export msi-ec-dkms-git)
(re-export datagrip-eap-jre)
(re-export datagrip-eap)
(re-export openttd-jgrpp-opensfx)
(re-export openttd-jgrpp-openmsx)
(re-export openttd-jgrpp-opengfx)
(re-export firefox-extension-reddit-enhancement-suite)
(re-export pgmq)
(re-export pacman-command-utils)
(re-export odinls-git)
(re-export mihomo-alpha-git)
(re-export gtk2+extra)
(re-export stormy)
(re-export firefox-sponsorblock-for-youtube-skip-sponsorships-bin)
(re-export doublecmd-gtk2)
(re-export stable-diffusion-cpp-hipblas-git)
(re-export claudes-c-compiler-doc)
(re-export claudes-c-compiler-src)
(re-export qucs)
(re-export brother-hl2270dw)
(re-export php84-mbstring)
(re-export php84-intl)
(re-export php84-gmp)
(re-export php84-gd)
(re-export php84-ftp)
(re-export php84-ffi)
(re-export python-rofi-git)

;;; recipe-resolver-260423l
(re-export stm32flash)
(re-export betaflight-configurator-bin)
(re-export betaflight-configurator)
(re-export caffe-doc)
(re-export libresample)
(re-export pup-git)
(re-export stardict-en-ru-bars)
(re-export transmission-gtk-git)
(re-export sct)
(re-export ttf-dejavu-emojiless)
(re-export usbasp-udev)
(re-export general-preprocessor)
(re-export gobi-firmware)
(re-export i3blocks-git)
(re-export ttf-league-gothic)
(re-export malaga)
(re-export neon-wallet-bin)
(re-export pacnews-git)
(re-export tor-messenger-bin)
(re-export xcursor-gt3)
(re-export fbcat)
(re-export openxcom-docs-git)
(re-export i3blocks-contrib)
(re-export nomachine-enterprise-client)
(re-export dendrite)
(re-export lua54-cjson)
(re-export lua53-cjson)
(re-export lua52-cjson)
(re-export lua51-cjson)
(re-export lua-cjson)
(re-export atomicwallet)
(re-export dbschema)
(re-export applyppf)
(re-export antergos-wallpapers)
(re-export gmt-coast)
(re-export nerd-fonts-complete-mono-glyphs)
(re-export android-sources)
(re-export breeze-lxqt)
(re-export cloudfoundry-cli)
(re-export libgphobos-git)
(re-export glui)
(re-export md5)
(re-export otf-pecita)
(re-export ovpngen)
(re-export shadowfox-updater)
(re-export ttf-d2coding)
(re-export ttf-tengwar-annatar)
(re-export ttf-tiresias)
(re-export windows10-icon-theme-git)
(re-export zsh-doc-git)
(re-export ttf-material-design-icons-extended)
(re-export hdsentinel)
(re-export rancher-k3d-bin)
(re-export argparser-python)
(re-export huiontablet)
(re-export swapspace)
(re-export emulationstation-themes)
(re-export qogir-icon-theme-git)
(re-export i3-battery-popup-git)
(re-export anoise-community-extension1)
(re-export minecraft-overviewer-docs-git)
(re-export chez-scheme-git)
(re-export doom3-data)
(re-export fairymax)
(re-export mac-os-lion-cursors)
(re-export pfetch-git)
(re-export pipewire-docs-git)
(re-export ttf-ricty)
(re-export ttf-twcns-fonts)
(re-export ucsf-chimera)
(re-export words-insane)
(re-export folder-color-switcher)
(re-export libjxl-doc-git)
(re-export obfs4proxy-bin)
(re-export volta-bin)
(re-export tastytrade)
(re-export keyd-git)
(re-export colobot-gold-data)
(re-export alac-git)
(re-export maitreya)
(re-export anoise-community-extension2)
(re-export anoise-community-extension3)
(re-export otf-san-francisco-mono)
(re-export 7kaa-music)
(re-export cairo-docs-git)
(re-export freeminer-common)
(re-export minecraft-overviewer-docs)
(re-export nafe)
(re-export oranchelo-icon-theme-git)
(re-export otf-asana-math)
(re-export otf-fifthleg)
(re-export pambase-selinux)
(re-export soundfont-generaluser)
(re-export ttf-sil-ezra)
(re-export yadm-git)
(re-export heretic1-wad)
(re-export factorio-headless-experimental)
(re-export sift)
(re-export rockyou)
(re-export ttf-cheapskate)

;;; recipe-resolver-260423m
(re-export dbus-docs-selinux)
(re-export fatattr)
(re-export fnfx)
(re-export fvwm-icons)
(re-export geekcode)
(re-export gfxtablet-git)
(re-export gtk-theme-windows10-dark)
(re-export helm-synth-common-git)
(re-export jotta-cli)
(re-export kmod-roccat)
(re-export libserialport-git)
(re-export memstat)
(re-export mint-themes-git)
(re-export mobile-broadband-provider-info-git)
(re-export num-utils)
(re-export osgearth-docs)
(re-export otf-fira-code-git)
(re-export otf-openbaskerville)
(re-export python-pyexiftool)
(re-export selinux-refpolicy-src)
(re-export smartsim-git)
(re-export xcursor-neutral++)
(re-export xgboost-git)
(re-export can-utils)
(re-export weex)
(re-export udpcast)
(re-export firefox-extension-keepassxc-browser)
(re-export act-bin)
(re-export duckdns)
(re-export numix-icon-theme-pack-git)

;;; deptree-resolver-260423h re-exports
(re-export legcord)
(re-export lib32-freearc-bin)
(re-export lib32-libxxf86dga)
(re-export minecraft-launcher)
(re-export modiva-launcher-bin)
(re-export neovim-remote)
(re-export ntfysh)
(re-export nvidia-340xx-lts)
(re-export octarine-bin)
(re-export open-webui)
(re-export opencode-desktop-bin)
(re-export osaka-simulator)
(re-export pacdiff-pacman-hook-git)
(re-export pear-desktop)
(re-export perl-lwp-protocol-socks)
(re-export piavpn-bin)
(re-export plasma6-applets-kara-git)
(re-export python-gurobipy)
(re-export python-pyqt5-webengine)
(re-export r-gurobi)
(re-export r8168-dkms)
(re-export rescrobbled-git)
(re-export rtl8188gu-dkms-git)
(re-export scarlett2)
(re-export seerr)
(re-export simple-mtpfs)
(re-export sing-box)
(re-export swayshot)
(re-export tek)
(re-export tio)
(re-export tuxedo-keyboard-tools)
(re-export updpkgsrcs)
(re-export uutils-hostname-git)
(re-export uutils-procps-git)
(re-export uutils-sed-git)
(re-export uutils-tar-git)
(re-export uutils-util-linux-git)
(re-export vintagestory)
(re-export wails)
(re-export warsaw-bin)
(re-export wayfreeze-git)
(re-export winboat-bin)
(re-export xlibre-video-voodoo)
(re-export xnconvert)
(re-export yabsnap)
(re-export abcde-musicbrainz-meta)
(re-export android-studio)
(re-export app2unit-git)
(re-export arch-check)
(re-export aur-auto)
(re-export aur-auto-vote-git)
(re-export binance)
(re-export biu-tauri-bin)
(re-export brave-bin)
(re-export brother-hl1118)
(re-export brother-mfc-l3770cdw)
(re-export bruno)
(re-export checkpac)
(re-export clipboard-manager-git)
(re-export dab-cli)
(re-export dare-devil)
(re-export droidcam-obs-plugin-git)
(re-export flac2all)
(re-export flutter-artifacts-material-fonts-google-bin)
(re-export flutter-artifacts-sky-engine-google-bin)
(re-export git-credential-manager-bin)
(re-export google-calender-widget)
(re-export gr-ieee802-11-git)
(re-export i686-elf-pcc-git)
(re-export icecat-ublock-origin)
(re-export jailbox-git)
(re-export kdoctools5)
(re-export lib32-glibc-git)
(re-export libaudec)
(re-export luffy-bin)
(re-export lunatask)
(re-export macchina-git)
(re-export nautilus-metadata-editor)
(re-export numaplayer)
(re-export nvidia-340xx-lts-dkms)
(re-export oblivion-desktop-git)
(re-export obs-vaapi)
(re-export ocs-url)
(re-export pamac-tray-icon-plasma)
(re-export pdf-xchange)
(re-export pds-gatekeeper-git)
(re-export pesconvert-git)
(re-export phiola-bin)
(re-export plasma6-applets-resources-monitor)
(re-export pm2ml)
(re-export python-diskcache)
(re-export python-mock)

;;; recipe-resolver-260423n
(re-export libgen-cli-bin)
(re-export otf-joscelyn)
(re-export kctrl-bin)
(re-export namespaced-openvpn-git)
(re-export joshuto-bin)
(re-export zclipboard)
(re-export vpinball-bgfx.cmake)
(re-export vkfetch-git)
(re-export scie-pants-bin)
(re-export ontake-copybara-git)
(re-export gocurl-bin)
(re-export git-age-bin)
(re-export tes3cmd)
(re-export pokemon-colorscripts-fork-git)
(re-export keepassxc-wordlist-eyeware)

;;; recipe-resolver-260423o
(re-export amalgo-bin)
(re-export bab-bin)
(re-export shaka-packager-bin)
(re-export ssh2incus-bin)
(re-export zen-adblocker-bin)
(re-export vermin-bin)
(re-export binvec-bin)
(re-export tabular-bin)
(re-export logisim-ita-bin)
(re-export ffdec-bin)
(re-export llama.cpp-vulkan-bin)
(re-export kerminal-bin)
(re-export python-proglog)
(re-export aggregate)
(re-export ymuse-bin)


;;; deptree-resolver-260423i re-exports
(re-export elephant-bin)
(re-export httpfs2-2gbplus)
(re-export python-litex)
(re-export ncurses5-compat-libs)
(re-export nvidia-utils-beta)
(re-export cosmic-icons-git)
(re-export python-questionary)
(re-export qt5-doc)
(re-export xlibre-xserver-common-git)
(re-export qt5-wayland-decorations)
(re-export gurobi)
(re-export jdk25-graalvm-bin)
(re-export libelectron)
(re-export cosmic-randr-git)
(re-export libajantv2)
(re-export matlab-mpm)
(re-export python-inquirerpy)
(re-export rvgl-bin)
(re-export mozc-ut-full-common)
(re-export asusctl)
(re-export fizz)
(re-export wayfire)
(re-export pgadmin4-server)
(re-export java-openjfx)
(re-export lib32-gstreamer)
(re-export sonic-win)
(re-export samsung-unified-driver-common)
(re-export dotnet-targeting-pack-8.0-bin)
(re-export libklvanc)
(re-export owlry-plugin-calculator)
(re-export owlry-plugin-converter)
(re-export owlry-plugin-system)
(re-export owlry-plugin-bookmarks)
(re-export owlry-plugin-filesearch)
(re-export owlry-plugin-pomodoro)
(re-export owlry-plugin-scripts)
(re-export owlry-plugin-websearch)
(re-export plasma-wayland-protocols-povd)
(re-export python-aiocache)
(re-export qt5-scxml)
(re-export xone-dongle-firmware)
(re-export android-sdk-build-tools)
(re-export owlry-plugin-media)
(re-export owlry-plugin-ssh)
(re-export owlry-plugin-systemd)
(re-export owlry-plugin-weather)
(re-export mozc)
(re-export owlry-plugin-clipboard)
(re-export owlry-plugin-emoji)
(re-export smpq)
(re-export app2unit)
(re-export discord-rpc)
(re-export osu-mime)
(re-export python-aiolimiter)
(re-export python-m3u8)
(re-export python-opentelemetry-proto)
(re-export bms-shell)
(re-export dotnet-runtime-8.0-bin)
(re-export dotnet-runtime-preview-bin)
(re-export lcevcdec)
(re-export aimp)
(re-export gslapper)
(re-export python-opentelemetry-exporter-zipkin-json)
(re-export electron-castlab-bin)
(re-export gradle8)
(re-export android-sdk)
(re-export qmc2-common-git)
(re-export lgogdownloader)
(re-export python-mistralai)
(re-export cosmic-comp-git)
(re-export vim-classic-runtime-git)
(re-export linux-lqx)
(re-export deadbeef)
(re-export wivrn-server)
(re-export jdk23-openjdk)
(re-export ros2-arch-deps)
(re-export brother-lpr-drivers-common)
(re-export genders)
(re-export gst-thumbnailers)
(re-export hyprshot)
(re-export keychron-link-udev)
(re-export libfmod)
(re-export localepurge)
(re-export logmein-hamachi)
(re-export ps3-env)
(re-export python-uharfbuzz)
(re-export tailscale)
(re-export tosu)
(re-export ttf-material-symbols-variable-git)

;;; recipe-resolver-260423p
(re-export windigo)
(re-export todoist-wrapper-bin)
(re-export specter-desktop-appimage)
(re-export sixteen-bin)
(re-export markterm-bin)
(re-export hace-bin)
(re-export git-ignore)
(re-export apollo-neo-env-manager-dev)
(re-export libretro-mame2003-git)
(re-export gradle-language-server)
(re-export winarcadia-bin)
(re-export swiftfetch)
(re-export runpodctl-git)
(re-export lfs-dal-git)
(re-export jd-gui-duo-bin)
(re-export java-debug)
(re-export contextpilot)
(re-export spacetimedb-cli-bin)
(re-export kwin-tile-gaps-git)
(re-export katachi)
(re-export dict-freedict-ita-eng-bin)
(re-export dict-freedict-eng-ita-bin)
(re-export remindr-bin)
(re-export ostui)
(re-export legume)
(re-export lbb)
(re-export tui-sudoku)
(re-export ripdrag-git)
(re-export sasquatch-git)
(re-export postier-bin)
(re-export luajit-tiktoken-bin)
(re-export homie-bin)
(re-export typhoon-bin)
(re-export aur-talk-git)
(re-export cloudflared-bin)
(re-export setserial)
(re-export xplayer-plparser)
(re-export hy3)
(re-export prismlauncher-themes-git)
(re-export melt-bin)
(re-export rnr-bin)
(re-export html2md)
(re-export soapui)
(re-export yt-x)
(re-export zsh-eza-git)
(re-export filezilla-server-bin)
(re-export pbget)
(re-export jprofiler)
(re-export sudo-rs-git)
(re-export tlm)
(re-export zsh-autocomplete-git)
(re-export zsh-defer-git)
(re-export cockpit-file-sharing)
(re-export ltfs)
(re-export freenginx-src)
(re-export sieve-app-bin)
(re-export deepcool-digital-linux-git)
(re-export shadps4-pre-release-bin)
(re-export netcalc)
(re-export redot-mono-bin)
(re-export redot-git)
(re-export sgf-render)
(re-export sddm-sugar-dark)
(re-export pipes-rs-git)
(re-export newsboat-og)
(re-export dumber)
(re-export linux-logo)
(re-export dyna-git)
(re-export vpinball)
(re-export sparkle-electron-git)
(re-export openkj)
(re-export nodejs-fanyi)
(re-export node-fanyi)
(re-export libzedmd-git)
(re-export kubectl-ai-bin)
(re-export kernel-headers-trigger)
(re-export taskopen)
(re-export tageditor)
(re-export asusctl-git)
(re-export scamper)
(re-export scitopdf)
(re-export meowsql)
(re-export boxtron-git)
(re-export vlc-protocol)
(re-export ttyc)
(re-export python-scalene)
(re-export justdd)
(re-export glyph-bin)
(re-export firefox-extension-singlefile-bin)
(re-export exdupe-bin)
(re-export monitorix)
(re-export umlet)
(re-export virtualfish)

;;; recipe-resolver-260423q
(re-export iortcw-data)
(re-export intel-mas-cli-tool)
(re-export base91)
(re-export cmdpack-bin2ecm)
(re-export cmdpack-bincomp)
(re-export cmdpack-brrrip)
(re-export cmdpack-byteshuf)
(re-export cmdpack-cdpatch)
(re-export cmdpack-fakecrc)
(re-export cmdpack-hax65816)
(re-export cmdpack-pecompat)
(re-export cmdpack-rels)
(re-export cmdpack-screamf)
(re-export cmdpack-uips)
(re-export cmdpack-vb2rip)
(re-export cmdpack-wordadd)
(re-export gtkman)
(re-export hunspell-bg)
(re-export liri-wallpapers)
(re-export xcursor-dmz)
(re-export yaft)
(re-export gtk-theme-onestepback)
(re-export muscle)
(re-export squirrel)
(re-export mactelnet)
(re-export wordlists)
(re-export otf-sans-forgetica)
(re-export netkit-bsd-finger-ipv6)
(re-export nginx-libunit)
(re-export lexend-fonts-git)

;;; deptree-resolver-260423j
(re-export ghidra-git)
(re-export ntfs2btrfs-git)
(re-export python-frida-bin)
(re-export project-registry)
(re-export python-frida-tools)
(re-export dingtalk-wayland-screenshare-git)
(re-export vrcx-git)
(re-export tabby)
(re-export wiliwili-wayland)

;;; recipe-resolver-260423s
(re-export nexttrace-bin)
(re-export picsort-bin)
(re-export nvidia-gpu-exporter-bin)
(re-export clipvault-bin)
(re-export lact-headless-bin)
(re-export feluda-bin)
(re-export dopamine-bin)
(re-export teleport-client-bin)
(re-export nitchrevived-bin)
(re-export nmp-settings-bin)
(re-export clash-verge-rev-autobuild-bin)
(re-export discord-rpc-extension-bin)
(re-export bluebubbles-bin)
(re-export deepchat-bin)
(re-export firedragon-alpha-bin)
(re-export java17-openjfx-bin)
(re-export shstatus)
(re-export caches-manager)
(re-export path-utils)
(re-export ffmpeg-audio-thumbnailer)
(re-export fcitx5-skin-ori-git)
(re-export python-stringzilla)
(re-export python-pdf2doi)
(re-export python-pympress)
(re-export python-audible-cli)
(re-export uhubctl)
(re-export vvdec)
(re-export ebsl)
(re-export jbofihe-git)
(re-export abuse-git)

(re-export rmapi)
(re-export alx-wol-dkms)
(re-export espanso-gui)
(re-export joshuto-git)
(re-export opengamepadui-bin)
(re-export awatcher-git)
(re-export aspia-client)
(re-export zing-8-bin)
(re-export swtchr)
(re-export spyder-terminal)
(re-export sparkle-git)
(re-export serverseekerv2-git)
(re-export seh-utn)
(re-export scrutiny-runit)
(re-export python-modesolverpy)
(re-export postgresql-uint-git)
(re-export postgresql-uint)
(re-export minibridge-git)
(re-export minibridge)
(re-export libpinmame-git)
(re-export libdxvk-gplasync)
(re-export libdof-git)
(re-export leetcode-local-cli)
(re-export komodo-periphery-bin)
(re-export jdk24-graalvm-ee-bin)
(re-export jdk22-graalvm-bin)
(re-export influxdb-runit)
(re-export customasm)
(re-export bangumium-git)
(re-export httraqt)
(re-export camlpdf)
(re-export hg-evolve)
(re-export superpaper)
(re-export libpostal-git)
(re-export stash)
(re-export brother-ql820nwb)
(re-export vidmerger-git)
(re-export qcalcfilehash)
(re-export python-tryton)
(re-export activity-aware-firefox)
(re-export wretch)
(re-export python-goocalendar)
(re-export newrelic-infra-bin)
(re-export libxerces-c-3-2)
(re-export libpupdmd-git)
(re-export libframeutil-git)
(re-export firefox-extension-simplelogin-bin)
(re-export claude-linux-client-bin)
(re-export suricata)
(re-export iscan-plugin-gt-s650)
(re-export standardfile-bin)
(re-export python-aiomax-git)
(re-export libdmdutil-git)
(re-export immich-runit)
(re-export thor-flash-utility)
(re-export gprbuild-bootstrap)
(re-export ada-language-server-bin)
(re-export freeimage-vpinball-git)
(re-export rustowl-git)
(re-export libaltsound-git)
(re-export fingerprintx-bin)
(re-export fingerprintx)
(re-export codelite-bin)
(re-export retrobyte)
(re-export musicpod)
(re-export tor-browser-alpha-bin)
(re-export ianny-git)
(re-export hopper4)
(re-export rubymine)
(re-export libva-intel-driver-hybrid)
(re-export shiroa)
(re-export mullvad-browser-latest-bin)
(re-export aw-watcher-media-player)
(re-export nping)
(re-export sptlrx-bin)
(re-export codegpt-bin)
(re-export dunst-wayland-git)
(re-export lefthook-bin)
(re-export jcal)
(re-export gcc12-libs)
(re-export picotool)
(re-export mycorrhiza)
(re-export plank-reloaded-git)
(re-export linkwarden)
(re-export skippy-xd-git)
(re-export simple-scan-linuxmint)
(re-export qutebrowser-profile-git)
(re-export recyclarr-bin)
(re-export td-tui)
(re-export litra)
(re-export hedgedoc2)
(re-export victoriametrics)
(re-export wlmaker)
(re-export nrfconnect-appimage)
(re-export sacd-extract)
(re-export gnome-system-monitor-linuxmint)
(re-export hypnotix-git)
(re-export vapoursynth-plugin-adjust-git)
(re-export fotokilof)
(re-export mcptools)

;; recipe-resolver-260423t
(re-export ttf-comfortaa)
(re-export python-convertdate)
(re-export zdbsp)
(re-export xst)
(re-export gpp)
(re-export everforest-gtk-theme-git)
(re-export python-telegram-send)
(re-export python-pyvis)
(re-export python-sioyek)
(re-export liboqs)
(re-export openssh-askpass-qt)
(re-export quickbib)
(re-export netcheck)
(re-export scalpel-git)

;;; deptree-resolver-260424a
(re-export openfortivpn-webview-qt)
(re-export vscodium-electron)

;;; recipe-resolver-260424b
(re-export sigi)
(re-export greetd-tuigreet-fork-git)
(re-export phpactor)

;;; recipe-resolver-260424d
(re-export yay-bin)
(re-export teleport-client-bin)
(re-export marmite-bin)
(re-export rtimelog)
(re-export 7zip-docs)


;;; recipe-resolver-260424d
(re-export boostchanger-bin)
(re-export bootleg-bin)
(re-export bottom-nightly-bin)
(re-export brainfuck-psiphon-pro-go-bin)
(re-export bridje-bin)
(re-export brother-dcp-t710w-lpr-bin)
(re-export brother-dcpl2520d-cups-bin)
(re-export brother-dcpl2520d-lpr-bin)
(re-export brother-dcpl3510cdw-drv-bin)
(re-export brother-hll5200dw-cups-bin)
(re-export brother-hll9200cdw-cups-bin)
(re-export brother-hll9200cdw-lpr-bin)
(re-export brother-hl-l2325dw-cups-bin)
(re-export brother-hl-l2325dw-lpr-bin)
(re-export browser360-bin)
(re-export buildkite-agent-bin)
(re-export bypass-utility-bin)
(re-export c0-bin)
(re-export cain-ncnn-vulkan-bin)
(re-export cajviewer-bin)
(re-export calicoctl-bin)
(re-export calmly-writer-bin)
(re-export camel-k-bin)
(re-export cantara-bin)
(re-export caretaker-bin)
(re-export carfirma-bin)
(re-export carve-bin)
(re-export cassowary-bin)
(re-export castsponsorskip-bin)
(re-export catp-bin)
(re-export catppuccinifier-cli-bin)
(re-export cavecube-sdl2-bin)
(re-export cavif-bin)
(re-export cazic-bin)
(re-export cb-bin)
(re-export cbmc-bin)
(re-export ccextractor-gui-bin)
(re-export certainly-bin)
(re-export certificate-ripper-bin)
(re-export certmanager-bin)
(re-export chat-bin)
(re-export chattervox-bin)
(re-export chbg-bin)
(re-export chinesechess-bin)
(re-export chowphaser-bin)
(re-export chowtapemodel-bin)
(re-export cicada-bin)
(re-export circuitjs1-web-bin)
(re-export citybound-bin)
(re-export claymore-miner-bin)
(re-export clever-tools-bin)
(re-export clibasic-bin)
(re-export clipcc-beta-bin)
(re-export clog-bin)
(re-export clojure-query-bin)
(re-export cloud-hypervisor-bin)
(re-export cloudctl-bin)
(re-export cloudpan189-go-bin)
(re-export cmpl-bin)
(re-export cni-plugins-bin)
(re-export code-insiders-bin)
(re-export codecvisa-bin)
(re-export codedeploy-agent-bin)
(re-export commando-bin)
(re-export conduit-bin)
(re-export consul-template-bin)
(re-export context-lmtx-bin)
(re-export coolvlviewer-experimental-bin)
(re-export corluma-bin)
(re-export cosmonium-bin)
(re-export ttf-nepali-font-git)
(re-export ttf-iansui-git)
(re-export ttf-opposans)
(re-export ttf-proggy-clean)
(re-export otf-auretech)
(re-export ttf-enochian)
(re-export ttf-monofur-powerline-git)
(re-export ttf-optimusprinceps)
(re-export ttf-permanent-marker)
(re-export otf-solbera-dnd-5e-git)
(re-export cpuid2cpuflags)
(re-export nostalgia)
(re-export taffy)
(re-export dmenu-bluetooth)
(re-export tokay)
(re-export gepvm)
(re-export fzf-make)
(re-export pridefetch)
(re-export elfy)
(re-export bi)
(re-export gibo)
(re-export reddit-tui)
(re-export run-one)
(re-export classicladder)
(re-export cleanpkgdir)

;;; recipe-resolver-260424e
(re-export yay-bin)
(re-export teleport-client-bin)
(re-export marmite-bin)
(re-export rtimelog)
(re-export 7zip-docs)

;;; deptree-resolver-260424c
;;; 50 packages resolved via dep-tree priority
;;; All recipes in (gaurix packages deptree-resolver-260424c)

;;; recipe-resolver-260424f
(re-export brave-origin-beta-bin)
(re-export weave-merge)
(re-export powershell-lts-bin)
(re-export kosmos-bin)
(re-export trae-bin)
(re-export motrix-next-bin)
(re-export kavita-bin)
(re-export dota2-minify-bin)
(re-export quien-bin)
(re-export linwood-butterfly-bin)
(re-export pangolin-bin)
(re-export thunderbird-bin)
(re-export vrcft-avalonia-bin)
(re-export legendary-heroic-bin)
(re-export spotify-tui-bin)
(re-export netronome-bin)
(re-export rdr-bin)
(re-export concryptor-bin)
(re-export sniffnet-bin)
(re-export homebox-bin)
(re-export llama-panel-bin)
(re-export marchat-bin)
(re-export yaskkserv2-bin)
(re-export typist-bin)
(re-export tex-fmt-bin)
(re-export timewall-bin)
(re-export zrok2-bin)
(re-export toofan-bin)
(re-export screenix-bin)
(re-export lektra-bin)


;;; deptree-resolver-260424d
(re-export ace)
(re-export aegir-provision)
(re-export beagle-lib)
(re-export boost-python2-libs)
(re-export ca-certificates-cacert)
(re-export ccrtp)
(re-export ccsh-git)
(re-export cling-git)
(re-export coin-or-ipopt)
(re-export dawn)
(re-export fann)
(re-export fishui-git)
(re-export flutter)
(re-export frobby)
(re-export gcc11)
(re-export gcc12)
(re-export glslang-git)
(re-export gnome-icon-theme-symbolic)
(re-export i3lock-color)
(re-export ignition-msgs)
(re-export jameica)
(re-export libclut)
(re-export libcommuni)
(re-export libcprime-git)
(re-export libcutefish-git)
(re-export libcxml)
(re-export libffi6)
(re-export libgda)
(re-export libnetctlgui)
(re-export libqglviewer-qt5)
(re-export libsodium-static)
(re-export llvm19-libs)
(re-export lua-cd)
(re-export lua51-cd)
(re-export lua51-lsqlite3)
(re-export lua52-cd)
(re-export lua53-cd)
(re-export ocamlfuse)
(re-export oorexx)
(re-export osl)
(re-export pam-selinux)
(re-export perl-uuid)
(re-export php56-cli)
(re-export pure-avahi)
(re-export pure-lilv)
(re-export python-arabic-reshaper)
(re-export python-jax)
(re-export python-matrix-nio)
(re-export python-mbstrdecoder)
(re-export python-music-tag)
(re-export python-posix_ipc)
(re-export python-rasterio)
(re-export python-ratelimit)
(re-export python-rosinstall_generator)
(re-export python-sphinxcontrib-httpdomain)
(re-export python-terminaltables3)
(re-export python-token-bucket)
(re-export r-r-oo)
(re-export selinux-python)
(re-export semodule-utils)
(re-export sh-elf-gcc-casio)
(re-export soci)
(re-export steamcmd)
(re-export tpm-tools)
(re-export ttfautohint)
(re-export vapoursynth-plugin-mvsfunc-git)
(re-export wxparaver)
(re-export xbae)
(re-export xcftools)
(re-export xlibre-xserver-common-beta)
(re-export ghdl-mcode-git)
(re-export digitalwatchdog-client)
(re-export ttf-rethink-sans-variable)
(re-export python-pyghdl-git)
(re-export memprocfs)
(re-export librewolf-extension-linkding-bin)
(re-export liberica-nik-23-full-bin)
(re-export fastflix-bin)
(re-export ttf-ume)
(re-export openresty)
(re-export uex)
(re-export brother-dcp1510)
(re-export yuki-iptv-git)
(re-export tor-shadow)
(re-export rambox-pro-bin-blur-me-not)
(re-export nostalgia-git)
(re-export mint-bin)
(re-export lune-bin)
(re-export key-project)
(re-export ferdium-git)
(re-export urlfinder-bin)
(re-export tunnelx-bin)
(re-export tldfinder-bin)
(re-export stompbox-remote-bin)
(re-export stompbox-jack)
(re-export python-yandex-music-api-git)
(re-export owncast-bin)
(re-export notify-bin)
(re-export notepad---bin)
(re-export librewolf-sync)
(re-export libcvec)
(re-export iperf3d)
(re-export firefox-extension-skip-redirect-bin)
(re-export firefox-extension-skip-redirect)
(re-export ethr-bin)
(re-export dooit-extras)
(re-export dooit)
(re-export da-browser-launcher)
(re-export asnmap-bin)
(re-export aix-bin)
(re-export anyk)
(re-export vapoursynth-plugin-wwxd-git)
(re-export node-hp-scan-to)
(re-export libretro-tyrquake-git)
(re-export rbspy-bin)
(re-export proxify-bin)
(re-export libwebm)
(re-export scxvid)
(re-export python-cartogram)
(re-export play)
(re-export mkbrr-git)
(re-export hevi-bin)
(re-export flex-launcher-bin)
(re-export coremark-git)
(re-export filebot)
(re-export serman)
(re-export cronwhip)
(re-export sysmontask)
(re-export sandbox)
(re-export facadefs)
(re-export kanjitomo)
(re-export firewarden)
(re-export quixand)
(re-export tree-game-bin)
(re-export utopia)
(re-export zabbix-agent-lts)
(re-export ttf-gofont-git)
(re-export text-diff-view-bin)
(re-export nodebro)
(re-export infoz-bin)
(re-export gtest-src)
(re-export goscrobble)
(re-export fwupd-openrc)
(re-export fuchsia-cursor)
(re-export fastgron-git)
(re-export extremetuxracer-ukr-lat)
(re-export dut-git)
(re-export dimethoxy-disflux-bin)
(re-export cvemap-bin)
(re-export pyfa)
(re-export ocp-sdl3)
(re-export networkmanager-dispatcher-timesyncd)
(re-export rave-vst)
(re-export python-cmake-bin)
(re-export hyprnav)
(re-export amethyst-player-bin)
(re-export sagemath-git)
(re-export sausage-git)
(re-export leavepad-bin)
(re-export ecapture-bin)
(re-export howdy-beta-git)
(re-export dimethoxy-disflux-git)
(re-export vieb-bin)
(re-export openstack-cli)
(re-export debian-keyring)
(re-export fuse-archive)
(re-export svu-bin)
(re-export foamshot-bin)
(re-export gnome-shell-extension-unite)
(re-export httpie-desktop-bin)
(re-export ttf-impallari-cabin-font)
(re-export mkbold-mkitalic)
(re-export ttf-sudo)
(re-export ttf-pacifico)
(re-export ttf-remixicon)
(re-export ttf-roboto-serif)
(re-export fonts-et-book)
(re-export ttf-aref-ruqaa)
(re-export ttf-martian-mono)
(re-export ttf-reem-kufi)
(re-export otf-hanken-grotesk)
(re-export awesome-themes-git)
(re-export flat-remix-gnome)
(re-export vimix-icon-theme)
(re-export vimix-gtk-themes)
(re-export xcursor-simp1e-zenburn)
(re-export zorin-icon-themes)
(re-export adwaita-plus-git)
(re-export gtk-cyberpunk-neon-theme-git)
(re-export traefik-bin)
(re-export dufs-bin)
(re-export git-town-bin)
(re-export sqlfmt-bin)
(re-export docfd-bin)
(re-export python-demjson3)
(re-export daemon)

;;; recipe-resolver-260424j (25 new recipes)
(re-export figlet-fonts)
(re-export gohufont)
(re-export otf-exljbris)
(re-export toilet-fonts)
(re-export ttf-pizzadude-bullets)
(re-export ttf-mgopen)
(re-export ttf-font-awesome-4)
(re-export otf-font-awesome-4)
(re-export ttf-dejavu-ib)
(re-export ttf-rethink-sans)
(re-export ttf-unifontex-mono)
(re-export otf-aref-ruqaa)
(re-export luv-icon-theme)
(re-export gtk2-theme-dust-extras)
(re-export geany-themes)
(re-export peazip-gtk2-bin)
(re-export pharo-bin)
(re-export gitter-bin)
(re-export python-pyephem)
(re-export python-pywavelets)
(re-export zramswap)
(re-export smcroute)
(re-export poser)
(re-export tlsc)
(re-export ffuf-bin)


;;; recipe-resolver-260424l (85 new recipes)
(re-export ttf-dionicio3-2tile)
(re-export otf-futura-renner)
(re-export ttf-adobe-source-han-sans-tw-variables)
(re-export otf-reem-kufi)
(re-export ttf-adobe-source-han-sans-kr-variables)
(re-export ttf-adobe-source-han-sans-jp-variables)
(re-export ttf-adobe-source-han-sans-hk-variables)
(re-export ttf-adobe-source-han-sans-cn-variables)
(re-export otf-nemoy)
(re-export ttf-michroma)
(re-export ttf-font-icons)
(re-export ttf-symbola-free)
(re-export ttf-lxgw-bright-tc)
(re-export ttf-lxgw-bright-gb)
(re-export ttf-lxgw-bright)
(re-export ttf-biangfont-git)
(re-export ttf-material-design-iconic-font)
(re-export ttf-tabler-icons)
(re-export otf-alusus-mono)
(re-export ttf-moralerspace)
(re-export ttf-suite-variable)
(re-export ttf-suite)
(re-export ttf-suit-variable)
(re-export ttf-suit)
(re-export ttf-ipa-mona)
(re-export spacx-gtk-theme)
(re-export kvantum-theme-qogir-git)
(re-export sddm-theme-corners-git)
(re-export plasma6-themes-vapor-steamos)
(re-export gtk-theme-murrine-collection)
(re-export colloid-nord-gtk-theme-git)
(re-export gruvbox-plus-icon-theme)
(re-export xfwm4-theme-breeze)
(re-export xfdashboard-theme-minimal)
(re-export whitesur-kde-theme)
(re-export refind-theme-regular-git)
(re-export palenight-gtk-theme)
(re-export oceanic-gtk-theme)
(re-export gruvterial-gtk-theme)
(re-export colloid-gtk-theme-git)
(re-export uncover-bin)
(re-export tabby-electron-bin)
(re-export dbrest-bin)
(re-export pe-bear-bin)
(re-export cudatext-gtk2-bin)
(re-export cudatext-qt5-bin)
(re-export gridtracker2-bin)
(re-export rpfm-bin)
(re-export omnisharp-roslyn-bin)
(re-export cope-bin)
(re-export snowflake-cli-bin)
(re-export llamafile-bin)
(re-export anymex-bin)
(re-export frappe-books-bin)
(re-export mobsh-bin)
(re-export maa-assistant-arknights-bin)
(re-export sqruff-bin)
(re-export restack-bin)
(re-export ptags-bin)
(re-export evcc-bin)
(re-export amber-search-bin)
(re-export redis-viewer-bin)
(re-export lichess-local-engine-bin)
(re-export runjs-electron-bin)
(re-export jdk24-graalvm-ce-bin)
(re-export eclipse-php-bin)
(re-export eaglemode-bin)
(re-export rewind-bin)
(re-export pulpo-bin)
(re-export trasher-bin)
(re-export observer)
(re-export plattenalbum)
(re-export cargo-visualize)
(re-export x-cmd)
(re-export quickmedia)
(re-export isd-appimage)
(re-export slimjet)
(re-export eclipse-jee-bin)
(re-export gtklock-dpms-module)
(re-export foxmarks)
(re-export vim-vimwiki)
(re-export miniscript-cli)
(re-export miru-go-bin)
(re-export jumpy-bin)
(re-export vnote-bin)

;;; recipe-resolver-260424n (12 new recipes)
;;; recipe-resolver-260424o (28 new recipes)
;;; otel-tui-bin fend-bin chisel-bin teip-bin mailpit-bin dotter-rs-bin frei-bin
;;; jd-bin wthrr-bin shclrz-bin tssh-bin stegify-bin cookcli-bin flipt-bin
;;; steampipe-bin togo-bin pokego-bin coredns-bin minmon-bin rustdesk-server-bin
;;; olivetin-bin ud ivykis obs-gstreamer ramfetch clay tex-gyre-math-fonts gqrx-udev
(re-export svxlink-sounds-en-us-heather-16k)
(re-export mii-emu)
(re-export ffqueue-git)
(re-export looking-glass-rc)
(re-export looking-glass-rc-host)
(re-export obs-plugin-looking-glass-rc)
(re-export chromium-material-icons-for-github-bin)
(re-export freetype2-macos-browsers-binary-patcher)
(re-export simulide)
(re-export swiftshader-git)
(re-export verinice-bin)
(re-export python-pocketsphinx)

;;; deptree-resolver-260424n
;;; Recipes from (gaurix packages deptree-resolver-260424n)
(re-export grive)
(re-export font-alibaba-puhuiti)
(re-export faba-mono-icons)
(re-export illogical-impulse-oneui4-icons)
(define-public otf-alibaba-puhuiti (package (inherit font-alibaba-puhuiti) (name "otf-alibaba-puhuiti")))
(define-public ttf-alibaba-puhuiti (package (inherit font-alibaba-puhuiti) (name "ttf-alibaba-puhuiti")))
(define-public faba-mono-icons-git (package (inherit faba-mono-icons) (name "faba-mono-icons-git")))
(define-public illogical-impulse-oneui4-icons-git (package (inherit illogical-impulse-oneui4-icons) (name "illogical-impulse-oneui4-icons-git")))

; deptree-resolver-260424u recipes
(re-export better-control)
(re-export d2vsource)
(re-export erwise)
(re-export gtk-theme-config)
(re-export libcanlock-usenet)
(re-export oqs-provider)
(re-export pulseeffects-legacy)
(re-export slrn-canlock)
(re-export slxfig-snapshot)
(re-export vinyl-theme)

; deptree-resolver-260424v recipes
(re-export esp8266-rtos-sdk)
(re-export perl-math-clipper)
(re-export plasma6-applets-panon)
(re-export shadow-selinux)


; recipe-resolver-260424t recipes
(re-export screego-server)
(re-export kinda-bard-bin)
(re-export wavy-bin)
(re-export uptrack)
(re-export ucn)
(re-export tcg)
(re-export tauview-bin)
(re-export pipe-cutter-bin)
(re-export linked-bin)
(re-export freedata-server)
(re-export flac123)
(re-export fetter-bin)
(re-export cproxy-bin)
(re-export morgen-bin)
(re-export termrec)
(re-export appgate-sdp)
(re-export python-elpy)
(re-export catdvi)
(re-export lightproxy-bin)
(re-export aechoterm-bin)
(re-export writedoc)
(re-export whatstron-bin)
(re-export sgfc)
(re-export runeprice)
(re-export py-fetch)
(re-export phomemo-tools-git)
(re-export notedeck-bin)
(re-export lemmeknow-bin)
(re-export image2display-bin)
(re-export flatten-git)
(re-export ecode-bin)
(re-export f5fpc)
(re-export yaml2json)
(re-export aspell-et)
(re-export pipelab-bin)
(re-export hunspell-et)
(re-export ctree)
(re-export cassowary-git)
(re-export bintools)
(re-export appgate-sdp-headless)
(re-export argparser)
(re-export argparser-doc)
(re-export argparser-bash)
(re-export xcftools-git)
(re-export ac-library)
(re-export lan-share-bin)
(re-export commas-bin)
(re-export oki-c321-c331-c531)
(re-export uutils-findutils-bin)
(re-export zinit)
(re-export eparaksts-token-signing)
(re-export proxy-ns)
(re-export activate-linux-toggle)
(re-export geogebra-6-bin)
(re-export dockit-bin)
(re-export tagspaces-bin)
(re-export frei)
(re-export nom)
(re-export lpl)
(re-export bashfuscator-git)
(re-export pfetch-rs-bin)
(re-export tetris-tui-git)
(re-export dry-bin)
(re-export saturnon)
(re-export raise-or-run)
(re-export alist)
(re-export piv-agent)
(re-export ministore)
(re-export zsh-hist-git)
(re-export tockler-bin)
(re-export tess-bin)
(re-export sglauncher-git)

; deptree-resolver-260424w recipes
(re-export dropbox)
(re-export electron23-bin)
(re-export realvnc-rvnc-connect)
(re-export n8n)
(re-export heroku-cli)

; deptree-resolver-260424x recipes
(re-export modrinth-app-appimage)
(re-export wpa-cute)
(re-export chomp)
(re-export folio)
(re-export kwin-effects-sliding-notifications)


; recipe-resolver-260424u recipes
; - elk-shell-bin
; - parallel-disk-usage-bin
; - opencli-rs-bin
; - clc-bin
; - mconf-bin
; - updatecli-bin
; - spacetimedb-bin
; - firefox-extension-linkding-bin
; - tlsx-bin
; - sui-mainnet-bin
; - sui-testnet-bin
; - trackaudio-bin
; - maplemononormal-variable
; - maplemononormal-ttf-autohint
; - maplemononormal-ttf
; - maplemononormal-otf
; - maplemononormal-nf-unhinted
; - maplemononormal-nf-cn-unhinted
; - maplemononormal-nf-cn
; - maplemononormal-nf
; - maplemononormal-cn-unhinted
; - maplemononormal-cn
; - betafpv-configurator
; - hledger-ui-bin
; - gowin-eda-programmer
; - rpk-bin
; - zsh-manpage-completion-generator-bin
; - nordic-darker-standard-buttons-theme
; - kube-burner-bin
; - payload-dumper-go-bin
; - nvidia-force-comp-pipeline
; - bazelisk-bin
; - hubble-bin
; - traitor-bin
; - torpedo-bin
; - elasticvue-bin
; - swc-js-bin
; - owlplug-bin
; - pimpmystremio-bin
; - gotify-cli-bin
; - kdenlive-appimage
; - chessterm
; - goimports-reviser-bin
; - germanium-bin
; - fuzzynote-bin
; - eol-bin
; - chyle-bin
; - bitrise-bin
; - aoruscontrol-bin
; - tut-bin
; - mouse-actions-cli-bin
; - kitchenowl
; - extempore-bin
; - dsk2nib-git
; - pylyzer-bin
; - dirbuster-wordlists
; - donut.c
; - altserver-bin
; - bisc-bin
; - redpanda-connect-bin
; - mangal-bin
; - wonderdraft
; - lowcharts-bin
; - blisp-bin
; - ain-bin
; - dos33fsprogs-git
; - anime4k-git
; - ente-cli-bin
; - sqlean-bin
; - elles-bin
; - kubewall-bin
; - catppuccin-catwalk-bin
; - vcd
; - kernel-modules-hook-hardlinks
; - nom-bin
; - lazycomplete-bin
; - gitin-bin
; - probe-bin
; - yeet-bin
; - remindme-bin
; - pww-bin
; - piknik-bin
; - oxen-server-bin
; - oxen-bin
; - neuralnote-vst3
; - neuralnote-bin
; - bmv-bin
; - belle-cpu
; - catppuccin-gtk-theme-latte
; - vkteams-bin
; - electerm-bin
; - xfetch-bin
; - mautrix-whatsapp-bin
; - exfetch-bin
; - gsh-bin
; - gotz-bin
; - flood-bin
; - etcd-bin

; deptree-resolver-260424y recipes
(re-export wooting-udev)
(re-export lamzu-maya-x-udev)
(re-export udiskie-systemd)
(re-export neoforge-server)
(re-export pixelflasher)

; recipe-resolver-260425b recipes
(re-export fvim-bin)
(re-export intentrace-bin)
(re-export infer-bin)
(re-export ilorest-bin)
(re-export mirrord-bin)
(re-export veloren-bin)
(re-export doot-bin)
(re-export venera-bin)
(re-export yazi-nightly-bin)
(re-export tiny-rdm-bin)
(re-export goneovim-bin)
(re-export anilibria-winmaclinux)
(re-export epub-reader-bin)
(re-export intellij-idea-ue-eap)
(re-export notion-app-enhanced)
(re-export android-sdk-build-tools-34)
(re-export intel-opencl-runtime)
(re-export xhidecursor)
(re-export iprange)
(re-export oggfwd)
(re-export t2sz)
(re-export qxw)
(re-export xswm-git)
(re-export gnome-shell-extension-status-area-horizontal-spacing)
(re-export vlc-materia-skin)
(re-export keybase-bash-completion)
(re-export vim-nushell)
(re-export mpv-quality-menu)
(re-export mpv-sponsorblock)
(re-export firefox-clearurls)
(re-export gnome-shell-extension-tilingshell)
(re-export python-pypuppetdb)
(re-export python-etils)
(re-export python-pyodide-lock)
(re-export battery-notifier)
(re-export nmap-netcat)
(re-export code-nautilus-git)
(re-export wmectrl)
(re-export s-screen)
(re-export lightningcss-cli-bin)
(re-export h5utils-gaurix)
(re-export hyx)
(re-export archisteamfarm-bin)
(re-export xseticon)
(re-export nm-vpngate-git)
(re-export jigdo)
(re-export pgn-extract)
(re-export ovh-ttyrec-git)
(re-export fanctl)
(re-export btrfs-compress)
(re-export steamachievementnotifier-bin)
(re-export secretpixel)
(re-export nuclear-player-bin)
(re-export interstellar-bin)
(re-export illogical-impulse-gtk)
(re-export daylight)
(re-export chromium-dearrow-bin)
(re-export aegisub-arch1t3cht-appimage)
(re-export python-pygltflib)
(re-export certbot-dns-standalone)
(re-export exif-tool)
(re-export perimeter81-bin)
(re-export bwbasic)
(re-export owlink-git)
(re-export python-ctypescrypto)
(re-export gdm-tools)
(re-export voikko-libreoffice)
(re-export gourmand-bin)
(re-export vboxtool)
(re-export nexus-oss-bin)
(re-export rpcemu)
(re-export tal-noisemaker-vst3-bin)
(re-export jdk23-graalvm-ee-bin)
(re-export tilt-bin)
(re-export factorio-headless-bin)
(re-export bleachbit-cli)
(re-export kickshaw)
(re-export optipng-parallel)
(re-export ddpolymerase-bin)
(re-export wl-binclock-bin)
(re-export hypraway-bin)
(re-export openexr-viewer)
(re-export firetools)
(re-export ruby-ruby-vips)
(re-export server-box-bin)
(re-export dagger-bin)
(re-export rip2-bin)
(re-export smtube)
(re-export electrum-personal-server)

(re-export wavey-launcher-git)
(re-export coredns-wgsd-git)
(re-export modu-git)
(re-export kactus2-git)
(re-export telegram-desktop-dev-bin)
(re-export info2man)
(re-export sdtool-git)
(re-export kindletool)
(re-export zenmap-git)
(re-export dida-bin)
(re-export qmplay2-appimage)
(re-export sipgrep)
(re-export fuse-emulator-utils)
(re-export wluma-git)
(re-export thunderbird-dkimverifier)
(re-export luau-git)
(re-export eepm)
(re-export dragonfly-bin)
(re-export crazycat-dvb-firmware)
(re-export veesem)
(re-export vatis-appimage)
(re-export uutils-findutils-git)
(re-export uutils-diffutils-git)
(re-export tdf-git)
(re-export sqlui-native-bin)
(re-export shadowsocks-go)
(re-export retro-fuse-git)
(re-export redisfish-bin)
(re-export redis-gui-bin)
(re-export purrcrypt)
(re-export partfs-git)
(re-export nmap-grab-beacon-config-git)
(re-export nmap-automator-git)
(re-export ida-pro-beta)
(re-export fcitx5-fbterm-git)
(re-export ddflash-git)
(re-export cod-bin)
(re-export borked3ds-appimage)
(re-export another-redis-desktop-manager-bin)
(re-export amneziawg-tools-git)
(re-export bleachbit-git)
(re-export nm-connection-editor-git)
(re-export nessus-agent)
(re-export neatimage)
(re-export ytt)
(re-export tal-vocoder-vst3-bin)
(re-export tal-reverb4-vst3-bin)
(re-export tal-filter2-vst3-bin)
(re-export tal-chorus-lx-vst3-bin)
(re-export python-geohexgrid)
(re-export python-cutlet)
(re-export palemoon-i18n-vi)
(re-export palemoon-i18n-kn)
(re-export palemoon-i18n-hi)
(re-export palemoon-i18n-fa)
(re-export klystrack)
(re-export gnome-shell-extension-awesome-tiles-git)
(re-export gnome-shell-extension-awesome-tiles)
(re-export ferroxide-git)
(re-export goldendict-cc-cedict-content)
(re-export refine-git)
(re-export howdy)
(re-export nvenc)
(re-export rarsm)
(re-export ripme-bin)
(re-export ida-pro)
(re-export thunar-volman-devel)
(re-export fiji-bin)
(re-export zsh-pure-prompt)
(re-export monero-feather-git)
(re-export identme)
(re-export circuit-simulator)
(re-export ghidra-desktop)
(re-export d2x-rebirth-git)
(re-export limo-git)
(re-export thunar-devel)
(re-export neovim-catppuccin)
(re-export remind-me-git)
(re-export pkgfile-git)
(re-export shig-bin)
(re-export atuin-lily-bin)
(re-export hyperledger-fabric-bin)
(re-export gdx-liftoff-bin)
(re-export beet-summarize)
(re-export openpace)
(re-export openfortivpn-webview-bin)
(re-export aviator-git)
(re-export solidigm-sst-storage-tool-cli)
(re-export papis)
(re-export glyph)
(re-export protonutils)
(re-export kosherlinux-git)
(re-export flowkeeper-bin)
(re-export slic3r)
(re-export tilde)
(re-export pluma-plugins)
(re-export lokinet-bin)
(re-export hunspell-eo)
(re-export dpp)
(re-export gbar-git)
(re-export qcm)
(re-export autofdo-git)
(re-export waylogout-git)
(re-export q-zandronum)
(re-export labwc-im-git)
(re-export labwc-im)
(re-export jfetch-git)
(re-export zano-appimage)
(re-export xprinter-cups)
(re-export xelfviewer-bin)
(re-export veesem-git)
(re-export uivonim-bin)
(re-export systune-git)
(re-export supercell-wx-appimage)
(re-export pytubepp-helper)
(re-export pororoca-bin)
(re-export play-emu)
(re-export nostr-relay-tray-bin)
(re-export mdq)
(re-export librewolf-noscript)
(re-export librewolf-extension-reverse-image-search)
(re-export librewolf-extension-foxyproxy)
(re-export librewolf-decentraleyes)
(re-export kjots)
(re-export kidex)
(re-export kde-fcstd-thumbnailer-git)
(re-export intel-ivsc-firmware)
(re-export epubmerge)
(re-export display-switch)
(re-export aya-bin)
(re-export gnome-shell-extension-custom-hot-corners)
(re-export gnome-shell-extension-custom-hot-corners-extended)
(re-export python-pycdlib-git)
(re-export vscode-js-debug-bin)
(re-export picom-pijulius-next-git)
(re-export jerry-cli-git)
(re-export jerry-cli)
(re-export hangar-bin)
(re-export gum-git)
(re-export emv-utils-git)
(re-export clocking-in)
(re-export radeon-profile-git)
(re-export citra-appimage)
(re-export librealsense)
(re-export protonvpn-cli-community-git)
(re-export libaudclient)
(re-export python-wat-git)
(re-export youtube-dl-gui-bin)
(re-export xdg-desktop-portal-phosh-git)
(re-export python-dt-schema)
(re-export cloak-obfuscation)
(re-export dssd)
(re-export unrpa)
(re-export intel-npu-driver-bin)
(re-export wit-git)
(re-export ffcast)
(re-export handlr)
(re-export bat-asus-battery)
(re-export python-mashumaro)
(re-export ascii-rain-git)
(re-export vivify-bin)
(re-export victoriametrics-agent)
(re-export longoverdue)
(re-export python-mov-cli-files)
(re-export radeon-profile-daemon-git)
(re-export i3lock-fancy-rapid-git)
(re-export thunar-extended)
(re-export gearhead2)
(re-export nemo-engrampa)
(re-export playerctld-systemd-unit)
(re-export locale-mul-zz)
(re-export catppuccinifier-bin)
(re-export pipr-bin)
(re-export houdoku-bin)
(re-export qbittorrent-enhanced-nox-bin)
(re-export clipboard-bin)
(re-export semgrep-bin)
(re-export netpad-bin)
(re-export autorestic-bin)
(re-export colorpicker-app-bin)
(re-export skychart-bin)
(re-export websocketd-bin)
(re-export vhs-bin)
(re-export webcatalog-bin)
(re-export rclone-beta-bin)
(re-export memospot-bin)
(re-export hexpick-bin)
(re-export deadbolt-bin)
(re-export combaud-bin)
(re-export kunkun-bin)
(re-export cgpt-bin)
(re-export appimagetool-bin)
(re-export portfolio-performance-bin)
(re-export noseyparker-bin)
(re-export gitify-bin)
(re-export greptimedb-bin)
(re-export namida-bin)
(re-export mmv-go-bin)
(re-export librewolf-extension-plasma-integration-bin)
(re-export fillin-bin)
(re-export diffcatcher-bin)
(re-export codemux-bin)
(re-export balena-etcher-bin)
(re-export jextract-bin)
(re-export k6-studio-bin)
(re-export go-hass-agent-bin)
(re-export mapcidr-bin)
(re-export nteract-bin)
(re-export n-m3u8dl-re-bin)
(re-export sui-bin)
(re-export android-knot-bin)
(re-export dagtoc-bin)
(re-export realesrgan-ncnn-vulkan-bin)
(re-export rash-bin)
(re-export rstudio-server-bin)
(re-export ssa-bin)
(re-export amdguid-wayland-bin)
(re-export teamide-bin)
(re-export pshash-bin)
(re-export slic3r-bin)
(re-export describe-commit-bin)
(re-export caesium-image-compressor-bin)
(re-export netron-bin)
(re-export winegui-bin)
(re-export distroav-bin)
(re-export epyrus-bin)
(re-export yt-bin)
(re-export buckets-bin)
(re-export calendar-bin)
(re-export lvce-bin)
(re-export transformerlab-bin)
(re-export cassette-bin)
(re-export buildcache-bin)
(re-export 86box-manager-bin)
(re-export teleport-bin)
(re-export whalebird-bin)
(re-export ipfs-desktop-bin)
(re-export iortcw-bin)
(re-export apple-music-bin)
(re-export d0phamine-music-player-bin)
(re-export shijima-qt-bin)
(re-export yank-note-bin)
(re-export hyper-bin)
(re-export inputplumber-bin)
(re-export trufflehog-bin)
(re-export nvrs-bin)
(re-export note-gen-bin)
(re-export gex-bin)
(re-export delta-walker-bin)
(re-export jqp-bin)
(re-export musicat-bin)
(re-export arnis-bin)
(re-export iceshrimp-net-bin)
(re-export meowpad-configurator-v2-bin)
(re-export cinc-workstation-bin)
(re-export inform7-ide-bin)
(re-export androidscreencast-bin)
(re-export universal-gcode-sender-bin)
(re-export mullvad-vpn-beta-bin)
(re-export stremio-web-desktop-bin)
(re-export mpdris-bin)
(re-export gameclock-bin)
(re-export jqsh-bin)
(re-export openrocket-beta-bin)
(re-export secondlife-bin)
(re-export lantern-bin)
(re-export heaven-studio-nightly-bin)
(re-export powder-toy-jacob1-bin)
(re-export chia-bin)
(re-export wolai-appimage)
(re-export pico-8)


;;; recipe-resolver-260425i
(use-modules (gaurix packages recipe-resolver-260425i))
(re-export brother-dcp7057)
(re-export lemminx)
(re-export drand-http-relay)
(re-export android-sdk-build-tools-35)
(re-export cassandra)
(re-export scriptisto)
(re-export gwe)
(re-export flexget-webui)
(re-export macbook-12-1-linux-fixes)
(re-export alterware-launcher-git)
(re-export symbiyosys-git)
(re-export mkdocs-material-pymdownx-extras)
(re-export gtk3-classic-xfce)
(re-export android-studio-beta)
(re-export openscad-lsp)
(re-export protondb-cli)
(re-export qmp3gain-git)
(re-export nodejs-vls)
(re-export plasma6-wallpapers-blurredwallpaper)
(re-export bananaplus)
(re-export lib32-lzo)
(re-export python-rembg)
(re-export python3-colorsysplus)
(re-export ultrastardx-songs)
(re-export xorgxrdp-glamor)
(re-export cyberghostvpn)
(re-export smoothie-rs-linux-git)
(re-export apfsprogs-git)
(re-export gnome-shell-extension-rounded-window-corners-reborn)
(re-export icinga2)
(re-export vattery)
(re-export mikmod)
(re-export uxplay-git)
(re-export php-oci8)
(re-export notepad---git)
(re-export shader-slang-git)
(re-export rtl8812au-aircrack-ng-dkms-git)
(re-export lan-mouse-git)
(re-export sticky-notes)
(re-export go-ascii-tool-git)
(re-export vatsim-crc)
(re-export snx)
(re-export kicad-nightly)
(re-export mcskinedit)
(re-export xwinwrap-git)
(re-export muc-git)
(re-export gnome-kra-ora-thumbnailer-git)
(re-export cinelerra-gg)
(re-export zaman)
(re-export xborder-git)
(re-export matplotplusplus)
(re-export aget)
(re-export tetris)
(re-export polybar-now-playing-git)
(re-export libfprint-elanmoc2-working-git)
(re-export doxide)
(re-export vufind)
(re-export unshell)
(re-export snmalloc)
(re-export ruby-asciidoctor-diagram-batik)
(re-export qregedit-git)
(re-export python-safehttpx)
(re-export ptt-fix)
(re-export porymap)
(re-export popcornfx-editor)
(re-export petalinux)
(re-export newm-next-git)
(re-export nemo-webp-git)
(re-export mtp)
(re-export metamorphose2-python3-git)
(re-export memsed-git)
(re-export lb-planner-git)
(re-export keyring-cli)
(re-export k8s-ldap-auth)
(re-export hfd-git)
(re-export gosign)
(re-export fluidx3d)
(re-export debounce)
(re-export baibot-git)
(re-export asciiconv)
(re-export yetris)
(re-export nfancurve)
(re-export xontrib-vox-git)
(re-export woz2dsk)
(re-export tile-world2)
(re-export python-pydantic-graph)
(re-export python-groq)
(re-export passport)
(re-export krunner-watch-git)
(re-export hostsd)
(re-export cadius)
(re-export baibot)
(re-export gaiasky)
(re-export python-click-extra)
(re-export py-cidr)
(re-export meep-python)
(re-export browser-on-ram-git)
(re-export pamac-gtk3)
(re-export kri)
(re-export nftables-geoip-db)


;;; recipe-resolver-260425m
(use-modules (gaurix packages recipe-resolver-260425m))
(re-export keepassxc-wordlist-german-better)
(re-export sillytavern-git)
(re-export rudder-agent)
(re-export python-rapidyaml)
(re-export an)
(re-export meow-nvim)
(re-export ytdl-sub)
(re-export i3gocks)
(re-export ocp)
(re-export hellwal)
(re-export savedesktop)
(re-export video-downloader)
(re-export totp-cli)
(re-export python-memory-graph)
(re-export dcpomatic)
(re-export infnoise-openssl-git)
(re-export lua52-lsqlite3)
(re-export lua-lsqlite3)
(re-export ch343ser-git)
(re-export kontur-plugin)
(re-export nanobench)
(re-export poengsum)
(re-export unflac)
(re-export salt)
(re-export sway-input-config)
(re-export kmymoney-git)
(re-export jorge-git)
(re-export krep)
(re-export amarena-gtk-theme)
(re-export py-nvfan)
(re-export qgnomeplatform-qt5)
(re-export perl-cookie-baker)
(re-export uudeck)
(re-export multipartus-downloader)
(re-export playback-appimage)
(re-export d2rloader-git)
(re-export d2rloader)
(re-export ritchie-cli)
(re-export einstein-emulator)
(re-export decman)
(re-export pyprland)
(re-export ghostty-x86_64-v3-git)
(re-export projectm-sdl2-git)
(re-export idle)
(re-export qucs-git)
(re-export ecal-app)
(re-export ecal)
(re-export cyrus-imapd)
(re-export ngs-lang-git)
(re-export superslicer-prerelease)
(re-export cockatrice-client-git)
(re-export superslicer)
(re-export betula-git)
(re-export slc-cli)
(re-export jdownloader2-jre)
(re-export alexandrie-pg)
(re-export rustdesk-git)
(re-export klogg-bin-git)
(re-export obmenu-generator)
(re-export eternalterminal-server)
(re-export eternalterminal-client)
(re-export triplea)
(re-export rcl)
(re-export offline-page-downloader)
(re-export protoc-gen-psrpc)
(re-export masscanned-git)
(re-export deepl-linux-electron)
(re-export mdk3)
(re-export xcursor-simp1e-tokyo-night-storm)
(re-export xcursor-simp1e-tokyo-night-light)
(re-export xcursor-simp1e-tokyo-night)
(re-export xcursor-simp1e-solarized-light)
(re-export xcursor-simp1e-solarized-dark)
(re-export xcursor-simp1e-rose-pine-moon)
(re-export xcursor-simp1e-rose-pine-dawn)
(re-export xcursor-simp1e-rose-pine)
(re-export xcursor-simp1e-nord-light)
(re-export xcursor-simp1e-nord-dark)
(re-export xcursor-simp1e-mix-light)
(re-export xcursor-simp1e-mix-dark)
(re-export xcursor-simp1e-gruvbox-light)
(re-export xcursor-simp1e-gruvbox-dark)
(re-export xcursor-simp1e-dark)
(re-export xcursor-simp1e-catpuccin-mocha)
(re-export xcursor-simp1e-catpuccin-macchiato)
(re-export xcursor-simp1e-catpuccin-latte)
(re-export xcursor-simp1e-catpuccin-frappe)
(re-export xcursor-simp1e-breeze-dark)
(re-export xcursor-simp1e-breeze)
(re-export xcursor-simp1e-adw-dark)
(re-export xcursor-simp1e-adw)
(re-export xcursor-simp1e)
(re-export tal-noisemaker-vst-bin)
(re-export tal-noisemaker-clap-bin)
(re-export pipman-git)
(re-export adwaita-cursors-git)
(re-export python-commitizen)
(re-export smemstat)
(re-export gnome-shell-extension-freon)
(re-export figma-linux)

(re-export su-exec)
(re-export suck)
(re-export svfs)
(re-export swaycwd)
(re-export swfmill)
(re-export symboleditor)
(re-export synthclone)
(re-export sysrss)
(re-export systester-cli-bin)
(re-export t-rec)
(re-export t2n)
(re-export taarich)
(re-export tab-rs)
(re-export tailor-hwcaps)
(re-export tailscaledesktop)
(re-export talon-bin)
(re-export tangerine-icon-theme)
(re-export tapecalc)
(re-export taschenrechner)
(re-export task-maker-rust)
(re-export tcping-go-bin)
(re-export teal)
(re-export lua53-tl)
(re-export tecnoballz)
(re-export teg)
(re-export templ-bin)
(re-export tera-cli)
(re-export termpub)
(re-export terraform-lsp)
(re-export terraform11)
(re-export tetronimia)
(re-export tex-match)
(re-export texel)
(re-export therion)
(re-export think)
(re-export threelayout)
(re-export ticemu)
(re-export tightvnc-jviewer)
(re-export timer-rs)
(re-export timerdown)
(re-export timetrace-bin)
(re-export tiny-dnn)
(re-export todd)
(re-export toluol)
(re-export tony)
(re-export topal)
(re-export tpasm)
(re-export treefetch)
(re-export trello-cli)
(re-export trenta-icons)
(re-export try)
(re-export tsnake)
(re-export tty-copy)
(re-export tuc)
(re-export tuimoji)
(re-export tumbler-folder-thumbnailer)
(re-export tut-mastodon)
(re-export tuxtrain)
(re-export tv)
(re-export twitch-dl-bin)
(re-export txdx)
(re-export typioca)
(re-export u3d)
(re-export uarmsolver)
(re-export uclibc-ng)
(re-export udp-over-tcp)
(re-export ultralist)
(re-export umleditor)
(re-export unfs3)
(re-export unifetch)
(re-export uniread)
(re-export univga)
(re-export unsilence)
(re-export urw-classico)
(re-export usbmon)
(re-export uvg266)
(re-export vdmfec)
(re-export vegastrike)
(re-export venom)
(re-export verdaccio)
(re-export verifpal)
(re-export vfu)
(re-export victoriametrics-bin)
(re-export vidmerger-bin)
(re-export vido)
(re-export viper-bin)
(re-export vpkedit-bin)
(re-export wait4x)
(re-export waon)
(re-export war1gus)
(re-export waybackurls)
(re-export wch-isp)
(re-export webchanges)
(re-export weborf)
(re-export webtrees)
(re-export wgsl-analyzer-bin)
(re-export wifi-password)
(re-export wiliwili)
(re-export windowchef)
(re-export windowlab)
(re-export ansible-docs-git)
(re-export antimicrox-git)
(re-export aria2-config-script)
(re-export arkenfox-hook-git)
(re-export avirusnamedtom-hib)
(re-export bittriprunner-hib)
(re-export blheli-configurator-bin)
(re-export blockmap-git)
(re-export boardmix-uos)
(re-export brother-hll2350dw)
(re-export caja-dropbox)
(re-export cchat-gtk-git)
(re-export cinnamon-doc)
(re-export comlink)
(re-export compiler-rt19)
(re-export conmon-git)
(re-export console-tdm-git)
(re-export coolreader3-git)
(re-export dbacl)
(re-export deepin-wine-cntv-cbox)
(re-export devrantron)
(re-export digital-assets)
(re-export discwrapper)
(re-export drumrox)
(re-export eclipse-texlipse)
(re-export element-desktop-blur-me-not)
(re-export elm-format-0-17-bin)
(re-export excite-cli)
(re-export fireurl)
(re-export fityk-git)
(re-export foobar2000-component-uie-typefind-bin)
(re-export fortune-mod-it)
(re-export ftl-sdk)
(re-export git-now-git)
(re-export git-treeflow-bin)
(re-export gpufetch-git)
(re-export gtkmagnetic)
(re-export hideit-sh-git)
(re-export homed-automation)
(re-export inkscape-generate-palette)
(re-export intercal)
(re-export jriver-media-center24)
(re-export keyplusd-git)
(re-export kim-api)
(re-export kodi-addon-stream)
(re-export latex-enumitem)
(re-export lemonbar-clicks-git)
(re-export libewf-git)
(re-export liri-text-git)
(re-export litra-autotoggle)
(re-export lout-dejavu-git)
(re-export lua51-unix)
(re-export mapcrafter-git)
(re-export mbrola-voices-it2)
(re-export multiwinia)
(re-export munt-qt)
(re-export myget)
(re-export nemo-qml-plugin-dbus)
(re-export ontake-himitsu-git)
(re-export openrazer-meta-git)
(re-export otf-manjari)
(re-export pass-sshaskpass-git)
(re-export passed-git)
(re-export perl-filehandle-unget)
(re-export pict-rs)
(re-export prowlarr-develop)
(re-export pyromaths)
(re-export python-distribution)
(re-export qscrabble3d)
(re-export qtvkbd)
(re-export quake3-defrag-maps)
(re-export qytdl)
(re-export r-fpc)
(re-export r-scatterplot3d)
(re-export reg)
(re-export rhythmbox-tray-icon-git)
(re-export scale2x)
(re-export sentrum-bin)
(re-export sonar-scanner)
(re-export stanc)
(re-export sunvox-1-x)
(re-export sync-worktrees)
(re-export tass64)
(re-export tesseract-data-bos-git)
(re-export thinkpad-p14s)
(re-export torch7-cutorch-git)
(re-export totp)
(re-export trackballs)
(re-export ueyed)
(re-export vacuum-im)
(re-export vim-everforest-git)
(re-export vim-tabular-git)
(re-export vscode-codicons-git)
(re-export vundle-git)
(re-export world-of-goo-2)
(re-export wwwoffle-svn)
(re-export xininfo-git)
(re-export xoscope)
(re-export yadifa)
(re-export zork3)

;; --- deptree-resolver-260426g re-exports ---
(define-public librewolf-extension-ublock-origin-bin*
  (@@ (gaurix packages deptree-resolver-260426g) librewolf-extension-ublock-origin-bin))
(define-public vivaldi-autoinject-custom-js-ui*
  (@@ (gaurix packages deptree-resolver-260426g) vivaldi-autoinject-custom-js-ui))


;; --- recipe-resolver-260426h re-exports ---
(re-export ocaml-atdts)
(re-export ocaml-atds)
(re-export ocaml-atdpy)
(re-export ocaml-atdj)
(re-export ocaml-atdgen-runtime)
(re-export ocaml-atdgen-codec-runtime)
(re-export ocaml-atdgen)
(re-export xdg-terminal-exec-mkhl)
(re-export python-electrum-aionostr)
(re-export goimports-reviser-git)
(re-export pdfannots-git)
(re-export mathicsscript)
(re-export python-ctrader-openapi)
(re-export python-django-channels-redis)
(re-export python-django-channels)
(re-export 4kstogram)
(re-export qbittorrent-enhanced-nox)
(re-export python-ble-serial)
(re-export geckodriver-git)
(re-export python-requests-pkcs12)
(re-export python-pypdfium2)
(re-export python-pypcap)
(re-export python-msgraph-core)
(re-export python-msal-extensions)
(re-export python-livekit-plugins-upliftai)
(re-export python-livekit-plugins-ultravox)
(re-export python-livekit-plugins-turn-detector)
(re-export python-livekit-plugins-tavus)
(re-export python-livekit-plugins-spitch)
(re-export python-livekit-plugins-speechmatics)
(re-export python-livekit-plugins-speechify)
(re-export python-livekit-plugins-soniox)
(re-export python-livekit-plugins-smallestai)
(re-export python-livekit-plugins-simli)
(re-export python-livekit-plugins-silero)
(re-export python-livekit-plugins-sarvam)
(re-export python-livekit-plugins-rtzr)
(re-export python-livekit-plugins-rime)
(re-export python-livekit-plugins-resemble)
(re-export python-livekit-plugins-openai)
(re-export python-livekit-plugins-nvidia)
(re-export python-livekit-plugins-nltk)
(re-export python-livekit-plugins-neuphonic)
(re-export python-livekit-plugins-mistralai)
(re-export python-livekit-plugins-minimax)
(re-export python-livekit-plugins-minimal)
(re-export python-livekit-plugins-lmnt)
(re-export python-livekit-plugins-langchain)
(re-export python-livekit-plugins-inworld)
(re-export python-livekit-plugins-hume)
(re-export python-livekit-plugins-hedra)
(re-export python-livekit-plugins-groq)
(re-export python-livekit-plugins-gradium)
(re-export python-livekit-plugins-google)
(re-export python-livekit-plugins-gladia)
(re-export python-livekit-plugins-fishaudio)
(re-export python-livekit-plugins-fireworksai)
(re-export python-livekit-plugins-fal)
(re-export python-livekit-plugins-elevenlabs)
(re-export python-livekit-plugins-deepgram)
(re-export python-livekit-plugins-clova)
(re-export python-livekit-plugins-cartesia)
(re-export python-livekit-plugins-bithuman)
(re-export python-livekit-plugins-bey)
(re-export python-livekit-plugins-baseten)
(re-export python-livekit-plugins-azure)
(re-export python-livekit-plugins-aws)
(re-export python-livekit-plugins-avatartalk)
(re-export python-livekit-plugins-assemblyai)
(re-export python-livekit-plugins-anthropic)
(re-export python-livekit-plugins-anam)
(re-export python-livekit-api)
(re-export python-livekit-agents)
(re-export python-home-assistant-hacs)
(re-export python-ctfcli)
(re-export python-azure-identity)
(re-export numbat-git)
(re-export ffmulticonverter)
(re-export cmake-lint)
(re-export python-segno)
(re-export python-topojson)
(re-export python-simplification)
(re-export python-pyht)
(re-export python-pandana)
(re-export python-geoalchemy2)
(re-export python-togglcli)
(re-export python-json-repair)
(re-export python-east-asian-spacing)
(re-export python-bflb-mcu-tool)
(re-export python-bflb-iot-tool)
(re-export python-torf)
(re-export python-prometheus-fastapi-instrumentator)
(re-export python-opentype-feature-freezer)
(re-export python-matplotlib-scalebar)
(re-export python-pyshark)
(re-export ssh-audit-git)
(re-export deepl-linux-electron-git)
(re-export among-sus-git)
(re-export syncthingtray-git)
(re-export picocrypt-git)
