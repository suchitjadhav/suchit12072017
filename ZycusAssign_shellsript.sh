#Write a bash/python script that takes list of hostnames (comma separated) as an argument.
#This script, when executed, should connect to all the servers via. SSH (standard port) (assume #password-less connectivity) and give a single prompt to the user.
#When the user executes a command on this prompt, the script should run the command on all connected #servers and display the output.
#Make this as efficient as possible, code comments appreciated.

#!/bin/bash

#Storing Hostnames entered as arguments to the script!
hostnames=$@

echo > ./host_names

for host in $(echo $hostnames | sed "s/,/ /g")
do
    echo "$host:22" >> ./host_names
done

#Enter the command to execute on all the hostnames!
echo "Enter the command to execute"
read -p 'Command: ' command

#User to login via ssh!
user=ec2-user

#PSSH is used to execute commands simultaneously on multiple servers

pssh -h host_names -l $user -t 10 -i "$command"

#Script Ends
echo All Done
