curl -sL https://rpm.nodesource.com/setup_lts.x | bash

dnf install nodejs -y

echo Copy Backend Service File
cp backend.service /etc/systemd/system/backend.service

echo Add Application User
useradd expense


rm -rf /app # to remove old files

echo Copy Backend Service File
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip

unzip /tmp/backend.zip

npm install

echo Start Backend Service
systemctl daemon-reload

systemctl enable backend

systemctl start backend



dnf install mysql -y
mysql -h mysql.roboshop.internal -uroot -pExpenseApp@1 < /app/schema/backend.sql