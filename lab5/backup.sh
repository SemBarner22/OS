#!/bin/bash

a=$PWD
bool="false"
recentBackUp="0000-00-00"
dateNow=$(date '+%Y-%m-%d')
dateOld=$(date '+%Y-%m-%d' -d "$dateNow-7 days")
#echo $(( ($(date -d $date_now +%s) - $(date -d $date_old +%s)) / 86400 )) days
#echo $date_now
#echo $date_old 
for dir in $(ls ~/Backup-????-??-??)
do
	if [[ -f $dir ]]; then
		b=0
	else
		name=$(basename $dir)
		s=${name:7:10}
		echo $s 
		echo $date_old
		echo comparing
		if [[ $s -ge $dateOld ]]
		then
			bool="true"
			if [[ $S -ge $recentBackUp ]]
			then
				recentBackUp=$S
			fi
		fi
	fi
done

if [[ $bool = "false" ]]
then
	mkdir ~/Backup-$dateNow
	cp -R ~/source/. ~/Backup-$dateNow
	echo New Backup-$dateNow >> ~/backup-report 
	for file in ~/Backup-$dateNow/*
	do
		filename=$(basename $file)
		echo $filename >> ~/backup-report
	done
else
	if [[ $recentBackUp -ne $dateNow ]]
	then
		echo Copying to Backup-$recentBackUp >> ~/backup-report 
		for file in ~/source/*
		do
			filename=$(basename $file)
			filesizeOld=$(stat -c%s "$file")
			#echo $FILENAME
			if [[ -f ~/Backup-$recentBackUp/$filename ]]
			then
				echo exists already	
				if [[ $filesizeOld < $(stat -c%s ~/Backup-$recentBackUp/$filename) ]]
				then
					echo nothing new
				else
					echo renaming...
					mv ~/Backup-$RecentBackUp/$FILENAME ~/Backup-$recentBackUp/$filename$dateNow
					cp $file ~/Backup-$recentBackUp/
					echo $filename$dateNow >> ~/backup-report
					echo $filename >> ~/backup-report
				fi
			else
				cp $file ~/Backup-$recentBackUp/
				echo $filename >> ~/backup-report
			fi
		done	
	else
		echo kok
	fi
fi 
