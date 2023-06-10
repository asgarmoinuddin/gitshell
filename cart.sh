source common.sh
component=cart

nodejs
user_add
app_dir

download_file

echo -e "${color} install nodejs dependencies ${coloroff}"
npm install &>>$log_file

echo -e "${color} copying service files ${coloroff} "

cp cart.service /etc/systemd/system/${component).service &>>$log_file

service_start



