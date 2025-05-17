#!/bin/bash
#root user
userid= $(id -u)
if [ $userid -ne 0 ]
 then
 echo "you are not root user"
  exit 1
else 
 echo "you are root user"
 
fi 
 dnf list installed mysql

 if [ $? -ne 0 ] then
    echo "mysql is not installed"
    dnf install mysql -y
else 

    echo "mysql is already installed" 
    exit 1
fi
if [ $? -eq 0 ] then
    echo "mysql is installed successfully"
else
    echo "mysql installation failed"
    exit 1
fi