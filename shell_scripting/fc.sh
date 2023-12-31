#!/bin/bash

ID=$(id -u)

RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$RED$2: failed$NC"
        echo -e "$REDError details: $3$NC"
        exit 1
    else
        echo -e "$GREEN$2: success$NC"
    fi
}

if [ $ID -ne 0 ]; then
    echo -e "$REDERROR: You are not a root user$NC"
    exit 1
else
    echo -e "$GREENYes, you ARE a ROOT USER$NC"
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
