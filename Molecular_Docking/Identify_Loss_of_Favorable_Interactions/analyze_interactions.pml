load /home/zero/RFX1/Molecular_Docking/Input/TF_structure_mutations.pdb

# Define output log
python
logfile = "/home/zero/RFX1/Molecular_Docking/Identify_Loss_of_Favorable_Interactions/interaction_analysis_log.txt"
log = open(logfile, "w")
def logprint(s):
    print(s)
    log.write(s + "\n")
python end

# Selections
select TF, chain P
select DNA, chain D

# Hydrogen Bonds
python
from pymol import cmd
logprint("\n[Hydrogen Bonds]")
count = 0
for atm1 in cmd.index("TF and name N*"):
    for atm2 in cmd.index("DNA and name O*"):
        dist = cmd.get_distance(f"index {atm1[1]}", f"index {atm2[1]}")
        if dist < 3.5:
            a1 = cmd.get_model(f"index {atm1[1]}").atom[0]
            a2 = cmd.get_model(f"index {atm2[1]}").atom[0]
            logprint(f"H-Bond {count+1}: {a1.resn}{a1.resi}-{a1.name} (chain {a1.chain}) <--> {a2.resn}{a2.resi}-{a2.name} (chain {a2.chain}) | Distance: {dist:.2f} Å")
            count += 1
logprint(f"Total: {count}")
python end

# Salt Bridges
python
logprint("\n[Salt Bridges]")
count = 0
for atm1 in cmd.index("TF and (resn ARG+LYS) and name NH*+NZ"):
    for atm2 in cmd.index("DNA and name OP1+OP2+O1P+O2P"):
        dist = cmd.get_distance(f"index {atm1[1]}", f"index {atm2[1]}")
        if dist < 4.0:
            a1 = cmd.get_model(f"index {atm1[1]}").atom[0]
            a2 = cmd.get_model(f"index {atm2[1]}").atom[0]
            logprint(f"Salt Bridge {count+1}: {a1.resn}{a1.resi}-{a1.name} (chain {a1.chain}) <--> {a2.resn}{a2.resi}-{a2.name} (chain {a2.chain}) | Distance: {dist:.2f} Å")
            count += 1
logprint(f"Total: {count}")
python end

# Hydrophobic Contacts
python
logprint("\n[Hydrophobic Contacts]")
count = 0
for atm1 in cmd.index("TF and (resn ALA+VAL+LEU+ILE+MET+PHE+TRP+PRO)"):
    for atm2 in cmd.index("DNA and (resn DA+DT+DG+DC)"):
        dist = cmd.get_distance(f"index {atm1[1]}", f"index {atm2[1]}")
        if dist < 4.0:
            a1 = cmd.get_model(f"index {atm1[1]}").atom[0]
            a2 = cmd.get_model(f"index {atm2[1]}").atom[0]
            logprint(f"Hydrophobic Contact {count+1}: {a1.resn}{a1.resi}-{a1.name} (chain {a1.chain}) <--> {a2.resn}{a2.resi}-{a2.name} (chain {a2.chain}) | Distance: {dist:.2f} Å")
            count += 1
logprint(f"Total: {count}")
python end

# Save final structure with selections
python
import os
out_dir = "/home/zero/RFX1/Molecular_Docking/Identify_Loss_of_Favorable_Interactions"
if not os.path.exists(out_dir):
    os.makedirs(out_dir)
cmd.save(out_dir + "/TF_structure_with_interactions.pdb")
log.close()
python end

quit
