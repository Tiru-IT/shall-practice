#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e0m"


USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: please run this script in root user"
    exit 1
fi

for package in $@;
do
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y
        if [ $? -ne 0 ]; then
            echo "ERROR:: installing failed"
        else
            echo "installing success"
        fi
    else
        echo "already install"
done
