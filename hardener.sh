#!/data/data/com.termux/files/usr/bin/bash
# BlackSentinel_MIL - Hardened Boot Defense (Unrooted Compatible)

termux-wake-lock
echo "[*] BlackSentinel Military Hardening Engaged."

# Simulated Airplane Mode Warning (Real airplane mode requires root/system access)
echo "[!] Airplane mode simulation activated (Android restriction)."

# Start fake web decoy listener
echo "[*] Launching decoy Apache service on port 8080..."
nohup bash ~/blacksentinel_mil/decoy_web.sh > /dev/null 2>&1 &

# Simulated iptables rules (Firewall simulation notice)
echo "[!] Firewall simulation engaged (iptables blocked on non-root)."

# Harden perception - log activity
echo "[*] Defensive perimeter initialized."
date >> ~/blacksentinel_mil/hardener_activity.log
echo "[*] Logs will be encrypted separately by blacklog_encryptor.py"

# Loop monitor to simulate system readiness
while true; do
    echo "[*] System check @ $(date)" >> ~/blacksentinel_mil/hardener_activity.log
    sleep 60
done
