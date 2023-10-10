#!/bin/bash
#
# Creates a list of squares, using a square from the list you can fill the specified field without remainder.
#

if (( $# == 0 ))
    then
        :
elif (( $# == 2 ))
    then
    if ! [[ $1 =~ ^[0-9]+$ ]]
    then
        echo "ERROR: first parameter must be a positive integer."
        exit 1
    fi

    if ! [[ $2 =~ ^[0-9]+$ ]]
    then
        echo "ERROR: second parameter must be a positive integer."
        exit 1
    fi
else 
    echo "Two arguments required!"
    exit 1
fi

listr() {
    width=${1:-"3840"};
    height=${2:-"2160"};
    if grep -Ewq "[0-9]{1,5}" <<<"${width}" && grep -Ewq "[0-9]{1,5}" <<<"${height}"; then
        comm -12 <(for var in $(seq 1 $width); do
        if (((width%var)==0)); then echo $var; fi; done|sort) <(for var in $(seq 1 $height); do
            if (((height%var)==0)); then echo $var; fi; done|sort)|sort -n;
    fi
}

listr $1 $2
