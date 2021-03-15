# Install custom software
## Commands
Use the following commands to navigate through the filesystem:

| Command | Description |
| --- | --- |
| wget | transfer files from url |
| tar | compress / extract files |


## Tasks
### 1. Download the Splunk UF
This copies a tar file containing software to the directory you are currently in  
**`wget -O splunkforwarder-8.1.2-545206cc9f70-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.1.2&product=universalforwarder&filename=splunkforwarder-8.1.2-545206cc9f70-Linux-x86_64.tgz&wget=true'`**  

### 2. Move the file to the /opt directory
**`sudo mv splunkforwarder-8.1.2-545206cc9f70-Linux-x86_64.tgz /opt/`**  

### 3. Change to the /opt directory

### 4. Extract the package
**`sudo tar -xf splunkforwarder-8.1.2-545206cc9f70-Linux-x86_64.tgz`**  

### 5. Add a user with the following settings
* name: splunk
* uid: 10777
* home directory: /opt/splunkforwarder
* shell: /bin/bash  
[Hint](add-user-hint.md)

### 6. Set the password for the splunk user to 'splunk'
### 7. su to the splunk user and check if you are in the correct directory
### 8. Change to the /opt/splunkforwarder/bin directory
### 9. Execute the command to start splunk
**`./splunk start --accept-license`**  
When asked, provide the following credentials  
* administrator username: admin
* administrator password: admin#splunk

### 10. Check if splunk is running
**`./splunk status`**  

### 11. Stop splunk
**`./splunk stop`**

### 12. Exit the splunk user environment
### 13. As a normal user, change to the /opt/splunkforwarder/bin/ directory

### 14. Execute the following command to start splunk as a systemd process
**`sudo ./splunk enable boot-start -user splunk -systemd-managed 1`**

### 15. Start splunk using systemd
**`sudo systemctl start SplunkForwarder.service`**

### 16. Check the statud of the splunk service
**`sudo systemctl status SplunkForwarder.service`**

### 17. su to the splunk user
### 18. Change to the /opt/splunkforwarder/bin directory
### 19. Execute the command to connect splunk to the depoyment server
**`./splunk set deploy-poll ibk-splunk-dep.ntslab.loc:8089`**  
When asked, provide the admin credentials  
* administrator username: admin
* administrator password: admin#splunk  

### 20. Exit the splunk user environment
### 21. Restart splunk using systemd
**`sudo systemctl restart SplunkForwarder.service`**

### 22. Enable automatic startup of splunk using systemd
**`sudo systemctl enable SplunkForwarder.service`**