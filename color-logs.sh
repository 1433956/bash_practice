#!/bin/bash
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

userid=$(id -u)

 if [ $userid -ne 0 ]
 then
      echo -e"$R You are not root user $N"
      echo -e "$R ERROR:: Please run this script with root access $N"
      exit 1
 else
      echo -e"$G You are root user $N"
 fi
