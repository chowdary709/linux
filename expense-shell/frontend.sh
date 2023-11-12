echo installing nginx
dnf install nginx -y >>/tmp/nginx

echo placlling expense configuration file
cp expense.conf /etc/nginx/default.d/expense.conf >>/tmp/nginx

echo removing onld nginx web content
rm -rf /usr/share/nginx/html/* >>/tmp/nginx

echo downloading new nginx web content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>/tmp/nginx

echo chinging nginx directory
cd /usr/share/nginx/html >>/tmp/nginx

echo extracting frontend code
unzip /tmp/frontend.zip  >>/tmp/nginx

echo starting nginx server
systemctl enable nginx
systemctl restart nginx