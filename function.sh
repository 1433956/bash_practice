#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
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
   
#check user is a Root user
 userid=$(id -u)
if [ $userid -eq 0 ]
then
     echo "$userid is a root user"
else  
     echo "$userid is root User, Try to login as root User"
     exit 1
fi
#mysql installation is sucess or not using function
validate() {
 if [ $1 -eq 0 ]
 then 
      echo "$2 installation is success"
 else 
      echo "$2 installation is failure"
      exit 1
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
    exit 1
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
    exit 1
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
    exit 1
fi



 

