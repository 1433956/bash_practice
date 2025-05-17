#!/bin/bash
 userid=$(id -u)
if [ $userid -ne 0 ]; then
echo "You are not root user"
  sudo su -
else
 echo "You are root user"

 exit 1
fi
