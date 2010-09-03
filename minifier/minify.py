#!/usr/bin/env python3.1

import glob
import re
import os

def main():
	header_files = glob.glob('*.h')
	class_header_files = []
	other_header_files = []
	
	source_files = glob.glob('*.m')

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

	iboost_header_file = open(os.path.expanduser('~') + "/Desktop/iBoost.h", "w")
	iboost_source_file = open(os.path.expanduser('~') + "/Desktop/iBoost.m", "w")
	
	iboost_header_file.write("//\n//  iBoost\n//\n//  iBoost - The iOS Booster!\n//\n//  Licensed under the Apache License, Version 2.0 (the \"License\");\n//  you may not use this file except in compliance with the License.\n//  You may obtain a copy of the License at\n//\n//     http://www.apache.org/licenses/LICENSE-2.0\n//\n//  Unless required by applicable law or agreed to in writing, software\n//  distributed under the License is distributed on an \"AS IS\" BASIS,\n//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n//  See the License for the specific language governing permissions and\n//  limitations under the License.\n//\n\n")
	iboost_source_file.write("//\n//  iBoost\n//\n//  iBoost - The iOS Booster!\n//\n//  Licensed under the Apache License, Version 2.0 (the \"License\");\n//  you may not use this file except in compliance with the License.\n//  You may obtain a copy of the License at\n//\n//     http://www.apache.org/licenses/LICENSE-2.0\n//\n//  Unless required by applicable law or agreed to in writing, software\n//  distributed under the License is distributed on an \"AS IS\" BASIS,\n//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n//  See the License for the specific language governing permissions and\n//  limitations under the License.\n//\n\n")
	
	iboost_source_file.write("#import \"iBoost.h\"\n")
	
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