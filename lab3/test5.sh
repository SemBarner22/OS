#!/bin/bash


C=$(ps aux | awk 'NR>1 {print $2; G="/proc/"$2"/status"; J="/proc/"$2"/sched"; system("echo "G" | xargs cat"); system("echo "J" | xargs cat")}')
C=$(echo "$C" |  grep -E "(^PPid)|(^Pid)|(^se.avg.util_sum)")
echo "$C" | tr -d ' ' | tr -d '\t' |awk -F: '{if ($1=="Pid" || $1=="PPid") {printf $2":";} else {print $2}}' | sort -nr -t ':' -k2
