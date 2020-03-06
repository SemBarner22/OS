#!/bin/bash
echo $$ > .pid
A=1
MODE="rabota"
stop()
{
	MODE="ostanov"
}
trap 'stop' SIGTERM
add()
{
	(( A = $A + 2 ))
	echo $A
}
trap 'add' USR1
umn()
{
	(( A = $A * 2 ))
	echo $A
}
trap 'umn' USR2
while true; do
	case $MODE in
		# "rabota")
			#let A=$A+1
			#echo $A
		#	;;
		"ostanov")
			echo "Stopped by SIGTERM"
			exit
			;;
	esac
	sleep 1
done
