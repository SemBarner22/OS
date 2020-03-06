#!/bin/bash

while true
do
	read LINE
	case $LINE in LINE)
		kill -USR1 $(cat .pid)  
		;;
		TERM)
		kill -SIGTERM $(cat .pid)
	esac
done

