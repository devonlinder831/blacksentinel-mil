#!/data/data/com.termux/files/usr/bin/python3
import sys
import os
import subprocess
from datetime import datetime

if len(sys.argv) != 2:
    print("[!] Usage: memory_payload.py <attacker_ip>")
    sys.exit(1)

attacker_ip = sys.argv[1]
timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

log_path = "/data/data/com.termux/files/home/blacksentinel_mil/retaliation.log"

with open(log_path, "a") as log:
    log.write(f"\n[{timestamp}] Retaliating against {attacker_ip}\n")
    log.write(f"[~] Attempting ping sweep on {attacker_ip}\n")

    try:
        ping = subprocess.check_output(["ping", "-c", "3", attacker_ip], stderr=subprocess.DEVNULL)
        log.write(ping.decode())
    except Exception:
        log.write("[x] Ping failed or blocked.\n")

    try:
        log.write(f"[~] Attempting port scan (shallow) on {attacker_ip}\n")
        ports = [22, 80, 443, 445]
        for port in ports:
            result = subprocess.call(["nc", "-zv", attacker_ip, str(port)], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            if result == 0:
                log.write(f"[+] Port {port} open\n")
            else:
                log.write(f"[-] Port {port} closed or filtered\n")
    except Exception:
        log.write("[x] Port scan failed.\n")
