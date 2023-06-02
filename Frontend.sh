echo -e "\[33m Installing Niginx server \e[0m"
echo -e "\[33mInstalling Niginx server withouspace\e[0m"
yum install nginx -y

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#config file
#test

systemctl enable nginx
systemctl restart nginx