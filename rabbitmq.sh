source common.sh
component="rabbitmq-server"

echo -e "${color} downloading package ${coloroff}"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash  &>>$log_file

echo -e "${color} downlaoding package ${coloroff}"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>$log_file

echo -e "${color} installing rabbitmq ${coloroff}"
yum install rabbitmq-server -y &>>$log_file

echo -e "${color} starting rabbitmq ${coloroff}"
systemctl enable ${component} &>>$log_file
systemctl restart ${component} &>>$log_file

echo -e "${color} creating user and giving permissions ${coloroff}"
rabbitmqctl add_user roboshop roboshop123 &>>$log_file
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>$log_file