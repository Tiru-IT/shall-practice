#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e0m"


USER_ID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOG_FILE
echo "Script started executed at: $(date)"| tee -a $LOG_FILE

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: please run this script in root user"
    exit 1
fi
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR::$2 installing $R failed $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 installing $G success $N" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
        if [ $? -ne 0 ]; then
            dnf install $package -y &>>$LOG_FILE
            VALIDATE $? "$package"
            
        else
             echo -e "$package already installed ... $Y SKIPPING $N"
        fi
done
