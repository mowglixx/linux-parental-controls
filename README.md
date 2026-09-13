# Linux bedtime script

The following script was written to log out the kids at night


## Installation

run the following to install the service:

```bash
chmod +x ./install.sh
sudo ./install.sh
```

## Usage

Reload `systemd` to recognize the new files, then enable and start the timer:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now user-access@USERNAME.timer

```

### How to Verify the service is running

1. **Check timer status and upcoming execution times:**
```bash
sudo systemctl status user-access@USERNAME.timer

```

2. **Manually test the service execution (without waiting for the timer):**
```bash
sudo systemctl start user-access.service

```

3. **Inspect the status of the user user password lock:**
```bash
sudo passwd -S user

```

*(A status of `L` indicates locked, `P` indicates usable password).*