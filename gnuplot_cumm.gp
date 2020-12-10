set term gif animate delay 30 enhanced font "arial,14" size 1280,720
set output "graph_cumm.gif"
set grid ls 25
set datafile separator ','
set xdata time
set timefmt '%Y-%m-%d'
set xtics rotate
set title '2020 COVID-19 STATS OVER TIME (CUMULATIVE)'
set xlabel 'DATE'
set ylabel 'INFECTIONS/DEATHS'
do for [ii=1:num_lines] {
        plot 'data.csv' every ::1::ii u 1:2 w p lw 3 lc 2 title 'INFECTIONS AS OF DAY '.(ii+1), \
        '' every ::1::ii u 1:2 w l lw 6 lc 2 notitle smooth bezier, \
        '' every ::1::ii u 1:3 w p lw 3 lc 7 title 'DEATHS AS OF DAY '.(ii+1), \
        '' every ::1::ii u 1:3 w l lw 6 lc 7 notitle smooth bezier
};
exit