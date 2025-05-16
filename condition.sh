#!/bin/bash
#Condition
age=$1
# -gt is greterThan
# -lt is lessThan
# -eq is equalTo
# -ne is notEqualTo
# -ge is greaterThanEqualTo
# -le is lessThanEqualTo
if [ $age -ge 19 ]; 
then 
echo "You are eligible to vote"
else
echo "you are not eligible to vote"
exit 1
fi
   