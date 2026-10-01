# Rekap Konfigurasi Praktikum Modul 2 - Soal 15 (Reverse Proxy Path /eternal & /orion)
# ====================================================================

# ==========================================
# 1. NODE OBLADI (APACHE - BACKEND /eternal)
# ==========================================
# Install PHP agar bisa merender file .php
apt update && apt install php libapache2-mod-php -y

# Membuat direktori dan file index.php
mkdir -p /var/www/eternal
echo "<?php phpinfo(); ?>" > /var/www/eternal/index.php

# Membuka file konfigurasi VirtualHost Apache Obladi
nano /etc/apache2/sites-available/000-default.conf
# ==========================================
# ISI NANO OBLADI (Soal 15 - Tambahkan di dalam <VirtualHost *:80>):
# ==========================================
Alias /eternal /var/www/eternal
<Directory /var/www/eternal>
    Require all granted
</Directory>

# Uji konfigurasi dan restart Apache Obladi
apache2ctl configtest
service apache2 restart


# ==========================================
# 2. NODE DESMOND (APACHE - BACKEND /eternal)
# ==========================================
# Install PHP agar bisa merender file .php
apt update && apt install php libapache2-mod-php -y

# Membuat direktori dan file index.php
mkdir -p /var/www/eternal
echo "<?php phpinfo(); ?>" > /var/www/eternal/index.php

# Membuka file konfigurasi VirtualHost Apache Desmond
nano /etc/apache2/sites-available/000-default.conf
# ==========================================
# ISI NANO DESMOND (Soal 15 - Tambahkan di dalam <VirtualHost *:80>):
# ==========================================
Alias /eternal /var/www/eternal
<Directory /var/www/eternal>
    Require all granted
</Directory>

# Uji konfigurasi dan restart Apache Desmond
apache2ctl configtest
service apache2 restart


# ==========================================
# 3. NODE PENNY (APACHE - PROXY /eternal)
# ==========================================
# Membuka file konfigurasi VirtualHost Apache Penny
nano /etc/apache2/sites-available/000-default.conf
# ==========================================
# ISI NANO PENNY (Soal 15 - Letakkan /eternal di ATAS / agar diprioritaskan):
# ==========================================
ProxyPass /eternal balancer://vault_cluster/eternal
ProxyPassReverse /eternal balancer://vault_cluster/eternal

ProxyPass / balancer://vault_cluster/
ProxyPassReverse / balancer://vault_cluster/

# Uji konfigurasi dan restart Apache Penny
apache2ctl configtest
service apache2 restart


# ==========================================
# 4. NODE OBLADA (NGINX - BACKEND /orion)
# ==========================================
# Membuat direktori dan file html statis
mkdir -p /var/www/orion
echo "<h1>Ini adalah halaman statis Orion</h1>" > /var/www/orion/index.html

# Membuka konfigurasi utama Nginx Oblada
nano /etc/nginx/sites-available/default
# ==========================================
# ISI NANO OBLADA (Soal 15 - Tambahkan di dalam blok server {} yang aktif):
# ==========================================
location /orion {
    alias /var/www/orion;
    index index.html;
}

# Uji sintaks dan restart Nginx Oblada
nginx -t
service nginx restart


# ==========================================
# 5. NODE MOLLY (NGINX - BACKEND /orion)
# ==========================================
# Membuat direktori dan file html statis
mkdir -p /var/www/orion
echo "<h1>Ini adalah halaman statis Orion</h1>" > /var/www/orion/index.html

# Membuka konfigurasi utama Nginx Molly
nano /etc/nginx/sites-available/default
# ==========================================
# ISI NANO MOLLY (Soal 15 - Tambahkan di dalam blok server {} yang aktif):
# ==========================================
location /orion {
    alias /var/www/orion;
    index index.html;
}

# Uji sintaks dan restart Nginx Molly
nginx -t
service nginx restart


# ==========================================
# 6. NODE ABBEY (NGINX - PROXY /orion)
# ==========================================
# Membuka konfigurasi utama Nginx Abbey
nano /etc/nginx/sites-available/default
# ==========================================
# ISI NANO ABBEY (Soal 15 - Tambahkan di dalam blok server domain static.xxx.com):
# ==========================================
location /orion {
    proxy_pass http://core_cluster/orion;
}

location / {
    proxy_pass http://core_cluster;
    
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}

# Uji sintaks dan restart Nginx Abbey
nginx -t
service nginx restart


# ==========================================
# 7. NODE ROOTKIT (PENGUJIAN & PROOF OF WORK)
# ==========================================
# Pengujian Reverse Proxy jalur /eternal di Penny (ditambahkan '/' di akhir & Host Header)
curl -H "Host: www.xxx.com" -I http://10.87.4.2/eternal/

# Pengujian Reverse Proxy jalur /orion di Abbey (ditambahkan '/' di akhir & Host Header)
curl -H "Host: static.xxx.com" -I http://10.87.3.2/orion/
