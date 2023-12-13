#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [$1 -ne 0 ]; then

    echo "$2 :Installation is failed"
    exit 1
else

    echo "$2 :Installation is success"  
fi
}

if [ $ID -ne 0 ]; then
    echo "ERROR yor are not a root user"
    exit 1
else
    echo "yes you ARE A ROOT USER"
fi 

dnf install nginx -y

VALIDATE $? "Nginx Installation Done"

systemctl enable nginx

VALIDATE $? "Nginx enabling Done"

systemctl start nginx

VALIDATE  $? "Nginx enabling Done"

