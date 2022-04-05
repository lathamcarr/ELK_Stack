#!/bin/bash

#variables
output=$HOME/research/sys_info.txt
files=('/etc/passwd' '/etc/shadow')

# Script name
echo "Not actualy our first bash script" >> $output
date >> $output
#echo "I am $USER"
echo -e "Uname is: $(uname -a) /n" >> $output
# | awk '{print $1, $2}') \n"
echo -e "The IP is: $(ip addr | head -9 | tail -1 | awk '{print $2}') \n" >> $output
echo -e "The host is: $(hostname -s)" >> $output
#Bonus
echo "DNS servers: " >> $output
cat /etc/resolv.conf >> $output

echo -e "\nMemory Info:" >> $output
free -h >> $output

echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output

echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

#Last Activity
mkdir ~/research 2> /dev/null

#Find 777
echo -e "\nfiles with 777:" >> $output
find / -type f -perm 777 >> $output

#Top Processes
echo -e "\nTop 10 Processes" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output

#Day 2
#check for ~/research
if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi

#check for ~/research/sys_info.txt
if [ -f $output ]
then
 > $output

#activity useful loops
#shadow & passwd paths
#files=('/etc/passwd' '/etc/shadow')

#file permissions
for file in ${files[@]}
do
ls -l $file >> $output
done

echo -e "\nPasswd and shadow permissions: \n" >> $output

#Bonus 1
#check sudo privilages for all users
for user in $(ls /home)
do
sudo -lU $user >> $output
done
#for user in $(ls /home); do sudo -lU $user; done
