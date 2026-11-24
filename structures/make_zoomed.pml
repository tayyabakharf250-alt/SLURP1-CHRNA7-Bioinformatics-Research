reinitialize
bg_color white
set ray_opaque_background, 1
set antialias, 2
set label_color, black
set label_size, 24
set stick_radius, 0.18

python
from pymol import cmd

variants = [
    ("R71H", 71),
    ("R71P", 71),
    ("C77R", 77),
    ("P82S", 82),
    ("G86R", 86)
]

for variant, pos in variants:
    cmd.delete("all")
    cmd.load("SLURP1_WT_rank001.pdb", "WT")
    cmd.load("SLURP1_" + variant + "_rank001.pdb", "MUT")

    cmd.align("MUT", "WT")
    cmd.hide("everything")
    cmd.show("cartoon", "all")
    cmd.color("marine", "WT")
    cmd.color("orange", "MUT")

    cmd.show("sticks", f"WT and resi {pos}")
    cmd.color("yellow", f"WT and resi {pos}")
    cmd.show("sticks", f"MUT and resi {pos}")
    cmd.color("red", f"MUT and resi {pos}")

    cmd.select(
        "local",
        f"byres ((WT within 8 of (WT and resi {pos})) or "
        f"(MUT within 8 of (MUT and resi {pos})))"
    )
    cmd.zoom("local", 5)
    cmd.label(f"MUT and resi {pos} and name CA", '"' + variant + '"')

    cmd.png(
        f"final_figures/{variant}_zoom.png",
        width=1800,
        height=1200,
        dpi=300,
        ray=1
    )

    print("Saved:", variant)

python end
quit
