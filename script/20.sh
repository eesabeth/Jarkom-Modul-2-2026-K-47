# Rekap Konfigurasi Praktikum Modul 2 - Soal 20 (Autostart Service & Normalisasi Zona)
# ====================================================================================

# ==========================================
# 1. NODE PRAB (DNS MASTER - 10.87.5.2)
# ==========================================
# Mengembalikan A record abbey ke IP asal dan mengabaikan pengujian TTL Soal 18
nano /etc/bind/db.xxx.com
# ==========================================
# ISI NANO PRAB (/etc/bind/db.xxx.com):
# ==========================================
$TTL    86400
@       IN  SOA ns.xxx.com. root.xxx.com. (
                    2026100120  ; Serial (naikkan angkanya)
                3600        ; Refresh
                1800        ; Retry
                604800      ; Expire
                86400 )     ; Negative Cache TTL

@       IN  NS  ns.xxx.com.
ns      IN  A   10.87.5.2

abbey   IN  A   10.87.3.2   ; Dikembalikan ke IP asal

outbound IN CNAME http.badssl.com.

alpha   IN  TXT "alpha"
beta    IN  TXT "beta"
gamma   IN  TXT "gamma"
delta   IN  TXT "delta"
epsilon IN  TXT "epsilon"

# Mengaktifkan autostart layanan BIND9 dan menyalakannya
update-rc.d named defaults
service named start


# ==========================================
# 2. NODE TEDD (DNS SLAVE - 10.87.5.3)
# ==========================================
# Memuat ulang zona agar tersinkronisasi dengan master
rndc reload

# Mengaktifkan autostart layanan BIND9 di slave dan menyalakannya
update-rc.d named defaults
service named start


# ==========================================
# 3. NODE PENNY (APACHE WEB SERVER - 10.87.4.2)
# ==========================================
# Mengatur Apache agar berstatus autostart saat booting dan menyalakannya
update-rc.d apache2 defaults
service apache2 start


# ==========================================
# 4. NODE ABBEY (NGINX WEB SERVER - 10.87.3.2)
# ==========================================
# Mengatur Nginx agar berstatus autostart saat booting dan menyalakannya
update-rc.d nginx defaults
service nginx start
