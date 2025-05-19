#!/bin/bash
userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Logs_folder="var/logs/bash-script"
script_name=$(echo $0 | cut -d "." -f1)
log_file="$Logs_folder/$script_name.log"
mkdir -p $Logs_folder
packages=("mysql" "python3" "nginx")
if [ $userid -ne 0 ]
then
    echo  -e "$R your are not root user $N" | tee -a $log_file
    exit 1
else
    echo -e "$G your are root user $N" | tee -a $log_file
fi
#checking required software is installed  or not
VALIDATE_SOFTWARE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$G $2 is already installed $N" &>>$log_file
        exit 1
    else
        echo -e "$R $2 is not installed $N" | tee -a $log_file
    fi
}
for package in ${packages[@]}

do 
   dnf listed installed $package
   if [ $? -ne 0 ]
   then
     echo -e "$R $package is not installed $N" |tee -a $log_file
     dnf install $package -y
     VALIDATE_SOFTWARE $? "$package"
    else
      echo -e "$G $package is installed $N" | tee -a $log_file
    fi
 done