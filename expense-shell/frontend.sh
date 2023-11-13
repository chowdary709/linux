source comman.sh
component=frontend

echo installing nginx
dnf install nginx -y &>>$log_file

if [ $? -eq 0 ]; then
 echo SUCCESS
else
 echo FAIL
fi

echo placlling expense configuration file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
if [ $? -eq 0 ]; then
 echo SUCCESS
else
 echo FAIL
fi

echo removing onld nginx web content
rm -rf /usr/share/nginx/html/* &>>$log_file
if [ $? -eq 0 ]; then
 echo SUCCESS
else
 echo FAIL
fi

echo chinging nginx directory
cd /usr/share/nginx/html &>>$log_file
if [ $? -eq 0 ]; then
 echo SUCCESS
else
 echo FAIL
fi

download_and_extract

echo starting nginx server
systemctl enable nginx
systemctl restart nginx
if [ $? -eq 0 ]; then
 echo SUCCESS
else
 echo FAIL
fi
