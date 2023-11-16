#!/bin/bash

YEAR_START=$1
YEAR_END=$2
SUBJECT=$3
STORAGE_PATH=$4

if [ $# -ne 4 ] 
then
	echo "Wrong number of arguments"
else
	CHECK=$(find $STORAGE_PATH -maxdepth 1 -name "$SUBJECT")
	if [ ${#CHECK} -eq 0 ]
	then
		echo "Wrong subject number"
	elif [ \( $YEAR_START -lt 0 \) ] || [ \( $YEAR_END -lt 0 \) ]
	then
		echo "Year can't be negative"
	elif [ $YEAR_START -gt $YEAR_END ]
	then
		echo "The left value of the year is greater than the right one"
	else
		FILES=$(find $STORAGE_PATH/$SUBJECT -name "TEST-[0-9]")

		for ((gr_year=$YEAR_START; gr_year<=$YEAR_END; gr_year++))
		do
			MAX_ANS=$(grep "[a-zA-Z];$gr_year;" $FILES | awk -F";" '{print $4}' | sort -n | tail -n 1)
			if [ ${#MAX_ANS} -ne 0 ]
			then
				echo "In $gr_year students with maximum result ($MAX_ANS correct answers):"
				echo $(grep "[a-zA-Z];$gr_year;$MAX_ANS" $FILES | awk -F";" '{print $2}')
			else
				echo "No tests in $gr_year"
			fi
		done
	fi
fi