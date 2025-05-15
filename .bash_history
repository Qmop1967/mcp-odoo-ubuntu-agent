locale -a
sudo apt install language-pack-ar
sudo update-locale LANG=ar_EG.UTF-8
reboot
[200~sudo apt update && sudo apt upgrade -y
~sudo apt update && sudo apt upgrade -y
[200~apt update && apt upgrade -y
~apt update && apt upgrade -y
apt update && apt upgrade -y
[200~apt install -y postgresql
su - postgres -c "createuser -s odoo"
~apt install -y postgresql
su - postgres -c "createuser -s odoo"
apt-get install -y postgresql
su - postgres -c "createuser -s odoo"
apt-get install -y git python3-pip build-essential wget python3-dev python3-venv libxslt-dev libzip-dev libldap2-dev libsasl2-dev libjpeg-dev libpq-dev libxml2-dev libffi-dev libssl-dev libjpeg8-dev libblas-dev libatlas-base-dev libfontconfig1-dev libxrender1 libxext6 xfonts-75dpi xfonts-base libfreetype6-dev libharfbuzz-dev libfribidi-dev libxcb1-dev
cd /opt
git clone https://github.com/odoo/odoo --depth 1 --branch 17.0
cd /opt
git clone https://github.com/odoo/odoo --depth 1 --branch 18.0
rm -rf /opt/odoo
git clone https://github.com/odoo/odoo --depth 1 --branch 18.0 /opt/odoo
cd /opt/odoo
python3 -m venv venv
source venv/bin/activate
pip install wheel
pip install -r requirements.txt
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs
npm install -g less less-plugin-clean-css
nano /etc/odoo.conf
./odoo-bin -c /etc/odoo.conf
nano /etc/postgresql/16/main/pg_hba.conf
systemctl restart postgresql
./odoo-bin -c /etc/odoo.conf
nano /etc/postgresql/16/main/pg_hba.conf
sudo su - postgres
psql
sudo su - postgres
psql
sudo su - postgres
EXIT
exit
sudo systemctl stop postgresql
sudo -i -u postgres
# As your regular user or root
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
sudo -u postgres psql -c "CREATE USER odoo WITH CREATEDB PASSWORD 'odoo';"
sudo apt update
sudo apt install -y postgresql postgresql-contrib
sudo reboot
sudo systemctl status postgresql
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo -u postgres psql -c "CREATE USER odoo WITH CREATEDB PASSWORD 'odoo';"
sudo apt install -y git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libpng-dev libjpeg-dev gdebi wkhtmltopdf
# Download and install Odoo (version 16)
cd /tmp
sudo wget https://nightly.odoo.com/16.0/nightly/deb/odoo_16.0.latest_all.deb
sudo dpkg -i odoo_16.0.latest_all.deb
sudo apt -f install -y
sudo systemctl status postgresql
sudo systemctl status odoo
sudo systemctl stop odoo
sudo apt remove odoo -y
cd /tmp
sudo wget https://nightly.odoo.com/18.0/nightly/deb/odoo_18.0.latest_all.deb
sudo dpkg -i odoo_18.0.latest_all.deb
sudo apt update
sudo apt install -y python3-cryptography python3-chardet python3-pyopenssl python3-geopy python3-openpyxl python3-rjsmin python3-pybabel2 python3-num2words python3-libsass python3-passlib python3-polib python3-psutil python3-pydot python3-stdnum python3-werkzeug python3-xlrd python3-yaml python3-zeep
sudo apt update
sudo apt install -y python3-pip
sudo pip3 install asn1crypto cbor2 geopy openpyxl rjsmin python-ldap
# Add the repository key
wget -q -O - https://nightly.odoo.com/odoo.key | sudo apt-key add -
# Add the repository
echo "deb http://nightly.odoo.com/16.0/nightly/deb/ ./" | sudo tee /etc/apt/sources.list.d/odoo.list
# Update package lists
sudo apt update
# Install Odoo 16
sudo apt install odoo -y
sudo apt remove odoo -y
sudo rm /etc/apt/sources.list.d/odoo.list
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
mkdir -p ~/odoo/config ~/odoo/addons
cd ~/odoo
cat > docker-compose.yml << 'EOL'
version: '3'
services:
  web:
    image: odoo:16.0
    depends_on:
      - db
    ports:
      - "8069:8069"
    volumes:
      - odoo-web-data:/var/lib/odoo
      - ./config:/etc/odoo
      - ./addons:/mnt/extra-addons
    environment:
      - HOST=db
      - USER=odoo
      - PASSWORD=odoo
  db:
    image: postgres:13
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=odoo
      - POSTGRES_USER=odoo
    volumes:
      - odoo-db-data:/var/lib/postgresql/data

volumes:
  odoo-web-data:
  odoo-db-data:
EOL

cat > /odoo/config/odoo.conf << 'EOL'
[options]
addons_path = /mnt/extra-addons
data_dir = /var/lib/odoo
admin_passwd = admin
EOL

sudo mkdir -p /odoo/config
sudo cat > /odoo/config/odoo.conf << 'EOL'
[options]
addons_path = /mnt/extra-addons
data_dir = /var/lib/odoo
admin_passwd = admin
EOL

cd /odoo
sudo docker-compose up -d
sudo docker ps
cd /odoo
cat docker-compose.yml
cat > docker-compose.yml << 'EOL'
version: '3'
services:
  web:
    image: odoo:16.0
    depends_on:
      - db
    ports:
      - "8069:8069"
    volumes:
      - odoo-web-data:/var/lib/odoo
      - ./config:/etc/odoo
      - ./addons:/mnt/extra-addons
    environment:
      - HOST=db
      - USER=odoo
      - PASSWORD=odoo
  db:
    image: postgres:13
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=odoo
      - POSTGRES_USER=odoo
    volumes:
      - odoo-db-data:/var/lib/postgresql/data

volumes:
  odoo-web-data:
  odoo-db-data:
EOL

mkdir -p config addons
cat > config/odoo.conf << 'EOL'
[options]
addons_path = /mnt/extra-addons
data_dir = /var/lib/odoo
admin_passwd = admin
EOL

sudo docker-compose up -d
cd /odoo
# This command assumes you've already created a database
sudo docker-compose exec db pg_dump -U odoo postgres > odoo_backup.sql
sudo nano docker-compose.yml
cd /odoo
sudo docker-compose down
sudo docker-compose pull
sudo docker-compose up -d
[200~cd /odoo
sudo docker-compose logs web~
sudo docker ps
sudo docker logs $(sudo docker ps | grep odoo | awk '{print $1}')
sudo docker logs odoo_web_1
sudo mkdir -p /var/lib/odoo/sessions
sudo chown -R 101:101 /var/lib/odoo
sudo chmod -R 777 /var/lib/odoo
cd /odoo
sudo nano docker-compose.yml
sudo docker-compose down
sudo docker-compose up -d
cd /odoo
sudo nano docker-compose.yml
sudo mkdir -p /odoo/config
sudo cat > /odoo/config/odoo.conf << 'EOL'
[options]
addons_path = /mnt/extra-addons
data_dir = /var/lib/odoo
admin_passwd = admin
db_host = db
db_port = 5432
db_user = odoo
db_password = odoo
EOL

sudo chmod 644 /odoo/config/odoo.conf
sudo mkdir -p /odoo/addons
sudo docker-compose down -v
sudo docker-compose up -d
sudo docker ps
sudo docker exec -it $(sudo docker ps | grep odoo | awk '{print $1}') odoo --version
sudo docker exec -it odoo_web_1 odoo --version
cd /odoo
sudo nano docker-compose.yml
sudo docker-compose down
sudo docker-compose up -d
sudo docker exec -it $(sudo docker ps | grep odoo | awk '{print $1}') bash -c "odoo --version || echo Odoo 18.0"
cd /odoo
sudo nano docker-compose.yml
sudo docker pull odoo:18.0
sudo docker-compose down -v
sudo docker-compose up -d
sudo docker exec -it odoo_web_1 odoo --version
cd /odoo
sudo nano docker-compose.yml
cd /odoo
sudo git clone https://github.com/odoo/enterprise.git -b 18.0 --depth 1
