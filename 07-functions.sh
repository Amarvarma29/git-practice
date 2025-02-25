#!/bin/bash

USERID=$(id -u)

echo "userid is :$USERID"
VALIDATE() {

 if[ $1 -ne 0 ]
    then 
         echo "$2 command is failure"
         exit 1
    else 
         echo "$2 command is succes"
    fi

}
    


if [ $USERID -ne 0 ]
then
     echo "please script run with root priviliges "
    
fi

dnf list installed git 

if [ $? -ne 0 ]
then 
     echo "git is not installed "
     dnf install git -y
     if [$? -ne 0 ]
     then 
          echo "lure meands git installation is failure status"
          exit 1
     else
          echo  " is succes"
 else
     "git is alredy installed"
fi

dnf list installed mysql

if [$? -ne 0 ]
then 
   echo "mqsql is not installed ..going to intall it"
   dnf install mysql -y
   if [ $? -ne 0 ] 
   then 
      echo "command is not succeful" 
      exit 1
    else 
        echo "command is suceess"
else
    echo "mysql is already installed"
fi

                               
    
dnf list installed git
# Above stattement is for checking if git is alredy installed or not

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