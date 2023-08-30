#!/bin/bash


while :
do
    for ((i=$1; i>0; i--))
    do
       sleep 1 
       echo "$i "
    done
    echo "timer is up"
    exit
done
