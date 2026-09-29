# molly & oblada
apt-get update
apt-get install nginx php-fpm -y

mkdir -p /var/www/html
nano /var/www/html/index.php
<h1>Selamat Datang di Berada K-47</h1>
<p>Ini adalah halaman utama website K-47</p>

nano /var/www/html/profil.php
<h1>Halaman Profil Pengguna</h1>
<p>Ini adalah halaman profil K-47.</p>

# Konfigurasi Nginx dan Aturan Rewrite URL 
nano /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm;

    server_name core.k47.com localhost;

    location / {
        # Aturan rewrite agar /profil otomatis mengarah ke /profil.php tanpa menampilkan ekstensi
        try_files $uri $uri/ $uri.php?$args;
    }

    # Konfigurasi agar Nginx bisa mengeksekusi PHP melalui PHP-FPM
    location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }
}

# restart nginx
service php8.4-fpm start
ls -l /run/php/ # opsional ngetest socket php-fpm
service nginx restart

# cek nginx sudah benar atau belum
nginx -t

# panggil di browser atau curl
curl http://core.k47.com/
curl http://core.k47.com/profil