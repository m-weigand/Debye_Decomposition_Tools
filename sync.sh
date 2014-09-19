#!/bin/bash

# we publish specific commits of the repositories
# TODO: Replace with github URLs
# https://github.com/m-weigand/GeccoInv

git clone git@github.com:m-weigand/GeccoInv.git
cd GeccoInv
git reset --hard 3ce3a1efeede74d98026ae8953201c6c7b1972cd
rm -fr .git
cd ..


git clone git@github.com:m-weigand/DD_Interfaces.git
cd DD_Interfaces
git reset --hard 3ce3a1efeede74d98026ae8953201c6c7b1972cd
rm -fr .git
cd ..

