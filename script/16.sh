# Rekap Konfigurasi Praktikum Modul 2 - Soal 16 (Stress Test ApacheBench)
# ====================================================================

# ==========================================
# 1. NODE ALPHA / ROOTKIT (CLIENT)
# ==========================================

# Mengupdate sistem dan menginstal paket apache2-utils (yang berisi tool 'ab' / ApacheBench)
apt update && apt install apache2-utils -y

# ------------------------------------------
# PENGUJIAN 1: Titik akhir www.xxx.com
# ------------------------------------------
# Melakukan stress test dengan total 250 request dan tingkat konkurensi 10
ab -n 250 -c 10 http://www.xxx.com/
# (Ambil screenshot hasil eksekusi perintah ini sebagai bukti laporan)

# ------------------------------------------
# PENGUJIAN 2: Titik akhir static.xxx.com
# ------------------------------------------
# Melakukan stress test dengan total 250 request dan tingkat konkurensi 10
ab -n 250 -c 10 http://static.xxx.com/
# (Ambil screenshot hasil eksekusi perintah ini sebagai bukti laporan)
