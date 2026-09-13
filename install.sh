#!/usr/bin/env bash
set -euo pipefail

# Ensure script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script must be run as root (use sudo)." >&2
  exit 1
fi

echo "Installing user access restriction components..."

# 1. Install executable script
install -m 0755 manage-user.sh /usr/local/bin/manage-user.sh

# 2. Install systemd service and timer unit templates
install -m 0644 user-access@.service /etc/systemd/system/user-access@.service
install -m 0644 user-access@.timer /etc/systemd/system/user-access@.timer

# 3. Reload systemd daemon to pick up the new units
systemctl daemon-reload

echo "Installation complete!"
echo "To enable for a user, run: sudo systemctl enable --now user-access@USERNAME.timer"