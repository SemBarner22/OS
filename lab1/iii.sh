#!/bin/bash

Out=""
Buf=""
read Buf
while [[ $Buf != "q" ]]
do
	Out+=$Buf
	read Buf
done
echo $Out
