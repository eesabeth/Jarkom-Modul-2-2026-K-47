# Rekap Konfigurasi Praktikum Modul 2 - Soal 12 (Basic Authentication)
# ====================================================================

# ==========================================
# 1. NODE PENNY (BASIC AUTHENTICATION PADA /admin)
# ==========================================
apt update
apt install apache2-utils -y

# Membuat file kredensial untuk user prabs
htpasswd -b -c /etc/apache2/.htpasswd prabs 'pakar_pinter_jadi_gob***'

# Menyiapkan direktori dan file dokumen rahasia lokal
mkdir -p /var/www/html/admin
echo "Ini dokumen rahasia sindikat di Penny" > /var/www/html/admin/index.html

# Memperbarui konfigurasi VirtualHost untuk Basic Auth & Pengecualian Proxy
nano /etc/apache2/sites-available/000-default.conf
# ==========================================
# ISI NANO PENNY (Soal 12):
# ==========================================
<VirtualHost *:80>
    # Aturan Basic Auth untuk path /admin
    <Location "/admin">
        AuthType Basic
        AuthName "Ruang Rahasia Sindikat"
        AuthUserFile /etc/apache2/.htpasswd
        Require valid-user
    </Location>

    # Pengecualian agar /admin tidak di-proxy ke backend
    ProxyPass /admin !

    # Konfigurasi Load Balancer dari Soal 11
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
# 2. PENGUJIAN DI NODE ROOTKIT (CLIENT)
# ==========================================
# Test 1: Mengakses /admin tanpa kredensial (Seharusnya ditolak / 401 Unauthorized)[cite: 21]
curl http://10.87.4.2/admin/

# Test 2: Mengakses /admin dengan kredensial prabs (Seharusnya berhasil masuk)[cite: 21]
curl -u prabs:'pakar_pinter_jadi_gob***' http://10.87.4.2/admin/
