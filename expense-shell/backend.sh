source comman.sh
component=backend

echo install nodejs repos
# type npm  &>>$log_file
if [ $? -ne 0 ]; then
 echo install nodejs repos
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
fi
stat_check


 echo installing nodejs
 dnf install nodejs -y &>>$log_file
stat_check



echo copy backend service file
cp backend.service /etc/systemd/system/backend.service &>>$log_file
stat_check



echo add aplication user
# useradd expense &>>$log_file
id expense &>>$log_file
if [ $? -ne 0 ]; then
   useradd expense &>>$log_file
fi
stat_check


echo cleen app content
rm -rf /app

mkdir /app

cd /app

download_and_extract

echo downloas dependencies
npm install &>>$log_file
stat_check


echo start backend services
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file
stat_check


echo install mysql client
dnf install mysql -y &>>$log_file
stat_check


echo load the mysql schema
mysql -h mysql.roboshop.internal -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
stat_check

