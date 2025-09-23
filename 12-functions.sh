#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: please run this script root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: installing $2 failer"
        exit 1
    else
        echo "Installing $2 success"
fi

}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y 
VALIDATE $? "naginx"

dnf install python3 -y
VALIDATE $? "python3"