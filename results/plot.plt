
set terminal pdf size 10,5
set out "benchmarkResult.pdf"

set multiplot layout 2,1

set xlabel 'Count of lines'
set ylabel 'Duration in Seconds

plot 'results_unix.csv' w linespoint

#obtained by cat results_java.txt | tr "," "." | awk '{print $2" "1/$5}' > results_java.csv
plot 'results_java.csv' w linespoint

unset multiplot
unset out
