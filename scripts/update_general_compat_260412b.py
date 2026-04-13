#!/usr/bin/env python3
"""Deterministic update of general-compat.scm for recipe-resolver-260412b/c.

Adds:
  - Module imports for recipe-resolver-260412b and recipe-resolver-260412c
  - Compat aliases for binary packages (e.g., waterfox -> waterfox-bin-pkg)
"""
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

with open(COMPAT_FILE, 'r') as f:
    content = f.read()

# 1. Add module imports
new_imports = [
    "  #:use-module (gaurix packages recipe-resolver-260412b)",
    "  #:use-module (gaurix packages recipe-resolver-260412c)",
]

for imp in new_imports:
    mod_name = imp.strip().replace("#:use-module ", "").strip()
    if mod_name not in content:
        # Insert after the last existing #:use-module line before #:export
        # Find last #:use-module
        lines = content.split('\n')
        insert_idx = 0
        for i, line in enumerate(lines):
            if '#:use-module' in line:
                insert_idx = i + 1
        lines.insert(insert_idx, imp)
        content = '\n'.join(lines)
        print(f"  Added import: {mod_name}")
    else:
        print(f"  Import already exists: {mod_name}")

# 2. Add compat aliases (AUR name -> Guix package)
# Format: (compat_name, inherit_from)
compat_aliases = [
    # recipe-resolver-260412b
    ("waterfox-bin", "waterfox-bin-pkg"),
    ("windsurf", "windsurf-bin"),
    ("offpunk-git", "offpunk"),
    ("brscan5", "brscan5-bin"),
    ("megasync", "megasync-bin"),
    ("jdtls", "jdtls-bin"),
    ("irpf2025", "irpf2025-bin"),
    # recipe-resolver-260412c
    ("woff2-material-symbols-variable", "font-material-symbols-variable"),
    ("microsoft-identity-broker", "microsoft-identity-broker-bin"),
    ("hyprshutdown-compat", "hyprshutdown"),
    ("bitwig-studio", "bitwig-studio-bin"),
    ("notion-app-electron", "notion-app-bin"),
    ("nettui", "nettui-bin"),
    ("opentubex", "opentubex-bin"),
    ("ani2xcursor", "ani2xcursor-bin"),
    ("crtui", "crtui-bin"),
    ("mdterm", "mdterm-bin"),
    ("btdu", "btdu-bin"),
    ("openide", "openide-bin"),
    ("tsenta-desktop", "tsenta-desktop-bin"),
    ("bookokrat", "bookokrat-bin"),
    ("terraria-server", "terraria-server-bin"),
    ("intune-portal", "intune-portal-bin"),
    ("reiserfsprogs", "reiserfsprogs-pkg"),
]

# Add compat alias section
alias_lines = [
    "",
    "; --- recipe-resolver-260412b/c compat aliases ---",
]
added = 0
for compat_name, inherit_from in compat_aliases:
    # Check if alias already exists
    alias_def = f'(define-public {compat_name}'
    if alias_def in content:
        print(f"  Compat alias '{compat_name}' already exists, skipping")
        continue
    alias_lines.append(
        f'(define-public {compat_name} (package (inherit {inherit_from}) (name "{compat_name}")))'
    )
    added += 1

if added > 0:
    content = content.rstrip() + '\n' + '\n'.join(alias_lines) + '\n'

# 3. Add #:export entries
# Find the #:export block and add new exports
export_names = [name for name, _ in compat_aliases]
# Also export the direct package names from recipes
recipe_exports = [
    "waterfox-bin-pkg", "windsurf-bin", "offpunk", "brscan5-bin",
    "megasync-bin", "google-cloud-cli-bq", "google-cloud-cli-gsutil",
    "google-cloud-cli-python3", "gke-gcloud-auth-plugin", "ironwail",
    "jdtls-bin", "irpf2025-bin", "xdg-su",
    "font-material-symbols-variable", "microsoft-identity-broker-bin",
    "wps-office-mui-zh-cn", "hyprshutdown", "bitwig-studio-bin",
    "vmware-keymaps", "reiserfsprogs-pkg", "notion-app-bin",
    "nettui-bin", "opentubex-bin", "ani2xcursor-bin", "crtui-bin",
    "mdterm-bin", "btdu-bin", "openide-bin", "tsenta-desktop-bin",
    "bookokrat-bin", "terraria-server-bin", "intune-portal-bin",
]
all_exports = export_names + recipe_exports

# Find existing #:export section
if '#:export (' in content:
    # Find the closing paren of the export list
    export_start = content.index('#:export (')
    # Find the matching close paren
    depth = 0
    export_end = export_start
    for i in range(export_start, len(content)):
        if content[i] == '(':
            depth += 1
        elif content[i] == ')':
            depth -= 1
            if depth == 0:
                export_end = i
                break

    existing_exports = content[export_start:export_end]
    new_export_entries = []
    for name in all_exports:
        if name not in existing_exports:
            new_export_entries.append(f"            {name}")

    if new_export_entries:
        insert_text = '\n'.join(new_export_entries) + '\n'
        content = content[:export_end] + '\n' + insert_text + content[export_end:]
        print(f"  Added {len(new_export_entries)} export entries")

# Write atomically
tmp = COMPAT_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.write(content)
shutil.move(tmp, COMPAT_FILE)
print(f"Updated {COMPAT_FILE}")
print(f"  Added {added} compat aliases")
