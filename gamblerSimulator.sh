#!/bin/bash -x

#constants
STAKE=100

#variables
no_of_bets=1
random=0
total_amount_won=0
total_amount_lost=0

echo "WELCOME TO GAMBLER GAME"

#Loops until total_amount_won and total_amount_lost is less then 50% of stake
while [ $total_amount_won -lt $(($STAKE-50)) -a $total_amount_lost -lt $(($STAKE-50)) ]
do
	random=$(($RANDOM%2))
	if [ $random -eq 1 ]
	then
		total_amount_won=$(($total_amount_won+$no_of_bets))
		echo "GAME WON BY GAMBLER"
	else
		total_amount_lost=$(($total_amount_lost+$no_of_bets))
		echo "GAME LOST BY GAMBLER"
	fi
done
echo "Total amount won by gambler" $total_amount_won
echo "Total amount lost by gambler" $total_amount_lost
