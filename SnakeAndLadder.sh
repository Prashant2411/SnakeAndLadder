#!/bin/bash -x

echo "Welcome to Snake and Ladder."

position=0
diceNumber=0

function getResult () {
	nextMove=$(( RANDOM % 3 ))
	case $nextMove in
		2 )
			position=$(( $position - $diceNumber ));;
		1 )
			position=$(( $position + $diceNumber ));;
		0 )
			;;
	esac
}

function main () {
	while (( $position >= 0 && $position <100 ))
	do
		diceNumber=$(( RANDOM % 6 + 1 ))
		getResult $diceNumber
		isOnBoard
	done
}

main
