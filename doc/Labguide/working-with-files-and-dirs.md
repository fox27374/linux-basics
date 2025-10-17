# Working with files
## Commands
| Command | Description |
| ---| --- |
| file | determine the filetype |
| touch | create an empty file |
| cp | copy |
| mv | move |
| rm | remove |
| cd | change directory |
| ls | list directory |
| pwd | print working directory |
| mkdir | make directory |
| rmdir | remove directory |
| head | display the top lines of a file |
| tail | display the bottom lines of a file |
| cat | concatenate files |
| more | display big files page by page |
| less | like more but interactive |
| echo | display passed arguments |
---

## Tasks
### 1. Check filetypes of different files
**`file /usr/bin/ls`**
```
dkofler@ibk-tr-deb01:~$ file /usr/bin/ls
/usr/bin/ls: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=a65f86cd6394e8f583c14d786d13b3bcbe051b87, stripped
```
**`file /etc/hostname`**
```
dkofler@ibk-tr-deb01:~$ file /etc/hostname 
/etc/hostname: ASCII text
```

**`file /usr/share/pixmaps/debian-logo.png`**
```
dkofler@ibk-tr-deb01:~$ file /usr/share/pixmaps/debian-logo.png
/usr/share/pixmaps/debian-logo.png: PNG image data, 48 x 48, 8-bit/color RGBA, non-interlaced
```

**`file /dev/nvme0n1`**
```
dkofler@ibk-tr-deb01:~$ file /dev/nvme0n1
/dev/nvme0n1: block special (259/0)
```

### 2. Create files with touch
**`touch file1`**  
**`touch file2`**  
**`ls -l`**
```
dkofler@ibk-tr-deb01:~$ touch file1
dkofler@ibk-tr-deb01:~$ touch file2
dkofler@ibk-tr-deb01:~$ ls -l
total 0
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file1
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file2

```

### 3. Create a file with a certain timestamp
**`touch -t 198404021042 file3`**  
**`ls -l`**
```
dkofler@ibk-tr-deb01:~$ ls -l
total 0
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file1
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file2
-rw-r--r-- 1 dkofler dkofler 0 Apr  2  1984 file3
```

### 4. Delete a file
**`rm file1`**  
**`ls -l`**
```
dkofler@ibk-tr-deb01:~$ ls -l
total 0
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file2
-rw-r--r-- 1 dkofler dkofler 0 Apr  2  1984 file3
```

### 5. Delete non-empty directory
**`mkdir dir1`**  
**`touch dir1/file4`**  
**`rm -rf dir1`**
```
dkofler@ibk-tr-deb01:~$ mkdir dir1
dkofler@ibk-tr-deb01:~$ touch dir1/file4
dkofler@ibk-tr-deb01:~$ rmdir dir1
rmdir: failed to remove 'dir1': Directory not empty
dkofler@ibk-tr-deb01:~$ rm -rf dir1
dkofler@ibk-tr-deb01:~$ ls -l
total 0
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file1
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file2
-rw-r--r-- 1 dkofler dkofler 0 Apr  2  1984 file3
```

### 6. Copy a file
**`cp file1 file11`**  
**`ls -l`**
```
dkofler@ibk-tr-deb01:~$ cp file1 file11
dkofler@ibk-tr-deb01:~$ ls -l
total 0
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file1
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 21:06 file11
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 20:51 file2
-rw-r--r-- 1 dkofler dkofler 0 Apr  2  1984 file3
```

### 7. Copy a file to another directory
**`mkdir dir2`**  
**`cp file2 dir2/`**  
**`ls dir2`**
```
dkofler@ibk-tr-deb01:~$ mkdir dir2
dkofler@ibk-tr-deb01:~$ cp file2 dir2/
dkofler@ibk-tr-deb01:~$ ls dir2
file2
```

### 8. Copy a whole directory with files
**`cp -r dir2 dir3`**  
**`ls -l dir3`**
```
dkofler@ibk-tr-deb01:~$ cp -r dir2 dir3
dkofler@ibk-tr-deb01:~$ ls -l dir3
total 0
drwxr-xr-x 2 dkofler dkofler 4096 Oct 11 14:19 dir2
```

