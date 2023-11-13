source comman.sh
component=frontend

echo installing nginx
dnf install nginx -y &>>$log_file

if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo placlling expense configuration file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo removing onld nginx web content
rm -rf /usr/share/nginx/html/* &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

echo chinging nginx directory
cd /usr/share/nginx/html &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

download_and_extract

echo starting nginx server
systemctl enable nginx
systemctl restart nginx
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi
