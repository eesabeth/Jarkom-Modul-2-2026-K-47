# node prab
nano /etc/bind/named.conf.local
# add
zone "87.10.in-addr.arpa" {
    type master;
    file "/etc/bind/rev.87.10";
    allow-transfer { 10.87.5.3; };
};

nano /etc/bind/rev.87.10
$TTL    604800
@       IN      SOA     prab.k47.com. admin.k47.com. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
@       IN      NS      prab.k47.com.
@       IN      NS      tedd.k47.com.

; Format: oktet_ke4.oktet_ke3 IN PTR hostname.
2.3     IN      PTR     abbey.k47.com.
2.4     IN      PTR     penny.k47.com.
4.5     IN      PTR     vault.k47.com.
5.5     IN      PTR     vault.k47.com.
6.5     IN      PTR     core.k47.com.
7.5     IN      PTR     core.k47.com.

# tedd
nano /etc/bind/named.conf.local
# add
zone "87.10.in-addr.arpa" {
    type slave;
    masters { 10.87.5.2; };
    file "/var/lib/bind/rev.87.10";
};

# prab
pkill named
named -u bind &

# tedd
pkill named
named -u bind &

# tes di node client (alpha & delta)
dig @10.87.5.2 -x 10.87.3.2
dig @10.87.5.2 -x 10.87.5.4
