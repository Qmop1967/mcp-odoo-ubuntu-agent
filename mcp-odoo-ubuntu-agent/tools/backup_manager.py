import os
import datetime
import subprocess
from tools.notifier import send_notification

def backup_postgres(db_name="odoo", user="odoo", output_dir="/root/mcp-odoo-ubuntu-agent/backups"):
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_file = os.path.join(output_dir, f"{db_name}_backup_{timestamp}.sql")

    try:
        os.makedirs(output_dir, exist_ok=True)
        command = f"pg_dump -U {user} {db_name} > {backup_file}"
        subprocess.run(command, shell=True, check=True, executable="/bin/bash")
        send_notification(f"✅ تم إنشاء نسخة احتياطية من قاعدة البيانات: {backup_file}")
    except Exception as e:
        send_notification(f"❌ فشل في إنشاء النسخة الاحتياطية: {str(e)}")