### 9. Copy multiple files to a directory
**`cp file1 file11 file3 dir3/`**  
**`ls -l dir3`**
```
dkofler@ibk-tr-deb01:~$ cp file1 file11 file3 dir3/
dkofler@ibk-tr-deb01:~$ ls -l dir3
total 0
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 21:12 file1
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 21:12 file11
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 21:10 file2
-rw-r--r-- 1 dkofler dkofler 0 Mar  7 21:12 file3
```

### 10. Move files to a directory
**`mv file1 dir2/`**  
**`ls`**

```
dkofler@ibk-tr-deb01:~$ ls
dir2  dir3  file1  file11  file2  file3
dkofler@ibk-tr-deb01:~$ mv file1 dir2/
dkofler@ibk-tr-deb01:~$ ls
dir2  dir3  file11  file2  file3
```

### 11. Rename a file or a directory
**`mv file11 file-renamed`**  
**`mv dir2 dir-renamed`**  
**`ls -la`**
```
dkofler@ibk-tr-deb01:~$ mv file11 file-renamed
dkofler@ibk-tr-deb01:~$ ls
dir2  dir3  file2  file3  file-renamed
dkofler@ibk-tr-deb01:~$ mv dir2 dir-renamed
dkofler@ibk-tr-deb01:~$ ls -la
total 32
drwxr-xr-x 4 dkofler dkofler 4096 Mar  7 21:19 .
drwxr-xr-x 3 root    root    4096 Mar  1 17:17 ..
-rw------- 1 dkofler dkofler 1852 Mar  6 19:02 .bash_history
-rw-r--r-- 1 dkofler dkofler  220 Mar  1 17:17 .bash_logout
-rw-r--r-- 1 dkofler dkofler 3526 Mar  1 17:17 .bashrc
drwxr-xr-x 2 dkofler dkofler 4096 Mar  7 21:12 dir3
drwxr-xr-x 2 dkofler dkofler 4096 Mar  7 21:16 dir-renamed
-rw-r--r-- 1 dkofler dkofler    0 Mar  7 20:51 file2
-rw-r--r-- 1 dkofler dkofler    0 Apr  2  1984 file3
-rw-r--r-- 1 dkofler dkofler    0 Mar  7 21:06 file-renamed
-rw-r--r-- 1 dkofler dkofler  807 Mar  1 17:17 .profile
```

### 1. List files in home folder
**`ls`**
```
dkofler@ibk-tr-deb01:~$ ls
dkofler@ibk-tr-deb01:~$
```

### 2. Extend the list output
**`ls -lah`**
```
dkofler@ibk-tr-deb01:~$ ls -lah
total 24K
drwxr-xr-x 2 dkofler dkofler 4.0K Mar  3 12:09 .
drwxr-xr-x 3 root    root    4.0K Mar  1 17:17 ..
-rw------- 1 dkofler dkofler  745 Mar  3 11:41 .bash_history
-rw-r--r-- 1 dkofler dkofler  220 Mar  1 17:17 .bash_logout
-rw-r--r-- 1 dkofler dkofler 3.5K Mar  1 17:17 .bashrc
-rw-r--r-- 1 dkofler dkofler  807 Mar  1 17:17 .profile
```

### 3. Show root filesystem
**`ls -l /`**
```
dkofler@ibk-tr-deb01:~$ ls -l /
total 60
lrwxrwxrwx   1 root root     7 Mar  1 17:11 bin -> usr/bin
drwxr-xr-x   3 root root  4096 Mar  1 17:17 boot
drwxr-xr-x  16 root root  3160 Mar  1 17:18 dev
drwxr-xr-x  71 root root  4096 Mar  3 10:32 etc
drwxr-xr-x   3 root root  4096 Mar  1 17:17 home
lrwxrwxrwx   1 root root    31 Mar  1 17:13 initrd.img -> boot/initrd.img-4.19.0-14-amd64
lrwxrwxrwx   1 root root    31 Mar  1 17:13 initrd.img.old -> boot/initrd.img-4.19.0-14-amd64
lrwxrwxrwx   1 root root     7 Mar  1 17:11 lib -> usr/lib
lrwxrwxrwx   1 root root     9 Mar  1 17:11 lib32 -> usr/lib32
lrwxrwxrwx   1 root root     9 Mar  1 17:11 lib64 -> usr/lib64
lrwxrwxrwx   1 root root    10 Mar  1 17:11 libx32 -> usr/libx32
drwx------   2 root root 16384 Mar  1 17:11 lost+found
drwxr-xr-x   3 root root  4096 Mar  1 17:11 media
drwxr-xr-x   2 root root  4096 Mar  1 17:11 mnt
drwxr-xr-x   2 root root  4096 Mar  1 17:11 opt
dr-xr-xr-x 154 root root     0 Mar  1 17:18 proc
drwx------   2 root root  4096 Mar  3 10:32 root
drwxr-xr-x  16 root root   500 Mar  3 12:08 run
lrwxrwxrwx   1 root root     8 Mar  1 17:11 sbin -> usr/sbin
drwxr-xr-x   2 root root  4096 Mar  1 17:11 srv
dr-xr-xr-x  13 root root     0 Mar  3 10:45 sys
drwxrwxrwt   8 root root  4096 Mar  3 12:19 tmp
drwxr-xr-x  13 root root  4096 Mar  1 17:11 usr
drwxr-xr-x  11 root root  4096 Mar  1 17:11 var
lrwxrwxrwx   1 root root    28 Mar  1 17:13 vmlinuz -> boot/vmlinuz-4.19.0-14-amd64
lrwxrwxrwx   1 root root    28 Mar  1 17:13 vmlinuz.old -> boot/vmlinuz-4.19.0-14-amd64
```

