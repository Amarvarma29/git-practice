#!/bin/bash

USERID=$(id -u)

echo "userid is :$USERID"

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it "
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed ,nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "Mysql is not installed ..going to install "
    dnf install mysql -y
    VALIDATE $? "installing Mysql"
else
    echo "Mysql is already installed ..nothing to do"
fi