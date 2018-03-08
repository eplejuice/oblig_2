#!/bin/bash

function meny {

echo "  	
	1 - Hvem er jeg og hva er navnet på dette scriptet? 
	2 - Hvor lenge er det siden siste boot? 
	3 - Hvor mange prosesser og tråder finnes? 
	4 - Hvor mange context switcher fant sted siste sekund? 
	5 - Hvor stor andel av CPU-tiden ble benyttet i kernelmode og i usermode siste sekund? 
	6 - Hvor mange interrupts fant sted siste sekund? 
	9 - Avslutt dette scriptet
"
	read i;
printf "\n"
}


echo "Ta ditt valg:"
meny
while [[ "$i" != 9 ]]
do
	case $i in
		1) echo "Jeg er $(whoami) og dette scriptet heter $(basename "$0")";;
		2) echo "Tid siden siste boot: $(uptime | awk '{print $1}')";;
		3) echo "Det finnes $(ps axms --no-headers | wc -l) prosesser og $(ps aux --no-headers | wc -l) tråder.";;
		4) echo "Det var $(vmstat 1 2 | tail -1 | awk '{print $12}') context switcher siste sekund.";;
		5) echo "Prosent brukt i Usermode: $(vmstat 1 2 | tail -1| awk '{print $13}') og kernel mode: $(vmstat 1 2 | tail -1| awk '{print $13}') siste sekund ";;
		6) echo "Det var  $(vmstat 1 2 | tail -1 | awk '{print $11}') interrupts siste sekund.";;
		*) meny;;
	esac
	meny
done
