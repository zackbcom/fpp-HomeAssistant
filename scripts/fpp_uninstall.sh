#!/bin/bash

# fpp-HomeAssistant-zack uninstall script
echo "Running fpp-HomeAssistant-zack uninstall Script"

BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..
make clean

