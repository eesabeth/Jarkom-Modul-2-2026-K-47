# Rekap Konfigurasi Praktikum Modul 2 - Soal 11 (Reverse Proxy & Load Balancing)
# ====================================================================

# ==========================================
# 1. NODE PENNY (REVERSE PROXY APACHE - VAULT)
# ==========================================
apt update
apt install apache2 -y

# Mengaktifkan modul yang dibutuhkan
a2enmod proxy proxy_http proxy_balancer lbmethod_byrequests headers

# Membuat file konfigurasi VirtualHost
nano /etc/apache2/sites-available/000-default.conf
# ==========================================
# ISI NANO PENNY (Soal 11):
# ==========================================
<VirtualHost *:80>
    <Proxy "balancer://vault_cluster">
        BalancerMember http://10.87.5.4
        BalancerMember http://10.87.5.5
    </Proxy>

    ProxyPreserveHost On
    RequestHeader set X-Real-IP %{REMOTE_ADDR}s

    ProxyPass / balancer://vault_cluster/
    ProxyPassReverse / balancer://vault_cluster/
</VirtualHost>

# Menerapkan konfigurasi
service apache2 restart


# ==========================================
# 2. NODE ABBEY (REVERSE PROXY NGINX - CORE)
# ==========================================
apt update
apt install nginx -y

# Membuat file konfigurasi default nginx
nano /etc/nginx/sites-available/default
# ==========================================
# ISI NANO ABBEY (Soal 11):
# ==========================================
upstream core_cluster {
    server 10.87.5.6;
    server 10.87.5.7;
}

server {
    listen 80;

    location / {
        proxy_pass http://core_cluster;
        
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

# Cek sintaks dan terapkan konfigurasi
nginx -t
service nginx restart

# ==========================================
# 3. NODE BACKEND (OBLADI, DESMOND, OBLADA, MOLLY)
# Catatan: Perintah ini dijalankan berulang di 4 node berbeda
# ==========================================
apt update
apt install apache2 -y

# Ganti "Nama Server" sesuai dengan node yang sedang dikonfigurasi
# Contoh: echo "Ini server Obladi" > /var/www/html/index.html
echo "Ini server [NAMA_SERVER]" > /var/www/html/index.html

# Menjalankan layanan web server
service apache2 start


# ==========================================
# 4. NODE ROOTKIT (PENGUJIAN / CLIENT)
# ==========================================
# Pengujian ke area Vault (Penny)[cite: 20]
curl http://10.87.4.2
curl http://10.87.4.2

# Pengujian ke area Core (Abbey)[cite: 20]
curl http://10.87.3.2
curl http://10.87.3.2
