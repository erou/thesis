#set terminal post eps color enhanced font "Times, 20"
#set out "embed-from-2-up-3.eps"
#set lmargin 2.8
#set rmargin 0.5 
#set palette rgb 33,13,10 
#set cbrange [0:90]
#set cbtics (10, 30, 50, 70, 90)
#unset colorbox
set datafile separator ","
#set xtics (200, 400, 600, 800, 1000)# font ", 12" offset 0, 0
set xlabel "Characteristic" offset 0, 0
set ylabel "Time (s)" offset 0, 0 
#set ytics font ", 12" #offset 0.9, 0
#set yrange [0:200]
#set logscale y
#set ytics (0.1, 1, 10, 100, 1000, 6000)
#set logscale x
plot "fixed-margin-0-0.txt" u 1:3 notitle with points pt 7
