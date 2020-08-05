#!/bin/bash -x

echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"

toss=$((RANDOM%2))
if ((toss==1))
then
        echo "Head"
else
        echo "Tail"
fi
