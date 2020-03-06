#!/bin/bash

echo choose your destiny
read MenuNumber
case $MenuNumber in 
	0 )
	nano
	;;
	1 )
	vim
	;;
	2 )
	links
	;;
	3 )
	exit
	;;
esac	
