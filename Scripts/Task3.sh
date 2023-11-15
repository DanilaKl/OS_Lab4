#!/bin/bash

YEAR_START=$1
YEAR_END=$2
SUBJECT=$3
STORAGE_PATH=$4

CHECK=$(find $STORAGE_PATH -maxdepth 1 -name "$SUBJECT")
if [ \( $YEAR_START -gt 0 \) -a \( $YEAR_START -le $YEAR_END \) -a \( ${#CHECK} -ne 0 \) ]
then
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
else
	echo "Not valid arguments"
fi