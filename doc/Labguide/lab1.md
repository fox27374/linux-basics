# Setup an on premises wordpress site
## Commands
Use the following commands to navigate through the filesystem:

| Command | Description |
| --- | --- |
| wget | transfer files from url |
| tar | compress / extract files |
| chmod | modify file / directory permissions |
| ss | show open ports and network connections |
| systemctl | controll processes |
---
## Tasks
## Server 1 ##
### 1. Install apache webserver
**`sudo apt install apache2 apache2-utils`**  

### 2. Check if the webserver is running
**`sudo systemctl status apache2.service`**  

### 3. Check the open ports
**`sudo ss -tlpn | grep apache`**

### 4. Edit the apache config file so that the server listens on port 8080
**`sudo vi /etc/apache2/ports.conf`** 
```
Listen 8080
```

### 5. Edit the default vhost to listens on port 8080
**`sudo vi /etc/apache2/sites-enabled/000-default.conf`** 
And add the SetEnvIf line:
```
<VirtualHost *:8080>
  SetEnvIf X-Forwarded-Proto "^https$" HTTPS
```

### 6. Restart the webserver and check the listening ports (8080)
**`sudo systemctl restart apache2.service`**  
**`sudo ss -tlpn | grep apache`**  

### 7. Check if you can reach the webserver from the internet
**`https://labXX.aws.ntslab.eu`**  

## Server 2 ##
### 1. Install mysql server
**`sudo apt install mysql-server mysql-client`**  

### 2. Configure the server to listen on all IPs
**`sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf`**  
```
bind-address            = 0.0.0.0
mysqlx-bind-address     = 0.0.0.0
```

### 3. Restart the database server and check it its listening to 0.0.0.0
**`sudo ss -tlpn | grep 3306`**  
```
LISTEN 0      151          0.0.0.0:3306       0.0.0.0:*    users:(("mysqld",pid=54655,fd=21))
```

### 4. Start the mysql setup
**`sudo mysql_secure_installation`**  
* VALIDATE PASSWORD COMPONENT: No
* Remove anonymous users: Yes
* Disallow root login remotely: Yes
* Remove test database: Yes
* Reload privilege tables: Yes

### 5. Use the mysql client to create the wordpress database
**`sudo mysql`**  
**`CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;`**  
**`CREATE USER 'wp_user'@'%' IDENTIFIED BY 'your-password';`**  
**`GRANT ALL ON wordpress.* TO 'wp_user'@'%';`**  
**`FLUSH PRIVILEGES;`**  
**`EXIT;`**  

## Server 1 ##
### 1. Stop the webserver
**`sudo systemctl stop apache2.service`**  

### 2. Install additional packages needed for wordpress
**`sudo apt install php php-common php-mysql php-gmp php-curl php-intl php-mbstring php-xmlrpc php-gd php-xml php-cli php-zip php-intl php-zip`**  

### 4. Download the latest wordpress files
**`wget -c http://wordpress.org/latest.tar.gz`**  

### 5. Extract the compressed file
**`tar -xf latest.tar.gz`**  
### 6. Copy the content to the web content directory /var/www/html/

### 7. Change permissions
**`sudo chmod -R 755 /var/www/html/`**  

### 8. Rename the wordpress sample config and delete the default index file
**`cd /var/www/html/`**  
**`sudo mv wp-config-sample.php wp-config.php`**  
**`sudo rm -rf index.html`** 

### 9. Edit the file wp-config.php and set the values for the DB connection
* DB_NAME: wordpress
* DB_USER: wp_user
* DB_PASSWORD: `<wp_user password>`
* DB_HOST: `<Server2 IP>`

### 10. Add the following code to the file (needed because of the reverse proxy)
```sh
if (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
        $_SERVER['HTTPS'] = 'on';
        $_SERVER['SERVER_PORT'] = 443;
}

if (!empty($_SERVER['HTTP_X_FORWARDED_HOST'])) {
        $_SERVER['HTTP_HOST'] = $_SERVER['HTTP_X_FORWARDED_HOST'];
}
```

### 11. Start the webserver
### 12. Check if the website works
### 13. Troubleshooting hints
* sudo journalctl -fu apache2.service
* sudo tail -f /var/log/apache2/access.log or error.log
* sudo ss -tlpn | grep apache
* sudo tcpdump -n port 8080 or 3306

