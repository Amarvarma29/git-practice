#!/bin/bash

USERID=$(id - u)
CHECK-ROOT(){
    if[ $USERID -ne 0 ]
    then 
        echo "please run with rooot priviliges"
        exit 1
    fi
}
CHECK-ROOT 
 
 VALIDATE(){
    if[ $? -ne 0 ]
    then 
        echo "$1 command is failed"
        exit 1
    else 
       echo "$2 command is succes"
    fi

 }
 
 for package in $@  # $@ referes to all arguments passed to it
 do 
   dnf list installed $package
   if[ $? -ne 0 ]
   then 
       echo "$package is not installed going intall it"
       dnf install $package -y
       VALIDATE $? "Installing $package"
    else 
       echo "$package isalredy installed  nothinhg to do"
    fi 
   
done