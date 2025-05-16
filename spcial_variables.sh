#!/bin/bash
# Special Variables

echo "variables are=" $@
echo "variables are= " $#
echo "script name is=" $0
echo "pid of the script=" $$
 sleep 5 &
echo "pid of the last background  process=" $!
echo "exit status of the last command="$?
echo "user=" $user
echo "home directory=" $HOME
echo "current working directory=" $PWD