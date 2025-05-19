#!/bin/bash
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

userid=$(id -u)

 if [ $userid -ne 0 ]
 then
      echo -e"$R You are not root user $N"
      "
      exit 1
 else
      echo -e $Y You are root user $N"
 fi
