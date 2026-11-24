
import pandas as pd
from Bio import SeqIO

reference = str(SeqIO.read("../SLURP1_reference_verified.fasta", "fasta").seq)
df = pd.read_csv("SLURP1_mutations.csv")

results = []

for _, row in df.iterrows():
    position = int(row["Position"])
    expected = row["Reference_AA"]
    actual = reference[position - 1]

    status = "Verified" if actual == expected else "Mismatch"

    results.append({
        "Variant": row["Variant"],
        "Position": position,
        "Expected": expected,
        "Actual": actual,
        "Alternate": row["Alternate_AA"],
        "Status": status
    })

results_df = pd.DataFrame(results)

print(results_df)
print("\nTotal variants:", len(results_df))
print("Verified:", (results_df["Status"] == "Verified").sum())
print("Mismatches:", (results_df["Status"] == "Mismatch").sum())

results_df.to_csv("mutation_verification_results.csv", index=False)
print("\nResults saved successfully!")



