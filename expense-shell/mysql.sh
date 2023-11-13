echo disable mysql 8 vershion
dnf module disable mysql -y

echo copy mysql repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo install mysql server
dnf install mysql-community-server -y

echo start mysql server
systemctl enable mysqld
systemctl start mysqld

echo setup root password
mysql_secure_installation --set-root-pass ExpenseApp@1