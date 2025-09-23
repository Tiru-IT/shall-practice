#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: please run this script in root user"
    exit 1
fi

VALIDATE(){
    if [ $! -ne 0 ]; then
        echo -e "ERROR:: installing $2 $R Failer $N"
        exit 1
    else
        echo -e "Installing $2 $G Success $N"
}

dnf list installed mysql
    if [ $? -ne 0 ]; then
        dnf install mysql -y
        VALIDATE $? "mysql"
    else
        echo -e "MySQL already exist ... $Y SKIPPING $N"
    fi

dnf installed nginx
    if [ $? -ne 0 ]; then
        dnf install nginx -y
        VALIDATE $? "nginx"
    else
        echo -e "NGINX already exist ... $Y SKIPPING $N"
    fi
dnf installed python3
    if [ $? -ne 0 ]; then
        dnf install python3 -y
        VALIDATE $? "python3"
    else
        echo -e "PYTHON3 already exist ... $Y SKIPPING $N"
    fi