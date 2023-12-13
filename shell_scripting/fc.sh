#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]; then
    echo "ERROR yor are not a root user"
else
    echo "yes you ARE A ROOT USER"
fi            