# Networking
## Commands
| Command | Description |
| ---| --- |
| ping | classic ping command |
| dig | query DNS server |
| ip | modify IP addresses and get ip and routing info |
| tcpdump | low level packet dump |
---

## Tasks
### 1. Display the current ip configuration
**`ip a`**  
```
dkofler@ibk-tr-deb00:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: ens192: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:50:56:93:32:5a brd ff:ff:ff:ff:ff:ff
    inet 172.24.87.100/24 brd 172.24.87.255 scope global ens192
       valid_lft forever preferred_lft forever
    inet6 fe80::250:56ff:fe93:325a/64 scope link 
       valid_lft forever preferred_lft forever
```

### 2. Display the networking config file
**`sudo cat /etc/netplan/50-cloud-init.yaml`** 
```
dkofler@ibk-tr-deb00:~$ sudo cat /etc/netplan/50-cloud-init.yaml
network:
  version: 2
  ethernets:
    ens5:
      match:
        macaddress: "0a:72:01:92:3a:05"
      dhcp4: true
      dhcp6: false
      set-name: "ens5"
```

### 3. Display the DNS config file
**`cat /etc/resolv.conf`** 
```
dkofler@ibk-tr-deb00:~$ cat /etc/resolv.conf 
nameserver 127.0.0.53
options edns0 trust-ad
search eu-west-1.compute.internal
```

### 4. Ping a server thats located outside the network to check DNS resolution
**`ping mail.kofler.sh`**

### 5. Change the resolv.conf file to use a differnt nameserver
```
nameserver 12.34.56.78
options edns0 trust-ad
search eu-west-1.compute.internal
```

### 6. Try to ping the server again
### 7. Add an entry to the /etc/hosts file
```
127.0.0.1 localhost
198.54.122.136 mail.kofler.sh
# Splunk host and HEC endpoint
10.42.22.30 splunk.lab.local
10.42.22.30 hec.lab.local
# Local lab DNS resolution
10.42.22.13 lab013
```
### 8. Try to ping the server again
### 9. Use dig to query a public DNS server
**`dig nts.eu @1.1.1.1 +short`**

### 10. Display the current routes
**`ip route`**
```
dkofler@ibk-tr-deb00:~$ ip route
default via 10.42.22.1 dev ens5 proto dhcp src 10.42.22.13 metric 100
10.42.22.0/26 dev ens5 proto kernel scope link src 10.42.22.13 metric 100
10.42.22.1 dev ens5 proto dhcp scope link src 10.42.22.13 metric 100
10.42.22.2 dev ens5 proto dhcp scope link src 10.42.22.13 metric 100
```

### 11. Display the route to the IP 8.8.8.8
**`ip route get 8.8.8.8`**
```
dkofler@ibk-tr-deb00:~$ ip route get 8.8.8.8
8.8.8.8 via 10.42.22.1 dev ens5 src 10.42.22.13 uid 1001
```

### 12. Change the nameserver to the correct IP in resolv.conf
### 13. Start up tcpdump and display network traffic
**`sudo tcpdump -n not port 22`**
```
dkofler@ibk-tr-deb00:~$ sudo tcpdump -n not port 22
listening on ens5, link-type EN10MB (Ethernet), snapshot length 262144 bytes
19:58:01.025209 IP 10.42.22.13.40298 > 10.42.22.30.80: Flags [S], seq 3596091802, win 62727, options [mss 8961,sackOK,TS val 3376401305 ecr 0,nop,wscale 7], length 0
19:58:01.025460 IP 10.42.22.30.80 > 10.42.22.13.40298: Flags [S.], seq 179022929, ack 3596091803, win 62293, options [mss 8911,sackOK,TS val 3122305912 ecr 3376401305,nop,wscale 7], length 0
19:58:01.025483 IP 10.42.22.13.40298 > 10.42.22.30.80: Flags [.], ack 1, win 491, options [nop,nop,TS val 3376401305 ecr 3122305912], length 0
19:58:01.025648 IP 10.42.22.13.40298 > 10.42.22.30.80: Flags [P.], seq 1:344, ack 1, win 491, options [nop,nop,TS val 3376401306 ecr 3122305912], length 343: HTTP: POST /services/collector HTTP/1.1
19:58:01.025667 IP 10.42.22.13.40298 > 10.42.22.30.80: Flags [P.], seq 344:706, ack 1, win 491, options [nop,nop,TS val 3376401306 ecr 3122305912], length 362: HTTP
19:58:01.025833 IP 10.42.22.30.80 > 10.42.22.13.40298: Flags [.], ack 344, win 484, options [nop,nop,TS val 3122305912 ecr 3376401306], length 0
19:58:01.025833 IP 10.42.22.30.80 > 10.42.22.13.40298: Flags [.], ack 706, win 482, options [nop,nop,TS val 3122305912 ecr 3376401306], length 0
```