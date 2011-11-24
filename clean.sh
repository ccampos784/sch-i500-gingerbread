#!/bin/bash

export CURRENTDIR=`pwd`
cd $CURRENTDIR/src/kernel
make clean mrproper
cd ../..
exit
