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

counter=10
declare -A TripletDict
HHHcount=0
HHTcount=0
HTHcount=0
HTTcount=0
THHcount=0
THTcount=0
TTHcount=0
TTTcount=0

while ((counter>0))
do
        toss1=$((RANDOM%2))
        toss2=$((RANDOM%2))
	toss3=$((RANDOM%2))
        if (( ((toss==0)) && ((toss2==0)) && ((toss3==0)) ))
        then
                ((HHHcount++))
        elif (( ((toss==0)) && ((toss2==0)) && ((toss3==1)) ))
        then
                ((HHTcount++))
        elif (( ((toss==0)) && ((toss2==1)) && ((toss3==0)) ))
        then
                ((HTHcount++))
        elif (( ((toss==0)) && ((toss2==1)) && ((toss3==1)) ))
	then
                ((HTTcount++))
	elif (( ((toss==1)) && ((toss2==0)) && ((toss3==0)) ))
        then
                ((THHcount++))
        elif (( ((toss==1)) && ((toss2==0)) && ((toss3==1)) ))
        then
                ((THTcount++))
        elif (( ((toss==1)) && ((toss2==1)) && ((toss3==0)) ))
        then
                ((TTHcount++))
	else
                ((TTTcount++))
        fi
        ((counter--))
done

TripletDict[HHH]=$HHHcount
TripletDict[HHT]=$HHTcount
TripletDict[HTH]=$HTHcount
TripletDict[HTT]=$HTTcount
TripletDict[THH]=$THHcount
TripletDict[THT]=$THTcount
TripletDict[TTH]=$TTHcount
TripletDict[TTT]=$TTTcount
echo ${!TripletDict[@]}
echo ${TripletDict[@]}
echo "HHH combination percentage is:" `awk "BEGIN {print $HHHcount/(($HHHcount+$HHTcount+$HTHcount+$HTTcount+$THHcount+$THTcount+$TTHcount+$TTTcount))*100}"`
echo "HHT combination percentage is:" `awk "BEGIN {print $HHTcount/(($HHHcount+$HHTcount+$HTHcount+$HTTcount+$THHcount+$THTcount+$TTHcount+$TTTcount))*100}"`
echo "HTH combination percentage is:" `awk "BEGIN {print $HTHcount/(($HHHcount+$HHTcount+$HTHcount+$HTTcount+$THHcount+$THTcount+$TTHcount+$TTTcount))*100}"`
echo "HTT combination percentage is:" `awk "BEGIN {print $HTTcount/(($HHHcount+$HHTcount+$HTHcount+$HTTcount+$THHcount+$THTcount+$TTHcount+$TTTcount))*100}"`
echo "THH combination percentage is:" `awk "BEGIN {print $THHcount/(($HHHcount+$HHTcount+$HTHcount+$HTTcount+$THHcount+$THTcount+$TTHcount+$TTTcount))*100}"`
echo "THT combination percentage is:" `awk "BEGIN {print $THTcount/(($HHHcount+$HHTcount+$HTHcount+$HTTcount+$THHcount+$THTcount+$TTHcount+$TTTcount))*100}"`
echo "TTH combination percentage is:" `awk "BEGIN {print $TTHcount/(($HHHcount+$HHTcount+$HTHcount+$HTTcount+$THHcount+$THTcount+$TTHcount+$TTTcount))*100}"`
echo "TTT combination percentage is:" `awk "BEGIN {print $TTTcount/(($HHHcount+$HHTcount+$HTHcount+$HTTcount+$THHcount+$THTcount+$TTHcount+$TTTcount))*100}"`
