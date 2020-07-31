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
noOfWins=0
noOfLoss=0
echo "WELCOME TO GAMBLER GAME"
function  gambler(){
#loops till maximum days
for (( day=1; day<=MAXIMUM_DAYS; day++))
do 
	stakeAmount=$STAKE
	noOfWins=0
	noOfLoss=0
	#Loops until stake amount is reached minimum amount or maximum amount
	while [ $stakeAmount -gt $MINIMUM_AMOUNT -a $stakeAmount -lt $MAXIMUM_AMOUNT ]
	do
		random=$(($RANDOM%2))
		if [ $random -eq 1 ]
		then
			#if random is 1 stake amount is incremented by 1
			stakeAmount=$(($stakeAmount+$BET_AMOUNT))
			((noOfWins++))
		else
			#if random is 0 stake amount is decremented by 1
			stakeAmount=$(($stakeAmount-$BET_AMOUNT))
			((noOfLoss++))  
		fi
	done

	winArray[$day]=$noOfWins
	lossArray[$day]=$noOfLoss

	if [ $stakeAmount -eq $MAXIMUM_AMOUNT ]
	then
		((numOfDaysWon++))
	else
		((numOfDaysLost++))
	fi
done
}

function totalAmountCalculation() {
	if [ $numOfDaysWon -gt $numOfDaysLost ]
	then
		totalAmountWon=$(($numOfDaysWon*$PERCENTAGE_STAKE)) 
		echo "Total amount won " $totalAmountWon
	else
		totalAmountLost=$(($numOfDaysLost*$PERCENTAGE_STAKE))  
		echo "Total amount Lost " $totalAmountLost 
	fi
}
function calulatesLuckyAndUnluckyDay() {
	echo  ${winArray[@]}
	echo  ${lossArray[@]}
	luckyDayAmount=${winArray[1]}
	for (( i=1; i<${#winArray[@]}; i++ ))
	do
		if [ ${winArray[i]} -gt  $luckyDayAmount ]
		then
			luckyDayAmount=${winArray[i]}
			luckyDay=$i
		fi
	done

	echo "Lucky Day ="$luckyDay "with amount" $luckyDayAmount

	unluckyDayAmount=${lossArray[1]}
	for (( i=1; i<${#lossArray[@]}; i++ ))
	do
		if [ ${lossArray[i]} -gt  $unluckyDayAmount ]
		then
			unluckyDayAmount=${lossArray[i]}
			unluckyDay=$i
	fi
	done
	echo "unlucky Day ="$unluckyDay "with amount" $unluckyDayAmount
}
function playAgain(){
	if [ $numOfDaysWon -gt $numOfDaysLost ]
	then
		echo "Your eligible to play next month"
		read -p "Enter y if you want to play again otherwise enter n" choice
		if [ $choice == "y" ]
		then
			gambler
			totalAmountCalculation
			calulatesLuckyAndUnluckyDay
		else
			echo "OK BYE"
		fi
	else
		echo "Your not eligible to play next month"
	fi
}
gambler
echo "Gambler won "  $numOfDaysWon "days" 
echo "Gambler Lost "  $numOfDaysLost "days"
totalAmountCalculation
calulatesLuckyAndUnluckyDay
playAgain
