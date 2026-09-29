# prab
# instalasi bind9
apt-get update
apt-get install bind9 dnsutils

# atur forwarders
nano /etc/bind/named.conf.options
options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };
};

# deklarasi zona file local
nano /etc/bind/named.conf.local
zone "k47.com" {
    type master;
    file "/etc/bind/db.k47.com";
    allow-transfer { 10.87.5.3; };
    notify yes;
};

# buat file zona record DNS
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

# restart
named

# cek keberhasilan di node client (alpha)
ping prab.k47.com

# deklarasi zona slave (tedd)
nano /etc/bind/named.conf.local
zone "k47.com" {
    type slave;
    masters { 10.87.5.2; };
    file "/var/cache/bind/db.k47.com";
};

# restart
named

# tes ping di alpha
ping k47.com
ping tedd.k47.com
host k47.com 10.87.5.3

# update file resolv di tiap node
up echo -e "nameserver 10.87.5.2\nnameserver 10.87.5.3\nnameserver 192.168.122.1" > /etc/resolv.conf

named # di tedd & prab

# tes ping di 1 node per area
ping k47.com
ping tedd.k47.com
host k47.com 10.87.5.3

