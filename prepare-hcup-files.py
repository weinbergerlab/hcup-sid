# You do not need this if you already have the HCUP data files (in .asc format)
# And you almost certainly want to get those files rather than messing around with this code

# Prepare HCUP data files for SAS
# 
# * Decompress zip files
# * Remove pasword protection
# * Organize files by state

# You're going to need the passwords CSV file, which you can get from Ben Artin (or by making your own in the format 'state,year,password', one per line — for example 'CA,2015,SomePassword')

from os.path import dirname, join
from os import walk
from subprocess import check_output, CalledProcessError
import re
from argparse import ArgumentParser
from csv import reader

script_dir = dirname(__file__)

parser = ArgumentParser()
parser.add_argument("state", nargs="+")
args = parser.parse_args()

states = [state.lower() for state in args.state]

passwords = {}
for state, year, password in reader(open(join(script_dir, "passwords.csv"))):
	passwords.setdefault(state, {})[year] = password

for dirpath, dirnames, filenames in walk(join(script_dir, "../HCUPOriginals")):
	for f in filenames:
		m = re.match(r"^(..)_SIDC_(....)_(.*)\.exe", f)
		if m:
			state, year, kind = m.groups()
			if state.lower() in states:
				outdir = join(script_dir, state)
				password = passwords.get(state, {}).get(year, "")

				try:
					if password:
						print(f"    { f }: saving (password='{ password }')")
					else:
						print(f"    { f }: saving (no password)")
					output = check_output(["7z", "e", "-aoa", "-bb0", "-bd", f"-p{ password }", join(dirpath, f), f"-o{outdir}"])
				except CalledProcessError as err:
					print(f"**** { f }: error")
					# raise SystemExit(1)
