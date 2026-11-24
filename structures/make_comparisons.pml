reinitialize
bg_color white
set ray_opaque_background, 1
set grid_mode, 1
set cartoon_fancy_helices, 1
set antialias, 2

# R71H
load SLURP1_WT_rank001.pdb, WT
load SLURP1_R71H_rank001.pdb, MUT
align MUT, WT
hide everything
show cartoon
color marine, WT
color orange, MUT
show sticks, MUT and resi 71
color red, MUT and resi 71
zoom all
png comparison_images/01_R71H.png, 1800, 1200, 1
delete all

# R71P
load SLURP1_WT_rank001.pdb, WT
load SLURP1_R71P_rank001.pdb, MUT
align MUT, WT
hide everything
show cartoon
color marine, WT
color orange, MUT
show sticks, MUT and resi 71
color red, MUT and resi 71
zoom all
png comparison_images/02_R71P.png, 1800, 1200, 1
delete all

# C77R
load SLURP1_WT_rank001.pdb, WT
load SLURP1_C77R_rank001.pdb, MUT
align MUT, WT
hide everything
show cartoon
color marine, WT
color orange, MUT
show sticks, MUT and resi 77
color red, MUT and resi 77
zoom all
png comparison_images/03_C77R.png, 1800, 1200, 1
delete all

# P82S
load SLURP1_WT_rank001.pdb, WT
load SLURP1_P82S_rank001.pdb, MUT
align MUT, WT
hide everything
show cartoon
color marine, WT
color orange, MUT
show sticks, MUT and resi 82
color red, MUT and resi 82
zoom all
png comparison_images/04_P82S.png, 1800, 1200, 1
delete all

# G86R
load SLURP1_WT_rank001.pdb, WT
load SLURP1_G86R_rank001.pdb, MUT
align MUT, WT
hide everything
show cartoon
color marine, WT
color orange, MUT
show sticks, MUT and resi 86
color red, MUT and resi 86
zoom all
png comparison_images/05_G86R.png, 1800, 1200, 1

quit
