#!/bin/bash
# Prepare a zip file containing all files to be distributed along with the
# paper
output_file="debye_decomposition_routines.zip"

test -d temp && rm -rf temp
mkdir temp

# copy files
cp -r geccoinv dd_interfaces temp/
cp Readme_linux.txt temp/
cp Readme_windows.txt temp/

# move examples to toplevel
mv temp/dd_interfaces/Examples temp/
rm -r temp/Examples/dd_space_time/

# save the newest commit
cd temp/geccoinv
git log --oneline -n 1 > git_commit.txt
cd ../../

cd temp/dd_interfaces
git log --oneline -n 1 > git_commit.txt
cd ../../

# we don't want the .git repositories
rm -rf temp/geccoinv/.git
rm -rf temp/dd_interfaces/.git

# build documentation
cd temp/dd_interfaces/docs/doc/
make html
make latexpdf
cd ../../../../

cd temp/geccoinv/docs/doc/
make html
cd ../../../../

# move documentation directories to the top-level
cd temp
# cp -r geccoinv/docs/doc/_build/html doc_geccoinv
cp -r dd_interfaces/docs/doc/_build/html doc_dd_interfaces
cp -r dd_interfaces/docs/doc/_build/latex/DebyeDecomposition.pdf DD-Tools_Manual.pdf
cd ..

# move global setup.py file
cp setup.py temp/

# move registry fix for windows
cp fix_registry_windows.py temp/

# if present, add the msi installer
if [ -d msi_installer ]; then
	echo "Checking for MSI installer"
	msi_files=(`ls -1 msi_installer/*.msi`)
	echo ${msi_files[@]}
	if [ ${#msi_files[@]} -gt 0 ]
	then
		echo "copying ${msi_files[-1]}"
		cp "${msi_files[-1]}" temp/
	fi
fi

# create zip file
cd temp
zip -r debye_decomposition_tools.zip *
mv *.zip ..
cd ..
# rm -rf temp
