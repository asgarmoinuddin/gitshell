color="\e[33m"
coloroff="\e[0m"
log_file="/tmp/roboshop.log"

install_nginx(){

  echo -e "${color} Installing Niginx server ${coloroff}"
  yum install ${component} -y >>$log_file

  echo -e "${color} Removing Default Content ${coloroff}"
  rm -rf /usr/share/${component}/html/* >>$log_file

  echo -e "${color} Downloading and extracting content ${coloroff}"
  curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>$log_file
  cd /usr/share/${component}/html
  unzip /tmp/frontend.zip >>$log_file

  echo -e "${color} update config file ${coloroff}"
  cp roboshop.conf /etc/${component}/default/roboshop.conf

  echo -e "${color} Restarting Service ${coloroff}"
  systemctl enable ${component} &>>$log_file
  systemctl restart ${component} &>>$log_file
}

service_start(){
  echo -e "${color} reloading daemon ${coloroff}"
    systemctl daemon-reload &>>$log_file

    echo -e "${color} starting service ${coloroff}"
    systemctl enable $component &>>$log_file
    systemctl restart $component &>>$log_file
}

nodejs(){
  echo -e "${color} installing nodejs rpm ${coloroff}"
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
  yum install nodejs -y &>>$log_file

  echo -e "${color} adding user ${coloroff}"
  useradd roboshop &>>$log_file
  echo -e "${color} creating app directory ${coloroff}"
  mkdir /app &>>$log_file

  echo -e "${color} downloading $component file and unzipping ${coloroff}"

  curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component.zip  &>>$log_file
  cd /app
  unzip /tmp/$component.zip  &>>$log_file
  echo -e "${color} install nodejs dependencies ${coloroff}"
  npm install &>>$log_file

  echo -e "${color} creating $component service file ${coloroff}"
  cp $component.service /etc/systemd/system/$component.service &>>$log_file


}

mongo_schema_setup(){
  echo -e "${color} creating mongo repo ${coloroff}"
  cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>$log_file

  echo -e "${color} installing mongo ${coloroff}"
  yum install mongodb-org-shell -y &>>$log_file

  echo -e "${color} copying schema in mongodb ${coloroff}"
  mongo --host mongodb-dev.cartrackcardecors.store </app/schema/${component}.js &>>$log_file
}

user_add(){
  useradd roboshop
}

app_dir(){
  echo -e "${color} creating application directory ${coloroff}"
  mkdir /app
  cd /app
}

download_file(){

  echo -e "${color} downloading $component files and extracting ${coloroff}"
  curl -o /tmp/$component https://roboshop-artifacts.s3.amazonaws.com/$component.zip
  cd /app
  unzip /tmp/$component.zip

}