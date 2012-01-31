set terminal postscript eps enhanced color

set output "record_120108_19.eps"

set size 2,2

set ylabel "response time"
set xlabel "time"

set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"

plot 'record_data_120108_19.txt' using 1:3 
