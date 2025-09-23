#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: please run this script with root user"
    exit 1 # failer is other then 0
fi

dnf install mysql -y

if [ $? -ne 0]; then
    echo "ERROR:: Installing mysql is failer"
    exit 1
else 
    echo "Installing mysql is success"
fi