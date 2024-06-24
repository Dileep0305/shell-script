#!bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]; then
    echo "Error: Please run this script with root access"
    exit 1
else
    echo "You are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]; then
    echo "Error: Installing Mysql is failed"
    exit 1
else
    echo "Mysql installation is success"
fi

yum install git -y
if [ $? -ne 0 ]; then
    echo "Error: Git installation is failed"
    exit 1
else
    echo "Git installation is success"
fi
