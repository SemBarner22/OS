#!/bin/bash
echo $$ > .pid
A=1
MODE="rabota"
stop()
{
	MODE="ostanov"
}
trap 'stop' SIGTERM
usr()
{
	echo kek
}
trap 'usr' USR1
while true; do
	case $MODE in
		"rabota")
			let A=$A+1
			echo $A
			;;
		"ostanov")
			echo "Stopped by SIGTERM"
			exit
			;;
	esac
	sleep 1
done
