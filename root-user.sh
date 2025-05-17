#!/bin/bash
 userid=$(id -u)
if [ $userid -nq 0];then
echo "You are not root user"
 suo su 

else
 echo "You are root user"

 exit 1
fi
