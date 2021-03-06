set terminal post eps color enhanced font "Times, 20"
set out "solve-h90-primes-degree-16.eps"
#set lmargin 2.8
#set rmargin 0.5 
set palette rgb 33,13,10 
#set cbrange [0:90]
set cbtics (1, 2, 4)
#unset colorbox
set datafile separator ","
set xtics (2000, 4000, 6000, 8000, 10000)# font ", 12" offset 0, 0
set xlabel "Prime" offset 0, 0
set ylabel "Time (ms)" offset 0, 0 
#set ytics font ", 12" #offset 0.9, 0
set y2label "Level of the algebra"
set yrange [0:8]
#set logscale y
#set ytics (0.1, 1, 10, 100, 1000, 6000)
#set logscale x
plot 'solve-h90-primes-degree-16.txt' u 2:($3*1000):1 notitle with points pt 7 palette
