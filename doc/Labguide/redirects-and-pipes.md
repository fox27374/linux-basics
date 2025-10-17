# Redirects and pipes
## Commands
| Command | Description |
| ---| --- |
| grep | filter lines containing a string |
| cut | filter columns depending on the delimiter |
| sort | sort based on options |
| uniq | remove duplicates from a sorted list |
| find | find files and directories |
---

## Tasks
### 1. Delete non existent file and redirect error
**`rm file10`**  
**`rm file10 2> error.txt`**
```
dkofler@ibk-tr-deb01:~$ rm file10
rm: cannot remove 'file10': No such file or directory
dkofler@ibk-tr-deb01:~$ rm file10 2> error.txt
dkofler@ibk-tr-deb01:~$ cat error.txt 
rm: cannot remove 'file10': No such file or directory
```

### 2. Redirect errors to /dev/null
**`mv /etc /test 2> /dev/null`**  

```
dkofler@ibk-tr-deb01:~$ mv /etc /test
mv: cannot move '/etc' to '/test': Permission denied
dkofler@ibk-tr-deb01:~$ mv /etc /test 2> /dev/null
```

### 3. Redirect STDOUT and STDERR to different files
**`rm file42 file33 file1201 > file.log 2> file.err`**  

```
dkofler@ibk-tr-deb01:~$ rm file42 file33 file1201 > file.log 2> file.err
rm: cannot remove 'file42': No such file or directory
rm: cannot remove 'file33': No such file or directory
rm: cannot remove 'file1201': No such file or directory
```

### 4. search all lines containing "zsh" using grep
**`cat /var/log/dpkg.log | grep zsh`**  

### 5. filter the result and exclude "status" using grep
**`cat /var/log/dpkg.log | grep zsh | grep -v status`**  

### 6. Display one line before and after the search result
**`cat /var/log/dpkg.log | grep -C1 'configure zsh'`**

### 7. Remove duplicates from a sorted list
**`cat /var/log/dpkg.log | cut -d ' ' -f 3 | sort | uniq`**

### 8. Find all .conf files in /etc
**`find /etc -maxdepth 1 -name '*.conf'`**
```
dkofler@ibk-tr-deb00:~$ find /etc -maxdepth 1 -name '*.conf'
/etc/discover-modprobe.conf
/etc/resolv.conf
/etc/debconf.conf
/etc/ld.so.conf
/etc/host.conf
/etc/reportbug.conf
/etc/kernel-img.conf
/etc/hdparm.conf
/etc/pam.conf
/etc/xattr.conf
/etc/rsyslog.conf
/etc/deluser.conf
/etc/libaudit.conf
/etc/ucf.conf
/etc/mke2fs.conf
/etc/logrotate.conf
/etc/ca-certificates.conf
/etc/gai.conf
/etc/sysctl.conf
/etc/adduser.conf
/etc/nsswitch.conf
/etc/fuse.conf
```
### 9. Find all .log files in /var/log of the type file
**`find /var/log/ -type f -name '*.log' 2> /dev/null`**
```
dkofler@ibk-tr-deb00:~$ find /var/log/ -type f -name '*.log' 2> /dev/null
/var/log/cloud-init.log
/var/log/apt/term.log
/var/log/apt/history.log
/var/log/apport.log
/var/log/alternatives.log
/var/log/landscape/sysinfo.log
/var/log/auth.log
/var/log/dpkg.log
/var/log/cloud-init-output.log
/var/log/kern.log
```