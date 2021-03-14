# Pipes and commands
## Commands
Use the following commands to navigate through the filesystem:

| Command | Description |
| ---| --- |
| tee | write STDOUT to file |
| grep | filter lines containing a string |
| cut | filter columns depending on the delimiter |
| tr | translate characters |
| wc | count words, lines or characters |
| sort | sort based on options |
| uniq | remove duplicates from a sorted list |
| sed | edit filestream based on regex |
---

## Tasks
### Delete non existent file and redirect error
**`rm file10`**  
**`rm file10 2> error.txt`**
```
dkofler@ibk-tr-deb01:~$ rm file10
rm: cannot remove 'file10': No such file or directory
dkofler@ibk-tr-deb01:~$ rm file10 2> error.txt
dkofler@ibk-tr-deb01:~$ cat error.txt 
rm: cannot remove 'file10': No such file or directory
```

### Redirect errors to /dev/null
**`mv /etc /test 2> /dev/null`**  

```
dkofler@ibk-tr-deb01:~$ mv /etc /test
mv: cannot move '/etc' to '/test': Permission denied
dkofler@ibk-tr-deb01:~$ mv /etc /test 2> /dev/null
```

### Compine STDOUT and STDERR to filter the result
**`rm file42 file33 file1201 | grep file42`**  
**`rm file42 file33 file1201 2>&1 | grep file42`**

```
dkofler@ibk-tr-deb01:~$ rm file42 file33 file1201 | grep file42
rm: cannot remove 'file42': No such file or directory
rm: cannot remove 'file33': No such file or directory
rm: cannot remove 'file1201': No such file or directory

dkofler@ibk-tr-deb01:~$ rm file42 file33 file1201 2>&1 | grep file42
rm: cannot remove 'file42': No such file or directory
```

### Use tee to create a logfile
**`ping blog.dot11.org | tee ping.log`**  

```
dkofler@ibk-tr-deb01:~$ mv /etc /test
mv: cannot move '/etc' to '/test': Permission denied
dkofler@ibk-tr-deb01:~$ mv /etc /test 2> /dev/null
```

### search all lines containing "curl" using grep
**`cat /var/log/dpkg.log | grep curl`**  

### filter the result and exclude "status" using grep
**`cat /var/log/dpkg.log | grep curl | grep -v status`**  

### search all lines containing "curl" using grep
**`cat /var/log/dpkg.log | grep curl`**

### Display one line before and after the search result
**`cat /var/log/dpkg.log | grep -C1 'configure curl'`**

### Display the fields 1 and 3 of /etc/passwd using cut
**`cat /etc/passwd | cut -d : -f 1,3'`**

### Display only field 1 /proc/cpuinfo
**`cat /proc/cpuinfo | cut -f 1`**

### Translate all 'e' to 'E'
**`cat /etc/ssh/ssh_config  | tr e E`**

### Translate everything to uppercase
**`cat /etc/ssh/sshd_config  | tr [a-z] [A-Z]`**

### Translate all newlines into spaces
**`cat .bashrc  | tr '\n' ' '`**

### Count all lines, words and characters in a file
**`cat .bashrc  | wc -l`**  
**`cat .bashrc  | wc -w`**  
**`cat .bashrc  | wc -c`**

### Sort the output alphabetically
**`cat /etc/passwd | sort`**

### Remove duplicates from a sorted list
**`cat /var/log/dpkg.log | cut -d ' ' -f 3 | sort | uniq`**

### Change ip address in a config file using sed
**`cat /etc/resolv.conf | sed 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/127.0.0.1/g'`**
```
dkofler@ibk-tr-deb01:~$ cat /etc/resolv.conf
domain NTSLAB.loc
search NTSLAB.loc
nameserver 172.24.85.10
nameserver 172.24.85.10
dkofler@ibk-tr-deb01:~$ cat /etc/resolv.conf | sed 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/127.0.0.1/g'
domain NTSLAB.loc
search NTSLAB.loc
nameserver 127.0.0.1
nameserver 127.0.0.1
```