#!/bin/bash
userid=$(id -u)
R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

 if [ $userid -ne 0 ]
 then
      echo -e "$R You are not root user $N"
      exit 1
 else
      echo -e "$G You are root user $N"
 fi
#checking required software is installed  or not
dnf list installed mysql
if [ $? -ne 0 ]
then
      echo -e "$R mysql is not installed $N"
      dnf install mysql -y
      VALIDATE $? "mysql"
else 
      echo -e "$G mysql is installed $N"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
      echo -e "$R nginx is not installed $N"
      dnf install nginx -y
      VALIDATE $? "nginx"
else 
      echo -e "$G nginx is installed $N"
fi
if [ $? -ne 0 ]
then
      echo -e "$R python is not installed $N"
      dnf install python -y
      VALIDATE $? "python"
else 
      echo -e "$G python is installed $N"
fi
VALIDATE() {
       if [$1 -eq 0]
       then
            echo -e "$G $2 is already installed $N"
            exit 1
       else
            echo -e "$R $2 is not installed $N"
       fi
}

