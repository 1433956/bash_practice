#!/bin/bash
user=$(id -u)

if [user  -eq 0 ]; then
    echo "You are root user"
     dnf list installed | grep mysql
    if [ $? -ne 0 ]; then
        dnf install mysql -y
    else
        echo "MySQL is already installed"
        exit 1
 fi
if [ $? -ne 0 ]; then
    echo "mysql is installed successfully"
    else
    echo "mysql is not installed
    exit 1
 fi
   




