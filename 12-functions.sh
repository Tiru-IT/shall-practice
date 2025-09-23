#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: please run this script root user"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: installing mysql failer"
    exit 1
else
    echo "Installing mysql success"
fi

dnf install nginx -y 

if [ $? -ne 0 ]; then
    echo "ERROR:: installing nginx failer"
    exit 1
else
    echo "Installing nginx success"
fi

dnf install python3 -y

if [ $? -ne 0 ]; then 
    echo "ERROR:: installing python3 failer"
    exit 1
else
    echo "installing python3 success"
fi 