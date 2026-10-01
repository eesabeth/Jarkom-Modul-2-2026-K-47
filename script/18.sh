# Rekap Konfigurasi Praktikum Modul 2 - Soal 18 (DNS Master-Slave & TTL)
# ====================================================================

# ==========================================
# 1. NODE PRAB (DNS MASTER - 10.87.5.2)
# ==========================================
# Membuka file database zone master untuk mengubah TTL ke 15 detik,
# menaikkan serial SOA, dan mengubah A record abbey ke IP fiktif
nano /etc/bind/db.xxx.com
# ==========================================
# ISI NANO PRAB (/etc/bind/db.xxx.com):
# ==========================================
$TTL    15
@       IN  SOA ns.xxx.com. root.xxx.com. (
                    2026100105  ; Serial (dinaikkan secara berkala)
                15          ; Refresh
                5           ; Retry
                604800      ; Expire
                15 )        ; Negative Cache TTL

@       IN  NS  ns.xxx.com.
ns      IN  A   10.87.5.2

abbey   IN  A   192.168.99.99

alpha   IN  TXT "alpha"
beta    IN  TXT "beta"
gamma   IN  TXT "gamma"
delta   IN  TXT "delta"
epsilon IN  TXT "epsilon"

# Muat ulang konfigurasi DNS di Prab setelah disimpan
rndc reload


# ==========================================
# 2. NODE TEDD (DNS SLAVE - 10.87.5.3)
# ==========================================
# Instalasi bind9 jika foldernya belum ada
apt update && apt install bind9 -y

# Mengatur konfigurasi zona slave di Tedd
nano /etc/bind/named.conf.local
# ==========================================
# ISI NANO TEDD (/etc/bind/named.conf.local):
# ==========================================
zone "xxx.com" {
    type slave;
    masters { 10.87.5.2; };
    file "/var/cache/bind/db.xxx.com";
};

# Restart layanan DNS dan muat ulang di Tedd
service named restart
rndc reload


# ==========================================
# 3. NODE ALPHA (KLIEN / PENGUJIAN TTL)
# ==========================================
# Fase 1: Menguji query saat record mengarah ke IP asal (10.87.3.2)
dig abbey.xxx.com +short

# Fase 2: Menguji query saat perubahan baru saja terjadi (< 15 detik)
# (Klien masih membaca IP lama dari cache lokal)
getent hosts abbey.xxx.com

# Fase 3: Menguji query setelah batas waktu TTL habis (> 15 detik)
# (Klien melakukan re-query dan berubah total ke IP fiktif baru)
getent hosts abbey.xxx.com
