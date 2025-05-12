#!/bin/bash

# === Filenames ===
RECEPTOR="MUT_Protein.pdbqt"
LIGAND="MUT_DNA.pdbqt"
CONFIG="config.txt"
OUTPUT="docked_output.pdbqt"
LOG="docking_log.txt"

# === Step 1: Auto-calculate docking box center from receptor ===
echo "[*] Calculating docking box center from $RECEPTOR..."
CENTER=$(grep "^ATOM" MUT_Protein.pdb | awk '{x+=$6; y+=$7; z+=$8; n++} END {print x/n, y/n, z/n}')
CX=$(echo $CENTER | cut -d' ' -f1)
CY=$(echo $CENTER | cut -d' ' -f2)
CZ=$(echo $CENTER | cut -d' ' -f3)

# === Step 2: Create config file ===
echo "[*] Creating config file..."
cat > $CONFIG <<EOF
receptor = $RECEPTOR
ligand = $LIGAND

center_x = $CX
center_y = $CY
center_z = $CZ

size_x = 30
size_y = 30
size_z = 30

exhaustiveness = 8
num_modes = 10
energy_range = 4
EOF

# === Step 3: Run docking ===
echo "[*] Running AutoDock Vina..."
vina --config "$CONFIG" --out "$OUTPUT" --log "$LOG"

# === Step 4: Convert output to PDB (if Open Babel is available) ===
echo "[*] Converting docked PDBQT to PDB..."
obabel "$OUTPUT" -O docked_result.pdb > /dev/null

echo "[✓] Docking complete!"
echo "[📁] Docked structure: docked_result.pdb"
echo "[📜] Docking log: $LOG"
