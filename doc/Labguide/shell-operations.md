# Shell operations
## Commands
| Command | Description |
| ---| --- |
| echo | display passed arguments |
| type | test if internal or external command |
| which | search for binaries in the path variable |
| alias | create an alias for a command |
| ; | execute commands sequentially |
| & | send command to background |
| && | logical AND |
| \|\| | logical OR |
| # | shell comment |
| \\ | escaping, end of line |
---

## Tasks
### 1. Check the path variable for commands
**`which cd cat ls`**
```
dkofler@ibk-tr-deb01:~$ which cd cat ls
/usr/bin/cat
/usr/bin/ls
```

### 2. Create an alias for the ls -lh command
**`alias ll='ls -lh'`**  
**`ll'`**
```
dkofler@ibk-tr-deb01:~$ ll
total 40K
-rw-r--r-- 1 dkofler dkofler 1.3K Mar 11 13:53 cert.txt
-rw-r--r-- 1 dkofler dkofler   32 Mar 11 16:58 content.txt
-rw-r--r-- 1 dkofler dkofler   32 Mar 11 17:00 copy.txt
-rw-r--r-- 1 dkofler dkofler   13 Mar 11 16:44 daniel.txt
drwxr-xr-x 2 dkofler dkofler 4.0K Mar  7 21:12 dir3
drwxr-xr-x 2 dkofler dkofler 4.0K Mar  7 21:16 dir-renamed
```

### 3. Combine commands in one line
**`echo Hello > file1.txt; echo Hello2 >> file1.txt; cat file1.txt; rm file1.txt`**
```
dkofler@ibk-tr-deb01:~$ echo Hello > file1.txt; echo Hello2 >> file1.txt; cat file1.txt; rm file1.txt
Hello
Hello2
```

### 4. Start a command and send it to the background
**`ping -c 4 -i 7 blog.dot11.org &`**

### 5. Combine commands with a logical AND
**`sleep 5 && ping -c 3 www.google.at`**

### 6. Produce an error so that the 2nd command is not executed
**`sleep F && ping -c 3 www.google.at`**

### 7. Combine commands with a logical OR
**`cat daniel.txt || ls -l`**
```
dkofler@ibk-tr-deb01:~$ cat daniel.txt || ls -l
cat: daniel.txt: No such file or directory
total 40
-rw-r--r-- 1 dkofler dkofler 1289 Mar 11 13:53 cert.txt
-rw-r--r-- 1 dkofler dkofler   32 Mar 11 16:58 content.txt
-rw-r--r-- 1 dkofler dkofler   32 Mar 11 17:00 copy.txt
drwxr-xr-x 2 dkofler dkofler 4096 Mar  7 21:12 dir3
```

### 8. Combine the two logical operators
**`touch file1`**  
**`rm file1 && echo It worked! || echo It failed!`**  
```
dkofler@ibk-tr-deb01:~$ touch file1
dkofler@ibk-tr-deb01:~$ rm file1 && echo It worked! || echo It failed!
It worked!
```
**`rm file1 && echo It worked! || echo It failed!`**
```
dkofler@ibk-tr-deb01:~$ rm file1 && echo It worked! || echo It failed!
rm: cannot remove 'file1': No such file or directory
It failed!
```

### 9. Escape the special characters we used before
**`echo Lets print an ampersand \&\; Then print some other chars like \|, \' and \<.`**
```
dkofler@ibk-tr-deb01:~$ echo Lets print an ampersand \&\; Then print some other chars like \|, \' and \<.
Lets print an ampersand &; Then print some other chars like |, ' and <.
```

### 10. Multilines
**`echo This is a very long command \`**  
**`thats why we split it into \`**  
**`three lines`**
```
dkofler@ibk-tr-deb01:~$ echo This is a very long command \
> thats why we split it into \
> three lines
This is a very long command thats why we split it into three lines
```

### 11. Print your current shell
**`echo $SHELL`**
```
dkofler@ibk-tr-deb01:~$ echo $SHELL
/bin/bash
```

### 12. Combine variables
**`echo This is $USER on $HOSTNAME and I am using $SHELL. My ID is $UID and currently in $PWD`**
```
dkofler@ibk-tr-deb01:~$ echo This is $USER on $HOSTNAME and I am using $SHELL. My ID is $UID and currently in $PWD
This is dkofler on ibk-tr-deb01 and I am using /bin/bash. My ID is 1000 and currently in /home/dkofler
```

### 13. Variables are case sensitive
**`echo Hostname: $HOSTNAME`**  
**`echo Hostname: $hostname`**
```
dkofler@ibk-tr-deb01:~$ echo Hostname: $HOSTNAME
Hostname: ibk-tr-deb01
dkofler@ibk-tr-deb01:~$ echo Hostname $hostname
Hostname
```

### 14. Embedd commands
**`echo The kernel version is $(uname -r)`**
```
dkofler@ibk-tr-deb01:~$ echo The kernel version is $(uname -r)
The kernel version is 4.19.0-14-amd64
```

**`echo The OS version is $(cat /etc/debian_version)`**
```
dkofler@ibk-tr-deb01:~$ echo The OS version is $(cat /etc/debian_version)
The OS version is 10.8
```

### 15. Repeat the last command
**`cat /etc/os-release | grep PRETTY`**  
**`!!`**
```
dkofler@ibk-tr-deb01:~$ !!
cat /etc/os-release | grep PRETTY
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
```

### 16. Repeat the last command starting with "to"
**`!to`**  
```
dkofler@ibk-tr-deb01:~$ !to
touch file1
```

### 17. Show the last 10 history entries
**`history 10`**  
```
dkofler@ibk-tr-deb01:~$ history 10
  541  echo $myvar2
  542  env -i echo $myvar2
  543  env -i bash -c echo $myvar2
  544  env | grep myvar
  545  cat /etc/os-release | grep DEBIAN
  546  cat /etc/os-release
  547  cat /etc/os-release | grep NAME
  548  cat /etc/os-release | grep PRETTY
  549  touch file1
  550  history 10
```

### 18. Execute the command number n
**`!545`**  
```
dkofler@ibk-tr-deb01:~$ !545
cat /etc/os-release | grep DEBIAN
```

### 19. Search the history for the last command containing a word
**`CTRL+r`**  
**`ip`**
```
(reverse-i-search)`ip': ip address show dev ens192 | grep -w 'inet' | awk '{print $2}' # Get IP of ens192
dkofler@ibk-tr-deb01:~$ ip address show dev ens192 | grep -w 'inet' | awk '{print $2}' # Get IP of ens192
172.24.88.112/24
```

### 20. Prevent a command from being recorded in the history (space before the command)
**`echo Password is abcdef`**  
&nbsp;**` echo Password is ghijkl`**  
**`history 3`**
```
dkofler@ibk-tr-deb01:~$ history 3
  555  ip address show dev ens192 | grep -w 'inet' | awk '{print $2}' # Get IP of ens192
  556  echo Password is abcdef
  557  history 3
```
