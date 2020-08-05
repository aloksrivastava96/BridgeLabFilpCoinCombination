#!/bin/bash -x

echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"

counter=10
declare -A SingletDict
Hcount=0
Tcount=0
while ((counter>0))
do
	toss=$((RANDOM%2))
	if ((toss==1))
	then
	        ((Hcount++))
	else
	        ((Tcount++))
	fi
	((counter--))
done
SingletDict[H]=$Hcount
SingletDict[T]=$Tcount
echo ${!SingletDict[@]}
echo ${SingletDict[@]}
echo "H combination percentage is:" `awk "BEGIN {print $Hcount/(($Hcount+$Tcount))*100}"`
echo "T combination percentage is:" `awk "BEGIN {print $Tcount/(($Hcount+$Tcount))*100}"`

