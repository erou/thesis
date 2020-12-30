set terminal post eps color enhanced font "Times, 20"
set out "embed-factor-2.eps"
#set lmargin 2.8
#set rmargin 0.5 
set palette rgb 33,13,10 
#set cbrange [0:90]
#set cbtics (10, 30, 50, 70, 90)
#unset colorbox
set datafile separator ","
set xtics (200, 400, 600, 800, 1000)# font ", 12" offset 0, 0
set xlabel "Degree of the departure algebra" offset 0, 0
set ylabel "Time (ms)" offset 0, 0 
#set ytics font ", 12" #offset 0.9, 0
set y2label "Level of the destination algebra"
set yrange [0.1:50]
set logscale y
#set ytics (0.1, 1, 10, 100, 1000, 6000)
#set logscale x
#plot "<(sed -n '303,494p' embed-3.txt)" u 4:($5*1000):3 notitle with points pt 7 palette
plot "embed-3.txt" u 2:($4==$2*2 ? $5*1000 : 1/0):3 notitle with points pt 7 palette
