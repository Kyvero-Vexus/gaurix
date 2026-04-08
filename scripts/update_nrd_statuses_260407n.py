#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for recipe-resolver-260407n pass.
Appends DONE status lines to NEEDS_RECIPE_DESIGN entries for resolved packages.

Strategy: find header lines like "** BLOCKED/DONE NNNN. pkg-name", then look
at subsequent lines for NEEDS_RECIPE_DESIGN status and append a DONE status
line after it.  Also flip BLOCKED headers to DONE and update TODO Status lines.
"""
import re
import shutil

ORG_FILE = "todo_general_packages.org"

# Mapping: package-name → (version, description for status line)
RESOLVED = {
    "torrserver-bin": ("141", "TorrServer binary, Go torrent-to-HTTP streamer, GPL-3.0"),
    "ov-bin": ("0.51.1", "ov terminal pager binary, Go, MIT"),
    "tgcp-bin": ("1.0.3", "tgcp GCP resource viewer binary, Rust, MIT"),
    "tredis-bin": ("1.2.0", "tredis Redis TUI binary, Rust, MIT"),
    "rjq-bin": ("0.1.13", "rjq JSON filter binary, Rust, MIT"),
    "superdb-bin": ("0.3.0", "super analytics DB binary, Go, BSD-3"),
    "pomo-bin": ("1.0.5", "pomo Pomodoro timer binary, Go, MIT"),
    "sq-bin": ("0.50.0", "sq data wrangler binary, Go, MIT"),
    "plenti-bin": ("0.7.25", "plenti SSG binary, Go, Apache-2.0"),
    "code-minimap-bin": ("0.6.8", "code-minimap renderer binary, Rust, MIT/Apache-2.0"),
    "terraformer-bin": ("0.8.24", "terraformer IaC import binary, Go, Apache-2.0"),
    "kubeshark-bin": ("52.3.62", "kubeshark K8s traffic analyzer binary, Go, Apache-2.0"),
    "git-brunch-bin": ("1.8.0", "git-brunch branch TUI binary, Haskell, BSD-3"),
    "memtui-bin": ("0.0.6", "memtui Memcached TUI binary, Go, MIT"),
    "goplaying-bin": ("0.3.6", "goplaying now-playing TUI binary, Go, MIT"),
    "lazyactions-bin": ("0.0.13", "lazyactions GitHub Actions TUI binary, Go, MIT"),
    "mmdr-bin": ("0.2.1", "mmdr Mermaid renderer binary, Rust, MIT"),
    "goful-bin": ("1.0.0", "goful file manager binary, Go, MIT"),
    "tsql-bin": ("0.5.0", "tsql PostgreSQL TUI binary, Rust, MIT"),
    "go-prism-bin": ("1.3.0", "go-prism test output formatter binary, Go, MIT"),
    "r-quick-share-bin": ("0.11.5", "rquickshare Quick Share .deb binary, Rust/Tauri, GPL-3.0"),
    "stash-bin": ("0.31.0", "stash media organizer binary, Go, AGPL-3.0"),
    "crush-bin": ("0.55.1", "crush AI terminal assistant binary, Go, MIT"),
    "mongodb-tools-bin": ("100.13.0", "mongodb-tools .deb binary bundle, Go, Apache-2.0"),
    "open-tv-bin": ("1.9.1", "open-tv IPTV app .deb binary, Tauri/Rust, GPL-2.0"),
    "querycat-bin": ("0.17.3", "querycat SQL query tool binary, .NET, MIT"),
    "mods-bin": ("1.8.1", "mods AI CLI binary, Go, MIT"),
    "zvm-bin": ("0.8.14", "zvm Zig version manager binary, Go, MIT"),
    "kyanos-bin": ("1.5.0", "kyanos network analyzer binary, Go/eBPF, Apache-2.0"),
    "crab-bin": ("1.4.4", "crab URL crawler binary, Go, MIT"),
}

MODULE = "recipe-resolver-260407n"


def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Phase 1: Track which package each line belongs to (from headers)
    current_pkg = None
    pkg_for_line = [None] * len(lines)

    for i, line in enumerate(lines):
        header_match = re.match(r'^\*\* (?:BLOCKED|DONE|FAILED) \d+\. (.+)$', line)
        if header_match:
            pkg_name = header_match.group(1).strip()
            if pkg_name in RESOLVED:
                current_pkg = pkg_name
            else:
                current_pkg = None
        elif line.startswith("** "):
            current_pkg = None
        pkg_for_line[i] = current_pkg

    # Phase 2: Insert DONE status lines after NEEDS_RECIPE_DESIGN lines
    new_lines = []
    changes = 0
    resolved_set = set()

    for i, line in enumerate(lines):
        new_lines.append(line)

        pkg = pkg_for_line[i]
        if pkg and pkg not in resolved_set:
            if "NEEDS_RECIPE_DESIGN" in line and "DONE" not in line:
                version, desc = RESOLVED[pkg]
                done_line = (
                    f"   - Status: DONE: recipe in {MODULE}.scm "
                    f"({pkg} v{version}, {desc})\n"
                )
                new_lines.append(done_line)
                resolved_set.add(pkg)
                changes += 1

    # Phase 3: Flip BLOCKED headers to DONE and update TODO Status lines
    final_lines = []
    for i, line in enumerate(new_lines):
        # Flip BLOCKED headers to DONE for resolved packages
        header_match = re.match(r'^(\*\* )BLOCKED( \d+\. )(.+)$', line)
        if header_match:
            pkg_in_header = header_match.group(3).strip()
            if pkg_in_header in resolved_set:
                line = f"{header_match.group(1)}DONE{header_match.group(2)}{pkg_in_header}\n"

        # Update TODO Status lines for resolved packages
        if "TODO Status: BLOCKED" in line or "TODO Status: TODO" in line:
            # Check if previous lines (up to 10) have our DONE status
            lookback = new_lines[max(0, i - 10):i]
            for lb in lookback:
                if f"recipe in {MODULE}" in lb:
                    line = line.replace("TODO Status: BLOCKED", "TODO Status: DONE")
                    line = line.replace("TODO Status: TODO", "TODO Status: DONE")
                    break

        final_lines.append(line)

    # Write atomically
    tmp_file = ORG_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(final_lines)
    shutil.move(tmp_file, ORG_FILE)

    print(f"Updated {changes} NEEDS_RECIPE_DESIGN entries with DONE status.")
    print(f"Resolved packages: {', '.join(sorted(resolved_set))}")
    unresolved = set(RESOLVED.keys()) - resolved_set
    if unresolved:
        print(f"NOT found in org file: {', '.join(sorted(unresolved))}")


if __name__ == "__main__":
    main()
