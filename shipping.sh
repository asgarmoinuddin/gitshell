source common.sh
component="shipping"

echo -e "${color} installing maven ${coloroff}"
yum install maven -y &$log_file &>>${log_file}

user_add
app_dir
download_file

echo -e "${color} downloading and unzipping ${coloroff}"
mvn clean package &>>${log_file}
mv target/shipping-1.0.jar shipping.jar &>>${log_file}

service_start

echo -e "${color} installing mysql ${coloroff}"
yum install mysql -y &>>${log_file}

echo -e "${color} copying schema ${coloroff}"
mysql -h mysql-dev.cartrackcardecors.store -uroot -pRoboShop@1 < /app/schema/${component}.sql >>${log_file}

echo -e "${color} restarting services ${coloroff}"
systemctl restart ${component} >>${log_file}