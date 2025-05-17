#!/bin/bash
#root user
# check if the script is run as root
 user_id=$(id -u) 
 #check user_id is root or not

if [ $user_id -ne 0 ] then
  echo "you are not root user, please run as root"
  exit 1
else 
  echo "your are root user"
fi
   
# check if mysql is installed
   dnf list installed mysql

   if [ $? -eq 0 ] then

    echo "mysql is already installed"
exit 1
   else 
  echo "mysql is not installed"

# install mysql
    dnf install mysql -y
fi
    if [$? -eq 0 ] then
      echo "mysql is installed successfully"
    else
      echo "mysql installation failed"
      exit 1
    fi
    


