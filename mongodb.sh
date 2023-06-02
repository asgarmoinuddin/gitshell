echo -e "\e[33m Copy Repo file \e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/mongo.log

echo -e "\e[33m installing mongodb \e[0m"
yum install mongodb-org -y &>>/tmp/mongo.log

echo -e "\e[33m start Service \e[0m"
systemctl enable mongod &>>/tmp/mongo.log
systemctl restart mongod &>>/tmp/mongo.log