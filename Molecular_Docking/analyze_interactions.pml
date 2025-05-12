load ./Wild_Docking/docked_result.pdb, WT_Complex
load ./MUT_Docking/docked_result.pdb, MUT_Complex

select WT_HBonds, (WT_Complex and name N*) within 3.5 of (WT_Complex and name O*)
select MUT_HBonds, (MUT_Complex and name N*) within 3.5 of (MUT_Complex and name O*)
distance WT_HBonds_Dist, (WT_Complex and name N*), (WT_Complex and name O*), 3.5
distance MUT_HBonds_Dist, (MUT_Complex and name N*), (MUT_Complex and name O*), 3.5

select WT_Clashes, (WT_Complex and name CA) within 2.0 of (WT_Complex and name CA)
select MUT_Clashes, (MUT_Complex and name CA) within 2.0 of (MUT_Complex and name CA)
distance WT_Clash_Dist, (WT_Complex and name CA), (WT_Complex and name CA), 2.0
distance MUT_Clash_Dist, (MUT_Complex and name CA), (MUT_Complex and name CA), 2.0

# Save session instead of unsupported .txt formats
save ./Binding_Affinity/WildType_vs_Mutant.pse

quit
