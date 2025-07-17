#!/data/data/com.termux/files/usr/bin/bash

# Logging start
echo "Boot script triggered at $(date)" >> ~/guardian_logs/bootlog.txt

# Start Guardian
cd ~
nohup ./guardian_launcher.sh >> ~/guardian_logs/guardian_startup.out 2>&1 &

# Start HoneyJump V3 Paranoia Mode
cd ~/honeyjump_v3_paranoia
nohup ./start_paranoia.sh >> ~/guardian_logs/honeyjump_startup.out 2>&1 &
