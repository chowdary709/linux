source comman.sh

echo disable mysql 8 vershion
dnf module disable mysql -y &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[31mFAILED\e[0m"
fi

echo copy mysql repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[31mFAILED\e[0m"
fi

echo install mysql server
dnf install mysql-community-server -y &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[31mFAILED\e[0m"
fi

echo start mysql server
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[31mFAILED\e[0m"
fi

echo setup root password
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file
if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[31mFAILED\e[0m"
fi