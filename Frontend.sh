echo -e "\e[31m Installing Niginx server \e[0m"
yum install nginx -y >>/tmp/nginx.log

echo -e "\e[31m Removing Default Content \e[0m"
rm -rf /usr/share/nginx/html/* >>/tmp/nginx.log

echo -e "\e[31m Downloading and extracting content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/nginx.log
cd /usr/share/nginx/html
unzip /tmp/frontend.zip >>/tmp/nginx.log

echo -e "\e[31m update config file \e[0m"
cp roboshop.conf /etc/nginx/default/roboshop.conf

echo -e "\e[31m Restarting Service \e[0m"
systemctl enable nginx &>>/tmp/nginx.log
systemctl restart nginx &>>/tmp/nginx.log