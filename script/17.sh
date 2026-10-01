# Rekap Konfigurasi Praktikum Modul 2 - Soal 17 (TXT Record DNS BIND9)
# ====================================================================

# ==========================================
# 1. NODE PRAB (DNS MASTER SERVER - IP 10.87.5.2)
# ==========================================
# Memastikan paket server BIND9 terinstal
apt update && apt install bind9 -y

# Mendaftarkan zone domain baru di named.conf.local
nano /etc/bind/named.conf.local
# ==========================================
# ISI NANO NAMED.CONF.LOCAL:
# ==========================================
zone "xxx.com" {
    type master;
    file "/etc/bind/db.xxx.com";
};

# Membuat dan mengisi file database zone untuk domain xxx.com
nano /etc/bind/db.xxx.com
# ==========================================
# ISI NANO DB.XXX.COM (Soal 17):
# ==========================================
$TTL    604800
@       IN  SOA ns.xxx.com. root.xxx.com. (
                        2         ; Serial
                   604800         ; Refresh
                    86400         ; Retry
                   2419200         ; Expire
                   604800 )       ; Negative Cache TTL

@       IN  NS  ns.xxx.com.
ns      IN  A   10.87.5.2

alpha   IN  TXT "alpha"
beta    IN  TXT "beta"
gamma   IN  TXT "gamma"
delta   IN  TXT "delta"
epsilon IN  TXT "epsilon"

# Menerapkan perubahan konfigurasi DNS via rndc
rndc reload


# ==========================================
# 2. NODE ALPHA / KLIEN (PENGUJIAN / TESTING)
# ==========================================
# Uji TXT Record untuk Alpha
dig TXT alpha.xxx.com +short

# Uji TXT Record untuk Beta
dig TXT beta.xxx.com +short

# Uji TXT Record untuk Gamma
dig TXT gamma.xxx.com +short

# Uji TXT Record untuk Delta
dig TXT delta.xxx.com +short

# Uji TXT Record untuk Epsilon
dig TXT epsilon.xxx.com +short
