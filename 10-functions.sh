#!bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]; then
    echo "Error: Please run this script with root access"
    exit 1
else
    echo "You are root user"
fi
validate() {
    if [ $1 -ne 0 ]; then
        echo "Error: $2 is failed"
        exit 1
    else
        echo "$2 is success"
    fi
}
yum install mysql -y

validate $? "Installing Mysql"

yum install git -y

validate $? "Installing Git"
