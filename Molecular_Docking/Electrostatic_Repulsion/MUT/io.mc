##############################################################################
# MC-shell I/O capture file.
# Creation Date and Time:  Wed Apr 23 12:23:50 2025
##############################################################################
Hello world from PE 0
Vnm_tstart: starting timer 26 (APBS WALL CLOCK)..
NOsh_parseInput:  Starting file parsing...
NOsh: Parsing READ section
NOsh: Storing molecule 0 path TF_structure_mutations.pqr
NOsh: Done parsing READ section
NOsh: Done parsing READ section (nmol=1, ndiel=0, nkappa=0, ncharge=0, npot=0)
NOsh: Parsing ELEC section
NOsh_parseMG: Parsing parameters for MG calculation
NOsh_parseMG:  Parsing dime...
PBEparm_parseToken:  trying dime...
MGparm_parseToken:  trying dime...
NOsh_parseMG:  Parsing cglen...
PBEparm_parseToken:  trying cglen...
MGparm_parseToken:  trying cglen...
NOsh_parseMG:  Parsing fglen...
PBEparm_parseToken:  trying fglen...
MGparm_parseToken:  trying fglen...
NOsh_parseMG:  Parsing cgcent...
PBEparm_parseToken:  trying cgcent...
MGparm_parseToken:  trying cgcent...
NOsh_parseMG:  Parsing fgcent...
PBEparm_parseToken:  trying fgcent...
MGparm_parseToken:  trying fgcent...
NOsh_parseMG:  Parsing mol...
PBEparm_parseToken:  trying mol...
NOsh_parseMG:  Parsing lpbe...
PBEparm_parseToken:  trying lpbe...
NOsh: parsed lpbe
NOsh_parseMG:  Parsing bcfl...
PBEparm_parseToken:  trying bcfl...
NOsh_parseMG:  Parsing ion...
PBEparm_parseToken:  trying ion...
NOsh_parseMG:  Parsing ion...
PBEparm_parseToken:  trying ion...
NOsh_parseMG:  Parsing pdie...
PBEparm_parseToken:  trying pdie...
NOsh_parseMG:  Parsing sdie...
PBEparm_parseToken:  trying sdie...
NOsh_parseMG:  Parsing srfm...
PBEparm_parseToken:  trying srfm...
NOsh_parseMG:  Parsing chgm...
PBEparm_parseToken:  trying chgm...
MGparm_parseToken:  trying chgm...
NOsh_parseMG:  Parsing sdens...
PBEparm_parseToken:  trying sdens...
NOsh_parseMG:  Parsing srad...
PBEparm_parseToken:  trying srad...
NOsh_parseMG:  Parsing swin...
PBEparm_parseToken:  trying swin...
NOsh_parseMG:  Parsing temp...
PBEparm_parseToken:  trying temp...
NOsh_parseMG:  Parsing calcenergy...
PBEparm_parseToken:  trying calcenergy...
NOsh_parseMG:  Parsing calcforce...
PBEparm_parseToken:  trying calcforce...
NOsh_parseMG:  Parsing write...
PBEparm_parseToken:  trying write...
NOsh_parseMG:  Parsing end...
MGparm_check:  checking MGparm object of type 1.
NOsh:  nlev = 6, dime = (129, 129, 129)
NOsh: Done parsing ELEC section (nelec = 1)
NOsh: Done parsing file (got QUIT)
Valist_readPQR: Counted 2068 atoms
Valist_getStatistics:  Max atom coordinate:  (73.912, 38.702, 75.082)
Valist_getStatistics:  Min atom coordinate:  (23.506, 4.791, 24.55)
Valist_getStatistics:  Molecule center:  (48.709, 21.7465, 49.816)
NOsh_setupCalcMGAUTO(/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1592):  coarse grid center = 48.709 21.7465 49.816
NOsh_setupCalcMGAUTO(/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1597):  fine grid center = 48.709 21.7465 49.816
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1609):  Coarse grid spacing = 0.625, 0.625, 0.625
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1611):  Fine grid spacing = 0.3125, 0.3125, 0.3125
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1613):  Displacement between fine and coarse grids = 0, 0, 0
NOsh:  2 levels of focusing with 0.5, 0.5, 0.5 reductions
NOsh_setupMGAUTO:  Resetting boundary flags
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1707):  starting mesh repositioning.
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1709):  coarse mesh center = 48.709 21.7465 49.816
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1714):  coarse mesh upper corner = 88.709 61.7465 89.816
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1719):  coarse mesh lower corner = 8.709 -18.2535 9.816
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1724):  initial fine mesh upper corner = 68.709 41.7465 69.816
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1729):  initial fine mesh lower corner = 28.709 1.7465 29.816
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1790):  final fine mesh upper corner = 68.709 41.7465 69.816
NOsh_setupCalcMGAUTO (/build/apbs-b3zSYg/apbs-1.4/src/generic/nosh.c, 1795):  final fine mesh lower corner = 28.709 1.7465 29.816
NOsh_setupMGAUTO:  Resetting boundary flags
NOsh_setupCalc:  Mapping ELEC statement 0 (1) to calculation 1 (2)
Vnm_tstart: starting timer 27 (Setup timer)..
Setting up PBE object...
Vpbe_ctor2:  solute radius = 33.2914
Vpbe_ctor2:  solute dimensions = 52.6042 x 36.4664 x 53.4692
Vpbe_ctor2:  solute charge = -7
Vpbe_ctor2:  bulk ionic strength = 0.15
Vpbe_ctor2:  xkappa = 0.127721
Vpbe_ctor2:  Debye length = 7.82954
Vpbe_ctor2:  zkappa2 = 1.27239
Vpbe_ctor2:  zmagic = 7042.98
Vpbe_ctor2:  Constructing Vclist with 75 x 72 x 75 table
Vclist_ctor2:  Using 75 x 72 x 75 hash table
Vclist_ctor2:  automatic domain setup.
Vclist_ctor2:  Using 2.5 max radius
Vclist_setupGrid:  Grid lengths = (63.47, 46.975, 63.596)
Vclist_setupGrid:  Grid lower corner = (16.974, -1.741, 18.018)
Vclist_assignAtoms:  Have 3635223 atom entries
Vacc_storeParms:  Surf. density = 10
Vacc_storeParms:  Max area = 265.904
Vacc_storeParms:  Using 2696-point reference sphere
Setting up PDE object...
Vpmp_ctor2:  Using meth = 2, mgsolv = 1
Setting PDE center to local center...
Vpmg_fillco:  filling in source term.
fillcoCharge:  Calling fillcoChargeSpline2...
Vpmg_fillco:  filling in source term.
Vpmg_fillco:  marking ion and solvent accessibility.
fillcoCoef:  Calling fillcoCoefMol...
Vacc_SASA: Time elapsed: 1.052725
Vpmg_fillco:  done filling coefficient arrays
Vpmg_fillco:  filling boundary arrays
Vpmg_fillco:  done filling boundary arrays
Vnm_tstop: stopping timer 27 (Setup timer).  CPU TIME = 2.603561e+00
Vnm_tstart: starting timer 28 (Solver timer)..
Vnm_tstart: starting timer 30 (Vmgdrv2: fine problem setup)..
Vbuildops: Fine: (129, 129, 129)
Vbuildops: Operator stencil (lev, numdia) = (1, 4)
Vnm_tstop: stopping timer 30 (Vmgdrv2: fine problem setup).  CPU TIME = 5.724000e-02
Vnm_tstart: starting timer 30 (Vmgdrv2: coarse problem setup)..
Vbuildops: Galer: (065, 065, 065)
Vbuildops: Galer: (033, 033, 033)
Vbuildops: Galer: (017, 017, 017)
Vbuildops: Galer: (009, 009, 009)
Vbuildops: Galer: (005, 005, 005)
Vnm_tstop: stopping timer 30 (Vmgdrv2: coarse problem setup).  CPU TIME = 1.130332e+00
Vnm_tstart: starting timer 30 (Vmgdrv2: solve)..
Vnm_tstop: stopping timer 40 (MG iteration).  CPU TIME = 3.966832e+00
Vprtstp: iteration = 0
Vprtstp: relative residual = 1.000000e+00
Vprtstp: contraction number = 1.000000e+00
Vprtstp: iteration = 1
Vprtstp: relative residual = 9.202926e-02
Vprtstp: contraction number = 9.202926e-02
Vprtstp: iteration = 2
Vprtstp: relative residual = 1.245357e-02
Vprtstp: contraction number = 1.353219e-01
Vprtstp: iteration = 3
Vprtstp: relative residual = 1.973735e-03
Vprtstp: contraction number = 1.584874e-01
Vprtstp: iteration = 4
Vprtstp: relative residual = 3.498606e-04
Vprtstp: contraction number = 1.772582e-01
Vprtstp: iteration = 5
Vprtstp: relative residual = 6.693027e-05
Vprtstp: contraction number = 1.913055e-01
Vprtstp: iteration = 6
Vprtstp: relative residual = 1.351436e-05
Vprtstp: contraction number = 2.019171e-01
Vprtstp: iteration = 7
Vprtstp: relative residual = 2.824305e-06
Vprtstp: contraction number = 2.089854e-01
Vprtstp: iteration = 8
Vprtstp: relative residual = 6.035115e-07
Vprtstp: contraction number = 2.136850e-01
Vnm_tstop: stopping timer 30 (Vmgdrv2: solve).  CPU TIME = 3.205599e+01
Vnm_tstop: stopping timer 28 (Solver timer).  CPU TIME = 3.340925e+01
Vpmg_setPart:  lower corner = (8.709, -18.2535, 9.816)
Vpmg_setPart:  upper corner = (88.709, 61.7465, 89.816)
Vpmg_setPart:  actual minima = (8.709, -18.2535, 9.816)
Vpmg_setPart:  actual maxima = (88.709, 61.7465, 89.816)
Vpmg_setPart:  bflag[FRONT] = 0
Vpmg_setPart:  bflag[BACK] = 0
Vpmg_setPart:  bflag[LEFT] = 0
Vpmg_setPart:  bflag[RIGHT] = 0
Vpmg_setPart:  bflag[UP] = 0
Vpmg_setPart:  bflag[DOWN] = 0
Vnm_tstart: starting timer 29 (Energy timer)..
Vpmg_energy:  calculating only q-phi energy
Vpmg_qfEnergyVolume:  Calculating energy
Vpmg_energy:  qfEnergy = 9.368523941471E+04 kT
Vnm_tstop: stopping timer 29 (Energy timer).  CPU TIME = 3.526000e-03
Vnm_tstart: starting timer 30 (Force timer)..
Vnm_tstop: stopping timer 30 (Force timer).  CPU TIME = 3.000000e-06
Vnm_tstart: starting timer 27 (Setup timer)..
Setting up PBE object...
Vpbe_ctor2:  solute radius = 33.2914
Vpbe_ctor2:  solute dimensions = 52.6042 x 36.4664 x 53.4692
Vpbe_ctor2:  solute charge = -7
Vpbe_ctor2:  bulk ionic strength = 0.15
Vpbe_ctor2:  xkappa = 0.127721
Vpbe_ctor2:  Debye length = 7.82954
Vpbe_ctor2:  zkappa2 = 1.27239
Vpbe_ctor2:  zmagic = 7042.98
Vpbe_ctor2:  Constructing Vclist with 75 x 72 x 75 table
Vclist_ctor2:  Using 75 x 72 x 75 hash table
Vclist_ctor2:  automatic domain setup.
Vclist_ctor2:  Using 2.5 max radius
Vclist_setupGrid:  Grid lengths = (63.47, 46.975, 63.596)
Vclist_setupGrid:  Grid lower corner = (16.974, -1.741, 18.018)
Vclist_assignAtoms:  Have 3635223 atom entries
Vacc_storeParms:  Surf. density = 10
Vacc_storeParms:  Max area = 265.904
Vacc_storeParms:  Using 2696-point reference sphere
Setting up PDE object...
Vpmp_ctor2:  Using meth = 2, mgsolv = 1
Setting PDE center to local center...
Vpmg_ctor2:  Filling boundary with old solution!
VPMG::focusFillBound -- New mesh mins = 28.709, 1.7465, 29.816
VPMG::focusFillBound -- New mesh maxs = 68.709, 41.7465, 69.816
VPMG::focusFillBound -- Old mesh mins = 8.709, -18.2535, 9.816
VPMG::focusFillBound -- Old mesh maxs = 88.709, 61.7465, 89.816
VPMG::extEnergy:  energy flag = 1
Vpmg_setPart:  lower corner = (28.709, 1.7465, 29.816)
Vpmg_setPart:  upper corner = (68.709, 41.7465, 69.816)
Vpmg_setPart:  actual minima = (8.709, -18.2535, 9.816)
Vpmg_setPart:  actual maxima = (88.709, 61.7465, 89.816)
Vpmg_setPart:  bflag[FRONT] = 0
Vpmg_setPart:  bflag[BACK] = 0
Vpmg_setPart:  bflag[LEFT] = 0
Vpmg_setPart:  bflag[RIGHT] = 0
Vpmg_setPart:  bflag[UP] = 0
Vpmg_setPart:  bflag[DOWN] = 0
VPMG::extEnergy:   Finding extEnergy dimensions...
VPMG::extEnergy    Disj part lower corner = (28.709, 1.7465, 29.816)
VPMG::extEnergy    Disj part upper corner = (68.709, 41.7465, 69.816)
VPMG::extEnergy    Old lower corner = (8.709, -18.2535, 9.816)
VPMG::extEnergy    Old upper corner = (88.709, 61.7465, 89.816)
Vpmg_qmEnergy:  Calculating linear energy
VPMG::extEnergy: extQmEnergy = 1.20339 kT
Vpmg_qfEnergyVolume:  Calculating energy
VPMG::extEnergy: extQfEnergy = 13222 kT
VPMG::extEnergy: extDiEnergy = 6599.47 kT
Vpmg_fillco:  filling in source term.
fillcoCharge:  Calling fillcoChargeSpline2...
Vpmg_fillco:  filling in source term.
Vpmg_fillco:  marking ion and solvent accessibility.
fillcoCoef:  Calling fillcoCoefMol...
Vacc_SASA: Time elapsed: 0.682474
Vpmg_fillco:  done filling coefficient arrays
Vnm_tstop: stopping timer 27 (Setup timer).  CPU TIME = 3.272986e+00
Vnm_tstart: starting timer 28 (Solver timer)..
Vnm_tstart: starting timer 30 (Vmgdrv2: fine problem setup)..
Vbuildops: Fine: (129, 129, 129)
Vbuildops: Operator stencil (lev, numdia) = (1, 4)
Vnm_tstop: stopping timer 30 (Vmgdrv2: fine problem setup).  CPU TIME = 5.692700e-02
Vnm_tstart: starting timer 30 (Vmgdrv2: coarse problem setup)..
Vbuildops: Galer: (065, 065, 065)
Vbuildops: Galer: (033, 033, 033)
Vbuildops: Galer: (017, 017, 017)
Vbuildops: Galer: (009, 009, 009)
Vbuildops: Galer: (005, 005, 005)
Vnm_tstop: stopping timer 30 (Vmgdrv2: coarse problem setup).  CPU TIME = 1.152862e+00
Vnm_tstart: starting timer 30 (Vmgdrv2: solve)..
Vnm_tstop: stopping timer 40 (MG iteration).  CPU TIME = 4.097810e+01
Vprtstp: iteration = 0
Vprtstp: relative residual = 1.000000e+00
Vprtstp: contraction number = 1.000000e+00
Vprtstp: iteration = 1
Vprtstp: relative residual = 1.547541e-01
Vprtstp: contraction number = 1.547541e-01
Vprtstp: iteration = 2
Vprtstp: relative residual = 1.892487e-02
Vprtstp: contraction number = 1.222899e-01
Vprtstp: iteration = 3
Vprtstp: relative residual = 2.526262e-03
Vprtstp: contraction number = 1.334890e-01
Vprtstp: iteration = 4
Vprtstp: relative residual = 3.746661e-04
Vprtstp: contraction number = 1.483085e-01
Vprtstp: iteration = 5
Vprtstp: relative residual = 6.234135e-05
Vprtstp: contraction number = 1.663918e-01
Vprtstp: iteration = 6
Vprtstp: relative residual = 1.137701e-05
Vprtstp: contraction number = 1.824955e-01
Vprtstp: iteration = 7
Vprtstp: relative residual = 2.205657e-06
Vprtstp: contraction number = 1.938696e-01
Vprtstp: iteration = 8
Vprtstp: relative residual = 4.430752e-07
Vprtstp: contraction number = 2.008813e-01
Vnm_tstop: stopping timer 30 (Vmgdrv2: solve).  CPU TIME = 3.209890e+01
Vnm_tstop: stopping timer 28 (Solver timer).  CPU TIME = 3.347436e+01
Vpmg_setPart:  lower corner = (28.709, 1.7465, 29.816)
Vpmg_setPart:  upper corner = (68.709, 41.7465, 69.816)
Vpmg_setPart:  actual minima = (28.709, 1.7465, 29.816)
Vpmg_setPart:  actual maxima = (68.709, 41.7465, 69.816)
Vpmg_setPart:  bflag[FRONT] = 0
Vpmg_setPart:  bflag[BACK] = 0
Vpmg_setPart:  bflag[LEFT] = 0
Vpmg_setPart:  bflag[RIGHT] = 0
Vpmg_setPart:  bflag[UP] = 0
Vpmg_setPart:  bflag[DOWN] = 0
Vnm_tstart: starting timer 29 (Energy timer)..
Vpmg_energy:  calculating only q-phi energy
Vpmg_qfEnergyVolume:  Calculating energy
Vpmg_energy:  qfEnergy = 2.671950390045E+05 kT
Vnm_tstop: stopping timer 29 (Energy timer).  CPU TIME = 3.498000e-03
Vnm_tstart: starting timer 30 (Force timer)..
Vnm_tstop: stopping timer 30 (Force timer).  CPU TIME = 2.000000e-06
Vgrid_writeDX:  Opening virtual socket...
Vgrid_writeDX:  Writing to virtual socket...
Vgrid_writeDX:  Writing comments for ASC format.
Vnm_tstop: stopping timer 26 (APBS WALL CLOCK).  CPU TIME = 7.405354e+01
