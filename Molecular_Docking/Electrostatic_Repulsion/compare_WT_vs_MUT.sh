#!/bin/bash

# Define directories
WT_DIR="WT"
MUT_DIR="MUT"

# Define files
WT_POT="$WT_DIR/potential_values.txt"
MUT_POT="$MUT_DIR/potential_values.txt"
DIFF_FILE="WT_vs_MUT_difference.txt"
COMPARISON_SUMMARY="WT_vs_MUT_summary.txt"
COMPARISON_PLOT="WT_vs_MUT_potential_comparison.png"

# Step 1: Print summary files
echo "[Step 1] WT electrostatic summary:"
cat "$WT_DIR/electrostatics_summary.txt"
echo -e "\n[Step 1] MUT electrostatic summary:"
cat "$MUT_DIR/electrostatics_summary.txt"

# Step 2: Create a histogram comparison plot
echo -e "\n[Step 2] Generating comparative histogram plot..."
gnuplot <<EOF
set terminal png size 1000,600
set output "$COMPARISON_PLOT"
set title "WT vs MUT Electrostatic Potential Distribution"
set xlabel "Potential (kT/e)"
set ylabel "Frequency"
set style fill solid 0.4 border -1
set boxwidth 0.9
plot \
  "$WT_DIR/potential_histogram.dat" using 1:2 with boxes title "WT", \
  "$MUT_DIR/potential_histogram.dat" using 1:2 with boxes title "MUT" linecolor rgb "red"
EOF
echo "Histogram saved to $COMPARISON_PLOT"

# Step 3: Point-by-point potential difference
echo -e "\n[Step 3] Calculating potential differences..."
paste "$WT_POT" "$MUT_POT" | awk '{print $2 - $1}' > "$DIFF_FILE"

# Step 4: Statistical summary of differences
echo -e "\n[Step 4] Analyzing difference statistics..."
awk '{
  sum+=$1; count+=1;
  if(min==""){min=max=$1};
  if($1>max){max=$1};
  if($1<min){min=$1}
} END {
  print "Difference in Electrostatic Potentials (MUT - WT):" > "'$COMPARISON_SUMMARY'"
  print "------------------------------------------------------" >> "'$COMPARISON_SUMMARY'"
  print "Min Difference:", min >> "'$COMPARISON_SUMMARY'"
  print "Max Difference:", max >> "'$COMPARISON_SUMMARY'"
  print "Mean Difference:", sum/count >> "'$COMPARISON_SUMMARY'"
}' "$DIFF_FILE"

echo "Summary saved to $COMPARISON_SUMMARY"

# Final note
echo -e "\n[Done] Comparison complete. See:"
echo " - $COMPARISON_SUMMARY for summary"
echo " - $COMPARISON_PLOT for histogram comparison"
