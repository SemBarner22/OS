#!/bin/bash
C=$(ps aux | awk 'NR>1 {print $2; G="/proc/"$2"/status"; J="/proc/"$2"/sched"; system("echo "G" | xargs cat"); system("echo "J" | xargs cat")}')
C=$(echo "$C" |  grep -E "(^PPid)|(^Pid)|(^se.avg.util_sum)")
C=$(echo "$C" | tr -d ' ' | tr -d '\t' |awk -F: '{if ($1=="Pid" || $1=="PPid") {printf $2":";} else {print $2}}' | sort -nr -t ':' -k2)

echo "$C" > from6.txt

AMOUNT=0
AVG=0
OLDFIRST=-1
OLDSECOND=-1
OLDTHIRD=-1
while read p
do
	FIRST=$(echo "$p" | awk -F: '{print $1}')
	SECOND=$(echo "$p" | awk -F: '{print $2}')
	THIRD=$(echo "$p" | awk -F: '{print $3}')
	if (( $OLDSECOND == $SECOND ||  $OLDSECOND == -1 ))
	then
		#if (( $OLDSECOND == -1 ))
		#then
		#	(( AVG = 1 ))
		#	(( AMOUNT = 1 ))
		#else
			(( AVG = $AVG + $THIRD ))
			(( AMOUNT = $AMOUNT + 1 ))
		#fi
	else
		echo
		echo "$OLDSECOND" "is" $(( $AVG / $AMOUNT ))
		echo
		(( AVG = $THIRD ))
		(( AMOUNT = 1 ))
	fi
	OLDSECOND=$SECOND
	OLDFIRST=$FIRST
	OLDTHIRD=$THIRD
	echo "$p"
done < from6.txt
echo
echo "$OLDSECOND" "is" $(( $AVG / $AMOUNT ))
echo

