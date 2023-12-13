#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2: Installation is failed"
        echo "Error details: $3"
    else
        echo "$2: Installation is success"  
    fi
}

if [ $ID -ne 0 ]; then
    echo "ERROR: You are not a root user"
    exit 1
else
    echo "Yes, you ARE a ROOT USER"
fi 

dnf install nginx -y

VALIDATE $? "Nginx Installation Done"

systemctl enable nginx

VALIDATE $? "Nginx enabling Done"

systemctl start nginx

VALIDATE $? "Nginx start Done"

rm -rf /usr/share/nginx/html/*

VALIDATE $? "Removed Old html Content" "Unable to remove old content"

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip

VALIDATE $? "Downloaded and Placed in temp"

cd /usr/share/nginx/html

VALIDATE $? "I am in html Folder"

unzip /tmp/web.zip

VALIDATE $? "Unzip Done"

systemctl restart nginx 

VALIDATE $? "Restart Done"
