source comman.sh
component=frontend

echo installing nginx
dnf install nginx -y &>>$log_file

echo placlling expense configuration file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file

echo removing onld nginx web content
rm -rf /usr/share/nginx/html/* &>>$log_file

echo chinging nginx directory
cd /usr/share/nginx/html &>>$log_file

download_and_extract

echo starting nginx server
systemctl enable nginx
systemctl restart nginx