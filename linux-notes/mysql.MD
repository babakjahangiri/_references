# MySQL

## Installing MySQL

`$ sudo apt update`

Install the mysql-server package:

`$ sudo apt install mysql-server`

### start | stop | restart the Mysql service

`$ sudo systemctl start mysql.service`

`$ sudo systemctl stop mysql.service`

`$ sudo systemctl restart mysql.service`

## Configuring MySQL

`$ sudo mysql`

`mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`

`mysql> exit`

`mysql> mysql -u root -p`

## Run the security script with sudo:

`$ sudo mysql_secure_installation`

## Creating a Dedicated MySQL User and Granting Privileges

`mysql> CREATE USER 'username'@'host' IDENTIFIED WITH authentication_plugin BY 'password';`

`mysql> CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';`

`mysql>GRANT PRIVILEGE ON database.table TO 'username'@'host';`

### Grant some privilege to a user

`mysql>GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'sammy'@'localhost' WITH GRANT OPTION;`

### Some users may want to grant their MySQL user the ALL PRIVILEGES privilege,

`mysql> GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;`

### It’s good practice to run the FLUSH PRIVILEGES command. This will free up any memory that the server cached as a result of the preceding CREATE USER and GRANT statements

`mysql> FLUSH PRIVILEGES;`

## Testing MySQL

`$ systemctl status mysql.service`

### For an additional check, you can try connecting to the database using the mysqladmin tool, which is a client that lets you run administrative commands. For example, this command says to connect as a MySQL user named sammy (-u sammy), prompt for a password (-p), and return the version. Be sure to change sammy to the name of your dedicated MySQL user, and enter that user’s password when prompted:

`$ sudo mysqladmin -p -u sammy version`

### Open MySql port in firewall

`$ sudo ufw allow 3306`

### If you only plan to access the database server from one specific machine, you can grant that machine exclusive permission to connect to the database remotely with the following command. Make sure to replace remote_IP_address with the actual IP address of the machine you plan to connect with:

`$ sudo ufw allow from remote_IP_address to any port 3306`

### MySql Configuration file path

`$ sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf`

### Uncomment bind address to accept connection

`bind-address = 127.0.0.1`

### bind it to more network like this

`bind-address = 10.0.0.1,10.0.1.1,10.0.2.1`

### Check the hosts that the user you want has access to already. In my case the user is root:

`mysql> SELECT host FROM mysql.user WHERE user = "root";`

`mysql> USE my_database;`
`mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'my-password';`

### Execute query to see current setting of “validate_password” using below command:

`mysql> SHOW VARIABLES LIKE 'validate_password%';`

```
+--------------------------------------+--------+
| Variable_name                        | Value  |
+--------------------------------------+--------+
| validate_password_dictionary_file    |        |
| validate_password_length             | 8      |
| validate_password_mixed_case_count   | 1      |
| validate_password_number_count       | 1      |
| validate_password_policy             | MEDIUM |
| validate_password_special_char_count | 1      |
+--------------------------------------+--------+
6 rows in set (0.01 sec)
```

### If We need to change it to LOW by using the below query:

`mysql> SET GLOBAL validate_password_policy=LOW;`
