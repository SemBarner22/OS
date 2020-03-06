#!/bin/bash

MODE=ADD;
SR=~/lab4/pipe.txt
A=1
NREG='^[+-]?[[:digit:]]+$'
(tail -n 0 -f $SR) |
while true
do
	read LINE;
	#echo $LINE
		if [[ $LINE == "" ]]
			then
			continue
		fi
		if [[ $LINE == "QUIT" ]]
			then
	# case $LINE in
		# QUIT)
			echo "exit"
			killall tail
			exit
		#	;;
		elif [[ $LINE == '*' ]]
			then
	#	'*')
			MODE=MUL;
	#		;;
	#	'+')
		elif [[ $LINE == '+' ]]
			then
			MODE=ADD;
	#		;;
	#	*)
		elif [[ $LINE == '/' ]]
			then
			MODE=DIV;
		elif [[ $LINE =~ $NREG ]]
			then
				if [[ $MODE == ADD ]]
				then
					(( A += $LINE ))
					echo $A
				fi
				if [[ $MODE == MUL ]]
				then
					(( A *= $LINE ))
					echo $A
				fi	
				if [[ $MODE == DIV ]]
				then
					if (( $LINE != 0 ))
					then
						(( A /= $LINE ))
					else
						echo you are dead
					fi
					echo $A
				fi		
			else
				echo "oops"
				killall tail
				exit
			fi	  
	#		;;
			
	# esac
done

