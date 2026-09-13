#!/usr/bin/env bash
set -euo pipefail

TARGET_USER=$1

# Get current hour and minute in HHMM format (e.g., 2230, 0415, 0700)
NOW=$(date +%H%M)

# Restricted range: 22:00 (2200) to 06:30 (0630)
if [ "$NOW" -ge 2200 ] || [ "$NOW" -lt 0630 ]; then
    # Lock account
    passwd -l "$TARGET_USER" || true
    
    # Terminate all active sessions/processes for the user
    loginctl kill-user "$TARGET_USER" || true
    pkill -KILL -u "$TARGET_USER" || true
else
    # Unlock account
    passwd -u "$TARGET_USER" || true
fi