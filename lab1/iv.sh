#!/bin/bash

Amount=0
read Cur
while (( $Cur % 2 != 0 ))
do
	((Amount += 1))
	read Cur
done
echo $Amount

