#!/bin/bash

######################################
##           PWGB Kernel            ##
##      Based off EH09 source       ##
##          By ccampos784           ##
######################################

## CLEANING SCRIPT ##

#Set the working directory
export CURRENTDIR=`pwd`

#Remove BIN and OUT directories, if they exist.
cd $CURRENTDIR
if [ -d "bin" ]; then
    rm -r bin
fi
if [ -d "out" ]; then
    rm -r out
fi

#Switch to the kernel directory and clean up
cd $CURRENTDIR/src/kernel
make clean mrproper

#Switch back to the working directory
cd $CURRENTDIR

#EXIT
exit
