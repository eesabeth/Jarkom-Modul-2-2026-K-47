# Rekap Konfigurasi Praktikum Modul 2 - Soal 19 (DNS CNAME & Forwarder Rekursif)
# ==============================================================================

# ==========================================
# 1. NODE PRAB (DNS MASTER - 10.87.5.2)
# ==========================================
# Mengonfigurasi opsi global BIND9 untuk mengaktifkan rekursi dan forwarder eksternal
nano /etc/bind/named.conf.options
# ==========================================
# ISI NANO PRAB (/etc/bind/named.conf.options):
# ==========================================
options {
    directory "/var/cache/bind";

    recursion yes;
    allow-query { any; };
    allow-recursion { any; };

    forwarders {
        8.8.8.8;
        1.1.1.1;
    };

    dnssec-validation auto;
    listen-on { any; };
};

# Membuka file database zona master untuk menambahkan CNAME record
nano /etc/bind/db.xxx.com
# ==========================================
# ISI NANO PRAB (/etc/bind/db.xxx.com):
# ==========================================
$TTL    15
@       IN  SOA ns.xxx.com. root.xxx.com. (
                    2026100110  ; Serial (naikkan angkanya)
                15          ; Refresh
                5           ; Retry
                604800      ; Expire
                15 )        ; Negative Cache TTL

@       IN  NS  ns.xxx.com.
ns      IN  A   10.87.5.2

abbey   IN  A   192.168.99.99

# Menambahkan CNAME record menuju domain eksternal badssl
outbound IN CNAME http.badssl.com.

alpha   IN  TXT "alpha"
beta    IN  TXT "beta"
gamma   IN  TXT "gamma"
delta   IN  TXT "delta"
epsilon IN  TXT "epsilon"

# Melakukan restart penuh layanan DNS di Prab agar opsi global dan zona termuat
service named restart


# ==========================================
# 2. NODE TEDD (DNS SLAVE - 10.87.5.3)
# ==========================================
# Memuat ulang layanan DNS di node slave untuk menyinkronkan zona terbaru
rndc reload


# ==========================================
# 3. NODE ALPHA (KLIEN / PENGUJIAN)
# ==========================================
# Menguji resolusi DNS untuk CNAME record outbound.xxx.com
dig outbound.xxx.com @10.87.5.2

# Menguji resolusi domain eksternal melalui server DNS internal
dig http.badssl.com @10.87.5.2

# Menguji akses konten halaman eksternal melalui CNAME internal menggunakan curl
curl -L http://outbound.xxx.com
