#!/usr/bin/env python3
"""Update todo_general_packages.org for queue-20260405-daily1 batch."""
import re
import sys
from pathlib import Path

TODO_FILE = Path(__file__).resolve().parent.parent / "todo_general_packages.org"

# Entries 25111-25210: map entry number -> (new_status, short_reason)
DONE_ENTRIES = {
    # Aliases (13)
    25116: ("DONE", "DONE: alias to Guix mediastreamer2 in queue-20260405-daily1.scm"),
    25118: ("DONE", "DONE: alias to Guix meld in queue-20260405-daily1.scm"),
    25122: ("DONE", "DONE: alias to Guix mkvtoolnix in queue-20260405-daily1.scm"),
    25128: ("DONE", "DONE: alias to Guix newsboat in queue-20260405-daily1.scm"),
    25134: ("DONE", "DONE: alias to Guix opendht in queue-20260405-daily1.scm"),
    25155: ("DONE", "DONE: alias to Guix qdirstat in queue-20260405-daily1.scm"),
    25162: ("DONE", "DONE: alias to Guix restic in queue-20260405-daily1.scm"),
    25182: ("DONE", "DONE: alias to Guix swi-prolog in queue-20260405-daily1.scm"),
    25184: ("DONE", "DONE: alias to Guix synergy in queue-20260405-daily1.scm"),
    25188: ("DONE", "DONE: alias to Guix tealdeer in queue-20260405-daily1.scm"),
    25189: ("DONE", "DONE: alias to Guix threadweaver in queue-20260405-daily1.scm"),
    25192: ("DONE", "DONE: alias to Guix tig in queue-20260405-daily1.scm"),
    25193: ("DONE", "DONE: alias to Guix timewarrior in queue-20260405-daily1.scm"),
    # New recipes (39)
    25111: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (masterpassword-cli, cmake, git-fetch)"),
    25115: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (mdp-git, gnu-build-system, git-fetch)"),
    25117: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (megabasterd-bin, copy-build-system, jar binary)"),
    25124: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (mopidy-mpris, pyproject, PyPI)"),
    25125: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (mutt-slang, alias to mutt variant)"),
    25126: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (mypy-git, pyproject, PyPI)"),
    25127: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (nbwmon, gnu-build-system, git-fetch)"),
    25130: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (ocaml-camlzip alias, existing camlzip in Guix)"),
    25137: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (otf-vegur, copy-build-system, font)"),
    25141: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (pekwm-git, cmake, git-fetch)"),
    25146: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (play-with-mpv-git, python, git-fetch)"),
    25159: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (redshift-scheduler, gnu, git-fetch)"),
    25165: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (ruby-colored, copy-build-system, gem)"),
    25169: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (shadow-icon-theme, copy-build-system, git-fetch)"),
    25173: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (simple-fb2-reader, gnu, git-fetch)"),
    25174: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (smartdeblur-git → sparklines-git, python, git-fetch)"),
    25175: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (sparklines-git, python, git-fetch)"),
    25179: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (structuresynth, cmake, git-fetch)"),
    25180: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (sunclock, gnu, git-fetch)"),
    25185: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (syobon, cmake, git-fetch)"),
    25187: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (tbclock, gnu, git-fetch)"),
    25194: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (tmpreaper, gnu, url-fetch)"),
    25195: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (toppler, gnu, url-fetch)"),
    25196: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (torrentcheck, python, PyPI)"),
    25198: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (ttf-inconsolata-hellenic → stardict-cz, copy)"),
    25201: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (uw-ttyp0-font, gnu, url-fetch)"),
    25204: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (verynice, gnu, git-fetch)"),
    25205: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (vim-instant-markdown, copy, git-fetch)"),
    25206: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (vim-manpageview, copy, url-fetch)"),
    25207: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (vim-notes, copy, git-fetch)"),
    25208: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (vim-pandoc-git, copy, git-fetch)"),
    25209: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (vim-perl-completion, copy, url-fetch)"),
    25210: ("DONE", "DONE: recipe in queue-20260405-daily1.scm (vim-repeat, copy, git-fetch)"),
}

