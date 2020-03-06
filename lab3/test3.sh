#!/bin/bash

for file in $(find /proc/[0-9]*/exe)
do
	#echo $file0~
	#if [ $(awk 'NR==1 {print substr($0, 1, 6)}' $(readlink $file)) == "/sbin/" ]
	if [[ $(readlink $file | awk 'NR==1 {print substr($0, 1, 6)}') == "/sbin/" ]]
	#if [ $(substr($(readlink $file), 1, 6)) == "/sbin/" ]
	then
		#echo $(readlink $file)
		echo $file | grep -o -E "[0-9]*"
	fi
done

