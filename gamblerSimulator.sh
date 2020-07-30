#!/bin/bash -x

#constants
STAKE=100

#variables
betAmount=1
random=0
stake_amount=$STAKE

echo "WELCOME TO GAMBLER GAME"

#Loops until stake amount less then 50% of stake
while [ $stake_amount -gt 50 -a $stake_amount -lt 150 ]
do
	random=$(($RANDOM%2))
	if [ $random -eq 1 ]
	then
		#if random is 1 stake amount is incremented by bet amount
		stake_amount=$(($stake_amount+$betAmount))
		echo "GAME WON BY GAMBLER"
	else
		#if random is 0 stake amount is decremented by bet amount  
		stake_amount=$(($stake_amount-$betAmount))
		echo "GAME LOST BY GAMBLER"
	fi
done
echo "Stake amount" $stake_amount
