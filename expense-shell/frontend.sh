echo Installing Nginx
dnf install nginx -y 

echo Placing Expense Config File in Nginx
cp expense.conf /etc/nginx/default.d/expense.conf 

echo Removing Old Nginx content
rm -rf /usr/share/nginx/html/* 

echo Download Frontend Code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip 

cd /usr/share/nginx/html

echo Extracting Frontend Code
unzip /tmp/frontend.zip 

echo Starting Nginx Service
systemctl enable nginx 
systemctl restart nginx 