#!/bin/bash

# Kharne-Linux Preflight Constraints Check
# System assumes failure. Verify constraints before initialization.

abort() {
  echo -e "\033[31m✗ System constraint failed: $1\033[0m"
  echo -e "\033[31mInitialization aborted.\033[0m"
  echo
  exit 1
}

warn() {
  echo -e "\033[33m⚠ Warning: $1\033[0m"
}

echo "Verifying system constraints..."
echo

# Must be Vanilla Arch
if [[ ! -f /etc/arch-release ]]; then
  abort "Vanilla Arch Linux required"
fi

# Must not be Arch derivative
for marker in /etc/cachyos-release /etc/eos-release /etc/garuda-release /etc/manjaro-release; do
  if [[ -f "$marker" ]]; then
    abort "Vanilla Arch required (derivatives not supported)"
  fi
done

# Must not be running as root
if [ "$EUID" -eq 0 ]; then
  abort "Do not run as root"
fi

# Must be x86_64
if [ "$(uname -m)" != "x86_64" ]; then
  abort "x86_64 architecture required"
fi

# RAM check (minimum 8GB)
ram_mb=$(free -m | awk '/^Mem:/{print $2}')
if [[ $ram_mb -lt 8192 ]]; then
  abort "Minimum 8GB RAM required (found: ${ram_mb}MB)"
fi

# Disk space check (minimum 50GB)
disk_gb=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')
if [[ $disk_gb -lt 50 ]]; then
  warn "Less than 50GB free disk space (found: ${disk_gb}GB)"
fi

# Secure boot check
if [[ -d /sys/firmware/efi ]]; then
  if mokutil --sb-state 2>/dev/null | grep -q "SecureBoot enabled"; then
    abort "Secure Boot must be disabled"
  fi
fi

# Internet connectivity check
if ! ping -c 1 archlinux.org &>/dev/null; then
  warn "No internet connectivity detected"
fi

echo "✓ System constraints verified"
echo "✓ Architecture: x86_64"
echo "✓ RAM: ${ram_mb}MB"
echo "✓ Disk: ${disk_gb}GB free"
echo
