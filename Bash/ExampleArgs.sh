#!/bin/bash


echo "Argument Parsing Example"
echo "Program name: $0"

if [ "$1" == "yes" ] || [ "$1" == "YES" ];
then
    echo "Argument #1: $1"
else
    echo "No Argument #1"
fi
