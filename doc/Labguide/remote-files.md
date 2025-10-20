# Remote Files
## Commands
| Command | Description |
| ---| --- |
| dd | convert and copy a file |
| scp | copy remote files |
---

## Tasks
### 1. Create a file called labXX and fill it with random data
**`openssl rand -base64 5000 > labXX`**  

### 2. Add your name to the end of the file
**`echo -e '\n\n<YOUR NAME>' >> labXX`**

### 3. Check if the name was added correctly
### 4. Check the filesize of the new file
### 5. Copy the file to the home folder of the remote system (labYY)
Username: remoteuser  
Password: remoteuser  
**`scp labXX remoteuser@labYY:~`** 

### 6. Copy the file of one of your lab colleagues to your home directory
Username: remoteuser  
Password: remoteuser
ZZ is the student number of one of your lab colleagues  
**`scp remoteuser@labYY:labZZ .`** 

### 7. Check the filesize of the copied file
### 8. Check the name of your colleague in the file
