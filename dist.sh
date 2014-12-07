#!/bin/bash
# Prepare a zip file containing all files to be distributed along with the
# paper
output_file="debye_decomposition_routines.zip"

test -d temp && rm -rf temp
mkdir temp

# copy files
cp -r geccoinv dd_interfaces temp/
cp Readme.txt temp

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
cd ../../../../

cd temp/geccoinv/docs/doc/
make html
cd ../../../../

cd temp
zip -r debye_decomposition_tools.zip *
mv *.zip ..
cd ..
rm -rf temp
