#!/bin/sh

echo "Running fpp-HomeAssistant-zack PreStart Script"

BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..
make
