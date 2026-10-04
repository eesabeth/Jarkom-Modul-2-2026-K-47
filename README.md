# Jarkom-Modul-2-2026-K-47

| No | Nama | NRP |
|:---:|---|---|
| 1 | Elisabeth La Satta Sitorus | 5027251039 |
| 2 | Farrel Muhammad Athasyah Enrizy | 5027251100 |

### Soal 1 (Elisabeth & Farrel)
Membuat topologi *The Mesh* dengan **rootkit** sebagai *gateway*.  
<img src="assets/Modul2_1Topologi.png" width="450">

Konfigurasi IP masing-masing entitas:
**rootkit**
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

# Switch 6 
auto eth1
iface eth1 inet static
    address 10.87.1.1
    netmask 255.255.255.0

# Switch 4 
auto eth2
iface eth2 inet static
    address 10.87.3.1
    netmask 255.255.255.0

# Switch 1 
auto eth3
iface eth3 inet static
    address 10.87.5.1
    netmask 255.255.255.0

# Switch 5
auto eth4
iface eth4 inet static
    address 10.87.4.1
    netmask 255.255.255.0

# Switch 7
auto eth5
iface eth5 inet static
    address 10.87.2.1
    netmask 255.255.255.0
```

**alpha**
```
auto eth0
iface eth0 inet static
    address 10.87.1.2
    netmask 255.255.255.0
    gateway 10.87.1.1
```

**beta**
```
auto eth0
iface eth0 inet static
    address 10.87.1.3
    netmask 255.255.255.0
    gateway 10.87.1.1
```

**gamma**
```
auto eth0
iface eth0 inet static
    address 10.87.1.4
    netmask 255.255.255.0
    gateway 10.87.1.1
```

**delta**
```
auto eth0
iface eth0 inet static
    address 10.87.2.2
    netmask 255.255.255.0
    gateway 10.87.2.1
```

**epsilon**
```
auto eth0
iface eth0 inet static
    address 10.87.2.3
    netmask 255.255.255.0
    gateway 10.87.2.1
```
    
**abbey**
```
auto eth0
iface eth0 inet static
    address 10.87.3.2
    netmask 255.255.255.0
    gateway 10.87.3.1
```
    
**penny**
```
auto eth0
iface eth0 inet static
    address 10.87.4.2
    netmask 255.255.255.0
    gateway 10.87.4.1
```

**prab**
```
auto eth0
iface eth0 inet static
    address 10.87.5.2
    netmask 255.255.255.0
    gateway 10.87.5.1
```
    
**tedd**
```
auto eth0
iface eth0 inet static
    address 10.87.5.3
    netmask 255.255.255.0
    gateway 10.87.5.1
```

**obladi**
```
auto eth0
iface eth0 inet static
    address 10.87.5.4
    netmask 255.255.255.0
    gateway 10.87.5.1
```
    
**desmond**
```
auto eth0
iface eth0 inet static
    address 10.87.5.5
    netmask 255.255.255.0
    gateway 10.87.5.1
```

**oblada**
```
auto eth0
iface eth0 inet static
    address 10.87.5.6
    netmask 255.255.255.0
    gateway 10.87.5.1
```
   
**molly**
```
auto eth0
iface eth0 inet static
    address 10.87.5.7
    netmask 255.255.255.0
    gateway 10.87.5.1
  ```

### Soal 2 (Elisabeth)
Kita diminta untuk membuka jalur **rootkit** ke NAT agar bisa mengakses internet publik dengan mengubah konfigurasinya,  
**rootkit**
```
auto eth0
iface eth0 inet dhcp
    up echo 1 > /proc/sys/net/ipv4/ip_forward
    post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```
Lakukan tes `ping 8.8.8.8` atau `ping google.com` di *console* **rootkit**:  
<img src="assets/Modul2_2png.png" width="450">

### Soal 3 (Elisabeth)
Kita diminta untuk membuka jalur tiap entitas non-router ke NAT agar bisa mengakses internet publik dan menambahkan resolver ke 192.168.122.1 dengan mengubah konfigurasinya,  
**alpha**
```
auto eth0
iface eth0 inet static
    address 10.87.1.2
    netmask 255.255.255.0
    gateway 10.87.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**beta**
```
auto eth0
iface eth0 inet static
    address 10.87.1.3
    netmask 255.255.255.0
    gateway 10.87.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**gamma**
```
auto eth0
iface eth0 inet static
    address 10.87.1.4
    netmask 255.255.255.0
    gateway 10.87.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**delta**
