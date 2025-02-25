#!/bin/bash


LOGS_FOLDER="/var/log/shell_script"
script_NAME=$( echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%y-%m-%d-%H-%M-%S)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOGS_FOLDER

USERID=$( id -u)
R="\e[31m"
G="\e[32m"
Y="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "please login with root access" | tee -a $LOGS_FILE
        exit 1
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is not  $R success $N" | tee -a $LOGS_FILE
        exit 1
    else 
         echo "$2 is  $G success $N" | tee -a $LOGS_FILE
    fi
}

CHECK_ROOT

for package in $@
do 
   dnf list installed $package &>> $LOGS_FILE
   if [ $? -ne 0 ]
   then 
        echo "$package is not installed going to install it" | tee -a $LOGS_FILE
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "Installing $package"
        
    else
         echo "$package is $Y  alredy installed nothing to do it $N" | tee -a $LOGS_FILE
done
            
    
