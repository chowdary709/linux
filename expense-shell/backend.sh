log_file=/tmp/backend.log

echo install nodejs repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash >>$log_file

echo installing nodejs
dnf install nodejs -y >>$log_file

echo copy backend service file
cp backend.service /etc/systemd/system/backend.service >>$log_file

echo add aplication user
useradd expense >>$log_file

echo cleen app content
rm -rf /app

mkdir /app


curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >>$log_file
cd /app

unzip /tmp/backend.zip >>$log_file

npm install >>$log_file

systemctl daemon-reload >>$log_file
systemctl enable backend
systemctl start backend

dnf install mysql -y >>$log_file
mysql -h mysql.roboshop.internal -uroot -pExpenseApp@1 < /app/schema/backend.sql >>$log_file