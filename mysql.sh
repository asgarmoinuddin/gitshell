echo -ef "\${color} disabling mysql modules \${coloroff}"
yum module disable mysql -y &>>$log_file

echo -ef "\${color} copying repo file \${coloroff}"
cp mysql.repo /etc/yum/repos.d/mysql.repo

echo -ef "\${color} installing mysql community server \${coloroff}"
yum install mysql-community-server -y &>>$log_file

service_start

mysql_secure_installation --set-root-pass RoboShop@1 &>>$log_file

mysql -uroot -pRoboShop@1 &>>$log_file