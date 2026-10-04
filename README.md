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

### Soal 3 (Elisabeth)

### Soal 4 (Elisabeth)

### Soal 5 (Elisabeth)

### Soal 6 (Elisabeth)

### Soal 7 (Elisabeth)

### Soal 8 (Elisabeth)

### Soal 9 (Elisabeth)

### Soal 10 (Elisabeth)
