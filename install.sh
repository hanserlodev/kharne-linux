#!/bin/bash

# Kharne-Linux System Installer
# System initialization under constrained conditions

set -eEo pipefail

# Define Kharne locations
export KHARNE_PATH="$HOME/.local/share/kharne"
export KHARNE_INSTALL="$KHARNE_PATH/install"
export KHARNE_INSTALL_LOG_FILE="/var/log/kharne-install.log"
export KHARNE_STATE="$HOME/.local/state/kharne"
export KHARNE_CONFIG="$HOME/.config/kharne"

# Maintain Omarchy compatibility (temporary)
export OMARCHY_PATH="$KHARNE_PATH"
export OMARCHY_INSTALL="$KHARNE_INSTALL"
export OMARCHY_INSTALL_LOG_FILE="$KHARNE_INSTALL_LOG_FILE"

# Path priority: Kharne bins first, then inherited
export PATH="$KHARNE_PATH/bin:$PATH"

# Create state directories
mkdir -p "$KHARNE_STATE/system"
mkdir -p "$KHARNE_STATE/modules"
mkdir -p "$KHARNE_STATE/checkpoints"
mkdir -p "$KHARNE_CONFIG/user"
mkdir -p "$KHARNE_CONFIG/override"

echo "Kharne-Linux v$(cat $KHARNE_PATH/kharne-version 2>/dev/null || echo '0.1.0-alpha')"
echo "Initialization sequence starting..."
echo

# Install
source "$KHARNE_INSTALL/helpers/all.sh"
source "$KHARNE_INSTALL/preflight/all.sh"
source "$KHARNE_INSTALL/packaging/all.sh"
source "$KHARNE_INSTALL/config/all.sh"
source "$KHARNE_INSTALL/login/all.sh"
source "$KHARNE_INSTALL/post-install/all.sh"

echo
echo "System initialization complete."
echo "Run 'kharne-core status' to verify."