```
auto eth0
iface eth0 inet static
    address 10.87.2.2
    netmask 255.255.255.0
    gateway 10.87.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**epsilon**
```
auto eth0
iface eth0 inet static
    address 10.87.2.3
    netmask 255.255.255.0
    gateway 10.87.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**abbey**
```
auto eth0
iface eth0 inet static
    address 10.87.3.2
    netmask 255.255.255.0
    gateway 10.87.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**penny**
```
auto eth0
iface eth0 inet static
    address 10.87.4.2
    netmask 255.255.255.0
    gateway 10.87.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**prab**
```
auto eth0
iface eth0 inet static
    address 10.87.5.2
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**tedd**
```
auto eth0
iface eth0 inet static
    address 10.87.5.3
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**obladi**
```
auto eth0
iface eth0 inet static
    address 10.87.5.4
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**desmond**
```
auto eth0
iface eth0 inet static
    address 10.87.5.5
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

**oblada**
```
auto eth0
iface eth0 inet static
    address 10.87.5.6
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```
   
**molly**
```
auto eth0
iface eth0 inet static
    address 10.87.5.7
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Lakukan tes `ping 8.8.8.8` atau `ping google.com`:  
<img src="assets/Modul2_3.1.png" width="450">  
<img src="assets/Modul2_3.2.png" width="450">  
<img src="assets/Modul2_3.3.png" width="450">

### Soal 4 (Elisabeth)
Pada node **prab**, bangun zona `<xxxx>.com` sebagai *authoritative* dengan SOA yang menunjuk ke `prab.<xxxx>.com`, serta tambahkan catatan NS untuk `prab.<xxxx>.com` dan `tedd.<xxxx>.com`. Buat A record untuk `prab.<xxxx>.com` dan `tedd.<xxxx>.com` yang mengarah ke alamat IP mereka masing-masing, serta A record apex `<xxxx>.com` yang mengarah ke **penny**. Aktifkan fitur *notify* dan *allow-transfer* ke **tedd**, lalu set forwarders ke `192.168.122.1`. Di node **tedd**, tarik zona `<xxxx>.com` dari master dan pastikan server menjawab secara *authoritative*. Perbarui urutan resolver pada seluruh Entitas non-router menjadi: IP prab, IP tedd, lalu 192.168.122.1.

**Node prab & Node tedd**  
Instalasi bind9
```
apt-get update
apt-get install bind9 dnsutils
```
<img src="assets/Modul2_4bind9.png" width="450">

**Node prab**
```
nano /etc/bind/named.conf.options
options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };
};
```

Mendeklarasi zona file local  
```
nano /etc/bind/named.conf.local
zone "k47.com" {
    type master;
    file "/etc/bind/db.k47.com";
    allow-transfer { 10.87.5.3; };
    notify yes;
};
```

Membuat file zona record DNS  
```
nano /etc/bind/db.k47.com
$TTL    604800
@       IN      SOA     prab.k47.com. admin.k47.com. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      prab.k47.com.
@       IN      NS      tedd.k47.com.

prab    IN      A       10.87.5.2
tedd    IN      A       10.87.5.3
@       IN      A       10.87.4.2
```

Restart
```
named
```

Cek keberhasilan di node entitas (alpha)
```
ping prab.k47.com
```

**Node tedd**
Mendeklarasi zona slave (tedd)
```
nano /etc/bind/named.conf.local
zone "k47.com" {
    type slave;
    masters { 10.87.5.2; };
    file "/var/cache/bind/db.k47.com";
};
```
Restart
```
named
```

Tes ping di node entitas (alpha)  
```
ping k47.com
ping tedd.k47.com
host k47.com 10.87.5.3
```

Update konfigurasi tiap node entitas selain **prab** dan **tedd**,  
```
up echo -e "nameserver 10.87.5.2\nnameserver 10.87.5.3\nnameserver 192.168.122.1" > /etc/resolv.conf
```

**Node prab & tedd**
```
named
```

Tes ping kembali di tiap node tiap area,  
```
ping k47.com
ping tedd.k47.com
host k47.com 10.87.5.3
```

<img src="assets/Modul2_4tes1.png" width="450">  
<img src="assets/Modul2_4tes2.png" width="450">  
<img src="assets/Modul2_4tes3.png" width="450">  
<img src="assets/Modul2_4tes4.png" width="450">

### Soal 5 (Elisabeth)

### Soal 6 (Elisabeth)

### Soal 7 (Elisabeth)

### Soal 8 (Elisabeth)

### Soal 9 (Elisabeth)

### Soal 10 (Elisabeth)
