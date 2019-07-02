#!/bin/bash

#############################################################################################################################################################################################################################################################################################################################################
# Oneliner:                                                                                                                                                                                                                                                                                                                                 #
#                                                                                                                                                                                                                                                                                                                                           #
# rm -f host2IP; read -p "Domain: " domain; task(){ result=$(host $site | grep "has.*address" | tr -d "\n"); host=$(echo $result | cut -d " " -f1); add=$(echo $result | rev | cut -d " " -f1 | rev); if echo "$host" | grep "${domain}$" > /dev/null; then echo "$host ==> $add" >> host2IP;fi; };while read site;do (task $site &) done < #
#                                                                                                                                                                                                                                                                                                                                           #
#############################################################################################################################################################################################################################################################################################################################################

rm -f host2IP;
read -p "Domain: " domain; 

task(){
	result=$(host $site | grep "has.*address" | tr -d "\n");
	host=$(echo $result | cut -d " " -f1); add=$(echo $result | rev | cut -d " " -f1 | rev);
	if echo "$host" | grep "${domain}$" > /dev/null; then 
		echo "$host ==> $add" >> host2IP;
	fi
}

echo "Starting to resolve hostnames..."

while read site;do
	(task $site &)
done < $1

echo "Giving time for threads to finish..."

sleep 8;

echo "Cleansing file..."

sleep 2;

column -t host2IP | sort -u | tee ${domain}-host2IP;
rm -f host2IP;
