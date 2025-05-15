#!/bin/bash

mkdir -p tools

# system_control.py
cat <<EOF > tools/system_control.py
import psutil

def get_system_status():
    return {
        'cpu_percent': psutil.cpu_percent(),
        'memory_percent': psutil.virtual_memory().percent,
        'disk_percent': psutil.disk_usage('/').percent
    }
EOF

# odoo_inspector.py
cat <<EOF > tools/odoo_inspector.py
import xmlrpc.client

def inspect_odoo():
    try:
        url = "http://localhost:8069"
        db = "odoo"
        username = "admin"
        password = "admin"

        common = xmlrpc.client.ServerProxy(f"{url}/xmlrpc/2/common")
        uid = common.authenticate(db, username, password, {})
        return {'status': bool(uid), 'uid': uid}
    except Exception as e:
        return {'status': False, 'error': str(e)}
EOF

# notifier.py
cat <<EOF > tools/notifier.py
import requests

def send_notification(message):
    token = "YOUR_TELEGRAM_BOT_TOKEN"
    chat_id = "YOUR_CHAT_ID"
    url = f"https://api.telegram.org/bot{token}/sendMessage"
    requests.post(url, data={'chat_id': chat_id, 'text': message})
EOF

echo "✅ All MCP components created successfully!"