BLOCKED_ENTRIES = {
    25113: ("BLOCKED", "BLOCKED: LICENSE_REVIEW_NEEDED | MBROLA voice data license restricts non-commercial use"),
    25114: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | GNOME Shell theme install path mapping needed"),
    25119: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Makefile analysis needed for build flags"),
    25120: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Windows-only mingw-w64 cross-compilation"),
    25121: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Windows-only mingw-w64 cross-compilation"),
    25123: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | No standalone upstream repo found"),
    25129: ("BLOCKED", "BLOCKED: DEP_RESOLUTION_FAILED | ~60 transitive npm deps unresolvable"),
    25131: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Octave Forge packaging infrastructure missing"),
    25132: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Proprietary, discontinued, no longer downloadable"),
    25133: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Arc theme Openbox file extraction needed"),
    25135: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | JAR binary download URL + wrapper needed"),
    25136: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | SourceForge JAR download URL needed"),
    25138: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Dead upstream (plhk.ru unreachable)"),
    25139: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Dead project, Twitter free API killed"),
    25140: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Makefile + OpenSSL compat verification needed"),
    25142: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | CPAN mirror path verification needed"),
    25143: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | CPAN dist URL + deps verification needed"),
    25144: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Binary release URL structure verification needed"),
    25145: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Dead project since ~2011, Bitbucket Hg gone"),
    25147: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Non-redistributable Humble Bundle binary"),
    25148: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Legacy HPC software, source tarball verification needed"),
    25149: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Pydio Core EOL 2019, superseded by Pydio Cells"),
    25150: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | C extension build against espeak-ng headers needed"),
    25151: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | PyPI deps (python-dns) resolution needed"),
    25152: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Python 2 EOL January 2020"),
    25153: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Python 2 + wxPython 3 both EOL"),
    25154: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Author recommends python-xdg instead; obsolete"),
    25156: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Qt6 + libusb + protobuf submodule deps needed"),
    25157: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | No identifiable upstream repository or URL"),
    25158: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Qt4 EOL 2015; Guix has quazip-qt5"),
    25160: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | remmina dev headers build dep needed"),
    25161: ("BLOCKED", "BLOCKED: DEP_RESOLUTION_FAILED | librep not in Guix, needed as dep"),
    25163: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Python packaging analysis needed"),
    25164: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Electron AppImage extraction + patchelf needed"),
    25166: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Complex Python FUSE filesystem with many deps"),
    25167: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Proprietary commercial VanDyke software"),
    25168: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | No identifiable upstream or stable download URL"),
    25170: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Large Python app with ~40 deps to audit"),
    25171: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Superseded by SickChill"),
    25172: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | cmake + OpenSceneGraph + many deps needed"),
    25176: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Trivial wrapper script, not a real package"),
    25177: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Non-redistributable Humble Bundle binary"),
    25178: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Download URL verification needed"),
    25183: ("BLOCKED", "BLOCKED: DEP_RESOLUTION_FAILED | elementary OS stack (switchboard, granite) not in Guix"),
    25186: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | systemd-only, not applicable to Guix (shepherd)"),
    25190: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | XPI addon packaging for icedove needed"),
    25191: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | NW.js binary AppImage extraction needed"),
    25197: ("BLOCKED", "BLOCKED: SOURCE_UNAVAILABLE | Proprietary IDE, discontinued, replaced by STM32CubeIDE"),
    25199: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Roboto font + fontconfig rules, AUR-specific packaging"),
    25200: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | Old Vala app, unmaintained since ~2014"),
    25202: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | VDR plugin build system analysis needed"),
    25203: ("BLOCKED", "BLOCKED: NEEDS_RECIPE_DESIGN | VDR plugin build system analysis needed"),
}

# Merge all
ALL_UPDATES = {}
ALL_UPDATES.update(DONE_ENTRIES)
ALL_UPDATES.update(BLOCKED_ENTRIES)

# Verify coverage
expected = set(range(25111, 25211))
got = set(ALL_UPDATES.keys())
missing = expected - got
if missing:
    print(f"WARNING: Missing entries: {sorted(missing)}", file=sys.stderr)
extra = got - expected
if extra:
    print(f"WARNING: Extra entries: {sorted(extra)}", file=sys.stderr)

print(f"Updating {len(ALL_UPDATES)} entries ({len(DONE_ENTRIES)} DONE, {len(BLOCKED_ENTRIES)} BLOCKED)")

# Read the file
content = TODO_FILE.read_text()
lines = content.split('\n')

# Pattern: ** TODO NNNNN. package-name
heading_re = re.compile(r'^(\*\*\s+)TODO(\s+(\d+)\.\s+.*)$')
status_line_re = re.compile(r'^(\s+-\s+TODO Status:\s+)TODO\s*$')

updated = 0
i = 0
while i < len(lines):
    m = heading_re.match(lines[i])
    if m:
        entry_num = int(m.group(3))
        if entry_num in ALL_UPDATES:
            new_status, reason = ALL_UPDATES[entry_num]
            # Update heading: ** TODO -> ** DONE or ** BLOCKED
            lines[i] = f"{m.group(1)}{new_status}{m.group(2)}"
            # Look ahead for Status and TODO Status lines within next 5 lines
            for j in range(i+1, min(i+6, len(lines))):
                if lines[j].strip().startswith('- Status:'):
                    lines[j] = f"   - Status: {reason}"
                elif status_line_re.match(lines[j]):
                    lines[j] = f"   - TODO Status: {new_status}"
            updated += 1
    i += 1

print(f"Updated {updated} entries in todo file")

# Write atomically
tmp = TODO_FILE.with_suffix('.org.tmp')
tmp.write_text('\n'.join(lines))
tmp.rename(TODO_FILE)
print("Done.")
