#!/bin/bash

# we publish specific commits of the repositories
# TODO: Replace with github URLs
# https://github.com/m-weigand/GeccoInv

test -d geccoinv && rm -rf geccoinv
# git clone git@github.com:m-weigand/geccoinv.git
git clone ssh://git@ssh.geo.uni-bonn.de:4422/mweigand/geccoinv.git
cd geccoinv
# commit='f1a83f0e51a4c7c63a31a21f242bec8502bd27cd'
# git reset --hard ${commit}
rm -fr .git
cd ..

test -d dd_interfaces && rm -rf dd_interfaces
# git clone git@github.com:m-weigand/dd_interfaces.git
git clone ssh://git@ssh.geo.uni-bonn.de:4422/mweigand/dd_interfaces.git
cd dd_interfaces
# commit='b278a19b09f79374aca7dd90e0eb63392ee901d3'
# git reset --hard ${commit}
rm -fr .git
# remove tests
rm -rf src/dd_single/tests
rm -rf src/dd_single/characterisation
rm -rf src/dd_time/Tests
rm -rf src/ddps/tests
rm -rf src/ddpds/tests
rm -rf src/dd_test/tests
rm -rf WebApps/
rm -rf playground
cd ..

