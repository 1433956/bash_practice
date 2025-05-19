#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
     echo  "your are not root user"
     exit 1
else
     echo "your are root user"
fi 
#checking required software is installed  or not
validate_software() {
     if [ $1 -eq 0 ]
     then
          echo "$2 is already installed"
          exit 1
     else
          echo "$2 is not installed"
     fi 
}
   

 #checking required software is installed  or not
dnf list installed mysql
if [ $? -ne 0 ]
then 
     echo " mysql is not installed"
dnf install mysql -y
validate $? "mysql" 
else
    echo "mysql is installed"
    
fi

#checking required software is installed  or not
dnf list installed python3
if [ $? -ne 0 ]
then 
     echo " python is not installed"
dnf install python3 -y
validate $? "python3" 
else
    echo "python3 is installed"
    
fi

#checking required software is installed  or not
dnf list installed nginx
if [ $? -ne 0 ]
then 
     echo " nginx is not installed"
dnf install nginx -y
validate $? "nginx" 
else
    echo "nginx is installed"
    
fi



 

