#!/bin/bash
read STRING
AMOUNT=0
for TOKEN in $STRING 
do
	if (( $TOKEN % 2 == 0 ))
	then
		break
	fi
	((AMOUNT += 1))
done
echo $AMOUNT
	

