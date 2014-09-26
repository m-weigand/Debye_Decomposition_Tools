#!/bin/bash

# todo: add user id?
# todo: map /work
cd ../../../
test -e ddt.tar && rm -r ddt.tar
tar cvf ddt.tar Debye_Decomposition_Tools/
mv ddt.tar Debye_Decomposition_Tools/Tests/Stage1/
cd Debye_Decomposition_Tools/Tests/Stage1/
test -d temp && rm -rf temp
mkdir temp
cp ddt.tar temp/
cp test_script.sh temp/

sudo docker run --rm=true -i -t -v $PWD/temp:/work mweigand/dd_test_stage1 /work/test_script.sh

# cleanup
rm -rf temp
rm ddt.tar
