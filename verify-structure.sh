#!/bin/bash

# Kharne-Linux Structure Verification
# Verifies the project structure is coherent before installation

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Kharne-Linux Structure Verification"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

ERRORS=0
WARNINGS=0

check_file() {
  if [[ -f "$1" ]]; then
    echo -e "${GREEN}✓${NC} $1"
  else
    echo -e "${RED}✗${NC} $1 (missing)"
    ((ERRORS++))
  fi
}

check_dir() {
  if [[ -d "$1" ]]; then
    echo -e "${GREEN}✓${NC} $1/"
  else
    echo -e "${RED}✗${NC} $1/ (missing)"
    ((ERRORS++))
  fi
}

check_executable() {
  if [[ -x "$1" ]]; then
    echo -e "${GREEN}✓${NC} $1 (executable)"
  else
    echo -e "${YELLOW}⚠${NC} $1 (not executable)"
    ((WARNINGS++))
  fi
}

echo "Core Files:"
check_file "README.md"
check_file "LICENSE"
check_file "kharne-version"
check_file "bootstrap.sh"
check_file "install.sh"
check_file "ROADMAP.md"
check_file "CONTRIBUTING.md"
check_file "IMPLEMENTATION.md"
echo

echo "Core Scripts:"
check_executable "bin/kharne-core"
check_executable "bin/kharne-module"
check_executable "bin/kharne-state"
check_executable "bootstrap.sh"
echo

echo "Module Structure:"
check_dir "kharne/modules/core"
check_file "kharne/modules/core/description"
check_file "kharne/modules/core/packages.list"

check_dir "kharne/modules/dev"
check_file "kharne/modules/dev/description"
check_file "kharne/modules/dev/packages.list"

check_dir "kharne/modules/ops"
check_file "kharne/modules/ops/description"
check_file "kharne/modules/ops/packages.list"

check_dir "kharne/modules/ai"
check_file "kharne/modules/ai/description"
check_file "kharne/modules/ai/packages.list"
echo

echo "Theme System:"
check_dir "themes/kharne-core"
check_file "themes/kharne-core/description"
check_file "themes/kharne-core/hyprland.conf"
check_file "themes/kharne-core/colors.toml"
echo

echo "Install System:"
check_dir "install"
check_dir "install/preflight"
check_file "install/preflight/kharne-constraints.sh"
check_file "install/preflight/all.sh"
check_dir "install/helpers"
check_dir "install/packaging"
check_dir "install/config"
echo

echo "Migrations:"
check_file "migrations/1738540800_kharne_initial_transformation.sh"
check_executable "migrations/1738540800_kharne_initial_transformation.sh"
echo

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Summary:"
echo

if [[ $ERRORS -eq 0 && $WARNINGS -eq 0 ]]; then
  echo -e "${GREEN}✓ All checks passed${NC}"
  echo "Structure is coherent. Ready for development."
  exit 0
elif [[ $ERRORS -eq 0 ]]; then
  echo -e "${YELLOW}⚠ $WARNINGS warnings${NC}"
  echo "Structure is mostly coherent."
  exit 0
else
  echo -e "${RED}✗ $ERRORS errors, $WARNINGS warnings${NC}"
  echo "Structure has critical issues. Fix before proceeding."
  exit 1
fi
