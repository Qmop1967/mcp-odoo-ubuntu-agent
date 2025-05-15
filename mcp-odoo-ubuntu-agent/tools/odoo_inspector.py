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
