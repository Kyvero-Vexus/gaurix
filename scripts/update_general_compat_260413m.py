#!/usr/bin/env python3
"""Update general-compat.scm: replace recipe-resolver-260413m compat aliases with correct ones."""

import shutil, tempfile, os

COMPAT_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages/general-compat.scm"

# Compat aliases for -bin packages (non-bin alias inherits from bin package)
BIN_ALIASES = [
    ("tetro-tui", "tetro-tui-bin"),
    ("sing-box", "sing-box-bin"),
    ("qui", "qui-bin"),
    ("dwproton", "dwproton-bin"),
    ("czkawka-gui", "czkawka-gui-bin"),
    ("min-browser", "min-browser-bin"),
    ("cinny-desktop", "cinny-desktop-bin"),
    ("modrinth-app", "modrinth-app-bin"),
    ("modiva-launcher", "modiva-launcher-bin"),
    ("futhark", "futhark-bin"),
    ("crystal-dock", "crystal-dock-bin"),
    ("universal-android-debloater", "universal-android-debloater-bin"),
    ("shgit", "shgit-bin"),
    ("goose-desktop", "goose-desktop-bin"),
    ("pear-desktop", "pear-desktop-bin"),
    ("vdhcoapp", "vdhcoapp-bin"),
    ("quarto-cli", "quarto-cli-bin"),
    ("pacseek", "pacseek-bin"),
    ("ckan", "ckan-bin"),
    ("rstudio-desktop", "rstudio-desktop-bin"),
    ("xenia-edge", "xenia-edge-bin"),
    ("powerline-go", "powerline-go-bin"),
    ("teams-for-linux", "teams-for-linux-bin"),
    ("forkgram", "forkgram-bin"),
    ("azahar", "azahar-appimage-wayland"),
    ("breitbandmessung", "breitbandmessung-bin"),
    ("sniptext-bin", "sniptext"),  # reverse: source is the base
    ("marp", "marp-cli"),
]

# Compat aliases for -git packages (non-git alias inherits)
# Only where no conflict with a separate non-git package
GIT_ALIASES = [
    ("xfce-winxp-tc", "xfce-winxp-tc-git"),
    ("libwintc", "libwintc-git"),
    ("zenmonitor3", "zenmonitor3-git"),
    ("twintaillauncher", "twintaillauncher-git"),
    ("chatterino2", "chatterino2-git"),
    ("ironbar", "ironbar-git"),
    ("httpdirfs", "httpdirfs-git"),
    ("adwaita-qt5", "adwaita-qt5-git"),
    # Note: ashell-git skipped (conflicts with separate ashell package)
    # Note: tooi-git, xrizer-git, xrizer-common-git kept as-is
]

def main():
    with open(COMPAT_FILE, "r") as f:
        lines = f.readlines()

    # Find the old compat alias section for recipe-resolver-260413m
    start_idx = None
    for i, line in enumerate(lines):
        if "; --- recipe-resolver-260413m compat aliases ---" in line:
            start_idx = i
            break

    if start_idx is None:
        # If no existing section, append at end
        start_idx = len(lines)
        end_idx = start_idx
    else:
        # Find end of section: next section marker or EOF
        end_idx = start_idx + 1
        while end_idx < len(lines):
            stripped = lines[end_idx].strip()
            if stripped.startswith("; ---") and "260413m" not in stripped:
                break
            if stripped == "" and end_idx + 1 < len(lines) and lines[end_idx + 1].strip().startswith("; ---"):
                break
            end_idx += 1

    # Build new compat lines
    new_lines = []
    new_lines.append("\n; --- recipe-resolver-260413m compat aliases ---\n")
    for alias, parent in BIN_ALIASES:
        new_lines.append(f'(define-public {alias} (package (inherit {parent}) (name "{alias}")))\n')
    for alias, parent in GIT_ALIASES:
        new_lines.append(f'(define-public {alias} (package (inherit {parent}) (name "{alias}")))\n')

    # Replace
    result_lines = lines[:start_idx] + new_lines + lines[end_idx:]

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE))
    try:
        with os.fdopen(fd, "w") as tmp:
            tmp.writelines(result_lines)
        shutil.move(tmp_path, COMPAT_FILE)
        print(f"Updated {COMPAT_FILE}: {len(BIN_ALIASES)} bin aliases + {len(GIT_ALIASES)} git aliases")
    except:
        os.unlink(tmp_path)
        raise

if __name__ == "__main__":
    main()
