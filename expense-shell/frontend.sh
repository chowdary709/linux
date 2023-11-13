source comman.sh

echo installing nginx
dnf install nginx -y >>$log_file

echo placlling expense configuration file
cp expense.conf /etc/nginx/default.d/expense.conf >>$log_file

echo removing onld nginx web content
rm -rf /usr/share/nginx/html/* >>$log_file

echo downloading new nginx web content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>$log_file

echo chinging nginx directory
cd /usr/share/nginx/html >>$log_file

echo extracting frontend code
unzip /tmp/frontend.zip  >>$log_file

echo starting nginx server
systemctl enable nginx
systemctl restart nginx