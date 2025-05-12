gnuplot -persist <<EOF
set terminal png size 1000,600
set output "WT_vs_MUT_potential_comparison.png"
set title "WT vs MUT Electrostatic Potential Distribution"
set xlabel "Potential (kT/e)"
set ylabel "Frequency"
set style fill solid 0.5 border -1
plot \
  "WT/potential_histogram.dat" using 1:2 with boxes title "WT", \
  "MUT/potential_histogram.dat" using 1:2 with boxes title "MUT" linecolor rgb "red"
EOF
