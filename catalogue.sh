source common.sh
component=catalogue

nodejs
user_add
app_dir

download_file

echo -e "${color} installing dependencies ${coloroff}"
npm install

cp catalogue.service /etc/systemd/system/catalogue.service

service_start
mongo_schema_setup