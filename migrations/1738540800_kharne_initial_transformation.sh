#!/bin/bash

echo "Kharne-Linux: Initial system transformation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "This migration transforms Omarchy into Kharne-Linux."
echo "Irreversible decisions will be applied."
echo

# Remove X11 support packages (Wayland only)
echo "[1/5] Removing X11 dependencies..."
packages_to_remove=(
  "xorg-server"
  "xorg-xinit"
  "xf86-video-fbdev"
)

for pkg in "${packages_to_remove[@]}"; do
  if pacman -Qq "$pkg" 2>/dev/null; then
    echo "  Removing: $pkg"
    sudo pacman -Rns --noconfirm "$pkg" 2>/dev/null || true
  fi
done

# Remove redundant terminals (keep only Ghostty)
echo "[2/5] Removing redundant terminals..."
terminals_to_remove=(
  "alacritty"
  "kitty"
)

for term in "${terminals_to_remove[@]}"; do
  if pacman -Qq "$term" 2>/dev/null; then
    echo "  Removing: $term"
    sudo pacman -Rns --noconfirm "$term" 2>/dev/null || true
  fi
done

# Remove Chromium (keep Firefox)
echo "[3/5] Removing proprietary browsers..."
if pacman -Qq chromium 2>/dev/null; then
  echo "  Removing: chromium"
  sudo pacman -Rns --noconfirm chromium 2>/dev/null || true
fi

# Remove 1Password
echo "[4/5] Removing proprietary password managers..."
if pacman -Qq 1password 2>/dev/null || pacman -Qq 1password-beta 2>/dev/null; then
  echo "  Removing: 1password"
  sudo pacman -Rns --noconfirm 1password 1password-beta 1password-cli 2>/dev/null || true
fi

# Create Kharne state marker
echo "[5/5] Marking Kharne-Linux initialization..."
mkdir -p "$HOME/.local/state/kharne/system"
echo "$(date +%s)" > "$HOME/.local/state/kharne/system/kharne-initialized"
echo "0.1.0-alpha" > "$HOME/.local/state/kharne/system/kharne-version"

echo
echo "✓ Transformation complete"
echo "✓ X11 support removed (Wayland only)"
echo "✓ Redundant tools eliminated"
echo "✓ Proprietary software removed"
echo
echo "Message: You chose this world. Learn to operate in it."
