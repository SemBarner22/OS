#!/bin/bash

cat text.txt | awk 'NR==1'
cat text.txt | awk 'NR>1' | grep -v '#'
