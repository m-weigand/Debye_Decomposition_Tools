#!/bin/bash

# we publish specific commits of the repositories
# TODO: Replace with github URLs
# https://github.com/m-weigand/GeccoInv

test -d GeccoInv && rm -rf GeccoInv
git clone git@github.com:m-weigand/GeccoInv.git
cd GeccoInv
commit='f1a83f0e51a4c7c63a31a21f242bec8502bd27cd'
# git reset --hard ${commit}
rm -fr .git
cd ..

test -d DD_Interfaces && rm -rf DD_Interfaces
git clone git@github.com:m-weigand/DD_Interfaces.git
cd DD_Interfaces
commit='b278a19b09f79374aca7dd90e0eb63392ee901d3'
# git reset --hard ${commit}
rm -fr .git
cd ..

