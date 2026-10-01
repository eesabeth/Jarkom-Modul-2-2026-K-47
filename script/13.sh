# Rekap Konfigurasi Praktikum Modul 2 - Soal 13 (Redirect 301 & 302)
# ====================================================================

# ==========================================
# 1. NODE PENNY (REDIRECT PERMANEN 301)
# ==========================================
# Mengaktifkan modul rewrite Apache
a2enmod rewrite

# Mengubah konfigurasi VirtualHost Penny untuk Redirect 301
nano /etc/apache2/sites-available/000-default.conf
# ==========================================
# ISI NANO PENNY (Soal 13):
# ==========================================
<VirtualHost *:80>
    ServerName www.xxx.com
    ServerAlias penny.xxx.com

    # Redirect permanen (301) jika diakses via IP Penny atau penny.xxx.com
    RewriteEngine On
    RewriteCond %{HTTP_HOST} ^10\.87\.4\.2$ [OR]
    RewriteCond %{HTTP_HOST} ^penny\.xxx\.com$
    RewriteRule ^(.*)$ http://www.xxx.com$1 [R=301,L]

    # Aturan Basic Auth dari Soal 12
    <Location "/admin">
        AuthType Basic
        AuthName "Ruang Rahasia Sindikat"
        AuthUserFile /etc/apache2/.htpasswd
        Require valid-user
    </Location>
    ProxyPass /admin !

    # Load Balancer dari Soal 11
    <Proxy "balancer://vault_cluster">
        BalancerMember http://10.87.5.4
        BalancerMember http://10.87.5.5
    </Proxy>

    ProxyPreserveHost On
    RequestHeader set X-Real-IP %{REMOTE_ADDR}s

    ProxyPass / balancer://vault_cluster/
    ProxyPassReverse / balancer://vault_cluster/
</VirtualHost>

# Menerapkan konfigurasi Apache Penny
service apache2 restart


# ==========================================
# 2. NODE ABBEY (REDIRECT SEMENTARA 302)
# ==========================================
# Mengubah konfigurasi default Nginx Abbey untuk Redirect 302
nano /etc/nginx/sites-available/default
# ==========================================
# ISI NANO ABBEY (Soal 13):
# ==========================================
upstream core_cluster {
    server 10.87.5.6;
    server 10.87.5.7;
}

# Blok Redirect 302 dari IP Abbey atau abbey.xxx.com ke static.xxx.com
server {
    listen 80;
    server_name 10.87.3.2 abbey.xxx.com;
    
    return 302 http://static.xxx.com$request_uri;
}

# Blok Reverse Proxy utama untuk domain kanonik static.xxx.com
server {
    listen 80;
    server_name static.xxx.com;

    location / {
        proxy_pass http://core_cluster;
        
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

# Cek sintaks dan terapkan konfigurasi Nginx Abbey
nginx -t
service nginx restart


# ==========================================
# 3. NODE ROOTKIT (PENGUJIAN / CLIENT)
# ==========================================
# Uji Redirect 301 Penny
curl -I http://10.87.4.2

# Uji Redirect 302 Abbey
curl -I http://10.87.3.2
