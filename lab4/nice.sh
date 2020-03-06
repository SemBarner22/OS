#!/bin/bash

~/lab4/test4.2.sh&
A=$! 
~/lab4/test4.1.sh&
B=$!
cpulimit -l 20 -p $A -b
cpulimit -l 80 -p $B -b
#nice -n 100 ~/lab4/test4.1.sh&
#nice -n -5 ~/lab4/test4.2.sh&


