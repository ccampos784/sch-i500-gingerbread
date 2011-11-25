#!/bin/bash

######################################
##           PWGB Kernel            ##
##      Based off EH09 source       ##
##          By ccampos784           ##
######################################

## CLEANING SCRIPT ##

#Set the working directory
export CURRENTDIR=`pwd`

#Remove BIN and OUT directories
cd $CURRENTDIR
rm -r bin
rm -r out

#Switch to the kernel directory and clean up
cd $CURRENTDIR/src/kernel
make clean mrproper

#Switch back to the working directory
cd ../..

#EXIT
exit
