# Load the original complex
load TF_structure.pdb

# Remove all water molecules (resn HOH or solvent)
remove resn HOH
remove solvent

# Select and save protein only
select protein_only, polymer.protein
save Wild_Protein.pdb, protein_only

# Select and save DNA only
select dna_only, polymer.nucleic
save Wild_DNA.pdb, dna_only

# Quit PyMOL
quit
