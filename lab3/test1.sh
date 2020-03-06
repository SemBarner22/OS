#!/bin/bash

> ans4.txt
ps -u $USER | awk 'NR>1 {print $2":"$11}' >> ans4.txt
wc -l ans4.txt | awk '{print $1}'
