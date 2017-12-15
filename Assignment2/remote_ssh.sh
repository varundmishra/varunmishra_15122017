#!/bin/bash

#Assumptions:
#1) The host from which this script will be run has passwordless SSH connectivity to all hosts mentioned in the comma separated file passed as an argument.

#Script Starts
#Validate if a filename is passed as an argument and it exists
if [ -z "$1" ] || [ ! -f "$1" ]
  then
    echo -e "\nNo Hostfile supplied or file does not exist!!!"
    echo -e "\nPlease pass the filename containing comma separated hostnames you want to ssh as an argument to this script and try again...\n"
    exit 1
fi
#Return a prompt for a command to be entered
read -p "Enter the command you want to execute on the hosts: " command1
#Validate if the command entered is not an empty string
if [ -z "$command1" ]
  then
    echo -e "\nNo Command Entered!!!"
    echo -e "\nPlease input the command you want to run on the remote ssh hosts and try again...\n"
    exit 1
fi
#cat reads the file passed as an argument
#tr parses comma and converts it to line ready for IFS to be a newline
#do while loop runs the command entered in the above step and runs it on each of the hosts mentioned in the file
cat $1 | tr "," "\n" | while IFS= read -r userhost; do
    echo -e "\nConnecting to ${userhost}\n"
    ssh -n -o BatchMode=yes ${userhost} ${command1} 2>&1
done
#Script Ends