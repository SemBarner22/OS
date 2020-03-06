#!/bin/bash

mkdir ~/test && 
{
echo "catalog test was created successfully" > ~/report.txt
cd ..
cd test
touch $(ps uax --sort=start_time | tac | awk 'NR==1 {print $9}')
} 
ping www.net_nikogo.ru || echo "not found" >> ~/report.txt
