#!/bin/bash

# everything in shall is considerd as string

NUMBER1=100
NUMBER2=200

sum=$(($NUMBER1+$NUMBER2))

echo "SUM is: ${sum}"

# arrays 

LEARDES=("MODI" "PUTIN" "TRUMP")
echo "All leardes is: ${LEARDES[@]}"   
echo "fIRST leardes is: ${LEARDES[0]}"   
echo "Second leardes is: ${LEARDES[1]}"   