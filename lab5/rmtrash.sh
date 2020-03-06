#!/bin/bash

A=$PWD
cd $HOME
A+=/"$1"
NUMBER=0
while [[ -e ~/.trash/$1_$NUMBER ]]
do
	(( NUMBER = $NUMBER + 1 ))
done	
NAME=$1_$NUMBER
B=$NAME
echo $A
cd .trash || mkdir .trash
ln $A $B
rm $A
echo $A >> ~/trash.log
echo $B >> ~/trash.log

