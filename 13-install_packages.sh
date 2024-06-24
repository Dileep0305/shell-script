#!bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%F-%M-%H-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>>$LOGFILE

if [ $? -ne 0 ]; then
    echo -e "$R Error: Please run the script with user access $N"
    exit 1
else
    echo "You are root user"
fi

validate() {
    if [ $1 -ne 0 ]; then
        echo -e "Error: $2 is $R failed $N"
        exit 1
    else
        echo -e " $2 is $G success $N"
    fi
}

for package in $@; do
    yum list installed $package $ >>$LOGFILE
    if [ $? -ne 0 ]; then
        yum install $package -y $ >>$LOGFILE
        validate $? "Installing of $package"
    else
        echo -e "$package is already installed ... $Y skipping $N"
    fi
done
