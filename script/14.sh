# Rekap Konfigurasi Praktikum Modul 2 - Soal 14 (Log IP Asli Klien)
# ====================================================================

# ==========================================
# 1. NODE OBLADI (APACHE - AREA VAULT)
# ==========================================
# Membuka file konfigurasi VirtualHost Apache Obladi
nano /etc/apache2/sites-available/000-default.conf
# ==========================================
# ISI NANO OBLADI (Soal 14):
# ==========================================
<VirtualHost *:80>
    DocumentRoot /var/www/html

    # Membuat format log kustom yang mengambil IP asli dari header proxy
    LogFormat "%{X-Real-IP}i %l %u %t \"%r\" %>s %b" proxy_combined
    CustomLog ${APACHE_LOG_DIR}/access.log proxy_combined
</VirtualHost>

# Uji konfigurasi dan restart Apache Obladi
apache2ctl configtest
service apache2 restart


# ==========================================
# 2. NODE DESMOND (APACHE - AREA VAULT)
# ==========================================
# Membuka file konfigurasi VirtualHost Apache Desmond
nano /etc/apache2/sites-available/000-default.conf
# ==========================================
# ISI NANO DESMOND (Soal 14):
# ==========================================
<VirtualHost *:80>
    DocumentRoot /var/www/html

    # Membuat format log kustom yang mengambil IP asli dari header proxy
    LogFormat "%{X-Real-IP}i %l %u %t \"%r\" %>s %b" proxy_combined
    CustomLog ${APACHE_LOG_DIR}/access.log proxy_combined
</VirtualHost>

# Uji konfigurasi dan restart Apache Desmond
apache2ctl configtest
service apache2 restart


# ==========================================
# 3. NODE OBLADA (NGINX - AREA CORE)
# ==========================================
# Install Nginx jika belum ada
apt update && apt install nginx -y

# Mematikan service Apache agar tidak bentrok port 80 dengan Nginx
service apache2 stop
update-rc.d apache2 disable

# Membuka konfigurasi utama Nginx Oblada
nano /etc/nginx/nginx.conf
# ==========================================
# ISI NANO OBLADA (Soal 14):
# ==========================================
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
}

http {
    sendfile on;
    tcp_nopush on;
    types_hash_max_size 2048;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    # Format log kustom untuk mengambil IP asli dari header proxy
    log_format custom_ip '$http_x_real_ip - $remote_user [$time_local] "$request" '
                         '$status $body_bytes_sent "$http_referer" '
                         '"$http_user_agent"';

    access_log /var/log/nginx/access.log custom_ip;
    error_log /var/log/nginx/error.log;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}

# Uji sintaks dan jalankan Nginx Oblada
nginx -t
service nginx start


# ==========================================
# 4. NODE MOLLY (NGINX - AREA CORE)
# ==========================================
# Install Nginx jika belum ada
apt update && apt install nginx -y

# Mematikan service Apache di Molly
service apache2 stop
update-rc.d apache2 disable

# Membuka konfigurasi utama Nginx Molly
nano /etc/nginx/nginx.conf
# ==========================================
# ISI NANO MOLLY (Soal 14):
# ==========================================
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
}

http {
    sendfile on;
    tcp_nopush on;
    types_hash_max_size 2048;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    # Format log kustom untuk mengambil IP asli dari header proxy
    log_format custom_ip '$http_x_real_ip - $remote_user [$time_local] "$request" '
                         '$status $body_bytes_sent "$http_referer" '
                         '"$http_user_agent"';

    access_log /var/log/nginx/access.log custom_ip;
    error_log /var/log/nginx/error.log;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}

# Uji sintaks dan jalankan Nginx Molly
nginx -t
service nginx start


# ==========================================
# 5. NODE ROOTKIT / PENNY (PENGUJIAN & PROOF OF WORK)
# ==========================================
# Memantau log secara real-time di server backend (contoh: Oblada)
tail -f /var/log/nginx/access.log

# Melakukan pengujian request dari node proxy (Penny) ke backend
curl -I http://10.87.5.6
