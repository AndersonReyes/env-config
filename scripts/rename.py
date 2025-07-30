# Rename tv files based on sorted index to episode standard

import glob
import sys
import os
import shutil

ext = sys.argv[1]
output = sys.argv[2]
season=sys.argv[3]

files = sorted(glob.glob(ext, recursive=True))

print("Files discovered: \n{}".format("\n".join(files)))

for idx, f in enumerate(files):
	oldname, ext = os.path.splitext(os.path.basename(f))
	template = "{season}E{episode}{ext}".format(season=season, episode=f"{idx+1:02d}",ext=ext)
	outf = os.path.join(output, template)
	print(f"copy {f} to {outf}")
	shutil.copy(f, outf)
