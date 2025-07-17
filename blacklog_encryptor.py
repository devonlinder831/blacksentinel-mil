from cryptography.fernet import Fernet
import time

key = Fernet.generate_key()
cipher = Fernet(key)

LOG = "/data/data/com.termux/files/home/blacksentinel_mil/black_ops.log"
ENCRYPTED_LOG = "/data/data/com.termux/files/home/blacksentinel_mil/black_ops_encrypted.log"

while True:
    try:
        with open(LOG, "rb") as f:
            content = f.read()
        encrypted = cipher.encrypt(content)
        with open(ENCRYPTED_LOG, "wb") as ef:
            ef.write(encrypted)
    except Exception:
        pass
    time.sleep(60)
