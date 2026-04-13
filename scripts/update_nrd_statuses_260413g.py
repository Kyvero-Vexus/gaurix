#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260413g pass."""
import re

TODO_FILE = "todo_general_packages.org"

# Recipes created (15) - mark as DONE
recipes = {
    4170: ("rustrover-eap", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (rustrover-eap v2026.1, JetBrains Rust IDE binary, proprietary)"),
    4112: ("microsoft-edge-beta-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (microsoft-edge-beta-bin v147.0.3912.26, MS Edge .deb binary, proprietary)"),
    4160: ("svt-jpeg-xs", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (svt-jpeg-xs v0.9.0, JPEG XS codec library, BSD-2)"),
    4159: ("vlc-pause-click-plugin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (vlc-pause-click-plugin v2.2.0, VLC mouse-click pause plugin, LGPL-2.1)"),
    4134: ("rewaita", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (rewaita v1.1.1, Adwaita icon theme variant, GPL-3.0)"),
    4072: ("lianwall-gui-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (lianwall-gui-bin v1.4.2, firewall GUI binary, MIT)"),
    4158: ("proton-ge-custom-rtsp-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (proton-ge-custom-rtsp-bin GE-Proton10-33-rtsp22, Proton RTSP binary, BSD-3)"),
    4130: ("crossover-overlay-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (crossover-overlay-bin v3.4.1, crosshair overlay AppImage, CC-BY-SA-4.0)"),
    4098: ("cato-client-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (cato-client-bin v5.5.0.2620, Cato VPN binary, proprietary)"),
    4163: ("kstart", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (kstart v4.3, Kerberos kinit daemon, ISC)"),
    4084: ("lidm-git", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (lidm-git v1.2.3, TUI display manager, GPL-3.0)"),
    4152: ("xsane-gimp-git", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (xsane-gimp, XSane GIMP plugin variant, GPL-2.0)"),
    3765: ("gtkhash-thunar", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (gtkhash-thunar v1.5, GtkHash with Thunar plugin, GPL-2.0)"),
    4073: ("brother-hl2030", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (brother-hl2030 v2.0.1, Brother printer driver binary, proprietary)"),
    4120: ("curseforge", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413g.scm (curseforge-bin v1.300.0, CurseForge mod manager binary, proprietary)"),
}

# Blocked with specific reasons (15) - mark as BLOCKED with detailed reasons
blocked = {
    4150: ("makepkg-optimize-mold", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; ARCH_SPECIFIC: pacman/makepkg mold linker integration, no utility on Guix"),
    4155: ("aura-bin", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; ARCH_SPECIFIC: AUR helper requiring pacman/libalpm, no utility on Guix"),
    4117: ("zectl-pacman-hook", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; ARCH_SPECIFIC: pacman hook for ZFS boot environments, depends on pacman infrastructure"),
    4162: ("syca", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; ARCH_SPECIFIC: sudo replacement tied to pacman/makepkg/Arch keyring ecosystem"),
    4083: ("guiman", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; ARCH_SPECIFIC + TAURI_BUILD: Tauri-based Arch Linux package manager (needs dual Rust+Node build chain)"),
    4099: ("shiori-reader", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; MISSING_SOURCE: GitHub repo meowcat767/Shiori returns 404, project deleted or made private"),
    4079: ("ids-ips-tool", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; NO_RELEASE: messy repo with committed __pycache__/dist, no releases, heavy ML deps (scikit-learn, numpy), requires root"),
    4118: ("nicol", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; MISSING_GUIX_DEPS: Qt6 WebEngine browser requiring Qt >= 6.8 WebEngine (not available in Guix)"),
    4149: ("airwindows-consolidated-git", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; MISSING_GUIX_DEPS: VCV Rack plugin requiring VCV Rack SDK (not in Guix), git submodules"),
    4122: ("rtw89-dkms-git", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; DKMS_INCOMPATIBLE: kernel module for Realtek Wi-Fi 6/7, DKMS incompatible with Guix kernel model"),
    4114: ("obs-advanced-scene-switcher", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; MISSING_GUIX_DEPS: OBS Studio plugin, OBS Studio not packaged in Guix"),
    4110: ("kwin-effects-better-blur-dx-git", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; MISSING_GUIX_DEPS: KWin effect plugin requiring KDE Plasma 6 (not in Guix)"),
    4147: ("apparmor.d-git", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; DISTRO_SPECIFIC: AppArmor profile set for systemd/Debian/Arch distros, not applicable to Guix System"),
    4125: ("invoiceninja", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; WEB_SERVICE: Laravel PHP web application requiring PHP/Composer/MySQL, not a desktop package"),
    4076: ("semantic-diff", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413g; MISSING_GUIX_DEPS: AI-powered diff tool requiring anthropic Python package + API key at runtime"),
}

with open(TODO_FILE, "r") as f:
    content = f.read()

# Process recipes - update status and TODO Status
for item_num, (pkg_name, status_line) in recipes.items():
    # Find the entry header pattern
    pattern = rf"(\*\* (?:BLOCKED|DONE|FAILED) {item_num}\. {re.escape(pkg_name)})"

    # Change header to DONE
    content = re.sub(
        rf"\*\* (?:BLOCKED|FAILED) {item_num}\. {re.escape(pkg_name)}",
        f"** DONE {item_num}. {pkg_name}",
        content
    )

    # Find the last line of the entry and add the new status
    # Look for the pattern: the entry for this item number
    entry_pattern = rf"(\*\* (?:DONE|BLOCKED|FAILED) {item_num}\. {re.escape(pkg_name)}.*?)(\n\*\* |\n\* |\Z)"
    match = re.search(entry_pattern, content, re.DOTALL)
    if match:
        entry_text = match.group(1)
        following = match.group(2)

        # Add new status line and update TODO Status
        new_status = f"\n   - Status: {status_line}\n   - TODO Status: DONE"
        updated_entry = entry_text + new_status
        content = content[:match.start()] + updated_entry + following + content[match.end():]

# Process blocked items - add specific reason
for item_num, (pkg_name, status_line) in blocked.items():
    entry_pattern = rf"(\*\* (?:DONE|BLOCKED|FAILED) {item_num}\. {re.escape(pkg_name)}.*?)(\n\*\* |\n\* |\Z)"
    match = re.search(entry_pattern, content, re.DOTALL)
    if match:
        entry_text = match.group(1)
        following = match.group(2)
        new_status = f"\n   - Status: {status_line}"
        updated_entry = entry_text + new_status
        content = content[:match.start()] + updated_entry + following + content[match.end():]

with open(TODO_FILE, "w") as f:
    f.write(content)

print(f"Updated {len(recipes)} recipes to DONE")
print(f"Updated {len(blocked)} items with block reasons")
print(f"Total: {len(recipes) + len(blocked)} items processed")
