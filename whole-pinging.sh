#!/bin/bash
if [ "$1" == "" ];
then 
		echo "type whole-pinging.sh -h for more."
elif [ "$1" == "-h" ];
then
		echo -e "Usage: \n        to ping a network ips: whole-pinging.sh *Network ip* \n        for help: whole-pinging.sh -h\n        to set a range: use -r \n"
		echo -e "Exmaples: \n        whole-pinging.sh 192.168.1.*  \"put the star, where the number you want to change\"\n        So the script goes to ping from 192.168.1.0 to 192.168.1.254\n\n        to set a range: whole-pinging.sh 192.168.1.* -r 1 10 \n        So it goes to ping from 192.168.1.1 to 192.168.1.10 \n        by default 0 to 254 \n\n"
		echo "        /**********************************/
	/*           Simple tool          */
        /*        By OxAbdulrahman        */
        /* Thank You for Using My tool (: */   
        /**********************************/"

elif [ "$2" == "-r" ];
then
	start=$3
	end=$4
	for x in $(seq "$start" "$end");do
		y=$(echo $1 | sed "s/*/$x/g")
		result=$(ping -c 1 $y | grep -oP '1 received')
		if [ "$result" == "1 received" ];
		then
			echo "$y is up" 
		else 
			echo "$y is down"
		fi
		done	
else
	for x in $(seq 0 254);do
		y=$(echo $1 | sed "s/*/$x/g")
		result=$(ping -c 1 $y | grep -oP '1 received')
		if [ "$result" == "1 received" ];
		then
			echo "$y is up" 
		else 
			echo "$y is down"
		fi
		done
fi
