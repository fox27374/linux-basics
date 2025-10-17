# Shell operations
## Commands
| Command | Description |
| ---| --- |
| echo | display passed arguments |
| which | search for binaries in the path variable |
| alias | create an alias for a command |
| history | show the command history |
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
**`alias lh='ls -lh'`**  
**`lh'`**
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
**`ping -c 4 -i 7 www.nts.eu > /dev/null &`**

### 5. Combine commands with a logical AND
**`sleep 3 && ping -c 3 www.google.at`**

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
**`ping www.nts.eu -c1 > /dev/null && echo "Website is online" || echo "Website is offline"`**  
```
dkofler@ibk-tr-deb01:~$ ping www.nts.eu -c1 > /dev/null && echo "Website is online" || echo "Website is offline"
Website is online
```
**`ping www.nts1.eu -c1 > /dev/null && echo "Website is online" || echo "Website is offline"`**
```
dkofler@ibk-tr-deb01:~$ ping www.nts1.eu -c1 > /dev/null && echo "Website is online" || echo "Website is offline"
ping: www.nts1.eu: Name or service not known
Website is offline
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
**`echo This is $USER on $HOST and I am using $SHELL. My ID is $UID and currently in $PWD`**
```
dkofler@ibk-tr-deb01:~$ echo This is $USER on $HOST and I am using $SHELL. My ID is $UID and currently in $PWD
This is dkofler on ibk-tr-deb01 and I am using /bin/bash. My ID is 1000 and currently in /home/dkofler
```

### 13. Variables are case sensitive
**`echo Hostname: $HOST`**  
**`echo Hostname: $host`**
```
dkofler@ibk-tr-deb01:~$ echo Hostname: $HOST
Hostname: ibk-tr-deb01
dkofler@ibk-tr-deb01:~$ echo Hostname $host
Hostname
```

### 14. Embedd commands
**`echo The kernel version is $(uname -r)`**
```
dkofler@ibk-tr-deb01:~$ echo The kernel version is $(uname -r)
The kernel version is 4.19.0-14-amd64
```

**`echo The OS release name is $(cat /etc/debian_version)`**
```
dkofler@ibk-tr-deb01:~$ echo The OS release name is $(cat /etc/debian_version)
The OS release name is trixie/sid
```

### 15. Print the command history
**`history`**  
```
dkofler@ibk-tr-deb01:~$ history
  229  uname -r
  230  echo My kernel version is $(uname -r)
  231  cat /etc/debian_version
  232  echo the OS version is $(cat /etc/debian_version)
```

### 16. Repeat the last command
**`cat /etc/os-release | grep PRETTY`**  
**`!!`**
```
dkofler@ibk-tr-deb01:~$ !!
cat /etc/os-release | grep PRETTY
PRETTY_NAME="Ubuntu 24.04.3 LTS"
```

### 17. Repeat the last command starting with "to"
**`!to`**  
```
dkofler@ibk-tr-deb01:~$ !to
touch file1
```

### 18. Show the last 10 history entries
**`history -10`**  
```
dkofler@ibk-tr-deb01:~$ history -10
  235  history
  236  cat /etc/os-release | grep PRETTY
  237  history 10
  238  history 5
  239  man history
  240  man -k history
  241  which history
  242  man omz_history
  243  which omz_history
  244  history -5
```

### 19. Execute the command number n
**`!545`**  
```
dkofler@ibk-tr-deb01:~$ !545
cat /etc/os-release | grep DEBIAN
```

### 20. Search the history for the last command containing a word
**`CTRL+r`**  
**`ip`**
```
(reverse-i-search)`ip': ip address show dev ens192 | grep -w 'inet' | awk '{print $2}' # Get IP of ens192
dkofler@ibk-tr-deb01:~$ ip address show dev ens192 | grep -w 'inet' | awk '{print $2}' # Get IP of ens192
172.24.88.112/24
```

### 21. Prevent a command from being recorded in the history (space before the command)
**`echo Password is abcdef`**  
&nbsp;**` echo Password is ghijkl`**  
**`history 3`**
```
dkofler@ibk-tr-deb01:~$ history 3
  555  ip address show dev ens192 | grep -w 'inet' | awk '{print $2}' # Get IP of ens192
  556  echo Password is abcdef
  557  history 3
```
