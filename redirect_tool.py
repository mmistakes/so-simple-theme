import os
import glob
import sys

# base_dir = "users/documentation/case-studies/"
# re_base = "documentation/case-studies/"
base_dir = "users/interfaces/"
re_base = "interfaces/"
files = [x.split("/")[-1] for x in
        glob.glob(base_dir + "*")]

for fn in files:
    print fn
    with open(re_base + fn, "w") as f:
        lines = ["---", "redirect_to: /" + base_dir + fn, "---"]
        f.write("\n".join(lines))
