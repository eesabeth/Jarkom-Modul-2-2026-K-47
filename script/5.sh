# buka node prab
nano /etc/bind/db.k47.com
# tambahkan
rootkit  IN      A       10.87.1.1   
alpha    IN      A       10.87.1.2
beta     IN      A       10.87.1.3
gamma    IN      A       10.87.1.4
delta    IN      A       10.87.2.2
epsilon  IN      A       10.87.2.3
abbey    IN      A       10.87.3.2
penny    IN      A       10.87.4.2
obladi   IN      A       10.87.5.4
desmond  IN      A       10.87.5.5
oblada   IN      A       10.87.5.6
molly    IN      A       10.87.5.7

nano /etc/bind/db.k47.com
# ganti serial number -> 4

# node prab
named

# node tedd
pkill named
named

# tes di node mana saja
ping alpha.k47.com
ping beta.k47.com
ping molly.k47.com

