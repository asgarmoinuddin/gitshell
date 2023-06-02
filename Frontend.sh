echo -e "\e[31m Installing Niginx server \e[0m"
yum install nginx -y

echo -e "\e[31m Removing Default Content \e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[31m Downloading and extracting content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#config file
#test
echo -e "\e[31m Restarting Service \e[0m"
systemctl enable nginx
systemctl restart nginx