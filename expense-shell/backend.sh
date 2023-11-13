source comman.sh
component=backend

echo install nodejs repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo installing nodejs
dnf install nodejs -y &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi


echo copy backend service file
cp backend.service /etc/systemd/system/backend.service &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo add aplication user
useradd expense &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo cleen app content
rm -rf /app

mkdir /app

cd /app

download_and_extract

echo downloas dependencies
npm install &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo start backend services
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo install mysql client
dnf install mysql -y &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo load the mysql schema
mysql -h mysql.roboshop.internal -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi
