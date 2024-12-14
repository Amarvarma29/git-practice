#!bin/bash

username=$1
passwd=$2


echo "enete username:"
read -s username 
# read commmand used for read the username here means take the input 
# -s used for hiding purpose at run time 

echo "username is : $username"
echo "enter passwd:"
read -s passwd
echo "passwd is : $passwd"
 # above code is for we are giving values to username and passwd


