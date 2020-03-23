#!/bin/bash

echo "\begin{table}[ht]" > $1-$2-$3-table.tex
echo "\begin{tabular}{ |c|c|c|c|c| }" >> $1-$2-$3-table.tex
echo "\hline" >> $1-$2-$3-table.tex
echo "& MSI & MESI & Dragon & Firefly\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Read Txns & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "reads" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "reads" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "reads" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "reads" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Read Misses & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "read misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "read misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "read misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "read misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Write Txns & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "writes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "writes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "writes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "writes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Write Misses & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "write misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "write misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "write misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "write misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Miss Rate & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "miss rate" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "miss rate" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "miss rate" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "miss rate" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Writebacks & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "writebacks" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "writebacks" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "writebacks" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "writebacks" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Memory Txns & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "memory transactions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "memory transactions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "memory transactions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "memory transactions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Cache 2 Cache & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "cache-to-cache" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "cache-to-cache" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "cache-to-cache" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "cache-to-cache" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Interventions & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "interventions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "interventions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "interventions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "interventions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Invalidations & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "invalidations" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "invalidations" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "invalidations" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "invalidations" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "Flushes & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "flushes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "flushes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "flushes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "flushes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "BusRds & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "BusRds" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "BusRds" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "BusRds" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "BusRds" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "BusRdXs & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "BusRdXs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "BusRdXs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "BusRdXs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "BusRdXs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "BusUpgrs & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "BusUpgrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "BusUpgrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "BusUpgrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "BusUpgrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex
echo "\cline{0-4}" >> $1-$2-$3-table.tex


echo -n "BusWrs & " >> $1-$2-$3-table.tex
cat msi-$1-$2-$3.out | grep "BusWrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat mesi-$1-$2-$3.out | grep "BusWrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat firefly-$1-$2-$3.out | grep "BusWrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo -n " & " >> $1-$2-$3-table.tex
cat dragon-$1-$2-$3.out | grep "BusWrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> $1-$2-$3-table.tex
echo "\\\\" >> $1-$2-$3-table.tex

echo "\cline{0-4}" >> $1-$2-$3-table.tex
echo "\hline" >> $1-$2-$3-table.tex
echo "\end{tabular}" >> $1-$2-$3-table.tex
echo "\caption{\label{tab:table-name}$1 KB, $2 way associativity, $3 B block size}" >> $1-$2-$3-table.tex
echo "\end{table}" >> $1-$2-$3-table.tex