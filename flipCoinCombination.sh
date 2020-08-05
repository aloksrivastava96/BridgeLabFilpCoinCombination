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

counter=10
declare -A DoubletDict
HHcount=0
HTcount=0
THcount=0
TTcount=0
while ((counter>0))
do
        toss1=$((RANDOM%2))
	toss2=$((RANDOM%2))
        if (( ((toss==1)) && ((toss2==1)) ))
        then
                ((HHcount++))
        elif (( ((toss==1)) && ((toss2==0)) ))
	then
                ((HTcount++))
	elif (( ((toss==0)) && ((toss2==1)) ))
	then
		((THcount++))
	else
		((TTcount++))
        fi
        ((counter--))
done
DoubletDict[HH]=$HHcount
DoubletDict[HT]=$HTcount
DoubletDict[TH]=$THcount
DoubletDict[TT]=$TTcount
echo ${!DoubletDict[@]}
echo ${DoubletDict[@]}
echo "HH combination percentage is:" `awk "BEGIN {print $HHcount/(($HHcount+$HTcount+$THcount+$TTcount))*100}"`
echo "HT combination percentage is:" `awk "BEGIN {print $HTcount/(($HHcount+$HTcount+$THcount+$TTcount))*100}"`
echo "TH combination percentage is:" `awk "BEGIN {print $THcount/(($HHcount+$HTcount+$THcount+$TTcount))*100}"`
echo "TT combination percentage is:" `awk "BEGIN {print $TTcount/(($HHcount+$HTcount+$THcount+$TTcount))*100}"`
