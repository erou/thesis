set terminal post eps color enhanced font "Times, 20"
set out "solve-h90-11.eps"
#set lmargin 2.8
#set rmargin 0.5 
set palette rgb 33,13,10 
#set cbrange [0:90]
#set cbtics (10, 30, 50, 70, 90)
#unset colorbox
set datafile separator ","
set xtics (200, 400, 600, 800, 1000)# font ", 12" offset 0, 0
set xlabel "Degree of the algebra" offset 0, 0.5
set ylabel "Time (ms)" offset 0, 0 
#set ytics font ", 12" #offset 0.9, 0
set y2label "Level of the algebra"
set yrange [0.1:40000]
set logscale y
#set logscale x
plot 'solve-h90-11.txt' u 2:($3*1000):1 notitle with points pt 7 palette
