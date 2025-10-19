# Processes
## Commands
| Command | Description |
| ---| --- |
| systemctl| start / stop / status of processes |
| ps | list all running processes |
| kill | send a termination signal to a process |
| ss | show open ports and network connections |
---

## Tasks
### 1. Show the systemctl status
**`sudo systemctl status`**  

### 2. Show the sshd status
**`sudo systemctl status ssh`**  

### 3. Show all enabled services
**`sudo systemctl list-unit-files --type=service --state=enabled`**  

### 4. Restart the ssh service
**`sudo systemctl restart ssh`**  

### 5. Disable the open-vm-tools.service service
**`sudo systemctl disable open-vm-tools.service`**

### 6. Enable the service
**`sudo systemctl enable open-vm-tools.service`**

### 7. Show all running processes
**`ps aux`**

### 8. Remove the ones that have a '[' in the cmd
**`ps aux | grep -v '\['`**
```
dkofler@ibk-tr-deb12:~$ ps aux | grep -v '\['
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
polkitd    13358  0.0  0.2 308164  8016 ?        Ssl  11:39   0:00 /usr/lib/polkit-1/polkitd --no-debug
root       13386  0.0  0.3 391872 12496 ?        Ssl  11:39   0:00 /usr/sbin/ModemManager
otelcol+   14669  0.7  5.3 1629168 208392 ?      Ssl  11:40   0:18 /usr/bin/otelcol-contrib --config=/etc/otelcol-contrib/config.yaml
```

### 9. Create a new process and send it to the background
**`ping -i 2 8.8.8.8 > /dev/null &`**

### 10. Find the ping process in the process list
**`ps aux | grep ping`**

### 11. Kill the process and use the ps command again
**`kill -9 <PID>`**  
**`ps aux | grep ping`**
```
dkofler@ibk-tr-deb12:~$ ps aux | grep ping
dkofler   6427  6026  0 15:13 pts/0    00:00:00 grep ping
[1]+  Killed                  ping 8.8.8.8 > /dev/null
```

### 12. List all tcp/udp ports in listening state
**`sudo ss -tulpn`**
```
dkofler@ibk-tr-deb12:~$ sudo ss -tulpn 
Netid            State             Recv-Q             Send-Q                            Local Address:Port                          Peer Address:Port            Process
udp              UNCONN            0                  0                                     127.0.0.1:323                                0.0.0.0:*                users:(("chronyd",pid=13354,fd=5))
udp              UNCONN            0                  0                                    127.0.0.54:53                                 0.0.0.0:*                users:(("systemd-resolve",pid=4580,fd=16))
udp              UNCONN            0                  0                                 127.0.0.53%lo:53                                 0.0.0.0:*                users:(("systemd-resolve",pid=4580,fd=14))
udp              UNCONN            0                  0                              10.42.22.31%ens5:68                                 0.0.0.0:*                users:(("systemd-network",pid=2634,fd=23))
udp              UNCONN            0                  0                                         [::1]:323                                   [::]:*                users:(("chronyd",pid=13354,fd=6))          
```