# di node obladi & desmond
apt-get update
apt-get install apache2 -y

mkdir -p /var/www/html/arsip
touch /var/www/html/arsip/dokumen_penting.pdf
touch /var/www/html/arsip/catatan.txt

ls -la /var/www/html/arsip/ # cek ada index.html atau ga

service apache2 start # menjalankan web server
# Pesan peringatan apache2AH00558: apache2: Could not reliably determine the server's fully qualified domain name itu bukanlah sebuah error yang menyebabkan kegagalan, melainkan hanya sekadar notifikasi standar dari Apache

# lanjut ke verifikasi
# alpha & node lainnya
curl http://vault.k47.com/arsip/

# cek load balancing sudah jalan atau belum
for i in {1..6}; do dig +short vault.k47.com; sleep 1; done
ping -c 1 vault.k47.com  