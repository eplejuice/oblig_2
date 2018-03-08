#!/bin/bash




#Går i en løkke for alle parametre som blir sendt med og utfører innmaten på hver enkelt.
#Gjør nesten det samme i hver case, bruker grep for å hente ut en spesifikk linje i filen /proc/<PID>status,
# for så å bruke awk for å skrive ut resultat number to på linja som i de fleste tilfeller er dataene vi er ute etter. $3 er bare for å få med "kB" bak,
# men dette gikk ikke i oppgave B da det fungerer dårlig å plusse sammen et tall og "kB".
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