### 4. Use options in a different order
**`cd /usr`**  
**`ls -hl`**
```
dkofler@ibk-tr-deb01:/usr$ ls -hl
total 68K
drwxr-xr-x  2 root root  20K Mar  3 12:19 bin
drwxr-xr-x  2 root root 4.0K Jan 30 18:37 games
drwxr-xr-x  3 root root 4.0K Mar  1 17:23 include
drwxr-xr-x 53 root root 4.0K Mar  1 17:23 lib
drwxr-xr-x  2 root root 4.0K Mar  1 17:11 lib32
drwxr-xr-x  2 root root 4.0K Mar  1 17:12 lib64
drwxr-xr-x  2 root root 4.0K Mar  1 17:11 libx32
drwxr-xr-x 10 root root 4.0K Mar  1 17:11 local
drwxr-xr-x  2 root root  12K Mar  1 17:23 sbin
drwxr-xr-x 85 root root 4.0K Mar  1 17:23 share
drwxr-xr-x  2 root root 4.0K Jan 30 18:37 src
```

### 5. Change to the /var directory
**`cd /var`**

### 6. List files in the /var directory
**`ls -l`**
```
dkofler@ibk-tr-deb01:/var$ ls -l
total 36
drwxr-xr-x  2 root root  4096 Mar  3 06:25 backups
drwxr-xr-x  9 root root  4096 Mar  1 17:18 cache
drwxr-xr-x 25 root root  4096 Mar  1 17:23 lib
drwxrwsr-x  2 root staff 4096 Jan 30 18:37 local
lrwxrwxrwx  1 root root     9 Mar  1 17:11 lock -> /run/lock
drwxr-xr-x  5 root root  4096 Mar  3 00:00 log
drwxrwsr-x  2 root mail  4096 Mar  1 17:11 mail
drwxr-xr-x  2 root root  4096 Mar  1 17:11 opt
lrwxrwxrwx  1 root root     4 Mar  1 17:11 run -> /run
drwxr-xr-x  4 root root  4096 Mar  1 17:12 spool
drwxrwxrwt  3 root root  4096 Mar  3 00:00 tmp
```

### 7. Change to your home directory
**`cd`**

### 8. Print the working directory
**`pwd`**
```
dkofler@ibk-tr-deb01:~$ pwd
/home/dkofler
```

### 9. Change to the parent directory
**`cd ..`**
```
dkofler@ibk-tr-deb01:~$ cd ..
dkofler@ibk-tr-deb01:/home$ pwd
/home
```

### 10. Change to the /var/cache/apt directory
**`cd /var/cache/apt`**

### 11. Change back to the /home directory
**`cd -`**
```
dkofler@ibk-tr-deb01:/var/cache/apt$ cd -
/home
dkofler@ibk-tr-deb01:/home$
```

