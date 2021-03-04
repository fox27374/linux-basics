# Filesystem
## Commands
Use the following commands to navigate through the filesystem:

| Command | Description |
| ---| --- |
| cd | change directory |
| ls | list directory |
| pwd | print working directory |


## Tasks
### List files in home folder
**`ls`**
```
dkofler@ibk-tr-deb01:~$ ls
dkofler@ibk-tr-deb01:~$
```

### Extend the list output
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

### Show root filesystem
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

### Change to the /var directory
**`cd /var`**

### List files in the /var directory
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

### Change to your home directory
**`cd`**

### Print the working directory
**`pwd`**
```
dkofler@ibk-tr-deb01:~$ pwd
/home/dkofler
```

### Change to the parent directory
**`cd ..`**
```
dkofler@ibk-tr-deb01:~$ cd ..
dkofler@ibk-tr-deb01:/home$ pwd
/home
```

### Change to the /var/cache/apt directory
**`cd /var/cache/apt`**

### Change back to the /home directory
**`cd -`**
```
dkofler@ibk-tr-deb01:/var/cache/apt$ cd -
/home
dkofler@ibk-tr-deb01:/home$
```
