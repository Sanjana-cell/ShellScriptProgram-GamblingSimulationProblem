#!/bin/bash 

STAKE=100
MAXIMUM_DAYS=30
PERCENTAGE_STAKE=$((($STAKE*50)/100)) 
MAXIMUM_AMOUNT=$(($STAKE+$PERCENTAGE_STAKE))
MINIMUM_AMOUNT=$(($STAKE-$PERCENTAGE_STAKE))
BET_AMOUNT=1

random=0
day=0
totalAmountWon=0
totalAmountLost=0
numOfDaysWon=0
numOfDaysLost=0

echo "WELCOME TO GAMBLER GAME"

#loops till maximum days
for (( day=0; day<=MAXIMUM_DAYS; day++))
do 
	stakeAmount=$STAKE
	#Loops until stake amount is reached minimum amount or maximum amount
	while [ $stakeAmount -gt $MINIMUM_AMOUNT -a $stakeAmount -lt $MAXIMUM_AMOUNT ]
	do
		random=$(($RANDOM%2))
		if [ $random -eq 1 ]
		then
			#if random is 1 stake amount is incremented by 1
			stakeAmount=$(($stakeAmount+$BET_AMOUNT))
		else
			#if random is 0 stake amount is decremented by 1
			stakeAmount=$(($stakeAmount-$BET_AMOUNT))  
		fi
	done

	if [ $stakeAmount -eq $MAXIMUM_AMOUNT ]
	then
		((numOfDaysWon++))
	else
		((numOfDaysLost++))
	fi

	#calculates total amount won or lost after 21 days
	if [ $day -gt 20 ]
	then
		totalAmountWon=$(($numOfDaysWon*$PERCENTAGE_STAKE)) 
		echo "Total amount won after "  $day "day" $totalAmountWon

		totalAmountLost=$(($numOfDaysLost*$PERCENTAGE_STAKE))  
		echo "Total amount Lost after " $day "day" $totalAmountLost 
	fi 
done

