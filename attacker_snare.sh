#!/data/data/com.termux/files/usr/bin/bash

echo "[*] Snare module active — watching for threat probes..."

while true; do
    attacker_ip=$(netstat -an | grep ':22885' | grep ESTABLISHED | awk '{print $5}' | cut -d: -f1)
    if [[ ! -z "$attacker_ip" ]]; then
        echo "[!] Suspicious activity detected from $attacker_ip"
        echo "$(date) - Intrusion Attempt from $attacker_ip" >> ~/blacksentinel_mil/detected.log

        # Optional: run an in-memory payload
        python3 ~/blacksentinel_mil/memory_payload.py "$attacker_ip" &
    fi
    sleep 10
done
