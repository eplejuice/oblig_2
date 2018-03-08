#!/bin/bash

for PID in "$@"
do
	
	#A)
	printf "Totalt bruk av virtuelt minne: " >> "$PID".meminfo
	grep VmSize /proc/"$PID"/status | awk '{print $2 $3}' >> "$PID".meminfo
	
	#B)
	printf "Mengde virtuelt minne som er privat (i kB): " >> "$PID".meminfo
	x=$(grep VmData /proc/"$PID"/status | awk '{print $2}')
	y=$(($x+$(grep VmStk /proc/"$PID"/status | awk '{print $2}')))
	z=$(($y+$(grep VmExe /proc/"$PID"/status | awk '{print $2}')))  
	echo $z >> "$PID".meminfo
	

	#C)
	printf "Totalt minne som er shared: " >> "$PID".meminfo
	grep VmLib /proc/"$PID"/status | awk '{print $2 $3}' >> "$PID".meminfo

	#D)
	printf "Totalt bruk av fysisk minne: " >> "$PID".meminfo
	grep VmRSS /proc/7707/status | awk '{print $2 $3}' >> "$PID".meminfo

	#E)
	printf "Mengde fysisk minne som benyttes til page table: " >> "$PID".meminfo
	grep VmPTE /proc/7707/status | awk '{print $2 $3}' >> "$PID".meminfo

done
