source common.sh
echo -e "${color} install redis repos ${coloroff}"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>$log_file

echo -e "${color} enable redis 6 version ${coloroff}"
yum module enable redis:remi-6.2 -y &>>$log_file

echo -e "${color} install redis ${coloroff}"
yum install redis -y &>>$log_file

echo -e "${color} modifying redis conf files ${coloroff}"
sed -i 's/127.0.0.1/0.0.0.0/'   /etc/redis.conf  /etc/redis/redis.conf &>>$log_file

echo -e "${color} starting redis ${coloroff}"
systemctl enable redis &>>$log_file
systemctl restart redis &>>$log_file