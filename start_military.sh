#!/data/data/com.termux/files/usr/bin/bash
echo "[*] Launching BlackSentinel_MIL — Military Honeynet System 🛰️"

# Launch main honeynet server (change to correct filename if needed)
nohup python3 blacksense_server.py 22885 >> boot.log 2>&1 &

# Launch guardian core (passive monitor)
nohup bash guardian_core.sh >> boot.log 2>&1 &

# Launch log encryptor (military secure logs)
nohup python3 blacklog_encryptor.py >> encrypted.log 2>&1 &

echo "[*] BlackSentinel_MIL launched at $(date)" >> boot.log
