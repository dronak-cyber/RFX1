#!/bin/bash

# ============ CONFIG ============
WT_DIR="./Wild_Docking"
MUT_DIR="./MUT_Docking"
OUT_DIR="./Binding_Affinity"
mkdir -p "$OUT_DIR"

DEPENDENCIES=(pymol pdb2pqr apbs grep awk bc)

# ============ CHECK DEPENDENCIES ============
echo "[*] Checking required dependencies..."
missing_tools=()

for tool in "${DEPENDENCIES[@]}"; do
    if ! command -v "$tool" &> /dev/null; then
        echo "[!] Missing: $tool"
        missing_tools+=("$tool")
    else
        echo "[✓] $tool found"
    fi
done

# Attempt to auto-install common packages
if [ ${#missing_tools[@]} -ne 0 ]; then
    echo "[*] Attempting to install missing dependencies..."

    # Check if the system uses apt or yum
    if command -v apt &> /dev/null; then
        PKG_MANAGER="sudo apt"
    elif command -v yum &> /dev/null; then
        PKG_MANAGER="sudo yum"
    else
        echo "[!] Could not detect package manager (apt or yum). Please install these manually:"
        printf '%s\n' "${missing_tools[@]}"
        exit 1
    fi

    for tool in "${missing_tools[@]}"; do
        case "$tool" in
            pymol)
                echo "[*] Installing PyMOL..."
                $PKG_MANAGER install -y pymol || echo "[!] PyMOL install failed. Install manually from https://pymol.org/2/"
                ;;
            pdb2pqr)
                echo "[*] Installing pdb2pqr..."
                $PKG_MANAGER install -y pdb2pqr || echo "[!] pdb2pqr install failed. Visit https://pdb2pqr.readthedocs.io/"
                ;;
            apbs)
                echo "[*] Installing APBS..."
                $PKG_MANAGER install -y apbs || echo "[!] APBS install failed. Visit https://apbs-pdb2pqr.readthedocs.io/"
                ;;
            *)
                echo "[*] Installing $tool..."
                $PKG_MANAGER install -y "$tool" || echo "[!] $tool install failed."
                ;;
        esac
    done

    echo "[*] Rechecking dependencies..."
    for tool in "${missing_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            echo "[✗] $tool still missing. Exiting."
            exit 1
        else
            echo "[✓] $tool installed successfully."
        fi
    done
fi

# ============ START ANALYSIS ============

echo "[*] Comparing binding affinities..."
grep "^REMARK VINA RESULT:" "$WT_DIR/docked_result.pdb" | awk '{print $4}' > "$OUT_DIR/wt_affinity.txt"
grep "^REMARK VINA RESULT:" "$MUT_DIR/docked_result.pdb" | awk '{print $4}' > "$OUT_DIR/mut_affinity.txt"

WT_BA=$(head -n 1 "$OUT_DIR/wt_affinity.txt")
MUT_BA=$(head -n 1 "$OUT_DIR/mut_affinity.txt")
echo "Wild-Type Binding Affinity: $WT_BA kcal/mol" > "$OUT_DIR/Binding_Affinity_Comparison.txt"
echo "Mutant Binding Affinity: $MUT_BA kcal/mol" >> "$OUT_DIR/Binding_Affinity_Comparison.txt"
echo "Difference: $(echo "$WT_BA - $MUT_BA" | bc) kcal/mol" >> "$OUT_DIR/Binding_Affinity_Comparison.txt"
echo "[✓] Binding affinity comparison saved to Binding_Affinity_Comparison.txt"

echo "[*] Generating PyMOL analysis script..."
cat << EOF > analyze_interactions.pml
load $WT_DIR/docked_result.pdb, WT_Complex
load $MUT_DIR/docked_result.pdb, MUT_Complex

select WT_HBonds, (WT_Complex and name N*) within 3.5 of (WT_Complex and name O*)
select MUT_HBonds, (MUT_Complex and name N*) within 3.5 of (MUT_Complex and name O*)
distance WT_HBonds_Dist, (WT_Complex and name N*), (WT_Complex and name O*), 3.5
distance MUT_HBonds_Dist, (MUT_Complex and name N*), (MUT_Complex and name O*), 3.5

select WT_Clashes, (WT_Complex and name CA) within 2.0 of (WT_Complex and name CA)
select MUT_Clashes, (MUT_Complex and name CA) within 2.0 of (MUT_Complex and name CA)
distance WT_Clash_Dist, (WT_Complex and name CA), (WT_Complex and name CA), 2.0
distance MUT_Clash_Dist, (MUT_Complex and name CA), (MUT_Complex and name CA), 2.0

save $OUT_DIR/WildType_vs_Mutant.pse
quit
EOF

echo "[*] Running PyMOL..."
pymol -cq analyze_interactions.pml
echo "[✓] PyMOL session saved as WildType_vs_Mutant.pse"

echo "[*] Running APBS electrostatics..."

pdb2pqr --ff=parse "$WT_DIR/docked_result.pdb" "$OUT_DIR/wt.pqr"
cat << EOF > "$OUT_DIR/wt.in"
read
    mol pqr "$OUT_DIR/wt.pqr"
end
elec
    mg-auto
    dime 97 97 97
    cglen 80 80 80
    fglen 60 60 60
    cgcent mol 1
    fgcent mol 1
    mol 1
    lpbe
    bcfl sdh
    pdie 2.0
    sdie 78.0
    srfm smol
    chgm spl2
    srad 1.4
    swin 0.3
    temp 298.15
    calcenergy total
    calcforce no
    write pot dx wt
end
quit
EOF
apbs "$OUT_DIR/wt.in" && cp "$OUT_DIR/wt.dx" "$OUT_DIR/WT_Electrostatics.dx"

pdb2pqr --ff=parse "$MUT_DIR/docked_result.pdb" "$OUT_DIR/mut.pqr"
cat << EOF > "$OUT_DIR/mut.in"
read
    mol pqr "$OUT_DIR/mut.pqr"
end
elec
    mg-auto
    dime 97 97 97
    cglen 80 80 80
    fglen 60 60 60
    cgcent mol 1
    fgcent mol 1
    mol 1
    lpbe
    bcfl sdh
    pdie 2.0
    sdie 78.0
    srfm smol
    chgm spl2
    srad 1.4
    swin 0.3
    temp 298.15
    calcenergy total
    calcforce no
    write pot dx mut
end
quit
EOF
apbs "$OUT_DIR/mut.in" && cp "$OUT_DIR/mut.dx" "$OUT_DIR/MUT_Electrostatics.dx"

echo "[✓] Electrostatic maps generated."
echo "✅ All results saved in $OUT_DIR/"
