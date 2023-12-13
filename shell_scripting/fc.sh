#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]; then
    echo "ERROR yor are not a root user"
    exit 1
else
    echo "yes you ARE A ROOT USER"
fi 

dnf install nginx -y

if [$? -ne 0 ]; then

    echo "Nginx Installation is failed"
    exit 1
else

    echo "Nginx Installation is success"  
fi

systemctl enable nginx

if [$? -ne 0 ]; then

    echo "Nginx enabled failed"
    exit 1
else

    echo "Nginx Nginx enabled success"  
fi

systemctl start nginx

if [$? -ne 0 ]; then

    echo "Nginx unable to start failed"
    exit 1
else

    echo "Nginx start is success"  
fi

