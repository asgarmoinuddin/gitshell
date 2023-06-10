source common.sh
component=mongodb


echo -e "${color} Copy Repo file ${coloroff}"
cp ${component}.repo /etc/yum.repos.d/${component}.repo &>>$log_file

echo -e "${color} installing ${component} ${coloroff}"
yum install ${component}-org -y &>>$log_file

echo -e "${color} modifying ip address${coloroff}"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$log_file

echo -e "${color} start Service ${coloroff}"
systemctl enable mongod &>>$log_file
systemctl restart mongod &>>$log_file