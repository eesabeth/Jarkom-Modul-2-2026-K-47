# prab
nano /etc/bind/db.k47.com
 #add
 ; A Record Multipel (Round Robin)
vault   IN      A       10.87.5.4
vault   IN      A       10.87.5.5
core    IN      A       10.87.5.6
core    IN      A       10.87.5.7

; CNAME (Alias)
www     IN      CNAME   penny
static  IN      CNAME   abbey

# tedd
nano /etc/bind/db.k47.com
 #add
 ; A Record Multipel (Round Robin)
vault   IN      A       10.87.5.4
vault   IN      A       10.87.5.5
core    IN      A       10.87.5.6
core    IN      A       10.87.5.7

; CNAME (Alias)
www     IN      CNAME   penny
static  IN      CNAME   abbey

# coba 2 node (alpha & delta)
ping vault.k47.com
ping core.k47.com
ping www.k47.com
ping static.k47.com
