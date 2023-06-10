source common.sh
component="dispatch"

echo -e "${color} installing golang ${coloroff}"
yum install golang -y &>>${log_file}

user_add
app_dir
download_file

echo -e "${color} installing dependencies ${coloroff}"  &>>${log_file}
cd /app
go mod init ${component}  &>>${log_file}
go get  &>>${log_file}
go build  &>>${log_file}

service_start
