#!/bin/bash

> ans.txt
for file in /proc/[0-9]*/exe
do
	#if [[ $(readlink $file | awk 'NR==1 {print substr($0, 1, 6)}') == "/sbin/" ]]
        #if [ $(substr($(readlink $file), 1, 6)) == "/sbin/" ]
        #then
                #echo $(readlink $file)
        #        echo $file | grep -o -E "[0-9]*"
        #fi

	readlink $file | awk 'NR==1 {print $0}' >> ans.txt
done
cat ans.txt | sort | uniq -ic | sort -nr
