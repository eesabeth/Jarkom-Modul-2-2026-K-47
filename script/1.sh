# Konfigurasi Topologi
# Di Rootkit -> add Adapters jadi 6

# Konfigurasi Node
# alpha
auto eth0
iface eth0 inet static
    address 10.87.1.2
    netmask 255.255.255.0
    gateway 10.87.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# beta
auto eth0
iface eth0 inet static
    address 10.87.1.3
    netmask 255.255.255.0
    gateway 10.87.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# gamma
auto eth0
iface eth0 inet static
    address 10.87.1.4
    netmask 255.255.255.0
    gateway 10.87.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# delta
auto eth0
iface eth0 inet static
    address 10.87.2.2
    netmask 255.255.255.0
    gateway 10.87.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# epsilon
auto eth0
iface eth0 inet static
    address 10.87.2.3
    netmask 255.255.255.0
    gateway 10.87.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# abbey
auto eth0
iface eth0 inet static
    address 10.87.3.2
    netmask 255.255.255.0
    gateway 10.87.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# penny
auto eth0
iface eth0 inet static
    address 10.87.4.2
    netmask 255.255.255.0
    gateway 10.87.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# prab
auto eth0
iface eth0 inet static
    address 10.87.5.2
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# tedd
auto eth0
iface eth0 inet static
    address 10.87.5.3
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# obladi
auto eth0
iface eth0 inet static
    address 10.87.5.4
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# desmond
auto eth0
iface eth0 inet static
    address 10.87.5.5
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# oblada
auto eth0
iface eth0 inet static
    address 10.87.5.6
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# molly
auto eth0
iface eth0 inet static
    address 10.87.5.7
    netmask 255.255.255.0
    gateway 10.87.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

