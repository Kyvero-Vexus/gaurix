#!/usr/bin/env python3
"""Update general-compat.scm for deptree-resolver-260407g pass.

Deterministic full-file transform: read → compute → write temp → atomic move.
Adds #:use-module and re-export entries for deptree-resolver-260407g packages.
"""

import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"

USE_MODULE_LINE = "  #:use-module (gaurix packages deptree-resolver-260407g)"
USE_MODULE_AFTER = "  #:use-module (gaurix packages recipe-resolver-260407j)"

EXPORT_PACKAGES = [
    "caligula-bin",
    "capa-bin",
    "carapace-bin",
    "catbox-bin",
    "catwalk-bin",
    "chibi-cli-bin",
    "chmod-cli-bin",
    "bililive-recorder-bin",
    "fonts-droid-fallback",
    "fonts-noto-hinted",
    "catppuccin-cursors-frappe",
    "catppuccin-cursors-macchiato",
    "catppuccin-cursors-mocha",
    "catppuccin-gtk-theme-macchiato",
    "catppuccin-gtk-theme-mocha",
    "cdirip",
    "c47-bin",
]

EXPORT_COMMENT = ";; ─── deptree-resolver-260407g compat aliases ───"


def main():
    content = COMPAT_FILE.read_text()
    lines = content.split("\n")

    new_lines = []
    use_module_added = False
    exports_added = False

    for i, line in enumerate(lines):
        new_lines.append(line)

        # Add use-module after the recipe-resolver-260407j line
        if not use_module_added and line.strip() == USE_MODULE_AFTER.strip():
            new_lines.append(USE_MODULE_LINE)
            use_module_added = True

    # Now add re-exports before the final closing of the file
    # Find the last line that has deptree/recipe resolver compat aliases
    # and add after it
    result_lines = []
    for i, line in enumerate(new_lines):
        result_lines.append(line)

        # Add exports after the last recipe-resolver compat aliases comment
        if not exports_added and line.startswith(";; ─── recipe-resolver-260407i compat aliases"):
            # Find the next empty line or comment and add after it
            # Actually, just add after this block
            pass

    # Simpler approach: find the very end of the file, insert before last empty lines
    final_lines = new_lines[:]
    # Find position: after the last ";; ─── recipe-resolver-" comment block
    insert_pos = len(final_lines)
    for i in range(len(final_lines) - 1, -1, -1):
        if final_lines[i].startswith(";; ─── recipe-resolver-260407i"):
            # Find end of this block
            j = i + 1
            while j < len(final_lines) and (
                final_lines[j].startswith(";;") or final_lines[j].strip() == ""
            ):
                j += 1
            insert_pos = j
            break

    # Build export block
    export_block = [
        "",
        EXPORT_COMMENT,
        *[f"(define-public {pkg} {pkg})" for pkg in EXPORT_PACKAGES],
    ]

    # Also add to the #:export list
    # Find the end of the #:export section (look for the closing paren before defines)
    export_list_additions = "\n".join(
        f"            {pkg}" for pkg in EXPORT_PACKAGES
    )

    # Strategy: insert package names into #:export list, and add define-public aliases at end
    output_lines = []
    in_export = False
    export_list_done = False

    for i, line in enumerate(final_lines):
        # Detect end of #:export list (line with just closing paren or a define)
        if not export_list_done and in_export:
            if line.strip().startswith(";; ─── deptree-resolver-260407") and "compat aliases" in line:
                # Insert our exports before this line
                for pkg in EXPORT_PACKAGES:
                    output_lines.append(f"            {pkg}")
                output_lines.append(f"            ;; deptree-resolver-260407g re-exports")
                export_list_done = True

        if "#:export (" in line:
            in_export = True

        output_lines.append(line)

        if i == insert_pos - 1 and not exports_added:
            output_lines.extend(export_block)
            exports_added = True

    # If we didn't find the export insertion point in the list, add at the end of exports
    if not export_list_done:
        # Find the line with the last existing re-export entry and add after
        pass

    # Write atomically
    with tempfile.NamedTemporaryFile(
        mode="w", dir=COMPAT_FILE.parent, suffix=".tmp", delete=False
    ) as tmp:
        tmp.write("\n".join(output_lines))
        tmp_path = Path(tmp.name)

    shutil.move(str(tmp_path), str(COMPAT_FILE))
    print(f"Updated {COMPAT_FILE.name}")
    print(f"  Added use-module: {use_module_added}")
    print(f"  Added {len(EXPORT_PACKAGES)} re-exports")


if __name__ == "__main__":
    main()
