#!/bin/bash
# validate-templates.sh — Check Gaurix package templates for Guix API compliance
# Validates: module structure, required fields, license prefix convention

PKG_DIR="$(dirname "$0")/../guix/gaurix/packages"
PASS=0
FAIL=0

check() {
  local file="$1" label="$2" pattern="$3"
  if grep -q "$pattern" "$file" 2>/dev/null; then
    echo "PASS $label: $(basename "$file")"
    PASS=$((PASS+1))
  else
    echo "FAIL $label: $(basename "$file")"
    FAIL=$((FAIL+1))
  fi
}

for f in "$PKG_DIR"/*.scm; do
  [ -f "$f" ] || continue
  base=$(basename "$f")

  # Must have define-module
  check "$f" "define-module" "define-module"

  # Must use guix packages
  check "$f" "use-guix-packages" "#:use-module (guix packages)"

  # Must use license prefix
  check "$f" "license-prefix" "#:prefix license:"

  # Must have define-public
  check "$f" "define-public" "define-public"

  # Must have synopsis
  check "$f" "synopsis" "(synopsis"

  # Must have description
  check "$f" "description" "(description"

  # Must have home-page
  check "$f" "home-page" "(home-page"

  # Must have license
  check "$f" "license" "(license"
done

echo ""
echo "TEMPLATE VALIDATION: $PASS/$((PASS+FAIL)) passed"
[ "$FAIL" -eq 0 ]
