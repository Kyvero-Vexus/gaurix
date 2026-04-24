#!/usr/bin/env python3
"""
Dependency-tree resolver pass: deptree-resolver-260424x

Target: up to 100 BLOCKED packages, prioritized by dependency-tree order.

1. Extract all BLOCKED packages from todo_general_packages.org
2. Build dependency tree using AUR cache
3. Compute priority metrics (blocked_dep_count, reverse_dep_count, total_dep_count)
4. Sort and select top 100
5. Generate tree artifacts (JSON + MD reports)
6. Output selection with AUR enrichment
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

PASS_ID = "deptree-resolver-260424x"
ORG_FILE = Path("todo_general_packages.org")
AUR_CACHE = Path("data/aur-cache/packages-meta-ext-v1.json")
TREE_JSON = Path("reports/blocked-dependency-tree.json")
TREE_MD = Path("reports/blocked-dependency-tree.md")
SELECTION_JSON = Path(f"reports/{PASS_ID}-selection.json")
AUR_LOOKUP_JSON = Path(f"reports/{PASS_ID}-aur-lookup.json")
SUMMARY_JSON = Path(f"reports/{PASS_ID}-summary.json")

# Known Guix system packages that don't need packaging
GUIX_SYSTEM_PKGS = {
    "glibc", "gcc", "make", "cmake", "meson", "ninja", "pkg-config",
    "python", "python3", "perl", "ruby", "rust", "go", "nodejs",
    "bash", "coreutils", "findutils", "grep", "sed", "gawk", "tar",
    "gzip", "bzip2", "xz", "zstd", "lz4",
    "openssl", "curl", "wget", "git",
    "zlib", "libpng", "libjpeg-turbo", "libwebp", "libtiff",
    "freetype2", "fontconfig", "harfbuzz", "pango", "cairo",
    "glib2", "glib", "gtk3", "gtk4", "qt5-base", "qt6-base",
    "sdl2", "sdl2_image", "sdl2_mixer", "sdl2_ttf",
    "mesa", "libgl", "libglvnd", "vulkan-icd-loader", "vulkan-headers",
    "wayland", "wayland-protocols", "libxkbcommon",
    "libx11", "libxcb", "libxext", "libxfixes", "libxi", "libxinerama",
    "libxrandr", "libxrender", "libxcursor", "libxcomposite", "libxdamage",
    "libxtst", "libxss", "libxxf86vm",
    "dbus", "systemd", "udev", "eudev",
    "alsa-lib", "pulseaudio", "pipewire",
    "ffmpeg", "gstreamer", "gst-plugins-base", "gst-plugins-good",
    "sqlite", "postgresql-libs", "mariadb-libs",
    "boost", "abseil-cpp", "protobuf", "grpc",
    "libuv", "libev", "libevent",
    "json-c", "jansson", "rapidjson",
    "libffi", "pcre", "pcre2", "icu",
    "expat", "libxml2", "libxslt",
    "libusb", "hidapi",
    "linux-headers", "linux-api-headers",
    "fuse2", "fuse3",
    "libarchive", "libzip",
    "nettle", "gnutls", "nss", "nspr",
    "libnl", "libpcap", "iproute2", "iptables",
    "samba", "krb5",
    "cups", "ghostscript",
    "texlive-core", "texlive-bin",
    "java-runtime", "jdk", "jre",
    "electron", "electron29", "electron30", "electron31", "electron32", "electron33",
    "dotnet-runtime", "dotnet-sdk", "aspnet-runtime",
    "mono", "nuget",
    "npm", "yarn",
    "cargo", "rustup",
    "go", "golang",
    "lua", "luajit",
    "tcl", "tk",
    "imagemagick", "graphviz",
    "doxygen", "extra-cmake-modules",
    "flex", "bison", "autoconf", "automake", "libtool", "m4",
    "nasm", "yasm",
    "clang", "llvm", "lld",
    "flatpak", "appstream",
}


def parse_blocked_with_reasons(org_path):
    """Parse BLOCKED packages and extract their blocking reasons from the org file."""
    blocked = {}
    pattern = re.compile(r'^\*\* BLOCKED\s+(\d+)\.\s+(\S+)')
    status_pattern = re.compile(r'^\s+- Status:\s+BLOCKED:\s+(\S+)')

    with open(org_path, 'r') as f:
        lines = f.readlines()

    i = 0
    while i < len(lines):
        m = pattern.match(lines[i])
        if m:
            number, name = int(m.group(1)), m.group(2)
            if name not in blocked:
                fail_reason = None
                j = i + 1
                while j < len(lines) and j < i + 20:
                    if lines[j].startswith("** "):
                        break
                    sm = status_pattern.match(lines[j])
                    if sm:
                        fail_reason = sm.group(1)
                    j += 1
                blocked[name] = {
                    'status': 'BLOCKED',
                    'number': number,
                    'line': i + 1,
                    'fail_reason': fail_reason,
                }
        i += 1
    return blocked


def load_aur_cache(cache_path):
    """Load AUR cache and build name->package lookup."""
    with open(cache_path, 'r') as f:
        packages = json.load(f)
    return {p['Name']: p for p in packages}


def normalize_dep(dep_str):
    """Strip version constraints from dependency string."""
    return re.split(r'[><=:]', dep_str)[0].strip()


def build_dependency_tree(blocked, aur_lookup):
    """Build dependency tree for all BLOCKED packages."""
    blocked_names = set(blocked.keys())

    pkg_data = {}
    for name in blocked_names:
        aur_info = aur_lookup.get(name)
        if aur_info:
            raw_deps = aur_info.get('Depends', []) or []
            raw_make_deps = aur_info.get('MakeDepends', []) or []
            all_deps = set()
            for d in raw_deps + raw_make_deps:
                norm = normalize_dep(d)
                all_deps.add(norm)
            blocked_deps = [d for d in all_deps if d in blocked_names and d != name]
            total_deps = len(all_deps)
        else:
            blocked_deps = []
            total_deps = 0

        pkg_data[name] = {
            'blocked_deps': sorted(blocked_deps),
            'blocked_dep_count': len(blocked_deps),
            'total_dep_count': total_deps,
            'reverse_deps': [],
            'reverse_dep_count': 0,
            'in_aur': name in aur_lookup,
        }

    # Compute reverse deps
    for name, data in pkg_data.items():
        for dep in data['blocked_deps']:
            if dep in pkg_data:
                pkg_data[dep]['reverse_deps'].append(name)

    for name, data in pkg_data.items():
        data['reverse_deps'] = sorted(data['reverse_deps'])
        data['reverse_dep_count'] = len(data['reverse_deps'])

    return pkg_data


def priority_sort(pkg_data, blocked):
    """Sort packages by priority."""
    items = []
    for name, data in pkg_data.items():
        items.append({
            'name': name,
            'number': blocked[name]['number'],
            'blocked_dep_count': data['blocked_dep_count'],
            'reverse_dep_count': data['reverse_dep_count'],
            'total_dep_count': data['total_dep_count'],
            'blocked_deps': data['blocked_deps'],
            'reverse_deps': data['reverse_deps'],
            'in_aur': data['in_aur'],
            'fail_reason': blocked[name].get('fail_reason'),
        })

    items.sort(key=lambda x: (
        x['blocked_dep_count'],
        -x['reverse_dep_count'],
        x['total_dep_count'],
        x['name'],
    ))

    for i, item in enumerate(items, 1):
        item['rank'] = i

    return items


def generate_tree_json(queue, pass_id, selected_count):
    return {
        'timestamp': datetime.now(timezone.utc).isoformat(),
        'run_id': pass_id,
        'total_blocked': len(queue),
        'selected_count': selected_count,
        'queue': queue,
    }


def generate_tree_md(tree_data):
    lines = []
    lines.append("# Blocked Dependency Tree Report")
    lines.append("")
    lines.append(f"Generated: {tree_data['timestamp']}")
    lines.append(f"Pass: {tree_data['run_id']}")
    lines.append(f"Selected: {tree_data['selected_count']}")
    lines.append("")
    lines.append("## Summary")
    lines.append("")

    queue = tree_data['queue']
    total = len(queue)
    in_aur = sum(1 for x in queue if x['in_aur'])
    not_in_aur = total - in_aur
    zero_blocked = sum(1 for x in queue if x['blocked_dep_count'] == 0)

    lines.append(f"- Total blocked: {total}")
    lines.append(f"- In AUR cache: {in_aur}")
    lines.append(f"- Not in cache: {not_in_aur}")
    lines.append(f"- Zero blocked deps: {zero_blocked}")
    lines.append("")

    reasons = {}
    for item in queue:
        r = item.get('fail_reason') or 'null'
        reasons[r] = reasons.get(r, 0) + 1
    lines.append("## Blocking Reasons")
    lines.append("")
    for reason, count in sorted(reasons.items(), key=lambda x: -x[1]):
        lines.append(f"- {reason}: {count}")
    lines.append("")

    lines.append("## Priority Queue (Top 200)")
    lines.append("")
    lines.append("| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |")
    lines.append("|------|---|---------|-------------|-------------|-----------|--------|-------------|")

    for item in queue[:200]:
        lines.append(
            f"| {item['rank']} | {item['number']} | {item['name']} | "
            f"{item['blocked_dep_count']} | {item['reverse_dep_count']} | "
            f"{item['total_dep_count']} | {'Yes' if item['in_aur'] else 'No'} | "
            f"{item.get('fail_reason') or '-'} |"
        )

    lines.append("")
    lines.append("## Full Queue")
    lines.append("")
    lines.append("| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |")
    lines.append("|------|---|---------|-------------|-------------|-----------|--------|-------------|")

    for item in queue[:2000]:
        lines.append(
            f"| {item['rank']} | {item['number']} | {item['name']} | "
            f"{item['blocked_dep_count']} | {item['reverse_dep_count']} | "
            f"{item['total_dep_count']} | {'Yes' if item['in_aur'] else 'No'} | "
            f"{item.get('fail_reason') or '-'} |"
        )

    if len(queue) > 2000:
        lines.append("")
        lines.append(f"*... {len(queue) - 2000} more entries not shown*")

    return '\n'.join(lines) + '\n'


def generate_selection(queue, aur_lookup, count=100):
    selected = []
    for item in queue[:count]:
        entry = dict(item)
        aur_info = aur_lookup.get(item['name'], {})
        entry['version'] = aur_info.get('Version', '')
        entry['description'] = aur_info.get('Description', '')
        entry['url'] = aur_info.get('URL', '')
        entry['license'] = aur_info.get('License', [])
        entry['depends'] = aur_info.get('Depends', [])
        entry['makedepends'] = aur_info.get('MakeDepends', [])
        entry['provides'] = aur_info.get('Provides', [])
        entry['urlpath'] = aur_info.get('URLPath', '')
        selected.append(entry)
    return selected


def generate_aur_lookup(selected, aur_lookup):
    lookup = {}
    for item in selected:
        name = item['name']
        aur_info = aur_lookup.get(name)
        if aur_info:
            lookup[name] = aur_info
    return lookup


def main():
    print(f"=== Dependency Tree Resolver: {PASS_ID} ===")
    print()

    print("Step 1: Parsing todo_general_packages.org for BLOCKED packages...")
    blocked = parse_blocked_with_reasons(ORG_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print("Step 2: Loading AUR cache...")
    aur_lookup = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_lookup)} AUR packages")

    print("Step 3: Building dependency tree...")
    pkg_data = build_dependency_tree(blocked, aur_lookup)
    print(f"  Built tree for {len(pkg_data)} packages")

    print("Step 4: Computing priority sort...")
    queue = priority_sort(pkg_data, blocked)
    print(f"  Sorted {len(queue)} packages")

    select_count = min(100, len(queue))
    print(f"Step 5: Generating tree artifacts...")
    tree_data = generate_tree_json(queue, PASS_ID, select_count)

    with open(TREE_JSON, 'w') as f:
        json.dump(tree_data, f, indent=2)
    print(f"  Wrote {TREE_JSON}")

    tree_md = generate_tree_md(tree_data)
    with open(TREE_MD, 'w') as f:
        f.write(tree_md)
    print(f"  Wrote {TREE_MD}")

    print(f"Step 6: Selecting top {select_count} packages...")
    selected = generate_selection(queue, aur_lookup, select_count)

    selection_data = {
        'timestamp': tree_data['timestamp'],
        'pass_id': PASS_ID,
        'count': len(selected),
        'packages': selected,
    }
    with open(SELECTION_JSON, 'w') as f:
        json.dump(selection_data, f, indent=2)
    print(f"  Wrote {SELECTION_JSON}")

    aur_data = generate_aur_lookup(selected, aur_lookup)
    with open(AUR_LOOKUP_JSON, 'w') as f:
        json.dump(aur_data, f, indent=2)
    print(f"  Wrote {AUR_LOOKUP_JSON}")

    # Summary
    summary = {
        'timestamp': tree_data['timestamp'],
        'pass_id': PASS_ID,
        'total_blocked': len(blocked),
        'selected_count': len(selected),
        'zero_blocked_deps': sum(1 for s in selected if s['blocked_dep_count'] == 0),
        'in_aur': sum(1 for s in selected if s['in_aur']),
        'fail_reasons': {},
    }
    for s in selected:
        r = s.get('fail_reason') or 'null'
        summary['fail_reasons'][r] = summary['fail_reasons'].get(r, 0) + 1
    with open(SUMMARY_JSON, 'w') as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_JSON}")

    # Print top 20
    print()
    print("=== Top 20 Priority Queue ===")
    print(f"{'Rank':>4} {'#':>6} {'Package':<45} {'BlkD':>4} {'RevD':>4} {'TotD':>4} {'AUR':>3} {'Reason'}")
    print("-" * 100)
    for item in queue[:20]:
        print(f"{item['rank']:>4} {item['number']:>6} {item['name']:<45} "
              f"{item['blocked_dep_count']:>4} {item['reverse_dep_count']:>4} "
              f"{item['total_dep_count']:>4} {'Y' if item['in_aur'] else 'N':>3} "
              f"{item.get('fail_reason') or '-'}")

    print()
    print(f"=== {select_count} Selected Packages ===")
    for item in selected:
        print(f"  {item['rank']:>3}. {item['name']} (v{item['version']}, "
              f"blk={item['blocked_dep_count']}, rev={item['reverse_dep_count']}, "
              f"reason={item.get('fail_reason') or '-'})")

    print()
    zero_blk = sum(1 for s in selected if s['blocked_dep_count'] == 0)
    in_aur = sum(1 for s in selected if s['in_aur'])
    print(f"Selected: {len(selected)} packages")
    print(f"  Zero blocked deps: {zero_blk}")
    print(f"  In AUR cache: {in_aur}")
    print(f"  Not in AUR: {len(selected) - in_aur}")

    reasons = {}
    for s in selected:
        r = s.get('fail_reason') or 'null'
        reasons[r] = reasons.get(r, 0) + 1
    print("  Fail reasons:")
    for reason, count in sorted(reasons.items(), key=lambda x: -x[1]):
        print(f"    {reason}: {count}")

    return selected


if __name__ == '__main__':
    selected = main()
