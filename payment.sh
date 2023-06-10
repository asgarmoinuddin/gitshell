source common.sh
component="payment"

echo -e "${color} installing python  ${coloroff}"
yum install python36 gcc python3-devel -y &>>$log_file

user_add
app_dir
download_file

echo -e "${color} installing dependencies ${coloroff}"
cd /app
pip3.6 install -r requirements.txt  &>>$log_file


service_start