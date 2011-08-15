#!/usr/bin/env python

#
# The minifier should be run from the iBoost/iBoost directory.
#

import sys
import glob
import re
import os

def main():
	if len(sys.argv) < 2 or sys.argv[1] not in ('all', 'core'):
		print "USAGE: {0} all|core".format(sys.argv[0]);
		sys.exit(1)
	
	inclusion = sys.argv[1]

	if inclusion == 'all':
		include_filename = "iBoost.h"
		code_filename = "iBoost.m"
		
		header_files = glob.glob('*.h') + glob.glob('*/*.h') + glob.glob('*/*/*.h') + glob.glob('*/*/*/*.h')
		source_files = glob.glob('*.m') + glob.glob('*/*.m') + glob.glob('*/*/*.m') + glob.glob('*/*/*/*.m')
	elif inclusion == 'core':
		include_filename = "iBoostCore.h"
		code_filename = "iBoostCore.m"

		header_files = glob.glob('Core/*.h') + glob.glob('Core/*/*.h') + glob.glob('Core Data/*.h') + glob.glob('Message Center/*.h') + glob.glob('Message Center/*/*.h')
		source_files = glob.glob('Core/*.m') + glob.glob('Core/*/*.m') + glob.glob('Core Data/*.m') + glob.glob('Message Center/*.m') + glob.glob('Message Center/*/*.m')

	class_header_files = []
	other_header_files = []	

	for header in header_files:
		is_class = False
		
		for line in open(header):
			if re.compile(r"^@interface").match(line):
				is_class = True
				break

		if is_class:
			class_header_files.append(header)
		else:
			other_header_files.append(header)

	iboost_header_file = open(os.path.expanduser('~') + "/Desktop/" + include_filename, "w")
	iboost_source_file = open(os.path.expanduser('~') + "/Desktop/" + code_filename, "w")
	
	iboost_header_file.write("//\n//  iBoost\n//\n//  iBoost - The iOS Booster!\n//\n//  Licensed under the Apache License, Version 2.0 (the \"License\");\n//  you may not use this file except in compliance with the License.\n//  You may obtain a copy of the License at\n//\n//     http://www.apache.org/licenses/LICENSE-2.0\n//\n//  Unless required by applicable law or agreed to in writing, software\n//  distributed under the License is distributed on an \"AS IS\" BASIS,\n//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n//  See the License for the specific language governing permissions and\n//  limitations under the License.\n//\n\n")
	iboost_source_file.write("//\n//  iBoost\n//\n//  iBoost - The iOS Booster!\n//\n//  Licensed under the Apache License, Version 2.0 (the \"License\");\n//  you may not use this file except in compliance with the License.\n//  You may obtain a copy of the License at\n//\n//     http://www.apache.org/licenses/LICENSE-2.0\n//\n//  Unless required by applicable law or agreed to in writing, software\n//  distributed under the License is distributed on an \"AS IS\" BASIS,\n//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n//  See the License for the specific language governing permissions and\n//  limitations under the License.\n//\n\n")
	
	iboost_source_file.write("#import \"" + include_filename + "\"\n")
	
	# necessary includes
	iboost_header_file.write("@class CoreDataStore;\n\n")

	for header in (other_header_files + class_header_files):
		lines = open(header).readlines()

		clean_opening_headers(lines)
		lines = clean_local_imports(lines)
		add_newline_at_top(lines)

		iboost_header_file.write("".join(lines))

	for source in source_files:
		lines = open(source).readlines()

		clean_opening_headers(lines)
		lines = clean_local_imports(lines)
		add_newline_at_top(lines)

		iboost_source_file.write("".join(lines))
		
def	clean_opening_headers(lines):
	if len(lines) > 0:
		while re.compile(r"^//").match(lines[0]) or re.compile(r"^\s*$").match(lines[0]):
			lines[0:1] = []

def	clean_local_imports(lines):
	return [ line for line in lines if re.compile(r'^#import "').match(line) == None ]

def add_newline_at_top(lines):		
	lines[:0] = [""]

main()