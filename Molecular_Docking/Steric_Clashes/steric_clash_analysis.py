from pymol import cmd
import os
import traceback

# Set paths
input_dir = "/home/zero/RFX1/Molecular_Docking/Input"
pdb_wt = os.path.join(input_dir, "TF_structure.pdb")
pdb_mut = os.path.join(input_dir, "TF_structure_mutations.pdb")
log_file = "clash_report.txt"

# Command logger
def log_cmd(step, func, *args, **kwargs):
    with open(log_file, "a") as f:
        f.write(f"\n--- Step {step}: {func.__name__}({', '.join(map(str, args))}) ---\n")
        try:
            result = func(*args, **kwargs)
            if result is not None:
                f.write(f"Result: {result}\n")
        except Exception as e:
            f.write(f"Error: {e}\n")
            f.write(traceback.format_exc())
    return

# Start fresh
open(log_file, "w").write("Steric Clash Analysis Log\n")

# Run commands with logging
log_cmd(1, cmd.load, pdb_wt, "wt")
log_cmd(2, cmd.load, pdb_mut, "mut")
log_cmd(3, cmd.align, "mut", "wt")
log_cmd(4, cmd.select, "wt_TF", "wt and chain P")
log_cmd(5, cmd.select, "wt_DNA", "wt and chain D")
log_cmd(6, cmd.select, "mut_TF", "mut and chain P")
log_cmd(7, cmd.select, "mut_DNA", "mut and chain D")
log_cmd(8, cmd.select, "clashes", "(mut_TF within 3.0 of mut_DNA)")
log_cmd(9, cmd.distance, "close_contacts", "mut_TF", "mut_DNA", 3.0)
log_cmd(10, cmd.label, "clashes", "resn + resi + name")
log_cmd(11, cmd.color, "red", "clashes")
log_cmd(12, cmd.color, "yellow", "close_contacts")

# Distance reporter
def report_distances(sel1='mut_TF', sel2='mut_DNA', cutoff=3.0):
    atoms1 = cmd.index(sel1)
    atoms2 = cmd.index(sel2)

    with open(log_file, "a") as f:
        f.write("\n--- Steric Clash Distance Report ---\n")
        for (model1, index1) in atoms1:
            for (model2, index2) in atoms2:
                sel1_str = f"(model {model1} and index {index1})"
                sel2_str = f"(model {model2} and index {index2})"
                try:
                    dist = cmd.get_distance(sel1_str, sel2_str)
                    if dist <= cutoff:
                        a1 = cmd.get_model(sel1_str).atom[0]
                        a2 = cmd.get_model(sel2_str).atom[0]
                        line = (f"{a1.resn}{a1.resi}/{a1.name} ({model1}) --> "
                                f"{a2.resn}{a2.resi}/{a2.name} ({model2}) = {dist:.2f} Å\n")
                        f.write(line)
                except Exception as e:
                    f.write(f"Error comparing {sel1_str} and {sel2_str}: {e}\n")

# Log distance report
report_distances()

# Exit PyMOL if run via CLI
cmd.quit()
