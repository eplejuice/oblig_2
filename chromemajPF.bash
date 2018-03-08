#!/bin/bash


#Henter ut alle pid til alle kjørende chrome prosesser og går gjennom hver enkel.
for i in $(pgrep chrome); do

#Lagrer unna hvor mange page fault prosessen forårsaket i en egen variabel til senere bruk.
y=$(ps --no-headers -o maj_flt "$i") 
echo "Chrome $i har forårsekt $y major page faults"

#Sjekker om en prosess har mer enn 1000 page faults.
if [ "$y" -gt 1000 ]
then
	echo "(mer enn 1000!)"
fi
done 
