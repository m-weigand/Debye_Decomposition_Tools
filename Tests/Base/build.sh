#!/bin/bash
# use debootstrap to create the base image
# run as root

if [ $USER != "root" ]; then
    echo "Must run as root"
    exit
fi

odir=jessie_base
debootstrap jessie ${odir}

cd ${odir} && tar cf ../jessie.tar .
cd ..

docker import -  mweigand/jessie-base < jessie.tar

rm jessie.tar
rm -r ${odir}
