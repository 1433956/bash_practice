#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0]
then
     echo  "your are not root user"
     exit 1
else
     echo "your are root user"
fi 
dnf list installed mmysql
validate_software() {
     if [ $? -eq 0 ]
     then
          echo "mysql is already installed"
          exit 1
     else
          echo "mysql is not installed"
     fi 



}
   