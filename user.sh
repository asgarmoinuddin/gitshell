source common.sh
component=user

nodejs

user_add
app_dir

download_files
echo -e "${color} install nodejs dependencies ${coloroff}"
npm install &>>$log_file

echo -e "${color} creating user service file ${coloroff}"
cp ${component).service /etc/systemd/system/${component).service &>>$log_file

service_start

mongo_schema_setup