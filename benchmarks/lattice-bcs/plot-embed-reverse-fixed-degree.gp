set terminal post eps color enhanced font "Times, 20"
set out "embed-fixed-degree-from-12-to-24-down.eps"
#set lmargin 2.8
#set rmargin 0.5 
set palette rgb 33,13,10 
#set cbrange [1:5]
#set cbtics (1, 2, 3, 5)
set y2label "Defect of the embedding"
#unset colorbox
set datafile separator ","
#set xtics (200, 400, 600, 800, 1000)# font ", 12" offset 0, 0
set xlabel "Degree of the departure field" offset 0, 0
set ylabel "Time (s)" offset 0, 0 
#set ytics font ", 12" #offset 0.9, 0
#set yrange [0.0001:700]
set logscale y
#set ytics (0.1, 1, 10, 100, 1000, 6000)
#set logscale x
#set xrange[0.9:300]
plot "embeddings-reverse-full-3.txt" u 1:($2==2*$1 && $1 > 1 ? $5 : 1/0):($1/$4) notitle with points pt 7 palette