### 12. Use absolute and relaive paths
**`cd /boot`**
**`ls`**
```
dkofler@ibk-tr-deb01:~$ cd /boot
dkofler@ibk-tr-deb01:/boot$ ls
config-4.19.0-14-amd64  grub  initrd.img-4.19.0-14-amd64  System.map-4.19.0-14-amd64  vmlinuz-4.19.0-14-amd64
```
**`cd /grub`**
```
dkofler@ibk-tr-deb01:/boot$ cd /grub
-bash: cd: /grub: No such file or directory
```
**`cd grub`**
```
dkofler@ibk-tr-deb01:/boot$ cd grub
dkofler@ibk-tr-deb01:/boot/grub$ pwd
/boot/grub
```
### 13. Use tab completion
**`cd /var/ca<TAB>`**

### 14. Use same command with upper case letter
**`cd /var/Ca<TAB>`**

### 15. Create a directory
**`cd`**  
**`mkdir nts`**  
**`ls -l`**
```
dkofler@ibk-tr-deb01:~$ cd
dkofler@ibk-tr-deb01:~$ mkdir nts
dkofler@ibk-tr-deb01:~$ ls -l
total 4
drwxr-xr-x 2 dkofler dkofler 4096 Mar  6 18:39 nts
```

### 16. Create a subdirectory
**`mkdir nts/subdir`**    
**`ls -l nts`**

### 17. Create a new directory with a subdirectory
**`mkdir nts2/subdir2`**  
```
dkofler@ibk-tr-deb01:~$ mkdir nts2/subdir2
mkdir: cannot create directory ‘nts2/subdir2’: No such file or directory
```
### 18. Create a new directory with a subdirectory and the -p option
**`mkdir -p nts2/subdir2`**  
**`ls -l nts2`**
```
dkofler@ibk-tr-deb01:~$ ls -l nts2/
total 4
drwxr-xr-x 2 dkofler dkofler 4096 Mar  6 18:47 subdir2
```

### 19. Delete the subdir directory
**`rmdir nts/subdir`**

### 20. Delete the nts2 directory
**`rmdir nts2`**
```
dkofler@ibk-tr-deb01:~$ rmdir nts2
rmdir: failed to remove 'nts2': Directory not empty
```

### 21. Delete the subdir2 directory with the -p option
**`rmdir -p nts2/subdir2`**

### 1. Display the first lines of a file
**`head -n 5 .zsh_history`**

### 2. Display the last lines of a file
**`tail -15 /etc/services`**
```
dkofler@ibk-tr-deb01:~$ tail -15 /etc/services
sgi-gcd		17003/udp			# SGI Group membership daemon
sgi-cad		17004/tcp			# Cluster Admin daemon
isdnlog		20011/tcp			# isdn logging system
isdnlog		20011/udp
vboxd		20012/tcp			# voice box system
vboxd		20012/udp
binkp		24554/tcp			# binkp fidonet protocol
asp		27374/tcp			# Address Search Protocol
asp		27374/udp
csync2		30865/tcp			# cluster synchronization tool
dircproxy	57000/tcp			# Detachable IRC Proxy
tfido		60177/tcp			# fidonet EMSI over telnet
fido		60179/tcp			# fidonet EMSI over TCP

# Local services
```

### 3. Display the whole content of a file
**`cat /etc/hosts`**
```
dkofler@ibk-tr-deb01:~$ cat /etc/hosts
127.0.0.1 localhost
# Splunk host and HEC endpoint
10.42.22.27 splunk.lab.local
10.42.22.27 hec.lab.local
# Local lab DNS resolution
10.42.22.32 lab032

# The following lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
```

### 4. Concatenate files
**`cat /etc/os-release /etc/resolv.conf`**

### 5. Write something to a file
**`echo "Something important" > important.txt`**  
**`cat important.txt`**
```
dkofler@ibk-tr-deb01:~$ echo "Something important" > important.txt
dkofler@ibk-tr-deb01:~$ cat important.txt 
Something important
```

### 6. Concatenate files into a new file
**`cat /etc/os-release /etc/resolv.conf important.txt > output.txt`**

### 7. Add content to a file
**`cat /proc/cpuinfo >> output.txt`**

### 8. Use cat to add content to a file
**`cat > content.txt`**  
Use CTRL+d to signal the end of file.
```
dkofler@ibk-tr-deb01:~$ cat > content.txt
This is some very cool content!
```

### 9. Use cat copy a file
**`cat content.txt > copy.txt`**

### 10. View a large file page by page
**`more /etc/mime.types`**

### 11. View a large file with less
**`less /etc/locale.gen`**
