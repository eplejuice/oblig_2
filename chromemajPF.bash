#!/bin/bash

for i in $(pgrep chrome); do

y=$(ps --no-headers -o maj_flt "$i") 
echo "Chrome $i har forårsekt $y major page faults"
if [ "$y" -gt 1000 ]
then
	echo "(mer enn 1000!)"
fi
done 
