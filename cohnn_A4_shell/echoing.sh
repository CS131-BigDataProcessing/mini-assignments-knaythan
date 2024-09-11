#!/bin/bash

# Activity 1
DATE=$(date)
LOGGED=$(who)
USER=$(whoami)
HOME=$(HOME)

echo -e "The time and data are:\n$DATE"
echo -e "Let's see who is logged into the system:\n$LOGGED"
echo "For $USER, the home directory is $HOME"

# Activity 2
NAME=$1
AMT=$2
echo -e "My name is $NAME and I have \$$AMT in my wallet."

# Activity 3
mathvar1=$[1+5]
mathvar2=$[$mathvar1*20]
mathvar3=10
mathvar4=$[$mathvar1*($mathvar2+$mathvar3)]
echo -e "Variable 1 is $mathvar1.\nVariable 2 is $mathvar2.\nUsing $mathvar3 for Variable 3, our final Variable 4 is $mathvar4."

# Activity 4
floating=$(echo "scale=3; 4.5/1.7" | bc)

echo "Our floating variable is $floating."
