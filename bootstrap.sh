#!/bin/bash

# Kharne-Linux Bootstrap
# Initialization under constrained conditions

set -eEo pipefail

VERSION="0.1.0-alpha"

# ASCII Art (fragmentación visual)
ansi_art='
   ╔════════════════════╗
   ║   KHARNE-LINUX     ║
   ║   ▓▓░░▓▓░░▓▓░░▓▓   ║s
   ║   v'$VERSION'      ║
   ╚════════════════════╝
'

clear
echo "$ansi_art"
echo
echo "System initialization starting..."
echo "Architecture: $(uname -m)"
echo

# Parse arguments
PROFILE="core"
MODULES=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --profile=*)
      PROFILE="${1#*=}"
      shift
      ;;
    --modules=*)
      MODULES="${1#*=}"
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

echo "Profile: $PROFILE"
[[ -n "$MODULES" ]] && echo "Additional modules: $MODULES"
echo

# Preflight checks
echo "Running preflight checks..."

# Check architecture
if [[ "$(uname -m)" != "x86_64" ]]; then
  echo "✗ Error: x86_64 architecture required"
  exit 1
fi

# Check RAM
ram_mb=$(free -m | awk '/^Mem:/{print $2}')
if [[ $ram_mb -lt 8192 ]]; then
  echo "✗ Error: Minimum 8GB RAM required (found: ${ram_mb}MB)"
  exit 1
fi

# Check disk space
disk_gb=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')
if [[ $disk_gb -lt 50 ]]; then
  echo "⚠ Warning: Less than 50GB free disk space"
fi

# Check Arch
if [[ ! -f /etc/arch-release ]]; then
  echo "✗ Error: Vanilla Arch Linux required"
  exit 1
fi

# Check not root
if [[ $EUID -eq 0 ]]; then
  echo "✗ Error: Do not run as root"
  exit 1
fi

echo "✓ System constraints met"
echo

# Update system
echo "Updating package database..."
sudo pacman -Sy --noconfirm

# Install git
sudo pacman -S --noconfirm --needed git

# Clone repository
KHARNE_REPO="${KHARNE_REPO:-hanserlodev/kharne-linux}"
KHARNE_BRANCH="${KHARNE_BRANCH:-main}"

echo "Cloning Kharne-Linux from: https://github.com/${KHARNE_REPO}.git"
rm -rf ~/.local/share/kharne/
git clone "https://github.com/${KHARNE_REPO}.git" ~/.local/share/kharne

cd ~/.local/share/kharne

if [[ $KHARNE_BRANCH != "main" ]]; then
  echo "Switching to branch: $KHARNE_BRANCH"
  git fetch origin "${KHARNE_BRANCH}" && git checkout "${KHARNE_BRANCH}"
fi

echo
echo "System initialization delegated to install.sh"
echo

# Run installer
export KHARNE_PROFILE="$PROFILE"
export KHARNE_MODULES="$MODULES"
source ~/.local/share/kharne/install.sh
