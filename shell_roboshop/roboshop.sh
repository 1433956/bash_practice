#!/bin/bash

AMI_ID="ami-09c813fb71547fc4f"
SG_ID="sg-09c3d9a208889e92c"
INSTANCES=("mongodb" "mysql" "redis" "rabbitmq" "catalogue" "cart" "user" "shipping" "payment" "dispatch" "frontend")
Zone_ID="Z04391491005OGSNXNQQX"
DOMAIN_NAME="devops73.site"

  for instace in ${INSTANCES[@]}
  do
     INSTANCE_ID=$(aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg-09c3d9a208889e92c --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instace}]" --query "Instances[0].InstanceId" --output text) 
     if [ $instace !=  "frontend" ]
     then
        IP=$(aws ec2 describe-instances --instance-ids $instace --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text)
     else 
        IP=$(aws ec2 describe-instances --instance-ids $instace --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
     fi
  done
