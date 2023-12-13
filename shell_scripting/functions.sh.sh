#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]; then

    echo "ERROR :: Your not a Root User"
else
    echo "your a root user"
fi        