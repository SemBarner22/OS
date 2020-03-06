#!/bin/bash

A=$PWD
BOOL="false"
recentBackUp="0000-00-00"
#cd $HOME
dateNow=$(date '+%Y-%m-%d')
dateOld=$(date '+%Y-%m-%d' -d "$dateNow-7 days")
#echo $(( ($(date -d $date_now +%s) - $(date -d $date_old +%s)) / 86400 )) days
echo $dateNow
echo $dateOld 
cd /
for dir in $(ls ~/Backup-????-??-??)
do
	if [[ -f $dir ]]; then
		b=0
	else
		name=$(basename $dir)
		s=${name:7:10}
		echo $s 
		echo $dateOld
		echo comparing
		if [[ $s -ge $recentBackUp ]]
		then
			recentBackUp=$s
			echo $recentBackUp
			echo aaa
		fi
	fi
done
		
		#echo Copying to Backup-$RecentBackUp >> ~/backup-report 
		for file in ~/Backup-$recentBackUp/*
		do	
			buffered="FALSE"
			filename=$(basename $file)
			basename=$(dirname $file)
			newName=$(sed -r 's/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$//g' <<< $filename)
			echo $basename/$newName	
			if [[ -n $(find $basename/ -name "$newName[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]") ]]
			then
				echo enter date of $newName in format: YYYY-MM-DD
				read answer < /dev/tty;
				dateVersion=$(date '+%Y-%m-%d' -d "$answer") || echo wrong date type
				cp $file$dateVersion ~/restore/	|| echo no such backup file	
			else
				filename=$(basename $file)
				cp $file ~/restore/
				#echo aaaa
				echo restored $filename >> ~/backup-report	
			fi
			#done
			#fi
		done	

