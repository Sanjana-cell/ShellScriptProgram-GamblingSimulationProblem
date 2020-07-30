#!/bin/bash -x

#constants
STAKE=100

#variables
no_of_bets=0
random=0

((no_of_bets++))
echo "WELCOME TO GAMBLER GAME"
random=$(($RANDOM%2))
if [ $random -eq 1 ]
then
	echo "GAME WON BY GAMBLER"
else
	echo "GAME LOST BY GAMBLER"
fi
echo "Bet Amount = " $no_of_bets
