#!/bin/bash -x

echo "Welcome to Snake and Ladder."

positionP1=0
positionP2=0
diceNumber=0
counter=1

function getResult () {
	diceNumber=$(( RANDOM % 6 + 1 ))
	nextMove=$(( RANDOM % 3 ))
	position=$1
	case $nextMove in
		2 )
			position=$(( $position - $diceNumber ));;
		1 )
			position=$(( $position + $diceNumber ));;
		0 )
			;;
	esac
	echo $position
}

function isOnBoard () {
        if [ $1 -lt 0 ]
        then
                position=0
        elif [ $1 -gt 100 ]
        then
                position=$(( $position - $diceNumber ))
	else
		position=$1
	fi
	echo $position
}

function main () {
	while true
	do
		positionP1=$( getResult $positionP1 )
		positionP1=$( isOnBoard $positionP1 )
		echo "Player 1 : Dice $counter : $positionP1"
		if [ $positionP1 -eq 100 ]
		then
			echo "Player 1 won"
			break
		fi

		positionP2=$( getResult $positionP2 )
		positionP2=$( isOnBoard $positionP2 )
		echo "Player 2 : Dice $counter : $positionP2"
		if [ $positionP2 -eq 100 ]
		then
			echo "Player 2 won"
			break
		fi

		((counter++))
	done
}

main
