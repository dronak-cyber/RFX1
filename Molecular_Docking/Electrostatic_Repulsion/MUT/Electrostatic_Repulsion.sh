#!/bin/bash

# Set filenames
PQR_FILE="TF_structure_mutations.pqr"
POTENTIAL_FILE="${PQR_FILE}.dx"
CLEAN_PDB="TF_structure_cleaned.pdb"
TXT_OUTPUT="potential_values.txt"
SUMMARY="electrostatics_summary.txt"
APBS_INPUT="apbs_input.in"

# Step 1: Run pdb2pqr
echo "[Step 1] Running pdb2pqr..."
pdb2pqr --ff AMBER --pdb-output "$CLEAN_PDB" /home/zero/RFX1/Molecular_Docking/Input/TF_structure_mutations.pdb "$PQR_FILE"

# Step 2: Create APBS input file
echo "[Step 2] Generating APBS input file..."
cat <<EOF > "$APBS_INPUT"
read
  mol pqr $PQR_FILE
end

elec
  mg-auto
  dime 129 129 129
  cglen 80.0 80.0 80.0
  fglen 40.0 40.0 40.0
  cgcent mol 1
  fgcent mol 1
  mol 1
  lpbe
  bcfl sdh
  ion charge 1.0 conc 0.150 radius 2.0
  ion charge -1.0 conc 0.150 radius 1.8
  pdie 2.0
  sdie 78.0
  srfm smol
  chgm spl2
  sdens 10.0
  srad 1.4
  swin 0.3
  temp 298.15
  calcenergy total
  calcforce no
  write pot dx $PQR_FILE
end

quit
EOF

# Step 3: Run APBS
echo "[Step 3] Running APBS..."
apbs "$APBS_INPUT"

# Step 4: Extract potential values
echo "[Step 4] Extracting potential values..."
grep -v '^#\|^object\|^gridpositions\|^grid' "$POTENTIAL_FILE" > "$TXT_OUTPUT"

# Step 5: Analyze potential values
echo "[Step 5] Analyzing potential values..."
{
echo "Analyzing potential values..."
echo "-----------------------------------"
echo "Min / Max / Mean electrostatic potentials:"
awk '{ sum+=$1; count+=1; if(min==""){min=max=$1}; if($1>max){max=$1}; if($1<min){min=$1} } END { print "Min:", min, "\nMax:", max, "\nMean:", sum/count }' "$TXT_OUTPUT"

echo -e "\nHighly positive regions (> +10.0):"
awk '$1 > 10.0' "$TXT_OUTPUT" | wc -l

echo -e "\nHighly negative regions (< -10.0):"
awk '$1 < -10.0' "$TXT_OUTPUT" | wc -l
} > "$SUMMARY"

# Step 6: Generate histogram if gnuplot is installed
if command -v gnuplot &> /dev/null; then
  echo "[Step 6] Generating histogram..."
  HISTO_DATA="potential_histogram.dat"
  awk '{bin=int($1); count[bin]++} END {for (b in count) print b, count[b]}' "$TXT_OUTPUT" | sort -n > "$HISTO_DATA"
  gnuplot -persist <<-EOF
    set terminal png size 800,600
    set output 'potential_histogram.png'
    set title "Electrostatic Potential Distribution"
    set xlabel "Potential (kT/e)"
    set ylabel "Frequency"
    plot "$HISTO_DATA" using 1:2 with boxes notitle
EOF
  echo -e "\nHistogram saved to potential_histogram.png" >> "$SUMMARY"
else
  echo "[Step 6] Gnuplot not found. Skipping histogram generation." >> "$SUMMARY"
fi

# Final log
echo -e "\n[Done] Electrostatic analysis complete. Summary written to $SUMMARY."
