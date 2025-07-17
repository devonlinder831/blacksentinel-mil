#!/data/data/com.termux/files/usr/bin/bash

while true; do
clear
echo "██████╗ ██╗      █████╗  ██████╗██╗  ██╗███████╗███████╗███╗   ██╗████████╗███████╗███╗   ██╗████████╗"
echo "██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔════╝████╗  ██║╚══██╔══╝"
echo "██████╔╝██║     ███████║██║     █████╔╝ █████╗  █████╗  ██╔██╗ ██║   ██║   █████╗  ██╔██╗ ██║   ██║   "
echo "██╔═══╝ ██║     ██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██║╚██╗██║   ██║   "
echo "██║     ███████╗██║  ██║╚██████╗██║  ██╗███████╗███████╗██║ ╚████║   ██║   ███████╗██║ ╚████║   ██║   "
echo "╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝   ╚═╝   "
echo
echo "[*] Welcome to the BlackSentinel Military Control Panel"
echo
echo "  1) Start BlackSentinel Core"
echo "  2) Stop Core Processes"
echo "  3) View Encrypted Logs"
echo "  4) Trigger Payload"
echo "  5) View Active Connections"
echo "  6) Self-Destruct (Lock Down)"
echo "  7) Exit"
echo

read -p "Option > " choice

echo "$(date) — Option $choice selected" >> ~/.blacksentinel_mil/control_access.log

case $choice in
  1)
    bash ~/.blacksentinel_mil/start_military.sh
    ;;
  2)
    pkill -f blacksense_server.py
    pkill -f attacker_snare.sh
    echo "[*] Core processes terminated."
    ;;
  3)
    echo "[!] Encrypted Log Contents:"
    cat ~/.blacksentinel_mil/encrypted_logs.b64 2>/dev/null || echo "No encrypted logs found."
    ;;
  4)
    python3 ~/.blacksentinel_mil/memory_payload.py
    ;;
  5)
    netstat -an | grep ESTABLISHED || echo "No active connections."
    ;;
  6)
    chattr +i ~/.blacksentinel_mil/* 2>/dev/null
    echo "[!] Lockdown mode activated: Files marked immutable (if supported)."
    ;;
  7)
    echo "[*] Exiting Control Panel..."
    exit 0
    ;;
  *)
    echo "[!] Invalid option. Please try again."
    ;;
esac

echo
read -p "Press Enter to return to menu..."
done
