dnf install nginx -y

systemctl enable nginx

systemctl restart nginx

cp expense.conf /tmp/frontend.zip

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip



