#!/bin/bash

echo "\begin{table}[ht]" > table.tex
echo "\begin{tabular}{ |c|c|c|c|c| }" >> table.tex
echo "\hline" >> table.tex
echo "& MSI & MESI & Dragon & Firefly\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Read Txns & " >> table.tex
cat msi-$1-$2-$3.out | grep "reads" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "reads" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "reads" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "reads" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Read Misses & " >> table.tex
cat msi-$1-$2-$3.out | grep "read misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "read misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "read misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "read misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Write Txns & " >> table.tex
cat msi-$1-$2-$3.out | grep "writes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "writes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "writes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "writes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Write Misses & " >> table.tex
cat msi-$1-$2-$3.out | grep "write misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "write misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "write misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "write misses" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Miss Rate & " >> table.tex
cat msi-$1-$2-$3.out | grep "miss rate" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "miss rate" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "miss rate" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "miss rate" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Writebacks & " >> table.tex
cat msi-$1-$2-$3.out | grep "writebacks" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "writebacks" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "writebacks" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "writebacks" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Memory Txns & " >> table.tex
cat msi-$1-$2-$3.out | grep "memory transactions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "memory transactions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "memory transactions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "memory transactions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Cache 2 Cache & " >> table.tex
cat msi-$1-$2-$3.out | grep "cache-to-cache" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "cache-to-cache" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "cache-to-cache" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "cache-to-cache" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Interventions & " >> table.tex
cat msi-$1-$2-$3.out | grep "interventions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "interventions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "interventions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "interventions" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Invalidations & " >> table.tex
cat msi-$1-$2-$3.out | grep "invalidations" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "invalidations" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "invalidations" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "invalidations" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "Flushes & " >> table.tex
cat msi-$1-$2-$3.out | grep "flushes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "flushes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "flushes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "flushes" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "BusRds & " >> table.tex
cat msi-$1-$2-$3.out | grep "BusRds" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "BusRds" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "BusRds" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "BusRds" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "BusRdXs & " >> table.tex
cat msi-$1-$2-$3.out | grep "BusRdXs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "BusRdXs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "BusRdXs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "BusRdXs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "BusUpgrs & " >> table.tex
cat msi-$1-$2-$3.out | grep "BusUpgrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "BusUpgrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "BusUpgrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "BusUpgrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex
echo "\cline{0-4}" >> table.tex


echo -n "BusWrs & " >> table.tex
cat msi-$1-$2-$3.out | grep "BusWrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat mesi-$1-$2-$3.out | grep "BusWrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat firefly-$1-$2-$3.out | grep "BusWrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo -n " & " >> table.tex
cat dragon-$1-$2-$3.out | grep "BusWrs" | awk '{print $NF}' | awk '{s+=$1} END {print s}' | tr -d '\n' >> table.tex
echo "\\\\" >> table.tex

echo "\cline{0-4}" >> table.tex
echo "\hline" >> table.tex
echo "\end{tabular}" >> table.tex
echo "\end{table}" >> table.tex